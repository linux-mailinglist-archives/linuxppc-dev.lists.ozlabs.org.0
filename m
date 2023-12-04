Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B12802EC9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 10:38:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lyr2AXA2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkJWc5jgYz3cVZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 20:38:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lyr2AXA2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkJTv6wD7z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 20:37:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5AAF0B80D8E;
	Mon,  4 Dec 2023 09:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2346C433C8;
	Mon,  4 Dec 2023 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701682623;
	bh=EtsxqEq1X7w/cgz//qwTtlBCnYArrpSwbjwRjc4L3A0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyr2AXA2UKMPONcSAEy1KsAUR0JZprLY9tdFZnQxPMcQVrsRKPvdzTnNW+Lv2c15y
	 S6QVjBgpg7FegbF4mswEijd/F0tGJRbKe0V4W+oeCRBO0vXjEySPd9v4sUI6493wAK
	 0DGYaUJ9db2e4vtpBBf88PVgjVzq8k6dxqhEaSDaSSB3tupCoHjmISy2LIhc1VetvP
	 IsoSlka/opLvSJVy0C+vVNZOepDJ4f9KuuunvyA6C+ANAR810ep6iPlevvXZO4/oG+
	 PYPrHczUWytxV2Kf04ExbYT31VwBi7SvW4+UEo8TD3x5LkfPL3fojg6QdcA9WMTea1
	 5TrhvGgtm9Jqg==
From: aneesh.kumar@kernel.org
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH v2 2/2] powerpc/book3s64: Avoid __pte_protnone() check in __pte_flags_need_flush()
Date: Mon,  4 Dec 2023 15:06:38 +0530
Message-ID: <20231204093638.71503-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204093638.71503-1-aneesh.kumar@kernel.org>
References: <20231204093638.71503-1-aneesh.kumar@kernel.org>
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

This reverts commit 1abce0580b89 ("powerpc/64s: Fix __pte_needs_flush()
false positive warning")

The previous patch dropped the usage of _PAGE_PRIVILEGED with PAGE_NONE.
Hence this check can be dropped.

Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
---
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 1950c1b825b4..fd642b729775 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -158,11 +158,6 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 	 */
 }
 
-static inline bool __pte_protnone(unsigned long pte)
-{
-	return (pte & (pgprot_val(PAGE_NONE) | _PAGE_RWX)) == pgprot_val(PAGE_NONE);
-}
-
 static inline bool __pte_flags_need_flush(unsigned long oldval,
 					  unsigned long newval)
 {
@@ -179,8 +174,8 @@ static inline bool __pte_flags_need_flush(unsigned long oldval,
 	/*
 	 * We do not expect kernel mappings or non-PTEs or not-present PTEs.
 	 */
-	VM_WARN_ON_ONCE(!__pte_protnone(oldval) && oldval & _PAGE_PRIVILEGED);
-	VM_WARN_ON_ONCE(!__pte_protnone(newval) && newval & _PAGE_PRIVILEGED);
+	VM_WARN_ON_ONCE(oldval & _PAGE_PRIVILEGED);
+	VM_WARN_ON_ONCE(newval & _PAGE_PRIVILEGED);
 	VM_WARN_ON_ONCE(!(oldval & _PAGE_PTE));
 	VM_WARN_ON_ONCE(!(newval & _PAGE_PTE));
 	VM_WARN_ON_ONCE(!(oldval & _PAGE_PRESENT));
-- 
2.43.0

