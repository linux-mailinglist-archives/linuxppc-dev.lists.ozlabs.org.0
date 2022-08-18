Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3CA598C3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 20:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7vLK26rZz3c8s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 04:58:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QVo7iHOz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QVo7iHOz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7vKm0KLHz3c17
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 04:58:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32B0A6175F;
	Thu, 18 Aug 2022 18:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E96C433D7;
	Thu, 18 Aug 2022 18:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660849096;
	bh=ouppfBFaujjzUdExtVMjtCUZgagFAFokFfGF8rO54vI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QVo7iHOzM6VR8VI2pixt+xUoG0J6hALP8CiYFWzfmsnW9Rs+gofy3Sze7FmXQLca9
	 a/CwB7r/1sN4Wntiv37ppDK+Ih9oH7asFA7lR7r8qsqKB4j8ic4WQlZGpD7tncJXS7
	 tOAnrr4qfWw1t8lCqJ7OABl7iXbmNL7rjaSiESLprVd/IfTuZN1AnutCCpRt41Avno
	 5Ojh19hAeZtWUX80yKYg2CWUJhuZWMlE0gW7theEZBpX4JXJ98tiFC8/SxNLU7M8zt
	 PRhnSyJ5o7ZC8WGz6QrREa6jZcBbQmQQqjgTtNyNlPDvS+Rejf31VVWotzlMCT96Nx
	 Ih9OgreeQ7IiQ==
Date: Thu, 18 Aug 2022 11:58:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [RESEND PATCH net-next v4 00/25] net: dpaa: Cleanups in
 preparation for phylink conversion
Message-ID: <20220818115815.72809e33@kernel.org>
In-Reply-To: <f085609c-24c9-a9fb-e714-18ba7f3ef48a@seco.com>
References: <20220818161649.2058728-1-sean.anderson@seco.com>
	<20220818112054.29cd77fb@kernel.org>
	<f085609c-24c9-a9fb-e714-18ba7f3ef48a@seco.com>
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

On Thu, 18 Aug 2022 14:37:23 -0400 Sean Anderson wrote:
> On 8/18/22 2:20 PM, Jakub Kicinski wrote:
> > On Thu, 18 Aug 2022 12:16:24 -0400 Sean Anderson wrote:  
> >> This series contains several cleanup patches for dpaa/fman. While they
> >> are intended to prepare for a phylink conversion, they stand on their
> >> own. This series was originally submitted as part of [1].  
> > 
> > Still over the limit of patches in a patch series, and looks pretty
> > easy to chunk up. We review and apply patches in netdev in 1-3 days,
> > it really is more efficient to post smaller series.   
> 
> Last time I offered to arbitrarily chunk things [1], but I did not receive
> a response for 3 weeks.

I sent you the link to the rules. Admittedly not the most polite and
clear feedback to put it mildly but that was the reason.

> > And with the other series you sent to the list we have nearly 50
> > patches from you queued for review. I don't think this is reasonable,
> > people reviewing this code are all volunteers trying to get their
> > work done as well :(  
> 
> These patches have been sent to the list in one form or another since
> I first sent out an RFC for DPAA conversion back in June [2]. I have not
> substantially modified any of them (although I did add a few more
> since v2). It's not like I came up with these just now; I have been
> seeking feedback on these series for 2-3 months so far. The only
> reviews I have gotten were from Camelia Groza, who has provided some
> helpful feedback.

Ack, no question. I'm trying to tell you got to actually get stuff in.
It's the first week after the merge window and people are dumping code
the had written over the dead time on the list, while some reviewers
and maintainers are still on their summer vacation. So being
considerate is even more important than normally.
