Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4692C544894
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 12:17:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJg5M3ZYdz3c8S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 20:17:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJg4x5w5Pz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 20:17:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LJg4n2cjVz9tJH;
	Thu,  9 Jun 2022 12:17:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CquQaKZpF0QP; Thu,  9 Jun 2022 12:17:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LJg4n1rgVz9tJB;
	Thu,  9 Jun 2022 12:17:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C5888B77E;
	Thu,  9 Jun 2022 12:17:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9m_gcIdVOhYL; Thu,  9 Jun 2022 12:17:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.129])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D2ADB8B779;
	Thu,  9 Jun 2022 12:17:12 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 259AH7eB133875
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 9 Jun 2022 12:17:07 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 259AH7Et133874;
	Thu, 9 Jun 2022 12:17:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/3] powerpc/irq: Simplify __do_irq()
Date: Thu,  9 Jun 2022 12:16:42 +0200
Message-Id: <5a3b21311191f1240850db6ab29b19ac7885fe03.1654769775.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <adbe1c8315ec2d63259f41468e82e51677bb1eda.1654769775.git.christophe.leroy@csgroup.eu>
References: <adbe1c8315ec2d63259f41468e82e51677bb1eda.1654769775.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1654769796; l=977; s=20211009; h=from:subject:message-id; bh=xPwNVe000eN2DJVt6xZCsdQz6hHo3NPxzkYNOYjA61w=; b=2GsZPo4SfVOte/difHxgCcuUUYr7GCKFeyh2awhrz+t7BYYbg7DTK3LUREljdSFkogHE1P7KiMmw Scln8xAYCi/jtTgZxT3P/eSt1q3q1U+jzYrvAFfkOdeOTyfyViLy
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove duplicated code by implementing a proper if/else.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/irq.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index e5b7fb5282ee..b007f16ccbd3 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -280,14 +280,11 @@ void __do_IRQ(struct pt_regs *regs)
 	irqsp = hardirq_ctx[raw_smp_processor_id()];
 	sirqsp = softirq_ctx[raw_smp_processor_id()];
 
-	/* Already there ? */
-	if (unlikely(cursp == irqsp || cursp == sirqsp)) {
+	/* Already there ? If not switch stack and call */
+	if (unlikely(cursp == irqsp || cursp == sirqsp))
 		__do_irq(regs, current_stack_pointer);
-		set_irq_regs(old_regs);
-		return;
-	}
-	/* Switch stack and call */
-	call_do_irq(regs, irqsp);
+	else
+		call_do_irq(regs, irqsp);
 
 	set_irq_regs(old_regs);
 }
-- 
2.35.3

