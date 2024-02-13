Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F032E854079
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 00:57:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=uuLW/pe3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZJCr0yjzz3dXh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 10:57:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=uuLW/pe3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZJC22mmPz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 10:56:43 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 74FC3100023;
	Wed, 14 Feb 2024 02:56:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 74FC3100023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707868597;
	bh=MneQ42GgAU5vgtOcPdxnj5Z60/emGjKe574AXsZSEg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=uuLW/pe39MciOvtdWrCCCfvYcjKM1IMJVRlBFGZQ+2S33Z4NFLWjwgbaRD7+MOm5X
	 8tF8dQMspP3kJGdJYhS+JxXPe576os0eALhtFs1wO7RLYA5jhcEbRDBHHzupAjBzy2
	 CDK3UkIuaoTiIjymZyFCjiUTRwPR7gJy/HdzazgFBwdPlpegLkDMDeFfXvDBoHEQ0z
	 VOiWbSAzsvSKC/39eO6bVSt0n5Un4mJqrqTGuRlGLeJ+D4l0rgmt4riPt8YXOv57Zz
	 SIX+Gnqtx9tUlZd1Cg0gLj4U2PwCg+NrCWOqyiBQxYq1xezA40CZ2ImSXjtAi9yOIJ
	 EC/+6L8chOBJA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 14 Feb 2024 02:56:37 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 02:56:36 +0300
Message-ID: <03dde247-44c1-4ba6-b5e8-bc9c68b7a294@salutedevices.com>
Date: Wed, 14 Feb 2024 02:56:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][SPF error] Re: [PATCH v4 00/10]
 devm_led_classdev_register() usage problem
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231221151111.GJ10102@google.com> <ZcZcpUHygltD2ETa@smile.fi.intel.com>
 <d844862e-1d1c-4c9a-b7fe-e0ac44f4126e@salutedevices.com>
 <CAHp75VfQd9e4fLAYkYrMajnJfPQqno6s_aiTarErPiqP-Z6ydg@mail.gmail.com>
 <ae5bf6bc-5f7f-4fe9-a833-c1bfa31ff534@salutedevices.com>
 <CAHp75Vd1FRz9=Q7NRXsbkBu_K0+zRC6uf5nPM1Q+QnJum+74tg@mail.gmail.com>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <CAHp75Vd1FRz9=Q7NRXsbkBu_K0+zRC6uf5nPM1Q+QnJum+74tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183417 [Feb 14 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_urls_end_caps}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/13 23:08:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/13 23:08:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/13 21:49:00 #23589640
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
Cc: kernel@salutedevices.com, vadimp@nvidia.com, mazziesaccount@gmail.com, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, hdegoede@redhat.com, "will@kernel.org" <will@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, npiggin@gmail.com, pavel@ucw.cz, Waiman Long <longman@redhat.com>, nikitos.tr@gmail.com, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Andy

On 2/13/24 13:55, Andy Shevchenko wrote:
> On Tue, Feb 13, 2024 at 2:14 AM George Stark <gnstark@salutedevices.com> wrote:
>>
>> Hello Andy
>>
>> On 2/12/24 12:53, Andy Shevchenko wrote:
>>> On Mon, Feb 12, 2024 at 1:52 AM George Stark <gnstark@salutedevices.com> wrote:
>>>> I haven't lose hope for the devm_mutex thing and keep pinging those guys
>>>> from time to time.
>>>
>>> I don't understand. According to v4 thread Christophe proposed on how
>>> the patch should look like. What you need is to incorporate an updated
>>> version into your series. Am I wrong?
>>
>> We agreed that the effective way of implementing devm_mutex_init() is in
>> mutex.h using forward declaration of struct device.
>> The only inconvenient thing is that in the mutex.h mutex_init() declared
>> after mutex_destroy() so we'll have to use condition #ifdef
>> CONFIG_DEBUG_MUTEXES twice. Waiman Long proposed great cleanup patch [1]
>> that eliminates the need of doubling #ifdef. That patch was reviewed a
>> bit but it's still unapplied (near 2 months). I'm still trying to
>> contact mutex.h guys but there're no any feedback yet.
> 
> So the roadmap (as I see it) is:
> - convince Lee to take the first patch while waiting for the others
> - incorporate the above mentioned patch into your series
> - make an ultimatum in case there is no reaction to get it applied on
> deadline, let's say within next cycle (if Lee is okay with a such, but
> this is normal practice when some maintainers are non-responsive)

Well, it was interesting to know that there is such a practice.

Waiman Long has just updated his patches with mutex.h cleanup [1] so I
think we can wait for that series to be merged than I'll prepare may
patchseries with or w\o the first patch.

[1] 
https://lore.kernel.org/all/20240213031656.1375951-4-longman@redhat.com/T/

> 
> P.S. In case Lee doesn't want to take the first patch separately
> (let's say this week), send a new version with amended patches
> included.

Ok

> 
>> [1]
>> https://lore.kernel.org/lkml/20231216013656.1382213-2-longman@redhat.com/T/#m795b230d662c1debb28463ad721ddba5b384340a
> 
> 

-- 
Best regards
George
