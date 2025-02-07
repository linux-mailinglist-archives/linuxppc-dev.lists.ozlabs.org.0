Return-Path: <linuxppc-dev+bounces-5942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CE1A2C17B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 12:29:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqBZF52RCz2ytT;
	Fri,  7 Feb 2025 22:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738927749;
	cv=none; b=BWM2iajhLK2NKUC0kon8awUamVs+RmehsdirX30d3Lk1WbLhVRdMcNhYDqpI513SF1YJtACSD3EYnMnZMTliOOi+7EtJwKgkmqfciFRCWz2IqX0VjHiTweK+xkMrcI26giBCh51wHf2YAUygeK7vHjbLMd3YoT3+HzTrf/zmx9MBJD6a/tKFNbUUhscLH4rmC02lIZcgy5q6+gSpy8WpCeash8YaJw7XJbAQMNyPX7fAayP1zCndX3rUbTofN+BvaXPCcXkl2fSPvCubO2xFVKTgQkl0gxLjroetlSFhG6MP3Gky7DTt/f+kHUaOhHC11PTytwoXjIxkS8YtuEeB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738927749; c=relaxed/relaxed;
	bh=r6HQJhQ6Uzi4wi5d/b1zbmjSS9/ruL1VUDJQxInNr9Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=B4zNLC9w2/JIsAiSeenF3zl6aedJmKzNqnEWwXlJt3idx6LQbF7qg7HEz15GHZACjlUrGaBvAmG1uVszFsn8Y6Nl7lqrJL5b3v91pi5WENfowt8qZz2ul9lKnUXUNxp+e7QMwSGzGELxXVcDHdbLHXCTywuuXEUbql2KqVY148MNAwxg9LHsZ8E2s9Bv0JKLPy54gWyP6i8/U6sKb2HLDdISpG/2tsUW13I/bk7GbXGFzUtkAD59rso2cISNbbLGaDALuNTIJEhIktCAo5Zh3AbAMyTOjuVU5fcVS26bkpDLgmgk6d8RxoZ0+1qhtix/9s1KCw0bRBlhdOs/D6lYgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqBZD0JvHz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 22:29:05 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YqBST5ps2z11Pm5;
	Fri,  7 Feb 2025 19:24:09 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id A6F821400D5;
	Fri,  7 Feb 2025 19:28:30 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Feb 2025 19:28:28 +0800
Message-ID: <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
Date: Fri, 7 Feb 2025 19:28:23 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
To: Oleksij Rempel <o.rempel@pengutronix.de>
CC: <robh@kernel.org>, <saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<kory.maincent@bootlin.com>, <jacopo+renesas@jmondi.org>,
	<kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
	<arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
In-Reply-To: <Z6XDKi_V0BZSdCeL@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.82]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/7 16:24, Oleksij Rempel 写道:
> On Fri, Feb 07, 2025 at 09:31:09AM +0800, Zhang Zekun wrote:
>> There are many drivers use of_find_node_by_name() with a not-NULL
>> device_node pointer, and a number of callers would require a call to
>> of_node_get() before using it. There are also some drivers who forget
>> to call of_node_get() which would cause a ref count leak[1]. So, Add a
>> wraper function for of_find_node_by_name(), drivers may use this function
>> to call of_find_node_by_name() with the refcount already balanced.
>>
>> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/
> 
> Hi Zhang Zekun,
> 
> thank you for working on this issue!
> 
> First of all, let's take a step back and analyze the initial problem.
> Everything following is only my opinion...
> 
> The main issue I see is that the current API - of_find_node_by_name -
> modifies the refcount of its input by calling of_node_put(from) as part
> of its search. Typically, a "find" function is expected to treat its
> input as read-only. That is, when you pass an object into such a
> function, you expect its reference count to remain unchanged unless
> ownership is explicitly transferred. In this case, lowering the refcount
> on the input node is counterintuitive and already lead to unexpected
> behavior and subtle bugs.
> 
> To address this, the workaround introduces a wrapper function,
> of_find_node_by_name_balanced, which first increments the input’s
> refcount (via of_node_get()) before calling the original function. While
> this "balances" the refcount change, the naming remains problematic from
> my perspective. The "_balanced" suffix isn’t part of our common naming
> conventions (traditions? :)). Most drivers expect that a function
> starting with "find" will not alter the reference count of its input.
> The term "balanced" doesn’t clearly convey that the input's refcount is
> being explicitly managed - it instead obscures the underlying behavior,
> leaving many developers confused about what guarantees the API provides.
> 
> In my view, a more natural solution would be to redesign the API so that
> it doesn’t modify the input object’s refcount at all. Instead, it should
> solely increase the refcount of the returned node (if found) for safe
> asynchronous usage. This approach would align with established
> conventions where "find" implies no side effects on inputs or output,
> and a "get" indicates that the output comes with an extra reference. For
> example, a function named of_get_node_by_name would clearly signal that
> only the returned node is subject to a refcount increase while leaving
> the input intact.
> 
> Thus, while the current workaround "balances" the reference count, it
> doesn't address the underlying design flaw. The naming still suggests a
> "find" function that should leave the input untouched, which isn’t the
> case here. A redesign of the API - with both the behavior and naming
> aligned to common expectations - would be a clearer and more robust
> solution.
> 
> Nevertheless, it is only my POV, and the final decision rests with the
> OpenFirmware framework maintainers.
> 
> Best Regards,
> Oleksij

Hi, Oleksij,

Thanks for your review. I think redesign the API would be a fundamental 
way to fix this issue, but it would cause impact for current users who 
knows the exact functionality of of_find_node_by_name(), which need to 
put the "from" before calling it (I can't make the assumption that all 
of drivers calling of_find_node_by_name() with a not-NULL "from" 
pointer, but not calling of_node_get() before is misuse). The basic idea 
for adding a new function is try not to impact current users. For users 
who are confused about the "_balanced" suffix,the comments of 
of_find_node_by_name() explains why this interface exists.

Thanks,
Zekun

