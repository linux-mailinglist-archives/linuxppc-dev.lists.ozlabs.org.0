Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C8F318CD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 15:01:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbywC1cvLzDsgH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:01:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbyjb6rqmzDvW3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 00:52:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=T/HOxxd2; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbyjY4NBsz9sRf; Fri, 12 Feb 2021 00:52:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613051521;
 bh=rdEFR6kNxb6DFBQ1de/2qBhKPN5ou/wGk0asqmw7ytg=;
 h=From:To:Cc:Subject:Date:From;
 b=T/HOxxd2r4p7HsHaw6LQHSmPR4KsDOdnBQl0VwkqZnWGOrrpPGNQ0FD078c34oq+9
 JwgS9eno+mNtbZPHdSNkxeAU1EBVvZZS8NKYv/WJM62KoIMZpJ6SPF/zfv+wweJHVM
 rhkEygYWRCRoX3g+xbjVO+k1hOBYqwowWV4vBAQVUtLkzH+MjsVgdAJpTat1i97gah
 fFjcO0QEvRgSmm3vn+rGb+s/g9A57wiDxzrANyYErm+57MIJqpdyyz/HFJhvbnWOZ0
 zTdA/OxFO6i4QK69LMj9SsdO9JmEvwPsd4LD2l1T+xMHV+09K6Nv6ixpDTYh7IOueh
 Hi9YyN+SinKYw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/mm/64s: Add _PAGE_KERNEL_ROX
Date: Fri, 12 Feb 2021 00:51:25 +1100
Message-Id: <20210211135130.3474832-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the past we had a fallback definition for _PAGE_KERNEL_ROX, but we
removed that in commit d82fd29c5a8c ("powerpc/mm: Distribute platform
specific PAGE and PMD flags and definitions") and added definitions
for each MMU family.

However we missed adding a definition for 64s, which was not really a
bug because it's currently not used.

But we'd like to use PAGE_KERNEL_ROX in a future patch so add a
definition now.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index a39886681629..1358fae01d04 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -116,6 +116,7 @@
  */
 #define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
 #define _PAGE_KERNEL_RO		 (_PAGE_PRIVILEGED | _PAGE_READ)
+#define _PAGE_KERNEL_ROX	 (_PAGE_PRIVILEGED | _PAGE_READ | _PAGE_EXEC)
 #define _PAGE_KERNEL_RWX	(_PAGE_PRIVILEGED | _PAGE_DIRTY |	\
 				 _PAGE_RW | _PAGE_EXEC)
 /*
-- 
2.25.1

