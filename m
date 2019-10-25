Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE58E4C2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 15:30:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4704jy3CPnzDqnp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:30:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="bUV9btda"; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703dC5Vx0zDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:19 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id s4so1663090ljj.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPHV3mej2fB3lfgpw6935p5PEecuoQPDNdhF76v2gl8=;
 b=bUV9btdaAbzUUTulPviXAiFJt/y5HiDckg3QQcNHdMMTPKSZXLyWUK3836LOYGb7Ea
 6GmnHFLcUm0wi8jumB9dZrLNJFjZxmWysv2eijZsaYD6IICV3GFXl+tWby9zUqTAO80f
 WoXVMlRuYnw6c0MygecBezz9FUnOgzFwnDlLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPHV3mej2fB3lfgpw6935p5PEecuoQPDNdhF76v2gl8=;
 b=UHElRlseYYIHTJwnsD+F0t4h8Z1UCGHW2zTC/KMOzRqg5VBlAEDxrEGVyDiN9Qogjc
 JFZBBCEKYzJfYjnPqzEwJNcPGi8P6oDuNe9+iTGVs7wmFfgQ50MakzdZZYI7rd1DuPGZ
 ukYugSSXXAdh5cljQ5s5a/Yf+5OjvmbWfYBOMwCWsrEDaTLGQqbKmAhXaOeoya2NUa9X
 JBF6fPDltMli0sXIlKAR7PJprdsFYEN+jbb/BAloGoTM9fuDRtD40qU2j17Z72kZfXze
 bJ6IzMc9hajmEEHt34z7lDOz3plwlFkxl6aNW8R9L7vZWhU+RweOOGCcbkCgwqE3JsDk
 qLQA==
X-Gm-Message-State: APjAAAUTZo3SfrrZPB0OoRp1h8OnUAUBZiVVq9XonEWAQb9ZG/XIXzLT
 hhBAUF72Fz/QBvE21ntQqC04VQ==
X-Google-Smtp-Source: APXvYqw/oNpSoGf0HychWr3zkFhvDIDZp39aOxLLA4Y37BiJRnhMt3VbkvqipDKWR/80GLP4Dk3rpA==
X-Received: by 2002:a2e:9058:: with SMTP id n24mr2360035ljg.114.1572007276785; 
 Fri, 25 Oct 2019 05:41:16 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:16 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 11/23] soc: fsl: qe: rename qe_ic_cascade_low_mpic ->
 qe_ic_cascade_low
Date: Fri, 25 Oct 2019 14:40:46 +0200
Message-Id: <20191025124058.22580-12-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025124058.22580-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The qe_ic_cascade_{low,high}_mpic functions are now used as handlers
both when the interrupt parent is mpic as well as ipic, so remove the
_mpic suffix.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/powerpc/platforms/83xx/misc.c            | 2 +-
 arch/powerpc/platforms/85xx/corenet_generic.c | 4 ++--
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     | 4 ++--
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     | 4 ++--
 arch/powerpc/platforms/85xx/twr_p102x.c       | 4 ++--
 drivers/soc/fsl/qe/qe_ic.c                    | 4 ++--
 include/soc/fsl/qe/qe_ic.h                    | 4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 779791c0570f..835d082218ae 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -100,7 +100,7 @@ void __init mpc83xx_qe_init_IRQ(void)
 		if (!np)
 			return;
 	}
-	qe_ic_init(np, 0, qe_ic_cascade_low_mpic, qe_ic_cascade_high_mpic);
+	qe_ic_init(np, 0, qe_ic_cascade_low, qe_ic_cascade_high);
 	of_node_put(np);
 }
 
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 7ee2c6628f64..2ed9e84ca03a 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -50,8 +50,8 @@ void __init corenet_gen_pic_init(void)
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
 	if (np) {
-		qe_ic_init(np, 0, qe_ic_cascade_low_mpic,
-				qe_ic_cascade_high_mpic);
+		qe_ic_init(np, 0, qe_ic_cascade_low,
+				qe_ic_cascade_high);
 		of_node_put(np);
 	}
 }
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 5ca254256c47..24211a1787b2 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -288,8 +288,8 @@ static void __init mpc85xx_mds_qeic_init(void)
 	}
 
 	if (machine_is(p1021_mds))
-		qe_ic_init(np, 0, qe_ic_cascade_low_mpic,
-				qe_ic_cascade_high_mpic);
+		qe_ic_init(np, 0, qe_ic_cascade_low,
+				qe_ic_cascade_high);
 	else
 		qe_ic_init(np, 0, qe_ic_cascade_muxed_mpic, NULL);
 	of_node_put(np);
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index d3c540ee558f..093867879081 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -66,8 +66,8 @@ void __init mpc85xx_rdb_pic_init(void)
 #ifdef CONFIG_QUICC_ENGINE
 	np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
 	if (np) {
-		qe_ic_init(np, 0, qe_ic_cascade_low_mpic,
-				qe_ic_cascade_high_mpic);
+		qe_ic_init(np, 0, qe_ic_cascade_low,
+				qe_ic_cascade_high);
 		of_node_put(np);
 
 	} else
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index 720b0c0f03ba..2e0fb23854c0 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -45,8 +45,8 @@ static void __init twr_p1025_pic_init(void)
 #ifdef CONFIG_QUICC_ENGINE
 	np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
 	if (np) {
-		qe_ic_init(np, 0, qe_ic_cascade_low_mpic,
-				qe_ic_cascade_high_mpic);
+		qe_ic_init(np, 0, qe_ic_cascade_low,
+				qe_ic_cascade_high);
 		of_node_put(np);
 	} else
 		pr_err("Could not find qe-ic node\n");
diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 0ff802816c0c..f3659c312e13 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -402,7 +402,7 @@ unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
 	return irq_linear_revmap(qe_ic->irqhost, irq);
 }
 
-void qe_ic_cascade_low_mpic(struct irq_desc *desc)
+void qe_ic_cascade_low(struct irq_desc *desc)
 {
 	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
 	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
@@ -415,7 +415,7 @@ void qe_ic_cascade_low_mpic(struct irq_desc *desc)
 		chip->irq_eoi(&desc->irq_data);
 }
 
-void qe_ic_cascade_high_mpic(struct irq_desc *desc)
+void qe_ic_cascade_high(struct irq_desc *desc)
 {
 	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
 	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
diff --git a/include/soc/fsl/qe/qe_ic.h b/include/soc/fsl/qe/qe_ic.h
index fb10a7606acc..3c8220cedd9a 100644
--- a/include/soc/fsl/qe/qe_ic.h
+++ b/include/soc/fsl/qe/qe_ic.h
@@ -74,8 +74,8 @@ void qe_ic_set_highest_priority(unsigned int virq, int high);
 int qe_ic_set_priority(unsigned int virq, unsigned int priority);
 int qe_ic_set_high_priority(unsigned int virq, unsigned int priority, int high);
 
-void qe_ic_cascade_low_mpic(struct irq_desc *desc);
-void qe_ic_cascade_high_mpic(struct irq_desc *desc);
+void qe_ic_cascade_low(struct irq_desc *desc);
+void qe_ic_cascade_high(struct irq_desc *desc);
 void qe_ic_cascade_muxed_mpic(struct irq_desc *desc);
 
 #endif /* _ASM_POWERPC_QE_IC_H */
-- 
2.23.0

