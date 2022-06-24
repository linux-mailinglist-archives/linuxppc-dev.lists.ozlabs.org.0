Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F96559695
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 11:31:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTsLm2cC6z3chn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 19:31:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ArdhgntW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ArdhgntW;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTsL974Ybz30QW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 19:30:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0ACEB811C1;
	Fri, 24 Jun 2022 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48530C341C0;
	Fri, 24 Jun 2022 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656063037;
	bh=fCo+37lS9RXjimcPtcfJ1/CRyO6x8Ddi+h/sRG2BNaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArdhgntWfBKlsSdoXNrsOKrWIlssbrOVvQZHAq/Cqgd1FmQ+aERFWtSIH9lpKOAcv
	 AuN/6IQp4CaTeIUJQ6X1C8v/d4QgHLHOiAjVA5YixksNhh/5sEtujeBA33h15QtMBP
	 FuD+nBpaksaAtO5EMFaTaTfsn8gSb5JV9JvbLp7tDfJ9RA2nY3lKmmsBhzEdIw7dqW
	 5dmvKitBhspUNCsOxlYJzjpaoKmIGuBGyUSBQlqPExFwP/t6u5VA6cnCvMU7uMnMJG
	 LdtjNh6OXbVNMmf/Gkg/epyBignacMDN6MSRX5jjLKcmG7qcs3oQGWUks1G62sPqFu
	 mV9zD/uVhl+/g==
Received: by pali.im (Postfix)
	id 640A6711; Fri, 24 Jun 2022 11:30:34 +0200 (CEST)
Date: Fri, 24 Jun 2022 11:30:34 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers
Message-ID: <20220624093034.qcuodruw4e7b6tuy@pali>
References: <20220511143712.22550-1-pali@kernel.org>
 <877d5669mc.fsf@mpe.ellerman.id.au>
 <20220624082700.pzqm2wgrfpbukyfz@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220624082700.pzqm2wgrfpbukyfz@pali>
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

On Friday 24 June 2022 10:27:00 Pali Rohár wrote:
> On Friday 24 June 2022 13:08:59 Michael Ellerman wrote:
> > Pali Rohár <pali@kernel.org> writes:
> > > CZ.NIC Turris 1.0 and 1.1 are open source routers, they have dual-core
> > > PowerPC Freescale P2020 CPU and are based on Freescale P2020RDB-PC-A board.
> > > Hardware design is fully open source, all firmware and hardware design
> > > files are available at Turris project website:
> > >
> > > https://docs.turris.cz/hw/turris-1x/turris-1x/
> > > https://project.turris.cz/en/hardware.html
> > >
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > ---
> > >  arch/powerpc/boot/dts/turris1x.dts | 470 +++++++++++++++++++++++++++++
> > >  1 file changed, 470 insertions(+)
> > >  create mode 100644 arch/powerpc/boot/dts/turris1x.dts
> > 
> > The headers say you Cc'ed this to the devicetree list, but I don't see
> > it in the devicetree patchwork:
> > 
> >   https://patchwork.ozlabs.org/project/devicetree-bindings/list/?state=*&q=turris&archive=both
> 
> Email is on the devicetree list:
> https://lore.kernel.org/linux-devicetree/20220511143712.22550-1-pali@kernel.org/
> 
> > Which means it hasn't been run through Rob's CI scripts.
> > 
> > Maybe try a resend?
> > 
> > cheers

Now I sent V2 and it appeared in devicetree list archive too:
https://lore.kernel.org/linux-devicetree/20220624085550.20570-1-pali@kernel.org/
