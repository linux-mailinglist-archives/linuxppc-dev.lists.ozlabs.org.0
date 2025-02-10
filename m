Return-Path: <linuxppc-dev+bounces-6019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65178A2E44F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 07:47:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrwB76Rl4z2ykC;
	Mon, 10 Feb 2025 17:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739170063;
	cv=none; b=BcrU9s2ZhodWamWLu0pk3rrIM1pp8xG8ZFn3VV1faxxVza8c4wF16UwL2HK3i3UdixlJ9CRkznm8fkRXuLvu+9tYa88Px/swgxYxNCr0cAEf45x7zwkuLtFmDEA6ThuHedZEP0/BKCRULGHstTF7cuA8Q2swyJnPyKe06oCdrPdBR3/INeNhNqkMZuqi14PGgodVYr+t3RfojbaQAAJVbxP2Nef63nOyUga2mwAB/CmGg5HyEMGRWdl1bilqT+IGrPVqETICL5oqJJPcfNQXS77LNl7mvAULSFQkrJ7wtgUJefPGqEt3CPvZrBzTtjwlF1BHx5M4p4fGvnvQS4xZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739170063; c=relaxed/relaxed;
	bh=6ufEa8OtSz1qNEEnAUniEjc14puk0l7mCw5NN4vhm/I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=XexG+4vFX109HiXrfLEjDggUYO0PMzllFUi1Z47WQapS6jqFNRuFQqTZsPKTimtqto6rwXg2lia2eP1omsl6WQ/j80Fks+8/HrilM+cV0CNEQa44UhAtsiKG1sNf0Y3L/2z8q6wp5D+xglRzKWiIuSa4iskgWP9NHNrFVz8lW1XU2XRl+YWRQWkbr5JxN0Eh/XhYwivfShBgFFBgHVqmA8ZyRiUwonaWCR7bmpRr1iBommmysFnbkM+VEOhbRZbS8G9XozD5gQLtFb2C5lp6EGBXDrRrfteYu7uVp86yE1rOwqapZJuhl4HEmXDJ/8JB/COpHVG+MP6lrGbS3zXWZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrwB51Ch2z2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 17:47:39 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yrw5c0HCfz1ltZX;
	Mon, 10 Feb 2025 14:43:48 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id EED2618001B;
	Mon, 10 Feb 2025 14:47:30 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Feb 2025 14:47:28 +0800
Message-ID: <c48952c7-716c-4302-949c-2c66ea102a3e@huawei.com>
Date: Mon, 10 Feb 2025 14:47:28 +0800
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
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>, <robh@kernel.org>,
	<saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<kory.maincent@bootlin.com>, <jacopo+renesas@jmondi.org>,
	<kieran.bingham+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
	<arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
In-Reply-To: <20250207153722.GA24886@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.82]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi, Laurent,

> I think we all agree that of_find_node_by_name() is miused, and that it
> shows the API isn't optimal. What we have different opinions on is how
> to make the API less error-prone. I think adding a new
> of_find_node_by_name_balanced() function works around the issue and
> doesn't improve the situation much, I would argue it makes things even
> more confusing.
> 
> We have only 20 calls to of_find_node_by_name() with a non-NULL first
> argument in v6.14-rc1:
> 
> arch/powerpc/platforms/chrp/pci.c:      rtas = of_find_node_by_name (root, "rtas");
> 
> The 'root' variable here is the result of a call to
> 'of_find_node_by_path("/")', so I think we could pass a null pointer
> instead to simplify things.
> 
> arch/powerpc/platforms/powermac/pic.c:          slave = of_find_node_by_name(master, "mac-io");
> 
> Here I believe of_find_node_by_name() is called to find a *child* node
> of 'master'. of_find_node_by_name() is the wrong function for that.
> 
> arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(rootnp, "GAISLER_IRQMP");
> arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(rootnp, "01_00d");
> arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(nnp, "GAISLER_GPTIMER");
> arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(nnp, "01_011");
> 
> Here too the code seems to be looking for child nodes only (but I
> couldn't find a DT example or binding in-tree, so I'm not entirely
> sure).
> 
> drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);
> 
> Usage here seems correct, the reference-count decrement is intended.
> 
> drivers/media/i2c/max9286.c:    i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> drivers/media/platform/qcom/venus/core.c:       enp = of_find_node_by_name(dev->of_node, node_name);
> drivers/net/dsa/bcm_sf2.c:      ports = of_find_node_by_name(dn, "ports");
> drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
> drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
> drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports = of_find_node_by_name(sw->np, "ports");
> drivers/net/pse-pd/tps23881.c:  channels_node = of_find_node_by_name(priv->np, "channels");
> drivers/regulator/scmi-regulator.c:     np = of_find_node_by_name(handle->dev->of_node, "regulators");
> drivers/regulator/tps6594-regulator.c:          np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);
> 
> Incorrect usage, as far as I understand all those drivers are looking
> for child nodes only.
> 
> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest16");
> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest17");
> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest18");
> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest19");
> 
> Here too I think only child nodes are meant to be considered.
> 
> of_find_node_by_name() is very much misused as most callers want to find
> child nodes, while of_find_node_by_name() will walk the whole DT from a
> given starting point.
> 
> I think the right fix here is to
> 
> - Replace of_find_node_by_name(root, ...) with
>    of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
>    (if my understanding of the code is correct).

For arch/powerpc/platforms/chrp/pci.c, noticing that there is a comment 
in setup_peg2():
  /* keep the reference to the root node */

It might can not be convert to of_find_node_by_name(NULL, ...), and the 
origin use of of_find_node_by_name() put the ref count which want to be 
kept.

> 
> - Replace of_find_node_by_name() with of_get_child_by_name() in callers
>    that need to search immediate children only (I expected that to be the
>    majority of the above call sites)
Since there is no enough information about these DT nodes, it would take 
time to prove if it is OK to make such convert.
> 
> - If there are other callers that need to find indirect children,
>    introduce a new of_get_child_by_name_recursive() function.
> 
> At that point, the only remaining caller of of_find_node_by_name()
> (beside its usage in the for_each_node_by_name() macro) will be
> drivers/clk/ti/clk.c, which uses the function correctly.
> 
> I'm tempted to then rename of_find_node_by_name() to
> __of_find_node_by_name() to indicate it's an internal function not meant
> to be called except in special cases. It could all be renamed to
> __of_find_next_node_by_name() to make its behaviour clearer.
>

The actual code logic of of_find_node_by_name() is more suitable to be 
used in a loop.So,rename of_find_node_by_name() to 
__of_find_next_node_by_name() seems to be a good idea.

Best regards,
Zekun



