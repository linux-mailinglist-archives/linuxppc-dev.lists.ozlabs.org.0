Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1907660E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 22:47:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45l7RL0nfrzDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 06:47:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="BwhngOtO"; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45l7PL33N7zDqcH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 06:45:53 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id l21so3496499pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FAgMNOYOPvzfrhNLldHVb19fW7VpQgXrnLMhcZOOzzs=;
 b=BwhngOtO8Nu7zYAeNU/xva2uz2AnFZ9jfpv+3OHWnK+riarbVIlSWPdfB25P++KWpM
 QVxLEPUIHjMA+QqfkfkhctquS0azuY/r/ojtxpUWtUfoWtmq6qMLYBDzqHmuxtUJ30oy
 MTd0LwPXNYB62gu7TJfWJlr+m4tzWAaTOQACU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FAgMNOYOPvzfrhNLldHVb19fW7VpQgXrnLMhcZOOzzs=;
 b=aO9M6iYkbmA60G6oWYDvy4Q4jkOkBdNMi0fdnsJ/U1qIi8kwipz6Qw2GwUrm5y5e1E
 fOkY7xrhqZAYHR9AA8wtxukObHhCZxNiuj/1e8pNMFDNypw6Z2p52uMSxxMaAD87lC+j
 m8YaMwTFiYVi/DwiQNSsysmyPQxlPAqeY6F9xWQzMoEubaSlPAV5aAp6ZFCzLYLgKctx
 J/6j5t0TCELr7pRRnPcVA8R8AyjxTPaYwU57bYmOYX+yp9W6isSo5O/EfETTmEX715Np
 LHUX+e7IHdD/EHHXA/6fD7r2OuQK/skD7TV8FnHUiPm+Z7G7SS28Je6TrhS2jauSq8Qi
 tk9A==
X-Gm-Message-State: APjAAAXTI8IW9vMSm6HF/4m7N9avfu8FyesMgQSkOlCE/5GXazMOYWGj
 /Ia0FdGtjgFD+fAr5/EFfkA=
X-Google-Smtp-Source: APXvYqzwqFWG5FAS708qmjT7OvxwSnxErqOKN+3y3GLJgx3B9ybHEpj1LDsHWYbII1JJoa1at0PEqA==
X-Received: by 2002:a63:4d50:: with SMTP id n16mr6518323pgl.146.1562877951310; 
 Thu, 11 Jul 2019 13:45:51 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id f19sm9047502pfk.180.2019.07.11.13.45.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 13:45:50 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] treewide: Rename  rcu_dereference_raw_notrace to _check
Date: Thu, 11 Jul 2019 16:45:41 -0400
Message-Id: <20190711204541.28940-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
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
Cc: rcu@vger.kernel.org, kernel-team@android.com,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kvm-ppc@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 byungchul.park@lge.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The rcu_dereference_raw_notrace() API name is confusing.
It is equivalent to rcu_dereference_raw() except that it also does
sparse pointer checking.

There are only a few users of rcu_dereference_raw_notrace(). This
patches renames all of them to be rcu_dereference_raw_check with the
"check" indicating sparse checking.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

---
Previous discussion is here:
https://lore.kernel.org/linuxppc-dev/20190528200014.GV28207@linux.ibm.com/T/

 Documentation/RCU/Design/Requirements/Requirements.html | 2 +-
 arch/powerpc/include/asm/kvm_book3s_64.h                | 2 +-
 include/linux/rculist.h                                 | 4 ++--
 include/linux/rcupdate.h                                | 2 +-
 kernel/trace/ftrace_internal.h                          | 8 ++++----
 kernel/trace/trace.c                                    | 4 ++--
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.html b/Documentation/RCU/Design/Requirements/Requirements.html
index f04c467e55c5..467251f7fef6 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.html
+++ b/Documentation/RCU/Design/Requirements/Requirements.html
@@ -2514,7 +2514,7 @@ disabled across the entire RCU read-side critical section.
 <p>
 It is possible to use tracing on RCU code, but tracing itself
 uses RCU.
-For this reason, <tt>rcu_dereference_raw_notrace()</tt>
+For this reason, <tt>rcu_dereference_raw_check()</tt>
 is provided for use by tracing, which avoids the destructive
 recursion that could otherwise ensue.
 This API is also used by virtualization in some architectures,
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 21b1ed5df888..53388a311967 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -546,7 +546,7 @@ static inline void note_hpte_modification(struct kvm *kvm,
  */
 static inline struct kvm_memslots *kvm_memslots_raw(struct kvm *kvm)
 {
-	return rcu_dereference_raw_notrace(kvm->memslots[0]);
+	return rcu_dereference_raw_check(kvm->memslots[0]);
 }
 
 extern void kvmppc_mmu_debugfs_init(struct kvm *kvm);
diff --git a/include/linux/rculist.h b/include/linux/rculist.h
index e91ec9ddcd30..10aab1d2d471 100644
--- a/include/linux/rculist.h
+++ b/include/linux/rculist.h
@@ -642,10 +642,10 @@ static inline void hlist_add_behind_rcu(struct hlist_node *n,
  * not do any RCU debugging or tracing.
  */
 #define hlist_for_each_entry_rcu_notrace(pos, head, member)			\
-	for (pos = hlist_entry_safe (rcu_dereference_raw_notrace(hlist_first_rcu(head)),\
+	for (pos = hlist_entry_safe (rcu_dereference_raw_check(hlist_first_rcu(head)),\
 			typeof(*(pos)), member);			\
 		pos;							\
-		pos = hlist_entry_safe(rcu_dereference_raw_notrace(hlist_next_rcu(\
+		pos = hlist_entry_safe(rcu_dereference_raw_check(hlist_next_rcu(\
 			&(pos)->member)), typeof(*(pos)), member))
 
 /**
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 0c9b92799abc..e5161e377ad4 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -478,7 +478,7 @@ do {									      \
  * The no-tracing version of rcu_dereference_raw() must not call
  * rcu_read_lock_held().
  */
-#define rcu_dereference_raw_notrace(p) __rcu_dereference_check((p), 1, __rcu)
+#define rcu_dereference_raw_check(p) __rcu_dereference_check((p), 1, __rcu)
 
 /**
  * rcu_dereference_protected() - fetch RCU pointer when updates prevented
diff --git a/kernel/trace/ftrace_internal.h b/kernel/trace/ftrace_internal.h
index 0515a2096f90..0456e0a3dab1 100644
--- a/kernel/trace/ftrace_internal.h
+++ b/kernel/trace/ftrace_internal.h
@@ -6,22 +6,22 @@
 
 /*
  * Traverse the ftrace_global_list, invoking all entries.  The reason that we
- * can use rcu_dereference_raw_notrace() is that elements removed from this list
+ * can use rcu_dereference_raw_check() is that elements removed from this list
  * are simply leaked, so there is no need to interact with a grace-period
- * mechanism.  The rcu_dereference_raw_notrace() calls are needed to handle
+ * mechanism.  The rcu_dereference_raw_check() calls are needed to handle
  * concurrent insertions into the ftrace_global_list.
  *
  * Silly Alpha and silly pointer-speculation compiler optimizations!
  */
 #define do_for_each_ftrace_op(op, list)			\
-	op = rcu_dereference_raw_notrace(list);			\
+	op = rcu_dereference_raw_check(list);			\
 	do
 
 /*
  * Optimized for just a single item in the list (as that is the normal case).
  */
 #define while_for_each_ftrace_op(op)				\
-	while (likely(op = rcu_dereference_raw_notrace((op)->next)) &&	\
+	while (likely(op = rcu_dereference_raw_check((op)->next)) &&	\
 	       unlikely((op) != &ftrace_list_end))
 
 extern struct ftrace_ops __rcu *ftrace_ops_list;
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 2c92b3d9ea30..1d69110d9e5b 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2642,10 +2642,10 @@ static void ftrace_exports(struct ring_buffer_event *event)
 
 	preempt_disable_notrace();
 
-	export = rcu_dereference_raw_notrace(ftrace_exports_list);
+	export = rcu_dereference_raw_check(ftrace_exports_list);
 	while (export) {
 		trace_process_export(export, event);
-		export = rcu_dereference_raw_notrace(export->next);
+		export = rcu_dereference_raw_check(export->next);
 	}
 
 	preempt_enable_notrace();
-- 
2.22.0.410.gd8fdbe21b5-goog
