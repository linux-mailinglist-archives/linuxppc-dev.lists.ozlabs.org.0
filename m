Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECAEC409
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 14:50:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Nr05VdjzF6r9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 00:50:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="emxjxGI5"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474MKX0VjtzF4xT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:42:40 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id 195so7123274lfj.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z2c319/rjPUXp8iRV62XAcjKgiOjRbx515GvierWVkM=;
 b=emxjxGI5mzMUlIacGEHrL8HHfoh+f+nWa9gO07GOW4QyExZHgcvn5bvZdXqLZSNRzH
 T6KiKkaCIX+2BDTbqSKNnteERU86ltuF8fgmVWLPrjkyvEDzacT6ouPkXoVf+JByyKB+
 avErQjWjwN1a4qGfUl42EYAJpsK/C9Gfr08Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z2c319/rjPUXp8iRV62XAcjKgiOjRbx515GvierWVkM=;
 b=dwzaikDg1F83aS8tWFCnwzGs6fbkcBjfKOp0c6nBG/FaI/gm/6OzyO+w7sqsqiSOHg
 P8dYk92KcsmsA+lTdJiGomL+QhoJvran8JyPPx51RjXBVI1a+ZbEMX2HkqVp8FYbfgOt
 jaFDZoW1qYDfWPtGMR68ZOV/K00LjtDS1aUO4Ad752L9yWbgYiS+V3gEgSP25llvM5dp
 wsVfWI8z7E29Tp12K8rh0RiL/komPEZBdOwwjoOBdDh5rsvi6rhg6Ytg6hPSCDd6WgJr
 L7Q42aHVGfkyYRp0/mALZ7ujBnZOMiDkjlaZQxVlF6SfKnlG+fKXv1znJTUCwmdl3i75
 8Tdg==
X-Gm-Message-State: APjAAAVS7lnxCkkDCqgmnOM4iEzAyWvOHq8YGiGoRP4nyLLMBRpQLONu
 r3Mv9Zn2mbNyziZW6pS17rG7Fw==
X-Google-Smtp-Source: APXvYqyUED22wOC6qXGZRgb0XFAyo80agg4tRT/Xg6HOogBbRuVaLKjlgEcwhH7XuCsmAGV+O0vQqQ==
X-Received: by 2002:a19:4c02:: with SMTP id z2mr6812332lfa.45.1572612157070;
 Fri, 01 Nov 2019 05:42:37 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:36 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 17/36] soc: fsl: qe: remove unused qe_ic_set_* functions
Date: Fri,  1 Nov 2019 13:41:51 +0100
Message-Id: <20191101124210.14510-18-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101124210.14510-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
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

There are no current callers of these functions, and they use the
ppc-specific virq_to_hw(). So removing them gets us one step closer to
building QE support for ARM.

If the functionality is ever actually needed, the code can be dug out
of git and then adapted to work on all architectures, but for future
reference please note that I believe qe_ic_set_priority is buggy: The
"priority < 4" should be "priority <= 4", and in the else branch 24
should be replaced by 28, at least if I'm reading the data sheet right.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c | 94 --------------------------------------
 include/soc/fsl/qe/qe_ic.h |  4 --
 2 files changed, 98 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index de2ca2e3a648..4839dcd5c5d3 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -445,97 +445,3 @@ static int __init qe_ic_of_init(void)
 	return 0;
 }
 subsys_initcall(qe_ic_of_init);
-
-void qe_ic_set_highest_priority(unsigned int virq, int high)
-{
-	struct qe_ic *qe_ic = qe_ic_from_irq(virq);
-	unsigned int src = virq_to_hw(virq);
-	u32 temp = 0;
-
-	temp = qe_ic_read(qe_ic->regs, QEIC_CICR);
-
-	temp &= ~CICR_HP_MASK;
-	temp |= src << CICR_HP_SHIFT;
-
-	temp &= ~CICR_HPIT_MASK;
-	temp |= (high ? SIGNAL_HIGH : SIGNAL_LOW) << CICR_HPIT_SHIFT;
-
-	qe_ic_write(qe_ic->regs, QEIC_CICR, temp);
-}
-
-/* Set Priority level within its group, from 1 to 8 */
-int qe_ic_set_priority(unsigned int virq, unsigned int priority)
-{
-	struct qe_ic *qe_ic = qe_ic_from_irq(virq);
-	unsigned int src = virq_to_hw(virq);
-	u32 temp;
-
-	if (priority > 8 || priority == 0)
-		return -EINVAL;
-	if (WARN_ONCE(src >= ARRAY_SIZE(qe_ic_info),
-		      "%s: Invalid hw irq number for QEIC\n", __func__))
-		return -EINVAL;
-	if (qe_ic_info[src].pri_reg == 0)
-		return -EINVAL;
-
-	temp = qe_ic_read(qe_ic->regs, qe_ic_info[src].pri_reg);
-
-	if (priority < 4) {
-		temp &= ~(0x7 << (32 - priority * 3));
-		temp |= qe_ic_info[src].pri_code << (32 - priority * 3);
-	} else {
-		temp &= ~(0x7 << (24 - priority * 3));
-		temp |= qe_ic_info[src].pri_code << (24 - priority * 3);
-	}
-
-	qe_ic_write(qe_ic->regs, qe_ic_info[src].pri_reg, temp);
-
-	return 0;
-}
-
-/* Set a QE priority to use high irq, only priority 1~2 can use high irq */
-int qe_ic_set_high_priority(unsigned int virq, unsigned int priority, int high)
-{
-	struct qe_ic *qe_ic = qe_ic_from_irq(virq);
-	unsigned int src = virq_to_hw(virq);
-	u32 temp, control_reg = QEIC_CICNR, shift = 0;
-
-	if (priority > 2 || priority == 0)
-		return -EINVAL;
-	if (WARN_ONCE(src >= ARRAY_SIZE(qe_ic_info),
-		      "%s: Invalid hw irq number for QEIC\n", __func__))
-		return -EINVAL;
-
-	switch (qe_ic_info[src].pri_reg) {
-	case QEIC_CIPZCC:
-		shift = CICNR_ZCC1T_SHIFT;
-		break;
-	case QEIC_CIPWCC:
-		shift = CICNR_WCC1T_SHIFT;
-		break;
-	case QEIC_CIPYCC:
-		shift = CICNR_YCC1T_SHIFT;
-		break;
-	case QEIC_CIPXCC:
-		shift = CICNR_XCC1T_SHIFT;
-		break;
-	case QEIC_CIPRTA:
-		shift = CRICR_RTA1T_SHIFT;
-		control_reg = QEIC_CRICR;
-		break;
-	case QEIC_CIPRTB:
-		shift = CRICR_RTB1T_SHIFT;
-		control_reg = QEIC_CRICR;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	shift += (2 - priority) * 2;
-	temp = qe_ic_read(qe_ic->regs, control_reg);
-	temp &= ~(SIGNAL_MASK << shift);
-	temp |= (high ? SIGNAL_HIGH : SIGNAL_LOW) << shift;
-	qe_ic_write(qe_ic->regs, control_reg, temp);
-
-	return 0;
-}
diff --git a/include/soc/fsl/qe/qe_ic.h b/include/soc/fsl/qe/qe_ic.h
index 43e4ce95c6a0..d47eb231519e 100644
--- a/include/soc/fsl/qe/qe_ic.h
+++ b/include/soc/fsl/qe/qe_ic.h
@@ -63,8 +63,4 @@ static inline unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
 { return 0; }
 #endif /* CONFIG_QUICC_ENGINE */
 
-void qe_ic_set_highest_priority(unsigned int virq, int high);
-int qe_ic_set_priority(unsigned int virq, unsigned int priority);
-int qe_ic_set_high_priority(unsigned int virq, unsigned int priority, int high);
-
 #endif /* _ASM_POWERPC_QE_IC_H */
-- 
2.23.0

