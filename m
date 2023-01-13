Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471966A706
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 00:26:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtyH02gfzz3fFV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 10:26:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbddpZF+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbddpZF+;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtyG10vn3z3c8F
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 10:25:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ED2E0B82281
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 23:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040D0C4339E
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 23:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673652339;
	bh=qVbsd05KHLBi1A1+RbPFk566wcNZkDulba+8c+3hkj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qbddpZF+rtTQS3lmkPk0tctXVZyie9B0bwgJwGg/0fHAiUtgLAn9wl12laoY7LpBm
	 U1H7r9uySq9XpQ25Im4FwxchgV9+OakT1O1OjQ8psh5aqcOsMsDP7Svqr+c/xzTX/s
	 j7QEWX0Bl+l4mjahgPF3Cd2lBQ3zpJ+28wN4NDZjRUUAkUnBzhjcQYduDBsJ6XcGIa
	 Ma0HS1A2tb1bIltI3xNQ9plBSNJhUAYVB2Kinqystwm6npTsJ6qJ5WriFTSom3SR3u
	 RwXusnaQdams5hELxZk53gi4Kq6j+P4JouJ1W8N1pouDhROKS5KXXRRPtl1gs66zQ+
	 6yiP7mDFhigVw==
Received: by mail-lf1-f54.google.com with SMTP id cf42so35213513lfb.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 15:25:38 -0800 (PST)
X-Gm-Message-State: AFqh2kpNWhBPq+UqIxuIxj6HRpry6hQdJjhAZRdWbQT666u8foM71cGI
	B82ahJxwhtZOG0U8InTiM+xAgOL79r+TGqJYTyc=
X-Google-Smtp-Source: AMrXdXsiVcvp4M0sdC7uvlVrEchvlWch7gsiC5oLxJ7MUg+sdhbvU1pVuoSujQ7D12h8RonWIO1ypm2Vdq0KlsYUOC4=
X-Received: by 2002:a05:6512:3d93:b0:4b8:9001:a694 with SMTP id
 k19-20020a0565123d9300b004b89001a694mr3999732lfv.426.1673652336888; Fri, 13
 Jan 2023 15:25:36 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
 <db6937a1-e817-2d7b-0062-9aff012bb3e8@physik.fu-berlin.de>
In-Reply-To: <db6937a1-e817-2d7b-0062-9aff012bb3e8@physik.fu-berlin.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 14 Jan 2023 00:25:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEtTuaNFiKWn3cJngR0J2vr0G07HR6+5PBodtr1b7vNxg@mail.gmail.com>
Message-ID: <CAMj1kXEtTuaNFiKWn3cJngR0J2vr0G07HR6+5PBodtr1b7vNxg@mail.gmail.com>
Subject: Re: ia64 removal (was: Re: lockref scalability on x86-64 vs cpu_relax)
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Luck, Tony" <tony.luck@intel.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 13 Jan 2023 at 22:06, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hello Ard!
>
> > Can I take that as an ack on [0]? The EFI subsystem has evolved
> > substantially over the years, and there is really no way to do any
> > IA64 testing beyond build testing, so from that perspective, dropping
> > it entirely would be welcomed.
>
> ia64 is regularly tested in Debian and Gentoo [1][2].
>
> Debian's ia64 porterbox yttrium runs a recent kernel without issues:
>
> root@yttrium:~# uname -a
> Linux yttrium 5.19.0-2-mckinley #1 SMP Debian 5.19.11-1 (2022-09-24) ia64 GNU/Linux
> root@yttrium:~#
>
> root@yttrium:~# journalctl -b|head -n10
> Nov 14 14:46:10 yttrium kernel: Linux version 5.19.0-2-mckinley (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-6) 11.3.0, GNU ld (GNU Binutils for Debian) 2.39) #1 SMP Debian 5.19.11-1 (2022-09-24)
> Nov 14 14:46:10 yttrium kernel: efi: EFI v2.10 by HP
> Nov 14 14:46:10 yttrium kernel: efi: SALsystab=0xdfdd63a18 ESI=0xdfdd63f18 ACPI 2.0=0x3d3c4014 HCDP=0xdffff8798 SMBIOS=0x3d368000
> Nov 14 14:46:10 yttrium kernel: PCDP: v3 at 0xdffff8798
> Nov 14 14:46:10 yttrium kernel: earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
> Nov 14 14:46:10 yttrium kernel: printk: bootconsole [uart8250] enabled
> Nov 14 14:46:10 yttrium kernel: ACPI: Early table checksum verification disabled
> Nov 14 14:46:10 yttrium kernel: ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
> Nov 14 14:46:10 yttrium kernel: ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2 00000001      01000013)
> Nov 14 14:46:10 yttrium kernel: ACPI: FACP 0x000000003D3BE000 0000F4 (v03 HP     RX2800-2 00000001 HP   00000001)
> root@yttrium:~#
>
> Same applies to the buildds:
>
> root@lifshitz:~# uname -a
> Linux lifshitz 6.0.0-4-mckinley #1 SMP Debian 6.0.8-1 (2022-11-11) ia64 GNU/Linux
> root@lifshitz:~#
>
> root@lenz:~# uname -a
> Linux lenz 6.0.0-4-mckinley #1 SMP Debian 6.0.8-1 (2022-11-11) ia64 GNU/Linux
> root@lenz:~#
>
> EFI works fine as well using the latest version of GRUB2.
>
> Thanks,
> Adrian
>
> > [1] https://cdimage.debian.org/cdimage/ports/snapshots/
> > [2] https://mirror.yandex.ru/gentoo-distfiles//releases/ia64/autobuilds/

Thanks for reporting back. I (mis)read the debian ports page [3],
which mentions Debian 7 as the highest Debian version that supports
IA64, and so I assumed that support had been dropped from Debian.

However, if only a handful of people want to keep this port alive for
reasons of nostalgia, it is obviously obsolete, and we should ask
ourselves whether it is reasonable to expect Linux contributors to
keep spending time on this.

Does the Debian ia64 port have any users? Or is the system that builds
the packages the only one that consumes them?


[3] https://www.debian.org/ports/ia64/
