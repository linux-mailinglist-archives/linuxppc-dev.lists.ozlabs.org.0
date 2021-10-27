Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A043C3DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 09:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfKwL45TWz2ynS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 18:25:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=wBUTRRjs;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XMstJstC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=wBUTRRjs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=XMstJstC; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfKvb5KSVz2xBK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 18:24:43 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AF695C027E;
 Wed, 27 Oct 2021 03:24:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 03:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=e1pxip31IJyLhG/0E0WVoI5NNG
 wJfOBP2xmwQif+2TM=; b=wBUTRRjsQGEcInDttG06fEHuRwGJmUfwURiFBnYknm
 86+1O0yxcPUGSbluPs0vtioBOJJJ2otHuicLT+Gx0VasQzX7/u6y35UaUjvCd8oR
 Fbw/VT3JNxOzOiacBN80kfpbxo5XKO2+vldl/St1DHAqBSqsEhoJc1DdODCyWU7D
 tZpdsP5dEb4e64YvR8Z/0x8uTwn+Eb3EUxpf6EWf2uvNlAqJ28pLtfgXZGEy6Ui+
 IYqzDLyalw6/zUUs/HftW7YNyWty/txKFLE1wm30Y6WUISPXxNvqvryifurwZRD8
 7w38gG535SvbjLpjXzhyj1+Kflac3EAhCTgwfdKKPo8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=e1pxip31IJyLhG/0E
 0WVoI5NNGwJfOBP2xmwQif+2TM=; b=XMstJstCgzPqr+XGAM+DbqOp8QtbgS/j9
 ZmvQCJktcQ9SrIvxNCPDtrGavTrTI4oUzLrWFF0uaxpvZUDAgAMUU1tAJLrFvXms
 7YF1Kzw6EyGHjS3N/p9BOlRIQMCEcvjMADJzfWHdtH1qLxxERQWwawZwkrcq0MIT
 V4l0AhdSsfElBtsd7Bh3bs42StgDhGt1T2YVpBZv8f8cd76xS3AlCp6k0feHgj38
 xRfKzLMAU5BEqdnxKdNUfUbT/Z+4CstsuI9vLTUxH7am88ou7GsjtjW6UrTeullQ
 5nB1UqCKe8i+Hh7k67W3nvfG5EelztJ6Hn/C90ASTViUUPcDxBn9Q==
X-ME-Sender: <xms:tv54YSRQeqdDX9zkNTKiP_Vcl5cP15ALPe6Sc4ng85CjFsHH-J8w5w>
 <xme:tv54YXyTOpQd7vXNXdYk24uF3X1lq5dc5oTmc8p3Pgu73_47VYgJujcLwnvVjiYrs
 OCXkn5QgKlSyPjTrA>
X-ME-Received: <xmr:tv54Yf2LIjNMLfSzcLzKMkdxV_u1PO4FAGbK7T8hIYixIxhVxJnc5Qcj2JEWOxtejp6xr2ozgwlh319UOZYjfv-lyHe87D2EgiUUBEQYuI1jgPUPoeVflIgHGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefledguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephf
 fvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeelge
 elfedvffekgeevfeelveeftdeilefgudegkeeuhefhvefgffekuefgffekfeenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrh
 hushhsvghllhdrtggt
X-ME-Proxy: <xmx:tv54YeBUmofXtCTCsjYn2Wt9RWbo0GkHsOikNqznN8hlaXszVKyJbQ>
 <xmx:tv54Ybgnux_LmE2B0X2d0zRJ3y-7cTph5jyRcao-wFzJ_X7iJc3boQ>
 <xmx:tv54YarV5VbC1w1zi4L9qjD0PHIdLUugDIudWA48urJLTpH190WdXQ>
 <xmx:t_54YetzLheMHdVVcUqASUmce6zWzoqhbsbIB97ZK3zEhIcpllKTgg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 03:24:36 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/security: Use a mutex for interrupt exit code patching
Date: Wed, 27 Oct 2021 17:24:10 +1000
Message-Id: <20211027072410.40950-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.33.1
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
Cc: npiggin@gmail.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mitigation-patching.sh script in the powerpc selftests toggles
all mitigations on and off simultaneously, revealing that rfi_flush
and stf_barrier cannot safely operate at the same time due to races
in updating the static key.

On some systems, the static key code throws a warning and the kernel
remains functional.  On others, the kernel will hang or crash.

Fix this by slapping on a mutex.

Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed up return from interrupt")
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/lib/feature-fixups.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index cda17bee5afe..9956277fbd88 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -228,6 +228,7 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 
 static bool stf_exit_reentrant = false;
 static bool rfi_exit_reentrant = false;
+static DEFINE_MUTEX(exit_flush_lock);
 
 static int __do_stf_barrier_fixups(void *data)
 {
@@ -253,6 +254,9 @@ void do_stf_barrier_fixups(enum stf_barrier_type types)
 	 * low level interrupt exit code before patching. After the patching,
 	 * if allowed, then flip the branch to allow fast exits.
 	 */
+
+	// Prevent static key update races with do_rfi_flush_fixups()
+	mutex_lock(&exit_flush_lock);
 	static_branch_enable(&interrupt_exit_not_reentrant);
 
 	stop_machine(__do_stf_barrier_fixups, &types, NULL);
@@ -264,6 +268,7 @@ void do_stf_barrier_fixups(enum stf_barrier_type types)
 
 	if (stf_exit_reentrant && rfi_exit_reentrant)
 		static_branch_disable(&interrupt_exit_not_reentrant);
+	mutex_unlock(&exit_flush_lock);
 }
 
 void do_uaccess_flush_fixups(enum l1d_flush_type types)
@@ -486,6 +491,9 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 	 * without stop_machine, so this could be achieved with a broadcast
 	 * IPI instead, but this matches the stf sequence.
 	 */
+
+	// Prevent static key update races with do_stf_barrier_fixups()
+	mutex_lock(&exit_flush_lock);
 	static_branch_enable(&interrupt_exit_not_reentrant);
 
 	stop_machine(__do_rfi_flush_fixups, &types, NULL);
@@ -497,6 +505,7 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 
 	if (stf_exit_reentrant && rfi_exit_reentrant)
 		static_branch_disable(&interrupt_exit_not_reentrant);
+	mutex_unlock(&exit_flush_lock);
 }
 
 void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_end)
-- 
2.33.1

