Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318C674F1A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 09:08:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NysZW6lJvz3fNL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 19:08:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eV82duGb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eV82duGb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NysXN71L2z3fQp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 19:06:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 725C161E48;
	Fri, 20 Jan 2023 08:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04627C4339C;
	Fri, 20 Jan 2023 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674202000;
	bh=UiIWl1B5LiUi4QWU9j9MLDN5A3wG8pwgCFhO+/VTz5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eV82duGb2iVbYPyf0AeoQN8zV/TSECpo1KwtWHWHyFwc/G0u7ds3bXr4Gf1iaXQeW
	 Pwwm8fnvJGoBrj/QdnGlrIfCf0QHXJCoN8pdlM5u0+kC5R4gfMB1+gvH+Uf7e5VcxI
	 PpgA+S2NMZJoKa1IlJ7qHGY9iE/UO87bWRtgDysT3ajO7hI47onHI+5t5tL3a77ewS
	 utwllDInmkt7v2ObVNXNxYSnf2Rfo8FVFepensvD6wTfqd0CCQbKASP7YMWYcUNvDM
	 Anh4nz2sI09zSdiT2RBNZKM28fWrmL/ovniHJ40t+r4+UM9To1RXjxRy7uI8IVUUiK
	 veIQLzwAP4nmA==
Date: Fri, 20 Jan 2023 13:36:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v9 00/10] phy: Add support for Lynx 10G SerDes
Message-ID: <Y8pLjLWjv0nJa+ww@matsya>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com>
 <Y8gkMlqfPZic7reK@matsya>
 <17e428ae-7789-a1ab-3ccd-90b3b9a088f1@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17e428ae-7789-a1ab-3ccd-90b3b9a088f1@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19-01-23, 11:22, Sean Anderson wrote:
> On 1/18/23 11:54, Vinod Koul wrote:
> > On 17-01-23, 11:46, Sean Anderson wrote:
> >> 
> >> I noticed that this series is marked "changes requested" on patchwork.
> >> However, I have received only automated feedback. I have done my best
> >> effort to address feedback I have received on prior revisions. I would
> >> appreciate getting another round of review before resending this series.
> > 
> > Looking at the series, looks like kernel-bot sent some warnings on the
> > series so I was expecting an updated series for review
> > 
> 
> Generally, multiple reviewers will comment on a patch, even if another
> reviewer finds something which needs to be changed. This is a one-line
> fix, so I would appreciate getting more substantial feedback before
> respinning. Every time I send a new series I have to rebase and test on
> hardware. It's work that I would rather do when there is something to be
> gained.

I review to apply, if I can apply, I would typically skip this

-- 
~Vinod
