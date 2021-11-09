Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF744B98A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HplV02bwsz305v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:05:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HI320WgY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out1-smtp.messagingengine.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HI320WgY; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HplTM3jR5z2yV5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:04:37 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B08FA5C01B5;
 Tue,  9 Nov 2021 19:04:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 09 Nov 2021 19:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pxYQptxKAANotcVk8750InSOMFKmeE5dNUCPfDenwBA=; b=HI320WgY
 mHuVSK3efM0vTvk6r9P1KKQseNrpR5JhgtWMMeYDRj/8mOQ78oH4GrzbwzuDE7VI
 48UXSrjmvniZ/UM4V+mP8nJOrF4MZUZZw87kel1nztKMMLOg4eLu9wlG7Gq1Nq8o
 ls9Vb+PZIIGCtykdDGymGiPoCuoiosCbEupSE/NXLWfAPFbAZtgIYQ9Dm/offBYB
 nX8doTIWwu3lMsFcFb5PW7LzIaReglmAWbduBhcxniMdT6vqxmfSvlwYvHqk7p+9
 qPZE6kDW125HUSbMdNKxuocQIT+r3d9DtaMsnVRFisIKDMfmHKlGqJsfkzyi2vKs
 Fv/K4I/i7fskAA==
X-ME-Sender: <xms:kQyLYfuTNn4JmykkG_4LJurGr5GPNYY_WFRs82F77XIu1nqN_3Ku-A>
 <xme:kQyLYQegiiM-xyEyQNVTatUMR3DkNqQSYmqMMNn56TjDwqJPPbaVmxIk5KNBOOUYL
 xRkX_jtPpvxNpD6wQ8>
X-ME-Received: <xmr:kQyLYSzFoD1dF66FN-1eiPbwy1j5H57sXKXPakBB_HdOFzjxSre68pPu-q9UrHd8UXUH4iX2T9uGetungZKCjSn3k3p_BUVMfGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefvkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghinhcu
 oehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpe
 ekfeeukeelhfekudehheeglefgfeevffeglefhvdehheehtddvleegveefffetvdenucff
 ohhmrghinhepkhgvrhhnvghlrdhorhhgpdhprhhothhonhhmrghilhdrtghomhenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinhes
 lhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:kQyLYePnDODpgsejDPvJ-BRHTorjW0ZAiSaEXjWACg26zsVMfnMM2Q>
 <xmx:kQyLYf9xXNkntgAonxrXDU1HseNkTC5KZlX9PrNAWq8-zEegHuUUNQ>
 <xmx:kQyLYeU_wlTXmpVqTDF2lhAsYfcujJ8OESz8wEASZXSHtKthjyTWFQ>
 <xmx:kwyLYbbsmwWbmIqz0mbQhnVXEpMn1vc2JsTpcp-gmc_2zd0Vt3efuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Nov 2021 19:04:30 -0500 (EST)
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Message-Id: <08bbe7240b384016e0b2912ecf3bf5e2d25ef2c6.1636501628.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] powerpc: Fix sigset_t copy
Date: Wed, 10 Nov 2021 10:47:08 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Christopher M. Riedl" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

The conversion from __copy_from_user() to __get_user() introduced a
regression in __get_user_sigset() in v5.13. The bug was subsequently
copied and pasted in unsafe_get_user_sigset().

The regression was reported by users of the Xorg packages distributed in
Debian/powerpc --

    "The symptoms are that the fb screen goes blank, with the backlight
    remaining on and no errors logged in /var/log; wdm (or startx) run
    with no effect (I tried logging in in the blind, with no effect).
    And they are hard to kill, requiring 'kill -KILL ...'"

Fix the regression by casting the __get_user() assignment lvalue to u64
so that the entire struct gets copied.

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Christopher M. Riedl <cmr@bluescreens.de>
Link: https://lore.kernel.org/linuxppc-dev/FEtBUOuFPMN4zJy4bIOqz6C4xoliCbTxS7VtMKD6UZkbvEbycUceRgGAd7e9-trRdwVN3hWAbQi0qrNx8Zgn8niTQf2KPVdw-W35czDIaeQ=@protonmail.com/
Fixes: 887f3ceb51cd ("powerpc/signal32: Convert do_setcontext[_tm]() to user access block")
Fixes: d3ccc9781560 ("powerpc/signal: Use __get_user() to copy sigset_t")
Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Christophe, I hope this change is the one you wanted to see upstream (?).
If it is acceptable please add your signed-off-by tag.
---
 arch/powerpc/kernel/signal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 1f07317964e4..44e736b88e91 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -23,10 +23,10 @@ static inline int __get_user_sigset(sigset_t *dst, const sigset_t __user *src)
 {
 	BUILD_BUG_ON(sizeof(sigset_t) != sizeof(u64));
 
-	return __get_user(dst->sig[0], (u64 __user *)&src->sig[0]);
+	return __get_user(*(u64 *)&dst->sig[0], (u64 __user *)&src->sig[0]);
 }
 #define unsafe_get_user_sigset(dst, src, label) \
-	unsafe_get_user((dst)->sig[0], (u64 __user *)&(src)->sig[0], label)
+	unsafe_get_user(*(u64 *)&(dst)->sig[0], (u64 __user *)&(src)->sig[0], label)
 
 #ifdef CONFIG_VSX
 extern unsigned long copy_vsx_to_user(void __user *to,
-- 
2.26.3

