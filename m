Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 405327D77BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 00:22:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=s4EP/Tnf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SG3MN1Yrqz3dWD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 09:22:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=s4EP/Tnf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFqBL51ZXz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 00:13:45 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 667BE10003F;
	Wed, 25 Oct 2023 16:07:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 667BE10003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1698239264;
	bh=yGub9+Dsp9bk1acBBB0/yAlR8ZzAfw6sZjBF08zOdpU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=s4EP/TnfUb8IXrOlVO//TgpOfTSDBG+Z+BupDUdIDF4DstolYt1F8kT5getb3vo/v
	 Bmy7SwjJb7ThjM6IhKaxIjjDZsqZonF/QV18hXnUWatQvWRYf5mA0Is2cA3hNNcK1U
	 phiXb4HwBMu81Q05o/V3t3ENkXUzgZzw5zaHTbo06EMUPjKpXUaKxQvPmwzUsEgvyM
	 qkcKPnKtKzHGjduuCKmuSVgfvCAkJM04Rb8aOOpc7o5AiM6v7fEt2KrwlsJ+EcEVcm
	 8tSPkAhUdpoFrPGRlsflj/Q3iF2v8leMoMNgKzrnZQSRIfs127bnTYk19IAP4QW8Op
	 PkfyBfHAvf2XQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 25 Oct 2023 16:07:44 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 25 Oct 2023 16:07:43 +0300
From: George Stark <gnstark@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <vadimp@nvidia.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<gnstark@salutedevices.com>
Subject: [PATCH 0/8] devm_led_classdev_register() usage problem
Date: Wed, 25 Oct 2023 16:07:29 +0300
Message-ID: <20231025130737.2015468-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180883 [Oct 25 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/25 11:29:00 #22291710
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Thu, 26 Oct 2023 09:18:28 +1100
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
Cc: kernel@sberdevices.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lots of drivers use devm_led_classdev_register() to register their led objects
and let the kernel free those leds at the driver's remove stage.
It can lead to a problem due to led_classdev_unregister()
implementation calls led_set_brightness() to turn off the led.
led_set_brightness() may call one of the module's brightness_set callbacks.
If that callback uses module's resources allocated without using devm funcs()
then those resources will be already freed at module's remove() callback and
we may have use-after-free situation.

Here is an example:

module_probe()
{
    devm_led_classdev_register(module_brightness_set_cb);
    mutex_init(&mutex);
}

module_brightness_set_cb()
{
    mutex_lock(&mutex);
    do_set_brightness();
    mutex_unlock(&mutex);
}

module_remove()
{
    mutex_destroy(&mutex);
}

at rmmod:
module_remove()
    ->mutex_destroy(&mutex);
devres_release_all()
    ->led_classdev_unregister();
        ->led_set_brightness();
            ->module_brightness_set_cb();
                 ->mutex_lock(&mutex);  /* use-after-free */

I think it's an architectural issue and should be discussed thoroughly.
Some thoughts about fixing it as a start:
1) drivers can use devm_led_classdev_unregister() to explicitly free leds before
dependend resources are freed. devm_led_classdev_register() remains being useful
to simplify probe implementation.
As a proof of concept I examined all drivers from drivers/leds and prepared
patches where it's needed. Sometimes it was not as clean as just calling
devm_led_classdev_unregister() because several drivers do not track
their leds object at all - they can call devm_led_classdev_register() and drop the
returned pointer. In that case I used devres group API.

Drivers outside drivers/leds should be checked too after discussion.

2) remove led_set_brightness from led_classdev_unregister() and force the drivers
to turn leds off at shutdown. May be add check that led's brightness is 0
at led_classdev_unregister() and put a warning to dmesg if it's not.
Actually in many cases it doesn't really need to turn off the leds manually one-by-one
if driver shutdowns whole led controller. For the last case to disable the warning
new flag can be brought in e.g LED_AUTO_OFF_AT_SHUTDOWN (similar to LED_RETAIN_AT_SHUTDOWN).

George Stark (8):
  leds: powernv: explicitly unregister LEDs at module's shutdown
  leds: nic78bx: explicitly unregister LEDs at module's shutdown
  leds: an30259a: explicitly unregister LEDs at module's shutdown
  leds: mlxreg: explicitly unregister LEDs at module's shutdown
  leds: aw200xx: explicitly unregister LEDs at module's shutdown
  leds: aw2013: explicitly unregister LEDs at module's shutdown
  leds: lp3952: explicitly unregister LEDs at module's shutdown
  leds: lm3532: explicitly unregister LEDs at module's shutdown

 drivers/leds/leds-an30259a.c |  4 ++++
 drivers/leds/leds-aw200xx.c  |  4 ++++
 drivers/leds/leds-aw2013.c   |  4 ++++
 drivers/leds/leds-lm3532.c   |  6 ++++++
 drivers/leds/leds-lp3952.c   |  5 +++++
 drivers/leds/leds-mlxreg.c   | 12 +++++++++++-
 drivers/leds/leds-nic78bx.c  |  4 ++++
 drivers/leds/leds-powernv.c  |  7 +++++++
 8 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.38.4

