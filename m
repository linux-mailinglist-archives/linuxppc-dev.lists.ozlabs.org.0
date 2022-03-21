Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6544E1F96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 05:32:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMMCb1KqKz3bWP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 15:32:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=h6F6rsLr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out1-smtp.messagingengine.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=h6F6rsLr; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMMBv18rtz2xm1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 15:31:31 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 726FE5C0126;
 Mon, 21 Mar 2022 00:31:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 21 Mar 2022 00:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
 :message-id:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=q/rwds
 Z9GX/6TRc6IpzD6MxELSkwdXgINKIVSJHbvoo=; b=h6F6rsLrkM49LK8naaPQFf
 jmtqZkVdkqmcyMr4bXXeDugsLCcVGu86AtOlAFLmyEx7mAWegcgTWAJtSoWNQUMz
 airESWElgb83a15nivXWJ0F48Jrb3dxBJUuxwOW1YRgyVwVSbVx7LPFqyhL3g9xz
 bEYSNF1JP1oWjITMieaNiAwyNN1L0I/qt29MomnJ7g1BZ/mgDnIkFVb4KBEACWxK
 mpazMvWTffuAOTVjES7Njh6/bJFhto5t4/1R9+7RwKhfuKwvocBJ6+/xfgz9s0QK
 Kuuku9MEWuk97E7pDAK0Mq3mxIg8VoXrFyZ1sIamiKNTzDzh0a0+s6Qv4SaSPZsw
 ==
X-ME-Sender: <xms:nv83YvA-2FdJGKP34KKJODHGQs3t0rk_jT9_7fGOc8XaRuE-gYcwfQ>
 <xme:nv83YliI1Bx7RVotrYRR_cHtD4trKRiAfiC_IoXJAMHkVno8wj9U4eaK4qcdhvseV
 b7wLZFW0ovz9zSWlCQ>
X-ME-Received: <xmr:nv83Yql1fTFxpGDFJDOlMBnXO25-q1xdZOKgzBYPVKw2gp3Juu5fie4ykOsZEUrwJWOlRwuQVVlRycCQ8yzUqfmFJDgqwkbeWxI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegvddgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgrihhn
 uceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnh
 eptdelteekleekkedvueejheekgfdvtdehhefhteeitefhteefgefhudehveevleelnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrih
 hnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:n_83Yhxb0BSWnHum-DGXUrspG3HgAw_pKDCO1FD7j1qu0lQ6y_ugFg>
 <xmx:n_83YkS3pZBSY7M7oy2aWBHwybLJ16dVJEwSeShc45wRO7YsOe9WfA>
 <xmx:n_83Yka8zOSqkGI9AveVdmN2fRjEIHIPG4wsQb2Sfpb88t-bNFAigg>
 <xmx:n_83YqckGj0qhlbik_f0UQIB4iwgzag2VxvGWibOPdMoZW38JPDW6g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 00:31:24 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <d987663bbed18d7dbf106db6066a759040b4e57a.1647837028.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT is
 disabled
Date: Mon, 21 Mar 2022 15:30:28 +1100
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
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
Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
This is equivalent to the patch I sent a couple of days ago. This one
is slightly longer and adds a new symbol so that Kconfig logic can been
used instead of Makefile logic in case reviewers prefer that.
---
 drivers/macintosh/Kconfig   | 5 +++++
 drivers/macintosh/Makefile  | 3 ++-
 drivers/macintosh/via-pmu.c | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index 5cdc361da37c..b9102f051bbb 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -67,6 +67,11 @@ config ADB_PMU
 	  this device; you should do so if your machine is one of those
 	  mentioned above.
 
+config ADB_PMU_EVENT
+	bool
+	depends on ADB_PMU && INPUT=y
+	default y
+
 config ADB_PMU_LED
 	bool "Support for the Power/iBook front LED"
 	depends on PPC_PMAC && ADB_PMU
diff --git a/drivers/macintosh/Makefile b/drivers/macintosh/Makefile
index 49819b1b6f20..712edcb3e0b0 100644
--- a/drivers/macintosh/Makefile
+++ b/drivers/macintosh/Makefile
@@ -12,7 +12,8 @@ obj-$(CONFIG_MAC_EMUMOUSEBTN)	+= mac_hid.o
 obj-$(CONFIG_INPUT_ADBHID)	+= adbhid.o
 obj-$(CONFIG_ANSLCD)		+= ans-lcd.o
 
-obj-$(CONFIG_ADB_PMU)		+= via-pmu.o via-pmu-event.o
+obj-$(CONFIG_ADB_PMU)		+= via-pmu.o
+obj-$(CONFIG_ADB_PMU_EVENT)	+= via-pmu-event.o
 obj-$(CONFIG_ADB_PMU_LED)	+= via-pmu-led.o
 obj-$(CONFIG_PMAC_BACKLIGHT)	+= via-pmu-backlight.o
 obj-$(CONFIG_ADB_CUDA)		+= via-cuda.o
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index b1859e5340b3..022e2fd4397b 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -1468,12 +1468,14 @@ pmu_handle_data(unsigned char *data, int len)
 		if (pmu_battery_count)
 			query_battery_state();
 		pmu_pass_intr(data, len);
+#ifdef CONFIG_ADB_PMU_EVENT
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

