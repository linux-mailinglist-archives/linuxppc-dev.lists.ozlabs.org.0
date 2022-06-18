Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8255029B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 06:11:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ2Y90T3Wz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 14:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Kf5feUfv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Kf5feUfv;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ2XW56s3z303H
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 14:11:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DhswK
	TrmeUbKndG6IYc5Pec0+hrQzVcfBYcwy6754iY=; b=Kf5feUfvu5rP35R6M3Rn9
	TimAtl8GS8lKAeozkpaEfRPFu+5pSlOFd6Bj030dvNZKE4ej9BuDJOvGvD/DQzMq
	92prbAkEBxYAdvw8L3C+fRQOrFY6xc5FJfZBaVuGNqYI4zrkWkVayNXGl/iXCJ5j
	XTXukdljFC2fZ2UM0BojnQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgD3RGlDUK1iKBiWEw--.28580S2;
	Sat, 18 Jun 2022 12:10:44 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	christophe.leroy@csgroup.eu,
	npiggin@gmail.com,
	maz@kernel.org
Subject: [PATCH v2] powerpc: embedded6xx: Fix refcount leak bugs
Date: Sat, 18 Jun 2022 12:10:42 +0800
Message-Id: <20220618041042.4058066-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgD3RGlDUK1iKBiWEw--.28580S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1DAFy7WFyDGF1fGF4rKrg_yoW8KFykpr
	yvkFs2yF48WFZ7ta4vyFZrZryxGFnYgrW3tw4jk3s7ZF1DurWIvFWUX3sxtrWkGrWUW3Wr
	Zr4Ikw4Sqwn3W3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR5UUUUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AQkF1pEDvpQjAAAsd
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
Cc: windhl@126.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In xx_init_xx(), of_find_node_by_type() will return a node pointer
with refcount incremented. We should use of_node_put() when it is
not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 v2: we merge all embedded6xx related bugs into one commit
 v1: we only report the bug in holly_init_pci() of holly.c

 arch/powerpc/platforms/embedded6xx/holly.c        | 6 ++++++
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 78f2378d9223..bebc5a972694 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -123,6 +123,8 @@ static void __init holly_init_pci(void)
 	if (np)
 		tsi108_setup_pci(np, HOLLY_PCI_CFG_PHYS, 1);
 
+	of_node_put(np);
+
 	ppc_md.pci_exclude_device = holly_exclude_device;
 	if (ppc_md.progress)
 		ppc_md.progress("tsi108: resources set", 0x100);
@@ -184,6 +186,9 @@ static void __init holly_init_IRQ(void)
 	tsi108_pci_int_init(cascade_node);
 	irq_set_handler_data(cascade_pci_irq, mpic);
 	irq_set_chained_handler(cascade_pci_irq, tsi108_irq_cascade);
+
+	of_node_put(tsi_pci);
+	of_node_put(cascade_node);
 #endif
 	/* Configure MPIC outputs to CPU0 */
 	tsi108_write_reg(TSI108_MPIC_OFFSET + 0x30c, 0);
@@ -210,6 +215,7 @@ static void __noreturn holly_restart(char *cmd)
 	if (bridge) {
 		prop = of_get_property(bridge, "reg", &size);
 		addr = of_translate_address(bridge, prop);
+		of_node_put(bridge);
 	}
 	addr += (TSI108_PB_OFFSET + 0x414);
 
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index 8b2b42210356..ddf0c652af80 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -135,6 +135,9 @@ static void __init mpc7448_hpc2_init_IRQ(void)
 	tsi108_pci_int_init(cascade_node);
 	irq_set_handler_data(cascade_pci_irq, mpic);
 	irq_set_chained_handler(cascade_pci_irq, tsi108_irq_cascade);
+
+	of_node_put(tsi_pci);
+	of_node_put(cascade_node);
 #endif
 	/* Configure MPIC outputs to CPU0 */
 	tsi108_write_reg(TSI108_MPIC_OFFSET + 0x30c, 0);
-- 
2.25.1

