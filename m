Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D763BBD3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:42:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cbqB0Cj8zDqJh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:42:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="C7EsM4V7"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cblm6lkyzDqDP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:39:32 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d892d870001>; Mon, 23 Sep 2019 13:39:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 13:39:28 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 23 Sep 2019 13:39:28 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:39:28 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:39:27 +0000
Subject: Re: [PATCH v2 02/11] asm-generic/pgtable: Adds dummy functions to
 monitor lockless pgtable walks
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-3-leonardo@linux.ibm.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <cb7d4196-c646-82c7-d61f-b28ee9ab47b9@nvidia.com>
Date: Mon, 23 Sep 2019 13:39:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920195047.7703-3-leonardo@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569271175; bh=Pnu3kUZV3qnISw7hfrecREvkI45tr1IL6gigaYXJdN4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=C7EsM4V7A5bMzR1+axYe1tYH7s4JTQUSBGE2/8ldsuzTZ+4p/yBgUycF9NULvu+zs
 usyEu8Cv3mGjoSeV1Cpr9xYG29lHU55L2yoMJZGQRaSpmrd3Oq63YcMXiU1VFm7SWo
 Ah32v/KzRTmMyNdt59SMGwr/bZeuDmYV6Xa37ZAy9dJkb+TPRsCK4uRqND//sHvb9i
 TA7OFxydEUsnPdxGoOdPtVslJmrJYrKs8rWwd+0LOnH0i1febGq6ZNOrc64fYQvi8J
 xUzAkYgnb/7HR3dQVPqxHUKONC4uX83GTW6KfweEkOmpiARuLlkj4ip0LPYCvAZk43
 Sm6LYexcDtGAw==
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
 Richard Fontana <rfontana@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/19 12:50 PM, Leonardo Bras wrote:
> There is a need to monitor lockless pagetable walks, in order to avoid
> doing THP splitting/collapsing during them.
> 
> Some methods rely on local_irq_{save,restore}, but that can be slow on
> cases with a lot of cpus are used for the process.
> 
> In order to speedup these cases, I propose a refcount-based approach, that
> counts the number of lockless pagetable	walks happening on the process.
> 
> Given that there are lockless pagetable walks on generic code, it's
> necessary to create dummy functions for archs that won't use the approach.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  include/asm-generic/pgtable.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
> index 75d9d68a6de7..6eb4fabb5595 100644
> --- a/include/asm-generic/pgtable.h
> +++ b/include/asm-generic/pgtable.h
> @@ -1172,6 +1172,15 @@ static inline bool arch_has_pfn_modify_check(void)
>  #endif
>  #endif
>  
> +#ifndef __HAVE_ARCH_LOCKLESS_PGTBL_WALK_COUNTER
> +static inline void start_lockless_pgtbl_walk(struct mm_struct *mm) { }
> +static inline void end_lockless_pgtbl_walk(struct mm_struct *mm) { }
> +static inline int running_lockless_pgtbl_walk(struct mm_struct *mm)
> +{
> +	return 0;
> +}
> +#endif
> +

Please remember to include linux-mm if there is a v2.

Nit: seems like it would be nicer to just put it all in one place, and use
positive logic, and also I think people normally don't compress the empty
functions quite that much. So like this:

#ifdef __HAVE_ARCH_LOCKLESS_PGTBL_WALK_COUNTER
void start_lockless_pgtbl_walk(struct mm_struct *mm); 
void end_lockless_pgtbl_walk(struct mm_struct *mm); 
int running_lockless_pgtbl_walk(struct mm_struct *mm); 

#else
static inline void start_lockless_pgtbl_walk(struct mm_struct *mm)
{
}
static inline void end_lockless_pgtbl_walk(struct mm_struct *mm)
{
}
static inline int running_lockless_pgtbl_walk(struct mm_struct *mm)
{
	return 0;
}
#endif

thanks,
-- 
John Hubbard
NVIDIA
