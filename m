Return-Path: <linuxppc-dev+bounces-10243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17EB05114
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 07:37:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bh7HT17K2z3byt;
	Tue, 15 Jul 2025 15:37:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752557845;
	cv=none; b=dInt/s9KQq3Up32GxW1mDXx+5pEqtZLC10PMYWaoGlxBgemKAQD3U3jhBcWakdQ7mEu52IcpR9TNxCfi+dSwvJiVAYgh8+xp9Qfio/f055rR4LMKzL8rJJB/eRgVFxE7O1G+mudUQMquC9BqBXYzsAojGt9K0b+gtL3XJGxdve3gO1BV7lQe4qUsXVwt0N1T8pml+iB9JcJtal9MI1K38ZtO37D0FQxbRi1Rpmcnk/yDcYAOblK0RG2OdYUOouEk8I6/E/WKurj3ELwRBEMU92/hDyRdHJ27k3DyRU0BAvfIQi30YOQn2CDOXp63cobaWP+uNqt0WllR01bdJnm76g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752557845; c=relaxed/relaxed;
	bh=Tji+VPcRen1/CuQi6wUn6Tib/DXX/AwY4yutOlghfP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mkTcfXJ/NR84QGddbCpQemUf7JwajHA6BKcSC17c31BJA8jKJFdh96+SxS0vsBV2rbXfEJ3ZMFytMsptX4oofDTpkeS+nyy1Hyf8Ja8H6+lqnUfF+neD5nQxhffYMyDHe2ByicCZgeiN5Avn13kMIS9qy6v4m1H9aSKjuBO8MMsZipq2zag7ZIobc12GRXaa7S9VwkK/EH1rif76KqxHJahqZcq6UL8OSJyhC4pzbCunmYHxCLAosdam/TyX4hS3T3iDIzpppAfFchVrTwFU9mm/NFebFRjF+C2buat3dqLn1BFKpuADzD8CIjIvtsNV9i3cSfZeq/MNsB7G/WaKog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OD3WsebZ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OD3WsebZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bh7HR5GmPz3byF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 15:37:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C443A4C138;
	Tue, 15 Jul 2025 05:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12609C4CEF4;
	Tue, 15 Jul 2025 05:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752557840;
	bh=6J3hCrPuy++HUhp2ZStrBO9vMI6jCI0BvgNUFtgBHOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OD3WsebZ74BNCweLXWK6ZDpiy1GYCnmXu2xh27/ENvLdsLSkrLFQ6mR5l1mP+HUMG
	 MShniYJqNM1s31wMmQw8FxDkHjit4SvfyoI6wUc1GOv+6z5AyvmnmyD6drAojuQ7np
	 fOs0Zsj44GMv/NBf25ahV1vQZSouQi2ASuXroB6TqmINioyqTPuLu3wfF4V0KxSSjK
	 0PR45/X7hWdpadu6p9W0SgtO5vmgSyqWPe258S/Buu2TrZcJGDDU9K/fmM8I4Uoql0
	 Hu69E3heOIAt/PsIe2m0WLAzWWr5PZ0Gr/ihpETockVthBQZ9NoB8xkXw0f93zawy2
	 SFMRROjblWu6w==
From: Kees Cook <kees@kernel.org>
To: linux-kernel@vger.kernel.org,
	Dave Martin <Dave.Martin@arm.com>
Cc: Kees Cook <kees@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Larsson <andreas@gaisler.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chris Zankel <chris@zankel.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rich Felker <dalias@libc.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 00/23] binfmt_elf,arch/*: Use elf.h for coredump note names
Date: Mon, 14 Jul 2025 22:37:11 -0700
Message-Id: <175255782864.3413694.2008555655056311560.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 01 Jul 2025 14:55:53 +0100, Dave Martin wrote:
> This series aims to clean up an aspect of coredump generation:
> 
> ELF coredumps contain a set of notes describing the state of machine
> registers and other information about the dumped process.
> 
> Notes are identified by a numeric identifier n_type and a "name"
> string, although this terminology is somewhat misleading.  Officially,
> the "name" of a note is really an "originator" or namespace identifier
> that indicates how to interpret n_type [1], although in practice it is
> often used more loosely.
> 
> [...]

Applied to for-next/execve, thanks!

[01/23] regset: Fix kerneldoc for struct regset_get() in user_regset
        https://git.kernel.org/kees/c/6fd9e1aa0784
[02/23] regset: Add explicit core note name in struct user_regset
        https://git.kernel.org/kees/c/85a7f9cbf8a8
[03/23] binfmt_elf: Dump non-arch notes with strictly matching name and type
        https://git.kernel.org/kees/c/9674a1be4dd5
[04/23] ARC: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/237dc8d79627
[05/23] ARM: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/49b849d11cd1
[06/23] arm64: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/87b0d081dc98
[07/23] csky: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/2c2fb861fc59
[08/23] hexagon: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/55821111b1b3
[09/23] LoongArch: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/1260e3b13584
[10/23] m68k: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/e572168e8d2a
[11/23] MIPS: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/18bd88faa246
[12/23] nios2: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/8368cd0e4636
[13/23] openrisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/10cd957a895f
[14/23] parisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/92acdd819b5d
[15/23] powerpc/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/307035acefbd
[16/23] riscv: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/c9502cc7bef5
[17/23] s390/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/d6a883cb40fc
[18/23] sh: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/afe74eecd88f
[19/23] sparc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/c9d4cb25e94e
[20/23] x86/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/3de0414dec7b
[21/23] um: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/40d3a88594b5
[22/23] xtensa: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
        https://git.kernel.org/kees/c/cb32fb722f4b
[23/23] binfmt_elf: Warn on missing or suspicious regset note names
        https://git.kernel.org/kees/c/a55128d392e8

Take care,

-- 
Kees Cook


