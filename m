Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BF972ACE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 10:57:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tq3g4hstzDqFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 18:57:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jRfSrlUO"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tprY2jYfzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 18:47:41 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id i70so10124593pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 01:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ln+hwsFnBjTw71UPQVoDeIDK4O+AEVvk1M3CJkiXSfg=;
 b=jRfSrlUOb+EVALoflHyZ2JW1OGR5akqxW6Rr+c6maDZZ3/4Y14qLXtGmC5DJ+65pPn
 MYB3tn87kNbro0/E2af+AYzpSEE3Prnyef9X56BtD7yz0aC6FZxN2YdqI2Zftu+HvXjv
 uHY4dr6/02GUaqNp/gP7J6fiXIIRWEl6jhlTbb/zidIoXfgJXEbreTPMTk8Gb5fSWrk7
 AnpzFqxe3QkTU6SqIvOA6XTez7RlNdX9AHEXkDTNbAUQzwSigYV7iox0kAuxwzfmyoMM
 Lag1hxIgLiHeltwA8AQQo8iCPx2b6a5wUktG3u/cG7MqXS7coX51YAA65Sg3Pm1O+Kzm
 NiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ln+hwsFnBjTw71UPQVoDeIDK4O+AEVvk1M3CJkiXSfg=;
 b=WfqjbEAiHvrN0s1/B83DgKOB+AQbrFRM4w9WxIRGFWOKXoufmYkZBwDfcwhhgRkXc5
 Ggi2Qdi59CH33hZynSz5LnyjLdw7TZHW5lGGpMfxrcKZe5diSs13BJuLInJFJiEKIMBP
 9l5J0HLFlhXOl/+RI/xxkkS3YaXaoxbojtS97087JuBRXSHF5c8/+i27OiH4Bhm1dUo0
 IB7ON/Z0zRtXWWFUeZ5bUBD1JgKn+n/OI4R+EGPcMiRmRL6IXd5RvsteZzFTahqJY464
 to9is/L74voODfXiYtw/zSRBvcxmHu2FKzgWp19ox2zQQ2d5rkr2vOZm4CNr5Xm+jedT
 8LTw==
X-Gm-Message-State: APjAAAXukCIr52cjJvKPaUPDi5Ws6ZqUqMtYEq3LWifsD8uDCl/BXCfb
 V3mfe0Em68NxBLIG64JsLCF4APRL
X-Google-Smtp-Source: APXvYqzhmgwINpa1TvBUOT+kZVg34/bKWlWbbrSss/EAfgxpx/YOj6moVanVtM+OLEAzTCTAcigugw==
X-Received: by 2002:a17:90a:d58c:: with SMTP id
 v12mr85009191pju.7.1563958058448; 
 Wed, 24 Jul 2019 01:47:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([220.240.251.33])
 by smtp.gmail.com with ESMTPSA id a3sm54286745pje.3.2019.07.24.01.47.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:47:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc/64s/radix: Remove redundant pfn_pte bitop,
 add VM_BUG_ON
Date: Wed, 24 Jul 2019 18:46:38 +1000
Message-Id: <20190724084638.24982-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724084638.24982-1-npiggin@gmail.com>
References: <20190724084638.24982-1-npiggin@gmail.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pfn_pte is never given a pte above the addressable physical memory
limit, so the masking is redundant. In case of a software bug, it
is not obviously better to silently truncate the pfn than to corrupt
the pte (either one will result in memory corruption or crashes),
so there is no reason to add this to the fast path.

Add VM_BUG_ON to catch cases where the pfn is invalid. These would
catch the create_section_mapping bug fixed by a previous commit.

  [16885.256466] ------------[ cut here ]------------
  [16885.256492] kernel BUG at arch/powerpc/include/asm/book3s/64/pgtable.h:612!
  cpu 0x0: Vector: 700 (Program Check) at [c0000000ee0a36d0]
      pc: c000000000080738: __map_kernel_page+0x248/0x6f0
      lr: c000000000080ac0: __map_kernel_page+0x5d0/0x6f0
      sp: c0000000ee0a3960
     msr: 9000000000029033
    current = 0xc0000000ec63b400
    paca    = 0xc0000000017f0000   irqmask: 0x03   irq_happened: 0x01
      pid   = 85, comm = sh
  kernel BUG at arch/powerpc/include/asm/book3s/64/pgtable.h:612!
  Linux version 5.3.0-rc1-00001-g0fe93e5f3394
  enter ? for help
  [c0000000ee0a3a00] c000000000d37378 create_physical_mapping+0x260/0x360
  [c0000000ee0a3b10] c000000000d370bc create_section_mapping+0x1c/0x3c
  [c0000000ee0a3b30] c000000000071f54 arch_add_memory+0x74/0x130

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 8308f32e9782..8e47fb85dfa6 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -608,8 +608,10 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
  */
 static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
 {
-	return __pte((((pte_basic_t)(pfn) << PAGE_SHIFT) & PTE_RPN_MASK) |
-		     pgprot_val(pgprot));
+	VM_BUG_ON(pfn >> (64 - PAGE_SHIFT));
+	VM_BUG_ON((pfn << PAGE_SHIFT) & ~PTE_RPN_MASK);
+
+	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot));
 }
 
 static inline unsigned long pte_pfn(pte_t pte)
-- 
2.22.0

