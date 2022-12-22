Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C49654661
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 20:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdKcg1GH9z3bZm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 06:09:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CDid/fHM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CDid/fHM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdKbk2GWqz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Dec 2022 06:08:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 147D5B81F43;
	Thu, 22 Dec 2022 19:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA23C433EF;
	Thu, 22 Dec 2022 19:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671736124;
	bh=v7ujKq38V/S7LgWeN+6hzTleK2M7lVikFbmjRd4KjEo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CDid/fHMNttr0Ku3tg2xXVkAhBeLuydsZ20BjO8q/aYS7FCVEMPw/cpHNT9XXk8lL
	 qpNvw/JHHzYKQcwd+Vymhc1L06BRGu3yGkAJlTrNNSAucUQLbhotWSWyBfbydtv61z
	 NfCORu37UiZ6chVmu+FbGmD/L0XgtE6eYVSRHNaA9mZLvtA4qO9LuQIPZyC/B2U/6I
	 mkbvrk21FiMuWuOl4qOaXJrSVp5yVe2E1XGufZU9sQuEe0LLbXldv+ZvENT0HuPc3k
	 gvUf/jHxHIVONu3majiuQZXk+/kPKVLadxQQojMSOfuoUxuqRYxkriO3miXJYRwsbV
	 xgh7K524DTKXA==
Date: Thu, 22 Dec 2022 11:08:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Camelia Alexandra Groza <camelia.groza@nxp.com>
Subject: Re: [PATCH net v2] powerpc: dts: t208x: Disable 10G on MAC1 and
 MAC2
Message-ID: <20221222110843.022b07b9@kernel.org>
In-Reply-To: <VI1PR04MB5807E65FA99FE10D53804445F2E89@VI1PR04MB5807.eurprd04.prod.outlook.com>
References: <20221216172937.2960054-1-sean.anderson@seco.com>
	<VI1PR04MB5807014739D89583FF87D43EF2E59@VI1PR04MB5807.eurprd04.prod.outlook.com>
	<VI1PR04MB5807E65FA99FE10D53804445F2E89@VI1PR04MB5807.eurprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Anderson <sean.anderson@seco.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Dec 2022 15:41:00 +0000 Camelia Alexandra Groza wrote:
> > Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
> > Tested-by: Camelia Groza <camelia.groza@nxp.com>  
> 
> I see the patch marked Not Applicable in the netdev patchwork.
> What tree will it go through?

I could be wrong but I think DTS patches are supposed to go via the
platform / arch trees. We mostly take bindings via the networking trees
(and DTS changes if they are part of a larger code+binding+dts set).
But we can obviously apply this patch if that's the preference of
the PowerPC maintainers..
