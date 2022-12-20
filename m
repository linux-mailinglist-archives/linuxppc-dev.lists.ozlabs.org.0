Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475E651B53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 08:08:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbnjD71DZz3cBL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 18:08:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eMolG9vH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eMolG9vH;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbnhF5YVnz30Qt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 18:07:23 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id v23so6270524pju.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 23:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwGJvi0Hqvv9JsuJy6Gv715wZTJNC2wfNDuRpG/Z03c=;
        b=eMolG9vHTtOXK18ugSCIT0pCtnwCyoEsJeJ5PFZQGlEJEv8sGasn8k+mDNhl13PHtY
         KxdPALt6iNv1ZxEOScug4CjFT4yCtXaPilRS4KpEie5J9Y8SLqmppp5JrDNEKt+UxiZk
         eqBpTCNCaf/7o148rNd27ULe/kJ9Xn6dxiP231e6ygEywzOKaGrwUesy9DXrmQask2mJ
         QivmeB3xkmUMw8175037K8srGanPjwIp2+itZCK6uHl1Delon502RC/BOMncaixcxKaP
         c0p0fyUNurBXLQPHDAAE3x9UdnNFTS36u+ZdnOICTnOxYQF2w5zemVtMudmeT7rOIbzN
         0jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwGJvi0Hqvv9JsuJy6Gv715wZTJNC2wfNDuRpG/Z03c=;
        b=fodhxwKInh3ZzPgAHK3j0xw6U1SRtdUGOeYvzUXbVS1L5XfQYTHzkc64MZ2JgS/bDI
         eLStElC206blB+/BnDv24TDXsjo/4QwoaAJFf4YqYxoQ2/g4xvPA2edPRfdw6SJNs+GO
         /BVLaDT1VBlVxcs1wp9tvVE/CKNRIk34ywuvRc1DtbN/YtLZW7zRwpJ7R21zjNtGl1l+
         +MzHGdy9NjMuLvglWFECYqoFFkhWWWtK98uTIVW9r6tMYlmo+nK5YrVL1EwOd7BBtV2w
         QevSkd1pf7gvCwU+EeMmlZJP3pCecJHqzIEgDolukSATMQ+6wvSQE/0L63hSC1PND6/y
         W/yg==
X-Gm-Message-State: ANoB5plKc2Fav3kMV2a2UGvIhTAXe+zplhsh54fNoJfjB8olGtYyDFCp
	PKurq10zWM+jLVfzHNI9hUo=
X-Google-Smtp-Source: AA0mqf4iLIizbzTJRsINqgiMybAadqDLhEvMnVzW3qXyXFfY1t4pTIN5jFY0V6pdOozi2j7p8S7Jsg==
X-Received: by 2002:a17:90b:1916:b0:21a:4bf:eeb0 with SMTP id mp22-20020a17090b191600b0021a04bfeeb0mr46812820pjb.28.1671520041576;
        Mon, 19 Dec 2022 23:07:21 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (203-219-149-28.tpgi.com.au. [203.219.149.28])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090ace0a00b00219220edf0dsm7074232pju.48.2022.12.19.23.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 23:07:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] cputime: remove cputime_to_nsecs fallback
Date: Tue, 20 Dec 2022 17:07:05 +1000
Message-Id: <20221220070705.2958959-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Rik van Riel <riel@surriel.com>, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <fweisbec@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The archs that use cputime_to_nsecs() internally provide their own
definition and don't need the fallback. cputime_to_usecs() unused except
in this fallback, and is not defined anywhere.

This removes the final remnant of the cputime_t code from the kernel.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This required a couple of tweaks to s390 includes so we're not pulling
asm/cputime.h into the core header unnecessarily. In that case maybe
this can go via s390 tree because the patch should be otherwise quite
trivial. Could it get an ack or two from a core maintainer to support
that?

Thanks,
Nick

 arch/s390/kernel/idle.c       | 2 +-
 arch/s390/kernel/vtime.c      | 2 +-
 include/linux/sched/cputime.h | 9 ---------
 kernel/sched/cputime.c        | 4 ++++
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/s390/kernel/idle.c b/arch/s390/kernel/idle.c
index 4bf1ee293f2b..a6bbceaf7616 100644
--- a/arch/s390/kernel/idle.c
+++ b/arch/s390/kernel/idle.c
@@ -12,9 +12,9 @@
 #include <linux/notifier.h>
 #include <linux/init.h>
 #include <linux/cpu.h>
-#include <linux/sched/cputime.h>
 #include <trace/events/power.h>
 #include <asm/cpu_mf.h>
+#include <asm/cputime.h>
 #include <asm/nmi.h>
 #include <asm/smp.h>
 #include "entry.h"
diff --git a/arch/s390/kernel/vtime.c b/arch/s390/kernel/vtime.c
index 9436f3053b88..e0a88dcaf5cb 100644
--- a/arch/s390/kernel/vtime.c
+++ b/arch/s390/kernel/vtime.c
@@ -7,13 +7,13 @@
  */
 
 #include <linux/kernel_stat.h>
-#include <linux/sched/cputime.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/timex.h>
 #include <linux/types.h>
 #include <linux/time.h>
 #include <asm/alternative.h>
+#include <asm/cputime.h>
 #include <asm/vtimer.h>
 #include <asm/vtime.h>
 #include <asm/cpu_mf.h>
diff --git a/include/linux/sched/cputime.h b/include/linux/sched/cputime.h
index ce3c58286062..5f8fd5b24a2e 100644
--- a/include/linux/sched/cputime.h
+++ b/include/linux/sched/cputime.h
@@ -8,15 +8,6 @@
  * cputime accounting APIs:
  */
 
-#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
-#include <asm/cputime.h>
-
-#ifndef cputime_to_nsecs
-# define cputime_to_nsecs(__ct)	\
-	(cputime_to_usecs(__ct) * NSEC_PER_USEC)
-#endif
-#endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
-
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
 extern bool task_cputime(struct task_struct *t,
 			 u64 *utime, u64 *stime);
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 95fc77853743..af7952f12e6c 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -3,6 +3,10 @@
  * Simple CPU accounting cgroup controller
  */
 
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+ #include <asm/cputime.h>
+#endif
+
 #ifdef CONFIG_IRQ_TIME_ACCOUNTING
 
 /*
-- 
2.37.2

