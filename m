Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A29F54E181
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 15:10:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP2bB50Pnz3bpJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 23:10:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ryFbrDXT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ryFbrDXT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP2ZS4CnHz307C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 23:09:35 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC22x6030029;
	Thu, 16 Jun 2022 13:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=g1Pvsy3U6jwtRCQFsn46q1bw0+7Un6RVxAeQOO9lmL4=;
 b=ryFbrDXTH/UIZvxmApVTLerlE7JsPILRfX0bJ71FG8jHXKe7nN0Le2zR2j594EK5iE6R
 BPcDFtnNVewhi/PC9skwD9htl0/fkxm2afqlj2E7K5lv/3Psx+kakrmbCeL4qB3Ltcmh
 KGyEZut0ucEX0LNEqV1zDvnSN6Sdwo/Hc9/iJ7zLg1z5MjgpyurvHdUUN/wn6hDCn/Qp
 kJeBHL43C13GY+8oCDSo//4fw4urZvnTfoX+3tD5ezO2EWS0S5pQ6RuaVsw45iHpOJp9
 mbFsnr72BZWYcRu1BWOe4RXPraVWp9Xbb7Qgd58xlu+FInDHL/B+eksutcuGfRn/LJW9 pA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqgytfeb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 13:09:27 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25GD5stk025786;
	Thu, 16 Jun 2022 13:09:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma04wdc.us.ibm.com with ESMTP id 3gmjpa20hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 13:09:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25GD9PqE27590930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 13:09:25 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8178EC6061;
	Thu, 16 Jun 2022 13:09:25 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C539C607D;
	Thu, 16 Jun 2022 13:09:23 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.32.31])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jun 2022 13:09:22 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Move CMA reservations after initmem_init()
In-Reply-To: <20220616120033.1976732-1-mpe@ellerman.id.au>
References: <20220616120033.1976732-1-mpe@ellerman.id.au>
Date: Thu, 16 Jun 2022 18:37:29 +0530
Message-ID: <877d5gn4dq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eZKjBI07lz2a0yakqSVv8bvDqIsh1RvV
X-Proofpoint-GUID: eZKjBI07lz2a0yakqSVv8bvDqIsh1RvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_08,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160054
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
Cc: linux-mm@kvack.org, ziy@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> After commit 11ac3e87ce09 ("mm: cma: use pageblock_order as the single
> alignment") there is an error at boot about the KVM CMA reservation
> failing, eg:
>
>   kvm_cma_reserve: reserving 6553 MiB for global area
>   cma: Failed to reserve 6553 MiB
>
> That makes it impossible to start KVM guests using the hash MMU with
> more than 2G of memory, because the VM is unable to allocate a large
> enough region for the hash page table, eg:
>
>   $ qemu-system-ppc64 -enable-kvm -M pseries -m 4G ...
>   qemu-system-ppc64: Failed to allocate KVM HPT of order 25: Cannot allocate memory
>
> Aneesh pointed out that this happens because when kvm_cma_reserve() is
> called, pageblock_order has not been initialised yet, and is still zero,
> causing the checks in cma_init_reserved_mem() against
> CMA_MIN_ALIGNMENT_PAGES to fail.
>
> Fix it by moving the call to kvm_cma_reserve() after initmem_init(). The
> pageblock_order is initialised in sparse_init() which is called from
> initmem_init().
>
> Also move the hugetlb CMA reservation.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Fixes: 11ac3e87ce09 ("mm: cma: use pageblock_order as the single alignment")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/setup-common.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index eb0077b302e2..1a02629ec70b 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -935,12 +935,6 @@ void __init setup_arch(char **cmdline_p)
>  	/* Print various info about the machine that has been gathered so far. */
>  	print_system_info();
>  
> -	/* Reserve large chunks of memory for use by CMA for KVM. */
> -	kvm_cma_reserve();
> -
> -	/*  Reserve large chunks of memory for us by CMA for hugetlb */
> -	gigantic_hugetlb_cma_reserve();
> -
>  	klp_init_thread_info(&init_task);
>  
>  	setup_initial_init_mm(_stext, _etext, _edata, _end);
> @@ -955,6 +949,13 @@ void __init setup_arch(char **cmdline_p)
>  
>  	initmem_init();
>  
> +	/*
> +	 * Reserve large chunks of memory for use by CMA for KVM and hugetlb. These must
> +	 * be called after initmem_init(), so that pageblock_order is initialised.
> +	 */
> +	kvm_cma_reserve();
> +	gigantic_hugetlb_cma_reserve();
> +
>  	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
>  
>  	if (ppc_md.setup_arch)
> -- 
> 2.35.3
