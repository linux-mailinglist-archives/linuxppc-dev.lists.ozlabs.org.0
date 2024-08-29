Return-Path: <linuxppc-dev+bounces-747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7896479E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 16:08:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvjms4mSqz2yw7;
	Fri, 30 Aug 2024 00:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724940509;
	cv=none; b=YgV1qmdFA1/vgUM5T8clLgI4d5kjwe0VjQfToGjKZvnvLQa8oeFp2G7sMcKj+386ExA4zFTNEul9QWrNJ1kjJq6nzY/vlTwoVDZtissWOz98JsswVkNMcAbE8k5Tio3jbZhKpA9TMqeKwaaqkDvuRa+XZ4+rJ9xKAwPLBX/fBHBLL9nevuL6chuh7WDmTzIx9+915JPs7vZ7vXvW18pA07nmg/AOSfev9CSHqJ/rvS2d6tU30FPkf1fK5jweI7AXFE29fnFNHw3OCjPTXibEQA2bfIciIh+GLOSE346An5OBo/2RUbQ9o7ZmEppE2U58I036IBXqxyw5kKzPLLB/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724940509; c=relaxed/relaxed;
	bh=XlkMSHV0Du4WeBbyeEe3Y4DjxJNeuDCcnOHa0vTsZp4=;
	h=Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=YLlClK7S5Se8c3qtzRM9OEYNB97ZAtqpdVpwAzwFi73lobI6ilGVV7QuRyTvz9GgjWnMXRHsA/QatZC35C5WVZu/s5H4kJggri60+l80hyhie6KG+a11xgAfhOKwMKLEHa0BcJhbaiD2ne6PZmXleFPZFfRPrXoX0lbot5NvNwQZTlStxNisjE1CicfFtjS0+z7l1o6eKs4YjhmzEZ4XeFwFTdOJQQh8jTpnAe/O3KXOS6xXWoAxskZHqHlke/MTYlu+IuagsYsKrt9oMx6uyQSSPCY/d59n4MhVjQID7LR2qJqf7+wZGh060Uee18VANjz9Z4vDHG5kS+LLlJOMMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=vincenzo.frascino@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=vincenzo.frascino@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvjmr5kb6z2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 00:08:26 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97650DA7;
	Thu, 29 Aug 2024 07:08:20 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72DE93F66E;
	Thu, 29 Aug 2024 07:07:52 -0700 (PDT)
Message-ID: <632b8da1-c165-4d17-804f-4edf1438d55a@arm.com>
Date: Thu, 29 Aug 2024 15:07:50 +0100
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
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
 Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Linux-Arch <linux-arch@vger.kernel.org>
References: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
 <defab86b7fb897c88a05a33b62ccf38467dda884.1724747058.git.christophe.leroy@csgroup.eu>
 <Zs2RCfMgfNu_2vos@zx2c4.com>
 <cb66b582-ba63-4a5a-9df8-b07288f1f66d@app.fastmail.com>
 <0f9255f1-5860-408c-8eaa-ccb4dd3747fa@csgroup.eu>
 <17437f43-9d1f-4263-888e-573a355cb0b5@arm.com>
 <85efc7c5-40c8-4c89-b65f-dd13536fb8c7@cs-soprasteria.com>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <85efc7c5-40c8-4c89-b65f-dd13536fb8c7@cs-soprasteria.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Christophe,

On 27/08/2024 18:38, LEROY Christophe wrote:
> Hi Vicenzo,
> 
> Le 27/08/2024 à 18:05, Vincenzo Frascino a écrit :
>> Hi Christophe,
>>
>> On 27/08/2024 11:49, Christophe Leroy wrote:
>>
>> ...
>>
>>
>>
>> I agree with Arnd here. uapi/linux/mman.h can cause us problems in the long run.
>>
>> I am attaching a patch to provide my view on how to minimize the headers
>> included and use only the vdso/ namespace. Please, before using the code,
>> consider that I conducted very limited testing.
>>
>> Note: It should apply clean on Jason's tree.
>>
>> Let me know your thoughts.
>>
> 
> Your patch looks nice, maybe a bit too much. For instance getrandom.c 
> can include directly asm/vdso/page.h instead of creating vdso/page.h
> 
> Or create a vdso/page.h that only use CONFIG_PAGE_SHIFT and doesn't 
> include anything from architectures.
> 

IMHO there should be only one place per architecture where PAGE_SIZE and
PAGE_MASK are defined. This makes sure that if there is a problem, we do not
have multiple places to look into.

The indirection helps to keep consistent the namespace and allows for future
extension. Similar logic has been used during my original vDSO headers
definition and implementation.

> We should also keep PROT_READ and PROT_WRITE in getrandom.c , that's 
> better for readability. Same for MAP_DROPPABLE | MAP_ANONYMOUS. I can't 
> see the benefit of hiding them in a header.
> 

The idea is not to make the code unreadable but to defer to the architecture the
decision of prot and flags avoiding the inclusion of headers coming from the
uapi namespace.

> I can't see which header provides you with min_t() or ARRAY_SIZE().
> 

Good point, this needs to be addressed by my patch, I will extend it, do some
more testing and post it again next week.

> I think you should also work on removing headers included by 
> arch/x86/include/asm/vdso/gettimeofday.h which is included by 
> include/vdso/datapage.h :
> 
>    #include <uapi/linux/time.h>
>    #include <asm/vgtod.h>
>    #include <asm/vvar.h>
>    #include <asm/unistd.h>
>    #include <asm/msr.h>
>    #include <asm/pvclock.h>
>    #include <clocksource/hyperv_timer.h>
> 
> As a comparison, the one from powerpc only includes the following one so 
> it pulls a lot less non-vdso headers:
> 
>    #include <asm/vdso/timebase.h>
>    #include <asm/barrier.h>
>    #include <asm/unistd.h>
>    #include <uapi/linux/time.h>
> 
> Christophe

This does not seem a concern, in fact I believe that the generic vDSO library
should not mandate to the architecture how to organize headers. As far as the
requirements are satisfied each architecture should be able to define its own
naming and conventions independently.

-- 
Regards,
Vincenzo

