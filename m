Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8866B723A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 10:12:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZrWk3KNyz3cdR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 20:12:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Td5KyCXS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=nicolas.ferre@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Td5KyCXS;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Mon, 13 Mar 2023 20:11:12 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZrVm1xC1z2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 20:11:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678698672; x=1710234672;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YivqxS+zeFWZMfPdu5ClCSUPNAcBM+7zK7hLm2cpsW4=;
  b=Td5KyCXSlvcuki39ie2vsZiFnks6d2UfywIIO6JhPz9waan0k8toejLi
   I/gVK8YNpH8oi9LrNAArvmYnR0lhT40l6iCA/cehbVqMx35Avp1qRnW3F
   3AZLdOn/n+7xEfb5hYnOYsgpFraTAi65mrUXXY0/oWVyvkCR0VRhgQM80
   gMV8OW3VlIfWnhSUFdRVTPg93WNLwpbMX+cG1mRiQxi9COnn2IpcIpxfD
   3qonNPDKx68AWVlDphxCdHY5QpBzWvuNq8VMOgU9FXHHDZZNbX2zxLiDt
   DvAHOOKTV7VugSfvVGKeQO9rRu04jrHrDEQLASwZLkR5fxnl8cv+rbBhN
   w==;
X-IronPort-AV: E=Sophos;i="5.98,256,1673938800"; 
   d="scan'208";a="205062965"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Mar 2023 02:10:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 02:09:47 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 13 Mar 2023 02:09:40 -0700
Message-ID: <21d44d0b-05c0-1912-15de-a5c74d3ff4c6@microchip.com>
Date: Mon, 13 Mar 2023 10:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] net: Use of_property_read_bool() for boolean properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
	<linux-imx@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, "Giuseppe
 Cavallaro" <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Grygorii Strashko
	<grygorii.strashko@ti.com>, Francois Romieu <romieu@fr.zoreil.com>, "Michal
 Simek" <michal.simek@xilinx.com>, Zhao Qiang <qiang.zhao@nxp.com>, Kalle Valo
	<kvalo@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
References: <20230310144718.1544169-1-robh@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230310144718.1544169-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/03/2023 at 15:47, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/net/can/cc770/cc770_platform.c          | 12 ++++++------
>   drivers/net/ethernet/cadence/macb_main.c        |  2 +-

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

>   drivers/net/ethernet/davicom/dm9000.c           |  4 ++--

[..]

> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4990,7 +4990,7 @@ static int macb_probe(struct platform_device *pdev)
>                  bp->jumbo_max_len = macb_config->jumbo_max_len;
> 
>          bp->wol = 0;
> -       if (of_get_property(np, "magic-packet", NULL))
> +       if (of_property_read_bool(np, "magic-packet"))
>                  bp->wol |= MACB_WOL_HAS_MAGIC_PACKET;
>          device_set_wakeup_capable(&pdev->dev, bp->wol & MACB_WOL_HAS_MAGIC_PACKET);

[..]

-- 
Nicolas Ferre

