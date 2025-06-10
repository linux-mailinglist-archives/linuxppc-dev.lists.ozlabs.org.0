Return-Path: <linuxppc-dev+bounces-9258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C62AD439A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 22:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH0VH4dZjz2yLJ;
	Wed, 11 Jun 2025 06:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749586711;
	cv=none; b=D/061SH6YeQjDWI6nHVmo0o4faAFfpZ/mUTmN8cI6+K3iNLHerr7tZHIXrRZU+QB0qkFDKfB8ExyScuaAt/rp51jz8/ng24uZgmtJ1mFw27Yp9LY938C8T4J1ylRm3bzUjIo91OGMP5W/S/1okMlgrsHubqcDgeCjMiPmpZbc3FxqSLAeXJ3uKsrE6Ez33xKSQ9/3cOFX005h2HRAGP+869wFdhOt3froRKcMbrp4p6sFijZKzZu2qKT0DhD170fTTILo0WlKZaBvA1XHpMFTsDgHFFXzm12vAIxKW93f6ZgZ4yU7/5F2H7Wwh7Heg0ON5Bim7NgXGmDepMva+dn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749586711; c=relaxed/relaxed;
	bh=i5j9X1t21V0JWvOlnaTs2OjzuA6tfPjoH/+dfFanux8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5SgEDu9KHhZOHM9T9sk99rCfV38bCFCK7QjwMy5WGARL22dljHyCHuz3xg8aocJka44+G3KTBo63NlORSBiO/j//Yzyi7u05KzsGn9XNcLmwBJiZvnQfMiUimpueOc7hlAG0aXWDVPXTP5kgQfu1XI4elJJnUvRamw8qd+e1mMpAKFezHLSc6olkM8L4Fw/jV46qI3ZZt5UL6p5hjgbDh5bTHR/oLquay1tovmrbEt2MYYip1fUNvULaIFrO1llbprKmC0bT8ujHoil3mLPfHeH4XyqLWR/QH8UKMdkMS00ngHZnG5soDVqwuZihJ5A9s9MHD/LJIAoK1FFJyctXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1y5nQKr; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1y5nQKr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 11 Jun 2025 06:18:29 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH0VF22mqz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 06:18:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749586710; x=1781122710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KkMPpLWarAObIGFdc/4Gj8U/zmuf7yOK4LH5HnaJns8=;
  b=j1y5nQKr7b3jYwWBd1huaKHH56dvUNd2lbkVLRaDawPHJWS9Vp9GFBua
   Q0m6CaWZPvSRPFvQLpdd+Xbcs4j/BGfYhBYmg29mAJQai3aWaf7H4ZukF
   v/kNCcdQNPX66BO2IUDBbIl1KAqoE3YbD2fJVZN8PLh03LAdn+HRBWiNH
   Y2ywl955EaT6ptnzz4tnWm8fiW7689igo1kFXXsvaLVK/Ilgdu4E/7Paf
   mTHEe4c/FkhfzZ/e2MzhyUa3Tm9Q2Y+wBoMlNb9iqCLHhKm7faNkGhQQA
   0SQu8+1X+sCWI5Wrq1SuXb84X8WS0Go2QpT7QA73tszI3oajEnZcVLhgN
   w==;
X-CSE-ConnectionGUID: j/sjhYjMRHekbKMA05onbw==
X-CSE-MsgGUID: RpysI1jSTZyLI8Ki9bFRjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51811068"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51811068"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:17:21 -0700
X-CSE-ConnectionGUID: mULnA7/tT0Sddi3uk+PAJQ==
X-CSE-MsgGUID: +G96++PuQdm5BLTlEDt8iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="146864596"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:17:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uP5PC-00000005RU8-34rs;
	Tue, 10 Jun 2025 23:17:10 +0300
Date: Tue, 10 Jun 2025 23:17:10 +0300
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
Message-ID: <aEiSxq6lNNJq5DJM@smile.fi.intel.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
 <aAuqgiSxrh24-L-D@stanley.mountain>
 <20250425170732.GA21390@pendragon.ideasonboard.com>
 <aEiJ856egeMCC6ao@black.fi.intel.com>
 <20250610200339.GA1233@pendragon.ideasonboard.com>
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
In-Reply-To: <20250610200339.GA1233@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 11:03:39PM +0300, Laurent Pinchart wrote:
> On Tue, Jun 10, 2025 at 10:39:31PM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 25, 2025 at 08:07:32PM +0300, Laurent Pinchart wrote:
> > > On Fri, Apr 25, 2025 at 06:30:10PM +0300, Dan Carpenter wrote:
> > > > Whatever happened with this thread from Feb.
> > > > https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/
> > > > 
> > > > The issue was that people weren't expecting of_find_node_by_name() to
> > > > drop the reference on the of_node.  The patchset introduced a wrapper
> > > > which basically worked as expected except no liked the naming.  Krzysztof
> > > > suggested that maybe the callers should be using of_get_child_by_name()
> > > > instead.
> > > 
> > > My conclusion is that most of the users of of_find_node_by_name() with a
> > > non-NULL first argument are wrong, and should be replaced by
> > > of_get_child_by_name(). We need a volunteer to do that work.
> > 
> > Wouldn't be coccinelle a good worker for this job done?
> 
> It's not mechanical work, every single user need to be audited manually.

Sure, but at least it can do some job that can be done automatically.

> Finding the call sites is the easy part, and we have them already.

> > > > I created a Smatch warning for this and here are the four issues it
> > > > found.  The line numbers are from linux-next.
> > > > 
> > > > drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
> > > > drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
> > > > drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
> > > > drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

-- 
With Best Regards,
Andy Shevchenko



