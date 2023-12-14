Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336038130B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 13:59:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=Ek9YRb2a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrXW862TWz3dL3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 23:59:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=Ek9YRb2a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrXVJ35Kjz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 23:59:03 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 800CC100003;
	Thu, 14 Dec 2023 15:58:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 800CC100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702558737;
	bh=qT3NzId9fi7gmTS3Fcf9+Cs1PZA1K9YzCqSJ9uxx38Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Ek9YRb2aOBKfbyNT8dPviIM17sArXdb//XeAW4uWF/jbQerBn0Hrn015WcZkbPLk4
	 Z64taz/9B/4eLYvqH+gX7EoAOJbiASIjrbfZstXDcZCMkAHRBi5G5g3eWuCyfr5SUi
	 EqO0XvfBeOnOVrE9PvxyeSol2ZZEsBRYZTWPlQ63r1sFXTcLe6TWytHZY2boAc7DNu
	 Uf3KaaEyhp05NzMFcbev0aQnYC4HWk5KRTSt13YZ8ctfa42ZvXMRK4+WnygGmSKA6Y
	 76mZixR8TmA3SGQ6q19FnjY7Ot2SBlDbry5jwAQgHnBwRaWx1qW5IfZ2Ao/iXTiR0U
	 uDNX/8cgwNUrA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 15:58:57 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 15:58:57 +0300
Message-ID: <fa048fec-86f2-42b5-ad36-7776c569a349@salutedevices.com>
Date: Thu, 14 Dec 2023 15:58:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] leds: aw2013: use devm API to cleanup module's
 resources
Content-Language: en-US
To: Nikita Travkin <nikita@trvn.ru>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-5-gnstark@salutedevices.com>
 <c709e0f33da06db40127f3a0adcbebbd@trvn.ru>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <c709e0f33da06db40127f3a0adcbebbd@trvn.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182110 [Dec 14 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/14 10:50:00 #22693095
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
Cc: linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nikita

Thanks for the review and testing.

On 12/14/23 08:42, Nikita Travkin wrote:
> George Stark писал(а) 14.12.2023 03:30:
>> In this driver LEDs are registered using devm_led_classdev_register()
>> so they are automatically unregistered after module's remove() is done.
>> led_classdev_unregister() calls module's led_set_brightness() to turn off
>> the LEDs and that callback uses resources which were destroyed already
>> in module's remove() so use devm API instead of remove().
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
> 
> Thanks for noticing and fixing this!
> Perhaps this patch needs a Fixes tag too, like 1/11?

This patch and the rest of the series depend on new feature 
devm_mutex_init and if I add Fixes tag this feature will need to be 
backported too along with fixes. I'm not sure it's desirable.

> 
> Tested-by: Nikita Travkin <nikita@trvn.ru>
> 
> Btw, seems like (5..11)/11 never arrived to the lists...

Yeah there was a delay, but now all patches from series #3 are online.
> 
> Nikita
> 
>> ---
...

-- 
Best regards
George
