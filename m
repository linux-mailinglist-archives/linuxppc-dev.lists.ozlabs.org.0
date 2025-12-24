Return-Path: <linuxppc-dev+bounces-15001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E053CCDC1C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:22:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqGF3JJ9z2ypk;
	Wed, 24 Dec 2025 22:21:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766575317;
	cv=none; b=RHiPCyYQ1jPr5hrErFyHrEBpZzVTqgIoPO0xbEWDcTzEUdu0wmtHq0lmbUoiiZudpVdubG18ZKJFFS6HfXlrxWdPkoKkBtmJOfrsODP179x+ZQpCELgy61fc25Hi/MdN8Up2b4nHQlLs0sAXuKJj5/XDR5IqYMQCLerpIV02hm7tphuDLqGlzrtpveVZab89Y8Cy5b3rOTf9KkqEW9SezOo6SDT+63Vczs9/o+eHsJMpV3BTPlJt+WY+kT/+JMx4BtrH8twakH27/VOsakY8k3HBLZxxeaOllk228Ndnqh/yJ/7I8zH1qGBF+RGUzHNf5gO75kt/ZyAB01+pwxzUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766575317; c=relaxed/relaxed;
	bh=xzJ8g+i4bky+SMjn9R60IY4D1FhWIdcXpXc4AV66axg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DH2V7+jrJ6P6tQ5uwZZ7eXKnvikjYVu0kFP8UTj6/W28BTnqKvFm8eXBMwuQf6t3qdEdBlyk3T0FG0pwo6UNYhRnnTMGJaLsgpRiTwqLL2Bfgrtns49PBKvc9NItiNyGB9DIcC9DYJQGnKrJ7NZjRsi+n8+qLFu/MtB8bWjyqb+DKOWmWeaC/UDusJJY5uJHeJGVMUzYzunvY0Y+SxtyZynDzHNc3vNRoHvnQEGaYYeCSvUNX+URDDHmLFDKYZOkJ20gCu4iI1UIUyVv8tjFTi8LJCmyZTHf4N4N9nCN673hq1qqUhtAa5YWkm48PX/r6HWIb6GBk17nc+HxAvv3qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W0ltaU6W; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W0ltaU6W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqGD4KMFz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:21:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DA3C60125;
	Wed, 24 Dec 2025 11:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DCEC116D0;
	Wed, 24 Dec 2025 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766575284;
	bh=uML6mmNL9b32c/J5n2U0d68VLsHlLeW3trcOev0qgcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W0ltaU6WOVXR9KTWeXHCk5FsTxNsCgJ5bYP8Pwe2JbSkGGNvpCSAeBl015Pcu3Gnm
	 yv42gybIbXYrOIc/NKnhrdUjbJPr96Hv4nUKAWiWeV9JN87H/ZHpRPOLvozCgWSJTP
	 dTv5m0tWTA2/5E4WnJ5j8zL8OCqw2BfsmDssJAei4A8743BrPQ74A4268B4V3KVIQk
	 rLuIX/CDeoHCtp5xUIHBL2hsdhaO5ZfWp8MCXkiU4O6RlLSljqilwCfj/sfd72N/UC
	 +D5/b66NtqfoXpCJmmPLVjaeMio8eKVOTdFZYLsRRyJ257HEgEqZX9vKyg3e0UnnZe
	 UeIR9OYdk7Beg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 4/7] powerpc/uaccess: Refactor user_{read/write/}_access_begin()
Date: Wed, 24 Dec 2025 12:20:52 +0100
Message-ID: <2b4f9d4e521e0b56bf5cb239916b4a178c4d2007.1766574657.git.chleroy@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3583; i=chleroy@kernel.org; h=from:subject:message-id; bh=Hs0S56epi8xUTo2XJTHx0BIIvWB8/BwLXBAnBe9oLow=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR6n5nz8IZah4hzWoyy18eWZRp8T0OtJuunGyxSEFyUm dmUr7ugo5SFQYyLQVZMkeX4f+5dM7q+pOZP3aUPM4eVCWQIAxenAEykX5vhf+7EzZbnPP4992nm +vTRu7Z9TdvcVxNM3BMX/OlsDGeq9WBkeH3bLTvuwKR9Cwv3ef3TYno4S7bVMPNdWvea7SuWXu/ X5gMA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Christophe Leroy <christophe.leroy@csgroup.eu>

user_read_access_begin() and user_write_access_begin() and
user_access_begin() are now very similar. Create a common
__user_access_begin() that takes direction as parameter.

In order to avoid a warning with the conditional call of
barrier_nospec() which is sometimes an empty macro, change it to a
do {} while (0).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: Rebase on top of core-scoped-uaccess tag

v2: New
---
 arch/powerpc/include/asm/barrier.h |  2 +-
 arch/powerpc/include/asm/uaccess.h | 46 +++++++++---------------------
 2 files changed, 14 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index 9e9833faa4af..9d2f612cfb1d 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -102,7 +102,7 @@ do {									\
 
 #else /* !CONFIG_PPC_BARRIER_NOSPEC */
 #define barrier_nospec_asm
-#define barrier_nospec()
+#define barrier_nospec()	do {} while (0)
 #endif /* CONFIG_PPC_BARRIER_NOSPEC */
 
 /*
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 7846ee59e374..721d65dbbb2e 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -410,50 +410,30 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
 extern long __copy_from_user_flushcache(void *dst, const void __user *src,
 		unsigned size);
 
-static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
+static __must_check __always_inline bool __user_access_begin(const void __user *ptr, size_t len,
+							     unsigned long dir)
 {
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
 
 	might_fault();
 
-	barrier_nospec();
-	allow_read_write_user((void __user *)ptr, ptr, len);
+	if (dir & KUAP_READ)
+		barrier_nospec();
+	allow_user_access((void __user *)ptr, dir);
 	return true;
 }
-#define user_access_begin	user_access_begin
-#define user_access_end		prevent_current_access_user
-#define user_access_save	prevent_user_access_return
-#define user_access_restore	restore_user_access
 
-static __must_check __always_inline bool
-user_read_access_begin(const void __user *ptr, size_t len)
-{
-	if (unlikely(!access_ok(ptr, len)))
-		return false;
+#define user_access_begin(p, l)		__user_access_begin(p, l, KUAP_READ_WRITE)
+#define user_read_access_begin(p, l)	__user_access_begin(p, l, KUAP_READ)
+#define user_write_access_begin(p, l)	__user_access_begin(p, l, KUAP_WRITE)
 
-	might_fault();
-
-	barrier_nospec();
-	allow_read_from_user(ptr, len);
-	return true;
-}
-#define user_read_access_begin	user_read_access_begin
-#define user_read_access_end		prevent_current_read_from_user
+#define user_access_end()		prevent_user_access(KUAP_READ_WRITE)
+#define user_read_access_end()		prevent_user_access(KUAP_READ)
+#define user_write_access_end()		prevent_user_access(KUAP_WRITE)
 
-static __must_check __always_inline bool
-user_write_access_begin(const void __user *ptr, size_t len)
-{
-	if (unlikely(!access_ok(ptr, len)))
-		return false;
-
-	might_fault();
-
-	allow_write_to_user((void __user *)ptr, len);
-	return true;
-}
-#define user_write_access_begin	user_write_access_begin
-#define user_write_access_end		prevent_current_write_to_user
+#define user_access_save	prevent_user_access_return
+#define user_access_restore	restore_user_access
 
 #define arch_unsafe_get_user(x, p, e) do {			\
 	__long_type(*(p)) __gu_val;				\
-- 
2.49.0


