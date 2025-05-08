Return-Path: <linuxppc-dev+bounces-8444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2FAAFB67
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 15:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtY3C2Mr5z3bVW;
	Thu,  8 May 2025 23:32:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746709625;
	cv=pass; b=GgDWynVARXGNFIryPuFi80JLA0ezeJB0PUxiwYlX92SEqcOFfIpsOzJMKSita6KSC/pvYSyVYXplKA6CiV3p+SNyrCAG8DHoiM/V6XGLUb23FNiwlleWyXReVDzRGwlUthsHcb3nrAKRAtYWQxkGMppHvidcTobSBA8O6f4iphGDbus9bTSuhMGuiij70R00bBVDi9zQXpqlLO6hzSfRz/C5kbv7o6U+5TzO0mfyxX6UnqTHW2ezBiIN8ttDhZnFRtXSI4qFqP3EoXZO4qbwlmqUq8yLxqjeG0x0Zkp1ax1hF6DBz4Q0SM0jv2+TzlHaobxZa/sezd7qudc73LR5Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746709625; c=relaxed/relaxed;
	bh=Wcc7V2p9rP4FBr/q9IqBtFrBLynDNbO1DlOf8x3nEj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BJvRIuHyMeB5qidjHZECrpYy6bMFiETstLXu2f+3DC/rtLQminwloBR4kev0dFj/oX7eZnZNPHQqpBuRyZRjUf+g5zYkBMi/YTqctUuxI5Np6KxkvaSvhUf/3hCnmSTSRpkhLSzXMjQni56vtCLh7I8A8qENbOVow++dB1P5jqqMWgnnISh62WO7svGcXzgeRcoSEai92mhqm3TYQf1WegSTG+k8sT9HsbES43b2IDESt/yoj+tre9o7QMz17QIWbT3h3Wpxf9fkt3HWVbm0NBxYHbh6A+lwVLGiauAw8IJlvRB/8wPVjZsm5ElopETMzLIhGNY9f9RhjjmCCeV7Aw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com; dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=bJX7/dM5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org) smtp.mailfrom=mt.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=bJX7/dM5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mt.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtXTh6QB3z307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 23:07:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWChFyzo6+NvmL+O4YCILsTjsRrvpUet8updpRGptj3J1Z9v46ABe091CMaRIxap1MgUJGqGnnt2oAlCdv+YGDxczcdozw7usoRebjBIM5GialM+07lrAtime5Zdx7iR7UTsyqkL4xokB+kByxQmeETU0t/irpEAJtRWdxk3xYyi8CtmhVwAlLZKf9uaX+pC1mv/mkgXuK656oY2Qnj554TeneypReg3zVKF08Cz1sRv87573erntYNSIF+2EYh8JCQmZaZbQGsreN3zR4uN2v1MuXRtLweKz2rGkqYdjRDyNM+/15h7mhknOwQdziBPOoIw3ozGvzTvULwCNq95sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wcc7V2p9rP4FBr/q9IqBtFrBLynDNbO1DlOf8x3nEj4=;
 b=XOEipGS7OrCmKUy69PWW0wnxtWTWEl7aIhBXoopjQ86AB66dC8Gagv0RUbgnSMHWXFsNczy/0m1QJET6QQ9Z0qyY31xy2oBCKr66X1fzdgOFhWKzW085/igBHqWwdOC1c7VXqlF4BoxoJLY4EfkpHjJMZ07tPz8ItrWSSIGsGa3S5Q+t5uouQKrnI9XWVOHsJMK5iWs6vxtB5zu270aqD9CZvXtq+AZo8XelJoRLvOZiMtu17vK6UTvWq42HIiCJRre3gR1PZZEK9CbRZXxJvMCgIHjNdl/E6ZAMo6MaqR7vrfzwobsUoYJxegBBPZLagNWxcE2CnvskPNyxL9H61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcc7V2p9rP4FBr/q9IqBtFrBLynDNbO1DlOf8x3nEj4=;
 b=bJX7/dM56Ux5gfmzpgQ7MLe7fxd9Ov1t03CUmrW3RiapZW6PXTmrZawXuBjBcidHZRKk6Uib1fMSwpp8OS4zjj7km+r+mrdABo+McksRkDJVmypdFbcjHdUljRHgHD88CQ+bO7DU/aicsQYn9odqseISg6fMuIY5hKeZIJCtUSZnyDhLk4wEhRblpj19MVZRhBIM9RQaLyyVCUlSEwnJKdAfZUnF5L0BKJ6T98IK5ZWQ5Ck7CCsM1NXOiCMAi1PW62fon01iUW7PiX3epyBjRWzV6rUZv2j8b8zMJo7Lcpc4qzY/iMV/WDXZYp6RYid0WGa5gw0J6yG3wa4w4WKC2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 DBAPR03MB6439.eurprd03.prod.outlook.com (2603:10a6:10:199::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Thu, 8 May 2025 13:06:47 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Thu, 8 May 2025
 13:06:47 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v4 2/6] accel/ivpu: Use effective buffer size for zero terminator
Date: Thu,  8 May 2025 15:06:08 +0200
Message-Id: <20250508130612.82270-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
References: <20250508130612.82270-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::17) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
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
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|DBAPR03MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 24541412-6257-430b-e1e3-08dd8e31306a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/WDciwgZChe42bjLagepN2dPRLjpGwMLjWrCavVg9C6cQMM+2SSCbAwdouRU?=
 =?us-ascii?Q?Ds8D/nKsOu/GzR7oboyBBqkjBUrMBxcs0hTd50ZxHEgghKmxU3qxBIGfc7PG?=
 =?us-ascii?Q?tMcstVIuVVXDaiG/zY2CFw155KPONsJMwyt5F1Zzp7ItsJkRRhvPoQn67810?=
 =?us-ascii?Q?OAC2MYwPpa/E0Rth6XkcW6NmZ8dEOpxzdUPKPI5W9QR0BY+DdUfwWsDsKhDA?=
 =?us-ascii?Q?/XZs6VB0eFC8m3XVXF9EVS/Rtv+xke6+4Fa5RHUiSGUUQWaoZzCe0gI2UzN5?=
 =?us-ascii?Q?DUhgFj3hkkRsRyv006bUHSgzXEdTAJwSmlk+VX9Ht28R8J6ief4t2gdmspIf?=
 =?us-ascii?Q?F17DKq6ixr/ttUNzn2sOKhqUazewrn5DS6hWWJqmWz1ai05MutyyseM2k0uH?=
 =?us-ascii?Q?mzYrpoHNC3jshagEfkdqc0C2F0KRicF6GlDoOTzlWj+xfaDBr5B6WuHkuF1y?=
 =?us-ascii?Q?fkYlxZ7Ovtm0sN+9Ocr31LRAMmxKqiupXqN1nBJMsAsP81xzXtM52jGLJQWC?=
 =?us-ascii?Q?GaXme0kMzmjplaezlhfOV0oxSj27A8BxjJ99g1dI3UHjYjNYov1oCTi6AzYh?=
 =?us-ascii?Q?iOJ7un7cT7qHt8On4gmiCZhOrTO5jbTdnbuzJ/wzHR/dUMx9zx0gSRZHXLua?=
 =?us-ascii?Q?TPXGcRZAd2Q7icFGQ5QmAVVg6QXH6K8/SUJmILO9FMxlqQzJc8ywRTxCIP28?=
 =?us-ascii?Q?Z+mcRR8l0sBcvt9X3aYzmLu/Xd4b4GMqpxhR1QOnuBWr7Cg3sslGCiaECqrm?=
 =?us-ascii?Q?dlt0rNiA4+iAx3usTA0E+tl8rQYaQOgd3rkai++LzaZ9HN/fPd1T9vFdv3bU?=
 =?us-ascii?Q?rLrKzW5tBHW7ntYtVcR6PH6peIJ3DaHwTVXmh5GjHIZTifp5tLElDmQxlgZS?=
 =?us-ascii?Q?8q30fkznVT34WptfGFqZfYF0wBLxYLwmsRVs9yAO46iIdrJJBbbC422qbJXj?=
 =?us-ascii?Q?BjeA3ah/A4AUSkoj6LFKHL1XBgWMu5eKcwo2ofjZ8RHwfUOlFRy3uJPATZb7?=
 =?us-ascii?Q?b8oK6w3QJIM+lNzAA32jHb0DK2PYhl7MvKYfF1wWAKu+Bm6gJbYrbTgnsg4+?=
 =?us-ascii?Q?reGJREP3uA699P280mXNXboNsa559CNIuaJm8UhqsfGOGdrhh7k6w+ddu8xy?=
 =?us-ascii?Q?kqK4AP6zMwQdacDgq9y0pLst8p6i0w+9l1rVnMNdbLvog45UznoTmk7UM4Yg?=
 =?us-ascii?Q?I72uE4q6kKGxL8i0ZbnSWLoNYum1DbjhUFYdyervvZsObYXOIHv77gBi+ufV?=
 =?us-ascii?Q?GbWLJnt8XEeJSjT4FJ4d7wbmoSQeA31VmwX0f/gGJ7iakwa/NxOj8wifn46V?=
 =?us-ascii?Q?XO2dGJ20agvY80mkgeX+coTUBYoaaAQqd6TsXBAneE9sY+RKVrluThbbwAjx?=
 =?us-ascii?Q?PNvhlJzeGD/2HTFfkvfa29E1QSYYB+vo+Q7OoHX8cbPY0BEsFrYjz2+9buGE?=
 =?us-ascii?Q?bwEyzNLPB6EE6EJYKIsb6NNI+/+4sHvGjo5f6OEDQNvOxMk+4u1U3w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?25tNyk8jrcFyrOgTW2uNc9gzTaw8JYRVeZVkBzUgtbIO1xXWZKP4KbDBsc4r?=
 =?us-ascii?Q?Gd0R/LInHYSE4W/4PnPItzToo6QfMA8uM/vyoaCJqjW1D5AQln+MCYhnhLF1?=
 =?us-ascii?Q?BfKdoM6GIuQLF/gorwcbw3FG5HetK1rDmzacdHhhmz6PBfM12mHSYnuyCVf1?=
 =?us-ascii?Q?MM4eDIK/lwkB8pYDiox6KJi/aUQD9Vhk/SlUC8jz99PaFVoy0KGzJs7Xh3ny?=
 =?us-ascii?Q?c/8Bch9lSVE7JVpZ9csqeGa0fBo+0pGrDpNsk+i6Ocdo/ljNEraGtH1UybDM?=
 =?us-ascii?Q?YK35RCpd0NX0taDf3aMbUYzmaQj2ICYNln5RXg4x16lcE9A4Bw5uLA1leH07?=
 =?us-ascii?Q?lDCyl9x1IipyHLVfW0+SOOl28YGgSWKYPJh1doss/TZ7gj7PKfXQda8MqCk7?=
 =?us-ascii?Q?Tu36wxNL32SZJtdGhMZwkPRXoQdqPdeHvOZXN4+GoLzFThYMzjWtmykgRbv+?=
 =?us-ascii?Q?BripIqSJQLt5orOs9TNeQS8JqwfD506UJII8xfMbW0Qi6fn0Dt7jU9C2A6FP?=
 =?us-ascii?Q?s307OQQJTQhfiBqIbfBCGOzNQfa8Iuh/epzo0tt3nOhdVwPG4+tTUxCsH2rH?=
 =?us-ascii?Q?Dvx/oOFTLlurWUNhKYnhD3lHX7KXQ1vYSCNqzVBKfbMWbhMgWJ+dX3Z7+fp7?=
 =?us-ascii?Q?mmrXfMLeSKCbf4iCaaMQjsquPOY5Ymhh44ZqaUPC5N2Vx2+PAq0qnEm72ZKc?=
 =?us-ascii?Q?vptZmxOnOnAYmYTGFY62RohuAWWp1Gfq8cXLMoKtTWmkSGNANdFJZEqdYofd?=
 =?us-ascii?Q?Ffw3fR247xG0o1zm5+Egc+aAOS5SN8NZr7zqde7LXblc/OfUUfnyZ+wvvsre?=
 =?us-ascii?Q?tDllCJ2e5/OUHdedIgWEUBMIsXiNNtIh8D7VRhci1hiR9nnx6IXNDtviQA/i?=
 =?us-ascii?Q?DXA3+d79QPzMPiyNA8OU8HoH8O6TU0Fwbp1QqPHLT6Wk0ewlJqLWWcV+M0tj?=
 =?us-ascii?Q?xxopYHYqLecC65uYDRrluTgLgMdp25aEpGYgdllcpitq7B3SrWvFmxuhDxC2?=
 =?us-ascii?Q?UbeIa9UsdoQ90EZWfIfyvm7DfCTy6Y8fanrKZgkUeCchO2j0OUgnsl6mQFEu?=
 =?us-ascii?Q?SmO0r/hinskOqu3FD7KAWDv1Wh/WR7bhDwWzSQ88dZBMPhMNtPC/ThGyC+Fn?=
 =?us-ascii?Q?55ykWMx1XGLL0jWuNXa01tID5U5z+Put+rYvdpV7JIhSAhE/rg6Iu2xjjreA?=
 =?us-ascii?Q?E1vDRyUliL0P1Pi3kpd68UNXd2OjZgEQqtlrxyd1z9ZlJqX7UjlGym9CbBUf?=
 =?us-ascii?Q?i+t7A3kv/LXwdu1QooE2I43r5fvqjeZERIUIvjG+p/CD0dk02X2vYLk21+4Q?=
 =?us-ascii?Q?TavoqLW2VKxrexjQXEdyKyFs+eY1HDrLkzLGPP7tm3flj/Sg3a3L55a92f7C?=
 =?us-ascii?Q?2God9jSCZLlWqdKDjIWsdpfwGSSPhAzHgDB3sezG+QY1Yo1lvblqExC5Oatq?=
 =?us-ascii?Q?9yc1qb2lkgXqEE7R49BeDHYZLO/JYHOsJCWfxqIuy5eLJVDsNufCZgJLGm29?=
 =?us-ascii?Q?pwKu8Dg1In+xA1OJnd7ED/CC3CgJU9tSWkbCNIGY9wm2hPfg0QdxgOSaAMDY?=
 =?us-ascii?Q?pXPAYgAbTMKJ4LgUepRJCP8jizV532SNQXVON8y6?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24541412-6257-430b-e1e3-08dd8e31306a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:06:47.4420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hs3enyRHBV3/IIw6NwF/adMyABPy02K5WNnjBlKqc8g5/5W2LyjauWIMxbccfP0/rhaWw2XmL85b7VEPVngvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6439
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use the effective written size instead of original size as index for zero
termination. If the input from user-space is to larger and the input is
truncated, the original size is out-of-bound.
Since there is an upfront size check here, the change is for consistency.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index f0dad0c9ce33..cd24ccd20ba6 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -455,7 +455,7 @@ priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t
 	if (ret < 0)
 		return ret;
 
-	buf[size] = '\0';
+	buf[ret] = '\0';
 	ret = sscanf(buf, "%u %u %u %u", &band, &grace_period, &process_grace_period,
 		     &process_quantum);
 	if (ret != 4)
-- 
2.39.5


