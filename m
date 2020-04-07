Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4111A06AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:45:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGbS1yGGzDr0V
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:45:40 +1000 (AEST)
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
 header.s=20161025 header.b=nZ1yfvvB; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0k6xLdzDqwr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:19:02 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id k15so263290pfh.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7OlubOQimkHngZ3g1RBEj6WP5pjIG24DCmWr1fgRpV4=;
 b=nZ1yfvvBEVauaIUm6CWCjhBKeQTPpQ2poCGXC1idE5agGopvhFHWsthZRxXeoOS7mF
 QCro+pxUffUhWYkpEHU7lxz5qBL25pc9WlRW3y/JpXiixgMmMCrYPpmpV0kCD+9WDpXk
 CHtJ8gSs5JnY1Vpas55t4nQlDlF0tlg45+AeqPRfpKjOK8ug6M5cq5qx1Tduv98Wn604
 oXRmYU1sJSTA0pysVeCjoLL8nT8Q2hlKSmcmnEcRK8VlqqBgw9dU+ruwBiADo+6AAWuG
 rRYl/O8L9Cgo2uo7Dg24IDnh54SRiEo91Ub2JpN98dqj6ZR2ulHhVH+/PXCa2joue5hw
 zeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7OlubOQimkHngZ3g1RBEj6WP5pjIG24DCmWr1fgRpV4=;
 b=Rxdku4CwDlXD60YWuayjwI+k6oibZTWIol3EeopHkWrllIj3OOfBvxalGJL1KlneFJ
 IZgF0BUxKdMPcdaCk700mMYlcycXbzeXfmC94r5kVVXVxB/iA0uTHR23jiaS1CNfh8Mq
 y5h23tklIu/MKFr9FeairZg/FARzfKQzPIzmbq+t+rGL3Y7N8KzuC2MDjVHvfrXSAukw
 TeeN3//2083r+LSsaYn28XDEAzCX85fPYym2vcpSZybdHpdxJFwviQc1L3Mu/keirsEz
 +ZaO0SLusWs4BYUMDlICkosNskHz/Ps4biazU7G6K3wt6NF6i8WcQ5gQ4vzD5+CIgV6T
 ZdRQ==
X-Gm-Message-State: AGi0PuZYOy8UGusi8/g6CptZQvBgwhOTGJ20fPtvayft3z7fehsXg0q8
 8y7ig5/1nHuw6hwqvpVh7snWEevR
X-Google-Smtp-Source: APiQypKmMbiPEspZgw637P3B0JnA8nGTjsSkqOaDZXcxUAYOuSd4uNZaqhEN03ndr8DfDODQh5OL9A==
X-Received: by 2002:a63:2254:: with SMTP id t20mr340842pgm.121.1586236740636; 
 Mon, 06 Apr 2020 22:19:00 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:19:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 14/15] powerpc/64s: system reset do not trace
Date: Tue,  7 Apr 2020 15:16:35 +1000
Message-Id: <20200407051636.648369-15-npiggin@gmail.com>
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

Similarly to the previous patch, do not trace system reset. This code
is used when there is a crash or hang, and tracing disturbs the system
more and has been known to crash in the crash handling path.

Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 9f221772eb73..1beae89bb871 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -443,6 +443,9 @@ void system_reset_exception(struct pt_regs *regs)
 	unsigned long hsrr0, hsrr1;
 	bool nested = in_nmi();
 	bool saved_hsrrs = false;
+	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
+
+	this_cpu_set_ftrace_enabled(0);
 
 	/*
 	 * Avoid crashes in case of nested NMI exceptions. Recoverability
@@ -524,6 +527,8 @@ void system_reset_exception(struct pt_regs *regs)
 	if (!nested)
 		nmi_exit();
 
+	this_cpu_set_ftrace_enabled(ftrace_enabled);
+
 	/* What should we do here? We could issue a shutdown or hard reset. */
 }
 
-- 
2.23.0

