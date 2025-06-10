Return-Path: <linuxppc-dev+bounces-9255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CAAD42FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 21:40:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGzfq6YsCz30BG;
	Wed, 11 Jun 2025 05:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749584451;
	cv=none; b=Hpwz7NxN1t7jupDulY+mQnv94bG6W1ChP8Sb1cZ34s+DJgikF5m/tlgdHCpWjMz6wHU6dagkAVJUv3Fs+8RTAdn5GqBbH5wGSMu/s81SV9n7Vg1OfD7IOkZLmCFzNq13mE8dQ8zDQs6EnJzObA9q8ZrWMPrxz+V5Q0P7aE4GhernU+UaRYNpduDVRikRzq7739wZHdfobfQWKCjpa09mFfv0Ya8mvYwd/0WCzCKN30fNo3F+bGunA6mYShtgpisnUy9OfG7feO3aE3JGi4HPJLkZV6u+OJG+YUNc5H1h1IR7ZV4anuhyVTnPBnbHTqCzhWJp1qYWMrJSXt7hTePfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749584451; c=relaxed/relaxed;
	bh=Ftm19c+5zR92eENHcmFvF1ruiRS22wnlQz7kUTSPedQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz0JK4ODY/8FC9FScgytX/OK6PbpK/hUYdvPL4TF0J1IZzioh8rj3iSDzTNze+X7GgHDL1ruX4mHY51fnEBTeKNoRvJyy7pNkA6nAXKawzznV+WRRSo78SI63Bopr6iWcW4whJ9r3eXYBIT78I7EiqW8AT3hxB1t5jfUuL0AdLNvrz5qBwfsbbgcjIny85buzDZxr1GjgG5/GYiSlcrndNbWxtGZhk52jEmX2Y7EInFvp1LMmWgMHDMPkh8HWVL2bbS9Mf6chABXXyDkOSBkLzwzEqBjxLa2zfQdoNxlDjLc2hMmDNLp6zSEyZEMqrXarf4axy+hBRDnaLRyPtA6zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dfxOfDEe; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dfxOfDEe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Wed, 11 Jun 2025 05:40:49 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGzfn2Y8jz308P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 05:40:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749584450; x=1781120450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1AqxAXQNYSUTabZqEXvUlQimdfjcHSOK+y+vnNlK8HM=;
  b=dfxOfDEeLGhs7bJAsEydCnJKn24EbupbSV27x0w7nmg/I6g2VREHPiTP
   kfJ5BIo+NeEVBlE65u9ydLIG0zFAiI3YZvsqAdptMQYOJ6fs340H/nvB6
   IR9MMm9dvYgytiFrhwXKkT9wM1wpfdtLp1JFG7pdHgAnlN4jm2a8pf7aJ
   oQJgXdqRPywtXx40FpsMwRqF3d7OeanAFAZsO2GUGlUBiNY+wAZZfWWQF
   tSuXl2++4Q/b37/Be4GK5Lz9XKdxXnQnWUigagTOGKQUv9qMqLMSRmMNK
   yncbn9KkRcNwwTynV1hHoRzBf9itgJ4eSwWfI9owakhV8UeZoylirTvxd
   w==;
X-CSE-ConnectionGUID: lEktm+BZSrmNI+Apc/RtJQ==
X-CSE-MsgGUID: fE7VL/R8TfKBQhW+XVFQqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51850309"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51850309"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:39:41 -0700
X-CSE-ConnectionGUID: HAII8C7VR2+VGHgP4EdDhQ==
X-CSE-MsgGUID: sCiWvYJeQrudIxcAfcGRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="184117312"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2025 12:39:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 635BA192; Tue, 10 Jun 2025 22:39:31 +0300 (EEST)
Date: Tue, 10 Jun 2025 22:39:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"zhangzekun (A)" <zhangzekun11@huawei.com>,
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
Message-ID: <aEiJ856egeMCC6ao@black.fi.intel.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
 <aAuqgiSxrh24-L-D@stanley.mountain>
 <20250425170732.GA21390@pendragon.ideasonboard.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425170732.GA21390@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 25, 2025 at 08:07:32PM +0300, Laurent Pinchart wrote:
> On Fri, Apr 25, 2025 at 06:30:10PM +0300, Dan Carpenter wrote:
> > Whatever happened with this thread from Feb.
> > https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/
> > 
> > The issue was that people weren't expecting of_find_node_by_name() to
> > drop the reference on the of_node.  The patchset introduced a wrapper
> > which basically worked as expected except no liked the naming.  Krzysztof
> > suggested that maybe the callers should be using of_get_child_by_name()
> > instead.
> 
> My conclusion is that most of the users of of_find_node_by_name() with a
> non-NULL first argument are wrong, and should be replaced by
> of_get_child_by_name(). We need a volunteer to do that work.

Wouldn't be coccinelle a good worker for this job done?

> > I created a Smatch warning for this and here are the four issues it
> > found.  The line numbers are from linux-next.
> > 
> > drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
> > drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
> > drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
> > drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

-- 
With Best Regards,
Andy Shevchenko



