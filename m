Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA449EDB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 22:47:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlDh533Gdz3clD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 08:47:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SzBAUp/t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929;
 helo=mail-ua1-x929.google.com; envelope-from=michael.heltne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SzBAUp/t; dkim-atps=neutral
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl4mk3N6Pz3Wtt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 02:50:28 +1100 (AEDT)
Received: by mail-ua1-x929.google.com with SMTP id b16so5512902uaq.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=keWQjrZDKEqcxxFAOJovB5ZqLC6RUqhV/Cp5X1sAeGg=;
 b=SzBAUp/tk63fn+K4h0oIHfcReE3YQgRH+90Vri3bkGMk6iWPx+rM5F7VeEbTdJb03e
 iTQt2W5ejFU5VhCuVt0DZpnUTcTNreNPyPatPTU4nhsU3uFxhgA8gY3UJRQbRvyxrY5C
 3t5Jimc/e3LXQpF1rgLmArLvbwKURtVCXVUYSPR5aWIORpP54sR3eQo3vrR1fzZrSDQg
 JJCtoU7m7gTFQKzEXRLLNgpCqpr8lvRyu857jHaXvZKW8DsVlieeELApgkyHQCtrjjjo
 LjhECF0mfwU7YV8Envdjb4gtRKMYxcJvcVRAF6QZ+ZQHzut1aeNqGAEa6wm2w666GGoT
 l0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=keWQjrZDKEqcxxFAOJovB5ZqLC6RUqhV/Cp5X1sAeGg=;
 b=XvSKLl+uIOGk1gFqYzunIMNfTfVhdscF/GdV3ILodDCXQTFUy9TC527QRA/zYUQRhv
 afBEGaYeKi9iOne12n71ZV2xc+EXuaTD/dBbywG8ftSWlatT2M2Fxnu6/oqiVmBdAMXN
 4CXQbMkBypejqC4x8/sTkatjfNbzlWYhQweOA2qNRCcxG9BMVMwbeYWZvdgFEcyxq9NJ
 qwueA2d+nB0G549rms9JD+894eUEpaUAovCqoHsEePLioMhDKWk6DMKv7TEFc3Sn5S26
 /8DUD8fn98SgQ8+yVLLln++8BGsNVQ1KGt22SLFtTs+cm5hPbjj92dO8LxkqjAfzHpZV
 vVXg==
X-Gm-Message-State: AOAM533R9Pu8/boXjm8lECxhAbza6tv0dkCym7XdWEmBRbG8zbybhY22
 OiYx7t7yPsY2+I/5s1ij688tER9sRvznK10SWWY=
X-Google-Smtp-Source: ABdhPJzoBdJsM7oSfuETEvX6Lk7AMLh/U8fHhFRmKy7UQOKm+rzYlPMep6VgAH137HZ7PHnegeUW0uEmnrNtAr4yysQ=
X-Received: by 2002:a67:e08d:: with SMTP id f13mr1730151vsl.78.1643298624981; 
 Thu, 27 Jan 2022 07:50:24 -0800 (PST)
MIME-Version: 1.0
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <73c55cc9-369e-8989-4f6c-6801ce6a4d64@physik.fu-berlin.de>
 <87k0hs8iyq.fsf@mpe.ellerman.id.au>
 <fca7cf14-b598-d25a-8f71-8d1c16a84e5f@physik.fu-berlin.de>
 <87ilux2ksi.fsf@mpe.ellerman.id.au>
 <872c2364-a5db-0533-c8bd-91e03c067a2f@physik.fu-berlin.de>
 <8aa4e710-df2d-8cb7-ba16-f6043c929a14@physik.fu-berlin.de>
 <52b57080-efbd-c582-30df-f1d638e18e14@physik.fu-berlin.de>
 <200a989d-0aa9-c50f-855a-159b4e8ea441@physik.fu-berlin.de>
In-Reply-To: <200a989d-0aa9-c50f-855a-159b4e8ea441@physik.fu-berlin.de>
From: Mike <michael.heltne@gmail.com>
Date: Thu, 27 Jan 2022 16:50:15 +0100
Message-ID: <CANtoAtPJf6ARWJeQSyro51bwkTfBWvKRZTJeU80LM5=dS4WPig@mail.gmail.com>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: multipart/alternative; boundary="000000000000cd4bc705d69246d1"
X-Mailman-Approved-At: Fri, 28 Jan 2022 08:44:30 +1100
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
Cc: debian-powerpc@lists.debian.org,
 "open list:LINUX FOR POWERPC..." <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000cd4bc705d69246d1
Content-Type: text/plain; charset="UTF-8"

I just made the huge mistake of hibernating and resuming, I'm going trough
the process of rescue and all, thankfully I had a 2016 cd in the drive.
I'll read up once the sheer panic settles.

-Michael

On Wed, Jan 26, 2022, 21:22 John Paul Adrian Glaubitz <
glaubitz@physik.fu-berlin.de> wrote:

> Hi Michael!
>
> On 1/13/22 01:17, John Paul Adrian Glaubitz wrote:
> > On 1/9/22 23:17, John Paul Adrian Glaubitz wrote:
> >> On 1/7/22 12:20, John Paul Adrian Glaubitz wrote:
> >>>> Can you separately test with (on the host):
> >>>>
> >>>>  # echo 0 > /sys/module/kvm_hv/parameters/dynamic_mt_modes
> >>>
> >>> I'm trying to turn off "dynamic_mt_modes" first and see if that makes
> any difference.
> >>>
> >>> I will report back.
> >>
> >> So far the machine is running stable now and the VM built gcc-9 without
> >> crashing the host. I will continue to monitor the machine and report
> back
> >> if it crashes, but it looks like this could be it.
> >
> > So, it seems that setting "dynamic_mt_modes" actually did the trick, the
> host is no longer
> > crashing. However, I have observed on two occasions now that the build
> VM is just suddenly
> > off as if someone has shut it down using the "force-off" option in the
> virt-manager user
> > interface.
>
> Just as a heads-up. Ever since I set
>
>         echo 0 > /sys/module/kvm_hv/parameters/dynamic_mt_modes
>
> on the host machine, I never saw the crash again. So the issue seems to be
> related to the
> dynamic_mt_modes feature.
>
> Thanks,
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>
>

--000000000000cd4bc705d69246d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I just made the huge mistake of hibernating and resuming,=
 I&#39;m going trough the process of rescue and all, thankfully I had a 201=
6 cd in the drive. I&#39;ll read up once the sheer panic settles.=C2=A0<div=
 dir=3D"auto"><br></div><div dir=3D"auto">-Michael</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 26, 202=
2, 21:22 John Paul Adrian Glaubitz &lt;<a href=3D"mailto:glaubitz@physik.fu=
-berlin.de">glaubitz@physik.fu-berlin.de</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hi Michael!<br>
<br>
On 1/13/22 01:17, John Paul Adrian Glaubitz wrote:<br>
&gt; On 1/9/22 23:17, John Paul Adrian Glaubitz wrote:<br>
&gt;&gt; On 1/7/22 12:20, John Paul Adrian Glaubitz wrote:<br>
&gt;&gt;&gt;&gt; Can you separately test with (on the host):<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 # echo 0 &gt; /sys/module/kvm_hv/parameters/dynamic_=
mt_modes<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m trying to turn off &quot;dynamic_mt_modes&quot; first =
and see if that makes any difference.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I will report back.<br>
&gt;&gt;<br>
&gt;&gt; So far the machine is running stable now and the VM built gcc-9 wi=
thout<br>
&gt;&gt; crashing the host. I will continue to monitor the machine and repo=
rt back<br>
&gt;&gt; if it crashes, but it looks like this could be it.<br>
&gt; <br>
&gt; So, it seems that setting &quot;dynamic_mt_modes&quot; actually did th=
e trick, the host is no longer<br>
&gt; crashing. However, I have observed on two occasions now that the build=
 VM is just suddenly<br>
&gt; off as if someone has shut it down using the &quot;force-off&quot; opt=
ion in the virt-manager user<br>
&gt; interface.<br>
<br>
Just as a heads-up. Ever since I set<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 0 &gt; /sys/module/kvm_hv/parameters/dynam=
ic_mt_modes<br>
<br>
on the host machine, I never saw the crash again. So the issue seems to be =
related to the<br>
dynamic_mt_modes feature.<br>
<br>
Thanks,<br>
Adrian<br>
<br>
-- <br>
=C2=A0.&#39;&#39;`.=C2=A0 John Paul Adrian Glaubitz<br>
: :&#39; :=C2=A0 Debian Developer - <a href=3D"mailto:glaubitz@debian.org" =
target=3D"_blank" rel=3D"noreferrer">glaubitz@debian.org</a><br>
`. `&#39;=C2=A0 =C2=A0Freie Universitaet Berlin - <a href=3D"mailto:glaubit=
z@physik.fu-berlin.de" target=3D"_blank" rel=3D"noreferrer">glaubitz@physik=
.fu-berlin.de</a><br>
=C2=A0 `-=C2=A0 =C2=A0 GPG: 62FF 8A75 84E0 2956 9546=C2=A0 0006 7426 3B37 F=
5B5 F913<br>
<br>
</blockquote></div>

--000000000000cd4bc705d69246d1--
