Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C6A3833F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 06:01:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KpkV0TGGzDqDN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 14:01:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bh6Fhegr"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KpfD2J7szDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 13:58:12 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id u17so394296pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 20:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHOwJW8PXVAArob+Z/w9HeA1N1YMwiRnwXx60hJd8co=;
 b=bh6FhegrMCW9Kk3xTl7nWLi1OXcPNUB+M2Gd9uAyId/cyMqznH7fFgLAxvQaYXgheO
 RCSvkGdUZgOh7ZBcC0EPfKjQSyy4qHWumQMZAMnLnPEPqWf0u8ev1TPxlRHWqtQT2qcZ
 c99ACWX39flT/9tYnhXIQ90Z+YIyB1VSQo3GHRzygsiubRBNZZulNfjrzn4emNdf+rdN
 Eyx8FqRg7Gad+UJtva0BPlm5r1MhAAqwfiFViIG6vycsRRYzEtpl1cZ4pU621P6YZy2i
 A99CYn/j72+RR7H4ZsN69S0Z4xH1ewwSDm2mytMaT5Be0XUKCNI0Qx8l69eqaZtFHF1a
 powA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHOwJW8PXVAArob+Z/w9HeA1N1YMwiRnwXx60hJd8co=;
 b=n1WlxHNfMDdTgCUkiw8ZmtSXJwUSEUOy8JpUeU83tlaRBdu0Vb15r2CJp0doyxb4z7
 E523Jl4C8gGfzO8XBlnffntmYmXdX8G1NsuXhUuhc4H2JmHi+x44KXV8DDZ1Y1ftcDtE
 8DhVJki9XURwDZXGD3hEkb6S3YZIwbjv2d0XypNIk2Q53yAXZv624Wy034nd5BHAtCqs
 Ls9kuHzCcxUUxqv+6TubQBZJ0FiNk8VNjYYoiEKWDhuv9fllsdBfIffs2MBOByVTVfxE
 u27jgoJsKDLKyhMoykCTTIr4V/WupuKL1utI1Ly9/nY89qCS20fnboD9prfSzjuwFQw8
 9HZA==
X-Gm-Message-State: APjAAAVqa3I1mxVbqerFeHFNJGbdQvNkciKaYox5EweTiMRlS5AvqzVI
 lvaHzsprMiP++fGbc1E47BTfx2V7
X-Google-Smtp-Source: APXvYqwL0/pluNmtX8cxKn9Pvj61esE8EvrvBEB+rRatCQbMmY6IsAqtqkNKYoWtxK+53qy7Arc6OQ==
X-Received: by 2002:a17:90a:cb12:: with SMTP id
 z18mr3131940pjt.82.1559879889436; 
 Thu, 06 Jun 2019 20:58:09 -0700 (PDT)
Received: from bobo.local0.net (193-116-93-94.tpgi.com.au. [193.116.93.94])
 by smtp.gmail.com with ESMTPSA id p63sm611660pfb.70.2019.06.06.20.58.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 20:58:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: __find_linux_pte synchronization vs
 pmdp_invalidate
Date: Fri,  7 Jun 2019 13:56:36 +1000
Message-Id: <20190607035636.5446-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607035636.5446-1-npiggin@gmail.com>
References: <20190607035636.5446-1-npiggin@gmail.com>
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

The change to pmdp_invalidate to mark the pmd with _PAGE_INVALID broke
the synchronisation against lock free lookups, __find_linux_pte's
pmd_none check no longer returns true for such cases.

Fix this by adding a check for this condition as well.

Fixes: da7ad366b497 ("powerpc/mm/book3s: Update pmd_present to look at _PAGE_PRESENT bit")
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/pgtable.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index db4a6253df92..533fc6fa6726 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -372,13 +372,25 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	pdshift = PMD_SHIFT;
 	pmdp = pmd_offset(&pud, ea);
 	pmd  = READ_ONCE(*pmdp);
+
 	/*
-	 * A hugepage collapse is captured by pmd_none, because
-	 * it mark the pmd none and do a hpte invalidate.
+	 * A hugepage collapse is captured by this condition, see
+	 * pmdp_collapse_flush.
 	 */
 	if (pmd_none(pmd))
 		return NULL;
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * A hugepage split is captured by this condition, see
+	 * pmdp_invalidate.
+	 *
+	 * Huge page modification can be caught here too.
+	 */
+	if (pmd_is_serializing(pmd))
+		return NULL;
+#endif
+
 	if (pmd_trans_huge(pmd) || pmd_devmap(pmd)) {
 		if (is_thp)
 			*is_thp = true;
-- 
2.20.1

