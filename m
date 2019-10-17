Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E996FDA412
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 05:00:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tv6r586LzDr9N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 14:00:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tv4y071vzDr7h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 13:58:57 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9H2vIpl111760
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 22:58:52 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vpbgpej7e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 22:58:52 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 17 Oct 2019 03:58:50 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 17 Oct 2019 03:58:49 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9H2wFk639321990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Oct 2019 02:58:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B4ED52050;
 Thu, 17 Oct 2019 02:58:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B08725204F;
 Thu, 17 Oct 2019 02:58:46 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 43586A024A;
 Thu, 17 Oct 2019 13:58:43 +1100 (AEDT)
Date: Thu, 17 Oct 2019 13:58:42 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH] powernv/eeh: Fix oops when probing cxl devices
References: <20191016162833.22509-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20191016162833.22509-1-fbarrat@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19101702-0008-0000-0000-00000322BE65
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101702-0009-0000-0000-00004A41DA39
Message-Id: <20191017025841.GA18824@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910170020
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
Cc: clombard@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2019 at 06:28:33PM +0200, Frederic Barrat wrote:
> Recent cleanup in the way EEH support is added to a device causes a
> kernel oops when the cxl driver probes a device and creates virtual
> devices discovered on the FPGA:
>=20
>     BUG: Kernel NULL pointer dereference at 0x000000a0
>     Faulting instruction address: 0xc000000000048070
>     Oops: Kernel access of bad area, sig: 7 [#1]
>     ...
>     NIP [c000000000048070] eeh_add_device_late.part.9+0x50/0x1e0
>     LR [c00000000004805c] eeh_add_device_late.part.9+0x3c/0x1e0
>     Call Trace:
>     [c000200e43983900] [c00000000079e250] _dev_info+0x5c/0x6c (unreliable)
>     [c000200e43983980] [c0000000000d1ad0] pnv_pcibios_bus_add_device+0x60=
/0xb0
>     [c000200e439839f0] [c0000000000606d0] pcibios_bus_add_device+0x40/0x60
>     [c000200e43983a10] [c0000000006aa3a0] pci_bus_add_device+0x30/0x100
>     [c000200e43983a80] [c0000000006aa4d4] pci_bus_add_devices+0x64/0xd0
>     [c000200e43983ac0] [c00800001c429118] cxl_pci_vphb_add+0xe0/0x130 [cx=
l]
>     [c000200e43983b00] [c00800001c4242ac] cxl_probe+0x504/0x5b0 [cxl]
>     [c000200e43983bb0] [c0000000006bba1c] local_pci_probe+0x6c/0x110
>     [c000200e43983c30] [c000000000159278] work_for_cpu_fn+0x38/0x60
>=20
> The root cause is that those cxl virtual devices don't have a
> representation in the device tree and therefore no associated pci_dn
> structure. In eeh_add_device_late(), pdn is NULL, so edev is NULL and
> we oops.
>=20
> We never had explicit support for EEH for those virtual
> devices. Instead, EEH events are reported to the (real) pci device and
> handled by the cxl driver. Which can then forward to the virtual
> devices and handle dependencies. The fact that we try adding EEH
> support for the virtual devices is new and a side-effect of the recent
> cleanup.
>=20
> This patch fixes it by skipping adding EEH support on powernv for
> devices which don't have a pci_dn structure.
>=20
> The cxl driver doesn't create virtual devices on pseries so this patch
> doesn't fix it there intentionally.
>=20
> Fixes: b905f8cdca77 ("powerpc/eeh: EEH for pSeries hot plug")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>=20
> Sam: I'm resubmitting indentically as the RFC after all. I couldn't
> find a clean way to separate the non-capi virtual device case to print
> a warning and I'm a bit reluctant to make heavy changes for that.
>=20
> Support for cxl on pseries has been bit-rotting for a while and
> because of that, we don't create virtual devices there. So I didn't
> touch the pseries path. At least on pseries, if there's another
> unexpected case where the pdn is NULL, we should catch it more easily
> with the oops message.

OK. I agree that it's not worth doing more.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

>  arch/powerpc/platforms/powernv/eeh-powernv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/=
platforms/powernv/eeh-powernv.c
> index 6bc24a47e9ef..6f300ab7f0e9 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -42,7 +42,7 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
>  {
>  	struct pci_dn *pdn =3D pci_get_pdn(pdev);
> =20
> -	if (eeh_has_flag(EEH_FORCE_DISABLED))
> +	if (!pdn || eeh_has_flag(EEH_FORCE_DISABLED))
>  		return;
> =20
>  	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
> --=20
> 2.21.0
>=20

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2n2NkACgkQMX8w6AQl
/iImFQf+JSGQ2R/tlPonut7EwfjbDUzCAy77Ne35nomC8l+LmmpOLsaV920F/M3G
ru+ruPKT89bkN7/3E1TumwCFtWEob1PRxd7LjcTox01xc6MSa4zlN+SG+Ca5Qy2a
wv8BlSCkGHzZJJP2JK8musQeqVv6ZyLsvhPW6OVLCt5JOMWbr9wU8Lkuf2rN3ZoI
jS5u8g3edu7mxyOS4f6GDU8A6kRUDhxY6TJ20UtgUsPbeYXEa0ByhpN0NqPEPwde
sheFRMRNOm3uk1RvkRtGJG0rwcuIWs8XI7VZ2sWe7Djx4I+Olry1d4rgxPwmOj81
nxGs6qdF4YhF2/NODDU8/bgryIMZ4w==
=6K0N
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

