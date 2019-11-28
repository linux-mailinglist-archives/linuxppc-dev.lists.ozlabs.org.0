Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF810CBA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 16:25:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P1fx2Ps3zDr24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 02:25:29 +1100 (AEDT)
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
 header.b="DWaJoZNK"; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12S1Vf7zDr0B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:20 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id e10so19657148ljj.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FmgfMIRsfesacuqaAWdy4m11iy4kXtcqJGU2jE1ib94=;
 b=DWaJoZNKmVKJfjUISyttmUEuNUv/FC4di6OurSxwDjNRPf9fCoQE/A/qz2Dy66aw71
 PMyfrMM8lWNdbHve3iKOns1KyW7JmJCa85Djs2qtRkWpz9X+k2Ozb14LpmYyBYaKsLE9
 HPUmmm8ft3lQXqQmtEWC2OKlYzqlvX2OAcQXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FmgfMIRsfesacuqaAWdy4m11iy4kXtcqJGU2jE1ib94=;
 b=FXyaSORzvQerRx+8lIgjMV2xB8pH84N7XTgOMjLfifGSd+4utLd9bSM+n2SjsJreuv
 kBErWUSujjqPjhzEVXlAo/sEiX2Yv9VakYvN3bQ5XXluvMh7iLcENzuvEbwWRdQsSONX
 BTlUXrJofi9q3sj/LQdSb9z0maODZSQC11+v2JA5NnEsrERcEW1h7bUjbkaqM7Cptbf5
 bDGrD5ixPENakixC+tWE+XGA6C/fyb/sM4FlCsR/C5dgR2a2EQvefIUZKQGXNL47RVzi
 fQyn1k/KOJSwH1R2Fi078cNSNxpFl4cNlaw/2AMbOKJqMd+LhH7BwNILCN+r1l1KAL7o
 LTWA==
X-Gm-Message-State: APjAAAVwUwDHPuDHC/KvLw2r4MT4qSfurpfoWmbhZdMa82oSbbTrSgBb
 odnzVIMsiHaWOkJA7k7WkJr+4g==
X-Google-Smtp-Source: APXvYqz+PF41ZfV2qdB0Q0B87NeIFa3uor094RTZMNig8ikkYiK55r+ga2Tn+9ewAJX6oroKuIa4Rw==
X-Received: by 2002:a2e:91d5:: with SMTP id u21mr35420576ljg.32.1574953036398; 
 Thu, 28 Nov 2019 06:57:16 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:15 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 09/49] soc: fsl: qe: drop assign-only high_active in
 qe_ic_init
Date: Thu, 28 Nov 2019 15:55:14 +0100
Message-Id: <20191128145554.1297-10-linux@rasmusvillemoes.dk>
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

high_active is only assigned to but never used. Remove it.

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 8c874372416b..4b03060d8079 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -320,7 +320,7 @@ void __init qe_ic_init(struct device_node *node, unsigned int flags,
 {
 	struct qe_ic *qe_ic;
 	struct resource res;
-	u32 temp = 0, ret, high_active = 0;
+	u32 temp = 0, ret;
 
 	ret = of_address_to_resource(node, 0, &res);
 	if (ret)
@@ -366,10 +366,8 @@ void __init qe_ic_init(struct device_node *node, unsigned int flags,
 		temp |= CICR_GRTB;
 
 	/* choose destination signal for highest priority interrupt */
-	if (flags & QE_IC_HIGH_SIGNAL) {
+	if (flags & QE_IC_HIGH_SIGNAL)
 		temp |= (SIGNAL_HIGH << CICR_HPIT_SHIFT);
-		high_active = 1;
-	}
 
 	qe_ic_write(qe_ic->regs, QEIC_CICR, temp);
 
-- 
2.23.0

