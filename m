Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D083467F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 19:44:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4gJb3qBDz3brJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 05:44:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=wCZfve7N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=wCZfve7N; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4gJ51g0nz30Dt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 05:44:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DKyHtKCO0K411018/e/MjJ+tlpnzWhDvazNrYsJOSa8=; b=wCZfve7N74jmvnRTUOrJapFiD
 leJcWyRdawkhb6OZ4a1jxgzU3R/uQMZ2qIC4/y+Z+g9Sm9wd52sx8s5nB9p/DacOKa0D085kbjhUG
 t719Zz6QmKCjMRJa189d+8TdFKszHhlT0JCrsUlaN15Ckx/gO6mdtjjXk0VX6m+6vTI47uvdxpJvh
 2BG/ot8QgcvNes2LaU+gyZF0cTx4dYG2XnofuryoyNBFgVrUagwbgOO2Ln4dpB+6KoQP+1egdlpI6
 il+83CsRb5nFRb3bPUyPMt1saGI84tHzmPIAIUXwkbKTNs43gPCOy+82tv90e78q6UWOAjTD1usvT
 97GM9EK/Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51634)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lOlzy-00080o-ME; Tue, 23 Mar 2021 18:43:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lOlzt-0004Mo-J1; Tue, 23 Mar 2021 18:43:21 +0000
Date: Tue, 23 Mar 2021 18:43:21 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Cye Borg <cyborgyn@gmail.com>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Message-ID: <20210323184321.GE1463@shell.armlinux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de>
 <20210322151503.GX1463@shell.armlinux.org.uk>
 <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
 <20210322170338.GZ1463@shell.armlinux.org.uk>
 <CAD4NMuZWoV0m85OyBDHLt+J8NYCV5wYx7fFZaivBNEgDnrN5xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD4NMuZWoV0m85OyBDHLt+J8NYCV5wYx7fFZaivBNEgDnrN5xw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Mar 22, 2021 at 06:10:01PM +0100, Cye Borg wrote:
> PWS 500au:
> 
> snow / # lspci -vvx -s 7.1
> 00:07.1 IDE interface: Contaq Microsystems 82c693 (prog-if 80 [ISA
> Compatibility mode-only controller, supports bus mastering])
>         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr+ Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin A routed to IRQ 0
>         Region 0: I/O ports at 01f0 [size=8]
>         Region 1: I/O ports at 03f4
>         Region 4: I/O ports at 9080 [size=16]
>         Kernel driver in use: pata_cypress
>         Kernel modules: pata_cypress
> 00: 80 10 93 c6 45 00 80 02 00 80 01 01 00 00 80 00
> 10: f1 01 00 00 f5 03 00 00 00 00 00 00 00 00 00 00
> 20: 81 90 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00
> 
> snow / # lspci -vvx -s 7.2
> 00:07.2 IDE interface: Contaq Microsystems 82c693 (prog-if 00 [ISA
> Compatibility mode-only controller])
>         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr+ Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin B routed to IRQ 0
>         Region 0: I/O ports at 0170 [size=8]
>         Region 1: I/O ports at 0374
>         Region 4: Memory at 0c240000 (32-bit, non-prefetchable)
> [disabled] [size=64K]
>         Kernel modules: pata_cypress
> 00: 80 10 93 c6 45 00 80 02 00 00 01 01 00 00 80 00
> 10: 71 01 00 00 75 03 00 00 00 00 00 00 00 00 00 00
> 20: 00 00 24 0c 00 00 00 00 00 00 00 00 00 00 00 00
> 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00

Thanks very much.

Could I also ask for the output of:

# lspci -vxxx -s 7.0

as well please - this will dump all 256 bytes for the ISA bridge, which
contains a bunch of configuration registers. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
