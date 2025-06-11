Return-Path: <linuxppc-dev+bounces-9287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E534AD5264
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 12:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHMjn34yzz309v;
	Wed, 11 Jun 2025 20:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749638685;
	cv=none; b=nfiy+JJmAXLT6C5BMAjy8GqXhuzn1duCXcR8EBN2/uun5uoM44oK4kOsZaSY0qCnv/SQgbdcV/aRU6z7xZMyJQE+1NDPPyc69ghDl9NWL1V+CgXhuJXKGRsGCtRdlAQfAavtpUav1yQVRZiJFM1KQQ6RDHfCjofwi4GRZBc6l1meM+jgahQ2N+F8UT88dkXv53bWzqEMM9swkcWiwLSG7NNjD2oA+2qmDpKWHTaXg2D809lpM7b1+7njefCZ5XHqcjz2Hy5bLvr0wOm2x/1QlRpgVeHucthued8YrKJzAmOb1snPHx2YO3w/EZfX/am1euUNzCyIDIXmB1PxphBxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749638685; c=relaxed/relaxed;
	bh=xOcA8JVEjHxy7SXGk73izLSpZeUh6cImIEszSD+A3x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOTSDeXDYJJENHtrwG29Nt65JGkpUpuqVA02hl7GYhvPn7R7Z7ev3MnlfWLxJQhmqcEX/I/7Z+KP+q82oKhyvuHNIuVf0wKO5U2/Zu+0/vwhJTlE6eurXQCDUTsrIMeZ3tMVuhA/xqxa1ujtycw0aoQ9N1rUsagUbeo+tv3O6sMFVLQRI8sZkePrsCtzDgpuSwQZkxpI/AugOP7KRmC3BOe7Ueys7FluqMtyIG4qRH2ENZOthUPN/1YLXkAdIV4IM+Bk6SMjdGfuglThaMCdIkqm/UTyh8pXYVRTaXb8wSbEyngSxS2qE4bANzERKVeCA92piGSb58fFtMfiRf5gjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bhJu2rvf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bhJu2rvf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHMjm5BnHz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 20:44:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB990A51682;
	Wed, 11 Jun 2025 10:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC8EC4CEF2;
	Wed, 11 Jun 2025 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638682;
	bh=NLnT5+LOFbAWdUD6OEeMhq8wMEwsqTEbDWDE/LB5oWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhJu2rvffdhuDVYngs0/mJHh/Ii4qb2QtctIipm4DBUJclR7bsCSEQGuTxOzsfrfd
	 Tn7OMefVMV6axO7RrfvnO8OMXp5QKHdplyCFpuiVX3N9XIeci0hEtQCurRRXEoNS47
	 5oZjNV8VHM9DH7/3p/qvdnQz1P7LRnMlqmILblb6ZJAW41cFP8LhyauvBLQrtkAfWY
	 nm5aGIbCO8SY0LuJpQe5iQZ1I9feFo0r+Vho7MCYLp7c6CU4howsxj+6Yr+olrWmg6
	 evu2rEF7aJz8wsiiOu7o+21ahm9P3mc3P2Ioqhcq69dKyjhSWfLsmpSZ15C0ivm/ty
	 yuu2qvRW95l+A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] soc: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:47 +0200
Message-ID: <20250611104348.192092-19-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org

---
Cc: linux-tegra@vger.kernel.org
---
 drivers/soc/fsl/qe/qe_ic.c | 3 +--
 drivers/soc/tegra/pmc.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 4068b501a3a3..943911053af6 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -407,7 +407,6 @@ static int qe_ic_init(struct platform_device *pdev)
 	void (*high_handler)(struct irq_desc *desc);
 	struct qe_ic *qe_ic;
 	struct resource *res;
-	struct device_node *node = pdev->dev.of_node;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res == NULL) {
@@ -441,7 +440,7 @@ static int qe_ic_init(struct platform_device *pdev)
 		high_handler = NULL;
 	}
 
-	qe_ic->irqhost = irq_domain_create_linear(of_fwnode_handle(node), NR_QE_IC_INTS,
+	qe_ic->irqhost = irq_domain_create_linear(dev_fwnode(&pdev->dev), NR_QE_IC_INTS,
 						  &qe_ic_host_ops, qe_ic);
 	if (qe_ic->irqhost == NULL) {
 		dev_err(dev, "failed to add irq domain\n");
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e0d67bfe955c..9543bee0c321 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2500,8 +2500,7 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
 	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
 
-	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96,
-						  of_fwnode_handle(pmc->dev->of_node),
+	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96, dev_fwnode(pmc->dev),
 						  &tegra_pmc_irq_domain_ops, pmc);
 	if (!pmc->domain) {
 		dev_err(pmc->dev, "failed to allocate domain\n");
-- 
2.49.0


