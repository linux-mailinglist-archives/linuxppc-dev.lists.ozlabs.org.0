Return-Path: <linuxppc-dev+bounces-7994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3381DA9CF6A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 19:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkfkW55Lsz30FR;
	Sat, 26 Apr 2025 03:20:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745601651;
	cv=none; b=CMChDS7AWzkrw34tFlI2cqRZyHJ5dfd8qaO1Vbw2XpFO4Jctk+4PvlCe2RyxJSLpoQG2B/AnZ0pvL41TOz32/k8vtUEz7sPboRV5wm+2fPbs+CHUg4D8QSXaxm3TNOmlLSWsoBsymCmQVxkGfB1zqcDi8h6/WjZMpMLaM1ZU45B766FcGWYR0Yzl58Llx4BVoWxi4o3lj5SuBYjMA0Y/w26zsreiJBpl3oNejCLmnA4S1AhFwiAWKu3S6XLOJoaSgrvo76wookngpiNR1rLHuVU6ur+WYnET9oKG35kXR9/NMgUJZ22FKUIm7tqN3i8IvKpnbcRU7bcp/RswTLQWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745601651; c=relaxed/relaxed;
	bh=CSCNlyuVe/6sXD5TPGRmpfNEkLgX/CzMjBfJgOiKrLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWaY2RKMPplOwfAWhfrLflStdDekjZvEavuYheOj/JM2Mh+2OIRlHitcwGqT0QrH6RoQ3gsOkQraM5ddh3f06i4sRB/PpH9Fd2Jmw5cj1iVhiSLJUSmpbqnmFDy25iUe3e7L/QyvHQV5JZoSyjV4SaQ7DqUmcwx/w9WFOzQRmEEB9Hj3en+z0ZyGW+pCJQkSlvzmaRP6h29jtLYyPKxvcAgc5LyMaTzLj28zoab1/mLXvXpFnWdfaFwiZ+oxkNbod1dnZZMx2NM7HKTd0iVp2Sqcs9YRKGVxRPq9T/bYRctcMPZ7kdPAuNxwVlHqa0Xa3n+7NLPUODi+g7rPpzVePg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=kCLYVafc; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org) smtp.mailfrom=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=kCLYVafc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 785 seconds by postgrey-1.37 at boromir; Sat, 26 Apr 2025 03:20:50 AEST
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkfkV2XCVz2y06
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 03:20:50 +1000 (AEST)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97499250;
	Fri, 25 Apr 2025 19:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745600854;
	bh=fHOSkVvCS0e3YcFWO5XU4zHBCn1ZyGlikcXhosdxBlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCLYVafcorPJlG/fHXm4USpf3DTn8tEKNyjJotnlxAmdkehyKovEoloLTRfWJi/09
	 aOg3xajkx1N/UwjLceV/Ao3fSd7aRk+VNE8sQk0Umz773BJkgCALLzqZCRBn+qZb8S
	 vBdb+BPkJh0/ODbo6Zp99xfca39KAPD96NEw/V3s=
Date: Fri, 25 Apr 2025 20:07:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "zhangzekun (A)" <zhangzekun11@huawei.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, robh@kernel.org,
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
	chenjun102@huawei.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <20250425170732.GA21390@pendragon.ideasonboard.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
 <aAuqgiSxrh24-L-D@stanley.mountain>
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
In-Reply-To: <aAuqgiSxrh24-L-D@stanley.mountain>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 25, 2025 at 06:30:10PM +0300, Dan Carpenter wrote:
> Whatever happened with this thread from Feb.
> https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/
> 
> The issue was that people weren't expecting of_find_node_by_name() to
> drop the reference on the of_node.  The patchset introduced a wrapper
> which basically worked as expected except no liked the naming.  Krzysztof
> suggested that maybe the callers should be using of_get_child_by_name()
> instead.

My conclusion is that most of the users of of_find_node_by_name() with a
non-NULL first argument are wrong, and should be replaced by
of_get_child_by_name(). We need a volunteer to do that work.

> I created a Smatch warning for this and here are the four issues it
> found.  The line numbers are from linux-next.
> 
> drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
> drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
> drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
> drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

-- 
Regards,

Laurent Pinchart

