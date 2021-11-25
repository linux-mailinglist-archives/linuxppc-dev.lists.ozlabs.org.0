Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5033945D977
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 12:44:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0GHg26Ldz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 22:44:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0GHF1VLJz2xsj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 22:43:51 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0GH84R41z9sSW;
 Thu, 25 Nov 2021 12:43:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSG_jw7OqoGR; Thu, 25 Nov 2021 12:43:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0GH83l6tz9sSV;
 Thu, 25 Nov 2021 12:43:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7124E8B77A;
 Thu, 25 Nov 2021 12:43:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 94hWI3YE42R8; Thu, 25 Nov 2021 12:43:48 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.227])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 38FB78B763;
 Thu, 25 Nov 2021 12:43:48 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1APBhbTr117898
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 12:43:37 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1APBhXb1117897;
 Thu, 25 Nov 2021 12:43:33 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Don't bother about .data..Lubsan sections
Date: Thu, 25 Nov 2021 12:43:33 +0100
Message-Id: <3eb14570612eef17e01bb67f14a4450136001794.1637840601.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637840612; l=1102; s=20211009;
 h=from:subject:message-id; bh=2pAKPrf6wKL6psT7NzqeviUQb9ty6xwDndN2RJY3ZGI=;
 b=IW5lPNUNeih3QiIXhtyA7tMwizw8pp0V5PJQ4Nc3oQ24/ZCavIZLEc8n0zq4Bfq8u/nguMLb1Xd1
 zjrA16k1CMjf1M4t+kF1lTNGI9lXH7qJ26q3vFfuXzgR2f5oF0W4
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 9a427556fb8e ("vmlinux.lds.h: catch compound literals
into data and BSS") .data..Lubsan sections are taken into account
in DATA_MAIN which is included in DATA_DATA macro.

No need to take care of them anymore in powerpc vmlinux.lds.S

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vmlinux.lds.S | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 18e42c74abdd..dfc3f39d365f 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -322,10 +322,6 @@ SECTIONS
 #ifdef CONFIG_PPC32
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		DATA_DATA
-#ifdef CONFIG_UBSAN
-		*(.data..Lubsan_data*)
-		*(.data..Lubsan_type*)
-#endif
 		*(.data.rel*)
 		*(SDATA_MAIN)
 		*(.sdata2)
@@ -336,10 +332,6 @@ SECTIONS
 #else
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		DATA_DATA
-#ifdef CONFIG_UBSAN
-		*(.data..Lubsan_data*)
-		*(.data..Lubsan_type*)
-#endif
 		*(.data.rel*)
 		*(.toc1)
 		*(.branch_lt)
-- 
2.33.1

