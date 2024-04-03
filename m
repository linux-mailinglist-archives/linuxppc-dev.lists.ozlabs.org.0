Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9268968E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 10:38:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SktBCRLg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8dSg2vJfz3dRJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 19:38:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SktBCRLg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8dQW6rl4z3cRB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 19:36:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70F51CE0B41;
	Wed,  3 Apr 2024 08:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644E4C43390;
	Wed,  3 Apr 2024 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712133409;
	bh=NcgyYQV67A3Wkz76rlcvIBmlCtK4h4fi02O922grya8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SktBCRLgWIKOw1NPBJU3nezy4hH8zJjRtHY6PJ+L48ddnc0fhtcrlEV3/blZtFWTk
	 oX2ngWCmQvGDcz2inKNGq2LCYbJhyZYF1Pa/D1iyzE0zpHX8Fv/O7SHSk5mM+5ymun
	 z6PB1YVolWM+qAnVwXC+gEstlv0sKACyWerLJ4aown0TpdlkeBZu/cjAcw5x/z12XO
	 LWmJyftnroNXjavF2ojxE7RLEgwa/sAmlhYGKrDr69y9xP4LrSuH6bZxwFAMA6SJ+J
	 MpDEUtx9eO1V+d+9s173KBiwpaT5i8b9A1KZ3sgMuvZVEtt5pqfJTjV5VsAikp3wrq
	 FkcRipGK3jo2Q==
From: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 3/3] powerpc/mm: Update the memory limit based on direct mapping restrictions
Date: Wed,  3 Apr 2024 14:06:11 +0530
Message-ID: <20240403083611.172833-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403083611.172833-1-aneesh.kumar@kernel.org>
References: <20240403083611.172833-1-aneesh.kumar@kernel.org>
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
Cc: "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, Naveen N Rao <naveen@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

memory limit value specified by the user are further updated such that
the value is 16MB aligned. This is because hash translation mode use
16MB as direct mapping page size. Make sure we update the global
variable 'memory_limit' with the 16MB aligned value such that all kernel
components will see the new aligned value of the memory limit.

Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
---
 arch/powerpc/kernel/prom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 7451bedad1f4..b8f764453eaa 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -779,7 +779,6 @@ static inline void save_fscr_to_task(void) {}
 
 void __init early_init_devtree(void *params)
 {
-	phys_addr_t limit;
 
 	DBG(" -> early_init_devtree(%px)\n", params);
 
@@ -850,8 +849,8 @@ void __init early_init_devtree(void *params)
 		memory_limit = 0;
 
 	/* Align down to 16 MB which is large page size with hash page translation */
-	limit = ALIGN_DOWN(memory_limit ?: memblock_phys_mem_size(), SZ_16M);
-	memblock_enforce_memory_limit(limit);
+	memory_limit = ALIGN_DOWN(memory_limit ?: memblock_phys_mem_size(), SZ_16M);
+	memblock_enforce_memory_limit(memory_limit);
 
 #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_4K_PAGES)
 	if (!early_radix_enabled())
-- 
2.44.0

