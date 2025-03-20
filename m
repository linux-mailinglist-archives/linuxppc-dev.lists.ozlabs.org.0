Return-Path: <linuxppc-dev+bounces-7233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4588A6A5BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 13:04:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJPPl0lmqz2yk3;
	Thu, 20 Mar 2025 23:04:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742472251;
	cv=pass; b=TwB3FK+t23IvpMIlN+znPDrd09N/xnhL6he+alaDqaiJLvcSNIX0vRtM+irc4QjLsncNrIGU1Gg3wIhuOiSinkH9C/DXoSeKow130Hy/8iA5SgvkymWwedMYnlwlWJ0xIKj7Cmd/LBlEgGrgWX/XOEbtrkDvJUnoyhmAGw5pJov873TiMUKrSQss8uYXld+zx5ITOB1RW+2jDsffdYxmCaN+58qWgFCGlfSNZft1ST7ch0kDIK9PvS/J72PGhZJ9VNkGsxMcjDLK50QV5/1nItcIYha6mrwCl80d6BvszArtJUZo2S8h5jZ80DvRXM8M8RrLokFX1bzGgWzPG+4bOA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742472251; c=relaxed/relaxed;
	bh=KdyNZjalv+6KnmoBQUYjXG1iAhjSEQVw19i2zgQ+1YA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ON9QRKLhbuXgFUF7ra6583oj7dZ2IhmsjmWf47dgvi4SkCjq5jpE2lyhIcicb2IriHVi3RgpZm9MwlsN5FVpllNgP2IfztdxSmoCymaqgQr1wrNmLQFcLb8PeKQ3Lv4PzxwgGPlVz3hneNF6UtPtcaeJi0gu45S+yWh9SvSpgJeRNf5DiO1T3CM+eE4sTQey8niaxggJUokG0XVOq3QFMY0x6qujDkZv2gDt3HSvMAY4FkPXiGHu3acyTIbwrZXWF36wpOKVc21ut8erYtOHt7zOUtcPWDDynudTq80DdAOIXxvHjoOQNU69/xCcufHK2VuyVmaVAjtaTr5/1wOx6w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=CKqqK4Up; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=CKqqK4Up;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJPPk4GWkz305v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 23:04:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlKi1pYoVMyMZ1nOIVxDGeyK8kqoIflJ1L7VAE75w/ICEo5EW4F4oVOhAwt1L9bl3UzgNO9lxi9GQHYeTgFWfLJ4qelINzcmOUScOf643h9BbN9jyJUM2ZcCoytnHb50ZdcfhkgvXx6vTfnQv3xl2gpK9l9gPs/S2dGMmpMc/ZMv4FAhXzGWWK5aU2NpPxL34Vb4yzcEkM2nesyF6+8wKBG3nMj3zprfeDHnbbvCTLYvicQfonaTekzkdko9hGH5KrnwOMTwSV7SxO090oG1kflNcuI865IvyfO8LAXzTdbObf8v/NySY/zXmxMFUvXdFvZPmQ0Sh6QM+1CkVfImbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdyNZjalv+6KnmoBQUYjXG1iAhjSEQVw19i2zgQ+1YA=;
 b=na9NSjgvtus1S86PeyvlhVWK6FnW8mqT5BJhwoWrB4dscaM/o1E5POUZ6vYr2yLlTEAU/H6KXEWY6ptLUXEUYmKF8hO+apB87CSsanEEN2wi01jnCQb/QyBE/l1pfWyGI5YAV46Fu/YcUF3dl7oIB57W8tsfURjRMPXmz8XHZ2fPvVlDejwhW8OqLUCzu4N6zAySE+p4WQnphRwYQPI9fQdiq0fmLEoZm3aS9XG9mX0DP4p7rI+zaXPv/lOAgJMcLI4qvqAsGRIoQxgE4X4eNCgo38uNbZAZnWwW+Xkwb0E9FNeMjjfo/bGsgT8CVNUd1Wmwz3tQTcF5ln+atLzHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdyNZjalv+6KnmoBQUYjXG1iAhjSEQVw19i2zgQ+1YA=;
 b=CKqqK4UpZ/oepIHkBXb+L+msrbmFCrtnu0qGm2yAq+yLP5/tQY8mCSaj9rAn004tR6PRtn17K0H8nQRGXDPKOvNkabcmN1zuSZ/gMpZgwusWXr5jTMOsJMmDV3hZ2UYEswibLLAdH5kC2/ZQzAOdyg7hGnqBzEepw2bo3PBQ4TAKiVSPBmqJBxgvKFj+/KKkLSqkPANYI2t9eLIbcjhW7S6yW06YCj7UFNLoQITi15+2fsWEjWMPs2mzI9pIYURFYWl8/5HMESW52oSnNn8ps0lEmjcqizGblKvdw1fIeQXinIOoxKL5UdBzdTQlXzzDEhEj0p/IPNbsDFkjcW+vyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 12:03:49 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:03:49 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Stuart Yoder <stuyoder@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 3/3] MAINTAINERS: add the linuppc-dev list to the fsl-mc bus entry
Date: Thu, 20 Mar 2025 14:03:19 +0200
Message-Id: <20250320120319.3520315-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
References: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a5b7c0-0f71-4b85-2578-08dd67a7467f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nJ3g7sd92HG732OJmKd2ey9qwtB/q67riUofJ6HKyEpeEugvSjUZON2gq8+0?=
 =?us-ascii?Q?T6cFQe2IqxmAmBo5mDneElydP5Af4F/p+jt9Rh8tRpCFmyr4drw2hAMwx9tl?=
 =?us-ascii?Q?1cDIQnvlfBYgxLON2k+O0ebPlTZyvZ4K2EwH4WpCOqgVfnmbNfEcTTyHHShw?=
 =?us-ascii?Q?VhQqZk5RGeBJsBBm+ggSjzdrl6f/2+zac7fBBtiRZZBKt9936RcJj78wKwzQ?=
 =?us-ascii?Q?EGBLEvCrz79z8gEdAHBGsK1BESmLtY08sl0FMthazgO1tQJ7h5WHczJdmnen?=
 =?us-ascii?Q?zZ3Ftk26goFyNBMlkAvNVU/rXZfbSCNykVfYKXQnEu2EFdNjB1+2iqUokqnd?=
 =?us-ascii?Q?qfn+yLHeoBpBEbUHILcXIGfE2oI6yCqobXHF98X88PyVx7XknZzqVw2Jlrp2?=
 =?us-ascii?Q?74ljuwHsaytgwkd9ouGyhjdYujFCCjN2Z8HDzs8z/oGvqfLvD/usfUAudd22?=
 =?us-ascii?Q?mesrOmzWktQQ3iwYWvJuCAe6uQNcdJQViimlBkzNtw0OEKSnuFBJsV//Dr6f?=
 =?us-ascii?Q?MX956ZkfQ+w4Yzq3nmeXOcEc4ciIGajzCRAbhu6/wgCq2pIVcBXKKNvZ4D0f?=
 =?us-ascii?Q?sB4R8QnSw1czfcoj9UYi9Q9msiBtzAIMySxVLg1zwPEN8IskUCkxmbXHtpUK?=
 =?us-ascii?Q?ozgGWau1LgyNzoWdkw+K2iBABoS2TYHGM1y3I3fwsSf81Vylb1zXujmmnA5J?=
 =?us-ascii?Q?N0Kc334cm0iYfXI+mia4Q1lVqhXoTmPJtM4SugnigCKs3jVSfAnMmc7RSKCI?=
 =?us-ascii?Q?vRmDlOIn0dpCMCuga+v4CvNsS2GQJHvo5T9sjpqk8DX+Rfech14oNMvWAyB2?=
 =?us-ascii?Q?5Jqo5QCEbSzJUHH2LSYNiFmvBKJnoU24x49QAILKA2XzSa/X9+CorQ+x5dWN?=
 =?us-ascii?Q?pbVaxnlf/zb5N8oPGMjxcMGd6KpZcWzFYBhU6EiXpnrqj3TkqJqz6KISX+vf?=
 =?us-ascii?Q?ClZsfV6J3u1VieiwhrWFDhk1LGNUgBwAWmzCCVFsCs+BBCPzzswIdELaasr2?=
 =?us-ascii?Q?tuns66kUgwaSyPtoRp27nbI2MURBqQtyH8+icjfFxhInyYUNfz6lBI7/UPK5?=
 =?us-ascii?Q?H9fXoLZNc7TtOEqdxjbBud6cxJJHhD20Ps0TZX38heMs9WVx5iqSiGrwFBqD?=
 =?us-ascii?Q?iaj3H/ulhx59iBaI53umrSbMFjsyqVpAnMzbaC9PkBTxiJ5lVYL9KtTsZ7lL?=
 =?us-ascii?Q?jk55HG/O865A4PHhmtnORGOUzg7n2w035TFr/RxWpom9hMl+B20w+OK5Odbl?=
 =?us-ascii?Q?po8AWIaMau9RhTNWgpY5rQISrF0+NdaX8R/gLVnEaz1rg3Gz87m2bC6yVuKq?=
 =?us-ascii?Q?xi8eYhjESagYYINd6aNRhhLWQSTehN/gpKvtUMzaVezTfLsVaU0rUjR4FtjF?=
 =?us-ascii?Q?niNPSeKR43nc0rDAy5nElwEYCQWx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2MMt+Ctl+7/r/UlRcvY5y47ZHfoYsuY3rG0PhE2l7gqtt5F/I4YJMs7EjYn2?=
 =?us-ascii?Q?onUkcLhJc/H7lHluz+eR2syiWrYKz4fRW+eUkNk4uOSS8mha4xv9uDzc7kaz?=
 =?us-ascii?Q?mRYwnQUCa6yed2Wk+JbjaOX/ThVwg+ge77dnQezhn/uz0QR3zE/Ywk4Ljf7m?=
 =?us-ascii?Q?jBp9zGAiORDR27ppOd1iWBnrWpxh1il2e9vT5Y+3XUBffn4uycJEfKa3vqaw?=
 =?us-ascii?Q?5OWGjuWYPuok19NFHrObiXpEX2KTDwQkW69e5m+NQZo8KBEj3S30ze01sgB3?=
 =?us-ascii?Q?cUHwA3As3q4411iFwybQ7+vcFHUciYzL19rQLn/WmclxWYG7QGTWZTCrbsdC?=
 =?us-ascii?Q?4U+Y754iGRGDcxNqYWg8Xvj1yWCgPMWxXzom4rcbl3NJaLeKQvSwObHZLzyB?=
 =?us-ascii?Q?5VSE/pSBUWEfvsuYjd0aEwh3zD8zqAwG8Vs2KvH78jNdM/gqkZ8GD6SQHr2e?=
 =?us-ascii?Q?lEYs8cFHgvqqfX1F/7QySdO9NjL6Cd4PwsQurWJc4tvL6R6JXrZCMF12ieHS?=
 =?us-ascii?Q?JK3QlbHE9lm9bFP/21X988HIM2VQzcKuJG6bEpgqmDM8g+qXq02l4KtP39Lc?=
 =?us-ascii?Q?7xGvpoIbgCGbUuqhKJjYealsAFi5vWH3Yv5OJu0SApdqUDgC+wbHDwHdFEgb?=
 =?us-ascii?Q?u+4Cn4Ng9Ux3o09i4Gf74DS+qrfHe8V6mA8GJIGC2V+3mvK0DWwpTyJ4WJe7?=
 =?us-ascii?Q?K94/DNXhcGtDrp7uTmhIFZrPcW4A4/zMY+hl/xYTriNgT9Saa5jcrFMxU2PJ?=
 =?us-ascii?Q?A59LVGv+PvffB1Cmg1eH4iUan1CnCgQS1d8kXUxWnieYVqTvNIO6VyMkDwyx?=
 =?us-ascii?Q?VvbdvtgpusxNCNUTr14gtrl0OTITub0B21kC6c3xKgHRIQd/TqkhBFN/3JJ0?=
 =?us-ascii?Q?A+bz3Ea0REBF56qNKGZp8FiFP2dVhprdLQ0nRikdLHam5dhCi56lW8KiF9RS?=
 =?us-ascii?Q?iz5VX7RUphq2afIXeQWUNiSpt/YYCXRvH3ZHJyfAH2/DKJTluvrl9N4pzjeH?=
 =?us-ascii?Q?OEx8WIVRGCJxBOJrh779jqEagJJkpigiuS5PW0os/8Oa6Czs0t5RJ8VlnwX6?=
 =?us-ascii?Q?Q9CibB9MoE5k2ms3jA+UxKUdUQbXYVlmMN8YIqOizH25E1GFN5xpnNdZuxwZ?=
 =?us-ascii?Q?wJaQbaaQYFwnx/vMo8dROiAZZCjxgl2CmG4qucpU1uhZkFZd8vg8s9an2egI?=
 =?us-ascii?Q?KFCO3vVbFtNSyQMWGxebyDhB0WXMM1MBtwk9wLNRX66X3d/91HuHI7HKNr/F?=
 =?us-ascii?Q?SsirYyYzkGkH5Wcx45lRBYV1nh8or3m3o/IFoWNThbVTSGO3KLsLHXBSSawj?=
 =?us-ascii?Q?ocRO5iH85Gt6J67iMBll20Qihu4LqwVkC6j5ftql2QHA2f5V5h07yv41y4rw?=
 =?us-ascii?Q?ax0ua38hrMATISvNW2m77SoKYJikhSwekUtgL8pBW51A7ERISieC80QKlnBy?=
 =?us-ascii?Q?LndhnGkBEYcPih8NOCGVAKHTfPUwjNK/kRprdF2GVT1VuhXhifXwQN6x0imX?=
 =?us-ascii?Q?lj4De6sTY8W+CTkDKq0oZuLH/L/eNFss6Eem3i9wGIMRHTFVuT3pAaKouA8Q?=
 =?us-ascii?Q?aXs+iSNJvor/v0otwlWkKnxhZVzTdne8nZmWBK1U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a5b7c0-0f71-4b85-2578-08dd67a7467f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:03:49.7395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joSFwgpZh2DeK3aNpXSlUhXuPDUqKmwHLjkdsaE50GNeI81zWDkbL4AykKZXMcQNTiSrbA5y/gowGgjpk84T3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As discussed in the thread linked below, the fsl-mc bus lacked a clear
maintenance path. Since Christophe accepted to take the fsl-mc bus
patches through his soc fsl subtree, add the linuxppc-dev mailing list
in the MAINTAINERS entry.

Link: https://lore.kernel.org/r/1d822960-85a7-42b3-88cf-9d3dbc75a831@csgroup.eu
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Changes in v2:
- none

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 012a3fbf884c..23a12b4362ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19639,6 +19639,7 @@ F:	include/linux/qnx6_fs.h
 
 QORIQ DPAA2 FSL-MC BUS DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
+L:	linuxppc-dev@lists.ozlabs.org
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
-- 
2.34.1


