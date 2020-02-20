Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C5B165725
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 06:46:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NNr84kptzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 16:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=KFOxwwHj; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NNbK42rbzDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 16:35:25 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id y8so1069679pll.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 21:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wFo1FwABypX1fZJmqy8o1UXRNXmVYvIi9tXiQKZ/G40=;
 b=KFOxwwHj3i+fjUFM6B+07HcRcIkT3AkiqgDFs7Lfz/6EiBqpLA1K/d1hOTGAwTP1Km
 L1mvbsYiOYbIPGxQhPtXz5B7O9Jn6huTgMh1wAA5RVewtzAThuhzpqS3kpArPEpioq2O
 wlehvvlD/DuFopK29iGb+CdemQdPNizH9pr+ZjACYyAWULWVCxTE7BheXwDbR7M/0yGE
 TFOar9X7Nc50VFMwrMVcwkOk3KKKhnBFo1Wrl3VNUQ8TE+Nv/z9eb6S+zeXY688nyUpM
 XaF90cfXvZCGNk1GtFwIho9lz/2H8F3fIxNz6LDeq7OYehlL4v5DF+0RY5BiueNeAUc1
 bDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wFo1FwABypX1fZJmqy8o1UXRNXmVYvIi9tXiQKZ/G40=;
 b=fbfwTUSVxP0cwLT3bEFBdzXdk79CdWWImR8EjsUGyiyvuRsSjjy6fQgCWskHSkQOuO
 jNGeW//XcEt8r6/CIikf+6SOAZfCAPHRcki9nz6STsRLKEN7fxBXTwouOWel6V/XC9D/
 30yjzSDno0gH7IAMEe9v8Ug15YfiSBoJIfrDlNzPBOEp9n/4uRc1RrkdFxudETEpZUZR
 Jxzjh6BRy+dD/x2bixtaTO7EofMepLX2PCNBU+AtXCIsXgD9XGXoPgUt1SriwlXmsfuy
 zNEsaL239E+ktBd11WhfsNo52dF/6WMMR/dkNI0Bp1EPY9YSD7uXNTVwcNNaM6aHVcQc
 sh9w==
X-Gm-Message-State: APjAAAWNSV7glbL6aCGWm5UmTuvNvh3c5pU9FPkOjUUC3iuFeHEB0RH3
 UXhTeph5YdJLUEljFV92tq45HPO9vS8=
X-Google-Smtp-Source: APXvYqzM+WyubxOQyxQI+mNWB+0jX/VeqlNQtrHxT5t2zx1L7bbqOjoxax5RHS8xbOS6AtJO2ebvDQ==
X-Received: by 2002:a17:90a:8d86:: with SMTP id
 d6mr1563331pjo.119.1582176923372; 
 Wed, 19 Feb 2020 21:35:23 -0800 (PST)
Received: from santosiv.in.ibm.com ([129.41.84.71])
 by smtp.gmail.com with ESMTPSA id r11sm1664262pgi.9.2020.02.19.21.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 21:35:22 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] asm-generic/tlb: avoid potential double flush
Date: Thu, 20 Feb 2020 11:04:57 +0530
Message-Id: <20200220053457.930231-7-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220053457.930231-1-santosh@fossix.org>
References: <20200220053457.930231-1-santosh@fossix.org>
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
 akshay.adiga@linux.ibm.com
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

