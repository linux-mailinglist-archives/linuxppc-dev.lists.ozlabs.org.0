Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5D2EFEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 07:32:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tVXC5BNhzDqNt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:32:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tVVZ2wFzzDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 15:30:44 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U5RJ09081670
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:30:42 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s6fjw9d5a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:30:41 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 30 Apr 2019 06:30:40 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 06:30:38 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U5Ubf659899958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 05:30:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DE71A4065;
 Tue, 30 Apr 2019 05:30:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C8D0A405F;
 Tue, 30 Apr 2019 05:30:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 05:30:36 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 654A7A01D2;
 Tue, 30 Apr 2019 15:30:34 +1000 (AEST)
Date: Tue, 30 Apr 2019 15:30:33 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 3/8] powerpc/eeh: Convert PNV_PHB_FLAG_EEH to global flag
References: <cover.1553050609.git.sbobroff@linux.ibm.com>
 <17f0dc9c30a139f19dceefd09689d34c3ad01a17.1553050609.git.sbobroff@linux.ibm.com>
 <1434231d4e8216e5b12382ad081e81c886c33c14.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <1434231d4e8216e5b12382ad081e81c886c33c14.camel@gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19043005-0008-0000-0000-000002E1B1BD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043005-0009-0000-0000-0000224E17F0
Message-Id: <20190430053032.GA9630@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300036
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2019 at 07:51:40PM +1000, Oliver O'Halloran wrote:
> On Wed, 2019-03-20 at 13:58 +1100, Sam Bobroff wrote:
> > The PHB flag, PNV_PHB_FLAG_EEH, is set (on PowerNV) individually on
> > each PHB once the EEH subsystem is ready. It is the only use of the
> > flags member of the phb struct.
> >=20
> > However there is no need to store this separately on each PHB, so
> > convert it to a global flag. For symmetry, the flag is now also set
> > for pSeries; although it is currently unused it may be useful in the
> > future.
>=20
> I'd drop this patch and keep it as a seperate flag. Making this a
> global flag doesn't really buy us anything either. It's also worth
> remembering that we do have virtual PHBs, like the NVLink ones, that
> don't have real EEH support and we should be doing something more
> intelligent about that.
>=20
> If you are going to remove the PNV_PHB flag then i would look at moving
> that flag into the generic pci_controller structure that we use for
> tracking PHBs since that would give us a way to toggle EEH support on a
> per PHB basis on pseries and powernv.

OK. I want to keep these changes as small as possible, so I'll try a
simpler approach and use the exsiting flag. (I only touched this area
because it's now necessary to set the EEH_ENABLED flag both at boot time
and after it.)

> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/eeh.h               | 11 +++++++++++
> >  arch/powerpc/platforms/powernv/eeh-powernv.c | 14 +++-----------
> >  arch/powerpc/platforms/powernv/pci.c         |  7 +++----
> >  arch/powerpc/platforms/powernv/pci.h         |  2 --
> >  arch/powerpc/platforms/pseries/pci.c         |  4 ++++
> >  5 files changed, 21 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/=
eeh.h
> > index 3613a56281f2..fe4cf7208890 100644
> > --- a/arch/powerpc/include/asm/eeh.h
> > +++ b/arch/powerpc/include/asm/eeh.h
> > @@ -43,6 +43,7 @@ struct pci_dn;
> >  #define EEH_VALID_PE_ZERO	0x10	/* PE#0 is valid		     */
> >  #define EEH_ENABLE_IO_FOR_LOG	0x20	/* Enable IO for log		     */
> >  #define EEH_EARLY_DUMP_LOG	0x40	/* Dump log immediately		     */
> > +#define EEH_PHB_ENABLED		0x80	/* PHB recovery uses EEH	     */
> > =20
> >  /*
> >   * Delay for PE reset, all in ms
> > @@ -245,6 +246,11 @@ static inline bool eeh_enabled(void)
> >  	return eeh_has_flag(EEH_ENABLED) && !eeh_has_flag(EEH_FORCE_DISABLED);
> >  }
> > =20
> > +static inline bool eeh_phb_enabled(void)
> > +{
> > +	return eeh_has_flag(EEH_PHB_ENABLED);
> > +}
> > +
> >  static inline void eeh_serialize_lock(unsigned long *flags)
> >  {
> >  	raw_spin_lock_irqsave(&confirm_error_lock, *flags);
> > @@ -332,6 +338,11 @@ static inline bool eeh_enabled(void)
> >          return false;
> >  }
> > =20
> > +static inline bool eeh_phb_enabled(void)
> > +{
> > +	return false;
> > +}
> > +
> >  static inline void eeh_probe_devices(void) { }
> > =20
> >  static inline void *eeh_dev_init(struct pci_dn *pdn, void *data)
> > diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerp=
c/platforms/powernv/eeh-powernv.c
> > index 6fc1a463b796..f0a95f663810 100644
> > --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> > +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > @@ -264,22 +264,14 @@ int pnv_eeh_post_init(void)
> >  		return ret;
> >  	}
> > =20
> > -	if (!eeh_enabled())
> > +	if (eeh_enabled())
> > +		eeh_add_flag(EEH_PHB_ENABLED);
> > +	else
> >  		disable_irq(eeh_event_irq);
> > =20
> >  	list_for_each_entry(hose, &hose_list, list_node) {
> >  		phb =3D hose->private_data;
> > =20
> > -		/*
> > -		 * If EEH is enabled, we're going to rely on that.
> > -		 * Otherwise, we restore to conventional mechanism
> > -		 * to clear frozen PE during PCI config access.
> > -		 */
> > -		if (eeh_enabled())
> > -			phb->flags |=3D PNV_PHB_FLAG_EEH;
> > -		else
> > -			phb->flags &=3D ~PNV_PHB_FLAG_EEH;
> > -
> >  		/* Create debugfs entries */
> >  #ifdef CONFIG_DEBUG_FS
> >  		if (phb->has_dbgfs || !phb->dbgfs)
> > diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platfo=
rms/powernv/pci.c
> > index 307181fd8a17..d2b50f3bf6b1 100644
> > --- a/arch/powerpc/platforms/powernv/pci.c
> > +++ b/arch/powerpc/platforms/powernv/pci.c
> > @@ -717,10 +717,9 @@ int pnv_pci_cfg_write(struct pci_dn *pdn,
> >  static bool pnv_pci_cfg_check(struct pci_dn *pdn)
> >  {
> >  	struct eeh_dev *edev =3D NULL;
> > -	struct pnv_phb *phb =3D pdn->phb->private_data;
> > =20
> >  	/* EEH not enabled ? */
> > -	if (!(phb->flags & PNV_PHB_FLAG_EEH))
> > +	if (!eeh_phb_enabled())
> >  		return true;
> > =20
> >  	/* PE reset or device removed ? */
> > @@ -761,7 +760,7 @@ static int pnv_pci_read_config(struct pci_bus *bus,
> > =20
> >  	ret =3D pnv_pci_cfg_read(pdn, where, size, val);
> >  	phb =3D pdn->phb->private_data;
> > -	if (phb->flags & PNV_PHB_FLAG_EEH && pdn->edev) {
> > +	if (eeh_phb_enabled() && pdn->edev) {
> >  		if (*val =3D=3D EEH_IO_ERROR_VALUE(size) &&
> >  		    eeh_dev_check_failure(pdn->edev))
> >                          return PCIBIOS_DEVICE_NOT_FOUND;
> > @@ -789,7 +788,7 @@ static int pnv_pci_write_config(struct pci_bus *bus,
> > =20
> >  	ret =3D pnv_pci_cfg_write(pdn, where, size, val);
> >  	phb =3D pdn->phb->private_data;
> > -	if (!(phb->flags & PNV_PHB_FLAG_EEH))
> > +	if (!eeh_phb_enabled())
> >  		pnv_pci_config_check_eeh(pdn);
> > =20
> >  	return ret;
> > diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platfo=
rms/powernv/pci.h
> > index 8e36da379252..eb0add61397b 100644
> > --- a/arch/powerpc/platforms/powernv/pci.h
> > +++ b/arch/powerpc/platforms/powernv/pci.h
> > @@ -85,8 +85,6 @@ struct pnv_ioda_pe {
> >  	struct list_head	list;
> >  };
> > =20
> > -#define PNV_PHB_FLAG_EEH	(1 << 0)
> > -
> >  struct pnv_phb {
> >  	struct pci_controller	*hose;
> >  	enum pnv_phb_type	type;
> > diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platfo=
rms/pseries/pci.c
> > index 37a77e57893e..7be80882c08d 100644
> > --- a/arch/powerpc/platforms/pseries/pci.c
> > +++ b/arch/powerpc/platforms/pseries/pci.c
> > @@ -244,6 +244,10 @@ void __init pSeries_final_fixup(void)
> > =20
> >  	eeh_probe_devices();
> >  	eeh_addr_cache_build();
> > +#ifdef CONFIG_EEH
> > +	if (eeh_enabled())
> > +		eeh_add_flag(EEH_PHB_ENABLED);
> > +#endif
> > =20
> >  #ifdef CONFIG_PCI_IOV
> >  	ppc_md.pcibios_sriov_enable =3D pseries_pcibios_sriov_enable;
>=20

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAlzH3XIACgkQMX8w6AQl
/iJk/ggAmvj2RnIo1AEqdAHeFKqQ4KmA7z8BuM3seoSZG8n+daQn9G4RfJ+GPwlW
sKIPJWhODTYfSchWNSsg2hMGKw2kK4qjTXkAdBjqVRzrQqkW2XjFzwBaO5Piu/7F
47GOMpU4Vnoeolb9UOcjhmM7YpLmg/P85/xOz/Xe1rw8zcYUFeIevn4CwYd2vPcR
O5rZloGsLPsZSW9B1yjHAp84vUs0xvU++pCheN7MRRg7YgdE0YgabJdIaUBrp4L0
q+1Y95vEtoBiedtrXt97dUdlr5QtnNubuK1X05QZvvSVqRRRMheb31HS0T3dd22g
qATbdjgV/f/zn0l25kZ5v2dnNFYlYw==
=i3Nf
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

