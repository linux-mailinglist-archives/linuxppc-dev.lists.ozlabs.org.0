Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EF42859BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 09:43:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5mYB03qJzDqNB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 18:43:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=jannh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Sws+UqMd; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5mSr1tkFzDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 18:39:47 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id n15so967188wrq.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Oct 2020 00:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2AqrczMzdXJGGwH6lL0y5Ag3MFo0UoYjD20TIbYWHHA=;
 b=Sws+UqMda3na0grxazZ1UlbLBQVvhhiu6dNhWZKXv3enMvB35YibvDyfhFUzaDt6fH
 i0IcU3KgQ/+JRZNtYHZKQOFEEqRWkSitHK6s3Hn0uGwzhpBEdodMRJIy2nHrHWW/zhyo
 TtI31JBWQoMHTf1+EtpmkH1F4qlUT+XnCn4RnGj8k05nmx8HPnOG25OqAoUq++rZ2kk8
 cjhrH8dDIyWOsyUxSfbgXGEgCjFMsJFSfn35N3rrJuYoNMrniggQ7XfrXks1u3x/bXiP
 0H47sRlDULqEKTr8ixihXxBTG4mEL9D2DnN9+xsFIxZnnwVrkiDVrorn1bOx/2yfJhkM
 Dkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AqrczMzdXJGGwH6lL0y5Ag3MFo0UoYjD20TIbYWHHA=;
 b=WH/7Am8EwkiljSUPOMDvlY94jLuxm0yptKEkX+vcUkHiLw2NYRoKamBOZO2RBZyZuA
 5hzhpimoRNojsFr6IG2RkjDu4rHSoIiBkfBRPbHbXJRZBhHZfZ7zyKyCUxXhRK0g2/CY
 l4ElQ+H5XkXdtCSRCEz9IygjaPv7gJ30xmtDncMwDVPojV31OHgicgvT5O2oVhFHEdqa
 Q6IyJee6jHG91gE2ZAZCpczLsGA1vUNZ4AWJKcWpXEJXNQVREqjhjj2E5MADcYrAd+r4
 XMpqf7rNIa+dGrz5OM8mJ6FR33vgl5fGK3qjGVOMD0sUkfqJohXM3qq6TBzAqvaJptbp
 K5qg==
X-Gm-Message-State: AOAM531hd+5eieTzucJ5CxPXRrs7A3ebX/uLITjzGPGOqyvFr9P6UzXw
 VWhCEHQFda3C8iB7TFJNIXcnQg==
X-Google-Smtp-Source: ABdhPJyjtCm/NSobuXsdsLBXoocPrZ/xctbDGs32ap8XM2d7TqDHBUehkZB/DCIUyDN0Vi/50goJzw==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr1941981wrr.283.1602056383938; 
 Wed, 07 Oct 2020 00:39:43 -0700 (PDT)
Received: from localhost ([2a02:168:96c5:1:55ed:514f:6ad7:5bcc])
 by smtp.gmail.com with ESMTPSA id p9sm1475809wmm.4.2020.10.07.00.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 00:39:43 -0700 (PDT)
From: Jann Horn <jannh@google.com>
To: "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: [PATCH 2/2] sparc: Check VMA range in sparc_validate_prot()
Date: Wed,  7 Oct 2020 09:39:32 +0200
Message-Id: <20201007073932.865218-2-jannh@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
In-Reply-To: <20201007073932.865218-1-jannh@google.com>
References: <20201007073932.865218-1-jannh@google.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Mackerras <paulus@samba.org>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sparc_validate_prot() is called from do_mprotect_pkey() as
arch_validate_prot(); it tries to ensure that an mprotect() call can't
enable ADI on incompatible VMAs.
The current implementation only checks that the VMA at the start address
matches the rules for ADI mappings; instead, check all VMAs that will be
affected by mprotect().

(This hook is called before mprotect() makes sure that the specified range
is actually covered by VMAs, and mprotect() returns specific error codes
when that's not the case. In order for mprotect() to still generate the
same error codes for mprotect(<unmapped_ptr>, <len>, ...|PROT_ADI), we need
to *accept* cases where the range is not fully covered by VMAs.)

Cc: stable@vger.kernel.org
Fixes: 74a04967482f ("sparc64: Add support for ADI (Application Data Integrity)")
Signed-off-by: Jann Horn <jannh@google.com>
---
compile-tested only, I don't have a Sparc ADI setup - might be nice if some
Sparc person could test this?

 arch/sparc/include/asm/mman.h | 50 +++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/arch/sparc/include/asm/mman.h b/arch/sparc/include/asm/mman.h
index e85222c76585..6dced75567c3 100644
--- a/arch/sparc/include/asm/mman.h
+++ b/arch/sparc/include/asm/mman.h
@@ -60,31 +60,41 @@ static inline int sparc_validate_prot(unsigned long prot, unsigned long addr,
 	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_ADI))
 		return 0;
 	if (prot & PROT_ADI) {
+		struct vm_area_struct *vma, *next;
+
 		if (!adi_capable())
 			return 0;
 
-		if (addr) {
-			struct vm_area_struct *vma;
+		vma = find_vma(current->mm, addr);
+		/* if @addr is unmapped, let mprotect() deal with it */
+		if (!vma || vma->vm_start > addr)
+			return 1;
+		while (1) {
+			/* ADI can not be enabled on PFN
+			 * mapped pages
+			 */
+			if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
+				return 0;
 
-			vma = find_vma(current->mm, addr);
-			if (vma) {
-				/* ADI can not be enabled on PFN
-				 * mapped pages
-				 */
-				if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
-					return 0;
+			/* Mergeable pages can become unmergeable
+			 * if ADI is enabled on them even if they
+			 * have identical data on them. This can be
+			 * because ADI enabled pages with identical
+			 * data may still not have identical ADI
+			 * tags on them. Disallow ADI on mergeable
+			 * pages.
+			 */
+			if (vma->vm_flags & VM_MERGEABLE)
+				return 0;
 
-				/* Mergeable pages can become unmergeable
-				 * if ADI is enabled on them even if they
-				 * have identical data on them. This can be
-				 * because ADI enabled pages with identical
-				 * data may still not have identical ADI
-				 * tags on them. Disallow ADI on mergeable
-				 * pages.
-				 */
-				if (vma->vm_flags & VM_MERGEABLE)
-					return 0;
-			}
+			/* reached the end of the range without errors? */
+			if (addr+len <= vma->vm_end)
+				return 1;
+			next = vma->vm_next;
+			/* if a VMA hole follows, let mprotect() deal with it */
+			if (!next || next->vm_start != vma->vm_end)
+				return 1;
+			vma = next;
 		}
 	}
 	return 1;
-- 
2.28.0.806.g8561365e88-goog

