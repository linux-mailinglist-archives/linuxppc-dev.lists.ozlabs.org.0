Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A589A027
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 16:48:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YxUhgiNo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB1Zv0wFgz3vbV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 01:48:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YxUhgiNo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB1Z62zgLz3d24
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 01:48:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712328495; x=1743864495;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=LreOfBm3nT3gJWEyzyhSzgs3L/UNn7htcugC08IxS+o=;
  b=YxUhgiNoYA3d6XHZ9LgH0W+FzgwKr0UCrXOZQFEwogCxdzHBaIzomOpS
   Zqj/KYif/8zgypJUd2DhGjqWuSFv15GquF2Fg7ONYCyS4rGFQQkhnmr24
   XLCL+k1YWKjOpdaSzAb04WCZy6vYE5J5FeWi9GccEwhr1OKA8kS9YGtzn
   2VSCNViQKboMAEDDuU61RprhcrxRmk6pCdbfD0oUGmJCszXxHmlKsSS1A
   Hu3Do1JlaZx5+F2Ia/kGO2pd2e7i4SaZ6NrgCEAzPAyHvD3LVRNYz8sQY
   TlyQpn8RptBUKwcwfjbono/8g7WCmDLBMlPzdL9pCHvTSQWdlAnDC1v5d
   Q==;
X-CSE-ConnectionGUID: 0LV9QrspSsiovx9xl23v+A==
X-CSE-MsgGUID: gzYbBr/nToSfCRDJjlFvLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11478912"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="11478912"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 07:48:09 -0700
X-CSE-ConnectionGUID: H55LyW5ASaqr4vhL9J0MYQ==
X-CSE-MsgGUID: +963A5O0TASYUpMZv+tuJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="23821308"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.41.202])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 07:47:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
In-Reply-To: <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
 <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
 <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net>
Date: Fri, 05 Apr 2024 17:47:56 +0300
Message-ID: <87r0fjc1cz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 27 Feb 2023, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Feb 23, 2023 at 10:24:19PM +0100, Andrzej Hajda wrote:
>> On 22.02.2023 18:04, Peter Zijlstra wrote:
>> > On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
>> > 
>> > > Andrzej Hajda (7):
>> > >    arch: rename all internal names __xchg to __arch_xchg
>> > >    linux/include: add non-atomic version of xchg
>> > >    arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
>> > >    llist: simplify __llist_del_all
>> > >    io_uring: use __xchg if possible
>> > >    qed: use __xchg if possible
>> > >    drm/i915/gt: use __xchg instead of internal helper
>> > 
>> > Nothing crazy in here I suppose, I somewhat wonder why you went through
>> > the trouble, but meh.
>> 
>> If you are asking why I have proposed this patchset, then the answer is
>> simple, 1st I've tried to find a way to move internal i915 helper to core
>> (see patch 7).
>> Then I was looking for possible other users of this helper. And apparently
>> there are many of them, patches 3-7 shows some.
>> 
>> 
>> > 
>> > You want me to take this through te locking tree (for the next cycle,
>> > not this one) where I normally take atomic things or does someone else
>> > want this?
>> 
>> If you could take it I will be happy.
>
> OK, I'll go queue it in tip/locking/core after -rc1. Thanks!

Is this where the series fell between the cracks, or was there some
follow-up that I missed?

I think this would still be useful. Andrzej, would you mind rebasing and
resending if there are no objections?

BR,
Jani.


-- 
Jani Nikula, Intel
