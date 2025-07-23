Return-Path: <linuxppc-dev+bounces-10370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F9B0EAA1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 08:28:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bn4365vK2z30P3;
	Wed, 23 Jul 2025 16:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753252130;
	cv=none; b=IOUd5ch3tvwWXu4SEanPxWdUq4zu5+jQfI/gjmtCKmENNYE0U2beXKu5cxgquuwtcD5wBwFe1xr3XkzBCBJw7ZDJkacxbMFlOmSC3VfI2WqLSldAV7/cIFmGf6Vcej9BkGarF4+nW9g5nklGzcBPJhx3l2naIvzK/BDtzFj2GGMTdspR+O1Z878qXWtRfcT80nancTAtEFM8y5Dj8MbrYk8xE+OlVhhwEXYQROH70oybRcN4zrUfi1gG/xyNPhRDBgZIJ5n+zaQuNUSpqHORA6ypN5ClhwN5F83mREz5wK/Etvbqp6dlmic47LCizdpk4THgM+u8uA7JPnDiUJjt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753252130; c=relaxed/relaxed;
	bh=dWvxA59mTIJ3lprwIO3gVmI7RvCKO3HjCXQfFPYrbSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R0oX9b6RMZ69j4QoycibtJOQ6hItAXSMD+jX1yHxjjpTIFbo+cakEAaJj29mCA9a8pgn5mecf63XwQD+4VrY0skLpVskTflehpNovgyUut0WHpT+maj7iw4dK1b2N1jzkvcCE7hbbPl0otl28Pk+LNYdb00SQziSOuwoAvti9uGoFdzrroRx7WDYkEIC7eR87flQXC0awzA0JblgFXkTqOmtksGWWrQ5YGgJU9MkUEMic3l0Nws6Rj0ZeMNuy47KSN1jdzsSK9/HaV569de/ULBOiasUOygfEfbFHPJgQaZXP3sJqmkYXlHXGWVvNNBJ8c1FPMKugxa8L0Y28Ac0Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IllGGqIK; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IllGGqIK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn43607lSz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 16:28:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1ED3EA52FAF;
	Wed, 23 Jul 2025 06:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD443C4CEE7;
	Wed, 23 Jul 2025 06:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753252126;
	bh=5dVsYbzQysdejWGSuGgk224YzC1unOLyHT1JvVpqD7Q=;
	h=From:To:Cc:Subject:Date:From;
	b=IllGGqIKV+Ku6evPtePgfH4uQ/IEF5TY0xEeNfKoxZLzSopgYGdgpoc9POizj2D1t
	 TFP4D0qPM7P0TSDTF/Ji39roPgTw2ryu+NWea7DTP0pvgK1nmouHtNRPXjbOqK0IEx
	 EeIsqNwcwd2iKUUVziKA64A4Yl21Qv5oksKzJLoRqA+AcFKCZcoq/G/Bcpm8WD2f0k
	 x6XxAYYzlwpcAzifIKSp7CReq4mhI6/xY5x5AHbrVWYK8k+Um6ASjN931FJs3mrZMv
	 X3JZbQGxTN7gJOR12rEUqAkQ7qWvF+JqvRsQcviLzcTS8/r7n8bnRfXr0D9geLJh+m
	 fTIHqXFqByElQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: maddy@linux.ibm.com
Cc: linux-kernel@vger.kernel.org,
	tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH -resend] powerpc: Use dev_fwnode()
Date: Wed, 23 Jul 2025 08:28:42 +0200
Message-ID: <20250723062842.1831271-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.50.1
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
Link: https://lore.kernel.org/all/4bc0e1ca-a523-424a-8759-59e353317fba@kernel.org/
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
2.50.1


