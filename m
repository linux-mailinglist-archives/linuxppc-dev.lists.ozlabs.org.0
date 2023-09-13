Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564779F493
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:03:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TC8iZr1V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmDwv3stBz3cnX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 08:03:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TC8iZr1V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe02::604; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on0604.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmDvx0wflz2xm6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 08:02:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGgwN3bZT2nvdwHiHVQq4qSS3+SZ7wCU3pQIFRhh/gI863gcV7Pmmo5lA6bsCBjd1xBwCy3bGGG4YeONkYqKzR2yGAwPZxhtsuLDQ06maXDpWZVMR/Ja/SXtnX0IMKRyIore121k+JYWnczr94WOLTpe6457Mrgsbp9clE8nVnGMCnupDykpvSth9qP6x9x7wP9Gz3OAMpUJQ9YfkiLATaEDajMJghV8061XkCxb/gqhfy/jIxQaXaOLh5zqSXIGe73lQl/nggIm4lXR4zD6GBf3/JvZL0/IsvnKWzQDnpivtZ4a1N0KK1qrb41R+uRuo7Ued0Xm/zIWR6OpkXp7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbMzda2NQ1JzH3Btrwq0WIO/fngxccAjDf6vA+aD57Y=;
 b=M9ShVZeVp99gxeHh1AMh9ehAOgqF0dX6cUReHZe4yz97CCJIi9fw3lJGZDYqxdvN4EAQQbovojm7VSV2Br0il9rrnFSa8+3Bc4merGYcjFGIT21tkjCUVW5dj4jUmSB84UPs969d5venAh+/HHKdAe4FyBwdUPjZwoP5M5WeHWCNr95GZgYLIPtWUTH9dDyeD2IjFWkEEbldWhICRhZ8QzC6WnvlcCqUNGpdOyXR1ezfhPwEXkHjADY9jIrxoHnXJxAl9FrQr2A+G96aZ43x6bA7tniT5YgztoCnVlpbvtHSbVKXPkbM+YDlDHQU8UhMNwIKfa4vHIHIDd0kQQlHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbMzda2NQ1JzH3Btrwq0WIO/fngxccAjDf6vA+aD57Y=;
 b=TC8iZr1VhrGHm95bqAG4CcF2O1XwG5BB/rUrxc07oCm6IJaFfFSQIx7wq2acfZP556K5xL30S7qPREf95nWrJ1nINwlqc5tYQHAlEvWVYalCTP5Rf0Tp6unV7voseVYslGYICUSZma+AxmM5L6pG+qO2WF1t9xV/HPq0IaiHLGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Wed, 13 Sep
 2023 22:02:11 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::568a:57ee:35b5:e454]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::568a:57ee:35b5:e454%3]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 22:02:11 +0000
Date: Thu, 14 Sep 2023 01:02:06 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230913220206.ht66go3bmaqvp2r5@skbuf>
References: <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230810102631.bvozjer3t67r67iy@skbuf>
 <b1df425f-1ea4-0465-674c-25f3ed9b73d4@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1df425f-1ea4-0465-674c-25f3ed9b73d4@seco.com>
X-ClientProxiedBy: AS4P190CA0068.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::28) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|PA4PR04MB9366:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc96ce8-4a98-40ee-817c-08dbb4a514a8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  HEY3lbNzjEbtgniOXLgwH2j4j5pY/dzrGVgV5qljbT5Zl9153Ld3eUO+Js5tW2Wzfx0iSY859G0clxJ4Wt/YN0XR0qzeLtc+l9cFc1fZpc1OW7ChCxponvZtKCxzaChMu9izaB3AlkxzGQXChCeGQv1+KMqSBIFf+4cRTZM2vxb4rRJfCWEf+//o3nG2IJyQdrXSrzOSA7RAPFWh0ZpEEMrIjsFKPFqryBgz4hyf9ME+240FSIKfkjozXkOiX3IRDZVeZqjc8oToh7+SlznmUHj9kitLMlDckUe/Ezw23ONFNvnXxBaQecADDQVKMUJIMtYzQDfibu1Bi0daxQFxuAHaDe1RJKmej0R9gHjxmglRkkpRXyfn5dXMZdInuJo0OvWqa2n3yADt0Rltt2gGiTLXsKwq9RJAkYrhz60I3YRwCR+uv+8yY2S76lyEjG4d59PpD+bvhB0pu/awS9oLJM4j5iYkqPqalE+56T3f9asdrFdidrRndhL4YcC65NXhLtLxJxuFQ5lCNjmkOk1ukMgP/DtaXWzfHuR/pNN6QRI=
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(1800799009)(186009)(451199024)(6486002)(6506007)(6512007)(9686003)(6666004)(83380400001)(86362001)(33716001)(38100700002)(1076003)(26005)(44832011)(54906003)(7416002)(66556008)(66476007)(6916009)(41300700001)(316002)(66946007)(2906002)(8936002)(4326008)(8676002)(966005)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?LabR4Dopp/SGYX9L4Zg4esSLwVUSlGrznrlcezHGiqwvc1bcpWdbfCELqFGX?=
 =?us-ascii?Q?svWmYyQxVTNauVgxOjfGXNJhEJ4WeOozoShs1AakQaRDH4H55GMkHYDtp/r2?=
 =?us-ascii?Q?LtgKCujxykT15Oh+rNM7LaRyCvClNJQnChLNV6LQqkALk60LSLgVbpmCreJZ?=
 =?us-ascii?Q?cBPCYelwWonbuKYZ9EcCNeUOpVjqEPlCxbQjdIV6QClFVbawmwWN2BnqhxYH?=
 =?us-ascii?Q?g4/uDD6WYxOAl+19FJz+HfBoRVyQdbP6uO46lVaLrR+Pc8+XY/AnwymRENlp?=
 =?us-ascii?Q?8XFBt7fFb/mq+/dgMW6pv/RqJHoixTGj6CLffV7RxIfuyewc5q1wycMqaFWr?=
 =?us-ascii?Q?R8yrrV+OfZvU54/h9tU0EBionlIag7UL1umrYKwcFpozC6QyxpVinyYLba+v?=
 =?us-ascii?Q?XyJy92R4uieaju4cDE2O/DHzW09H78wFNHzC9f6i2pAG5wnQaJl+d7Ew7GG6?=
 =?us-ascii?Q?T1Afmk45ThcztXvSnan3HoPc2qnkmNbSEZ0pB2lZX/ul1KO/n0otL1hYqHow?=
 =?us-ascii?Q?1KlxAVjbzP0Un3MvBnS++onyY5IDllTWyyYFeHDM5+gRza2CctB5JyvdcOQI?=
 =?us-ascii?Q?tzL9wYD8Piuj1RALppQ7YscTzqwsSWGLqmn1lyL8R/AI3XxqqqSfvSXNdMsV?=
 =?us-ascii?Q?DVHmLC+o52cTv5x4njxqd0s+54jRyVL8Q4YlRSfbEyQYqAj2YUb4zJGQu17I?=
 =?us-ascii?Q?nv+N7R5K5XB0mQn8N68HnBR8wcaOwAjhSuC8wiZA4urdyHQPFTpP+Npp2EZ/?=
 =?us-ascii?Q?rOI+ZMAj6peetRvoi0u6Nkgvspspnj5UGA/ucNaLaUWa7aw/PA/fxRC3XGGP?=
 =?us-ascii?Q?+FLD8J2Wb/X2gTZ1RMwnLeFC3GXblli0stooOLiJM/HK1lM1Wr0cFh88FZoN?=
 =?us-ascii?Q?46b1nQ+upa0xmf8Mg3g5zeYNvOhfgoPX870KB6m6TQ0s1T17zd+UR29XadEM?=
 =?us-ascii?Q?gRUMhuhqeutBXYB0uI8+rvjqxE+htSsTBU9lNtwReMfMyzJaaqbLetkG8jLy?=
 =?us-ascii?Q?yXIG6byIBkq4/rcOXllemSvM6E8YTaOFQa3eQ7+gzj79S7N1ll/Asv/slKSE?=
 =?us-ascii?Q?Tp4wiEkNc/z/d2xtzgJz0ch3JVpzQj7dT6Mhqo98swx+0A+5G6xf7WiGgsVG?=
 =?us-ascii?Q?AyyLp8kDFSG+lXxrub0T546Bfv7ofcf9PqhKbljnP0wyXg1udB4C6Q5hqDfa?=
 =?us-ascii?Q?sdJ3jBDiqRJBigMSZ/etgD/Hi9ALNQ7tXG7Htk9sgj2hI0kbK/vmAStV1d9f?=
 =?us-ascii?Q?rgHJhVeQwUNgkupJqjrHMBYqaSzKIahNNmQdJavp00r5ZZadHfHTtThvDXPt?=
 =?us-ascii?Q?lz0fy9OcoDZMoxWejiKIch7WHuqYtCgzV5bWsGxwfmpyM54OgiZBLCa7eARV?=
 =?us-ascii?Q?WNu79PCJns4sfcWTReZg+NyBs9atg5q8Ey1EIKC8ngLGBIFIJe1uQhM81rbd?=
 =?us-ascii?Q?fcqJTDp4SS8iww6p0PkswGj5D5f3vB8z+1DH6raHupAwwpJ5aWYcJKCCsrih?=
 =?us-ascii?Q?MFmfi73mbQMvS2LKjVwia/Cv4LmeeIoWcNmg51xhSdkWqWLkd0bXmZjQcpyo?=
 =?us-ascii?Q?Yirs2biIjDDS4ytASmiNIcA2RfT6Z6mekh2qIsM2hqSI8NoXSah8dF2DX2rm?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc96ce8-4a98-40ee-817c-08dbb4a514a8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:02:11.4900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ofDbZiMr5gOXKhLXWv7w6zOT+zfsWSfmdStNCesBAyo3FsdNy067Tb3OFsAyrDXEQidrS+t5kacqcwn/XIlUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9366
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
Cc: =?utf-8?B?RmVybuKUnMOtbmRleg==?= Rojas <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

On Thu, Aug 10, 2023 at 03:58:36PM -0400, Sean Anderson wrote:
> I can look into doing this. It will be in my free time, so it will
> likely be a bit before I can update this series.

I was expecting you'd ask some clarification questions about the RCW
override procedure that I've informally described over email, so I guess
you haven't spent any more time on this.

I'm letting you know that very soon, I will have to start my work on
porting the backplane driver posted here:
https://patchwork.kernel.org/project/netdevbpf/cover/20230817150644.3605105-1-vladimir.oltean@nxp.com/
to the Lynx 10G SoCs. And for that, I need a SerDes driver as a base :)

I was wondering how inclined are you to respond positively to the
feedback that the lynx-10g driver should have a look and feel as close
as possible to lynx-28g, given that they're very similar.

Because internally within NXP, we do have a version of the lynx-10g
driver which is contemporary with lynx-28g from mainline, but we didn't
publish it because protocol changes didn't work (for the same reason
that they don't work with your driver). With that driver, you can think
of the feedback about the similar look and feel as being "implicitly applied"
(being written by the same author), so I'm starting to consider more and
more seriously the option of basing my work on that instead of your v14
(on which I'd need to spend extra time to modify the dt-bindings with PCCRs,
concept of lane groups, concept of PLL CCF driver, etc).

What are your thoughts?
