Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E96D43284F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 08:07:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HPhp2JS7zDqT4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 16:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o+xKcdEE"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HPg510nDzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 16:05:36 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d126so9968638pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2019 23:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FSW3QAiCKUdD3/c+a3MOVowtAUYbQ41sTUXIpls+Wao=;
 b=o+xKcdEEW6FM2xHLjs9F7jVlLK1sHNVof3+zRuC6cE1o8DVfLBsBOkKOg3qVKVquEI
 Pi6esQJjTngOyl4oJWLxTZnrIZz2dMBXid6+JF54Ik/OFdjvVFvF2H64kAPGww1H4TTz
 djG4QFDv3HnqFP5GPMyVbBvhiC7FpIo0iA30h89Ebs9tFVe/a3MqUw3tWyIQL90UnT5h
 DTEdKgnOCdLnbqKDTiPUxrjnmp0rux5zdvp4CVpRtD7kZd2sl0ZITUKO79iDXiqxcsDl
 5Q5t/M4P+OWtL+rcMg8330LIctE7WUccP57ps+3ZtoJ/5iU7ZVQiTTE63E7wBqKFd1F4
 DFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FSW3QAiCKUdD3/c+a3MOVowtAUYbQ41sTUXIpls+Wao=;
 b=TzhC4Fw4ZBSNuv6K49cVdEgv0C9QQlh7l3mYlVbX23DdPk7Vnch0hJVdJ8H7b9RpxB
 ssfXQv+AyRXHh66FzP0SdfUIRWsj31GaU1kKNMxpmc7b3BEXPOI/x+0mdtpZ08LIY0yT
 0UzI6Y+vmixbl1v4+krGUrl+2of3eVr5Jfnkh8IQ+8daNn29EmGoaB4Egc6j1uDDQ2rt
 Y4mwGHekemb6GNM4LH60wQ3M57bHQ6cWf5EJCDyRen83dQBnw4gbezqwHUYP8cjWTrCD
 uANrKy/wB3UYHz6xwtyxxxVjZOgs6BmtjR+9gSunTRpaSNe3IgEqCnFJs7srivUrBogB
 rijg==
X-Gm-Message-State: APjAAAXFwStOJA8gSkdEhV/dSer7e2+Fgm/6GcsbH3tohC04g0pg3qrj
 CMcm6bW6a38qYE3sM/KsmrKfRtdP
X-Google-Smtp-Source: APXvYqw5mz0L7N4YzdfhdZLwwpPy6VZHQo0erOMYKbGBjfxpXxbVTPtbEisdjY0GaDi9TDjChxzWzA==
X-Received: by 2002:a17:90a:de0e:: with SMTP id
 m14mr27637867pjv.36.1559541933267; 
 Sun, 02 Jun 2019 23:05:33 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.220])
 by smtp.gmail.com with ESMTPSA id a12sm3025067pje.3.2019.06.02.23.05.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 23:05:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix THP PMD collapse serialisation
Date: Mon,  3 Jun 2019 16:05:31 +1000
Message-Id: <20190603060531.13088-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion
in pte helpers") changed the actual bitwise tests in pte_access_permitted
by using pte_write() and pte_present() helpers rather than raw bitwise
testing _PAGE_WRITE and _PAGE_PRESENT bits.

The pte_present change now returns true for ptes which are !_PAGE_PRESENT
and _PAGE_INVALID, which is the combination used by pmdp_invalidate to
synchronize access from lock-free lookups. pte_access_permitted is used by
pmd_access_permitted, so allowing GUP lock free access to proceed with
such PTEs breaks this synchronisation.

This bug has been observed on HPT host, with random crashes and corruption
in guests, usually together with bad PMD messages in the host.

Fix this by adding an explicit check in pmd_access_permitted, and
documenting the condition explicitly.

The pte_write() change should be okay, and would prevent GUP from falling
back to the slow path when encountering savedwrite ptes, which matches
what x86 (that does not implement savedwrite) does.

Fixes: 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion in pte helpers")
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 19 ++++++++++++++++++-
 arch/powerpc/mm/book3s64/pgtable.c           |  3 +++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 7dede2e34b70..aaa72aa1b765 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1092,7 +1092,24 @@ static inline int pmd_protnone(pmd_t pmd)
 #define pmd_access_permitted pmd_access_permitted
 static inline bool pmd_access_permitted(pmd_t pmd, bool write)
 {
-	return pte_access_permitted(pmd_pte(pmd), write);
+	pte_t pte = pmd_pte(pmd);
+	unsigned long pteval = pte_val(pte);
+
+	/*
+	 * pmdp_invalidate sets this combination (that is not caught by
+	 * !pte_present() check in pte_access_permitted), to prevent
+	 * lock-free lookups, as part of the serialize_against_pte_lookup()
+	 * synchronisation.
+	 *
+	 * This check inadvertently catches the case where the PTE's hardware
+	 * PRESENT bit is cleared while TLB is flushed, to work around
+	 * hardware TLB issues. This is suboptimal, but should not be hit
+	 * frequently and should be harmless.
+	 */
+	if ((pteval & _PAGE_INVALID) && !(pteval & _PAGE_PRESENT))
+		return false;
+
+	return pte_access_permitted(pte, write);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 16bda049187a..ff98b663c83e 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -116,6 +116,9 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	/*
 	 * This ensures that generic code that rely on IRQ disabling
 	 * to prevent a parallel THP split work as expected.
+	 *
+	 * Marking the entry with _PAGE_INVALID && ~_PAGE_PRESENT requires
+	 * a special case check in pmd_access_permitted.
 	 */
 	serialize_against_pte_lookup(vma->vm_mm);
 	return __pmd(old_pmd);
-- 
2.20.1

