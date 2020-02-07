Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CA1550AF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 03:25:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DK0G1kb2zDqcg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 13:25:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DJyy1TfPzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 13:24:26 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0172Ji1r020770
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Feb 2020 21:24:23 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y0nxn8anv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 21:24:23 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Fri, 7 Feb 2020 02:24:21 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Feb 2020 02:24:17 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0172OHIi58916928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Feb 2020 02:24:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03A91A404D;
 Fri,  7 Feb 2020 02:24:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AE21A4040;
 Fri,  7 Feb 2020 02:24:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Feb 2020 02:24:16 +0000 (GMT)
Received: from osmium (unknown [9.102.53.41])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F0A59A0131;
 Fri,  7 Feb 2020 13:24:11 +1100 (AEDT)
Date: Fri, 7 Feb 2020 13:24:13 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 5/6] powerpc/eeh: Make early EEH init pseries specific
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-6-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20200203083521.16549-6-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20020702-4275-0000-0000-0000039EB9FE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020702-4276-0000-0000-000038B2E8C0
Message-Id: <20200207022412.GA21238@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_04:2020-02-06,
 2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002070013
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


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 07:35:20PM +1100, Oliver O'Halloran wrote:
> The eeh_ops->probe() function is called from two different contexts:
>=20
> 1. On pseries, where set set EEH_PROBE_MODE_DEVTREE, it's called in
"set set" -> "we set"
>    eeh_add_device_early() which is supposed to run before we create
>    a pci_dev.
>=20
> 2. On PowerNV, where we set EEH_PROBE_MODE_DEV, it's called in
>    eeh_device_add_late() which is supposed to run *after* the
>    pci_dev is created.
>=20
> The "early" probe is required because PAPR requires that we perform an RT=
AS
> call to enable EEH support on a device before we start interacting with it
> via config space or MMIO. This requirement doesn't exist on PowerNV and
> shoehorning two completely separate initialisation paths into a common
> interface just results in a convoluted code everywhere.
>=20
> Additionally the early probe requires the probe function to take an pci_dn
> rather than a pci_dev argument. We'd like to make pci_dn a pseries specif=
ic
> data structure since there's no real requirement for them on PowerNV. To
> help both goals move the early probe into the pseries containment zone
> so the platform depedence is more explicit.
>=20
I had a look around near your comment:
> +			// XXX: uh, do we have the rescan lock held here?
And we definitely don't have the lock when it gets called via the module
init path (as rpaphp is loaded) -- I tried it and there was no deadlock.
I don't think we have the lock in other situations but I haven't
unravelled it all enough yet to tell, either.

Regardless, good cleanup.
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/include/asm/eeh.h               | 14 +++---
>  arch/powerpc/kernel/eeh.c                    | 46 --------------------
>  arch/powerpc/kernel/of_platform.c            |  6 +--
>  arch/powerpc/platforms/powernv/eeh-powernv.c |  6 ---
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 65 ++++++++++++++++++++++=
------
>  arch/powerpc/platforms/pseries/pci_dlpar.c   |  2 +-
>  drivers/pci/hotplug/rpadlpar_core.c          |  2 +-
>  drivers/pci/hotplug/rpaphp_core.c            |  2 +-
>  drivers/pci/hotplug/rpaphp_pci.c             |  3 +-
>  9 files changed, 65 insertions(+), 81 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/ee=
h.h
> index 5d10781..8580238 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -301,8 +301,6 @@ int __exit eeh_ops_unregister(const char *name);
>  int eeh_check_failure(const volatile void __iomem *token);
>  int eeh_dev_check_failure(struct eeh_dev *edev);
>  void eeh_addr_cache_init(void);
> -void eeh_add_device_early(struct pci_dn *);
> -void eeh_add_device_tree_early(struct pci_dn *);
>  void eeh_add_device_late(struct pci_dev *);
>  void eeh_remove_device(struct pci_dev *);
>  int eeh_unfreeze_pe(struct eeh_pe *pe);
> @@ -358,10 +356,6 @@ static inline int eeh_check_failure(const volatile v=
oid __iomem *token)
> =20
>  static inline void eeh_addr_cache_init(void) { }
> =20
> -static inline void eeh_add_device_early(struct pci_dn *pdn) { }
> -
> -static inline void eeh_add_device_tree_early(struct pci_dn *pdn) { }
> -
>  static inline void eeh_add_device_late(struct pci_dev *dev) { }
> =20
>  static inline void eeh_remove_device(struct pci_dev *dev) { }
> @@ -370,6 +364,14 @@ static inline void eeh_remove_device(struct pci_dev =
*dev) { }
>  #define EEH_IO_ERROR_VALUE(size) (-1UL)
>  #endif /* CONFIG_EEH */
> =20
> +#if defined(CONFIG_PPC_PSERIES) && defined(CONFIG_EEH)
> +void pseries_eeh_init_edev(struct pci_dn *pdn);
> +void pseries_eeh_init_edev_recursive(struct pci_dn *pdn);
> +#else
> +static inline void pseries_eeh_add_device_early(struct pci_dn *pdn) { }
> +static inline void pseries_eeh_add_device_tree_early(struct pci_dn *pdn)=
 { }
> +#endif
> +
>  #ifdef CONFIG_PPC64
>  /*
>   * MMIO read/write operations with EEH support.
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index a9e4ca7..55d3ef6 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1107,52 +1107,6 @@ static int eeh_init(void)
>  core_initcall_sync(eeh_init);
> =20
>  /**
> - * eeh_add_device_early - Enable EEH for the indicated device node
> - * @pdn: PCI device node for which to set up EEH
> - *
> - * This routine must be used to perform EEH initialization for PCI
> - * devices that were added after system boot (e.g. hotplug, dlpar).
> - * This routine must be called before any i/o is performed to the
> - * adapter (inluding any config-space i/o).
> - * Whether this actually enables EEH or not for this device depends
> - * on the CEC architecture, type of the device, on earlier boot
> - * command-line arguments & etc.
> - */
> -void eeh_add_device_early(struct pci_dn *pdn)
> -{
> -	struct eeh_dev *edev =3D pdn_to_eeh_dev(pdn);
> -
> -	if (!edev)
> -		return;
> -
> -	if (!eeh_has_flag(EEH_PROBE_MODE_DEVTREE))
> -		return;
> -
> -	eeh_ops->probe(pdn, NULL);
> -}
> -
> -/**
> - * eeh_add_device_tree_early - Enable EEH for the indicated device
> - * @pdn: PCI device node
> - *
> - * This routine must be used to perform EEH initialization for the
> - * indicated PCI device that was added after system boot (e.g.
> - * hotplug, dlpar).
> - */
> -void eeh_add_device_tree_early(struct pci_dn *pdn)
> -{
> -	struct pci_dn *n;
> -
> -	if (!pdn)
> -		return;
> -
> -	list_for_each_entry(n, &pdn->child_list, list)
> -		eeh_add_device_tree_early(n);
> -	eeh_add_device_early(pdn);
> -}
> -EXPORT_SYMBOL_GPL(eeh_add_device_tree_early);
> -
> -/**
>   * eeh_add_device_late - Perform EEH initialization for the indicated pc=
i device
>   * @dev: pci device for which to set up EEH
>   *
> diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_p=
latform.c
> index 64edac81..71a3f97 100644
> --- a/arch/powerpc/kernel/of_platform.c
> +++ b/arch/powerpc/kernel/of_platform.c
> @@ -62,13 +62,9 @@ static int of_pci_phb_probe(struct platform_device *de=
v)
>  	/* Init pci_dn data structures */
>  	pci_devs_phb_init_dynamic(phb);
> =20
> -	/* Create EEH devices for the PHB */
> +	/* Create EEH PEs for the PHB */
>  	eeh_dev_phb_init_dynamic(phb);
> =20
> -	/* Register devices with EEH */
> -	if (dev->dev.of_node->child)
> -		eeh_add_device_tree_early(PCI_DN(dev->dev.of_node));
> -
>  	/* Scan the bus */
>  	pcibios_scan_phb(phb);
>  	if (phb->bus =3D=3D NULL)
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/=
platforms/powernv/eeh-powernv.c
> index ef727ec..eaa8dfe 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -40,13 +40,7 @@ static int eeh_event_irq =3D -EINVAL;
> =20
>  void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
>  {
> -	struct pci_dn *pdn =3D pci_get_pdn(pdev);
> -
> -	if (!pdn || eeh_has_flag(EEH_FORCE_DISABLED))
> -		return;
> -
>  	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
> -	eeh_add_device_early(pdn);
>  	eeh_add_device_late(pdev);
>  }
> =20
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/=
platforms/pseries/eeh_pseries.c
> index 95bbf91..1ca7cf0 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -67,7 +67,7 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pde=
v)
>  		pdn->pe_number  =3D  physfn_pdn->pe_num_map[pdn->vf_index];
>  	}
>  #endif
> -	eeh_add_device_early(pdn);
> +	pseries_eeh_init_edev(pdn);
>  #ifdef CONFIG_PCI_IOV
>  	if (pdev->is_virtfn) {
>  		struct eeh_dev *edev =3D pdn_to_eeh_dev(pdn);
> @@ -221,15 +221,16 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn=
, int cap)
>  }
> =20
>  /**
> - * pseries_eeh_probe - EEH probe on the given device
> + * pseries_eeh_init_edev - initialise the eeh_dev and eeh_pe for a pci_dn
> + *
>   * @pdn: PCI device node
> - * @data: Unused
>   *
> - * When EEH module is installed during system boot, all PCI devices
> - * are checked one by one to see if it supports EEH. The function
> - * is introduced for the purpose.
> + * When we discover a new PCI device via the device-tree we create a
> + * corresponding pci_dn and we allocate, but don't initialise, an eeh_de=
v.
> + * This function takes care of the initialisation and inserts the eeh_dev
> + * into the correct eeh_pe. If no eeh_pe exists we'll allocate one.
>   */
> -static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
> +void pseries_eeh_init_edev(struct pci_dn *pdn)
>  {
>  	struct eeh_dev *edev;
>  	struct eeh_pe pe;
> @@ -237,18 +238,35 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, =
void *data)
>  	int enable =3D 0;
>  	int ret;
> =20
> -	/* Retrieve OF node and eeh device */
> +	if (WARN_ON_ONCE(!eeh_has_flag(EEH_PROBE_MODE_DEVTREE)))
> +		return;
> +
> +	/*
> +	 * Find the eeh_dev for this pdn. The storage for the eeh_dev was
> +	 * allocated at the same time as the pci_dn.
> +	 *
> +	 * XXX: We should probably re-visit that.
> +	 */
>  	edev =3D pdn_to_eeh_dev(pdn);
> -	if (!edev || edev->pe)
> -		return NULL;
> +	if (!edev)
> +		return;
> +
> +	/*
> +	 * If ->pe is set then we've already probed this device. We hit
> +	 * this path when a pci_dev is removed and rescanned while recovering
> +	 * a PE (i.e. for devices where the driver doesn't support error
> +	 * recovery).
> +	 */
> +	if (edev->pe)
> +		return;
> =20
>  	/* Check class/vendor/device IDs */
>  	if (!pdn->vendor_id || !pdn->device_id || !pdn->class_code)
> -		return NULL;
> +		return;
> =20
>  	/* Skip for PCI-ISA bridge */
>          if ((pdn->class_code >> 8) =3D=3D PCI_CLASS_BRIDGE_ISA)
> -		return NULL;
> +		return;
> =20
>  	eeh_edev_dbg(edev, "Probing device\n");
> =20
> @@ -315,9 +333,29 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, v=
oid *data)
> =20
>  	/* Save memory bars */
>  	eeh_save_bars(edev);
> +}
> +
> +/**
> + * pseries_eeh_init_edev_recursive - Enable EEH for the indicated device
> + * @pdn: PCI device node
> + *
> + * This routine must be used to perform EEH initialization for the
> + * indicated PCI device that was added after system boot (e.g.
> + * hotplug, dlpar).
> + */
> +void pseries_eeh_init_edev_recursive(struct pci_dn *pdn)
> +{
> +	struct pci_dn *n;
> +
> +	if (!pdn)
> +		return;
> +
> +	list_for_each_entry(n, &pdn->child_list, list)
> +		pseries_eeh_init_edev_recursive(n);
> =20
> -	return NULL;
> +	pseries_eeh_init_edev(pdn);
>  }
> +EXPORT_SYMBOL_GPL(pseries_eeh_init_edev_recursive);
> =20
>  /**
>   * pseries_eeh_set_option - Initialize EEH or MMIO/DMA reenable
> @@ -775,7 +813,6 @@ static int pseries_notify_resume(struct pci_dn *pdn)
>  static struct eeh_ops pseries_eeh_ops =3D {
>  	.name			=3D "pseries",
>  	.init			=3D pseries_eeh_init,
> -	.probe			=3D pseries_eeh_probe,
>  	.set_option		=3D pseries_eeh_set_option,
>  	.get_pe_addr		=3D pseries_eeh_get_pe_addr,
>  	.get_state		=3D pseries_eeh_get_state,
> diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/pl=
atforms/pseries/pci_dlpar.c
> index 361986e..b3a38f5 100644
> --- a/arch/powerpc/platforms/pseries/pci_dlpar.c
> +++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
> @@ -37,7 +37,7 @@ struct pci_controller *init_phb_dynamic(struct device_n=
ode *dn)
>  	eeh_dev_phb_init_dynamic(phb);
> =20
>  	if (dn->child)
> -		eeh_add_device_tree_early(PCI_DN(dn));
> +		pseries_eeh_init_edev_recursive(PCI_DN(dn));
> =20
>  	pcibios_scan_phb(phb);
>  	pcibios_finish_adding_to_bus(phb->bus);
> diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rp=
adlpar_core.c
> index 977946e..c5eb509 100644
> --- a/drivers/pci/hotplug/rpadlpar_core.c
> +++ b/drivers/pci/hotplug/rpadlpar_core.c
> @@ -140,7 +140,7 @@ static void dlpar_pci_add_bus(struct device_node *dn)
>  	struct pci_controller *phb =3D pdn->phb;
>  	struct pci_dev *dev =3D NULL;
> =20
> -	eeh_add_device_tree_early(pdn);
> +	pseries_eeh_init_edev_recursive(pdn);
> =20
>  	/* Add EADS device to PHB bus, adding new entry to bus->devices */
>  	dev =3D of_create_pci_dev(dn, phb->bus, pdn->devfn);
> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpap=
hp_core.c
> index 9c1e43e..b89d5ff 100644
> --- a/drivers/pci/hotplug/rpaphp_core.c
> +++ b/drivers/pci/hotplug/rpaphp_core.c
> @@ -494,7 +494,7 @@ static int enable_slot(struct hotplug_slot *hotplug_s=
lot)
>  		return retval;
> =20
>  	if (state =3D=3D PRESENT) {
> -		eeh_add_device_tree_early(PCI_DN(slot->dn));
> +		pseries_eeh_init_edev_recursive(PCI_DN(slot->dn));
> =20
>  		pci_lock_rescan_remove();
>  		pci_hp_add_devices(slot->bus);
> diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaph=
p_pci.c
> index 61ebbd8..e116ffe 100644
> --- a/drivers/pci/hotplug/rpaphp_pci.c
> +++ b/drivers/pci/hotplug/rpaphp_pci.c
> @@ -96,7 +96,8 @@ int rpaphp_enable_slot(struct slot *slot)
>  		}
> =20
>  		if (list_empty(&bus->devices)) {
> -			eeh_add_device_tree_early(PCI_DN(slot->dn));
> +			// XXX: uh, do we have the rescan lock held here?
> +			pseries_eeh_init_edev_recursive(PCI_DN(slot->dn));
>  			pci_hp_add_devices(bus);
>  		}
> =20
> --=20
> 2.9.5
>=20

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl48ykYACgkQMX8w6AQl
/iKzbwf/Sr0jpvhdodLjw+3fOlIIxNUm3WkMc/xOmtl1VudCA3FRMbOHLtu1hG/o
HRTQMCLtMUQRqpBx4nydivPD7wafMcleyZGDT3KoFyubhhn4OLotfP/VKFIPUGtF
p/2pJQYBKxz25TVYFIrj9cMdVOLF8eEyZ6ADq2HbnM9UPlQhVj2I4p6QRy3yTxfk
8CECcLNRn+lxMJ4Lz/ilhJBoxvpfNJea91dIAwwQjSigyPSbHojmmO3Cq/wr7Azw
8uhFZ7NvnweJP0t63nmdt9UHpvPsrEBQv4KTGidrhykTlTTNt7zw+zGjUy3w2p+a
F5a6x+xYb3fPGvmddiafd+HKjAXAJA==
=eFO6
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

