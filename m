Return-Path: <linuxppc-dev+bounces-15445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A5D06EAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 04:07:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnRX74Z94z2y6G;
	Fri, 09 Jan 2026 14:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767928039;
	cv=none; b=MgfhPEnsxmta9HuED5H9E4fCarXrcbWpBXSHcYUvxl3N3I0CVs/HSmeAB+33wBd4o0B/cxcV7hDC443hU7Sb8PsryCZb5//I4CgHlihJF8p2Of3zwcNZca49CW2y1EM/9mic85/gV1RBWouyNLCAUnhx5Yjn06PlTA4Pz3e2I8sGecIc+IW7t33tinUusotLJTkmx4LcfKbIw7AbywS8TWCFmf7xPARTt3gZevkVoewq/ENixm21iTUHqhSrPO4U2yeLkOI9j2zI3ylWiqiiiftN8pm1pDy4xOxM/NpZqbNgDtNmPZdULh6fWh2s+E3D91HAWOrYmeVo3DdFZmm+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767928039; c=relaxed/relaxed;
	bh=xnbstTGuNZ6GwVgWpjVxZjFvmBZQJxrJ6v2OW/S9LhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LELJiENVr3xXSE5eFDWbqYU0d7muy6J3orlvj57B79+dy+XdgiRYaL5mYLBPO1zWg+N42Po/kQ8UC2ZCmagiqNfQtt22Kty7KWziPwdYnCFw/kCsGjz+kBEzijJEJppG/hgXnE4zL+pkWjVqSMxbadYSP+yRr6Gn+w+Rm3QZelgox9A+xnnKyKVudreuYFF/N8vS9y7LBIXutLKqNmShb1gR1w8hxNJb7jzwNWTNQSE1LYfpyeZ/ecLqd9VOWNAPiBn9XP9vdotFtUDND9XoQ/mTKpEzplVZ1XYqOSb/lc56ycMlNEbZeqjd4RXbvPdNXyQdzTyl+yl6wU3KXdrRlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pqcn5xAL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pqcn5xAL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnRX64Mxtz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 14:07:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D829943BD1;
	Fri,  9 Jan 2026 03:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D5DC116C6;
	Fri,  9 Jan 2026 03:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767928035;
	bh=SuA+4ZjGkTKfJszZr/F94qjYrQFU261YheQwQvC7VgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pqcn5xALsfEQBur8sts2W7grb6lheBRXWxs+Isfos4lloqU43t+b/hZUsc5h5apPn
	 DLtexPSgzr5RbFYi1QRvU9CvZ11WAY5WutKaWouarfRuh6ABHJWOtQroPfpCv8++mO
	 ut1jVC4aTf1gkfQrjYFedYI7Md9htvkR8oalTANlfzI7ps/Y5rXTkCvD7CbuD2rMS+
	 AQMhTZ6BtYs5CKMMrGiXlNa9UkFywNpZAa5zXFi9aiPjzvVzZhXy0UUMG7+E5jC4D4
	 C/ic7pYBp2rXeHrpIW2LC/cSy0TpLI1lFb6QyMBx5TCie5mTYjlEnNH4CNsAz7c+GE
	 WkMIFzVBzdcCw==
Date: Fri, 9 Jan 2026 08:37:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 09/11] dmaengine: fsl_raid: Simplify with scoped for
 each OF child loop
Message-ID: <aWBw4EgoaNSGrg_F@vaman>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-9-05eb948d91f2@oss.qualcomm.com>
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
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-9-05eb948d91f2@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 06-01-26, 10:15, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

