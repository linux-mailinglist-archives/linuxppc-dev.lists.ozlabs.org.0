Return-Path: <linuxppc-dev+bounces-2550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9E59AECB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 18:54:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZBpJ2p4vz2yPR;
	Fri, 25 Oct 2024 03:54:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729788856;
	cv=none; b=YDNjs+XA0SU03dg4LbqNJ0OjbcJUic6iYEjhZbBADPW9Onmo4ODRpwwdneoib9wRf/VLOQDVZgJ4zjt/TVbQvQQQHw3/iZwSLu4LeDNv8PS+b98sEnfK9Qd8p5aNj4zUXRSPPQlEdgU3Jy2paBlzazwucUNzEFkmAeW8Fc3YOBY5iroBVwc1hAWvl15Fd/X/uwusjxwU5L3DyIY2Z7KYfdXT8x0OeIYlUTw8eE/yExwzfIoALbeCKwxI00iiWBNfY0djYdmfY9gsGYImcrEf+jZJ61S8/Y4QK1zbdPTMTwJ4K4jv2wd7RPkEfUXj2hPPdXjhQP+L9Sjb1fsGIqc+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729788856; c=relaxed/relaxed;
	bh=8vZtlZMqnSKGUtBusgEAIWSnXvv6eiXaLwXYqGf4G/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m48Ioe4KqIj1H1QUSaRUq7HQ2DM5i0fa2wfzAdFKuag96D45vMca6mz9a2bVZl3ccXI/ME+I8QgTgN+ZjnMlexF8KXemWKgVX1SVkrElpDVSYh9aVTHgoiciZ3661N5tyxz07GX/1cOnXbznxZZ7yO+xR81npbEC3WGVVJKqgKV46wKNutfUiCCvV+QzwW4H7+tlAgoevdt0vZG1m5iHrsMLRaqwkWQPMHyPc52D9uUiq8bEHWRUlGajVJX/p0NJi1hgqnanqrD6QIj5Hon5ztzW7z4A4H5es2/i4rzen01IIDxzbGvY+yady5ZbXpdA1IYwRAYHx2UQKRDCAqDzvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dzRiC4Mq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dzRiC4Mq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZBpG58vYz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 03:54:13 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f84907caso1322087e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729788849; x=1730393649; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8vZtlZMqnSKGUtBusgEAIWSnXvv6eiXaLwXYqGf4G/U=;
        b=dzRiC4MqsTbtnORmAMObC8vEO22v24FRWardV0y1Zw7Cmg7/tXipPtDgKKzro96TEn
         OIez2oyM4+GSymNGSCi+F1Yp5jRrdsOc+zJhKXRU9nsoEJZ8uiTZpmV3cKaboR6EZ6F2
         3VF26E3R/Jzazjii5SbbXWZr3bBVHdZAUTULI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788849; x=1730393649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vZtlZMqnSKGUtBusgEAIWSnXvv6eiXaLwXYqGf4G/U=;
        b=prxPLECB8dUT0+daHW5muPMPCgBZqiFA+EWmNX1nxb4zQo9ZFLzI2BF1a4c8bXnNGb
         E+47VEcXrdBBD8+XYqWH4KyF5EW7TUT8lp5vSONXEB1XFddco7w/xAP/LhjYzN4G5cDG
         +yVvZwzuZbuwYet87JmWMS2o5yWLMC/Md5wVmCBaB/QqzUz9wl0Hno7T2PiIOSqU1dnM
         Ih6gs1tIZZ2gr7+O89GS+oONPzd0YJG1AKDCmcDvlrxh5H15BQ/R1TszMXrKvGs/IFWU
         rpY/nYzou7/wZ1YocqOTB51AyWuMNt0vPDZcVbVvRMNtEiM2EyNc4qMa4n7zBSbvJ3xO
         pt3A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6dDyUkqKKJlt9Mbj/zQgT6048ld5wEjQFZf79q5pemMkMs3c1x3e+FO4QTrKNHXIgF4Hhrwa5qzT0tQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRTf9GzSeXsaIyHvVRBaphBvBV0oCWjov7uEz23DV9YfcUOe0C
	YCALht2GJ9deQG5mNRFD8if9qplIVKI6qW9mh4w03qFRTQAAI3a46d7ALzMU1NI9HYBt58w9xY8
	5aXkMDQ==
X-Google-Smtp-Source: AGHT+IGgZhb5e8y/iL6Ljlzrvb6ePFreEt7tKZ0puF4Hpl7KNAzRWUqkajISiCCsT6txrT1cbwmiKw==
X-Received: by 2002:a05:6512:e92:b0:535:6892:3be3 with SMTP id 2adb3069b0e04-53b23e857edmr1688779e87.41.1729788848917;
        Thu, 24 Oct 2024 09:54:08 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6545csm6157166a12.39.2024.10.24.09.54.07
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 09:54:07 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99cc265e0aso158150066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 09:54:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYPw9la1AH4ej0nXhhmPf1iZusrLmlGBKNV8JfFMZqya2BYl3o0DJUPZHCwI3b8wQw7Sbn0ROAepdFmdo=@lists.ozlabs.org
X-Received: by 2002:a17:907:3d91:b0:a9a:3459:6b63 with SMTP id
 a640c23a62f3a-a9ad286b954mr238585966b.56.1729788847320; Thu, 24 Oct 2024
 09:54:07 -0700 (PDT)
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
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com> <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <20241020231112.erso2jzqwkbin4kh@treble> <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
 <20241023094448.GAZxjFkEOOF_DM83TQ@fat_crate.local> <CAHk-=wgDKPt554sAyzHvW1U+Opx_2Ofu4znjjroMWr1x90SU7A@mail.gmail.com>
 <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com> <c40199a2a319440d89bfcc5c06ec4b3a@AcuMS.aculab.com>
In-Reply-To: <c40199a2a319440d89bfcc5c06ec4b3a@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Oct 2024 09:53:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whY3P=hH1SV2LV8C3-A=ZjOJ1Sd+qLJQaai+Tiy2vHVvg@mail.gmail.com>
Message-ID: <CAHk-=whY3P=hH1SV2LV8C3-A=ZjOJ1Sd+qLJQaai+Tiy2vHVvg@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: David Laight <David.Laight@aculab.com>
Cc: Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, 
	"x86@kernel.org" <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 24 Oct 2024 at 02:22, David Laight <David.Laight@aculab.com> wrote:
>
> Would it be better to make the 'bogus' constant one that makes
> all accesses fail?

Well, the bogus constant is actually used for other runtime cases too
(well, right now that's only the dentry pointer, but could be more),
it's not some kind of "just for the max user address".

And for things like profiling, where the tools use the original object
code, making the bogus constant really obvious is actually helpful.

So I do think that "standing out" is more important than having some
value that has semantic meaning, when that value is going to be
overwritten at boot time.

> So you soon find out it any code doesn't get patched.

Yes, that would be nice, but if the simple patching logic is broken,
you have worse problems. The patching logic really is just a couple of
lines of code, and the location where we set this particular value is
literally next to the place we do all our other alternatives, so if
there's something wrong there, you basically have a broken system.

> I also wonder how big the table of addresses to patch is.
> If that gets into inlined functions it could be big.

It's 4 bytes per location, so yes, it grows linearly by use - but not very much.

And the patch table is in the init section that gets discarded after
boot, along with all the other things like the altinstructions and
things like the return sites for retpolines. Which are *much* bigger
and more common.

So yes, there's a table, and yes it grows, but at least in my personal
config, the USER_PTR_MAX table is 424 bytes - and we free it after
boot.  90% of that comes from 'access_ok()' sprinkled around and
inlined.

Just as a comparison, the altinstruction tables (both the pointers and
the actual replacement instructions) is 25kB in that config. Also a
drop in the ocean, and also something that gets free'd after init.

> OTOH having a real function that does access_ok(), clac and address
> masking may not problem.

access_ok() itself is so rarely used these days that we could out-line
it.  But the code cost of a function call is likely higher than
inlining the 8-byte constant and a couple of instructions: not because
the call instruction itself, but because of the code generation pain
around it (register save/restore etc).

IOW, the call instruction is just five bytes, but it will typically
cause spills and forced register choices for argument and return
value. It will obviously depend a lot on the context of the function
call, but to save 4 bytes for the table that gets freed, and have the
8-byte constant only once? That's a very false economy.

Eg an example code sequence (from a random place in the kernel that I
looked at with objdump is

        movabs $0x123456789abcdef,%rax
        cmp    %rsi,%rax
        jb     <__x64_sys_rt_sigreturn+0x20e>

and that's 19 bytes. But I tried it with a function call, and that
same function grew from 1320 bytes to 1324 bytes.

So the function call version generated 4 bytes bigger code. I didn't
figure out why, because register allocation was so different, but I do
think it's exactly that: function calls cause limits on register use.

So even if we didn't free the 4 byte entry after init, making
access_ok() a function call would actually not be a win.

And with how slow 'ret' instructions can be, we really don't want
small function calls.

In fact, it really makes me wonder if we should inline 'get_user()' entirely.

> Especially if there is always a (PAGE sized) gap between the highest
> user address and the lowest kernel address so the 'size' argument
> to access_ok() can be ignored on the assumption that the accesses
> are (reasonably) linear.

Yes, that's what we do right now for the inline code generation anyway.

(Ok, we actually do take the 'size' value into account when it's not
constant, or when it's huge, but even that is just out of a silly
abundance of caution and not a very common case).

                Linus

