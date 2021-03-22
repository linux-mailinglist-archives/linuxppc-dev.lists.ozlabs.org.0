Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F168F34541F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4CRP0Mpmz3bt6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:48:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DLCxZ8Y9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=cyborgyn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DLCxZ8Y9; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F40mT2Pg7z2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:47:52 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so8827905pjg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eo71V2xWro59w05Mq4CnF1xMsNUIPGze5LTw4FuXS2A=;
 b=DLCxZ8Y9zjxqRMlu1J8/r7nzs+yb79uVYpIuUsLrMH2v7J7Of8MvDHK0SAqytIoffm
 IAcbm21SCskZVG0eMJTr/YPMa8dHdIOU7yid/4LU7z/xIwCf9PNd33usAoL0/NQpXcnc
 o0YIKhvIluJkw1ZSUEcZMolcs/Y8JiBAbhOynMzl2CrMOnnyCLaMxMzWF2c9Ghg1b841
 4qb49GnPjICOYIu1Vhp19jfa+9rvWhFbBsLo/E4GW41FleypfdMdpq2n4VxGvHEZH6p5
 YKgzKKhCPIKkHcTfK09hDujGumj2q6l0S/SugkxawOWShbvmusbIpR3FE/vb2RMokzM/
 Dgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eo71V2xWro59w05Mq4CnF1xMsNUIPGze5LTw4FuXS2A=;
 b=GoeWgDJhoZD8bW8GBiibq6OT56AnpuhaV/p2Cr0rzTlT5k/Sa5we9z9e0h5vljH7F0
 DcvNBeIYbl5ul/bSHdvxC2qaMd5Gu3TobxjWJ1+j+fg+yZmmtNiDpjUr/01Pr/SRtKLd
 Deuue7To+/9zd9XdkQXQODSRyZNeG5KoXyJ6ZpPHsx7vgUEotEKAF3N/BSWUqkKc28C6
 kBdlbnnydO+0IusqYdQu+hE5Asngrm6VE98b9MUWl5mjqJqGob+/iQfPDVkUVLc4faVO
 evKeSfnuSq3BxC+zeC26yyGDSag8IMkD35+zGrHeByRZYLWug+tcNo1VBZvLJ5udUWjF
 cJDg==
X-Gm-Message-State: AOAM532ujcNXVfyV9/n/p3z3HBVZpVILBAMDtbXXFLM5OJwvqz9Dxufd
 PNILOzdekJqMV3q1zZWZVZVboOiF5L8O9aAZ4qQ=
X-Google-Smtp-Source: ABdhPJz5yVUG5nM8XQz+XfMVliRVJC+u6jW/d5gyfhCJ3fkTqwu7NtLBIJlTT4tDwktHXGI3PU2WiL1llZFRnDkPC1o=
X-Received: by 2002:a17:902:8507:b029:e5:ea3a:3d61 with SMTP id
 bj7-20020a1709028507b02900e5ea3a3d61mr489956plb.71.1616431669453; Mon, 22 Mar
 2021 09:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk>
 <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
In-Reply-To: <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
From: Cye Borg <cyborgyn@gmail.com>
Date: Mon, 22 Mar 2021 17:47:38 +0100
Message-ID: <CAD4NMuYBr7m+6Zw9cmOJWMXHqNOM17RqGY8bR7itx2yq8piKcw@mail.gmail.com>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I use pata_cypress on Alpha, and for the above mentioned problems,
it always restricted me to use only one IDE channel out of the two
available. Also, not forcing it to use PIO mode, it always failed to
operate. I would love to test on Alpha, and give you feedback about
a fix/finished implementation of the driver. I have both Alpha Server DS20E
and Alpha Personal Workstation 500 including that freak chipset.

Let me know if/when I can help with my limited capabilities.

btw, here is the lspci of the Compaq PWS 500au:
snow / # lspci
00:03.0 Ethernet controller: Digital Equipment Corporation DECchip
21142/43 (rev 30)
00:07.0 ISA bridge: Contaq Microsystems 82c693
00:07.1 IDE interface: Contaq Microsystems 82c693
00:07.2 IDE interface: Contaq Microsystems 82c693
00:07.3 USB controller: Contaq Microsystems 82c693
00:0b.0 Multimedia video controller: 3Dfx Interactive, Inc. Voodoo 2 (rev 02)
00:0c.0 PCI bridge: Digital Equipment Corporation DECchip 21052 (rev 01)
00:14.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 02)
01:04.0 VGA compatible controller: Cirrus Logic GD 5430/40 [Alpine] (rev 47)
01:05.0 Display controller: Intergraph Corporation Device 00eb (rev 40)
02:04.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 05)
02:0a.0 SCSI storage controller: Broadcom / LSI 53c810 (rev 01)

Thanks, best regards,
Barnabas Viragh


On Mon, Mar 22, 2021 at 5:10 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> On 3/22/21 4:15 PM, Russell King - ARM Linux admin wrote:
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
>
> Here is lspci on my DEC Alpha XP-1000:
>
> root@tsunami:~> lspci
> 0000:00:07.0 ISA bridge: Contaq Microsystems 82c693
> 0000:00:07.1 IDE interface: Contaq Microsystems 82c693
> 0000:00:07.2 IDE interface: Contaq Microsystems 82c693
> 0000:00:07.3 USB controller: Contaq Microsystems 82c693
> 0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020 [Permedia 2] (rev 01)
> 0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
> 0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 06)
> 0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 03)
> 0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit Ethernet Controller (rev 05)
> root@tsunami:~>
>
> It's using pata_cypress:
>
> root@tsunami:~> lsmod|grep cypress
> pata_cypress            3595  3
> libata                235071  2 ata_generic,pata_cypress
> root@tsunami:~
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>
