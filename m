Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE824909E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 15:01:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jctqk5fkgz305B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 01:01:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kEgFdw/d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=kEgFdw/d; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jctq3364tz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 01:01:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=YS790bExTfkh4PHW3hIrNVTP5XO0J1V7mlWfOzj2+hg=; b=kEgFdw/dWrg94oZxKo8cq/EkPK
 V5dNV7H5YZA08vwuYe98OcgpKsQuy6JuvzVs5na5hcJsPZaPaGdUQIPZm413eitLoNlK5aUCwq/HR
 FzjBO4L2dGo2JdZh7OQ//LFe9XTfQ7M2WuNHn0+6+ZxMCBtW2nBfvEuhcl3+lMfi6bQo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n9SYr-001e33-H2; Mon, 17 Jan 2022 15:00:41 +0100
Date: Mon, 17 Jan 2022 15:00:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Tobias Waldekranz <tobias@waldekranz.com>
Subject: Re: [PATCH net 1/4] net/fsl: xgmac_mdio: Add workaround for erratum
 A-009885
Message-ID: <YeV2idN2wPzrHI0n@lunn.ch>
References: <20220116211529.25604-1-tobias@waldekranz.com>
 <20220116211529.25604-2-tobias@waldekranz.com>
 <YeSV67WeMTSDigUK@lunn.ch> <87czkqdduh.fsf@waldekranz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czkqdduh.fsf@waldekranz.com>
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
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, robh+dt@kernel.org,
 paulus@samba.org, kuba@kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 17, 2022 at 08:24:22AM +0100, Tobias Waldekranz wrote:
> On Sun, Jan 16, 2022 at 23:02, Andrew Lunn <andrew@lunn.ch> wrote:
> > On Sun, Jan 16, 2022 at 10:15:26PM +0100, Tobias Waldekranz wrote:
> >> Once an MDIO read transaction is initiated, we must read back the data
> >> register within 16 MDC cycles after the transaction completes. Outside
> >> of this window, reads may return corrupt data.
> >> 
> >> Therefore, disable local interrupts in the critical section, to
> >> maximize the probability that we can satisfy this requirement.
> >
> > Since this is for net, a Fixes: tag would be nice. Maybe that would be
> > for the commit which added this driver, or maybe when the DTSI files
> > for the SOCs which have this errata we added?
> 
> Alright, I wasn't sure how to tag WAs for errata since it is more about
> the hardware than the driver.

The tag gives the backporter an idea how far back to go. If support
for this SoC has only recently been added, there is no need to
backport a long way. If it is an old SoC, then maybe more effort
should be put into the backport?

> Should I send a v2 even if nothing else
> pops up, or is this more of a if-you're-sending-a-v2-anyway type of
> comment?

If you reply with a Fixes: patchwork will automagically append it like
it does Reviewed-by, Tested-by etc.

   Andrew
