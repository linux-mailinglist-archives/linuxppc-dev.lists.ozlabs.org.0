Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92C2A1E6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 01:57:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459jwR6KltzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 09:57:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="ExaDqp0k"; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459jlz162TzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 09:50:07 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d126so4001893pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 16:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4IUQP+uKyCN66rRAguQBd+uSI/nPEDtpoZNPuNABz7k=;
 b=ExaDqp0kDit6EEuSOcT+FAdLJsr3wasxUTshDnisEPTxiqbsM/iwHBlK5jmEac4uTx
 1WrmYkFMfBW8Hthn8w/kr+CT1si+DUZOuwzHNsk8UBPZv3PhzihaZaVz4saSEqQb9A8/
 P62/INsuK+8WFv0NR63C1VMqjfsXLMIYivmZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4IUQP+uKyCN66rRAguQBd+uSI/nPEDtpoZNPuNABz7k=;
 b=dTv2O6BvnMD2kBme3L1L3HahFMowqNnaHXgRkJni9vpk8Cjml+LlcZVFEPDBhTHotG
 V2JU019CED/oCLLLlg3Ai84xj7xL9GLySvV0ogz8BWzHgmADOq9VEeDFwNlewkqtuXdn
 vGD1W7S+UskZ2VbHps4TFO30W9O0tYAPYukm9Pn1FsBg/rLiLenj/QygiQGP4Mx6cFKY
 1KfK+LGvz9p/k1e9CczNxwj8nc/xUBTakNB7QW35Nv2B9hw/hJEXGNxd+zhs0bqbOb8j
 3SEHdAIM6qRFRlHpap97hOjzKfTAaxRMrzFWQktVSzt5kxwvnegaJpd6cJYRICVS9N0W
 mHQA==
X-Gm-Message-State: APjAAAW8VkBnJ+frEoOHynQNYbqQ2YPaKK6zaWTDnb+ToJ7ZIagk5euu
 u3tyWC0gfGNxUyAhJFbJFiS8Sew9Rw3Jwg==
X-Google-Smtp-Source: APXvYqxNGBpXom3Ado94lkiXFHwXNMChLcccb7ZkYxRn6dsfk/n65WIEwwfbkGKCqFKqFYilSX8ODw==
X-Received: by 2002:a17:90a:372a:: with SMTP id
 u39mr12987526pjb.19.1558741804955; 
 Fri, 24 May 2019 16:50:04 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id q4sm3297595pgb.39.2019.05.24.16.50.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 16:50:04 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 5/5] rcu: Remove rcu_dereference_raw_notrace since no users
Date: Fri, 24 May 2019 19:49:33 -0400
Message-Id: <20190524234933.5133-6-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524234933.5133-1-joel@joelfernandes.org>
References: <20190524234933.5133-1-joel@joelfernandes.org>
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
Cc: rcu@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The series removes all users of the API and with this patch, the API
itself. Also fix documentation.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/Design/Requirements/Requirements.html | 6 +++---
 include/linux/rcupdate.h                                | 9 ---------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.html b/Documentation/RCU/Design/Requirements/Requirements.html
index 5a9238a2883c..9727278893e6 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.html
+++ b/Documentation/RCU/Design/Requirements/Requirements.html
@@ -2512,9 +2512,9 @@ disabled across the entire RCU read-side critical section.
 <p>
 It is possible to use tracing on RCU code, but tracing itself
 uses RCU.
-For this reason, <tt>rcu_dereference_raw_notrace()</tt>
-is provided for use by tracing, which avoids the destructive
-recursion that could otherwise ensue.
+This is the other reason for using, <tt>rcu_dereference_raw()</tt>,
+for use by tracing, which avoids the destructive recursion that could
+otherwise ensue.
 This API is also used by virtualization in some architectures,
 where RCU readers execute in environments in which tracing
 cannot be used.
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 922bb6848813..f917a27fc115 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -472,15 +472,6 @@ static inline void rcu_preempt_sleep_check(void) { }
 	__rcu_dereference_check((p), (c) || rcu_read_lock_sched_held(), \
 				__rcu)
 
-/*
- * The tracing infrastructure traces RCU (we want that), but unfortunately
- * some of the RCU checks causes tracing to lock up the system.
- *
- * The no-tracing version of rcu_dereference_raw() must not call
- * rcu_read_lock_held().
- */
-#define rcu_dereference_raw_notrace(p) __rcu_dereference_check((p), 1, __rcu)
-
 /**
  * rcu_dereference_protected() - fetch RCU pointer when updates prevented
  * @p: The pointer to read, prior to dereferencing
-- 
2.22.0.rc1.257.g3120a18244-goog

