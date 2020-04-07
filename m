Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3450E1A06A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:43:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGY82jnZzDr3p
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:43:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bJzZa2Yl; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0h26CtzDqvY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:19:00 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id g2so802479plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42wLPPdXyYKEvDZmkwAhMl7uSbdEKZoG24TcsZYBVnc=;
 b=bJzZa2YlGFdVdVeNSwkOuzesp2/5Jo0FqXDjY3IicTPCByG0O0/aBnpWrj8W427Y11
 JVOTYKtqZa5CsfNeML0y8618ISgrrCTd+TrhgH5VaZpeTcelqriX410E6k0IY0FhjBok
 egJ37jj/Ya7WxPhnAXb6Wmd3T76sQOqJDt5dmw+OsUm9oXkxSqeEgKxEEJGrJcrCFtBy
 450tomUP9DOngWeV/YuZCnctJ0ITDO8BCekt4xtcmZCjU5W4UxDEFlwCmPxeA0qQrD4L
 c2dlzIkWurC9W5kClhLUcBwqDFmdZDADC0i0YTaST1d5aL9aQ5Yxz5Oomfo/o0nH/JwL
 l8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42wLPPdXyYKEvDZmkwAhMl7uSbdEKZoG24TcsZYBVnc=;
 b=a9e3A7weFJMRi4edxwn9Dj5SfYrqcwHwoyTIExfJ0Ws6+PtTSjHtTzT38SbNqyXgtO
 x2ca+1jWrBB87t+GuFyKKOy/tDlN2jMxiXH9gvhQMtKwX6GndyPbMhykJnM5gLnG1mT2
 jRwPfCy309Z5k4cfz581jBr29J9dGVcstkbniH6yXPKgyQvfUmFc1vR/35AwxF6BW/Mw
 6UnHXomJz9uwb0mtAmOB+BZrqDucen/SGy1OD7EI4/U3Kko7SIjbEbx04f5dJgcFWoxq
 NTnIfPAVmIASzUZmufhYIP37FxHHQN+u7yoiYOHsQOywqTRP3hT3UjORYMhgt6+LeGHN
 uToA==
X-Gm-Message-State: AGi0PuZ7p5yJI9ZdoyFfhUaHtxwkz4zSa03wmJKG60UGebUxC24ggr6n
 W1wRPlZEznkyvD+/tXpitPHvv2yE
X-Google-Smtp-Source: APiQypLOHXm7deNsFDncXTpLyj5MFgU0oAMLkzQtkWUupdH58xdYdAqDzQdh+xyrzVMjdxX5BZSw5g==
X-Received: by 2002:a17:90b:1b04:: with SMTP id
 nu4mr627745pjb.81.1586236737107; 
 Mon, 06 Apr 2020 22:18:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/15] powerpc/64s: machine check do not trace real-mode
 handler
Date: Tue,  7 Apr 2020 15:16:34 +1000
Message-Id: <20200407051636.648369-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than notrace annotations throughout a significant part of the
machine check code across kernel/ pseries/ and powernv/ which can
easily be broken and is infrequently tested, use paca->ftrace_enabled
to blanket-disable tracing of the real-mode non-maskable handler.

Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index be7e3f92a7b5..fd90c0eda229 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/irq_work.h>
 #include <linux/extable.h>
+#include <linux/ftrace.h>
 
 #include <asm/machdep.h>
 #include <asm/mce.h>
@@ -571,10 +572,14 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
  *
  * regs->nip and regs->msr contains srr0 and ssr1.
  */
-long machine_check_early(struct pt_regs *regs)
+long notrace machine_check_early(struct pt_regs *regs)
 {
 	long handled = 0;
 	bool nested = in_nmi();
+	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
+
+	this_cpu_set_ftrace_enabled(0);
+
 	if (!nested)
 		nmi_enter();
 
@@ -589,6 +594,8 @@ long machine_check_early(struct pt_regs *regs)
 	if (!nested)
 		nmi_exit();
 
+	this_cpu_set_ftrace_enabled(ftrace_enabled);
+
 	return handled;
 }
 
-- 
2.23.0

