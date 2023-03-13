Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA36B7C00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 16:32:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb0y75Kytz3cP0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 02:31:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e83DPX06;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=michal.kubiak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e83DPX06;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb0N74lsHz3bfw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 02:05:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678719959; x=1710255959;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=B9mqIVDN2Fpim22qVR0a4Rr40jAx+13BYIOMBHce5/I=;
  b=e83DPX06093zaC9+W2t8/RSl2Ew1dri2IOVLa093hgGnWl5aMXUcmiVY
   bHNOwihzMOLslkwV4A9oUF7rca7CmSasio3S5iXVSUOfrHQX5KvyF+2tZ
   QGIWq3kyEtXPjQmaQJ2Kxv/3GcJzuv2u/gYS4uDlrZi1gUE0D0nJX6Jty
   mVTseGpwP9d5rDDsFVC+wpoJDPgHC7Bahqo8T5L5DlFxNly/wjNrgaDO+
   Mx00VmNI4XTVzP1KUfvwsi258iOF4jyBbnwYoPynjd5WEq6N9Tbjl9XXU
   hDCjNjd7G59C39b7C9VnsJbQIk02LhPJwLRkSzjrF3scugZv5syRB0WsM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321020369"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="321020369"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 08:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="708907368"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="708907368"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 13 Mar 2023 08:05:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 08:05:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 08:05:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 08:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlPNcLDaEaBK9kK+ysMcG7xikeVFvTL4XR+3lNoNvByRaEGaqKYBmDQrIpCGQEGbP7NDoW0L7SjEBiw9PxE4K9NgS5UiPzY+L5CW/av76oq4WOMkc2dCIJT8+VXuKAlU1c3pXRoBSdt9Lq7aAUxc11GTdvBMdkb35c0oMsulI1vys/3cp8as1eHsU+gM4QNmsagUiYWYHVtnAFAP3NUD76/jL2f83Lz4CTX06i0Yb6dgPsOoHHIKkWCIdbpKcozTFA5oXeKxBnOipE2KelKKEveN4+9Q0npKAQk3ANK/AwT3jT1Kaw5vaK2KotKkPSYuDnu/2E7oK7ISvWguObJDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7uISTt1BT5jZIrOjoNGp22BG40U4YVk1matBc1OfCI=;
 b=Nc67n63yor8Q3dtZC8+h7S1Ia5AiytAh2cat8+IsyJhvFzUVuPht1TSPFBXZF7nbdxyqA79pjO93sNQ9tU53BtYS1rULEhvZJ9Srt8LReyeH5+HiAOSuoysY/5VQRw/tXV6YgykaYkl4Di9Wx7fiPye3Ct3O2qmQeV+CPQs5mWl4iO8hvvNgTxXldSJ6KaHHoBeu9szK/MfLvVfOeLN1/CwGWBG2rFokCO4JdEGo1Qx5O6KQTdkKi2FISM8PUkW5GOW/SHfRYXsbAFgLNxRzdPpXXHG/HnfSWnVysAEKorR+HvGBsHltwUpS1kfTmhYqZTMfAK8lFXtEtBPxoA7Mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2937.namprd11.prod.outlook.com (2603:10b6:5:62::13) by
 CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 15:05:20 +0000
Received: from DM6PR11MB2937.namprd11.prod.outlook.com
 ([fe80::cece:5e80:b74f:9448]) by DM6PR11MB2937.namprd11.prod.outlook.com
 ([fe80::cece:5e80:b74f:9448%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 15:05:20 +0000
Date: Mon, 13 Mar 2023 16:05:04 +0100
From: Michal Kubiak <michal.kubiak@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH net-next 0/9] net: freescale: Convert to platform remove
 callback returning void
Message-ID: <ZA87oCdm1Qx63FJJ@localhost.localdomain>
References: <20230313103653.2753139-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313103653.2753139-1-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: LO4P123CA0477.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::14) To DM6PR11MB2937.namprd11.prod.outlook.com
 (2603:10b6:5:62::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2937:EE_|CH3PR11MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: c86f82ed-0b63-49a2-da59-08db23d45cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PQnDqfpWW4aolyaAIE4Q2J8NWOkA81CDYJVsVI4m7Yw/uVbtDlnzjc0Sny0AFZVVoA3yl+sZoSCf5CPP0ytE8NtVD958nQPPejuPdcSo7l7y4VYHjWMSKnnILi5d0csS8vVD/OkXbvCvr8Ls0VYTvfKwtqrTXc8xN1KRvuiMa0Nv6rTFU5KtUpDH3TAY9LamDOOenmceWavS0PepXb7QE6Yy/fMcsVxgR0E6tzPM3uDCXxBoNblBdxb/ZCiSBKU7ifYYco6nc4VZSisgl/lkVdUmmRovf4kRwgqUKgO2MhpYjGHkcfP2jmjghGWPGUDyKgUuzFpWoz4YRekLjVZZhnm1VpdUhOuk5Mv4ViT8HWq0iIRbLqPvvXdpgzVZaKc6Opso+qYKAy6q/W3je2INnPft09mWgZEVk4WUBMSRNvUG+RFSLmQ+uEEpT1etcZTaHK9LRnd30IU0mPAjazNSbywFyFGkbuTrRWg92D3i5zEKgtkGRMBZIvTzdZIrrVQkYxaL6BBKAtv6OgpC0vmblftboyHzGkNqBzKMWxcEl1tF3LAHaM/zeTZ+TALipCdiviOriv6+SYtJmGMTo6ydKvIB9srHj+TVRR0jjMOa3y9G08YQ0P+UNDoX28ulgwI4ryb+zB41OTsiikVipFofhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2937.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199018)(44832011)(5660300002)(7416002)(83380400001)(66574015)(478600001)(6666004)(6506007)(26005)(6512007)(6486002)(186003)(9686003)(6916009)(4326008)(66476007)(66946007)(41300700001)(8936002)(86362001)(8676002)(54906003)(38100700002)(66556008)(316002)(82960400001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cCvkZZPFdewedF+Up43D1Hyxv6Uk3rzpMPGEM9iAxwPGsVrdUcnGyf6bEa?=
 =?iso-8859-1?Q?mrZGGb/BDtHEj88SFFvjdrRZXhXKhn4l6Y+Qk5NoQ2tEtu1nQxtNT4gk5E?=
 =?iso-8859-1?Q?nSOzRm07RKVLV0V4i/LnNJyLpnmMuAhg+2OINGj6LP9WhsNyk/3HbYS/j6?=
 =?iso-8859-1?Q?hgKqq1FJgWp8tkeTDZrTAoJNeOZfBpo4ovENnVbwX1tbQom/S4W9zZyVJ3?=
 =?iso-8859-1?Q?ikpV8npu/1OsEFR54UfnpjjxRfnX6xgjahndp+5HGdwMHpxbf6I1JYBS8O?=
 =?iso-8859-1?Q?xPfTTxaSzMgAbzhKo7RJ+6PX/OIh+6HXBI1W4asQapxbPeqQ9L5ZCIfXqs?=
 =?iso-8859-1?Q?3+UH+jOSczexdOm9d2ChvTTW8Iqvj13raQpXzBu9J0rgTFU8s1bBvFK5un?=
 =?iso-8859-1?Q?UuMubM/eQQuKQuOI6Gk2FeiascM3cL05gYby1sT6ooCkjz8mOLKokwGOzs?=
 =?iso-8859-1?Q?mhp07PzBGBHKbNnIPccKzRgwO7MeNauJFwNodJgC5Xzy+ydjHK0WFmVEpF?=
 =?iso-8859-1?Q?dJDLGbzSm3m/dR39u5vQkiTxbzc5KN/xeYdTh5nvve/XUNJQT7rnwMpExH?=
 =?iso-8859-1?Q?HAtuQX9CGdYi0qPaqfRTGQKrlIBHflDifwNVAJBXWsTOGb8fidYOA3jMWA?=
 =?iso-8859-1?Q?viLfbWOorUng2fvLDmKF59cvFa0+ZM6sZyZft6dn3oQcHlCAo/oIow0q8k?=
 =?iso-8859-1?Q?M2eMHiiwQJisGSm139M2mWo8H09yIZWUsLH2CiYW8Yte+rdyF8OhdljrfR?=
 =?iso-8859-1?Q?OGIFy0Ue/BRxEvnZx5eDXgd4AbiXl31ljkBiS0ZXdrED/c6GJO+LPrSZE5?=
 =?iso-8859-1?Q?eEFOhqVqkO/FEjexCYM5myiaz7D9bv1J525Q6WwNmZCgN5RaUieVWdSiAr?=
 =?iso-8859-1?Q?j/9VSbmVrAzjhdD4dH7I+ZAStu1D/j0u8APJ/+1C8UUMAvaq7kghX4iYLz?=
 =?iso-8859-1?Q?mM+It9fiVZoA0qqdnuLlP0nWvqDZnz6bCZEu2+9sCXwhY2D/Guq8RLXps8?=
 =?iso-8859-1?Q?fr2AzQjHqG+oZVJcwSSWRTdYkiBdIycJCxdcPtBw1bGAopDwExiesoV2HV?=
 =?iso-8859-1?Q?iL5MehAYeFJO3vVT5U/CMrfOW0Hoe17+3uWVxsQQbq+Dm6Ton0L6xf9oLm?=
 =?iso-8859-1?Q?iCMrcMcTqYqP6OS4NiFudvjpLZ+2iMj0Q/ymjYukpSERqhrOCEUQZ6DZmZ?=
 =?iso-8859-1?Q?0WnoctiepdRZPLf3C4S+v54hbhw6mD6J/h7RwrYxNyY9f6fpfOj3x57AnD?=
 =?iso-8859-1?Q?BaLLCxQDNsCpLHp5Y86gV+hd7joI8xxnI2UzMJqhtrfurB92/SISkJbWiG?=
 =?iso-8859-1?Q?Ms0tZ3iufb+23GJJXYufbVX2lV+kV9f8D/dK/Hdx3u/IQ/QTrQISFKGNPO?=
 =?iso-8859-1?Q?huO4kFn5Acdo/B44VIBJDHnSWA8MP3NcLmPLTBaivLdzYELxgnOD+RD1k1?=
 =?iso-8859-1?Q?0kb/oTYhlVQxaizbFhxTPfaXoNXKBojWhZCQ6nl3uVoAxehaH+rC+ZOJee?=
 =?iso-8859-1?Q?gY60NNSRVGPNrBvQxSdiBBwfKS5a8RMzax5Dq4DO5kqnhpbo1rowrcrWiN?=
 =?iso-8859-1?Q?3OrWaPwgDZ4fnqnB4iAA15NoizZB6lpuow1OKioImVMX33aLE3qE6j6gf2?=
 =?iso-8859-1?Q?dHUEXubahfSRn8KKFoE/IAwmz4mq6zAno0l1qOSRWj0xHFES1ZqYtrGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c86f82ed-0b63-49a2-da59-08db23d45cb8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2937.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 15:05:20.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXihCn5XA55Q9dBuVWO3lUuriOpqHQVIntLA/utR0UFSg/vCD6JyNeQpi3tRahlh6FnFgnrhR80G1KKoXlafaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 14 Mar 2023 02:30:18 +1100
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
Cc: Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Russell King <linux@armlinux.org.uk>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Wei Fang <wei.fang@nxp.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, netdev@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Wolfram Sang <wsa@kernel.org>, Mark
 Brown <broonie@kernel.org>, kernel@pengutronix.de, Marc Kleine-Budde <mkl@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 13, 2023 at 11:36:44AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> this patch set converts the platform drivers below
> drivers/net/ethernet/freescale to the .remove_new() callback. Compared to the
> traditional .remove() this one returns void. This is a good thing because the
> driver core (mostly) ignores the return value and still removes the device
> binding. This is part of a bigger effort to convert all 2000+ platform
> drivers to this new callback to eventually change .remove() itself to
> return void.
> 
> The first two patches here are preparation, the following patches
> actually convert the drivers.
> 
> Best regards
> Uwe
> 

For entire series:
Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>

> Uwe Kleine-König (9):
>   net: dpaa: Improve error reporting
>   net: fec: Don't return early on error in .remove()
>   net: dpaa: Convert to platform remove callback returning void
>   net: fec: Convert to platform remove callback returning void
>   net: fman: Convert to platform remove callback returning void
>   net: fs_enet: Convert to platform remove callback returning void
>   net: fsl_pq_mdio: Convert to platform remove callback returning void
>   net: gianfar: Convert to platform remove callback returning void
>   net: ucc_geth: Convert to platform remove callback returning void
> 
>  drivers/net/ethernet/freescale/dpaa/dpaa_eth.c        |  8 ++++----
>  drivers/net/ethernet/freescale/fec_main.c             | 11 ++++-------
>  drivers/net/ethernet/freescale/fec_mpc52xx.c          |  6 ++----
>  drivers/net/ethernet/freescale/fec_mpc52xx_phy.c      |  6 ++----
>  drivers/net/ethernet/freescale/fman/mac.c             |  5 ++---
>  drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c |  5 ++---
>  drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c  |  6 ++----
>  drivers/net/ethernet/freescale/fs_enet/mii-fec.c      |  6 ++----
>  drivers/net/ethernet/freescale/fsl_pq_mdio.c          |  6 ++----
>  drivers/net/ethernet/freescale/gianfar.c              |  6 ++----
>  drivers/net/ethernet/freescale/ucc_geth.c             |  6 ++----
>  11 files changed, 26 insertions(+), 45 deletions(-)
> 
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> -- 
> 2.39.1
> 
