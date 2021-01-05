Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE82EADBF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 15:56:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Ftb6JHHzDqkV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 01:56:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9Frr2hmwzDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 01:54:36 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kwnj7-00GBNf-Pw; Tue, 05 Jan 2021 15:54:25 +0100
Date: Tue, 5 Jan 2021 15:54:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: [PATCH 01/20] ethernet: ucc_geth: set dev->max_mtu to 1518
Message-ID: <X/R9oWNNxkY2pTC6@lunn.ch>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205191744.7847-2-rasmus.villemoes@prevas.dk>
 <20201210012502.GB2638572@lunn.ch>
 <33816fa937efc8d4865d95754965e59ccfb75f2c.camel@infinera.com>
 <X/R4tqny72Bjt28b@lunn.ch>
 <6c56889ce3d0e9fc7a6ca7e7a43091b1ae8cd309.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c56889ce3d0e9fc7a6ca7e7a43091b1ae8cd309.camel@infinera.com>
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

> Hi Andrew
> 
> I found here: 
> https://patchwork.kernel.org/project/netdevbpf/patch/20201218105538.30563-2-rasmus.villemoes@prevas.dk/
> 
> Seem to be underway but stable isn't included, I think it should be.

Stable should happen, since this was posted with [net,v2,3/3]. David
or Jakub handles stable for netdev. Give it a few more days. If not,
ask Jakub what is happening.

    Andrew
