Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BFA58C8E5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 14:59:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1brd4TgKz3bd4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 22:59:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PSvi1Of9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PSvi1Of9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1bqs6ZCGz2xGJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 22:59:05 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278CRWYQ008541;
	Mon, 8 Aug 2022 12:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OuVCR5Ecms0mn/tW5cC459/UH1rvKQ2a8H/f9C6W2Bk=;
 b=PSvi1Of9oPmNAAtN9hcL6hZ/rgx7JyroR5pREMs2pHWCA+eWUb+6O57YJm5KCRIeyT5m
 3tbj+k78oWGBkPRGBvvwptYvAN7fV9KAffPDOE315Ds2jKqq/YlQhmVi4Ey66U7g9XuS
 /dvfNAARQyrZ0W/y3W5ZXjTA6PClj49svZTTt2zTxXt9LrM7/6rhr8uB/Ag8ZnYWG/Es
 0KjBb7D6HlRkMTYcva9gtR9mQcVwUlsYutaVb4Lh2mvmsIVftNcMN2qC9/NbF6C9D0uT
 x9cRDkO9LcSUx89aldPjHfsA6wkuu79PLVWBg/NH5vu0r+/Mxfoump3r+xYtQZxKRCqg bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu0j3cq6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 12:58:58 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 278AF21x016327;
	Mon, 8 Aug 2022 12:58:58 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu0j3cq5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 12:58:57 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278CqYtA004786;
	Mon, 8 Aug 2022 12:58:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma02fra.de.ibm.com with ESMTP id 3hsfx8t5yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 12:58:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 278Cwrfs25297344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 12:58:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9E864203F;
	Mon,  8 Aug 2022 12:58:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2118C42042;
	Mon,  8 Aug 2022 12:58:52 +0000 (GMT)
Received: from [9.43.19.76] (unknown [9.43.19.76])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 12:58:51 +0000 (GMT)
Message-ID: <503c1fca-8a6a-d11f-1b9f-d6987fdee59d@linux.ibm.com>
Date: Mon, 8 Aug 2022 18:28:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] powerpc/mm: Support execute-only memory on the Radix MMU
Content-Language: en-US
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20220808115828.20113-1-ruscur@russell.cc>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20220808115828.20113-1-ruscur@russell.cc>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mYGlCmIvSYw93d_RkZjvnv6mQ9Eo0tUX
X-Proofpoint-ORIG-GUID: OyL6T4ECfshVMG_sMyt28uAnp8FVDZ6_
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_09,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208080062
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/8/22 5:28 PM, Russell Currey wrote:
> The Hash MMU already supports XOM (i.e. mmap with PROT_EXEC only)
> through the execute-only pkey.  A PROT_ONLY mapping will actually map to
> RX, and then the pkey will be applied on top of it.
> 
> Radix doesn't have pkeys, but it does have execute permissions built-in
> to the MMU, so all we have to do to support XOM is expose it.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
> quick test: https://raw.githubusercontent.com/ruscur/junkcode/main/mmap_test.c
> I can make it a selftest.
> 
>  arch/powerpc/include/asm/book3s/64/radix.h |  3 +++
>  arch/powerpc/mm/book3s64/radix_pgtable.c   |  4 ++++
>  arch/powerpc/mm/fault.c                    | 10 ++++++++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index 686001eda936..bf316b773d73 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -19,6 +19,9 @@
>  #include <asm/cpu_has_feature.h>
>  #endif
>  
> +/* Execute-only page protections, Hash can use RX + execute-only pkey */
> +#define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
> +
>  /* An empty PTE can still have a R or C writeback */
>  #define RADIX_PTE_NONE_MASK		(_PAGE_DIRTY | _PAGE_ACCESSED)
>  
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 698274109c91..2edb56169805 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -617,6 +617,10 @@ void __init radix__early_init_mmu(void)
>  	__pmd_frag_nr = RADIX_PMD_FRAG_NR;
>  	__pmd_frag_size_shift = RADIX_PMD_FRAG_SIZE_SHIFT;
>  
> +	/* Radix directly supports execute-only page protections */
> +	protection_map[VM_EXEC] = PAGE_EXECONLY;
> +	protection_map[VM_EXEC | VM_SHARED] = PAGE_EXECONLY;
> +
>  	radix_init_pgtable();
>  
>  	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 014005428687..887c0cc45ca6 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -270,6 +270,16 @@ static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma
>  		return false;
>  	}
>  
> +	if (unlikely(!(vma->vm_flags & VM_READ))) {
> +		/*
> +		 * If we're on Radix, then this could be a read attempt on
> +		 * execute-only memory.  On other MMUs, an "exec-only" page
> +		 * will be given RX flags, so this might be redundant.
> +		 */
> +		if (radix_enabled())
> +			return true;
> +	}
> +


should we do 

/* This cover both PROT_NONE (due to check above) and exec only mapping */
if (radix_enabled() && !(vma->vm_flags & VM_READ)) {
    return true;
/* PROT_NONE check */
else if (!vma_is_accessible(vma)) 
   return true;

return false;



>  	if (unlikely(!vma_is_accessible(vma)))
>  		return true;
>  	/*

-aneesh
