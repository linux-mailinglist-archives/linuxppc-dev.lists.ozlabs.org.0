Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18764BF74E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 12:35:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2xtW0GmZz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 22:35:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jmWtq9IU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2xsv46xsz3002
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 22:34:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jmWtq9IU; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K2xsv10dFz4xdL;
 Tue, 22 Feb 2022 22:34:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1645529700;
 bh=m64AeX7xIraCTZSOukRMbUWjf7fDc7RaOTbbYlE60gY=;
 h=From:To:Cc:Subject:Date:From;
 b=jmWtq9IU5eswcN2NDFsfoymwIEpB21tA8EZPxZFDLh5pZIDf9Fd5gWOpzLdntDRej
 7IaOEA/cTfvYjMnEWFsj4/T6oXrG/IKasdC3Vy7ZD522xnZ0DjZZ1lXzj/ZejstVOf
 H4iJx0r7kIPqNcZw2QoHShxgjoxw6SyXkRE6mB0mDKq8CS9qlumxgysI/sdOyS7A1J
 DNHay/HbpEYLHl0vXoXejrCjwfs7gba9MCScEy8pM1CGac3bI5DUtpLRs6M9Petcfj
 Y9eK7TwqRp7sKPLCdSW4Wf3o8V+XAUks/8IbHq1qZXX8/JNJ95rFOrkZzuxj8mMLSC
 riOIXrIwNMyVQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Don't use DSISR for SLB faults
Date: Tue, 22 Feb 2022 22:34:49 +1100
Message-Id: <20220222113449.319193-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: dja@axtens.net, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 46ddcb3950a2 ("powerpc/mm: Show if a bad page fault on data
is read or write.") we use page_fault_is_write(regs->dsisr) in
__bad_page_fault() to determine if the fault is for a read or write, and
change the message printed accordingly.

But SLB faults, aka Data Segment Interrupts, don't set DSISR (Data
Storage Interrupt Status Register) to a useful value. All ISA versions
from v2.03 through v3.1 specify that the Data Segment Interrupt sets
DSISR "to an undefined value". As far as I can see there's no mention of
SLB faults setting DSISR in any BookIV content either.

This manifests as accesses that should be a read being incorrectly
reported as writes, for example, using the xmon "dump" command:

  0:mon> d 0x5deadbeef0000000
  5deadbeef0000000
  [359526.415354][    C6] BUG: Unable to handle kernel data access on write at 0x5deadbeef0000000
  [359526.415611][    C6] Faulting instruction address: 0xc00000000010a300
  cpu 0x6: Vector: 380 (Data SLB Access) at [c00000000ffbf400]
      pc: c00000000010a300: mread+0x90/0x190

If we disassemble the PC, we see a load instruction:

  0:mon> di c00000000010a300
  c00000000010a300 89490000      lbz     r10,0(r9)

We can also see in exceptions-64s.S that the data_access_slb block
doesn't set IDSISR=1, which means it doesn't load DSISR into pt_regs. So
the value we're using to determine if the fault is a read/write is some
stale value in pt_regs from a previous page fault.

Rework the printing logic to separate the SLB fault case out, and only
print read/write in the cases where we can determine it.

The result looks like eg:

  0:mon> d 0x5deadbeef0000000
  5deadbeef0000000
  [  721.779525][    C6] BUG: Unable to handle kernel data access at 0x5deadbeef0000000
  [  721.779697][    C6] Faulting instruction address: 0xc00000000014cbe0
  cpu 0x6: Vector: 380 (Data SLB Access) at [c00000000ffbf390]

  0:mon> d 0
  0000000000000000
  [  742.793242][    C6] BUG: Kernel NULL pointer dereference at 0x00000000
  [  742.793316][    C6] Faulting instruction address: 0xc00000000014cbe0
  cpu 0x6: Vector: 380 (Data SLB Access) at [c00000000ffbf390]

Fixes: 46ddcb3950a2 ("powerpc/mm: Show if a bad page fault on data is read or write.")
Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/fault.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index eb8ecd7343a9..7ba6d3eff636 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -567,18 +567,24 @@ NOKPROBE_SYMBOL(hash__do_page_fault);
 static void __bad_page_fault(struct pt_regs *regs, int sig)
 {
 	int is_write = page_fault_is_write(regs->dsisr);
+	const char *msg;
 
 	/* kernel has accessed a bad area */
 
+	if (regs->dar < PAGE_SIZE)
+		msg = "Kernel NULL pointer dereference";
+	else
+		msg = "Unable to handle kernel data access";
+
 	switch (TRAP(regs)) {
 	case INTERRUPT_DATA_STORAGE:
-	case INTERRUPT_DATA_SEGMENT:
 	case INTERRUPT_H_DATA_STORAGE:
-		pr_alert("BUG: %s on %s at 0x%08lx\n",
-			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
-			 "Unable to handle kernel data access",
+		pr_alert("BUG: %s on %s at 0x%08lx\n", msg,
 			 is_write ? "write" : "read", regs->dar);
 		break;
+	case INTERRUPT_DATA_SEGMENT:
+		pr_alert("BUG: %s at 0x%08lx\n", msg, regs->dar);
+		break;
 	case INTERRUPT_INST_STORAGE:
 	case INTERRUPT_INST_SEGMENT:
 		pr_alert("BUG: Unable to handle kernel instruction fetch%s",
-- 
2.34.1

