Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2117A78D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 15:35:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YCvz4rddzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:35:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=D+OoHwLv; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YCsD2p33zDqjv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 01:33:03 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id b5so5447566qkh.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 06:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=t12PP+Y6fPg04CGydQKRRud0jZNc7mh3eq+JnGGoFlw=;
 b=D+OoHwLv5FkiKYYj+d73ffAMgsCKhAJcd1W6XTW4We88gcuddps6vzAiuWSwtm12ec
 WIMfjMcZXNx0qEy6cpVC4VH0l5cTK+qQOA88gcaoHbzKkXczF2NN1zj4AxY+HmoyCmPA
 VeftV9WHoPHEUW+/TmYdBS6Pp7Z2vew0495PtiJGCvliuiomniLTeO+BOu7ShXSgeH+a
 IyX7US3HmI7+fYcvYS+WtzU0a1Jjo2Uvpp+GmwW3+aZ3SQ6nmXxDOxYP2njvzY/AP4Lo
 9wIb4YzvdMPQ6+MzBBpue2ktT7CHiXfN96vA1AlXiniIbePKT1hT0rCAJbe/hJQkYNfd
 imIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t12PP+Y6fPg04CGydQKRRud0jZNc7mh3eq+JnGGoFlw=;
 b=tAdySNFGY3OXQQbjZ6dgtEClxEXzd/Bn0xCbXsTiVkX92ih9ako1cZ5xUzynZrYbsM
 PYSAF0aKgRe0mT7FJlaKv9ceK9WZayFA+ZgrpfFGTpM8LQ+Jmhg5zCv+Bueh3ZegFybX
 9ekVHcXgCBwEJ9vs9/Rw5xtV9RD1VAf4CZX1E4uvNj8tqBzzveyz1asawvrc8Z3lKMyn
 /LKPxzy4gTxl/TPoF/OFakNphc67Uc1MSLr6EOGv1Vy95jQFn0jJTK7dZ93GCZP1UpAA
 UXr7DgqSKviAO4bRkg/jedLLffsad4z4q7WovVAEaGSWfCHcZcPcauegOQiqXZ6XRhXz
 zwFw==
X-Gm-Message-State: ANhLgQ3jZuv9tbGG0Rl1fxMc3olvrnoyEgBcJu4RpRcNZSqx3p8oI7FB
 GmMeMYSZZI0kuN/Bo0mJLdWNzw==
X-Google-Smtp-Source: ADFU+vsE3hyiBkiu5Q9p6/HXzxk0WFlohUygbSOHcmSvau43NwWVfS2PwRAeTD8NEkmqJRJ6pC7zBg==
X-Received: by 2002:a05:620a:2209:: with SMTP id
 m9mr4055395qkh.71.1583418779726; 
 Thu, 05 Mar 2020 06:32:59 -0800 (PST)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id f7sm16969486qtc.29.2020.03.05.06.32.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Mar 2020 06:32:59 -0800 (PST)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au,
	akpm@linux-foundation.org
Subject: [PATCH -next v2] powerpc/64s/pgtable: fix an undefined behaviour
Date: Thu,  5 Mar 2020 09:32:39 -0500
Message-Id: <1583418759-16105-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: rashmicy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Booting a power9 server with hash MMU could trigger an undefined
behaviour because pud_offset(p4d, 0) will do,

0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)

Fix it by converting pud_offset() and friends to static inline
functions.

 UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
 shift exponent 34 is too large for 32-bit type 'int'
 CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ #13
 Call Trace:
 dump_stack+0xf4/0x164 (unreliable)
 ubsan_epilogue+0x18/0x78
 __ubsan_handle_shift_out_of_bounds+0x160/0x21c
 walk_pagetables+0x2cc/0x700
 walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
 (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
 ptdump_check_wx+0x8c/0xf0
 mark_rodata_ro+0x48/0x80
 kernel_init+0x74/0x194
 ret_from_kernel_thread+0x5c/0x74

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index fa60e8594b9f..4967bc9e25e2 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1016,12 +1016,20 @@ static inline bool p4d_access_permitted(p4d_t p4d, bool write)
 
 #define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
 
-#define pud_offset(p4dp, addr)	\
-	(((pud_t *) p4d_page_vaddr(*(p4dp))) + pud_index(addr))
-#define pmd_offset(pudp,addr) \
-	(((pmd_t *) pud_page_vaddr(*(pudp))) + pmd_index(addr))
-#define pte_offset_kernel(dir,addr) \
-	(((pte_t *) pmd_page_vaddr(*(dir))) + pte_index(addr))
+static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
+{
+	return (pud_t *)p4d_page_vaddr(*p4d) + pud_index(address);
+}
+
+static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
+{
+	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
+}
+
+static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
+{
+	return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
+}
 
 #define pte_offset_map(dir,addr)	pte_offset_kernel((dir), (addr))
 
-- 
1.8.3.1

