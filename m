Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A12D5063
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 02:38:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrxPg0JXwzDqxV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 12:37:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrxND2T6BzDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 12:36:43 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1knAsm-00B99H-VQ; Thu, 10 Dec 2020 02:36:36 +0100
Date: Thu, 10 Dec 2020 02:36:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH 07/20] ethernet: ucc_geth: use qe_muram_free_addr()
Message-ID: <20201210013636.GC2638572@lunn.ch>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205191744.7847-8-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205191744.7847-8-rasmus.villemoes@prevas.dk>
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 05, 2020 at 08:17:30PM +0100, Rasmus Villemoes wrote:
> This removes the explicit NULL checks, and allows us to stop storing
> at least some of the _offset values separately.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

This seems to rely on one of the missing patches. Please don't split
patches like this, it makes review very difficult.

	Andrew
