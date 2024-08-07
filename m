Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B194A7EE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 14:41:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rouwZkpk;
	dkim-atps=neutral
Received: from lists.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf8v54wDLz3dFS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:41:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rouwZkpk;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf8tP1LS4z3ckk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 22:41:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723034477;
	bh=MLPB8NX1mr26290JEeNr8bLoMbPmIYChrue1EMzqpmE=;
	h=From:To:Cc:Subject:Date:From;
	b=rouwZkpkpwvm1AETzWWBAHxWziQvMhXI7iOx9YMA0xiCUgpuaCB3OE5HF0Pg+RlNh
	 G3daTz+Tsbz6MpBaGyhhCCfsnSMzZEqGECM/XMXVS0nwgP7kft0v880B3rAe+saMjf
	 Vaycc+vl9gc6KZb6bgn9Iwgvf4n8ltCZJf0qL3Wb1XQlc/uZPj6bWNvwrIwNDQd1Ty
	 i/WYNEUltvKBnhZslmbUBSN8NbtC8QkEhwoxdlSN69lR65z2WWM5C+U4vXNkH1GIVs
	 pWyjJA/ZkK4lL+5TXTmGDVLroUA6EGt+g5M4B9aaZMjjKnIqpl5mATpNfWxGm2H0Md
	 DxfcMry9PYr8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wf8tN6TY9z4wd6;
	Wed,  7 Aug 2024 22:41:16 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-mm@kvack.org>
Subject: [PATCH 1/4] mm: Add optional close() to struct vm_special_mapping
Date: Wed,  7 Aug 2024 22:41:00 +1000
Message-ID: <20240807124103.85644-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, jeffxu@google.com, jeffxu@chromium.org, oliver.sang@intel.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add an optional close() callback to struct vm_special_mapping. It will
be used, by powerpc at least, to handle unmapping of the VDSO.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 include/linux/mm_types.h | 2 ++
 mm/mmap.c                | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 485424979254..ef32d87a3adc 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1313,6 +1313,8 @@ struct vm_special_mapping {
 
 	int (*mremap)(const struct vm_special_mapping *sm,
 		     struct vm_area_struct *new_vma);
+	void (*close)(const struct vm_special_mapping *sm,
+		      struct vm_area_struct *vma);
 };
 
 enum tlb_flush_reason {
diff --git a/mm/mmap.c b/mm/mmap.c
index d0dfc85b209b..24bd6aa9155c 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3624,6 +3624,9 @@ static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
  */
 static void special_mapping_close(struct vm_area_struct *vma)
 {
+	const struct vm_special_mapping *sm = vma->vm_private_data;
+	if (sm->close)
+		sm->close(sm, vma);
 }
 
 static const char *special_mapping_name(struct vm_area_struct *vma)
-- 
2.45.2

