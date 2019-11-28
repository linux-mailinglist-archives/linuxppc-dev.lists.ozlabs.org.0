Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD510CB5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 16:09:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P1JF13qqzDqLJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 02:09:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="LBLkpB93"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12G05jTzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:09 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id 203so20232598lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xuBpN3zboz9lWIykWwJc5jpgUtQnVYVpKGpTSAHe1mY=;
 b=LBLkpB93pVGXgxOwmejvEDGNQ0wTX3sXVZAnOcyd8gmKFnbh6jMBjoDwjyb6YvDm4M
 XHCCmFN2eUGOVTINPAhI11+JlyAosCHBv2LK/vtsY+G2dWLFaEQSZ4Exo/mFOK5UMZLJ
 2LQB98mHBLqEsF/KxdOGUYnhPx8t8XlV/3yeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xuBpN3zboz9lWIykWwJc5jpgUtQnVYVpKGpTSAHe1mY=;
 b=Bfj2Bt+5BioQmwz27qa9fU77UQRL4hox8Zd8ik8ZxqoU1hQzF1b3CSmBHOrZB25yGC
 mcxMbr+l6WsXlNlvq6vQkLwJCDmI1s5oGALKLkTV65KLKxfuLlGTe8Uro65XpMLgDOV9
 gsP3f7fO9YuK8lak7OCm0yLeuUIEztbOJp8fuLAnab5/t3HlUi7G7wCUty4DFKC51hMC
 mf+k0jo6ju5NtKLn+gGXAxgN9Yl6y9XONJ7X84HywnyPLbonWTfzRIYw4yqTffogaGLF
 YE8G82ox+wUAJplT+d7q/2OqIEVCV/2lFnFBCM8fr/k3ZGKZz4pMyjsXhZO7J0GhF5c8
 P1Ow==
X-Gm-Message-State: APjAAAWoM8rAa2LO7yiZ/Jcl4LbeV9jkEZ/VaMcEn/OSoHxTwijyfHYB
 6cKZQ6Y2Q7G0JkuMIEhvnREnxg==
X-Google-Smtp-Source: APXvYqwT0EuyApqITA3lCeK5EuUs0sPJJq6so9cNaQVKnIZ5SJX2OXNZKYrUelwYNc4RA25bHCTp7w==
X-Received: by 2002:a19:e20b:: with SMTP id z11mr32438202lfg.171.1574953026680; 
 Thu, 28 Nov 2019 06:57:06 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:06 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 02/49] soc: fsl: qe: drop volatile qualifier of struct
 qe_ic::regs
Date: Thu, 28 Nov 2019 15:55:07 +0100
Message-Id: <20191128145554.1297-3-linux@rasmusvillemoes.dk>
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

The actual io accessors (e.g. in_be32) implicitly add a volatile
qualifier to their address argument. Remove volatile from the struct
definition and the qe_ic_(read/write) helpers, in preparation for
switching from the ppc-specific io accessors to generic ones.

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c | 4 ++--
 drivers/soc/fsl/qe/qe_ic.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 9bac546998d3..791adcd121d1 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -171,12 +171,12 @@ static struct qe_ic_info qe_ic_info[] = {
 		},
 };
 
-static inline u32 qe_ic_read(volatile __be32  __iomem * base, unsigned int reg)
+static inline u32 qe_ic_read(__be32  __iomem *base, unsigned int reg)
 {
 	return in_be32(base + (reg >> 2));
 }
 
-static inline void qe_ic_write(volatile __be32  __iomem * base, unsigned int reg,
+static inline void qe_ic_write(__be32  __iomem *base, unsigned int reg,
 			       u32 value)
 {
 	out_be32(base + (reg >> 2), value);
diff --git a/drivers/soc/fsl/qe/qe_ic.h b/drivers/soc/fsl/qe/qe_ic.h
index 08c695672a03..9420378d9b6b 100644
--- a/drivers/soc/fsl/qe/qe_ic.h
+++ b/drivers/soc/fsl/qe/qe_ic.h
@@ -72,7 +72,7 @@
 
 struct qe_ic {
 	/* Control registers offset */
-	volatile u32 __iomem *regs;
+	u32 __iomem *regs;
 
 	/* The remapper for this QEIC */
 	struct irq_domain *irqhost;
-- 
2.23.0

