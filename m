Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04894A3CBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 04:32:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnDCJ2NcQz3cC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 14:32:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gDzE5iIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gDzE5iIU; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnDBd12H2z2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 14:31:50 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id k17so11404325plk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 19:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=aLC5y5dwNL0mHY6kgWfr0cxPkBKTAx64pTs8KTBmILs=;
 b=gDzE5iIUhOr+uaSIMR8MoJQU0wJqYpP9sHFw+HuLyJq0CTs3yS4rxLYf5zYIWOiROD
 2Bq9vRa7X3gG5/muU2T9eEw5sMv3AjTYg76k4qyc9VcqBoOkGlQ29ZB+HTzkS0NpByTr
 yYAWxqhLGH8oh7tAaKZzieJ6bE0euk3quZRgektO9hji+ICCdoBnw+7EVsdC2jUq/yoV
 6V3EOrYtHrxWJHjLv3nqIIZU212xCLsOdpXJpsTbtEIolt4eTFsyPpOSiRh0dBsurUQX
 JR4Jlt7ErjrmckfcEnUWYQ8Zo1k8pcBq4kbaRKABz4QnKyMxjhXcSoILPiqalBPgIAqB
 289g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=aLC5y5dwNL0mHY6kgWfr0cxPkBKTAx64pTs8KTBmILs=;
 b=eooXNLy3R3A8BXrzLwRh+iKIRLkqNgcs3x8nApgDftDT5Q5txR+M6bGH8djtZiByF5
 vHAHfOiYC6yyCqqOzOrldg/bAfcNwL7F/NZBswUw/rCx9OoeaibGQnTvpDPaai+tOqY0
 MQGMDLLXtHa2lkVURx8hlqquc3LEp/0onljGkDgZn2C6yFO9cx0fMqr29/OwLqN18oqR
 CBWfGS4STbWrmnz1sarMaFf7EcGX3OBz5gL49P9+Ovqh9hkOXZIvSj/UdRksmx4YOuDX
 TGl6tW7x1yQ0p2ftTx3ZTn9FEw91jZJuy/o//maIn3B26BXcQUj6FVxHOdSXlFbcjefi
 VsFw==
X-Gm-Message-State: AOAM533SFv2OvK1uKBL4SrHzxU965kHbg8++v/RLLdbiQfCPoN4f4gdT
 1YlMz5CIFXdmwSZTq3DBXkw=
X-Google-Smtp-Source: ABdhPJylbj6dxTqGo69wpeDfYWsz3l3CgwtJN3amuRo3Sk9d3XH8faoDUf3RE6QeOIJuwPE4Y8kDvw==
X-Received: by 2002:a17:902:e74e:: with SMTP id
 p14mr6002210plf.161.1643599907403; 
 Sun, 30 Jan 2022 19:31:47 -0800 (PST)
Received: from localhost ([203.111.178.100])
 by smtp.gmail.com with ESMTPSA id j11sm16738039pfu.55.2022.01.30.19.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 19:31:47 -0800 (PST)
Date: Mon, 31 Jan 2022 13:31:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: microwatt booting linux-5.7 under verilator
To: Libre-Soc General Development <libre-soc-dev@lists.libre-soc.org>,
 linuxppc-dev@lists.ozlabs.org, Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 openpower-hdl-cores
 <openpower-hdl-cores@mailinglist.openpowerfoundation.org>
References: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
In-Reply-To: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1643598916.2hjoqtw60c.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Luke,

Interesting to read about the project, thanks for the post.

Excerpts from Luke Kenneth Casson Leighton's message of January 3, 2022 10:=
45 am:
> i am pleased to be able to announce the successful booting of microwatt-5=
.7
> linux buildroot... under a veriilator simulation of the microwatt VHDL.
> from a hardware development and research perspective this is highly
> significant because unlike the FPGA boot which was previously reported,
> https://shenki.github.io/boot-linux-on-microwatt/
> full memory read/write snooping and full Signal tracing (gtkwave) is poss=
ible.
>=20
> https://ftp.libre-soc.org/microwatt-linux-5.7-verilator-boot-buildroot.tx=
t
>=20
> the branch of microwatt HDL which is being used is here
> https://git.libre-soc.org/?p=3Dmicrowatt.git;a=3Dshortlog;h=3Drefs/heads/=
verilator_trace
>=20
> some minor strategic changes to microwatt HDL were required, including
> adding a new SYSCON parameter to specify a BRAM chain-boot address,
> and also it was necessary to turn sdram_init into a stand-alone "mini-BIO=
S"
> which performed the role of early-initialising the 16550 uart followed by
> chain-loading to the BRAM chain-boot memory location, at which the linux
> 5.7 dtbImage.microwatt had been loaded (0x600000).
>=20
> microwatt-verilator.cpp itself needed some changes to add support for
> emulation in c++ of 512 mbyte of "Block" RAM.  the interface for BRAM
> (aka SRAM) was far simpler than attempting to emulate DRAM, and
> also meant that much of the mini-BIOS could be entirely cut.
>=20
> i also had to  further modify microwatt-verilator.cpp to allow it to load
> from files directly into memory, at run-time.  this means it is possible
> to execute hello_world.bin, zephyr.bin, micropython.bin, dtbImage-microwa=
tt
> all without recompiling the verilator binary.
>=20
> (not that you want to try compiling a 6 MB binary into VHDL like i did:
> it resulted in the creation of a 512 MB verilog file which, at 60 GB resi=
dent
> RAM by verilator attempting to compile that to c++, i decided that mayyyb=
e
> doing that at runtime was a better approach?)
>=20
> i also had to fix a couple of things in the linux kernel source
> https://git.kernel.org/pub/scm/linux/kernel/git/joel/microwatt.git

I think these have mostly (all?) been upstreamed now.

> first attempts to boot a compressed image were quite hilarious: a
> quick back-of-the-envelope calculation by examining the rate at which
> LD/STs were being generated showed that the GZIP decompression
> would complete maybe some time in about 1 hour of real-world time.
> this led me to add support for CONFIG_KERNEL_UNCOMPRESSED
> and cut that time entirely, hence why you can see this in the console log=
:
>=20
>     0x5b0e10 bytes of uncompressed data copied

Interesting, it looks like your HAVE_KERNEL_UNCOMPRESSED support
patch is pretty trivial. We should be able to upstream it pretty
easily I think?

> secondly, the microwatt Makefile assumes that verilator clock rate
> runs at 50 mhz, where the microwatt.dts file says 100 mhz for both
> the UART clock as well as the system clock.  it would be really nice
> to have microwatt-linux read the SYSCON parameter for the
> clock rate, and for that to be dynamically inserted into the dtb.
> however in the interim, the attached patch suffices by manually
> altering the clock in microwatt.dts to match that of the SYSCON
> parameter.

There is a dt_fixup_clock() that's used by a few platforms. Can we
read that parameter say in linux/arch/powerpc/boot/microwatt.c
platform_init() and fix it up there?

How do you even read the SYSCON parameter for frequency?

Thanks,
Nick
