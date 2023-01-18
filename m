Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274767243E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 17:55:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxsM23XLJz3fF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 03:55:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L3K0/E6Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L3K0/E6Z;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxsL46ZZYz3chJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 03:54:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE4A0B81DD9;
	Wed, 18 Jan 2023 16:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B17FC433D2;
	Wed, 18 Jan 2023 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674060855;
	bh=RwHJvl4D5qmGQjZIXVYvEbuBvPMGq9xo3Uzk+iCGGwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3K0/E6ZEJodJAoNLwcLbc/rvJf+WG7swxtU45xi7fxpLgd37pJeeBz8ZDP49BOyX
	 ugB7XV3yn0792GxNeqf0B4Qb/IZr/oHxSsQt9HPpMSXoogsnjPDkI7DCG9Ja86XSu5
	 tvFnjPoy+9Xti51EaWOiw0Bq33f9Ww25cQZKhLmxSwR1Wgii7jRpw0lHB2ofkbHIy+
	 hvYQt/cRX6poxw7TLOFqy71oALwYz669q0DnD4lH4AAMZud9bEqv0bYP1nYqxSYrzX
	 VBhbIXu0TzIDnW1504zyEt/RIjVqhp7xxiN2l7te08f8riYzS3naP0cf8I4k13NCNm
	 dYFlSQkl5qOaA==
Date: Wed, 18 Jan 2023 22:24:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v9 00/10] phy: Add support for Lynx 10G SerDes
Message-ID: <Y8gkMlqfPZic7reK@matsya>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com>
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

On 17-01-23, 11:46, Sean Anderson wrote:
> 
> I noticed that this series is marked "changes requested" on patchwork.
> However, I have received only automated feedback. I have done my best
> effort to address feedback I have received on prior revisions. I would
> appreciate getting another round of review before resending this series.

Looking at the series, looks like kernel-bot sent some warnings on the
series so I was expecting an updated series for review

-- 
~Vinod
