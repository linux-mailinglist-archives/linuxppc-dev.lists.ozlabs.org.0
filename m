Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A30D554ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 18:48:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YBtG42gwzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 02:48:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=fail (mailfrom) smtp.mailfrom=animalcreek.com
 (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com;
 envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=animalcreek.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" (0-bit key;
 unprotected) header.d=animalcreek.com header.i=@animalcreek.com
 header.b="Pjjwt9K6"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="0TaaIeG1"; dkim-atps=neutral
X-Greylist: delayed 525 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Jun 2019 02:46:19 AEST
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YBrC0Vh7zDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 02:46:17 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 452053376;
 Tue, 25 Jun 2019 12:37:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 25 Jun 2019 12:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=mesmtp;
 bh=gSyJjIHjthT3a2SYIYJNLmRY+/ZGTrj+u+zCYKrjbOY=; b=Pjjwt9K6MhBJ
 zIuUap8jIrsLK5wc0QVha0hXjF6ATPFKsLe/UK4gCKkpu4gJa3sb4sXewoHVwKYb
 qYuzqpS43/PE7nIII03rzTXWvSujg6zxliCmmKQIbwPfy0D5ux99JMv+xyEA+DCg
 zoVbLxyQQ30U8rAInLhkmHQuiAVpSWI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=gSyJjIHjthT3a2SYIYJNLmRY+/ZGTrj+u+zCYKrjb
 OY=; b=0TaaIeG19hAjd3vPGddqd1WWw0wICU2LXquWcQhbdWOy/xTgmGnz8z9bH
 wtXuiGUFghRvJ3lHfhKtQ7NSotX4m2sK+9LH50u9Bc7ZpU9oSxc2B9QUqDgZsonX
 CNqhrnosdixhRCa2nYx3XLcKvE4MHPMes5pM6qL+sMeQ0/Nr6XjM8+A1BtPGowHN
 MLJ+6vcUUJydtyWkkHRdzAPvDBVhxGgRg2xvAHrZpI5RhKMRA9t7xm6IQGvYHVSA
 MwX0Pw6dzLvQSuo8lRVBR8Oba4CgR5VtgvQtweSJk9yQenSaqXXbuUyHZWZ0QfxL
 S+59hWB7sWSizPQIcZbrc/isLk+Lw==
X-ME-Sender: <xms:xk0SXXqoRo6-9c96z-V0VMIQ6RtwXK_Ym2YZ_RumZj1EaVMGTgiWTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeggddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjghofgesthekredttderjeenucfhrhhomhepofgr
 rhhkucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenuc
 fkphepieekrddvrdekjedrleehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggv
 rhesrghnihhmrghltghrvggvkhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xk0SXdP-_PEWJQ-GUifoOwZaTe-qXfgM7G7CB3tp4tBAMJSOsKyDOw>
 <xmx:xk0SXUOuKAjwZH2g5YDwcEKThKcJfID8Ufz3v0Y1DEYWMmqADeLI6w>
 <xmx:xk0SXf1X98dcDEpn0tsLimeZC0jV4RBuOmwZjA3R3q8vsRcEN2-yzw>
 <xmx:yE0SXUxtVKcHhRzMz8c54pIyl_w4XGLXQyskSEBczUBmZpyw1IX1_A>
Received: from blue.animalcreek.com (ip68-2-87-95.ph.ph.cox.net [68.2.87.95])
 by mail.messagingengine.com (Postfix) with ESMTPA id A9A74380079;
 Tue, 25 Jun 2019 12:37:26 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id D4B5AA22265; Tue, 25 Jun 2019 09:37:22 -0700 (MST)
Date: Tue, 25 Jun 2019 09:37:22 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: DMA coherency in drivers/tty/serial/mpsc.c
Message-ID: <20190625163722.GA18626@animalcreek.com>
References: <20190625122641.GA4421@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190625122641.GA4421@lst.de>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Mark Greer <mgreer@animalcreek.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>, linux-serial@vger.kernel.org,
 Dale Farnsworth <dale@farnsworth.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 02:26:41PM +0200, Christoph Hellwig wrote:
> Hi Paul, Dale and Mark (I hope this reaches the right Mark),

Hi Christoph.  Yes, you did reach the right Mark.  :)

> I've started auditing all users of DMA_ATTR_NON_CONSISTENT ot prepare
> for major API improvements in that area.
> 
> One of the odd users is the mpsc ѕerial driver, which allocates DMA
> memory with the above flag, and then actually properly calls
> dma_cache_sync.  So far, so good.  But it turns out it also has
> "#if defined(CONFIG_PPC32) && !defined(CONFIG_NOT_COHERENT_CACHE)"
> ifdef blocks next to the dma_cache_sync calls that perform cache
> maintainance for platforms that according to the ifdef claim to
> be cache coherent.  According to the Kconfig the driver can
> only build if the MV64X60 symbol is set, which is a ppc embedded 6xx
> SOC, which appears to be configurable as either cache coherent, or
> not.  But according to the code in the driver at least this device
> always is not cache coherent.
> 
> It seems like we need to always mark that platform as potentially
> not coherent, and then use the per-device flag to mark all device
> except for this one as coherent.  Or did I miss anything?  Maybe
> all this is actually dead code and can go away?

Yeah, the mpsc driver had lots of ugly cache related hacks because of
cache coherency bugs in the early version of the MV64x60 bridge chips
that it was embedded in.  That chip is pretty much dead now and I've
removed core support for it from the powerpc tree.  Removing the mpsc
driver is on my todo list but I've been busy and lazy.  So, to sum it
up, don't spend any more time worrying about it as it should be removed.

I'll post a patch to do that tonight and I'm sorry for any time you've
spent looking at it so far.

Mark
--
