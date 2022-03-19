Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 260504DE5F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 05:31:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KL7Hg0G9bz3bbh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 15:31:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ihv6lRRb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wout1-smtp.messagingengine.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ihv6lRRb; 
 dkim-atps=neutral
X-Greylist: delayed 458 seconds by postgrey-1.36 at boromir;
 Sat, 19 Mar 2022 15:30:53 AEDT
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KL7H16DYtz30H5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 15:30:52 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B33D33200D53;
 Sat, 19 Mar 2022 00:23:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 19 Mar 2022 00:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
 :message-id:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QrAvON
 OTZWCmMh13WeZL23sVu55xrRfpqIerLSK6XQk=; b=ihv6lRRbOf2WtAhJ2xqH6u
 ZGRcuWNskZAbYkkp+0kwEBrVVFbdtF6ePJsjstBrnQiiJzN0Kq/LwoXa2xw/7Q1Y
 qkEwlVzjY3SoYCWn/6FwhxXc4N4YtiJu2APFcML+6v/MdPmjpO86lulvqE8szxXs
 fcxejzpGRbJ7MRyrt1tNJMkmv+JFVO9EWeTXh743tdutSKy/2d/26ZiL3hmb9B4K
 LoRw3y7YUuo9tyOfnr+Xru1dGYu7RYA3jZzIw1prrZT6XWGBM8i9A3wg9owoahcM
 Fi1gJVc6A5uijKmGS4RZQD8Jz4vHSdKMMwjEKocMowpRJRgOBa1jHl6wIP4m1emQ
 ==
X-ME-Sender: <xms:q1o1Yvf63xOFrmbpUpCq26Udjr041U1w5pPyfgAGx5K0ajv46Xfixw>
 <xme:q1o1YlPhgYdQ6kRJK74vOpLjfnJtD2fZWEPnnIPC-YSUURPgI0v3aPCkRTyxy48cn
 hVAUjg-grQbPXFKSus>
X-ME-Received: <xmr:q1o1YojaoQyDgKlVesDxkUdoyX-jKL0LNcunEZg7tR9GSiBDZ0IdL_BEycRMVcXG7DitqucsPnQO5Rvti0wOxXuRoK_2hArE-4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefjedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgrihhn
 uceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnh
 eptdelteekleekkedvueejheekgfdvtdehhefhteeitefhteefgefhudehveevleelnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrih
 hnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:q1o1Yg-og3VE-hbwSq71tdyzUCSlLj7tEmMXUNeC4ln7d5Lomq0vPw>
 <xmx:q1o1YrvMI37UWAxwIEOJD2oWeT_2Fr2tBvIUqcAFGLMGFjdT_RmE7A>
 <xmx:q1o1YvHJeEb5FUo0PmFiQznjUVxUHJ5TlH8S2Dd6RzK8pO_uHVprJw>
 <xmx:rFo1Yk6Wl_cLD8pvMXnzuxvL0v0qbfFhiJqNqMcRR6_Q1jNSDW9a2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Mar 2022 00:23:06 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <cb1828050f8c9ef801b2bdf79eccd6c52afed26b.1647663509.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT is
 disabled
Date: Sat, 19 Mar 2022 15:18:29 +1100
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/macintosh/via-pmu-event.o: In function `via_pmu_event':
via-pmu-event.c:(.text+0x44): undefined reference to `input_event'
via-pmu-event.c:(.text+0x68): undefined reference to `input_event'
via-pmu-event.c:(.text+0x94): undefined reference to `input_event'
via-pmu-event.c:(.text+0xb8): undefined reference to `input_event'
drivers/macintosh/via-pmu-event.o: In function `via_pmu_event_init':
via-pmu-event.c:(.init.text+0x20): undefined reference to `input_allocate_device'
via-pmu-event.c:(.init.text+0xc4): undefined reference to `input_register_device'
via-pmu-event.c:(.init.text+0xd4): undefined reference to `input_free_device'
make[1]: *** [Makefile:1155: vmlinux] Error 1
make: *** [Makefile:350: __build_one_by_one] Error 2

Don't call into the input subsystem unless CONFIG_INPUT is built-in.

Reported-by: kernel test robot <lkp@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 drivers/macintosh/Makefile  | 5 ++++-
 drivers/macintosh/via-pmu.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/Makefile b/drivers/macintosh/Makefile
index 49819b1b6f20..eaf28b1c272f 100644
--- a/drivers/macintosh/Makefile
+++ b/drivers/macintosh/Makefile
@@ -12,7 +12,10 @@ obj-$(CONFIG_MAC_EMUMOUSEBTN)	+= mac_hid.o
 obj-$(CONFIG_INPUT_ADBHID)	+= adbhid.o
 obj-$(CONFIG_ANSLCD)		+= ans-lcd.o
 
-obj-$(CONFIG_ADB_PMU)		+= via-pmu.o via-pmu-event.o
+obj-$(CONFIG_ADB_PMU)		+= via-pmu.o
+ifeq ($(CONFIG_INPUT), y)
+obj-$(CONFIG_ADB_PMU)		+= via-pmu-event.o
+endif
 obj-$(CONFIG_ADB_PMU_LED)	+= via-pmu-led.o
 obj-$(CONFIG_PMAC_BACKLIGHT)	+= via-pmu-backlight.o
 obj-$(CONFIG_ADB_CUDA)		+= via-cuda.o
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 4b98bc26a94b..55afa6dfa263 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -1457,12 +1457,14 @@ pmu_handle_data(unsigned char *data, int len)
 		if (pmu_battery_count)
 			query_battery_state();
 		pmu_pass_intr(data, len);
+#ifdef CONFIG_INPUT
 		/* len == 6 is probably a bad check. But how do I
 		 * know what PMU versions send what events here? */
 		if (len == 6) {
 			via_pmu_event(PMU_EVT_POWER, !!(data[1]&8));
 			via_pmu_event(PMU_EVT_LID, data[1]&1);
 		}
+#endif
 		break;
 
 	default:
-- 
2.32.0

