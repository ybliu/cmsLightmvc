package light.mvc.model.city;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import light.mvc.model.base.IdEntity;
import light.mvc.model.sys.Torganization;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "city_city")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tcity extends IdEntity implements java.io.Serializable {
 
	
	private String cityName;//城市名字
	private String zipcode;//区号
	
	private Tprivience privience;//多对一
	private Set<Tdistrict> districts = new HashSet<Tdistrict>(0);

	public Tcity() {
		super();
	}

	

	public Tcity(String cityName, String zipcode) {
		super();
		this.cityName = cityName;
		this.zipcode = zipcode;
	}




	/*
	 多对多
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "sys_user_role", joinColumns = { @JoinColumn(name = "user_id", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "role_id", nullable = false, updatable = false) })
	public Set<Trole> getRoles() {
		return roles;
	}

	public void setRoles(Set<Trole> roles) {
		this.roles = roles;
	}*/

	 
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ProvienceID")
	public Tprivience getPrivience() {
		return privience;
	}

	public void setPrivience(Tprivience privience) {
		this.privience = privience;
	}
	
	//mappedBy标签一定是定义在the owned side(被拥有方的)，他指向the owning side(拥有方)；
	@OneToMany(fetch = FetchType.LAZY)
	public Set<Tdistrict> getDistricts() {
		return districts;
	}
	
	public void setDistricts(Set<Tdistrict>  districts ) {
		this.districts=districts;
	}



	public String getCityName() {
		return cityName;
	}



	public void setCityName(String cityName) {
		this.cityName = cityName;
	}



	public String getZipcode() {
		return zipcode;
	}



	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	

}