Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CFE37712F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 12:17:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fcjt66D3Gz3cD2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 20:17:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VETU5Pmg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VETU5Pmg; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcjqn5zKJz2yxn
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 20:15:17 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so6812481pjn.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 May 2021 03:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ptlMcBDWcssXFzxYZbffEn+kF4lLgbECIyuV9dbqyUE=;
 b=VETU5PmgWqPT9wkHQwd2cTDCqWo/komATP7v841czInCv+jgXK0cxYzc1EmPQaDAmU
 M5uFfIdTq2p4oMqoTl6nsMpcFWsBrnqgA8vWEJvRKGMS+WS4UgUtwGbzLaqLVBwmOBxn
 dSMcb+bSuDUJSbNOzHADwXa6wn0pRzC/sWKaBjPz3cg8HseEwoPzMV501BL4n7EG8eVR
 xYUNq0s+bMJTZrdp6eyEVgq0s2a/oXEIUduB5pxRNbIglEfHGAo6gRaptrxNp4DyYv1n
 331uk4ps6cnXJ4QuGtoBa07VydHdz+3xzbcPTU+6OGLj7jZuXP4npKIx+thQL1S3jlIt
 tbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ptlMcBDWcssXFzxYZbffEn+kF4lLgbECIyuV9dbqyUE=;
 b=RPbr7+J8YKQv5VuLt+wYhZSxkhFwGdsVa1n3zDi0Pg78eHrA2V+oKWz/8pYw3sIMk6
 72BPyYeX/BUcQoDs+y/br7qq/J4VMS1CRk+6CSm7f33K0bImNFB9pH0VXBGvB++1U6Vl
 yuaiY8DdnNpBPxZz4jNipo5NtWV/aDIOyWuWOXLbM6I+G6OWvqU/MzU4OLffaX5Qj6wk
 F7ri+HhNomq3JztyIoysBVNTdkywf+vy3zKfWaCBMU8HR7Z5CjVLD7Fj4V56iCk67Kqc
 cGsNI4spqW2BpH3Sb5qQwYdL6YflPVU4A0/gsAFOwwRvJl6QBxD4J/Y0Xlw8D774oTdJ
 hSuw==
X-Gm-Message-State: AOAM532GJqwsA2PTZ8WZQZHG5qpvxSdObwJ+2j9svBejZsxgUNdRdird
 qhxa4iXQmV4CaBtw3gIBkQPtKfe7FRABTQ==
X-Google-Smtp-Source: ABdhPJxBxbxD102H8yGDvvJLFY48fiTDQmiaSWB9TXOBd+4NEVv8dQlQH946DbbDkGEmjJiGVC2c0w==
X-Received: by 2002:a17:902:b487:b029:ee:d04b:741e with SMTP id
 y7-20020a170902b487b02900eed04b741emr14293651plr.45.1620468915047; 
 Sat, 08 May 2021 03:15:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id
 c13sm6608465pfl.212.2021.05.08.03.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 03:15:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/pseries: warn if recursing into the hcall
 tracing code
Date: Sat,  8 May 2021 20:14:55 +1000
Message-Id: <20210508101455.1578318-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210508101455.1578318-1-npiggin@gmail.com>
References: <20210508101455.1578318-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hcall tracing code has a recursion check built in, which skips
tracing if we are already tracing an hcall.

However if the tracing code has problems with recursion, this check
may not catch all cases because the tracing code could be invoked from
a different tracepoint first, then make an hcall that gets traced,
then recurse.

Add an explicit warning if recursion is detected here, which might help
to notice tracing code making hcalls. Really the core trace code should
have its own recursion checking and warnings though.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index ad1cec80019b..dab356e3ff87 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1829,8 +1829,14 @@ void hcall_tracepoint_unregfunc(void)
 #endif
 
 /*
- * Since the tracing code might execute hcalls we need to guard against
- * recursion.
+ * Keep track of hcall tracing depth and prevent recursion. Warn if any is
+ * detected because it may indicate a problem. This will not catch all
+ * problems with tracing code making hcalls, because the tracing might have
+ * been invoked from a non-hcall, so the first hcall could recurse into it
+ * without warning here, but this better than nothing.
+ *
+ * Hcalls with specific problems being traced should use the _notrace
+ * plpar_hcall variants.
  */
 static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
 
@@ -1844,7 +1850,7 @@ notrace void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
 
 	depth = this_cpu_ptr(&hcall_trace_depth);
 
-	if (*depth)
+	if (WARN_ON_ONCE(*depth))
 		goto out;
 
 	(*depth)++;
@@ -1865,7 +1871,7 @@ notrace void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
 
 	depth = this_cpu_ptr(&hcall_trace_depth);
 
-	if (*depth)
+	if (*depth) /* Don't warn again on the way out */
 		goto out;
 
 	(*depth)++;
-- 
2.23.0

