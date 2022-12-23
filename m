Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF12654A9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 02:57:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdVff0Zt3z3bZS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 12:56:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Aakj2HGE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Aakj2HGE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdVdg6H5wz2y8Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Dec 2022 12:56:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3C6F618E1;
	Fri, 23 Dec 2022 01:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC2BC433D2;
	Fri, 23 Dec 2022 01:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671760563;
	bh=QLHOFIxMAaRZFbEhphTQh3d6GJiGwh8Gyzy4bVbVsNc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Aakj2HGEDAo9GujVyn+9yRJKOH/pSg6B/RLNqUkHchRlHjypvTy689mSkFbCftpqU
	 eSjkBnql2x3fscmbELyMlRdwYvta2hnYIia+pjt3ocKAnFZ0J2jCRzkUEDJeBEeS41
	 aE9b2/Yfl3XauXIknrJnso2zC4I3hsdvyEhjF2XvPhajLFRsJOkt4tNB9dodqD2z/e
	 bLlet89UhhoIbKDRqS1aNFyutPVoMoBAYYGyeuH/o4YsMky7+mIpN1FaXE/HnPPFDH
	 /QVz7YB5dOdZc1S7LWstWEFmEmKj12T1sr4M1EkqL1cX3AB8ohtPEIGCTYO77YcLur
	 QJPsIbxCv1klg==
Date: Thu, 22 Dec 2022 17:56:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH net v2] powerpc: dts: t208x: Disable 10G on MAC1 and
 MAC2
Message-ID: <20221222175601.3cf5883e@kernel.org>
In-Reply-To: <87o7rvhv8j.fsf@mpe.ellerman.id.au>
References: <20221216172937.2960054-1-sean.anderson@seco.com>
	<VI1PR04MB5807014739D89583FF87D43EF2E59@VI1PR04MB5807.eurprd04.prod.outlook.com>
	<VI1PR04MB5807E65FA99FE10D53804445F2E89@VI1PR04MB5807.eurprd04.prod.outlook.com>
	<20221222110843.022b07b9@kernel.org>
	<87o7rvhv8j.fsf@mpe.ellerman.id.au>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Anderson <sean.anderson@seco.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 23 Dec 2022 10:30:36 +1100 Michael Ellerman wrote:
> The commit it Fixes went in via the networking tree, so I think it would
> make sense for you to take this also via the networking tree.

Roger that, thanks for confirming.
