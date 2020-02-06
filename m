Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E684B153DD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 05:15:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ClTf5tkSzDqC3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 15:15:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ClR80TYSzDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 15:13:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0164AKgj063577
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Feb 2020 23:13:20 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xyphx27ee-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2020 23:13:20 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 6 Feb 2020 04:13:18 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Feb 2020 04:13:17 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0164DGP110027016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 04:13:16 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AD9111C064;
 Thu,  6 Feb 2020 04:13:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 557EB11C052;
 Thu,  6 Feb 2020 04:13:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Feb 2020 04:13:15 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 93A18A00EE;
 Thu,  6 Feb 2020 15:13:10 +1100 (AEDT)
Date: Thu, 6 Feb 2020 15:13:12 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 1/6] powerpc/eeh: Add sysfs files in late probe
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-2-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
In-Reply-To: <20200203083521.16549-2-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20020604-0008-0000-0000-0000035027E0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020604-0009-0000-0000-00004A70BA6E
Message-Id: <20200206041311.GD15629@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_06:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060029
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


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 07:35:16PM +1100, Oliver O'Halloran wrote:
> Move creating the EEH specific sysfs files into eeh_add_device_late()
> rather than being open-coded all over the place. Calling the function is
> generally done immediately after calling eeh_add_device_late() anyway. The
> two cases where it's not done there (OF based PCI probing and the pseries
> VFs) don't seem to have any issues with the re-ordering.

I haven't tested it explicitly, but I suspect the re-ordering will
actually improve things: in some error cases it will no longer add sysfs
files for devices that have failed to init, because bailing out in
eeh_add_device_late() (or eeh_probve_device()) will now prevent
eeh_sysfs_add_device() from being called.

Nice cleanup.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/include/asm/eeh.h               |  3 ---
>  arch/powerpc/kernel/eeh.c                    | 24 +---------------------=
--
>  arch/powerpc/kernel/of_platform.c            |  3 ---
>  arch/powerpc/kernel/pci-common.c             |  3 ---
>  arch/powerpc/platforms/powernv/eeh-powernv.c |  1 -
>  arch/powerpc/platforms/pseries/eeh_pseries.c |  3 +--
>  6 files changed, 2 insertions(+), 35 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/ee=
h.h
> index 6f9b2a1..5a34907 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -305,7 +305,6 @@ void eeh_add_device_early(struct pci_dn *);
>  void eeh_add_device_tree_early(struct pci_dn *);
>  void eeh_add_device_late(struct pci_dev *);
>  void eeh_add_device_tree_late(struct pci_bus *);
> -void eeh_add_sysfs_files(struct pci_bus *);
>  void eeh_remove_device(struct pci_dev *);
>  int eeh_unfreeze_pe(struct eeh_pe *pe);
>  int eeh_pe_reset_and_recover(struct eeh_pe *pe);
> @@ -368,8 +367,6 @@ static inline void eeh_add_device_late(struct pci_dev=
 *dev) { }
> =20
>  static inline void eeh_add_device_tree_late(struct pci_bus *bus) { }
> =20
> -static inline void eeh_add_sysfs_files(struct pci_bus *bus) { }
> -
>  static inline void eeh_remove_device(struct pci_dev *dev) { }
> =20
>  #define EEH_POSSIBLE_ERROR(val, type) (0)
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 17cb3e9..0878912 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1210,6 +1210,7 @@ void eeh_add_device_late(struct pci_dev *dev)
>  	dev->dev.archdata.edev =3D edev;
> =20
>  	eeh_addr_cache_insert_dev(dev);
> +	eeh_sysfs_add_device(dev);
>  }
> =20
>  /**
> @@ -1238,29 +1239,6 @@ void eeh_add_device_tree_late(struct pci_bus *bus)
>  EXPORT_SYMBOL_GPL(eeh_add_device_tree_late);
> =20
>  /**
> - * eeh_add_sysfs_files - Add EEH sysfs files for the indicated PCI bus
> - * @bus: PCI bus
> - *
> - * This routine must be used to add EEH sysfs files for PCI
> - * devices which are attached to the indicated PCI bus. The PCI bus
> - * is added after system boot through hotplug or dlpar.
> - */
> -void eeh_add_sysfs_files(struct pci_bus *bus)
> -{
> -	struct pci_dev *dev;
> -
> -	list_for_each_entry(dev, &bus->devices, bus_list) {
> -		eeh_sysfs_add_device(dev);
> -		if (dev->hdr_type =3D=3D PCI_HEADER_TYPE_BRIDGE) {
> -			struct pci_bus *subbus =3D dev->subordinate;
> -			if (subbus)
> -				eeh_add_sysfs_files(subbus);
> -		}
> -	}
> -}
> -EXPORT_SYMBOL_GPL(eeh_add_sysfs_files);
> -
> -/**
>   * eeh_remove_device - Undo EEH setup for the indicated pci device
>   * @dev: pci device to be removed
>   *
> diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_p=
latform.c
> index 427fc22..cb68800 100644
> --- a/arch/powerpc/kernel/of_platform.c
> +++ b/arch/powerpc/kernel/of_platform.c
> @@ -86,9 +86,6 @@ static int of_pci_phb_probe(struct platform_device *dev)
>  	/* Add probed PCI devices to the device model */
>  	pci_bus_add_devices(phb->bus);
> =20
> -	/* sysfs files should only be added after devices are added */
> -	eeh_add_sysfs_files(phb->bus);
> -

So for this case, the sysfs files are added by pci_bus_add_devices(),
via...
	pci_bus_add_devices() (loops over devices) ->
	pci_bus_add_device() ->
	pcibios_bus_add_device() ->
	ppc_md.pcibios_bus_add_device() ->
	{pseries,pnv}_pcibios_bus_add_device() ->
	eeh_add_device_late() ->
	eeh_sysfs_add_device().

>  	return 0;
>  }
> =20
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-c=
ommon.c
> index c6c0341..3d2b1cf 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -1404,9 +1404,6 @@ void pcibios_finish_adding_to_bus(struct pci_bus *b=
us)
> =20
>  	/* Add new devices to global lists.  Register in proc, sysfs. */
>  	pci_bus_add_devices(bus);
> -
> -	/* sysfs files should only be added after devices are added */
> -	eeh_add_sysfs_files(bus);

As above.

>  }
>  EXPORT_SYMBOL_GPL(pcibios_finish_adding_to_bus);
> =20
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/=
platforms/powernv/eeh-powernv.c
> index 6f300ab..ef727ec 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -48,7 +48,6 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
>  	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
>  	eeh_add_device_early(pdn);
>  	eeh_add_device_late(pdev);
> -	eeh_sysfs_add_device(pdev);

So for this case, the sysfs files are added by eeh_add_device_late(),
via...
	eeh_add_device_late() ->
	eeh_sysfs_add_device().

>  }
> =20
>  static int pnv_eeh_init(void)
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/=
platforms/pseries/eeh_pseries.c
> index 893ba3f..95bbf91 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -68,7 +68,6 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pde=
v)
>  	}
>  #endif
>  	eeh_add_device_early(pdn);
> -	eeh_add_device_late(pdev);
>  #ifdef CONFIG_PCI_IOV
>  	if (pdev->is_virtfn) {
>  		struct eeh_dev *edev =3D pdn_to_eeh_dev(pdn);
> @@ -78,7 +77,7 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pde=
v)
>  		eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
>  	}
>  #endif
> -	eeh_sysfs_add_device(pdev);
> +	eeh_add_device_late(pdev);

This is just a re-ordering.

>  }
> =20
>  /*
> --=20
> 2.9.5
>=20

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl47klAACgkQMX8w6AQl
/iL/8Af+JMBtuBiMwZy1WAbq0o4t/+AzfDCMjAtiO3Iu4ElDbXIIS/UHnB9s2tQy
FTXNxHGxITOVIuddZaU/q1KW3CwbBiZG66pnQqj0wjk6xsRGfMvBhU7IyTSieGPZ
zB1/aUu8hZXm73AYvk1wXNoSjETQcJI/tUCgHWwmz21179Oewd/JgaciAji3UvBb
huU8sPbeK+igU9DYpyxxLnLwZZls+Mb3ENiU3EmNDF9JhLnZKSJUemHbk5Eephag
qSav94t1DQrHzcB4gDrwPEBuXq396ZHc636lPBjKFVCQMuuP50ueHtTuqzTFK7pt
d17YKzED+tqqRyfNZwWYyc4+4HbELQ==
=MmTB
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--

