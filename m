Return-Path: <linuxppc-dev+bounces-753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F15B2964A27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 17:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvljG5NyWz2yDl;
	Fri, 30 Aug 2024 01:35:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724945730;
	cv=none; b=Ys6dfA9CuPFjL5V4/Il6A8EigHidLnlAa1TnpTpo25wETuf4oVLPs5EGQIZyo8kyQKwWjOfBdRN/IxP4HPKUEQB3qRfLpM8zA7WZnazVe2cK5oxCl5e6sCrIGfeYhzYD4uVCYNotUHcmuauiMfKiJWcGSiYn1nrlJaxSeSBUeiDLAnmDQXxsgjN0ORt0rMZG7OvF+T2vtOMXUGnagFafoa5e0mqhsQFwTUaOI9cuyc6B24876ts/Yyc5HuHTtaDnOeCQ1qThtk7DCt4jkjhxEaEnpBfMd91CnCbBFm6mRxHdvohL0Ju5C7TFcfBMxCnveeERvwOPAt+sHeODmAD+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724945730; c=relaxed/relaxed;
	bh=UC+eS84PymFFieVdfRPBztsOdQy++AWqNbeyTPDu9A0=;
	h=Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=Z+sQh9IwC2U6LdWl0y7QK91HndawWp4CRgiBMhuWad8mbVTJHeFTRZW15qghdNcKvcQ2a9dS4vqVjJ2dV5uoHJfwTLgFgRajbvF2hcXcRT924X/JBXh1YJhrkj8CcCqyMUoMJPI5PHBdHyZWb5n85xAJ8qgQ46DdxJfdAvAWEWt4D9xQdXGfFzSY9NMLlVedo7izI6HIFu7y2kAU/l+nt4QDTJnR/pcz4F/1ID86fEs3AfO02d629FLfPgK8opFcFnoZZYoeB+T55bB8VysnIYRXXquXX8mN+HtkNV0uvqHBJjLOBs4OMtrcFHly+yoR1AXk11b9VJEki4LlO8cO/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=vincenzo.frascino@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=vincenzo.frascino@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvljG0fKFz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 01:35:28 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55B77DA7;
	Thu, 29 Aug 2024 08:35:22 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BCA43F66E;
	Thu, 29 Aug 2024 08:34:54 -0700 (PDT)
Message-ID: <d0bcd439-0972-496a-8d77-bfbe10e0cd6a@arm.com>
Date: Thu, 29 Aug 2024 16:34:53 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] random: vDSO: Redefine PAGE_SIZE and PAGE_MASK
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Linux-Arch <linux-arch@vger.kernel.org>
References: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
 <defab86b7fb897c88a05a33b62ccf38467dda884.1724747058.git.christophe.leroy@csgroup.eu>
 <Zs2RCfMgfNu_2vos@zx2c4.com>
 <cb66b582-ba63-4a5a-9df8-b07288f1f66d@app.fastmail.com>
 <0f9255f1-5860-408c-8eaa-ccb4dd3747fa@csgroup.eu>
 <17437f43-9d1f-4263-888e-573a355cb0b5@arm.com>
 <272cb38a-c0e3-4e6e-89ce-b503c75c2c33@csgroup.eu>
 <bab7286c-e27e-450a-8bb6-e5b09063a033@arm.com>
 <0085b19d-bb87-45bc-8a74-7464316f86a1@csgroup.eu>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <0085b19d-bb87-45bc-8a74-7464316f86a1@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


...


>>> Without linux/array_size.h:
>>>
>>>    VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>>> In file included from <command-line>:
>>> /home/chleroy/linux-powerpc/lib/vdso/getrandom.c: In function
>>> '__cvdso_getrandom_data':
>>> /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:40: error: implicit
>> If this is the case, those headers should be defined for the powerpc
>> implementation only. The generic implementation should be interpreted as the
>> minimum common denominator in between all the architectures for what concerns
>> the headers.
>>
> 
> Sorry, I disagree. You can't rely on necessary headers being included indirectly
> by other arch specific headers. getrandom.c uses ARRAY_SIZE(), it must include
> the header that defines ARRAY_SIZE().
> 
> At the moment, on x86 you get linux/array.h by change through the following
> chain, that the reason why the build doesn't break:
> 
> In file included from ./include/linux/kernel.h:16,
>                  from ./include/linux/cpumask.h:11,
>                  from ./arch/x86/include/asm/cpumask.h:5,
>                  from ./arch/x86/include/asm/msr.h:11,
>                  from ./arch/x86/include/asm/vdso/gettimeofday.h:19,
>                  from ./include/vdso/datapage.h:164,
>                  from arch/x86/entry/vdso/../../../../lib/vdso/getrandom.c:9,
> 
> From my point of view you can't expect such a chain from each architecture.
> 

--->8---

> I can't see which header provides you with min_t() or ARRAY_SIZE().
>

Good point, this needs to be addressed by my patch, I will extend it, do some
more testing and post it again next week.

--->8---


As I explained in my other email (snippet above), my patch should address the
cases of ARRAY_SIZE() and min_t() which are directly used by getrandom.c. My
comment here refers to the cases not directly used by getrandom.c or the Generic
vDSO library more in general (if any).

Hope this clarifies.

> Christophe

-- 
Regards,
Vincenzo

