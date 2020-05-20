Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D881DADD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 10:46:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RmYx60zmzDqRb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 18:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1044; helo=mail-pj1-x1044.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=X9lGxgxE; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RmHK70ttzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 18:33:33 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id k7so901664pjs.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NlxdBI8wiLZenSs6j2nq89RHtqfPDggo6DaziIKFMVc=;
 b=X9lGxgxEPnFHSzzaOdMDLP7ATZXnbqTUa9hrsb9Z/3TMQ80e/6CC8Cs8MftCgeSYbW
 tWcwUGqj6bE/2RDfGVmERWU7RPf0O6SdL458fXe39rOozu8D6CrQV2zNWO6a5Az7EUuA
 xQkKuJkw0+s/Ti2gwcMztT4AZXIvphgs81Qiqd0Gl+HVXPpWunOQAHYV4TBJTQFguzcb
 F88Z2xxLrTpo2V1WlcK3bJKCow6rb8gUzz3+WbB5WG+tAC3GhxCGj+Z+T1FGeENlVvu+
 xPjnBtW0wsp50C6tiPwC2CPQ8bKKmknPnKSgWiaOSFS0qWv9l19AinL1O8Ne7B17uMzi
 WnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NlxdBI8wiLZenSs6j2nq89RHtqfPDggo6DaziIKFMVc=;
 b=qMqLw8bHCTtYPD25GQqjabhdrCMaNEEdHR+JBfbm3uUy0FBsazQEVMtfsFneP+bh7q
 Yo1vXUdpduQieZHoWzXDaC615PPofNRVnrUdj3Gu+hmHA+yXD4G2MiPv+iCoYqG1gdWZ
 wCQ1Y2++O/o0v5QXGWUp4xQ5JuavNH6gUAgoVfKDelhZP10qqRDVqiaHp97WRD+5jM4C
 KfBzu8VoCse+ZMPeUCi/4hzUGuJIvVP+hxNB8eYvhpFzAy91ICzYcCOa9W4joJBG80oH
 H5W9kaJG7H0KRe28Xl50Vuz2o1WfN5ckzn+BM69h18HMFG+NDxPlCOInCPz7BKh14qbl
 5n/w==
X-Gm-Message-State: AOAM530wmnhTKUBIZeHp0YFSmD5kdEEtRGwWHNVDX3ok4xCk0L8AIpEd
 3diHbPBbXN9MNTfmNzQqfHo16A==
X-Google-Smtp-Source: ABdhPJwEQgWQuk6x5EevptElzwnttM1fzDUykzVF8QoxGjOlm29ZKZuBRwmc+SfC8yz5Pv/hFbgtbg==
X-Received: by 2002:a17:90a:1303:: with SMTP id
 h3mr3819470pja.44.1589963611955; 
 Wed, 20 May 2020 01:33:31 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([223.181.246.139])
 by smtp.gmail.com with ESMTPSA id 2sm1553980pfz.39.2020.05.20.01.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:33:31 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 6/6] asm-generic/tlb: avoid potential double flush
Date: Wed, 20 May 2020 14:00:25 +0530
Message-Id: <20200520083025.229011-7-santosh@fossix.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200520083025.229011-1-santosh@fossix.org>
References: <20200520083025.229011-1-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Santosh Sivaraj <santosh@fossix.org>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <greg@kroah.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

commit 0758cd8304942292e95a0f750c374533db378b32 upstream

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
2.25.4

