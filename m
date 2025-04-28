Return-Path: <linuxppc-dev+bounces-8085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D16A9EEB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLVh4t2Bz2xS2;
	Mon, 28 Apr 2025 21:16:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745838988;
	cv=pass; b=lz9Zr5ujj4KbJ6o66ZOqKgy1lcMdA8ADCFLPvhQu85HQSuqJCTvUo5YdiBZidO9wMaIXvIRH5eHvv+PHESyYYKguAPw2dG0Ux0UuINQV9nfgruN7SeEurx5NZLcDYXrjlKlJRqJLlyupR99tPgU3mOz/RGdT+yK45vu9p8DT89If1qKr23MbIdzxA9i1mTId6BLC4PuaoTzL8utCVAPvwEX3ewgeaD3ODP6tDgiUtMoTNgI7c3CLUtDReV0120wg1SpxW6W6fNGx11NUdTDEfD+k7g6jjJjBb5vdATD+iMLKMprUAr3uOKIfhb+UGPswdp74xvHQMGYIClcsCZVjcg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745838988; c=relaxed/relaxed;
	bh=tq/5FkdywjMy7D2qu7J3dt6hNt0pDlrV0pINS4sr72Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZaKtSTEYE4+zXS3W/XYoVYDbdTcqtIU/5kDNn3Nj8+DHjXw0Q0qW4qjNRxDPR+uQ6/Cde0YgrlBIKR0mkEFQccj3iFF03CWNN+Fvm2wFjWKpBOD2KJWItAIzzHCmyiamxrQ2qi5EfrtoNvbrmJ+ypafFTkn+fZ7te+nopioN21IGs9UFPOi2eM3hEZwT0dNGSrrnP14MSwhFmZMyeXUpKJCaZotUpUnyXgYs2Sz9IODyKl2KDfHsZq2CnMoXbpixhA4aiK+pvxBR0OcX879FKESn8buUjWKRdRNxE/wE00VgH/vu+cQnjUBC29kzQ+N+DPIn3GISZjP0DRbmlIXHBg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=EVF2WBv/; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=EVF2WBv/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLVb65pZz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ll7KK4KBw2x9lU5e8A6S/X9nFe5ujGAOd1sGSypeh30+iWNYFPeXotXjpgY2ffGlyp8gAoXrXeqKswNKgpF9PQNgS2H4cKeclxldOP69PetvFvhPs2zPLlwZ6ZI1orRrfSEN4O3rtiHVDiF2wf2VXyQ+VJ+Iviy9Ild+bmSMDjszCQNjqfihutXJq6H/zEl13JjI4mOBwQwgsGC+BJYGIoYQQMzHhFnYoei3DjLV2h6bC5ygst0BtnX6ZTh2XeEhz/Z/ZAkvSmOYCMJSaykG+fJk1MkAwAPKx8QnxlVQpWMXmlO7X2aQaQj8a0vnbUdGd/tC9E57UxlkyuFmXltbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq/5FkdywjMy7D2qu7J3dt6hNt0pDlrV0pINS4sr72Q=;
 b=p0vIf4tr6r3j98BIU9VxI2X6gv0uXKyKaju5GHyZ4hinxe2RXZ867A550Eo/sC4c146QqLGAQR6fDWmLv0PdEufrpYJj1zBvcu4QfkNejICWo1U9+3wNCGDCqWoGDXXUp28xhgz2vzRHj2788rCWanFE+XcVYDFFXSmuYwgH333J3IAE5OrcFn9iZ6VuXDrWOUbbw0EkDeuP1pJ/7W5Zk5/lPuunpHWJQTYWiSl0pw950V3UfND0yjeGY3ZO4oBnYjMjuki2vritIRx0J6oBBfod/aSZ1ryaoW+ZM2H3ylqAilakFcv4CARZMXIDLA50roxeePBi18yr8Ar5suztIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq/5FkdywjMy7D2qu7J3dt6hNt0pDlrV0pINS4sr72Q=;
 b=EVF2WBv/ENbFy23whYtDVkvJX8IIHIV+dgdNT2BW3xlC/PUdcExg1/JW6hoKx1AUCUoXK3pmN8G2YInQsjn9CuK5xivy2vlcU+LBgazzIFNH4rm+ZiNkFPo1UlWxX38K0Od4KdPGYF4L/kq4tG1ZvcvbObsNpS2uIN0va1CP+FoACmFqvPq6ifrUdqSidsMqdsT4jePdIBL30OntiRLkyoKqF1T5qOBGKdMTup5BX285KQUaJUV9V1vbzBhVAoxLWEtnPvhAhJ97PZftAB+aU6GF2Pu+GYAH4H5eUyJV6FYGc7xcXPnaiBZA2GPbhIpayGfrILXiI+kOhAftzdkf4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:05 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:05 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 02/14] net: enetc: add command BD ring support for i.MX95 ENETC
Date: Mon, 28 Apr 2025 18:56:45 +0800
Message-Id: <20250428105657.3283130-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: ae126dd2-4fa9-4df1-4aaf-08dd864610f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IGuZ3vTp44ERyVDyoRqHw25iFN+yfvIwOM7AO0YeEH+bgPeBgH1yA9P1Y8y6?=
 =?us-ascii?Q?sZcRt3Q57TbMuDv8f/6sfY9NemLsXzUduPJ6/haIqMYbBds9P9gOhIHD5Kwz?=
 =?us-ascii?Q?V4TWzm5vFlTzc/wchTkK96EG4gTYMLmwG+/bHJNIvFkfFHeNUAkUcqGoF0YT?=
 =?us-ascii?Q?if85BMtxFUCru2/M/mQkpjCD20f1ChQU4oBdia5CECbRE6pRPyAKn3PxZym/?=
 =?us-ascii?Q?d8XU4Uhan6Ws9Q09w/i9V4ULPOj6yo6Uj5IwDroPZ5VUsuZvKna9TB/Y09Fp?=
 =?us-ascii?Q?BNg13E7n/kjNr2cAX8YXYT8kg02JrZfTsqdfy623fvfGFZ7M9licsg5OIGDj?=
 =?us-ascii?Q?3aM8arMzriChC0bCStifQr7nmtTywJBY8mnxKBDmcu8I09MiwSgIT51ioeMc?=
 =?us-ascii?Q?cnrVlNaKEP6C/mhhibKERPM8Keyu+L8uv73z0amRWBGAT8QreyvssmlMORTj?=
 =?us-ascii?Q?DG1uC6IB+5i6yPICWK1eNoZali+2g2aAYDQDMtjGE+ZblYeCzNP5xBRUipYI?=
 =?us-ascii?Q?dlVZSgBui4j5Ogx8tXzxxv7I0sxbv7FVIY+Kxj3LVq5I1mTCkFrEsOBUtI/s?=
 =?us-ascii?Q?itYAHPXqqlVqfQnRRiqnlCJm6kx7QysEPMcTwuWcHKTF5QmLJmu3jea5IeBj?=
 =?us-ascii?Q?rzOTrW8cYulLlvDH2PBC8TQuSevtbGoBJz6jt4KWTaDVMDWdLBQwwwXjdNHK?=
 =?us-ascii?Q?99QcPPYkuH4QhJihpsdxuxqB7P4k/V89ctVcvNxOq9I3IJGjQY4QudehUTdp?=
 =?us-ascii?Q?NQhaCV7y3Ii6ErTLnQqBMiAOSgfZZ5DMSf+mwtIT9LKBl9OFQvv5qxNTLW1A?=
 =?us-ascii?Q?k9miCaBj+9E3ejTEPmWCMJX3usDL8dBuXHOylGioUYjLmkdYt1YM7/umifnH?=
 =?us-ascii?Q?bMDkyNy0mVncvW+GUW9D3U/d4wmyp8Kh/MIssQ7rXaUPFKfj79X9frGy1sax?=
 =?us-ascii?Q?tLpf8tpEjumlTjayTkLTTe4G72qEFvQNl4zu3aZ6iEkJ6M6cWc4LCVE55JKR?=
 =?us-ascii?Q?wNQo1SizX6qJDJi4zaeB6JGxi/gds3LtnEtoEWw5bUVAOfBIBjWvR4fShFEz?=
 =?us-ascii?Q?5QN2AGcxlcX1QAXZEkV7nIyJrQGFqBO5vx8UDHsjHYKWVi1rHNu7b88fBBb2?=
 =?us-ascii?Q?0wa9J9FaU+WWWYw/byR6VLPr/QyB2sDmD1KEVbkMfOdXSaT8o6PIVdh8+yZa?=
 =?us-ascii?Q?dH3ndyF14+ZZEiVpjP9J0SAXmgGRyODUIS4uOg6Yz41IIhRMOifuCBfccNnU?=
 =?us-ascii?Q?zIBAxrfapbYy8p+wrYxNFOuWARt0UaJOyxpwd8oqjA/xWq7jJ5jjYIN6fVIM?=
 =?us-ascii?Q?7m0nZK1zsHqoeJZ87mufh9gAnb/1IlFOJGlfgcyLobk3PKV3LfVsR+4STRlf?=
 =?us-ascii?Q?LwuCpSHlBYYn3hkFFgXrSSqW/50IpE5xE/zQUCcNJ5+zBH9boDoOISyLlM/S?=
 =?us-ascii?Q?DrDCrp5ocbOI2XrOMK3VqwS+xgMBroUAtIrSfJYuBIVX087DUtTk6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BJTAHBQag6tzbPGbPij57qbKkn5bsyh/wxLQVE4Af2rPh8ZApXtKjpc7P+lY?=
 =?us-ascii?Q?u0k3+JybAFzNIqJnlqMGqDjm+IJWlpnLKK6da9wGl9Fmi3l4cbixa1/3jVXe?=
 =?us-ascii?Q?BkncGlsaAMRz6hxJ1Y51PL8GDey9/veqQA8+3arKhu0NhkeRfrQce2hiKLdl?=
 =?us-ascii?Q?xVf6J7iUNpz4VBlm7gd+G/CRz4mBolbakRTpsIqbPrXvEn6F9L+/2ZDTsyLs?=
 =?us-ascii?Q?B5XAELSur6l2Ngpx1mqYaa0c0Oxbv9XXQQ3pkb9Gne6d0gPY2VCMur06PMg5?=
 =?us-ascii?Q?ajpKLPqiN59jKv5baaEN5Wif5tHbkKARcJzwLdqX6YwKZ3ccvHShM6Rbb2sy?=
 =?us-ascii?Q?mb6VotKFNnQnyfpPx0H7xmWgc12vGMtpL3vomPf9wX40eaCcatTMZ/z8VBlO?=
 =?us-ascii?Q?x0F5UJGyt2k2oYE2J0aim6qCpZfWAW6LesKvjFjKB+TMYzv9m95lbKtj7lRV?=
 =?us-ascii?Q?iJ82J4fE8MkZvvjKiH4kDdQu9rwExyWPEW7yBbNDhtgGFVi2uC+0q8Wzf8rd?=
 =?us-ascii?Q?4ruOHZZi0MlmoIG4OQ8jepqt8k/LOGvC/6JS+odt9qC7bS+iwC2duPBheBIl?=
 =?us-ascii?Q?04oKHbmm2DVu5H7sU74OZzLodTcm7rp/ERM1ixG+47PlRT486u9+dqJbnn0G?=
 =?us-ascii?Q?HJmaksLzT5gPCg/dbguEQbWJcD6fliFet27oj2hEkSIeIsp1giopKLmnb1fD?=
 =?us-ascii?Q?o16y+kfMPRDSUoH8hRx0H62O2OJqrT3C7+s0XC3a+FlhkF3gv7IfF0zKtmyf?=
 =?us-ascii?Q?i41SrZjH0TM93e6qyFP8R4YURpOBxTjviHLrkh3rMbToJEMX1G8DxJaltteX?=
 =?us-ascii?Q?SYWZ0NW55AGtNOPQLKjdRg2urkNJ/kJneB1NOnLs45wqMseZw3k46N59rVD9?=
 =?us-ascii?Q?8VzwGQhwdZk+gc6WKX3q16JXuRyP2zejLewZ7VRJ7xMocPIml9JOaFpD96+X?=
 =?us-ascii?Q?NWEMfNuEMSHwrvxiEvGZ34QLyFEXzz8q9hB1PVVdb/P+9DXv1tdAC0/Woq5a?=
 =?us-ascii?Q?o4aD7Sx06GwZNi/LF6pylmdnsXW7et3xwJGfV+3DbqXQo8W5KDQnpRlFaSur?=
 =?us-ascii?Q?dKBV6thDg9vRkTkWkNIkyqsQYFktGSTw5czvI9MePlRfY9uEeJib8dSUtkFE?=
 =?us-ascii?Q?HkyB2gHEIiDNMJkf4oeTinAeweH9+VYoKkIA44QzMUGawf7o46ky+T4dqw3S?=
 =?us-ascii?Q?tmRWJYck98TMFwTIbjoqOlF7K2OpqCK6VZKK4qIVdcM7Y3+AMqpwUzVuG94c?=
 =?us-ascii?Q?A31TbDrCSF8gZVoObPNmOxb+nMA26bto/o2t3CGnQWvCDP10lJmItpHiB+iM?=
 =?us-ascii?Q?+T/rMx+JvL/8cNryzHEDQIP1lPjVhV0wlPbKZyjkh7CeUZBnjs7fsd+4Lu86?=
 =?us-ascii?Q?mLzJcBGyCNVJ0CH778t0sfcABPCeNDPucNINohWTMt952AFYS2V5Kc+wiCht?=
 =?us-ascii?Q?g2RUBde5GELsXAxida01VFZE+e8kt5sCn6qEi3NhOl8utU32zhMjy/4/oE8q?=
 =?us-ascii?Q?s/5e8GLx/bcJPT3rV51PTaSIQlrU27+6ro3VhVjCbH7MPatT9P8FJmzaEZnx?=
 =?us-ascii?Q?/Qw9s0hOqd5RGkjTGwPUHGiXLAMj9khnvQDNZ6w/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae126dd2-4fa9-4df1-4aaf-08dd864610f8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:05.0206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fs2e/h0okDOo+o1TJ+cCfAe6oN61M6nDpL85lrUl/8qPjT74DgbVgI9xv2YcqhYo5St+ztNHp3F6uBe4mzX52A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The command BD ring is used to configure functionality where the
underlying resources may be shared between different entities or being
too large to configure using direct registers (such as lookup tables).

Because the command BD and table formats of i.MX95 and LS1028A are very
different, the software processing logic is also different. So add
enetc4_setup_cbdr() and enetc4_teardown_cbdr() for ENETC v4 drivers.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Remove setup_cbdr() and teardown_cbdr() hooks
2. Rename enetc4_init_ntmp_priv() to enetc4_init_ntmp_user()
3. Modify the commit message
v6 changs:
Rebase the patch due to the changes of patch 1
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  9 ++++-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 39 ++++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 38 ++++++++++++++++++
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ad4eb5c5a74..384e0bded87f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/skbuff.h>
 #include <linux/ethtool.h>
+#include <linux/fsl/ntmp.h>
 #include <linux/if_vlan.h>
 #include <linux/phylink.h>
 #include <linux/dim.h>
@@ -274,7 +275,10 @@ struct enetc_si {
 
 	struct net_device *ndev; /* back ref. */
 
-	struct enetc_cbdr cbd_ring;
+	union {
+		struct enetc_cbdr cbd_ring; /* Only ENETC 1.0 */
+		struct ntmp_user ntmp_user; /* ENETC 4.1 and later */
+	};
 
 	int num_rx_rings; /* how many rings are available in the SI */
 	int num_tx_rings;
@@ -284,6 +288,7 @@ struct enetc_si {
 	u16 revision;
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
+	const struct enetc_si_ops *ops;
 };
 
 #define ENETC_SI_ALIGN	32
@@ -493,6 +498,8 @@ void enetc_mm_commit_preemptible_tcs(struct enetc_ndev_priv *priv);
 int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 		     struct enetc_cbdr *cbdr);
 void enetc_teardown_cbdr(struct enetc_cbdr *cbdr);
+int enetc4_setup_cbdr(struct enetc_si *si);
+void enetc4_teardown_cbdr(struct enetc_si *si);
 int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 			    char *mac_addr, int si_map);
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 73ac8c6afb3a..175eebadde76 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -260,6 +260,21 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 	enetc4_enable_trx(pf);
 }
 
+static int enetc4_init_ntmp_user(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+
+	/* For ENETC 4.1, all table versions are 0 */
+	memset(&user->tbl, 0, sizeof(user->tbl));
+
+	return enetc4_setup_cbdr(si);
+}
+
+static void enetc4_free_ntmp_user(struct enetc_si *si)
+{
+	enetc4_teardown_cbdr(si);
+}
+
 static int enetc4_pf_init(struct enetc_pf *pf)
 {
 	struct device *dev = &pf->si->pdev->dev;
@@ -272,11 +287,22 @@ static int enetc4_pf_init(struct enetc_pf *pf)
 		return err;
 	}
 
+	err = enetc4_init_ntmp_user(pf->si);
+	if (err) {
+		dev_err(dev, "Failed to init CBDR\n");
+		return err;
+	}
+
 	enetc4_configure_port(pf);
 
 	return 0;
 }
 
+static void enetc4_pf_free(struct enetc_pf *pf)
+{
+	enetc4_free_ntmp_user(pf->si);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -728,14 +754,25 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 	enetc_get_si_caps(si);
 
-	return enetc4_pf_netdev_create(si);
+	err = enetc4_pf_netdev_create(si);
+	if (err)
+		goto err_netdev_create;
+
+	return 0;
+
+err_netdev_create:
+	enetc4_pf_free(pf);
+
+	return err;
 }
 
 static void enetc4_pf_remove(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
+	struct enetc_pf *pf = enetc_si_priv(si);
 
 	enetc4_pf_netdev_destroy(si);
+	enetc4_pf_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 20bfdf7fb4b4..71e4da530028 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -60,6 +60,44 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
 }
 EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
 
+int enetc4_setup_cbdr(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
+	struct netc_cbdr_regs regs;
+
+	user->cbdr_num = 1;
+	user->dev = dev;
+	user->ring = devm_kcalloc(dev, user->cbdr_num,
+				  sizeof(struct netc_cbdr), GFP_KERNEL);
+	if (!user->ring)
+		return -ENOMEM;
+
+	/* set CBDR cache attributes */
+	enetc_wr(hw, ENETC_SICAR2,
+		 ENETC_SICAR_RD_COHERENT | ENETC_SICAR_WR_COHERENT);
+
+	regs.pir = hw->reg + ENETC_SICBDRPIR;
+	regs.cir = hw->reg + ENETC_SICBDRCIR;
+	regs.mr = hw->reg + ENETC_SICBDRMR;
+	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
+	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
+	regs.lenr = hw->reg + ENETC_SICBDRLENR;
+
+	return ntmp_init_cbdr(user->ring, dev, &regs);
+}
+EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
+
+void enetc4_teardown_cbdr(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+
+	ntmp_free_cbdr(user->ring);
+	user->dev = NULL;
+}
+EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);
+
 static void enetc_clean_cbdr(struct enetc_cbdr *ring)
 {
 	struct enetc_cbd *dest_cbd;
-- 
2.34.1


