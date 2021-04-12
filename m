Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73C35B857
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 03:53:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJWx85Pjjz3dgs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:53:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OBwFNlHK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OBwFNlHK; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJWr51Lkkz3bx4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:49:25 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so1370248pja.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vWW5W66AStCwE8ZE+rX2Qsn+64wyA/hQNDRmb+lytiQ=;
 b=OBwFNlHKu3vt+A7+hIsLrnCi6AW9MsbtBjLIBrpH9G/UTvXVFe6LUVy1KTYHgLnHHY
 tNfpZ3u+7cTl/cZNHqbMxVfJn3NMO5XSvXpLxcOYcrDcDpE0pgs1b5PW5YS5AgLUKe0M
 /CF4tGhw8THn8IlsbLDXFlAUVg0jKjcs3gOAbxfx4Sgh1Ye+jB0v0LfaM4o9E/nSm+IE
 QKg+vUGBGcpylKKhteMxr5J8Hj9fqRmDCZDQeG/KAY9MmMacSU8KovwRAvdZJDqJ24Lw
 gj+tO39hMOZblRTejjTU0TsnpTl/R4d8TKvk7qGQuzftWHrLcUNWdCxtVKY0PJLM0jdb
 2r4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vWW5W66AStCwE8ZE+rX2Qsn+64wyA/hQNDRmb+lytiQ=;
 b=FtglQfYybgAKzF2knXhf95mbs+2dj77ueGAIpEYFSjxlT6kAmbkXyIo80Ci8elKWXF
 NTzhBLofQjlsvZKkcGLxvhh7NnjJ4YGAKPwQ4H90ZykcKr8U5kxlE5T0wwb6Dn1o29fk
 0tCHJIZV7QGn2303ENXXcAhQjd0TuB7OXLBqy/LzvUDEvFbAIvGZ6JgdEw78nSnXTUeG
 dId2tUYC3NQJ5AkzcaKkmgfnn3ZeND6N1uvt0yvllWCmTPlkTDc4CUpo1Wb9cBt0rb/n
 expa9FrDqOh06Ri3QaZq48p/RMPIm0ySAi4FplojYkPgiPcrddCPDpQIusGVODMXqG+/
 9yOA==
X-Gm-Message-State: AOAM530VFjQVdrw+MRSXgcmeKESVvWHaDz/lB9FTWc1L0rvVEGk9j2K9
 h6TdSRtgTrO8wEXTmmj5x8c=
X-Google-Smtp-Source: ABdhPJxChevwUV8mRTIcW1OaJdjplfJ+g+uRdMJ+AMvcHamDpA4kqq/bVGDd1YU9zpIf4lfZXJWe0w==
X-Received: by 2002:a17:902:aa87:b029:ea:fe2b:e59c with SMTP id
 d7-20020a170902aa87b02900eafe2be59cmr2180852plr.53.1618192162861; 
 Sun, 11 Apr 2021 18:49:22 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id m9sm9502345pgt.65.2021.04.11.18.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:49:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 10/12] powerpc/64s: remove KVM SKIP test from instruction
 breakpoint handler
Date: Mon, 12 Apr 2021 11:48:43 +1000
Message-Id: <20210412014845.1517916-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210412014845.1517916-1-npiggin@gmail.com>
References: <20210412014845.1517916-1-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code being executed in KVM_GUEST_MODE_SKIP is hypervisor code with
MSR[IR]=0, so the faults of concern are the d-side ones caused by access
to guest context by the hypervisor.

Instruction breakpoint interrupts are not a concern here. It's unlikely
any good would come of causing breaks in this code, but skipping the
instruction that caused it won't help matters (e.g., skip the mtmsr that
sets MSR[DR]=0 or clears KVM_GUEST_MODE_SKIP).

 [Paul notes: "the 0x1300 interrupt was dropped from the architecture a
  long time ago and is not generated by P7, P8, P9 or P10." So add a
  comment about this in the handler code while we're here. ]

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a0515cb829c2..358cd4b0c08e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2549,11 +2549,16 @@ EXC_REAL_NONE(0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
 #endif
 
-
+/**
+ * Interrupt 0x1300 - Instruction Address Breakpoint Interrupt.
+ * This has been removed from the ISA before 2.01, which is the earliest
+ * 64-bit BookS ISA supported, however the G5 / 970 implements this
+ * interrupt with a non-architected feature available through the support
+ * processor interface.
+ */
 INT_DEFINE_BEGIN(instruction_breakpoint)
 	IVEC=0x1300
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
-	IKVM_SKIP=1
 	IKVM_REAL=1
 #endif
 INT_DEFINE_END(instruction_breakpoint)
-- 
2.23.0

