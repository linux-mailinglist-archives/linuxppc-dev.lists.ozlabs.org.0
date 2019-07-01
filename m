Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE124FE5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:16:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457brQ6Sj5zDqH2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 23:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.76; helo=conuserg-09.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="byDN3URg"; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457bpB70Z0zDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 23:14:42 +1000 (AEST)
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net
 [126.125.154.139]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x4LDDYAd004855;
 Tue, 21 May 2019 22:13:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x4LDDYAd004855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1558444415;
 bh=ahqbC92DL/pM+EvNd4RugG8jQvrt9otxZH6g7EH9AdY=;
 h=From:To:Cc:Subject:Date:From;
 b=byDN3URgP1aFiKBf13O4eB3IcCRmRHdS4w/Vsk71gfIMjCTpQlM9x+pTrWYxKD6xD
 V9VH0X04qL3lZtOUfsrhQBsiJk6csDQXXVUjQ5+uCPagVEG7fWaXK52ua2aETjKK0M
 XJBCDyN1+HfIrqq14MuJoUdVthou2qSoYfOre6SZViNDt8nEYf7GoZg7rNW8Dw2tNh
 YYah8oMxK2FXgGkEVEphUKIna2of4Et7E+xJuLal9Z4afYm3hMxjRQeL9FQlOvFsdX
 svjA5A9a8iW0Z2C/nqYiS0rqRctgK33ezsq1t3T5mDDH55zWryW003qi4NZml1meAb
 PH79Wg2BhesJA==
X-Nifty-SrcIP: [126.125.154.139]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/mm: mark more tlb functions as __always_inline
Date: Tue, 21 May 2019 22:13:24 +0900
Message-Id: <1558444404-12254-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_OPTIMIZE_INLINING enabled, Laura Abbott reported error
with gcc 9.1.1:

  arch/powerpc/mm/book3s64/radix_tlb.c: In function '_tlbiel_pid':
  arch/powerpc/mm/book3s64/radix_tlb.c:104:2: warning: asm operand 3 probably doesn't match constraints
    104 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
        |  ^~~
  arch/powerpc/mm/book3s64/radix_tlb.c:104:2: error: impossible constraint in 'asm'

Fixing _tlbiel_pid() is enough to address the warning above, but I
inlined more functions to fix all potential issues.

To meet the "i" (immediate) constraint for the asm operands, functions
propagating "ric" must be always inlined.

Fixes: 9012d011660e ("compiler: allow all arches to enable CONFIG_OPTIMIZE_INLINING")
Reported-by: Laura Abbott <labbott@redhat.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Do not split lines

 arch/powerpc/mm/book3s64/hash_native.c |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c   | 32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index aaa28fd..c854151 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -60,7 +60,7 @@ static inline void tlbiel_hash_set_isa206(unsigned int set, unsigned int is)
  * tlbiel instruction for hash, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
  */
-static inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
+static __always_inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
 					unsigned int pid,
 					unsigned int ric, unsigned int prs)
 {
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 4d84136..4d3dc10 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -29,7 +29,7 @@
  * tlbiel instruction for radix, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
  */
-static inline void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
+static __always_inline void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
 					unsigned int pid,
 					unsigned int ric, unsigned int prs)
 {
@@ -150,8 +150,8 @@ static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
 	trace_tlbie(lpid, 0, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
-				unsigned long ric)
+static __always_inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
+						unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -167,8 +167,8 @@ static inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
 }
 
 
-static inline void __tlbiel_va(unsigned long va, unsigned long pid,
-			       unsigned long ap, unsigned long ric)
+static __always_inline void __tlbiel_va(unsigned long va, unsigned long pid,
+					unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -183,8 +183,8 @@ static inline void __tlbiel_va(unsigned long va, unsigned long pid,
 	trace_tlbie(0, 1, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbie_va(unsigned long va, unsigned long pid,
-			      unsigned long ap, unsigned long ric)
+static __always_inline void __tlbie_va(unsigned long va, unsigned long pid,
+				       unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -199,8 +199,8 @@ static inline void __tlbie_va(unsigned long va, unsigned long pid,
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
-			      unsigned long ap, unsigned long ric)
+static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
+					    unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -239,7 +239,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
 /*
  * We use 128 set in radix mode and 256 set in hpt mode.
  */
-static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
+static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 {
 	int set;
 
@@ -341,7 +341,7 @@ static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-static inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
+static __always_inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
 {
 	int set;
 
@@ -381,8 +381,8 @@ static inline void __tlbiel_va_range(unsigned long start, unsigned long end,
 		__tlbiel_va(addr, pid, ap, RIC_FLUSH_TLB);
 }
 
-static inline void _tlbiel_va(unsigned long va, unsigned long pid,
-			      unsigned long psize, unsigned long ric)
+static __always_inline void _tlbiel_va(unsigned long va, unsigned long pid,
+				       unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
 
@@ -413,8 +413,8 @@ static inline void __tlbie_va_range(unsigned long start, unsigned long end,
 		__tlbie_va(addr, pid, ap, RIC_FLUSH_TLB);
 }
 
-static inline void _tlbie_va(unsigned long va, unsigned long pid,
-			      unsigned long psize, unsigned long ric)
+static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
+				      unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
 
@@ -424,7 +424,7 @@ static inline void _tlbie_va(unsigned long va, unsigned long pid,
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-static inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
+static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
 			      unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
-- 
2.7.4

