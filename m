Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0F1BD571
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 09:10:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BqRd1Fs8zDqx6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:10:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C+ziKj5O; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bq8224zWzDr5g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:57:22 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id a31so388168pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksOi0UlTGvBxlodsHEXHpbRyloMe1tqnfNzPw/TOXks=;
 b=C+ziKj5OY22J268CJ5rZeV2D2koQbSRZ9sxSx+eQUjNpXayLSIAR1+eUKrh8zbnfdc
 nME5V3Nc0tdhBDn9oUCZFfwdvdTeJjJgCrrpdLp00Tetd9M35V50gFRmiDGcqUxDqHqS
 zlKENccEgETNIOX3FyNbzs9CA8Six+5N9Y0vqDicUyRter2dJTyyuCzul6q9el7Gj5WG
 qTatw3t6d+UjXUaG/ot4eXOma1UfzM6RpejYf1zLninPBgDOfEUZ8i9630n47PyTOQE1
 m1fQKvzg3PYm5TaN08wxss1b3N8xAreRKnUr26HemL/ht31XOLU1yTEP32MVVMgH/mmM
 0y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksOi0UlTGvBxlodsHEXHpbRyloMe1tqnfNzPw/TOXks=;
 b=drcrh6DRBSvbLk0jI+a7qUj1V44Xdgw73h98l6T0WsFjHY2hWD8x+7lTvSk0h3wUz1
 I97/s6E2YVOhzK/Lr8+GCiNIkum2GMzDFzdg6SfQE7Qk713HcyyFPS2l+17tfvxzOilG
 cNbGog3T4DDdi6AYvVqsRVhNddyZIUnrXC1fiSD/7M/iSpSorGcXCySJE72SYm+p7x91
 Q/m6hz5ctXfDD1oUHLGea7fy5z2TZBZgEDoNeswGLNMJpBOWQnJDiRXQLHXNy7QxncDK
 HqRq61eNa+qg2H64SaIM9jvhRTIdjK7OIf0wPItpp78H2kiMYazMjsQTk5qgWNnRVENn
 mfYw==
X-Gm-Message-State: AGi0PuboSZdnWZ/+fGcLXGbe/YAi8OCEqLZDQJZxZtUw7vnS3xopcUkT
 ZvdW4c+UH4B+g42f2Gdi6V4uV0g/
X-Google-Smtp-Source: APiQypLcOYnPnsGrNs8rwYYVnTgKjA8oCXVekT+yka7XdRHUQ2upCtvlutwvi2V6y+p+Tj5fEKV6VA==
X-Received: by 2002:a17:902:b20e:: with SMTP id
 t14mr31798412plr.223.1588143439947; 
 Tue, 28 Apr 2020 23:57:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id a26sm254660pgd.68.2020.04.28.23.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:57:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/64s/kuap: restore AMR in fast_interrupt_return
Date: Wed, 29 Apr 2020 16:56:53 +1000
Message-Id: <20200429065654.1677541-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429065654.1677541-1-npiggin@gmail.com>
References: <20200429065654.1677541-1-npiggin@gmail.com>
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

