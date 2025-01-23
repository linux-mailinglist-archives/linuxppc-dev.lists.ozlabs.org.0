Return-Path: <linuxppc-dev+bounces-5489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A6BA19EA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 07:59:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdsHs2DRcz2ysZ;
	Thu, 23 Jan 2025 17:59:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737615561;
	cv=none; b=L2KgKbSI+DSSru4nRd2OjprvhH6Jo2OIPUdyMhfzIJET9hkcbFkX11/dTEfrV/y3TUtnuPxlN/sTIhU4nd6DCpRYqDCveXPqCKBAEN6oCUM4BtdRdROSHKhHg5oPI1DH995X8DSLeijTjUByeaKVQEGbvbWDcH8pqAEEJv3TbvOO7seX0pmQ+A9c8rCM3TY39GPBlHolECB5YOdcHLPVYC/kxof7Rx+WmUt83vctqWusSKJ+gSMfshoU3slAn9SSivdN+sps2huIwld2kTVVSW43haym4RBkLqejCEqSRbYGLM8gDuuzFd9IaI3V6qXX5RZQTxr1wceS7Mv22oWoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737615561; c=relaxed/relaxed;
	bh=09C30z6lETAGwwyLE74LGpasXEdfXSMBEQGvKld0Nb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd6zhz7VoQR4/wn62/5zWtJPeSovQFPGQl30U5SDXhbhKO/72tBPSItt8DTxW72FmyCpKDCAj0sCXNhfcRGtdt4PLr26pcX8sGj95qTFsSlOe2a3H1xbI3fZ0rWk8pEdgVnkLxuh0Xw2mqlTwY35sLoMDKx5fd2GOpo6gPDSrq4/CNNMDGOyu/aKoLbUIl2IdbCTRzkYijCkIR0Z9FCoQnoeBOBj/0sugT/rNSQDk/MhgsbqsO6iG2KGkxM48Y32aUgJ1YdYp7QzLbrwzaou35jFn1pX3D+WkkFwNGHc9ngGSuFNPQGj+VXcp6+8mWFuYpuLGwIgAQf9TShdKJ+FbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rfk8vjMd; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rfk8vjMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdsHq6ddfz2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 17:59:19 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5NxbA026439;
	Thu, 23 Jan 2025 06:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=09C30z6lETAGwwyLE74LG
	pasXEdfXSMBEQGvKld0Nb0=; b=Rfk8vjMd6mwZJn+2G7WInCrUx9NoP1oXZpVrT
	xaRUy65JkXm6cnJdEo07PQWCkF3+obNLGo0TeARviYfumWvb6JXYUumTKeZWWCMc
	3Cl0KD/lP6DNsPqQn5d+s4n8H2Yjxdt8HZ+prAUYufau9BprhPbdErFoVxCNVSth
	hf6HReBaHYT6TUfp88ar/hXYmFL9hay6KbP//EvNzpZrcWmcDufKSjmt0hYSknvS
	nbtW/dk8WKFdW4B5fzOXuO+eh8GVMxSg9cXjwiJLrH6BAy+IZ+uPfoJQUZgu9bsV
	mgFIG1mw4WIkxEV9k7ib490rYH3Y95T6oUw4AWfw2C1cYKQjA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bfk7rbnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 06:59:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N69hWM019330;
	Thu, 23 Jan 2025 06:58:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 448pmsmexd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 06:58:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50N6wlGU53412292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 06:58:47 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 101802004B;
	Thu, 23 Jan 2025 06:58:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3613820049;
	Thu, 23 Jan 2025 06:58:45 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.109.249.184])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 23 Jan 2025 06:58:45 +0000 (GMT)
Date: Thu, 23 Jan 2025 12:28:42 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] powerpc/fadump: fix additional param memory
 reservation for HASH MMU
Message-ID: <aewk4qyhv55jti7ctlaghckfbnd4j2ddtko5md7esa4o3mgxrk@bsjxghkfehwd>
Reply-To: mahesh@linux.ibm.com
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
 <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ivfSvp77YF_Y0peqN-SF9Uk-_zas-cq4
X-Proofpoint-ORIG-GUID: ivfSvp77YF_Y0peqN-SF9Uk-_zas-cq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_02,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=557
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230052
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-20 23:05:00 Mon, Sourabh Jain wrote:
> Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
> dump capture kernel") introduced the additional parameter feature in
> fadump for HASH MMU with the understanding that GRUB does not use the
> memory area between 640MB and 768MB for its operation.
> 
> However, the patch ("powerpc: increase MIN RMA size for CAS
> negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
> memory up to 768MB. This makes the fadump reservation for the additional
> parameter feature for HASH MMU unreliable.

I see. Please include above patch in single patch series, with this
change as first patch.

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
> 
> Cc: Avnish Chouhan <avnish@linux.ibm.com>
> Cc: Brian King <brking@linux.ibm.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..5831f3ec8561 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -33,6 +33,7 @@
>  #include <asm/fadump-internal.h>
>  #include <asm/setup.h>
>  #include <asm/interrupt.h>
> +#include <asm/prom.h>
>  
>  /*
>   * The CPU who acquired the lock to trigger the fadump crash should
> @@ -1764,19 +1765,19 @@ void __init fadump_setup_param_area(void)
>  		range_end = memblock_end_of_DRAM();
>  	} else {
>  		/*
> -		 * Passing additional parameters is supported for hash MMU only
> -		 * if the first memory block size is 768MB or higher.
> +		 * Memory range for passing additional parameters for HASH MMU
> +		 * must meet the following conditions:
> +		 * 1. The first memory block size must be higher than the
> +		 *    minimum RMA (MIN_RMA) size. Bootloader can use memory
> +		 *    up to RMA size. So it should be avoided.
> +		 * 2. The range should be between MIN_RMA and RMA size (ppc64_rma_size)
> +		 * 3. It must not overlap with the fadump reserved area.
>  		 */
> -		if (ppc64_rma_size < 0x30000000)
> +		if (ppc64_rma_size < MIN_RMA*1024*1024)
>  			return;
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

Please update fadump documentation which makes this restriction clear.

Rest looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh


