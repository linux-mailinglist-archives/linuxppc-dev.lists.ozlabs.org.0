Return-Path: <linuxppc-dev+bounces-7740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5763AA91CFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 14:53:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zdd9s0TZfz3brV;
	Thu, 17 Apr 2025 22:53:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744894416;
	cv=none; b=ggJa3xEDH3Gb7NFOM2w4FGAyQQVbMuQ2hMY30B9e4oCTiqJ9M0GiqlYEEJm/ftc0EO+wpBE523MxbeQ7+iRaT0EmPZfB/dd58cfmKBESYRd9vkma4ToOsR07OnW6YZmXvzNHmbkaJ3JB5/28GOsHhtcb3n5bbVab+DDAC7ZS/Yeslw3gOZoFELIPZJrxZ0cuZiEgOAzQe/4grTRG5Q9CLl+5vWePEfQUm1/SIwLv8du5tY8iWGn4ONdjulKhV5WJeUGb1k5x8JmVrFXQtTDy5Up4w/sp6ujQ14QklfBQM5umIDIzXGpT2Y0T+ScxRX/CibtoCQpk1oNTp6znRmexIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744894416; c=relaxed/relaxed;
	bh=sxLU9duCgf8SfMyLYupstJbj0NSNm6H3ZBa2n7luzGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfkQHMufYNUTNtNYEieiifKR0UjTnCBKph1r78cl2LG8ds8ucef+rJg/bfLhWGAnG/hvZ2VtTA/QYExg5HlEwFmCyiyPIqWcl1oTJalX0MYYnEtGc1U+kFyVZthnHCG+rjTJkSuOXOFoCQuyEox9uv6rEO3Yjpv0qCSVXsMA6hUuVkFN1FjbLe8JpqiIeHXx3XtpjgTOYEP1Rx3Nkjk+FZoqP9qtqEUT1yUFjq0DDe9tYM2zSgX66eJNuCV3RatBchMhPev38IPoNH0pxcbX88/qcUnKV6pSSQ9U06BXAnzVAXqx15WUh/oUtNTPEDOYQsD2Xh+0Odaw87mDVGe6AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PWxMTYAZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PWxMTYAZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zdd9r0V2Pz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 22:53:35 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HArisF018556;
	Thu, 17 Apr 2025 12:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=sxLU9duCgf8SfMyLYupstJbj0NSNm6
	H3ZBa2n7luzGc=; b=PWxMTYAZ4jnrtqWzXSaZS0fkAjAfJEXKUK/86EdoDIpOLK
	Mi497z2LA4c5kb5ba7ec2eQVjOzk/U3pYoNyZ3x/Xa64hRZEmweEClWVDQR/KXdf
	HPCzXWTM7hxoszv8Rgmt1+J6WifRVXZaCOf7oinw+eHq4BpuZOOGkdLxvUICR0An
	BYd0qbFuIsHPb5vsphRj20fxQMNtsCW7eM12dalLCns/dLLDVIILJ1cxJC3l+M5l
	R+7302WjXk2EPc6LPIADZYTdknfcB1TaDL6hNDABJ7SUQrTXaRUfdcB3CcqdVsMU
	8gRwk2dzZ/ZL1FtsQs9WMz04oP12qVgg+3xzK4EQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462ph0b11r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:53:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53HA0HLn030943;
	Thu, 17 Apr 2025 12:53:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4603gnwr4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:53:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53HCrKoc35651856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 12:53:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D500B20043;
	Thu, 17 Apr 2025 12:53:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 469F420040;
	Thu, 17 Apr 2025 12:53:20 +0000 (GMT)
Received: from osiris (unknown [9.87.137.75])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 17 Apr 2025 12:53:20 +0000 (GMT)
Date: Thu, 17 Apr 2025 14:53:18 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-s390@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
Message-ID: <20250417125318.12521F12-hca@linux.ibm.com>
References: <20250413154350.10819-1-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413154350.10819-1-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QJdoRhLL c=1 sm=1 tr=0 ts=6800f9c3 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=D0vrx1nMhUQuyXyLR1kA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: CiZgrlgThAo1hPOeoX6oy1totgLBfc2n
X-Proofpoint-ORIG-GUID: CiZgrlgThAo1hPOeoX6oy1totgLBfc2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 mlxlogscore=942 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504170090
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 13, 2025 at 08:43:50AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> All of the CRC library's CPU feature static_keys are initialized by
> initcalls and never change afterwards, so there's no need for them to be
> in the regular .data section.  Put them in .data..ro_after_init instead.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> I'm planning to take this via the crc tree.
> 
>  arch/arm/lib/crc-t10dif-glue.c       | 4 ++--
>  arch/arm/lib/crc32-glue.c            | 4 ++--
>  arch/arm64/lib/crc-t10dif-glue.c     | 4 ++--
>  arch/loongarch/lib/crc32-loongarch.c | 2 +-
>  arch/mips/lib/crc32-mips.c           | 2 +-
>  arch/powerpc/lib/crc-t10dif-glue.c   | 2 +-
>  arch/powerpc/lib/crc32-glue.c        | 2 +-
>  arch/s390/lib/crc32-glue.c           | 2 +-


Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

I just realized that we can get rid of the static key in the s390
piece and end up with slightly better code. Could you add the patch
below to your tree, please? If this would go via the s390 tree this
would result in a merge conflict, which is unnecessary.

From 6c4c0ca6fe87e43acf6192f1afc0a6346db994f4 Mon Sep 17 00:00:00 2001
From: Heiko Carstens <hca@linux.ibm.com>
Date: Thu, 17 Apr 2025 14:30:56 +0200
Subject: [PATCH] s390/crc32: Remove have_vxrs static key

Replace the have_vxrs static key with a cpu_has_vx() call.  cpu_has_vx()
resolves into a compile time constant (true) if the kernel is compiled for
z13 or newer. Otherwise it generates an unconditional one instruction
branch, which is patched based on CPU alternatives.

In any case the generated code is at least as good as before and avoids
static key handling.

Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
---
 arch/s390/lib/crc32-glue.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32-glue.c
index 8f20a8e595c3..649ed7e8b99c 100644
--- a/arch/s390/lib/crc32-glue.c
+++ b/arch/s390/lib/crc32-glue.c
@@ -18,8 +18,6 @@
 #define VX_ALIGNMENT		16L
 #define VX_ALIGN_MASK		(VX_ALIGNMENT - 1)
 
-static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vxrs);
-
 /*
  * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
  *
@@ -34,8 +32,7 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vxrs);
 		unsigned long prealign, aligned, remaining;		    \
 		DECLARE_KERNEL_FPU_ONSTACK16(vxstate);			    \
 									    \
-		if (datalen < VX_MIN_LEN + VX_ALIGN_MASK ||		    \
-		    !static_branch_likely(&have_vxrs))			    \
+		if (datalen < VX_MIN_LEN + VX_ALIGN_MASK || !cpu_has_vx())  \
 			return ___crc32_sw(crc, data, datalen);		    \
 									    \
 		if ((unsigned long)data & VX_ALIGN_MASK) {		    \
@@ -66,8 +63,6 @@ DEFINE_CRC32_VX(crc32c_arch, crc32c_le_vgfm_16, crc32c_base)
 
 static int __init crc32_s390_init(void)
 {
-	if (cpu_have_feature(S390_CPU_FEATURE_VXRS))
-		static_branch_enable(&have_vxrs);
 	return 0;
 }
 arch_initcall(crc32_s390_init);
@@ -79,10 +74,11 @@ module_exit(crc32_s390_exit);
 
 u32 crc32_optimizations(void)
 {
-	if (static_key_enabled(&have_vxrs))
+	if (cpu_has_vx()) {
 		return CRC32_LE_OPTIMIZATION |
 		       CRC32_BE_OPTIMIZATION |
 		       CRC32C_OPTIMIZATION;
+	}
 	return 0;
 }
 EXPORT_SYMBOL(crc32_optimizations);
-- 
2.45.2


