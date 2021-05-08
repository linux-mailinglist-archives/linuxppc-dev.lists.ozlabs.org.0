Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3865A37712D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 12:16:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fcjsg1Gstz3c6l
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 20:16:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=i9Gwv32K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i9Gwv32K; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcjqm45hJz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 20:15:15 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id q2so9605076pfh.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 May 2021 03:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47dtV0p1hDQzmotJEM9FsCDKV3pF4kc+R1B3JOoTTnk=;
 b=i9Gwv32KUw4GUcjjthGbwpkM4F6UmpzthGDmGvFoMko8AI9GvMS++hPvqDlNPsAruu
 dygxTreHLYV47BC8nAgJ8S6DdcMdeMw/nZyNVnvmeV7hRRnn8gBFISLO+ZJ9xFPXFfaU
 rzxcz1plCMKh2mpHaBLpCmgCb0Qra+DMDVnH6bhj4i7J5IY+Ze/yxvR5SS4+UizbCLTz
 k8/OvDsKCpSBpg5h01PQoTtAkMwBJ8k+RjJWqOMuFL9SOVKwKHD1JjTxJMG0qufZkB7P
 jIq6TJDjAlyjv18CBn1RGnjAkLJYB2HWFyIqE+aj/0ulh95OjeGKFlf1xDy4YCqBe2oG
 MK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47dtV0p1hDQzmotJEM9FsCDKV3pF4kc+R1B3JOoTTnk=;
 b=T+yIbQHkC/nK93HGEkDzVyfYOPevS0Bcz/3BI7EvJ0TZ4WyjJXmO7SRidKap52HtHE
 mkwbf4/9WauJbK9+z3bYIpXOoMWYv9ukblP/f26j/BnxuYQ4EQ2UfcyfKVPV1gg0dg5r
 eRkh9rlqBbZXerUfPUoNySQZQUFhd893sr0Obgsby7Kp5ii++aEom2PVQKM8EsSLhohe
 bZTCcB6aHDTmXVuTILrEevCG/7aIM3WxYcqG6RkuuxPMReqecyUR1lk/S/3XfuTGZaYJ
 V+CVawB5sfEFVsgCSczfKInsS0qIyg7K9S6pMb9XT+Y7uuFkv8q1KuimHxLYKsoXs4Zm
 azng==
X-Gm-Message-State: AOAM531TH9+cCL0ZBgMeq5dCfyP2aKMNGQoia3B5XwNPb+rKPTtykz0I
 dlZpg8GdhdadeO8tJkqTwXNSuf3ROn2lkA==
X-Google-Smtp-Source: ABdhPJwL6uwyuR6YrJKKYXY/12cecGLgy3Sqm8+pUXyyVUYISrHNtBSj/Q6YsJh9HeTWt0nhO0tnpQ==
X-Received: by 2002:a63:fb4c:: with SMTP id w12mr14654333pgj.337.1620468912988; 
 Sat, 08 May 2021 03:15:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id
 c13sm6608465pfl.212.2021.05.08.03.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 03:15:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/pseries: use notrace hcall variant for H_CEDE
 idle
Date: Sat,  8 May 2021 20:14:54 +1000
Message-Id: <20210508101455.1578318-4-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than special-case H_CEDE in the hcall trace wrappers, make the
idle H_CEDE call use plpar_hcall_norets_notrace().

Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h |  6 +++++-
 arch/powerpc/platforms/pseries/lpar.c     | 10 ----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index ece84a430701..83e0f701ebc6 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -28,7 +28,11 @@ static inline void set_cede_latency_hint(u8 latency_hint)
 
 static inline long cede_processor(void)
 {
-	return plpar_hcall_norets(H_CEDE);
+	/*
+	 * We cannot call tracepoints inside RCU idle regions which
+	 * means we must not trace H_CEDE.
+	 */
+	return plpar_hcall_norets_notrace(H_CEDE);
 }
 
 static inline long extended_cede_processor(unsigned long latency_hint)
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index d79d7410c320..ad1cec80019b 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1840,13 +1840,6 @@ notrace void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
 	unsigned long flags;
 	unsigned int *depth;
 
-	/*
-	 * We cannot call tracepoints inside RCU idle regions which
-	 * means we must not trace H_CEDE.
-	 */
-	if (opcode == H_CEDE)
-		return;
-
 	local_irq_save(flags);
 
 	depth = this_cpu_ptr(&hcall_trace_depth);
@@ -1868,9 +1861,6 @@ notrace void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
 	unsigned long flags;
 	unsigned int *depth;
 
-	if (opcode == H_CEDE)
-		return;
-
 	local_irq_save(flags);
 
 	depth = this_cpu_ptr(&hcall_trace_depth);
-- 
2.23.0

