Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BE2EA39E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 04:04:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8y4v6sT7zDqYP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 14:03:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8y3P0SGFzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 14:02:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4D8y3N6v1bz9sVs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 14:02:40 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4D8y3N6MxGz9sVr; Tue,  5 Jan 2021 14:02:40 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
X-Greylist: delayed 1385 seconds by postgrey-1.36 at bilbo;
 Tue, 05 Jan 2021 14:02:40 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4D8y3N5KNnz9sVq;
 Tue,  5 Jan 2021 14:02:40 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kwcFr-00G4Zi-QU; Tue, 05 Jan 2021 03:39:27 +0100
Date: Tue, 5 Jan 2021 03:39:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] net: ethernet: fs_enet: Add missing MODULE_LICENSE
Message-ID: <X/PRX+RziaU3IJGi@lunn.ch>
References: <20210105022229.54601-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105022229.54601-1-mpe@ellerman.id.au>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, kuba@kernel.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 05, 2021 at 01:22:29PM +1100, Michael Ellerman wrote:
> Since commit 1d6cd3929360 ("modpost: turn missing MODULE_LICENSE()
> into error") the ppc32_allmodconfig build fails with:
> 
>   ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/freescale/fs_enet/mii-fec.o
>   ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/freescale/fs_enet/mii-bitbang.o
> 
> Add the missing MODULE_LICENSEs to fix the build. Both files include a
> copyright header indicating they are GPL v2.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c | 1 +
>  drivers/net/ethernet/freescale/fs_enet/mii-fec.c     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
> index c8e5d889bd81..76ac1a9eab58 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
> @@ -223,3 +223,4 @@ static struct platform_driver fs_enet_bb_mdio_driver = {
>  };
>  
>  module_platform_driver(fs_enet_bb_mdio_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> index 8b51ee142fa3..407c330b432f 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> @@ -224,3 +224,4 @@ static struct platform_driver fs_enet_fec_mdio_driver = {
>  };
>  
>  module_platform_driver(fs_enet_fec_mdio_driver);
> +MODULE_LICENSE("GPL v2");

Hi Michael

The use of "GPL v2" has been deprecated. Please use just "GPL". There
is a discussion about this here:

https://lore.kernel.org/patchwork/patch/1036331/

https://www.kernel.org/doc/html/latest/process/license-rules.html#id1

	Andrew
