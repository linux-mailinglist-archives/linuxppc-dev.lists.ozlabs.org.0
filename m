Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5612A1465BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 11:27:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483JPX1flSzDqVL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 21:27:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483JMq63ZyzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 21:26:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FCiVaKEu; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 483JMp6Ds4z9sP3; Thu, 23 Jan 2020 21:26:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 483JMp5NYZz9sRl; Thu, 23 Jan 2020 21:26:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579775174;
 bh=Squj6wzbOSotFUBoHxz1j3AZ99NBCHQVhTT6a7XekJA=;
 h=From:To:Cc:Subject:Date:From;
 b=FCiVaKEu83JGDzR9RI1He194pfyZtDJTuDYRb2CbgduWMI4EAbh+nRWFmBziX2x0l
 73wUy4HWgzjKwMG4S3eWc97OlWi+rh5hC3na45UfE3KPw2v1HQjBTXhugH93Silvgf
 SiNL+pf+qqk8CHasWKuxjZuOsB9f3E/sRCSNXIr8h23DPL/B54JFrf5F5Zbnl3cw0O
 0lRN9QPmWOeLuu+1vhX/ICU//uXNJDDW21ePXsfEUBapeDPiQ3l4k/Qg59zPNOwaXU
 dpvawSjTidpog0/iSILza1zA/mdCHQbbDZb4CAIQ2G3EvD11eYcbL7+QSLlgSXP7/E
 vZToBibaXuA7A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] powerpc/mm/hash: Fix sharing context ids between kernel &
 userspace
Date: Thu, 23 Jan 2020 21:25:47 +1100
Message-Id: <20200123102547.11623-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
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
Cc: aneesh.kumar@linux.ibm.com, marillat@debian.org,
 debian-powerpc@lists.debian.org, romain@dolbeau.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

Commit 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in
the same 0xc range") has a bug in the definition of MIN_USER_CONTEXT.

The result is that the context id used for the vmemmap and the lowest
context id handed out to userspace are the same. The context id is
essentially the process identifier as far as the first stage of the
MMU translation is concerned.

This can result in multiple SLB entries with the same VSID (Virtual
Segment ID), accessible to the kernel and some random userspace
process that happens to get the overlapping id, which is not expected
eg:

  07 c00c000008000000 40066bdea7000500  1T  ESID=   c00c00  VSID=      66bdea7 LLP:100
  12 0002000008000000 40066bdea7000d80  1T  ESID=      200  VSID=      66bdea7 LLP:100

Even though the user process and the kernel use the same VSID, the
permissions in the hash page table prevent the user process from
reading or writing to any kernel mappings.

It can also lead to SLB entries with different base page size
encodings (LLP), eg:

  05 c00c000008000000 00006bde0053b500 256M ESID=c00c00000  VSID=    6bde0053b LLP:100
  09 0000000008000000 00006bde0053bc80 256M ESID=        0  VSID=    6bde0053b LLP:  0

Such SLB entries can result in machine checks, eg. as seen on a G5:

  Oops: Machine check, sig: 7 [#1]
  BE PAGE SIZE=64K MU-Hash SMP NR_CPUS=4 NUMA Power Mac
  NIP: c00000000026f248 LR: c000000000295e58 CTR: 0000000000000000
  REGS: c0000000erfd3d70 TRAP: 0200 Tainted: G M (5.5.0-rcl-gcc-8.2.0-00010-g228b667d8ea1)
  MSR: 9000000000109032 <SF,HV,EE,ME,IR,DR,RI> CR: 24282048 XER: 00000000
  DAR: c00c000000612c80 DSISR: 00000400 IRQMASK: 0
  ...
  NIP [c00000000026f248] .kmem_cache_free+0x58/0x140
  LR  [c088000008295e58] .putname 8x88/0xa
  Call Trace:
    .putname+0xB8/0xa
    .filename_lookup.part.76+0xbe/0x160
    .do_faccessat+0xe0/0x380
    system_call+0x5c/ex68

This happens with 256MB segments and 64K pages, as the duplicate VSID
is hit with the first vmemmap segment and the first user segment, and
older 32-bit userspace maps things in the first user segment.

On other CPUs a machine check is not seen. Instead the userspace
process can get stuck continuously faulting, with the fault never
properly serviced, due to the kernel not understanding that there is
already a HPTE for the address but with inaccessible permissions.

On machines with 1T segments we've not seen the bug hit other than by
deliberately exercising it. That seems to be just a matter of luck
though, due to the typical layout of the user virtual address space
and the ranges of vmemmap that are typically populated.

To fix it we add 2 to MIN_USER_CONTEXT. This ensures the lowest
context given to userspace doesn't overlap with the VMEMMAP context,
or with the context for INVALID_REGION_ID.

Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the same 0xc range")
Cc: stable@vger.kernel.org # v5.2+
Reported-by: Christian Marillat <marillat@debian.org>
Reported-by: Romain Dolbeau <romain@dolbeau.org>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
[mpe: Account for INVALID_REGION_ID, mostly rewrite change log]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 15b75005bc34..3fa1b962dc27 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -600,8 +600,11 @@ extern void slb_set_size(u16 size);
  *
  */
 #define MAX_USER_CONTEXT	((ASM_CONST(1) << CONTEXT_BITS) - 2)
+
+// The + 2 accounts for INVALID_REGION and 1 more to avoid overlap with kernel
 #define MIN_USER_CONTEXT	(MAX_KERNEL_CTX_CNT + MAX_VMALLOC_CTX_CNT + \
-				 MAX_IO_CTX_CNT + MAX_VMEMMAP_CTX_CNT)
+				 MAX_IO_CTX_CNT + MAX_VMEMMAP_CTX_CNT + 2)
+
 /*
  * For platforms that support on 65bit VA we limit the context bits
  */
-- 
2.21.1

