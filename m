Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B364C4B99A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 08:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzmFx1HGQz3cPF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 18:11:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=R3YUevVk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=R3YUevVk; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzmFH5Chlz30Dv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 18:10:41 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id y20so2608803iod.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6xy9ME3jeTozpEkTiqjBKU9tArSCGD99KtlGQaDptr8=;
 b=R3YUevVkxfyZ64++JXHi3gow602xnjy/5ApPRDZPN8Z4OgoFovitFA1jMU5O+rVhEW
 ybcYVkyMFDwQKFAEJEkyPN33X+m9OKIzhJk5FulJz6CpUfh77tty8N4HxMHY8vUO7hK3
 4kXkiA54BDTYo2Lmw2DXd30UQ8nw/S59PAURQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6xy9ME3jeTozpEkTiqjBKU9tArSCGD99KtlGQaDptr8=;
 b=SsuqEoWVz9jDYKnT9hK/folfoQ+PzmdFxUKEnVanhFCw+sGMXNymTDOB2YZjfUuE7x
 ZkyTkF659158KlxpDmUBbmdUnExX/nSVa+X341n0VzDaAyic7Ka8kngneQRdQsJIpWGF
 uw06JbbGxlvfidQh7uRwzytgo3cUvBM/6BF45MVlOfs4bHMhVOxh9OH9W7OxzAj6Rd8r
 USyf1k6W5tb78CIfO7MBzxUoGokelfTtb6Pv/PLr6u5DgAUBz5vBO+6qR23fcmz8mSXz
 oZ0oArUL5bCC9TtOX5/NN1O5WCLYd9r9aYNXbFMZRODJuX63TtWZu8cSmA+yQogMqh0Y
 olCA==
X-Gm-Message-State: AOAM531fPU9T9hNLxhrABT92wMBXKRAINa9MRAaKkreKZ/iDROf6j/u7
 fXEw4NN+UzVZRGZogg3a+bz+EBP1y7Ve1DiAwnc=
X-Google-Smtp-Source: ABdhPJzkLCX4i/V8LHeVh1N1lFpXpyJDtWzeMtJGGKGWLd7Ic2u8/R7r3PZk3Ck09wea/4Z3oV8BVwdN0A/UQNJ89X8=
X-Received: by 2002:a02:19c6:0:b0:30e:e6a5:67ad with SMTP id
 b189-20020a0219c6000000b0030ee6a567admr1167861jab.45.1645081838647; Wed, 16
 Feb 2022 23:10:38 -0800 (PST)
MIME-Version: 1.0
References: <d141d8c3-5c72-02ab-6b31-c32cd02f8291@molgen.mpg.de>
 <20220214094327.GL3113@kunlun.suse.cz>
 <e6701fa9-a51b-3706-5aa5-bb6c7ae76cf0@molgen.mpg.de>
 <20220214135657.GM3113@kunlun.suse.cz> <87v8xemhbo.fsf@mpe.ellerman.id.au>
In-Reply-To: <87v8xemhbo.fsf@mpe.ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Feb 2022 07:10:26 +0000
Message-ID: <CACPK8XdCM_1grhQ5vr3qyfWM_4xM=nmdR6roKpjRsUg_1HrgMg@mail.gmail.com>
Subject: Re: No Linux logs when doing `ppc64_cpu --smt=off/8`
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Feb 2022 at 01:07, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> > On Mon, Feb 14, 2022 at 01:33:24PM +0100, Paul Menzel wrote:

> >> Yes, simple `nproc` suffice, but I was more thinking about, that the L=
inux
> >> log is often used for debugging and the changes of amount of processin=
g
> >> units might be good to have. `ppc64_cpu --smt=3Doff` or `=3D8` seems t=
o block
> >> for quite some time, and each thread/processing unit seems to powered
> >> down/on sequentially, so it takes quite some time and it blocks. So 14=
0
> >> messages would indeed be quite noise. No idea how `ppc64_cpu` works, a=
nd if
> >> it could log a message at the beginning and end.
> >
> > Yes, it enables/disables threads one by one. AFAICT the kernel cannot k=
now that
> > ppc64_cpu will enable/disable more threads later, it can either log eac=
h
> > or none. Rate limiting would not show the whole picture so it's not
> > great solution either.
>
> Right, ppc64_cpu just uses the sysfs online files, so it's doing them one=
 at a
> time. The kernel has no knowledge that ppc64_cpu is turning all
> secondaries on/off so there's no easy way for the kernel to do a summary
> message.
>
> An easy solution would be for ppc64_cpu to log something via syslog(3).

Another option would be to implement this sysfs knob for powerpc:

 /sys/devices/system/cpu/smt/control

 https://github.com/torvalds/linux/commit/05736e4ac13c08a4a9b1ef2de26dd31a3=
2cbee57

It currently returns "notimplemented" on power, but it's designed (for
x86) to turn SMT on and off.

With this implemented we could offline all CPUs at once before
returning to userspace. It "just" needs someone with some time to work
on it.

...which I spent the afternoon attempting to do:

 https://lore.kernel.org/linuxppc-dev/20220217070419.351683-1-joel@jms.id.a=
u/

It does what it says on the tin, but there's a few rough edges that
need working out. It won't solve the problem you had of wanting a
message in the kernel logs (I notice that the x86 cpu hotplug code
does print something; I wonder how that goes on a large box). If you
or anyone else wants to run with the idea then free free to use my
patch as a starting point.

Cheers,

Joel
