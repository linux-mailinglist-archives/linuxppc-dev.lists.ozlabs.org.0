Return-Path: <linuxppc-dev+bounces-3061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91F9C2545
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 20:01:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlSwB6mz7z30MR;
	Sat,  9 Nov 2024 06:01:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731092490;
	cv=none; b=ZBJux0Qk0WVKmgNHoRihxKaAAWn8ADsRT+az9XjfC6HFVx0ZcPHSKg709e5h4VJZsjR8+YZAy4RWwF1+HdonL8j2wBYi0I5o85UmhFb4idkun5DdgYiR6op3rmHmLUQoRwqvuKz1WodBf0x/MNOJvZBXp9W6siUQZhFY720FE+HrBG49lStCPxuFO5Mc8ElFI9OYyAHlFoWvZ0rAclOM++TctrlYNuoXU9bkj2kkBauDbjLJ9bKE5BZp6SRW6FBXrG/lUY9V5/kaW3wv6VkLmjfUOPQOJ8y6RTFFcpIdBPHjtrHkhNWT8fVvKoOpBprsgy1AY97H2fTVuHVMSiDdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731092490; c=relaxed/relaxed;
	bh=X/YH5u+uVD0X+IYthPhg6GmXA/jaE5JARCEDgbJjUV8=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=ITMPr/0lB0KjOR2REyGMJ1jkJecdWJMQ7z47uNXLTnxUv1Ex2W+niC6UDPAgnFtQyWIAW2bWEA+XBqtOUoRISjcv6D/WKBjB5Um3tuflVqRgo2ISPWacjblt5vdsWkvhsQJHgKMCnFqQCeq3fp4DZwJIz01RoTLHs+1F5csz8rDuP/nMaaQ72z+BMCJFVWnkNnh75nle8ZjUKnIkY9Ykt0tJmDpg39MLyNv9fqXzYPrwH2CRhyjTcT/N0qdGFm5I4UNubW3ssgw5Ch9dN2phPkVV1TiUkYXtc5RuNvpM/GFZ4aeQSFHTXGtkE1CjEXc1kFYGLz7x7hBs69ydyuLCVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LK+X/3Um; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3_v8uzwskdlyykhpkjhaseockkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LK+X/3Um;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3_v8uzwskdlyykhpkjhaseockkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlSw81YKVz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 06:01:26 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea6aa3b68bso46485507b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2024 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731092477; x=1731697277; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/YH5u+uVD0X+IYthPhg6GmXA/jaE5JARCEDgbJjUV8=;
        b=LK+X/3Um5Cvqb+splmHtxUQ7deDcDo3f+qZS6MIZyoTufj9KzzH+aWYtEHZ1fY24lB
         B9JHx9t3mD0zQ9/Gei4cXZJunKefFItwAmc1PoZfGs0EAxMq0uvEMR0aAg4rH0DlizCE
         arVR2nlt2CacphBqCph+oJDGn+s5VUM6+grbewV/bIbCSsGEx7S5XDvEcb5Sgeb0b8sy
         onPycpZ0Ll/XjlaTXgmuCz+GScknZoJcyGKFCdZUyggJZTslXlL1YoJkskVStiPYKNjY
         W5TE999TX5+QCnSGz1NQtkhhAjqBnGRxk+s5hzDuDM+1H6Y29joIfeg5Z1p8tBXl7PJ3
         nSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731092477; x=1731697277;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/YH5u+uVD0X+IYthPhg6GmXA/jaE5JARCEDgbJjUV8=;
        b=IFYi3fRRegEpDirBZ2Pkxj06anIUKn6J9oDfqkz6iVBga9eXAB75eQTnQc2BzjE12L
         RoAyDwcEZW0aQLFJ9iruqHgDFqjJRrMqYA0AZ8Z1nz147lVuXlhILxm2XqkNG39fi8TS
         pr/JmIQ2sLFXOmQB+cr/C661yvQCviRoDVHgP+dnCFcWHOkql5BZO3pVgC6SVCe4/Pd5
         kBw/uywEmsMgXCwBRrnm8vTJLoxFzltAXuMKg9KhEDiONV1PqZoWJxV4OnZEqxNjEx6R
         v641RGwBVC+1NuqJMvzvonkI/JxG40xEN78VrXdGUI7KwHO2ZasA7A2LtKAock52IaVu
         Il8A==
X-Forwarded-Encrypted: i=1; AJvYcCW0M9YcuZKu3vUB4dKdFsTCfsPXVb0CIDDOaJqTBI2u7IFHc2xPZczpQ+4xjzjUFaHVP/2Q3hHe3uQ9z/E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyt5J/XjcEmMUD7VwMdASPW4kDoimqw4v99EB01E5KvdfDUPlXN
	jhf4pJjKnJlmwG7d+QZmcyON7OJvae9BJe9DZciFT8gJKHM1eZlms0YluwQlnZoS+3JmUkVWAlo
	IG4PORqucQdPOOAMO94BnHw==
X-Google-Smtp-Source: AGHT+IHf5E46yE8Goi3JQ3NCwqhgizTTCCoxt5IIbUtqVWxYQ8qv+MmQFEFlUtd8c2orQuarK4c0d4RFcTxIc3XLxg==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:25c3:b0:6e3:d670:f62a with
 SMTP id 00721157ae682-6eadde333e0mr258367b3.3.1731092477590; Fri, 08 Nov 2024
 11:01:17 -0800 (PST)
Date: Fri, 08 Nov 2024 19:01:16 +0000
In-Reply-To: <20241108153411.GF38786@noisy.programming.kicks-ass.net> (message
 from Peter Zijlstra on Fri, 8 Nov 2024 16:34:11 +0100)
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
Mime-Version: 1.0
Message-ID: <gsntbjypft37.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
From: Colton Lewis <coltonlewis@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, will@kernel.org, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Peter Zijlstra <peterz@infradead.org> writes:

> On Thu, Nov 07, 2024 at 07:03:35PM +0000, Colton Lewis wrote:
>> Break the assignment logic for misc flags into their own respective
>> functions to reduce the complexity of the nested logic.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
>> ---
>>   arch/x86/events/core.c            | 32 +++++++++++++++++++++++--------
>>   arch/x86/include/asm/perf_event.h |  2 ++
>>   2 files changed, 26 insertions(+), 8 deletions(-)

>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>> index d19e939f3998..9fdc5fa22c66 100644
>> --- a/arch/x86/events/core.c
>> +++ b/arch/x86/events/core.c
>> @@ -3011,16 +3011,35 @@ unsigned long  
>> perf_arch_instruction_pointer(struct pt_regs *regs)
>>   	return regs->ip + code_segment_base(regs);
>>   }

>> +static unsigned long common_misc_flags(struct pt_regs *regs)
>> +{
>> +	if (regs->flags & PERF_EFLAGS_EXACT)
>> +		return PERF_RECORD_MISC_EXACT_IP;
>> +
>> +	return 0;
>> +}
>> +
>> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>> +{
>> +	unsigned long guest_state = perf_guest_state();
>> +	unsigned long flags = common_misc_flags(regs);

> This is double common_misc and makes no sense

I'm confused what you mean. Are you referring to starting with
common_misc_flags in both perf_arch_misc_flags and
perf_arch_guest_misc_flags so possibly the common_msic_flags are set
twice?

That seems like a good thing that common flags are set wherever they
apply. You can't guarantee where perf_arch_guest_misc_flags may be
called in the future.
>> +
>> +	if (!(guest_state & PERF_GUEST_ACTIVE))
>> +		return flags;
>> +
>> +	if (guest_state & PERF_GUEST_USER)
>> +		return flags & PERF_RECORD_MISC_GUEST_USER;
>> +	else
>> +		return flags & PERF_RECORD_MISC_GUEST_KERNEL;

> And this is just broken garbage, right?

>> +}

> Did you mean to write:

> unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long guest_state = perf_guest_state();
> 	unsigned long flags = 0;

> 	if (guest_state & PERF_GUEST_ACTIVE) {
> 		if (guest_state & PERF_GUEST_USER)
> 			flags |= PERF_RECORD_MISC_GUEST_USER;
> 		else
> 			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> 	}

> 	return flags;
> }

Ok, my mistake was using & instead of |, but the branches are
functionally the same.

I'll use something closer to your suggestion.

>>   unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>>   {
>>   	unsigned int guest_state = perf_guest_state();
>> -	int misc = 0;
>> +	unsigned long misc = common_misc_flags(regs);

> Because here you do the common thing..


>>   	if (guest_state) {
>> -		if (guest_state & PERF_GUEST_USER)
>> -			misc |= PERF_RECORD_MISC_GUEST_USER;
>> -		else
>> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
>> +		misc |= perf_arch_guest_misc_flags(regs);

> And here you mix in the guest things.

>>   	} else {
>>   		if (user_mode(regs))
>>   			misc |= PERF_RECORD_MISC_USER;

