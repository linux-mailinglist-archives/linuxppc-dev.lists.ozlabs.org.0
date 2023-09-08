Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FC79835E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 09:43:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=0Tr1RiLs;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=r9UDzDCi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rhp4p3W7dz3cD3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 17:43:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=0Tr1RiLs;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=r9UDzDCi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=suse.cz (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhp3x50SHz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 17:42:36 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2588421832;
	Fri,  8 Sep 2023 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1694158947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NHJKcpKlZ/+yii6ZB0cLfqW7JVxO+ELAe/deKUrmJ80=;
	b=0Tr1RiLsGK9TKLdxwSc9RwxLIVKmEae8PGUWUTGhYIhqkvcnxmKXE3HYt5+5SqUjjUpxEZ
	DCTZmPbwNt5ToqgWZJ00UT0I0Plhw1i14U2HJUY0Px379BJbaU56+RSKEu8z+V/xOMo2xd
	woPLeoFeQ7kp5dfAXicDw3PDice1ftM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1694158947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NHJKcpKlZ/+yii6ZB0cLfqW7JVxO+ELAe/deKUrmJ80=;
	b=r9UDzDCi5/bP4K3dBarcJVpQtk/FZHh8rlyYCrXu3EqfT7loeAs6cgqxhTivXkBssY2kKX
	lV8TgWuOzutVQyDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96D2A132F2;
	Fri,  8 Sep 2023 07:42:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WIYoJGLQ+mTfFQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Fri, 08 Sep 2023 07:42:26 +0000
From: Vlastimil Babka <vbabka@suse.cz>
To: seanjc@google.com
Subject: [PATCH gmem FIXUP v2] mm, compaction: make testing mapping_unmovable() safe
Date: Fri,  8 Sep 2023 09:42:23 +0200
Message-ID: <20230908074222.28723-2-vbabka@suse.cz>
X-Mailer: git-send-email 2.42.0
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, anup@brainfault.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, ackerleytng@google.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, maz@kernel.org, linux-fsdevel@vger.kernel.org, liam.merwick@oracle.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As Kirill pointed out, mapping can be removed under us due to
truncation. Test it under folio lock as already done for the async
compaction / dirty folio case. To prevent locking every folio with
mapping to do the test, do it only for unevictable folios, as we can
expect the unmovable mapping folios are also unevictable. To enforce
that expecation, make mapping_set_unmovable() also set AS_UNEVICTABLE.

Also incorporate comment update suggested by Matthew.

Fixes: 3424873596ce ("mm: Add AS_UNMOVABLE to mark mapping as completely unmovable")
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
v2: mapping_set_unmovable() sets also AS_UNEVICTABLE, as Sean suggested.

 include/linux/pagemap.h |  6 +++++
 mm/compaction.c         | 49 +++++++++++++++++++++++++++--------------
 virt/kvm/guest_mem.c    |  2 +-
 3 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 931d2f1da7d5..4070c59e6f25 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -276,6 +276,12 @@ static inline int mapping_use_writeback_tags(struct address_space *mapping)
 
 static inline void mapping_set_unmovable(struct address_space *mapping)
 {
+	/*
+	 * It's expected unmovable mappings are also unevictable. Compaction
+	 * migrate scanner (isolate_migratepages_block()) relies on this to
+	 * reduce page locking.
+	 */
+	set_bit(AS_UNEVICTABLE, &mapping->flags);
 	set_bit(AS_UNMOVABLE, &mapping->flags);
 }
 
diff --git a/mm/compaction.c b/mm/compaction.c
index a3d2b132df52..e0e439b105b5 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -862,6 +862,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 
 	/* Time to isolate some pages for migration */
 	for (; low_pfn < end_pfn; low_pfn++) {
+		bool is_dirty, is_unevictable;
 
 		if (skip_on_failure && low_pfn >= next_skip_pfn) {
 			/*
@@ -1047,10 +1048,6 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
 			goto isolate_fail_put;
 
-		/* The mapping truly isn't movable. */
-		if (mapping && mapping_unmovable(mapping))
-			goto isolate_fail_put;
-
 		/*
 		 * Only allow to migrate anonymous pages in GFP_NOFS context
 		 * because those do not depend on fs locks.
@@ -1062,8 +1059,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!folio_test_lru(folio))
 			goto isolate_fail_put;
 
+		is_unevictable = folio_test_unevictable(folio);
+
 		/* Compaction might skip unevictable pages but CMA takes them */
-		if (!(mode & ISOLATE_UNEVICTABLE) && folio_test_unevictable(folio))
+		if (!(mode & ISOLATE_UNEVICTABLE) && is_unevictable)
 			goto isolate_fail_put;
 
 		/*
@@ -1075,26 +1074,42 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_writeback(folio))
 			goto isolate_fail_put;
 
-		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_dirty(folio)) {
-			bool migrate_dirty;
+		is_dirty = folio_test_dirty(folio);
+
+		if (((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty)
+		    || (mapping && is_unevictable)) {
+			bool migrate_dirty = true;
+			bool is_unmovable;
 
 			/*
-			 * Only pages without mappings or that have a
-			 * ->migrate_folio callback are possible to migrate
-			 * without blocking. However, we can be racing with
-			 * truncation so it's necessary to lock the page
-			 * to stabilise the mapping as truncation holds
-			 * the page lock until after the page is removed
-			 * from the page cache.
+			 * Only folios without mappings or that have
+			 * a ->migrate_folio callback are possible to migrate
+			 * without blocking.
+			 *
+			 * Folios from unmovable mappings are not migratable.
+			 *
+			 * However, we can be racing with truncation, which can
+			 * free the mapping that we need to check. Truncation
+			 * holds the folio lock until after the folio is removed
+			 * from the page so holding it ourselves is sufficient.
+			 *
+			 * To avoid this folio locking to inspect every folio
+			 * with mapping for being unmovable, we assume every
+			 * such folio is also unevictable, which is a cheaper
+			 * test. If our assumption goes wrong, it's not a bug,
+			 * just potentially wasted cycles.
 			 */
 			if (!folio_trylock(folio))
 				goto isolate_fail_put;
 
 			mapping = folio_mapping(folio);
-			migrate_dirty = !mapping ||
-					mapping->a_ops->migrate_folio;
+			if ((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) {
+				migrate_dirty = !mapping ||
+						mapping->a_ops->migrate_folio;
+			}
+			is_unmovable = mapping && mapping_unmovable(mapping);
 			folio_unlock(folio);
-			if (!migrate_dirty)
+			if (!migrate_dirty || is_unmovable)
 				goto isolate_fail_put;
 		}
 
diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index c81d2bb9ae93..85903c32163f 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -390,7 +390,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags,
 	inode->i_size = size;
 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
 	mapping_set_large_folios(inode->i_mapping);
-	mapping_set_unevictable(inode->i_mapping);
+	/* this also sets the mapping as unevictable */
 	mapping_set_unmovable(inode->i_mapping);
 
 	fd = get_unused_fd_flags(0);
-- 
2.42.0

