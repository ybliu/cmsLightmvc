package light.mvc.model.city;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import light.mvc.model.base.IdEntity;

@Entity
@Table(name="city_district")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tdistrict extends IdEntity {
	
	
	private String districtname;
	
	private Tcity city;

	public String getDistrictname() {
		return districtname;
	}

	public void setDistrictname(String districtname) {
		this.districtname = districtname;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CityID")
	public Tcity getCity() {
		return city;
	}

	
	public void setCity(Tcity city) {
		this.city = city;
	}
	

}
