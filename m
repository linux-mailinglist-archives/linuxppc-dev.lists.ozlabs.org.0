Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F38A0C64
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 11:28:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mdPGjSNV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFZBm0vkGz3vbQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 19:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mdPGjSNV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFZB23NJkz3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 19:28:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712827690; x=1744363690;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zITqgZVojLh4dUSaGKV239z9RvbFs2+NfPNhuOaA6RY=;
  b=mdPGjSNVB30cUHomHmjBo7DOroMf9J1cSX5GHqu0aSOcBq/xL7oncM9D
   ACykMnwWcUm4RbJYaKt792BxK3dERXcbx50Wtn7MsiPUjRi+/XssnzIKo
   HG14RP1JQ09gQvLqDAwUTgC20hqlTWogOY5EaroCEuX04SRG5GCuXYJUb
   6TbdhV18MBX8qUQ0wI8hUphSAyrpanZFZT0TMQRKQzOZrPzkrMTGKMpo3
   n9SwnUGERBv6pkdSh6LM2JP+oZvDrQ+r18ESJI6jJIvWDGyfNtj0EIcSb
   liGQaAfxqN0T7rLqX+Znh+iPIAXx4LSN1GVyd5g1ssnj64/7PFxhVKi61
   A==;
X-CSE-ConnectionGUID: pW2+Dx2bQQqbmCJ4RmqFsA==
X-CSE-MsgGUID: RVQEcjRsTY2nXR+XKWHMZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8083340"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8083340"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:28:05 -0700
X-CSE-ConnectionGUID: off1ptQUS5SR8wQ5l3jZ/Q==
X-CSE-MsgGUID: WwenVoetQbuHdgS5T+1EqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25622263"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.215.66])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:27:58 -0700
Message-ID: <4d429a10-eb45-4262-8e74-69af810ef1ac@intel.com>
Date: Thu, 11 Apr 2024 12:27:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
 <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
 <a434248a-1e9f-4f4f-8f90-d36d8e979f53@csgroup.eu>
 <ff9d7032-a3b6-4ecd-ac26-d7d4a06a5c7f@csgroup.eu>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <ff9d7032-a3b6-4ecd-ac26-d7d4a06a5c7f@csgroup.eu>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, "x86@kernel.org" <x86@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sven Sch
 nelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/04/24 11:22, Christophe Leroy wrote:
> 
> 
> Le 11/04/2024 à 10:12, Christophe Leroy a écrit :
>>
>>
>> Le 11/04/2024 à 09:16, Adrian Hunter a écrit :
>>> On 11/04/24 10:04, Arnd Bergmann wrote:
>>>> On Wed, Apr 10, 2024, at 17:32, Adrian Hunter wrote:
>>>>> BUG() does not return, and arch implementations of BUG() use 
>>>>> unreachable()
>>>>> or other non-returning code. However with !CONFIG_BUG, the default
>>>>> implementation is often used instead, and that does not do that. x86 
>>>>> always
>>>>> uses its own implementation, but powerpc with !CONFIG_BUG gives a build
>>>>> error:
>>>>>
>>>>>    kernel/time/timekeeping.c: In function ‘timekeeping_debug_get_ns’:
>>>>>    kernel/time/timekeeping.c:286:1: error: no return statement in 
>>>>> function
>>>>>    returning non-void [-Werror=return-type]
>>>>>
>>>>> Add unreachable() to default !CONFIG_BUG BUG() implementation.
>>>>
>>>> I'm a bit worried about this patch, since we have had problems
>>>> with unreachable() inside of BUG() in the past, and as far as I
>>>> can remember, the current version was the only one that
>>>> actually did the right thing on all compilers.
>>>>
>>>> One problem with an unreachable() annotation here is that if
>>>> a compiler misanalyses the endless loop, it can decide to
>>>> throw out the entire code path leading up to it and just
>>>> run into undefined behavior instead of printing a BUG()
>>>> message.
>>>>
>>>> Do you know which compiler version show the warning above?
>>>
>>> Original report has a list
>>>
>>>     https://lore.kernel.org/all/CA+G9fYvjdZCW=7ZGxS6A_3bysjQ56YF7S-+PNLQ_8a4DKh1Bhg@mail.gmail.com/
>>>
>>
>> Looking at the report, I think the correct fix should be to use 
>> BUILD_BUG() instead of BUG()
> 
> I confirm the error goes away with the following change to next-20240411 
> on powerpc tinyconfig with gcc 13.2
> 
> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> index 4e18db1819f8..3d5ac0cdd721 100644
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -282,7 +282,7 @@ static inline void timekeeping_check_update(struct 
> timekeeper *tk, u64 offset)
>   }
>   static inline u64 timekeeping_debug_get_ns(const struct tk_read_base *tkr)
>   {
> -	BUG();
> +	BUILD_BUG();
>   }
>   #endif
> 

That is fragile because it depends on defined(__OPTIMIZE__),
so it should still be:

	BUILD_BUG();
	return 0;

