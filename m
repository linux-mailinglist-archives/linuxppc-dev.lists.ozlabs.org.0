Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2627E603D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 22:55:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rEbp+ATJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQf5w3qgwz3dRS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 08:55:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rEbp+ATJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQQHl4F9gz3cLQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 00:03:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10F00B81C66;
	Wed,  8 Nov 2023 13:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA9AC433C9;
	Wed,  8 Nov 2023 13:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448592;
	bh=8u/is9yGIjCKvKH616JPDZxQp4kevRf+hbF66shzciw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rEbp+ATJ8TL9tb/LlyZhDPrzGSoac6GqEtllIoknZuh3HS0PBjJ7Uq/p/fm1nXndd
	 5z95k+15Z7EVhKI2k5WFN6+zT6Dcx9LlXxtd8jGTglWA4ZtuBnSsS18mrcef8iCZsu
	 ZdGdKwnX74k42PjMs3bX54mFIVVH+UaUx6HnTk2bpX6YvZuyIqNVw1i69bKcDM+kx8
	 0QhbxPOnkVCFn+1IoJLaaDxqLtMx+o9VlbUNRag9/FUeK+64zJfYk6BL3buGhjE4FE
	 mVN9tNfFpgp0GOm3gK9WgCB6E7ONWa5a1WiaxBVRuDniK5TMae0M2X3SRFJE7qtIKk
	 B7Fo7+w6HCt9A==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
Date: Wed,  8 Nov 2023 13:58:38 +0100
Message-Id: <20231108125843.3806765-18-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Nov 2023 08:41:16 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>
 , linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-mips@vger.kernel.org, Sudip Mukherjee <sudipm.mukherj
 ee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Allmodconfig kernels produce a missing-prototypes warning:

arch/powerpc/platforms/ps3/gelic_udbg.c:239:6: error: no previous prototype for 'udbg_shutdown_ps3gelic' [-Werror=missing-prototypes]

Move the declaration from a local header to asm/ps3.h where it can be
seen from both the caller and the definition.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/ps3.h               | 6 ++++++
 arch/powerpc/platforms/ps3/gelic_udbg.c      | 1 +
 drivers/net/ethernet/toshiba/ps3_gelic_net.h | 6 ------
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/ps3.h b/arch/powerpc/include/asm/ps3.h
index a5f36546a052..d13d8fdc3411 100644
--- a/arch/powerpc/include/asm/ps3.h
+++ b/arch/powerpc/include/asm/ps3.h
@@ -514,4 +514,10 @@ u64 ps3_get_spe_id(void *arg);
 
 void ps3_early_mm_init(void);
 
+#ifdef CONFIG_PPC_EARLY_DEBUG_PS3GELIC
+void udbg_shutdown_ps3gelic(void);
+#else
+static inline void udbg_shutdown_ps3gelic(void) {}
+#endif
+
 #endif
diff --git a/arch/powerpc/platforms/ps3/gelic_udbg.c b/arch/powerpc/platforms/ps3/gelic_udbg.c
index 6b298010fd84..a5202c18c236 100644
--- a/arch/powerpc/platforms/ps3/gelic_udbg.c
+++ b/arch/powerpc/platforms/ps3/gelic_udbg.c
@@ -14,6 +14,7 @@
 #include <linux/ip.h>
 #include <linux/udp.h>
 
+#include <asm/ps3.h>
 #include <asm/io.h>
 #include <asm/udbg.h>
 #include <asm/lv1call.h>
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.h b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
index 0d98defb011e..0ec7412febc7 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.h
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
@@ -346,12 +346,6 @@ static inline void *port_priv(struct gelic_port *port)
 	return port->priv;
 }
 
-#ifdef CONFIG_PPC_EARLY_DEBUG_PS3GELIC
-void udbg_shutdown_ps3gelic(void);
-#else
-static inline void udbg_shutdown_ps3gelic(void) {}
-#endif
-
 int gelic_card_set_irq_mask(struct gelic_card *card, u64 mask);
 /* shared netdev ops */
 void gelic_card_up(struct gelic_card *card);
-- 
2.39.2

