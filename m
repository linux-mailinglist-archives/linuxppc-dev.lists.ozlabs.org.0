Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6F38DEC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 03:08:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpJx91hlXz308d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 11:08:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpJwp1qpZz2yY8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 11:07:51 +1000 (AEST)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FpJsH0VrrzBtrf;
 Mon, 24 May 2021 09:04:51 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 09:07:41 +0800
Received: from [10.174.179.215] (10.174.179.215) by
 dggema769-chm.china.huawei.com (10.1.198.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 09:07:40 +0800
Subject: Re: [PATCH net-next] ethernet: ucc_geth: Use kmemdup() rather than
 kmalloc+memcpy
To: Andrew Lunn <andrew@lunn.ch>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
References: <20210523075616.14792-1-yuehaibing@huawei.com>
 <20210523152937.Horde.5kC0kzvaP3No5BC63LlZ_A7@messagerie.c-s.fr>
 <YKpmKln1Z/UvZgZQ@lunn.ch>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <cb42d735-e540-2ea4-2cd2-fc3e1bccd526@huawei.com>
Date: Mon, 24 May 2021 09:07:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YKpmKln1Z/UvZgZQ@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
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
Cc: rasmus.villemoes@prevas.dk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/5/23 22:26, Andrew Lunn wrote:
> On Sun, May 23, 2021 at 03:29:37PM +0200, Christophe Leroy wrote:
>> YueHaibing <yuehaibing@huawei.com> a écrit :
>>
>>> Issue identified with Coccinelle.
>>>
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>  drivers/net/ethernet/freescale/ucc_geth.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c
>>> b/drivers/net/ethernet/freescale/ucc_geth.c
>>> index e0936510fa34..51206272cc25 100644
>>> --- a/drivers/net/ethernet/freescale/ucc_geth.c
>>> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
>>> @@ -3590,10 +3590,10 @@ static int ucc_geth_probe(struct
>>> platform_device* ofdev)
>>>  	if ((ucc_num < 0) || (ucc_num > 7))
>>>  		return -ENODEV;
>>>
>>> -	ug_info = kmalloc(sizeof(*ug_info), GFP_KERNEL);
>>> +	ug_info = kmemdup(&ugeth_primary_info, sizeof(*ug_info),
>>> +			  GFP_KERNEL);
>>
>> Can you keep that as a single line ? The tolerance is 100 chars per line now.
> 
> Networking prefers 80. If it fits a single 80 char line, please use a single line.
> Otherwise please leave it as it is.

Ok, will send v2.
> 
> 	   Andrew
> .
> 
