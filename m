Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AD275FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 08:26:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458fdv20KPzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.172; helo=mail-oi1-f172.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458fcZ1KcKzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 16:25:00 +1000 (AEST)
Received: by mail-oi1-f172.google.com with SMTP id y124so3538615oiy.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 23:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JIn/q7zKQFf8gmi5v9papJxAFnDUINxghtnsJDZsC44=;
 b=YwciHI11Za4CAqLfgvto4dwmA/1KXjluRTWUFzFl23WhhPrysk5rIFLDDG31Yaeu5/
 u4m7LEGuLINYj2cMAUKHwddKZCHYM+X1cfjFwNIvrxzZ13yZi5gx0PsqsA7suaGjI7Fv
 P2BmHz+0cia2FCW5vfNr5o9YaRJapU+VTmAdVhK0E5RDbGK4uO2oZTAMsnor5Kc5Rbm1
 hT+6Sc7dmsSRNVwC6EL3R1ze0QwwaDn+8Sntk4zkS5cRsUZbVrhCnCSBW2e5nwQpBiw9
 8TewfRedCuLSIE3O/E4H+wd7VHPPH+cJSCwa6Nc8yEyqdVs1xp2VaUTXC8X8U1ApVfo4
 sh3w==
X-Gm-Message-State: APjAAAUeFRcxg9S4Dq0mXhcxuc8sEisD91O5Z/MsD/sTjMgL5acDRTo+
 DWkQcOKg75scFdfaw6FnQNcgnxUbB/jVUSMzbeY=
X-Google-Smtp-Source: APXvYqwVAdmBowoAqjhfyadGdVsK09BtL/fjQoc2Z+MFbgWAfp3g+5XZMKYifCIliX/UPYFpFZRaId8BLlSJGw7i67U=
X-Received: by 2002:aca:ed44:: with SMTP id l65mr1794925oih.107.1558592697027; 
 Wed, 22 May 2019 23:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
In-Reply-To: <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 23 May 2019 08:24:45 +0200
Message-ID: <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
Subject: Re: Failure to boot G4: dt_headr_start=0x01501000
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Salut Christophe,

On Wed, May 22, 2019 at 2:20 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 22/05/2019 =C3=A0 14:15, Mathieu Malaterre a =C3=A9crit :
> > Hi all,
> >
> > I have not boot my G4 in a while, today using master here is what I see=
:
> >
> > done
> > Setting btext !
> > W=3D640 H=3D488 LB=3D768 addr=3D0x9c008000
> > copying OF device tree...
> > starting device tree allocs at 01401000
> > otloc_up(00100000, 0013d948)
> >    trying: 0x01401000
> >    trying: 0x01501000
> >   -=E2=80=BA 01501000
> >    alloc_bottom : 01601000
> >    alloc_top    : 20000000
> >    alloc_top_hi : 20000000
> >    nmo_top      : 20000000
> >    ram_top      : 20000000
> > Building dt strings...
> > Building dt structure...
> > reserved memory map:
> >    00d40000 - 006c1000
> > Device tree strings 0x01502000 -> 0x00000007
> > Device tree struct 0x01503000 -> 0x00000007
> > Quiescing Open Firmware ...
> > Booting Linux via __start() @ 0x001400000
> > ->dt_headr_start=3D0x01501000
> >
> > Any suggestions before I start a bisect ?
> >
>
> Have you tried without CONFIG_PPC_KUEP and CONFIG_PPC_KUAP ?

Using locally:

diff --git a/arch/powerpc/configs/g4_defconfig
b/arch/powerpc/configs/g4_defconfig
index 14d0376f637d..916bce8ce9c3 100644
--- a/arch/powerpc/configs/g4_defconfig
+++ b/arch/powerpc/configs/g4_defconfig
@@ -32,6 +32,8 @@ CONFIG_USERFAULTFD=3Dy
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=3Dy
 CONFIG_G4_CPU=3Dy
+# CONFIG_PPC_KUEP is not set
+# CONFIG_PPC_KUAP is not set
 CONFIG_PANIC_TIMEOUT=3D0
 # CONFIG_PPC_CHRP is not set
 CONFIG_CPU_FREQ=3Dy


Leads to almost the same error (some values have changed):

done
Setting btext !
W=3D640 H=3D488 LB=3D768 addr=3D0x9c008000
copying OF device tree...
starting device tree allocs at 01300000
alloc_up(00100000, 0013d948)
  trying: 0x01300000
  trying: 0x01400000
 -=E2=80=BA 01400000
  alloc_bottom : 01500000
  alloc_top    : 20000000
  alloc_top_hi : 20000000
  nmo_top      : 20000000
  ram_top      : 20000000
Building dt strings...
Building dt structure...
reserved memory map:
  00c40000 - 006c0000
Device tree strings 0x01401000 -> 0x00000007
Device tree struct 0x01402000 -> 0x00000007
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x001400000
->dt_headr_start=3D0x01400000

Thanks anyway,
