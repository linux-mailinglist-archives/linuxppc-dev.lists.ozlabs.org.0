Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F224710CC1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 16:52:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P2GR6P1pzDqwl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 02:52:47 +1100 (AEDT)
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
 header.b="i39lh9aW"; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12d3BxczDqsw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:29 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id j6so19825052lja.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fm8vGKJ4TPWor/SrNM6rE461Gf1D2pmUecTv9capx2A=;
 b=i39lh9aWGpqjz9XI/OFfEnvTGPZ/LiEky1vlTemc4GbVU8oOBhimEDgTQM9P09m6O6
 ObJeoq+Tbxu8vuPW/WPjlrom7jcqajGns3DbLkvaoMUMSW2SLdVnLnossT4Iz0XqNKud
 NCte6uFdJbKUOLro5cdE0VeP2XQzQJmLJ3NL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fm8vGKJ4TPWor/SrNM6rE461Gf1D2pmUecTv9capx2A=;
 b=G6yElhgiwsv9ExJB2mUOkBFiV39KINmSlWIfYCII0d0Ll1qfSbwznnioud3OanFY7F
 oDXs/a2OvaE2G+0r23HfrD5B2qYveMpDc+RF5I1p8ZDFYZQT6JgPHiv5qg9w7FFSydbd
 E2CGNxyEQzGJ0MrzqepXhTG+iNsqInlbdWvLOnjs0F3yiZzK4JjhYxM67XISUVQZNtEq
 /tkqCygEZIJiQG9F7HJiizhBKeMHrwMgv/CSdywA1XBzg8rxVdexthssm1Ih7ruQSUJc
 pMu1TWfKeDe7blSRw0hEW1uSQFILpgR6bpQhCSoApnXYARAhfoGo86/ia1Xpvtfjytwn
 uslw==
X-Gm-Message-State: APjAAAVmF+wUG3Gs0RWzxyHvFCf1ifuueWUEZvQ4kSS/1EJT3B5GJmLT
 d3YdqaCg6CENxeurhxCuSE1mwQ==
X-Google-Smtp-Source: APXvYqzOH4CCR5V7oe5QpALAtS3/oGlBdApJLkD4j0pv6h8wj8vcXCUvjS7Un4muT3AhfCe2YXCDXA==
X-Received: by 2002:a2e:6e07:: with SMTP id j7mr3589919ljc.18.1574953046004;
 Thu, 28 Nov 2019 06:57:26 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:25 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 16/49] soc: fsl: qe: rename qe_ic_cascade_low_mpic ->
 qe_ic_cascade_low
Date: Thu, 28 Nov 2019 15:55:21 +0100
Message-Id: <20191128145554.1297-17-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The qe_ic_cascade_{low,high}_mpic functions are now used as handlers
both when the interrupt parent is mpic as well as ipic, so remove the
_mpic suffix.

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 94ccbeeb1ad1..de2ca2e3a648 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -314,7 +314,7 @@ unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
 	return irq_linear_revmap(qe_ic->irqhost, irq);
 }
 
-static void qe_ic_cascade_low_mpic(struct irq_desc *desc)
+static void qe_ic_cascade_low(struct irq_desc *desc)
 {
 	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
 	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
@@ -327,7 +327,7 @@ static void qe_ic_cascade_low_mpic(struct irq_desc *desc)
 		chip->irq_eoi(&desc->irq_data);
 }
 
-static void qe_ic_cascade_high_mpic(struct irq_desc *desc)
+static void qe_ic_cascade_high(struct irq_desc *desc)
 {
 	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
 	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
@@ -392,8 +392,8 @@ static void __init qe_ic_init(struct device_node *node, unsigned int flags)
 		return;
 	}
 	if (qe_ic->virq_high != qe_ic->virq_low) {
-		low_handler = qe_ic_cascade_low_mpic;
-		high_handler = qe_ic_cascade_high_mpic;
+		low_handler = qe_ic_cascade_low;
+		high_handler = qe_ic_cascade_high;
 	} else {
 		low_handler = qe_ic_cascade_muxed_mpic;
 		high_handler = NULL;
-- 
2.23.0

