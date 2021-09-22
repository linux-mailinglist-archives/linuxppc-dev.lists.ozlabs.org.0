Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB3414C92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:58:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF1dk119wz3cQs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:58:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SP1BYT74;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SP1BYT74; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF1YT4htfz304r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:55:09 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id e7so2960607pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbAiIuBHE/k+E2QVFWHfirbvOfaOdd0asOFEYqMagBk=;
 b=SP1BYT74K/ucempQcmDvG9RA6nFGbMyKVKhK9dBNdaNFEyDQTgmq1JYTRXDVehwMZF
 qfgIaI8x3oA6zi2F1muFNYUp3bwxQE0MHc+XBoKDozzqI3BG3+YExLlExpVgXi6xoosl
 toLrsoO10O4yh35Oysy9cZWjJLz6evqaIJ87Z1zW9exzh06w5Hl+wOqnz/RsmNL3CTa/
 x/f9lGbIv3fpS36YSNev8r5G4+EvNrpVW4FVXVngLup0dA+9Y/b96fnzpNLcuTIT4FVB
 O1xcmSBhs8tfTSGgmgEsC8kO/6OmYEFqmzxlGLPtycms7qAlZ0UH9R7q4itHdy9xeF+b
 ZRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbAiIuBHE/k+E2QVFWHfirbvOfaOdd0asOFEYqMagBk=;
 b=fkx/ZssQZsNCSNS981XIga7FThkq/k/mH64rxa8pAWjFnjx4MvR/PmksnotelJluWq
 N+kuXmCYOlftL1Rwvv5pmO84sIDolQSaw58+UKUGK2z9xOiO4BAszGdXYE/HoDp0WAiQ
 d1wrK37WwPQFlhyV2HkyLp/CPYQA3GE6ArXaPGlHU1fJU0ncwJR/sVWB+ZohqgSOsQlp
 eSf9pgz+H2EU5kP/3DWql9n23mWkmlLM2pcTr+BKBn2HySkvCzzz7bV0QXoSfFt4Tsqm
 FKd6u/6G8bbJMzLR1028XBYvoP+cYC+LgRPOIn+acLdwyNjWF9DeHPlgrHNHHlCOufOR
 Umjw==
X-Gm-Message-State: AOAM530rLe9NQrcGZRTgn4WOKrIjEcJxpLdFNgpCS5oICP/CGNJ2SfEY
 K4+iaOOVaZ7Jb8cdAY8FKPLHQ7Vp21g=
X-Google-Smtp-Source: ABdhPJyVHyRYl0aDeEZXJE0xLmxHgkTOxRjS856YxxkX6Tnic1wzOuTKYUV1fLTjPozblE1ZvevoAg==
X-Received: by 2002:a62:1b49:0:b0:446:d705:7175 with SMTP id
 b70-20020a621b49000000b00446d7057175mr333482pfb.74.1632322507502; 
 Wed, 22 Sep 2021 07:55:07 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id o14sm2856211pfh.145.2021.09.22.07.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:55:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/6] powerpc/64/interrupt: reduce expensive debug tests
Date: Thu, 23 Sep 2021 00:54:51 +1000
Message-Id: <20210922145452.352571-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210922145452.352571-1-npiggin@gmail.com>
References: <20210922145452.352571-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the assertions requiring restart table searches under
CONFIG_PPC_IRQ_SOFT_MASK_DEBUG.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index e178d143671a..0e84e99af37b 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -97,6 +97,11 @@ static inline void srr_regs_clobbered(void)
 	local_paca->hsrr_valid = 0;
 }
 #else
+static inline unsigned long search_kernel_restart_table(unsigned long addr)
+{
+	return 0;
+}
+
 static inline bool is_implicit_soft_masked(struct pt_regs *regs)
 {
 	return false;
@@ -190,13 +195,14 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 */
 		if (TRAP(regs) != INTERRUPT_PROGRAM) {
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
-			BUG_ON(is_implicit_soft_masked(regs));
+			if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+				BUG_ON(is_implicit_soft_masked(regs));
 		}
-#ifdef CONFIG_PPC_BOOK3S
+
 		/* Move this under a debugging check */
-		if (arch_irq_disabled_regs(regs))
+		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) &&
+				arch_irq_disabled_regs(regs))
 			BUG_ON(search_kernel_restart_table(regs->nip));
-#endif
 	}
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));
-- 
2.23.0

