Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BCF4DEA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 15:16:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478j4H6MTVzF7DD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 01:16:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="R9nDo10U"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQX4t3hzF6vP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:01:56 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id q2so6131506ljg.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fFt1ZLVVia10843rsyK8F6LgIm9rFapqPGOb1a1zZs=;
 b=R9nDo10Ud+gNvAQJx2elWJ2ezKn4CYwaj9lzmRNdXz08cRh78MbVZXBE/b/1n9830H
 GTxAUYSWZutUrUKagsGjPC8/vcjW8kU/q7knuQiwKt2M/cK+vtRamqMJatpS1/Sa3gtc
 IR5Tc/3fEOCa/HsBcxU2W+UQQPA8VPCGGrF38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fFt1ZLVVia10843rsyK8F6LgIm9rFapqPGOb1a1zZs=;
 b=Eb7taqLPlHOtdxsn7+RiMwnMwaHkTwps3YyeiT7cjdC9PaMN5Ih09cFjzgE8kYwv1o
 LdELGk2COG98R3oqX3U70PaAwiWVK2NVZdFcA5exIb5dmhhzct/s038dxACSvPow9pKt
 QU621FWYOf/F9bwLbOL1IzwnDCdvfPlNVaUHN8xTXArQEiV5uqG6ue3tY7I4mnNfY7ip
 +oYnaq2KseOcrJvkdt62pxGr2srpWVq2SFHbhx5fmew77bSHOOQn2KTg7t6ebaUeCwJK
 QmnY3AZkGLJASw/dRc1cOv9/ziApgTj326QE56Y3v9/9wLm3V1+zt7ylM1v8Drs4P2Br
 c95w==
X-Gm-Message-State: APjAAAUtUV6ICltCRaJ9JnGVT+yPHA2gzkwkUB+Y+VAbmdTEzXlR7uXQ
 iOYTQyfEBW40DGgs0DuOxxRIUQ==
X-Google-Smtp-Source: APXvYqyWkJ61oVgQyRyaemn/tR7SOVb1MBntplV1X66lNyC26HdXxpXW75kbtcBgtV0gvTyUHsBN/g==
X-Received: by 2002:a2e:9119:: with SMTP id m25mr6925324ljg.24.1573218112597; 
 Fri, 08 Nov 2019 05:01:52 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:01:52 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 19/47] soc: fsl: qe: make qe_ic_get_{low,high}_irq static
Date: Fri,  8 Nov 2019 14:00:55 +0100
Message-Id: <20191108130123.6839-20-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are only called from within qe_ic.c, so make them static.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c |  4 ++--
 include/soc/fsl/qe/qe_ic.h | 10 ----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 8f74bc6efd5c..23b457e884d8 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -283,7 +283,7 @@ static const struct irq_domain_ops qe_ic_host_ops = {
 };
 
 /* Return an interrupt vector or 0 if no interrupt is pending. */
-unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic)
+static unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic)
 {
 	int irq;
 
@@ -299,7 +299,7 @@ unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic)
 }
 
 /* Return an interrupt vector or 0 if no interrupt is pending. */
-unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
+static unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
 {
 	int irq;
 
diff --git a/include/soc/fsl/qe/qe_ic.h b/include/soc/fsl/qe/qe_ic.h
index d47eb231519e..70bb5a0f6535 100644
--- a/include/soc/fsl/qe/qe_ic.h
+++ b/include/soc/fsl/qe/qe_ic.h
@@ -53,14 +53,4 @@ enum qe_ic_grp_id {
 	QE_IC_GRP_RISCB		/* QE interrupt controller RISC group B */
 };
 
-#ifdef CONFIG_QUICC_ENGINE
-unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic);
-unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic);
-#else
-static inline unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic)
-{ return 0; }
-static inline unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
-{ return 0; }
-#endif /* CONFIG_QUICC_ENGINE */
-
 #endif /* _ASM_POWERPC_QE_IC_H */
-- 
2.23.0

