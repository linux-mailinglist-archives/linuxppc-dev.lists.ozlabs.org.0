Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEAB577FCE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 12:36:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmdg90JWzz2yyQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 20:36:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=jsjIrZCD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.com (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=rol7and@gmx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=jsjIrZCD;
	dkim-atps=neutral
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir; Mon, 18 Jul 2022 20:36:00 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmdfS6RLgz2xn6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 20:36:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1658140556;
	bh=jJoud+PMUqZe8F/mAjemz4rd4BIC2XU3keORFZmmkwE=;
	h=X-UI-Sender-Class:From:To:Date:Subject;
	b=jsjIrZCDlIogFVocOoEML6jY9JZPdh0nttz9FBvZpKBqb8mUbqNrBr9+iNae2KG32
	 0fXWkBdG1Q+Ot/7IPWFoiv/ml8l/ajjRLk1QGtUK9v9gEvRFRf5EjGtw7Z2ZfBB98t
	 FT94fUIdLZEXyNcUUPMPLAw8CeTkM+26eMubHnec=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [127.0.0.1] ([82.181.77.238]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MAfUe-1oOMOL2uUK-00B2Ta for
 <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 12:30:45 +0200
From: Roland <rol7and@gmx.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Mon, 18 Jul 2022 13:30:50 +0300 (EEST)
Message-ID: <53c921589cf.2885e51c@mail.gmx.com>
User-Agent: YAM/2.10-dev (AmigaOS4; PPC; rv:20210601-b6f7110)
Subject: Memory problem with Delock SATA3/USB3 controller board
MIME-Version: 1.0
Content-Type: text/plain
X-Provags-ID: V03:K1:4xLXmIMA/RY+kyV8N6Sr91wnuyCaXPBugeIVvx0QWa+g347ZDWw
 ijNTc1qeSjXi59G/KgSFPAosY3geQWOr/d1j8EIoSDgODLOKyEGGk7AF+VGK4U6U2UyA3Hm
 DSOPx8JDtAoLxcZCZ3jzvYesl94+oU18mLsUI8bndjW3hUPm3SjqLcXfrsFL2uHpFChODWn
 s0AvamSrOGpedBpxWoEyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+y9SL+PuujQ=:Oqgny5ldoaonf4wikw0GJN
 AS3mPdlkMiLvgBrmmo2FvdCLKnkFrgcPoHi/aVezoWB8xesF90w+dKYRU4cwB9Q7rxdM2MbXQ
 F1izVJHNbrNKjCVO2EYnwUmtVEwJkwWOjgREiXjN6IyvDkAdoPqYoEe9c6CXMtpmRm+BWy6Dr
 te1blOQKB4DsvB7mL+90xPHuF6RlQe9rxOYTE3Jy5RIoAkAfGhCpCWurWaqFCX3bsQ55b4K/s
 wcY4jroYf3aV4XqBahuDtrxxhaD5U8N7Fso2zdrXIw6vEzUeBRq/Uj/noK74F2c4OesYwfHuK
 BDbKsEjbjQwke8UGGrKFaAhhG6oUMOJwBqyRAyzVwCmftIE+7cLn4yHWD7MVtX7v5ArbgZFKw
 4sgkKqquxz+SN+HNREkwWZJcc0axBFvsPwz7pbBuDLWXiA+oQI6Fxy/2MQ4Q9KJBNLs3WDlS8
 RYnUZiSI7CgCrszDHDKfKkHcqwjuTNDM7PgXzQxFPAQhHiU2HN7nIab8jNeKDSAeHxtHnEa4I
 III8qGJoB6MAi433hP+HGedOzi6Q6p3W7Dlrokgggy1KooSEoaPGEAr7XVKOSjiYc3Eo0OBqf
 3xoW3L4k9sEgMrMsujDcsU4fI9xl1+vI6nqnTl8+mLeJA4hDQkkVfIATuAp3JGcVN89K/eKH1
 Qc7JeuYe0cmPXUoI2mj0ILXvPprYB8Omz0axxKHmTdM4UZfl8B6TAQEUKhwCeU++xGJC+quIB
 nCvNxf5RhifYf7j8ixDhoo62GcOx9/J7fD7ez5fK6w1LHhsXaBwCI8trpzmcD7KeirClMOQSW
 png/KMphPZziheX8qfsxB2MoHu6KmQ3l16IlfJTMDxDL11M8UQDfFkmNJ2O96L59PMPwQmNh7
 PrClq9yJhoSf354hHAOcjb4VHXtD9PmDLTKoyjQD1y94TfoLHsIlS40qe8ASS0mZL9n+MH5o5
 Jj9JXRrociXgybLMF5cerQh3+pl/Wvv5nkkpkB71VNx+ULkbmgJcr3TkKMwVuqb4EpiOhYsz4
 cZXaPTepwHS3rDhHtL2hEy03fWeO5KIj/LUYbC7THxp3Q7sFYt04lI6GJSvvGGbZYZkLNE5/1
 cZtC/lGNX/sj5/LXDSM8djKk+aJ+udgZoWSfpbaJsB/YipCCcc1UV94TQ==
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

I tested in my AmigaOne X5000 (QuorIQ 5020/5040) a combined Sata3/USB3 pci=
e controller board from Delock (https://www.delock.de/produkt/89389/merkma=
le.html?setLanguage=3Den). The ASM 1042, ASM 1061 and ASM 1182 chipsets ar=
e used on this board.

The Sata controller seems to work without issues, except that with the spe=
edtest of 'Disks' tool the read speed reach only 200MB/s (with a 6G SSD di=
sk), whereas it is normally around 400Mb/s with other Sata3 controllers.

Instead, there are serious problems with the USB controller if the whole R=
AM of my machine (4 or 8 GB) is in use:

- If a USB drive is connected to the controller before booting, the size o=
f that drive is interpreted totally wrong (e.g. 250 GB -> 1GB) and the dis=
k is not usable. As a consequence, loading of a root filesystem from the U=
SB disk is not possible

- If a USB drive is conneted only after booting has finished , the size is=
 correct and reading of the disk is possible. But writing to the disk fail=
s if larger filesizes (several hundreds of MBs) are used (message: "Error =
splicing file: Input/output error"). The drive is then also unmounted and =
cannot be remounted before rebooting. Also copying smaller files can somet=
imes lock the drive, so that it isn't possible to write on it more files.

If I limit the RAM size to 3.5 GB (using a "MEM=3D3500M" bootarg) the symp=
toms described above dissappear and USB disks work normally. One problem i=
s still present, though: if the machine is set to boot from an internal Sa=
ta disk and if a second SATA disk is connected to the USB port (using an U=
SB3-Sata3 adapter) before booting, booting halts to a "start job" trying t=
o load the kernel modules (present in lib/modules), adding continuously th=
e time. The second disk does not have any Linux os components, only a coup=
le of NTFS partitions with trivial data files! Also, connecting a simple U=
SB memory stick does _not_ cause this issue.

So, is there some sort of memory allocation problem with the USB driver of=
 this card? Is it possible to fix it? I had long time ago similar type of =
problems with some legacy pci boards, but they were fixed in kernel update=
s
I'm using currently Kernel 5.10.124, but the problem is seen also with lat=
er kernels, like 5.15 and 5.19 betas.

Here is some info how the controllers are seen:

1000:08:00.0 USB controller: ASMedia Technology Inc. ASM1042A USB 3.0 Host=
 Controller (prog-if 30 [XHCI])
    Subsystem: ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller
    Flags: bus master, fast devsel, latency 0, IRQ 19
    Memory at c20100000 (64-bit, non-prefetchable) [size=3D32K]
    Capabilities: [50] MSI: Enable- Count=3D1/8 Maskable- 64bit+
    Capabilities: [68] MSI-X: Enable+ Count=3D8 Masked-
    Capabilities: [78] Power Management version 3
    Capabilities: [80] Express Legacy Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Kernel driver in use: xhci_hcd

1000:09:00.0 SATA controller: ASMedia Technology Inc. ASM1062 Serial ATA C=
ontroller (rev 01) (prog-if 01 [AHCI 1.0])
    Subsystem: ASMedia Technology Inc. ASM1062 Serial ATA Controller
    Flags: bus master, fast devsel, latency 0, IRQ 47
    I/O ports at 3000 [size=3D8]
    I/O ports at 3008 [size=3D4]
    I/O ports at 3010 [size=3D8]
    I/O ports at 3018 [size=3D4]
    I/O ports at 3020 [size=3D32]
    Memory at c20200000 (32-bit, non-prefetchable) [size=3D512]
    Expansion ROM at c20210000 [virtual] [disabled] [size=3D64K]
    Capabilities: [50] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
    Capabilities: [78] Power Management version 3
    Capabilities: [80] Express Legacy Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Kernel driver in use: ahci

Regards,

Roland

