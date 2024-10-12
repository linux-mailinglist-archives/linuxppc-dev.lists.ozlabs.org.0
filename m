Return-Path: <linuxppc-dev+bounces-2159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1349999B634
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 19:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQr266PF8z2yZZ;
	Sun, 13 Oct 2024 04:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728753838;
	cv=none; b=Q8frT1dq4kOLBQxWg6AHUAmRSPv42LEXXger9nfjjNL8FcVrRrCTQweu3mmn2+fT1HH7r+TSUtqE2z9xob7Kwq5QiXx6FfjHbEG9Mot6KYsnkx2wY2dBQtwC3bi4Gxg7lTRiR/k0GDJXJd9av11yJDnnG8WKbKgpRU7F4EjuJ14Y4SchDKIVNvQmdQ5FVz+zdjJvQqGKgmlYo9TAqnirg1FgPyBD/B9W9Z4Yp2gKe/YrUd+UVg+j5iyA4POJx8Kl0yhViSrCIuDcmlv92ezEHxvytSf8kl2VKDvo0BFgrxfpni+q3nwB7JFIS8wPiT5DetKnuVpsLXFkZOzavZJ4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728753838; c=relaxed/relaxed;
	bh=1JC6Ki9FrmwhANqvdsVAIm4/Iw2EgeteX6Hfi09tf8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxDI8ePKdDZOAXliRroMebn6AMxr7ISvBpsRGEk2L3Pd5O+Caa7y+quIDzqRSG1icrDK70XMLfD/mAQIY4hlzLPwiFd5mo1+3tT9xvVvjAAwHxE93EXeMKsBP3aUZ6CMpQPSKQ1q5pXa3cATa5D5i7cgtnLnjq8axPGPhBkOQ4AHva4J4XQSH8fiBcNSkD3KRmKyAXgfQLLLoLKbVCTSJwFW+AT92WOYo1UHEnzUYqrBoUYP6cRdT7ZOo4kGlHYZduccSV8cgDO11l2Sr6D8q8X5pcQ4qSPzkRBZIBZlgQJSZilTIVaiouroBSiJ14TB7PEy2lowWKRSuxRUhgGVxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=nZFRZ367; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org) smtp.mailfrom=cloud.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=nZFRZ367;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloud.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQr225BCKz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 04:23:53 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4311d972e3eso12662975e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728753828; x=1729358628; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1JC6Ki9FrmwhANqvdsVAIm4/Iw2EgeteX6Hfi09tf8c=;
        b=nZFRZ367xNXYzA/QFjL9d087MlKj15+uXuMgrI9yKTz9okCpgjQO8nxCP9SGe/jXo/
         eI+2FFNmG1NjAW2x8wxMYqkpzhsvKujiExiuZFJFor5bk8qqJPXjFYolhc6oUapgUa0z
         nHlo6yv7sCUSHSHpZnxfRB6pvq+Fdj0KigOqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728753828; x=1729358628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JC6Ki9FrmwhANqvdsVAIm4/Iw2EgeteX6Hfi09tf8c=;
        b=nubdJ1e2xD8fh2oG4mZZqWWQb9e+7vV22vWdIjEdQf7g280o0Zhhx9LqGGLxzP+zu6
         xc9qwpT2y4T6RA3NXU8WNMwe8xpHqm0qwuXVDQXXLZFATwabiIut/PjGv96R2rZret3z
         qCPX29wuYLVeWFSJ4gDMfnQ3wQtYqusapnbLjcgepz1/BoHUcC6tec40vEAHeE4IeaOL
         Zvz6bA492wTAg/MRdl7IUDQtTQXJ5NZuO4PM9sWzUWeC6uRILhzTCdUBnQ7RvulobIE+
         xZpQ/9uS/omUy/gqxshSLNPVQbtXBSszII762Fd0QjOpf0U6Veor4RoFhkeZxqbkrsgt
         tPSg==
X-Forwarded-Encrypted: i=1; AJvYcCUMqzoHnS4Vq8zh/u4DdIK56+ynPYuYp7RaspFFcGgYrVte1WJbs75YhKRdO0oaFD5mecvqev9edLyJuck=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxoDl82BN4jgV/1A9DAJfgFAh6qDM7HJKuqekJxgTkvkCMC81VM
	39ZVnfTYShSJ7bytx8f+ZUbsMiOFLJDsXpiNjl8TOUdQnfl4KEfFoG3w+M7VJoA=
X-Google-Smtp-Source: AGHT+IG2ZSA7wMyUmEqIhPeSE68vOVmzmyXIuGZ6tK9YwFyHyVDePsl5776b4xLtcN/Oh1jkkz0bFg==
X-Received: by 2002:a05:600c:444f:b0:42f:8515:e479 with SMTP id 5b1f17b1804b1-431255d4e6cmr23872965e9.4.1728753827596;
        Sat, 12 Oct 2024 10:23:47 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748cddasm104836575e9.40.2024.10.12.10.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 10:23:46 -0700 (PDT)
Message-ID: <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
Date: Sat, 12 Oct 2024 18:23:46 +0100
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
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/10/2024 4:44 pm, Linus Torvalds wrote:
> On Sat, 12 Oct 2024 at 01:49, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> You do realise mask_user_address() is unsafe under speculation on AMD
>> systems?
> That had *better* not be true.

Yeah I'd prefer it wasn't true either.
>> Had the mask_user_address() patch been put for review, this feedback
>> would have been given then.
> That's BS.
>
> Why? Look at commit b19b74bc99b1 ("x86/mm: Rework address range check
> in get_user() and put_user()").

That looks like 3 Intel tags and 0 AMD tags.

But ok, I didn't spot this one, and it looks unsafe too.  It was not
reviewed by anyone that had a reasonable expectation to know AMD's
microarchitectural behaviour.

Previously, the STAC protected against bad prediction of the JAE and
prevented dereferencing the pointer if it was greater than TASK_SIZE.

Importantly for the issue at hand, the calculation against TASK_SIZE
excluded the whole non-canonical region.

> This mask_user_address() thing is how we've been doing a regular
> get/put_user() for the last 18 months. It's *exactly* the same
> pattern:
>
>         mov %rax, %rdx
>         sar $63, %rdx
>         or %rdx, %rax
>
> ie we saturate the sign bit.

This logic is asymmetric.

For an address in the upper half (canonical or non-canonical), it ORs
with -1 and fully replaces the prior address.

For an address in the lower half (canonical or non-canonical), it leaves
the value intact, as either canonical or non-canoncal.

Then the pointer is architecturally dereferenced, relying on catching
#PF/#GP for the slow path.  Architecturally, this is safe.


Micro-architecturally though, AMD CPUs use bit 47, not 63, in the TLB
lookup.  This behaviour dates from the K8, and is exposed somewhat in
the virt extensions.

When userspace passes in a non-canonical pointer in the low half of the
address space but with bit 47 set, it will be considered a high-half
pointer when sent for TLB lookup, and the pagetables say it's a
supervisor mapping, so the memory access will be permitted to go ahead
speculatively.  Only later does the pipeline realise the address was
non-canonical and raise #GP.

This lets userspace directly target and load anything cacheable in the
kernel mappings.  It's not as easy to exploit as Meltdown on Intel, but
it known behaviour, and been the subject of academic work for 4 years.

~Andrew

