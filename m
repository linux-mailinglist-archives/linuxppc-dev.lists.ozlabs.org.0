Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BCD6A110
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 05:59:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nmqY3SxFzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:59:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nmkm11H2zDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 13:55:11 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6G3pgT2017194
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 23:55:07 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ts5t72bg7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 23:55:07 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 16 Jul 2019 04:55:05 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 04:55:03 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6G3t28a28180684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 03:55:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AA62AE045;
 Tue, 16 Jul 2019 03:55:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB92FAE051;
 Tue, 16 Jul 2019 03:55:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 03:55:01 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D692AA01A7;
 Tue, 16 Jul 2019 13:55:00 +1000 (AEST)
Date: Tue, 16 Jul 2019 13:54:59 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 3/5] powerpc/eeh_sysfs: ifdef pseries sr-iov sysfs
 properties
References: <20190715085612.8802-1-oohall@gmail.com>
 <20190715085612.8802-4-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
In-Reply-To: <20190715085612.8802-4-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19071603-0012-0000-0000-00000332EC88
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071603-0013-0000-0000-0000216C648B
Message-Id: <20190716035459.GC3645@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160048
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


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2019 at 06:56:10PM +1000, Oliver O'Halloran wrote:
> There are several EEH sysfs properties that only exists when the
> "ibm,is-open-sriov-pf" property appears in the device tree node of the PCI
> device. This used on pseries to indicate to the guest that the hypervisor
> allows the guest to configure the SR-IOV capability. Doing this requires
> some handshaking between the guest, hypervisor and userspace when a VF is
> EEH frozen which is why these properties exist.
>=20
> This is all dead code on non-pseries platforms so wrap it in an #ifdef
> CONFIG_PPC_PSERIES to make the dependency clearer.

Looks good and a test compile without pSeries platform support
configured seemed to work, so:

Tested-by: Sam Bobroff <sbobroff@linux.ibm.com>
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/kernel/eeh_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/eeh_sysfs.c b/arch/powerpc/kernel/eeh_sy=
sfs.c
> index 6a2c2886f..3adf8cd 100644
> --- a/arch/powerpc/kernel/eeh_sysfs.c
> +++ b/arch/powerpc/kernel/eeh_sysfs.c
> @@ -91,7 +91,7 @@ static ssize_t eeh_pe_state_store(struct device *dev,
> =20
>  static DEVICE_ATTR_RW(eeh_pe_state);
> =20
> -#ifdef CONFIG_PCI_IOV
> +#if defined(CONFIG_PCI_IOV) && defined(CONFIG_PPC_PSERIES)
>  static ssize_t eeh_notify_resume_show(struct device *dev,
>  				      struct device_attribute *attr, char *buf)
>  {
> @@ -148,7 +148,7 @@ static void eeh_notify_resume_remove(struct pci_dev *=
pdev)
>  #else
>  static inline int eeh_notify_resume_add(struct pci_dev *pdev) { return 0=
; }
>  static inline void eeh_notify_resume_remove(struct pci_dev *pdev) { }
> -#endif /* CONFIG_PCI_IOV */
> +#endif /* CONFIG_PCI_IOV && CONFIG PPC_PSERIES*/
> =20
>  void eeh_sysfs_add_device(struct pci_dev *pdev)
>  {
> --=20
> 2.9.5
>=20

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0tSpMACgkQMX8w6AQl
/iLVWQf/ct0opSr7vxY8Cs2kTcduxRGi6x/PDRjd6YaVDouSkkenEzqeVd5c/uPz
mfwB4mrimi91AdA/Xsk5soI10j5yYUFgkb41y4VfLBw/Tm985yabqk2uVgw2RD4g
Iv0o2DamlJu2YvIjMuxcjpPfPVP+aYAuFV5jlmAtpeo6P7XeY5UgVbLiS6d9M0wU
jubxncPUHl32QXxedd7NMjh7vCmrOoy2a05aSio/Z587w7eW0NuWdKPJBMT4yw8m
ICtKz/vcKL490W8NUbOvQW9CYgY8Cc8hnJJRsPF+4+CGGq1rOx7JzK+uhH7dMTPv
LzW938qO2HC1ePqaPpA6DoKlusQqCA==
=d2Uv
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--

