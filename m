Return-Path: <linuxppc-dev+bounces-7205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD056A68815
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 10:33:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHk5k42jZz2yrv;
	Wed, 19 Mar 2025 20:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742376778;
	cv=none; b=YpvjCNd0r2X4SmAcGUEPrZqP+fnLtqaCze6lm8khfGZo+h25HfyV/r4YWOFXn0Q30QXzgudU6JMCldA3NBl4MRdOxOCpq4x/h84ufZvpbCKvPoORJ0p1kye0fbMQ92fuI/6yo/l9rYT4gBYJ9e5YL3nG/pPfqLFMwEh/GXCIV+pu1E670GAmZjPEHxkR9fqMTO6Pmlasi0O16BObqHTJLwIRjgN4xBFa+HXFZVYPjL2FqAo06HaO7sa6TA7QDYdfE5yZTFTrCrUWPHzLEsZzxsF6n9s3w/XeWD3GMohIJ4VMNDL/h+r1SqWQgqvmnPKO7KGfhkqdJf21xnNkPhLjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742376778; c=relaxed/relaxed;
	bh=3YOu8R4GJSQcHDDDoxninXhpZ4N5wub/AbD3A6rw1QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GE9j1nuBZDBdcJIzT4Hmptl5rcm+q0U9ISUya8RyzK9vuW+cYNm/3EIhxf8/OF4jY1mT69UzAGeXa61w8fveo9S6+VDmYr5ADAAZgAK5c6vHNCQdRKNLTii/IodSbAdQvpfeOn+1UXaO1xZdlO7/lf9unuodi72oTYTfLczgf2NaGmTJgmAsWLeETCGlautS20kP2JXMa2Y86dlecf9EP37vwWOxjCYM8y0+QTSxLMKqD4XH84rB0Np82p98Zf3bOFmX+PuKkTevtDIGDx0NxiPk3g3sLWFVII1VgT69jgDiS8z2P9T9FkrK4MjjZ+I5+RHuLiDXCkG6mOCVXFId1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uVbtZXqR; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uVbtZXqR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 105 seconds by postgrey-1.37 at boromir; Wed, 19 Mar 2025 20:32:57 AEDT
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHk5j562nz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 20:32:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BBA96159B;
	Wed, 19 Mar 2025 09:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73014C4CEEE;
	Wed, 19 Mar 2025 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376775;
	bh=q0CtEVEnX5ghZOe+vZqS1MAlr1PiOyJRa5w1mbdMfKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uVbtZXqRyrnesm2hO5Bim+Wzu4kAxHm4MAd3fJPLh2Jco3wxi+tYeaXFCB0pbVk1I
	 X6D4u5K+Edq0JtVgFGpEiWS4/d6p6uzaApQCbJ+eYCJWhE0CqEL+UJ0ZSG+UYoJIkF
	 nO9i5qId/q3rjokbArxSjwfLRrPdI8+2hTldnVvLJMOY2soWXTapBq7otWaEszABu4
	 Y3IUCaobJd7Ub660pj91wH5TjOYwErfFVfh/46DrEL2gryU4CiemD9OQvFwTTd++SN
	 PL/M1/kzEMaSxfOMW/YHOIPa37S1be9CvlcOWGTb2ww25uU1iyBLH1yOGEhaj/7xzT
	 clbC83Esbc8qQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Anatolij Gustschin <agust@denx.de>,
	Scott Wood <oss@buserror.net>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 41/57] irqdomain: ppc: Switch to irq_find_mapping()
Date: Wed, 19 Mar 2025 10:29:34 +0100
Message-ID: <20250319092951.37667-42-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

irq_linear_revmap() is deprecated, so remove all its uses and supersede
them by an identical call to irq_find_mapping().

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: Scott Wood <oss@buserror.net>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/44x/uic.c                 | 2 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c        | 2 +-
 arch/powerpc/platforms/52xx/mpc52xx_pic.c        | 2 +-
 arch/powerpc/platforms/85xx/socrates_fpga_pic.c  | 2 +-
 arch/powerpc/platforms/8xx/cpm1-ic.c             | 2 +-
 arch/powerpc/platforms/8xx/pic.c                 | 2 +-
 arch/powerpc/platforms/embedded6xx/flipper-pic.c | 2 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c    | 2 +-
 arch/powerpc/platforms/powermac/pic.c            | 2 +-
 arch/powerpc/sysdev/cpm2_pic.c                   | 2 +-
 arch/powerpc/sysdev/ehv_pic.c                    | 2 +-
 arch/powerpc/sysdev/ge/ge_pic.c                  | 2 +-
 arch/powerpc/sysdev/ipic.c                       | 2 +-
 arch/powerpc/sysdev/mpic.c                       | 4 ++--
 14 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/platforms/44x/uic.c b/arch/powerpc/platforms/44x/uic.c
index 481ec25ce78f..85daf841fd3f 100644
--- a/arch/powerpc/platforms/44x/uic.c
+++ b/arch/powerpc/platforms/44x/uic.c
@@ -328,5 +328,5 @@ unsigned int uic_get_irq(void)
 	msr = mfdcr(primary_uic->dcrbase + UIC_MSR);
 	src = 32 - ffs(msr);
 
-	return irq_linear_revmap(primary_uic->irqhost, src);
+	return irq_find_mapping(primary_uic->irqhost, src);
 }
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index f042b21b2b73..3dbe5a5e5d1f 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -369,7 +369,7 @@ struct mpc52xx_gpt_priv *mpc52xx_gpt_from_irq(int irq)
 	mutex_lock(&mpc52xx_gpt_list_mutex);
 	list_for_each(pos, &mpc52xx_gpt_list) {
 		gpt = container_of(pos, struct mpc52xx_gpt_priv, list);
-		if (gpt->irqhost && irq == irq_linear_revmap(gpt->irqhost, 0)) {
+		if (gpt->irqhost && irq == irq_find_mapping(gpt->irqhost, 0)) {
 			mutex_unlock(&mpc52xx_gpt_list_mutex);
 			return gpt;
 		}
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pic.c b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
index 7ec56d3788a9..eb6a4e745c08 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pic.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
@@ -515,5 +515,5 @@ unsigned int mpc52xx_get_irq(void)
 		return 0;
 	}
 
-	return irq_linear_revmap(mpc52xx_irqhost, irq);
+	return irq_find_mapping(mpc52xx_irqhost, irq);
 }
diff --git a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
index b4f6360830b1..4b69fb321a68 100644
--- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
+++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
@@ -83,7 +83,7 @@ static inline unsigned int socrates_fpga_pic_get_irq(unsigned int irq)
 		if (cause >> (i + 16))
 			break;
 	}
-	return irq_linear_revmap(socrates_fpga_pic_irq_host,
+	return irq_find_mapping(socrates_fpga_pic_irq_host,
 			(irq_hw_number_t)i);
 }
 
diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8xx/cpm1-ic.c
index 1549f6cd29f4..a49d4a9ab3bc 100644
--- a/arch/powerpc/platforms/8xx/cpm1-ic.c
+++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
@@ -59,7 +59,7 @@ static int cpm_get_irq(struct irq_desc *desc)
 	cpm_vec = in_be16(&data->reg->cpic_civr);
 	cpm_vec >>= 11;
 
-	return irq_linear_revmap(data->host, cpm_vec);
+	return irq_find_mapping(data->host, cpm_vec);
 }
 
 static void cpm_cascade(struct irq_desc *desc)
diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
index 7639f28172be..933d6ab7f512 100644
--- a/arch/powerpc/platforms/8xx/pic.c
+++ b/arch/powerpc/platforms/8xx/pic.c
@@ -80,7 +80,7 @@ unsigned int mpc8xx_get_irq(void)
 	if (irq == PIC_VEC_SPURRIOUS)
 		return 0;
 
-        return irq_linear_revmap(mpc8xx_pic_host, irq);
+        return irq_find_mapping(mpc8xx_pic_host, irq);
 
 }
 
diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
index a41649bf0cb8..91a8f0a7086e 100644
--- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
@@ -173,7 +173,7 @@ unsigned int flipper_pic_get_irq(void)
 		return 0;	/* no more IRQs pending */
 
 	irq = __ffs(irq_status);
-	return irq_linear_revmap(flipper_irq_host, irq);
+	return irq_find_mapping(flipper_irq_host, irq);
 }
 
 /*
diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index 9abb3da36ba5..b57e87b0b3ce 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -190,7 +190,7 @@ static struct irq_domain *__init hlwd_pic_init(struct device_node *np)
 unsigned int hlwd_pic_get_irq(void)
 {
 	unsigned int hwirq = __hlwd_pic_get_irq(hlwd_irq_host);
-	return hwirq ? irq_linear_revmap(hlwd_irq_host, hwirq) : 0;
+	return hwirq ? irq_find_mapping(hlwd_irq_host, hwirq) : 0;
 }
 
 /*
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 2eddc8bff7ab..c37783a03d25 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -250,7 +250,7 @@ static unsigned int pmac_pic_get_irq(void)
 	raw_spin_unlock_irqrestore(&pmac_pic_lock, flags);
 	if (unlikely(irq < 0))
 		return 0;
-	return irq_linear_revmap(pmac_pic_host, irq);
+	return irq_find_mapping(pmac_pic_host, irq);
 }
 
 static int pmac_pic_host_match(struct irq_domain *h, struct device_node *node,
diff --git a/arch/powerpc/sysdev/cpm2_pic.c b/arch/powerpc/sysdev/cpm2_pic.c
index c63d72f17a3e..4a59ed1d62ce 100644
--- a/arch/powerpc/sysdev/cpm2_pic.c
+++ b/arch/powerpc/sysdev/cpm2_pic.c
@@ -207,7 +207,7 @@ unsigned int cpm2_get_irq(void)
 
 	if (irq == 0)
 		return(-1);
-	return irq_linear_revmap(cpm2_pic_host, irq);
+	return irq_find_mapping(cpm2_pic_host, irq);
 }
 
 static int cpm2_pic_host_map(struct irq_domain *h, unsigned int virq,
diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
index 4ee8d36ca647..b6f9774038e1 100644
--- a/arch/powerpc/sysdev/ehv_pic.c
+++ b/arch/powerpc/sysdev/ehv_pic.c
@@ -175,7 +175,7 @@ unsigned int ehv_pic_get_irq(void)
 	 * this will also setup revmap[] in the slow path for the first
 	 * time, next calls will always use fast path by indexing revmap
 	 */
-	return irq_linear_revmap(global_ehv_pic->irqhost, irq);
+	return irq_find_mapping(global_ehv_pic->irqhost, irq);
 }
 
 static int ehv_pic_host_match(struct irq_domain *h, struct device_node *node,
diff --git a/arch/powerpc/sysdev/ge/ge_pic.c b/arch/powerpc/sysdev/ge/ge_pic.c
index 5b1f8dc3c960..0bc3f0b36528 100644
--- a/arch/powerpc/sysdev/ge/ge_pic.c
+++ b/arch/powerpc/sysdev/ge/ge_pic.c
@@ -245,7 +245,7 @@ unsigned int gef_pic_get_irq(void)
 			if (active & (0x1 << hwirq))
 				break;
 		}
-		virq = irq_linear_revmap(gef_pic_irq_host,
+		virq = irq_find_mapping(gef_pic_irq_host,
 			(irq_hw_number_t)hwirq);
 	}
 
diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index f7b415ebb71c..70be2105865d 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -801,7 +801,7 @@ unsigned int ipic_get_irq(void)
 	if (irq == 0)    /* 0 --> no irq is pending */
 		return 0;
 
-	return irq_linear_revmap(primary_ipic->irqhost, irq);
+	return irq_find_mapping(primary_ipic->irqhost, irq);
 }
 
 #ifdef CONFIG_SUSPEND
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 3de090159a1b..787a88efdb35 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1785,7 +1785,7 @@ static unsigned int _mpic_get_one_irq(struct mpic *mpic, int reg)
 		return 0;
 	}
 
-	return irq_linear_revmap(mpic->irqhost, src);
+	return irq_find_mapping(mpic->irqhost, src);
 }
 
 unsigned int mpic_get_one_irq(struct mpic *mpic)
@@ -1823,7 +1823,7 @@ unsigned int mpic_get_coreint_irq(void)
 		return 0;
 	}
 
-	return irq_linear_revmap(mpic->irqhost, src);
+	return irq_find_mapping(mpic->irqhost, src);
 #else
 	return 0;
 #endif
-- 
2.49.0


