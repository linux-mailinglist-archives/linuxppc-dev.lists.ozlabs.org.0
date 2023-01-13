Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878BA668845
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 01:14:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtMNk6XJjz3fDf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 11:14:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hsvjOhr7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hsvjOhr7;
	dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtMMl5qPJz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 11:13:37 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id fa5so12525507qtb.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 16:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kqiL43eyuEfUGs2vRxAEVvpUnI4QNGGWB1NDFJCBIyY=;
        b=hsvjOhr77zapXL9VgwDCu/nspZMcI9irVYw/aM6FdAC+cXzhnAPzK7LCAG7RqQZj81
         zwWabggWfjPPSAh7ggo71yG7mqp2NKWZTeCL23K4GtByEyl7iXJsuJpmSArE0X2iPJcK
         1ojWDX9lwlXQBp2dt7cKIVuYG0iNNtUcO91v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqiL43eyuEfUGs2vRxAEVvpUnI4QNGGWB1NDFJCBIyY=;
        b=tFbOd2Bro6C+j7+0vTr1qScBRhCLaElKRW0osHYzHBbEB0Qsc2WjkTce33zMm0ycnG
         SEF7SI4sLVxaq+oAjRcr/lUGVHyFZUZqKzv+HkBh4xpnBBh7MGIbcrBDNkR04z+kZXt/
         nSrEGSjsiQFHI5QcztFiAZ5aiQ/etzw64a/0NPtSQC/VWOzjwgJJt0D0XObOUJ8WtxYg
         n2m1MUSdSoVKTlR4HBqcSGV2LrY4bhLcQt9gy043Jh6+ZuZo4cT4wELvACSl+qgxnYek
         CwOxx4mnRL7GXogpM+OPhaoSD1LTlwRbAtizpmvLf0SgALUuJB/HbbqmcfD99toGXQCg
         ebnQ==
X-Gm-Message-State: AFqh2kpRxeqzyWQjq+kOfZuF/e7DMFmdIqHVbI3RXt9Ry21SvW+ezU7I
	WQfrzv1IEk7y40QMqfsROcfbUzdc5p8C7NOCbog=
X-Google-Smtp-Source: AMrXdXvfG25nnclVE0ebdll7/YAa7+1tAlyh0/LO1Bc8Sr0+9C0X8DIdGskOnuX90v+d8UrWrW4xLg==
X-Received: by 2002:a05:622a:5a92:b0:3a9:6cf8:9b4e with SMTP id fz18-20020a05622a5a9200b003a96cf89b4emr111330200qtb.35.1673568813653;
        Thu, 12 Jan 2023 16:13:33 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id h2-20020a05620a400200b006e42a8e9f9bsm11745152qko.121.2023.01.12.16.13.32
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 16:13:33 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id g9so3263796qtu.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 16:13:32 -0800 (PST)
X-Received: by 2002:a05:622a:250f:b0:3b2:d164:a89b with SMTP id
 cm15-20020a05622a250f00b003b2d164a89bmr19886qtb.452.1673568812575; Thu, 12
 Jan 2023 16:13:32 -0800 (PST)
MIME-Version: 1.0
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
In-Reply-To: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Jan 2023 18:13:16 -0600
X-Gmail-Original-Message-ID: <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
Message-ID: <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
Subject: Re: lockref scalability on x86-64 vs cpu_relax
To: Mateusz Guzik <mjguzik@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: tony.luck@intel.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Adding linux-arch, which is relevant but not very specific, and the
arm64 and powerpc maintainers that are the more specific cases for an
architecture where this might actually matter.

  See

        https://lore.kernel.org/all/CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com/

  for original full email, but it might be sufficiently clear just
from this heavily cut-down context too ]

Side note on your access() changes - if it turns out that you can
remove all the cred games, we should possibly then revert my old
commit d7852fbd0f04 ("access: avoid the RCU grace period for the
temporary subjective credentials") which avoided the biggest issue
with the unnecessary cred switching.

I *think* access() is the only user of that special 'non_rcu' thing,
but it is possible that the whole 'non_rcu' thing ends up mattering
for cases where the cred actually does change because euid != uid (ie
suid programs), so this would need a bit more effort to do performance
testing on.

On Thu, Jan 12, 2023 at 5:36 PM Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> To my understanding on said architecture failed cmpxchg still grants you
> exclusive access to the cacheline, making immediate retry preferable
> when trying to inc/dec unless a certain value is found.

I actually suspect that is _always_ the case - this is not like a
contended spinlock where we want to pause because we're waiting for
the value to change and become unlocked, this cmpxchg loop is likely
always better off just retrying with the new value.

That said, the "likely always better off" is purely about performance.

So I have this suspicion that the reason Tony added the cpu_relax()
was simply not about performance, but about other issues, like
fairness in SMT situations.

That said, evern from a fairness perspective the cpu_relax() sounds a
bit odd and unlikely - we're literally yielding when we lost a race,
so it hurts the _loser_, not the winner, and thus might make fairness
worse too.

I dunno.  Tony may have some memory of what the issue was.

> ... without numbers attached to it. Given the above linked thread it
> looks like the arch this was targeting was itanium, not x86-64, but
> the change landed for everyone.

Yeah, if it was ia64-only, it's a non-issue these days. It's dead and
in pure maintenance mode from a kernel perspective (if even that).

> Later it was further augmented with:
> commit 893a7d32e8e04ca4d6c882336b26ed660ca0a48d
> Author: Jan Glauber <jan.glauber@gmail.com>
> Date:   Wed Jun 5 15:48:49 2019 +0200
>
>     lockref: Limit number of cmpxchg loop retries
> [snip]
>     With the retry limit the performance of an open-close testcase
>     improved between 60-70% on ThunderX2.
>
> While the benchmark was specifically on ThunderX2, the change once more
> was made for all archs.

Actually, in that case I did ask for the test to be run on x86
hardware too, and exactly like you found:

> I should note in my tests the retry limit was never reached fwiw.

the max loop retry number just isn't an issue. It fundamentally only
affects extremely unfair platforms, so it's arguably always the right
thing to do.

So it may be "ThunderX2 specific" in that that is where it was
noticed, but I think we can safely just consider the max loop thing to
be a generic safety net that hopefully simply never triggers in
practice on any sane platform.

> All that said, I think the thing to do here is to replace cpu_relax
> with a dedicated arch-dependent macro, akin to the following:

I would actually prefer just removing it entirely and see if somebody
else hollers. You have the numbers to prove it hurts on real hardware,
and I don't think we have any numbers to the contrary.

So I think it's better to trust the numbers and remove it as a
failure, than say "let's just remove it on x86-64 and leave everybody
else with the potentially broken code"

Because I do think that a cmpxchg loop that updates the value it
compares and exchanges is fundamentally different from a "busy-loop,
trying to read while locked", and with your numbers as ammunition, I
think it's better to just remove that cpu_relax() entirely.

Then other architectures can try to run their numbers, and only *if*
it then turns out that they have a reason to do something else should
we make this conditional and different on different architectures.

Let's try to keep the code as common as possibly until we have hard
evidence for special cases, in other words.

                 Linus
