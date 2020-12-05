Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F152CFA17
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 08:04:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp0t65XCkzDqlm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 18:03:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T53DZbtL; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp0l156Q4zDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 17:57:49 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id hk16so4475383pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 22:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a1tvGnEfaNu1rng4Q1t20sHjkYaWZdSh+BVKU9lSOv4=;
 b=T53DZbtLZEldP4mCs/saeYUy5MdXYsBFhyTXhieuTcNvi7+ku0UjbRPuXCtGpBkBpL
 +oKqmPyWqO6RCwSa56tlbfd4E58pHUsiymHrhf2Higxn00h7luCSOfKsJVaEKkIPolZi
 H0OzxICU4uTt6S7UMo/OT0wwfkhJ799re7k6JjbsHEgDknrOZp7TJ6Uf9WoBc36Xnf9t
 aqRXhHhIvaaZa6+Eu75qtgbcuXlgOhH8Zfx+MaqmqsaDzCMZEoDaWMXDaIGUGxHor0t9
 kf3+II2kG/nzrDcMbm/cOAdpt4L4V0RBSU+tN79R27AR6CBVimGkfHbuSX0CoB+pWssg
 Yn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a1tvGnEfaNu1rng4Q1t20sHjkYaWZdSh+BVKU9lSOv4=;
 b=a+aCOmZyr5qrIoSKUecAV0aBM/WdZgYelGGDYz/BhadfxY7syBbavU04F3ruIHpuhx
 nn/BX45cGlQUpdNfl6iVwULwf6zZiZ7c3h8FqzGO9I7XJ9YLvpBE2rx8VgyEuZY7N1Hn
 rvgcjWAk7B+Sg7vVYzCY8FYYukAjunWKxsYZ9sDvFZ/Qsseh6d/EZT6AnCTvTx+fupC5
 T+PiATi8HjFsroXghRM29KjjHTncTR04yPopOQeTG60IdDjJE97SL7uJfc5r2X+5b7gS
 WEvypbNhMq4nhXPJ5TQSrGwifTJfr2gC2F02LiUlvXIYfxnjlUqr0dxH/a7CGBzbdzo3
 7o7Q==
X-Gm-Message-State: AOAM530c9f2QRLHHw3eomq2HwNLyW24CzT7DPCXQS+KuTbYuw4mj1QYB
 rM6GkpZwehwSlZuQaJ4Dp4E=
X-Google-Smtp-Source: ABdhPJz+1vt8ZsMkacxNhF1pkvu12/PxpiVv0HEQSaTFQ/iPDEV87Cui4rJ7w/s9DapvU/HyL7DxXA==
X-Received: by 2002:a17:902:7606:b029:da:246c:5bd8 with SMTP id
 k6-20020a1709027606b02900da246c5bd8mr7004544pll.27.1607151467206; 
 Fri, 04 Dec 2020 22:57:47 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.129.145.238])
 by smtp.gmail.com with ESMTPSA id a14sm1110848pfl.141.2020.12.04.22.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 22:57:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 02/12] mm: apply_to_pte_range warn and fail if a large pte
 is encountered
Date: Sat,  5 Dec 2020 16:57:15 +1000
Message-Id: <20201205065725.1286370-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205065725.1286370-1-npiggin@gmail.com>
References: <20201205065725.1286370-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

apply_to_pte_range might mistake a large pte for bad, or treat it as a
page table, resulting in a crash or corruption. Add a test to warn and
return error if large entries are found.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/memory.c | 66 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index c48f8df6e502..3d0f0bc5d573 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2429,13 +2429,21 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
 	}
 	do {
 		next = pmd_addr_end(addr, end);
-		if (create || !pmd_none_or_clear_bad(pmd)) {
-			err = apply_to_pte_range(mm, pmd, addr, next, fn, data,
-						 create, mask);
-			if (err)
-				break;
+		if (pmd_none(*pmd) && !create)
+			continue;
+		if (WARN_ON_ONCE(pmd_leaf(*pmd)))
+			return -EINVAL;
+		if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
+			if (!create)
+				continue;
+			pmd_clear_bad(pmd);
 		}
+		err = apply_to_pte_range(mm, pmd, addr, next,
+					 fn, data, create, mask);
+		if (err)
+			break;
 	} while (pmd++, addr = next, addr != end);
+
 	return err;
 }
 
@@ -2457,13 +2465,21 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
 	}
 	do {
 		next = pud_addr_end(addr, end);
-		if (create || !pud_none_or_clear_bad(pud)) {
-			err = apply_to_pmd_range(mm, pud, addr, next, fn, data,
-						 create, mask);
-			if (err)
-				break;
+		if (pud_none(*pud) && !create)
+			continue;
+		if (WARN_ON_ONCE(pud_leaf(*pud)))
+			return -EINVAL;
+		if (!pud_none(*pud) && WARN_ON_ONCE(pud_bad(*pud))) {
+			if (!create)
+				continue;
+			pud_clear_bad(pud);
 		}
+		err = apply_to_pmd_range(mm, pud, addr, next,
+					 fn, data, create, mask);
+		if (err)
+			break;
 	} while (pud++, addr = next, addr != end);
+
 	return err;
 }
 
@@ -2485,13 +2501,21 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
 	}
 	do {
 		next = p4d_addr_end(addr, end);
-		if (create || !p4d_none_or_clear_bad(p4d)) {
-			err = apply_to_pud_range(mm, p4d, addr, next, fn, data,
-						 create, mask);
-			if (err)
-				break;
+		if (p4d_none(*p4d) && !create)
+			continue;
+		if (WARN_ON_ONCE(p4d_leaf(*p4d)))
+			return -EINVAL;
+		if (!p4d_none(*p4d) && WARN_ON_ONCE(p4d_bad(*p4d))) {
+			if (!create)
+				continue;
+			p4d_clear_bad(p4d);
 		}
+		err = apply_to_pud_range(mm, p4d, addr, next,
+					 fn, data, create, mask);
+		if (err)
+			break;
 	} while (p4d++, addr = next, addr != end);
+
 	return err;
 }
 
@@ -2511,9 +2535,17 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
 	pgd = pgd_offset(mm, addr);
 	do {
 		next = pgd_addr_end(addr, end);
-		if (!create && pgd_none_or_clear_bad(pgd))
+		if (pgd_none(*pgd) && !create)
 			continue;
-		err = apply_to_p4d_range(mm, pgd, addr, next, fn, data, create, &mask);
+		if (WARN_ON_ONCE(pgd_leaf(*pgd)))
+			return -EINVAL;
+		if (!pgd_none(*pgd) && WARN_ON_ONCE(pgd_bad(*pgd))) {
+			if (!create)
+				continue;
+			pgd_clear_bad(pgd);
+		}
+		err = apply_to_p4d_range(mm, pgd, addr, next,
+					 fn, data, create, &mask);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
-- 
2.23.0

