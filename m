Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 351DB255848
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 12:06:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdFcW2LLZzDqpd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 20:06:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bRRBgNBj; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdFTn24hkzDqnx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 20:00:45 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id p15so240415pli.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 03:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQ1kOxEaL9FVx1zYJ6CutcXNmCnj+fa5P2Lt3GvzHyI=;
 b=bRRBgNBjutZV34MKXKG3E/VwB3IKH7AOxXMifwoUlmRbz0QhDAlR12gCR3RgEp/4kJ
 GHdQnSrAbNR0hYRWAxQJ2UTdupNx3n7YuRnohk7oeBcdDM09JguHSVOUfX2qmpfI7F7+
 u6SNJ+4RfnJrk//q1ccvcWLjfV5ugaWXI7HwDTBw9LQDMrlTpVUkfGveH3lmvTExpQu5
 O4MinePSx7ves2sQvMrRYW4Gz7PEA9nDzz3ThtjN/h3oEsPzaCd0GqRFAPTmhc0NBBu6
 98et6/pdtFvL/SFmG/Wi+MPArcGOyX2UV83ogTXzHMq71tgmKgvXDU62rTcVXUUQxflh
 6Jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQ1kOxEaL9FVx1zYJ6CutcXNmCnj+fa5P2Lt3GvzHyI=;
 b=WuPYYCC+Z7eEQPq+M+dJ2rkuMIg8DiXslPtmlA4qm0H6vp5yBNJjsklm9fH76ngL5k
 hlNk2Avp/jwoo0uU6Ag6swZfgj8kcd8/esFU525bJwaZo4EfrRO5moEj1T56G+BNEeDI
 DXkby2np2mYpOODQrgdAqmmcyBXsoFoD/A63knbQoFNbpYJhCN/pzyNC2UZcm8G1h+5a
 IIjwIcfc0xyrwQvQwbO4Mm250sB/L5nNy2bTLl8L12mEBb7uMAdtFsuSkqPpBP5rUHBB
 XAjASCKS9lDB47UJ1NZ2pi9cv+NLd7kwG1bcfOLbih6Va4SFdzVzY3u++SdpbwZGd4E6
 0dsg==
X-Gm-Message-State: AOAM5327dj1wEKEDxc2RL592phUTgjpMnI/Hai9Bjt1HBd6bLJu+qGt9
 4HhxwRMkVxQelUvQpd29qGo=
X-Google-Smtp-Source: ABdhPJxa/QRl5EZgnlzwuYW8jlGMI75oSzDlqSUeAaqnONi5FlxmVIhKGxJLmK+WQt5JYnUs+sDK6A==
X-Received: by 2002:a17:902:b588:: with SMTP id a8mr712053pls.96.1598608842326; 
 Fri, 28 Aug 2020 03:00:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id 78sm1068608pfv.200.2020.08.28.03.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:00:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH 2/4] powerpc: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
Date: Fri, 28 Aug 2020 20:00:20 +1000
Message-Id: <20200828100022.1099682-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200828100022.1099682-1-npiggin@gmail.com>
References: <20200828100022.1099682-1-npiggin@gmail.com>
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
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
index 1f48bbfb3ce9..65cb32211574 100644
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
index 7f3658a97384..e02aa793420b 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -244,7 +244,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
  */
 static inline void activate_mm(struct mm_struct *prev, struct mm_struct *next)
 {
-	switch_mm(prev, next, current);
+	switch_mm_irqs_off(prev, next, current);
 }
 
 /* We don't currently use enter_lazy_tlb() for anything */
-- 
2.23.0

