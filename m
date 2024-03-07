Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4EA874639
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 03:42:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=EJoHJad7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tqtqs4nzWz3vX1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 13:42:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=EJoHJad7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqtpF0NQrz3cDw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 13:40:50 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C62B410000B;
	Thu,  7 Mar 2024 05:40:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C62B410000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709779244;
	bh=UeNmy3U2L3ZKGxtCqmcJ4OPlsyPvCww7Mr3cs0QeK+U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=EJoHJad7g+MuYBUHgDUkUojZ4E4Mb2hJI+XCn0cIQBabbrxWGDD/aEGN70nqJvekj
	 wT08b8S7QbsThcsRqfKb35D8MYtOYnInlazPA0KMdreWes9+aTlpN4QCJlEA7LOwMQ
	 lmXsfbSY90huLjlKa/pVkQRF946MQkyTj8VH0GzF0OxUnyMx0Rd9/e3xr3iZy6y+o5
	 nBinH11FX5I/7f6bfJJJ0fd0ind5xEUU2m1/dpyT9DZEGByeW1gZHgp8Xc9+v54Pdn
	 k+h2aQ349zCHIcixidkmvRRnqYJ2FE3xmC+uU1t9088tVIJBd+0uBAH/l6+PeRD+C4
	 GHlU8SnmgNLHA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  7 Mar 2024 05:40:44 +0300 (MSK)
Received: from localhost.localdomain (100.125.24.169) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Mar 2024 05:40:44 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>, <kabel@kernel.org>
Subject: [PATCH v5 00/10] devm_led_classdev_register() usage problem
Date: Thu, 7 Mar 2024 05:40:24 +0300
Message-ID: <20240307024034.1548605-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.125.24.169]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_urls_end_caps}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.125.24.169
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/29 16:52:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/29 16:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
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
Cc: kernel@salutedevices.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, George Stark <gnstark@salutedevices.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series fixes the problem of devm_led_classdev_register misusing.

The basic problem is described in [1]. Shortly when devm_led_classdev_register()
is used then led_classdev_unregister() called after driver's remove() callback.
led_classdev_unregister() calls driver's brightness_set callback and that callback
may use resources which were destroyed already in driver's remove().

After discussion with maintainers [2] [3] we decided:
1) don't touch led subsytem core code and don't remove led_set_brightness() from it
but fix drivers
2) don't use devm_led_classdev_unregister

So the solution is to use devm wrappers for all resources
driver's brightness_set() depends on. And introduce dedicated devm wrapper
for mutex as it's often used resource.

[1] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/
[2] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/#mc132b9b350fa51931b4fcfe14705d9f06e91421f
[3] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/#mdbf572a85c33f869a553caf986b6228bb65c8383

Changelog:
v1->v2:
	revise patch series completely

v2->v3:
locking: add define if mutex_destroy() is not an empty function
	new patch, discussed here [8]

devm-helpers: introduce devm_mutex_init
	previous version [4]
	- revise code based on mutex_destroy define
	- update commit message
	- update devm_mutex_init()'s description

leds: aw2013: unlock mutex before destroying it
	previous version [5]
	- make this patch first in the series
	- add tags Fixes and RvB by Andy

leds: aw2013: use devm API to cleanup module's resources
	previous version [6]
	- make aw2013_chip_disable_action()'s body oneline
	- don't shadow devm_mutex_init() return code

leds: aw200xx: use devm API to cleanup module's resources
	previous version [7]
	- make aw200xx_*_action()'s bodies oneline
	- don't shadow devm_mutex_init() return code

leds: lm3532: use devm API to cleanup module's resources
leds: nic78bx: use devm API to cleanup module's resources
leds: mlxreg: use devm_mutex_init for mutex initializtion
leds: an30259a: use devm_mutext_init for mutext initialization
leds: powernv: add LED_RETAIN_AT_SHUTDOWN flag for leds
	- those pathes were planned but not sent in the series #2 due to mail server
	problem on my side. I revised them according to the comments.

v3->v4:
locking: introduce devm_mutex_init
	new patch
	- move devm_mutex_init implementation completely from devm-helpers.h to mutex.h

locking: add define if mutex_destroy() is not an empty function
	drop the patch [9]

devm-helpers: introduce devm_mutex_init
	drop the patch [10]

leds: aw2013: use devm API to cleanup module's resources
	- add tag Tested-by: Nikita Travkin <nikita@trvn.ru>

v4->v5:
leds: aw2013: unlock mutex before destroying it
	merged separately and removed from the series

locking/mutex: move mutex_destroy() definition lower
	introduce optional refactoring patch

locking/mutex: introduce devm_mutex_init
	leave only one devm_mutex_init definition
	add tag Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

leds* patches
	remove #include <linux/devm-helpers.h> due to devm_mutext_init in mutex.h now

[4] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#mf500af0eda2a9ffc95594607dbe4cb64f2e3c9a8
[5] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#mc92df4fb4f7d4187fb01cc1144acfa5fb5230dd2
[6] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#m300df89710c43cc2ab598baa16c68dd0a0d7d681
[7] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#m8e5c65e0c6b137c91fa00bb9320ad581164d1d0b
[8] https://lore.kernel.org/lkml/377e4437-7051-4d88-ae68-1460bcd692e1@redhat.com/T/#m5f84a4a2f387d49678783e652b9e658e02c27450
[9] https://lore.kernel.org/lkml/20231213223020.2713164-1-gnstark@salutedevices.com/T/#m19ad1fc04c560012c1e27418e3156d0c9306dd84
[10] https://lore.kernel.org/lkml/20231213223020.2713164-1-gnstark@salutedevices.com/T/#m63126025f5d1bdcef69bcad50f2e58274d42e2d

George Stark (10):
  locking/mutex: move mutex_destroy() definition lower
  locking/mutex: introduce devm_mutex_init
  leds: aw2013: use devm API to cleanup module's resources
  leds: aw200xx: use devm API to cleanup module's resources
  leds: lp3952: use devm API to cleanup module's resources
  leds: lm3532: use devm API to cleanup module's resources
  leds: nic78bx: use devm API to cleanup module's resources
  leds: mlxreg: use devm_mutex_init for mutex initializtion
  leds: an30259a: use devm_mutext_init for mutext initialization
  leds: powernv: use LED_RETAIN_AT_SHUTDOWN flag for leds

 drivers/leds/leds-an30259a.c | 14 ++++----------
 drivers/leds/leds-aw200xx.c  | 32 +++++++++++++++++++++-----------
 drivers/leds/leds-aw2013.c   | 25 +++++++++++++------------
 drivers/leds/leds-lm3532.c   | 29 +++++++++++++++++------------
 drivers/leds/leds-lp3952.c   | 21 +++++++++++----------
 drivers/leds/leds-mlxreg.c   | 14 +++++---------
 drivers/leds/leds-nic78bx.c  | 23 +++++++++++++----------
 drivers/leds/leds-powernv.c  | 23 ++++++++---------------
 include/linux/mutex.h        | 27 +++++++++++++++++++++++----
 kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
 10 files changed, 137 insertions(+), 93 deletions(-)

--
2.25.1

