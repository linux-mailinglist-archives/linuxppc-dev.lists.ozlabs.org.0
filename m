Return-Path: <linuxppc-dev+bounces-2648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D9B9B3961
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 19:44:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xcj3p5lLCz2yK9;
	Tue, 29 Oct 2024 05:44:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730141078;
	cv=none; b=YvgdGQs+X7y+ctXpZajROmKuWBfV80DWGhSKYDQC85npzVFpSanTcApxk1R9FfjzapxR/G+L5FSayZfLKMchxRgDPMy7reuHt3l42xLP1Z28fepqEsRljfgyNMDs6+hEUd6VsAzG8mmcvX0wOYxbNfFwuCE8wszOEDFitwDyCajC+KkOoSrgcIL8Tv/zIgrHCmrfLOiSqDpJpUs5n3k5170LsvRQryz+/xeE5yzmQaX2fqL3tnzTay1ZkwJCY+ukjOp74A/yHIAhHfRelLyGMMOTqIkYnbENQ4Q/qKukI4mb7i+YlW9Lq/7bYzty2zzT0WYYBqh7pJOfZuGkz7/dXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730141078; c=relaxed/relaxed;
	bh=kAsynRYZcfuek8CO04G7XcZJoFHudxUZihfk6GgohqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMgarvWjKizojmv4ElG1Cosdb6OiCGSJ1cB4vlNhPus2d2FdTyaIQx9Be4GdUpg1bx+/KZ5iZZB6NUkz/1au6bVZK7b9rUsyPfHG49R5h8hzghF2cRllDDPvzwuzap1HtFYu3mcSFAw3reLqDGNycMzfxVzTiriFvuxkSqFeqT4ni/nxxDxAV7y0+RED4llQJneqe9Wxu5z3niZeIDJ2+UtaJgRYH7Bdk/7ZNeSwMjuEHE29gQPC2mGDA/VYVWzMSU+OjRgyNWEl7X5HAVND8HR2CTL3cEnQYFmto7I7MNhRLLglTf6Z3SypBwdHhL9XjxyByVRS12c3Gx+ACIpSbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=g14nPMBJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=g14nPMBJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xcj3n3xyvz2y7J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 05:44:37 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so727461566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1730141069; x=1730745869; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kAsynRYZcfuek8CO04G7XcZJoFHudxUZihfk6GgohqE=;
        b=g14nPMBJZjX7K+GYacyN5T/Gf77LBi6SrBTiPE6l8rXS0k4EEyGMxdfWIX1E6yh38S
         xUfbWOrv7X94x64vhPDBWd/jqEPoYR40NNUfWaXfxw+QZvmYVBhSLq7ebz78Qd0xAKaa
         oP0EisLnnAKU7JyYT7nIk2S4jwC0LYmex9CAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141069; x=1730745869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAsynRYZcfuek8CO04G7XcZJoFHudxUZihfk6GgohqE=;
        b=aKxSuPlWnrprpy7FAZEjzR4ViAfMfVm5uP/RHXJAWpIyevVLfLvV0YQZIc45BPaVo7
         NUfOemLlXYvpMnXcfMAPrdi4ymVkF2qsuQql1pq9xDPFMn8q8vhEGXYRxmgTvdqO4xBs
         MOfT/obwKInMkAgv8py5UL0qIARXl0IJ3jgrabv6cwxOTvjrFoU0WLcDaQ2FswA93bYc
         wkgj0KMhzY4sx+imYjP2oaKUuVmo6seVS0/my561lL2x34pt6jIDW2vkfHXT3XIg2Sdj
         9x+t1B2IRz4Povy9fPNxjNoF/OKkDfL27blAtYBH8zFHJDrFrWmywT3xsXRtjOyxDEU6
         XiRA==
X-Forwarded-Encrypted: i=1; AJvYcCWu3wvn2oKVaSo58fIU+NYJQPfE5soNaFbR2UG5Sy4llKb6PMBhEAVId5wqQL9Iun9D+No2MulaJn/YfnM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxTwBePD5zKiXMGwzs8g7rp5sb+2UX+3Y4rOEdZR3Pq+S59z5l
	VxjM43lUhnyETWqB20Pfu6BYCLGQ7rbcT7+R31GHWZcTcNzMzzT8VftopBeCvfVlUWoocJSyfmi
	cgAY=
X-Google-Smtp-Source: AGHT+IEGFu9qaBTVHTX/hFm969XQvIkR9RVjaXR3o6Qzi8Ig6ZhUH95dF9mLyzqzPtU0E+KC44Bj1A==
X-Received: by 2002:a17:907:94d0:b0:a9a:634:dd2 with SMTP id a640c23a62f3a-a9de61ceb81mr875665066b.43.1730141068920;
        Mon, 28 Oct 2024 11:44:28 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9afcef10efsm399700666b.0.2024.10.28.11.44.27
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 11:44:28 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso650536566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 11:44:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDbo+vBq/NpQbIHxoPT1b7ODlL+G8kXm3HowWKgeHyA9okvE9JfiL41a2sxy3iUpKAdrzMNT57+gsQ0lo=@lists.ozlabs.org
X-Received: by 2002:a17:907:9604:b0:a99:f4be:7a6a with SMTP id
 a640c23a62f3a-a9de61ce626mr743153466b.47.1730141067613; Mon, 28 Oct 2024
 11:44:27 -0700 (PDT)
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
MIME-Version: 1.0
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
 <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
 <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com> <p6jzuqlphu5va5rroybfmofxaxcveyj6mc724xunzdm6ocwk23@jv7bemzdczg2>
 <CAHk-=wh-PjG_cF7ujBFmG7G6qGL3hzC-6ged+mbSECkp72wHVw@mail.gmail.com> <rjjwtpbxal4glznnkp6a65rtbynn3plrrcgwdg2ucaacmjrnqd@5otngejwtuzu>
In-Reply-To: <rjjwtpbxal4glznnkp6a65rtbynn3plrrcgwdg2ucaacmjrnqd@5otngejwtuzu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Oct 2024 08:44:10 -1000
X-Gmail-Original-Message-ID: <CAHk-=whhLqN9SQ++JbLWbWv+oaWYtwrikbUGD0W7sq=BfasZrw@mail.gmail.com>
Message-ID: <CAHk-=whhLqN9SQ++JbLWbWv+oaWYtwrikbUGD0W7sq=BfasZrw@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 28 Oct 2024 at 01:29, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> I think it is worth looking at this approach again as it gets better
> code: removes two instructions from get_user() and doesn't get flags
> involved.

The problem with the 'and' is that it's just re-introducing the same old bug.

> The mask only clears bit 47/56. It gets us stronger canonicality check on
> machines with LAM off.

But it means that you can just pass in non-canonical addresses, and
cause the same old AMD data leak.

And yes, it so happens that the AMD microarchitectures use bit 47/56
for "user address", and now it's only leaking user data, but that's a
random microarchitectural choice - and a really horribly bad one at
that.

IOW, the WHOLE BUG was because some AMD engineer decided to use bits
[0..48] for indexing, when they SHOULD have used [0..47,63], since
bits 63 and 48 *should* be the same, and the latter is the one that is
a hell of a lot more convenient and obvious, and would have made ALL
of this completely irrelevant, and we'd have just used the sign bit
and everything would be fine.

But instead of picking the sane bit, they picked a random bit.

And now I think your patch has two bugs in it:

 - it depends on that random undocumented microarchitectural mistake

 - it uses __VIRTUAL_MASK_SHIFT which probably doesn't even match what
hardware does

I The *hardware* presumably uses either bit 47/56 because that's the
actual hardware width of the TLB / cache matching.

But __VIRTUAL_MASK_SHIFT is hardcoded to 47 is 5-level page tables are disabled.

So no. We're not replacing one simple microarchitectural assumption
(sign bit is sufficient for safety) with another more complicated one
(bit X is sufficient for safety).

        Linus

