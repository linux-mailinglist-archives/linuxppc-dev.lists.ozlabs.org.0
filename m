Return-Path: <linuxppc-dev+bounces-2331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB169A15D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 00:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTQhm6S92z2ym2;
	Thu, 17 Oct 2024 09:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729117976;
	cv=none; b=JDj+o4YFY8YPkS3qyY46MbYJK4wTUJ4QqDt6pwDGHd1Bo1sZmkpSd2bP2AehFMyhsAZnlzsqwwS7Ck6Jf4gqk1LUZXrjnYoJZ25zz1fksHYJFc9LISqq738oD5Yk+3LS7Qlzx46+BQNRhbFX1zgQfT+zTGo5/hQ5Ywz/LG9O31rGAsKMT0IBPt5osRaWf78xObcRlUgLtWnQAcUYERqP2f5WT16wDQkvNdl0hSrLLLaRdYkXU7dg1eeNpdOQhlXmAyLK7Wip9TuSWexflhnNyY5aE6/iAnAE15UijWQP7ATMquoQxwjhOVmDXQbkiqKzhsUXTjcIPloL1UvJxJ51hA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729117976; c=relaxed/relaxed;
	bh=HPiPBCg+jomo1HnGbpn4dHjGdfF+vO85KkIfj0zyTcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maT5y3tyGRmeKuPuP2Hj8LHtuKFR76slzvPaKbY4//jkXL7hJ7OOyMXUHHtvclPQkk0MbodusXM/Ry2d7+Z0JQLkP/D6oa0S1CoHytndA9vGDEp7KJwnXuKe6D1wtgN5Tv3UwTq7M9oDoGu/gypPlR5+Bfbt0daJLDzhCU0ZtUdWv4E9inaigMlIv3QD5moCispmPBtZLsIpoB169zDSvubRsNCyx4BlUmLYU6k7bqWA2sToV5VJ+dEiLuHtG442AAfHlJXhH/f+VDtqI90oqsgZufPnE4Re8XYehSYDEg8kMdOfeZJ493mPkWsiWV/2x1BLA8Vs4ve9W7bRUJzRvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=c++k2V0k; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=c++k2V0k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTQhl0k8Lz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 09:32:54 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539f1292a9bso404277e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 15:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729117970; x=1729722770; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPiPBCg+jomo1HnGbpn4dHjGdfF+vO85KkIfj0zyTcg=;
        b=c++k2V0k+f/Xaz0MWQ6SQtwCDWh4vmdN10s11izZ7sTGn8YW/GqQKYyQqH6XcmTyW1
         Xyr4jZ9bfWX45J7lCpVL0qdEWJhaq/FNI9IQnkf5ijoDgrrXrQFncWUahn0+Xe+eC0dX
         OBfYDOeELcsfSKyTe1Uw2gIjuyQOcs/WuLS64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729117970; x=1729722770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPiPBCg+jomo1HnGbpn4dHjGdfF+vO85KkIfj0zyTcg=;
        b=rzXaqefvp1kq3h1r/o22q4+Z93grox6jm6d5sr49v+9w/4qo57hKTZ9gLMzci/H0Kx
         vGFajmCv5JAuV26J7OBvZK5HhBjO7LiP32Imj6UJT4pjqroNEPXBGvqbshKflzRPqGDR
         EOBIi8fjsjOMwOEuQfQKfhp8W3uuyB4K9/l5PPBy9hocyjrV9ALerZza8v9sEuZnCXUH
         c64HWELWxmJDGEeuKBYlS3yfKiD8FF0DVRRQ9sdMCVTI72FxxrNUDUCkQ381TpaR0LlV
         SAC2Iup3aFjp1LR7esHur6o2wwNvVZz6+f5uPRbS4RXq77PLyRlWJS18Ys5wOTanqwbh
         8g8w==
X-Forwarded-Encrypted: i=1; AJvYcCVVuL1SzFC7cMJGjuyBDpvHPE5FIpeYnTt4dUEMDnfa92MiWrwlY1kpCVtltgyDEH670QOSEn3Ah+iKDkg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxN+arj7ZadgqSyNvaE/NxSlU6x/lucEdrIhQjzkcHL30FHU6sn
	4m5l1MQuMZOlGON6nscBo5GQN1u0WE3mSGHyG5V4ZDEpOrrbdWXWgCtKe3jidRl/CwY/Hv3JKb7
	kI+7eGA==
X-Google-Smtp-Source: AGHT+IG3P27ZQ0q3cV73XZ2f0dNL1fbSip3beQzFYFRnBXZWP661i/14iGew+lV2nyyTDEcK3WjzvA==
X-Received: by 2002:a05:6512:108f:b0:534:3cdc:dbef with SMTP id 2adb3069b0e04-53a03f77cf1mr3871581e87.43.1729117970324;
        Wed, 16 Oct 2024 15:32:50 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a298474dfsm225376566b.145.2024.10.16.15.32.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 15:32:49 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9850ae22eso410435a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 15:32:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQqr6eKFLvTQcwdJUIIk0HutBGK08jB9r0DPJCu5tW0mo2uKRNeU/k6V4DoTbwoszXWpjZ95MAiitrumo=@lists.ozlabs.org
X-Received: by 2002:a17:907:930b:b0:a99:e4a2:1cda with SMTP id
 a640c23a62f3a-a9a34e29901mr465023266b.56.1729117969443; Wed, 16 Oct 2024
 15:32:49 -0700 (PDT)
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
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
 <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com> <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com>
In-Reply-To: <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 16 Oct 2024 15:32:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqfdRHEOdS5getruouT7N_ZT4i4gHMcwJYzcKw-s_cFA@mail.gmail.com>
Message-ID: <CAHk-=wgqfdRHEOdS5getruouT7N_ZT4i4gHMcwJYzcKw-s_cFA@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
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

On Wed, 16 Oct 2024 at 15:03, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> That doesn't have the same semantics, does it?

Correct. It just basically makes all positive addresses be force-canonicalized.

> If AMD think it's appropriate, then what you probably want is the real
> branch as per before (to maintain architectural user behaviour), and
> then use a trick such as this one in place of the LFENCE for speed in
> the common case.

The problem with the branch is that it really can only branch on the
sign bit - because of LAM.

So with LAM, those bits are pretty much ignored anyway.

> > So that barrier really *is* very expensive. Surprisingly so.
>
> 7% performance is what it costs to maintain the security barrier we were
> sold originally.

Absolutely. And the masking was something that basically says "we get
it all back" (with "all" being just this part, of course - never mind
all the other workarounds).

> Forgive me if I think that we (the SW people) are getting the raw end of
> the deal here, while vendors keep selling more and more expensive chips
> that don't work safely.

I'm 100% with you.

My preference would actually be to do nothing, on the assumption that
the AMD issue is actually impossible to trigger (due to CLAC/STAC
serializing memory address checks - which the timings certainly imply
they do).

But if we have to do magic bit masking, I'd rather it be *fast* magic
bit masking.

               Linus

