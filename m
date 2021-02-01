Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339130A648
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 12:14:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTlhD1wxczDr6X
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 22:14:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=thalesgroup.com (client-ip=192.54.144.131;
 helo=thsbbfxrt01p.thalesgroup.com;
 envelope-from=christoph.plattner@thalesgroup.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=thalesgroup.com header.i=@thalesgroup.com header.a=rsa-sha256
 header.s=xrt20181201 header.b=CBAaMe9A; 
 dkim-atps=neutral
X-Greylist: delayed 163 seconds by postgrey-1.36 at bilbo;
 Mon, 01 Feb 2021 21:25:10 AEDT
Received: from thsbbfxrt01p.thalesgroup.com (thsbbfxrt01p.thalesgroup.com
 [192.54.144.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTkbV3SWmzDr4R
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 21:25:09 +1100 (AEDT)
Received: from thsbbfxrt01p.thalesgroup.com (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id 4DTkXB4D53z45Qr;
 Mon,  1 Feb 2021 11:22:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
 s=xrt20181201; t=1612174938;
 bh=/2F5vq4oymBbM5nfZMRPtiW6YvTEVBF5rHCmnV0yjBs=;
 h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
 Content-Transfer-Encoding:MIME-Version:From;
 b=CBAaMe9Acnnc5Er4zZVdn6Hm/hDdmOcCRn6XBBZMo7QbHhkFEs4jBysgcKsT23U8x
 R/OWe3ViX+bjVHRiNp5NcenaOv5yS/G2L1X32OrBNS3ezARIsdOIiPOw+z6t5WI9Yc
 LGHw6qsQ4vL8R9aAKmhOdM5Nb6yZ8nz53k3czsPJHkqwi0XPu65LyHkkvQAI7gpYR8
 DSUDFLOAJ4u8ryNpXteZPONrVpcO6xggjxJ1tzRascyHWhTL1JaK8BQHXQ2vwQodCD
 qMqx8O9pFyFSannN03YpjssunH3g671ywRJg7DetXm9y9wMen4Z1oGe1t4ijU/lNQd
 DtVUOlZFdb4+A==
From: PLATTNER Christoph <christoph.plattner@thalesgroup.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
Subject: RE: [PATCH] powerpc/603: Fix protection of user pages mapped with
 PROT_NONE
Thread-Topic: [PATCH] powerpc/603: Fix protection of user pages mapped with
 PROT_NONE
Thread-Index: AQHW+GOl2yWYuEbTpkiT/C3KqD+6EapC56vA
Date: Mon, 1 Feb 2021 10:22:16 +0000
Message-ID: <1b194840-d4e6-4660-94d9-6bac623442cf@THSDC1IRIMBX13P.iris.infra.thales>
References: <4a0c6e3bb8f0c162457bf54d9bc6fd8d7b55129f.1612160907.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4a0c6e3bb8f0c162457bf54d9bc6fd8d7b55129f.1612160907.git.christophe.leroy@csgroup.eu>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-pmwin-version: 4.0.3, Antivirus-Engine: 3.79.0, Antivirus-Data: 5.81
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Feb 2021 22:10:38 +1100
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
Cc: KOENIG Werner <werner.koenig@thalesgroup.com>, HAMETNER
 Reinhard <reinhard.hametner@thalesgroup.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 REITHER Robert - Contractor <robert.reither@external.thalesgroup.com>,
 PLATTNER Christoph <christoph.plattner@thalesgroup.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello to all, and thank you very much for first and second fast response.

I do not have a long history on PowerPC MMU environment, I hacked into this=
 topic
for about 3 months for analyzing that problem- so, sorry, if I am wrong in =
some points ...

What I learn so far from this MPC5121e (variant of e300c4 core):
- It uses book3s32 hash-code, but it DOES NOT provide KEY hash method, so a=
lways the=20
   branch  "if (! Hash) ...." is taken, so, I assume that "key 0" and "key =
1" setups are not
   used on this CPU (not supporting MMU_FTR_HPTE_TABLE)
- The PP bits are NOT checked by the CPU in HW, even if set to 00, the CPU =
does not react.
   As far I have understood, the TLB miss routines are responsible for chec=
king permissions.
   The TLB miss routines check the Linux PTE styled entries and generates t=
he PP bits
   for the TLB entry. The PowerPC PP bits are never check elsewhere on that=
 CPU models ...
- The PTE entries in Linux are fully "void" in sense of this CPU type, as t=
his CPU does not
   read any PTEs from RAM (no HW support in contrast to x86 or ARM or later=
 ppc...).

In summary - as far as I understand it now - we have to handle the PTE bits=
 differently
(Linux style) for PROT_NONE permissions - OR - we have to expand the permis=
sion=20
checking like my proposed experimental patch. (PROT_NONE is not NUMA relate=
d only,
but may not used very often ...).

Another related point:
According e300 RM (manual) the ACCESSED bit in the PTE shall be set on TLB =
miss, as
it is an indication, that page is used. In 4.4 kernel this write back of th=
e _PAGE_ACCESSED=20
bit was performed after successful permission check:

        bne-    DataAddressInvalid      /* return if access not permitted *=
/
        ori     r0,r0,_PAGE_ACCESSED    /* set _PAGE_ACCESSED in pte */
        /*
         * NOTE! We are assuming this is not an SMP system, otherwise
         * we would need to update the pte atomically with lwarx/stwcx.
         */
        stw     r0,0(r2)                /* update PTE (accessed bit) */
        /* Convert linux-style PTE to low word of PPC-style PTE */

Bit is set (ori ...) and written back (stw ...) to Linux PTE. May be, this =
is not needed, as the
PTE is never seen by the PPC chip. But I do not understand, WHY the PAGE_AC=
CCESSED=20
is used for permission check in the late 5.4 kernel (not used in 4.4 kernel=
):

	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SDR1
	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
	rlwinm	r2, r2, 28, 0xfffff000
 	bgt-	112f

What is the reason or relevance for checking this here ?
Was not checked in 4.4, bit or-ed afterwards, as it is accessed now.
Do you know the reason of change on this point ?

Another remark to Core manual relevant for this:
There is the reference manual for e300 core available (e300 RM). It include=
s
many remarks in range of Memory Management section, that many features
are optional or variable for dedicated implementations. On the other hand,=
=20
the MPC5121e reference manual refers to the e300 core RM, but DOES NOT=20
information, which of the optional points are there or nor. According my
analysis, MPC5121e does not include any of the optional features.


Thanks a lot for first reactions
Christoph


-----Original Message-----
From: Christophe Leroy <christophe.leroy@csgroup.eu>=20
Sent: Montag, 1. Februar 2021 07:30
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerras <paul=
us@samba.org>; Michael Ellerman <mpe@ellerman.id.au>; PLATTNER Christoph <c=
hristoph.plattner@thalesgroup.com>
Cc: linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/603: Fix protection of user pages mapped with PROT=
_NONE

On book3s/32, page protection is defined by the PP bits in the PTE which pr=
ovide the following protection depending on the access keys defined in the =
matching segment register:
- PP 00 means RW with key 0 and N/A with key 1.
- PP 01 means RW with key 0 and RO with key 1.
- PP 10 means RW with both key 0 and key 1.
- PP 11 means RO with both key 0 and key 1.

Since the implementation of kernel userspace access protection, PP bits hav=
e been set as follows:
- PP00 for pages without _PAGE_USER
- PP01 for pages with _PAGE_USER and _PAGE_RW
- PP11 for pages with _PAGE_USER and without _PAGE_RW

For kernelspace segments, kernel accesses are performed with key 0 and user=
 accesses are performed with key 1. As PP00 is used for non _PAGE_USER page=
s, user can't access kernel pages not flagged _PAGE_USER while kernel can.

For userspace segments, both kernel and user accesses are performed with ke=
y 0, therefore pages not flagged _PAGE_USER are still accessible to the use=
r.

This shouldn't be an issue, because userspace is expected to be accessible =
to the user. But unlike most other architectures, powerpc implements PROT_N=
ONE protection by removing _PAGE_USER flag instead of flagging the page as =
not valid. This means that pages in userspace that are not flagged _PAGE_US=
ER shall remain inaccessible.

To get the expected behaviour, just mimic other architectures in the TLB mi=
ss handler by checking _PAGE_USER permission on userspace accesses as if it=
 was the _PAGE_PRESENT bit.

Note that this problem only is only for 603 cores. The 604+ have an hash ta=
ble, and hash_page() function already implement the verification of _PAGE_U=
SER permission on userspace pages.

Reported-by: Christoph Plattner <christoph.plattner@thalesgroup.com>
Fixes: f342adca3afc ("powerpc/32s: Prepare Kernel Userspace Access Protecti=
on")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/hea=
d_book3s_32.S
index 858fbc8b19f3..0004e8a6a58e 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -453,11 +453,12 @@ InstructionTLBMiss:
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SDR1
-	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
+	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC | _PAGE_USER
 	rlwinm	r2, r2, 28, 0xfffff000
 #ifdef CONFIG_MODULES
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 #endif
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
@@ -516,10 +517,11 @@ DataLoadTLBMiss:
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SDR1
-	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER
 	rlwinm	r2, r2, 28, 0xfffff000
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
 	lwz	r2,0(r2)		/* get pmd entry */
@@ -593,10 +595,11 @@ DataStoreTLBMiss:
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SDR1
-	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_US=
ER
 	rlwinm	r2, r2, 28, 0xfffff000
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
 	lwz	r2,0(r2)		/* get pmd entry */
--
2.25.0

