Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B9063972D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 17:24:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKH9m4z95z3f2p
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 03:24:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=arEckJ9u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=arEckJ9u;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKH8n5NJDz3cFZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 03:23:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DBCACB81186;
	Sat, 26 Nov 2022 16:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7479BC433C1;
	Sat, 26 Nov 2022 16:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669479796;
	bh=ZiMoEvPiAbm9Zd5prrCmD+tFBUbmTzfO59TPPLSrPmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arEckJ9udIDYet5J0h5PreVs0TvbcXS0A9NGvxaBSt9KLPzxondRvGVp1oJKyF9FC
	 sZA/Haad684xQ84QhFDztacxz2ZcULoRZSx5fvl1ubZHE+2uIaQnvzQkMqUQ6gXiiI
	 wFaGFMIq5keklr8yxI+EAZZN6ltx/St/WgIej8DL0mdMJhMLobC1VG3HMDXTGJEcvn
	 z01dytIwc6yw3Lg39d2ci3cQLnHw0J7utJE0HvpYQyQYx0IymowmnqPBzioegFPeqo
	 xd50XjiHe/JaMyNeiTo+6Y5wMBdt6t0YrjDD70b6W48nQBhPlO7ofFsteuruMXX14d
	 fiG54LCfY1GNw==
Received: by pali.im (Postfix)
	id 84A627B2; Sat, 26 Nov 2022 17:23:13 +0100 (CET)
Date: Sat, 26 Nov 2022 17:23:13 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/fsl-pci: Choose PCI host bridge with alias pci0
 as the primary
Message-ID: <20221126162313.kn7ibopmwwfwrfvx@pali>
References: <20220820123327.20551-1-pali@kernel.org>
 <20221009110808.agfixtgneshui47o@pali>
 <20221101221909.3u5ateevc7ka2ysv@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101221909.3u5ateevc7ka2ysv@pali>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PING?

On Tuesday 01 November 2022 23:19:09 Pali Rohár wrote:
> Hello! I would like to remind this patch.
> 
> On Sunday 09 October 2022 13:08:08 Pali Rohár wrote:
> > Hello! Any opinion on this patch?
> > 
> > On Saturday 20 August 2022 14:33:27 Pali Rohár wrote:
> > > If there's no PCI host bridge with ISA then check for PCI host bridge with
> > > alias "pci0" (first PCI host bridge) and if it exists then choose it as the
> > > primary PCI host bridge.
> > > 
> > > This makes choice of primary PCI host bridge more stable across boots and
> > > updates as the last fallback candidate for primary PCI host bridge (if
> > > there is no choice) is selected arbitrary.
> > > 
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > ---
> > >  arch/powerpc/sysdev/fsl_pci.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
> > > index 1011cfea2e32..e4b703943dd3 100644
> > > --- a/arch/powerpc/sysdev/fsl_pci.c
> > > +++ b/arch/powerpc/sysdev/fsl_pci.c
> > > @@ -1125,6 +1125,19 @@ void __init fsl_pci_assign_primary(void)
> > >  			return;
> > >  	}
> > >  
> > > +	/*
> > > +	 * If there's no PCI host bridge with ISA then check for
> > > +	 * PCI host bridge with alias "pci0" (first PCI host bridge).
> > > +	 */
> > > +	np = of_find_node_by_path("pci0");
> > > +	if (np && of_match_node(pci_ids, np) && of_device_is_available(np)) {
> > > +		fsl_pci_primary = np;
> > > +		of_node_put(np);
> > > +		return;
> > > +	}
> > > +	if (np)
> > > +		of_node_put(np);
> > > +
> > >  	/*
> > >  	 * If there's no PCI host bridge with ISA, arbitrarily
> > >  	 * designate one as primary.  This can go away once
> > > -- 
> > > 2.20.1
> > > 
