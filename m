Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7913B428CB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 14:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSczn13mJz3cXB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 23:09:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HScxj6MP9z2yTr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 23:07:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HScxh5lgHz4xbX;
 Mon, 11 Oct 2021 23:07:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <884a54f1e5cb774c1d9b4db780209bee5d4f6718.1631712563.git.christophe.leroy@csgroup.eu>
References: <884a54f1e5cb774c1d9b4db780209bee5d4f6718.1631712563.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] video: fbdev: use memset_io() instead of memset()
Message-Id: <163395400552.4094789.12015421663855128336.b4-ty@ellerman.id.au>
Date: Mon, 11 Oct 2021 23:06:45 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>,
 Stan Johnson <userm57@yahoo.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Sep 2021 15:34:35 +0200, Christophe Leroy wrote:
> While investigating a lockup at startup on Powerbook 3400C, it was
> identified that the fbdev driver generates alignment exception at
> startup:
> 
> 	--- interrupt: 600 at memset+0x60/0xc0
> 	NIP:  c0021414 LR: c03fc49c CTR: 00007fff
> 	REGS: ca021c10 TRAP: 0600   Tainted: G        W          (5.14.2-pmac-00727-g12a41fa69492)
> 	MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 44008442  XER: 20000100
> 	DAR: cab80020 DSISR: 00017c07
> 	GPR00: 00000007 ca021cd0 c14412e0 cab80000 00000000 00100000 cab8001c 00000004
> 	GPR08: 00100000 00007fff 00000000 00000000 84008442 00000000 c0006fb4 00000000
> 	GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00100000
> 	GPR24: 00000000 81800000 00000320 c15fa400 c14d1878 00000000 c14d1800 c094e19c
> 	NIP [c0021414] memset+0x60/0xc0
> 	LR [c03fc49c] chipsfb_pci_init+0x160/0x580
> 	--- interrupt: 600
> 	[ca021cd0] [c03fc46c] chipsfb_pci_init+0x130/0x580 (unreliable)
> 	[ca021d20] [c03a3a70] pci_device_probe+0xf8/0x1b8
> 	[ca021d50] [c043d584] really_probe.part.0+0xac/0x388
> 	[ca021d70] [c043d914] __driver_probe_device+0xb4/0x170
> 	[ca021d90] [c043da18] driver_probe_device+0x48/0x144
> 	[ca021dc0] [c043e318] __driver_attach+0x11c/0x1c4
> 	[ca021de0] [c043ad30] bus_for_each_dev+0x88/0xf0
> 	[ca021e10] [c043c724] bus_add_driver+0x190/0x22c
> 	[ca021e40] [c043ee94] driver_register+0x9c/0x170
> 	[ca021e60] [c0006c28] do_one_initcall+0x54/0x1ec
> 	[ca021ed0] [c08246e4] kernel_init_freeable+0x1c0/0x270
> 	[ca021f10] [c0006fdc] kernel_init+0x28/0x11c
> 	[ca021f30] [c0017148] ret_from_kernel_thread+0x14/0x1c
> 	Instruction dump:
> 	7d4601a4 39490777 7d4701a4 39490888 7d4801a4 39490999 7d4901a4 39290aaa
> 	7d2a01a4 4c00012c 4bfffe88 0fe00000 <4bfffe80> 9421fff0 38210010 48001970
> 
> [...]

Applied to powerpc/next.

[1/1] video: fbdev: use memset_io() instead of memset()
      https://git.kernel.org/powerpc/c/f2719b26ae27282c145202ffd656d5ff1fe737cc

cheers
