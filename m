Return-Path: <linuxppc-dev+bounces-14996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D5CDC1B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:21:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqFW3kPKz2ySC;
	Wed, 24 Dec 2025 22:21:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766575279;
	cv=none; b=ezKGkh8P2jKFhYfNIbdl72ZWy5AWbzJvotfUJEvLnWSut+KlSBinaJLizV0/vmodWvobtYA2AIh2XLjxMFIAQy9Qag5gdSklS6gKEYAwn4ThC6HeKiPPtjXKapPbUGpvMbvo7pvffc6qndP8aqZGrB3dF2Eo18X86ERcuRdxd8zb89qI9FyBO4WYj0eTJZGkPD92uYH3+jmu+iev2LfyRfvPU3fedKP4M5o+l/ddtJK3n+QQWa8+vO1NWiVKEqe/veBICGVpBpP4yLLkD2LMZF0SaKGLRVpMeLb0uM8oP7FDN+kUROXxcBXSY+Lp/7n1wmEsHkrRCf64iSz3EFfvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766575279; c=relaxed/relaxed;
	bh=lyciF04c2x6lmSO9LT4ZT37+JrWDz7I2BdtBJKKwZ7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TS3AsUBKZDkExzHDla7u+ZZ5QnkDiapjN2c6tGbdWIDieqXOU2XUxhVD57+Sv8rHOTOLrzPi/rqsHl7QI8Gqv+bo1EOWTMe8nZud3MtGanX7iJzSgmh4oVVMhyqU/Yna7pBLu7/QbY4aL0fRfSkCaeulY81Kmxz5erd7XxZ5kH4pwEEaw5IPhmiTbVf0NFOhL4bQ0j5b/R+SV1mATwUEfs9rGhWHyw3ctah6munQJL835JtX6rkG3OWaudy69UzcT1ONIAP6AJ45+gc+QpNr7NWZJ+QsPl0vYAZvhOV0QjJqxfW+6foYtPLJzJ041alsb+RA8fLVIS75JaBD/VKsMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dHe3ucKM; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dHe3ucKM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqFV5cnYz2yRC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:21:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2899B4392A;
	Wed, 24 Dec 2025 11:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A43C16AAE;
	Wed, 24 Dec 2025 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766575277;
	bh=M5yFgKD2Ib3qD1QX8R9fTV8O/Sif57m4EVWR5kO0sVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHe3ucKMyAOFToZEzJLoIz/kxV9RI7kW/Ck/hov7wo82ufvmdCB5tj0svBM7oBJ/0
	 ie6gnxNqFzrUmmPubYdVt5B913lnF/DzBu3KyuDFSI37SNX3LCWzQM1ni7vRS5uxZd
	 DI63KBwjgcDvIPI8JShARo72pTsPxFe8G9qdvrf1CLzJTaTRqGqAyR/LU63LknpkwD
	 ov9sjksZ5FIV9dfYMo4j+0kovK4qoLhuwvS1ql1Wd/HvURowT1TRkvgtGdg3A/lti/
	 uAHFG19hYtRbIWCCmGNm60xIYEdqJ9qvfRNkiFApogQ1Ozw1MwJygJZSKsjxpJ4MPm
	 Nhmce6e0I9CJQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 1/7] powerpc/uaccess: Move barrier_nospec() out of allow_read_{from/write}_user()
Date: Wed, 24 Dec 2025 12:20:49 +0100
Message-ID: <f29612105c5fcbc8ceb7303808ddc1a781f0f6b5.1766574657.git.chleroy@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3128; i=chleroy@kernel.org; h=from:subject:message-id; bh=FRyCNlus/chAL58mdj2A43JkP4XfcjBtB27GVJaNvtw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR6n5ltnzvBPqx+m9qJ7J2m0j8u12bXzBKReHBvoYZ1i 8hdq/csHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAiF6sY/hmLHZ/Iypa1/cSc dddbi+TXvrJ/E3LuYD3f5p7TZSKbp8xi+B/aoZKm9vv+zKCzZyryZt79kGbvbrJTyviVmewya09 +Y0YA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
copy_from_user()") added a redundant barrier_nospec() in
copy_from_user(), because powerpc is already calling
barrier_nospec() in allow_read_from_user() and
allow_read_write_user(). But on other architectures that
call to barrier_nospec() was missing. So change powerpc
instead of reverting the above commit and having to fix
other architectures one by one. This is now possible
because barrier_nospec() has also been added in
copy_from_user_iter().

Move barrier_nospec() out of allow_read_from_user() and
allow_read_write_user(). This will also allow reuse of those
functions when implementing masked user access which doesn't
require barrier_nospec().

Don't add it back in raw_copy_from_user() as it is already called
by copy_from_user() and copy_from_user_iter().

Fixes: 74e19ef0ff80 ("uaccess: Add speculation barrier to copy_from_user()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kup.h     | 2 --
 arch/powerpc/include/asm/uaccess.h | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index dab63b82a8d4..f2009d7c8cfa 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -134,7 +134,6 @@ static __always_inline void kuap_assert_locked(void)
 
 static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
-	barrier_nospec();
 	allow_user_access(NULL, from, size, KUAP_READ);
 }
 
@@ -146,7 +145,6 @@ static __always_inline void allow_write_to_user(void __user *to, unsigned long s
 static __always_inline void allow_read_write_user(void __user *to, const void __user *from,
 						  unsigned long size)
 {
-	barrier_nospec();
 	allow_user_access(to, from, size, KUAP_READ_WRITE);
 }
 
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 784a00e681fa..3e622e647d62 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -301,6 +301,7 @@ do {								\
 	__typeof__(sizeof(*(ptr))) __gu_size = sizeof(*(ptr));	\
 								\
 	might_fault();					\
+	barrier_nospec();					\
 	allow_read_from_user(__gu_addr, __gu_size);		\
 	__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);	\
 	prevent_read_from_user(__gu_addr, __gu_size);		\
@@ -329,6 +330,7 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 {
 	unsigned long ret;
 
+	barrier_nospec();
 	allow_read_write_user(to, from, n);
 	ret = __copy_tofrom_user(to, from, n);
 	prevent_read_write_user(to, from, n);
@@ -415,6 +417,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 
 	might_fault();
 
+	barrier_nospec();
 	allow_read_write_user((void __user *)ptr, ptr, len);
 	return true;
 }
@@ -431,6 +434,7 @@ user_read_access_begin(const void __user *ptr, size_t len)
 
 	might_fault();
 
+	barrier_nospec();
 	allow_read_from_user(ptr, len);
 	return true;
 }
-- 
2.49.0


