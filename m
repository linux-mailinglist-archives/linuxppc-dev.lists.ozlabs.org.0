Return-Path: <linuxppc-dev+bounces-5935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B65A2BEC3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 10:07:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yq7RB49g2z2ynj;
	Fri,  7 Feb 2025 20:07:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738919270;
	cv=none; b=GvV18ZPkmiExL4tLqk66TmgvP6ytAzf6FXYnDdRxoQcZG5ECnQ93x9gmG77sagoF1utf5D/tHEggIfxWpED6mwfNPAd6Oh0NsJY+flysIR/Xim2jNueTEqcgndbFSLIml97mOi+J8u8RzfK8SqjB0i5zTT+X7idHpumWWRnd1NvoZYFM6G0U/NCBJ+JRTbNCRvjL/xeET9OIkcgneM6sBbybgPMRXcmiFoOdIELaBMupV7OJbRHhS5FbvlqnfRoEUJeUGIjeFsIs5+2D5U6v+iaXLQAfjubKExYKGnCwGl0TLaI6q/MMXiH/DecLwcK622cyoj0Uv/yk3OTDQd5HJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738919270; c=relaxed/relaxed;
	bh=hzSDUsupP4uTOqsDXYCZMaqhhe2KKjplaV/6jk/uQG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFbQDqyHrh5DGQqRt2t+gocSBuu8iM6jmTHHpUAVfedByMX2Ix/t7eWYIH/HVOJNwHiupxPfo0khM/Ixdsk2iNQFgMmzS/ZGKhqyp7xrDTx8CTjpbdlQUSxdLXnSlWoK40Se5r2rTSicZ8N5L+CigpIu3TIN8jE26Q6m6FEZV6M03EawcMSh+mToMH8+mnaBbUKqhx/j5wkgmiOQWcjLt1sWD399WJ7sjtkjGq08AuTmf+eVBaiSebkllIK8ckiWdBg6go9rDtIqC1B06ozTD9PavCNuefltfq7zEyixrJ8PUWU8GsM5Demtm3MIinSGztKZo+86bgv/fc+sNujUGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=RRGFwKpI; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org) smtp.mailfrom=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=RRGFwKpI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 603 seconds by postgrey-1.37 at boromir; Fri, 07 Feb 2025 20:07:49 AEDT
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yq7R90ncnz2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 20:07:49 +1100 (AEDT)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4D49520;
	Fri,  7 Feb 2025 09:56:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738918583;
	bh=+NyYaGlH/oxOkgdXONu9qIcLVQUJc5wclZd/vJNT5yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRGFwKpIrzR0Q9jTkGFBT30qEgym7M/AQ9c2FHp2wHk9HxiuqfudrqPPujD3Q5uyo
	 qO80NHWAG6pJjsJXDReutvrpGHKNHa2sBSVImL0s/FXhPojeliRKTZcOwpgqRh4J9r
	 Q7awltRFXbTRHS1cRUc+bSQ25T1/vJucUWCB7Oy4=
Date: Fri, 7 Feb 2025 10:57:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Zhang Zekun <zhangzekun11@huawei.com>, robh@kernel.org,
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
Message-ID: <20250207085730.GD24886@pendragon.ideasonboard.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
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
In-Reply-To: <Z6XDKi_V0BZSdCeL@pengutronix.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Oleksij,

On Fri, Feb 07, 2025 at 09:24:10AM +0100, Oleksij Rempel wrote:
> On Fri, Feb 07, 2025 at 09:31:09AM +0800, Zhang Zekun wrote:
> > There are many drivers use of_find_node_by_name() with a not-NULL
> > device_node pointer, and a number of callers would require a call to
> > of_node_get() before using it. There are also some drivers who forget
> > to call of_node_get() which would cause a ref count leak[1]. So, Add a
> > wraper function for of_find_node_by_name(), drivers may use this function
> > to call of_find_node_by_name() with the refcount already balanced.
> > 
> > [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/
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

I agree overall that the naming is not optimal. Looking at the other
patches in the series, I think at least some of them misuse
of_find_node_by_name(). For instance, drivers/media/i2c/max9286.c calls
the function to find a *child* node of the device's of_node named
"i2c-mux", while of_find_node_by_name() looks at children first but will
then walk the *whole* DT to find a named node. I haven't checked all
patches, but other ones seem to suffer from the same misuse.

Assuming that the named node those drivers are looking for is a direct
child of the node passed as argument to of_find_node_by_name(), the
right fix would tbe to use of_get_child_by_name(). If it's not a direct
child, a recursive version of of_get_child_by_name() could be useful.

-- 
Regards,

Laurent Pinchart

