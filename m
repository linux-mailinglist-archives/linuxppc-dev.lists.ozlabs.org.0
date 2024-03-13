Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA3687B3E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:50:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YeQc9kMI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VXnQY/fI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw41g42Ycz3vYC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:50:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YeQc9kMI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VXnQY/fI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yX5v2vz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vtZJyICZEGrBJHpYWSu5beimQ7UmPGzVa4S5UCB/Dcs=;
	b=YeQc9kMIJnzFU21uNz/0XHapVQ9Ht6kAArhV6nFscCO+u4Lyrd/27NENelJ4Y9/ALASmOm
	mUtqIW2Q16T8MFmN3O4retQ4Kj3oRXPdyJxA3kgi+kOWh5ncoPkYkqdeNzVy7JWXF9ZpZN
	7YdzHxsHD1HBpRIkZGAXFhBMPufFmPs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vtZJyICZEGrBJHpYWSu5beimQ7UmPGzVa4S5UCB/Dcs=;
	b=VXnQY/fIA42ABTURCUTHr1O8Sz9e60YC0EdfofP5vjF9xj0Z7H+iGHE2dFSiMoMPOr+4xf
	jOYOhzpfawAj4IeihSWJu2uFNhWRFsrBmXeBlE0VjQM3ijh6d4rth3heBBKaE51Vsw9vIe
	OUCpf3jaXnqKo6YgFcmYG0EgROaN9Dg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-I7S1HcS1OrSZH8PYkxsPNw-1; Wed, 13 Mar 2024 17:47:28 -0400
X-MC-Unique: I7S1HcS1OrSZH8PYkxsPNw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-690b5ad0e61so1037516d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366447; x=1710971247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtZJyICZEGrBJHpYWSu5beimQ7UmPGzVa4S5UCB/Dcs=;
        b=MTXNQOeNBf/MX4e48S0ylJZsLaETUjD6ihuMUUbq4RGVIgSzbevQVfhL+y5N2b7E4z
         nc8Gk4tt53AaJ3plQdTjLb4BKb9ic5DFwNipbWn0Ew37gxyMBZobTV2N3FF0G+hGeQHa
         7wWrYpKa9XOTV2dO5iKlGKXldysINf4zDDpI6pcX5A4r3Ug/I0HIwOmGml405STslcWY
         bpONUfGpVfRmFce4ykHzanjtfjA7oEachDWHSOQLp4xcWfkdOIJxxUUboJtx/QKCkfKK
         qaUvlwterRAlwnCIjSh9LYGep2tMoG8N+1yWehiMXBbBIRfOD4JJo329/bG1+OWv/2ac
         1mkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Epu5xjvG3uxhXVvQGWsdelhRTHSi51cLHzyWiUzZNDN9agGLQIHHACr/eLnwkePmOCbs8AssA4+lcmzl4u7p6E0DDJ68CDXmANftVA==
X-Gm-Message-State: AOJu0YwhSzAHs3wlUUSGlPujeL/06Xut+oI5zXBLkWXy2AIHUrCfMQN8
	fFtu7xbiZ+0ZwGnKQ9ycEaUN9v7UpS4FCQb9JVADQ8nPRWv+hNQcMzdXkD4VHDladoFghClysLo
	TRhsoA3aKTldp6OrnjuSjS4d6GrQKAvWteKiJ6rpkAkkpt9D9Q1sCVXKW8afDvNI=
X-Received: by 2002:a0c:f508:0:b0:690:b02c:2a5f with SMTP id j8-20020a0cf508000000b00690b02c2a5fmr13464427qvm.4.1710366447577;
        Wed, 13 Mar 2024 14:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIi4iLkgKJ4BRvvEEi/kkT0r+z7XC1hachuRmolyjwCQk4v8XzYiXmWJ7FNVheaziOarzFKQ==
X-Received: by 2002:a0c:f508:0:b0:690:b02c:2a5f with SMTP id j8-20020a0cf508000000b00690b02c2a5fmr13464414qvm.4.1710366447219;
        Wed, 13 Mar 2024 14:47:27 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:26 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 04/13] mm/x86: Change pXd_huge() behavior to exclude swap entries
Date: Wed, 13 Mar 2024 17:47:10 -0400
Message-ID: <20240313214719.253873-5-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313214719.253873-1-peterx@redhat.com>
References: <20240313214719.253873-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Muchun Song <muchun.song@linux.dev>, Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

This patch partly reverts below commits:

3a194f3f8ad0 ("mm/hugetlb: make pud_huge() and follow_huge_pud() aware of non-present pud entry")
cbef8478bee5 ("mm/hugetlb: pmd_huge() returns true for non-present hugepage")

Right now, pXd_huge() definition across kernel is unclear. We have two
groups that think differently on swap entries:

  - x86/sparc:     Allow pXd_huge() to accept swap entries
  - all the rest:  Doesn't allow pXd_huge() to accept swap entries

This is so confusing.  Since the sparc helpers seem to be added in 2016,
which is after x86's (2015), so sparc could have followed a trend.  x86
proposed such swap handling in 2015 to resolve hugetlb swap entries hit in
GUP, but now GUP guards swap entries with !pXd_present() in all layers so
we should be safe.

We should define this API properly, one way or another, rather than keep
them defined differently across archs.

Gut feeling tells me that pXd_huge() shouldn't include swap entries, and it
turns out that I am not the only one thinking so, the question was raised
when the current pmd_huge() for x86 was proposed by Ville Syrjälä:

https://lore.kernel.org/all/Y2WQ7I4LXh8iUIRd@intel.com/

  I might also be missing something obvious, but why is it even necessary
  to treat PRESENT==0+PSE==0 as a huge entry?

It is also questioned when Jason Gunthorpe reviewed the other patchset on
swap entry handlings:

https://lore.kernel.org/all/20240221125753.GQ13330@nvidia.com/

Revert its meaning back to original.  It shouldn't have any functional
change as we should be ready with guards on !pXd_present() explicitly
everywhere.

Note that I also dropped the "#if CONFIG_PGTABLE_LEVELS > 2", it was there
probably because it was breaking things when 3a194f3f8ad0 was proposed,
according to the report here:

https://lore.kernel.org/all/Y2LYXItKQyaJTv8j@intel.com/

Now we shouldn't need that.

Instead of reverting to _PAGE_PSE raw check, leverage pXd_leaf().

Cc: Naoya Horiguchi <naoya.horiguchi@nec.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/mm/hugetlbpage.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 5804bbae4f01..8362953a24ce 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -20,29 +20,19 @@
 #include <asm/elf.h>
 
 /*
- * pmd_huge() returns 1 if @pmd is hugetlb related entry, that is normal
- * hugetlb entry or non-present (migration or hwpoisoned) hugetlb entry.
- * Otherwise, returns 0.
+ * pmd_huge() returns 1 if @pmd is hugetlb related entry.
  */
 int pmd_huge(pmd_t pmd)
 {
-	return !pmd_none(pmd) &&
-		(pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;
+	return pmd_leaf(pmd);
 }
 
 /*
- * pud_huge() returns 1 if @pud is hugetlb related entry, that is normal
- * hugetlb entry or non-present (migration or hwpoisoned) hugetlb entry.
- * Otherwise, returns 0.
+ * pud_huge() returns 1 if @pud is hugetlb related entry.
  */
 int pud_huge(pud_t pud)
 {
-#if CONFIG_PGTABLE_LEVELS > 2
-	return !pud_none(pud) &&
-		(pud_val(pud) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;
-#else
-	return 0;
-#endif
+	return pud_leaf(pud);
 }
 
 #ifdef CONFIG_HUGETLB_PAGE
-- 
2.44.0

