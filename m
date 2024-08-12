Return-Path: <linuxppc-dev+bounces-7-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89294E880
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 10:26:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fhxsz34w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj6zl2hxCz2xjJ;
	Mon, 12 Aug 2024 18:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fhxsz34w;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj6zl1zD7z2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 18:26:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723451171;
	bh=VDTeFKG0tWsaWgY5r4pEV0pX09s9ysckDeAKLLaIFRs=;
	h=From:To:Cc:Subject:Date:From;
	b=fhxsz34wOUUSnbdDDauItzNL8KbrPOk7aPwcBLdQypYkobErRlI50imsAL30scp4Z
	 eXKETdiRr+U+E3qiwMLaSxlWuSJnrNmrmKLNCTA/G2NJ8867qYNafCfX9VWbnZZCnL
	 uPOtIF7r8dFU2DF48vSD8LhCKd3cqpi6Jkg8gIQIXnXkrpkXF3Msyqsu1VO+DKOgD/
	 tQ1jxVLo0FWhKB1XV4icEInoLMAkmCr33AojWOhDDEtuQwrvFO0s0DjemBcYFg1Xce
	 5qVFHDIj1hYHLlHTIwAg5HBTIhtv9w+LTNZKa4gPH8+QUvKzS/5Myj08LAvTEMjTrx
	 5Xk7bT1INhDYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj6zk6yjDz4x8Q;
	Mon, 12 Aug 2024 18:26:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-mm@kvack.org>
Cc: <linuxppc-dev@lists.ozlabs.org>,
	torvalds@linux-foundation.org,
	akpm@linux-foundation.org,
	christophe.leroy@csgroup.eu,
	jeffxu@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org,
	npiggin@gmail.com,
	oliver.sang@intel.com,
	pedro.falcato@gmail.com
Subject: [PATCH v2 1/4] mm: Add optional close() to struct vm_special_mapping
Date: Mon, 12 Aug 2024 18:26:02 +1000
Message-ID: <20240812082605.743814-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an optional close() callback to struct vm_special_mapping. It will
be used, by powerpc at least, to handle unmapping of the VDSO.

Although support for unmapping the VDSO was initially added
for CRIU[1], it is not desirable to guard that support behind
CONFIG_CHECKPOINT_RESTORE.

There are other known users of unmapping the VDSO which are not related
to CRIU, eg. Valgrind [2] and void-ship [3].

The powerpc arch_unmap() hook has been in place for ~9 years, with no
ifdef, so there may be other unknown users that have come to rely on
unmapping the VDSO. Even if the code was behind an ifdef, major distros
enable CHECKPOINT_RESTORE so users may not realise unmapping the VDSO
depends on that configuration option.

It's also undesirable to have such core mm behaviour behind a relatively
obscure CONFIG option.

Longer term the unmap behaviour should be standardised across
architectures, however that is complicated by the fact the VDSO pointer
is stored differently across architectures. There was a previous attempt
to unify that handling [4], which could be revived.

See [5] for further discussion.

[1]: commit 83d3f0e90c6c ("powerpc/mm: tracking vDSO remap")
[2]: https://sourceware.org/git/?p=valgrind.git;a=commit;h=3a004915a2cbdcdebafc1612427576bf3321eef5
[3]: https://github.com/insanitybit/void-ship
[4]: https://lore.kernel.org/lkml/20210611180242.711399-17-dima@arista.com/
[5]: https://lore.kernel.org/linuxppc-dev/shiq5v3jrmyi6ncwke7wgl76ojysgbhrchsk32q4lbx2hadqqc@kzyy2igem256

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm_types.h | 3 +++
 mm/mmap.c                | 6 ++++++
 2 files changed, 9 insertions(+)

v2:
- Add some blank lines as requested.
- Expand special_mapping_close() comment.
- Add David's reviewed-by.
- Expand change log to capture review discussion.

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 485424979254..78bdfc59abe5 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1313,6 +1313,9 @@ struct vm_special_mapping {
 
 	int (*mremap)(const struct vm_special_mapping *sm,
 		     struct vm_area_struct *new_vma);
+
+	void (*close)(const struct vm_special_mapping *sm,
+		      struct vm_area_struct *vma);
 };
 
 enum tlb_flush_reason {
diff --git a/mm/mmap.c b/mm/mmap.c
index d0dfc85b209b..af4dbf0d3bd4 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3620,10 +3620,16 @@ void vm_stat_account(struct mm_struct *mm, vm_flags_t flags, long npages)
 static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
 
 /*
+ * Close hook, called for unmap() and on the old vma for mremap().
+ *
  * Having a close hook prevents vma merging regardless of flags.
  */
 static void special_mapping_close(struct vm_area_struct *vma)
 {
+	const struct vm_special_mapping *sm = vma->vm_private_data;
+
+	if (sm->close)
+		sm->close(sm, vma);
 }
 
 static const char *special_mapping_name(struct vm_area_struct *vma)
-- 
2.45.2


