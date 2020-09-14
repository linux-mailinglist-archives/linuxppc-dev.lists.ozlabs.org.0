Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 906642683DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 06:57:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqYyX0SSnzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 14:57:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZhI/Ifh3; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqYrb588lzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 14:52:47 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d13so2311360pgl.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Sep 2020 21:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhSlIbBbaKajKS/IeKMTbHGZ3Q2g5fhRWyCc6GgGFOw=;
 b=ZhI/Ifh3Hh6S9ezSZcFBjkvaYu4u3PPYdLMSfBHM9LS26Zi7yErlcuHKgA3qBwnTfV
 iGDS/wM/bY3O58Mf9zXr4CxP6mSXYPzQgzApyoZV2tEVf9gLml7tNnK38HNgZ9lhZ1PJ
 O/UmN55TOjc2KeHwMoARlpP1+PF+6o7rHRkXoljfAxCOBNXpYx5t3IZz46zUM3pG8DuF
 GExC97I0wWEvqfV3A1vzgIZUAUrYlPpZAi9y12aoahe8F0r4WS6opEhiQVoBywwgh1vW
 kd74xEfqE4D83mFc0YL7uL6vFIp+rLW+oHi7rtFTbHgufUqXHYwzY4kr7WBnW0BHfBbx
 zhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhSlIbBbaKajKS/IeKMTbHGZ3Q2g5fhRWyCc6GgGFOw=;
 b=TddQq9xmK8MrRN9nYtYrqA4xofOXE4/0/lyhcVdDmxMXLrZuZHaxaVx0BrbHlqa3e1
 bpxGRBrL1vF1zG8VDN4wpgWvJjO8nH2ss+69c69mgTGgT6vsr5FSI+0bZ/xfE6kJdUWc
 SzxMRe0hS6n6E++xNSiFReL5tXPvZ10PbMzhFzbS5W4fHpptoAr/R7LFsZX+KfYw4zIl
 H6V7Hnn3pTwhP4QGV0uL0khSrskfLL+W4GofLbI2Q0ReMcZ+Dwp36Mon9OBfH6B8YKUI
 xCPMJsh6GrLLLfMmIAtaX0WjAuQNXt68prpEtTYh0YTL3Qt2akkkIxA365FTCXOWRuXN
 WNZg==
X-Gm-Message-State: AOAM532mMC1eBXP71e2TW/7FBpNsdRHhIJseZFlWss4/i64KTUff0J3D
 ZtokqpkC6GTeaGaS25Ww+nE=
X-Google-Smtp-Source: ABdhPJxbiaPuklpxkmh3T4+ZXi9ibcsoZFsVvSnpom8ez8y/HozIvGy1egzT8jlrpKnmg5m7ICoLVQ==
X-Received: by 2002:a17:902:7883:: with SMTP id
 q3mr840986pll.117.1600059165913; 
 Sun, 13 Sep 2020 21:52:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id a13sm6945312pgq.41.2020.09.13.21.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 21:52:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: "linux-mm @ kvack . org" <linux-mm@kvack.org>
Subject: [PATCH v2 2/4] powerpc: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
Date: Mon, 14 Sep 2020 14:52:17 +1000
Message-Id: <20200914045219.3736466-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200914045219.3736466-1-npiggin@gmail.com>
References: <20200914045219.3736466-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc uses IPIs in some situations to switch a kernel thread away
from a lazy tlb mm, which is subject to the TLB flushing race
described in the changelog introducing ARCH_WANT_IRQS_OFF_ACTIVATE_MM.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   | 1 +
 arch/powerpc/include/asm/mmu_context.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 65bed1fdeaad..587ba8352d01 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -149,6 +149,7 @@ config PPC
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
 	select ARCH_WANT_IPC_PARSE_VERSION
+	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index a3a12a8341b2..b42813359f49 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -244,7 +244,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 #define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev, struct mm_struct *next)
 {
-	switch_mm(prev, next, current);
+	switch_mm_irqs_off(prev, next, current);
 }
 
 /* We don't currently use enter_lazy_tlb() for anything */
-- 
2.23.0

