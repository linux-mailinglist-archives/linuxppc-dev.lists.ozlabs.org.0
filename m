Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086A53A87F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 16:09:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCrcy00Xjz3gGn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:09:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QlZ78CLC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QlZ78CLC;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCrNK6dbsz3fB1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 23:58:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E4AE61631;
	Wed,  1 Jun 2022 13:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B00C385B8;
	Wed,  1 Jun 2022 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654091935;
	bh=JBjv+jQepLBvTIwwa1vHNKEFcQiAbDMaYsOBLB880d4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlZ78CLCHjmjlLjPoohsx1Zh/gfVyqD992TCJiFn7RKkfu6JBJLPcmGscm0JBzUj1
	 HErKeeXmqsWiSmOjwAKviWX41CqndjbsX3Yo30hQoZmH22TwjbKycgnI4jPUA/aGOR
	 +sHuTg+pa0FldACE2JrLutr1jhquEltxJbkfoMo5d3sNt8e+s9oEw+1FING8RxTj71
	 m1GJtiItrT6Ddidq1zzLFizgKXpxUFm7tS6LhFe3TyXFpGCSYIo+sOJxS1OGW1EvR4
	 eIMzwwNZm6pUJWpYHKzcEoq18or7KlxY05XH6CKPtLAtUI3KbbP/F6HU4ylb2JnosY
	 JprF9dcdovI9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 23/26] macintosh/via-pmu: Fix build failure when CONFIG_INPUT is disabled
Date: Wed,  1 Jun 2022 09:57:56 -0400
Message-Id: <20220601135759.2004435-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135759.2004435-1-sashal@kernel.org>
References: <20220601135759.2004435-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <lkp@intel.com>, Finn Thain <fthain@linux-m68k.org>, masahiroy@kernel.org, Randy Dunlap <rdunlap@infradead.org>, adobriyan@gmail.com, arnd@arndb.de, linuxppc-dev@lists.ozlabs.org, ardb@kernel.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Finn Thain <fthain@linux-m68k.org>

[ Upstream commit 86ce436e30d86327c9f5260f718104ae7b21f506 ]

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
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/5edbe76ce68227f71e09af4614cc4c1bd61c7ec8.1649326292.git.fthain@linux-m68k.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
index 73e6ae88fafd..aae6328b2429 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -1460,7 +1460,7 @@ pmu_handle_data(unsigned char *data, int len)
 		pmu_pass_intr(data, len);
 		/* len == 6 is probably a bad check. But how do I
 		 * know what PMU versions send what events here? */
-		if (len == 6) {
+		if (IS_ENABLED(CONFIG_ADB_PMU_EVENT) && len == 6) {
 			via_pmu_event(PMU_EVT_POWER, !!(data[1]&8));
 			via_pmu_event(PMU_EVT_LID, data[1]&1);
 		}
-- 
2.35.1

