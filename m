Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C1802EC7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 10:37:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TLQAILlI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkJVh3N63z3cZP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 20:37:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TLQAILlI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkJTp2SQyz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 20:37:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 82C87CE0ED4;
	Mon,  4 Dec 2023 09:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4339C433C7;
	Mon,  4 Dec 2023 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701682617;
	bh=cpfnv2cwbjzuWInLv2DlRIuHnQ7ADN7R82FvPIelbTg=;
	h=From:To:Cc:Subject:Date:From;
	b=TLQAILlI3Gnuk5l1XOhsZ4pZVv77FmzgpbVnfvVfIMNI8fVYoK1gWvXNk9qE3kLph
	 zYSNi9jwPwMdukn+KVgH7/yqe0MUH7mlL/e5oxGxmC3uNyIMkB6Ll1v1p+Ch54AuZS
	 SFT0JXHf2YZ7EInWc/q/hEbpGcF86Qu8/vCnFRsc4vKhVi72OIkImYHgF3R4QQZ8KU
	 U6tU8uNpCE2XYnPI79Hox1WogCNCvNV/WXQvXjx0GzYYhe/Utogjw6Pg0HidK6Am+2
	 0uy69sNL9M3mNO9DZOeD56fbyGv8H7KTS9J15da4kuxXO4SV3WliQLWxupDsPn5Mui
	 u3JAmG7GYxc1Q==
From: aneesh.kumar@kernel.org
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH v2 1/2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from PAGE_NONE
Date: Mon,  4 Dec 2023 15:06:37 +0530
Message-ID: <20231204093638.71503-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>

There used to be a dependency on _PAGE_PRIVILEGED with pte_savedwrite.
But that got dropped by
commit 6a56ccbcf6c6 ("mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite")

With the change in this patch numa fault pte (pte_protnone()) gets mapped as regular user pte
with RWX cleared (no-access) whereas earlier it used to be mapped _PAGE_PRIVILEGED.

Hash fault handling code gets some WARN_ON added in this patch because
those functions are not expected to get called with _PAGE_READ cleared.
commit 18061c17c8ec ("powerpc/mm: Update PROTFAULT handling in the page
fault path") explains the details.

Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++--------
 arch/powerpc/mm/book3s64/hash_utils.c        |  7 +++++++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb77eddca54b..927d585652bc 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -17,12 +17,6 @@
 #define _PAGE_EXEC		0x00001 /* execute permission */
 #define _PAGE_WRITE		0x00002 /* write access allowed */
 #define _PAGE_READ		0x00004	/* read access allowed */
-#define _PAGE_NA		_PAGE_PRIVILEGED
-#define _PAGE_NAX		_PAGE_EXEC
-#define _PAGE_RO		_PAGE_READ
-#define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
-#define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
-#define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
 #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
 #define _PAGE_SAO		0x00010 /* Strong access order */
 #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
@@ -532,8 +526,8 @@ static inline bool pte_user(pte_t pte)
 static inline bool pte_access_permitted(pte_t pte, bool write)
 {
 	/*
-	 * _PAGE_READ is needed for any access and will be
-	 * cleared for PROT_NONE
+	 * _PAGE_READ is needed for any access and will be cleared for
+	 * PROT_NONE. Execute-only mapping via PROT_EXEC also returns false.
 	 */
 	if (!pte_present(pte) || !pte_user(pte) || !pte_read(pte))
 		return false;
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index ad2afa08e62e..0626a25b0d72 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -310,9 +310,16 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned long flags
 			else
 				rflags |= 0x3;
 		}
+		VM_WARN_ONCE(!(pteflags & _PAGE_RWX), "no-access mapping request");
 	} else {
 		if (pteflags & _PAGE_RWX)
 			rflags |= 0x2;
+		/*
+		 * We should never hit this in normal fault handling because
+		 * a permission check (check_pte_access()) will bubble this
+		 * to higher level linux handler even for PAGE_NONE.
+		 */
+		VM_WARN_ONCE(!(pteflags & _PAGE_RWX), "no-access mapping request");
 		if (!((pteflags & _PAGE_WRITE) && (pteflags & _PAGE_DIRTY)))
 			rflags |= 0x1;
 	}
-- 
2.43.0

