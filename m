Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF2C8968D6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 10:37:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YCdQNNhh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8dR56tMyz3vXm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 19:37:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YCdQNNhh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8dQP6jJWz3bpd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 19:36:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F264CE20A1;
	Wed,  3 Apr 2024 08:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9D3C43390;
	Wed,  3 Apr 2024 08:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712133403;
	bh=DQ/HLFLCkqXuc3HsNjujPyYcyUVszUlp8aG6xh+p57c=;
	h=From:To:Cc:Subject:Date:From;
	b=YCdQNNhhf/moc8VMq/oT5AUcTtZGt6h4n1JUrn5Z9nNCs3baGxhoxRVRkuiPeduXr
	 HLaAAQO2awNPuf0q3RUitQdOjNCiJhDZgro2fgK7+EkmI/sf2R9zST0KXQcm9gSHOM
	 YwU0N6OrqeWWIgwERKPiPzYHGmdlLU3C+16+QGAnDfb+5NKnkRAHbLYKiXiMpIEfK+
	 BjwRU3lXXinlJw9K5D1z9nrQwuH6Y5w9AWHSdgYORsl+BPOCwylB3kqs0+9Pdw6nGr
	 bFl2EFLGB7Ka3HPMFWZCNKnc9yChPO80xQfIbI3b1QJF4XxDJU1V2HApdQgN7LCzfu
	 LrJI6Ua/AUhLg==
From: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 1/3] powerpc/mm: Align memory_limit value specified using mem= kernel parameter
Date: Wed,  3 Apr 2024 14:06:09 +0530
Message-ID: <20240403083611.172833-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.44.0
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

The value specified for the memory limit is used to set a restriction on
memory usage. It is important to ensure that this restriction is within
the linear map kernel address space range. The hash page table
translation uses a 16MB page size to map the kernel linear map address
space. htab_bolt_mapping() function aligns down the size of the range
while mapping kernel linear address space. Since the memblock limit is
enforced very early during boot, before we can detect the type of memory
translation (radix vs hash), we align the memory limit value specified
as a kernel parameter to 16MB. This alignment value will work for both
hash and radix translations.

Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
---
 arch/powerpc/kernel/prom.c      | 7 +++++--
 arch/powerpc/kernel/prom_init.c | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index cd8d8883de90..7451bedad1f4 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -846,8 +846,11 @@ void __init early_init_devtree(void *params)
 		reserve_crashkernel();
 	early_reserve_mem();
 
-	/* Ensure that total memory size is page-aligned. */
-	limit = ALIGN(memory_limit ?: memblock_phys_mem_size(), PAGE_SIZE);
+	if (memory_limit > memblock_phys_mem_size())
+		memory_limit = 0;
+
+	/* Align down to 16 MB which is large page size with hash page translation */
+	limit = ALIGN_DOWN(memory_limit ?: memblock_phys_mem_size(), SZ_16M);
 	memblock_enforce_memory_limit(limit);
 
 #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_4K_PAGES)
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 0ef358285337..fbb68fc28ed3 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -817,8 +817,8 @@ static void __init early_cmdline_parse(void)
 		opt += 4;
 		prom_memory_limit = prom_memparse(opt, (const char **)&opt);
 #ifdef CONFIG_PPC64
-		/* Align to 16 MB == size of ppc64 large page */
-		prom_memory_limit = ALIGN(prom_memory_limit, 0x1000000);
+		/* Align down to 16 MB which is large page size with hash page translation */
+		prom_memory_limit = ALIGN_DOWN(prom_memory_limit, SZ_16M);
 #endif
 	}
 

base-commit: 3e92c1e6cd876754b64d1998ec0a01800ed954a6
-- 
2.44.0

