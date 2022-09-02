Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B05AB7AF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 19:42:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK4wp2T5Pz30Kr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 03:42:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gFBRhA2B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gFBRhA2B;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK4w81Mf8z2y6K
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 03:41:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DEAABB82CD1;
	Fri,  2 Sep 2022 17:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA429C433D6;
	Fri,  2 Sep 2022 17:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662140482;
	bh=Fhpz1/e1H4HMa8Jtwgh0t8VzDicCBOWzSpuCa2Lmwbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFBRhA2BOL7MvGuouJRoyb3fUbvKNAtmooGPN+NY6lYQwKCWYUiVKqhmMGr1JJ7BC
	 KqMafQu/Vw8/9bCWvPOnB9H1oN/sJflozPajNK7ujhSWPHfyp8CwbZ8QisTz/3qJGT
	 tL6tdsfQZhbV0pEF05vlIQi8kFS93RdBj+GFQDTS9Q3hQgN4RocJelo1+EIuXH0wpj
	 6dKpnCSnz8P+osDbw3jxnHdFHLjnYLcWLDIdIaMXa7yjhOhP+QGev9O6YZVMi0VSHy
	 3MivnCmDTGiqZh2ZazTkJseGCB8J1Hqi4qpKpWr5PWZtqki0NGeaTXYsiBUnd7fPDE
	 YYguD0oecoW9Q==
Date: Fri, 2 Sep 2022 23:11:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v4 0/8] phy: Add support for Lynx 10G SerDes
Message-ID: <YxJAPbfBpUpHeiqX@matsya>
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <6d312336-4bfc-a8d4-783c-116a21284edf@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d312336-4bfc-a8d4-783c-116a21284edf@seco.com>
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

On 30-08-22, 17:44, Sean Anderson wrote:

> 
> ping?
> 
> Vinod/Kishon: any comments on the driver itself?

Not sure why this is not in my queue or pw, can you please rebase and
resend

Thanks

-- 
~Vinod
