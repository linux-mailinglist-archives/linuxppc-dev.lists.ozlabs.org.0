Return-Path: <linuxppc-dev+bounces-5328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A0A1317E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 03:41:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYRvC4D1Cz2yvn;
	Thu, 16 Jan 2025 13:41:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736995271;
	cv=none; b=bd+GFvndynQaRgtqLtLS+FPO2wevUB0NK5Fhe7tSJZopp74VnV46ZKLR7BTIUjD7faIKAjlkMznsd830GdGq6r+MMoRbn7yGtlgIc3l0ICNok05SyrRBjUDX5GL7Ns/Zvklr24MN5i58IdEe0MpN/tQlGCusmjOa9GcEtS+BaJ/6RCtHgweCfXXwobEF8sWrv1cj9TDcKoLkvBanroYjdbLGfp1ddu2KC1e4knZj5X9OBedGHeIobL1k89O5WgLLKS1v5mgtwWXCaTHWIv1yhvxIwsjU6XxjqY2JuthO/HyxP2d69+mkztog8Y7bmUWWrhEmOnHnbOcsOphYTsDMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736995271; c=relaxed/relaxed;
	bh=TppaCDBBSzNsxD6lOnTs78aAdw1fcP4/VQvmYPvxh2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9BeAuutKoNX1fk3YnvxAlTAKhTUAH2w1z4w06Z3Ln450TU+4DBzpnuJESydim4dubDXALBy2nVIHtpZuvkc7NeJlqXw4wVImo/bYSY21pMpcaNsAGrACyudOj1yrYUeWRgqFJM/OvuKxAeUp01H/Cd/UG18pnSxCFEPR1aiREJbXrXi92QhhpwVyJTicE56WJQpZ4avH5NQqkP7uzncgh1cFBy8MyLgXH/sbuIPVSXhxnocLSVJKIlr7ZJDZVcfECHVDiyBpNlxh8xRtPklH6lcUimzTWrIjTlT8Ta2y05bq/CVNYseqhaG8XhsnrxRKvYtFx/0rrbnwJTLBievXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JPasyAZ2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JPasyAZ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYRvB1jV6z2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 13:41:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E2575C5BE0;
	Thu, 16 Jan 2025 02:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E850C4CED1;
	Thu, 16 Jan 2025 02:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736995267;
	bh=357X8ueNSmXmBC6zxKI/63tEqCXBjNeDU6GK2yNvUAc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JPasyAZ2pXyo8qbSFD7ZwIEuV1EKK/LSSeua5vU//cH6s7iu3tSTYwGQSny2KAC7D
	 VznLxn5ygEAW5jlVKrZMx3n+Sb+AI/Jy66mm7E0ZwL2ppZuSFXd1dwS8tP+plcfKUj
	 QEWcn41dyqz32+oVWK4tkBXlo6v9cCydSkC7dtKql1zZv0dq7H7lIlVi1/HTR0NrFa
	 coEvsEQlICfRbB9IWB+lIvHzUMx1DQzdBK8NXErtZL694f3SCcyssiyaNNhzDscAwg
	 o/LC8tuOBCs6gsUPk/KAvTSKdjKbY5lditIZMMnjqOkQdiPRWKRMWU3mjDNdvkOG2J
	 9YoR6N03JSnOw==
Date: Wed, 15 Jan 2025 18:41:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>
Subject: Re: [PATCH v2 net-next 07/13] net: enetc: add RSS support for
 i.MX95 ENETC PF
Message-ID: <20250115184105.139aed9c@kernel.org>
In-Reply-To: <PAXPR04MB8510B52B7D27640C557680B4881A2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
	<20250113082245.2332775-8-wei.fang@nxp.com>
	<20250115140042.63b99c4f@kernel.org>
	<PAXPR04MB8510B52B7D27640C557680B4881A2@PAXPR04MB8510.eurprd04.prod.outlook.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 16 Jan 2025 02:24:10 +0000 Wei Fang wrote:
> > Why create full ops for something this trivial?  
> 
> We add enetc_pf_hw_ops to implement different hardware ops
> for different chips. So that they can be called in common functions.
> Although the change is minor, it is consistent with the original
> intention of adding enetc_pf_hw_ops.

In other words you prefer ops.

Now imagine you have to refactor such piece of code in 10 drivers 
and each of them has 2 layers of indirect ops like you do.
Unnecessary complexity.

