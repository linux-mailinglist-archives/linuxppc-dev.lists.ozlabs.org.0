Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F33927F85BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 23:01:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=srrxludG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScTTt6LH1z3vhg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 09:01:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=srrxludG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=dimitri.ledkov@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScGwl36mYz3dJ5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 01:05:57 +1100 (AEDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC8B03F886
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700834747;
	bh=jiFPHt3FzyuqgosE2Q6EXFokJNCaOxc2n7HUdFql0Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=srrxludGkz9lh+MQ8vYIropXl4t2Px4ZrK/tRmY01Q7+GdNDusJGuH4b058Pu861R
	 kotgN8duxUOH/fZfkbJt3/47W7tplVvypy55Vsv1jaF/7zOnB27h5h6sGdRQwTAnLJ
	 lzFn+5FlAQUTgOjdsXkBtURSxSdX2sLafcgKNIyeSLEZ0uMUIkwOYK2Yj96baFvzeH
	 DM0u17zat6o3gvm7pIA7yTTd1zHOdzrSXxVww/ZL0eMS/B7Sj8l8lHbzPrz6CfbaY0
	 9epGslWz/RzcexHljWo1lTa0WEiLqgGv4RmM1yHS4mjBd128RAccq54JBrQkEAFRlC
	 UNPVWxCdQFbAA==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40b3487fa9eso12462335e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 06:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700834747; x=1701439547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiFPHt3FzyuqgosE2Q6EXFokJNCaOxc2n7HUdFql0Bk=;
        b=kLZb/RM3CbMjgmbTl2wZ67lWFmjgh//wJxC5DAN3ZnJsdXBlqOfd71s7JFzQRHYCR0
         Kts0ozEd/CJPQMW6J4Pm64v3D1FU/N/acIM7GLC2ydkNOxrA5VnbV+G7P3HFO8AN4L8h
         lpIWEXLavluQULw1gH3X8fA4x+H3M/QsE+rWXed9wpSe/9m0bNhHMW/fl0FC33ZivTL2
         BzHN2e2lTYDRg43FvHT417InZRipRFGei3cFWrRI3LsKp0HCMnVTfjaefIdGehHqJoXg
         DbdDotszwINOVEiGLPXF+RtGO+uvxTGeGFGcCOBR+iOTj0DXLDgPmUxmfJcCATk9vOPb
         fXjA==
X-Gm-Message-State: AOJu0Ywf7L4r6r/hYdazqcMji0iAS029zK2QPdQ6VYiYDVfBg1Xn5NHL
	h/b79iTdERHD+YVBTlIzEExtC5ngyLd1c39zh709y+oAlyml2xa2NZ3SIE09onJzhVH0wEeaetT
	sIXO7u79xM0VDS24lN11CDo0j7B1HHS1WEDqoPjan/RPxFlM+K3aIkr9GgdE=
X-Received: by 2002:a7b:c013:0:b0:40b:3416:77f0 with SMTP id c19-20020a7bc013000000b0040b341677f0mr2219272wmb.29.1700834747115;
        Fri, 24 Nov 2023 06:05:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwTUbOfvL2t6H46QPRSkDYk9VrjvZN2RVxMC3WCmuspz76npYIQqpEK5coZ6UrV23QmzYFXJ21edTuy3hlogw=
X-Received: by 2002:a7b:c013:0:b0:40b:3416:77f0 with SMTP id
 c19-20020a7bc013000000b0040b341677f0mr2219210wmb.29.1700834746454; Fri, 24
 Nov 2023 06:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20231124002042.1741578-1-dimitri.ledkov@canonical.com> <87sf4vrbl3.fsf@mail.lhotse>
In-Reply-To: <87sf4vrbl3.fsf@mail.lhotse>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Fri, 24 Nov 2023 14:05:10 +0000
Message-ID: <CADWks+ZH63ee9trvygAwkGKvD9oN9t_JBB+HNxnfvuxH3mj9XA@mail.gmail.com>
Subject: Re: [RFC] UBUNTU: [Config] y2038: Disable COMPAT and
 COMPAT_32BIT_TIME on ppc64le
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="000000000000e26f12060ae6728e"
X-Mailman-Approved-At: Sat, 25 Nov 2023 08:57:59 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000e26f12060ae6728e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Nov 2023 at 04:59, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Dimitri John Ledkov <dimitri.ledkov@canonical.com> writes:
> > BugLink: https://bugs.launchpad.net/bugs/2038587
> >
> > ppc64le is exclusively little endian and 64-bit, thus there is no need
> > for COMPAT_32BIT_TIME, nor COMPAT.
>
> To be pedantic, the ppc64le kernel does support running 32-bit little
> endian userspace in compat mode (CONFIG_COMPAT=3Dy). It's a distro choice
> as to whether you support COMPAT. Notably there are two other major
> distros that don't support COMPAT for ppc64le, and the set of 32-bit LE
> software is effectively empty.

=F0=9F=A4=AF

>
> > diffconfig result of these changes is:
> >
> >  -ARCH_MMAP_RND_COMPAT_BITS 13
> >  -ARCH_WANT_COMPAT_IPC_PARSE_VERSION y
> >  -ARCH_WANT_OLD_COMPAT_IPC y
> >  -COMPAT_BINFMT_ELF y
> >  -COMPAT_NETLINK_MESSAGES y
> >  -COMPAT_OLD_SIGACTION y
> >  -HAVE_ARCH_MMAP_RND_COMPAT_BITS y
> >  -KVM_COMPAT y
> >  -NETFILTER_XTABLES_COMPAT y
> >  -SYSVIPC_COMPAT y
> >  -VDSO32 y
> >   COMPAT y -> n
> >   COMPAT_32BIT_TIME y -> n
> >  +ARCH_HAS_SYSCALL_WRAPPER y
> >  +INTERRUPT_SANITIZE_REGISTERS y
> >
> > What confused me, if the above combination is even valid or just pure
> > dead code.
>
> I don't entirely understand what that diff is saying, but I'll try and
> answer anyway.

This is output from diffconfig, lines with "y -> n" are changes to a key
that is available as a choice.
Lines prefixed with minus ('-') become unavailable.
Lines prefixed with plus ('+') are NEW options that become available.

So the effect of turning COMPAT off removes lots of compat things in other
places, and makes INTERRUPT_SANITIZE_REGISTERS available.

>
> > Is it really possible to run 32bit big-endian KVM on a 64bit
> > little-endian POWER?
>
> Are you referring to KVM_COMPAT being disabled?
>
> That's nothing to do with big-endian. It's just controlling whether the
> KVM ioctls (which qemu calls) support compat handling, ie. whether you
> can run a 32-bit qemu under a 64-bit kernel.
>

Thank you for the explanation. And also "no thank you, do not want 32-bit
qemu".

> It's entirely expected that when COMPAT is turned off KVM_COMPAT also
> gets turned off.
>
> > Or is Kconfig slightly buggy and should be fixed up to prevent
> > offering COMPAT options when little-endian 64bit POWER kernel is being
> > configured?
>
> No. Like I said at the top, the kernel does support 32-bit LE compat,
> eventhough it's not very widely used.
>

Thank you for explaining all of this.

--=20
okurrr,

Dimitri

--000000000000e26f12060ae6728e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, 24 Nov 2023 at 04:59, Michael Ellerman &lt=
;<a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a>&gt; wrote:<br=
>&gt;<br>&gt; Dimitri John Ledkov &lt;<a href=3D"mailto:dimitri.ledkov@cano=
nical.com">dimitri.ledkov@canonical.com</a>&gt; writes:<br>&gt; &gt; BugLin=
k: <a href=3D"https://bugs.launchpad.net/bugs/2038587">https://bugs.launchp=
ad.net/bugs/2038587</a><br>&gt; &gt;<br>&gt; &gt; ppc64le is exclusively li=
ttle endian and 64-bit, thus there is no need<br>&gt; &gt; for COMPAT_32BIT=
_TIME, nor COMPAT.<br>&gt;<br>&gt; To be pedantic, the ppc64le kernel does =
support running 32-bit little<br>&gt; endian userspace in compat mode (CONF=
IG_COMPAT=3Dy). It&#39;s a distro choice<br>&gt; as to whether you support =
COMPAT. Notably there are two other major<br>&gt; distros that don&#39;t su=
pport COMPAT for ppc64le, and the set of 32-bit LE<br>&gt; software is effe=
ctively empty.<div><br></div><div>=F0=9F=A4=AF<br></div><div><br>&gt;<br>&g=
t; &gt; diffconfig result of these changes is:<br>&gt; &gt;<br>&gt; &gt; =
=C2=A0-ARCH_MMAP_RND_COMPAT_BITS 13<br>&gt; &gt; =C2=A0-ARCH_WANT_COMPAT_IP=
C_PARSE_VERSION y<br>&gt; &gt; =C2=A0-ARCH_WANT_OLD_COMPAT_IPC y<br>&gt; &g=
t; =C2=A0-COMPAT_BINFMT_ELF y<br>&gt; &gt; =C2=A0-COMPAT_NETLINK_MESSAGES y=
<br>&gt; &gt; =C2=A0-COMPAT_OLD_SIGACTION y<br>&gt; &gt; =C2=A0-HAVE_ARCH_M=
MAP_RND_COMPAT_BITS y<br>&gt; &gt; =C2=A0-KVM_COMPAT y<br>&gt; &gt; =C2=A0-=
NETFILTER_XTABLES_COMPAT y<br>&gt; &gt; =C2=A0-SYSVIPC_COMPAT y<br>&gt; &gt=
; =C2=A0-VDSO32 y<br>&gt; &gt; =C2=A0 COMPAT y -&gt; n<br>&gt; &gt; =C2=A0 =
COMPAT_32BIT_TIME y -&gt; n<br>&gt; &gt; =C2=A0+ARCH_HAS_SYSCALL_WRAPPER y<=
br>&gt; &gt; =C2=A0+INTERRUPT_SANITIZE_REGISTERS y<br>&gt; &gt;<br>&gt; &gt=
; What confused me, if the above combination is even valid or just pure<br>=
&gt; &gt; dead code.<br>&gt;<br>&gt; I don&#39;t entirely understand what t=
hat diff is saying, but I&#39;ll try and<br>&gt; answer anyway.</div><div><=
br></div><div>This is output from diffconfig, lines with &quot;y -&gt; n&qu=
ot; are changes to a key that is available as a choice.</div><div>Lines pre=
fixed with minus (&#39;-&#39;) become unavailable.</div><div>Lines prefixed=
 with plus (&#39;+&#39;) are NEW options that become available.</div><div><=
br></div><div>So the effect of turning COMPAT off removes lots of compat th=
ings in other places, and makes INTERRUPT_SANITIZE_REGISTERS available.</di=
v><div><br>&gt;<br>&gt; &gt; Is it really possible to run 32bit big-endian =
KVM on a 64bit<br>&gt; &gt; little-endian POWER?<br>&gt;<br>&gt; Are you re=
ferring to KVM_COMPAT being disabled?<br>&gt;<br>&gt; That&#39;s nothing to=
 do with big-endian. It&#39;s just controlling whether the<br>&gt; KVM ioct=
ls (which qemu calls) support compat handling, ie. whether you<br>&gt; can =
run a 32-bit qemu under a 64-bit kernel.<br>&gt;</div><div><br></div><div>T=
hank you for the explanation. And also &quot;no thank you, do not want 32-b=
it qemu&quot;.</div><div><br>&gt; It&#39;s entirely expected that when COMP=
AT is turned off KVM_COMPAT also<br>&gt; gets turned off.<br>&gt;<br>&gt; &=
gt; Or is Kconfig slightly buggy and should be fixed up to prevent<br>&gt; =
&gt; offering COMPAT options when little-endian 64bit POWER kernel is being=
<br>&gt; &gt; configured?<br>&gt;<br>&gt; No. Like I said at the top, the k=
ernel does support 32-bit LE compat,<br>&gt; eventhough it&#39;s not very w=
idely used.<br>&gt;<br><br>Thank you for explaining all of this.</div><div>=
<br></div><div>-- <br>okurrr,<br><br>Dimitri</div></div>

--000000000000e26f12060ae6728e--
