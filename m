Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808640D591
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 11:09:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9B932X4Hz2yQL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 19:09:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R8zNlq+6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=johan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R8zNlq+6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9B8Q24w4z2xY4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 19:08:38 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCA8460F93;
 Thu, 16 Sep 2021 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631783315;
 bh=WVZp7zAxrJcGJFceYnaC30L3NEug/ghHkDrrF8bTKWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R8zNlq+6LDpDSB6aIwW2FWWR18uvGGQl1jdbf63U4ouezWknqHqVmp3lEJDDV1pRu
 Fp/4G4fmivvsMWB2H3DVg/Q0l/Mhfh4TXTChCNcOWcNFwqneRbmLGMSRhpA0BTiBz4
 Xzvyb9Gjne5oOLhHdP1BXJtfqjjP+WGGA5DLbbBqscjFZknBvDLhYCaa2KZj0/cAwX
 ZkjPAiHcvdE6Hra3tpgqRr3xGPtl0m3vEOfqSZH4D/64PuJC/FQd+bbUpJVV1n3vHT
 sHhJeLOgNyijxqPAXxKOZJbcwVWhywOhamAXhrlCfRGRaskksh6YiDQpJqSMvTkJPR
 YgIqyI8Kwmalw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mQnNj-00059h-Oc; Thu, 16 Sep 2021 11:08:36 +0200
Date: Thu, 16 Sep 2021 11:08:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] serial: 8250: SERIAL_8250_FSL should not default to y
 when compile-testing
Message-ID: <YUMJk6VKI40Caq5x@hovoldconsulting.com>
References: <c5f8aa5c081755f3c960b86fc61c2baaa33edcd9.1631710216.git.geert+renesas@glider.be>
 <YUMESxr907YHM3ZT@hovoldconsulting.com>
 <CAMuHMdX7_AOuGEjvTHpQ-4KHMH+m800KTu7wads6UTfMZiu9BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX7_AOuGEjvTHpQ-4KHMH+m800KTu7wads6UTfMZiu9BQ@mail.gmail.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 16, 2021 at 10:55:49AM +0200, Geert Uytterhoeven wrote:
> Hi Johan,
> 
> On Thu, Sep 16, 2021 at 10:46 AM Johan Hovold <johan@kernel.org> wrote:
> > On Wed, Sep 15, 2021 at 02:56:52PM +0200, Geert Uytterhoeven wrote:
> > > Commit b1442c55ce8977aa ("serial: 8250: extend compile-test coverage")
> > > added compile-test support to the Freescale 16550 driver.  However, as
> > > SERIAL_8250_FSL is an invisible symbol, merely enabling COMPILE_TEST now
> > > enables this driver.
> > >
> > > Fix this by making SERIAL_8250_FSL visible.  Tighten the dependencies to
> > > prevent asking the user about this driver when configuring a kernel
> > > without appropriate Freescale SoC or ACPI support.
> >
> > This tightening is arguable a separate change which risk introducing
> > regressions if you get it wrong and should go in a separate patch at
> > least.
> 
> Getting it wrong would indeed be a regression, but not tightening
> that at the same time would mean I have to send a separate patch with
> a Fixes tag referring to this fix, following this template:
> 
>     foo should depend on bar
> 
>     The foo hardware is only present on bar SoCs.  Hence add a
>     dependency on bar, to prevent asking the user about this driver
>     when configuring a kernel without bar support.

I know this is a pet peeve of yours, but asking users about one more
symbol when configuring their kernels is hardly something that requires
a Fixes tag.

Either way it's a pretty weak argument for not separating the change.

Johan
