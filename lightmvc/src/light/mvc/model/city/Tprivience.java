package light.mvc.model.city;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import light.mvc.model.base.IdEntity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="city_provience")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tprivience extends IdEntity {

	private String provienceName;
	
	private Set<Tcity> citys=new HashSet(0);
	

	 
	
	

	public String getProvienceName() {
		return provienceName;
	}

	public void setProvienceName(String provienceName) {
		this.provienceName = provienceName;
	}

	@OneToMany(fetch = FetchType.LAZY) 
	public Set<Tcity> getCitys() {
		return citys;
	}

	public void setCitys(Set<Tcity> citys) {
		this.citys = citys;
	}
	
}
