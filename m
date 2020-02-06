Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDFD153E05
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 06:24:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Cn0r48XszDqYL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 16:24:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CmzC3KszzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 16:22:45 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0165K63w074382
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Feb 2020 00:22:43 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xyhmhg13x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 00:22:42 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 6 Feb 2020 05:22:41 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Feb 2020 05:22:38 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0165McEg46006622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 05:22:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2C8EA405C;
 Thu,  6 Feb 2020 05:22:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 570D4A405B;
 Thu,  6 Feb 2020 05:22:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Feb 2020 05:22:37 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3461BA00EE;
 Thu,  6 Feb 2020 16:22:33 +1100 (AEDT)
Date: Thu, 6 Feb 2020 16:22:35 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 3/6] powerpc/eeh: Do early EEH init only when required
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-4-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline
In-Reply-To: <20200203083521.16549-4-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20020605-0016-0000-0000-000002E4214F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020605-0017-0000-0000-000033470511
Message-Id: <20200206052234.GF15629@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_06:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060040
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


--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 07:35:18PM +1100, Oliver O'Halloran wrote:
> The pci hotplug helper (pci_hp_add_devices()) calls
> eeh_add_device_tree_early() to scan the device-tree for new PCI devices a=
nd
> do the early EEH probe before the device is scanned. This early probe is a
> no-op in a lot of cases because:
>=20
> a) The early init is only required to satisfy a PAPR requirement that EEH
>    be configured before we start doing config accesses. On PowerNV it is
>    a no-op.
>=20
> b) It's a no-op for devices that have already had their eeh_dev
>    initialised.
>=20
> There are four callers of pci_hp_add_devices():
>=20
> 1. arch/powerpc/kernel/eeh_driver.c
> 	Here the hotplug helper is called when re-scanning pci_devs that
> 	were removed during an EEH recovery pass. The EEH stat for each
> 	removed device (the eeh_dev) is retained across a recovery pass
> 	so the early init is a no-op in this case.
>=20
> 2. drivers/pci/hotplug/pnv_php.c
> 	This is also a no-op since the PowerNV hotplug driver is, suprisingly,
> 	PowerNV specific.
>=20
> 3. drivers/pci/hotplug/rpaphp_core.c
> 4. drivers/pci/hotplug/rpaphp_pci.c
> 	In these two cases new devices have been hotplugged and FW has
> 	provided new DT nodes for each. These are the only two cases where
> 	the EEH we might have new PCI device nodes in the DT so these are
> 	the only two cases where the early EEH probe needs to be done.
>=20
> We can move the calls to eeh_add_device_tree_early() to the locations whe=
re
> it's needed and remove it from the generic path. This is preparation for
> making the early EEH probe pseries specific.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Makes sense to me.
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/kernel/pci-hotplug.c | 2 --
>  drivers/pci/hotplug/rpaphp_core.c | 2 ++
>  drivers/pci/hotplug/rpaphp_pci.c  | 4 +++-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-=
hotplug.c
> index d6a67f8..bf83f76 100644
> --- a/arch/powerpc/kernel/pci-hotplug.c
> +++ b/arch/powerpc/kernel/pci-hotplug.c
> @@ -112,8 +112,6 @@ void pci_hp_add_devices(struct pci_bus *bus)
>  	struct pci_controller *phb;
>  	struct device_node *dn =3D pci_bus_to_OF_node(bus);
> =20
> -	eeh_add_device_tree_early(PCI_DN(dn));
> -
>  	phb =3D pci_bus_to_host(bus);
> =20
>  	mode =3D PCI_PROBE_NORMAL;
> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpap=
hp_core.c
> index e408e40..9c1e43e 100644
> --- a/drivers/pci/hotplug/rpaphp_core.c
> +++ b/drivers/pci/hotplug/rpaphp_core.c
> @@ -494,6 +494,8 @@ static int enable_slot(struct hotplug_slot *hotplug_s=
lot)
>  		return retval;
> =20
>  	if (state =3D=3D PRESENT) {
> +		eeh_add_device_tree_early(PCI_DN(slot->dn));
> +
>  		pci_lock_rescan_remove();
>  		pci_hp_add_devices(slot->bus);
>  		pci_unlock_rescan_remove();
> diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaph=
p_pci.c
> index beca61b..61ebbd8 100644
> --- a/drivers/pci/hotplug/rpaphp_pci.c
> +++ b/drivers/pci/hotplug/rpaphp_pci.c
> @@ -95,8 +95,10 @@ int rpaphp_enable_slot(struct slot *slot)
>  			return -EINVAL;
>  		}
> =20
> -		if (list_empty(&bus->devices))
> +		if (list_empty(&bus->devices)) {
> +			eeh_add_device_tree_early(PCI_DN(slot->dn));
>  			pci_hp_add_devices(bus);
> +		}
> =20
>  		if (!list_empty(&bus->devices)) {
>  			slot->state =3D CONFIGURED;
> --=20
> 2.9.5
>=20

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl47opQACgkQMX8w6AQl
/iJx4Qf/a/FAx6YyjFDkLI8F5/e8XR4oZlghX/FUqhs54MP5yQDXr6itTwqQCQuS
jc9Euzxa6gCt1KQOM8k/8WTz1ueJqZiYEaxRQPT/lxcIl05wo/LFdcudREBDq8c3
nsbEjdTt+FJ6ncVrZq+bjsTQaoH3VFFQmudHlQm+K3SzC2eMrQVdfikJSjZazdfI
7lWIKGTiTS+fYeJDZDgxLEWLiJeddvIBZOrr9dAvLUG4DgASDQTYV67fhV4uHdFn
aXlGFlwMrSQGTOjDLeH/4M1CHs1wG32YE+9i9l/FyAHILSI8kuaCZB8LFMpgRiAB
Fgwqel17mI6P7Vx7A+MqXUjqr2cRVQ==
=Owld
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--

