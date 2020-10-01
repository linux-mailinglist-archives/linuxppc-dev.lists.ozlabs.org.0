Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95962280034
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 15:31:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2DYS6jZ7zDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 23:31:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2DMY0gtNzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Oct 2020 23:23:04 +1000 (AEST)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kNyXk-00H4LM-So; Thu, 01 Oct 2020 15:22:44 +0200
Date: Thu, 1 Oct 2020 15:22:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v3 devicetree 2/2] powerpc: dts: t1040rdb: add ports for
 Seville Ethernet switch
Message-ID: <20201001132244.GD4067422@lunn.ch>
References: <20201001132013.1866299-1-vladimir.oltean@nxp.com>
 <20201001132013.1866299-3-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001132013.1866299-3-vladimir.oltean@nxp.com>
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
Cc: devicetree@vger.kernel.org, madalin.bucur@oss.nxp.com,
 radu-andrei.bulie@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, fido_max@inbox.ru, robh+dt@kernel.org,
 paulus@samba.org, shawnguo@kernel.org, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 01, 2020 at 04:20:13PM +0300, Vladimir Oltean wrote:
> Define the network interface names for the switch ports and hook them up
> to the 2 QSGMII PHYs that are onboard.
> 
> A conscious decision was taken to go along with the numbers that are
> written on the front panel of the board and not with the hardware
> numbers of the switch chip ports. The 2 numbering schemes are
> shifted by 8.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
