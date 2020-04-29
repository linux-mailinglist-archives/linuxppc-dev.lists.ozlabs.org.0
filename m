Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9594D1BD4BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:38:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bpk34r67zDr4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:38:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pM9f5z5Z; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpSQ5yTDzDr0P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:26:30 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id t40so360718pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksOi0UlTGvBxlodsHEXHpbRyloMe1tqnfNzPw/TOXks=;
 b=pM9f5z5ZjOgS68g80bB+HuOB3ghdAf0tHiKrs7tMrVzARkQoiJDPWQMNPqni0FuJQJ
 3NJf28NukvJkX1EXb0sh3tRNh/A9bheY2DKK1t6o/LLu594sJrNMrncXpzBtFOw+Y7g2
 HFw2k0X1D0HJO1O+k/dsdDs0OLqM+KPS2hhsWFY/AfkCBNsdfbryGJXGacetKdQ5LqXu
 DqKNQwURP1PD+7vENoldLIphleUnAI0kXB0cZMsYzDxF4l/rGGmo1iGS66jrDW/NBjOb
 4WsysphRK3kyrEqOqOWmvJrozlY92XPBNzDhhq+RRE2JMKqYhyqbbd1jJuAzxqNHCXoC
 UN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksOi0UlTGvBxlodsHEXHpbRyloMe1tqnfNzPw/TOXks=;
 b=agh4z0ID8XBnqll49iYwYRNql6YaylvcxLwEqQ2DNPZKLgiiTMCW5C593Z1xwU+N7F
 7h94gow81c0x88Wx9AOSvRO+np1LpKvodBPlFzyYsJJl9yfYm+BuUzGX8xS+EbyxWQux
 +qc6KgJAnaGdgATXVDnpDfXK9R+GWJe+0y/xfCfMSfOZ/o47nYORHjAx3Lk9FFlHKGuq
 yPPSoj5Mg4weIqMqFuB68yYY9I64OIvB6NmLWdmwk8bm3c+ndKKN81qsVNLu1DWN/TzU
 dSJgR34BMWU2wOy4Q43syfv5OpXXeTNw0fUHM8OsRHT3ahbkEqe2unpE2dpVBBl4DiwJ
 ISiQ==
X-Gm-Message-State: AGi0PuYkIMSqWjRPhn0Bt2gwFpwb2GIhPdmSYf/nvRFMZzyYuhFyEqqz
 r035eJlYW9Xbi0Q3LDTI4EOGcjHV
X-Google-Smtp-Source: APiQypKnqUX+Z+khudcVhN8kD19vVOfr9QMV5qTG/UH5v4spNH1jyJ4SiO4WbuWNaTkq329XIy/pWA==
X-Received: by 2002:a17:902:9347:: with SMTP id
 g7mr29820818plp.77.1588141587309; 
 Tue, 28 Apr 2020 23:26:27 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id s76sm164373pgc.85.2020.04.28.23.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:26:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/64/kuap: restore AMR in fast_interrupt_return
Date: Wed, 29 Apr 2020 16:26:05 +1000
Message-Id: <20200429062607.1675792-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429062607.1675792-1-npiggin@gmail.com>
References: <20200429062607.1675792-1-npiggin@gmail.com>
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

Interrupts that use fast_interrupt_return actually do lock AMR, but they
have been ones which tend to come from userspace (or kernel bugs) in
radix mode. With kuap on hash, segment interrupts are taken in kernel
often, which quickly breaks due to the missing restore.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 9a1e5d636dea..b3c9f15089b6 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -472,15 +472,17 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 #ifdef CONFIG_PPC_BOOK3S
 	/*
 	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
-	 * touched, AMR not set, no exit work created, then this can be used.
+	 * touched, no exit work created, then this can be used.
 	 */
 	.balign IFETCH_ALIGN_BYTES
 	.globl fast_interrupt_return
 fast_interrupt_return:
 _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
+	kuap_check_amr r3, r4
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
 	bne	.Lfast_user_interrupt_return
+	kuap_restore_amr r3
 	andi.	r0,r4,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
 	bne+	.Lfast_kernel_interrupt_return
-- 
2.23.0

