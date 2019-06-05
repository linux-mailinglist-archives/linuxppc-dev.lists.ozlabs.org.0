Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E735615
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 06:59:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jc5p0SP1zDqYb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 14:59:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jc4N1wj9zDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 14:58:11 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x554shVS037941
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Jun 2019 00:58:06 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sx2avg9yx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 00:58:06 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 5 Jun 2019 05:48:04 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Jun 2019 05:48:00 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x554lxPA51380314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 04:47:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3060BA405C;
 Wed,  5 Jun 2019 04:47:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91195A405B;
 Wed,  5 Jun 2019 04:47:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jun 2019 04:47:58 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6833EA01BD;
 Wed,  5 Jun 2019 14:47:55 +1000 (AEST)
Date: Wed, 5 Jun 2019 14:47:54 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/pci/of: Fix OF flags parsing for 64bit BARs
References: <20190605033814.127962-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20190605033814.127962-1-aik@ozlabs.ru>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19060504-0020-0000-0000-00000345B878
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060504-0021-0000-0000-00002198C50B
Message-Id: <20190605044753.GA31563@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050029
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
Cc: Shawn Anastasio <shawn@anastas.io>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 01:38:14PM +1000, Alexey Kardashevskiy wrote:
> When the firmware does PCI BAR resource allocation, it passes the assigned
> addresses and flags (prefetch/64bit/...) via the "reg" property of
> a PCI device device tree node so the kernel does not need to do
> resource allocation.
>=20
> The flags are stored in resource::flags - the lower byte stores
> PCI_BASE_ADDRESS_SPACE/etc bits and the other bytes are IORESOURCE_IO/etc.
> Some flags from PCI_BASE_ADDRESS_xxx and IORESOURCE_xxx are duplicated,
> such as PCI_BASE_ADDRESS_MEM_PREFETCH/PCI_BASE_ADDRESS_MEM_TYPE_64/etc.
> When parsing the "reg" property, we copy the prefetch flag but we skip
> on PCI_BASE_ADDRESS_MEM_TYPE_64 which leaves the flags out of sync.
>=20
> The missing IORESOURCE_MEM_64 flag comes into play under 2 conditions:
> 1. we remove PCI_PROBE_ONLY for pseries (by hacking pSeries_setup_arch()
> or by passing "/chosen/linux,pci-probe-only");
> 2. we request resource alignment (by passing pci=3Dresource_alignment=3D
> via the kernel cmd line to request PAGE_SIZE alignment or defining
> ppc_md.pcibios_default_alignment which returns anything but 0). Note that
> the alignment requests are ignored if PCI_PROBE_ONLY is enabled.
>=20
> With 1) and 2), the generic PCI code in the kernel unconditionally
> decides to:
> - reassign the BARs in pci_specified_resource_alignment() (works fine)
> - write new BARs to the device - this fails for 64bit BARs as the generic
> code looks at IORESOURCE_MEM_64 (not set) and writes only lower 32bits
> of the BAR and leaves the upper 32bit unmodified which breaks BAR mapping
> in the hypervisor.
>=20
> This fixes the issue by copying the flag. This is useful if we want to
> enforce certain BAR alignment per platform as handling subpage sized BARs
> is proven to cause problems with hotplug (SLOF already aligns BARs to 64k=
).
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>=20
> This code is there for ages (from 200x) hence no "Fixes:".
>=20
> Ideally I want to enforce /chosen/linux,pci-probe-only in QEMU as
> at the moment:
> - pci=3Dresource_alignment=3D alone does not do anything;
> - /chosen/linux,pci-probe-only alone does not cause the kernel to
> reassign resources;
> - pci=3Dresource_alignment=3D with /chosen/linux,pci-probe-only is broken
> anyway.

Looks good to me. I gave it a quick test for regressions, with a host
and QEMU guest (with some passed-through devices) both using the patch
and it seemed fine.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/kernel/pci_of_scan.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_=
of_scan.c
> index 24191ea2d9a7..64ad92016b63 100644
> --- a/arch/powerpc/kernel/pci_of_scan.c
> +++ b/arch/powerpc/kernel/pci_of_scan.c
> @@ -45,6 +45,8 @@ unsigned int pci_parse_of_flags(u32 addr0, int bridge)
>  	if (addr0 & 0x02000000) {
>  		flags =3D IORESOURCE_MEM | PCI_BASE_ADDRESS_SPACE_MEMORY;
>  		flags |=3D (addr0 >> 22) & PCI_BASE_ADDRESS_MEM_TYPE_64;
> +		if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64)
> +			flags |=3D IORESOURCE_MEM_64;
>  		flags |=3D (addr0 >> 28) & PCI_BASE_ADDRESS_MEM_TYPE_1M;
>  		if (addr0 & 0x40000000)
>  			flags |=3D IORESOURCE_PREFETCH
> --=20
> 2.17.1
>=20

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAlz3SXMACgkQMX8w6AQl
/iKQbwf/Ysc5wK9jTVs+dDGSsW/jeFRhxPs/+jhEHKZjMHY/KxLUJO720lYiER5P
kxeZ20kUJFqzzVJ/0lJcqNk04kqOq/8OxSsiEsGpm8cZTXcTIZux0li/su26/4nx
gyoSju4QSotLTyWedbYQF54sYPkBt/IaIjCsZ+4NPUrtplSBgudKSE4qegy/LAi5
cuLe4WGWaeywghGrqTpL319YC8kYVDgioQw3b51TbeCCnLKfzpcYYWd13CG67Qog
n8ckMDOC0meBjzysPMVzlx67syf8xBkOV0hi8DfZ0Zts942ZISv+Umu5oUAH7WUD
fbQ+t2gekwfEfxqZcteWYLZ5PoMuBg==
=109d
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--

