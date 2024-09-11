Return-Path: <linuxppc-dev+bounces-1259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B0975941
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 19:24:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3nVx4j5lz2ydQ;
	Thu, 12 Sep 2024 03:24:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726075465;
	cv=none; b=RVMConXz8lRr6f7Ik2KwMdfQ7pXuQH7CDrVtzUfSd2QCqT8pwClgz8nJiqBlzPRqYS1JokwNoZ6ZxQ1uEM3krCtDVA9ZKOCf/8gbUuC7Iet3EGQ97AEud2zczkaf+EeWMnW1W5ZR3dEWkpgfVmXcCozwxpxiWR8wfS5hv4WJt7DnYYXEJemugqnKwiZztChJlFBSswbU0bjHo38zcVRbb7Tlx6VX9ZozW9uftPmyGpADGBfmIGZKkJRD0um8mT7oxdbEHxCHz7EYmLlvt/Zo0zXZ9shyoORHvnXjluDt/C1U2zYZzUw3jhr3olOSMVHQvL2slrb1dRPOW0ozLAgNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726075465; c=relaxed/relaxed;
	bh=SaSesydasxzfbVhVncU6hEY4UY7i9QKYOocGcFq6lVw=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=kCipv/H7oEy6YmMnVb1nS7Zva4lJm6V9oSczo/QDKrNn8ghJKCSLLgDsOPXOvsGvedk6y1A/XgfRqLY92p7FlDaRCiw5OCjGmstG7KCQuQrD/0haDCsNMM/Z0a0Euug85XHzoiio0qxtVdi0oyCmZFMORX5MsGdhgTaEVXmh/d311Ow9MTnmtTE2Zc6c1y7yi87l082Id/rLp6YoQ+FzW+tBxIhfc5pf2itzoIEAW7DYbuYJOXbb1vq1KiyJBY/hH/brp9JoXSc2oFGzyrZkV0lBj2oht8YfRFf5ABKpUCLjtowRw+C0fc8Z4plV+ckbQZtbgINYB2TS95fendp8UQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dWddOyuq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3qdlhzgskdkomyvdyxvogscqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dWddOyuq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3qdlhzgskdkomyvdyxvogscqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3nVw4fB1z2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 03:24:22 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1ce98dcafaso308594276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726075458; x=1726680258; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SaSesydasxzfbVhVncU6hEY4UY7i9QKYOocGcFq6lVw=;
        b=dWddOyuqYHSJW9ckCkEhniVmn/7bm+neLVc9Xd0Sq2Csr9KJqJ+KVAyjHa/qpmQZDy
         VXteySCSpmeSfY9U8OcrkHplhcEfja6C+Erb8k7Bgv/sZzZT9Qm8aLbXlYK1X6N/Tlu+
         xvNkpyqvEkOpZydt04252jqDPGaXj4k9/VplvqkWS7AN4bLu73n3/HIjgyrobqW67YqI
         Kbf5bsBBC1FMrAseS/FbsAWsQAjkhvAjdCH+fQY/qzMTR1DEeeMNM/YZAttRq69epkal
         kd4qQVpCwW82vqirBvu8PK9aHP0wJ+cMXDA2NIL7fanKTMitSLgYZ+3tBKvm9LoBhXrJ
         z7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726075458; x=1726680258;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaSesydasxzfbVhVncU6hEY4UY7i9QKYOocGcFq6lVw=;
        b=CKceJg5++kdby7bewf/4C3+339TIe2JyS3taIHSNlSpIrwfsGh2E/2zSUTt0h1ZSLY
         4LhmqciGJJ3eCbPE4qV8SmkINXHxpCseJQzo2YEG1PSU2Qhhi/xJxbP4EPmPLaRaIeJz
         74ove33ZPqim+TteRr1BkABVJKtw+jT/oZgLfxZVjDYcg7/1JlxyKggT/sg2E+rtI6ig
         TzJATJjyBxr0dOGvHw65oM1l1sVomiajbX4vr5uvYdvwEyySKt72oDcWn192nyOdD4EV
         g1mXuHg/MaQb6Ba7GOG/fip7KRPbGBH7FKcZUm09SLf/KMM29rswT8oSvx6xQ3Ev84Sn
         U1YA==
X-Forwarded-Encrypted: i=1; AJvYcCUoxk3JA2DrHqGIx/Ueip8+Rk25dQAY8MCx+hK6SlpIim1eez+uq/cs9lyF1NIOZtJIHdN19b1DMY4KfWg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpNHTG/eRdtJhvqquCvUx7rdkW5LAeNNNSPvfyLALvNtuUh16/
	F1mcsbWV3waCtW1mv1cI3Y7Ln/YdfCCzH55nKcd3vKwBXh6cgdv2ANHMZ/uA16LAJm6gogp8XFE
	LEFNjvZmYFdvbuGmDUbCuzw==
X-Google-Smtp-Source: AGHT+IF0bUdUbcCOClt0/WYli3uuDRUJs0keADgBT2fi3kki6SRriwc15ZsmXxjB7diodiG4JkONa9BVdzmH2TzP6g==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:529:b0:e1d:96a7:c9b1 with
 SMTP id 3f1490d57ef6-e1d9dc2cfd7mr203276.6.1726075457958; Wed, 11 Sep 2024
 10:24:17 -0700 (PDT)
Date: Wed, 11 Sep 2024 17:24:17 +0000
In-Reply-To: <ZtmHBuggqUr3ncw6@J2N7QTR9R3> (message from Mark Rutland on Thu,
 5 Sep 2024 11:25:10 +0100)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Message-ID: <gsnty13ycddq.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 1/5] arm: perf: Drop unused functions
From: Colton Lewis <coltonlewis@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
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

Mark Rutland <mark.rutland@arm.com> writes:

> On Wed, Sep 04, 2024 at 08:41:29PM +0000, Colton Lewis wrote:
>> perf_instruction_pointer() and perf_misc_flags() aren't used anywhere
>> in this particular perf implementation. Drop them.

> I think it'd be better to say that arch/arm's implementation of these is
> equivalent to the generic versions in include/linux/perf_event.h, and so
> arch/arm doesn't need to provide its own versions. It doesn't matter if
> arch/arm uses them itself since they're being provided for the core perf
> code.

> With words to that effect:

Done

> Acked-by: Mark Rutland <mark.rutland@arm.com>

> Mark.


>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm/include/asm/perf_event.h |  7 -------
>>   arch/arm/kernel/perf_callchain.c  | 17 -----------------
>>   2 files changed, 24 deletions(-)

>> diff --git a/arch/arm/include/asm/perf_event.h  
>> b/arch/arm/include/asm/perf_event.h
>> index bdbc1e590891..c08f16f2e243 100644
>> --- a/arch/arm/include/asm/perf_event.h
>> +++ b/arch/arm/include/asm/perf_event.h
>> @@ -8,13 +8,6 @@
>>   #ifndef __ARM_PERF_EVENT_H__
>>   #define __ARM_PERF_EVENT_H__

>> -#ifdef CONFIG_PERF_EVENTS
>> -struct pt_regs;
>> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
>> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
>> -#define perf_misc_flags(regs)	perf_misc_flags(regs)
>> -#endif
>> -
>>   #define perf_arch_fetch_caller_regs(regs, __ip) { \
>>   	(regs)->ARM_pc = (__ip); \
>>   	frame_pointer((regs)) = (unsigned long) __builtin_frame_address(0); \
>> diff --git a/arch/arm/kernel/perf_callchain.c  
>> b/arch/arm/kernel/perf_callchain.c
>> index 1d230ac9d0eb..a2601b1ef318 100644
>> --- a/arch/arm/kernel/perf_callchain.c
>> +++ b/arch/arm/kernel/perf_callchain.c
>> @@ -96,20 +96,3 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx  
>> *entry, struct pt_regs *re
>>   	arm_get_current_stackframe(regs, &fr);
>>   	walk_stackframe(&fr, callchain_trace, entry);
>>   }
>> -
>> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
>> -{
>> -	return instruction_pointer(regs);
>> -}
>> -
>> -unsigned long perf_misc_flags(struct pt_regs *regs)
>> -{
>> -	int misc = 0;
>> -
>> -	if (user_mode(regs))
>> -		misc |= PERF_RECORD_MISC_USER;
>> -	else
>> -		misc |= PERF_RECORD_MISC_KERNEL;
>> -
>> -	return misc;
>> -}
>> --
>> 2.46.0.469.g59c65b2a67-goog


