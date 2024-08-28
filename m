Return-Path: <linuxppc-dev+bounces-665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0BF962466
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0bQ6yfcz2yR9;
	Wed, 28 Aug 2024 20:12:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724839970;
	cv=none; b=DareQNKVslGpgCvSib7O60i0PVIIVO5NxLP5fcKUrbXh8lSVgvfCRELn55guCzFlzkovg74lbTO0MxdEkGDtPyBZc5lrOEbZ9famat3lHmLNDiuypMsrR7MUVDRuAfn5Yc1miYbKA9jaVwWaohjli5qt0FDYqYHQMnfrQ3rnsiTyhfi3EonULJXV+EPtrA1bSlyentxFuz8DN2FwGmaoB5R3HVB3Nxmp1AUjPS3PAWsF2/5KQ08tdjnxCnGA7uoXidARGV499oMDd8eYv93zpnrUv2dcpzjXzC40Kb6y9yVNHDrrjWYcpGF2FD2ifVuClZNVFyszPOTV6YE0p6hGng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724839970; c=relaxed/relaxed;
	bh=7zdGAqTEJwanqbX67Lw0UGFw93WnnS07acI9DriogNk=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=bLAODat2sLZgnj4Frf5JZPoK2IoxYrZQCtdRozsrpkPht67uLyBIafzovwaIjaIg12IYbFFQBvki6jAUVYl5FbGXSHSpmc836Pw6bdrHcSLuyutbhSOu0OoXywLfLXGUH61P11KR8lD+SXjoStxFAjSutMonbaEi0SCkFToaMp9iB+2rVJg1b2G3L+ahmLL9aCamhx/6dMyc+HXtJOSaPUjI/OpqafhSnxvQu08BsBtTxTKTt5L0PshwFBQvb32HKJyXtnphhN0H6xg1vGBXvqDqKbT9dJsrvH7nE+bOka8HYweHNogKj9E4QRUod5vZTuIEbbAZiyEm11WlbXhhag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0bQ4lm0z2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:12:50 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wv0bL5tmvz9sRy;
	Wed, 28 Aug 2024 12:12:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7nm2FoFxJLY; Wed, 28 Aug 2024 12:12:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wv0bL4szYz9sRs;
	Wed, 28 Aug 2024 12:12:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 93F5A8B78F;
	Wed, 28 Aug 2024 12:12:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gnorZT8uKGam; Wed, 28 Aug 2024 12:12:46 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 55FEA8B764;
	Wed, 28 Aug 2024 12:12:46 +0200 (CEST)
Message-ID: <27fc0052-c7d6-455b-933c-4b1dc6f4a95b@csgroup.eu>
Date: Wed, 28 Aug 2024 12:12:46 +0200
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
Subject: Re: [PATCH net-next 1/6] net: ethernet: fs_enet: convert to SPDX
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
 <20240828095103.132625-2-maxime.chevallier@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240828095103.132625-2-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/08/2024 à 11:50, Maxime Chevallier a écrit :
> The ENET driver has SPDX tags in the header files, but they were missing
> in the C files. Change the licence information to SPDX format.

AFAIK you have to CC linux-spdx@vger.kernel.org for this kind of change.

> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 5 +----
>   drivers/net/ethernet/freescale/fs_enet/mac-fcc.c      | 5 +----
>   drivers/net/ethernet/freescale/fs_enet/mac-fec.c      | 5 +----
>   drivers/net/ethernet/freescale/fs_enet/mac-scc.c      | 5 +----
>   drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c  | 5 +----
>   drivers/net/ethernet/freescale/fs_enet/mii-fec.c      | 5 +----
>   6 files changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> index cf392faa6105..5bfdd43ffdeb 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Combined Ethernet driver for Motorola MPC8xx and MPC82xx.
>    *
> @@ -9,10 +10,6 @@
>    *
>    * Heavily based on original FEC driver by Dan Malek <dan@embeddededge.com>
>    * and modifications by Joakim Tjernlund <joakim.tjernlund@lumentis.se>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>    */
>   
>   #include <linux/module.h>
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> index e2ffac9eb2ad..add062928d99 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * FCC driver for Motorola MPC82xx (PQ2).
>    *
> @@ -6,10 +7,6 @@
>    *
>    * 2005 (c) MontaVista Software, Inc.
>    * Vitaly Bordug <vbordug@ru.mvista.com>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>    */
>   
>   #include <linux/module.h>
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> index cdc89d83cf07..f75acb3b358f 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Freescale Ethernet controllers
>    *
> @@ -6,10 +7,6 @@
>    *
>    * 2005 (c) MontaVista Software, Inc.
>    * Vitaly Bordug <vbordug@ru.mvista.com>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>    */
>   
>   #include <linux/module.h>
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
> index 9e89ac2b6ce3..29ba0048396b 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Ethernet on Serial Communications Controller (SCC) driver for Motorola MPC8xx and MPC82xx.
>    *
> @@ -6,10 +7,6 @@
>    *
>    * 2005 (c) MontaVista Software, Inc.
>    * Vitaly Bordug <vbordug@ru.mvista.com>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>    */
>   
>   #include <linux/module.h>
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
> index f965a2329055..2e210a003558 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Combined Ethernet driver for Motorola MPC8xx and MPC82xx.
>    *
> @@ -6,10 +7,6 @@
>    *
>    * 2005 (c) MontaVista Software, Inc.
>    * Vitaly Bordug <vbordug@ru.mvista.com>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>    */
>   
>   #include <linux/module.h>
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> index 7bb69727952a..93d91e8ad0de 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Combined Ethernet driver for Motorola MPC8xx and MPC82xx.
>    *
> @@ -6,10 +7,6 @@
>    *
>    * 2005 (c) MontaVista Software, Inc.
>    * Vitaly Bordug <vbordug@ru.mvista.com>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>    */
>   
>   #include <linux/module.h>

