Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE055F47F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 18:53:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhkL84gDCz3bmK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 03:53:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QjLhDul4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QjLhDul4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhkKG14V5z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 03:52:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5FFF60F1E;
	Tue,  4 Oct 2022 16:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909E7C433D6;
	Tue,  4 Oct 2022 16:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664902367;
	bh=H/kqk6/7AqbB9wsKQ6qgwDPXIp5+pPlqmcvwBFolxPY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QjLhDul457gNLr7pTKrNOboviSc3RuXbj9WtRFYiwh42u8exuS1MIMCHO99VWozkk
	 6mQSzioh2pKBRanOFWZhyBoymECNBeaTMzaDDeA8H3Hhrel3+itL6zZzZrHG9BOYXG
	 sGbKlMrSoYmGiQrKxXLwal8ompiamKGoUMKe/DOKvZ788Ttto+1L4GeMDAi4VYRR+l
	 f+67oxTTk00XFt0CXEByIsOiqds1yDHUma+kaPjUBVECIFgaJmBnOB3MGLEmidS2tC
	 tMYmx5aiH/tGBpBvfCFSS+B8wLG8FVNH6EsWJvScgECtFN+2Kzwq7gPD1EjnAtZcNt
	 6aYSvVxVdrviA==
Date: Tue, 4 Oct 2022 09:52:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v6 0/9] [RFT] net: dpaa: Convert to phylink
Message-ID: <20221004095245.1e9918bf@kernel.org>
In-Reply-To: <0b47fd86-f775-e6ad-4e5f-e40479f2d301@seco.com>
References: <20220930200933.4111249-1-sean.anderson@seco.com>
	<0b47fd86-f775-e6ad-4e5f-e40479f2d301@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Oct 2022 11:28:19 -0400 Sean Anderson wrote:
> I noticed that this series was marked "RFC" in patchwork.

Because the cover letter has RTF in the subject, presumably.

> I consider this series ready to apply. I am requesting *testing*, in
> particular on 10gec/dtsec boards (P-series). Since no one seems to
> have tried that over the past 4 months that I've been working on this
> series, perhaps the best way for it to get tested is to apply it...

You know the situation the best as the author, you should make 
a clear call on the nature of the posting. It's either RFC/RFT 
or a ready-to-go-in posting.

Maybe in smaller subsystems you can post an RFC/RTF and then it 
gets applied after some time without a repost but we don't do that.
The normal processing time for a patch is 1-3 days while we like
to give people a week to test. So the patches would have to rot in 
the review queue for extra half a week. At our patch rate this is
unsustainable.
