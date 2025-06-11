Return-Path: <linuxppc-dev+bounces-9286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4944AD5263
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 12:44:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHMjl2SfXz2yDH;
	Wed, 11 Jun 2025 20:44:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749638683;
	cv=none; b=ojhF8NDFb2l+N5tc+Lu5HBmDZ1ucCq3UPY1ojiR1yNzwoWICrOL1P6zF8+l2lOP45T1majFrNyyJ0xtiXsFFYVXEt68A8dnVxI9L/Hi8mSs+SKwlEwRH0+My/rqzcgTgM+zTYpFz2Eeict/XZuQRcPy43t6bUewfhPQvo6AYc4djg/T9acxGDxcYC7UVAKAZ2y8UsU7Rgtbbe23cQaDAv6jjmtqZ0nBab01JSJmcO+nFH8GWdtHZBQHqS+UNN7BNc5tEkZkDNWB0iJRsQkC/1gK84Q6hiYGqY2cFfZ2AbygGTwyHdC0jZ68zw5vYQV/j2e4HQY4lRyyT1R1YChrDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749638683; c=relaxed/relaxed;
	bh=TNwA+KTnVGwUNklPRMqZURVApAxTkYCnDXFmRwaUv2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UevtXpXjXbv0OlCby8GIKFPQP0DV6WcM2m/E5+8+5ZlZ5qRg8eonbo+PyCpbm9r9rJIio/OGfKJd1vxOI5PD9xMdkSXxW16sqj5y5Wv8CrSte7ooCjbYd9sCcPQS7oEPjZH5+hVfWvksolwKTFCtDGfn+MkiN8zx/BWKgl/T9vAW8FNrwbfMucx11D04vijAOe/dK1COOHhC6j1nFb+BX2ZMb0CKHnR9FDD5L79/zKqUYpOkTbCHyeXZZ1958azr4sHkw9A+plXUjTCWX3nMwzeH2qpFp1P2DRrk4JTaKLomh1e+sD0mvSmwRWLKCuuIV6jttEz+gdSyzwz5gFu4dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LhsYik8E; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LhsYik8E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHMjk20l0z2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 20:44:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D401E447A1;
	Wed, 11 Jun 2025 10:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5719C4CEEE;
	Wed, 11 Jun 2025 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638679;
	bh=ZGWucHB5ib9wIAmp+jltch//8y7Q7viWPh80fKN9NEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LhsYik8EhyigmtOGF6QcBgTDeKZHxEMMLt01kP8lidZNhRcxt5/67UUrWaFHYZnAA
	 6V18JRPBo6/RIBKNPTSzOphjCGUoCz7GZtlneY/db20sVfLopbgIIfYAc9v94LRo3u
	 LCNUSx0lL+UeP1Z7w7XfVY/kQVbma5K3WcbtFa6sShDzWJDXOzKlHd4aev+pL/hQ0P
	 qsVPazrv73CJqua21HgSs8PFmUcu6aw8TsI0cjJbqBRPPzuNfS+6eqHvfOc34UlQ5O
	 3b5pRSQfWSXnCXsS4h+NJy6iHOWTQCwYtKry2lIp7MxfEQh+x4touAeqJAqtn6iqFg
	 y0fVVC4DW18Ug==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:46 +0200
Message-ID: <20250611104348.192092-18-jirislaby@kernel.org>
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
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/8xx/cpm1-ic.c | 3 +--
 arch/powerpc/sysdev/fsl_msi.c        | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8xx/cpm1-ic.c
index a49d4a9ab3bc..3292071e4da3 100644
--- a/arch/powerpc/platforms/8xx/cpm1-ic.c
+++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
@@ -110,8 +110,7 @@ static int cpm_pic_probe(struct platform_device *pdev)
 
 	out_be32(&data->reg->cpic_cimr, 0);
 
-	data->host = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
-					      64, &cpm_pic_host_ops, data);
+	data->host = irq_domain_create_linear(dev_fwnode(dev), 64, &cpm_pic_host_ops, data);
 	if (!data->host)
 		return -ENODEV;
 
diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 4fe8a7b1b288..2a007bfb038d 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -412,9 +412,8 @@ static int fsl_of_msi_probe(struct platform_device *dev)
 	}
 	platform_set_drvdata(dev, msi);
 
-	msi->irqhost = irq_domain_create_linear(of_fwnode_handle(dev->dev.of_node),
-				      NR_MSI_IRQS_MAX, &fsl_msi_host_ops, msi);
-
+	msi->irqhost = irq_domain_create_linear(dev_fwnode(&dev->dev), NR_MSI_IRQS_MAX,
+						&fsl_msi_host_ops, msi);
 	if (msi->irqhost == NULL) {
 		dev_err(&dev->dev, "No memory for MSI irqhost\n");
 		err = -ENOMEM;
-- 
2.49.0


