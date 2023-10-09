Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C57BED4F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 23:26:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UT3LTAkF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Bsk5Fj8z3cgW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 08:26:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UT3LTAkF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4BlJ0wsLz3vXT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 08:20:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 81EE0B81736;
	Mon,  9 Oct 2023 21:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8BCC43397;
	Mon,  9 Oct 2023 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696886423;
	bh=qv+Y57MlZMLwkqB8O60+0DiPLEkUZWkKZe9KzhoJldc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UT3LTAkFViz27WO2a1m/giMM3usPYkfzypcwZepfADL9BLFOYD1xV49Y8R83EHv9d
	 U/lhj0L7pR89Dap4i9W1pFwEUKsiLm3GOAhPqXi7aE3QEvFJ/734gTflNsEJfWm2w4
	 njavechlp0UoJJlTm0q667uw+TWTV3RycMm7i0H/841ADy7IHGfbpupktL2PF75gmU
	 WBJRDVA3CL33jAJjHhRa0RIwPDR3kChFa+bgx1aw1KfIZCXO3Fh2dtrJ8tMoguvVEE
	 zL+j0gjEBRl8jzm90qcbA4AlVl+vMFffaF0tIghzZUgaXxpLivnkGDQtZFzudGBMhl
	 FHkZ1NMn75L+g==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/9] vga16fb: drop powerpc support
Date: Mon,  9 Oct 2023 23:18:43 +0200
Message-Id: <20231009211845.3136536-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009211845.3136536-1-arnd@kernel.org>
References: <20231009211845.3136536-1-arnd@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, Russell King <linux@armlinux.org.uk>, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Javier Martinez Canillas <javierm@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.co
 m>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

I noticed that commit 0db5b61e0dc07 ("fbdev/vga16fb: Create
EGA/VGA devices in sysfb code") broke vga16fb on non-x86 platforms,
because the sysfb code never creates a vga-framebuffer device when
screen_info.orig_video_isVGA is set to '1' instead of VIDEO_TYPE_VGAC.

However, it turns out that the only architecture that has allowed
building vga16fb in the past 20 years is powerpc, and this only worked
on two 32-bit platforms and never on 64-bit powerpc. The last machine
that actually used this was removed in linux-3.10, so this is all dead
code and can be removed.

The big-endian support in vga16fb.c could also be removed, but I'd just
leave this in place.

Fixes: 933ee7119fb14 ("powerpc: remove PReP platform")
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kernel/setup-common.c | 16 ----------------
 drivers/video/fbdev/Kconfig        |  2 +-
 drivers/video/fbdev/vga16fb.c      |  9 +--------
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 2f1026fba00d5..22d48a5430611 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -22,7 +22,6 @@
 #include <linux/seq_file.h>
 #include <linux/ioport.h>
 #include <linux/console.h>
-#include <linux/screen_info.h>
 #include <linux/root_dev.h>
 #include <linux/cpu.h>
 #include <linux/unistd.h>
@@ -98,21 +97,6 @@ int boot_cpu_hwid = -1;
 int dcache_bsize;
 int icache_bsize;
 
-/*
- * This still seems to be needed... -- paulus
- */ 
-struct screen_info screen_info = {
-	.orig_x = 0,
-	.orig_y = 25,
-	.orig_video_cols = 80,
-	.orig_video_lines = 25,
-	.orig_video_isVGA = 1,
-	.orig_video_points = 16
-};
-#if defined(CONFIG_FB_VGA16_MODULE)
-EXPORT_SYMBOL(screen_info);
-#endif
-
 /* Variables required to store legacy IO irq routing */
 int of_i8042_kbd_irq;
 EXPORT_SYMBOL_GPL(of_i8042_kbd_irq);
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 5bea59f29d2fe..ab40ff33a8495 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -364,7 +364,7 @@ config FB_IMSTT
 
 config FB_VGA16
 	tristate "VGA 16-color graphics support"
-	depends on FB && (X86 || PPC)
+	depends on FB && X86
 	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index b43c874c199f6..6094080852a53 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -185,8 +185,6 @@ static inline void setindex(int index)
 /* Check if the video mode is supported by the driver */
 static inline int check_mode_supported(const struct screen_info *si)
 {
-	/* non-x86 architectures treat orig_video_isVGA as a boolean flag */
-#if defined(CONFIG_X86)
 	/* only EGA and VGA in 16 color graphic mode are supported */
 	if (si->orig_video_isVGA != VIDEO_TYPE_EGAC &&
 	    si->orig_video_isVGA != VIDEO_TYPE_VGAC)
@@ -197,7 +195,7 @@ static inline int check_mode_supported(const struct screen_info *si)
 	    si->orig_video_mode != 0x10 &&	/* 640x350/4 (EGA) */
 	    si->orig_video_mode != 0x12)	/* 640x480/4 (VGA) */
 		return -ENODEV;
-#endif
+
 	return 0;
 }
 
@@ -1338,12 +1336,7 @@ static int vga16fb_probe(struct platform_device *dev)
 	printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base);
 	par = info->par;
 
-#if defined(CONFIG_X86)
 	par->isVGA = si->orig_video_isVGA == VIDEO_TYPE_VGAC;
-#else
-	/* non-x86 architectures treat orig_video_isVGA as a boolean flag */
-	par->isVGA = si->orig_video_isVGA;
-#endif
 	par->palette_blanked = 0;
 	par->vesa_blanked = 0;
 
-- 
2.39.2

