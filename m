Return-Path: <linuxppc-dev+bounces-2321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6F9A0F66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 18:11:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTGDM2vPJz2xy6;
	Thu, 17 Oct 2024 03:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729095075;
	cv=none; b=BVMbNziUde61f5iwCxB4nmOMfizQs5k5GuopL4i7hlduQjaTuHnDHwmypb4Q5hEC2cC59enV015Lpnro6Ny2F3nTPvWEYINsF3hc56+iyY7m+ijlJRDN9/cKu8p3enj5TQk7La3qU/unnkiBFdc202mRK1BYlvcOvhA2RCk1Gdyj9sv3jYBpPjMRffmDbOnSOgVCvd5iDDU7YClLPvQaztYKmZXwJU+g2ivB05LfO+JTBSZiLYtT/rb0K6k0ddDmX12RCUCnmQuEE44+QH9ntBqnlsf9BZMhrfrhFZkAPL8drwROX5JKkRvGK3s1V9NtXkrsjSdsjyoV5hdXSLsLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729095075; c=relaxed/relaxed;
	bh=SyZ2QyMbyYQQaniYfUs6X1DWti3UANh7lWe64H5ofAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0RUMegYrvmNOuOXbcY1CUY+4PD7EDey45eOWT5nhHYewRU7uULG4/vGplm4pZ35Xr39ik8Nd4A2FEnw4LBsU5kxY76VoPrhNeDLi6FUHlXZiSbnZKtOzLbm7RZszd/sQ4QAzKz+ZZLvyVqrEomU8uj/Q1jp0jg10z/NTrSjcWeRfIGgpQDc31PlYG2QGF4QBXDkTJO4qHWT30GErtoXXoA/0xdBDwHfBvAoEP27sOT9YZSIHmhq10U6z+6qShgsaVFIL6GCRnJYNYkYuOjS9wCnDQvaSEGOu2876E/V4KiXfMvRtpkZ4smL8s49xKa69WbZ6ajhXnv46iGJv0pn3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SNUtcNgc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SNUtcNgc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTGDJ3B0tz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 03:11:10 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a99ebb390a5so211944166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729095066; x=1729699866; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SyZ2QyMbyYQQaniYfUs6X1DWti3UANh7lWe64H5ofAs=;
        b=SNUtcNgcuQMH18MAo+k21uBIVWRku7ei+YY2Gah2HKMb924q5CY6P0auRozoKnNxAT
         I5pg+MvwnkmGzYSakS23jc6h6Txbb8BJvL+UpdQwbmAhMStR5YLeOvsQFIom6qGzr/sQ
         Y2aZXrZSTQsTC2rEGwonYV/mOENReiZIjdBws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729095066; x=1729699866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SyZ2QyMbyYQQaniYfUs6X1DWti3UANh7lWe64H5ofAs=;
        b=bv2PhE4yGecqzv4M6A15iHTV/LWgqToYe5PiUVirtZALPmVnLh0HYKoLAHbtjjQYro
         /I6y87JyzNB6i/GGp1+XvKocHMIVz/f5ceZjgv7694kvhZrWc36CxJmiDECAFZ1m10OU
         6MIS2bwnMnrKJR0HjXmdkj4G5rHRqyXjD6TPL9w9lDagoxdeKd/cZy4JUONoWpx4fKbl
         B1gAQPDfCbR6FUqduC/yEtbYmHJMO0oBTdTAwYQM4yHyNFzk7fScg87BmO66fWwcfvQq
         wc+gBFGzbE4424QVCwMheigPnota3QKdVnY7drLBoqTPASPgmAbMFuPSDyv3zFVJvv7H
         6zHw==
X-Forwarded-Encrypted: i=1; AJvYcCXd/+2PcZCMH5mm1Cqf2o1snLxndQQxZTQIMrXW+UcCg4DSpYGNzcj1WOlr2gkpWue0IOEEfL+T+Nj7Ffs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7DvIcDjhBfIKNwCUWcvRP+u+muZ4wSRARojMpele6seNbfWul
	TAI4x7KZRRv51ZUmM7tTWOGj4fFnSHUTBKJne7rJeACwoKytglddTdZl6N7zOEEekTRA15vWle5
	DERBPeA==
X-Google-Smtp-Source: AGHT+IGQuK9QByA/s6w3+K3zxChiH3iS57iH4DJtAcDC280GkD9V604PJkkXIQShbz7Hme8iaUjTNA==
X-Received: by 2002:a17:907:2da3:b0:a99:f722:2dde with SMTP id a640c23a62f3a-a9a4c2c5f38mr15409066b.1.1729095065965;
        Wed, 16 Oct 2024 09:11:05 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2971a48csm198742866b.6.2024.10.16.09.11.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 09:11:04 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99e3b3a411so187050966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 09:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgLCussCHZbjfzVbpCWLDWuF4Sqxvv3i7HUE12M6m2n99dk/qnxQcQojKYo74pRt/V99aFZQPVeSNK5CM=@lists.ozlabs.org
X-Received: by 2002:a17:907:3a96:b0:a9a:eeb:b26a with SMTP id
 a640c23a62f3a-a9a4c2c9a13mr11865666b.1.1729095063890; Wed, 16 Oct 2024
 09:11:03 -0700 (PDT)
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
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd> <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
In-Reply-To: <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 16 Oct 2024 09:10:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
Message-ID: <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, 
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

On Mon, 14 Oct 2024 at 09:55, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 14 Oct 2024 at 05:30, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > Given that LAM enforces bit 47/56 to be equal to bit 63 I think we can do
> > this unconditionally instead of masking:
> >
> > diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
> > index d066aecf8aeb..86d4511520b1 100644
> > --- a/arch/x86/lib/getuser.S
> > +++ b/arch/x86/lib/getuser.S
> > @@ -37,9 +37,14 @@
> >
> >  #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
> >
> > +#define SHIFT_LEFT_TO_MSB ALTERNATIVE \
> > +       "shl $(64 - 48), %rdx", \
> > +       "shl $(64 - 57), %rdx", X86_FEATURE_LA57
>
> That's certainly a lot smaller than the big constant, which is good.

Actually, having thought this over, I think we can simplify things
more, and not do any shifts AT ALL.

IOW, the whole "mask non-canonical bits" model I think works on its
own even without the "shift sign bit and or" logic.

So it can replace all the shifting entirely (much less the double
shifting), and we can have something like this:

  --- a/arch/x86/lib/getuser.S
  +++ b/arch/x86/lib/getuser.S
  @@ -37,11 +37,14 @@

   #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC

  +#define X86_CANONICAL_MASK ALTERNATIVE \
  +     "movq $0x80007fffffffffff,%rdx", \
  +     "movq $0x80ffffffffffffff,%rdx", X86_FEATURE_LA57
  +
   .macro check_range size:req
   .if IS_ENABLED(CONFIG_X86_64)
  -     mov %rax, %rdx
  -     sar $63, %rdx
  -     or %rdx, %rax
  +     X86_CANONICAL_MASK      /* mask into %rdx */
  +     and %rdx,%rax
   .else
        cmp $TASK_SIZE_MAX-\size+1, %eax
        jae .Lbad_get_user

Yes, it does end up having that big constant (not great), but makes up
for it by avoiding the register move instruction (3 bytes) and two
shift instructions (4 bytes each), so while the "load big constant"
instruction is a big 10-byte instruction, it's actually one byte
shorter than the old code was.

It also avoids a couple of data dependencies, so it's both smaller and simpler.

An invalid address with the high bit set will become non-canonical, so
it will cause an exception as expected.

But it avoids the AMD issue, because while it's non-canonical, it
always clears that bit 48 (or 57), so it will never hit a kernel
TLB/cache tag.

Of course, if some other core then does the sane thing, and uses  bit
#63 (instead of #48/57), and still has the pseudo-meltdown behavior,
then the non-canonical address generated by the plain 'and' will end
up having the same old issue.

But in (related) news, the address masking trick really does matter:

   https://lore.kernel.org/all/202410161557.5b87225e-oliver.sang@intel.com/

which reports that ridiculous 6.8% improvement just from avoiding the
barrier in user_access_begin().

So that barrier really *is* very expensive. Surprisingly so.

                 Linus

