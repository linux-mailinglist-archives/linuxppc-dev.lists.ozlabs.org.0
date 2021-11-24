Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71B45B7B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:44:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzbgv45NVz3cYb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 20:44:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QXfmj4Th;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzbdJ328Lz2yNq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:42:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QXfmj4Th; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzbdJ1wrNz4xcM;
 Wed, 24 Nov 2021 20:42:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637746932;
 bh=a2tkMO9iFdyjpQSi2g6Y2MHKbDxpUwcLHLlmw03/6bA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QXfmj4ThldoJg1erYhgUBFKZeh8i3aEOBPjdu+EaSfJIR3RY8oYoQgvuBeTvQ3Y2y
 KdqkkEr6F0gVw2Mrt0i/7W21YU+3inWXass2jD7ldMxsBf0B+rGHebeP34OjZWgPAX
 exu/h9Jffm+WROWBB6AOifkvvZfD4pY5txblQq3Y22Wt1jjYQGbI3RTFHnf11OjBxv
 Q8G82Q8ROjtZxCErs2cPrLd+Qderb8jaZOvjGT48UKevvbSeEMUxQa0l8lhPejJg/q
 ov5b5MyfunEVVqTB/zhShPQCImOJtcgjS5sgu/UWFGQ2A0AtmPiwz8X8+6wkehCHC4
 Fz1ZraRrrf5yw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 4/6] powerpc/mm: Move tlbcam_sz() and make it static
Date: Wed, 24 Nov 2021 20:32:52 +1100
Message-Id: <20211124093254.1054750-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124093254.1054750-1-mpe@ellerman.id.au>
References: <20211124093254.1054750-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building with W=1 we see a warning:
  linux/arch/powerpc/mm/nohash/fsl_book3e.c:63:15: error: no previous prototype for ‘tlbcam_sz’

tlbcam_sz() is not used outside this file, so we can make it static.
However it's only used inside #ifdef CONFIG_PPC32, so move it within
that ifdef, otherwise we would get a defined but not used error.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/nohash/fsl_book3e.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index b231a54f540c..7f71bc3bf85f 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -60,11 +60,6 @@ struct tlbcamrange {
 	phys_addr_t phys;
 } tlbcam_addrs[NUM_TLBCAMS];
 
-unsigned long tlbcam_sz(int idx)
-{
-	return tlbcam_addrs[idx].limit - tlbcam_addrs[idx].start + 1;
-}
-
 #ifdef CONFIG_FSL_BOOKE
 /*
  * Return PA for this VA if it is mapped by a CAM, or 0
@@ -264,6 +259,11 @@ void __init MMU_init_hw(void)
 	flush_instruction_cache();
 }
 
+static unsigned long tlbcam_sz(int idx)
+{
+	return tlbcam_addrs[idx].limit - tlbcam_addrs[idx].start + 1;
+}
+
 void __init adjust_total_lowmem(void)
 {
 	unsigned long ram;
-- 
2.31.1

