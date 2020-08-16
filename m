Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B325245703
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 11:15:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BTs3G2YBKzDqS5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 19:15:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b9r2FrUb; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BTrwC2xkBzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Aug 2020 19:09:30 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id u128so6673373pfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Aug 2020 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxm/C2mC0786WMQTE10aJFvTg/Tw0xwUgIx5I5X+hjE=;
 b=b9r2FrUb9Vyhol+l3W9WoRcRqwuEhJjICuC8voZ71tdHvf9AxDjiBeHUPoJzDXz918
 GfC0Lqqv1aLzAMXtaXVGWxJ6//psWOIy2I4sji++lJ4BdiP0PWs10DaVhUxrs/zwIvhB
 kwIE3+NTA1aXJvKR4AsAcVvlRBup95ZJs0o8J9ggH+EDr5FqvguEbk6SCdoc6r18RYLb
 qMc3ECitpN/FuWjc9PL9bKG4zy+91aFxbDPlqpmB6w4xTa9WdDDN2iuZL1gIDQqtr6Ak
 fX7yiUhYUaJ841lhLFcKD1xkRiYDVw4mI1xoWm//U3az5Xq+hLgWbkAGx8JSu9AnOfQ7
 JqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxm/C2mC0786WMQTE10aJFvTg/Tw0xwUgIx5I5X+hjE=;
 b=WB9qMAko4ujicIXTSZ3QmKKWZphLEDuRqfTuXu6sXvIMCPte6ug6l6yTlgt5XpSn9r
 B9gA8eeeLQ9yJ79yoXtdtpQrTa7BwsmqH/Zj9ntxOWciU4k0NbP9RO2Zj/hmUWAlywIQ
 UMaPwd+eSyL2AbNlyJHneVPJ09la9jo/kwyPvM4si/vdGFa+wBfryevdxubOw8LmZQWs
 7X3op2JB8xaIW249xCoOJSM0egH0vWqmSOp6OwRrn0CXDOmFxq03r19lf+6m2v3Ckkfm
 WOk07tJIn5w3bjOuXmOHCdlTHk/rl6L+z7im3pAe7v+u+pTlBSKA029h8rGt4qFTgLXJ
 QmnQ==
X-Gm-Message-State: AOAM532dcjat85vfzt8n+ppZz++TCL7mIhT4KAvWaXQB4apgwmI96to0
 VcUcU730Dij+uVgN/AZ3iVY=
X-Google-Smtp-Source: ABdhPJwxOvFbG/ZjwUp2j/jXOU/b9ImNMZIMN5ReacxCD9gMRBxoKCQ/eh7ex/628GY5c5MYbRsgNg==
X-Received: by 2002:aa7:9a1c:: with SMTP id w28mr4426784pfj.116.1597568968280; 
 Sun, 16 Aug 2020 02:09:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-193-175.tpgi.com.au.
 [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id o19sm12768369pjs.8.2020.08.16.02.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 02:09:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v4 2/8] mm: apply_to_pte_range warn and fail if a large pte is
 encountered
Date: Sun, 16 Aug 2020 19:08:58 +1000
Message-Id: <20200816090904.83947-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200816090904.83947-1-npiggin@gmail.com>
References: <20200816090904.83947-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/memory.c | 60 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index c39a13b09602..1d5f3093c249 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2260,13 +2260,20 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
 	}
 	do {
 		next = pmd_addr_end(addr, end);
-		if (create || !pmd_none_or_clear_bad(pmd)) {
-			err = apply_to_pte_range(mm, pmd, addr, next, fn, data,
-						 create);
-			if (err)
-				break;
+		if (pmd_none(*pmd) && !create)
+			continue;
+		if (WARN_ON_ONCE(pmd_leaf(*pmd)))
+			return -EINVAL;
+		if (WARN_ON_ONCE(pmd_bad(*pmd))) {
+			if (!create)
+				continue;
+			pmd_clear_bad(pmd);
 		}
+		err = apply_to_pte_range(mm, pmd, addr, next, fn, data, create);
+		if (err)
+			break;
 	} while (pmd++, addr = next, addr != end);
+
 	return err;
 }
 
@@ -2287,13 +2294,20 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
 	}
 	do {
 		next = pud_addr_end(addr, end);
-		if (create || !pud_none_or_clear_bad(pud)) {
-			err = apply_to_pmd_range(mm, pud, addr, next, fn, data,
-						 create);
-			if (err)
-				break;
+		if (pud_none(*pud) && !create)
+			continue;
+		if (WARN_ON_ONCE(pud_leaf(*pud)))
+			return -EINVAL;
+		if (WARN_ON_ONCE(pud_bad(*pud))) {
+			if (!create)
+				continue;
+			pud_clear_bad(pud);
 		}
+		err = apply_to_pmd_range(mm, pud, addr, next, fn, data, create);
+		if (err)
+			break;
 	} while (pud++, addr = next, addr != end);
+
 	return err;
 }
 
@@ -2314,13 +2328,20 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
 	}
 	do {
 		next = p4d_addr_end(addr, end);
-		if (create || !p4d_none_or_clear_bad(p4d)) {
-			err = apply_to_pud_range(mm, p4d, addr, next, fn, data,
-						 create);
-			if (err)
-				break;
+		if (p4d_none(*p4d) && !create)
+			continue;
+		if (WARN_ON_ONCE(p4d_leaf(*p4d)))
+			return -EINVAL;
+		if (WARN_ON_ONCE(p4d_bad(*p4d))) {
+			if (!create)
+				continue;
+			p4d_clear_bad(p4d);
 		}
+		err = apply_to_pud_range(mm, p4d, addr, next, fn, data, create);
+		if (err)
+			break;
 	} while (p4d++, addr = next, addr != end);
+
 	return err;
 }
 
@@ -2339,8 +2360,15 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
 	pgd = pgd_offset(mm, addr);
 	do {
 		next = pgd_addr_end(addr, end);
-		if (!create && pgd_none_or_clear_bad(pgd))
+		if (pgd_none(*pgd) && !create)
 			continue;
+		if (WARN_ON_ONCE(pgd_leaf(*pgd)))
+			return -EINVAL;
+		if (WARN_ON_ONCE(pgd_bad(*pgd))) {
+			if (!create)
+				continue;
+			pgd_clear_bad(pgd);
+		}
 		err = apply_to_p4d_range(mm, pgd, addr, next, fn, data, create);
 		if (err)
 			break;
-- 
2.23.0

