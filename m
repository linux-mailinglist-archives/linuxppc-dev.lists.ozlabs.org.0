Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F61789AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 05:42:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XLnx5VphzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 15:42:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0Z6NBiKR; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XLY72yXMzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 15:31:07 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id y26so277107pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 20:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceobO9udD14LrQZbpBJ6o1PQGbHK97VsLgC6qxhMQAM=;
 b=0Z6NBiKRFCWjzPWR2W7+nHAwEQThe3hew9DuWu9EOYdRwCC71Xz8hZfHpO+yWB3o14
 vadUBEWiMCjKgKYVB1JxvAK2Cf6z3ncaevaA93d+ettcOFgImBZrFo03pac0lTnv+OwA
 LccRajjfj2yVFbT+HbsVgqt6MWByFq/43KzJHopPoAmmDfcnLLRANRpVgg/fTHKTuULc
 Mon39UQS0DVPVnBp3IS2RypS8+zhiQ8invKQhhHSy3MPPzjagx4fWEk6ebdcFTzkd7sH
 k1n9U/iXdQbRkhNwmur48zwOLZwAk2GMw9wHNQ50DpYFwinLRI3+6jUboxwCYkXurl7t
 /fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceobO9udD14LrQZbpBJ6o1PQGbHK97VsLgC6qxhMQAM=;
 b=kImJ9yyHEA9apYYlkXpNiAiJv3r41v81CgB1j+JSCpWcXvCJ/t2DWxkmuJ3RWtASi/
 R8sBxOAVAyLAEdSlW8RRuIXCJvWDiOFjjhdSnnusDM+Ve06X3OHA78LqRc9kG0+UqICE
 5yBNcRRJ52u7H9lE9V8k/Kdm+MJofbu4PqLhrH4ZRFYAh4w6XKai9TPeCyn9e9Ksr5AI
 yFKXahUH8tOtqfGCFRsp84PdI97j5ELU1edIUpyoQ5zl4Kzx8GH/iqHXuVu5Hg7tgb1E
 8UwDxIw1nQozs2zaWrpjqxHYWfRBeTiC2Duh6hnAaGf2S12Fb0wtjtrQnbhDbsKbzdtk
 cMWw==
X-Gm-Message-State: ANhLgQ3DHvKh8W/BX40dZ9Z9oQA4+HD/pnzNmzkTGN2db41E4EOXJIK7
 RQjP3y2NPXzzfnKvcY63xor5rg==
X-Google-Smtp-Source: ADFU+vvWsNPG7rU/DyzKJYUwznyLv6qCZXlkRFfTwmMavqC94g/If0c0AoLHv1q5XLJZ4Yh7Lo2nHQ==
X-Received: by 2002:aa7:85d9:: with SMTP id z25mr1241447pfn.223.1583296265089; 
 Tue, 03 Mar 2020 20:31:05 -0800 (PST)
Received: from santosiv.in.ibm.com ([2401:4900:16ee:7b5f:eac:4364:ff14:3aaa])
 by smtp.gmail.com with ESMTPSA id
 y193sm10775723pfg.162.2020.03.03.20.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 20:31:04 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 6/6] asm-generic/tlb: avoid potential double flush
Date: Wed,  4 Mar 2020 10:00:28 +0530
Message-Id: <20200304043028.280136-7-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200304043028.280136-1-santosh@fossix.org>
References: <20200304043028.280136-1-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Greg KH <greg@kroah.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

commit 0758cd8304942292e95a0f750c374533db378b32 upstream.

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

