Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B98551659A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 09:53:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NSzx5nRMzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 19:53:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YP6DVlHE; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NSlx15W7zDqS3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 19:43:09 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id y1so1279017plp.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 00:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SJRnSTuI/8zzV3f8/u1V+qMXPVhPYkwWrGGc/VKLtP0=;
 b=YP6DVlHEhvPNKpxsQeQrzyBc9RO9nidiyP7Dl5hj/Ch80VkDp1H1/TIDcZDfeBDErY
 W5gs7Xnx7ukwpH3p8ljjfeBjZGuCV6DeyNxDIfPw0H3XK7CD5dEquEGrH4vZu9hM+lcH
 SwnVI7KG/TCubvZIbLa2SKfBRYu1G8Upy/QczOyohf5ZEgnCZ+JOdsJknudkKF8eY6Xb
 iL7Qi27cpbSz6CxzigM9Tvg0Nz4uBZN424lmOcRFL2yt51BjFeEmb+mieUWWh+FWwxfF
 gnmW+/wvBsXU5vPyBpEQbdqcTc0PCHZkSIxx+QzEGFuwYCdwOIdWtU4YL6BavyPY6JRb
 +PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJRnSTuI/8zzV3f8/u1V+qMXPVhPYkwWrGGc/VKLtP0=;
 b=rGWKSa7Jz5IL702q8GM9dy98gsrO03X85FL/Akont3kWZuva9/NlDUjtB0EAN65YlN
 H146lhJE1X2YY8ERCgRcI26Ws0ZilhfkZNam3qS6Yy7baQBLuF5VNWFqWE9WBE0zYBAb
 9cdfmhx3vxfPjL/X2cGKpALoawg67AQadv3NabNUvpLy12Glm2HRxV/p34fbruoPFkdE
 z1uGy+yENf4Jw3WgAVB4kpzmMAHYVU92stXgSnigl3ljIjz9fT4m4aZXDEg3qgARIRQW
 a1z1+Nkmmd5LrQRZyVCTmI92AJzteLxsgq3Z3pwA9rGF3XHqYVxFsk/pVHZF68roNrJV
 6sEQ==
X-Gm-Message-State: APjAAAV6iAbaaraqkk24pMVsbmkRWbdmGs0J8S1HBO+safQPyPTng9X9
 NTFIWk/6SFED48SuxtoYBQEIWbha574=
X-Google-Smtp-Source: APXvYqwDnRcG/lr4R5iDfPif3Db22kcoDa6X/w7akzniEc0hf35zQvVnVlYTjqHTUyFAOB08cy306g==
X-Received: by 2002:a17:90a:f012:: with SMTP id
 bt18mr2370624pjb.8.1582188187138; 
 Thu, 20 Feb 2020 00:43:07 -0800 (PST)
Received: from santosiv.in.ibm.com ([129.41.84.72])
 by smtp.gmail.com with ESMTPSA id r145sm2512381pfr.5.2020.02.20.00.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:43:06 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] asm-generic/tlb: avoid potential double flush
Date: Thu, 20 Feb 2020 14:12:29 +0530
Message-Id: <20200220084229.1278137-7-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220084229.1278137-1-santosh@fossix.org>
References: <20200220084229.1278137-1-santosh@fossix.org>
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
Cc: peterz@infradead.org, aneesh.kumar@linux.ibm.com,
 akshay.adiga@linux.ibm.com, gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

Aneesh reported that:

	tlb_flush_mmu()
	  tlb_flush_mmu_tlbonly()
	    tlb_flush()			<-- #1
	  tlb_flush_mmu_free()
	    tlb_table_flush()
	      tlb_table_invalidate()
		tlb_flush_mmu_tlbonly()
		  tlb_flush()		<-- #2

does two TLBIs when tlb->fullmm, because __tlb_reset_range() will not
clear tlb->end in that case.

Observe that any caller to __tlb_adjust_range() also sets at least one of
the tlb->freed_tables || tlb->cleared_p* bits, and those are
unconditionally cleared by __tlb_reset_range().

Change the condition for actually issuing TLBI to having one of those bits
set, as opposed to having tlb->end != 0.

0758cd830494 in upstream.

Link: http://lkml.kernel.org/r/20200116064531.483522-4-aneesh.kumar@linux.ibm.com
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Reported-by: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: <stable@vger.kernel.org>  # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
[santosh: backported to 4.19 stable]
---
 include/asm-generic/tlb.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 19934cdd143e..427a70c56ddd 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -179,7 +179,12 @@ static inline void __tlb_reset_range(struct mmu_gather *tlb)
 
 static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
 {
-	if (!tlb->end)
+	/*
+	 * Anything calling __tlb_adjust_range() also sets at least one of
+	 * these bits.
+	 */
+	if (!(tlb->freed_tables || tlb->cleared_ptes || tlb->cleared_pmds ||
+	      tlb->cleared_puds || tlb->cleared_p4ds))
 		return;
 
 	tlb_flush(tlb);
-- 
2.24.1

