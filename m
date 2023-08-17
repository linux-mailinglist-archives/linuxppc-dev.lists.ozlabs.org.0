Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB777FC30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:36:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QePAFsPx;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QePAFsPx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVxl4xp7z3cWW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:36:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QePAFsPx;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QePAFsPx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.201.202; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02hn2202.outbound.protection.outlook.com [52.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVwm6rClz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:35:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/zy1sZVkAM4UScASUxrusCqqAg7tLIXLCUfVmcy30Q=;
 b=QePAFsPxcx1wBgNvhOO4U+hke8k+XE2cJ9Ec52mSnD4DG6YZt1ngDxLXaePtnbNzyeWF0BX4pY7S1ub6+rBvIVdKWp4jHFow+8ffaypeWaVgqj3XV8L4j5Pv3Vb+hD9kxf55HW0XIsoRg8ewKTVOWpGMoYQEGeMqJm9triZrn71ojSTIAPP7N9CBcBr2QKyRVwuTqqUtFBWKZ1giiSMAiHRnxq+/TGXT7jKFsoyMuUfWwPeCeaUGzW8fXjhMka233idJv3/5YoplqpdU/mdgB5vgBfuz/Z2CgQGPd4j7jRAzzD9ZhTTKTr7a6JMw+xmOxuPu+KAz2ai7YRE4Dd73Kw==
Received: from AM6P194CA0076.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::17)
 by DB3PR0302MB9111.eurprd03.prod.outlook.com (2603:10a6:10:42b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 16:34:57 +0000
Received: from VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::8b) by AM6P194CA0076.outlook.office365.com
 (2603:10a6:209:8f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Thu, 17 Aug 2023 16:34:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 VI1EUR05FT037.mail.protection.outlook.com (10.233.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.17 via Frontend Transport; Thu, 17 Aug 2023 16:34:57 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id C4D3520086FCA;
	Thu, 17 Aug 2023 16:34:56 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [104.47.13.53])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 08D5F2008006E;
	Thu, 17 Aug 2023 16:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHNCY9Neu/Zylek+AsSWMfenKmKaelIS5yvKmvfrCd3PYveQc7COsw2IB+YbTNxjwmps3f0VcN40sy91moRDR15Sth5jwwi5ojPt45xg85IdKfL4IDBd6t3qAkd1T8kpZNn3UDdP6bERv0iQwDG52mHENRGX6DNV//WKVIggbE5Vt4R7ae7Vcc9zmQn4CyTS8leY1l79O9Bg9CqPM7mMaA/rwLBHQjsKqR5J3lUXzqgQtzC7m3OS/O5bxMBGoPCH0dt3XsvBpxEcOHXgQGsyGfce9sZLaXyRXLi+KQVV3dFmo/5zY27/X21XHL1KZxfAboK7E86Gekcmte1rvefxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/zy1sZVkAM4UScASUxrusCqqAg7tLIXLCUfVmcy30Q=;
 b=ZcmgGcDp7xMUhquUYlLzHyKK2hPHvZdiHdTI2FMguISO+sL3odDdwNaxujZhh3MKbR5igQuIspcQ9azRaQgtilmX5C21JisdKRxnrNY0mkU2kxly9gzxVixOClQndM3L/U2p9ly441OOCzO9ciodF1hAB9JRBT2V0l8icOFxGuEYpIM1oL9NmqpZPhPikPQTyvCCXX+oQN+J2ncD+/0HHVRUhLZjmhjH7zVwXAw38m69HA5HdESQ75I20GtjT8OKgEqMxHpYjF0mlzItXXT45KPJDqmjyYnka8sqjVIo7wfDolao2GI7ImNL1ahYU3sZx6+ztZK5Rt8Viw5We1Yw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/zy1sZVkAM4UScASUxrusCqqAg7tLIXLCUfVmcy30Q=;
 b=QePAFsPxcx1wBgNvhOO4U+hke8k+XE2cJ9Ec52mSnD4DG6YZt1ngDxLXaePtnbNzyeWF0BX4pY7S1ub6+rBvIVdKWp4jHFow+8ffaypeWaVgqj3XV8L4j5Pv3Vb+hD9kxf55HW0XIsoRg8ewKTVOWpGMoYQEGeMqJm9triZrn71ojSTIAPP7N9CBcBr2QKyRVwuTqqUtFBWKZ1giiSMAiHRnxq+/TGXT7jKFsoyMuUfWwPeCeaUGzW8fXjhMka233idJv3/5YoplqpdU/mdgB5vgBfuz/Z2CgQGPd4j7jRAzzD9ZhTTKTr7a6JMw+xmOxuPu+KAz2ai7YRE4Dd73Kw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB8978.eurprd03.prod.outlook.com (2603:10a6:20b:5f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 16:34:50 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 16:34:49 +0000
Message-ID: <c2e136da-fcd3-78e6-ddd4-4f70dba7ff8d@seco.com>
Date: Thu, 17 Aug 2023 12:34:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH net-next] net: freescale: Remove unused declarations
Content-Language: en-US
To: Yue Haibing <yuehaibing@huawei.com>, madalin.bucur@nxp.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, pantelis.antoniou@gmail.com, camelia.groza@nxp.com,
 christophe.leroy@csgroup.eu
References: <20230817134159.38484-1-yuehaibing@huawei.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230817134159.38484-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0048.prod.exchangelabs.com (2603:10b6:208:23f::17)
 To DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB8978:EE_|VI1EUR05FT037:EE_|DB3PR0302MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 1534188d-1282-44e5-f3f4-08db9f3fe4ab
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  ZXjZpbmHQZQKd/Iiza5/N2Z4988gp2eQpoS4/4Zet6Oc8yol/pBc7nqhqROQdxjSWvAgUbXOTRZGDS2UAMywNFa59xK6FM+xeXCSW4JfgAz3yDDc5HQPbBDBFNDSaV3PxfW6xje/UwtYyerhmfnumJ0l7+gQdwxxx3h8eCjXTpS+P+z33viKcTXYkCN5D3AFRFL9+cdIVCjjELeZgxvpyPzPdoVc5qifeyHa0jei3/epwDUg9MysZEQwhLQL6ZV+NWM0bp36dFz1qiMo2ttMadHp+DeA3wQPIFSsPrY8xSEK0ERG/tXA9YL8uiZ7+DyCLX2YholkNO60shkK7DwUR/og0w/dX8uuwMjB8KSB/TDxz8w7YwpeNzq55mfjXvkGZcLTOdcOcPqXamH7bVkNDBooamjlqb7nG5itZyDbPzWU7Oh6b+reiBIwEa8XjyAagt7q7W7R1u03gbsmvQn3+WJ5pNFXy6trN8oUcfcD/Lf/jx8Q9W7w3qtzaa3QnbknZ5I3WoLlRF9eUHQqOkjNLJ2Y1okt4PqB4y5B/Fxtt509TNtzKtQwSpPBbauo/MM07R8WcV54DboHaf6Fy87Pn4Z4pKxp8iTi9VwkOycqsChClYI7cy2HIQsLUO7W65Y7DmvsGh+V+yaosmpu/rMq+LwiKP8JCHWmE6ZmfZbRzT6k/4Pxh+hjUbG6bu2Vrc1B
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39850400004)(451199024)(1800799009)(186009)(31686004)(86362001)(31696002)(36756003)(38350700002)(38100700002)(2616005)(5660300002)(44832011)(66556008)(478600001)(6506007)(66946007)(66476007)(53546011)(6666004)(6486002)(316002)(52116002)(26005)(6512007)(4326008)(8676002)(41300700001)(8936002)(7416002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8978
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	3e5577e0-5a68-4f83-c19e-08db9f3fe032
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	03KPA2yz1bgg1FqXswpiT6xAkOlJlGmHOTZTVQGokOK+l7aC97WhhV1yxtcUlbtQy123V3OkCBzlGR4/3ZPHdost60mC+N/h6PkzU6Ao4Sp0NnMdecUe3KaVVWN/yFR7ZNni2d39aHq+ogRR12Ad0in9XZIQwoeelBGGkMutX1mhN6SPnttVqp5+arM22a/3pbkyhYeULs1wJwfZ6g4kP/z8tQcc8OWNrSUG0s7yNQSkpyqIRRFociP/HtjbO9lc5i2eD6YgBdnnPc5PhdCa8WQDoSp9j2eZ9uN+JG/V6f/mrwf3SRVJVPHcYpmMP67W7D8YpUREV71RRNDLAZfCspds8MAEy37fa77rog28DzuUOiyVrRfb5J7Z0e03Fw4FzmK2svoP/4RbVH/24C/wJYgfdA9ELLrVoLrkTIYefg+SFPSlZeYq7DIuiGtlDFq6YXBNzgds9hySLezKyEzOwyYB5UzjaA/4cQV+eiqc5u5vFYUoSL4FiMXmQK44Uz72iBVj8d8cCCJ3lOXxquRhAVijSNg++j02QtvtszuuyTTk4n2eLY5rNoilN8CsDJWzsCZE5fLu7FAHNSu1xtEJ/rbA+2T3YRRMOJ9vh5I0zvVOTskAmHZJ2teGaZM5vZSkLWJw9P1rs0fDCK03ifzOgj1KWdCqQvsbYUFscun2sOM/etjPPYfBuY7FrfbGiyH6LdAS73jpSIhpT5u5smkdo5nFH0lorrKO7NrLAfDiFFEXdThS6qG+hKBEQhE8x72ULq2gNofoNATD8CSfZdShv7Jtmyrvvgo2flT9f8GE7vg=
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(346002)(376002)(39840400004)(136003)(396003)(5400799018)(451199024)(1800799009)(82310400011)(186009)(36840700001)(46966006)(31686004)(36756003)(86362001)(31696002)(7596003)(356005)(7636003)(40480700001)(478600001)(2616005)(5660300002)(44832011)(70586007)(70206006)(53546011)(6666004)(6506007)(6486002)(316002)(6512007)(26005)(41300700001)(8936002)(4326008)(8676002)(34070700002)(36860700001)(47076005)(83380400001)(2906002)(336012)(7416002)(43740500002)(12100799039);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:34:57.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1534188d-1282-44e5-f3f4-08db9f3fe4ab
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9111
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/17/23 09:41, Yue Haibing wrote:
> Commit 5d93cfcf7360 ("net: dpaa: Convert to phylink") removed
> fman_set_mac_active_pause()/fman_get_pause_cfg() but not declarations.
> Commit 48257c4f168e ("Add fs_enet ethernet network driver, for several
> embedded platforms.") declared but never implemented
> fs_enet_platform_init() and fs_enet_platform_cleanup().
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/freescale/fman/mac.h        | 4 ----
>  drivers/net/ethernet/freescale/fs_enet/fs_enet.h | 5 -----
>  2 files changed, 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fman/mac.h b/drivers/net/ethernet/freescale/fman/mac.h
> index ad06f8d7924b..fe747915cc73 100644
> --- a/drivers/net/ethernet/freescale/fman/mac.h
> +++ b/drivers/net/ethernet/freescale/fman/mac.h
> @@ -68,10 +68,6 @@ struct dpaa_eth_data {
>  
>  extern const char	*mac_driver_description;
>  
> -int fman_set_mac_active_pause(struct mac_device *mac_dev, bool rx, bool tx);
> -
> -void fman_get_pause_cfg(struct mac_device *mac_dev, bool *rx_pause,
> -			bool *tx_pause);
>  int fman_set_multi(struct net_device *net_dev, struct mac_device *mac_dev);
>  
>  #endif	/* __MAC_H */
> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> index d371072fff60..759bb7080e22 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> @@ -208,11 +208,6 @@ void fs_cleanup_bds(struct net_device *dev);
>  #define DRV_MODULE_NAME		"fs_enet"
>  #define PFX DRV_MODULE_NAME	": "
>  
> -/***************************************************************************/
> -
> -int fs_enet_platform_init(void);
> -void fs_enet_platform_cleanup(void);
> -
>  /***************************************************************************/
>  /* buffer descriptor access macros */
>  

Reviewed-by: Sean Anderson <sean.anderson@seco.com>
