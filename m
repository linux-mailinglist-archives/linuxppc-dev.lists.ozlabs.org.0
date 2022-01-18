Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD3492F70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 21:35:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdgW93sJhz3bcc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 07:35:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K0kYcIC+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K0kYcIC+; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdgVQ07q5z2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 07:34:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58B7CB81800;
 Tue, 18 Jan 2022 20:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0977C340E2;
 Tue, 18 Jan 2022 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642538055;
 bh=a7eQGTBopVPgvTw08Y5Ltm/FC6r6uVERo3wx+LCHqWU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K0kYcIC+ocHAeSmsVl5YVeilSsemMYVs/7FnVOTdy8BPKTGJ0+XeIO4zdy6Oyx6J4
 gvmGdbYRFnOthooppITBIhCdgyz5VMNlhhPtotsk+8FANRexcxQrlneor5Q2YVcE2F
 CmHCmSMPnhWzE9kVLRBpaoU+vVjlqjj6+4M9qvrYzNkQs/td0XTy0Bw7vukTm1DuZ+
 SN2TmF8RV4lIv/wxA8jYDpsa4ge4URHBtKkAxkKFeQV2nAfFxcr1+2Y1zvV8+ahhP4
 QoUxZxdOFmz9pOqWtG70nLueeiGO/5s15fwqtda/mpO/a215vJJb9Loz0TvuLidvAw
 7Zp0zPFUZfPHQ==
Date: Tue, 18 Jan 2022 12:34:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net 1/4] net/fsl: xgmac_mdio: Add workaround for erratum
 A-009885
Message-ID: <20220118123413.70f469bd@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <YeV2idN2wPzrHI0n@lunn.ch>
References: <20220116211529.25604-1-tobias@waldekranz.com>
 <20220116211529.25604-2-tobias@waldekranz.com>
 <YeSV67WeMTSDigUK@lunn.ch> <87czkqdduh.fsf@waldekranz.com>
 <YeV2idN2wPzrHI0n@lunn.ch>
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
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, robh+dt@kernel.org,
 paulus@samba.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, Tobias Waldekranz <tobias@waldekranz.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Jan 2022 15:00:41 +0100 Andrew Lunn wrote:
> > Should I send a v2 even if nothing else
> > pops up, or is this more of a if-you're-sending-a-v2-anyway type of
> > comment?  
> 
> If you reply with a Fixes: patchwork will automagically append it like
> it does Reviewed-by, Tested-by etc.

That part is pretty finicky, it's supposed to work but when I apply
these I only get review tags from Andrew and a Fixes tag already
present on the last patch :(

A v2 with Fixes tags included in the posting would be best after all.
Thanks!
