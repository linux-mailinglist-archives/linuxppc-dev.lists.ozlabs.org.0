Return-Path: <linuxppc-dev+bounces-6789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631C7A55A2F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 23:51:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z84Rc4khWz2yVb;
	Fri,  7 Mar 2025 09:51:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741301516;
	cv=none; b=ZcAvP0F7p6hxDzPl9drBJnIDbYs2k9C5e0BBKGajuC+LvSOyWCRDuO+hQtMpDvfL+GrLNyDGGg9tAmYLZ8xtRm+7A1j5tYcs1lwVlVk/RjGzOAhtxL6jw08r7akX1tSpFi4NgHdJuXi1wdrkvuOm8Qa+486IZIV6tLXD7iv3TTqRchxP09lYi+qnW5UmD2bvWMg2XK3wDprqtJJtdGkbL8JUqZjSh7YiSX1VaTFllHCORI8uJZiZCUnj+zACyxz6ns7GXj4X8p4dMcwU6ji7SiK+WovG8mXbxrXAwOc8Cfj+9knlmJHgIZcAs2907Bf8Uxa1R+AuCrh+R4Ft7Y5arw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741301516; c=relaxed/relaxed;
	bh=T+MeaRtbaOK2GiAQ7b/jsa6DcvYInpFfmjdGeYanR88=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fA0ENCrX9LFl9vEyuKWULjM5Em/9+xjt9o38QjXBuNqAbcYC0C8HTtP2vVe2mbxv3AvIj682VJGGDLMTsoM3TRqDXVxQFK0EfNpgGBlxvAPce1Za1DLTU8h71DAKpiX1ZKt1JMsYhYOVwFWyGPtCO/VFJ8ryf6tMBq1bV9eVrnOnIelEPos5YTKncjI7KwZXrfwYlSsQ2sOlSx4neozQoLy8xZeHl9qGjX+mG/PFm2RbPgvv70yMbZvf5MLuA/Dx3rkIabAoAd/zBBhPsJhUeZryts1JKNzu+iYQ3njZtcBk6SKaqY6JM+DAUpkJ8/xYIE6ZW9JddsQf1kJcZiLZlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CGf3L0Mv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=randrianasulu@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CGf3L0Mv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=randrianasulu@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z84RZ4jRXz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 09:51:53 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2239f8646f6so23584035ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Mar 2025 14:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741301511; x=1741906311; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T+MeaRtbaOK2GiAQ7b/jsa6DcvYInpFfmjdGeYanR88=;
        b=CGf3L0MvwyBzjjigMj6LgnKhC2CcA5XJ8Omctd3hufnsqwK6gIb6WL6HI/YCK4l5w7
         oRVnaMvA3Ye+hp1YnIXrov2xvpZzoU5cSLWsoRHgWmsC8kkHgyJf5rfjV5VJCk4JAkOq
         mLZk/HrWyuJ70RokXgoYTEY78Ae5gkGDaUOYQYIsnfhOA20vzFxSBjIi1EWZVGGr/gxX
         xf6ay/2v4qWHpyQsa5xT3kQW7cA6t4rMtTPC7rTbV2tjNov2ftbmrD8jdkT7XI7IM8zl
         S2qUmUe/1BYwt44gykruOk1qJIec4DWtcZyTkjW/BVrE5od5eElkTutjYSAWQ4J3xqai
         c1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741301511; x=1741906311;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+MeaRtbaOK2GiAQ7b/jsa6DcvYInpFfmjdGeYanR88=;
        b=SldyNvpSTE7OPGOmScyu9G8Ioe5sE8XSCbSiWh7KauD0LHl3gosba13s9nUAP4hBuP
         KVs1g2SwJh6Qi5X58J5Wk8Xaovm+H55TCD84O8lmenqIv+oHhff7zi48e4+7yPTrRa3w
         q7z8SZCoUzFP0imaXCdd4ITdP1gmMFCfSzARCzzl7yyVBxH8nV7PRJyae8TmSgep1JUX
         nS3SHSj+q2DNzkWxPorkKWMHM7gMIead/RIWUO6v/FDbFDsABU7BRGUPAY8Rgvxz9SMl
         hhkpvbtC/2Cs7rsUarD9dWLhWrHlBDFoFB2GTmdzoFbpZp3ujEJPuLUVNdhaWKYddT1i
         9JfA==
X-Gm-Message-State: AOJu0YxyS123PtNVa/Ybby8uDwOcPEereVF1U4I25P4ZviwZguTDwlEj
	PGRPaziN1QlnUEAFdWTWt8kllqE9+gK/tioUgO+EZr0mFtDYfrrXSBOC2amzBahDr8vVZLVRdsG
	fUTU+KYmJySBl1cmfKk8RrLpAf8udbTzl
X-Gm-Gg: ASbGncuoY+GJSpY7qffH2Bnt/1L6kGsyXV3exG6eng54TfgmX3ry87K2fiJssIr36yV
	42xpl0aM6fJMu19FCDW7w/UCfzl3JvoDUIyNCFeNZ0pQgenQcoogscoVlsNjZxgLCFeXOrFArkK
	ISN6nJVwLFmvxyaiodqfSK4abyRIoY
X-Google-Smtp-Source: AGHT+IFDG94HUMy5CrboX/Ju+d9hfcxowEhl4RfT9mVEVVHPwn+IY5Rp4Qhs+zQM722/jXKm2sSVQGDbIyBFZ4fER+Y=
X-Received: by 2002:a17:903:32c6:b0:224:13c0:58e3 with SMTP id
 d9443c01a7336-22428bf1976mr14246695ad.51.1741301511434; Thu, 06 Mar 2025
 14:51:51 -0800 (PST)
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
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Fri, 7 Mar 2025 01:51:36 +0300
X-Gm-Features: AQ5f1Jpry5dAxnn0fFzwDUbqdc1H1fkDyGsJDHMnSWc0g5-VMoH3Oy5ikqcReiw
Message-ID: <CA+rFky40SkCtqZwotqpR6SjF6o-nj8qvVdWmwbJSGB=vORsw2w@mail.gmail.com>
Subject: Low-lewel details of secondary CPU bringup on mac99?
To: linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000009391f062fb45a23"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--00000000000009391f062fb45a23
Content-Type: text/plain; charset="UTF-8"

Hello, I see this list mostly for Linux kernel patches, but we are trying
to get two-processor virtual mac99 machine going in qemu, and sadly it does
not work without singlestepping on boot cpu in

smp_core99_kick_cpu()

https://elixir.bootlin.com/linux/v6.12.17/source/arch/powerpc/platforms/powermac/smp.c#L796

just single stepping after switching to second thread/vCPU  ends with my
naive gdb script erroring out ;)

Last email in chain on qemu-ppc list:

https://lists.gnu.org/archive/html/qemu-ppc/2025-03/msg00136.html

latest gdb log attached to

https://lists.gnu.org/archive/html/qemu-ppc/2025-03/msg00132.html

MacOS X 10.4.11 strangely works out of the box with two CPUs . Users
reported even macos 9 (with selected applications like Quicktime) works!

I can't test NetBSD/macppc due to some trouble in my crosscompiler? From
netbsd/amd64 machine using standart NetBSD  build.sh script. So I put
NetBSD aside for now.

I use 'remote' gdb running in Debian ppc sid/trixie VM on the same
NetBSD/amd64 host.

Linux kernel 6.12.17 was compiled under emulation with localmodconfig where
I changed ext4 and SCSI  disk.drivers to be builtin (for faster bootup
without initrd). I disabled CPU_HOTPLUG after disabling sleep/hibernation
support in hope it will help booting second cpu. But I was wrong about
this. Recompiling might take 30 hours or so I prefer to reuse kernel I have
;) I see mac ppc SMP code was not changed much since at least 2.6.24 times
of Gentoo 2008.0 so I hope it works on real machines!

I might spotted typo in comment

https://elixir.bootlin.com/linux/v6.12.17/source/arch/powerpc/kernel/head_book3s_32.S#L239

"/* core99 pmac starts the seconary here by changing the vector, and

   putting it back to what it was (unknown_async_exception) when done.  */

"


secondary not seconary ?

but apart from this I am mostly clueless how PowerPC works, especially in
those dual G4 machines ....

If you need link to deb of this kernel, .config, qemu/openbios patches, gdb
script - just ask!

Not sure if I should crosspost this back to qemu-ppc  list?

--00000000000009391f062fb45a23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello, I see this list mostly for Linux kernel patches, b=
ut we are trying to get two-processor virtual mac99 machine going in qemu, =
and sadly it does not work without singlestepping on boot cpu in=C2=A0<div =
dir=3D"auto"><br></div><div dir=3D"auto">smp_core99_kick_cpu()</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://elixir.bootlin.co=
m/linux/v6.12.17/source/arch/powerpc/platforms/powermac/smp.c#L796" rel=3D"=
noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">https://elix=
ir.bootlin.com/linux/v6.12.17/source/arch/powerpc/platforms/powermac/smp.c#=
L796</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">just single ste=
pping after switching to second thread/vCPU=C2=A0 ends with my naive gdb sc=
ript erroring out ;)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Las=
t email in chain on qemu-ppc list:</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><a href=3D"https://lists.gnu.org/archive/html/qemu-ppc/2025-03/m=
sg00136.html" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ht=
tps://lists.gnu.org/archive/html/qemu-ppc/2025-03/msg00136.html</a></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">latest gdb log attached to</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://lists.gnu=
.org/archive/html/qemu-ppc/2025-03/msg00132.html" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://lists.gnu.org/archive/html/qemu-ppc/2025-03/=
msg00132.html</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">MacOS =
X 10.4.11 strangely works out of the box with two CPUs . Users reported eve=
n macos 9 (with selected applications like Quicktime) works!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I can&#39;t test NetBSD/macppc due to=
 some trouble in my crosscompiler? From netbsd/amd64 machine using standart=
 NetBSD=C2=A0 build.sh script. So I put NetBSD aside for now.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I use &#39;remote&#39; gdb running in=
 Debian ppc sid/trixie VM on the same NetBSD/amd64 host.=C2=A0</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Linux kernel 6.12.17 was compiled un=
der emulation with localmodconfig where I changed ext4 and SCSI=C2=A0 disk.=
drivers to be builtin (for faster bootup without initrd). I disabled CPU_HO=
TPLUG after disabling sleep/hibernation support in hope it will help bootin=
g second cpu. But I was wrong about this. Recompiling might take 30 hours o=
r so I prefer to reuse kernel I have ;) I see mac ppc SMP code was not chan=
ged much since at least 2.6.24 times of Gentoo 2008.0 so I hope it works on=
 real machines!</div><div dir=3D"auto"><br></div><div dir=3D"auto">I might =
spotted typo in comment</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<a href=3D"https://elixir.bootlin.com/linux/v6.12.17/source/arch/powerpc/ke=
rnel/head_book3s_32.S#L239" target=3D"_blank" rel=3D"noreferrer">https://el=
ixir.bootlin.com/linux/v6.12.17/source/arch/powerpc/kernel/head_book3s_32.S=
#L239</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">&quot;/* core9=
9 pmac starts the seconary here by changing the vector, and</div><pre>   pu=
tting it back to what it was (unknown_async_exception) when done.  */</pre>=
<div dir=3D"auto">&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">secondary not seconary ?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">but apart from this I am mostly clueless how =
PowerPC works, especially in those dual G4 machines ....</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">If you need link to deb of this kernel, .c=
onfig, qemu/openbios patches, gdb script - just ask!</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Not sure if I should crosspost this back to qe=
mu-ppc=C2=A0 list?</div></div>

--00000000000009391f062fb45a23--

