Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7513B5F609A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 07:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjg2L0fz9z3bnY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:28:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjg1n66j3z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 16:27:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Mjg1k1QXhz9srM;
	Thu,  6 Oct 2022 07:27:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwO9xeIbdnAK; Thu,  6 Oct 2022 07:27:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Mjg1k0Vpvz9srL;
	Thu,  6 Oct 2022 07:27:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EC7F78B765;
	Thu,  6 Oct 2022 07:27:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xEON1u-GHu7p; Thu,  6 Oct 2022 07:27:37 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.234])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CAEB68B763;
	Thu,  6 Oct 2022 07:27:37 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2965ROi4211692
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 6 Oct 2022 07:27:24 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2965RNxL211690;
	Thu, 6 Oct 2022 07:27:23 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] virt: fsl_hypervisor: Replace NO_IRQ by 0
Date: Thu,  6 Oct 2022 07:27:17 +0200
Message-Id: <20dd37b96bac0a72caef28e7462b32c93487a516.1665033909.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665034036; l=917; s=20211009; h=from:subject:message-id; bh=qqe7nvnFl6xYC1fvgTqn7ABe+HafH3istsa0ecP2L7A=; b=3URz/3OQ7ysoZ7XnKIy+SHK6GCbGdn72zXGzFdp5DxC1POUkY08wGV0PPiqRr8dssIeyrYMUnAzx W2PaJY8oCkOPeek+QQanFm97Zhk7JcbO/Ic8YkrcvuI+POPUnnxH
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

NO_IRQ is used to check the return of irq_of_parse_and_map().

On some architecture NO_IRQ is 0, on other architectures it is -1.

irq_of_parse_and_map() returns 0 on error, independent of NO_IRQ.

So use 0 instead of using NO_IRQ.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/virt/fsl_hypervisor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 07035249a5e1..f8b4389d60d9 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -839,7 +839,7 @@ static int __init fsl_hypervisor_init(void)
 
 		handle = of_get_property(np, "interrupts", NULL);
 		irq = irq_of_parse_and_map(np, 0);
-		if (!handle || (irq == NO_IRQ)) {
+		if (!handle || !irq) {
 			pr_err("fsl-hv: no 'interrupts' property in %pOF node\n",
 				np);
 			continue;
-- 
2.37.1

