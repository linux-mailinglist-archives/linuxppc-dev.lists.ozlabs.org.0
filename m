Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565D34CD9E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 12:08:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F87ZL1Pwlz2yhd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 21:08:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9EhhMV0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f9EhhMV0; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F87Yx2j0qz2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:08:05 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C2D161585;
 Mon, 29 Mar 2021 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617012476;
 bh=pMPh6eyELHUsFo1+GSOTU018GXuHnqwmLWfjowXKpSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f9EhhMV0Q2/acyWJ/ZfxNWBKDPSPFcewP+yYd7grUMYR6ohYLn/GQbjkVRfpx6hy1
 qlz2kGTV6H9hIJ3P83OFCRWasmAPh0B4tg4uRiF/UiE/RSNCbR5Vp/lFYg26JDmhOc
 MWyUZuzkuVH70jdZJzCAyLBOqrXhFTb1bKdlZHGSYbFlC9bk2RUcV6QNHQmOXZOSfw
 MB8cWs05TS9x1iAejddICQs8gS82J+9FM1MYdvz//gI0U56nk09G1BsYCdMIXSnO7c
 KleBb0hQlKjIQJz/LgOJaH5ew9SHfhQgI3a4l184IRzCzZU/6ZjlfekxQPDfmmV3Jo
 EOvtS+AxR38PQ==
Date: Mon, 29 Mar 2021 11:07:51 +0100
From: Will Deacon <will@kernel.org>
To: Daniel Walker <danielwa@cisco.com>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210329100750.GB3207@willie-the-truck>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325195956.GM109100@zorba>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 X86 ML <x86@kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, xe-linux-external@cisco.com,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 25, 2021 at 12:59:56PM -0700, Daniel Walker wrote:
> On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > 
> > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > 
> > Let's only provide once CMDLINE as of today, and ask the user to select
> > whether he wants it appended or prepended or replacee. Then no need to
> > change all existing config to rename CONFIG_CMDLINE into either of the new
> > ones.
> > 
> > That's the main difference between my series and Daniel's series. So I'll
> > finish taking Will's comment into account and we'll send out a v3 soon.
> 
> It doesn't solve the needs of Cisco, I've stated many times your changes have
> little value. Please stop submitting them.

FWIW, they're useful for arm64 and I will gladly review the updated series.

I don't think asking people to stop submitting patches is ever the right
answer. Please don't do that.

Will
