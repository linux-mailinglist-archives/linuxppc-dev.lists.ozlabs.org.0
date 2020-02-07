Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8441550BC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 03:39:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DKJ41z1vzDqcq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 13:39:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DKGW021pzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 13:37:54 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0172bonh072179
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Feb 2020 21:37:52 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y0knef1m6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 21:37:52 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Fri, 7 Feb 2020 02:37:43 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Feb 2020 02:37:42 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0172bfRX49741878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Feb 2020 02:37:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76CB4AE045;
 Fri,  7 Feb 2020 02:37:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC495AE053;
 Fri,  7 Feb 2020 02:37:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Feb 2020 02:37:40 +0000 (GMT)
Received: from osmium (unknown [9.102.53.41])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6FAEAA0131;
 Fri,  7 Feb 2020 13:37:36 +1100 (AEDT)
Date: Fri, 7 Feb 2020 13:37:38 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 6/6] powerpc/eeh: Rework eeh_ops->probe()
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-7-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <20200203083521.16549-7-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20020702-0020-0000-0000-000003A7C5C6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020702-0021-0000-0000-000021FF9739
Message-Id: <20200207023737.GB21238@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_04:2020-02-06,
 2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 07:35:21PM +1100, Oliver O'Halloran wrote:
> With the EEH early probe now being pseries specific there's no need for
> eeh_ops->probe() to take a pci_dn. Instead, we can make it take a pci_dev
> and use the probe function to map a pci_dev to an eeh_dev. This allows
> the platform to implement it's own method for finding (or creating) an
> eeh_dev for a given pci_dev which also removes a use of pci_dn in
> generic EEH code.
>=20
> This patch also renames eeh_device_add_late() to eeh_device_probe(). This
> better reflects what it does does and removes the last vestiges of the
> early/late EEH probe split.

Nice!
Just one nit, below.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>


> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/include/asm/eeh.h               |  6 ++--
>  arch/powerpc/kernel/eeh.c                    | 42 +++++++++++++++-------=
------
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 30 ++++++++++----------
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 23 ++++++++++++++-
>  4 files changed, 61 insertions(+), 40 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/ee=
h.h
> index 8580238..964a542 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -215,7 +215,7 @@ enum {
>  struct eeh_ops {
>  	char *name;
>  	int (*init)(void);
> -	void* (*probe)(struct pci_dn *pdn, void *data);
> +	struct eeh_dev *(*probe)(struct pci_dev *pdev);
>  	int (*set_option)(struct eeh_pe *pe, int option);
>  	int (*get_pe_addr)(struct eeh_pe *pe);
>  	int (*get_state)(struct eeh_pe *pe, int *delay);
> @@ -301,7 +301,7 @@ int __exit eeh_ops_unregister(const char *name);
>  int eeh_check_failure(const volatile void __iomem *token);
>  int eeh_dev_check_failure(struct eeh_dev *edev);
>  void eeh_addr_cache_init(void);
> -void eeh_add_device_late(struct pci_dev *);
> +void eeh_probe_device(struct pci_dev *pdev);
>  void eeh_remove_device(struct pci_dev *);
>  int eeh_unfreeze_pe(struct eeh_pe *pe);
>  int eeh_pe_reset_and_recover(struct eeh_pe *pe);
> @@ -356,7 +356,7 @@ static inline int eeh_check_failure(const volatile vo=
id __iomem *token)
> =20
>  static inline void eeh_addr_cache_init(void) { }
> =20
> -static inline void eeh_add_device_late(struct pci_dev *dev) { }
> +static inline void eeh_probe_device(struct pci_dev *dev) { }
> =20
>  static inline void eeh_remove_device(struct pci_dev *dev) { }
> =20
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 55d3ef6..2c5f7a6 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1113,29 +1113,37 @@ core_initcall_sync(eeh_init);
>   * This routine must be used to complete EEH initialization for PCI
>   * devices that were added after system boot (e.g. hotplug, dlpar).
>   */

You can't see it in the patch but up a few lines in the comment block,
there's a leftover "eeh_add_device_late".

> -void eeh_add_device_late(struct pci_dev *dev)
> +void eeh_probe_device(struct pci_dev *dev)
>  {
> -	struct pci_dn *pdn;
>  	struct eeh_dev *edev;
> =20
> -	if (!dev)
> +	pr_debug("EEH: Adding device %s\n", pci_name(dev));
> +
> +	/*
> +	 * pci_dev_to_eeh_dev() can only work if eeh_probe_dev() was
> +	 * already called for this device.
> +	 */
> +	if (WARN_ON_ONCE(pci_dev_to_eeh_dev(dev))) {
> +		eeh_edev_dbg(edev, "Already bound to an eeh_dev!\n");
>  		return;
> +	}
> =20
> -	pdn =3D pci_get_pdn_by_devfn(dev->bus, dev->devfn);
> -	edev =3D pdn_to_eeh_dev(pdn);
> -	eeh_edev_dbg(edev, "Adding device\n");
> -	if (edev->pdev =3D=3D dev) {
> -		eeh_edev_dbg(edev, "Device already referenced!\n");
> +	edev =3D eeh_ops->probe(dev);
> +	if (!edev) {
> +		pr_debug("EEH: Adding device failed\n");
>  		return;
>  	}
> =20
>  	/*
> -	 * The EEH cache might not be removed correctly because of
> -	 * unbalanced kref to the device during unplug time, which
> -	 * relies on pcibios_release_device(). So we have to remove
> -	 * that here explicitly.
> +	 * FIXME: We rely on pcibios_release_device() to remove the
> +	 * existing EEH state. The release function is only called if
> +	 * the pci_dev's refcount drops to zero so if something is
> +	 * keeping a ref to a device (e.g. a filesystem) we need to
> +	 * remove the old EEH state.
> +	 *
> +	 * FIXME: HEY MA, LOOK AT ME, NO LOCKING!
>  	 */
> -	if (edev->pdev) {
> +	if (edev->pdev && edev->pdev !=3D dev) {
>  		eeh_rmv_from_parent_pe(edev);
>  		eeh_addr_cache_rmv_dev(edev->pdev);
>  		eeh_sysfs_remove_device(edev->pdev);
> @@ -1146,17 +1154,11 @@ void eeh_add_device_late(struct pci_dev *dev)
>  		 * into error handler afterwards.
>  		 */
>  		edev->mode |=3D EEH_DEV_NO_HANDLER;
> -
> -		edev->pdev =3D NULL;
> -		dev->dev.archdata.edev =3D NULL;
>  	}
> =20
> -	if (eeh_has_flag(EEH_PROBE_MODE_DEV))
> -		eeh_ops->probe(pdn, NULL);
> -
> +	/* bind the pdev and the edev together */
>  	edev->pdev =3D dev;
>  	dev->dev.archdata.edev =3D edev;
> -
>  	eeh_addr_cache_insert_dev(dev);
>  	eeh_sysfs_add_device(dev);
>  }
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/=
platforms/powernv/eeh-powernv.c
> index eaa8dfe..79409e0 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -41,7 +41,7 @@ static int eeh_event_irq =3D -EINVAL;
>  void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
>  {
>  	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
> -	eeh_add_device_late(pdev);
> +	eeh_probe_device(pdev);
>  }
> =20
>  static int pnv_eeh_init(void)
> @@ -340,23 +340,13 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, in=
t cap)
> =20
>  /**
>   * pnv_eeh_probe - Do probe on PCI device
> - * @pdn: PCI device node
> - * @data: unused
> + * @pdev: pci_dev to probe
>   *
> - * When EEH module is installed during system boot, all PCI devices
> - * are checked one by one to see if it supports EEH. The function
> - * is introduced for the purpose. By default, EEH has been enabled
> - * on all PCI devices. That's to say, we only need do necessary
> - * initialization on the corresponding eeh device and create PE
> - * accordingly.
> - *
> - * It's notable that's unsafe to retrieve the EEH device through
> - * the corresponding PCI device. During the PCI device hotplug, which
> - * was possiblly triggered by EEH core, the binding between EEH device
> - * and the PCI device isn't built yet.
> + * Create, or find the existing, eeh_dev for this pci_dev.
>   */
> -static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
> +static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
>  {
> +	struct pci_dn *pdn =3D pci_get_pdn(pdev);
>  	struct pci_controller *hose =3D pdn->phb;
>  	struct pnv_phb *phb =3D hose->private_data;
>  	struct eeh_dev *edev =3D pdn_to_eeh_dev(pdn);
> @@ -373,6 +363,14 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void =
*data)
>  	if (!edev || edev->pe)
>  		return NULL;
> =20
> +	/* already configured? */
> +	if (edev->pdev) {
> +		pr_debug("%s: found existing edev for %04x:%02x:%02x.%01x\n",
> +			__func__, hose->global_number, config_addr >> 8,
> +			PCI_SLOT(config_addr), PCI_FUNC(config_addr));
> +		return edev;
> +	}
> +
>  	/* Skip for PCI-ISA bridge */
>  	if ((pdn->class_code >> 8) =3D=3D PCI_CLASS_BRIDGE_ISA)
>  		return NULL;
> @@ -464,7 +462,7 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *=
data)
> =20
>  	eeh_edev_dbg(edev, "EEH enabled on device\n");
> =20
> -	return NULL;
> +	return edev;
>  }
> =20
>  /**
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/=
platforms/pseries/eeh_pseries.c
> index 1ca7cf0..8453428 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -77,7 +77,7 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pde=
v)
>  		eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
>  	}
>  #endif
> -	eeh_add_device_late(pdev);
> +	eeh_probe_device(pdev);
>  }
> =20
>  /*
> @@ -335,6 +335,26 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
>  	eeh_save_bars(edev);
>  }
> =20
> +static struct eeh_dev *pseries_eeh_probe(struct pci_dev *pdev)
> +{
> +	struct eeh_dev *edev;
> +	struct pci_dn *pdn;
> +
> +	pdn =3D pci_get_pdn_by_devfn(pdev->bus, pdev->devfn);
> +	if (!pdn)
> +		return NULL;
> +
> +	/*
> +	 * If the system supports EEH on this device then the eeh_dev was
> +	 * configured and inserted into a PE in pseries_eeh_init_edev()
> +	 */
> +	edev =3D pdn_to_eeh_dev(pdn);
> +	if (!edev || !edev->pe)
> +		return NULL;
> +
> +	return edev;
> +}
> +
>  /**
>   * pseries_eeh_init_edev_recursive - Enable EEH for the indicated device
>   * @pdn: PCI device node
> @@ -813,6 +833,7 @@ static int pseries_notify_resume(struct pci_dn *pdn)
>  static struct eeh_ops pseries_eeh_ops =3D {
>  	.name			=3D "pseries",
>  	.init			=3D pseries_eeh_init,
> +	.probe			=3D pseries_eeh_probe,
>  	.set_option		=3D pseries_eeh_set_option,
>  	.get_pe_addr		=3D pseries_eeh_get_pe_addr,
>  	.get_state		=3D pseries_eeh_get_state,
> --=20
> 2.9.5
>=20

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl48zWcACgkQMX8w6AQl
/iI+6Qf/ZG3obmCXrgaIytBDGuksMWB38h4bFjadCEIZ13sImptCoiwGg4JvAT4S
vcKsd97QT9vy/9lpURK07Z9sZurnN4df3uZ5W73sDZi+vN34By2JXGv9lqnrA/Mv
/bceaxAlO6a3RxhbxoWHxNL+P6UnFzO2gZcKDipJTChweTqSQoWmVgOqUhWfHohD
gZFNw45cBXVw4MEDu5olSdwkykO8MyZNgst6/6EhhghdnZjg9X5Q2FWbyoxTw3rA
o1MQ98yEdFl0/5xmc/Ft7TwGBKMl1grTxUVCX6jJdl0FobVtA7t0GlLrxmQBdyVS
riYzF3vWFogW0NpgV1FxjCRz0WiJ9A==
=BzBq
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--

