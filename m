Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D7559564
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 10:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTqxQ5m9Cz2yWr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 18:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iVZe6EOw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iVZe6EOw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTqwq14Fjz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 18:27:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 532C26200F;
	Fri, 24 Jun 2022 08:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECC3C34114;
	Fri, 24 Jun 2022 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656059223;
	bh=qpDM01dkJCwqn/oXRRFbVvx6B5RLwkKav9j/47BwKzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVZe6EOwT7Vr2kotm/nhThp0vfeufoCzz4OV9j8zFTJy4GjU7PJL3W9rm5wcG9tM0
	 T218W6rtYAuPiC7nD4/vGmB5J9o2dL2/v8Q7FrIMi5G8X4x1AIWhdgYX6ik7dRQjKZ
	 TQqzp3xBEfckduVe6+c/17YTVihXSCSZCM7v4u5Y71bkAZtGiYmBF89K0gPeGH5c4M
	 BppFcY4j/4AtzdYBpTKWwD26liQ12TaKDA9+40kkVRTxym/heXH1FEx0kPJsg67+Qx
	 dm/YfWtgHWawRrfeTrIl4BI2EpD2j2a+PvJDwdqpy1kWmd+UZOX+dWvE6JethmJzHh
	 cH+Y4VRcKDdNA==
Received: by pali.im (Postfix)
	id 416C1711; Fri, 24 Jun 2022 10:27:00 +0200 (CEST)
Date: Fri, 24 Jun 2022 10:27:00 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers
Message-ID: <20220624082700.pzqm2wgrfpbukyfz@pali>
References: <20220511143712.22550-1-pali@kernel.org>
 <877d5669mc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877d5669mc.fsf@mpe.ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Behun <marek.behun@nic.cz>, Rob Herring <robh+dt@kernel.org>, Josef Schlehofer <josef.schlehofer@nic.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 24 June 2022 13:08:59 Michael Ellerman wrote:
> Pali Rohár <pali@kernel.org> writes:
> > CZ.NIC Turris 1.0 and 1.1 are open source routers, they have dual-core
> > PowerPC Freescale P2020 CPU and are based on Freescale P2020RDB-PC-A board.
> > Hardware design is fully open source, all firmware and hardware design
> > files are available at Turris project website:
> >
> > https://docs.turris.cz/hw/turris-1x/turris-1x/
> > https://project.turris.cz/en/hardware.html
> >
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  arch/powerpc/boot/dts/turris1x.dts | 470 +++++++++++++++++++++++++++++
> >  1 file changed, 470 insertions(+)
> >  create mode 100644 arch/powerpc/boot/dts/turris1x.dts
> 
> The headers say you Cc'ed this to the devicetree list, but I don't see
> it in the devicetree patchwork:
> 
>   https://patchwork.ozlabs.org/project/devicetree-bindings/list/?state=*&q=turris&archive=both

Email is on the devicetree list:
https://lore.kernel.org/linux-devicetree/20220511143712.22550-1-pali@kernel.org/

> Which means it hasn't been run through Rob's CI scripts.
> 
> Maybe try a resend?
> 
> cheers
