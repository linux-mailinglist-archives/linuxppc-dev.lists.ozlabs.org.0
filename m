Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C598B2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 08:04:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DYrl37w4zDqf9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 16:04:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DYlS1bq3zDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:59:48 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M5vbUK049558
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:59:46 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhgqt8bw4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:59:45 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 22 Aug 2019 06:59:43 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 06:59:40 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7M5xe3038469678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 05:59:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFBA2A4055;
 Thu, 22 Aug 2019 05:59:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C958A4051;
 Thu, 22 Aug 2019 05:59:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 05:59:39 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3F4A1A021A;
 Thu, 22 Aug 2019 15:59:38 +1000 (AEST)
Date: Thu, 22 Aug 2019 15:59:37 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/pcidn: Make VF pci_dn management
 CONFIG_PCI_IOV specific
References: <20190821062655.19735-1-oohall@gmail.com>
 <20190821062655.19735-2-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline
In-Reply-To: <20190821062655.19735-2-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19082205-0012-0000-0000-000003415912
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082205-0013-0000-0000-0000217B82C7
Message-Id: <20190822055936.GC25172@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220063
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


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2019 at 04:26:54PM +1000, Oliver O'Halloran wrote:
> The powerpc PCI code requires that a pci_dn structure exists for all
> devices in the system. This is fine for real devices since at boot a pci_=
dn
> is created for each PCI device in the DT and it's fine for hotplugged dev=
ices
> since the hotplug slot driver will manage the pci_dn's devices in hotplug
> slots. For SR-IOV, we need the platform / pcibios to manage the pci_dn for
> virtual functions since firmware is unaware of VFs, and they aren't
> "hot plugged" in the traditional sense.
>=20
> Management of the pci_dn is handled by the, poorly named, functions:
> add_pci_dev_data() and remove_pci_dev_data(). The entire body of these
> functions is #ifdef`ed around CONFIG_PCI_IOV and they cannot be used
> in any other context, so make them only available when CONFIG_PCI_IOV
> is selected, and rename them to reflect their actual usage rather than
> having them masquerade as generic code.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Nice cleanup,

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/pci-bridge.h     |  7 +++++--
>  arch/powerpc/kernel/pci_dn.c              | 15 +++++----------
>  arch/powerpc/platforms/powernv/pci-ioda.c |  4 ++--
>  arch/powerpc/platforms/pseries/pci.c      |  4 ++--
>  4 files changed, 14 insertions(+), 16 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include=
/asm/pci-bridge.h
> index ea6ec65..69f4cb3 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -223,12 +223,15 @@ struct pci_dn {
>  extern struct pci_dn *pci_get_pdn_by_devfn(struct pci_bus *bus,
>  					   int devfn);
>  extern struct pci_dn *pci_get_pdn(struct pci_dev *pdev);
> -extern struct pci_dn *add_dev_pci_data(struct pci_dev *pdev);
> -extern void remove_dev_pci_data(struct pci_dev *pdev);
>  extern struct pci_dn *pci_add_device_node_info(struct pci_controller *ho=
se,
>  					       struct device_node *dn);
>  extern void pci_remove_device_node_info(struct device_node *dn);
> =20
> +#ifdef CONFIG_PCI_IOV
> +struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev);
> +void remove_sriov_vf_pdns(struct pci_dev *pdev);
> +#endif
> +
>  static inline int pci_device_from_OF_node(struct device_node *np,
>  					  u8 *bus, u8 *devfn)
>  {
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index 795c4e3..24da1d8 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -125,7 +125,7 @@ struct pci_dn *pci_get_pdn(struct pci_dev *pdev)
>  }
> =20
>  #ifdef CONFIG_PCI_IOV
> -static struct pci_dn *add_one_dev_pci_data(struct pci_dn *parent,
> +static struct pci_dn *add_one_sriov_vf_pdn(struct pci_dn *parent,
>  					   int vf_index,
>  					   int busno, int devfn)
>  {
> @@ -151,11 +151,9 @@ static struct pci_dn *add_one_dev_pci_data(struct pc=
i_dn *parent,
> =20
>  	return pdn;
>  }
> -#endif
> =20
> -struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
> +struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
>  {
> -#ifdef CONFIG_PCI_IOV
>  	struct pci_dn *parent, *pdn;
>  	int i;
> =20
> @@ -176,7 +174,7 @@ struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
>  	for (i =3D 0; i < pci_sriov_get_totalvfs(pdev); i++) {
>  		struct eeh_dev *edev __maybe_unused;
> =20
> -		pdn =3D add_one_dev_pci_data(parent, i,
> +		pdn =3D add_one_sriov_vf_pdn(parent, i,
>  					   pci_iov_virtfn_bus(pdev, i),
>  					   pci_iov_virtfn_devfn(pdev, i));
>  		if (!pdn) {
> @@ -192,14 +190,11 @@ struct pci_dn *add_dev_pci_data(struct pci_dev *pde=
v)
>  		edev->physfn =3D pdev;
>  #endif /* CONFIG_EEH */
>  	}
> -#endif /* CONFIG_PCI_IOV */
> -
>  	return pci_get_pdn(pdev);
>  }
> =20
> -void remove_dev_pci_data(struct pci_dev *pdev)
> +void remove_sriov_vf_pdns(struct pci_dev *pdev)
>  {
> -#ifdef CONFIG_PCI_IOV
>  	struct pci_dn *parent;
>  	struct pci_dn *pdn, *tmp;
>  	int i;
> @@ -271,8 +266,8 @@ void remove_dev_pci_data(struct pci_dev *pdev)
>  			kfree(pdn);
>  		}
>  	}
> -#endif /* CONFIG_PCI_IOV */
>  }
> +#endif /* CONFIG_PCI_IOV */
> =20
>  struct pci_dn *pci_add_device_node_info(struct pci_controller *hose,
>  					struct device_node *dn)
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
> index d8080558d0..f1fa489 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1719,14 +1719,14 @@ int pnv_pcibios_sriov_disable(struct pci_dev *pde=
v)
>  	pnv_pci_sriov_disable(pdev);
> =20
>  	/* Release PCI data */
> -	remove_dev_pci_data(pdev);
> +	remove_sriov_vf_pdns(pdev);
>  	return 0;
>  }
> =20
>  int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  {
>  	/* Allocate PCI data */
> -	add_dev_pci_data(pdev);
> +	add_sriov_vf_pdns(pdev);
> =20
>  	return pnv_pci_sriov_enable(pdev, num_vfs);
>  }
> diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platform=
s/pseries/pci.c
> index 7228309..911534b 100644
> --- a/arch/powerpc/platforms/pseries/pci.c
> +++ b/arch/powerpc/platforms/pseries/pci.c
> @@ -192,7 +192,7 @@ int pseries_pci_sriov_enable(struct pci_dev *pdev, u1=
6 num_vfs)
>  int pseries_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  {
>  	/* Allocate PCI data */
> -	add_dev_pci_data(pdev);
> +	add_sriov_vf_pdns(pdev);
>  	return pseries_pci_sriov_enable(pdev, num_vfs);
>  }
> =20
> @@ -204,7 +204,7 @@ int pseries_pcibios_sriov_disable(struct pci_dev *pde=
v)
>  	/* Releasing pe_num_map */
>  	kfree(pdn->pe_num_map);
>  	/* Release PCI data */
> -	remove_dev_pci_data(pdev);
> +	remove_sriov_vf_pdns(pdev);
>  	pci_vf_drivers_autoprobe(pdev, true);
>  	return 0;
>  }
> --=20
> 2.9.5
>=20

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl1eL0gACgkQMX8w6AQl
/iJb8Af/Wc0XNhKCb0gd7GsYRQCDPYFXfm5r0lOgaehYs1H3gxkMQrW/0+Dxx1ou
ONOtbdOkoFqR2QTzo4WIBYPM0A+WgPStAUqmhKHo+IkKk9SrK84Tb+acCaa8sEb3
YxSKHxWkqKxRIj8fuLtrRN2INHaAlDZLFCRP8Si9SMOmhdx4DSVmxK8Y17xOQPx9
ubvEqiECO2tXlmPm3eoayDPi6GwR3JHnGCa1BDOZhkhwETvQqNVyXkQnqceyJrYo
5OH2jR9dfquHf+WEg0MTqUKQqwq8hXQr1E1s96czm4HSvJODwrhhL4VuWDwBPktg
GBL3BNDGeEk274uDAyxeZI+R7TEnGg==
=k6ny
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--

