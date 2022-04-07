Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 391374F7C83
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:16:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYy2Q1wVFz2yn1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:15:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UT/vr5Qh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out2-smtp.messagingengine.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UT/vr5Qh; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYy1m23YTz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:15:23 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 58DA15C0231;
 Thu,  7 Apr 2022 06:15:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 07 Apr 2022 06:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
 :message-id:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZjQ0U+
 QYU3GVU9/vZxUDNkx5L3+KNfvJqan0Hjjw7QY=; b=UT/vr5QhXuq2tSG74A46kZ
 8tsYpygO+byeFCoVc1WvhCR09de+foGpc17LdN+kDfHT8kZ1FjkGAQy7HGVTx1SE
 T6BtRYIQuniSQm/e4Ow1YzVC6QAKpfUkPoOPq0sFpJl+5c5C0xRUcDypd/nhc3lA
 xFUf1/aqKXEOOT1DQRmbM3B/63i0TSg3y5yFFjUHacB4dwjZLwtIUcV0GAEBTlJG
 kw+aKjkDBa9kzoWcoXW5gOXL/vxDvxKUHoH7Iw+pQN+OTdhKQjkq/h2DsWfMe6JZ
 oDaFgMtmDp8Nhm+QgmDb+0Oe49AJq5V9KXiAVAjCd64JiD3IuSR6oOh7UG8+kr9A
 ==
X-ME-Sender: <xms:t7lOYslaS6bacDasFfwlAQlTypkrJNlPKX5pVYT42aSRceYbw3QhQw>
 <xme:t7lOYr1Z6MjHfX5z7UqoV8r7cOrKmSPe9FaH6d2aeyeoTkV22b7lEJMKZIkfNQCyZ
 SXdgSnISYjOZF2ItC0>
X-ME-Received: <xmr:t7lOYqpbKuMQUk_JcjgNk9doMN-hvS5GuF_bEjEjvTtTOxA07Q-EH7nYN1pLGaXPa8VyUtjsaWtTAqWqd3aDzwR1H-CRr4kN4Xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgrihhn
 uceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnh
 eptdelteekleekkedvueejheekgfdvtdehhefhteeitefhteefgefhudehveevleelnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrih
 hnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:t7lOYokv__jw68BwjAp_Y3vzwrJ74SiobMWbKMKvsPKI-rnVW8-eJA>
 <xmx:t7lOYq0X7CVZYji4OPXooBdewBXQLO7I_CeK8bKSV0NgQmorxjtjoA>
 <xmx:t7lOYvseLp1AsxRZQNWE4W1PjOeZjSdOSNPXxGWKpj5bXq_MjyK9hA>
 <xmx:uLlOYvxIHy0N4IndHwcD-FYYgp5gBsS1IPjnAY8h8KomgWowS86dQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 06:15:18 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <5edbe76ce68227f71e09af4614cc4c1bd61c7ec8.1649326292.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2] macintosh/via-pmu: Fix build failure when CONFIG_INPUT is
 disabled
Date: Thu, 07 Apr 2022 20:11:32 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
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

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since v1:
 - Adopted IS_ENABLED to avoid an ifdef as suggested by Christophe.
 - Added the ADB_PMU_EVENT symbol as suggested by Geert, though this
   adds a new Kconfig symbol for little gain AFAICS.
---
 drivers/macintosh/Kconfig   | 4 ++++
 drivers/macintosh/Makefile  | 3 ++-
 drivers/macintosh/via-pmu.c | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index 5cdc361da37c..3942db15a2b8 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -67,6 +67,10 @@ config ADB_PMU
 	  this device; you should do so if your machine is one of those
 	  mentioned above.
 
+config ADB_PMU_EVENT
+	def_bool y
+	depends on ADB_PMU && INPUT=y
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
index 399074306a74..495fd35b11de 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -1463,7 +1463,7 @@ pmu_handle_data(unsigned char *data, int len)
 		pmu_pass_intr(data, len);
 		/* len == 6 is probably a bad check. But how do I
 		 * know what PMU versions send what events here? */
-		if (len == 6) {
+		if (IS_ENABLED(CONFIG_ADB_PMU_EVENT) && len == 6) {
 			via_pmu_event(PMU_EVT_POWER, !!(data[1]&8));
 			via_pmu_event(PMU_EVT_LID, data[1]&1);
 		}
-- 
2.32.0

