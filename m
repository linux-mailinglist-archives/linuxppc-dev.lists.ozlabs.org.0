Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB1512904
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpdgv4Hwgz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:43:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=My7iXYZd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=My7iXYZd; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpYyR3wl5z3bWm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 08:56:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=durrkKWmzUfzH9qHOG14tQL4R8NCjUjLsTL3Zd00Gek=; b=My7iXYZdsvmohLkJmMGImfYof2
 p5qkpSJIhXISH+Sbyoj7EeJcOzhmrD5DtjdC6ethktkBlGYO4OfumrpixOUOKLn0Yc0W3TzG54aQY
 qwtzEOPADTIziH/itInY9Ffg69Sdqh65llZVZNXQlNolBLE2NFdio5E/kUq6oVXX/i2DBK4KweBxr
 JYm/gjauE4ZVcDNk28sbO0j6B73HXBblZWGmkswBaL+iIGNqLKObr06z5uxWmvVGTIOTQmQ/deHWL
 LutJobNbiLmganjaFUa+PvHzE64AyIeADEi0jWz8oHx43nzynoDLyNtzoi4XrtuDHAtIno5r39V8q
 Qw3pgkkw==;
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqZo-0002Om-0k; Thu, 28 Apr 2022 00:56:04 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org
Subject: [PATCH 23/30] printk: kmsg_dump: Introduce helper to inform number of
 dumpers
Date: Wed, 27 Apr 2022 19:49:17 -0300
Message-Id: <20220427224924.592546-24-gpiccoli@igalia.com>
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
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 senozhatsky@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, gpiccoli@igalia.com, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we don't have a way to check if there are dumpers set,
except counting the list members maybe. This patch introduces a very
simple helper to provide this information, by just keeping track of
registered/unregistered kmsg dumpers. It's going to be used on the
panic path in the subsequent patch.

Notice that the spinlock guarding kmsg_dumpers list also guards
increment/decrement of the dumper's counter, but there's no need
for that when reading the counter in the panic path, since that is
an atomic path and there's no other (planned) user.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 include/linux/kmsg_dump.h |  7 +++++++
 kernel/printk/printk.c    | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 906521c2329c..abea1974bff8 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -65,6 +65,8 @@ bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 
 void kmsg_dump_rewind(struct kmsg_dump_iter *iter);
 
+bool kmsg_has_dumpers(void);
+
 int kmsg_dump_register(struct kmsg_dumper *dumper);
 
 int kmsg_dump_unregister(struct kmsg_dumper *dumper);
@@ -91,6 +93,11 @@ static inline void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
 {
 }
 
+static inline bool kmsg_has_dumpers(void)
+{
+	return false;
+}
+
 static inline int kmsg_dump_register(struct kmsg_dumper *dumper)
 {
 	return -EINVAL;
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index da03c15ecc89..e3a1c429fbbc 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3399,6 +3399,18 @@ EXPORT_SYMBOL(printk_timed_ratelimit);
 
 static DEFINE_SPINLOCK(dump_list_lock);
 static LIST_HEAD(dump_list);
+static int num_dumpers;
+
+/**
+ * kmsg_has_dumpers - inform if there is any kmsg dumper registered.
+ *
+ * Returns true if there's at least one registered dumper, or false
+ * if otherwise.
+ */
+bool kmsg_has_dumpers(void)
+{
+	return num_dumpers ? true : false;
+}
 
 /**
  * kmsg_dump_register - register a kernel log dumper.
@@ -3423,6 +3435,7 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
 		dumper->registered = 1;
 		list_add_tail_rcu(&dumper->list, &dump_list);
 		err = 0;
+		num_dumpers++;
 	}
 	spin_unlock_irqrestore(&dump_list_lock, flags);
 
@@ -3447,6 +3460,7 @@ int kmsg_dump_unregister(struct kmsg_dumper *dumper)
 		dumper->registered = 0;
 		list_del_rcu(&dumper->list);
 		err = 0;
+		num_dumpers--;
 	}
 	spin_unlock_irqrestore(&dump_list_lock, flags);
 	synchronize_rcu();
-- 
2.36.0

