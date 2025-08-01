Return-Path: <linuxppc-dev+bounces-10513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A5B185B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 18:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btrrg2vXFz2ymc;
	Sat,  2 Aug 2025 02:24:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754065491;
	cv=none; b=Zgo0bF4FGsEof99tdyoKL4dGcOF2WVNa2ZnGfPlj1tCYFF21lZypJyjf7FInxPHdU1U4ZnMa8fi/0Vt/DFWKqppuztTFzQu4dowzGcMKcI4GOMV8Xg1a/vwhMjE6Q6aDahbK2TyjF4VkCke71n+wiQA5OLSRCaJSZMBs+n8AQnNfDp6fkKeKZkuREgmEsWR5aRDAhsk4cUQ6/w6v/IKCjLd97IhzsbahKPn9bNqIHO5bhG4kiXWhyGnQ9xyJwZwnYFi+0j5++5g6ytXgZ10ZQkiE96mGSHzzjEJJGw6a+j34+zYprDW+yULAD6OnnAzOsyzu6mtcuXYdSzjkLuhI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754065491; c=relaxed/relaxed;
	bh=dYKy+DYgJIL0WcbXx334fdhnfFBg+KkWDvb1qZS3vfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=du543Sdxl0/4qUl+5hu27tDdTX4QjyJ6FpeoIvPF7yxF6JqeDq+09riBPWXlxO/ZUAoTmUmtNjmu+4i+PERpaWau09QG/8BIdJM0eR+6cLCIGQGzXxnnkyGjh4leZiYFFKFS1gs09LkMFIsbO2JJpE0poujRsHtBnx1bdw222qLOsy9JyGNvEgXW67gZbWdmvwj237pd/4Ndu3ibnesXyqySFB+9qbyPGS8PUriQ1A2auWcRXhnfH/Y5N7/ZYyAQWF5kYunMvTJPnW0uGjFfxkCHgvgvShweD9XKJOoGojJz0CksirWrct9/e7AtCRDSuFWQSOM8jA46JrbV5lYn3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jUWWLgN2; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jUWWLgN2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btrrd0pjcz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 02:24:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754065489; x=1785601489;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L65KpuFKY95nCG2r6EZ5ou3o2QbJ7zPptgi7NLjCcqo=;
  b=jUWWLgN2CzFccPBYbd06mrCADn1xTxH2GS9e72gKzadu3kQI2OTLTb5o
   xvFnCpAuWoLPVmLkYPVoc+J6t8MCLqdegUwAWnWGz8U8LaaZej01M2Mxn
   qI99Q+CA0kk5rQCskqRRdObHQ5ncrhAxEZ6dcp69HG1B0Szaq41kEx+Gf
   HVYNs0deb4EYtJPcGAn9fWhVT721grgvElz9YYGRBu3JhxqDNzxjN0Dvp
   q+0bwnXVtcySOoj05AcpBcqYx1qRSrJbaqJVgNuFFL/BvfXGFIe6szDRJ
   Fnw5tyiVBPQMS+ioziAECUomWSHJCoKdtSfZDPacDu9AD1z+owCTEBWp9
   g==;
X-CSE-ConnectionGUID: wcWvPJBpTXGFAng+CE6vow==
X-CSE-MsgGUID: dTzvGQNdTqajmvnPTssBJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73875466"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="73875466"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 09:24:44 -0700
X-CSE-ConnectionGUID: pkbxLzpfRCe64/Km9bHfPg==
X-CSE-MsgGUID: RSAUU9XwRUSz69D2Ut2enw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163949953"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [10.125.109.249]) ([10.125.109.249])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 09:24:44 -0700
Message-ID: <0c045f1b-44d0-430c-9e8a-58b65dd84453@intel.com>
Date: Fri, 1 Aug 2025 09:24:43 -0700
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
To: Breno Leitao <leitao@debian.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Robert Moore <robert.moore@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 acpica-devel@lists.linux.dev, osandov@osandov.com,
 xueshuai@linux.alibaba.com, konrad.wilk@oracle.com,
 linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, kernel-team@meta.com, osandov@fb.com
References: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
 <85663f65-d746-4e2c-b8a6-d594d9d0ba42@intel.com>
 <f3yl424iqiyctgz4j36hzjrhkgae3a2h5smhalm2qbmq3nrpzd@oeuprthscfez>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <f3yl424iqiyctgz4j36hzjrhkgae3a2h5smhalm2qbmq3nrpzd@oeuprthscfez>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/1/25 08:13, Breno Leitao wrote:
> Hello Dave,
> 
> On Fri, Aug 01, 2025 at 07:52:17AM -0700, Dave Hansen wrote:
>> On 8/1/25 05:31, Breno Leitao wrote:
>>> Introduce a generic infrastructure for tracking recoverable hardware
>>> errors (HW errors that are visible to the OS but does not cause a panic)
>>> and record them for vmcore consumption.
>> ...
>>
>> Are there patches for the consumer side of this, too? Or do humans
>> looking at crash dumps have to know what to go digging for?
>>
>> In either case, don't we need documentation for this new ABI?
> 
> I have considered this, but the documentation for vmcoreinfo
> (admin-guide/kdump/vmcoreinfo.rst) solely documents what is explicitly
> exposed by vmcore, which differs from the nature of these counters.
> 
> Where would be a good place to document it?

I'm not picky. But you also didn't quite answer the question I was asking.

Is this new data for humans or machines to read?

>>> @@ -1690,6 +1691,9 @@ noinstr void do_machine_check(struct pt_regs *regs)
>>>  	}
>>>  
>>>  out:
>>> +	/* Given it didn't panic, mark it as recoverable */
>>> +	hwerr_log_error_type(HWERR_RECOV_MCE);
>>> +
>>
>> Does "MCE" mean anything outside of x86?
> 
> AFAIK this is a MCE concept.

I'm not really sure what that response means.

There are two problems here. First is that HWERR_RECOV_MCE is defined in
arch-generic code, but it may never get used by anything other than x86
when CONFIG_X86_MCE.

That also completely wastes space in your data structure when
HWERR_RECOV_MCE=n. Not a huge deal as-is, but it's still a bit sloppy
and wasteful.

...
>>> +	hwerr_data[src].count++;
>>> +	hwerr_data[src].timestamp = ktime_get_real_seconds();
>>> +}
>>> +EXPORT_SYMBOL_GPL(hwerr_log_error_type);
>>
>> I'd also love to hear more about _actual_ users of this. Surely, someone
>> hit a real world problem and thought this would be a nifty solution. Who
>> was that? What problem did they hit? How does this help them?
> 
> Yes, this has been extensively discussed in the very first version of
> the patch. Borislav raised the same question, which was discussed in the
> following link:
> 
> https://lore.kernel.org/all/20250715125327.GGaHZPRz9QLNNO-7q8@fat_crate.local/

When someone raises a concern, we usually try to alleviate the concern
in a way that is self-contained in the next posting. A cover letter with
a full explanation would be one place to put the reasoning, for example.

But expecting future reviewers to plod through all the old threads isn't
really feasible.

