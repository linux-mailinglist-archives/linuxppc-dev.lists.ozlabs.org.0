Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BD81218D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 23:34:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=oOOrF0WA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr9K25GPxz3vct
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=oOOrF0WA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr9DF4bS6z3c2F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 09:30:33 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8C868100005;
	Thu, 14 Dec 2023 01:30:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8C868100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702506627;
	bh=akWY6xdhpuNWncEDUyY9dF4wQLO5bpnS4UucSnW6HhU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oOOrF0WA58WdagoYs88nCT+iNXHPoQv0hvy0dh7gzj3D14AJOKhVHs1NSVgBgKNeo
	 Z1HliBdgclFEvYORPCgyPG0QRl+gaaQEdipwlveMrNwKpjQt6OCNzVu9G3JWJridAs
	 NMsbTflC2eR7lbslcRM50QypSsEe0GZCEg6qwoRX/cPm4UTi/3sjxN8nnf5elzsTcj
	 QHTkcl2N4YVmxcpsDMmaHQLhVl1RVEw5E+YhOPDmfunh+3uoKF9QPHaub6nt/KwfQW
	 DjnzOdgZsyIAm6WnsBdy4DvzOB/qhmBzVl3k5CF99hvnabWgnC4VdCkDBK5hbbiaaf
	 q+OLmYG2dQJoQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 01:30:27 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 01:30:26 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>
Subject: [PATCH v3 00/11] devm_led_classdev_register() usage problem
Date: Thu, 14 Dec 2023 01:30:09 +0300
Message-ID: <20231213223020.2713164-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182098 [Dec 13 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_urls_end_caps}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/12/13 21:13:00
X-KSMG-LinksScanning: Clean, bases: 2023/12/13 21:16:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/13 21:35:00 #22672360
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

[4] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#mf500af0eda2a9ffc95594607dbe4cb64f2e3c9a8
[5] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#mc92df4fb4f7d4187fb01cc1144acfa5fb5230dd2
[6] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#m300df89710c43cc2ab598baa16c68dd0a0d7d681
[7] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#m8e5c65e0c6b137c91fa00bb9320ad581164d1d0b
[8] https://lore.kernel.org/lkml/377e4437-7051-4d88-ae68-1460bcd692e1@redhat.com/T/#m5f84a4a2f387d49678783e652b9e658e02c27450

George Stark (11):
  leds: aw2013: unlock mutex before destroying it
  locking: add define if mutex_destroy() is not an empty function
  devm-helpers: introduce devm_mutex_init
  leds: aw2013: use devm API to cleanup module's resources
  leds: aw200xx: use devm API to cleanup module's resources
  leds: lp3952: use devm API to cleanup module's resources
  leds: lm3532: use devm API to cleanup module's resources
  leds: nic78bx: use devm API to cleanup module's resources
  leds: mlxreg: use devm_mutex_init for mutex initializtion
  leds: an30259a: use devm_mutext_init for mutext initialization
  leds: powernv: use LED_RETAIN_AT_SHUTDOWN flag for leds

 drivers/leds/leds-an30259a.c | 15 +++++----------
 drivers/leds/leds-aw200xx.c  | 33 ++++++++++++++++++++++-----------
 drivers/leds/leds-aw2013.c   | 27 +++++++++++++++------------
 drivers/leds/leds-lm3532.c   | 30 ++++++++++++++++++------------
 drivers/leds/leds-lp3952.c   | 21 +++++++++++----------
 drivers/leds/leds-mlxreg.c   | 17 ++++++-----------
 drivers/leds/leds-nic78bx.c  | 25 +++++++++++++------------
 drivers/leds/leds-powernv.c  | 23 ++++++++---------------
 include/linux/devm-helpers.h | 27 +++++++++++++++++++++++++++
 include/linux/mutex.h        |  3 +++
 10 files changed, 128 insertions(+), 93 deletions(-)

-- 
2.25.1

