Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BDB986C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 22:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zlcf2Yy7zF3fm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 06:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.143; helo=hqemgate14.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="NYjSKTkx"; 
 dkim-atps=neutral
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Sat, 21 Sep 2019 06:16:44 AEST
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZlNr6TXXzDrcZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 06:16:44 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d8532710000>; Fri, 20 Sep 2019 13:11:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Sep 2019 13:11:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Sep 2019 13:11:27 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Sep
 2019 20:11:26 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Sep
 2019 20:11:26 +0000
Subject: Re: [PATCH v2 11/11] powerpc/mm/book3s64/pgtable: Uses counting
 method to skip serializing
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-12-leonardo@linux.ibm.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1b39eaa7-751d-40bc-d3d7-41aaa15be42a@nvidia.com>
Date: Fri, 20 Sep 2019 13:11:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920195047.7703-12-leonardo@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569010289; bh=giG+LNXXjbxC8WeWVOxqvbRTNUbcye64zKROed7j1Rg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=NYjSKTkxR8Jv6mSyw8EQkBGsZs803apm76OV+kHnRZvgWtL7vdyeOgJFPWrdZVlGw
 gSHUXjlJFto0hTReKy3pknzVrWuO3+RGr0YOz5KSP86cQnNH8S5JatSIsTMGAkkmWW
 pv4tbuSfV1a9bENaBlTlyh90zz3HNLImV52S08ggCk7l+yzWEjH3b5O8PnoyNCQXwE
 A7dag24QsGttajumytUUX7cwL0EmesArdr8vrY/HWT91aFhSYPFckCBC+5tYeD40Dz
 jzzGdnLKg9L+gFeoP6qyyZo4GnWTeSfIZjEhMMrLjQNLRSVCLwNCX3Rh0FVzEo4p5R
 IukfxuSI3PC2Q==
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
> Skips slow part of serialize_against_pte_lookup if there is no running
> lockless pagetable walk.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/pgtable.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 13239b17a22c..41ca30269fa3 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -95,7 +95,8 @@ static void do_nothing(void *unused)
>  void serialize_against_pte_lookup(struct mm_struct *mm)
>  {
>  	smp_mb();
> -	smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
> +	if (running_lockless_pgtbl_walk(mm))
> +		smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);

Hi,

If you do this, then you are left without any synchronization. So it will
have race conditions: a page table walk could begin right after the above
check returns "false", and then code such as hash__pmdp_huge_get_and_clear()
will continue on right away, under the false assumption that it has let
all the current page table walks complete.

The current code uses either interrupts or RCU to synchronize, and in
either case, you end up scheduling something on each CPU. If you remove
that entirely, I don't see anything left. ("Pure" atomic counting is not
a synchronization technique all by itself.)

thanks,
-- 
John Hubbard
NVIDIA

>  }
>  
>  void start_lockless_pgtbl_walk(struct mm_struct *mm)
> 
