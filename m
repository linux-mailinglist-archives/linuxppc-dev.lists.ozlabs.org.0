Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF56241D2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 17:31:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQxd41yLmzDqNf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 01:31:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.40; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=pP8kfmAs; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQxZK3GvmzDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 01:28:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6r6FMVqJp6UZ1VxM3cVyWlYwl3YX7L8mwRvvksCoU70ICj/5KqXQLmyAtHgV7sUQIPCQcVV7CHw9CDcEQis59ujBQcMnZ4B7XowgzD9McbO87jsWBYGsVllzbLzgHm3vb0vJHDOSViI5lBXMgjNux75/F+VZrjYU9Ro8ccwWhTfv7sro9uBftCsxgU5ftLn2EAPEZqmFGTAwMk39gAb/Lg3tj4n0dUobsyKHg2V0MrcnEh87bllaHxbABnhTfFYXDDWzF+e4MA19ibm046ZbQkngsJ4WAaKyfZRaNrPMi0Z9NQp9d2eXjMOv81p7qpxSpsmLZ5GoWSKmX/JxxsvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxhYKv4jeOLljKMt/NyQmzoSAbqOYB8v8jV1P9KhjKM=;
 b=brbAaEgh2fymiAOTw0hXGi4CZQkx+NtgPJNs1qEW1uZfisrL1gzKci1rbQzJBI3d2eQsnVxRDJ+s16ax7KEJ5Yakfgb3eg15m5Expy3Y50srBM71t2goUb4UzjTzMTuprKlTPnmI0NEVavPmsWKvLsulEduyt7tAoRnmSBBgdSRmI+QUqCBkxV1G2ktiIvEE/MXWK3KqDi0c3cVwiaYc0RU45iFOBmPGj3843IcKLtyy7otApumAL08Y5fGICI4EXtkbtjLrzALhrylTrPFWfDkZjSV7J7qvl9zRmJyzQ3zprAtuOWXh1qRL2o5AgI2SyPZM28y3w7ez0SvucrJTwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxhYKv4jeOLljKMt/NyQmzoSAbqOYB8v8jV1P9KhjKM=;
 b=pP8kfmAsCERsthWrqGqCegKjEg+IOxpbKLUw+EyNuKMyKObmW/ZoywmPGMEMrzPhJmEGF9dXjQHTJlJHm5zQpSXTNv1y4/XW8wTAU68JYXBQZxLscB8gjPLA454Ikm99MZGnI0fBKMSTK+eLYq3RDTFaQzJvmkc8903FhDn5XMI=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com (2603:10a6:803:4d::29)
 by VI1PR0402MB2880.eurprd04.prod.outlook.com (2603:10a6:800:b4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Tue, 11 Aug
 2020 15:28:43 +0000
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com
 ([fe80::8459:4be8:7034:7a81]) by VI1PR04MB4046.eurprd04.prod.outlook.com
 ([fe80::8459:4be8:7034:7a81%6]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 15:28:42 +0000
Subject: Re: [PATCH 19/22] crypto: inside-secure - add check for xts input
 length equal to zero
To: Eric Biggers <ebiggers@kernel.org>
References: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
 <20200807162010.18979-20-andrei.botila@oss.nxp.com>
 <CY4PR0401MB36528610C3ABF802F8CBF35FC3440@CY4PR0401MB3652.namprd04.prod.outlook.com>
 <20200810134500.GA22914@gondor.apana.org.au>
 <fd3e5862-3357-7dfc-6c75-30086ab19f82@nxp.com>
 <20200810170305.GA3352718@gmail.com>
From: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Message-ID: <d4a471e6-34c9-c702-63d6-1f6a3cba0ebe@nxp.com>
Date: Tue, 11 Aug 2020 18:28:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200810170305.GA3352718@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR03CA0076.eurprd03.prod.outlook.com
 (2603:10a6:207:5::34) To VI1PR04MB4046.eurprd04.prod.outlook.com
 (2603:10a6:803:4d::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.129] (84.117.251.185) by
 AM3PR03CA0076.eurprd03.prod.outlook.com (2603:10a6:207:5::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 15:28:41 +0000
X-Originating-IP: [84.117.251.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af4f938c-f813-4516-9e6c-08d83e0b3acc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2880:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB28808EE67F92408E2F7951C598450@VI1PR0402MB2880.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FuvyZBeebrJ6FCaXgz8+oSaKznrDZIZ7V385uK791DQNINE8S88wup27qZf/JWBuVa+Wc5TSTP04+0bqH1V02YkeHiEW+Ny7GbqQuKfmWc9lvvM2XkNjsDvBcnwOXb5fEntynjC7r7n5Ohgm8QpqEFdoT8sQbHqfzxFjK+B4Gp1LDetn5XGQqtKm2qvJ2Y5EUr7OHYYYN3iDbaMUKxBkcjdwIURRupurbruSsfe4526gTKg6p3kkRuTjN5laY3mV07W8tyEG9TfpDV/uPRoKP3WYw15ykmoorat/K7jrTzOJFRT8htp5K4MbDDb9Efj1auYy8lic2qHbOJfQbJ1zBGs6tGl7sfA0pXuEAcByehUFP3EVARi+QO1uZcu28y72
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39850400004)(366004)(346002)(396003)(376002)(136003)(31686004)(31696002)(66946007)(66476007)(6486002)(186003)(4326008)(16526019)(66556008)(83380400001)(956004)(2906002)(52116002)(7416002)(16576012)(478600001)(54906003)(2616005)(8676002)(86362001)(6916009)(36756003)(316002)(26005)(53546011)(5660300002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: x2Y1PUQ1vMyR+hFDAzir5q0FSm8sOXnXlzXL2DN/B5cwEb+GQstF2BGo66rNogjU5zYp8EkRifDEMUdKhJ2BvDlZXndOfrpA4zj70EjhqHevJNxSFn0jEM90uZ1IXrexnlTCrKYdQcS+V7iXjN/5oOPXyGxdgJQIMISEKRh7XPbiN80bUw/PJMLyXKv3hbN2f88dyNW8hFm7RLtezEvhDpYkhYG0ZEN9wRt3inugRP2rc4o389ITnPUiBT2UHOilqel7e51YJynBavd77LVQEKGuLxftH/ZEhJglkCZ38ZQ/Gfg8p6vcl2esgWgm34Anjgmdp6EAfYtEBHh2TJFfAPhtgOe0IYHrFJtKSGp4gPDxj5VouLxXZnF/O0nCJZykNrFNF5zIPz7+qN93v1aqFe0DDB18ziKcqhSZdMeGkiYQ6S8bNQwv8jUGaWG6fuc/isCWDeqXRpAZ8l8ddtm5Wyc2l4/WQR1JXwrHPUHsOn53etNKzc4For3e1t2H2wDtB/IWuwONCN9T81gG5A5Wom7sn/hw0irSn6gowuKlhrOSlVfCqI8/jL0Yyij22WPNmN0pPxmge5DKhKdamRJ6iBYdZWmZBOURSu+hW0EmUiNvRhTx5+7BXLk1eYd0Y47mK+P85JtEmWn90bR5fmJ/Pw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4f938c-f813-4516-9e6c-08d83e0b3acc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 15:28:42.8563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyTnr7iI8nghJGE5tzVp/FlaGPm5Xx0IJgnUEzXcHjysQ1QDYOFC82hlEQ6+PMDYunp3StGnWBfX0h1eK4neGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2880
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
Cc: "Andrei Botila \(OSS\)" <andrei.botila@oss.nxp.com>,
 Andrei Botila <andrei.botila@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, "Van Leeuwen,
 Pascal" <pvanleeuwen@rambus.com>, Antoine Tenart <antoine.tenart@bootlin.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/10/2020 8:03 PM, Eric Biggers wrote:
> On Mon, Aug 10, 2020 at 05:33:39PM +0300, Horia Geantă wrote:
>> On 8/10/2020 4:45 PM, Herbert Xu wrote:
>>> On Mon, Aug 10, 2020 at 10:20:20AM +0000, Van Leeuwen, Pascal wrote:
>>>>
>>>> With all due respect, but this makes no sense.
>>>
>>> I agree.  This is a lot of churn for no gain.
>>>
>> I would say the gain is that all skcipher algorithms would behave the same
>> when input length equals zero - i.e. treat the request as a no-op.
>>
>> We can't say "no input" has any meaning to the other skcipher algorithms,
>> but the convention is to accept this case and just return 0.
>> I don't see why XTS has to be handled differently.
>>
> 
> CTS also rejects empty inputs.
> 
> The rule it follows is just that all input lengths >= blocksize are allowed.
> Input lengths < blocksize aren't allowed.
> 
Indeed, thanks.

What about, for example, CBC?
AFAICT cbc(aes) with input length = 0 is valid.

Same for CTR (with the note that blocksize = 1) and several other algorithms
mentioned in the cover letter.

What's the rule in these cases?

Thanks,
Horia
