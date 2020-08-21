Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6B24CCFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 06:50:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXpwk0Lq3zDrBx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 14:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pCPdkWR+; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXppS5Jp0zDr2F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 14:44:48 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id u128so466109pfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 21:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r93I4AuViyvI3WFmm3zsFVOEd/ZSp6PAmt6HmvThDqM=;
 b=pCPdkWR+/c3zGQZvbI+yxPmJYiJKpXbInrdYKkqIhWmlE9TYC6j5Mf11xaW0biltIw
 OpEeh+fCH9qvFzH6jX5Lv3RtfHciH9iJpqSE5g2ZeBEhuEqYyTLS1C33+HGi7/0UHE3e
 XRi13Mvm7jZFBeh7aoSMNJgBAAR//QM0MiuA0mJUwYqzKpKXxvSVOg5RGBmfC53y0ZmG
 O8Mj2Wa7adwTYJ+v8cuTZwIbAVljHSCvjsq2/l6Iz3h9e0jeVS4gFdtofpkMYPzIOwSe
 QBzadfNfLEd+vu9GWevuLRVwbiTvNZO2gQ1OuXxvFaJ2bjkrLNyu8oi/X7lcwoXY0FUG
 aT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r93I4AuViyvI3WFmm3zsFVOEd/ZSp6PAmt6HmvThDqM=;
 b=bjZWcDNfx7yEE8YfZecnznTPBYHtjoJ4kHDMYPg1m+6yZsqLZd3ImI9KejwzvRiReA
 Kgub5l/FhU81/L2hHzg1H/kkbjO6FJ6SyHAwgxEoYYQRCGwahjF0vwiZqZ8i7vf6eXzB
 Fa8p9q+wxpZuBbGpzBS31XWra2QxV57/txHH3NPmXN1Bv41pzXIAMvE2JeBQpx7TQ3Hv
 nCw68rWV6htEl3VLWXXsHHe88KY0oMvbrPhURKuoUAG+/X+CxfITrFhEHB/0E4n/6+ig
 x4lwvuNrFZ2UeI80cJVOGiYcWUptRJWaUXHTQOQ+WwqXE2048/ux4Cc7HTeG1Ly27WVJ
 NJyQ==
X-Gm-Message-State: AOAM533Gswkcz/Dbz0ZXOfDQxqcHXcac0wsnN38WxpfUPusJZ4qANHPd
 GmSB4xGYj+LjtuqKFuLaub4=
X-Google-Smtp-Source: ABdhPJxcErdb6DHl7wNZg2CJKi37fhm5Y8ORf9S2133r96TOuyrJSJsmNCzKB7cRJeog1G9Yvb/4EQ==
X-Received: by 2002:a62:9254:: with SMTP id o81mr988198pfd.73.1597985085951;
 Thu, 20 Aug 2020 21:44:45 -0700 (PDT)
Received: from bobo.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id l9sm683374pgg.29.2020.08.20.21.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 21:44:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 2/8] mm: apply_to_pte_range warn and fail if a large pte is
 encountered
Date: Fri, 21 Aug 2020 14:44:21 +1000
Message-Id: <20200821044427.736424-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200821044427.736424-1-npiggin@gmail.com>
References: <20200821044427.736424-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/memory.c | 60 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index f95edbb77326..19986af291e0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2261,13 +2261,20 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
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
 
@@ -2288,13 +2295,20 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
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
 
@@ -2315,13 +2329,20 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
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
 
@@ -2340,8 +2361,15 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
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

