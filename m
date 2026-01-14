Return-Path: <linuxppc-dev+bounces-15739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817AFD1FB64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 16:22:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drqc925gjz309H;
	Thu, 15 Jan 2026 02:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404153;
	cv=none; b=SWYylmFfV91Pakbc2nmvArVBp5xTnbsjomom1Su+4NjsiVBsJG8aFOknax/ymWbjt52XitrYLbnsf6LNcaREPEhg2Q55vOKkfsDMmh54v8eZZHzjeW8R6K0Gy5X3eIZjCcjlQads7Y4M5z5XJPW8QWF+5ztmVEEyQUMiIorzfRSNGTj6yVSpmnakUyfRoWRU8mdgmNE2fARUpA9Pa3r/mKCLt9cRyBZa4oFnb7c9bpQQ0l8E9A5Sdque7DGOA/v9+uTeP98CT3qcODhHKng/po4V5BzBz0gG8CM+Xq8uGkAtiqTvE5UrjHf7XN4M7lBOeSFDwVtJVIunEJ8SHqNxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404153; c=relaxed/relaxed;
	bh=E4Fbp1gWprjaWwTIF67PnzL6ErW/s4uVu2YzVoPvCqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkJp7Rqi7ZttQZD3Ruh8vgfTRxjjPIPstaAFWb4BCx4zjB3mF6nLe6V3hzxEheUin10d4kbZkvw0lwi2tY5vUYkBrQjEAKBkDovG2DBipi3l4KMJ7IcAtVtoYK0cUT8ruwpqVOUEM+yBIGzdi2zmWQDyFUGX6BMp8J1MU8kJ35i/FZRrXmqTqGY/kcoAM6KpKGURJIRUkUsbMU1RLrwBZ46luPFKYv7e7lCl5yfOocNw23ztMO2hK9jWeXuUK6zzPYTFEidm+xn6G3dE0iFVcKjKC9DJIpu7bVy59Lr3P36bdTO73zsKQmZ5A+oCBQ4v+oh0FYx11aH7IF472F2i5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bBclkT4U; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bBclkT4U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqc36XWkz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 02:22:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E4Fb
	p1gWprjaWwTIF67PnzL6ErW/s4uVu2YzVoPvCqc=; b=bBclkT4UKNVbybJbFbtT
	2IDSjfq04crf0WEXCzSgltWp6wpqj0IOcdpzcamA3rcrrPUCv+MNqmhDSkzgCpG2
	yyUwkpFnxeiwWAsDNIjvzpXCnAKA7CfPCL6C/npvQA4uZy1ffvHBROEEWiILU9LQ
	T5fieVkn9r7JIKV3w9VndZef1veocFlhmQAS4lhzcPxSvtPjH272MMONUlJRjdJp
	0oBKq5rFA2R7i8VND/Ovz3Osry5WRtbS33bnNHtrOtvIqUGOXGrACp1MRRFz7UDn
	VR5kCfSzjz3kuQKrzSlOZBOoYuNaAEV9BRlqH5T7WrM24MhSiotV6b5jeW1eXHro
	5w==
Received: (qmail 2192941 invoked from network); 14 Jan 2026 16:22:18 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 16:22:18 +0100
X-UD-Smtp-Session: l3s3148p1@2rR5rFpIEqgujnsM
Date: Wed, 14 Jan 2026 16:22:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWe0qYCOFNww_wSL@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aWYiJbtueA8g3srn@ninjato>
 <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
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
In-Reply-To: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> FYI: I think the road-map will look something like this: v7.1 will get
> new interfaces and most controllers under drivers/i2c/ converted as
> this can be done within your tree exclusively. For v7.2 (with the new
> interfaces upstream) we can think about converting all i2c controller
> drivers treewide to the new helpers. Once v7.2-rc1 is tagged, I would
> try to remove struct device from struct i2c_adapter locally and send
> it to autobuilders for testing. If that goes well, we could create
> struct i2c_adapter_private or something like this and store its
> address in struct i2c_adapter. This new struct would be controlled by
> i2c core and contain struct device. With that out of the way, for v7.4
> we could think about adding SRCU into the mix (possibly using the
> then-available revocable).
> 
> If all goes well, we should be done in early 2027. :)

With this plan, what could possibly go wrong? :)


