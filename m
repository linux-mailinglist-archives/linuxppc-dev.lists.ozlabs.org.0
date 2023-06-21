Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0633E738D79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 19:44:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=duef5UCO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmW8d6HrPz3bpG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 03:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=duef5UCO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 22 Jun 2023 03:43:31 AEST
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmW7l1qj5z2xqK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 03:43:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687369411; x=1718905411;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=LVptCrukcCrf+ulAXv9iJ2UzZRi1STprNI7mWSySJig=;
  b=duef5UCOkpk326C86kqSIQKmjg4sWeL7xcw/FGiQBbGImH0Tyo3dUU58
   9xpA2UntmjIYS+fgl1fpnRmjPKniDlE50AHIBhDKrgyRzmUPOcxN/H2hS
   5u3ZQ2Zd+fpEltOyK7Bv1f5HXE4k5z17XtF6PC5DAHYHY4A5pzWMUXCjf
   8JP8s7EJ9cVNfLLaKhbaGdqmWveRk6WgZxB5q+uQJ0hqUuvyiM7diyddt
   GGIjhd94WzUj/W8J3zy7XxjvMYLJjbYeOb7JN0miyWd4Gx2Bio0tVcGBj
   ccN9fzfIOMsdRrFzc8t8NtBOjkNsY+QNPvBqPEviVvygZXpj9Yr6XZTBJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="339870191"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="339870191"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 10:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="1044816796"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="1044816796"
Received: from rmathew-mobl2.amr.corp.intel.com (HELO [10.212.134.235]) ([10.212.134.235])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 10:42:16 -0700
Message-ID: <680fadba-9104-3914-5175-e207fd3d9246@intel.com>
Date: Wed, 21 Jun 2023 10:42:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to MM CPUs
Content-Language: en-US
To: Yair Podemsky <ypodemsk@redhat.com>, mtosatti@redhat.com,
 ppandit@redhat.com, david@redhat.com, linux@armlinux.org.uk,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, keescook@chromium.org,
 paulmck@kernel.org, frederic@kernel.org, will@kernel.org,
 peterz@infradead.org, ardb@kernel.org, samitolvanen@google.com,
 juerg.haefliger@canonical.com, arnd@arndb.de, rmk+kernel@armlinux.org.uk,
 geert+renesas@glider.be, linus.walleij@linaro.org,
 akpm@linux-foundation.org, sebastian.reichel@collabora.com, rppt@kernel.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20230620144618.125703-1-ypodemsk@redhat.com>
 <20230620144618.125703-3-ypodemsk@redhat.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230620144618.125703-3-ypodemsk@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/20/23 07:46, Yair Podemsky wrote:
> -void tlb_remove_table_sync_one(void)
> +#ifdef CONFIG_ARCH_HAS_CPUMASK_BITS
> +#define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
> +#else
> +#define REMOVE_TABLE_IPI_MASK cpu_online_mask
> +#endif /* CONFIG_ARCH_HAS_CPUMASK_BITS */
> +
> +void tlb_remove_table_sync_one(struct mm_struct *mm)
>  {
>  	/*
>  	 * This isn't an RCU grace period and hence the page-tables cannot be
> @@ -200,7 +206,8 @@ void tlb_remove_table_sync_one(void)
>  	 * It is however sufficient for software page-table walkers that rely on
>  	 * IRQ disabling.
>  	 */
> -	smp_call_function(tlb_remove_table_smp_sync, NULL, 1);
> +	on_each_cpu_mask(REMOVE_TABLE_IPI_MASK, tlb_remove_table_smp_sync,
> +			NULL, true);
>  }

That "REMOVE_TABLE_IPI_MASK" thing is pretty confusing.  It *looks* like
a constant.  It does *NOT* look at all like it consumes 'mm'.  Worst
case, just create a local variable:

	if (IS_ENABLED(CONFIG_ARCH_HAS_CPUMASK_BITS))
		ipi_mask = mm_cpumask(mm);
	else
		ipi_mask = cpu_online_mask;

	on_each_cpu_mask(ipi_mask, ...);

That's a billion times more clear and it'll compile down to the same thing.

I do think the CONFIG_ARCH_HAS_CPUMASK_BITS naming is also pretty
confusing, but I don't have any better suggestions.  Maybe something
with "MM_CPUMASK" in it?
