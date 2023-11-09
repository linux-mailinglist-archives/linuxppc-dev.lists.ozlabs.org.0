Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 982847E7526
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 00:29:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=LaFmDnyr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRJ7T3xdWz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 10:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=LaFmDnyr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRJ6Z1kkPz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 10:28:19 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4BC0E10004D;
	Fri, 10 Nov 2023 02:28:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4BC0E10004D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1699572493;
	bh=hBV4Kz/pkzP2ImJmSP5L6G2sBvOO6GVXQ7O0hvmEr94=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=LaFmDnyre+AUarFmgL90jZYQZO+Y+FtAOwa6unAgVvyl/QYoCuiZ7wiMBwFWkYtxu
	 x3GnmkPgkz/o/MROXHKU595iUx6rNm2bvW4NInnW3j+/y3pFPWAT1MaQuMWng0nbIt
	 Y0fUlmDXwTBkfjGcEV8kwMcE9Rl/mC2mQqKQgdEz86iWW229/X+Tq6FfauRLU8SVwh
	 8xiuo+jYX3j0hSS3PmSOPxawWwezxUNDwHiHHZPFxrktmjJil0Ln5TvfFJ7sMm6/Qk
	 3wWVrTWImlZR15+9xevXHfOZhhm9uBeIIf7896jZkt5ihfvaRuh2t7GoejsjSRUWb3
	 VzhHdQmvFI20w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 10 Nov 2023 02:28:13 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Fri, 10 Nov 2023 02:28:12 +0300
Message-ID: <d5fab619-046a-484d-9d51-3a7fcc9e0a81@salutedevices.com>
Date: Fri, 10 Nov 2023 02:28:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] leds: nic78bx: explicitly unregister LEDs at module's
 shutdown
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
 <20231025130737.2015468-3-gnstark@salutedevices.com>
 <810346b6-c8a4-8c40-8fe3-242332428313@csgroup.eu>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <810346b6-c8a4-8c40-8fe3-242332428313@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181258 [Nov 09 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/09 21:19:00 #22426256
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
Cc: "vadimp@nvidia.com" <vadimp@nvidia.com>, "lee@kernel.org" <lee@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "kernel@sberdevices.ru" <kernel@sberdevices.ru>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christophe.

Thanks for the review.


On 11/6/23 11:13, Christophe Leroy wrote:
 >
 >
 > Le 25/10/2023 à 15:07, George Stark a écrit :
 >> LEDs are registered using devm_led_classdev_register() and automatically
 >> unregistered after module's remove(). led_classdev_unregister() calls
 >> led_set_brightness() to turn off the LEDs and module's appropriate 
callback
 >> uses resources those were destroyed already in module's remove().
 >> So explicitly unregister LEDs at module shutdown.
 >>
 >> Signed-off-by: George Stark <gnstark@salutedevices.com>
 >> ---
 >>    drivers/leds/leds-nic78bx.c | 4 ++++
 >>    1 file changed, 4 insertions(+)
 >>
 >> diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
 >> index f196f52eec1e..12b70fcad37f 100644
 >> --- a/drivers/leds/leds-nic78bx.c
 >> +++ b/drivers/leds/leds-nic78bx.c
 >> @@ -170,6 +170,10 @@ static int nic78bx_probe(struct platform_device 
*pdev)
 >>    static int nic78bx_remove(struct platform_device *pdev)
 >>    {
 >>    	struct nic78bx_led_data *led_data = platform_get_drvdata(pdev);
 >> +	int i;
 >> +
 >> +	for (i = 0; i < ARRAY_SIZE(nic78bx_leds); i++)
 >> +		devm_led_classdev_unregister(&pdev->dev, &nic78bx_leds[i].cdev);
 >
 > The whole purpose of devm_ functions is that you don't need to call
 > unregister when removing the driver as the dev core will do it for you.
 > I understand your problem but I think this is not the solution.

I agree my solution is questionable although 
devm_led_classdev_unregister() is exists for some reason.

Probably it's not the best solution to remove led_set_brightness() from 
led_classdev_unregister() either.
Or we'll have to patch a lot of drivers which use led subsystem to call 
led_set_brightness() manually to keep leds' previous behavior.

Well if we can't easily unregister leds before module's remove() 
callback is completed may be we can get rid of remove() itself and 
manage all resources using devm API. In that case by the time 
led_set_brightness() is called from led_classdev_unregister() all 
dependent resources will be alive.
I'll try it in the next patch series.

 >
 >>
 >>    	/* Lock LED register */
 >>    	outb(NIC78BX_LOCK_VALUE,
-- 
Best regards
George
