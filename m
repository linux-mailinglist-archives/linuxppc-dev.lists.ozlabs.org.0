Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD485B787E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 19:45:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRrTD3bx3z3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 03:45:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s+TnU1vR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s+TnU1vR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRrSb3N2Lz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 03:44:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C044961547;
	Tue, 13 Sep 2022 17:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F17C433C1;
	Tue, 13 Sep 2022 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663091066;
	bh=Ic/VkqMBJjuwfLGWBGT9Tc39hmFMScQMkwunOI94tFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+TnU1vRb4T4DpJ4MIOfOPek8KCXQfe40HKcXuHkrBy6QlKdSFLWBh5YjDmpBYcHk
	 j3mjBOlBTBtLGLBkmY1S3AV0gdH3aAZFXxh6FDsc356KBPDYsei9Qoyk8H8b37YKrO
	 tVPdf7x3Huor0YjmmZfStaszdLNY4O74zjlApywWRd4oJqsbKIrdmh83CMqXO5F6hM
	 pBpUEFCzHHMCLzq1dLznJo9pHMDFeLYSNUI6F0NbN5LdqerPH0GXVj2zXxvgWHK8Kc
	 CzCdauMR9GiXuBgBwkfryDFPs3URk4JSrkNKfko8VsFqxDdYSmWSBKj1O89erfUzD9
	 57HUZKWlJy32w==
Date: Tue, 13 Sep 2022 23:14:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v5 0/8] phy: Add support for Lynx 10G SerDes
Message-ID: <YyDBdn+IHqConzIW@matsya>
References: <20220902213721.946138-1-sean.anderson@seco.com>
 <de50858e-0056-fd72-2b67-27bf597b3366@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de50858e-0056-fd72-2b67-27bf597b3366@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09-09-22, 11:05, Sean Anderson wrote:

> 
> I noticed in patchwork [1] that this entire series is marked as "Changes
> Requested," despite having received only automated feedback on one patch
> in the series. I am concerned about this because last time this occurred
> [2], the series received no feedback for a month. I suspect this is
> because series marked "Changes Requested" are hidden in patchwork by
> default. Can you change the status of this series back to new? Or should
> I just resend again?

Yes please, update with ack collected any feedback addressed would be
right...

> [1] https://patchwork.kernel.org/project/linux-phy/list/?series=673741&state=*
> [2] https://patchwork.kernel.org/project/linux-phy/list/?series=665484&state=*

-- 
~Vinod
