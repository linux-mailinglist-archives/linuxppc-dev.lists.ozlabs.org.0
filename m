Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 943902A1E3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 01:56:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459jvB6DTGzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 09:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="bKtwgdrk"; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459jlw12BczDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 09:50:04 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id g9so6182541pfo.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 16:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eaayBc92IMmJypjY+VABsd2ojMmm1ZzkUdujrOQbc5g=;
 b=bKtwgdrkqRsODjat6ojYHyBKdVvveA/eZWmIfkN9EasXwK9Os8rI42a213oMZywyrJ
 uQqACXEmiJkk4pse9iu30fuVl4njrGuVeGY+qNGodI9qLCrR7wmHRld8PBOzHPJpRXLn
 hVJS0T152ByGYPSSVahtJqoeq8R8jylKj9qpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eaayBc92IMmJypjY+VABsd2ojMmm1ZzkUdujrOQbc5g=;
 b=Xt0YiAVQsYQvF7i1veeWEIUAMMEH9ZyK5g+aStRNr8RWQXUUvxbd0OEuc8ZKJx/KnA
 OKB5HG9kiKE9tuNcR3cz3kQS/JbehlS4iNa5tlfKHzSxOyPUVJobngQw+2ozNmkd1b5B
 IwKPbq2j+6IRRLKCJuMaAa1HPQ0elNhHlGBEnCWzzGj0kaAXvcoyM504mCS55Aa9mosS
 +H4urh4z0kmBAB0nyg543iL4I8P5sc6fTr+BQiVuwqfqh6K7XXeQXs3wI6WNw/vCvACk
 S2N4SRsbriHgAI8vv5YZ3hPWaeRpSytrQK3KZ+9rI6j4qXa0ACNuUgKYdiQLMTJGto7v
 KmQw==
X-Gm-Message-State: APjAAAXaKTuopKVTBBrTLjdmIs5Ml6/oKwi0MPZnofyKqbfXf82fDqF5
 vE7lpBQz/k0jm6B1skw/AcXNyQ==
X-Google-Smtp-Source: APXvYqxnwdALM9KRFwXLedWKJxMEgotFtqy5TZBUssjnizX6ClUg18TxOqEWpFQcyOGvp5/8X0oLPg==
X-Received: by 2002:a17:90a:b296:: with SMTP id
 c22mr13322972pjr.28.1558741802356; 
 Fri, 24 May 2019 16:50:02 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id q4sm3297595pgb.39.2019.05.24.16.49.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 16:50:01 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 4/5] rculist: Remove hlist_for_each_entry_rcu_notrace
 since no users
Date: Fri, 24 May 2019 19:49:32 -0400
Message-Id: <20190524234933.5133-5-joel@joelfernandes.org>
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
itself.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .clang-format           |  1 -
 include/linux/rculist.h | 20 --------------------
 2 files changed, 21 deletions(-)

diff --git a/.clang-format b/.clang-format
index 2ffd69afc1a8..aa935923f5cb 100644
--- a/.clang-format
+++ b/.clang-format
@@ -287,7 +287,6 @@ ForEachMacros:
   - 'hlist_for_each_entry_from_rcu'
   - 'hlist_for_each_entry_rcu'
   - 'hlist_for_each_entry_rcu_bh'
-  - 'hlist_for_each_entry_rcu_notrace'
   - 'hlist_for_each_entry_safe'
   - '__hlist_for_each_rcu'
   - 'hlist_for_each_safe'
diff --git a/include/linux/rculist.h b/include/linux/rculist.h
index e91ec9ddcd30..0d3d77cf4f07 100644
--- a/include/linux/rculist.h
+++ b/include/linux/rculist.h
@@ -628,26 +628,6 @@ static inline void hlist_add_behind_rcu(struct hlist_node *n,
 		pos = hlist_entry_safe(rcu_dereference_raw(hlist_next_rcu(\
 			&(pos)->member)), typeof(*(pos)), member))
 
-/**
- * hlist_for_each_entry_rcu_notrace - iterate over rcu list of given type (for tracing)
- * @pos:	the type * to use as a loop cursor.
- * @head:	the head for your list.
- * @member:	the name of the hlist_node within the struct.
- *
- * This list-traversal primitive may safely run concurrently with
- * the _rcu list-mutation primitives such as hlist_add_head_rcu()
- * as long as the traversal is guarded by rcu_read_lock().
- *
- * This is the same as hlist_for_each_entry_rcu() except that it does
- * not do any RCU debugging or tracing.
- */
-#define hlist_for_each_entry_rcu_notrace(pos, head, member)			\
-	for (pos = hlist_entry_safe (rcu_dereference_raw_notrace(hlist_first_rcu(head)),\
-			typeof(*(pos)), member);			\
-		pos;							\
-		pos = hlist_entry_safe(rcu_dereference_raw_notrace(hlist_next_rcu(\
-			&(pos)->member)), typeof(*(pos)), member))
-
 /**
  * hlist_for_each_entry_rcu_bh - iterate over rcu list of given type
  * @pos:	the type * to use as a loop cursor.
-- 
2.22.0.rc1.257.g3120a18244-goog

