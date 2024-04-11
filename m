Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5985E8A0BCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 11:04:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lGL4GD0a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFYg61HhSz3vZg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 19:04:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lGL4GD0a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFYfK1K2jz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 19:04:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712826250; x=1744362250;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=psBauhL+pjKeENmsetnmfnJUWvmR2xRdeP4w3fPxpxw=;
  b=lGL4GD0aL7ud0pmg64Cw++T1SEoFc7z2Dns2aFGkfjmBi1KXcRa7WLdF
   pc+3diADn/G0D72nm6tTrOFrBhIIT6sSso9m8T2WCc6s+dIIip12TsCu0
   f0AGsLHKnB8nD4n2riaBY15mMyhc/TNaMo8WuQeijwWmcTfIgPSQEjide
   oxKYF0AG82vCyNL+AoDYu8tIrYMvACmVAgHSx9WbP88ayLZ1Y5VillQRo
   NCJzIoxCG4oh+KiWG1zxSWtiMrLFew/HolR6ERoKH+AewWyLQNaYeClox
   o5atO2nnXrd60Tunse5s77pp09GzVyOUvH7LE1SZwxN8HoLJO+W/jJrF7
   A==;
X-CSE-ConnectionGUID: c5sSIMzjTdSnAitYYGRwcw==
X-CSE-MsgGUID: A3qxNRh7QnGJN7iZpS2yxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11186370"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="11186370"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:04:02 -0700
X-CSE-ConnectionGUID: jxyzJahlR7mafm9v/t3HUQ==
X-CSE-MsgGUID: 7WEppJyAQbCpQrc3PO3miw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20799716"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.215.66])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:03:56 -0700
Message-ID: <0fd5e869-720f-41bb-9f0f-c0f3925ffc1b@intel.com>
Date: Thu, 11 Apr 2024 12:03:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
To: Arnd Bergmann <arnd@arndb.de>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
 <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
 <cac3f357-0dc2-46ba-9ea0-7b1f4278e8ff@app.fastmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <cac3f357-0dc2-46ba-9ea0-7b1f4278e8ff@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/04/24 10:56, Arnd Bergmann wrote:
> On Thu, Apr 11, 2024, at 09:16, Adrian Hunter wrote:
>> On 11/04/24 10:04, Arnd Bergmann wrote:
>>> On Wed, Apr 10, 2024, at 17:32, Adrian Hunter wrote:
>>>> BUG() does not return, and arch implementations of BUG() use unreachable()
>>>> or other non-returning code. However with !CONFIG_BUG, the default
>>>> implementation is often used instead, and that does not do that. x86 always
>>>> uses its own implementation, but powerpc with !CONFIG_BUG gives a build
>>>> error:
>>>>
>>>>   kernel/time/timekeeping.c: In function ‘timekeeping_debug_get_ns’:
>>>>   kernel/time/timekeeping.c:286:1: error: no return statement in function
>>>>   returning non-void [-Werror=return-type]
>>>>
>>>> Add unreachable() to default !CONFIG_BUG BUG() implementation.
>>>
>>> I'm a bit worried about this patch, since we have had problems
>>> with unreachable() inside of BUG() in the past, and as far as I
>>> can remember, the current version was the only one that
>>> actually did the right thing on all compilers.
>>>
>>> One problem with an unreachable() annotation here is that if
>>> a compiler misanalyses the endless loop, it can decide to
>>> throw out the entire code path leading up to it and just
>>> run into undefined behavior instead of printing a BUG()
>>> message.
>>>
>>> Do you know which compiler version show the warning above?
>>
>> Original report has a list
>>
> 
> It looks like it's all versions of gcc, though no versions
> of clang show the warnings. I did a few more tests and could
> not find any differences on actual code generation, but
> I'd still feel more comfortable changing the caller than
> the BUG() macro. It's trivial to add a 'return 0' there.

AFAICT every implementation of BUG() except this one has
unreachable() or equivalent, so that inconsistency seems
wrong.

Could add 'return 0', but I do notice other cases
where a function does not have a return value, such as
cpus_have_final_boot_cap(), so there is already an expectation
that that is OK.

> Another interesting observation is that clang-11 and earlier
> versions end up skipping the endless loop, both with and
> without the __builtin_unreachable, see
> https://godbolt.org/z/aqa9zqz8x

Adding volatile asm("") to the loop would probably fix that,
but it seems like a separate issue.

> 
> clang-12 and above do work like gcc, so I guess that is good.
> 
>      Arnd

