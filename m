Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2654E39F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 08:56:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KN3j16qNjz30Qy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 18:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=JqJ4fnMB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j9P7d0l6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm2 header.b=JqJ4fnMB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=j9P7d0l6; 
 dkim-atps=neutral
X-Greylist: delayed 449 seconds by postgrey-1.36 at boromir;
 Tue, 22 Mar 2022 18:55:55 AEDT
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KN3hC4tQsz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 18:55:55 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A2A143201E4F;
 Tue, 22 Mar 2022 03:48:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 22 Mar 2022 03:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=qVKCtkqUrqThKbK8RBUI89jSwAyuMwwN2TwWyvlz6pM=; b=JqJ4f
 nMBxP7TCPP4zNVmblTSjcqVrH4IOw3N/AhaEsI1J17Iq59yNwLQuvD25Cbz3g0SB
 3jz48GUOMouDxS/tRCjE+aSH/jXD57fOlH3nAiQN96NKU1jsd72YmtKqiiE6fLfb
 ic86iesjhFJ7yl/02BQTin1tyi5LpJzJVV22Rxdt38HRL6/C7oTQ6C/wTmegjZ3L
 sBjEa0aYt0QYnvrLHdM+uzqZA9GPsv+SxCO8is3tvDIym6+eaz97XeJ64Ki3Tz9Q
 7aaWu9ZrVfNt2cYg2T+rcYo6q1ig5k7Jq3yKlgtHJQdu1mYl62N6STtFkc1Bs8id
 rvgi4snmf2V4BO/ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=qVKCtkqUrqThKbK8RBUI89jSwAyuM
 wwN2TwWyvlz6pM=; b=j9P7d0l6MitUbXUgHZc59mvJmi8YkrNkhbfRU2taOb38n
 Bxg3p1XeKkRTOdb+jmxthV442r5ZMs3xnH+4dAvG3R5kR9yFW7vZmBBvT23OtEX6
 S4dVCOj5kWQdCBy4e/uQ9jk2wndG+ZkHbGYaPRjinGksLRSoT3ocgfFKG6r9CZ5J
 wQvch0GRl54N696Ht/wKxX7hUMhYNExBZdB1X5kyGFyd4yNsMBBlSW4mwPcURqdd
 xl4cesSDSM3EpF8wyVI1Bvtvo1hdrHK1T7VmYCAkN1UygV9TH2Z7cG4DrgchSzU0
 p4G9W6/pNZ9ZzIbxDzLVwhT7yMJAAy/OIByOTFFFQ==
X-ME-Sender: <xms:RH85Yly3xOvDg7fbERsL-ChFHWq78EI_ACSFmuaAPTAryribTmh_yw>
 <xme:RH85YlTWRDg4gZRb86unzn4FnsqoiP7v-MyfcRewPjy0ze0rITOT05AtGVmSusHog
 ZVBOJpdHeItJbHNXw>
X-ME-Received: <xmr:RH85YvURrzLHPYkMFM8WQPOCu8hY6izmnuAxb5Ug0JzIprcxTuiQbMUSkRFohOz9jkn8FyDA3YLmZ4NZ74XBjPl-Tl9P7TEf9PfzJ_3rPb9qM0uacffi-F3HxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephf
 fvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeelge
 elfedvffekgeevfeelveeftdeilefgudegkeeuhefhvefgffekuefgffekfeenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrh
 hushhsvghllhdrtggt
X-ME-Proxy: <xmx:RH85YngvbCeO2VZxddasIuX5Ayxp0OsE6ZHDUP2JzG3wUdy7phP6mA>
 <xmx:RH85YnDKmQoHxSYim-KIj1F0pBrIIslZJjuE-PEUwjjk3Nve118EWw>
 <xmx:RH85YgJugu9oO6e5ZUSQ4Hsi8w1bLH1coDbkfn4YR0jwnR5najlimA>
 <xmx:RX85YuPRFezpXqbvtI4k2eZGnkKXW2pQKHYe3WYebaBqehT_YWuONg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 03:48:18 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Get more flushing requirements from
 device-tree
Date: Tue, 22 Mar 2022 17:47:34 +1000
Message-Id: <20220322074734.107721-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.35.1
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
Cc: joel@jms.id.au, npiggin@gmail.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The device-tree properties no-need-l1d-flush-msr-pr-1-to-0,
no-need-l1d-flush-kernel-on-user-access and
no-need-store-drain-on-priv-state-switch are the equivalents of
H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY, H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS
and H_CPU_BEHAV_NO_STF_BARRIER from the H_GET_CPU_CHARACTERISTICS
hcall on pseries, respectively.

Since commit 84ed26fd00c5 ("powerpc/security: Add a security feature for
STF barrier") powernv systems with this device-tree property have been
enabling the STF barrier when they have no need for it.  This patch
fixes this by clearing the STF barrier feature on those systems.

In commit d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version
check for entry and uaccess flushes") the condition for disabling the
L1D flush on kernel entry and user access was changed from any non-P9
CPU to only checking P7 and P8.  Without the appropriate device-tree
checks for newer processors on powernv, these flushes are unnecessarily
enabled on those systems.  This patch fixes that too.

Reported-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/platforms/powernv/setup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 105d889abd51..824c3ad7a0fa 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -96,6 +96,15 @@ static void __init init_fw_feat_flags(struct device_node *np)
 
 	if (fw_feature_is("disabled", "needs-spec-barrier-for-bound-checks", np))
 		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
+
+	if (fw_feature_is("enabled", "no-need-l1d-flush-msr-pr-1-to-0", np))
+		security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
+
+	if (fw_feature_is("enabled", "no-need-l1d-flush-kernel-on-user-access", np))
+		security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
+
+	if (fw_feature_is("enabled", "no-need-store-drain-on-priv-state-switch", np))
+		security_ftr_clear(SEC_FTR_STF_BARRIER);
 }
 
 static void __init pnv_setup_security_mitigations(void)
-- 
2.35.1

