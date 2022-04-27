Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A7E5128FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpdcQ4dwdz3f2m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:40:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Dl2B7pSV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Dl2B7pSV; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpYwc3g2Tz2yXf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 08:54:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oI9b5duO8OJ5vQDZCcg8/YSfwN8M5sfdHxH8XUnmtlk=; b=Dl2B7pSVJp25fe7IfIs24mmkq8
 hNWQZdfuE5b8NzwyHqbjR/6C1jbxbEv8wNNcNdcZK+x2mWiNzNr+u6ej0RkZPoYhNEHBCsZ6UD+6G
 UKVT1x0W1ctGqUC1Gq0pKfbBSIn3/AQDQpBwhuyH0wupCzlBVEy+S+oaSi7mTGACgenSYzi35Memm
 cwNrE6VLPhA8HIa6SL7ijwVZV/Cmf5guYFGY1etNEWb16ALz0OIjrK84zUZZaRulPOC47prAFsrmC
 8jtFSnfk5SwoqCho0RbgOB8YFry+V3AQ6FT8GxIeK9uuEGFeYv+qjRy2g8pgwIU4Wj4/dnNONMvQE
 5U+RG0NQ==;
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqYG-0002IR-Ki; Thu, 28 Apr 2022 00:54:29 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org
Subject: [PATCH 18/30] notifier: Show function names on notifier routines if
 DEBUG_NOTIFIERS is set
Date: Wed, 27 Apr 2022 19:49:12 -0300
Message-Id: <20220427224924.592546-19-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Apr 2022 11:34:03 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, Valentin Schneider <valentin.schneider@arm.com>,
 vgoyal@redhat.com, Xiaoming Ni <nixiaoming@huawei.com>,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 senozhatsky@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com,
 Arjan van de Ven <arjan@linux.intel.com>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, gpiccoli@igalia.com, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we have a debug infrastructure in the notifiers file, but
it's very simple/limited. This patch extends it by:

(a) Showing all registered/unregistered notifiers' callback names;

(b) Adding a dynamic debug tuning to allow showing called notifiers'
function names. Notice that this should be guarded as a tunable since
it can flood the kernel log buffer.

Cc: Arjan van de Ven <arjan@linux.intel.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---

We have some design decisions that worth discussing here:

(a) First of call, using C99 helps a lot to write clear and concise code, but
due to commit 4d94f910e79a ("Kbuild: use -Wdeclaration-after-statement") we
have a warning if mixing variable declarations with code. For this patch though,
doing that makes the code way clear, so decision was to add the debug code
inside brackets whenever this warning pops up. We can change that, but that'll
cause more ifdefs in the same function.

(b) In the symbol lookup helper function, we modify the parameter passed but
even more, we return it as well! This is unusual and seems unnecessary, but was
the strategy taken to allow embedding such function in the pr_debug() call.

Not doing that would likely requiring 3 symbol_name variables to avoid
concurrency (registering notifier A while calling notifier B) - we rely in
local variables as a serialization mechanism.

We're open for suggestions in case this design is not appropriate;
thanks in advance!

 kernel/notifier.c | 48 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/kernel/notifier.c b/kernel/notifier.c
index ba005ebf4730..21032ebcde57 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -7,6 +7,22 @@
 #include <linux/vmalloc.h>
 #include <linux/reboot.h>
 
+#ifdef CONFIG_DEBUG_NOTIFIERS
+#include <linux/kallsyms.h>
+
+/*
+ *	Helper to get symbol names in case DEBUG_NOTIFIERS is set.
+ *	Return the modified parameter is a strategy used to achieve
+ *	the pr_debug() functionality - with this, function is only
+ *	executed if the dynamic debug tuning is effectively set.
+ */
+static inline char *notifier_name(struct notifier_block *nb, char *sym_name)
+{
+	lookup_symbol_name((unsigned long)(nb->notifier_call), sym_name);
+	return sym_name;
+}
+#endif
+
 /*
  *	Notifier list for kernel code which wants to be called
  *	at shutdown. This is used to stop any idling DMA operations
@@ -34,20 +50,41 @@ static int notifier_chain_register(struct notifier_block **nl,
 	}
 	n->next = *nl;
 	rcu_assign_pointer(*nl, n);
+
+#ifdef CONFIG_DEBUG_NOTIFIERS
+	{
+		char sym_name[KSYM_NAME_LEN];
+
+		pr_info("notifiers: registered %s()\n",
+			notifier_name(n, sym_name));
+	}
+#endif
 	return 0;
 }
 
 static int notifier_chain_unregister(struct notifier_block **nl,
 		struct notifier_block *n)
 {
+	int ret = -ENOENT;
+
 	while ((*nl) != NULL) {
 		if ((*nl) == n) {
 			rcu_assign_pointer(*nl, n->next);
-			return 0;
+			ret = 0;
+			break;
 		}
 		nl = &((*nl)->next);
 	}
-	return -ENOENT;
+
+#ifdef CONFIG_DEBUG_NOTIFIERS
+	if (!ret) {
+		char sym_name[KSYM_NAME_LEN];
+
+		pr_info("notifiers: unregistered %s()\n",
+			notifier_name(n, sym_name));
+	}
+#endif
+	return ret;
 }
 
 /**
@@ -80,6 +117,13 @@ static int notifier_call_chain(struct notifier_block **nl,
 			nb = next_nb;
 			continue;
 		}
+
+		{
+			char sym_name[KSYM_NAME_LEN];
+
+			pr_debug("notifiers: calling %s()\n",
+				 notifier_name(nb, sym_name));
+		}
 #endif
 		ret = nb->notifier_call(nb, val, v);
 
-- 
2.36.0

