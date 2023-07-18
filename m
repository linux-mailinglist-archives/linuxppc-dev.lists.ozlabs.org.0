Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 884827589D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 02:01:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dy1/NFlQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5GFk39H8z3dgn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 10:01:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dy1/NFlQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2001:4860:4864:20::49; helo=mail-oa1-x49.google.com; envelope-from=34ys3zaykddykwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x49.google.com (mail-oa1-x49.google.com [IPv6:2001:4860:4864:20::49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Fz12SNLz30XM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:49:01 +1000 (AEST)
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-1b78a4797e1so9610986fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724131; x=1692316131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=muvilKyoWvn1tarN80afquV4Wd3ZvyUZATzGD2ucPnA=;
        b=dy1/NFlQGuJqswhd4jyp5/5Y2DKjXWq8ZhDnL7jyfQUkTP7A9Hvq/HvrZglV4JQg4M
         0K4GnyosjYX3JEla9t9lm8LJXLHv4GUKKzg9xFm9cJWrlQ5Qmy5LmSHitAR/Xzi9H8/Y
         MjJIFDOPL8g3wik3LCZjllYyd45Gr2H0qgazCaqc+yiHTFw7sn+VQEAa9DzzRpRQoil4
         OF2suL13dOrJbxrD1Es2a+3MSZoSnJ4hgva3/KXiELtegBBB1WkzGy/iAanliFh6iYW0
         B8x8MynR4QN8rTTnTiUPKbxJnJ7ZIBs38bI6aS2sGXphM22HDrUDYnhUpurmEDIvnFzg
         o5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724131; x=1692316131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muvilKyoWvn1tarN80afquV4Wd3ZvyUZATzGD2ucPnA=;
        b=JIeK03q37Eu3kVYMMp+uDQeUfZ6xy/AFPNnaadu6gujtlPA6OJKWgZUaijRtMJT8/w
         CjjSZ34iviLGVZUECP+Aesd5LBmdF4c1Gwd1kdJ1Y/iLrExpIvN6k72dovonT1eX0IWU
         pG78gMfSkTX7B42qg+AoO+sQlKr/nRxGmqtmdHSR0hbPikKRC/i36QuARFLurDSR1e94
         7Z7lvZJMJ8hJedKUd3Q8dy4OVosVRll09CSf6r9IXISISqtxhFPJITxbr68olgM+GZwE
         emRQov07+TTKq1z+9gnUQMrOB+NhH749xJaYD+jqv/ZT/K7HviSYBR3fVtZkkSigJb6/
         rTtA==
X-Gm-Message-State: ABy/qLZX0cQkfvaUzF6aI0b7FrHBrCxXxpNxL7HOeH9K+NXrnZz0Mc1B
	J3Dsvejb/5Zb4rG3rn9E7VItLiWPBIE=
X-Google-Smtp-Source: APBJJlE49QI+GKjHT7/jwtmKHpb+kXt66N6K7QDVRkzJgeGH+MWu0bF/51TSJcseqrb6U54aALrx+EClwNQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6870:c796:b0:1b0:20bd:eef with SMTP id
 dy22-20020a056870c79600b001b020bd0eefmr758790oab.2.1689724131216; Tue, 18 Jul
 2023 16:48:51 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:53 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-11-seanjc@google.com>
Subject: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/pagemap.h | 11 +++++++++++
 mm/compaction.c         |  4 ++++
 mm/migrate.c            |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 716953ee1ebd..931d2f1da7d5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -203,6 +203,7 @@ enum mapping_flags {
 	/* writeback related tags are not used */
 	AS_NO_WRITEBACK_TAGS = 5,
 	AS_LARGE_FOLIO_SUPPORT = 6,
+	AS_UNMOVABLE	= 7,	/* The mapping cannot be moved, ever */
 };
 
 /**
@@ -273,6 +274,16 @@ static inline int mapping_use_writeback_tags(struct address_space *mapping)
 	return !test_bit(AS_NO_WRITEBACK_TAGS, &mapping->flags);
 }
 
+static inline void mapping_set_unmovable(struct address_space *mapping)
+{
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
index dbc9f86b1934..a3d2b132df52 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
 			goto isolate_fail_put;
 
+		/* The mapping truly isn't movable. */
+		if (mapping && mapping_unmovable(mapping))
+			goto isolate_fail_put;
+
 		/*
 		 * Only allow to migrate anonymous pages in GFP_NOFS context
 		 * because those do not depend on fs locks.
diff --git a/mm/migrate.c b/mm/migrate.c
index 24baad2571e3..c00a4ca86698 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -954,6 +954,8 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (!mapping)
 			rc = migrate_folio(mapping, dst, src, mode);
+		else if (mapping_unmovable(mapping))
+			rc = -EOPNOTSUPP;
 		else if (mapping->a_ops->migrate_folio)
 			/*
 			 * Most folios have a mapping and most filesystems
-- 
2.41.0.255.g8b1d071c50-goog

