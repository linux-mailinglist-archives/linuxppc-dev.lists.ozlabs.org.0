Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC5D255846
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 12:05:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdFZd5mQnzDqsC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 20:04:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CQod5hZ8; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdFTh4cCCzDqnx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 20:00:40 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id g207so415535pfb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PMGQxaBKPbON3ssZWMqrEm63rTUeWUDOhP6COLqPYSc=;
 b=CQod5hZ8nMSXxmoYAACVHF/qI22QxGeFSjZUjfpoMAoBOV9QseFdRM4mT4eXynXUTC
 Srct4/znp2udP6D2fWV0bzQ+pU+XXOtJaMi2g+drMUXj2K60C7ryDET6zClkdldor8i/
 E7b0vIa8R3BWPgXPD+PJJc+AOPD+vqs7DgiqbTvdaT+K3ptqwzdJmNc9JYAun+j0QBae
 7AboNgbfU8v9VPxj5nmgHoLhu4gnUy6QW/u+UtbhElPKKl+uWSB8sno/j9ZONdogYAlc
 aQLufAMyCIBONhDco8RGsYXEqd6c77U8MUJIv054R9Y1Pl38buDYzYUONBBZjC6y1qyg
 Lk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PMGQxaBKPbON3ssZWMqrEm63rTUeWUDOhP6COLqPYSc=;
 b=s/qr+YPF7H+2DCVo4+S8oiLSvByk2V16hkAI8Xi2sJvPCLIqu/mqdzgVORgQ9GyU/h
 LNJzRt03r+MdkeQBrQYyAaXhu3RswbeeKkIBNTF7d26kP6QVmgTQwsVQMJ9buB0BeHmu
 nuOoO2s06fmd9uevtrkKUY1ey0qUSTypWX+Ip+x0iF6J2rBvEHMDgCfDW9AoTJPiRMFW
 25hxMaPqtvIkldJ+OTLTUVyb8BMcuoxVlce4RdfRarAoji9aNqmBcYqvqvVNZ03jF909
 2h2Zllxx0D2IzhPfzwX5Vmi+k36404nJTyr3zRc8zFMZRsH+vKU3wkYthV2WAIGRbopo
 33nA==
X-Gm-Message-State: AOAM532ymidfGPpY8D1RyTXN4dQAmmfI+h1LKax0Ee37nwR3PpFVbUD5
 kOHllcSQP+6yQSSN0BghLKA=
X-Google-Smtp-Source: ABdhPJzJadmdcr+E5dPdAeWoEtRrezvpoEws2ofoV8cHCzMpxKfGsMWs/5DPALVlJiaUIB6ACL7lKA==
X-Received: by 2002:aa7:96f4:: with SMTP id i20mr619172pfq.312.1598608837398; 
 Fri, 28 Aug 2020 03:00:37 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id 78sm1068608pfv.200.2020.08.28.03.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:00:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH 1/4] mm: fix exec activate_mm vs TLB shootdown and lazy tlb
 switching race
Date: Fri, 28 Aug 2020 20:00:19 +1000
Message-Id: <20200828100022.1099682-2-npiggin@gmail.com>
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

Reading and modifying current->mm and current->active_mm and switching
mm should be done with irqs off, to prevent races seeing an intermediate
state.

This is similar to commit 38cf307c1f20 ("mm: fix kthread_use_mm() vs TLB
invalidate"). At exec-time when the new mm is activated, the old one
should usually be single-threaded and no longer used, unless something
else is holding an mm_users reference (which may be possible).

Absent other mm_users, there is also a race with preemption and lazy tlb
switching. Consider the kernel_execve case where the current thread is
using a lazy tlb active mm:

  call_usermodehelper()
    kernel_execve()
      old_mm = current->mm;
      active_mm = current->active_mm;
      *** preempt *** -------------------->  schedule()
                                               prev->active_mm = NULL;
                                               mmdrop(prev active_mm);
                                             ...
                      <--------------------  schedule()
      current->mm = mm;
      current->active_mm = mm;
      if (!old_mm)
          mmdrop(active_mm);

If we switch back to the kernel thread from a different mm, there is a
double free of the old active_mm, and a missing free of the new one.

Closing this race only requires interrupts to be disabled while ->mm
and ->active_mm are being switched, but the TLB problem requires also
holding interrupts off over activate_mm. Unfortunately not all archs
can do that yet, e.g., arm defers the switch if irqs are disabled and
expects finish_arch_post_lock_switch() to be called to complete the
flush; um takes a blocking lock in activate_mm().

So as a first step, disable interrupts across the mm/active_mm updates
to close the lazy tlb preempt race, and provide an arch option to
extend that to activate_mm which allows architectures doing IPI based
TLB shootdowns to close the second race.

This is a bit ugly, but in the interest of fixing the bug and backporting
before all architectures are converted this is a compromise.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig |  7 +++++++
 fs/exec.c    | 17 +++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index af14a567b493..94821e3f94d1 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -414,6 +414,13 @@ config MMU_GATHER_NO_GATHER
 	bool
 	depends on MMU_GATHER_TABLE_FREE
 
+config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
+	bool
+	help
+	  Temporary select until all architectures can be converted to have
+	  irqs disabled over activate_mm. Architectures that do IPI based TLB
+	  shootdowns should enable this.
+
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/fs/exec.c b/fs/exec.c
index a91003e28eaa..d4fb18baf1fb 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1130,11 +1130,24 @@ static int exec_mmap(struct mm_struct *mm)
 	}
 
 	task_lock(tsk);
-	active_mm = tsk->active_mm;
 	membarrier_exec_mmap(mm);
-	tsk->mm = mm;
+
+	local_irq_disable();
+	active_mm = tsk->active_mm;
 	tsk->active_mm = mm;
+	tsk->mm = mm;
+	/*
+	 * This prevents preemption while active_mm is being loaded and
+	 * it and mm are being updated, which could cause problems for
+	 * lazy tlb mm refcounting when these are updated by context
+	 * switches. Not all architectures can handle irqs off over
+	 * activate_mm yet.
+	 */
+	if (!IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
+		local_irq_enable();
 	activate_mm(active_mm, mm);
+	if (IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
+		local_irq_enable();
 	tsk->mm->vmacache_seqnum = 0;
 	vmacache_flush(tsk);
 	task_unlock(tsk);
-- 
2.23.0

