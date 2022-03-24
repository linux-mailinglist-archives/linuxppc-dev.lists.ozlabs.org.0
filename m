Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993354E6550
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:34:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSRF3GR6z3dyC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:34:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSMr1J0Fz3bgX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:31:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSM62Rznz9sTl;
 Thu, 24 Mar 2022 15:30:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAR13Swuuv32; Thu, 24 Mar 2022 15:30:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSLy5P8tz9sTm;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AECA58B763;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iwBCbJ26OgYm; Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B34CA8B78D;
 Thu, 24 Mar 2022 15:30:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEUi5r1811764
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:30:45 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEUixg1811763;
 Thu, 24 Mar 2022 15:30:44 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 21/22] powerpc/inst: Remove PPC_INST_BL
Date: Thu, 24 Mar 2022 15:30:11 +0100
Message-Id: <43f418a2d7377669f10738be374c3dd78f5d0351.1648131740.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648131740.git.christophe.leroy@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132152; l=1328; s=20211009;
 h=from:subject:message-id; bh=d/0sxDLqKwCM/yFYRKIyBRndGeNibtd5T3dOKw3MQJc=;
 b=pyjWcSj8RzaW7zHcMj/KcQkTwTflEA/lc9eWqCI/EkBSbaY9M9sIUtfCB/hMaxx987RGOe7wok2G
 AR7kYOXiBjXQAP+/lWqsxERvSULzVE4hTSRq42R7y/v+cCLr383d
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

Convert last users of PPC_INST_BL to PPC_RAW_BL()

And remove PPC_INST_BL.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 1 -
 arch/powerpc/net/bpf_jit.h            | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ada8fe17b199..810a28af9dce 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -290,7 +290,6 @@
 #define PPC_INST_ADDIS			0x3c000000
 #define PPC_INST_ADD			0x7c000214
 #define PPC_INST_DIVD			0x7c0003d2
-#define PPC_INST_BL			0x48000001
 #define PPC_INST_BRANCH_COND		0x40800000
 
 #define PPC_INST_OFFSET24_MASK		0x03fffffc
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 979701d360da..c63324ff9f04 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -35,7 +35,7 @@
 	} while (0)
 
 /* bl (unconditional 'branch' with link) */
-#define PPC_BL(dest)	EMIT(PPC_INST_BL | (((dest) - (unsigned long)(image + ctx->idx)) & 0x03fffffc))
+#define PPC_BL(dest)	EMIT(PPC_RAW_BL((dest) - (unsigned long)(image + ctx->idx)))
 
 /* "cond" here covers BO:BI fields. */
 #define PPC_BCC_SHORT(cond, dest)					      \
-- 
2.35.1

