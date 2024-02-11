Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA20850C70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 01:02:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=kNtNTle/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TY4QH0qDWz3d2S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 11:02:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=kNtNTle/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 553 seconds by postgrey-1.37 at boromir; Mon, 12 Feb 2024 11:01:28 AEDT
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TY4PN5BGYz2yVL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 11:01:27 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 04368100008;
	Mon, 12 Feb 2024 02:52:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 04368100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707695527;
	bh=IMiP40KbV9wZozYYHWOgNE0Ph2d3x1wnOAFT2nZOhok=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=kNtNTle/RZipPAFjGEP5tKgjDqH7AH1NsdRvCStWpKRXRS8zjTxxQmbh0bUdpxWrH
	 Lnv5mH6RZQh5vLKMuB8qTl3VMsmm+xmo5BGW5WIRV3y//9BFe0exM94ahwBzfuW6Hz
	 R33y0nHOlmi+2QmTbfswXzJwSZ+nnCHgrKx0LLUj1gPr+jMU9dh377Ma8zGmB5JFUV
	 PFn2PZuo4cP1IffurE76oZp6vjV1ROH9vUfunCC5NA1svLdW5aV1+ZquGT/8mMSlo8
	 KhRZMRSt15qSMqzfM0atHzHi3B3BcTXoBJLFKxxG50/yZvL8hY8oKwSW9suacJ14sn
	 zfHwGvwPzL7Aw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 12 Feb 2024 02:52:06 +0300 (MSK)
Received: from [172.28.160.241] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 02:52:06 +0300
Message-ID: <d844862e-1d1c-4c9a-b7fe-e0ac44f4126e@salutedevices.com>
Date: Mon, 12 Feb 2024 02:52:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][SPF error] Re: [PATCH v4 00/10]
 devm_led_classdev_register() usage problem
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231221151111.GJ10102@google.com> <ZcZcpUHygltD2ETa@smile.fi.intel.com>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <ZcZcpUHygltD2ETa@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183351 [Feb 11 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_urls_end_caps}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/11 23:16:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/11 23:16:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/11 20:38:00 #23539253
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
Cc: Lee Jones <lee@kernel.org>, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, hdegoede@redhat.com, mingo@redhat.com, npiggin@gmail.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Andy.


I haven't lose hope for the devm_mutex thing and keep pinging those guys 
from time to time.

Sure I can single out the fix-only patch I'll do it tomorrow.


On 2/9/24 20:11, Andy Shevchenko wrote:
> On Thu, Dec 21, 2023 at 03:11:11PM +0000, Lee Jones wrote:
>> On Thu, 14 Dec 2023, George Stark wrote:
>>
>>> This patch series fixes the problem of devm_led_classdev_register misusing.
>>>
>>> The basic problem is described in [1]. Shortly when devm_led_classdev_register()
>>> is used then led_classdev_unregister() called after driver's remove() callback.
>>> led_classdev_unregister() calls driver's brightness_set callback and that callback
>>> may use resources which were destroyed already in driver's remove().
>>>
>>> After discussion with maintainers [2] [3] we decided:
>>> 1) don't touch led subsytem core code and don't remove led_set_brightness() from it
>>> but fix drivers
>>> 2) don't use devm_led_classdev_unregister
>>>
>>> So the solution is to use devm wrappers for all resources
>>> driver's brightness_set() depends on. And introduce dedicated devm wrapper
>>> for mutex as it's often used resource.
>>>
>>> [1] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/
>>> [2] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/#mc132b9b350fa51931b4fcfe14705d9f06e91421f
>>> [3] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/#mdbf572a85c33f869a553caf986b6228bb65c8383
> 
> ...
> 
>> FYI: I'll conduct my review once the locking side is settled.
> 
> To reduce burden can you apply the first one? It's a fix.
> 

-- 
Best regards
George
