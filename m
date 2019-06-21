Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8349C4DFEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:07:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRWn3pWszDqDh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:07:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="jbFjPRvb"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRGt1WmgzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:22 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id e5so2365478pls.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fxhyoHwSsq2C0d+sQ7vzuRwo/e9Tpyx9fcIP2T88vp0=;
 b=jbFjPRvbsyQYl4DDFEeh0Cm1tSGL7s/lRGmvmqHkpYkB91lQcMCjqA1RaHOadayi5e
 3yQDaanIMyBkRvHXcAXT94AySOIBHCv6ob9r/70LlPpFWLGehUek3u32/11NwgMmt0y2
 lUSVZZPjlYr1eN/dSFUAXfiv+BPNoExs8od1WKGLLiWdz/83lf1YymUW8i88VdJ88QZd
 uubyt4CgTDTvgyRW5QW1Bk+MPg/1ryopisM2Hihj3uhSNl6eWydWeauBDPcACHYhFMGO
 /U8R9RIhkDHVjwagaCsW5ayEtmbe4BuW+GPZWHb8rZTJFvI0L0U+1wyEzP14KdjHKnYp
 8y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxhyoHwSsq2C0d+sQ7vzuRwo/e9Tpyx9fcIP2T88vp0=;
 b=Afyh8401fOH6m3wfipoFle4QnIikaxg7LndKkgjeRXoZM/dyfcpyHvCqeEEZvZnxL9
 akNr1b7EXu5klA/fOQXBzuV+O9bMNkK+ScIzfG0DRfjHrE/+OJ5Yu9MvKJtHz9sYNi0k
 crc7Gb5vRetEPg27m6ptLMKY0fK5CQnqq0fSN5+qolNlFKkn7jiCz9gyXHHJUoa/bGrn
 TJVCyUBcjWTjp+D1cOe9wTh9JpWd1/yZ2ZFbpE/BntWcMHyDKzYQEiavLKjEln6Prf0O
 v4a9An2e9LuH3Lj1LYGk8wBxlLl6FIeVEir0f5qkPdXTKQfojLaabW14tzHO5w2l2SZm
 rukQ==
X-Gm-Message-State: APjAAAU7OIfnx8+k4HmZ/+DmWBrbcowO13phC3YdXfKOK3mzdMO1RrL1
 ftRbdQPJGVN13Pr3FSFFvecLJ/iQ/6RWug==
X-Google-Smtp-Source: APXvYqzsEVk098tdM0X17zxnA8M2OF+NkFcwWRz5WqQXVMrvQgERNZaPhQ/uLtwX/38w4OnC0AUZ9Q==
X-Received: by 2002:a17:902:70cc:: with SMTP id
 l12mr13375069plt.87.1561092979273; 
 Thu, 20 Jun 2019 21:56:19 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:18 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 05/13] powerpc/mce: Allow notifier callback to handle MCE
Date: Fri, 21 Jun 2019 10:25:47 +0530
Message-Id: <196df6a74f259c041a4269e6cba026a1248ed4af.1561020760.git.santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561020760.git.santosh@fossix.org>
References: <cover.1561020760.git.santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

If a notifier returns NOTIFY_STOP, consider the MCE handled, just as we
do when machine_check_early() returns 1.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  2 +-
 arch/powerpc/kernel/exceptions-64s.S      |  3 +++
 arch/powerpc/kernel/mce.c                 | 28 ++++++++++++++++-------
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index f66f26ef3ce0..49ee8f08de2a 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -72,7 +72,7 @@ void machine_check_exception(struct pt_regs *regs);
 void emulation_assist_interrupt(struct pt_regs *regs);
 long do_slb_fault(struct pt_regs *regs, unsigned long ea);
 void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
-void machine_check_notify(struct pt_regs *regs);
+long machine_check_notify(struct pt_regs *regs);
 
 /* signals, syscalls and interrupts */
 long sys_swapcontext(struct ucontext __user *old_ctx,
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 2e56014fca21..c83e38a403fd 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -460,6 +460,9 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_notify
+	ld	r11,RESULT(r1)
+	or	r3,r3,r11
+	std	r3,RESULT(r1)
 
 	ld	r12,_MSR(r1)
 BEGIN_FTR_SECTION
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 0ab171b41ede..912efe58e0b1 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -647,16 +647,28 @@ long hmi_exception_realmode(struct pt_regs *regs)
 	return 1;
 }
 
-void machine_check_notify(struct pt_regs *regs)
+long machine_check_notify(struct pt_regs *regs)
 {
-	struct machine_check_event evt;
+	int index = __this_cpu_read(mce_nest_count) - 1;
+	struct machine_check_event *evt;
+	int rc;
 
-	if (!get_mce_event(&evt, MCE_EVENT_DONTRELEASE))
-		return;
+	if (index < 0 || index >= MAX_MC_EVT)
+		return 0;
+
+	evt = this_cpu_ptr(&mce_event[index]);
 
-	blocking_notifier_call_chain(&mce_notifier_list, 0, &evt);
+	rc = blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
+	if (rc & NOTIFY_STOP_MASK) {
+		evt->disposition = MCE_DISPOSITION_RECOVERED;
+		regs->msr |= MSR_RI;
 
-	if (evt.error_type == MCE_ERROR_TYPE_UE &&
-	    evt.u.ue_error.physical_address_provided)
-		machine_check_ue_event(&evt);
+		return 1;
+	}
+
+	if (evt->error_type == MCE_ERROR_TYPE_UE &&
+	    evt->u.ue_error.physical_address_provided)
+		machine_check_ue_event(evt);
+
+	return 0;
 }
-- 
2.20.1

