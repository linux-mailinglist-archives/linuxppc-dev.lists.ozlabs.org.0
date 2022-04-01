Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5C4EEA82
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 11:36:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVFRZ3Rrvz3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 20:36:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fsv39nau;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVFQR3SZqz300K
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 20:35:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Fsv39nau; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KVFQK0x4mz4xYD;
 Fri,  1 Apr 2022 20:35:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1648805721;
 bh=8e4k1U1NBPqzNOx8sdInqsC50OxA6Vedm+guDQwMpcA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fsv39nauQnw9ihrAJjnvFs92VEON2w/1NBbf3vfaYZZvahwCto9UhZGwf3APisdIn
 6HD55SL3oH8EXViToG+xju9uKc88RwSLHIZtLF6+4Wd2RtpXwobuiZx0yybkl3B6Fn
 68Jg1/vQ7Ho6wtvXFn3P1goeU5oqkplSnhCQd7kA+rQY/2zoA9DlEh+0ayse8aZT2j
 uhQS9jagioD1O8an3jwfyCbfWgCRgaz9IYw8COSCJioob4MtINtkuvdbUc5w2mBE6N
 XsYWl/P2pNg4TEaZObp8d5bqJxmBELpA2byuwtBkrDT90ukh8zFxRRScweGIfMejZw
 jtll7NIdRnOpw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 4.19 2/2] powerpc/64s: Unmerge EX_LR and EX_DAR
Date: Fri,  1 Apr 2022 20:35:07 +1100
Message-Id: <20220401093507.4137600-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401093507.4137600-1-mpe@ellerman.id.au>
References: <20220401093507.4137600-1-mpe@ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The SLB miss handler is not fully re-entrant, it is able to work because
we ensure that the SLB entries for the kernel text and data segment, as
well as the kernel stack are pinned in the SLB. Accesses to kernel data
outside of those areas has to be carefully managed and can only occur in
certain parts of the code. One way we deal with that is by storing some
values in temporary slots in the paca.

In v4.13 in commit dbeea1d6b4bd ("powerpc/64s/paca: EX_LR can be merged
with EX_DAR") we merged the storage for two temporary slots for register
storage during SLB miss handling. That was safe at the time because the
two slots were never used at the same time.

Unfortunately in v4.17 in commit c2b4d8b7417a ("powerpc/mm/hash64:
Increase the VA range") we broke that condition, and introduced a case
where the two slots could be in use at the same time, leading to one
being corrupted.

Specifically in slb_miss_common() when we detect that we're handling a
fault for a large virtual address (> 512TB) we go to the "8" label,
there we store the original fault address into paca->exslb[EX_DAR],
before jumping to large_addr_slb() (using rfid).

We then use the EXCEPTION_PROLOG_COMMON and RECONCILE_IRQ_STATE macros
to do exception setup, before reloading the fault address from
paca->exslb[EX_DAR] and storing it into pt_regs->dar (Data Address
Register).

However the code generated by those macros can cause a recursive SLB
miss on a kernel address in three places.

Firstly is the saving of the PPR (Program Priority Register), which
happens on all CPUs since Power7, the PPR is saved to the thread struct
which can be anywhere in memory. There is also the call to
accumulate_stolen_time() if CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y and
CONFIG_PPC_SPLPAR=y, and also the call to trace_hardirqs_off() if
CONFIG_TRACE_IRQFLAGS=y. The latter two call into generic C code and can
lead to accesses anywhere in memory.

On modern 64-bit CPUs we have 1TB segments, so for any of those accesses
to cause an SLB fault they must access memory more than 1TB away from
the kernel text, data and kernel stack. That typically only happens on
machines with more than 1TB of RAM. However it is possible on multi-node
Power9 systems, because memory on the 2nd node begins at 32TB in the
linear mapping.

If we take a recursive SLB fault then we will corrupt the original fault
address with the LR (Link Register) value, because the EX_DAR and EX_LR
slots share storage. Subsequently we will think we're trying to fault
that LR address, which is the wrong address, and will also mostly likely
lead to a segfault because the LR address will be < 512TB and so will be
rejected by slb_miss_large_addr().

This appears as a spurious segfault to userspace, and if
show_unhandled_signals is enabled you will see a fault reported in dmesg
with the LR address, not the expected fault address, eg:

  prog[123]: segfault (11) at 128a61808 nip 128a618cc lr 128a61808 code 3 in prog[128a60000+10000]
  prog[123]: code: 4bffffa4 39200040 3ce00004 7d2903a6 3c000200 78e707c6 780083e4 7d3b4b78
  prog[123]: code: 7d455378 7d7d5b78 7d9f6378 7da46b78 <f8670000> 7d3a4b78 7d465378 7d7c5b78

Notice that the fault address == the LR, and the faulting instruction is
a simple store that should never use LR.

In upstream this was fixed in v4.20 in commit
48e7b7695745 ("powerpc/64s/hash: Convert SLB miss handlers to C"),
however that is a huge rewrite and not backportable.

The minimal fix for stable is to just unmerge the EX_LR and EX_DAR slots
again, avoiding the corruption of the DAR value. This uses an extra 8
bytes per CPU, which is negligble.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/exception-64s.h | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index f0424c6fdeca..4fdae1c182df 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -48,11 +48,12 @@
 #define EX_CCR		52
 #define EX_CFAR		56
 #define EX_PPR		64
+#define EX_LR		72
 #if defined(CONFIG_RELOCATABLE)
-#define EX_CTR		72
-#define EX_SIZE		10	/* size in u64 units */
+#define EX_CTR		80
+#define EX_SIZE		11	/* size in u64 units */
 #else
-#define EX_SIZE		9	/* size in u64 units */
+#define EX_SIZE		10	/* size in u64 units */
 #endif
 
 /*
@@ -60,14 +61,6 @@
  */
 #define MAX_MCE_DEPTH	4
 
-/*
- * EX_LR is only used in EXSLB and where it does not overlap with EX_DAR
- * EX_CCR similarly with DSISR, but being 4 byte registers there is a hole
- * in the save area so it's not necessary to overlap them. Could be used
- * for future savings though if another 4 byte register was to be saved.
- */
-#define EX_LR		EX_DAR
-
 /*
  * EX_R3 is only used by the bad_stack handler. bad_stack reloads and
  * saves DAR from SPRN_DAR, and EX_DAR is not used. So EX_R3 can overlap
-- 
2.34.1

