Return-Path: <linuxppc-dev+bounces-5944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB72A2C75A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 16:37:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqJ4x3QHbz2yVt;
	Sat,  8 Feb 2025 02:37:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738942657;
	cv=none; b=hdpvfOusTgtS1mbFYfuFLUbH5L23TeOzUfW4yOwpWlPIAF9K7FmAn2ZDCcVTRYDew23KqqrYaxqKy2jmCjPlyvG7f6iJyUlIknUnJLKxhP3X9r5C6qoQ4od7VqMVdlul48fgP1Xie/lrPsMbJfwAVtND/jJTMvqdZuFL3g22mFLj6icVcAY9ETUNVxNkkhlrJ0spa3sD4/aZ6oBhYhgaT0S6HfzzeoI8FIvpsTYksyNTMdZn2ZN+Hafm+sZrpbVy3Wg+vYjjyQfjuelsWUByMjH1svuHmRRz99xltnJ2QU26S/uyOHHynVH+2ivBOCtJlUQyx8b1XEYxfBb3ogAzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738942657; c=relaxed/relaxed;
	bh=Y7Qj+N9J3hm51lflMyu1J5IL9Zh4JPEAtnDtI3bZaAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mM3a+PuVCspvdO86Om9tFemaVCkRDtrlAzcn1dVA4BPuMfSQi1kpjyfCvuEotKz4M60yE+I+9NYKHVyHU22gkHjNLJtSOsH3hN1V3Kff2waEGa5qUsJZR8u7mHJMw8xcipMzVrQ1Po4hF6x4mnW7BZi/ct1R/p6EJy9015vdZ5MSKLvTkio/5eKtcpqnRwdAxUsSNk7GOUwPs0AHOLHHG91rYdvymkc+yUuXWhDqUA+5aW7bjvrG1jzd8Bn6wWjjAsDrQ/PW6zWz9NTl4kZ5rkQGNlMvMDI3SG8uxthMh947jlEjIgFpba/uulKbzb1wutqMy3KN6BcegPRjVOrKgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Bt5U4Jar; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org) smtp.mailfrom=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Bt5U4Jar;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqJ4w22CHz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 02:37:36 +1100 (AEDT)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93016520;
	Fri,  7 Feb 2025 16:36:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738942574;
	bh=WyyQXcsQ8Po4tWbhAYVSE247YXhK6Kned9eNBhzhzPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bt5U4JarIqKJyUwK2lAgVMJLXqYYKXj1Dw5/YsU1N4r3TntKj6kZW9mlo8RTZVoOk
	 HsMtRJIpAm58oDln8u37ZxGV1C5oXj+Dis76hEhzLnKOkatB1yf5Fp+NDBHBHx1SiX
	 jpUl8R3kXNRlrn4KPKKErhcLiG3ojoeQ0dJS89/4=
Date: Fri, 7 Feb 2025 17:37:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "zhangzekun (A)" <zhangzekun11@huawei.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, robh@kernel.org,
	saravanak@google.com, justin.chen@broadcom.com,
	florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
	kuba@kernel.org, kory.maincent@bootlin.com,
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, taras.chornyi@plvision.eu,
	edumazet@google.com, pabeni@redhat.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	chenjun102@huawei.com
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <20250207153722.GA24886@pendragon.ideasonboard.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Zekun,

On Fri, Feb 07, 2025 at 07:28:23PM +0800, zhangzekun (A) wrote:
> 在 2025/2/7 16:24, Oleksij Rempel 写道:
> > On Fri, Feb 07, 2025 at 09:31:09AM +0800, Zhang Zekun wrote:
> >> There are many drivers use of_find_node_by_name() with a not-NULL
> >> device_node pointer, and a number of callers would require a call to
> >> of_node_get() before using it. There are also some drivers who forget
> >> to call of_node_get() which would cause a ref count leak[1]. So, Add a
> >> wraper function for of_find_node_by_name(), drivers may use this function
> >> to call of_find_node_by_name() with the refcount already balanced.
> >>
> >> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/
> > 
> > Hi Zhang Zekun,
> > 
> > thank you for working on this issue!
> > 
> > First of all, let's take a step back and analyze the initial problem.
> > Everything following is only my opinion...
> > 
> > The main issue I see is that the current API - of_find_node_by_name -
> > modifies the refcount of its input by calling of_node_put(from) as part
> > of its search. Typically, a "find" function is expected to treat its
> > input as read-only. That is, when you pass an object into such a
> > function, you expect its reference count to remain unchanged unless
> > ownership is explicitly transferred. In this case, lowering the refcount
> > on the input node is counterintuitive and already lead to unexpected
> > behavior and subtle bugs.
> > 
> > To address this, the workaround introduces a wrapper function,
> > of_find_node_by_name_balanced, which first increments the input’s
> > refcount (via of_node_get()) before calling the original function. While
> > this "balances" the refcount change, the naming remains problematic from
> > my perspective. The "_balanced" suffix isn’t part of our common naming
> > conventions (traditions? :)). Most drivers expect that a function
> > starting with "find" will not alter the reference count of its input.
> > The term "balanced" doesn’t clearly convey that the input's refcount is
> > being explicitly managed - it instead obscures the underlying behavior,
> > leaving many developers confused about what guarantees the API provides.
> > 
> > In my view, a more natural solution would be to redesign the API so that
> > it doesn’t modify the input object’s refcount at all. Instead, it should
> > solely increase the refcount of the returned node (if found) for safe
> > asynchronous usage. This approach would align with established
> > conventions where "find" implies no side effects on inputs or output,
> > and a "get" indicates that the output comes with an extra reference. For
> > example, a function named of_get_node_by_name would clearly signal that
> > only the returned node is subject to a refcount increase while leaving
> > the input intact.
> > 
> > Thus, while the current workaround "balances" the reference count, it
> > doesn't address the underlying design flaw. The naming still suggests a
> > "find" function that should leave the input untouched, which isn’t the
> > case here. A redesign of the API - with both the behavior and naming
> > aligned to common expectations - would be a clearer and more robust
> > solution.
> > 
> > Nevertheless, it is only my POV, and the final decision rests with the
> > OpenFirmware framework maintainers.
> > 
> > Best Regards,
> > Oleksij
> 
> Hi, Oleksij,
> 
> Thanks for your review. I think redesign the API would be a fundamental 
> way to fix this issue, but it would cause impact for current users who 
> knows the exact functionality of of_find_node_by_name(), which need to 
> put the "from" before calling it (I can't make the assumption that all 
> of drivers calling of_find_node_by_name() with a not-NULL "from" 
> pointer, but not calling of_node_get() before is misuse). The basic idea 
> for adding a new function is try not to impact current users. For users 
> who are confused about the "_balanced" suffix,the comments of 
> of_find_node_by_name() explains why this interface exists.

I think we all agree that of_find_node_by_name() is miused, and that it
shows the API isn't optimal. What we have different opinions on is how
to make the API less error-prone. I think adding a new
of_find_node_by_name_balanced() function works around the issue and
doesn't improve the situation much, I would argue it makes things even
more confusing.

We have only 20 calls to of_find_node_by_name() with a non-NULL first
argument in v6.14-rc1:

arch/powerpc/platforms/chrp/pci.c:      rtas = of_find_node_by_name (root, "rtas");

The 'root' variable here is the result of a call to
'of_find_node_by_path("/")', so I think we could pass a null pointer
instead to simplify things.

arch/powerpc/platforms/powermac/pic.c:          slave = of_find_node_by_name(master, "mac-io");

Here I believe of_find_node_by_name() is called to find a *child* node
of 'master'. of_find_node_by_name() is the wrong function for that.

arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(rootnp, "GAISLER_IRQMP");
arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(rootnp, "01_00d");
arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(nnp, "GAISLER_GPTIMER");
arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(nnp, "01_011");

Here too the code seems to be looking for child nodes only (but I
couldn't find a DT example or binding in-tree, so I'm not entirely
sure).

drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);

Usage here seems correct, the reference-count decrement is intended.

drivers/media/i2c/max9286.c:    i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
drivers/media/platform/qcom/venus/core.c:       enp = of_find_node_by_name(dev->of_node, node_name);
drivers/net/dsa/bcm_sf2.c:      ports = of_find_node_by_name(dn, "ports");
drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports = of_find_node_by_name(sw->np, "ports");
drivers/net/pse-pd/tps23881.c:  channels_node = of_find_node_by_name(priv->np, "channels");
drivers/regulator/scmi-regulator.c:     np = of_find_node_by_name(handle->dev->of_node, "regulators");
drivers/regulator/tps6594-regulator.c:          np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);

Incorrect usage, as far as I understand all those drivers are looking
for child nodes only.

drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest16");
drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest17");
drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest18");
drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest19");

Here too I think only child nodes are meant to be considered.

of_find_node_by_name() is very much misused as most callers want to find
child nodes, while of_find_node_by_name() will walk the whole DT from a
given starting point.

I think the right fix here is to

- Replace of_find_node_by_name(root, ...) with
  of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
  (if my understanding of the code is correct).

- Replace of_find_node_by_name() with of_get_child_by_name() in callers
  that need to search immediate children only (I expected that to be the
  majority of the above call sites).

- If there are other callers that need to find indirect children,
  introduce a new of_get_child_by_name_recursive() function.

At that point, the only remaining caller of of_find_node_by_name()
(beside its usage in the for_each_node_by_name() macro) will be
drivers/clk/ti/clk.c, which uses the function correctly.

I'm tempted to then rename of_find_node_by_name() to
__of_find_node_by_name() to indicate it's an internal function not meant
to be called except in special cases. It could all be renamed to
__of_find_next_node_by_name() to make its behaviour clearer.

-- 
Regards,

Laurent Pinchart

