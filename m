Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAD9DD97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 08:22:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hf0p4sj7zDqJf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="AeDKTHrN"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hdxr1GsbzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 16:19:28 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94FEF206BB;
 Tue, 27 Aug 2019 06:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566886766;
 bh=JaVlLa0/tdeRSKR+Vdqsa6mY4s2GtXNkm2DUAlnwN5w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=AeDKTHrNweDIAIOpZ0P3mrtvqIxQwGlcmbpR5vCms/u67PMN1Lzykrbkb+4F6KtfU
 n4wrRl8185RN+NRZHEvl7xTX+SUW7UfH7AZpUYOia22sNs1pO3lffQFGmyEHBTlJce
 8Oa3RX9IwMOSNFQBW5cQEyOrHvfOZ2qdg8J6z1+0=
Subject: Patch "powerpc: Allow flush_(inval_)dcache_range to work across
 ranges >4GB" has been added to the 4.14-stable tree
To: alastair@au1.ibm.com, alastair@d-silva.org, allison@lohutok.net,
 benh@kernel.crashing.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, paulus@samba.org,
 tglx@linutronix.de
From: <gregkh@linuxfoundation.org>
Date: Tue, 27 Aug 2019 08:19:23 +0200
In-Reply-To: <20190821001929.4253-1-alastair@au1.ibm.com>
Message-ID: <15668867631820@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc: Allow flush_(inval_)dcache_range to work across ranges >4GB

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-allow-flush_-inval_-dcache_range-to-work-across-ranges-4gb.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From alastair@au1.ibm.com  Tue Aug 27 08:18:42 2019
From: "Alastair D'Silva" <alastair@au1.ibm.com>
Date: Wed, 21 Aug 2019 10:19:27 +1000
Subject: powerpc: Allow flush_(inval_)dcache_range to work across ranges >4GB
To: alastair@d-silva.org
Cc: stable@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Message-ID: <20190821001929.4253-1-alastair@au1.ibm.com>


From: Alastair D'Silva <alastair@d-silva.org>

The upstream commit:
22e9c88d486a ("powerpc/64: reuse PPC32 static inline flush_dcache_range()")
has a similar effect, but since it is a rewrite of the assembler to C, is
too invasive for stable. This patch is a minimal fix to address the issue in
assembler.

This patch applies cleanly to v5.2, v4.19 & v4.14.

When calling flush_(inval_)dcache_range with a size >4GB, we were masking
off the upper 32 bits, so we would incorrectly flush a range smaller
than intended.

This patch replaces the 32 bit shifts with 64 bit ones, so that
the full size is accounted for.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/powerpc/kernel/misc_64.S |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -134,7 +134,7 @@ _GLOBAL_TOC(flush_dcache_range)
 	subf	r8,r6,r4		/* compute length */
 	add	r8,r8,r5		/* ensure we get enough */
 	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of dcache block size */
-	srw.	r8,r8,r9		/* compute line count */
+	srd.	r8,r8,r9		/* compute line count */
 	beqlr				/* nothing to do? */
 	mtctr	r8
 0:	dcbst	0,r6
@@ -190,7 +190,7 @@ _GLOBAL(flush_inval_dcache_range)
 	subf	r8,r6,r4		/* compute length */
 	add	r8,r8,r5		/* ensure we get enough */
 	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)/* Get log-2 of dcache block size */
-	srw.	r8,r8,r9		/* compute line count */
+	srd.	r8,r8,r9		/* compute line count */
 	beqlr				/* nothing to do? */
 	sync
 	isync


Patches currently in stable-queue which might be from alastair@au1.ibm.com are

queue-4.14/powerpc-allow-flush_-inval_-dcache_range-to-work-across-ranges-4gb.patch
