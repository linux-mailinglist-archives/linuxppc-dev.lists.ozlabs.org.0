Return-Path: <linuxppc-dev+bounces-5492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF04A1A147
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 10:56:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdxDP3LyRz2yyx;
	Thu, 23 Jan 2025 20:56:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737626197;
	cv=none; b=o0rj9n/c7clHpdfg8zTLEHuAtPWkuRoaODQRZN8lrJHF97t1sCDWqphFccDeIETAC+o4KbC/dgF59F8QF/G5L2gNDkK1HwaCjRlBcl2rlaMAnbY6GgOqFhsgVnTmADR4+l4pe5nABs1N+77Yt1xM8Ul14XygeQ2v8JA2bzOIdf+7qZ7UQcesdDKEFf0SsK6GgWU6CUzFLbdtY5AhEdkE1koOi2IK+7ul4PoLaINJ5suwYwMx8LLlligcQt1CzPmHnHytHg4+a4uGhR1xvbRvL43cH8b4/D9ifKpblqalqb0EuMhUj7uq4FGB6yEHblT6m+TEiCOOO88KfcW5bflMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737626197; c=relaxed/relaxed;
	bh=33rBs5cjn5arxBz2JdnD9lMyMBgkqFbhIPuVW5yOm6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0LBYrV6i4o9RNW4Ea/fPGSp5e6m6ktSN1rQKj0/4hGDxW7KVW3WG1YQ2gEu97GpqmhvLxTz1CF5bVaxAvaHs0qxLW3mdoLsqnhvDG5tcog+e5EclBL/9QT/ku5naDaZGfnVjHb9BKpDl2bGOWzoKeEVp6nPVaBRuGyO22PxMxPY59l+MVQ9O+49GCo+NiUHLVuXgbI0br/rqFjkvjihO64tEjDpYBTNhzZCWm1FaYXnKW5TPfIR7bzM2VEVUuTv6V/zxqD962L9jIeYUZXx86OuCerO+r6dtKP2CZz75NBSVdasgBGP6N48+02uv7vCvW0u03KJm7MhnVtfhrQEnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jIW/9sK7; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jIW/9sK7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdxDN3BVVz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 20:56:36 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7Ww6B028131;
	Thu, 23 Jan 2025 09:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=33rBs5
	cjn5arxBz2JdnD9lMyMBgkqFbhIPuVW5yOm6Q=; b=jIW/9sK7OpbAgDaN1K9rpD
	i2RUEv91JS0FX8Hwjf3Pfxe26jg9Qy6asHbrBOrDc89asm/SUyPlwFNNORPNgedB
	ME9XOsvRnKZ33jfRMetGf4WTAM6fmBbMOrWb07p5A01g+UY4mGB9u4XcmxCPZpoV
	GpKn9QMULXamdYcZmn5qlOa8H5YvmoI5aQ8j6JpgpZH73DOLA74sDk1TN/DSAoGq
	rvfwVoTVGU8QelELEZ+PCjzXvs0e7KezDpWcQoEVZpnZtJAljXGGnXX/MeF+BnbW
	WrRrFtGaL2GieBxIXxTHBDSHwO4je0+oGQhbA2E98+oX4F2NXngaP4uqDlM7qi5Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bhfpgmmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 09:56:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N6BgaD024258;
	Thu, 23 Jan 2025 09:56:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0yd2bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 09:56:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50N9uM8c22020530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 09:56:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DC072004E;
	Thu, 23 Jan 2025 09:56:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3C6820043;
	Thu, 23 Jan 2025 09:56:20 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 09:56:20 +0000 (GMT)
Message-ID: <6322511c-e56a-4f4c-9b13-efec018cb3a7@linux.ibm.com>
Date: Thu, 23 Jan 2025 15:26:19 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] powerpc/fadump: fix additional param memory
 reservation for HASH MMU
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Avnish Chouhan <avnish@linux.ibm.com>, Brian King <brking@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
 <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B0uOCeTmFN__sWmOZB6uiyzNfqC3c1H-
X-Proofpoint-ORIG-GUID: B0uOCeTmFN__sWmOZB6uiyzNfqC3c1H-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=957
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230072
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 20/01/25 11:05 pm, Sourabh Jain wrote:
> Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
> dump capture kernel") introduced the additional parameter feature in
> fadump for HASH MMU with the understanding that GRUB does not use the
> memory area between 640MB and 768MB for its operation.
> 
> However, the patch ("powerpc: increase MIN RMA size for CAS
> negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
> memory up to 768MB. This makes the fadump reservation for the additional
> parameter feature for HASH MMU unreliable.
> 
> To address this, adjust the memory range for the additional parameter in
> fadump for HASH MMU. This will ensure that GRUB does not overwrite the
> memory reserved for fadump's additional parameter in HASH MMU.
> 

> The new policy for the memory range for the additional parameter in HASH
> MMU is that the first memory block must be larger than the MIN_RMA size,
> as the bootloader can use memory up to the MIN_RMA size. The range
> should be between MIN_RMA and the RMA size (ppc64_rma_size), and it must
> not overlap with the fadump reserved area.

IIRC, even memory above MIN_RMA is used by the bootloader except for
640MB to 768MB (assuming RMA size is >768MB). So, how does this change
guarantee that the bootloader is not using memory reserved for bootargs?

Avnish, earlier, bootloader was using RUNTIME_MIN_SPACE (128MB) starting
top-down at 768MB earlier. With MIN_RMA changed to 768MB, is bootloader
still using the concept of RUNTIME_MIN_SPACE to set aside some memory
for kernel to use. If yes, where exactly is it allocating this space
now? Also, rtas instantiates top-down at 768MB. Would that not have
a conflict with grub allocations without RUNTIME_MIN_SPACE at 768MB?

- Hari

> 
> Cc: Avnish Chouhan <avnish@linux.ibm.com>
> Cc: Brian King <brking@linux.ibm.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kernel/fadump.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..5831f3ec8561 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -33,6 +33,7 @@
>   #include <asm/fadump-internal.h>
>   #include <asm/setup.h>
>   #include <asm/interrupt.h>
> +#include <asm/prom.h>
>   
>   /*
>    * The CPU who acquired the lock to trigger the fadump crash should
> @@ -1764,19 +1765,19 @@ void __init fadump_setup_param_area(void)
>   		range_end = memblock_end_of_DRAM();
>   	} else {
>   		/*
> -		 * Passing additional parameters is supported for hash MMU only
> -		 * if the first memory block size is 768MB or higher.
> +		 * Memory range for passing additional parameters for HASH MMU
> +		 * must meet the following conditions:
> +		 * 1. The first memory block size must be higher than the
> +		 *    minimum RMA (MIN_RMA) size. Bootloader can use memory
> +		 *    up to RMA size. So it should be avoided.
> +		 * 2. The range should be between MIN_RMA and RMA size (ppc64_rma_size)
> +		 * 3. It must not overlap with the fadump reserved area.
>   		 */
> -		if (ppc64_rma_size < 0x30000000)
> +		if (ppc64_rma_size < MIN_RMA*1024*1024)
>   			return;
>   
> -		/*
> -		 * 640 MB to 768 MB is not used by PFW/bootloader. So, try reserving
> -		 * memory for passing additional parameters in this range to avoid
> -		 * being stomped on by PFW/bootloader.
> -		 */
> -		range_start = 0x2A000000;
> -		range_end = range_start + 0x4000000;
> +		range_start = MIN_RMA * 1024 * 1024;
> +		range_end = min(ppc64_rma_size, fw_dump.boot_mem_top);
>   	}
>   
>   	fw_dump.param_area = memblock_phys_alloc_range(COMMAND_LINE_SIZE,


