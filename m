Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952A2E957F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 14:04:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8bS50ndnzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 00:04:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=eY6MA2Kh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8bDg2blmzDqD7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jan 2021 23:54:27 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A87F821D93;
 Mon,  4 Jan 2021 12:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609764865;
 bh=tdZ0nyxPBv4edj4M1RxWgpDXpG751uA7wR/41NIirVQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=eY6MA2KhWWXYYexSL0zB3XPdWPjPOh9femHgSjyT3brhaQo8kkdKf8pJ47+cjR0C9
 H+rVf+OQKUPeaWywKJ5ePx03p58FSwujrtFMG+Tl97buXrJ0xWL0ojfdGmb6oOi6x/
 WWIZ2HF9j7kJF5NLfkw+6YY/Zlk3pgt4HIHGVh/4=
Subject: Patch "asm-generic/tlb: avoid potential double flush" has been added
 to the 4.19-stable tree
To: aneesh.kumar@linux.ibm.com, greg@kroah.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, peterz@infradead.org,
 santosh@fossix.org, sashal@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 04 Jan 2021 13:55:43 +0100
In-Reply-To: <20200312132740.225241-7-santosh@fossix.org>
Message-ID: <160976494321888@kroah.com>
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

    asm-generic/tlb: avoid potential double flush

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asm-generic-tlb-avoid-potential-double-flush.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon Jan  4 01:45:29 PM CET 2021
From: Santosh Sivaraj <santosh@fossix.org>
Date: Thu, 12 Mar 2020 18:57:40 +0530
Subject: asm-generic/tlb: avoid potential double flush
To: <stable@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Greg KH <greg@kroah.com>, Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Message-ID: <20200312132740.225241-7-santosh@fossix.org>

From: Peter Zijlstra <peterz@infradead.org>

commit 0758cd8304942292e95a0f750c374533db378b32 upstream.

Aneesh reported that:

	tlb_flush_mmu()
	  tlb_flush_mmu_tlbonly()
	    tlb_flush()			<-- #1
	  tlb_flush_mmu_free()
	    tlb_table_flush()
	      tlb_table_invalidate()
		tlb_flush_mmu_tlbonly()
		  tlb_flush()		<-- #2

does two TLBIs when tlb->fullmm, because __tlb_reset_range() will not
clear tlb->end in that case.

Observe that any caller to __tlb_adjust_range() also sets at least one of
the tlb->freed_tables || tlb->cleared_p* bits, and those are
unconditionally cleared by __tlb_reset_range().

Change the condition for actually issuing TLBI to having one of those bits
set, as opposed to having tlb->end != 0.

Link: http://lkml.kernel.org/r/20200116064531.483522-4-aneesh.kumar@linux.ibm.com
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Reported-by: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: <stable@vger.kernel.org>  # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
[santosh: backported to 4.19 stable]
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/asm-generic/tlb.h |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -179,7 +179,12 @@ static inline void __tlb_reset_range(str
 
 static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
 {
-	if (!tlb->end)
+	/*
+	 * Anything calling __tlb_adjust_range() also sets at least one of
+	 * these bits.
+	 */
+	if (!(tlb->freed_tables || tlb->cleared_ptes || tlb->cleared_pmds ||
+	      tlb->cleared_puds || tlb->cleared_p4ds))
 		return;
 
 	tlb_flush(tlb);


Patches currently in stable-queue which might be from santosh@fossix.org are

queue-4.19/asm-generic-tlb-track-which-levels-of-the-page-tables-have-been-cleared.patch
queue-4.19/asm-generic-tlb-track-freeing-of-page-table-directories-in-struct-mmu_gather.patch
queue-4.19/asm-generic-tlb-avoid-potential-double-flush.patch
queue-4.19/mm-mmu_gather-invalidate-tlb-correctly-on-batch-allocation-failure-and-flush.patch
queue-4.19/powerpc-mmu_gather-enable-rcu_table_free-even-for-smp-case.patch
queue-4.19/asm-generic-tlb-arch-invert-config_have_rcu_table_invalidate.patch
