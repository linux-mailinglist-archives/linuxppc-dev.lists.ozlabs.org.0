Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCFF1D8C43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 02:28:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QxZL62pgzDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 10:28:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fp5I1zLj; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QxWk419dzDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 10:26:25 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id 190so12666648qki.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 17:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vSJnwcwzJ6JQ8cOkRgXkpxTwGHhwzzMaFtdAARFsxXA=;
 b=Fp5I1zLjyad2CUSFmsDYAcObjn71acu20n11AnJLUVFXrJo5RMDOe5M2EqavYD23Ws
 G8wGk/jMQywcMZRmiaM6f2QXt7OE1tvnkE0Z4KCP9J/NyJzodUsQKAOG+W5Z9hL6YmVA
 ztf6oeTYJrRfQGG4DWolxcRm6ABmRqBeIVx2kjHP+c6VzOvOFkCxm+bm0ggvEf0TitGQ
 4nK/Vws5/yPko9TF4FzkCNe7pu4rsS/NHwJdLDM/nGV+FOT99ho8mep++0upq61Zwk0t
 jVCzkLfDAYPaVZx1hvttS+U4oaEEQfVgEc3dpX7Ulw33WWVQ0a3FAWv61TT99P1jTX26
 n98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vSJnwcwzJ6JQ8cOkRgXkpxTwGHhwzzMaFtdAARFsxXA=;
 b=eshJqMOqy6840omOL++hWgoGuXWtgrU+WVgcucPjxHjtgTFcCJ7WgFoCiEuGH/xVnl
 pwM33n1TQi+RqRlEagdJnb7rUDjd/2E5lcKlffkEEXiLHKB4MtwhsmZf37aIfVZJVeM4
 jNBIEUCV8FG39UJXqr79KWJ8dELamMLotiXkIsY7jCZWRUzb4iSkOb+daaGTP6wVZnBP
 XnJ5LhuG8SW9nzwO+6VWmRREpJrjpWQQXMQ6D3zvT8odWsNUl2jj7HhX6mOaRr97eBhY
 cqG5KBVBGKNIT/8RRGsFx+2BGtbMbTH1U/ocnm3I3/QtfZbqWSlgQuRwwSVe/rDG50bP
 IQRQ==
X-Gm-Message-State: AOAM533CZpBWiQG2nJ3+CpcyQagkHgJz1qiDO6D2gWxxcpYq8+9h6SFp
 LAZ0Z4+nEk7MRPDFe5fpyng=
X-Google-Smtp-Source: ABdhPJxc6ks256v3X/1qy6T5tU1qAbCGp8bsiXZlDzOdzp8HLmooSIIpu97YX77sV39D4Ma6oHkFFA==
X-Received: by 2002:a37:b5c3:: with SMTP id
 e186mr17102893qkf.158.1589847983534; 
 Mon, 18 May 2020 17:26:23 -0700 (PDT)
Received: from LeoBras.aus.stglabs.ibm.com
 (177-131-65-239.dynamic.desktop.com.br. [177.131.65.239])
 by smtp.gmail.com with ESMTPSA id e34sm2284048qtb.21.2020.05.18.17.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 17:26:22 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Allison Randal <allison@lohutok.net>,
 Leonardo Bras <leobras.c@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 1/1] powerpc/crash: Use NMI context for printk when
 starting to crash
Date: Mon, 18 May 2020 21:25:58 -0300
Message-Id: <20200519002558.202929-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, if printk lock (logbuf_lock) is held by other thread during
crash, there is a chance of deadlocking the crash on next printk, and
blocking a possibly desired kdump.

At the start of default_machine_crash_shutdown, make printk enter
NMI context, as it will use per-cpu buffers to store the message,
and avoid locking logbuf_lock.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

---
Changes since v2:
- Changes usage of printk_nmi_enter() to nmi_enter()
  (Suggested by Nick Piggin)

Changes since v1:
- Added in-code comment explaining the need of context change
- Function moved to the start of default_machine_crash_shutdown,
  to avoid locking any printk on crashing routine.
- Title was 'Use NMI context for printk after crashing other CPUs'

---
 arch/powerpc/kexec/crash.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index d488311efab1..53c5cf9b6d3c 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/types.h>
+#include <linux/hardirq.h>
 
 #include <asm/processor.h>
 #include <asm/machdep.h>
@@ -311,6 +312,13 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	unsigned int i;
 	int (*old_handler)(struct pt_regs *regs);
 
+	/*
+	 * Avoid hardlocking with irresponsive CPU holding logbuf_lock,
+	 * by using printk nmi_context
+	 */
+	if (!in_nmi())
+		nmi_enter();
+
 	/*
 	 * This function is only called after the system
 	 * has panicked or is otherwise in a critical state.
-- 
2.25.4

