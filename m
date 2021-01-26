Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E230333B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 05:52:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPvV85nhHzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 15:52:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IwKmqjfQ; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPvLS2t5gzDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 15:45:36 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id a20so1321505pjs.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 20:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=99h/tGHmDH6XgvuK7c2jm1jDIuJ9R8UCtCFUngXSM7U=;
 b=IwKmqjfQbLTn1RKpBoK8CAF8l42LBNX53RdnmD5o9kWceKkSXKUiLW2Vc5W7+VoGLF
 E+Npet/lPXoDHvfDo0d5SUIX6RkTJcYckCFLVBsTqzYP6wtMbY4B/FgKeIyJ6AqC/9if
 vHN/JP1vjrwGG9UWr2vA/w7u/WeUwIUlGcWIJFv21fD1titV0hRjoQ2rwwh4qKx0UjXN
 qEsSrevguELE5CtDXlNJRa6HbZtMjYV4EalUglIC/ZeCpkDmEC5waRuIYiyehFLJR9cy
 l8jUEazE4JvWl9Olpj4yW3K2MLQp09VMmwSvclxrXiMu1W55B6ea28BcxtCP+Bo2qB6I
 Gf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=99h/tGHmDH6XgvuK7c2jm1jDIuJ9R8UCtCFUngXSM7U=;
 b=jUpfEcMzZP2CZSa9zffDcOUyWY0maDMtCmB5Vry6WWJWuz2+DwZkFngVhtJmvs1Xjx
 bz6llC6bGibH3oXD1IqbQPbmF+K8yg84ZBmG2i75I2ZmXok85zsbhZ2iB3WqRy9hbN0n
 I/zqAwBtlf2udBfc/tsB2nU76d7RD5eRclhO0CuKj1mhvf7IPDSA2iYfL0Arg2MhHAPR
 /1butTz95npcjZyaHO1QAkkF/xtlss/aPHMKtPHqw26gSfpAEWn9bInpfFvucOE7+KRP
 +gHSDpDfczc50aFTM2Zu7H4xn3zeqIiokk92YyFTn4L2nElAo9hwQz28JrEZa5tjWpsQ
 pReg==
X-Gm-Message-State: AOAM531LUtO8kRzuVBKEWmvfNFKjLi1OtxYpVC9dfhbrz14rSsLD1xns
 fSoqflMNUF8N0qfJxUMwlDc=
X-Google-Smtp-Source: ABdhPJzY6nOUsbNiB/FKq11JNYzWxZB9lnLR1Og1caxfEXhmH2cWz6koWkbgJi1uiv9UYvm0mMKQtg==
X-Received: by 2002:a17:902:b604:b029:df:fe41:f55d with SMTP id
 b4-20020a170902b604b02900dffe41f55dmr4145415pls.43.1611636333617; 
 Mon, 25 Jan 2021 20:45:33 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id 68sm19272293pfg.90.2021.01.25.20.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 20:45:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 02/13] mm: apply_to_pte_range warn and fail if a large pte
 is encountered
Date: Tue, 26 Jan 2021 14:44:59 +1000
Message-Id: <20210126044510.2491820-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210126044510.2491820-1-npiggin@gmail.com>
References: <20210126044510.2491820-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

apply_to_pte_range might mistake a large pte for bad, or treat it as a
page table, resulting in a crash or corruption. Add a test to warn and
return error if large entries are found.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/memory.c | 66 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index feff48e1465a..672e39a72788 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2440,13 +2440,21 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
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
 
@@ -2468,13 +2476,21 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
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
 
@@ -2496,13 +2512,21 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
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
 
@@ -2522,9 +2546,17 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
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

