Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E486FC753
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 15:01:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFyvv6kNyz3fN9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 23:01:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qHeYapAL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qHeYapAL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFytx4L1xz3fK0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 23:00:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B525064696;
	Tue,  9 May 2023 13:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A1FC433EF;
	Tue,  9 May 2023 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683637220;
	bh=/gNuNjyjzD94LeQPPBnUSbLHlkRpw/7XLI3M8KSY0B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHeYapALQh/WPbieIv0prg07vJ/QNowDSaROx28vil1Kr/9Fl2ayv8WSHG63XePea
	 GaKQ03lvXRMUya1mEwnOmBWwwXG2WbtgIKm6f7YWQTlp4SIrFQTwc3e7WNvb5b1Oak
	 9cE80UU45ZYo3SKZp1iqT4ThmLAE7UCZhX7Bm8EGRyzR/Zu4kJutfAh1oJxsYoc3uF
	 mkJD+NcGKbFucI/QNOHZG3rRXH/IMMYFNkKCgqA15Zz6IGOOfS43lezGIPTppWZTOt
	 ZRAOMvwGv+QqT6zFoUGpo5q1N0C1rc2WLmIemAi1QeHbvdja9seddcfXaEg/6MqR8G
	 0YL8mjCYiM/OQ==
Date: Tue, 9 May 2023 18:30:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 06/15] clk: Add Lynx 10G SerDes PLL driver
Message-ID: <ZFpD4I2LK9YIQQat@matsya>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-7-sean.anderson@seco.com>
 <ZFi9t84UoIfUyHhi@matsya>
 <1012f955-180e-0013-cc13-1da10991b5f5@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1012f955-180e-0013-cc13-1da10991b5f5@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08-05-23, 11:31, Sean Anderson wrote:
> On 5/8/23 05:15, Vinod Koul wrote:

> >> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
> >> +		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat);
> > 
> > so you have an exported symbol for clk driver init in phy driver header?
> > can you please explain why..?
> 
> So that it can be called at the appropriate time during the phy's probe function.
> 
> This is really an integral part of the phy driver, but I was directed to split it
> off and put it in another subsystem's directory.

That is right clock should be belong to clk driver. IIUC the hardware is
phy along with clocks and you are doing the clk init. I think that may
not be correct model, you should really have a device tree node to
represent the clock and the phy node


What stops this from being modelled as it is in the hardware?

-- 
~Vinod
