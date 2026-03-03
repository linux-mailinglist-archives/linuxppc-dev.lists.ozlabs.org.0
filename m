Return-Path: <linuxppc-dev+bounces-17619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDiyNPIlp2k3fAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:18:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE8A1F526E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:18:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQPDt5bxNz3bnr;
	Wed, 04 Mar 2026 05:18:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772561902;
	cv=pass; b=MY7etO/CtgF7ZLDl6WkH0w9kMXWu4E3o0WD1GIJ60ELL2mylTmahawFEus8AIKD3cEzlKQd5GtP1Bz8yEaOHOjTQqLbd9Wi/uBiA79JNPXw1kh6EA+W5YUbNTUbDGUR+1/WKJeRx6GhERoFmu3XZyX61DwflpPOIcMiis8kZyDxBQATJN26T9bqcbCM4HCfMxlFR6gZtU/WbDtjWUVlH0ragykz9A4z9VLFW900cJH/AQbY4yOFOtokOX0f2qHEbug4TNIpdp+0WAdAZRF86QIzEwuyv7fL473EhKYzjUgikHDO6rEcpZZ8GW4/vUUtvfdwUxb7jk4o5wEhlcOnn+w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772561902; c=relaxed/relaxed;
	bh=apViz8xjOxQ9VkZWmDYI5MdLZNluK0TbM6LPgUK0x3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pi3VZBybOsV5FR0l1v8P812j1EuE0K0fm0k7njHOebThPsXbPe4n/6vKSv7m/1vEUQNyhpR0tHxEb9bbYKmRJe70GR7pSUYiHDadUps73zfh+QOjy1/lX+1OkYrcbi8hBSe5/0pO21GUEwKsAkN+xDs+H+xMRyGlCHMlUGDk/DaozchUWgaWeDfEzrL4GMD9dxLGHrOgJYPnzxzuNLU1sXIJWwzTQp626h/Mla8iOILZirasz2/cc4Xud7xfgNHGnj5nvmWrTyzP77+zUOuNI0IEcRphl5YvqWyvJ8zvmbBfEW5+U+pucEAcOe3MfijlqTx5Sx8Rfg4MRZ9o2Qg3bA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OEwQigU+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OEwQigU+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQPDr2hYVz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 05:18:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnxuftgSEWCI2v8ybeeYF92YOnrbLX0xhU3tC8abOUtNHUEFHO4UsCW9B8mw2k/aULunOzoQQMDWHa8PYNmqyEQN2DUzdVZBmSqeQhs+KfBlfwwiAs3WTxEovXJsgK8DLPFIm6i2Idnfhi+idM5hIylJpbJdIxFwuGZ0o2fZmvfw+/wXmtv2HCIeejf7/J2oHKJtWZwdXgLhYfyHRX5ptmsJYFdL2c9DHiw54NdGeBmItHnFPkreuvO2LVgPlN9eovCNvXi3GAgBo/xMyu3w6ob5DtduRmVpDIQxqgv32EW9anefRvV7+/mB9btvj3kuvq6T43/smIH6/Q01Rt2Niw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apViz8xjOxQ9VkZWmDYI5MdLZNluK0TbM6LPgUK0x3Q=;
 b=pkx78tnqx+P/Z+dKW+RgZBcQW63Fa99pMMsSCMtE80KR/mexBGI9RSHEQ3EYj/Ctuh5rti4q+R3G3xgtkTtIH9mr6bjWREgNNp9co1J8wNVx74ZxoonUAMIbdDSuS0w+2tV4yAol6Ll1g6x3o+TPFTsyjm6glBzKk/rCxzFGXeTfbzwHylIk4kE0xqOo1eub9g44r0nGlR0IFbjXXowc8eg7ZrVMJjaQIgZq97Hn03ChZPQ8U/M33s8OK+Q3R+HQ8xvgeDo2Vr0xOjXdXAHbWZNBC2Ja37c8mCYSOG7TOMT9ekQi0mAfb0h0stmssLZ/j50MOJ3CZpJAY7BxBGcqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apViz8xjOxQ9VkZWmDYI5MdLZNluK0TbM6LPgUK0x3Q=;
 b=OEwQigU+UNobpscs6xF0BwpK4Scb2gSr7yQpOWY/CfOLm1Hof1eBtfMkJHH+9+3VaeOkRkqwD4AGuQmWp284SqTxjRv8A2m1J0ymrO9t3+hzYZKKXpkhwX3i+njjywEnx1xgOMFtDSao4WbmZnWI7ZJElp7me2Msx7EUBiuEprv+7XvPXWpaCXJXIhE5v5NolKBG8phn2ZBWHrRwHDYiQzHCWqBMr9i4Eytl2qc6NCM2QOpftQyWfe/4Mye7wHyV3iBbxWQp7mp6pG5dWn3BJh1SP48XJ4UZq7z+NQoGFY6JnUvQUdGL7pkRtFrUfyizURcjJ9GzJVgLaOzmZB7UGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Tue, 3 Mar
 2026 18:17:48 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 18:17:48 +0000
Date: Tue, 3 Mar 2026 13:17:46 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>, Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>, Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 00/12] cleanup bitmaps printing in sysfs
Message-ID: <aaclsPYLPdb0mSW2@yury>
References: <20260219181407.290201-1-ynorov@nvidia.com>
 <20260219114120.0f4408f7@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219114120.0f4408f7@kernel.org>
X-ClientProxiedBy: BN9PR03CA0797.namprd03.prod.outlook.com
 (2603:10b6:408:13f::22) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: b399f740-90e5-473e-dda6-08de79512c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	h+kkDBGxURwJ8aJPm8i/9NV7AHrRQ0H0tpRXGUmb+SsXyObjRDMx4u3G2NVyz5EzP9EnBOi0YzkfCRYPyTgj8H3GtKma1tcMs/arL2hK1soloxH8vyWAPiJWasgaqXCvSLCNqz3k/eb6bdFtqJNBcur5YSLmm19TvrM36RW4dLjuZ5Z+yjBd9t0IAzMJT+PeAFTRh0wJ3W20O9+D5wycg4I9mABhNYEDR8ehpha/xuDqJwC2gvYPm5BJCHoeE0DF/L4kt4OvpM7b6n7LRVrESJeYD3284b+VeAu3//n9ejwUqfJj8RWJuWaj5lABlT69j8qQmHolaMYppExWbOkN0puJOpDb12OCA0dCgDmWOhOWMuJVRMZayG7KF11Lr/g1YHcohco69Pr84bTI7C2+8y2Al8m7kNb7d/ZOu9vm53KzP2vcXwUSvzQPatJrFwT2jBy0J1AIbiYMpK0UIx+Ca+6kU5Fokll4GaEeVvh6Vlp4N+P0qwfaDhfhG0359MuYSJ/LwvSa+ZCtZJIu7MXHDcH6gXjYJLqaRYWzE0n+blSPIlZoAN5s/7kBGkGyiIutiQmzAz6/HrjxowchjitDZVYxMvRDOMPCjhpeW2tGFv3QbMtMiqkVuGvcSqQEMVtBWqX1xK9CRtjwiJoFYZLyNw74LjQkUHLTeSnhrQ4OaD9l/RuSk3dyn0qKhiXuRZBttm4LyawFcV/B+g7gFJpj8Yasa47oiXJlzYTyfZNGLtQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bq+/kUd6LZmdnxICiDgmQMGWuUGFWn8tu+0nQipNHLqDDa75B9Hbms1CEhAI?=
 =?us-ascii?Q?mTfv9ZaBJ3ks1tmIL15+CPJrciD1choeYxgmsJYQVbJ3QiKdjKMsgsDkBWHC?=
 =?us-ascii?Q?Ul3K45UR2oLXl1y7/F6JiTeFNw0tncAxJZDsXFeqfIE/T2l3ukENtqG+G1ez?=
 =?us-ascii?Q?iifFLhQk09yqUQSamj2z3UUJ+eQo4E3plAiDvOvYVPQM8IsFQvRH7uUHvd1E?=
 =?us-ascii?Q?cbR2QtS9QjuwFFb5vnniippkyWQiDceq4YIDaBybTRcnzihySz9hHR1Iu6sK?=
 =?us-ascii?Q?YFMFsFJ5BNP7cgyuAc9kG9TZb8w+2J7MjmXb8DFJahbsEckHjjc+cw66vLSs?=
 =?us-ascii?Q?r6OTfqAC7IQN4/B81/u0ORatHFp8x1y8MXsSTN/TUVgr54VogVuOf4fUI1YK?=
 =?us-ascii?Q?zAcmk3S2222qoSZJlHlkVW4EOOVVzQ660GPwV5WfMBBjysOS27w1QiGxyIfS?=
 =?us-ascii?Q?cM0ZTFAcAeRBpFVfIru+X9ysbE+cJ/fT/O7lmmuYTDci0w+ASxFgwAPsmzAx?=
 =?us-ascii?Q?a9XXm8FIpld0JSQg5o0xes8arVzy25/lmb3JKlBtP15M/R/IPPgcy9gwOAE6?=
 =?us-ascii?Q?0NANEneYas/FtaVU+NBw/BGa+ZJxbwMx+Z3kNpjE8oK3lnGhfEQ88bP+4wcb?=
 =?us-ascii?Q?YFJ59eOUgCsglceN8clywar0mIZNdbhnseHfKK4jP+C52eE7c7nspiJDhXwh?=
 =?us-ascii?Q?1tWyqZX39kVxFsbKkGG1E3Ce9vfSUCVwpZJE9IWXwoBFI1ElFw4fRjMG6uqN?=
 =?us-ascii?Q?TvTKFeyLHMaCggm/YQRrhqa2giL1dLXblitpZLbnAZ3l9BlZHhX6JtqpfDT3?=
 =?us-ascii?Q?+Y0EuwAX3UevQAVbIsP8XurFhPsDsFhAF8voBiRMQRzSIoiu/zxiEOdn4G2N?=
 =?us-ascii?Q?kpAIb7XZD9OX7KAyZ4XBcb4j7W413gFhtpq7Z2yGUSw1mPIhpqrirLqad46E?=
 =?us-ascii?Q?1Ck3qq4xU/g9ggygRWxtPos/cHwahEZDa3ITkmhkROOmEan2i2OEdH59V12U?=
 =?us-ascii?Q?0JcT//kj4FD+nOo+bxiao/I71kd6b1VSfsY7loUXqNFyt035UrdvFOh8aoIH?=
 =?us-ascii?Q?BJ03yLabinMG6uVo4huAAV0VKw9VTfcMyR1F7x1iGCWYz4BgHErEMxOPYNY7?=
 =?us-ascii?Q?75amDl7ZW8HFO191dJknIQRCxf388q7ZXIDryi+B8c3CmhS1+GUSL/jekAL3?=
 =?us-ascii?Q?M6iG45fA1IsSlS1dwwbc6pUhMv0w9VSFNEA7bGBY14CO0NbKfy34DQl1qqKH?=
 =?us-ascii?Q?g3K1EI68bY0nVV0A5Zc+hdHQ1V+uTrJ67eYq5Mq3+HEbFWKTmMzpNfoj6z3g?=
 =?us-ascii?Q?UFYAMLq1Fk6pnTCtmvzoqJw8A2JDFyQgBLjlw1AMj3qAqv+gFNQWOKZHPZhx?=
 =?us-ascii?Q?hrRiBUODoNydAbaLl/vOLf3Ze/+d86hc3EA8JFV8oj18hy+fs6ySCHjwzo78?=
 =?us-ascii?Q?u4gyrkDxb7Q1oc72SbJcH/WHGb1smN6MTAhKruJ1VE2LMBWOWaujUcWrVJ8P?=
 =?us-ascii?Q?0FrvdFSzw7y/cjj09NlSqKuXu2JDF+n7YOtnX8eNsqJdDaKomw3l66AuoCYp?=
 =?us-ascii?Q?af77zWha81k0zgIFhbq2qYIj+hvP4pNFKjj+s4GwzAu9DHrFIWMV8N+usW5H?=
 =?us-ascii?Q?lCHi+6G0o9iLCDZXWQ5x4ajgifdGRLzYjgFfEn+tukF69U4+sZ8W+lgBvAZw?=
 =?us-ascii?Q?gsfMUjBcdnO5UJ6nboHsz07ntXqBYrFBBHXaHiwwaz5N7Vj1vbubIU76zSXy?=
 =?us-ascii?Q?Jd+98eprNR4J6a9wjaVYLuWIYxIHJ8hna2YeqhOMwL5CgtdximqH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b399f740-90e5-473e-dda6-08de79512c6b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:17:48.0090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHr7rDoNUj7MUB5ba65Rba8zcQu7Ib0YBfSRB+9+EMqG1DrW8lRKil+xsuYHVdDavZNL9F4CjMVYVXwko3ZAWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: DCE8A1F526E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	TAGGED_FROM(0.00)[bounces-17619-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 11:41:20AM -0800, Jakub Kicinski wrote:
> On Thu, 19 Feb 2026 13:13:52 -0500 Yury Norov wrote:
> >  .../marvell/octeontx2/af/rvu_debugfs.c        | 28 +++----------
> >  drivers/net/ethernet/meta/fbnic/fbnic_tlv.c   |  6 +--
> >  drivers/s390/net/qeth_core_main.c             |  6 +--
> >  net/core/net-sysfs.c                          |  2 +-
> 
> Please split these changes out and submit them to the correct subsystem
> after the merge window. Then push patch 12 during the next merge window.

OK, I'll split them out, will switch to sysfs_emit() where appropriate
as suggested by Tomas. I'll move those tests cleanups by myself.

Will resend shortly.

Thanks,
Yury

