Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9CD38DB89
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 17:08:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fp3dd2wRkz3bv5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 01:08:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=m83mZcoK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=m83mZcoK; dkim-atps=neutral
X-Greylist: delayed 2480 seconds by postgrey-1.36 at boromir;
 Mon, 24 May 2021 01:08:27 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fp3d736z9z2yxX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 01:08:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=cO97GQt7mIQ0ZMqdaTb0HibQ77osXtd0Ea5KRZD1PD8=; b=m8
 3mZcoKNanSeG+LzXhY4bt7KTO7qR7ZWahRLy9Nz22llXW9Fmiu8bnyBRGFX583JgPqWgr8kmJL7Dn
 sRdZ9oDBdLYUvCIdNMGzMuzQgyZfU0mKOSPuvsIJeH+//NJ/2fe3nFLBgIvxH77LyKLxLP8496efq
 elPtFT2803BeItc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lkp46-005mqx-9n; Sun, 23 May 2021 16:26:50 +0200
Date: Sun, 23 May 2021 16:26:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH net-next] ethernet: ucc_geth: Use kmemdup() rather than
 kmalloc+memcpy
Message-ID: <YKpmKln1Z/UvZgZQ@lunn.ch>
References: <20210523075616.14792-1-yuehaibing@huawei.com>
 <20210523152937.Horde.5kC0kzvaP3No5BC63LlZ_A7@messagerie.c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210523152937.Horde.5kC0kzvaP3No5BC63LlZ_A7@messagerie.c-s.fr>
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
Cc: rasmus.villemoes@prevas.dk, netdev@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 23, 2021 at 03:29:37PM +0200, Christophe Leroy wrote:
> YueHaibing <yuehaibing@huawei.com> a écrit :
> 
> > Issue identified with Coccinelle.
> > 
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  drivers/net/ethernet/freescale/ucc_geth.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/freescale/ucc_geth.c
> > b/drivers/net/ethernet/freescale/ucc_geth.c
> > index e0936510fa34..51206272cc25 100644
> > --- a/drivers/net/ethernet/freescale/ucc_geth.c
> > +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> > @@ -3590,10 +3590,10 @@ static int ucc_geth_probe(struct
> > platform_device* ofdev)
> >  	if ((ucc_num < 0) || (ucc_num > 7))
> >  		return -ENODEV;
> > 
> > -	ug_info = kmalloc(sizeof(*ug_info), GFP_KERNEL);
> > +	ug_info = kmemdup(&ugeth_primary_info, sizeof(*ug_info),
> > +			  GFP_KERNEL);
> 
> Can you keep that as a single line ? The tolerance is 100 chars per line now.

Networking prefers 80. If it fits a single 80 char line, please use a single line.
Otherwise please leave it as it is.

	   Andrew
