Return-Path: <linuxppc-dev+bounces-6080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568BA30A85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 12:43:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysfhs5fpZz2ywS;
	Tue, 11 Feb 2025 22:43:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739274205;
	cv=none; b=mr6gTkt3+5KgMj41N9vvcBB1C1D9PB4fIpPKEqQz9r+3WB9tg0S4QhU1Zbwoxd9o5nDYLcig4UpsaWJy7Nb7VgtITc8OKTl0hm2s5PEwtSypXSd2sB/cXIsk8SlXMJ2qu1kRZ+Mu2ijBv32oQkMxXbCrh97m03UgxByulAkUfN3pGiOACvkpy+IF2/d3v08tQnENveYrqpb4lD4SH6JmIklq6BmPZYlJwFBrwddo8zXqtTKhvLpV2x8LQr1CbIYT8y3WIX9+0zjZKsJU6TmOMvAU/tEUYdbzfz/M9FL3nZgNg7UPCEJqV6799GmyZj/C4n2CCWscFYWuW5Ej7o1y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739274205; c=relaxed/relaxed;
	bh=rHNURhn0mpawmlKFss/LFmN9CIc/XkvzH8XNq0b3ess=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCNK2ynBy9YaXmx2cD7HrxGFFC9zrRxrL6y9vUrBDjriUKvw8/9kO0WMcBHxHls4hblUFhV6KOL1RHGvcgpsS0UX3nWTlJsUXKlJs4k0BrdUkpNeN7cm79vaOul74UUblhqcX556m3atniCR99eeTp2IDZauPtJof6CEcLs8EQTc5kTIqKXg8yhJXSqULzh4KbEAWm3CAQnaWvP40Xa9JNdRoYf4ObUNO2C3a+dn+1jebhhkrGx3z4O0l5nlZ7oYa/DrYEdwjsoA/r8iBL8MvmmphvEakjQ42o/N8rfbMZEPvHuOszS7H4utfI8aHPzMf7zoWN7VIop7ZEbg9LTojg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=J07MyjBm; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org) smtp.mailfrom=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=J07MyjBm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ysfhr0xPdz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 22:43:24 +1100 (AEDT)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1B012B3;
	Tue, 11 Feb 2025 12:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739274119;
	bh=12MzYizbbPSbp4udes42xYP8cXF305cfWeIimY26ew4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J07MyjBmzRaoN4BB2HKRXu7o23wKFsqKr9k+Bdn1fG9n3ii9IddAKwQEL3fXlM5cl
	 ZT0nKcyROe7aaz53SQaneoY8e04z+JE2jzEZIsTlpxaq2ABkmUYb8WELnQ99WQRhk/
	 aPtzy/pVz3wxa2fo2yrYMlqFfKtp/b6c1mxRUrKk=
Date: Tue, 11 Feb 2025 13:43:07 +0200
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
Message-ID: <20250211114307.GB5888@pendragon.ideasonboard.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <c48952c7-716c-4302-949c-2c66ea102a3e@huawei.com>
 <20250210100307.GA2966@pendragon.ideasonboard.com>
 <664185f4-b87a-4635-9ee9-2f0e7494195a@huawei.com>
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
In-Reply-To: <664185f4-b87a-4635-9ee9-2f0e7494195a@huawei.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 11, 2025 at 07:26:18PM +0800, zhangzekun (A) wrote:
> 在 2025/2/10 18:03, Laurent Pinchart 写道:
> > On Mon, Feb 10, 2025 at 02:47:28PM +0800, zhangzekun (A) wrote:
> >>> I think we all agree that of_find_node_by_name() is miused, and that it
> >>> shows the API isn't optimal. What we have different opinions on is how
> >>> to make the API less error-prone. I think adding a new
> >>> of_find_node_by_name_balanced() function works around the issue and
> >>> doesn't improve the situation much, I would argue it makes things even
> >>> more confusing.
> >>>
> >>> We have only 20 calls to of_find_node_by_name() with a non-NULL first
> >>> argument in v6.14-rc1:
> >>>
> >>> arch/powerpc/platforms/chrp/pci.c:      rtas = of_find_node_by_name (root, "rtas");
> >>>
> >>> The 'root' variable here is the result of a call to
> >>> 'of_find_node_by_path("/")', so I think we could pass a null pointer
> >>> instead to simplify things.
> >>>
> >>> arch/powerpc/platforms/powermac/pic.c:          slave = of_find_node_by_name(master, "mac-io");
> >>>
> >>> Here I believe of_find_node_by_name() is called to find a *child* node
> >>> of 'master'. of_find_node_by_name() is the wrong function for that.
> >>>
> >>> arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(rootnp, "GAISLER_IRQMP");
> >>> arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(rootnp, "01_00d");
> >>> arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(nnp, "GAISLER_GPTIMER");
> >>> arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(nnp, "01_011");
> >>>
> >>> Here too the code seems to be looking for child nodes only (but I
> >>> couldn't find a DT example or binding in-tree, so I'm not entirely
> >>> sure).
> >>>
> >>> drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);
> >>>
> >>> Usage here seems correct, the reference-count decrement is intended.
> >>>
> >>> drivers/media/i2c/max9286.c:    i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> >>> drivers/media/platform/qcom/venus/core.c:       enp = of_find_node_by_name(dev->of_node, node_name);
> >>> drivers/net/dsa/bcm_sf2.c:      ports = of_find_node_by_name(dn, "ports");
> >>> drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
> >>> drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
> >>> drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports = of_find_node_by_name(sw->np, "ports");
> >>> drivers/net/pse-pd/tps23881.c:  channels_node = of_find_node_by_name(priv->np, "channels");
> >>> drivers/regulator/scmi-regulator.c:     np = of_find_node_by_name(handle->dev->of_node, "regulators");
> >>> drivers/regulator/tps6594-regulator.c:          np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);
> >>>
> >>> Incorrect usage, as far as I understand all those drivers are looking
> >>> for child nodes only.
> >>>
> >>> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest16");
> >>> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest17");
> >>> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest18");
> >>> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest19");
> >>>
> >>> Here too I think only child nodes are meant to be considered.
> >>>
> >>> of_find_node_by_name() is very much misused as most callers want to find
> >>> child nodes, while of_find_node_by_name() will walk the whole DT from a
> >>> given starting point.
> >>>
> >>> I think the right fix here is to
> >>>
> >>> - Replace of_find_node_by_name(root, ...) with
> >>>     of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
> >>>     (if my understanding of the code is correct).
> >>
> >> For arch/powerpc/platforms/chrp/pci.c, noticing that there is a comment
> >> in setup_peg2():
> >>    /* keep the reference to the root node */
> >>
> >> It might can not be convert to of_find_node_by_name(NULL, ...), and the
> >> origin use of of_find_node_by_name() put the ref count which want to be
> >> kept.
> > 
> > But the reference is dropped by of_find_node_by_name(). Unless I'm
> > missing something, dropping the lien
> > 
> > 	struct device_node *root = of_find_node_by_path("/");
> > 
> > and changing
> > 
> > 	rtas = of_find_node_by_name (root, "rtas");
> > 
> > to
> > 
> > 	rtas = of_find_node_by_name (NULL, "rtas");
> > 
> > will not change the behaviour of the code.
> 
> Hi, Laurent,
> 
> I think that the original code try to keep the refcount get by 
> of_find_node_by_path(), but leak it accidently by 
> of_find_node_by_name(). I am not sure that what driver really wants to 
> do and if it has a bug here.

Looking at the git history, I don't think the code needs or tries to
keep a reference to the root node.

-- 
Regards,

Laurent Pinchart

