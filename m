Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7786BDD61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 01:08:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pd4Gt2sSZz3f4w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 11:08:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZhWPY3/M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZhWPY3/M;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pd4FS27vvz3cj1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 11:07:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3725B8213B;
	Fri, 17 Mar 2023 00:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12907C433EF;
	Fri, 17 Mar 2023 00:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679011638;
	bh=qfqozMAegKijY8JNbuj9EKz7MePhaVeyD54LoSNyvDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZhWPY3/M3Sqi+evrt88Clwt3B9SMEDaX2TLOVy+k7nLqDt057pQc0Pbxk02rspClR
	 626vz/UV35x2vMwvvCF9Qtn6hli5foqzEvZXwtxFkb91PPN2Zkq81L95WTOgddmw7H
	 iHcIfXk+406ouIkKWI9q/pfGjJg0MdTGUOD7rU9YzQfV7NaIg8MBs8iWayNU6qUX+q
	 wKc9kko5zNaRoPQAw9578Em3wT39m1Iw3qu1xGG2XRFx+UwskZWBKZQYNkS2KuJ2F+
	 EZYT/CuLzjp6JhmwRvJuhjJqMYLNomtdp66H/StV9XEWgx+3Eoz9R+1rtUQbZHOCM/
	 t1CoZWi1wh6oA==
Date: Thu, 16 Mar 2023 17:07:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] net: Use of_property_read_bool() for boolean
 properties
Message-ID: <20230316170716.7039161d@kernel.org>
In-Reply-To: <20230314191828.914124-1-robh@kernel.org>
References: <20230314191828.914124-1-robh@kernel.org>
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
Cc: Simon Horman <simon.horman@corigine.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Zhao Qiang <qiang.zhao@nxp.com>, Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Francois Romieu <romieu@fr.zoreil.com>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.k
 ernel.org, linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wei Fang <wei.fang@nxp.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Mar 2023 14:18:27 -0500 Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to of_property_read_bool().
> 
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for net/can
> Acked-by: Kalle Valo <kvalo@kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Francois Romieu <romieu@fr.zoreil.com>
> Reviewed-by: Wei Fang <wei.fang@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, to net(?), thanks!
