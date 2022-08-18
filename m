Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800F598C85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 21:28:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7w0m5PmPz3drL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:28:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FM9byKd6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FM9byKd6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7w0B0Sx9z3blx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 05:28:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2AFB6B8240D;
	Thu, 18 Aug 2022 19:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0ADC433D7;
	Thu, 18 Aug 2022 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660850884;
	bh=VYr1cXw3LttyNg8S5eNSk0+UacR8DxuCWqi7NjshbRU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FM9byKd6qcfcDmD0eBSzpaDPPzMZAEUB7JouthTYlFxb/LXF6qvLMk+6ScwYtoAIj
	 eJv5DzbLQLA7DejgW/cSZYCJ3qaQVC8ABS2l6RrWf43xLYUJbfb1pzakRb9TsZ6fVp
	 nsmt51ZFDx6HVXas4b+7sCEw+o1WLWqjO0WuszBrDguRd4w+7P+0Hvdk/yF8r/yOFv
	 Hst78VM1/T/u9PPBlU+o3qDx2N8zSLJ4hdEs1prvWrh+8uTN/hde/HP3ZcPflD4GJ4
	 MjRN6iFOLp0guhclFzd2JcoCfKHjHI0gTInXHVxqy2jugTil3/gRglspGNGMZpOX55
	 khUap8XBuMrtA==
Date: Thu, 18 Aug 2022 12:28:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [RESEND PATCH net-next v4 00/25] net: dpaa: Cleanups in
 preparation for phylink conversion
Message-ID: <20220818122803.21f7294d@kernel.org>
In-Reply-To: <583c7997-fb01-63ad-775e-b6a8a8e93566@seco.com>
References: <20220818161649.2058728-1-sean.anderson@seco.com>
	<20220818112054.29cd77fb@kernel.org>
	<f085609c-24c9-a9fb-e714-18ba7f3ef48a@seco.com>
	<20220818115815.72809e33@kernel.org>
	<583c7997-fb01-63ad-775e-b6a8a8e93566@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Camelia Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Aug 2022 15:14:04 -0400 Sean Anderson wrote:
> > Ack, no question. I'm trying to tell you got to actually get stuff in.
> > It's the first week after the merge window and people are dumping code
> > the had written over the dead time on the list, while some reviewers
> > and maintainers are still on their summer vacation. So being
> > considerate is even more important than normally.  
> 
> OK, so perhaps a nice place to split the series is after patch 11. If
> you would like to review/apply a set of <15 patches, that is the place
> to break things. I can of course resend again with just those, if that's
> what I need to do to get these applied.

Mm, okay, let's give folks the customary 24h to object, otherwise I'll
pull in the first 11 tomorrow.

> That said, I specifically broke this series up into many small patches
> to make it easier to review. Each patch does exactly one thing. Had I
> known about these limits based on patch size, I would have just squashed
> everything into 15 patches. I think an arbitrary limit such as this has
> a perverse incentive.

Practically speaking I think it works out fairly nicely, IDK.
There's trade offs like always. Takes a bit of getting used to.
