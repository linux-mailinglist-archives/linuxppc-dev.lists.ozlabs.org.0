Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7711195FE2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:36:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pttK31w2zDrMX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 07:36:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=aBXeu1B6; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ptg935GzzDrJt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 07:26:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7UAXQhVhbF5Xlje3k+2zmR/dtajTW+jKmJsNwYeR/iU=; b=aBXeu1B6uT5ZSFJG3BeMvN3tDH
 vbtEKrVW137Gjy3Zp9t7865nhppWpSHRCmruOxlGeQUCBC50DhAyLo8hDR24DP4xucmTiJTm1ZLhA
 EEaotRXbHb94cHy8d+TjWpYQk8D4VVH1p9MaeOGFAP9Tusbm0iXVdsJPjLQgA/xX/2Bawm7s9vjJg
 DPFLMO5beQy5j303k88c/fSVrpKhZNP5jIuHyozro0uam1g55roWlDA4okNz/9xs+EmK7+hR6ebIT
 hDVyW7X4q8RkQ6Bcy7Qo4fx/U6wucN23dPewowYarax3muyHBGTSqxpau2v6kvRKfB/PAxq+lH/mI
 xkpDM6Zw==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHvYd-0003Ix-QZ; Fri, 27 Mar 2020 20:26:23 +0000
Message-Id: <4527a9261897dab67a82f9c3c1020ea9d53edb49.1585340156.git.geoff@infradead.org>
In-Reply-To: <cover.1585340156.git.geoff@infradead.org>
References: <cover.1585340156.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 13:07:31 -0700
Subject: [PATCH 8/9] powerpc/ps3: Add lv1_panic
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 20:26:23 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

lv1_panic takes a single parameter, 0=halt, 1=reboot, and it will
never return.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/boot/ppc_asm.h        | 6 ++++++
 arch/powerpc/include/asm/ppc_asm.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/powerpc/boot/ppc_asm.h b/arch/powerpc/boot/ppc_asm.h
index 192b97523b05..cf758bc63846 100644
--- a/arch/powerpc/boot/ppc_asm.h
+++ b/arch/powerpc/boot/ppc_asm.h
@@ -8,6 +8,12 @@
  * Copyright (C) 1995-1999 Gary Thomas, Paul Mackerras, Cort Dougan.
  */
 
+.macro lv1_panic
+	li	r3, 0
+	li	r11, 255
+	.long 0x44000022
+.endm
+
 /* Condition Register Bit Fields */
 
 #define	cr0	0
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 6b03dff61a05..e76a6a4020ea 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -13,6 +13,12 @@
 
 #ifdef __ASSEMBLY__
 
+.macro lv1_panic
+	li	r3, 0
+	li	r11, 255
+	.long 0x44000022
+.endm
+
 #define SZL			(BITS_PER_LONG/8)
 
 /*
-- 
2.20.1


