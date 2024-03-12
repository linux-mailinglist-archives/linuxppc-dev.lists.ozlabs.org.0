Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1754878BBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 01:02:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=tUE0gtzI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttv2j49nGz3cxn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 11:02:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=tUE0gtzI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttv1y6GJPz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 11:01:25 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 3EB32100005;
	Tue, 12 Mar 2024 03:01:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 3EB32100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710201682;
	bh=AYogXDFWk0vVK9Bn0RzjwmQ4yDt/pcDp8R+IGvzlJqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=tUE0gtzIz2fZtZBECrQFgTAN85nrFZTDnwi9I815zB1qvb3aDwut2BQI9nUxuttgo
	 AVShDwMjAPX9IZjm8ZSyLsvokwBkCTtFcZPdERpWggfMt9Ac7CaSq0jgeBQMqrLd63
	 YeBfyQLInCaup4CFe4lTPw8fh9CbOWvkgyZ1KP61nZf4rw4W1u/lYRjCIziWZ2swVw
	 5RhQfxDb7CTXmJn2oWD4IYiQweJKfNcjNZsfIeNd/aizXSSo75m1XFtkH3JX9/CWFv
	 ElQv3ngxWxTLgBgrpvHZ/k1qWFkVHAFi+vo7CMNcdFAlsG3JimLOSRtgWSsMSbq5NY
	 r9cLygfouw8hQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 12 Mar 2024 03:01:22 +0300 (MSK)
Received: from [172.28.160.241] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 03:01:21 +0300
Message-ID: <5ef5fb8d-f1be-4c8e-92fe-f40b68478228@salutedevices.com>
Date: Tue, 12 Mar 2024 03:01:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <CAHp75VfkTxRtMc_SpXoyoVjiWxm=c6_1VjeiRFUo4C7kH4HmUA@mail.gmail.com>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <CAHp75VfkTxRtMc_SpXoyoVjiWxm=c6_1VjeiRFUo4C7kH4HmUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
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
Cc: kabel@kernel.org, linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Andy

On 3/7/24 13:34, Andy Shevchenko wrote:
> On Thu, Mar 7, 2024 at 4:40 AM George Stark <gnstark@salutedevices.com> wrote:
>>
>> Using of devm API leads to a certain order of releasing resources.
>> So all dependent resources which are not devm-wrapped should be deleted
>> with respect to devm-release order. Mutex is one of such objects that
>> often is bound to other resources and has no own devm wrapping.
>> Since mutex_destroy() actually does nothing in non-debug builds
>> frequently calling mutex_destroy() is just ignored which is safe for now
>> but wrong formally and can lead to a problem if mutex_destroy() will be
>> extended so introduce devm_mutex_init()
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
>>   Hello Christophe. Hope you don't mind I put you SoB tag because you helped alot
>>   to make this patch happen.
> 
> You also need to figure out who should be the author of the patch and
> probably add a (missing) Co-developed-by. After all you should also
> follow the correct order of SoBs.
> 

Thanks for the review.
I explained in the other letter as I see it. So I'd leave myself
as author and add appropriate tag with Christophe's name.
BTW what do you mean by correct SoB order?
Is it alphabetical order or order of importance?

-- 
Best regards
George
