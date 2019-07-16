Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 920286A122
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 06:03:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nmwR5VrzzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 14:03:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nmsZ5CH8zDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 14:01:06 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6G3uplH105521
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 00:01:01 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ts66q9txf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 00:01:01 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 16 Jul 2019 05:00:59 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 05:00:57 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6G40hqq30933304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 04:00:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7CCE4C044;
 Tue, 16 Jul 2019 04:00:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C6C04C040;
 Tue, 16 Jul 2019 04:00:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 04:00:56 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EA5CCA01A7;
 Tue, 16 Jul 2019 14:00:54 +1000 (AEST)
Date: Tue, 16 Jul 2019 14:00:53 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 5/5] powerpc/eeh_sysfs: Make clearing EEH_DEV_SYSFS saner
References: <20190715085612.8802-1-oohall@gmail.com>
 <20190715085612.8802-6-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline
In-Reply-To: <20190715085612.8802-6-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19071604-0012-0000-0000-00000332ECE4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071604-0013-0000-0000-0000216C64EA
Message-Id: <20190716040053.GE3645@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160049
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


--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2019 at 06:56:12PM +1000, Oliver O'Halloran wrote:
> The eeh_sysfs_remove_device() function is supposed to clear the
> EEH_DEV_SYSFS flag since it indicates the EEH sysfs entries have been add=
ed
> for a pci_dev.
>=20
> When the sysfs files are removed eeh_remove_device() the eeh_dev and the
> pci_dev have already been de-associated. This then causes the
> pci_dev_to_eeh_dev() call in eeh_sysfs_remove_device() to return NULL so
> the flag can't be cleared from the still-live eeh_dev. This problem is
> worked around in the caller by clearing the flag manually. However, this
> behaviour doesn't make a whole lot of sense, so this patch fixes it by:
>=20
> a) Re-ordering eeh_remove_device() so that eeh_sysfs_remove_device() is
>    called before de-associating the pci_dev and eeh_dev.
>=20
> b) Making eeh_sysfs_remove_device() emit a warning if there's no
>    corresponding eeh_dev for a pci_dev. The paths where the sysfs
>    files are only reachable if EEH was setup for the device
>    for the device in the first place so hitting this warning
>    indicates a programming error.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Good cleanup, although it looks like "for the device" got duplicated in
the last part of the commit message.

Simple EEH tests still succeeed.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Tested-by: Sam Bobroff <sbobroff@linux.ibm.com>

> +	if (!(edev->pe->state & EEH_PE_KEEP))
> +		eeh_rmv_from_parent_pe(edev);
> +	else
> +		edev->mode |=3D EEH_DEV_DISCONNECTED;

> ---
>  arch/powerpc/kernel/eeh.c       | 30 +++++++++++++++++-------------
>  arch/powerpc/kernel/eeh_sysfs.c | 15 ++++++++-------
>  2 files changed, 25 insertions(+), 20 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index f192d57..6e24896 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1203,7 +1203,6 @@ void eeh_add_device_late(struct pci_dev *dev)
>  		eeh_rmv_from_parent_pe(edev);
>  		eeh_addr_cache_rmv_dev(edev->pdev);
>  		eeh_sysfs_remove_device(edev->pdev);
> -		edev->mode &=3D ~EEH_DEV_SYSFS;
> =20
>  		/*
>  		 * We definitely should have the PCI device removed
> @@ -1306,17 +1305,11 @@ void eeh_remove_device(struct pci_dev *dev)
>  	edev->pdev =3D NULL;
> =20
>  	/*
> -	 * The flag "in_error" is used to trace EEH devices for VFs
> -	 * in error state or not. It's set in eeh_report_error(). If
> -	 * it's not set, eeh_report_{reset,resume}() won't be called
> -	 * for the VF EEH device.
> +	 * eeh_sysfs_remove_device() uses pci_dev_to_eeh_dev() so we need to
> +	 * remove the sysfs files before clearing dev.archdata.edev
>  	 */
> -	edev->in_error =3D false;
> -	dev->dev.archdata.edev =3D NULL;
> -	if (!(edev->pe->state & EEH_PE_KEEP))
> -		eeh_rmv_from_parent_pe(edev);
> -	else
> -		edev->mode |=3D EEH_DEV_DISCONNECTED;
> +	if (edev->mode & EEH_DEV_SYSFS)
> +		eeh_sysfs_remove_device(dev);
> =20
>  	/*
>  	 * We're removing from the PCI subsystem, that means
> @@ -1327,8 +1320,19 @@ void eeh_remove_device(struct pci_dev *dev)
>  	edev->mode |=3D EEH_DEV_NO_HANDLER;
> =20
>  	eeh_addr_cache_rmv_dev(dev);
> -	eeh_sysfs_remove_device(dev);
> -	edev->mode &=3D ~EEH_DEV_SYSFS;
> +
> +	/*
> +	 * The flag "in_error" is used to trace EEH devices for VFs
> +	 * in error state or not. It's set in eeh_report_error(). If
> +	 * it's not set, eeh_report_{reset,resume}() won't be called
> +	 * for the VF EEH device.
> +	 */
> +	edev->in_error =3D false;
> +	dev->dev.archdata.edev =3D NULL;
> +	if (!(edev->pe->state & EEH_PE_KEEP))
> +		eeh_rmv_from_parent_pe(edev);
> +	else
> +		edev->mode |=3D EEH_DEV_DISCONNECTED;
>  }
> =20
>  int eeh_unfreeze_pe(struct eeh_pe *pe)
> diff --git a/arch/powerpc/kernel/eeh_sysfs.c b/arch/powerpc/kernel/eeh_sy=
sfs.c
> index c4cc8fc..5614fd83 100644
> --- a/arch/powerpc/kernel/eeh_sysfs.c
> +++ b/arch/powerpc/kernel/eeh_sysfs.c
> @@ -175,22 +175,23 @@ void eeh_sysfs_remove_device(struct pci_dev *pdev)
>  {
>  	struct eeh_dev *edev =3D pci_dev_to_eeh_dev(pdev);
> =20
> +	if (!edev) {
> +		WARN_ON(eeh_enabled());
> +		return;
> +	}
> +
> +	edev->mode &=3D ~EEH_DEV_SYSFS;
> +
>  	/*
>  	 * The parent directory might have been removed. We needn't
>  	 * continue for that case.
>  	 */
> -	if (!pdev->dev.kobj.sd) {
> -		if (edev)
> -			edev->mode &=3D ~EEH_DEV_SYSFS;
> +	if (!pdev->dev.kobj.sd)
>  		return;
> -	}
> =20
>  	device_remove_file(&pdev->dev, &dev_attr_eeh_mode);
>  	device_remove_file(&pdev->dev, &dev_attr_eeh_pe_config_addr);
>  	device_remove_file(&pdev->dev, &dev_attr_eeh_pe_state);
> =20
>  	eeh_notify_resume_remove(pdev);
> -
> -	if (edev)
> -		edev->mode &=3D ~EEH_DEV_SYSFS;
>  }
> --=20
> 2.9.5
>=20

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0tS/UACgkQMX8w6AQl
/iJkUggAlnGUXEgHFkvSPVc+io+04Ip+ny4QSWYGAEmjJ3bKt19TIZom9WpYF0H8
nmkFnezn3Cj34q79D2CIlu0f3zXE5DuyJY39sZ9NicpIT6pj4LsgNkXRIdHvlUEk
6Nz01Fov1L00SoZOld2yHHCB0WhICF7zy6TkiW3BA1+rHLaEbc8iaxEb8vmFyXJQ
Y0sPyHiiLnNjh93AKv9SpoIJYGyVBtvSoca6GHEtE9ffWd3B5Ul8fjTfvK/ZkJDh
hSAn7Knp8OjVsr7Px/42uFZ9ugHoUNzm9cLigVzgkkdNmsap6RxDzNGWrRpdE3Ob
VboPT4+RvGFnR8r8ZTCp1dM9GB2BCg==
=b2Nm
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--

