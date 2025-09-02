Return-Path: <linuxppc-dev+bounces-11615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A8EB3FD72
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 13:12:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGNNt46d9z2y06;
	Tue,  2 Sep 2025 21:11:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756811518;
	cv=none; b=Dxc1Wv+eRt/4h2tqp8uWRYEzcwHHf8ou5otNdYGGrtMwEmPxpkdgkp3ggehUKPpMMm3/222q4UzDlDu7UiEpCcYiH5Ei1n17iUBJQMqVwcIXm+rYCGlkDMoUoXk+7LA8K6L7GFSpaMBmbmYNZ98fYzZaqx3o/JfarnIHSsNC+2SFtuIHjNPz2jiWPrigRZY+vRsFtyYMXOVn5Ykira4cvqr66HhObuwM2298GM2NofsShoR2zLGrhY5sHUDFkDgjo03niKncW6SOMVYkDQUvsY6hQjnoOJW+xHxLc7bZMnTZkDeKSYLphBd2oiGCcVkGNiMaLbIEBEk6rQ94DGrccg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756811518; c=relaxed/relaxed;
	bh=m0Jec9/410OJbhXCj3unRKJggRa0OML7F9IZaa4gnEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai8QUh23+0bvGIBvpYMgpLW7KVxDekNWZMWA5cbuTv45vGyweqrM4f893Msi1xPXylekeerjeL2lWkNTaB1+H7dGaudicmtrlXUZpRKE01lUk2If1T7W2Haj1rF6tMtpQ57YuUSfTC1OFwavjXCd3ABHt3W8aOr0QXIbh59lWJPs3etzQy4uiEpEJbYgv6vx07jfU3DMhkbSYtnZNF7LMPH27WlherlpZEq4te7WZKrKpL17db1apHDO3rr1jH+cjwcfra98UfxUwDlJG6zhtTJ8/Zq/JMgXPeNgDh49NZ8Fm0M9bS75P241WlEar0qcOkFLwb01F3c5s/fUZiDQWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kroah.com; dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=f+cDZYGH; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IrDngGkA; dkim-atps=neutral; spf=pass (client-ip=202.12.124.152; helo=fhigh-b1-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=lists.ozlabs.org) smtp.mailfrom=kroah.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=f+cDZYGH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IrDngGkA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kroah.com (client-ip=202.12.124.152; helo=fhigh-b1-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=lists.ozlabs.org)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGNNq4rnPz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 21:11:55 +1000 (AEST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0FFF87A041D;
	Tue,  2 Sep 2025 07:11:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 02 Sep 2025 07:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756811510;
	 x=1756897910; bh=m0Jec9/410OJbhXCj3unRKJggRa0OML7F9IZaa4gnEU=; b=
	f+cDZYGHnAUFzqpRhq25p5/7uuR07XmXeWL3mz6ei/5upg2/GndUmIdHjdQhkifZ
	9xVbGpoB86ZSZ2bjITYi4yxuwYJTxeAR0P9TkCWlruYOtL7bI8GT0FIcpuSzlq1M
	JgRAdlMU3US2watUtfgizaPCDgSlymsPpnjTg+7aEPcEFnjA5vPwneL1RyR/qOLQ
	2RHyz1GgUqYFnrBmcgDqDqaPG2bgIERvOrmdqOl+XSQEyosjNyzh8qqndQnLbBG2
	ILyPB60GACbayBtV8DUCYJAwq11n+cqmAzO0/Bd39qROPdGcoFT17xblw8yUq808
	xX6nqWH0ZdVWPHHfzq87mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756811510; x=
	1756897910; bh=m0Jec9/410OJbhXCj3unRKJggRa0OML7F9IZaa4gnEU=; b=I
	rDngGkAUZ9iPI9NkjYqwAvMku8xZy6HU3h/RpaGi/uRAx3e/5JTxHVroUVi/lNy/
	hsh7an+a41lR1jPczqO4kpYPZMWnAuoWO6juTxknQc4JxPT3CyOI0SZsC+kUSwdZ
	HOxsX0wNosZThwHxrku6l4I7eLOSy6pOFoUH5KmQkYEqef0+Vk9ZWlW8vVZGxw5B
	sGIdDY7xWWouiAElLrp9PpSXCMmLdh8Yco6EZGDpXHh+gPbSuJmER+CXj0pezHQp
	ZIyV+4bAYNMBgTcUBaH5SdGzmWgUEHy+WZYJyLJtXGCkcv+f9bEYqJ9NMLXAmVHJ
	mkEV6EZ9Fr7my5UqzGUrg==
X-ME-Sender: <xms:9dC2aLYcO5-QLBCu-3Doy9H5OGM2N49xCY5qaZVVK0Fp9n1fxDRsZw>
    <xme:9dC2aPjTYr126EGOZE78vN4ofswEJjQw7fzw0rXoyKn32CIJoEznW1QHwkTekzYtg
    I4xVjLRCmtvxg>
X-ME-Received: <xmr:9dC2aFMa1jVWtLBljERsrJBqJuRvlPk4pUwAMTdtFLW4mq0kFzyX408mS6mkjyYLh5mk5CiWyCYMU1WIk-MeZTDb7Ko8nTj9SuJ4-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghgucfmjfcu
    oehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeftdfhieduhe
    eiieettdevieefffejhfdtudeikeefkeevteeugfevtdeugfetnecuffhomhgrihhnpehk
    vghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgs
    pghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrkh
    hushdrvghlfhhrihhnghesfigvsgdruggvpdhrtghpthhtoheplhhinhhmqhdttdeisehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrd
    hoiihlrggsshdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhr
    ohhuphdrvghupdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepmhgrugguhieslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehm
    phgvsegvlhhlvghrmhgrnhdrihgurdgruh
X-ME-Proxy: <xmx:9dC2aJOoAYRtjn3FAOERt__pL7TM8do8FRD-eO_xYSPYgZpfqKV6Vg>
    <xmx:9dC2aNIr0NCnWTGaTmWYh-qlYjZR4RcR9bAfpEtyLtgoHEFOqW_N1g>
    <xmx:9dC2aIs-VFawJQ3jbow6EsZ9ijqJvtKLXcwM2aG7PqhuOpRc14q9ew>
    <xmx:9dC2aPEGfyAZObH9f0tOAUN0CJEZWEmZfOdhf8SHuK1QWMWCB21IiA>
    <xmx:9tC2aJNt41Kj2ffXuJ2DABsguzxbOwi49tXdYdGrpr8ZpB_uVquCJ4_p>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Sep 2025 07:11:48 -0400 (EDT)
Date: Tue, 2 Sep 2025 13:11:46 +0200
From: Greg KH <greg@kroah.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Miaoqian Lin <linmq006@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jiri Slaby <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Olof Johansson <olof@lixom.net>, Paul Mackerras <paulus@ozlabs.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] pasemi: fix PCI device reference leaks in
 pas_setup_mce_regs
Message-ID: <2025090241-dowry-gloss-1709@gregkh>
References: <20250902072156.2389727-1-linmq006@gmail.com>
 <63be79a4-79e4-47f5-a756-aa55fe0d29ab@web.de>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63be79a4-79e4-47f5-a756-aa55fe0d29ab@web.de>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 02, 2025 at 12:24:11PM +0200, Markus Elfring wrote:
> …
> > Add missing pci_dev_put() calls to ensure all device references
> > are properly released.
> 
> * See also:
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc4#n658
> 
> * Would you like to increase the application of scope-based resource management?
>   https://elixir.bootlin.com/linux/v6.17-rc4/source/include/linux/device.h#L1180
> 
> * How do you think about to append parentheses to the function name
>   in the summary phrase?


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

