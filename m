Return-Path: <linuxppc-dev+bounces-5865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D3A28F43
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 15:23:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yp2X44S1Dz2ywh;
	Thu,  6 Feb 2025 01:23:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:1800:120:4::f00:10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738765396;
	cv=none; b=fZ32hhC4+PfuqbieXmCrnG1RtIjLmuDLYG6Jc7o27CavMbkRWAgIPu4zML3dT3b5ngEmcC9y6RmpRBCnqnGRvJNLMRvlaDqIih0LBK7F9rDHcLk1mB4jTyerdrJt2DIV8uuZl2bPRCiSOJkXht5TFK7xDq2zeOcOnP/H844lsABqNZFY3wHl6mRxe2qGQz+lzfHDFmjrbmP27M+fmDFl/OFWupxAzghExgW+L0uOovM2vD5sHz06wYrT1Tww84uC8mvJxsViBgkZ4y2pKDVwoxJAaq1i+hJkyO0Ykmnp7d+Y7WrFEw2VaCeUsi9Iz8LksUJjryxHnXsmpP6nWERWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738765396; c=relaxed/relaxed;
	bh=a/8PdkwfBTst9U9oxIPQp141IYCfq5FliGP36NKg2Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gmAIXzDWfVpFNWqlhBKyNjTXutjdhJFPgPcCDw9J+I1zmZUCStZ/nC1Z0IGwEDKsJDRuc8l6qBCpRLVMpRQQLjvCzp1sDLbfGv31waBH9Nz2R6Vv3U/lej5HU020eXR5/KE6ZQSh0QLWuV4xzLn02SIp//aHMxi3IQM66gPTZbvD5yc6xXPp8fUlH074WLMnhtanZYRFr9o8ctIbooFaZhgwBj1ME1Ej5eOJLqGpGE25RP5K+2WxA9raCBgU1LuxvGV5nlvVigQ5+ptT9Lk+TNaKJSvkKUiA78NvGNXBLD2Z+7dbnNnjVo4r4QCBOKk5wAwcWC1vybpLung0tL4iiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=2a02:1800:120:4::f00:10; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=cantor.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=cantor.telenet-ops.be (client-ip=2a02:1800:120:4::f00:10; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yp2X33TgQz2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 01:23:15 +1100 (AEDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Yp2Wr2gtwz4x2sT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2025 15:23:04 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by andre.telenet-ops.be with cmsmtp
	id 9qNz2E0013f221S01qNzia; Wed, 05 Feb 2025 15:23:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfgIg-0000000FvzO-3MeQ;
	Wed, 05 Feb 2025 15:22:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfgIs-00000006bFa-3Ylm;
	Wed, 05 Feb 2025 15:22:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	David Wang <00107082@163.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] genirq: Remove leading space from .irq_print_chip() callbacks
Date: Wed,  5 Feb 2025 15:22:56 +0100
Message-ID: <893f7e9646d8933cd6786d5a1ef3eb076d263768.1738764803.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The space separator was factored out from the multiple chip name prints,
but several irq_chip.irq_print_chip() callbacks still print a leading
space.  Remove the superfluous double spaces.

Fixes: 9d9f204bdf7243bf ("genirq/proc: Add missing space separator back")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/powerpc/sysdev/fsl_msi.c          | 2 +-
 drivers/bus/moxtet.c                   | 2 +-
 drivers/irqchip/irq-partition-percpu.c | 2 +-
 drivers/soc/qcom/smp2p.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 1aa0cb097c9c9d7c..7b9a5ea9cad9d3c7 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -75,7 +75,7 @@ static void fsl_msi_print_chip(struct irq_data *irqd, struct seq_file *p)
 	srs = (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK;
 	cascade_virq = msi_data->cascade_array[srs]->virq;
 
-	seq_printf(p, " fsl-msi-%d", cascade_virq);
+	seq_printf(p, "fsl-msi-%d", cascade_virq);
 }
 
 
diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
index 6276551d79680e85..1e57ebfb76229aa0 100644
--- a/drivers/bus/moxtet.c
+++ b/drivers/bus/moxtet.c
@@ -657,7 +657,7 @@ static void moxtet_irq_print_chip(struct irq_data *d, struct seq_file *p)
 
 	id = moxtet->modules[pos->idx];
 
-	seq_printf(p, " moxtet-%s.%i#%i", mox_module_name(id), pos->idx,
+	seq_printf(p, "moxtet-%s.%i#%i", mox_module_name(id), pos->idx,
 		   pos->bit);
 }
 
diff --git a/drivers/irqchip/irq-partition-percpu.c b/drivers/irqchip/irq-partition-percpu.c
index 8e76d2913e6bebbf..4441ffe149ea0d96 100644
--- a/drivers/irqchip/irq-partition-percpu.c
+++ b/drivers/irqchip/irq-partition-percpu.c
@@ -98,7 +98,7 @@ static void partition_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
 	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
 
-	seq_printf(p, " %5s-%lu", chip->name, data->hwirq);
+	seq_printf(p, "%5s-%lu", chip->name, data->hwirq);
 }
 
 static struct irq_chip partition_irq_chip = {
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 4783ab1adb8d953b..a3e88ced328a91f1 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -365,7 +365,7 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
 {
 	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
 
-	seq_printf(p, " %8s", dev_name(entry->smp2p->dev));
+	seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
 }
 
 static struct irq_chip smp2p_irq_chip = {
-- 
2.43.0


