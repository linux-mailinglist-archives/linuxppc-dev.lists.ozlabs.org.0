Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 004876A11ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 22:25:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN5fN5yT4z3chK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 08:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AwQJUMxN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AwQJUMxN;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN5dP4Q0wz3cGv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 08:24:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677187481; x=1708723481;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mVoVfL5vlPHnSouV6VBABWbzjtaVYznfmLZ6wrrIyJs=;
  b=AwQJUMxNqJ31wQmhtGu0LSCBEtlwnqGAvdAIFyBRZBKBK3+aWfFUiF9X
   03q759M+DBnAdbY+8b9eQiK5uolkUlvDVpkDS7RzKHuQ2h5LiZOKpaEKz
   aLbclSdMXHVg07oqNzUhwZ/C7ryf40wDfDi27ASLY9m4oYgmtJAr/gXzY
   heDB3vkML0VGe2MPyHlO7VAV+DW0onDHuGJR22ImlFFFTYNf1ddfSXoAA
   Y8RVIq+AEuN3M3Cq8+brt3mX6HT/xf/FSZ6cZVrY3GqZog10xH6zWgE2Z
   gSHVEDdtVsRgSadN2K1EXGjzAm8VTUzrq2D1/amCt5msNJi59X67Pazu+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332006830"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="332006830"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 13:24:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="665941632"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="665941632"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.25.22]) ([10.213.25.22])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 13:24:21 -0800
Message-ID: <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
Date: Thu, 23 Feb 2023 22:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
To: Peter Zijlstra <peterz@infradead.org>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22.02.2023 18:04, Peter Zijlstra wrote:
> On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
> 
>> Andrzej Hajda (7):
>>    arch: rename all internal names __xchg to __arch_xchg
>>    linux/include: add non-atomic version of xchg
>>    arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
>>    llist: simplify __llist_del_all
>>    io_uring: use __xchg if possible
>>    qed: use __xchg if possible
>>    drm/i915/gt: use __xchg instead of internal helper
> 
> Nothing crazy in here I suppose, I somewhat wonder why you went through
> the trouble, but meh.

If you are asking why I have proposed this patchset, then the answer is 
simple, 1st I've tried to find a way to move internal i915 helper to 
core (see patch 7).
Then I was looking for possible other users of this helper. And 
apparently there are many of them, patches 3-7 shows some.


> 
> You want me to take this through te locking tree (for the next cycle,
> not this one) where I normally take atomic things or does someone else
> want this?

If you could take it I will be happy.

Regards
Andrzej

