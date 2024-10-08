Return-Path: <linuxppc-dev+bounces-1856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC874995900
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 23:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNTLz4RFJz2xjd;
	Wed,  9 Oct 2024 08:15:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728395026;
	cv=none; b=RED/PqaTt9cUs9uqRQYssWc3bCxpggXN/4qoEw5eermCdOeKrnGrCRdbVAOx+MOsjb4pbZ0XEaF6zIvFdOXBp9XPXjyr6O/nnpb8/WG6tsX/VsAOHH8ZT0iXbMhCtnqzOl5Cocyo0uiD9dSv8kW/4CUWwGXWCjwy28tptb73e50xoefqJpgaI3U4h8t6Fc1/BnZ7lblYCWIT0TThyqePTCWWilJW4RNOG54XQX0F1i8nLZ57Di7rPAxjCTAoaTP6FMP9LAF8iTC10mgRVjK7TXU5Ils19fbSnCuVEzcDQBBPpx1TzrLRnzqOLcQj9H/U2fQhB60FQGzVkHUtvctNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728395026; c=relaxed/relaxed;
	bh=E72TLrQazPnDEcl+gaHHf3dO1N0q0bAG9utuUM4vhAs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hhxn2AY2dEhbqG+8UR/7+w/XfSSZGEl0zVPy3d63X9XeWwSkejhPLH+VSNKQhak1bTukCXadVe/Z9kbYeenIfZ8FZMm9mfS/IiHY308p0Gsa66CeJg86R9Nf4Bv227N29bM9UfIjI3AagKNt/gCDZ8ZOKR0c7b4U41LppfEWwi90S9wTQyWBi1hctabjsPT8ScfmP9Xps6n5K4EE+ib4htb3OHZveQynYYcq6wOcgT76Hvp0qb47ojDiUnZRc7fTeFXFpx0OZoE2Vcrn0efTyUmtkMmgkS+HY7l+7D9CelFaFT+E8WELrxemaG/phUkja6gutlr4CaMJ7CNFL9MPxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AIOR0kbC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AIOR0kbC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNHKs14XTz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 00:43:44 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498BK9aJ022840;
	Tue, 8 Oct 2024 13:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	E72TLrQazPnDEcl+gaHHf3dO1N0q0bAG9utuUM4vhAs=; b=AIOR0kbCBw7hDgcZ
	1KskgJ9NANqlBfrcouVuH8M1jorMOSK+ElFcP9x56Vc0wz4QdPJJ190BrFJz9vZh
	h6BiuPeShF1rGAJTKKug8DaYtmOaefFIdSeSSKf/mUz5IeoCfzW31YaOZclHk69e
	m8y/xWs1F7Tde4+OT2tQBQo30bwalQMrQrIHqwnI8BAeAG5Aa1zBEAUG28gBaEZR
	vtTWVvj1btxC3DwbYvwJfO533HvVOqTijxtCiBSfPJP4VOpoZqnUr4h0IgK4lcZF
	sup7QusVMJRgzDvlYuxR/T5fJRMsEL423sgeNlR1FkkID2brTXokvwBq53bm4hrL
	hQwV9w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4253axs20u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:42:36 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 498DgZ8f010670;
	Tue, 8 Oct 2024 13:42:35 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4253axs20m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:42:35 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 498At1AT022852;
	Tue, 8 Oct 2024 13:42:34 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 423jg0v7rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:42:34 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 498DgWur28574430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Oct 2024 13:42:32 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65A285805C;
	Tue,  8 Oct 2024 13:42:32 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE1045805B;
	Tue,  8 Oct 2024 13:42:23 +0000 (GMT)
Received: from oc-fedora.boeblingen.de.ibm.com (unknown [9.152.212.119])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Oct 2024 13:42:23 +0000 (GMT)
Message-ID: <e8026d75acfcf0eebc7bdb95120efe86c23bb917.camel@linux.ibm.com>
Subject: Re: [PATCH v8 11/14] s390: Add wrappers around
 zpci_memcpy/zpci_memset
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert
 Uytterhoeven <geert@linux-m68k.org>,
        Richard Henderson
 <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Richard
 Weinberger <richard@nod.at>,
        Anton Ivanov
 <anton.ivanov@cambridgegreys.com>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan
 Srinivasan <maddy@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
        Yann Sionneau
 <ysionneau@kalrayinc.com>
Date: Tue, 08 Oct 2024 15:42:23 +0200
In-Reply-To: <20241008075023.3052370-12-jvetter@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
	 <20241008075023.3052370-12-jvetter@kalrayinc.com>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QMkofuEW2rZXbxgdHVfB-1saeqezzpun
X-Proofpoint-GUID: W8SAJhAGVcFhSyWva8e33nxWlLxZqX5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_11,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=527 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080084
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 2024-10-08 at 09:50 +0200, Julian Vetter wrote:
> Add wrapper functions around zpci_memcpy_{from,to}io and zpci_memset_io,
> which have aligned prototypes with the ones from iomap_copy.c. These
> wrappers are necessary because the prototypes of the zpci_ functions
> can't be changed. In s390 arch code they are directly being called and
> the return value is checked, At the same time they serve as generic
> memcpy_{from,to}io and memset_io functions, without a return value.
>=20
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v8:
> - New patch
> ---
>  arch/s390/include/asm/io.h     | 27 +++++++++++++++++++++++----
>  arch/s390/include/asm/pci_io.h |  6 +++---
>  2 files changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/s390/include/asm/io.h b/arch/s390/include/asm/io.h
> index 0fbc992d7a5e..f3ef6d4130b3 100644
> --- a/arch/s390/include/asm/io.h
> +++ b/arch/s390/include/asm/io.h
> @@ -58,10 +58,6 @@ static inline void ioport_unmap(void __iomem *p)
>  #define pci_iomap_wc pci_iomap_wc
>  #define pci_iomap_wc_range pci_iomap_wc_range
> =20
> -#define memcpy_fromio(dst, src, count)	zpci_memcpy_fromio(dst, src, coun=
t)
> -#define memcpy_toio(dst, src, count)	zpci_memcpy_toio(dst, src, count)
> -#define memset_io(dst, val, count)	zpci_memset_io(dst, val, count)
> -
>  #define mmiowb()	zpci_barrier()
> =20
>  #define __raw_readb	zpci_read_u8
> @@ -73,6 +69,10 @@ static inline void ioport_unmap(void __iomem *p)
>  #define __raw_writel	zpci_write_u32
>  #define __raw_writeq	zpci_write_u64
> =20
> +#define memcpy_fromio memcpy_fromio
> +#define memcpy_toio memcpy_toio
> +#define memset_io memset_io
> +
>  /* combine single writes by using store-block insn */
>  static inline void __iowrite32_copy(void __iomem *to, const void *from,
>  				    size_t count)
> @@ -88,6 +88,25 @@ static inline void __iowrite64_copy(void __iomem *to, =
const void *from,
>  }
>  #define __iowrite64_copy __iowrite64_copy
> =20
> +static inline void memcpy_fromio(void *dst, const volatile void __iomem =
*src,
> +			    size_t n)
> +{
> +	zpci_memcpy_fromio(dst, src, n);
> +}
> +
> +static inline void memcpy_toio(volatile void __iomem *dst,
> +			      const void *src, size_t n)
> +{
> +	zpci_memcpy_toio(dst, src, n);
> +}
> +
> +static inline void memset_io(volatile void __iomem *dst,
> +			    int val, size_t count)
> +{
> +	zpci_memset_io(dst, val, count);
> +}
> +
> +
>  #endif /* CONFIG_PCI */
> =20
>  #include <asm-generic/io.h>
> diff --git a/arch/s390/include/asm/pci_io.h b/arch/s390/include/asm/pci_i=
o.h
> index 2686bee800e3..43a5ea4ee20f 100644
> --- a/arch/s390/include/asm/pci_io.h
> +++ b/arch/s390/include/asm/pci_io.h
> @@ -143,7 +143,7 @@ static inline int zpci_get_max_io_size(u64 src, u64 d=
st, int len, int max)
> =20
>  static inline int zpci_memcpy_fromio(void *dst,
>  				     const volatile void __iomem *src,
> -				     unsigned long n)
> +				     size_t n)
>  {
>  	int size, rc =3D 0;
> =20
> @@ -162,7 +162,7 @@ static inline int zpci_memcpy_fromio(void *dst,
>  }
> =20
>  static inline int zpci_memcpy_toio(volatile void __iomem *dst,
> -				   const void *src, unsigned long n)
> +				   const void *src, size_t n)
>  {
>  	int size, rc =3D 0;
> =20
> @@ -187,7 +187,7 @@ static inline int zpci_memcpy_toio(volatile void __io=
mem *dst,
>  }
> =20
>  static inline int zpci_memset_io(volatile void __iomem *dst,
> -				 unsigned char val, size_t count)
> +				 int val, size_t count)
>  {
>  	u8 *src =3D kmalloc(count, GFP_KERNEL);
>  	int rc;

The code makes sense to me. If I understand Arnd's comment correctly
the wrappers may not be necessary if you don't have the global
prototypes though, right? In this case I think we might want to still
align the parameter types as this seems generally cleaner and the
internal callers already use size_t anyway.

Either way I gave the whole series a quick test on s390x with PCI
devices and all looks good. So feel free to add:

Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>

