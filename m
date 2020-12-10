Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5332D5059
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 02:26:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crx8w56g9zDqwT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 12:26:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crx703T68zDqpH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 12:25:14 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1knAha-00B95y-3W; Thu, 10 Dec 2020 02:25:02 +0100
Date: Thu, 10 Dec 2020 02:25:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH 01/20] ethernet: ucc_geth: set dev->max_mtu to 1518
Message-ID: <20201210012502.GB2638572@lunn.ch>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205191744.7847-2-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205191744.7847-2-rasmus.villemoes@prevas.dk>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 Murali Krishna Policharla <murali.policharla@broadcom.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 05, 2020 at 08:17:24PM +0100, Rasmus Villemoes wrote:
> All the buffers and registers are already set up appropriately for an
> MTU slightly above 1500, so we just need to expose this to the
> networking stack. AFAICT, there's no need to implement .ndo_change_mtu
> when the receive buffers are always set up to support the max_mtu.
> 
> This fixes several warnings during boot on our mpc8309-board with an
> embedded mv88e6250 switch:
> 
> mv88e6085 mdio@e0102120:10: nonfatal error -34 setting MTU 1500 on port 0
> ...
> mv88e6085 mdio@e0102120:10: nonfatal error -34 setting MTU 1500 on port 4
> ucc_geth e0102000.ethernet eth1: error -22 setting MTU to 1504 to include DSA overhead
> 
> The last line explains what the DSA stack tries to do: achieving an MTU
> of 1500 on-the-wire requires that the master netdevice connected to
> the CPU port supports an MTU of 1500+the tagging overhead.
> 
> Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
> Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
