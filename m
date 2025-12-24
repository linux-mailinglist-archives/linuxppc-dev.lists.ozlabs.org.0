Return-Path: <linuxppc-dev+bounces-14999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A6ACDC1BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:21:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqG770Bvz2yRM;
	Wed, 24 Dec 2025 22:21:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766575311;
	cv=none; b=bK9Zfvk7QWR+EUmqULGWoCpLOBsLKixiZTdsGgmHK2b+qccMt+8K5x2BB7ETWWrZbhOIfcWGI+MunHCflx5f/qyN0qV1ptndp6/q1vKrYx+16x03gg2ruc2ulC8ZVnSScjldbIvXj0xTonslmRKp/dGFzZzZ9YwRJ/ihqAOMDwxI2p38KZf/Uy5hhY8XfAaB4JdMCAdiFCIB9XXvqkge2V94iAg4jRGirXY6HsJ6kH+yOjepEHs7d/yXIdBjQSaziIwvS7poYNLImMYsgMkOufGQGj9CMfHYoUT35TXAeH6bUyy+g2/C764SviTBP9tDoNiizSZtbd+MeTDGq1XrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766575311; c=relaxed/relaxed;
	bh=Gj8z8rGB8wsJ1ZC+3VSy6duCE26OjTluS5AgwiXvCow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gb/wempRzRBiYf83Ed2UgtNxA2ohePUx2xMUiR0JVZW3sZ35P/jIjmQ9EVX9z+9rAWghDnGxC13M5M+L3Ox/EiOz9Mx2pTZEW2kv6gomcDk6zwg/I0QjYt9GTGqRv+7z9Ay31PmoK40p8n7nbQJeua7eoFuuK8aNAjVkupkvQm8ATFApwgrNAQOLQPIT/OGSQzOAIrvtnlFyWovSEgUm9wLgkf9GRgRqnoUvbhFOPTWFSdaIYDlbEmYMjNw8Hh8ysisIdt+1XtUC4EIaZii2iezzeexOx2NohpXIt4pI/slLRF05stn/Qc6Vn0R6M6PdkdKI241ESDcpiQgOhUugvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o4PPGh9U; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o4PPGh9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqG712DFz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:21:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E6EE4434A;
	Wed, 24 Dec 2025 11:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8873FC116D0;
	Wed, 24 Dec 2025 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766575279;
	bh=cG07iNoLtgV5OAON2L0gxG8ekPZAIsY199/aR4C/R8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o4PPGh9U3f9HhNG6f76AyEoU/j5bVURFhZ5slSODJQZkM0LHG5CZeswqDFgfAe64h
	 vp9IASxi7LhpVo9QSLTchHVUteZLWjpaKKo+WxHZK0AgmP7mS7f+kGQABbQg56R/mQ
	 cAtEZ/8m1hwbaB5ABDQYa4wtIhhk+s2E/iMQ4aTYwDkAgpK1MOM5zf3DWuQp33RyjB
	 CaO18OPOzu/CnrKZtlZlOi5XQL0vKiGSuvzBAR4etxG9EAfxPjHXxIWAnwClFspyDN
	 MlAdwpEnZhNjF5exlX3lxzSVtvFB7GyGTmnEAKdckg5TPZzk74L/Ldm2znfhWHRmEd
	 EsBr/TYGq8cBg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 2/7] powerpc/uaccess: Remove unused size and from parameters from allow_access_user()
Date: Wed, 24 Dec 2025 12:20:50 +0100
Message-ID: <4552b00707923b71150ee47b925d6eaae1b03261.1766574657.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1766574657.git.chleroy@kernel.org>
References: <cover.1766574657.git.chleroy@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5354; i=chleroy@kernel.org; h=from:subject:message-id; bh=okOXIxoN+Cy3Y0MK9JK386swUng0kSsMrPoBGtdUBLc=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR6n5mtn/R0j/sCnaBru07xz3+7NKt/+eyybZIXJgVuM Nvq57HhZEcpC4MYF4OsmCLL8f/cu2Z0fUnNn7pLH2YOKxPIEAYuTgGYSAojI0PDopx/HiFPLv6Y /16lsPnncZM9i/MKj+/p65zJsvZC7X1ORoY52176/nu14F0XU/ra3v1xRbFun+oVWLjDJqinffd aL8oIAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Since commit 16132529cee5 ("powerpc/32s: Rework Kernel Userspace
Access Protection") the size parameter is unused on all platforms.

And the 'from' parameter has never been used.

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Also remove 'from' param.
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 3 +--
 arch/powerpc/include/asm/book3s/64/kup.h     | 6 ++----
 arch/powerpc/include/asm/kup.h               | 9 ++++-----
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 3 +--
 arch/powerpc/include/asm/nohash/kup-booke.h  | 3 +--
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 873c5146e326..a3558419c41b 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -97,8 +97,7 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 }
 #define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      u32 size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 {
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 03aec3c6c851..9ccf8a5e0926 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -353,8 +353,7 @@ __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 	return (regs->amr & AMR_KUAP_BLOCK_READ) == AMR_KUAP_BLOCK_READ;
 }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 {
 	unsigned long thread_amr = 0;
 
@@ -383,8 +382,7 @@ static __always_inline unsigned long get_kuap(void)
 
 static __always_inline void set_kuap(unsigned long value) { }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 { }
 
 #endif /* !CONFIG_PPC_KUAP */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index f2009d7c8cfa..3963584ac1cf 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -72,8 +72,7 @@ static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned
  * platforms.
  */
 #ifndef CONFIG_PPC_BOOK3S_64
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir) { }
+static __always_inline void allow_user_access(void __user *to, unsigned long dir) { }
 static __always_inline void prevent_user_access(unsigned long dir) { }
 static __always_inline unsigned long prevent_user_access_return(void) { return 0UL; }
 static __always_inline void restore_user_access(unsigned long flags) { }
@@ -134,18 +133,18 @@ static __always_inline void kuap_assert_locked(void)
 
 static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
-	allow_user_access(NULL, from, size, KUAP_READ);
+	allow_user_access(NULL, KUAP_READ);
 }
 
 static __always_inline void allow_write_to_user(void __user *to, unsigned long size)
 {
-	allow_user_access(to, NULL, size, KUAP_WRITE);
+	allow_user_access(to, KUAP_WRITE);
 }
 
 static __always_inline void allow_read_write_user(void __user *to, const void __user *from,
 						  unsigned long size)
 {
-	allow_user_access(to, from, size, KUAP_READ_WRITE);
+	allow_user_access(to, KUAP_READ_WRITE);
 }
 
 static __always_inline void prevent_read_from_user(const void __user *from, unsigned long size)
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 08486b15b207..efffb5006d19 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -49,8 +49,7 @@ static __always_inline void uaccess_end_8xx(void)
 	    "i"(SPRN_MD_AP), "r"(MD_APG_KUAP), "i"(MMU_FTR_KUAP) : "memory");
 }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 {
 	uaccess_begin_8xx(MD_APG_INIT);
 }
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index d6bbb6d78bbe..cb2d5a96c3df 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -73,8 +73,7 @@ static __always_inline void uaccess_end_booke(void)
 	    "i"(SPRN_PID), "r"(0), "i"(MMU_FTR_KUAP) : "memory");
 }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 {
 	uaccess_begin_booke(current->thread.pid);
 }
-- 
2.49.0


