Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96809BBD40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:44:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cbsx3WJxzDqL7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:44:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="LXy6huOI"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cbqY49qrzDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:42:49 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d892e4c0000>; Mon, 23 Sep 2019 13:42:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 13:42:46 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 23 Sep 2019 13:42:46 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:42:45 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:42:45 +0000
Subject: Re: [PATCH v2 01/11] powerpc/mm: Adds counting method to monitor
 lockless pgtable walks
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-2-leonardo@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <90ceb0ca-9f04-65a5-586c-e37c2ecc6e4e@nvidia.com>
Date: Mon, 23 Sep 2019 13:42:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920195047.7703-2-leonardo@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569271372; bh=Li60fdWyAuxpYrBISj31o/hEnESDTi29YgSDXJ6CkSo=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=LXy6huOIeYa212ed1LaHWz9y2UlvW6A3MhQMPrhvKHJLYakDh3GDA8Z+DFaFI7fev
 7Y815JiGsuqX2HcRvxrUZwLjt+Tf4AV/Ecc2ZAxpG9Nsq7Hxv2JtXF22ZLdDtSpmIa
 NC27Od6YC+rtxBoWQXPiL3HdZLW/eZAti36WkrdwlyO2djBw7kHPRPo5sPFuHtDNV+
 sBNnSPijth3EWRe6Yb7FeqTplAVmP4/ZqXsOpoCgf4IjAcnAaRpIXQusvCBW10U2lA
 awL3IvrK+RwZllj+nEpeLgxumXbhSlDlgp9K1EHxY4lf0ZEu0xicefcT2gZjGMycer
 Gj7PE/xIhogeQ==
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>,
 Keith Busch <keith.busch@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/19 12:50 PM, Leonardo Bras wrote:
> It's necessary to monitor lockless pagetable walks, in order to avoid doing
> THP splitting/collapsing during them.
> 
> Some methods rely on local_irq_{save,restore}, but that can be slow on
> cases with a lot of cpus are used for the process.
> 
> In order to speedup some cases, I propose a refcount-based approach, that
> counts the number of lockless pagetable	walks happening on the process.
> 
> This method does not exclude the current irq-oriented method. It works as a
> complement to skip unnecessary waiting.
> 
> start_lockless_pgtbl_walk(mm)
> 	Insert before starting any lockless pgtable walk
> end_lockless_pgtbl_walk(mm)
> 	Insert after the end of any lockless pgtable walk
> 	(Mostly after the ptep is last used)
> running_lockless_pgtbl_walk(mm)
> 	Returns the number of lockless pgtable walks running
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/mmu.h |  3 +++
>  arch/powerpc/mm/book3s64/mmu_context.c   |  1 +
>  arch/powerpc/mm/book3s64/pgtable.c       | 17 +++++++++++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index 23b83d3593e2..13b006e7dde4 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -116,6 +116,9 @@ typedef struct {
>  	/* Number of users of the external (Nest) MMU */
>  	atomic_t copros;
>  
> +	/* Number of running instances of lockless pagetable walk*/
> +	atomic_t lockless_pgtbl_walk_count;
> +
>  	struct hash_mm_context *hash_context;
>  
>  	unsigned long vdso_base;
> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> index 2d0cb5ba9a47..3dd01c0ca5be 100644
> --- a/arch/powerpc/mm/book3s64/mmu_context.c
> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> @@ -200,6 +200,7 @@ int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>  #endif
>  	atomic_set(&mm->context.active_cpus, 0);
>  	atomic_set(&mm->context.copros, 0);
> +	atomic_set(&mm->context.lockless_pgtbl_walk_count, 0);
>  
>  	return 0;
>  }
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 7d0e0d0d22c4..13239b17a22c 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -98,6 +98,23 @@ void serialize_against_pte_lookup(struct mm_struct *mm)
>  	smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
>  }
>  

Somewhere, there should be a short comment that explains how the following functions
are meant to be used. And it should include the interaction with irqs, so maybe
if you end up adding that combined wrapper function that does both, that's 
where the documentation would go. If not, then here is probably where it goes.


> +void start_lockless_pgtbl_walk(struct mm_struct *mm)
> +{
> +	atomic_inc(&mm->context.lockless_pgtbl_walk_count);
> +}
> +EXPORT_SYMBOL(start_lockless_pgtbl_walk);
> +
> +void end_lockless_pgtbl_walk(struct mm_struct *mm)
> +{
> +	atomic_dec(&mm->context.lockless_pgtbl_walk_count);
> +}
> +EXPORT_SYMBOL(end_lockless_pgtbl_walk);
> +
> +int running_lockless_pgtbl_walk(struct mm_struct *mm)
> +{
> +	return atomic_read(&mm->context.lockless_pgtbl_walk_count);
> +}
> +


thanks,
-- 
John Hubbard
NVIDIA
