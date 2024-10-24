Return-Path: <linuxppc-dev+bounces-2533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC19AD985
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 04:01:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYpzj1fqpz2y7M;
	Thu, 24 Oct 2024 13:01:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729735265;
	cv=none; b=Yr+JI3cYewAqN7neVHW1UBxYDKcC3mB0R47Bxo+TBz45H+9eUo9/KAZnknPmIPDSXdL+k3+fL1HkkMVEHt47u5NQSHJNJVKn0iGjjHn1Zp8uKM8DrVdcNOBhWbgV8/kItuhcyJPBXBxc+I9JLOjniigoVjMI+XiZ+USGo99GieFqf0SVYkDrTd8tabS5idgjKSP+OQb0jXMn7nJqluPmvUWI9P6Net2Ojuc8/JBk/4gyxjb2tsZtWr0jLVk9t4Fk6FIqJE/LYCDjksk24TI9isZJ1BiFSoJkIyDo/21cuxrZLIebV0fU0sebw5F7nTzZknrUL6vMpEAM2w1+d2HBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729735265; c=relaxed/relaxed;
	bh=Ql0UckbA+6O9PQrHKDtH1epWn4sOLsDJTcO5IixusbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fbncuv50+7Yp1rQua5LcDbDBqjrLxpZdUJYxIjM4ufeAsnNrQOZy4TXOv8ODScRSNIkdVH+b0s5EoXY2vHnIl2SpziNBPToBwZp8x45r3QJLvAlcnoGYWJL8LLElW025S6jxTqBhBizoPa6wIVSJ/0k5dXqBEGQk28+3jAIPgASQEUvKGGh2yyLjPa3Jr/AZ+Pj3XA1DfstEjK8Z0I/5p3IiEFWPTpklyWopzvfkOSjnuxLDXmMbdj5j/M+0djm1CxR5Z/kzjUFGAfgouM/a2/QaHwRxtJRfg2TRZrbfCTHBmlV1fTQia3u1zletFmMIgW6T0wjVMnkC45fkVjFAOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=b9A+AGat; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=b9A+AGat;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYpzc1xJRz2xt7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 13:00:58 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so443308a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 19:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729735252; x=1730340052; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ql0UckbA+6O9PQrHKDtH1epWn4sOLsDJTcO5IixusbI=;
        b=b9A+AGatIiOL/EJeS9z8za+K2jcobToVg51k/QDY5Hz5SaVyson8ndIgdGvhD90gmr
         qTeoYRnOl625hqfO0TNWM5PZ4YAn2UC6G3j49xQRU9/js5iFgGWsXmtzPEyq5VaA9YCz
         EigH9mdYeoYhaSCBmDu7jXwrqigLw0gXTVoaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729735252; x=1730340052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql0UckbA+6O9PQrHKDtH1epWn4sOLsDJTcO5IixusbI=;
        b=EpXuCQSfZYzMlpvrfqT2Z3yOCbGLg8BVe9AbYC/ZKzFErV33jjAiJHVZIS1uvQVfg+
         0WR+Mn9QDHkBT1c7vBScJTwWUo9BkSzttzDmHGmwW0tp61uexfvu1eGQu6vODoZwLOUn
         hk3dreDEvBO+7qUeFzCNUCGKviaAEFTSqQj1IdwsQryTIp/l4LjTEX/d48CeRddJJuFt
         Guqs6STVLTITNeikNeTfl92yQtFTtpZVi9OYHsXvRp3btTx2fHTYwgFYC34mt7cz9hi8
         ROaoYYdLpAXttna7T0iI98WB6Q4b2r0t3nJZ5rOnErahos8LbP2sgXll31XA75SWkuRd
         YsgA==
X-Forwarded-Encrypted: i=1; AJvYcCUFywgm7piOBkBhIQVfjObHwQVGStmgZcucDsfv5kdHPrbsnwQpe2++4hyH4NKHsUYVIN5ZnO0ki9NygJc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEjN8Bt2nMMzWCSelOv1dGHIS+TzQ83HoOuQilsblEd1MkPUa8
	gqeSCi/kAE9xEPasj/gZ7mVJWh1SATlQ7GoEHsXXMlDjwdUUX0OZWSYhY1BFirasblNcikfg2k+
	j90fPYw==
X-Google-Smtp-Source: AGHT+IEXH8J5cLGnBGhftWefQezjx3LNBfVcLMpU02dUgP6TmU/SrjE5/AjGrK4V9lGMZCzbRkMtiQ==
X-Received: by 2002:a05:6402:1e89:b0:5c9:6eea:8e06 with SMTP id 4fb4d7f45d1cf-5cba2493b0amr256461a12.24.1729735251901;
        Wed, 23 Oct 2024 19:00:51 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c6b163sm5275755a12.76.2024.10.23.19.00.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 19:00:50 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a156513a1so46223566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 19:00:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWH8FA6WNzdoUrf/co5KqNsNotwOIbZ+cvCb13XH+8cBa6SDyqwvaXN0ZbW0cu1mHs5SVk2L8ud7wxfQbI=@lists.ozlabs.org
X-Received: by 2002:a17:907:72ca:b0:a99:33dd:d8a0 with SMTP id
 a640c23a62f3a-a9ad275d4b6mr24170966b.38.1729735249457; Wed, 23 Oct 2024
 19:00:49 -0700 (PDT)
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
 <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com> <CAHk-=wg7cptRdM0qpB5O7Z9GuDPXE5Z3Udm_nkaq2F_A1HUbuQ@mail.gmail.com>
In-Reply-To: <CAHk-=wg7cptRdM0qpB5O7Z9GuDPXE5Z3Udm_nkaq2F_A1HUbuQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 19:00:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB+6vqW4jDSuhr_2FiFDA-kHq9w1Yw62_sb_nLMs+YsA@mail.gmail.com>
Message-ID: <CAHk-=wiB+6vqW4jDSuhr_2FiFDA-kHq9w1Yw62_sb_nLMs+YsA@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Borislav Petkov <bp@alien8.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 23 Oct 2024 at 16:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And I guess I should make "__put_user()" do the same thing, just so
> that we only have one sequence.

No, I decided it's not worth it. The put_user side already also
doesn't do any other speculation barriers, simply because it has no
speculative outputs that could then be used in some gadget to leak
anything.

I did extend the USER_ADDR_MAX logic to valid_user_address(), and I
wrote a commit log. And sent out what I *think* is a good patch to
lkml and the x86 maintainers:

    https://lore.kernel.org/all/20241024013214.129639-1-torvalds@linux-foundation.org/

I'm not super-happy with the open-coded magic runtime section stuff in
getuser.S, but with no other asm users I also didn't want to randomly
pollute some header file with ugly asm-specific macros that only get
used in one place.

Also, I left the LAM case in, but disabled in a comment about how it
should be gated by LASS. So that code isn't actually enabled right
now.

Does anybody see any issues with that patch? It's not that many actual
lines of code, and I've been staring at it pretty much all day today
(in case anybody wondered why no pull requests), but I've been staring
at it so much that I'm patch-blind by now.

I've also looked at the generated code. You can look at the asm
output, of course, but that ends up being pretty messy due to the
fixup hackery. I've been doing

   objdump --disassemble --no-addresses --no-show-raw-insn vmlinux

and you can see where this gets used by searching for
"0x123456789abcdef" in the objdumpo disassembly. That's the runtime
constant that gets rewritten. Obviously some of them are for another
runtime constant (ie dcache_hash), but it's pretty obvious.

The code generation seems ok, but like the patch, I'm getting
code-blind from having looked at the same thing too many times. Yes,
it looked better when it only used the sign bit, but oh well..

And yes, I'm running that code now, and I did a few tests with system
calls with invalid addresses and some debug output. Which is still not
saying "it has no bugs", but at least any bugs aren't obvious to me.

                    Linus

