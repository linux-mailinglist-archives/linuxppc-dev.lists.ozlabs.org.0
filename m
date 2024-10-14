Return-Path: <linuxppc-dev+bounces-2186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAE799C065
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 08:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRnvH0jkWz3bdX;
	Mon, 14 Oct 2024 17:51:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728888683;
	cv=none; b=E03YO+/6Mdd1F5Xj9GUFgX3spAZ9Q5aLHRgB2NRG/m1bRPUXKhE9Dnh4fgW/SSCNVORrDVqkMYlwWVZcDpHWemDAJiq9PVDkPHZpiBohlsrD1BKKWDP/QDQQHNElJ7gNJWfJQ1ZgYkW+/0oKov0AEP8FcJOCxjioiofPUNgKoSYhm1bz6xd6BfMsCZBJgSb/xuqv6WSEO+nAuXxgyyufIyrt8wftkARlpOgYhQcvpr2UuL0JX4+RLbsnlWIuB/L98rV9oQuv0M6kbA+haN7qj0cIIeuMLoxYpzVRtNkgY0OBa/C+L6YwP7+X+zRWLBW5LXYNwvf2q21RdzfXlSZmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728888683; c=relaxed/relaxed;
	bh=2Veu4Ioxhdeia7WatOm33is5uYZrh1/SkX57W1YbtQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fqvr+6sLorsGqoR1jS7wgNjwMVGSiv31Jg4c1YOyop9T8KN+JkYnpfH+w43SSKHf9faHSEUnk9STRw7Gk3eQ6Tv9yomEBuqhhIFHNUvm87iApgfKUJ3zv0hu0UTP6VUK27+ByHdKSnxaNqKdCsiKUl/dzEdisUV9BBvKVQHAgU3cZKsg6dkVqTaRWd4qpcN1+R2t5xXBN2Rg2kKU9CS0K+PjnMsYF5VPd3fm9akxhO5d0B3o1CjZTMTiEiXpaz8jNXGClaqcODnC5zP7GY5HXa5T8LPW6pOHGrykmu0k4nJjca38bpzV89AmXoXnomzSWVW+yxtxWNpXUI/ob0D1zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HG1toBef; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HG1toBef;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRnvF2DJrz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 17:51:19 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso91506566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 23:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728888676; x=1729493476; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Veu4Ioxhdeia7WatOm33is5uYZrh1/SkX57W1YbtQI=;
        b=HG1toBefAaU9Gk4HOmC8TZEzWXQdFgLdwooTMcZvovfvSjCkTuZ0TuPixGuxRAP0sC
         7ygVyJqIULvtfCYwOq6zpZkjrglkDrb+vZNw2LwIiwzjL6xEOlSm5IRa5Z/mN1kLW0/e
         mTITf5C+B9/a5sD+0A1eaSN8rVmMlXTsOaiUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728888676; x=1729493476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Veu4Ioxhdeia7WatOm33is5uYZrh1/SkX57W1YbtQI=;
        b=uqpG1BjVXGaN3S/e2OE25xDX5wfwMJpF5U8Wmr4eAOD9L7yQb1mFw4/XuJ4D1gJ0Sv
         P4MwUGIrJscjF41MGs4VZIj86NyK4SIwWoIQRctk6vqGmgan66wH67/Se6hSlf5o5Edq
         tQGHenURGdbNDKgiDvovFKwZu/3bWWgETdx4qqQm34ULyuUBmTRkoPdswctlbvw6cYXD
         CyuQrhsgc9i6iOLkUf1bDiki2wajLehlfjuAmoB87nJSx8e++7yj2J3mJxZq1N12Gc17
         k4ku3rIantYUXAoXhbPiSEtNfcbYC4FCBuGzo+HwLJsrhFuHuPTszkW3sB4M0TAAfwjg
         IZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnvMkif5kolzoECptDAY+ePHT0vCZsAlt9qRCybhq163ZFB356k1r2ssE36C/mxmk4lUwhbRbRgqB9NM4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnK9LTSnwBQrPDuRCHGfTCdBFcHbyf2X6VLkSKYF9XHhMixSXe
	qTlsCbjaVC+CTkxWqMN+y9/jQaj5IHlTZ4Bl2r28IA9KR+XOJ0/B9WX92GKiEw9ZBPuRho4Bjge
	lAQs=
X-Google-Smtp-Source: AGHT+IFi1JJQcrsapU13DiJK9PFhlCOXxnYga7DoOLHdm5rjCi+oOAOC2rDy2MnwzaLws1qxTbOxGQ==
X-Received: by 2002:a17:907:72c3:b0:a99:fb10:128e with SMTP id a640c23a62f3a-a99fb10244fmr349237566b.36.1728888675101;
        Sun, 13 Oct 2024 23:51:15 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a094dc139sm146983566b.214.2024.10.13.23.51.12
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 23:51:13 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so4146061a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 23:51:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUASVcMmLPdSehO3oV/Mr/pZI+fo5yscqs/4jV0v31p3pBnklWu0u7JiRd7TZ85w8Bcl7wnUKF8JuEZr6U=@lists.ozlabs.org
X-Received: by 2002:a17:907:a08a:b0:a99:4654:caeb with SMTP id
 a640c23a62f3a-a99b93cae66mr945335966b.35.1728888672374; Sun, 13 Oct 2024
 23:51:12 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com> <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com> <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com> <20241014035436.nsleqolyj3xxysrr@treble>
In-Reply-To: <20241014035436.nsleqolyj3xxysrr@treble>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Oct 2024 23:50:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
Message-ID: <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: multipart/mixed; boundary="0000000000002c93b506246a4398"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--0000000000002c93b506246a4398
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Oct 2024 at 20:54, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> If I understand correctly, LAM bits are for the benefit of SW and are
> ignored by HW?  Can we just mask those bits off?

Yes. But then you waste time on the masking, but particularly if it
then causes silly extra overhead just to get the mask.

That was why the whole original LAM patches were dismissed - not
because an "and" instruction to remove the LAM bits would be
expensive, but because when you do static branching depending on it
and then load the mask from memory, the code goes from nice simple
straight-line efficient code to a horrible mess.

The early LAM patches admittedly made it even worse because it did a
per-thread mask etc, so it really got quite nasty and wasn't just
*one* static jump to a constant. But still..

> > So maybe the "what is the actual cycle latency of detecting the
> > faulting instruction" really is the core question here.
>
> I think I remember reading that STAC/CLAC can't necessarily be relied on
> as a speculation barrier, depending on microarchitectural details.  It
> might be safest to assume we can't rely on that.  Masking is relatively
> cheap anyway.

The WHOLE BUG is all about "microarchitectural details".

So arguing that STAC is a microarchitectural detail and not
architecturally guaranteed isn't an argument.

Because architecturally, this but simply does not exist, and so some
architectural definition simply doesn't matter.

So all that matters is whether the broken microarchitectures that used
the wrong bit for testing also have a STAC that basically hides the
bug.

Christ. The hardware should have used a bit that is *MEANINGFUL*,
namely bit #63, not some random meaningless bit that just happens to
be one of the bits that is then checked for canonicality.

And it's so annoying, because from a *hardware* perspective, bit #63
vs bit #48 is completely irrelevant. It's literally just a wire choice

But from an architectural perspective, bit #63 is not only the
*actual* bit that is the real difference  ("kernel is at the top of
the address space") but for software, bit #48 is fundamentally harder
to test.

IOW, it's completely the wrong effing bit to test.

Honestly, the Intel meltdown thing I at least understood *why* it happened.

This AMD "use meaningless bit #48" bug just strikes me as active malice.

The paper I found for this bug doesn't go into any details of what the
cycle count issues are until the full address is verified, and doesn't
even mention which micro-architectures are affected. It says "Zen+"
and "Zen 2", from a quick read.

The AMD note doesn't say even that. Is this *all* Zen cores? If not,
when did it get fixed?

> So far I have something like the below which is completely untested and
> probably actively wrong in some places.

This is worse than actively wrong. It's just adding insult to injury.

> +static inline bool __access_ok(const void __user *ptr, unsigned long size)
> +{
> +       unsigned long addr = (__force unsigned long)untagged_addr(ptr);
> +       unsigned long limit = TASK_SIZE_MAX;

We're not encouraging this complete microarchitectural incompetence by
using something expensive like TASK_SIZE_MAX, which actually expands
to be conditional on pgtable_l5_enabled() and a shift (maybe the
compiler ends up moving the shift into both sides of the
conditional?).

Which isn't even the right thing, because presumably as far as the
HARDWARE is concerned, the actual width of the TLB is what gets
tested,  and isn't actually dependent on whether 5-level paging is
actually *enabled* or not, but on whether the hardware *supports*
5-level paging.

I guess as long as we aren't using the high bits, we can just clear
all of them (so if we just always clear bit #57 when we also clear
#48, we are ok), but it still seems wrong in addition to being
pointlessly expensive.

> +#define mask_user_address(x) \
> +       ((typeof(x))((__force unsigned long)(x) & ((1UL << __VIRTUAL_MASK_SHIFT) - 1)))

No. Again, that code makes it look like it's some nice simple
constant. It's not. __VIRTUAL_MASK_SHIFT is that conditional thing
based on pgtable_l5_enabled(). So now you have static branches etc
craziness instead of having a nice constant.

We can fix this, but no, we're not going "hardware people did
something incredibly stupid, so now to balance things out, *we* will
do something equally stupid".

We are going to be better than that.

So the way to fix this properly - if it even needs fixing - is to just
have an actual assembler alternate that does something like this in
get_user.S, and does the same for the C code for mask_user_address().

And it needs a *big* comment about the stupidity of hardware checking
the wrong bit that has no semantic meaning except for it (too late!)
being tested for being canonical with the actual bit that matters (ie
bit #63).

And again, the whole "if it even needs fixing" is a big thing. Maybe
STAC is just taking long enough that the canonicality check *has* been
done. We know the STAC isn't a serializing instruction, but we also
*do* know that STAC sure as hell will synchronize at least to some
degree with memory access permission testing, because that's literally
the whole and only point of it.

(Of course, if the AC bit was just passed along from the front end and
tagged all the instructions, the actual CLAC/STAC instructions
wouldn't need to serializing with actual instruction execution, but if
that was the case they wouldn't be as expensive as I see them being in
profiles, so we know the uarch isn't doing something that clever).

Christ. I thought I was over being annoyed by hardware bugs. But this
hardware bug is just annoying in how *stupid* it is.

Anyway, the attached patch

 (a) only fixes get_user() - I assume put_user() doesn't even need
this, because the store will go into the store buffer, and certainly
be killed before it gets anywhere else?

 (b) only does the asm side, the mask_user_address() would need to do
the same thing using the C version: alternative()

 (c) is entirely untested, and I might have gotten the constants wrong
or some other logic wrong.

but at least the code it generates doesn't look actively like garbage.
It generates something like this:

        mov    %rax,%rdx
        sar    $0x3f,%rdx
        or     %rdx,%rax
        movabs $0x80007fffffffffff,%rdx
        and    %rdx,%rax

which looks about as good as it gets (assuming I didn't screw up the constant).

The "or" still sets all bits when it's one of the real kernel
addresses), but the "and" will now guarantee that the end result is
canonical for positive addresses, and guaranteed non-canonical - and
for this AMD bug, a zero bit 48/57 - for the invalid kernel range.

Yes, it basically means that as far as the kernel is concerned,
"everything is LAM".

The kernel would actually accept all positive addresses, and only
fault (now with a non-canonical GP fault) when users try to use
negative addresses.

Which is arguably also quite horrendous, but it's effectively what
having LAM enabled would do in hardware anyway, so hey, it's "forward
looking". Bah.

And we could make the masking constants be 0xfeff7fffffffffff and
0xfeffffffffffff, and *only* mask off bit 48/57.

And we could even make the whole "and" be conditional on the AMD bug
with a new X86_FEATURE_CANONICAL_LEAK thing.

So there are certainly options in this area.

             Linus

--0000000000002c93b506246a4398
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m28mqu1u0>
X-Attachment-Id: f_m28mqu1u0

IGFyY2gveDg2L2xpYi9nZXR1c2VyLlMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2xpYi9nZXR1c2VyLlMgYi9hcmNoL3g4
Ni9saWIvZ2V0dXNlci5TCmluZGV4IGQwNjZhZWNmOGFlYi4uN2Q1NzMwYWExOGI4IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9saWIvZ2V0dXNlci5TCisrKyBiL2FyY2gveDg2L2xpYi9nZXR1c2VyLlMK
QEAgLTM3LDExICszNywxNyBAQAogCiAjZGVmaW5lIEFTTV9CQVJSSUVSX05PU1BFQyBBTFRFUk5B
VElWRSAiIiwgImxmZW5jZSIsIFg4Nl9GRUFUVVJFX0xGRU5DRV9SRFRTQwogCisjZGVmaW5lIFg4
Nl9DQU5PTklDQUxfTUFTSyBBTFRFUk5BVElWRSBcCisJIm1vdnEgJDB4ODAwMDdmZmZmZmZmZmZm
ZiwlcmR4IiwgXAorCSJtb3ZxICQweDgwZmZmZmZmZmZmZmZmZmYsJXJkeCIsIFg4Nl9GRUFUVVJF
X0xBNTcKKwogLm1hY3JvIGNoZWNrX3JhbmdlIHNpemU6cmVxCiAuaWYgSVNfRU5BQkxFRChDT05G
SUdfWDg2XzY0KQogCW1vdiAlcmF4LCAlcmR4CiAJc2FyICQ2MywgJXJkeAogCW9yICVyZHgsICVy
YXgKKwlYODZfQ0FOT05JQ0FMX01BU0sKKwlhbmQgJXJkeCwlcmF4CiAuZWxzZQogCWNtcCAkVEFT
S19TSVpFX01BWC1cc2l6ZSsxLCAlZWF4CiAJamFlIC5MYmFkX2dldF91c2VyCg==
--0000000000002c93b506246a4398--

