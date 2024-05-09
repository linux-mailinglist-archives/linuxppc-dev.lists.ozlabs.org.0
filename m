Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 541228C0F67
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 14:14:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qJ1ttwQd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZrXp6VbBz3cXT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:14:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qJ1ttwQd;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZrWK3NnSz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 22:13:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715256775;
	bh=GHM7zbxjekKZu/Ju7+Yc/8jFjUk5nREng5nvUO7nR2c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qJ1ttwQdEky2Wj9/KgeS4VSZ5WztPv+M1yY2+2v9aXo9qMi9r09cQkTey46e9Z1Ck
	 XTCyc39bpvyFMRw+dTzeIT9dkqop45ib4mP18zQaeeDPKie1Bk3YjmnrV/XZ6EgJpp
	 v05WXaOfWbD5m6Co0qjlAQmIXn9zfE8EQOnS+P+G9pqgPUrtGN9DZ+zYcnbpOjjHMs
	 YLTrrPByKAvSb7zs2Lw8zgnlhkUpUpZf4xoZKGpe5iLftVls1evwUxzVYRZyFa/mZ5
	 So2cCTGLlf+OBA8FkakOfOqRljMdKiXutg//bfFsLFIzxkUuLMQkI7PGGykjbPfjbo
	 muV21Uvu/ji6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZrWC0L6Qz4wx6;
	Thu,  9 May 2024 22:12:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] powerpc: Check only single values are passed to CPU/MMU feature checks
Date: Thu,  9 May 2024 22:12:48 +1000
Message-ID: <20240509121248.270878-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509121248.270878-1-mpe@ellerman.id.au>
References: <20240509121248.270878-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpu_has_feature()/mmu_has_feature() are only able to check a single
feature at a time, but there is no enforcement of that.

In fact, as fixed in the previous commit, there was code that was
passing multiple values to cpu_has_feature().

So add a check that only a single feature is passed using popcount.

Note that the test allows 0 or 1 bits to be set, because some code
relies on cpu_has_feature(0) being false, the check with
CPU_FTRS_POSSIBLE ensures that. See for example CPU_FTR_PPC_LE.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/cpu_has_feature.h | 1 +
 arch/powerpc/include/asm/mmu.h             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/cpu_has_feature.h b/arch/powerpc/include/asm/cpu_has_feature.h
index 92e24e979954..bf8a228229fa 100644
--- a/arch/powerpc/include/asm/cpu_has_feature.h
+++ b/arch/powerpc/include/asm/cpu_has_feature.h
@@ -25,6 +25,7 @@ static __always_inline bool cpu_has_feature(unsigned long feature)
 	int i;
 
 	BUILD_BUG_ON(!__builtin_constant_p(feature));
+	BUILD_BUG_ON(__builtin_popcountl(feature) > 1);
 
 #ifdef CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
 	if (!static_key_feature_checks_initialized) {
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 4ab9a630d943..eb3065692055 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -247,6 +247,7 @@ static __always_inline bool mmu_has_feature(unsigned long feature)
 	int i;
 
 	BUILD_BUG_ON(!__builtin_constant_p(feature));
+	BUILD_BUG_ON(__builtin_popcountl(feature) > 1);
 
 #ifdef CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
 	if (!static_key_feature_checks_initialized) {
-- 
2.45.0

