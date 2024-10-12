Return-Path: <linuxppc-dev+bounces-2137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E537799B08E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 06:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQVCB5vYNz3brZ;
	Sat, 12 Oct 2024 15:00:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.132.62.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728705638;
	cv=none; b=Wpj8utVFq65CeHwypYku2Ur3MKn7la1cRjHqXB0sjgfSZ176imgci7AByfS1eEP14ALIt8AClDVzqy42hZTy5TwxZpc/7TBEqh7xqjQjFKYIE2Jrfk37t5KBdyKjy0pqDrfj9woe3GyAkOEqgOu08ViVlyeoJPuB8+9FX4+l2Bdt9BjlOaFXbmZfp9dscHil+fTQyhxE8Z1Ri+gly5oIAKsUuHu9rSrv46L6Lx37o9ezpVEhavCLStN/U8V7GLCV6YZSrGOhGsN+yRETFNzP31vYAWBqzatf3V9VhXBQIMwbh4ylVF0fYB55W9LxBEIuz6UcSnIxGyJu3Yb3CLc8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728705638; c=relaxed/relaxed;
	bh=+Zqma3iqIdRjkeMGOL9TOEljkUvhtqoTvXcsm7XW+ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIsc0UgkUg/pAVETktmjF1AJ5+/mpuGCmrO7npdKwy0nhvfcGwXxXxJUS55CdTO7KuqBIMz9/RZJXJnt4D8kPv4msxdt61d84q7kbVfveqJweg2DLlDa+fBhgPWDlswQD7HEJ8b4isidJv/poB80aXR8K7pgGxQEbQORv2RfJg26L2ioVH03xDQYeWKgfO8FzNIePomTOy12r7hONeK+OiVE/3TOphQQmUvfdseyGsgL3zp2+lcyK9/sgk5sHPf/i1pjxBq1Eo4aTlOYQMIlmSMRhHBkmph07g9wowaULszeFs77leIO4IS413LSAM2EmMSl917iOTf9HSn1UgOR7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=114.132.62.65; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.62.65; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQVC90WzPz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 15:00:36 +1100 (AEDT)
X-QQ-mid: bizesmtpsz3t1728705582tk7m42q
X-QQ-Originating-IP: nay6J2rnSh8/fr9ad6cH/OzGHRpt+W0/xSrLa82pQw8=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 12 Oct 2024 11:59:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6882828675209662917
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH 4/7] powerpc/debug: hook to user return notifier infrastructure
Date: Sat, 12 Oct 2024 11:56:18 +0800
Message-ID: <557E9D5F2DDB7601+20241012035621.1245-6-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20241012035621.1245-3-luming.yu@shingroup.cn>
References: <20241012035621.1245-3-luming.yu@shingroup.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NMGzQWUSIfvTBNmgq298LwTJNBU4hR70Xkg0x2ylvLYoEQCMsw9ueXM7
	ym7lVkc/kI0G+6tgujj7ivyQcdnrjO0G9U99b/LlrVyHhaKJUIZmxvdDEzGVzoaYInkycc0
	LoSpyG9If6hcN/4ye/xnxfhSzbEF30B3nVsf8x4rtB/4RGHm+0j7KqFfs5JINp4gR6YFoBG
	g+wDTN6uCMXYPXlo4IPVcPegwrbYZoZOFGqxZZwNUoPAJtrXg5XmM1Q1jZFyZd/7OjZfQqy
	w48orhfcMNYAq4Nnsv5aQM/bzNaOiFshFaS9mrwb1oO8+VtaX7oYqN0XTMuj03uK7dpcXwp
	SK3dXFsbSc1IX1V+ae0Txl+ZIhdnGl/AcROxu+ANP59x5aGPGKm3smdG9D6H/P8b86FRZUM
	av4fftUN5paBkc7V4ISvS7BoHJFDw4eNfrutPP48MCC0BmaTEdlNGCZkR1wVlMPzfhPNJd3
	o0Efnm1dub4UUu5GddbNUpkXBe7PFRT+KeK3VTpncIaRu3E8AZ7qi+JN53JhLAB/sAZaBrY
	j5HonQowZcE0utOPxNJIcFnQAYuQ3+SoBkvJBGPFuexmm0sksfdnnjyWyEn15CRihBUqDKb
	+f3vU1dKeMP6FpfiymECdcybULv2Qwb0g7mq9i78l59+B8LO3kGeuDEGD4LOX7ZxoJ3E9Dh
	vtsGglwh5Z0g/ESZHByKBetXsWdW70eplaaHMPsPtH1A5fX2s3c0zfFdamLPDhJ+qsxfkMT
	MTq43jzw6NHBMcxHumCYIBWuyOE1KXUkSMjVEHnMmsDo33Wr6foUIiVMX0NsCtzHqaaJRap
	pwwJn8YfG4QOwF7H7OOqPLdzodTUKFZ8Tp/hOWoKsz0ccWu5ptxBLII41sb/t8RksxeqL3e
	C4xOKUOzxEzdygluXPcxUXtUkd1EQxtxrsOqKpJWNJJXb2GZ2lhRLTfzQgT60neYPYGvzA2
	Yy9tluX495W3XFL/1CcP8lKwoOrZV7AdRYzjGDS6MId6UEQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

calls back to all registered user return notifier functions.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/kernel/interrupt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 8c532cecbc60..609ba48034de 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -19,6 +19,7 @@
 #include <asm/time.h>
 #include <asm/tm.h>
 #include <asm/unistd.h>
+#include <asm/entry-common.h>
 
 #if defined(CONFIG_PPC_ADV_DEBUG_REGS) && defined(CONFIG_PPC32)
 unsigned long global_dbcr0[NR_CPUS];
@@ -245,6 +246,8 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
 	/* Restore user access locks last */
 	kuap_user_restore(regs);
 
+	arch_exit_to_user_mode_prepare(regs, ti_flags);
+
 	return ret;
 }
 
-- 
2.42.0.windows.2


