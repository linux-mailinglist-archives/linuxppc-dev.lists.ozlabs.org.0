Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6F79F78A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:07:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YU/kmkeO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLLc388bz3bTn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:07:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YU/kmkeO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3l2gczqykddgmyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL5G2fPKz3c5K
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:56:02 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c40ac5b6e7so2355445ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656561; x=1695261361; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IroGtA6z4X06VM4XXyW5Hwunrfyb2UP8Ai0nAjfYz+0=;
        b=YU/kmkeOHNE6Eoo93ML3ndFdjamo2RP9V7wJFDckzUqHc+J5M/Xox2wPgaLUg+AwUI
         Jn7rWsQJdMMlLKhR8c899XarXPFOKaYjWVjWTNtF/93HGwJ9Af0nUo01oREDxzayGQUP
         9VIeXZd+B3S6W9Gl+pMg5fDWtXX2Ww6kTy0RAq9ahbSAoUoTVmmNGmFYKif93enFHxyM
         ETSJIoHxPKZK0HrguiNEMsg90I+ASd0LKG2o++Ip9oqkk9mBhi/HdGAAyDJDQTfDTZr9
         VVSWnJem7EXzJ6vTF9chmo/DnNKE17akIHF42ESU3uqkjFvYvktj+rDhBjqbZpm8nPGp
         ujjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656561; x=1695261361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IroGtA6z4X06VM4XXyW5Hwunrfyb2UP8Ai0nAjfYz+0=;
        b=Q7fgmKcyFjvwdwic1ISJk9lVY6QRo2IzfNeG3Dh1dWIkGR+zq4nZFodt51N9o9aoPu
         KY3B5apw7r93OZJdTJnHzlbG7oNfFhQ7KOtRmy16iGMBvh8HXn9zaX+Ibpb4k8LnckNz
         Ms2IrLsVxDJWmF2pkqAFkSAzTAXZol2Lw/rSWgbo9+3WV2bKl79GcSij1ZYsNlMErDRk
         wpBzOjL3XGW+KyZyDXvkvBv/VxQYBLD/xZjcRUgf7Rz+To/XhohfN+ZLrIpOF7Je2mNI
         wr6aVIqbcSzyaJMq3HsTrKlk6HMZliAhkcqXuVev5B+Y61LOImtGHehk4751NesSYLv9
         wTSQ==
X-Gm-Message-State: AOJu0YzMAZ5gL8vsvISpIaYvOfirNZhLbntTRyMsdjoZg0ffjHUcgiw9
	xusUzbu+RvosinwcsBe5LjAIu7LmjAM=
X-Google-Smtp-Source: AGHT+IGFyRd+BYegO6/D6beA7XY/sIg6slB9OxyqJyx+o15XvIYq7E/XS8tz54WBztwLFVG+Qn77mgnd2p8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:fb83:b0:1c0:ac09:4032 with SMTP id
 lg3-20020a170902fb8300b001c0ac094032mr144135plb.9.1694656559883; Wed, 13 Sep
 2023 18:55:59 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:10 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-13-seanjc@google.com>
Subject: [RFC PATCH v12 12/33] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Ani
 sh Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add an "unmovable" flag for mappings that cannot be migrated under any
circumstance.  KVM will use the flag for its upcoming GUEST_MEMFD support,
which will not support compaction/migration, at least not in the
foreseeable future.

Test AS_UNMOVABLE under folio lock as already done for the async
compaction/dirty folio case, as the mapping can be removed by truncation
while compaction is running.  To avoid having to lock every folio with a
mapping, assume/require that unmovable mappings are also unevictable, and
have mapping_set_unmovable() also set AS_UNEVICTABLE.

Cc: Matthew Wilcox <willy@infradead.org>
Co-developed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/pagemap.h | 19 +++++++++++++++++-
 mm/compaction.c         | 43 +++++++++++++++++++++++++++++------------
 mm/migrate.c            |  2 ++
 3 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 351c3b7f93a1..82c9bf506b79 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -203,7 +203,8 @@ enum mapping_flags {
 	/* writeback related tags are not used */
 	AS_NO_WRITEBACK_TAGS = 5,
 	AS_LARGE_FOLIO_SUPPORT = 6,
-	AS_RELEASE_ALWAYS,	/* Call ->release_folio(), even if no private data */
+	AS_RELEASE_ALWAYS = 7,	/* Call ->release_folio(), even if no private data */
+	AS_UNMOVABLE	= 8,	/* The mapping cannot be moved, ever */
 };
 
 /**
@@ -289,6 +290,22 @@ static inline void mapping_clear_release_always(struct address_space *mapping)
 	clear_bit(AS_RELEASE_ALWAYS, &mapping->flags);
 }
 
+static inline void mapping_set_unmovable(struct address_space *mapping)
+{
+	/*
+	 * It's expected unmovable mappings are also unevictable. Compaction
+	 * migrate scanner (isolate_migratepages_block()) relies on this to
+	 * reduce page locking.
+	 */
+	set_bit(AS_UNEVICTABLE, &mapping->flags);
+	set_bit(AS_UNMOVABLE, &mapping->flags);
+}
+
+static inline bool mapping_unmovable(struct address_space *mapping)
+{
+	return test_bit(AS_UNMOVABLE, &mapping->flags);
+}
+
 static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
 {
 	return mapping->gfp_mask;
diff --git a/mm/compaction.c b/mm/compaction.c
index 38c8d216c6a3..12b828aed7c8 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -883,6 +883,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 
 	/* Time to isolate some pages for migration */
 	for (; low_pfn < end_pfn; low_pfn++) {
+		bool is_dirty, is_unevictable;
 
 		if (skip_on_failure && low_pfn >= next_skip_pfn) {
 			/*
@@ -1080,8 +1081,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!folio_test_lru(folio))
 			goto isolate_fail_put;
 
+		is_unevictable = folio_test_unevictable(folio);
+
 		/* Compaction might skip unevictable pages but CMA takes them */
-		if (!(mode & ISOLATE_UNEVICTABLE) && folio_test_unevictable(folio))
+		if (!(mode & ISOLATE_UNEVICTABLE) && is_unevictable)
 			goto isolate_fail_put;
 
 		/*
@@ -1093,26 +1096,42 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_writeback(folio))
 			goto isolate_fail_put;
 
-		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_dirty(folio)) {
-			bool migrate_dirty;
+		is_dirty = folio_test_dirty(folio);
+
+		if (((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) ||
+		    (mapping && is_unevictable)) {
+			bool migrate_dirty = true;
+			bool is_unmovable;
 
 			/*
 			 * Only folios without mappings or that have
-			 * a ->migrate_folio callback are possible to
-			 * migrate without blocking.  However, we may
-			 * be racing with truncation, which can free
-			 * the mapping.  Truncation holds the folio lock
-			 * until after the folio is removed from the page
-			 * cache so holding it ourselves is sufficient.
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
+			 * To avoid locking the folio just to check unmovable,
+			 * assume every unmovable folio is also unevictable,
+			 * which is a cheaper test.  If our assumption goes
+			 * wrong, it's not a correctness bug, just potentially
+			 * wasted cycles.
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
 
diff --git a/mm/migrate.c b/mm/migrate.c
index b7fa020003f3..3d25c145098d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -953,6 +953,8 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (!mapping)
 			rc = migrate_folio(mapping, dst, src, mode);
+		else if (mapping_unmovable(mapping))
+			rc = -EOPNOTSUPP;
 		else if (mapping->a_ops->migrate_folio)
 			/*
 			 * Most folios have a mapping and most filesystems
-- 
2.42.0.283.g2d96d420d3-goog

