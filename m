Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB51F34AE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:13:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1Yk5ZtmzDr3m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:13:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n2ft2lV6; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0JL6wHpzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:16:50 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bh7so7613534plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 23:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4IXEINXdNzTPGUhU9F4Y8RAOkt5tBRqM+udEagmeaI=;
 b=n2ft2lV6wXksFoOndSUnerJ45T0g9Txl2fxdMsZn0f4m1t5WLuG83PKAQnVgHxLRn1
 AioEJlDvT5QzppdQ8paPkg0cR9oFwqB1/UPAZ66NAR8JyLNz5l/yzkbQ9trFJ8o71q9I
 j/f+qqEd8SZPaojtwLYuj2xO+EtSR4vsCiq7jcA/pjnXJp+ccLzFVQSqj2Ng1OLZLuDo
 xAov/GzCai3sWRsCQ1iNg6wNfD9n8PZt+Q6QqpJgLbds+qsRePVklXDAHfv5VewDbmGe
 SxdRJXhfB62wQGI5/8z6n6YRerq4TSAGySCFLXNNIUa2LzS4PebdNVVSapk9wYNoFY2S
 +upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4IXEINXdNzTPGUhU9F4Y8RAOkt5tBRqM+udEagmeaI=;
 b=RQ9Sdayuk7z6kuOgB2rRvirFvxj544oGWE88WPSHViRB/0cPsIVJyud8iqvHUpYd0c
 cLxXUX5Lop/6z58cSx/99RxaH+W+TXw7wvQ6mqTqxKTcbcGmBQVmdlDD7oTrsYRnDuz5
 mgPzFF3zd5dwY631SxQ8Z4IS3S6ER+wqsCiRL5rkV6yP4PEm2LRVd5FhTZkXOaNZSlB9
 8KkkyTHHLKj965uwSTlMw/wJLoXSV1rzDQJunvhNmbr9dZ2h/9V/AcOD8aJGPERfsiM1
 xCdzTQnElJqGfHSjoFv3vDzvhsRIoY7oFb7KDZ8EuBi6QmrM/WarjsYEvsWbuE5kwbq3
 jEAA==
X-Gm-Message-State: AOAM5332fcoB5rvGZUOLbWbsh6D/2TH7I70N+R0v8sTILPQpRiVFE8AL
 X0LFM97GCTc2LLX6yW1uzZM=
X-Google-Smtp-Source: ABdhPJwxxvbqx7vcIBmjLZDq4XmC1MtyrrGO9dh6sNz/yGz79dPpvPPnjbQy7hco2NNIkaInLjw4kQ==
X-Received: by 2002:a17:90b:915:: with SMTP id
 bo21mr3101498pjb.52.1591683407733; 
 Mon, 08 Jun 2020 23:16:47 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id k12sm7567981pgm.11.2020.06.08.23.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 23:16:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 2/7] powerpc/security: change link stack flush state to the
 flush type enum
Date: Tue,  9 Jun 2020 16:16:26 +1000
Message-Id: <20200609061631.844390-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200609061631.844390-1-npiggin@gmail.com>
References: <20200609061631.844390-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prepare to allow for hardware link stack flushing by using the
none/sw/hw type, same as the count cache state.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/security.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index df2a3eff950b..28f4cb062f69 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -27,7 +27,7 @@ enum branch_cache_flush_type {
 	BRANCH_CACHE_FLUSH_HW	= 0x4,
 };
 static enum branch_cache_flush_type count_cache_flush_type = BRANCH_CACHE_FLUSH_NONE;
-static bool link_stack_flush_enabled;
+static enum branch_cache_flush_type link_stack_flush_type = BRANCH_CACHE_FLUSH_NONE;
 
 bool barrier_nospec_enabled;
 static bool no_nospec;
@@ -219,7 +219,7 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr, c
 		if (ccd)
 			seq_buf_printf(&s, "Indirect branch cache disabled");
 
-		if (link_stack_flush_enabled)
+		if (link_stack_flush_type == BRANCH_CACHE_FLUSH_SW)
 			seq_buf_printf(&s, ", Software link stack flush");
 
 	} else if (count_cache_flush_type != BRANCH_CACHE_FLUSH_NONE) {
@@ -228,7 +228,7 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr, c
 		if (count_cache_flush_type == BRANCH_CACHE_FLUSH_HW)
 			seq_buf_printf(&s, " (hardware accelerated)");
 
-		if (link_stack_flush_enabled)
+		if (link_stack_flush_type == BRANCH_CACHE_FLUSH_SW)
 			seq_buf_printf(&s, ", Software link stack flush");
 
 	} else if (btb_flush_enabled) {
@@ -447,7 +447,7 @@ static void toggle_branch_cache_flush(bool enable)
 				       ppc_inst(PPC_INST_NOP));
 #endif
 		pr_info("link-stack-flush: software flush disabled.\n");
-		link_stack_flush_enabled = false;
+		link_stack_flush_type = BRANCH_CACHE_FLUSH_NONE;
 		no_count_cache_flush();
 		return;
 	}
@@ -463,7 +463,7 @@ static void toggle_branch_cache_flush(bool enable)
 #endif
 
 	pr_info("link-stack-flush: software flush enabled.\n");
-	link_stack_flush_enabled = true;
+	link_stack_flush_type = BRANCH_CACHE_FLUSH_SW;
 
 	// If we just need to flush the link stack, patch an early return
 	if (!security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE)) {
-- 
2.23.0

