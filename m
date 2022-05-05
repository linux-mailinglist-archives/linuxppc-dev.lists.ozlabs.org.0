Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B4851B6D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 05:56:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv0J21sB2z3bkb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 13:56:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lFAfNlQs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=shawnguo@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lFAfNlQs; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv0HQ08yYz2yQ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 13:56:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1085A61977;
 Thu,  5 May 2022 03:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9EDC385A4;
 Thu,  5 May 2022 03:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722973;
 bh=kH1fz4gNh3mYTjRRJTtbtpytPYOOHrYxMA2L0N7FXuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFAfNlQsIL3gsNXuhBp25HpT9K0sSeEZxDvftGn2iFnTxU81ixbHGAse/lcTD71y9
 Y7Kgnah1E9BnULvgjQ4X4cx4/p5mB2yFhKd/80vaDmUPiR2LD2X4t4EEuf7z93Y+yu
 OZn+IB038aWSKFEISZ8OHZ86d870RzTMBnw6Yd6UCHnzdVkTKsgM849FoW9wClWfKc
 T4OZJM2V55pG6+NPmuwytOsqj/7nXqFuIHPRhqEss+3kewaaBp/RWgJxhozbeyfzBg
 tPfmtCQK35ho6WbPlGgwA0HHtxJfYZAQ00HJ9FEtLDAsA6eQhon1igaIYulbhsDccM
 1IUqSBeqauV6w==
Date: Thu, 5 May 2022 11:56:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 1/4] ARM: dts: ls1021a: reduce the interrupt-map-mask
Message-ID: <20220505035606.GT14615@dragon>
References: <20220427075338.1156449-1-michael@walle.cc>
 <20220427075338.1156449-2-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427075338.1156449-2-michael@walle.cc>
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
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 27, 2022 at 09:53:35AM +0200, Michael Walle wrote:
> Reduce the interrupt-map-mask of the external interrupt controller to
> 7 to align with the devicetree schema.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied, thanks!
