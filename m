Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649959CC09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 01:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBSwP6Z92z3c6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 09:18:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i4rOcaC6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i4rOcaC6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBSvq3xDyz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 09:18:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C146161306;
	Mon, 22 Aug 2022 23:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04F0C433C1;
	Mon, 22 Aug 2022 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661210291;
	bh=p2jVqFX8K2UVaGZve9czBNa9bn69C5yS4yarQ+BR9aA=;
	h=From:To:Cc:Subject:Date:From;
	b=i4rOcaC6Ap5/eZ54afL61CtYVgPcwNDCfJGDge1Tcai90ChOXS8fo9p5GtnmB1JE6
	 /p0esLl/qCM7rL8RPNTHgfm4CF6NTgNFPi8F+yBHT66jWl14Um6MvUcE7mSV78s7mA
	 Dn7aWKseCvybx8Nd9Hocl+4ZjnTT7sMX1I/IU5HRInW5mRAUdrvY+Tx9BAGWhqegvX
	 7Y7Q4l4lG/oOeuNgdcuFToKguFHOafDp77NGCR1exB+Hq54Fx3ZGrGLCHNfzY0Q7NK
	 kZTVXUar3ekP/9a5QAzivkaHJVopP9j3+i39/MtQUeixYXkw8ep/NPU/eTz+NId4Lq
	 cMfgPYT8RWIJA==
Received: by pali.im (Postfix)
	id 32F3997B; Tue, 23 Aug 2022 01:18:08 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Gabriel Paubert <paubert@iram.es>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Nick Child <nick.child@ibm.com>
Subject: [PATCH] powerpc: udbg: Remove extern function prototypes
Date: Tue, 23 Aug 2022 01:17:51 +0200
Message-Id: <20220822231751.16973-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'extern' keywork is pointless and deprecated for function prototypes.

Signed-off-by: Pali Rohár <pali@kernel.org>
Suggested-by: Gabriel Paubert <paubert@iram.es>
---
Depends on patch:
https://lore.kernel.org/linuxppc-dev/20220819211254.22192-1-pali@kernel.org/
---
 arch/powerpc/include/asm/udbg.h | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
index 20b5a37ab772..2d74b264b326 100644
--- a/arch/powerpc/include/asm/udbg.h
+++ b/arch/powerpc/include/asm/udbg.h
@@ -15,13 +15,13 @@ extern void (*udbg_flush)(void);
 extern int (*udbg_getc)(void);
 extern int (*udbg_getc_poll)(void);
 
-extern void udbg_puts(const char *s);
-extern int udbg_write(const char *s, int n);
+void udbg_puts(const char *s);
+int udbg_write(const char *s, int n);
 
-extern void register_early_udbg_console(void);
-extern void udbg_printf(const char *fmt, ...)
+void register_early_udbg_console(void);
+void udbg_printf(const char *fmt, ...)
 	__attribute__ ((format (printf, 1, 2)));
-extern void udbg_progress(char *s, unsigned short hex);
+void udbg_progress(char *s, unsigned short hex);
 
 void __init udbg_uart_init_mmio(void __iomem *addr, unsigned int stride);
 void __init udbg_uart_init_pio(unsigned long port, unsigned int stride);
@@ -31,29 +31,29 @@ unsigned int __init udbg_probe_uart_speed(unsigned int clock);
 
 struct device_node;
 void __init udbg_scc_init(int force_scc);
-extern int udbg_adb_init(int force_btext);
-extern void udbg_adb_init_early(void);
-
-extern void __init udbg_early_init(void);
-extern void __init udbg_init_debug_lpar(void);
-extern void __init udbg_init_debug_lpar_hvsi(void);
-extern void __init udbg_init_pmac_realmode(void);
-extern void __init udbg_init_maple_realmode(void);
-extern void __init udbg_init_pas_realmode(void);
-extern void __init udbg_init_rtas_panel(void);
-extern void __init udbg_init_rtas_console(void);
-extern void __init udbg_init_debug_beat(void);
-extern void __init udbg_init_btext(void);
-extern void __init udbg_init_44x_as1(void);
-extern void __init udbg_init_40x_realmode(void);
-extern void __init udbg_init_cpm(void);
-extern void __init udbg_init_usbgecko(void);
-extern void __init udbg_init_memcons(void);
-extern void __init udbg_init_ehv_bc(void);
-extern void __init udbg_init_ps3gelic(void);
-extern void __init udbg_init_debug_opal_raw(void);
-extern void __init udbg_init_debug_opal_hvsi(void);
-extern void __init udbg_init_debug_16550(void);
+int udbg_adb_init(int force_btext);
+void udbg_adb_init_early(void);
+
+void __init udbg_early_init(void);
+void __init udbg_init_debug_lpar(void);
+void __init udbg_init_debug_lpar_hvsi(void);
+void __init udbg_init_pmac_realmode(void);
+void __init udbg_init_maple_realmode(void);
+void __init udbg_init_pas_realmode(void);
+void __init udbg_init_rtas_panel(void);
+void __init udbg_init_rtas_console(void);
+void __init udbg_init_debug_beat(void);
+void __init udbg_init_btext(void);
+void __init udbg_init_44x_as1(void);
+void __init udbg_init_40x_realmode(void);
+void __init udbg_init_cpm(void);
+void __init udbg_init_usbgecko(void);
+void __init udbg_init_memcons(void);
+void __init udbg_init_ehv_bc(void);
+void __init udbg_init_ps3gelic(void);
+void __init udbg_init_debug_opal_raw(void);
+void __init udbg_init_debug_opal_hvsi(void);
+void __init udbg_init_debug_16550(void);
 
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_UDBG_H */
-- 
2.20.1

