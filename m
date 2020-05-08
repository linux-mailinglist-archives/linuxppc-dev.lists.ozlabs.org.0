Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 770CF1CA272
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:55:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JJ131TfPzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:55:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kxveNw+9; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHYF0f1nzDqx2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:41 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id w65so285387pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Dvj1154LUnUmCjq1pN2uK8lS7C1jJuXOPqxrtLUvwM=;
 b=kxveNw+9sJyarSJFCsUY5MOAAA+MHezeBPPJg3R/HIF637nlnAkTcqyfNZgeUSaxHU
 sENx+y9d376LF+3htfij5a0GFESHUKZlCEqFWCtM0rxccwPszU/17RSh35ASKghKb+gn
 utpDp3pa7ydnBp6oxHX5zXKv8l2ci/ZKC/MzbiPOUto2m+dyVZzJIdF4sCR+4JfWJEPc
 XnIuNcqPfGqmzDLU7S9krLIW28qiHQlqTZvAsqjRESH6rSRm3Aq3/lRRpqHsph19EALW
 U8rX1chXfvcGerxjhjsYWzFJRGTbbrHbg7fZhSmGIMjW6jg1/MofwLH4n790JRZ3SLa0
 xXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Dvj1154LUnUmCjq1pN2uK8lS7C1jJuXOPqxrtLUvwM=;
 b=jHmQaapx6DeQkZt6qT9q7+6BNal7zmyGq/VDHmg6oWoXoffz16L0tbN15TjsH8XzGp
 TqiCdCpsAVE4OdcY+tGDbAOa9TiqjysuovO1xfaAriJ0bVoa1eo3f9fvet9a5CRLMPRC
 bfjVHdCFO3Uy21RQw9GsLZGqDjjskobr9EaimyFBvGM+GxUGOAA40dDyU0A7HOvZa+hO
 olfucplsG9RiLIWpQj4WMNqAL9cA/jkOh8San6tNr2dDDIEp5/HkZh5Dm6jB58+kjH6I
 LzFlPapmr0lHDg+hTEx2o5EcZc4WG6vyEBcenXP7yA264stJXmKomErgOAKOIiy+8Xtw
 YY2g==
X-Gm-Message-State: AGi0PuYGblvix4n2HrI/FJtH5FHYvJ8qDizowq4gOv2WgSEJ9NBug+2f
 8RPpi4T95HNXW5pBA7q/3nLyANkf
X-Google-Smtp-Source: APiQypLv7w6/Cmj7GenG6CviKfvcyl6bfviDEG6pxMTwTdiUDbFBSjSM8thEZOkAy0mUN6EYi6FDyg==
X-Received: by 2002:a62:3006:: with SMTP id w6mr847671pfw.29.1588912478684;
 Thu, 07 May 2020 21:34:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 09/16] powerpc/pseries: limit machine check stack to 4GB
Date: Fri,  8 May 2020 14:34:01 +1000
Message-Id: <20200508043408.886394-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows rtas_args to be put on the machine check stack, which
avoids a lot of complications with re-entrancy deadlocks.

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup_64.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 8105010b0e76..bb47555d48a2 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -711,7 +711,7 @@ void __init exc_lvl_early_init(void)
  */
 void __init emergency_stack_init(void)
 {
-	u64 limit;
+	u64 limit, mce_limit;
 	unsigned int i;
 
 	/*
@@ -728,7 +728,16 @@ void __init emergency_stack_init(void)
 	 * initialized in kernel/irq.c. These are initialized here in order
 	 * to have emergency stacks available as early as possible.
 	 */
-	limit = min(ppc64_bolted_size(), ppc64_rma_size);
+	limit = mce_limit = min(ppc64_bolted_size(), ppc64_rma_size);
+
+	/*
+	 * Machine check on pseries calls rtas, but can't use the static
+	 * rtas_args due to a machine check hitting while the lock is held.
+	 * rtas args have to be under 4GB, so the machine check stack is
+	 * limited to 4GB so args can be put on stack.
+	 */
+	if (firmware_has_feature(FW_FEATURE_LPAR) && mce_limit > SZ_4G)
+		mce_limit = SZ_4G;
 
 	for_each_possible_cpu(i) {
 		paca_ptrs[i]->emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
@@ -738,7 +747,7 @@ void __init emergency_stack_init(void)
 		paca_ptrs[i]->nmi_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
 
 		/* emergency stack for machine check exception handling. */
-		paca_ptrs[i]->mc_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
+		paca_ptrs[i]->mc_emergency_sp = alloc_stack(mce_limit, i) + THREAD_SIZE;
 #endif
 	}
 }
-- 
2.23.0

