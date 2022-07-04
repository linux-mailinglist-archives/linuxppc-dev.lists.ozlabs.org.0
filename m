Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B835653E5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:41:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3mW5bdHz3g2h
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:41:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fN57gyz3by6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fM0X09z4xbT;
	Mon,  4 Jul 2022 21:36:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <e8b4eb82a126c3c6c352173a544fe94609ff660b.1654261687.git.christophe.leroy@csgroup.eu>
References: <e8b4eb82a126c3c6c352173a544fe94609ff660b.1654261687.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/irq: Increase stack_overflow detection limit when KASAN is enabled
Message-Id: <165693439802.9954.361439982234083073.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:18 +1000
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Jun 2022 15:08:14 +0200, Christophe Leroy wrote:
> When KASAN is enabled, as shown by the Oops below, the 2k limit is not
> enough to allow stack dump after a stack overflow detection when
> CONFIG_DEBUG_STACKOVERFLOW is selected:
> 
> 	do_IRQ: stack overflow: 1984
> 	CPU: 0 PID: 126 Comm: systemd-udevd Not tainted 5.18.0-gentoo-PMacG4 #1
> 	Call Trace:
> 	Oops: Kernel stack overflow, sig: 11 [#1]
> 	BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
> 	Modules linked in: sr_mod cdrom radeon(+) ohci_pci(+) hwmon i2c_algo_bit drm_ttm_helper ttm drm_dp_helper snd_aoa_i2sbus snd_aoa_soundbus snd_pcm ehci_pci snd_timer ohci_hcd snd ssb ehci_hcd 8250_pci soundcore drm_kms_helper pcmcia 8250 pcmcia_core syscopyarea usbcore sysfillrect 8250_base sysimgblt serial_mctrl_gpio fb_sys_fops usb_common pkcs8_key_parser fuse drm drm_panel_orientation_quirks configfs
> 	CPU: 0 PID: 126 Comm: systemd-udevd Not tainted 5.18.0-gentoo-PMacG4 #1
> 	NIP:  c02e5558 LR: c07eb3bc CTR: c07f46a8
> 	REGS: e7fe9f50 TRAP: 0000   Not tainted  (5.18.0-gentoo-PMacG4)
> 	MSR:  00001032 <ME,IR,DR,RI>  CR: 44a14824  XER: 20000000
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/irq: Increase stack_overflow detection limit when KASAN is enabled
      https://git.kernel.org/powerpc/c/41f20d6db2b64677225bb0b97df956241c353ef8

cheers
