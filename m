Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0333134FFBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 13:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Pnr70WXz3c0Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 22:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V81QxCaX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V81QxCaX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9PnR3Lj8z301K
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 22:52:27 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA0DA61983;
 Wed, 31 Mar 2021 11:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617191545;
 bh=oYPoYBISW1U3nwgz67Ee8rLPsIXaiLi1AKK4azFtrDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V81QxCaXo5BcqEzeHs7BvlqPDdaEyjYVePPvs3WuSN5I5bEH0xng7LgAfNS9RfWjH
 iQb661c3nrs6KSXN8KzZi+gsZXvqVwGfws61NxzyZ0PiolDJekDMKkN2Y5b63obGTD
 QfDIYE2lR9LIeqTaOSahYqZMycWBFJKGp9lA2IsXsHDpi/cB2soRcGp2zBuZeUMMca
 ltiOLrzkRGV5aQu6ZJFM9fIl1iUgXSLj+Nc93kBEkO4Dk9ZU9evLoNrLlMa2OLs+6x
 ORQGKSadN3jra5Itw8ipgu58ptTFpSTqDQHowhddnVIA9q60kt/sv2Gqa0WpqkXvWY
 FnRKu0K/+eWdg==
Date: Wed, 31 Mar 2021 12:52:19 +0100
From: Will Deacon <will@kernel.org>
To: Daniel Walker <danielwa@cisco.com>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210331115218.GB7626@willie-the-truck>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <20210329100750.GB3207@willie-the-truck>
 <20210330173521.GT109100@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330173521.GT109100@zorba>
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

On Tue, Mar 30, 2021 at 10:35:21AM -0700, Daniel Walker wrote:
> On Mon, Mar 29, 2021 at 11:07:51AM +0100, Will Deacon wrote:
> > On Thu, Mar 25, 2021 at 12:59:56PM -0700, Daniel Walker wrote:
> > > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > > > 
> > > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > > > 
> > > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > > whether he wants it appended or prepended or replacee. Then no need to
> > > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > > ones.
> > > > 
> > > > That's the main difference between my series and Daniel's series. So I'll
> > > > finish taking Will's comment into account and we'll send out a v3 soon.
> > > 
> > > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > > little value. Please stop submitting them.
> > 
> > FWIW, they're useful for arm64 and I will gladly review the updated series.
> > 
> > I don't think asking people to stop submitting patches is ever the right
> > answer. Please don't do that.
> 
> Why ? It's me nacking his series, is that not allowed anymore ?

If you're that way inclined then you can "nack" whatever you want, but
please allow the rest of us to continue reviewing the patches. You don't
have any basis on which to veto other people's contributions and so
demanding that somebody stops posting code is neither constructive nor
meaningful.

Will
