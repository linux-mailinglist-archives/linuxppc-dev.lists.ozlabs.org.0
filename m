Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C748D10A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 04:46:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZ9Md1LxFz306f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 14:46:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MVb2LhoR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::936;
 helo=mail-ua1-x936.google.com; envelope-from=michael.heltne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MVb2LhoR; dkim-atps=neutral
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZ8dB5bNsz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 14:13:01 +1100 (AEDT)
Received: by mail-ua1-x936.google.com with SMTP id i5so8586240uaq.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 19:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N8y4fCJbSUxDtZ0Zq02HeuC2HGUbk9cb3tY107bRhWI=;
 b=MVb2LhoRUisKK4S7553Ya/Wqjr09EF7eRtxZblzfzxYd7YEzhz8Ro1Vs6R1EDKE2yB
 flJk3PQLn97HV9N1gEf41QhG8kkQmkJ2h1AQ4E8yCI2+mndIWCsExp8hrGZGHDANZWG1
 WTqUS7nG5UTMt/u2yv6o1K47JLAIejKmqiiozyliSzPThXdgcOs1fbRFWyLopl8iivSi
 sPdQ9yKb6ZQDp3zJOgMn8QTl+hWqkQa+ju62/gANhrMNDxpEBI4q6iwMEDBgJF+YSFbG
 J3KjG1W+o98yKUeqhAYlesXHAh27bUyJitantTKIYAQyI888Bt7QaD4sBgyyj3+efy4q
 bEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N8y4fCJbSUxDtZ0Zq02HeuC2HGUbk9cb3tY107bRhWI=;
 b=RIkeTM4gjG6d6CA7bmBnCRLXUwfnnBKmYFkP3BBN4f0AfzTHhUgfO20QSpuwo4PUwA
 9D1dgkTzopz4/FIncMVkfia17wr5nSpNCnwiMgQYMaAle3mRcNS24bDGRwUdGPYAOd4f
 fRpGv9U4Xzvsmh1lGCmW9eqow5nkAuaJqOSbybzR/ImfpsePmmkD/9G1vBJPCDFpNrIT
 lWHschHWyBGw/heCeV3Ex2x6Qy4hrg1wZ82GcNWrG5qI3uF2N/5EgnKci2bcCHSyH9AP
 bsn8mtg3Othg1M0O3izEo835/dK/VefTfkS5iyHf4wo2mxbXy3UspcXmUnCR8EU8TViC
 p3QQ==
X-Gm-Message-State: AOAM531PybY6Ryw7a86/UE+cs6H+kHX38+YKDyan436zmkqZUpXE+B5f
 InoMkMEIEEsDmVdt0bJXwRA4iI0DyP+VKF0uL9Kqo7LnTh0=
X-Google-Smtp-Source: ABdhPJzl7YQ6cNLEljvBhbydyJ4I3CtwuEIIUjggcnDUJ85LU7S4wEjZnIwj0wC3Mj5eHnVGkNPtF0c+tlrGeQiqDcs=
X-Received: by 2002:ab0:3148:: with SMTP id e8mr1552193uam.62.1642043578406;
 Wed, 12 Jan 2022 19:12:58 -0800 (PST)
MIME-Version: 1.0
References: <CANtoAtPcRGHafb7LddtrY5g43m82txS_mY3WO_ZtJ+pfuLvKaw@mail.gmail.com>
 <b14be6fa-f3c1-4a40-6714-378c9ad45fcd@csgroup.eu>
 <CANtoAtOVjnvvti1rnrwpR9ybvpQJzjq48tdQbhsqJWncgoTmbw@mail.gmail.com>
 <3b039cad-be82-3376-144c-bdee09c7adbf@csgroup.eu>
In-Reply-To: <3b039cad-be82-3376-144c-bdee09c7adbf@csgroup.eu>
From: Mike <michael.heltne@gmail.com>
Date: Thu, 13 Jan 2022 04:12:47 +0100
Message-ID: <CANtoAtNCohtnBsr0g+X_xSNSNw=EjiDjy-ir7u=4OONKx+9i7A@mail.gmail.com>
Subject: Re: [5.16.0] build error on unrecognized opcode: ptesync
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: multipart/alternative; boundary="000000000000325ae305d56e1077"
X-Mailman-Approved-At: Thu, 13 Jan 2022 14:45:47 +1100
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
Cc: "open list:LINUX FOR POWERPC..." <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000325ae305d56e1077
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm, why on earth did it historically compile though, from what I gathered
before my hand fell off, -maltivec was removed from arch/powerpc/mm,  I ran
out of hard drive compiling ofc. but it seems happy,

>Also please prefer CONFIG_PPC64 to __powerpc64__

Copy pasted the style in of the file... I usually consider the kernel a
place of sane code, as long as it's not a hurried vendor or so.

-mr pink hand

On Tue, Jan 11, 2022, 10:51 Christophe Leroy <christophe.leroy@csgroup.eu>
wrote:

>
>
> Le 11/01/2022 =C3=A0 10:32, Mike a =C3=A9crit :
> > I managed to fix it in the end, patch attached, though i should have
> > done a $(call cc-option-, -maltivec, -mabi=3Daltivec) in the
> > arch/powerpc/mm/Makefile
> >   I wrongly assumed that the manual i had downloaded at 4.44am was for
> > 32bit ppc only and found ptesync to be ppc64 only.
> >
> > binutils-2.37.50 - GNU assembler version 2.37.50 (powerpc-linux-gnu)
> > using BFD version (GNU Binutils for Debian) 2.37.50.20220106
> > gcc version 11.2.0 (Debian 11.2.0-13)
> > ld.lld is missing but with LLVM/CLANG and LD=3Dld.bfd
> > arch/powerpc/kernel/vdso32/gettimeofday.S:72:8:
> > error: unsupported directive '.stabs'    .stabs
> > "_restgpr_31_x:F-1",36,0,0,_restgpr_31_x; .globl _restgpr_31_x;
> > _restgpr_31_x:
> >
> > Attached the config i'm using, and the debian config 5.15.0-2. It's
> > still building.
>
> Ok, I tried with your config on my Fedora Core 35 where I have:
>
> powerpc64-linux-gnu-gcc (GCC) 11.2.1 20210728 (Red Hat Cross 11.2.1-1)
> GNU ld version 2.37-3.fc35
>
>  From packages:
> - binutils-powerpc64-linux-gnu-2.37-3.fc35.x86_64
> - gcc-powerpc64-linux-gnu-11.2.1-1.fc35.x86_64
>
> And I don't have the problems you mention, so it must be something
> special with Debian GCC.
>
>
> Your change regarding ptesync is probably OK but is fragile I think,
> because for instance there is also a 'ptesync' in
> arch/powerpc/mm/pageattr.c and probably many other places.
>
> Also please prefer CONFIG_PPC64 to __powerpc64__
>
> Regarding the DSSALL issue, the following commit will probably help:
>
> d51f86cfd8e3 ("powerpc/mm: Switch obsolete dssall to .long")
>
> Regarding the .stabs with LLVM there is a patch at
>
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/68932ec2ba6b868d3=
5006b96e90f0890f3da3c05.1638273868.git.christophe.leroy@csgroup.eu/
>
> Thanks
> Christophe
>
>
>
> >
> > Cheers
> > Michael
> >
> > On Tue, 11 Jan 2022 at 07:20, Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 10/01/2022 =C3=A0 13:32, Mike a =C3=A9crit :
> >>> Hey, so I originally sat down to compile the fast headers V2 patch, b=
ut
> >>> quickly discovered other things at play, and grabbed 5.16.0 a few hou=
rs
> >>> after it lifted off,  arch/powerpc/mm/mmu_context.c I had to
> >>> specifically say had to include -maltivec or it barfed on a 'dssall',
> >>> I'm fine with that, I've spent years in kernel land, I can deal with
> >>> that, then came arch/powerpc/lib/step.c with the ptesync. This seems
> >>> like a totally normal instruction that shouldn't need any extra flags
> or
> >>> anything, yet the assembler throws up, and no flag I can think of fix=
es
> >>> it. This is a G4 7447. I reverted back to the Debian 5.15. defconfig
> >>> before dropping this mail as I had tweaked my config to be more G4.
> >>>
> >>
> >> Hi Mike,
> >>
> >> Can you provide a bit more details about your setup and config ?
> >>
> >> Are you using GCC or LLVM ?
> >> What version of GCC and BINUTILS or what version of LLVM ?
> >>
> >> What is DEBIAN defconfig ? Does it correspond to one of the standard
> >> mainline kernel defconfigs ? If not can you provide it ?
> >>
> >> Thanks
> >> Christophe

--000000000000325ae305d56e1077
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hmm, why on earth did it historically compile though=
, from what I gathered before my hand fell off, -maltivec was removed from =
arch/powerpc/mm,=C2=A0 I ran out of hard drive compiling ofc. but it seems =
happy,=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">&gt;Also pl=
ease prefer CONFIG_PPC64 to __powerpc64__</div><div dir=3D"auto"><br>Copy p=
asted the style in of the file... I usually consider the kernel a place of =
sane code, as long as it&#39;s not a hurried vendor or so.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">-mr pink hand<br><br><div class=3D"gmail=
_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 11, =
2022, 10:51 Christophe Leroy &lt;<a href=3D"mailto:christophe.leroy@csgroup=
.eu">christophe.leroy@csgroup.eu</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
Le 11/01/2022 =C3=A0 10:32, Mike a =C3=A9crit=C2=A0:<br>
&gt; I managed to fix it in the end, patch attached, though i should have<b=
r>
&gt; done a $(call cc-option-, -maltivec, -mabi=3Daltivec) in the<br>
&gt; arch/powerpc/mm/Makefile<br>
&gt;=C2=A0 =C2=A0I wrongly assumed that the manual i had downloaded at 4.44=
am was for<br>
&gt; 32bit ppc only and found ptesync to be ppc64 only.<br>
&gt; <br>
&gt; binutils-2.37.50 - GNU assembler version 2.37.50 (powerpc-linux-gnu)<b=
r>
&gt; using BFD version (GNU Binutils for Debian) 2.37.50.20220106<br>
&gt; gcc version 11.2.0 (Debian 11.2.0-13)<br>
&gt; ld.lld is missing but with LLVM/CLANG and LD=3Dld.bfd<br>
&gt; arch/powerpc/kernel/vdso32/gettimeofday.S:72:8:<br>
&gt; error: unsupported directive &#39;.stabs&#39;=C2=A0 =C2=A0 .stabs<br>
&gt; &quot;_restgpr_31_x:F-1&quot;,36,0,0,_restgpr_31_x; .globl _restgpr_31=
_x;<br>
&gt; _restgpr_31_x:<br>
&gt; <br>
&gt; Attached the config i&#39;m using, and the debian config 5.15.0-2. It&=
#39;s<br>
&gt; still building.<br>
<br>
Ok, I tried with your config on my Fedora Core 35 where I have:<br>
<br>
powerpc64-linux-gnu-gcc (GCC) 11.2.1 20210728 (Red Hat Cross 11.2.1-1)<br>
GNU ld version 2.37-3.fc35<br>
<br>
=C2=A0From packages:<br>
- binutils-powerpc64-linux-gnu-2.37-3.fc35.x86_64<br>
- gcc-powerpc64-linux-gnu-11.2.1-1.fc35.x86_64<br>
<br>
And I don&#39;t have the problems you mention, so it must be something <br>
special with Debian GCC.<br>
<br>
<br>
Your change regarding ptesync is probably OK but is fragile I think, <br>
because for instance there is also a &#39;ptesync&#39; in <br>
arch/powerpc/mm/pageattr.c and probably many other places.<br>
<br>
Also please prefer CONFIG_PPC64 to __powerpc64__<br>
<br>
Regarding the DSSALL issue, the following commit will probably help:<br>
<br>
d51f86cfd8e3 (&quot;powerpc/mm: Switch obsolete dssall to .long&quot;)<br>
<br>
Regarding the .stabs with LLVM there is a patch at <br>
<a href=3D"https://patchwork.ozlabs.org/project/linuxppc-dev/patch/68932ec2=
ba6b868d35006b96e90f0890f3da3c05.1638273868.git.christophe.leroy@csgroup.eu=
/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork.ozlabs=
.org/project/linuxppc-dev/patch/68932ec2ba6b868d35006b96e90f0890f3da3c05.16=
38273868.git.christophe.leroy@csgroup.eu/</a><br>
<br>
Thanks<br>
Christophe<br>
<br>
<br>
<br>
&gt; <br>
&gt; Cheers<br>
&gt; Michael<br>
&gt; <br>
&gt; On Tue, 11 Jan 2022 at 07:20, Christophe Leroy<br>
&gt; &lt;<a href=3D"mailto:christophe.leroy@csgroup.eu" target=3D"_blank" r=
el=3D"noreferrer">christophe.leroy@csgroup.eu</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Le 10/01/2022 =C3=A0 13:32, Mike a =C3=A9crit :<br>
&gt;&gt;&gt; Hey, so I originally sat down to compile the fast headers V2 p=
atch, but<br>
&gt;&gt;&gt; quickly discovered other things at play, and grabbed 5.16.0 a =
few hours<br>
&gt;&gt;&gt; after it lifted off,=C2=A0 arch/powerpc/mm/mmu_context.c I had=
 to<br>
&gt;&gt;&gt; specifically say had to include -maltivec or it barfed on a &#=
39;dssall&#39;,<br>
&gt;&gt;&gt; I&#39;m fine with that, I&#39;ve spent years in kernel land, I=
 can deal with<br>
&gt;&gt;&gt; that, then came arch/powerpc/lib/step.c with the ptesync. This=
 seems<br>
&gt;&gt;&gt; like a totally normal instruction that shouldn&#39;t need any =
extra flags or<br>
&gt;&gt;&gt; anything, yet the assembler throws up, and no flag I can think=
 of fixes<br>
&gt;&gt;&gt; it. This is a G4 7447. I reverted back to the Debian 5.15. def=
config<br>
&gt;&gt;&gt; before dropping this mail as I had tweaked my config to be mor=
e G4.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi Mike,<br>
&gt;&gt;<br>
&gt;&gt; Can you provide a bit more details about your setup and config ?<b=
r>
&gt;&gt;<br>
&gt;&gt; Are you using GCC or LLVM ?<br>
&gt;&gt; What version of GCC and BINUTILS or what version of LLVM ?<br>
&gt;&gt;<br>
&gt;&gt; What is DEBIAN defconfig ? Does it correspond to one of the standa=
rd<br>
&gt;&gt; mainline kernel defconfigs ? If not can you provide it ?<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt; Christophe</blockquote></div></div></div>

--000000000000325ae305d56e1077--
