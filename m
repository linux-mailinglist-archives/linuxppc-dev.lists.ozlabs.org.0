Return-Path: <linuxppc-dev+bounces-1736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C937398E479
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 22:55:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJnBn2ZJ6z2yV8;
	Thu,  3 Oct 2024 06:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727902528;
	cv=none; b=NdiTiHAaIR1QvUJACUfSqgEBVDoqF0KDeqon2pbit5APNSY/8fH68jFVEr4lUpCxy1fI16kKN8cDAE4MlyXtjTka3L5kWdgsts76zmUgCIcVA6vKggVadl3wMJfDPDrZocAtRy9V7joz4RSyus+ZK59f4LaaZGrC7eUjJOgjMY8xBd/0nFCEiO4frZSdIWFfKN+v6x4yTVZ3/06VqdW9SXBGpooAmJim6ImjKttNDNtDf8kiqlB4v4H2smD6buXreYV71tANQOJLlan9VZpWzDPgn09QunTGBUH1gYsOX6Cx4NqI1g3JwwEETdaaIjhyimhtIlHTQ0UwmGN6Vh0vjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727902528; c=relaxed/relaxed;
	bh=YiWHn9ebe7KQepDtfabAS6iaU52G8drPBbAXCsmV36c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=e81nJKnQgZO5asYcIclHNtXGneqBDmCbqRxZCnf+mlRQ4PsKbtFX/t6Vkyq3aSUBCXkCCoSLGn7cU0CGiDxH1RyaUnILjqr4YGnkboB0IJAJgdhk/xZIjPHaR4AeadTAr9UDczk3E3ST/buFznVozFz4uEyPs04n+Fy9C2oCZJHlsjJyr4n1GYrRpzAA5najOGS/trQhzb0ByDVtf2bjzlIyKljyY8TYNx6B/5mOPeLXYZs9hsshhatRTfrf99It1/cJiWcq0Qw4brHKgtSlOZDC6EVx+vU+fXUDxtKZJE1WtZxNYzEdTuGC7wiOd4SjLUFDDZjrXDKxrD/xFdItDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c7noUOEm; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c7noUOEm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJnBl6XWbz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 06:55:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F415A43F8D;
	Wed,  2 Oct 2024 20:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418ACC4CEC2;
	Wed,  2 Oct 2024 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727902524;
	bh=TuGJcLjFSc56+Q/eaA2wEGKI+ciNhNV4JQafPOI71fQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=c7noUOEm+BauPgS1f2MCN6MaaLa1cM46uUgxC8nE9HBAO3sEGV99HNNaLNWs047EH
	 /d05+dMftjH5oeauu7EFpU2NcDd38eZk6FhZWy/ioymRZnc0L1ZAvX9on430YyEB8Y
	 iBFl1FEhoMvylioKynPaIEIYY7rDMTAEkZwNaMXOM+jjIlon+eONfgCtZNqGgVs7rM
	 RiD8QFBdMI/B7A2blmSc1OrbchoSL9Yk1HfrzJbgilVzPzxGIcJaV/uCqDur2l1W69
	 dGXS0OcRwupnHwprVDyvloOyFlQbSD4HrG8zBiwiUt6cReD6Gc1/7QNPpgLHx3mRHy
	 HLwixwt62hcCA==
Date: Wed, 2 Oct 2024 15:55:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Matthew W Carlis <mattc@purestorage.com>, alex.williamson@redhat.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	david.abdurachmanov@gmail.com, edumazet@google.com, kuba@kernel.org,
	leon@kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, lukas@wunner.de,
	mahesh@linux.ibm.com, mika.westerberg@linux.intel.com,
	netdev@vger.kernel.org, npiggin@gmail.com, oohall@gmail.com,
	pabeni@redhat.com, pali@kernel.org, saeedm@nvidia.com, sr@denx.de,
	Jim Wilson <wilson@tuliptree.org>
Subject: Re: PCI: Work around PCIe link training failures
Message-ID: <20241002205521.GA270435@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2410021355540.45128@angie.orcam.me.uk>
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 02, 2024 at 01:58:15PM +0100, Maciej W. Rozycki wrote:
> On Tue, 1 Oct 2024, Matthew W Carlis wrote:
> 
> > I just wanted to follow up with our testing results for the mentioned
> > patches. It took me a while to get them running in our test pool, but
> > we just got it going yesterday and the initial results look really good.
> > We will continue running them in our testing from now on & if any issues
> > come up I'll try to report them, but otherwise I wanted to say thank you
> > for entertaining the discussion & reacting so quickly with new patches.
> 
>  My pleasure.  I'm glad that the solution works for you.  Let me know if 
> you need anything else.

If there's anything missing that still needs to be added to v6.13-rc1,
can somebody repost those?  I lost track of what's still outstanding.

Bjorn

