Return-Path: <linuxppc-dev+bounces-2617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D2C9B18F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2024 17:07:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XbNKp0WXpz2xsW;
	Sun, 27 Oct 2024 02:07:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729955230;
	cv=none; b=V1dUFdVSfPwjhdLKDY4HGTLHeTUIacj+1sa0qyTZ/EmAEnULS2K4B7MMLtPbOOjsEKlqFW3zoTYmzDS0Pb3CetXBq4OufP6vdgfJcF4s4bJnFRyusrv+buiYq/p8a6niCq2MGvROcW1Mpo6HXBdTCkrqyhZJ8hYr8tTkkJIdzIXBn51zZisjodPZJ/2mcr3+PmcM7/9Gux5sRM1oybPZw+/BuAU3FUhCS1G4Ki5limw8H9hemRQDZXdbQw+SlaqlBua3R2XOQYZdmF444nx5J7y1WdEWmJOpm914SdWY+HbZAp98W7WiNVfiJY7GnVIIzEcglXdk1usjapmhA/x1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729955230; c=relaxed/relaxed;
	bh=9+99BhMvwxv3gY64WQxCtjY2LtNJDXuuOC+bOMCPeLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+K9J5KPDPmfR/vKxLbLijPBxvsHdsWvGq6/ijJutJli+pUyO17shmdiK88x5lSavEwXJ73+JwjnmclaBxE9g0frJeoActrnPBilVQ+rNPQOBnqVyN27XWOJIHp1yWoIB8SlBWbwAoJYh1rh4uvPYg0lv+LH+XSmgQqwrRX6rugASnhUJogLIAcw13sNoDTFfsWZ40AeA6QeevHkMBgseswT/vB/HlygZrY3RRT6angEgPkfwA3tPn5wxsrwDDki/Amu8APUkpQxr9qrfnFEjhz8SSxQZmrDteNkILcEREzKugexv62ZVKjF9fckePnBcj9b/q/PxBFGFpLy0g3Rxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bo63wzwn; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bo63wzwn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XbNKm73Cfz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 02:07:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82D705C5480;
	Sat, 26 Oct 2024 15:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8BEC4CEC6;
	Sat, 26 Oct 2024 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729955225;
	bh=nyrEPnPVL6CfiOximMToOwsXo5hX9hDKi37RpbH3KDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bo63wzwn4LbzEfNYwEJKtpL/2DlkYa9XTRF9HYO32eIMsd879HBZ3n7oyvJJam347
	 hc1cfPOK+FmOUk88Pcs+RTXwLFTi8hB2tdUewbI6QVGYFWugr8e9lsDf+voB27VlK/
	 2kZyT2Ue+khHEDfdL7L2oKl+ZIpZLwHtxiM0LC6PvUOA06pi/blWSlD1lvO5rspohf
	 ZPqDVBNrcB5p4bNf8pIwTQAXItXhWp15oBTIXbdv7Zg66vOwhNRAYX3R2ocixb5s5r
	 1znwOcMjeeufsfWcnbyYWjwLeue4+yIZxxtPzFHPlWLfCY+MXhQsCQkdrVccG/ZhdH
	 DAWEuI8VF+kQA==
Date: Sat, 26 Oct 2024 16:07:00 +0100
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next] net: freescale: use ethtool string helpers
Message-ID: <20241026150700.GF1507976@kernel.org>
References: <20241024205257.574836-1-rosenp@gmail.com>
 <20241025125704.GT1202098@kernel.org>
 <CAKxU2N98hnVAE9WF72HhxzVEfhnRAgMykVgBErL9b3gupqqrxQ@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N98hnVAE9WF72HhxzVEfhnRAgMykVgBErL9b3gupqqrxQ@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 12:32:27PM -0700, Rosen Penev wrote:
> On Fri, Oct 25, 2024 at 5:57 AM Simon Horman <horms@kernel.org> wrote:
> >
> > On Thu, Oct 24, 2024 at 01:52:57PM -0700, Rosen Penev wrote:
> > > The latter is the preferred way to copy ethtool strings.
> > >
> > > Avoids manually incrementing the pointer. Cleans up the code quite well.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >
> > ...
> >
> > > diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> > > index b0060cf96090..10c5fa4d23d2 100644
> > > --- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> > > +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> > > @@ -243,38 +243,24 @@ static void dpaa_get_ethtool_stats(struct net_device *net_dev,
> > >  static void dpaa_get_strings(struct net_device *net_dev, u32 stringset,
> > >                            u8 *data)
> > >  {
> > > -     unsigned int i, j, num_cpus, size;
> > > -     char string_cpu[ETH_GSTRING_LEN];
> > > -     u8 *strings;
> > > +     unsigned int i, j, num_cpus;
> > >
> > > -     memset(string_cpu, 0, sizeof(string_cpu));
> > > -     strings   = data;
> > > -     num_cpus  = num_online_cpus();
> > > -     size      = DPAA_STATS_GLOBAL_LEN * ETH_GSTRING_LEN;
> > > +     num_cpus = num_online_cpus();
> > >
> > >       for (i = 0; i < DPAA_STATS_PERCPU_LEN; i++) {
> > > -             for (j = 0; j < num_cpus; j++) {
> > > -                     snprintf(string_cpu, ETH_GSTRING_LEN, "%s [CPU %d]",
> > > -                              dpaa_stats_percpu[i], j);
> > > -                     memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> > > -                     strings += ETH_GSTRING_LEN;
> > > -             }
> > > -             snprintf(string_cpu, ETH_GSTRING_LEN, "%s [TOTAL]",
> > > -                      dpaa_stats_percpu[i]);
> > > -             memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> > > -             strings += ETH_GSTRING_LEN;
> > > -     }
> > > -     for (j = 0; j < num_cpus; j++) {
> > > -             snprintf(string_cpu, ETH_GSTRING_LEN,
> > > -                      "bpool [CPU %d]", j);
> > > -             memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> > > -             strings += ETH_GSTRING_LEN;
> > > +             for (j = 0; j < num_cpus; j++)
> > > +                     ethtool_sprintf(&data, "%s [CPU %d]",
> > > +                                     dpaa_stats_percpu[i], j);
> > > +
> > > +             ethtool_sprintf(&data, "%s [TOTAL]", dpaa_stats_percpu[i]);
> > >       }
> > > -     snprintf(string_cpu, ETH_GSTRING_LEN, "bpool [TOTAL]");
> > > -     memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> > > -     strings += ETH_GSTRING_LEN;
> > > +     for (i = 0; j < num_cpus; i++)
> >
> > Perhaps this should consistently use i, rather than i and j:
> >
> >         for (i = 0; i < num_cpus; i++)
> >
> > Flagged by W=1 builds with clang-18.
> I really need to compile test this on a PPC system.

Depending on your aims and hardware availability,
cross compiling may be easier.

But in any case, I don't think this problem relates to PPC.

> >
> > > +             ethtool_sprintf(&data, "bpool [CPU %d]", i);
> > > +
> > > +     ethtool_puts(&data, "bpool [TOTAL]");
> > >
> > > -     memcpy(strings, dpaa_stats_global, size);
> > > +     for (i = 0; i < DPAA_STATS_GLOBAL_LEN; i++)
> > > +             ethtool_puts(&data, dpaa_stats_global[i]);
> > >  }
> > >
> > >  static int dpaa_get_hash_opts(struct net_device *dev,
> >
> > ...
> 

