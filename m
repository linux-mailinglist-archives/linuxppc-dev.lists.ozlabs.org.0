Return-Path: <linuxppc-dev+bounces-5855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6EA2847D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 07:27:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnqzS0pVwz2ykT;
	Wed,  5 Feb 2025 17:27:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738736868;
	cv=none; b=G4wxCP9jonHXjAXYtAdRL05+KsDcxPk6NyiMiwFnNuQ3x6LpfSs8PZBiXtDyeQ0I+e1JgmIgWwMFeN5puyx7lzA6rj+aUEdn3q0cpsWsgmovkCWyNQ+n4oW28guBavp/CeFAd646Gahv/jyiVULBnGn22nejcsmn5RNffCvLZ8RF4dY/S3S0tnH98D/NZyob1mQgGSPniO90fiqWM6KXehz0PM7xuvVEmXn9t9g2/wX62zBp/2rI+ym7yeFhW8KWeXn0h7Jwptt/fcU2pBdilQZbCwoChWeUGTC2ytoidhM6H0w5T1w2StXFVdoRvgtgQSAQSzWPnWCadP62Vd6hnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738736868; c=relaxed/relaxed;
	bh=Nogbkj2egvf936660R/YvJNnPU69GnmNGIyXKMMLTDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJbfLXubNgh1lZOTeLE/OLlV3IT8AeJWijoHIXQ2k69uolzS5WA1LT6LI3DMOnVMX1fHqk15wh2FVjubYbRvO/w5f5zsmvcv7vWrpZ8rGFTXtSiBlMrSUVTlueht18eghxkpIb+O+8oYievJc1hckpcrJjhJbNRB1MMAmp8upLd7NdtG2JBBJAcyXk1mUQK2AswMY9LdDTUEfxQSuDbSGg+sbHmXB2xcs2i2mrUyd7T1BgSPdssrxY1mnLZ0sISA4BfS1GG+LLG/kM7idqW4eV2kZ6E+n5zO5VS8ZFGeh1+BxGtO+hgogk1NnPfx25OSDyi317JI97qbSFNpe5XWkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SxQ3rUnb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SxQ3rUnb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnqzR1jYcz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 17:27:46 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5155NuKY000373
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Feb 2025 06:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Nogbkj
	2egvf936660R/YvJNnPU69GnmNGIyXKMMLTDw=; b=SxQ3rUnbhrxFjPgovNm85b
	YDEIEK4qnSD0nMkmF3Elxetw6niImbLNTPqup0YN04inJKB4NbrQrwQG/G2D03JJ
	xBff6O1AlHNXzHV762oX6LiJwzZMnQQIX6el9cf4Fhiaz+KdmF4y1O5Yec6mYcge
	yL3eZ9ISR5fQrg/gENt/DbX11PS8kfFOQuCOdbVkI4/3LfHvRvO4TCOVqCIn8n78
	RJmjv04Jc8dwiXzWVBm5+F0/4fTNHDBp6qHanqcN3BVtU0B9fQGsls0CQG+E/nXv
	TxM4A5zZ0aBD2P/pgCVzPFWJ0qRkY+mzkIrXdCXFXcb3pB9ouIrrSRJgp1o7G5QA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44m1t808p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2025 06:27:43 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5156MGft030649
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Feb 2025 06:27:43 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44m1t808ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 06:27:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5154DY2e024533;
	Wed, 5 Feb 2025 06:27:42 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxn7dhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 06:27:42 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5156RdFB32571996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 06:27:39 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29F665805E;
	Wed,  5 Feb 2025 06:27:39 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3646958050;
	Wed,  5 Feb 2025 06:27:36 +0000 (GMT)
Received: from [9.43.79.142] (unknown [9.43.79.142])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Feb 2025 06:27:35 +0000 (GMT)
Message-ID: <6ca5b3d7-8016-440b-b094-49ab5c8ac6a3@linux.ibm.com>
Date: Wed, 5 Feb 2025 11:57:32 +0530
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
Subject: Re: kexec failing with KVM on Power8 baremetal host
To: Stefan Berger <stefanb@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: ritesh.list@gmail.com, masriniv@in.ibm.com
References: <c683fcdc-38e7-4bed-8bfe-dcf6f122da6a@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <c683fcdc-38e7-4bed-8bfe-dcf6f122da6a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k23iXyeiqnWVi5cn7UXvqF8antMgHt-9
X-Proofpoint-ORIG-GUID: MaEiZ80pgxYDPwIwwoMGJfYz2OswG--R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_02,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050045
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/5/25 12:35 AM, Stefan Berger wrote:
> I bisected Linux between 6.13.0 and 6.12.0 due to failing kexec on a Power8 baremetal host on 6.13.0:
> 

Can you please attach your config, also i cant recreate this host.

Maddy

> 8fec58f503b296af87ffca3898965e3054f2b616 is the first bad commit
> commit 8fec58f503b296af87ffca3898965e3054f2b616
> Author: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Date:   Fri Oct 18 22:59:50 2024 +0530
> 
>     book3s64/hash: Add kfence functionality
> 
>     Now that linear map functionality of debug_pagealloc is made generic,
>     enable kfence to use this generic infrastructure.
> 
>     1. Define kfence related linear map variables.
>        - u8 *linear_map_kf_hash_slots;
>        - unsigned long linear_map_kf_hash_count;
>        - DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
>     2. The linear map size allocated in RMA region is quite small
>        (KFENCE_POOL_SIZE >> PAGE_SHIFT) which is 512 bytes by default.
>     3. kfence pool memory is reserved using memblock_phys_alloc() which has
>        can come from anywhere.
>        (default 255 objects => ((1+255) * 2) << PAGE_SHIFT = 32MB)
>     4. The hash slot information for kfence memory gets added in linear map
>        in hash_linear_map_add_slot() (which also adds for debug_pagealloc).
> 
>     Reported-by: Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
>     Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>     Link: https://patch.msgid.link/5c2b61941b344077a2b8654dab46efa0322af3af.1729271995.git.ritesh.list@gmail.com
> 
>  arch/powerpc/include/asm/kfence.h     |   5 ---
>  arch/powerpc/mm/book3s64/hash_utils.c | 162 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 149 insertions(+), 18 deletions(-)
> 
> 
> Reverting part of this patch by applying the following changes to 6.13.0 resolves the issue:
> 
> 
> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
> index 1f7cab58ab2c..e7981719313c 100644
> --- a/arch/powerpc/include/asm/kfence.h
> +++ b/arch/powerpc/include/asm/kfence.h
> @@ -10,6 +10,7 @@
> 
>  #include <linux/mm.h>
>  #include <asm/pgtable.h>
> +#include <asm/mmu.h>
> 
>  #ifdef CONFIG_PPC64_ELF_ABI_V1
>  #define ARCH_FUNC_PREFIX "."
> @@ -25,6 +26,10 @@ static inline void disable_kfence(void)
> 
>  static inline bool arch_kfence_init_pool(void)
>  {
> +#ifdef CONFIG_PPC64
> +       if (!radix_enabled())
> +               return false;
> +#endif
>         return !kfence_disabled;
>  }
> 
> 
> 


