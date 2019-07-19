Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6496DD6F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 06:23:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qdCf5ckMzDqJP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 14:23:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fj6QVuVL"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qcjM4qZ2zDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:00:23 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E90A221852;
 Fri, 19 Jul 2019 04:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563508820;
 bh=vrWW74EW8bNcSD5jtLgJJHU1PakyrUlgyqxJvf6p7Q0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fj6QVuVLtHprCgGYFn1oXcXYYEFpFgaRU7TmZ8i4hG6phSD/Kz0fHMVnx4zcfp5lg
 f6DTAcemynStuHrZWnS7ZnnzdW8WI5FOYQZL7qLTe9tvyO3s5qR34b0a42kICRXjgn
 l2j2zDXnvfKeVmfzs+wgRYpmN56m8nLPboVjBCGw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 107/171] powerpc/mm: mark more tlb functions as
 __always_inline
Date: Thu, 18 Jul 2019 23:55:38 -0400
Message-Id: <20190719035643.14300-107-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Laura Abbott <labbott@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit 6d3ca7e73642ce17398f4cd5df1780da4a1ccdaf ]

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
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/book3s64/hash_native.c |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c   | 32 +++++++++++++-------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 30d62ffe3310..1322c59cb5dd 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -56,7 +56,7 @@ static inline void tlbiel_hash_set_isa206(unsigned int set, unsigned int is)
  * tlbiel instruction for hash, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
  */
-static inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
+static __always_inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
 					unsigned int pid,
 					unsigned int ric, unsigned int prs)
 {
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index bb9835681315..d0cd5271a57c 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -25,7 +25,7 @@
  * tlbiel instruction for radix, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
  */
-static inline void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
+static __always_inline void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
 					unsigned int pid,
 					unsigned int ric, unsigned int prs)
 {
@@ -146,8 +146,8 @@ static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
 	trace_tlbie(lpid, 0, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
-				unsigned long ric)
+static __always_inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
+						unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -163,8 +163,8 @@ static inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
 }
 
 
-static inline void __tlbiel_va(unsigned long va, unsigned long pid,
-			       unsigned long ap, unsigned long ric)
+static __always_inline void __tlbiel_va(unsigned long va, unsigned long pid,
+					unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -179,8 +179,8 @@ static inline void __tlbiel_va(unsigned long va, unsigned long pid,
 	trace_tlbie(0, 1, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbie_va(unsigned long va, unsigned long pid,
-			      unsigned long ap, unsigned long ric)
+static __always_inline void __tlbie_va(unsigned long va, unsigned long pid,
+				       unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -195,8 +195,8 @@ static inline void __tlbie_va(unsigned long va, unsigned long pid,
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
-			      unsigned long ap, unsigned long ric)
+static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
+					    unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -235,7 +235,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
 /*
  * We use 128 set in radix mode and 256 set in hpt mode.
  */
-static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
+static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 {
 	int set;
 
@@ -337,7 +337,7 @@ static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-static inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
+static __always_inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
 {
 	int set;
 
@@ -377,8 +377,8 @@ static inline void __tlbiel_va_range(unsigned long start, unsigned long end,
 		__tlbiel_va(addr, pid, ap, RIC_FLUSH_TLB);
 }
 
-static inline void _tlbiel_va(unsigned long va, unsigned long pid,
-			      unsigned long psize, unsigned long ric)
+static __always_inline void _tlbiel_va(unsigned long va, unsigned long pid,
+				       unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
 
@@ -409,8 +409,8 @@ static inline void __tlbie_va_range(unsigned long start, unsigned long end,
 		__tlbie_va(addr, pid, ap, RIC_FLUSH_TLB);
 }
 
-static inline void _tlbie_va(unsigned long va, unsigned long pid,
-			      unsigned long psize, unsigned long ric)
+static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
+				      unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
 
@@ -420,7 +420,7 @@ static inline void _tlbie_va(unsigned long va, unsigned long pid,
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-static inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
+static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
 			      unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
-- 
2.20.1

