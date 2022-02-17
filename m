Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D384B9F94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 13:02:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JztkT0dSxz3cmk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 23:02:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jztjw1zcPz3cDR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 23:02:27 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jztjr3ywzz9sSZ;
 Thu, 17 Feb 2022 13:02:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8HK48oUeKlw; Thu, 17 Feb 2022 13:02:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jztjr3Bxmz9sRv;
 Thu, 17 Feb 2022 13:02:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F1478B780;
 Thu, 17 Feb 2022 13:02:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FQJtncJFfTIv; Thu, 17 Feb 2022 13:02:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.225])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1604B8B763;
 Thu, 17 Feb 2022 13:02:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21HC2ITQ400842
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 13:02:18 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21HC2In7400841;
 Thu, 17 Feb 2022 13:02:18 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 3/4] powerpc/ftrace: Regroup PPC64 specific operations in
 ftrace_mprofile.S
Date: Thu, 17 Feb 2022 13:01:58 +0100
Message-Id: <619dfb672bf4f1b777a4b3f8b4f14e637fea2716.1645099283.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ec286d2cc6989668a96f14543275437d2f3f0e3a.1645099283.git.christophe.leroy@csgroup.eu>
References: <ec286d2cc6989668a96f14543275437d2f3f0e3a.1645099283.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645099315; l=1188; s=20211009;
 h=from:subject:message-id; bh=XMIYYhQft+jL7/o2oyJXW3QWdZRHg33NfV3DhZbDywQ=;
 b=t5/JLVBulgsg7g1omxoG3MZAkrTcPSUvsnjYBnC+ZSWqQif8+O0lrHAG0EFcsi+kaN3dZvsRuXJ9
 aDFwdjTEATn1MLYkcZLEQt1or9tfe2HXQkQK/uN0L0kQ4g/0zkP2
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

CONFIG_MPROFILE_KERNEL is only for PPC64 and ftrace_mprofile.o
is build on PPC64 only when CONFIG_MPROFILE_KERNEL is defined.

Move saving of r0 inside #ifdef PPC64

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace_mprofile.S | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index 630b2de9957b..f5d31c458e6b 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -33,11 +33,6 @@
  * and then arrange for the ftrace function to be called.
  */
 .macro	ftrace_regs_entry allregs
-	/* Save the original return address in A's stack frame */
-#ifdef CONFIG_MPROFILE_KERNEL
-	PPC_STL	r0,LRSAVE(r1)
-#endif
-
 	/* Create our stack frame + pt_regs */
 	PPC_STLU	r1,-SWITCH_FRAME_SIZE(r1)
 
@@ -46,6 +41,8 @@
 	SAVE_GPRS(3, 10, r1)
 
 #ifdef CONFIG_PPC64
+	/* Save the original return address in A's stack frame */
+	std	r0, LRSAVE+SWITCH_FRAME_SIZE(r1)
 	/* Ok to continue? */
 	lbz	r3, PACA_FTRACE_ENABLED(r13)
 	cmpdi	r3, 0
-- 
2.34.1

