Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC094345420
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:49:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4CRs5GDtz3c2d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:49:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QKCSek14;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=cyborgyn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QKCSek14; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F41GL1Knrz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 04:10:16 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id u19so9027709pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fiyXOeQWEig0s6UT1FT5pCXalIidRHvGHYc/I0I86U4=;
 b=QKCSek145JEuRPcVGh+jry7eSFRT7rDliJdVjjDPerK0DFdLuxLHuth+sgT617W5Mm
 jecfEAMmOTZUwEtOT3NVkAuqnrRYhKJ/CPAWXtEAfpcv5KG+ByG0IJxfzUFn3hGP6OsW
 oPWtBEalIpy+zv0CWGZlMW8GxXXGV7ADUru4p65y9tx2V70fFVPGVCDw2XknH9W9/seH
 rGXSeCTpJaVlOEifvnGhW30lT6qTGVC8HeDy6eR1kA3bHZjb4uNfitWtT0tuQ4nhlZPN
 JOrlTpcixGngqPjLmXcVOVdlhvxtSuD9Os696fAhe93PNbZoIWZPQiMeHjELruNKLkUN
 u7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fiyXOeQWEig0s6UT1FT5pCXalIidRHvGHYc/I0I86U4=;
 b=YUBwAUCI2JPump/29ZbNpmErnn8PF6w+ITUyhncJTYREO/O8Y9PTHJPWbINBEumnIL
 ia1luxkdc9yeFcXttFwCGV6LjoaPBcSYcazrY8XgPho2vWRWMnYos3zPRzeJ124t5lCQ
 f8tAMUiKuTu0qbNO4SPXRU+aKQsKoIYcYm/1kuTQ99vnVK1AGyEdDQ4iyC9CZb2cbhx2
 S3Y/rUqWbcQOBkBCcCCcs6fwmi4b1PcsjPo6tyRm9c0PpwSSxrsb/Mlk4poUQRNSg7RW
 kYrz5UQ5F4VixbtQMgVUaI/+Q0FftydNkmj6MJNSTrLUJTZFYVVLqVuVKA5rsyv0JAW2
 MFHQ==
X-Gm-Message-State: AOAM531SKcanNJAR+P7UVUp4PyLNP/+tCtp6AoMH4VlZoKf21b3Uf192
 LxxxRYfuMzYtdgTkftbWJFwsw31yfDyc66fZ7JY=
X-Google-Smtp-Source: ABdhPJyo1TSVtrx9+IOM2nIeFXCEIk7pxXeayGexYBlLGasNOgy9jn+8roBBPwJzj7t1TMvI/kT0tl7xmg8I5hxgK3k=
X-Received: by 2002:a63:cc:: with SMTP id 195mr493605pga.282.1616433012697;
 Mon, 22 Mar 2021 10:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk>
 <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
 <20210322170338.GZ1463@shell.armlinux.org.uk>
In-Reply-To: <20210322170338.GZ1463@shell.armlinux.org.uk>
From: Cye Borg <cyborgyn@gmail.com>
Date: Mon, 22 Mar 2021 18:10:01 +0100
Message-ID: <CAD4NMuZWoV0m85OyBDHLt+J8NYCV5wYx7fFZaivBNEgDnrN5xw@mail.gmail.com>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 23 Mar 2021 11:47:31 +1100
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PWS 500au:

snow / # lspci -vvx -s 7.1
00:07.1 IDE interface: Contaq Microsystems 82c693 (prog-if 80 [ISA
Compatibility mode-only controller, supports bus mastering])
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 0
        Region 0: I/O ports at 01f0 [size=8]
        Region 1: I/O ports at 03f4
        Region 4: I/O ports at 9080 [size=16]
        Kernel driver in use: pata_cypress
        Kernel modules: pata_cypress
00: 80 10 93 c6 45 00 80 02 00 80 01 01 00 00 80 00
10: f1 01 00 00 f5 03 00 00 00 00 00 00 00 00 00 00
20: 81 90 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00

snow / # lspci -vvx -s 7.2
00:07.2 IDE interface: Contaq Microsystems 82c693 (prog-if 00 [ISA
Compatibility mode-only controller])
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin B routed to IRQ 0
        Region 0: I/O ports at 0170 [size=8]
        Region 1: I/O ports at 0374
        Region 4: Memory at 0c240000 (32-bit, non-prefetchable)
[disabled] [size=64K]
        Kernel modules: pata_cypress
00: 80 10 93 c6 45 00 80 02 00 00 01 01 00 00 80 00
10: 71 01 00 00 75 03 00 00 00 00 00 00 00 00 00 00
20: 00 00 24 0c 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00

On Mon, Mar 22, 2021 at 6:04 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Mon, Mar 22, 2021 at 05:09:13PM +0100, John Paul Adrian Glaubitz wrote:
> > On 3/22/21 4:15 PM, Russell King - ARM Linux admin wrote:
> > > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > > asked for a lspci for that last week but nothing has yet been
> > > forthcoming from whoever responded to your patch for Alpha - so I
> > > can't compare what I'm seeing with what's happening with Alpha.
> >
> > Here is lspci on my DEC Alpha XP-1000:
> >
> > root@tsunami:~> lspci
> > 0000:00:07.0 ISA bridge: Contaq Microsystems 82c693
> > 0000:00:07.1 IDE interface: Contaq Microsystems 82c693
> > 0000:00:07.2 IDE interface: Contaq Microsystems 82c693
> > 0000:00:07.3 USB controller: Contaq Microsystems 82c693
> > 0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020 [Permedia 2] (rev 01)
> > 0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
> > 0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 06)
> > 0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 03)
> > 0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit Ethernet Controller (rev 05)
> > root@tsunami:~>
>
> This is no good. What I asked last Thursday was:
>
> "Could you send me the output of lspci -vvx -s 7.1 and lspci -vvx -s 7.2
> please?"
>
> so I can see the resources the kernel is using and a dump of the PCI
> config space to see what the hardware is using.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
