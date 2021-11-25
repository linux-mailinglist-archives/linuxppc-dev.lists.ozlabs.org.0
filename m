Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68645DDCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 16:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0MdR61lqz3bnC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 02:44:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqy2TW0b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pqy2TW0b; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Mck0Jm1z2yMc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 02:44:19 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id f18so17335269lfv.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 07:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjdtC5GIxYnl5iuWdNGFM3Hr3h23E1k1oPnPZHzamQY=;
 b=pqy2TW0bsBo5u1QZ2nCCwi5+QVw2p6auHI5QbjTULerGJrcj7TbW+iaStA4URJwIuO
 fOn8rVo1e8/KRQFsav5cOZvzPKce06KSrbKMRm/+RX+FDZJOzIuJc1OLH4Yl07gOeuvh
 etiGPY5mBWaBpxwbTUQ1cZdZFHSCq7OubyvvyIgyiDijd8tqenSY9FLFzC8HUmlJhb84
 XQcTxgFjcSmXxgoBvC0x/r+0yJKvH2rtat9hVSwiQGoGt9MkPgUreADgdP6RMlTcgOnG
 5SFw4ZHrD+rH5LN06xwLde1VDzIDzATJWkaGRZAtvXH63ufNzuBOxbottQltNiPsYkIm
 yWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjdtC5GIxYnl5iuWdNGFM3Hr3h23E1k1oPnPZHzamQY=;
 b=UJaPLBNoDgOao631b9qbIRo/Y+VsUvKZK2mqCudxtnFIX+zpKg/v+4yg+rQa9zMfNx
 yDFpU0cTQt4OIkb22Am3qIXDbboyB1fgHwX0yuDCnSbl76jFEo6OFO50d+L/W20+tTPR
 fLI4hWVXlyRk9/FTHN2nVOFisLvxSEJlYt8vzpjvPVYQB0uFzJjup6cplqicclzh7GZG
 uAKxZ3NGX+Rk2WlBtB4vLweSuSmu9V38oia4td5wcRUBXsCPlNwYLzjmgfzs+qKEoVEP
 9aOjH2CSLQ86s4kt83dHdmWwXDxO5mu6XQe/unrqdDRkPJ2yxu7J8MtdTM1K9PPVreB1
 fEsw==
X-Gm-Message-State: AOAM533yYWxuPi9VL2gkMHyUAvoMygVILlN8IniS/wiScRrh8PEK7hRb
 +6n5sOQSw0qg/OoRv/z1Djyk2w==
X-Google-Smtp-Source: ABdhPJyiWyvugY0ouHq1meoMZp+lYl8AA/jg9WpkSyn1m8R7vRBtv3L2hntYxgDFLYy/rL7jBtf4eg==
X-Received: by 2002:a05:6512:3602:: with SMTP id
 f2mr24700962lfs.399.1637855054256; 
 Thu, 25 Nov 2021 07:44:14 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id x12sm261627ljc.121.2021.11.25.07.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:44:13 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc: mm: radix_tlb: rearrange the if-else block
Date: Thu, 25 Nov 2021 16:44:06 +0100
Message-Id: <20211125154406.470082-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 nathan@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns:

arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                  ^~~~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
                unsigned long hstart, hend;
                                    ^
                                     = 0
arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                          ^~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
                unsigned long hstart, hend;
                                          ^
                                           = 0
2 errors generated.

Rework the if-else to pull the 'IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE)'
check one level up, this will silent the warnings. That will also
simplify the 'else' path. Clang is getting confused with these warnings,
but the warnings is a false-positive.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 31 +++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 7724af19ed7e..e494a45ce1b4 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1170,16 +1170,14 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 			}
 		}
-	} else {
+	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 		bool hflush = false;
 		unsigned long hstart, hend;
 
-		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
-			hend = end & PMD_MASK;
-			if (hstart < hend)
-				hflush = true;
-		}
+		hstart = (start + PMD_SIZE - 1) & PMD_MASK;
+		hend = end & PMD_MASK;
+		if (hstart < hend)
+			hflush = true;
 
 		if (type == FLUSH_TYPE_LOCAL) {
 			asm volatile("ptesync": : :"memory");
@@ -1207,6 +1205,25 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				_tlbiel_va_range_multicast(mm,
 					hstart, hend, pid, PMD_SIZE, MMU_PAGE_2M, flush_pwc);
 		}
+	} else {
+
+		if (type == FLUSH_TYPE_LOCAL) {
+			asm volatile("ptesync" : : : "memory");
+			if (flush_pwc)
+				/* For PWC, only one flush is needed */
+				__tlbiel_pid(pid, 0, RIC_FLUSH_PWC);
+			__tlbiel_va_range(start, end, pid, page_size, mmu_virtual_psize);
+			ppc_after_tlbiel_barrier();
+		} else if (cputlb_use_tlbie()) {
+			asm volatile("ptesync" : : : "memory");
+			if (flush_pwc)
+				__tlbie_pid(pid, RIC_FLUSH_PWC);
+			__tlbie_va_range(start, end, pid, page_size, mmu_virtual_psize);
+			asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+		} else {
+			_tlbiel_va_range_multicast(mm,
+					start, end, pid, page_size, mmu_virtual_psize, flush_pwc);
+		}
 	}
 out:
 	preempt_enable();
-- 
2.33.0

