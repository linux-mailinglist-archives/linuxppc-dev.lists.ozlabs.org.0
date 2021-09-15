Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008940C67A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 15:35:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8h6Y1gxyz306R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 23:35:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8h6656VPz2yJP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 23:34:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H8h5z1lRrz9sTD;
 Wed, 15 Sep 2021 15:34:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEgdXHE1a0lz; Wed, 15 Sep 2021 15:34:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H8h5z0TFqz9sT4;
 Wed, 15 Sep 2021 15:34:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 00D478B77B;
 Wed, 15 Sep 2021 15:34:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ysdChU92eEWl; Wed, 15 Sep 2021 15:34:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D272F8B763;
 Wed, 15 Sep 2021 15:34:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18FDYa5U374511
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 15:34:36 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18FDYZW0374510;
 Wed, 15 Sep 2021 15:34:35 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] video: fbdev: use memset_io() instead of memset()
Date: Wed, 15 Sep 2021 15:34:35 +0200
Message-Id: <884a54f1e5cb774c1d9b4db780209bee5d4f6718.1631712563.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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

While investigating a lockup at startup on Powerbook 3400C, it was
identified that the fbdev driver generates alignment exception at
startup:

	--- interrupt: 600 at memset+0x60/0xc0
	NIP:  c0021414 LR: c03fc49c CTR: 00007fff
	REGS: ca021c10 TRAP: 0600   Tainted: G        W          (5.14.2-pmac-00727-g12a41fa69492)
	MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 44008442  XER: 20000100
	DAR: cab80020 DSISR: 00017c07
	GPR00: 00000007 ca021cd0 c14412e0 cab80000 00000000 00100000 cab8001c 00000004
	GPR08: 00100000 00007fff 00000000 00000000 84008442 00000000 c0006fb4 00000000
	GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00100000
	GPR24: 00000000 81800000 00000320 c15fa400 c14d1878 00000000 c14d1800 c094e19c
	NIP [c0021414] memset+0x60/0xc0
	LR [c03fc49c] chipsfb_pci_init+0x160/0x580
	--- interrupt: 600
	[ca021cd0] [c03fc46c] chipsfb_pci_init+0x130/0x580 (unreliable)
	[ca021d20] [c03a3a70] pci_device_probe+0xf8/0x1b8
	[ca021d50] [c043d584] really_probe.part.0+0xac/0x388
	[ca021d70] [c043d914] __driver_probe_device+0xb4/0x170
	[ca021d90] [c043da18] driver_probe_device+0x48/0x144
	[ca021dc0] [c043e318] __driver_attach+0x11c/0x1c4
	[ca021de0] [c043ad30] bus_for_each_dev+0x88/0xf0
	[ca021e10] [c043c724] bus_add_driver+0x190/0x22c
	[ca021e40] [c043ee94] driver_register+0x9c/0x170
	[ca021e60] [c0006c28] do_one_initcall+0x54/0x1ec
	[ca021ed0] [c08246e4] kernel_init_freeable+0x1c0/0x270
	[ca021f10] [c0006fdc] kernel_init+0x28/0x11c
	[ca021f30] [c0017148] ret_from_kernel_thread+0x14/0x1c
	Instruction dump:
	7d4601a4 39490777 7d4701a4 39490888 7d4801a4 39490999 7d4901a4 39290aaa
	7d2a01a4 4c00012c 4bfffe88 0fe00000 <4bfffe80> 9421fff0 38210010 48001970

This is due to 'dcbz' instruction being used on non-cached memory.
'dcbz' instruction is used by memset() to zeroize a complete
cacheline at once, and memset() is not expected to be used on non
cached memory.

When performing a 'sparse' check on fbdev driver, it also appears
that the use of memset() is unexpected:

	drivers/video/fbdev/chipsfb.c:334:17: warning: incorrect type in argument 1 (different address spaces)
	drivers/video/fbdev/chipsfb.c:334:17:    expected void *
	drivers/video/fbdev/chipsfb.c:334:17:    got char [noderef] __iomem *screen_base
	drivers/video/fbdev/chipsfb.c:334:15: warning: memset with byte count of 1048576

Use fb_memset() instead of memset(). fb_memset() is defined as
memset_io() for powerpc.

Fixes: 8c8709334cec ("[PATCH] ppc32: Remove CONFIG_PMAC_PBOOK")
Reported-by: Stan Johnson <userm57@yahoo.com>
Cc: Finn Thain <fthain@linux-m68k.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/video/fbdev/chipsfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index 998067b701fa..393894af26f8 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -331,7 +331,7 @@ static const struct fb_var_screeninfo chipsfb_var = {
 
 static void init_chips(struct fb_info *p, unsigned long addr)
 {
-	memset(p->screen_base, 0, 0x100000);
+	fb_memset(p->screen_base, 0, 0x100000);
 
 	p->fix = chipsfb_fix;
 	p->fix.smem_start = addr;
-- 
2.31.1

