Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D2580512
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:10:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsB444SqZz3cfW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 06:10:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uNJP4yak;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uNJP4yak;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsB3V5xw7z3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 06:09:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A2D8B810E2;
	Mon, 25 Jul 2022 20:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDEEC341C6;
	Mon, 25 Jul 2022 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658779793;
	bh=aOWZyTMoZqC2ZWZclAC30+8dvahXkYEp83QRpZBiuMA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uNJP4yakkas6CrGGRq0V3/Q/N8inFIzrkxhuU2Ns+m0tOSZ25/LKcIu+iTZDBaUpR
	 JFhRFcP/ZM3OzWYmOCBHFW9/eirYEPQrxEJ/MDZudpa49GMbRFs0MktJl/fF6Se5cI
	 WEIMl0D/aw2pcbkTB3tAMHbc9QDgzBz+yElFHzVFbJxrPc58GDnZ21FVbYx43U2zUY
	 AkRtdmQw4xKu7frqdms5pw2Hvwsi9jSgLXlwIxmsW55fTqMr2PAJNmEnSQWSJ9n8it
	 GFgUKFL7s7NA+MH6a2JFekcZo6ZZI4hLqIdMYtFo/S4+O8Vyw0dTguSsD78Y5aFawb
	 cIVhZGx/iKJ4A==
Date: Mon, 25 Jul 2022 13:09:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v4 00/25] net: dpaa: Cleanups in preparation for phylink
 conversion
Message-ID: <20220725130952.657626d4@kernel.org>
In-Reply-To: <20220725151039.2581576-1-sean.anderson@seco.com>
References: <20220725151039.2581576-1-sean.anderson@seco.com>
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

On Mon, 25 Jul 2022 11:10:14 -0400 Sean Anderson wrote:
> This series contains several cleanup patches for dpaa/fman. While they
> are intended to prepare for a phylink conversion, they stand on their
> own. This series was originally submitted as part of [1].

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#tl-dr
