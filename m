Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 879F92EAD63
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 15:35:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9FQM5MvBzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 01:35:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9FNn0XknzDqb1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 01:33:44 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kwnOo-00GBBp-7X; Tue, 05 Jan 2021 15:33:26 +0100
Date: Tue, 5 Jan 2021 15:33:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: [PATCH 01/20] ethernet: ucc_geth: set dev->max_mtu to 1518
Message-ID: <X/R4tqny72Bjt28b@lunn.ch>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205191744.7847-2-rasmus.villemoes@prevas.dk>
 <20201210012502.GB2638572@lunn.ch>
 <33816fa937efc8d4865d95754965e59ccfb75f2c.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33816fa937efc8d4865d95754965e59ccfb75f2c.camel@infinera.com>
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
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
 "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "murali.policharla@broadcom.com" <murali.policharla@broadcom.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "qiang.zhao@nxp.com" <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 05, 2021 at 02:17:42PM +0000, Joakim Tjernlund wrote:
> On Thu, 2020-12-10 at 02:25 +0100, Andrew Lunn wrote:
> > On Sat, Dec 05, 2020 at 08:17:24PM +0100, Rasmus Villemoes wrote:
> > > All the buffers and registers are already set up appropriately for an
> > > MTU slightly above 1500, so we just need to expose this to the
> > > networking stack. AFAICT, there's no need to implement .ndo_change_mtu
> > > when the receive buffers are always set up to support the max_mtu.
> > > 
> > > This fixes several warnings during boot on our mpc8309-board with an
> > > embedded mv88e6250 switch:
> > > 
> > > mv88e6085 mdio@e0102120:10: nonfatal error -34 setting MTU 1500 on port 0
> > > ...
> > > mv88e6085 mdio@e0102120:10: nonfatal error -34 setting MTU 1500 on port 4
> > > ucc_geth e0102000.ethernet eth1: error -22 setting MTU to 1504 to include DSA overhead
> > > 
> > > The last line explains what the DSA stack tries to do: achieving an MTU
> > > of 1500 on-the-wire requires that the master netdevice connected to
> > > the CPU port supports an MTU of 1500+the tagging overhead.
> > > 
> > > Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
> > > Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > 
> >     Andrew
> 
> I don't see this in any kernel, seems stuck? Maybe because the series as a whole is not approved?

Hi Joakim

When was it posted? If it was while netdev was closed during the merge
window, you need to repost.

You should be able to see the status in the netdev patchwork instance

https://patchwork.kernel.org/project/netdevbpf/list/

	Andrew
