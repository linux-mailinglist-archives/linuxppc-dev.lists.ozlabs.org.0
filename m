Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE53D76EBB3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 16:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGrCC42mZz3fcX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 00:02:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGr5T1VHYz3cVs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 23:57:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RGr4t1jffz9t4f;
	Thu,  3 Aug 2023 15:57:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCduBF0o_i5C; Thu,  3 Aug 2023 15:57:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RGr4m0kFqz9t4n;
	Thu,  3 Aug 2023 15:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 13F5B8B773;
	Thu,  3 Aug 2023 15:57:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SEOQdp5N5PsN; Thu,  3 Aug 2023 15:57:11 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B5E0E8B77A;
	Thu,  3 Aug 2023 15:57:11 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 373Dv4Yu494213
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 3 Aug 2023 15:57:04 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 373Dv4LC494212;
	Thu, 3 Aug 2023 15:57:04 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Timur Tabi <timur@kernel.org>
Subject: [PATCH v1 12/12] serial: cpm_uart: Remove linux/fs_uart_pd.h
Date: Thu,  3 Aug 2023 15:56:53 +0200
Message-ID: <f2cb444fa2b5776c9c51b5e46ea85edab62d1524.1691068700.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691068700.git.christophe.leroy@csgroup.eu>
References: <cover.1691068700.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691071001; l=2154; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=HrW+xy1mV9LzVHBn5BKDV/j8NZ7SIr3YuDt4l5zZYWg=; b=SdK5pHkJWllauesE1RX5dyJy0LrcFgHaRXxxuxOaVzLotCbSaMVmZ0KMHIZFsaBKbAfua+39r hiNo4obrsUEAbvpe/ljhUWlxDBpm5I1eK5Q0ABO5zr++3evq4BLo2wD
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

linux/fs_uart_pd.h is not used anymore. Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/fs_uart_pd.h | 71 --------------------------------------
 1 file changed, 71 deletions(-)
 delete mode 100644 include/linux/fs_uart_pd.h

diff --git a/include/linux/fs_uart_pd.h b/include/linux/fs_uart_pd.h
deleted file mode 100644
index 36b61ff39277..000000000000
--- a/include/linux/fs_uart_pd.h
+++ /dev/null
@@ -1,71 +0,0 @@
-/*
- * Platform information definitions for the CPM Uart driver.
- *
- * 2006 (c) MontaVista Software, Inc.
- * Vitaly Bordug <vbordug@ru.mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-
-#ifndef FS_UART_PD_H
-#define FS_UART_PD_H
-
-#include <asm/types.h>
-
-enum fs_uart_id {
-	fsid_smc1_uart,
-	fsid_smc2_uart,
-	fsid_scc1_uart,
-	fsid_scc2_uart,
-	fsid_scc3_uart,
-	fsid_scc4_uart,
-	fs_uart_nr,
-};
-
-static inline int fs_uart_id_scc2fsid(int id)
-{
-    return fsid_scc1_uart + id - 1;
-}
-
-static inline int fs_uart_id_fsid2scc(int id)
-{
-    return id - fsid_scc1_uart + 1;
-}
-
-static inline int fs_uart_id_smc2fsid(int id)
-{
-    return fsid_smc1_uart + id - 1;
-}
-
-static inline int fs_uart_id_fsid2smc(int id)
-{
-    return id - fsid_smc1_uart + 1;
-}
-
-struct fs_uart_platform_info {
-        void(*init_ioports)(struct fs_uart_platform_info *);
-	/* device specific information */
-	int fs_no;		/* controller index */
-	char fs_type[4];        /* controller type  */
-	u32 uart_clk;
-	u8 tx_num_fifo;
-	u8 tx_buf_size;
-	u8 rx_num_fifo;
-	u8 rx_buf_size;
-	u8 brg;
-	u8 clk_rx;
-	u8 clk_tx;
-};
-
-static inline int fs_uart_get_id(struct fs_uart_platform_info *fpi)
-{
-        if(strstr(fpi->fs_type, "SMC"))
-                return fs_uart_id_smc2fsid(fpi->fs_no);
-        if(strstr(fpi->fs_type, "SCC"))
-                return fs_uart_id_scc2fsid(fpi->fs_no);
-        return fpi->fs_no;
-}
-
-#endif
-- 
2.41.0

