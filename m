Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C369189A260
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 18:22:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G7ZLMzHI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB3fT4PVmz3vb8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 03:22:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G7ZLMzHI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Sat, 06 Apr 2024 03:21:28 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB3dh6whDz3cHN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 03:21:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712334089; x=1743870089;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=STODT/c3z6ypoEyUkP1OAtZ6EfyLMQK08sm/bPAw1AU=;
  b=G7ZLMzHIbp5lbXebvWLbxwlXUc8nCT1tfgJEWJqyXMdx09hUhDXbsw0p
   Mnky6nLUw9dH4d46hbpDtfwF2NNRu7x9VXIZozQ55QFodjkfNU3LAB3Di
   GOhFykyO7MoTL0i1X4pp/WoizP24Kjin8nQfEKXsT5GgkfcC62H303ek4
   a3a7XuW3rOJ22RWB/1EcVo5oTkdX0hPtkooMHaxdSM2Lo3iSblJJzFeg/
   yBt+jvVDVvU9qh6ujRmsUdkDXhq5cEX9Ixv1P33Z5mvZ/+ow+NHUioWBj
   iK1KQgdHHvaiWHICqsdr8Gkj6z12F2oU34Cofsl8aQZ6GfN/5DUDjxwMM
   A==;
X-CSE-ConnectionGUID: l+bhOETKQ4i7QLN22fXuBw==
X-CSE-MsgGUID: Fak0vw+tS5+l6b48GBf1vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11462799"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="11462799"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 09:20:21 -0700
X-CSE-ConnectionGUID: EGOUsw1jS4iffZcF7In7vA==
X-CSE-MsgGUID: OzVkpaElRkSa/fAWFgBa3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19141333"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.80.70]) ([10.245.80.70])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 09:20:15 -0700
Message-ID: <340d23fc-7abf-4ad0-bd95-f1760b9ac458@intel.com>
Date: Fri, 5 Apr 2024 18:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
 <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
 <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net> <87r0fjc1cz.fsf@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <87r0fjc1cz.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05.04.2024 16:47, Jani Nikula wrote:
> On Mon, 27 Feb 2023, Peter Zijlstra <peterz@infradead.org> wrote:
>> On Thu, Feb 23, 2023 at 10:24:19PM +0100, Andrzej Hajda wrote:
>>> On 22.02.2023 18:04, Peter Zijlstra wrote:
>>>> On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
>>>>
>>>>> Andrzej Hajda (7):
>>>>>     arch: rename all internal names __xchg to __arch_xchg
>>>>>     linux/include: add non-atomic version of xchg
>>>>>     arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
>>>>>     llist: simplify __llist_del_all
>>>>>     io_uring: use __xchg if possible
>>>>>     qed: use __xchg if possible
>>>>>     drm/i915/gt: use __xchg instead of internal helper
>>>> Nothing crazy in here I suppose, I somewhat wonder why you went through
>>>> the trouble, but meh.
>>> If you are asking why I have proposed this patchset, then the answer is
>>> simple, 1st I've tried to find a way to move internal i915 helper to core
>>> (see patch 7).
>>> Then I was looking for possible other users of this helper. And apparently
>>> there are many of them, patches 3-7 shows some.
>>>
>>>
>>>> You want me to take this through te locking tree (for the next cycle,
>>>> not this one) where I normally take atomic things or does someone else
>>>> want this?
>>> If you could take it I will be happy.
>> OK, I'll go queue it in tip/locking/core after -rc1. Thanks!
> Is this where the series fell between the cracks, or was there some
> follow-up that I missed?
>
> I think this would still be useful. Andrzej, would you mind rebasing and
> resending if there are no objections?

The patchset was rejected/dropped by Linus at the pull-request stage.
He didn't like many things, but the most __xchg name. However he was 
quite positive about i915 name fetch_and_zero.
I can try to revive patchset with fetch_and_zero, and maybe 
fetch_and_set, instead of __xchg.

Regards
Andrzej

>
> BR,
> Jani.
>
>

