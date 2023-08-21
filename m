Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5708C783031
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 20:21:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P+9IiGtY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV15K1996z3c0X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 04:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P+9IiGtY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::627; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0627.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV14S17JXz2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 04:20:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9nFT5yAipUo1cZyIfarOfoPvu/W9Jz4EUmk/UzAI7ffMsy+AW8C+nCkU3Boq3l9DlRjpjLdFxUNa5XFCQwY39NIxlcYwEUQor6MAgx1E25IeqWTKU1iVUmGXV5Ei4BeWt4ZHz4N3S0VacKk9wBE04i9C7VxzUMqhFVRU5+4exPB7deW495tS3BMy2CfAGxX+Pa2vHmRZAqEtpP58o9dnNAAQ8ZHy7X4yWBBYhC+2+xaEwOsdZiKykuohM3aQINQCfywSsYYPvCxKpWduqH7x1TB7Ojr5kx2z478ipV14IHLJS/+vFwXxhDf1hMKuYhsCENERzggRXRY4q0ReEgeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4mR67aRFzoJG5nWD5NfUAQO8T9LGWaIzNiU4qdwidk=;
 b=mLAWDTqGvx4VQ/Gbxj/ULARod0FqRiLBWhozZY1M11z/+DvMGp/LreYimKbGl8U0J6Gq+hygZpZV5UneXQe5T905+VLOoit+zGiynQlS8TdwX8Pv8fkba1fWAL+WbTcNJEZDQgkXzS9nZM54fkyEHiqJj2CzF01iu6uV0O5c4O/jwxp/43dXZsDNqhoHQyx1DFMKjYCgk5BrZlZ9kBYFXlizD0AXNneIddtl7nXpnraZiJ0SSM+TZ7FNxDTbs6hDEdiIq492CxfKV/uqg/jCaRkXBdyLnFUbHeJqw8O3TIUXGMisS7XW0EkYBXse2vKfOCIMwdHtLKPtVLA0I2FzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4mR67aRFzoJG5nWD5NfUAQO8T9LGWaIzNiU4qdwidk=;
 b=P+9IiGtYMcnwrgCNO6bJcVBeVDStxcvwwHEFoQlbq8xZMTlb52WsDsvvk0F0FJfgK7TdUArP+G1nS/ZCshGZw8qyKTBqK0QqkLfBwvjuxkh5yfq48MZLzwnAJMsSRYKNQ8MglEmd/qcPx/KnZqb/dy2vXnLiCuA3rRa9IVXhUr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by DU2PR04MB9211.eurprd04.prod.outlook.com (2603:10a6:10:2fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 18:20:18 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:20:18 +0000
Date: Mon, 21 Aug 2023 21:20:14 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230821182014.m2ichx7wupfetdkr@skbuf>
References: <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
X-ClientProxiedBy: AM0PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::22) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|DU2PR04MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 4024fd72-3841-433c-b1b8-08dba273460e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  ViqmQLaw2ohV898wi0DnFXtE/U0nbS7PKG8isNIqSGN5qai2VEe9PiGS/kNmt6IDI4fnkf5PeTMRylQ1jviUe5mQD+Fy4/o5gUg0tGKCkRiVp1mEETiUy/pEop8gZFyM66hTEGOIrSMBLNJZc0LDuuDoW1G3jZkU8r4admBG8QO00zRjcfzFLZNbLYECoIgLHNg82erqFtptJvllLEwIf0J6OiOHJdTS3caeZCnWx0UaNwITm3el14X+rdy4MzL04XQRB7NLluV7VE4P/7+YIphEhArs6c7hw2TbawgvJ2NlZ6xMvW23R+Se1OvkImn9PvSkDHsoKJn87l/QyGpUUOTLKExLjjD31UWbrzik1Q/7GZvc0hRRDWBB5ZchYBu1hVtVFfX7ycrderDfaurKzcWQC3Td0VOH9S2xZaJS9VloNQEw6H8F7vcXyMGCuX+11mFs57eO9tMJMEkOMGWZy5u3AbyI468vBFm/pbUNwzW9snP211EmdBIilG+QkXfiKVzw4Mfo7/z6bRJEul5WZhDQ1sQwevD8GmZyjRlgboPAL98W80GIkxcCtUOU2crd
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(6636002)(66476007)(66556008)(316002)(9686003)(66946007)(6512007)(8676002)(8936002)(6862004)(4326008)(1076003)(33716001)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(558084003)(2906002)(7416002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?g3BtTanwI/gHdyvXNAF9g7nwgzNujfGwgzWol6cLjffQuOQADdqjL7EzmXt9?=
 =?us-ascii?Q?WsuoDkZAYb3cVEeRtFb2+Pv0dHD8PP18GF0yVWcTEyy0BPvqgpbS6fVypuGz?=
 =?us-ascii?Q?fobs2hMghc85P9SMHK6pzxZ7TiplokXC3P0Z6I2LU3U3XmcAWgD/ppe2c9WN?=
 =?us-ascii?Q?BCwI9DkV+d7vqE80KoX7xD4ea1h47V0457v0a76lHFX6XgL6z41cU7tBNaIG?=
 =?us-ascii?Q?uje70YnwLc2Uxbo/urlYsr+TZsp15UQ/NetOCp3NrCGONgq5S61e4Z9tNAJ/?=
 =?us-ascii?Q?22fDV9JoIUIc/DsZvRnC8M5vtK+MVplO/F/OGETlxRBFGnAI1uvp1m3sbeL5?=
 =?us-ascii?Q?VKaw8kKpOjOhU5C8LVAYZe2qkWRO13h7U5RM0UJxmnYI1HBBvNW5QQFjqy7I?=
 =?us-ascii?Q?P4ZErDzLM5tYdKhs4ep7KF/6OD+1VDJU0bFcxBQP9OI2/3tVthwdaoYP6B3M?=
 =?us-ascii?Q?bzH+ZKOq5+PF8I8mxenkDiC2llO0qfaRz7TuYe4Qtmbdc67udOaVUMIp2Rt5?=
 =?us-ascii?Q?BMSMNVLDKsotzFYzmI60pXyWEAHKwERJ0auThpb+mPeCzZmt62QFibSdc/2r?=
 =?us-ascii?Q?9IBW7wdSTmOq6kQnZ07fHnNdn3QlhJy60tIJx0E1tUNspA8Ze2Mh96Gv1T9G?=
 =?us-ascii?Q?WunR8EWIxjbsKwxkuvPY/42slyOdJfvb+i74rj4pHM0jnd1Ir4Izi/Qhlow0?=
 =?us-ascii?Q?InaJH39KzQMMFNwbM3T16jHFp+qmAsGxpEKiWsE4cFaPIagf1A1znzoaelkD?=
 =?us-ascii?Q?DNYfyDHqkqiNYHNgIKawfKsPYR21PgPXgxPeT4QDLsv5yuxSkB0sVGrGQEge?=
 =?us-ascii?Q?9ya0NACxj6+p6UtR8CmKhQUbGQGU4pbP5Olm9axmvkJWPaZaZ0vfA6iVSdCZ?=
 =?us-ascii?Q?ZXqeMO/MsQCTxofowiqJtWvpoyrFsxR297Bw7a33SnbWtwWo39sbAAhaGtZ0?=
 =?us-ascii?Q?V5QeWF7zVeVX4ZzbhRKkqCGMOtgWYlb4NrVELVw2WkqF+bq/ldeawXz0u+XK?=
 =?us-ascii?Q?UaclCp60nkqeo/al1scEr2b3B6FeswYMv7p/KDGYaaIlQYJZu9r41WIGsLeQ?=
 =?us-ascii?Q?5JvyK78Nxr+dLy5dmmOjgMabqQ01beQgoYHdnfu/sDMb5JLD2zMZlEOVThlV?=
 =?us-ascii?Q?xfN37O0GNZsWipYwp6asV6xaDSgEqBer0iMK3YDEdkMBZrE25Cjxe3jOe0Je?=
 =?us-ascii?Q?7vxoebpTskNeRfGXRG9vLQrgobh+7ANQtTYRBmrcgBxsaRBYpbOHU8mIxbE2?=
 =?us-ascii?Q?+xwr7cz47B0auaQBMyJ9KtKwwJNM3RK/2GTVLjqC+z6KwvyHVBK3PNUpYvTv?=
 =?us-ascii?Q?BJlz4b4C/HXtSe+sXf9En/Fekl4Pog+HDXtcLZGaekPr2hhmNVHV5IGQohjO?=
 =?us-ascii?Q?fPVJTF91DK+8I0AIQiI/UqI1kVKMW3gY8mKO4a1AKOExStAYnqzdEND+vtTt?=
 =?us-ascii?Q?n9tvuXeb7Xgvojo/Ni8GjSZu3q/hdL7qnvPHLP0QdFsFJc+IGfWPOisdnLOF?=
 =?us-ascii?Q?Z4vdPxKToIztiKdY8mfsZa/j/Yns+pWdcaosG6Codl8FO1lzKAqrrMn/KCwZ?=
 =?us-ascii?Q?lFRqQ78GQUOGoUHzSLLrxpQ3KvJd6IvBfJ/JgIn5qrZoRrOk8Je1ADqZkBxW?=
 =?us-ascii?Q?qA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4024fd72-3841-433c-b1b8-08dba273460e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:20:18.5177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erreE87w8Q30ozoDm8BOqGXnbs4weN3hhbQ5TqOYxaf6UsZsulLBhXfYqetD3J64c2zvfLMJZOvdMQk5OCcuZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9211
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
Cc: =?utf-8?B?RmVybuKUnMOtbmRleg==?= Rojas <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sean Anderson <sean.anderson@seco.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 21, 2023 at 09:13:49PM +0300, Ioana Ciornei wrote:
> > - We can have one compatible for each SoC, and determine the serdes
> >   based on the address. I would like to avoid this...
> 
> To me this really seems like a straightforward approach.

+1
