Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C39654946
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 00:31:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdRQn0yrmz3bWZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 10:31:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XV3Y2ns6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdRPs71wZz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Dec 2022 10:30:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XV3Y2ns6;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NdRPm4yv8z4x1G;
	Fri, 23 Dec 2022 10:30:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1671751838;
	bh=kLkQ4YA9j/wR8/NPUjzPAw1z0oTUa/gM29aYgHgT9qQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XV3Y2ns6eGjvlX3vQX2vmnZooeWhKyp9TjlVNfKm9SNzCI3crRhIqdgt/kODHlESQ
	 ce0ydOLIDVz/CGcMz58ZyDM3VzZC8aMrCqPN87Gha5LmReHc7gjb3pwXftMhHbqIBi
	 BeIQNleWqHpSKuBT9n13Vte2w/SIBkf7mzT7LJwUC7Bd/7XxRmHISD9CbDrjlIfCjD
	 TUoVwX/Iy2PZoU/R3J+YjDeXkfkwzZtph7m2UpcDonAEryaMbggC7WqQDfSE6xvvzF
	 /y8XMaDFa9GHUTN/JMGLOovyHKZqaeCUYC/uKsHjtnHV/ZkhdaLlH5/gXmlZenzx9x
	 dv4gbQaWr9BAw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jakub Kicinski <kuba@kernel.org>, Camelia Alexandra Groza
 <camelia.groza@nxp.com>
Subject: Re: [PATCH net v2] powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
In-Reply-To: <20221222110843.022b07b9@kernel.org>
References: <20221216172937.2960054-1-sean.anderson@seco.com>
 <VI1PR04MB5807014739D89583FF87D43EF2E59@VI1PR04MB5807.eurprd04.prod.outlook.com>
 <VI1PR04MB5807E65FA99FE10D53804445F2E89@VI1PR04MB5807.eurprd04.prod.outlook.com>
 <20221222110843.022b07b9@kernel.org>
Date: Fri, 23 Dec 2022 10:30:36 +1100
Message-ID: <87o7rvhv8j.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Jakub Kicinski <kuba@kernel.org> writes:
> On Thu, 22 Dec 2022 15:41:00 +0000 Camelia Alexandra Groza wrote:
>> > Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
>> > Tested-by: Camelia Groza <camelia.groza@nxp.com>  
>> 
>> I see the patch marked Not Applicable in the netdev patchwork.
>> What tree will it go through?
>
> I could be wrong but I think DTS patches are supposed to go via the
> platform / arch trees. We mostly take bindings via the networking trees
> (and DTS changes if they are part of a larger code+binding+dts set).
> But we can obviously apply this patch if that's the preference of
> the PowerPC maintainers..

The commit it Fixes went in via the networking tree, so I think it would
make sense for you to take this also via the networking tree.

cheers
