Return-Path: <linuxppc-dev+bounces-6025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB2DA2E87F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 11:03:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys0X22rrhz2yPG;
	Mon, 10 Feb 2025 21:03:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739181810;
	cv=none; b=djw64MzUP1T7jU5GMtXFPgaefPACy7f+iR46Ejac+qqFufSI7xlKTL8J6m6s7CZTSrKEpkj0IUzFcP1eKeEa1w2nMAXuMVIx1N42PueY01r7cGEzW8Cb2SeAIfYk2pGBaqlO8ssGN3rtJyW9noHjb/6DR9ZM/m6P1MRBqYXECRf/RZXaFyhlnpOc/vvrhvy+gPY/vmDSpuNt68SD0UCJ28NrArcRqVrZGvXUydlH1nBel2tfvNdaE+CjD8uDEXsGlQjZzYQJ2YC9gnZ+13IeRJsuBZ1inIXzrsTyvu2h6ENJ5AxaInj/pjf49ARQLPRuunna45fLs+PZ3y5D20YyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739181810; c=relaxed/relaxed;
	bh=IeE/Pj+Ko1GWi5jSsdwD9RfA6RVngeOOtLPit7QwMkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSAK+nbrrnR9YPgtvhVdLHFKJ1isLjN2cwYgdmPetLi1Uyq4etOwOpBOnr33wnd3yC6SrtVEMnsMsFypGt91tpSBq1CieJAi39UOQIpMF6sMD/MTkmYQAE5yW44/hqMxJca7ShYqeSEjEqmxxr+LFOpEyh+hbWEQVqs8r8U3Wp+Fj84efuNO6r3SLPpfanSB7fg39qm7KLCN5AB75bJ0m3CIAK1yHWL2nrnvqe2WX5E7+R0IkkRBowSYtMYokpatXHoK7jjqCDp7ZvIcv3uo7bKG9fWynmhZMSbuDIajmXTIzUc6haeCDCMXW7Ci5hOnTvRbMoclYSJqLSM53shPOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=e9JIjGIb; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org) smtp.mailfrom=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=e9JIjGIb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys0X13Z3sz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 21:03:29 +1100 (AEDT)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE35322E;
	Mon, 10 Feb 2025 11:02:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739181720;
	bh=DYI8FPWv2nrFA0bms9nZRqfoHZqOqiWHzVO7WBrXD7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9JIjGIbxAbHFBZNoHhzMtWVU3aQ9YxlVTuCOKgJi2aq03Ua4rQA6/NKopcvO1WuG
	 cHjfxeUHiqkeHdDEuwFrBPi5JqWzg2Kq/4BvNV1sd9vHfM8lVjcq46bd0u3vXU42pb
	 vq62ObCJEh+arMeDvr5kTxRVUI5tnOOcDdKA4qGI=
Date: Mon, 10 Feb 2025 12:03:07 +0200
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
Message-ID: <20250210100307.GA2966@pendragon.ideasonboard.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <c48952c7-716c-4302-949c-2c66ea102a3e@huawei.com>
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
In-Reply-To: <c48952c7-716c-4302-949c-2c66ea102a3e@huawei.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Zekun,

On Mon, Feb 10, 2025 at 02:47:28PM +0800, zhangzekun (A) wrote:
> > I think we all agree that of_find_node_by_name() is miused, and that it
> > shows the API isn't optimal. What we have different opinions on is how
> > to make the API less error-prone. I think adding a new
> > of_find_node_by_name_balanced() function works around the issue and
> > doesn't improve the situation much, I would argue it makes things even
> > more confusing.
> > 
> > We have only 20 calls to of_find_node_by_name() with a non-NULL first
> > argument in v6.14-rc1:
> > 
> > arch/powerpc/platforms/chrp/pci.c:      rtas = of_find_node_by_name (root, "rtas");
> > 
> > The 'root' variable here is the result of a call to
> > 'of_find_node_by_path("/")', so I think we could pass a null pointer
> > instead to simplify things.
> > 
> > arch/powerpc/platforms/powermac/pic.c:          slave = of_find_node_by_name(master, "mac-io");
> > 
> > Here I believe of_find_node_by_name() is called to find a *child* node
> > of 'master'. of_find_node_by_name() is the wrong function for that.
> > 
> > arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(rootnp, "GAISLER_IRQMP");
> > arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(rootnp, "01_00d");
> > arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(nnp, "GAISLER_GPTIMER");
> > arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(nnp, "01_011");
> > 
> > Here too the code seems to be looking for child nodes only (but I
> > couldn't find a DT example or binding in-tree, so I'm not entirely
> > sure).
> > 
> > drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);
> > 
> > Usage here seems correct, the reference-count decrement is intended.
> > 
> > drivers/media/i2c/max9286.c:    i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> > drivers/media/platform/qcom/venus/core.c:       enp = of_find_node_by_name(dev->of_node, node_name);
> > drivers/net/dsa/bcm_sf2.c:      ports = of_find_node_by_name(dn, "ports");
> > drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
> > drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
> > drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports = of_find_node_by_name(sw->np, "ports");
> > drivers/net/pse-pd/tps23881.c:  channels_node = of_find_node_by_name(priv->np, "channels");
> > drivers/regulator/scmi-regulator.c:     np = of_find_node_by_name(handle->dev->of_node, "regulators");
> > drivers/regulator/tps6594-regulator.c:          np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);
> > 
> > Incorrect usage, as far as I understand all those drivers are looking
> > for child nodes only.
> > 
> > drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest16");
> > drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest17");
> > drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest18");
> > drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest19");
> > 
> > Here too I think only child nodes are meant to be considered.
> > 
> > of_find_node_by_name() is very much misused as most callers want to find
> > child nodes, while of_find_node_by_name() will walk the whole DT from a
> > given starting point.
> > 
> > I think the right fix here is to
> > 
> > - Replace of_find_node_by_name(root, ...) with
> >    of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
> >    (if my understanding of the code is correct).
> 
> For arch/powerpc/platforms/chrp/pci.c, noticing that there is a comment 
> in setup_peg2():
>   /* keep the reference to the root node */
> 
> It might can not be convert to of_find_node_by_name(NULL, ...), and the 
> origin use of of_find_node_by_name() put the ref count which want to be 
> kept.

But the reference is dropped by of_find_node_by_name(). Unless I'm
missing something, dropping the lien

	struct device_node *root = of_find_node_by_path("/");

and changing

	rtas = of_find_node_by_name (root, "rtas");

to

	rtas = of_find_node_by_name (NULL, "rtas");

will not change the behaviour of the code.

> > 
> > - Replace of_find_node_by_name() with of_get_child_by_name() in callers
> >    that need to search immediate children only (I expected that to be the
> >    majority of the above call sites)
>
> Since there is no enough information about these DT nodes, it would take 
> time to prove if it is OK to make such convert.

It will take a bit of time, yes. I'm afraid time is needed to improve
things :-) In most cases, as DT bindings are available, it shouldn't be
very difficult.

> > 
> > - If there are other callers that need to find indirect children,
> >    introduce a new of_get_child_by_name_recursive() function.
> > 
> > At that point, the only remaining caller of of_find_node_by_name()
> > (beside its usage in the for_each_node_by_name() macro) will be
> > drivers/clk/ti/clk.c, which uses the function correctly.
> > 
> > I'm tempted to then rename of_find_node_by_name() to
> > __of_find_node_by_name() to indicate it's an internal function not meant
> > to be called except in special cases. It could all be renamed to
> > __of_find_next_node_by_name() to make its behaviour clearer.
> >
> 
> The actual code logic of of_find_node_by_name() is more suitable to be 
> used in a loop.So,rename of_find_node_by_name() to 
> __of_find_next_node_by_name() seems to be a good idea.

-- 
Regards,

Laurent Pinchart

