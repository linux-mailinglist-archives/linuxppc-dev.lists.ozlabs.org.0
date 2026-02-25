Return-Path: <linuxppc-dev+bounces-17178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENX6EGTXnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717DC196358
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWvd24Drz3f26;
	Wed, 25 Feb 2026 22:05:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772017501;
	cv=none; b=k+APpMZaizrDtoDo6Nn86rQQbYmtTCMyBhdjU26Ugiarr0tGmipDFBxxXUvfwT+sx/y+l7/eVx/OqtrDVMPS8nQ4g4NizQ8w3pnID9PSNzDeJbgxmJ3guql15sh+u70ZprenxrkkShmZpT4hLxGyP76V+IpCpUzGykWr1eEJlh/+PWVkJ+2pmM7fBhQ42clCuNDYB32yVlAG3JBz8xA6E285PFEGcoyLdc6dUIDosHRDOlSYSxjTIGDZeQ0X8B/hEpJi8B9L7LxFkG+W/aRpmlD8GlPTDDkWai+RDcZVH9MOoPlEZ+mcUMmylHA5iv1vbT9vd1xrP8E5w6CQFuYeuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772017501; c=relaxed/relaxed;
	bh=uIfE69Tr1GqPmumwQezrrcMFO68ntbjafUDqg2qd9K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxMvBphaDtEdkt1lhDvBlo0lMuux2w+9rdlyDV/Gf5JTASZmzb18CNNJMYB8gyIRaKnLsnvMt/aAtIYOU+2GO2CA5MHewNw1LAUZ9rrT+5uER8UHaGgTssuksKQ54i1SE+WU3CA71PwFJrWI/1bywFJqhNRoruy7pQaqVeAnbMQWkULLDOuP3vSz7bMJ1CDJzmqRB85yBXOdQ57VSIxzF6v+aHUwfsrRHt14llfpCHh8bDwVORzajqSf2ljckDkIwid6vl3fqaqzOMRBocAC4cfKvL3ShCysZ6LnGsMZ37qcRMDLPI+/vvLb0ARcA126coQ5Z5FFMACfSkkacyf2QA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MVeLjA78; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MVeLjA78;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWvc4L5yz3f22
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:05:00 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a7d98c1879so42117315ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017498; x=1772622298; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIfE69Tr1GqPmumwQezrrcMFO68ntbjafUDqg2qd9K4=;
        b=MVeLjA780SpvjRrsEgVpTwwfU2sM3kuaud/znPwtZ3oRfMWg6n22NDU/nbue/4Y0Ud
         7Q9ZIBjq+C2ELb2XTVKNATl3TBqC/+NeNJEFkHi/F6o8pookm2o27OTMRB5aImY5Q/JR
         y3bHc92penu4FTtT5XCAr2h3u4nwWj4oBcVsGFR9emSVDuIIDPxoo9zmFWdhXSTcGeS4
         NN7GYGlbD2Z5NBjUrKygY0Y845NAkMqz8o9RPija5VFevsgyuAU1KFoLP8HKDzhJS3HW
         EPV3tueNRbtcuLVxz942VV88SJbVNIgR+0iQ9+b6ddiX9N20A/I/gqeQBR4zWaVrAXVb
         1jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017498; x=1772622298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uIfE69Tr1GqPmumwQezrrcMFO68ntbjafUDqg2qd9K4=;
        b=W//fhLEous42Cs0GljtSB/ICrozMbUDeoEldEUMfiJMSb+VMAJaHpSqHPVHZuTEFGT
         Acfdkw3NAuaMEXNqC06m3iY0r6Ovh7fkmJqNV5kV2gYMdyo6ftAnf/Q9p1zQdpkkDS3X
         VgBpurNhX3UAKxAbEFtwsl9NukdUEGE//Gxb6ekEfP3liKLBY9LznWG4LVf6nqYcxofs
         6h1EUjxlaUe8eQp7vcwz67KNwt04RSQoZgiplrRIVqiMKALjg7RHJUkYw6wkni8+AWyC
         vGp4t2YLH7y4E2twNbCDPaCsrBRnEu4jjvxJZUZo4PP21U/HGY9Cn47fPgu639HoOXT6
         IDxw==
X-Gm-Message-State: AOJu0YxCdeqQ17xsgILgY33MpHFbmtUGlXhabD+HVi0ywjTY2HvssAgj
	mtxU7qq+1IJqJKRYU7aVfuqpK1J4bSz/mN4VLHu3Qh2szQ5l5s8QQdBpastn+A==
X-Gm-Gg: ATEYQzydeVZxBpPV6bjmNRbisP3asBYVZ1ohHbEHRQLlU6rXuWOx4crYVdUs7lRGaGh
	jdhuv/rnd18RfHhZaHV/Qwjup61/7j/jt9XtadFBmgLu/tpHWsFW6CqMVg0fAj3fum62+GPS6mD
	QxoK+uk3TFHbJZKw+fM4uLtOzK+4kZlqIjVLjRiLs8qc+39lTawg/Y9ktnkSuECi8FdC5poDeMd
	wgNsHWhDSB/wQ4JXt3ZG5WHNyFf+HO6dAGe8s75a0klJI3J3qSQJghULx9nCYTTLoUFhMSMb0m1
	bb3EcyacxkQP4AYuvQaNlEDoEVHUYxD1L4lfTIRbqfNX75iu/QdnGBj3G+xVcubrKGhSkkTwozd
	dzCTzg1NTzDXvXuJq2Jj2LJY9a3LrWPe3aCfs24X4upNWSXAeZphp3S3YE7b7AQGta6UYK7T8iA
	YY+Zbs8+lM0VYic5HNlwBiqdRLwJUv4pw=
X-Received: by 2002:a17:903:985:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2ad7456d474mr147228985ad.50.1772017498087;
        Wed, 25 Feb 2026 03:04:58 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:04:57 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v1 03/10] mm/debug_vm_pgtable.c: Add test to zap THP migration entry
Date: Wed, 25 Feb 2026 16:34:24 +0530
Message-ID: <733f1640590bf927a4cdef854c4656931922416e.1772013273.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772013273.git.ritesh.list@gmail.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17178-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 717DC196358
X-Rspamd-Action: no action

As discussed in the previous patch, there is a race possible with
zap_huge_pmd() and migrate_pages().
This adds a verification test.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 mm/debug_vm_pgtable.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 83cf07269f13..802f9f03c8ef 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -837,8 +837,45 @@ static void __init pmd_softleaf_tests(struct pgtable_debug_args *args)
 	pmd2 = __swp_entry_to_pmd(arch_entry);
 	WARN_ON(memcmp(&pmd1, &pmd2, sizeof(pmd1)));
 }
+
+
+static void __init pmd_thp_migration_zap_tests(struct pgtable_debug_args *args)
+{
+	pmd_t pmd;
+	unsigned long vaddr = args->vaddr & HPAGE_PMD_MASK;
+
+	if (!has_transparent_hugepage() || !thp_migration_supported())
+		return;
+
+	pr_debug("Validating PMD zap on THP migration entry\n");
+
+	pmd = swp_entry_to_pmd(args->leaf_entry);
+	pgtable_trans_huge_deposit(args->mm, args->pmdp, args->start_ptep);
+
+	/* Verify that it's a valid migration PMD before we proceed */
+	WARN_ON(!pmd_is_huge(pmd));
+	WARN_ON(!pmd_is_valid_softleaf(pmd));
+	WARN_ON(pmd_present(pmd));
+	WARN_ON(pmd_none(pmd));
+
+	/* Install the migration PMD entry */
+	set_pmd_at(args->mm, vaddr, args->pmdp, pmd);
+
+	/*
+	 * THP migration path can race with zap_huge_pmd(), which calls
+	 * pmdp_huge_get_and_clear_full().
+	 */
+	pmd = pmdp_huge_get_and_clear_full(args->vma, vaddr, args->pmdp, 1);
+
+	WARN_ON(!pmd_is_valid_softleaf(pmd));
+	WARN_ON(!pmd_none(pmdp_get(args->pmdp)));
+
+	pgtable_trans_huge_withdraw(args->mm, args->pmdp);
+}
+
 #else  /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
 static void __init pmd_softleaf_tests(struct pgtable_debug_args *args) { }
+static void __init pmd_thp_migration_zap_tests(struct pgtable_debug_args *args) { }
 #endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
 
 static void __init swap_migration_tests(struct pgtable_debug_args *args)
@@ -1348,6 +1385,7 @@ static int __init debug_vm_pgtable(void)
 	pmd_clear_tests(&args);
 	pmd_advanced_tests(&args);
 	pmd_huge_tests(&args);
+	pmd_thp_migration_zap_tests(&args);
 	pmd_populate_tests(&args);
 	spin_unlock(ptl);
 
-- 
2.53.0


