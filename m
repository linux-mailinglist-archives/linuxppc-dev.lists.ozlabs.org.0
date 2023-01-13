Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E4C66A5CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 23:19:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ntwmz5qHyz3fDt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 09:18:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jQvh9Btc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=mjguzik@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jQvh9Btc;
	dkim-atps=neutral
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtNh76qSxz3bVK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 12:12:55 +1100 (AEDT)
Received: by mail-oo1-xc35.google.com with SMTP id y15-20020a4aaa4f000000b004e6b4e0acc0so5252288oom.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 17:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KV52lj2dmjkAsboEJSBjeC6RZgHMYA6025SgDDWUPjA=;
        b=jQvh9BtcxioCFwJqPAATwW7XH20JrEE6xXt0uzDoSMoX+gAkfBk5NYfs01zNyx9S5b
         Kqg6QYjRmels0qpVta6XvOZOYsoykIj4EIXFPJqVgP63tx6rtuiaB8AlNIT8Mpot0vgF
         4N1QBxbdVuSpLUI8CVeWhpK6VAzwduLg8RX5Ys6wprCOZOihjr8W6hn3Ub4FWu1ylkV6
         cH8XtbAdQiTcLcciL61RdQLCyYYaoEHgNQCbw/hNaz/7lG+1m6g2I6fsfeIQq8E6s9ji
         zQ/01gQyWcuzOEkTDBsoze++PVjAnJBV2q2YrfGYmCwLQUdjP/QiGa2y37BoMLXts2XQ
         76qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KV52lj2dmjkAsboEJSBjeC6RZgHMYA6025SgDDWUPjA=;
        b=A18+9Irv4QOPHgXCmVlOsCXHDOANI29Lllyw7hhTTqjAgeyHieXGF5JIhvAR/67AGr
         AjRK7iZVe201Xpdg4tRqiuPCSFljbOks/m8nuDEAVokLiHG5JtCkZxtimm2NzGX58QDS
         wVYR3ao2D/0hVKFgkjbuu1VgWFXT/vUeofABswUoGLWk5C8yXAXMFWynqpJ6NxAax07j
         4V+lhOYljCZGgetEXaK2iJUI7WBAADFu/LGglP58CuWez1g6xS9skVskpkilU5+znivh
         KYXwOyzzQzr/0uPpTuF0+IdEGS53miGl0leqqZUjwHwjVcTpvnhLEZqxqrhWQuxzZb6Z
         KyCg==
X-Gm-Message-State: AFqh2kqi8TMvqVQeozBsaT5zUli7b8v2pHvbG6hXC0Ch5xAXu0b1T0la
	nZvzEIMaGMZ10H/+gqaGmMz0lpYXKJApqqPoUCk=
X-Google-Smtp-Source: AMrXdXuWIXZj7GTqE2vZ82Tol/3lPrC2YrNkJMh4/eYlDNwugZKGviKH9kvg1/JBDmDJLMmE/uNj0l3V8UWTfh5vAzE=
X-Received: by 2002:a05:6820:188d:b0:4a0:78a0:bb6a with SMTP id
 bm13-20020a056820188d00b004a078a0bb6amr3948746oob.4.1673572371746; Thu, 12
 Jan 2023 17:12:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:77d5:0:b0:491:8368:9bdd with HTTP; Thu, 12 Jan 2023
 17:12:50 -0800 (PST)
In-Reply-To: <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 13 Jan 2023 02:12:50 +0100
Message-ID: <CAGudoHE0tzL8OAqvwpDR4Nn_g70a8qBdE_+-fmhXF-DEx_K6kg@mail.gmail.com>
Subject: Re: lockref scalability on x86-64 vs cpu_relax
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 14 Jan 2023 09:17:16 +1100
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
Cc: linux-arch <linux-arch@vger.kernel.org>, tony.luck@intel.com, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/13/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> Side note on your access() changes - if it turns out that you can
> remove all the cred games, we should possibly then revert my old
> commit d7852fbd0f04 ("access: avoid the RCU grace period for the
> temporary subjective credentials") which avoided the biggest issue
> with the unnecessary cred switching.
>
> I *think* access() is the only user of that special 'non_rcu' thing,
> but it is possible that the whole 'non_rcu' thing ends up mattering
> for cases where the cred actually does change because euid != uid (ie
> suid programs), so this would need a bit more effort to do performance
> testing on.
>

I don't think the games are avoidable. For one I found non-root
processes with non-empty cap_effective even on my laptop, albeit I did
not check how often something like this is doing access().

Discussion for another time.

> On Thu, Jan 12, 2023 at 5:36 PM Mateusz Guzik <mjguzik@gmail.com> wrote:
>> All that said, I think the thing to do here is to replace cpu_relax
>> with a dedicated arch-dependent macro, akin to the following:
>
> I would actually prefer just removing it entirely and see if somebody
> else hollers. You have the numbers to prove it hurts on real hardware,
> and I don't think we have any numbers to the contrary.
>
> So I think it's better to trust the numbers and remove it as a
> failure, than say "let's just remove it on x86-64 and leave everybody
> else with the potentially broken code"
>
[snip]
> Then other architectures can try to run their numbers, and only *if*
> it then turns out that they have a reason to do something else should
> we make this conditional and different on different architectures.
>
> Let's try to keep the code as common as possibly until we have hard
> evidence for special cases, in other words.
>

I did not want to make such a change without redoing the ThunderX2
benchmark, or at least something else arm64-y. I may be able to bench it
tomorrow on whatever arm-y stuff can be found on Amazon's EC2, assuming
no arm64 people show up with their results.

Even then IMHO the safest route is to patch it out on x86-64 and give
other people time to bench their archs as they get around to it, and
ultimately whack the thing if it turns out nobody benefits from it.
I would say beats backpedaling on the removal, but I'm not going to
fight for it.

That said, does waiting for arm64 numbers and/or producing them for the
removal commit message sound like a plan? If so, I'll post soon(tm).

-- 
Mateusz Guzik <mjguzik gmail.com>
