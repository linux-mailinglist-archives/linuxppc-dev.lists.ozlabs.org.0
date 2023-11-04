Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAC17E0E31
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 08:18:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=X+EJuDdV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SMprF500pz3clc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 18:18:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=X+EJuDdV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMpqM6XFxz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Nov 2023 18:18:02 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 865AE100007;
	Sat,  4 Nov 2023 10:17:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 865AE100007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1699082275;
	bh=s8uqfl8o3FZrVyh0mvXJUoUOdcz1xIKqtqL+86amnUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=X+EJuDdVuaj/VCrb7v34vATJL7RAnLnG/Q0ViA2g07CMEb0bupDIZ0qns4Lm/rOUM
	 jV2eQ1/DJJNLwhS/+bPGSrgRCu3g7dzxkonh5Pj9NsziBW44oP+GWVDjp1q77IdJ9u
	 V4ZhxfFhwWHiu7dg8sWh87DP0gumG7J4LN+Fkl4I4jbaY76Y1oxaBtNVqq/1F0XiRR
	 oNtShqPS5VJReEPP9/bkt7EkUdyCPLeFTT2oBjGGRfyxbj0VBODutuJY8f7y2FXNm7
	 NTsBmFqm1r1PnWNum5YANIjVZCUErckbeKmGLNiCxAmu/LzhOjCkRfRjEN5nqjWji1
	 T0adKEWsd+eDQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat,  4 Nov 2023 10:17:54 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Sat, 4 Nov 2023 10:17:54 +0300
Message-ID: <8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com>
Date: Sat, 4 Nov 2023 10:18:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] devm_led_classdev_register() usage problem
Content-Language: en-US
To: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20231025130737.2015468-1-gnstark@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181122 [Nov 03 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/04 06:10:00 #22399920
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
Cc: vadimp@nvidia.com, lee@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, pavel@ucw.cz, kernel@sberdevices.ru, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Andy

Could you please take a look at this patch series?

I've just found your post on habr about devres API misusing and I think 
this is just another case.

On 10/25/23 16:07, George Stark wrote:
> Lots of drivers use devm_led_classdev_register() to register their led objects
> and let the kernel free those leds at the driver's remove stage.
> It can lead to a problem due to led_classdev_unregister()
> implementation calls led_set_brightness() to turn off the led.
> led_set_brightness() may call one of the module's brightness_set callbacks.
> If that callback uses module's resources allocated without using devm funcs()
> then those resources will be already freed at module's remove() callback and
> we may have use-after-free situation.
> 
> Here is an example:
> 
> module_probe()
> {
>      devm_led_classdev_register(module_brightness_set_cb);
>      mutex_init(&mutex);
> }
> 
> module_brightness_set_cb()
> {
>      mutex_lock(&mutex);
>      do_set_brightness();
>      mutex_unlock(&mutex);
> }
> 
> module_remove()
> {
>      mutex_destroy(&mutex);
> }
> 
> at rmmod:
> module_remove()
>      ->mutex_destroy(&mutex);
> devres_release_all()
>      ->led_classdev_unregister();
>          ->led_set_brightness();
>              ->module_brightness_set_cb();
>                   ->mutex_lock(&mutex);  /* use-after-free */
> 
> I think it's an architectural issue and should be discussed thoroughly.
> Some thoughts about fixing it as a start:
> 1) drivers can use devm_led_classdev_unregister() to explicitly free leds before
> dependend resources are freed. devm_led_classdev_register() remains being useful
> to simplify probe implementation.
> As a proof of concept I examined all drivers from drivers/leds and prepared
> patches where it's needed. Sometimes it was not as clean as just calling
> devm_led_classdev_unregister() because several drivers do not track
> their leds object at all - they can call devm_led_classdev_register() and drop the
> returned pointer. In that case I used devres group API.
> 
> Drivers outside drivers/leds should be checked too after discussion.
> 
> 2) remove led_set_brightness from led_classdev_unregister() and force the drivers
> to turn leds off at shutdown. May be add check that led's brightness is 0
> at led_classdev_unregister() and put a warning to dmesg if it's not.
> Actually in many cases it doesn't really need to turn off the leds manually one-by-one
> if driver shutdowns whole led controller. For the last case to disable the warning
> new flag can be brought in e.g LED_AUTO_OFF_AT_SHUTDOWN (similar to LED_RETAIN_AT_SHUTDOWN).
> 
> George Stark (8):
>    leds: powernv: explicitly unregister LEDs at module's shutdown
>    leds: nic78bx: explicitly unregister LEDs at module's shutdown
>    leds: an30259a: explicitly unregister LEDs at module's shutdown
>    leds: mlxreg: explicitly unregister LEDs at module's shutdown
>    leds: aw200xx: explicitly unregister LEDs at module's shutdown
>    leds: aw2013: explicitly unregister LEDs at module's shutdown
>    leds: lp3952: explicitly unregister LEDs at module's shutdown
>    leds: lm3532: explicitly unregister LEDs at module's shutdown
> 
>   drivers/leds/leds-an30259a.c |  4 ++++
>   drivers/leds/leds-aw200xx.c  |  4 ++++
>   drivers/leds/leds-aw2013.c   |  4 ++++
>   drivers/leds/leds-lm3532.c   |  6 ++++++
>   drivers/leds/leds-lp3952.c   |  5 +++++
>   drivers/leds/leds-mlxreg.c   | 12 +++++++++++-
>   drivers/leds/leds-nic78bx.c  |  4 ++++
>   drivers/leds/leds-powernv.c  |  7 +++++++
>   8 files changed, 45 insertions(+), 1 deletion(-)
> 

-- 
Best regards
George
