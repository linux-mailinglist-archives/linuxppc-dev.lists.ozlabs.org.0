Return-Path: <linuxppc-dev+bounces-9182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B73AD0CD2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 12:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDvMl3CTzz2yMD;
	Sat,  7 Jun 2025 20:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749291635;
	cv=none; b=LCClYFpRoCrMSeL/DPsjviM7UpNnGqnockze8vwYxW8U8tt+c5Q++6Xq/9txXbOUjtm/FMriJYdMVMM+vfVUzpJGXVw+UUAjg3WbjJJZ15pYVmRAvXwEKi56jwD8t6LrD66RcG64ZYqiNcUL8BpVJNjM4nYHER9clO3t5zgVjCAovvnEnztMO9ykkrIBKmpeHRLgDOzpQn5HIepZBBvc1W5RC8B2RciFDWGChd+IyUIPhBB6mDsoaL/HfgjAuDanxlUaPCET4zCTwDGkfh6NX4TYVyLO+rzzak205S5ip8ZV9ZubS3kckd5BS6p4oHxS0kaYfrwB/vd0aQBNHFlCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749291635; c=relaxed/relaxed;
	bh=tw7i6i17DEdJ9oi71nPNsakbt/ynXwGINyyM2MRcJfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCykyADEX/o+cBs/sLHr+KHEjzghfP6CnjD3KgMm+rSJIsbkfeXsjl/XrQhGPlsWadlJt4o+GmHQyjKA8gRwQOU+EyN9kUnp6v7fy75u4BaRl3Srw0dVUAxcBXe+PUExoMtmOZXBQ31IxyPH0wzAJwgyA/0IukGOn+uqUlskaEBgKLeNAtorKWNa7roPwuVyJgmE+bOM4r7wsiHfSnn/56m6373iyCXvD49pa2SnU4x2tkMQAhnIzSqSkXThwwnoiji6uLcaYIXBOi5pxochq0VEaeTUjkttea78GckM78faei0LuUXWre+iO2v9c9NJEPklGTlRFPahHI8Syk1r2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jFAmJS/U; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jFAmJS/U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bDvMk5T6Rz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jun 2025 20:20:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 803A75C4ACE;
	Sat,  7 Jun 2025 10:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6287EC4CEE4;
	Sat,  7 Jun 2025 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749291631;
	bh=sh9beUAbIuorf1w+V3JI/MqIYcQqK9+9r0fObvWZ0h0=;
	h=From:To:Cc:Subject:Date:From;
	b=jFAmJS/UyNsfXfaorEpuD0R6fH6cidqEDXXXMjB/CIuz6Eq3BtqYPvKPaS2kZiGut
	 Bf2sDj0isVcFBE2tBd+fQ7E+XDZpaY8K5Q6V+TePXiX/fosCU+xGYrOV/nwKYKiY4A
	 a/N5OJij5HmSRegpp+Poo46fSCJth0g49D0o5l3exYFfaInBOWGdIA0VKghEi7BUkr
	 4cgLnHnjQdaSMYsgskNj5lq7b7WkX9qsBAcmDnwymU+MVDe/mFwwxPgs8HBaJe0YDZ
	 B+yIJSA8cYRrjAHuV6/kEnnh1FgjGKNteaaQ3O4qpD18N0hBkQ+tDggQjPo4G+dMb/
	 R1CSxpwGv/oXw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the same choice block
Date: Sat,  7 Jun 2025 19:13:51 +0900
Message-ID: <20250607102005.1965409-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
choice block.

I guess the intent is to display a different prompt depending on
CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
endian, and "Generic (POWER8 and above)" for little endian.

I stumbled on this tricky use case, and worked around it on Kconfig with
commit 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").
However, I doubt that supporting multiple entries with the same symbol
in a choice block is worth the complexity - this is the only such case
in the kernel tree.

This commit merges the two entries. Once this cleanup is accepted in
the powerpc subsystem, I will proceed to refactor the Kconfig parser.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/platforms/Kconfig.cputype | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 613b383ed8b3..7b527d18aa5e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -122,16 +122,11 @@ choice
 	  If unsure, select Generic.
 
 config POWERPC64_CPU
-	bool "Generic (POWER5 and PowerPC 970 and above)"
-	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	bool "Generic 64 bits powerpc"
+	depends on PPC_BOOK3S_64
+	select ARCH_HAS_FAST_MULTIPLIER if CPU_LITTLE_ENDIAN
 	select PPC_64S_HASH_MMU
-
-config POWERPC64_CPU
-	bool "Generic (POWER8 and above)"
-	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
-	select ARCH_HAS_FAST_MULTIPLIER
-	select PPC_64S_HASH_MMU
-	select PPC_HAS_LBARX_LHARX
+	select PPC_HAS_LBARX_LHARX if CPU_LITTLE_ENDIAN
 
 config POWERPC_CPU
 	bool "Generic 32 bits powerpc"
-- 
2.43.0


