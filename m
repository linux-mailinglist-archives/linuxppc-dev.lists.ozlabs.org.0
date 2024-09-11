Return-Path: <linuxppc-dev+bounces-1260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C489759A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 19:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3nvT5bSjz2ygG;
	Thu, 12 Sep 2024 03:42:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726076533;
	cv=none; b=TaKRwnJtudTC99N5tnAJ1nTYPrjU7FOigOClp1h+wuyXO3+f4cRWlTN7rZ23oiAWBU553yma5983u9MOXUvOWFal21TuJ3z+NCiq4tA+UtoUMB068dsSymD0wd9bNpsdfPWsYVE7tPNiYcGVIVqr/6QmDA9KM0gd58TV1lHBrqAz6HcQ8M1evUP/XzoAWWqdKRnS1NWrOa+XHJ4FEWmzHHkwE/25ngIXoI+d6ATalUJA3/WMHZFz/Btpuk+nMjK+5xJYqdPE+p2sbx+Ioom/ush0g2pGHjF3YG73kpG9TF0cnKpaF3wu5PpT47qcDKmF5d15BWlrVAlzPNP7MkNgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726076533; c=relaxed/relaxed;
	bh=706YIr0bgBd+SdWWT5lCJ2ip0tLuVrI+pXTkacc4ei0=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=a14c5hjbjMjHiCkBadiDh+/V03ZlHniRGy1At+2PXjwRbYSlKqgr7DQctOUETP5mqAIIgLLhbcEpmj0Du92+yF1MUYtemhRgUCiskdmf1hSeD9Z/ghgty3m1BZlSEJQ2owPcOnZvnmumAbryaEfbJiRf4cpAlVCL1g2DttsI5EepHeIyVPc25p/zlfQGbANozy7VTp8uVx8lzGJE9RUSUC/GEEmXBJILFeUnNHlCcwERbXIPeCAGdMOgvrymRI7U1ppNq39bs8+hvLK5ZN4Yfum/H+WOqkAGxxGRjDXaN9CL3lsayu/twwOVKqFj56hLFyOO1Ycw/huNZP/QdTrBhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qsT5lA6z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3cnbhzgskdoefrowrqohzlvjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qsT5lA6z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3cnbhzgskdoefrowrqohzlvjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3nvT109xz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 03:42:11 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6b41e02c293so4634637b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726076529; x=1726681329; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=706YIr0bgBd+SdWWT5lCJ2ip0tLuVrI+pXTkacc4ei0=;
        b=qsT5lA6zSRZP9H/5Fs18YpprGEZLpgdwBBLCub80yJStRiuKIOGfvNUth1ubRfhtpU
         6mHxIgGvolHUgJs6VQP32ZArnk+/HAZ/NN2jn2eiBQ/2nWPqhbndggQaJQz1/JwgUH/J
         VhYyADQkyKTn5jVMjMsbu66mT/TVVB7w1G2FB/bb8L4Ahx9D+hLTqWl1kJC5eNeFvDs1
         RGLQMXBdjeKQ0Zl24ZGvdxMxQTiop321TVEMZzYxwwTNrB4OfCuK7+ksDfQT9ETlWriQ
         h92zix3FVtSqPqlyUobJL1DsB/MOZECL8JbbcjWzdm0dCaWtUBghg8SjtA5UNtQGbE0R
         jnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726076529; x=1726681329;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=706YIr0bgBd+SdWWT5lCJ2ip0tLuVrI+pXTkacc4ei0=;
        b=MJ1D1ErT5upCcG1+dnh6YiEmkKbGshh1enmQt20k6gAgBTUbMplKO8dyioUY4KyL6K
         NuEimfnxf+uYK8y4ekFA+G17uHssPRDIYNOrt7EVYD+64Te8jqKczqLQwX928QFOy1Vg
         NSrMvORAB6GwFKawqqV3x9Os8bK0kA0cJEJDXEi7Sv2599zywljhC4pRHweRNkbe+OgA
         O8SRhI1wCKvpfb+b0KHwOsBFdpbn1575MK3KyNY8+/aoMtZKtfY60flMBl9QchE3dhJx
         KRnl29AWbs9Jay7yg6RPPqsgEXTL1sE2OVGLyOXGBosYoL57Kkn2zqKF3a7hXH3fvg+z
         04bw==
X-Forwarded-Encrypted: i=1; AJvYcCVVZ6/H2J3+Yp8JW14y5+L9R4ydr3QiG3Ambak6syq7/Iep+UfkAJc+57xTnoGM9azOPwtPYErt+Wfx798=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRZHgRFhiZXsesfdvyC1m60c1O1TjkzZsEfqczciEMcoBfWyPx
	dhL9vtu0aRfQJsG1BfSB+sq2t7gpyEyS2xXmrfCgtg5+dp9G2w9DmuZx3d6ve+PBvUyOrGpt1nP
	w6Tgzb+EXgtNjMYUdi0gZhg==
X-Google-Smtp-Source: AGHT+IFvlmwQkSjQLxVucUW7uRZBOX25a6vFDWduRsiEd3MV5YuAAx1lfuAly70GDxykiYb30OJnJ7h7mzdG3bMQWg==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:fd0:b0:6d6:bf07:d510 with
 SMTP id 00721157ae682-6dbb6b9d655mr6437b3.6.1726076528473; Wed, 11 Sep 2024
 10:42:08 -0700 (PDT)
Date: Wed, 11 Sep 2024 17:42:07 +0000
In-Reply-To: <ZtmOENs5qveMH920@J2N7QTR9R3> (message from Mark Rutland on Thu,
 5 Sep 2024 11:55:12 +0100)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Message-ID: <gsntv7z2cck0.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 5/5] perf: Correct perf sampling with guest VMs
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

> On Wed, Sep 04, 2024 at 08:41:33PM +0000, Colton Lewis wrote:
>> Previously any PMU overflow interrupt that fired while a VCPU was
>> loaded was recorded as a guest event whether it truly was or not. This
>> resulted in nonsense perf recordings that did not honor
>> perf_event_attr.exclude_guest and recorded guest IPs where it should
>> have recorded host IPs.

>> Reorganize that plumbing to record perf events correctly even when
>> VCPUs are loaded.

> It'd be good if we could make that last bit a little more explicit,
> e.g.

>    Rework the sampling logic to only record guest samples for events with
>    exclude_guest clear. This way any host-only events with exclude_guest
>    set will never see unexpected guest samples. The behaviour of events
>    with exclude_guest clear is unchanged.

> [...]

Done

>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index 4384f6c49930..e1a66c9c3773 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -6915,13 +6915,26 @@ void perf_unregister_guest_info_callbacks(struct  
>> perf_guest_info_callbacks *cbs)
>>   EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>>   #endif

>> -unsigned long perf_misc_flags(unsigned long pt_regs *regs)
>> +static bool is_guest_event(struct perf_event *event)
>>   {
>> +	return !event->attr.exclude_guest && perf_guest_state();
>> +}

> Could we name this something like "should_sample_guest()"? Calling this
> "is_guest_event()" makes it should like it's checking a static property
> of the event (and not other conditions like perf_guest_state()).

> Otherwise this all looks reasonable to me, modulo Ingo's comments. I'll
> happily test a v2 once those have been addressed.

Done

> Mark.

