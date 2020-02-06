Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A881153DD8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 05:26:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ClkJ37HMzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 15:26:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Clfz0RlLzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 15:23:38 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0164JPe9145257
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Feb 2020 23:23:37 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xyhn50w3t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2020 23:23:36 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 6 Feb 2020 04:23:34 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Feb 2020 04:23:33 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0164NWL632964734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 04:23:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47219A405B;
 Thu,  6 Feb 2020 04:23:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1BD4A404D;
 Thu,  6 Feb 2020 04:23:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Feb 2020 04:23:31 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 780D5A00EE;
 Thu,  6 Feb 2020 15:23:27 +1100 (AEDT)
Date: Thu, 6 Feb 2020 15:23:29 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 2/6] powerpc/eeh: Remove eeh_add_device_tree_late()
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-3-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline
In-Reply-To: <20200203083521.16549-3-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20020604-0020-0000-0000-000003A76E7F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020604-0021-0000-0000-000021FF3BEF
Message-Id: <20200206042328.GE15629@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_06:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060031
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
Cc: tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 07:35:17PM +1100, Oliver O'Halloran wrote:
> On pseries and PowerNV pcibios_bus_add_device() calls eeh_add_device_late=
()
> so there's no need to do a separate tree traversal to bind the eeh_dev and
> pci_dev together setting up the PHB at boot. As a result we can remove
> eeh_add_device_tree_late().
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

=2E.. with pcibios_bus_add_device() being called from
pci_bus_add_devices(), in this case.

Looks good.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/eeh.h    |  3 ---
>  arch/powerpc/kernel/eeh.c         | 25 -------------------------
>  arch/powerpc/kernel/of_platform.c |  3 ---
>  arch/powerpc/kernel/pci-common.c  |  3 ---
>  4 files changed, 34 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/ee=
h.h
> index 5a34907..5d10781 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -304,7 +304,6 @@ void eeh_addr_cache_init(void);
>  void eeh_add_device_early(struct pci_dn *);
>  void eeh_add_device_tree_early(struct pci_dn *);
>  void eeh_add_device_late(struct pci_dev *);
> -void eeh_add_device_tree_late(struct pci_bus *);
>  void eeh_remove_device(struct pci_dev *);
>  int eeh_unfreeze_pe(struct eeh_pe *pe);
>  int eeh_pe_reset_and_recover(struct eeh_pe *pe);
> @@ -365,8 +364,6 @@ static inline void eeh_add_device_tree_early(struct p=
ci_dn *pdn) { }
> =20
>  static inline void eeh_add_device_late(struct pci_dev *dev) { }
> =20
> -static inline void eeh_add_device_tree_late(struct pci_bus *bus) { }
> -
>  static inline void eeh_remove_device(struct pci_dev *dev) { }
> =20
>  #define EEH_POSSIBLE_ERROR(val, type) (0)
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 0878912..9cb3370 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1214,31 +1214,6 @@ void eeh_add_device_late(struct pci_dev *dev)
>  }
> =20
>  /**
> - * eeh_add_device_tree_late - Perform EEH initialization for the indicat=
ed PCI bus
> - * @bus: PCI bus
> - *
> - * This routine must be used to perform EEH initialization for PCI
> - * devices which are attached to the indicated PCI bus. The PCI bus
> - * is added after system boot through hotplug or dlpar.
> - */
> -void eeh_add_device_tree_late(struct pci_bus *bus)
> -{
> -	struct pci_dev *dev;
> -
> -	if (eeh_has_flag(EEH_FORCE_DISABLED))
> -		return;
> -	list_for_each_entry(dev, &bus->devices, bus_list) {
> -		eeh_add_device_late(dev);
> -		if (dev->hdr_type =3D=3D PCI_HEADER_TYPE_BRIDGE) {
> -			struct pci_bus *subbus =3D dev->subordinate;
> -			if (subbus)
> -				eeh_add_device_tree_late(subbus);
> -		}
> -	}
> -}
> -EXPORT_SYMBOL_GPL(eeh_add_device_tree_late);
> -
> -/**
>   * eeh_remove_device - Undo EEH setup for the indicated pci device
>   * @dev: pci device to be removed
>   *
> diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_p=
latform.c
> index cb68800..64edac81 100644
> --- a/arch/powerpc/kernel/of_platform.c
> +++ b/arch/powerpc/kernel/of_platform.c
> @@ -80,9 +80,6 @@ static int of_pci_phb_probe(struct platform_device *dev)
>  	 */
>  	pcibios_claim_one_bus(phb->bus);
> =20
> -	/* Finish EEH setup */
> -	eeh_add_device_tree_late(phb->bus);
> -
>  	/* Add probed PCI devices to the device model */
>  	pci_bus_add_devices(phb->bus);
> =20
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-c=
ommon.c
> index 3d2b1cf..8983afa 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -1399,9 +1399,6 @@ void pcibios_finish_adding_to_bus(struct pci_bus *b=
us)
>  			pci_assign_unassigned_bus_resources(bus);
>  	}
> =20
> -	/* Fixup EEH */
> -	eeh_add_device_tree_late(bus);
> -
>  	/* Add new devices to global lists.  Register in proc, sysfs. */
>  	pci_bus_add_devices(bus);
>  }
> --=20
> 2.9.5
>=20

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl47lLkACgkQMX8w6AQl
/iJmhQf/ZaNUaz83zqvpZje1a+sGL8OPWvkVqQn4GEpTtwsCArsCymSSoTA4E332
UFo+Zz2wclvavic31vor+uonkOkcU58/lUcah3CwZltWpP34JYBs19TNsEVz67wo
eckxcUAjvWM6/QLbDBesTTN7STkPDPSEFr+81212YOcvgvhKmnOiDbTnCr2PCOlB
uFH7llzAwEOs4gTrKaY+3QLsk92sm9ZDDes80HiIPaZ9o/MN5SR4/nqH2bivxCM5
O0QiRGl/bayM3bQaM2Iu7B/MMJCqaVUUwV6DjsGn4pGB9ZAgbksRXmZjSKXy6GB6
m2VeAiJVjrR8W5dPsGFMmDWunTCQ4Q==
=cHjk
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--

