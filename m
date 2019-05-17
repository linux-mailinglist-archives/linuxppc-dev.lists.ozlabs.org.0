Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A03E21933
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 15:32:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4558N56KvMzDqT3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 23:32:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4558Kq1GZczDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 23:30:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4558Kp32L4z9s3l; Fri, 17 May 2019 23:30:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4558Kp22lnz9s9N; Fri, 17 May 2019 23:30:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] powerpc/mm/hash: Fix get_region_id() for invalid addresses
Date: Fri, 17 May 2019 23:29:58 +1000
Message-Id: <20190517132958.22299-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

Accesses by userspace to random addresses outside the user or kernel
address range will generate an SLB fault. When we handle that fault we
classify the effective address into several classes, eg. user, kernel
linear, kernel virtual etc.

For addresses that are completely outside of any valid range, we
should not insert an SLB entry at all, and instead immediately an
exception.

In the past this was handled in two ways. Firstly we would check the
top nibble of the address (using REGION_ID(ea)) and that would tell us
if the address was user (0), kernel linear (c), kernel virtual (d), or
vmemmap (f). If the address didn't match any of these it was invalid.

Then for each type of address we would do a secondary check. For the
user region we check against H_PGTABLE_RANGE, for kernel linear we
would mask the top nibble of the address and then check the address
against MAX_PHYSMEM_BITS.

As part of commit 0034d395f89d ("powerpc/mm/hash64: Map all the kernel
regions in the same 0xc range") we replaced REGION_ID() with
get_region_id() and changed the masking of the top nibble to only mask
the top two bits, which introduced a bug.

Addresses less than (4 << 60) are still handled correctly, they are
either less than (1 << 60) in which case they are subject to the
H_PGTABLE_RANGE check, or they are correctly checked against
MAX_PHYSMEM_BITS.

However addresses from (4 << 60) to ((0xc << 60) - 1), are incorrectly
treated as kernel linear addresses in get_region_id(). Then the top
two bits are cleared by EA_MASK in slb_allocate_kernel() and the
address is checked against MAX_PHYSMEM_BITS, which it passes due to
the masking. The end result is we incorrectly insert SLB entries for
those addresses.

That is not actually catastrophic, having inserted the SLB entry we
will then go on to take a page fault for the address and at that point
we detect the problem and report it as a bad fault.

Still we should not be inserting those entries, or treating them as
kernel linear addresses in the first place. So fix get_region_id() to
detect addresses in that range and return an invalid region id, which
we cause use to not insert an SLB entry and directly report an
exception.

Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the same 0xc range")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
[mpe: Drop change to EA_MASK for now, rewrite change log]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/64/hash.h | 4 ++++
 1 file changed, 4 insertions(+)

v2: Drop change to EA_MASK for now, rewrite change log.

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 5486087e64ea..2781ebf6add4 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -93,6 +93,7 @@
 #define VMALLOC_REGION_ID	NON_LINEAR_REGION_ID(H_VMALLOC_START)
 #define IO_REGION_ID		NON_LINEAR_REGION_ID(H_KERN_IO_START)
 #define VMEMMAP_REGION_ID	NON_LINEAR_REGION_ID(H_VMEMMAP_START)
+#define INVALID_REGION_ID	(VMEMMAP_REGION_ID + 1)
 
 /*
  * Defines the address of the vmemap area, in its own region on
@@ -119,6 +120,9 @@ static inline int get_region_id(unsigned long ea)
 	if (id == 0)
 		return USER_REGION_ID;
 
+	if (id != (PAGE_OFFSET >> 60))
+		return INVALID_REGION_ID;
+
 	if (ea < H_KERN_VIRT_START)
 		return LINEAR_MAP_REGION_ID;
 
-- 
2.20.1

