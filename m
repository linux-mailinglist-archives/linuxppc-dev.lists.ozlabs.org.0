Return-Path: <linuxppc-dev+bounces-664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB535962455
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:10:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0XN3j1lz2y69;
	Wed, 28 Aug 2024 20:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724839812;
	cv=none; b=So0aZevIUe6jn26eJZkiR2j+Zl6OHKqf59I8sNvu5AqUMS8g0vXdUUbCtrVcxKkPWMgSktqrm+fYpnEOl/dxgn23D2HsKZdY2y2tlId1cfCaKfAUZNJa1Kmn7zjfg8GBdIkxbLmoY1l2h2MOwL0ZINyQwpIiVzqoPpo4MJGwReweuWYTCnQ3ac5DstGJPnDCqmGtPNGeqiGS1Tr735cEMjQL0FdXhI55q7X+XVW1ht/ztVL9HT+C3ld1o8/Gngr9sRJ20NCA/dTbG9GZJfq3C1bpqNCeHrJ20QgcRn2ziAUAbUl6M1BH/tnbAfkbZvf3UuMhBrhov4R1fp+q7GRC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724839812; c=relaxed/relaxed;
	bh=hN4Vbm6HlglRSR+0w4gWEJ+Qv9YRlOXezYb+TfxvnWE=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=MqwclH6Q16JOJK2QJaf6Ev/9j4+Bwx+nVwitJZOfVL3xI2pjUS+u1KhSis7iXHK14JNDby1AawEDA5us+OrzjaoA5r9W+wqDzYUxq+aUQDFYU1RiLs84C7ncRaA/yEHJil8vbXqp7i4hjpd376I0uDIem6uJnJ4hn1YZzoPaRGNCM2aWeEflFMaCp7cfyx1851KFDVN4zWV1Na1MHWiSy+y7ZDKklaugCCVPoYIdlG0+uuHUth8ycoS2zFtqrgndC6akbbWnKFiAT8jp2QfecSxfDyKrdquQlP+h5nJNLo0a4aG0SuO2LbiurkdPjecmUTWyCp2TfIikN7qRjJk5xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0XN1V4lz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:10:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wv0XJ0Rw7z9sRy;
	Wed, 28 Aug 2024 12:10:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXxXD9Qfz31u; Wed, 28 Aug 2024 12:10:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wv0XH6L39z9sRs;
	Wed, 28 Aug 2024 12:10:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C94CF8B78F;
	Wed, 28 Aug 2024 12:10:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aeC0cGDuV2bP; Wed, 28 Aug 2024 12:10:07 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 855978B764;
	Wed, 28 Aug 2024 12:10:07 +0200 (CEST)
Message-ID: <b8f628b9-91af-45fa-87f0-55abce9ba947@csgroup.eu>
Date: Wed, 28 Aug 2024 12:10:07 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/6] net: ethernet: fs_enet: Cleanup and phylink
 conversion
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Florian Fainelli
 <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Herve Codina <herve.codina@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/08/2024 à 11:50, Maxime Chevallier a écrit :
> This series aims at improving the fs_enet code and port it's PHY
> handling from direct phylib access to using phylink instead.
> 
> Although this driver is quite old, there are still some users out there,
> running an upstream kernel. The development I'm doing is on an MPC885
> device, which uses fs_enet, as well as a MPC866-based device.
> 
> The main motivation for that work is to eventually support ethernet interfaces
> that have more than one PHY attached to the MAC upstream, for which
> phylink might be a pre-requisite. That work isn't submitted yet, and the
> final solution might not even require phylink.
> 
> Regardless, I do believe that this series is relevant, as it does some
> cleanup to the driver, and having it use phylink brings some nice
> improvements as it simplifies the DT parsing, fixed-link handling and
> removes code in that driver that predates even phylib itself.
> 
> The series is structured in the following way :
> 
> - Patches 1 and 2 are cosmetic changes. The former converts the source
>    to SPDX, while the latter has fs_enet-main.c pass checkpatch. Patch 2 is
>    really not mandatory in this series, and I understand that this isn't
>    the easiest or most pleasant patch to review. OTOH, this allows
>    getting a clean checkpatch output for the main part of the driver.
> 
> - Patches 3, 4 and 5 drop some leftovers from back when the driver didn't
>    use phylib, and brings the use of phylib macros.
> 
> - Patch 6 is the actual phylink port, which also cleans the bits of code
>    that become irrelevant when using phylink.
> 
> Testing was done on an MPC866 and MPC885, any test on other platforms
> that use fs_enet are more than welcome.
> 
> Thanks,
> 
> Maxime
> 
> Maxime Chevallier (6):
>    net: ethernet: fs_enet: convert to SPDX
>    net: ethernet: fs_enet: cosmetic cleanups
>    net: ethernet: fs_enet: drop the .adjust_link custom fs_ops
>    net: ethernet: fs_enet: drop unused phy_info and mii_if_info
>    net: ethernet: fs_enet: fcc: use macros for speed and duplex values
>    net: ethernet: fs_enet: phylink conversion

For the series,

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu> # LINUX FOR 
POWERPC EMBEDDED PPC8XX AND PPC83XX

> 
>   .../net/ethernet/freescale/fs_enet/Kconfig    |   2 +-
>   .../ethernet/freescale/fs_enet/fs_enet-main.c | 421 ++++++++----------
>   .../net/ethernet/freescale/fs_enet/fs_enet.h  |  24 +-
>   .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  16 +-
>   .../net/ethernet/freescale/fs_enet/mac-fec.c  |  14 +-
>   .../net/ethernet/freescale/fs_enet/mac-scc.c  |  10 +-
>   .../ethernet/freescale/fs_enet/mii-bitbang.c  |   5 +-
>   .../net/ethernet/freescale/fs_enet/mii-fec.c  |   5 +-
>   8 files changed, 209 insertions(+), 288 deletions(-)
> 

