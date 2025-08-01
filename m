Return-Path: <linuxppc-dev+bounces-10511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B5B18441
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 16:53:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btpqG6LPsz2yfL;
	Sat,  2 Aug 2025 00:53:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754060010;
	cv=none; b=l0h47rtdNMly6WbixULr+T+symiUcO8AB8DFYIRuOZ4XNgVOyAgL9z7h81s40ehTqbctoUUu8aed0yHycUOiuNtxiyDuDdO8R3NfG+sXOv0eaEXi1zo/g+eJz4n+ymoTvuK0kckjeojbvlHkZi8FO0xzRy2UMGU+6Z44/PWPbzRNHlXiFx4THlbkUM9emHEva8q7cGV9Oq1hCn/oS9BauRdiSZ5W6hwnD9lPryEMCfJRIzifolb/EzjP3a9B3zQ9/ChpD9B1lkjAZ+LM7AkBRdViZ8az+JkxZvBN/qfM8h/BGOzT6PJEYkk1L5CDLVsonzDdrw89UF9u8EBQDcKKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754060010; c=relaxed/relaxed;
	bh=ADDPtUToLP1PL4w/rddTfZ4yahs/srP5rxSdZmpIW64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anuV52YoqmBBN9h6ZaWY2n86R8NKknobBmXTbXdZCCNS+eOnUyXTogu/ScWvDB8pObSBcfgXeeJD7hC3vqFCXCQIdRqVWZSQNqiEDwJqNTMWRmzT14MBf0HVZYQ76UzeCGSfvMsanQoApCkNpfc5eiOfnq90+C9p8pMw/1/wkg0DrRX85mhFaLBFxkZc0Ygo6LfLZLuqAp4xDYOmeyfVtyyMKnzqtK4JDGrVdok5eW+6hTAf+NTafDYHrCrlDvLYRMXQ2IR4QAXo5dXp3dmvmAMaDyDNI97b7JrUSojIPbK/56cen833W8XAtQQGa30WCeu0dIMHRgWDbW/Kq3+wyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jur77nIt; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jur77nIt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 02 Aug 2025 00:53:28 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btpqD4KZnz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 00:53:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754060008; x=1785596008;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sBCCqUHyxvz+lx9/+L/ZjF2F6jrGowmd9wNhC0XHTCo=;
  b=jur77nItprdxQZwGpwiWlKC7BN7d3y7fOtPdn9a+KTilGr2iM8eSRPt7
   d7XS+QH46itSnLxtx3YxUBO+dZVev2k8m6rOUcLHOdO6Ux7zeUiSm2XvU
   LJSBIF3Cpw0ofRhO45eV+H7O/DNXIKItN5rV4mi7Y+FzpCp0RTsGX4es3
   GSzt4f8FZo8iYU+SZSKva0BAuXjFNa5OsDriVWDWh6olqx4mKv6ZKpnM0
   oXmLSi6Y2SAYnP1kkgsZms+RrgJKrid8p51wWAWgsq3T7xEAi6dgRSTaO
   MpgM5+DaX+eEiI39tgjtOg2wHwxCgnPMsIG8YWX7J5PJJMSZrLgVxfqpY
   Q==;
X-CSE-ConnectionGUID: njgjbnhxQLikW5+SL3dMjA==
X-CSE-MsgGUID: 8YVq5yWwT9u1Z4IsmNsSJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55468002"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="55468002"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 07:52:18 -0700
X-CSE-ConnectionGUID: Nl9OPwNcQKKMMDbkvbHtxA==
X-CSE-MsgGUID: 1BXYkWYaTV2Xzf1rXpYVdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="162864754"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [10.125.109.249]) ([10.125.109.249])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 07:52:18 -0700
Message-ID: <85663f65-d746-4e2c-b8a6-d594d9d0ba42@intel.com>
Date: Fri, 1 Aug 2025 07:52:17 -0700
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] vmcoreinfo: Track and log recoverable hardware errors
To: Breno Leitao <leitao@debian.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Robert Moore <robert.moore@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 acpica-devel@lists.linux.dev, osandov@osandov.com,
 xueshuai@linux.alibaba.com, konrad.wilk@oracle.com,
 linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, kernel-team@meta.com, osandov@fb.com
References: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/1/25 05:31, Breno Leitao wrote:
> Introduce a generic infrastructure for tracking recoverable hardware
> errors (HW errors that are visible to the OS but does not cause a panic)
> and record them for vmcore consumption.
...

Are there patches for the consumer side of this, too? Or do humans
looking at crash dumps have to know what to go digging for?

In either case, don't we need documentation for this new ABI?

> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 4da4eab56c81d..f85759453f89a 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -45,6 +45,7 @@
>  #include <linux/task_work.h>
>  #include <linux/hardirq.h>
>  #include <linux/kexec.h>
> +#include <linux/vmcore_info.h>
>  
>  #include <asm/fred.h>
>  #include <asm/cpu_device_id.h>
> @@ -1690,6 +1691,9 @@ noinstr void do_machine_check(struct pt_regs *regs)
>  	}
>  
>  out:
> +	/* Given it didn't panic, mark it as recoverable */
> +	hwerr_log_error_type(HWERR_RECOV_MCE);
> +

Does "MCE" mean anything outside of x86?

I wonder if this would be better left as "HWERR_RECOV_ARCH" or something.

...
> +void hwerr_log_error_type(enum hwerr_error_type src)
> +{
> +	if (src < 0 || src >= HWERR_RECOV_MAX)
> +		return;
> +
> +	/* No need to atomics/locks given the precision is not important */

Sure, but it's not even more lines of code to do:

	atomic_inc(&hwerr_data[src].count);
	WRITE_ONCE(hwerr_data[src].timestamp, ktime_get_real_seconds());

So why not?

> +	hwerr_data[src].count++;
> +	hwerr_data[src].timestamp = ktime_get_real_seconds();
> +}
> +EXPORT_SYMBOL_GPL(hwerr_log_error_type);

I'd also love to hear more about _actual_ users of this. Surely, someone
hit a real world problem and thought this would be a nifty solution. Who
was that? What problem did they hit? How does this help them?

