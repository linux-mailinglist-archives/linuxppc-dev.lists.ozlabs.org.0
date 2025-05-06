Return-Path: <linuxppc-dev+bounces-8338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83717AABD27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:28:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBNh3QVQz2ywR;
	Tue,  6 May 2025 18:28:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520084;
	cv=pass; b=LGV6RpzmwaGb5kAosEnHJ7ffWnBxJrh3ttlaIYFaqXdHYjNXjriyysN+Q/8ol2xsDd5ciCO6lcNB58INjyq4jgFSYlYCR+ODEqioK0XmpiYlWEPAP4ehq/uq+d0+nE2tK7AsHJSXRUD8MXFZvxgY8IcIQ3rThrvLylMGYoATNqhafaE75wbEZ6gTEyW95fVF3qE2jSjtCUNpPwLLzwo2oTJ3nSyDDk8DUHh/0Qry7bSU39kbWKzELLqYd+DzTGFHUxlwgMux/IyivJOACtKJoKqxgQ69gWzFR9bmru+H6HoaV7ualvQbDK3s+IPqA6VaxZEWud8DJZ74W1XBwSCUhg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520084; c=relaxed/relaxed;
	bh=6fPGUSqqemL4FAWYECasgioS9iVgbfqL8AjowoCXdLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fwy3sq7LOYhVDKOL1Aq33miLCl8p3o9fdw5MNx+Rhia3XDby7GH2tDwMtwVcTrOGNqiUINNOfqvVOnkPThzLslurB4JRRC13iCZXXsrRvqUU3jfT6keILMfPcqw5qsV0mEXaweXvd3QTwmdb+CYi+LXW/CYQ/kJVA8L4LGv2Gr2PUmQQOnGeYQwrbfjTDpajYANRylMKtc/+f2sEOGUSijChSdR3xnn6xbBwZUYAW9WJyhPDQnRvYMPPCfjh4OHlvOpJjHtkhMUIyW27Rbe2YMMGJlJZy8b7jsj9uqNucH8+BsJ6nJiUbM0d/JGyT1n5rnQoAWVZ90TTVZklLfIpHA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OF180iM5; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OF180iM5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBNg5JK9z2ySJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:28:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKR3Zw+0+WZFQhXGcK47VNlxJEnoDPR5c5aA4IVjEKL0QsIDgQ5SEiJE39TrTcXl+cX3gVf/UKYyY6Tfp8wcFvCDGT1cUdsDzH9lOZw4pVayHPGEA4e319chrEIjddEli7wHnt4+gbew84/W/h1xkjeZu4e4vx9l4mv4NxPGOy24Zt6Iyrd8x4wb6e4FxL1fkjz7jLIB1UPrKk3HCVjUXdPxN2qeRpiju/BLJQyh/eHwHnhyxKJ6wsU4WK8Q2CWp7Eujw5Ijb23kwhMFm7yYiCXGJ7uJTPgg6NhG5N+IqWo8PgmPyKr/EQAQnlpI0hoVekfQ0h2JOUTHb4FwQ6RjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fPGUSqqemL4FAWYECasgioS9iVgbfqL8AjowoCXdLE=;
 b=fpMyYpNWr21AaX3o+Dg9x6WtIXnCykaISS5jp1zumCz0+ZLza2xIv0ztQ1Rf1JbJ/YGVj9u5wmZTyTD1FcyXKKl80P6c3Wk7tWSQs8NziTV5H86dGtTUAKFlg+ofwD9Q1UjKJuRhohmSIrtboytFHCl0vlSGe8xhhb0k/9/ueRtp8lDjC+iuc4RzCC0RpVlG35kO37MYydrs852d5cPenaICCgQPo2h+mGn5fXDeKNx8vSUqtBHVripGa9ZtJf4J94ou26RGLDQdCJ6tX2QVtK8aNzZF+2rWQLxcvOvd+tduXyT9GhU+5CWIxOG0S5VEA/P6htRNqd5KK1wuPNRlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fPGUSqqemL4FAWYECasgioS9iVgbfqL8AjowoCXdLE=;
 b=OF180iM5SiO7zHcuPnsP4abNJlELTOBMRZyyxwL/0pKgdZjeubKKwaE2CXVkNU+NPZz9ZpQymn88CflhMm7ULDkZSBd3k7VMoYSYnUoXTtdlzowrBlnZwtTc036LRc7rKKqV1sYznFvr80snxCxKrAWUTzVFNnGOJy/j30cQRVjevfXwQO0JsMRWr6bzpRNZcpHftSgIuYhX8s7XLMhJxhxkKJARSnzoIxMpfOX2azAvn4zO0UOvtzAyH5vHpFkqFzPqFJWVtKPqUz2ti13Sfs8892FtJBAaZ0U0cMbKxuqxXMH3iBtdoJLJXrdFtv/Hf5ByrHt71KlZ4+za9QuDgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 08:27:41 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:27:41 +0000
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
	linux-arm-kernel@lists.infradead.org,
	timur@kernel.org
Subject: [PATCH v7 net-next 11/14] net: enetc: extract enetc_refresh_vlan_ht_filter()
Date: Tue,  6 May 2025 16:07:32 +0800
Message-Id: <20250506080735.3444381-12-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506080735.3444381-1-wei.fang@nxp.com>
References: <20250506080735.3444381-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f0a5b9-9bc7-4a0c-da09-08dd8c77de17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZN0fFRNMwHiLT0Xcg4gQ+6f3O8tLhisHxB5Wph+hrYNn+EvLb4MEOmrzoaWy?=
 =?us-ascii?Q?CTjWeFhTj5UOnKAUeaJ/dxOmzj+S3+EpQe2tK2pEt0TVhWOdLjuG5L5Ss3jS?=
 =?us-ascii?Q?y91ISWd2TXwK/xYN9+BbW9+rL7leWHbLJoo8DicWmcjyvjJJmHlTZcZiIGSi?=
 =?us-ascii?Q?Q2ttRWbBu4C/iV5+N5EFB3FPzwkQcfmSd/QG0DNzuPrhn8/ibkrCp/Jgmtjz?=
 =?us-ascii?Q?50Hk1Z568cZFw65/5q501oUMnO6RDlx3TQWKdeDRSGHjQlzpuDat8xzl4hOE?=
 =?us-ascii?Q?na7zqrJIasJ8NhngPiUz2vx7ItuI7Cv2WRIJVuEYZlBrMRNrxBZRJxqDO02A?=
 =?us-ascii?Q?dC+drLL1y+xRceNB7CWGWYhI+9Q1ZnBhHjINUHRppq6SGIjfLz3yMxoF/Rr6?=
 =?us-ascii?Q?z8VTDynuXb9TVjWx+0vxzjzapQdtWi77MZbhkPkSvfYQh1/tcOJikaL6qG+l?=
 =?us-ascii?Q?PV0gkvkZ+8kzXMamxLKJK55JWVj3lbaSw3OHnOrJSnusYpA7ciLhthU5Du3w?=
 =?us-ascii?Q?QllFkmFKhLxOmpjaFdOidl3f5yPCZzPCy+Z+Ks7Cfebx2bFY/WIqd5sAgq2o?=
 =?us-ascii?Q?RAVh76r/b+x1oIgTQW2ZTUxZPGuDOR89y1pymr0WzgXnuveDmvvxsd0mUmb8?=
 =?us-ascii?Q?UdveqoAt49ff8bbKSCU8Z/ylPCw6SNbZjQBmVjmyTjzuD/5UcGv9PoPZsd7U?=
 =?us-ascii?Q?PpFMF+WOrTiC4E/83PlEFn8PjTHslN5BjqZaxnmtxaNgtpNBONdXI0CjkPmY?=
 =?us-ascii?Q?VETwjL0ddqLwEXJTLIBE0aEX89XN1/w0iUfps5124gPO29ES6dTq3x7tDvmC?=
 =?us-ascii?Q?7Ge7lpEWhLziMoOiedO/IDX56l/p3uTQ988jZNLXiEZHz2EZE/qedngwocqN?=
 =?us-ascii?Q?kDG43pM5SfscX7lXeJEPC+GO6lP0ZltOxElI74hlYvqCRZdXqKcMI54f3l1a?=
 =?us-ascii?Q?i1wD+Rw0Sg4TxIMth33yMh+WuykSRTzWGrVWITVXMOl2MJxtXhSabMnUkZUJ?=
 =?us-ascii?Q?H4xwPPEWsXWEe4w0nv1XdTHdF1PcIBbGIdYdrkbUszjyKPIABl9Z5wDAPjIS?=
 =?us-ascii?Q?S77srs6o2SQboO0Z0GrW7VOIm421eEWkj2N5tQrzE0VsRJWwYjKYYY9632Fn?=
 =?us-ascii?Q?yAGEO97yz+n5Yny/Ena6l8Ryq4JjTJ7rmH8B2G7kRIqi+szPWOBd7Q/UYRDW?=
 =?us-ascii?Q?GNkzwfwKISPRqVsns51bwrg4UaBxECF/AJsDhjCjkOVrsPrirpImOIp7hJwI?=
 =?us-ascii?Q?j6ZB0IJev4hsFvoT2Tn+fjX/9+nTJ33BrcEMtdeE0i96JbBX7vzpK9CIdY4/?=
 =?us-ascii?Q?o69QvQWIYoog2vVxomoqIgElqVluAwKO17cjm6mCqVb0v/k2scHFURHRLBk7?=
 =?us-ascii?Q?KHNg/C5PDm0Xc6DXilpkd5lxw8GFuIv117cXcDWny6IxTjgZ5SqdSgnAOQIF?=
 =?us-ascii?Q?/u+l2zDngDK/cuANO/lAWcbjpdO8cifwAKFB+qjL1dTfhB/nvq28mQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ee+2ONbnHlru8gwaEnzDm00tXNUhcKAJKfyZe6dLQJbnCjTHYS7Sw9DPYywA?=
 =?us-ascii?Q?AQ4ycOiXZA3ZMD13A9KzOUTMr6Vk2uQ5U68WGF/9sc+6w74U9T7/m4P6F7Ts?=
 =?us-ascii?Q?ynt4tHpIVYLNxvM2aDkfpupBzWtJHd0Zt2C0JNVHJbXhEqDMkxbCsNYIyIP6?=
 =?us-ascii?Q?EXhkjR7yfNGwuWf+Fbo5IScnpIkdfgtwEP0MFWNUNIiuYmtpHmvRcRtsePXQ?=
 =?us-ascii?Q?O7sGTesse93pPiMNRvOp1/cdvQsBgTQquKlkEdDCUwMrSzr68whtGFsQ0Fz3?=
 =?us-ascii?Q?bPoQnyDX4fbuXI6IGtMHtJUb1IQpydpTHrgIblWaIr/QvLNDfzbqwbBpKZmq?=
 =?us-ascii?Q?XJ8KAEmcupHPZCZoKyyQ2YGiFVV5pKeUwjuINApAVpYyYHlxhsdcA0cix0Nc?=
 =?us-ascii?Q?Dul8/oNpYLQe0O7Iw5vu24Gtg1bd9PaD6nk7nt38tRAmDMYjQckbh9D4N7HG?=
 =?us-ascii?Q?rkIyfSgcaZqFPkrjFUJl0sX1dIzA6J3El6bvK99UerodHhdDIaoJH8dgOSXL?=
 =?us-ascii?Q?4q8ep+63x68XI+FpOHklKYqlYOAIj1VGmAcRbWoXjrgzW9cKCekdWzhtqin3?=
 =?us-ascii?Q?eTL7sP1pjs5XbZyrZpa/xI2Qol49k1mRx0gLecQtFu7OtacG/aJECTczVXVu?=
 =?us-ascii?Q?GD281UOKO1moE3bJa9J4Y1VFCIIoH8h9JySBpc9bhfxS8GHgjvCQ7Hpgl6t5?=
 =?us-ascii?Q?tr+j5UJJWDzi2C+8u7fyl5sFsnXOiOlYvlw8+0tay6/okIMsPGP21pTlupSK?=
 =?us-ascii?Q?dUpRxp11xwn1wYMOXpthmX9+iVm8cTf9Z2BexFDYlAAjUKlqV2mt41IMn5a5?=
 =?us-ascii?Q?pYpQFnsP1iKszeOoltSqM54EBGFU73dBjiDy02FcFfJXbxIztRSA9kI1h8w7?=
 =?us-ascii?Q?ESHHHtgLPWYEOxO6G2oP+MGJCsC4jp7dOVhAHaL4bhVSbB8/b2V/IAEBJKsY?=
 =?us-ascii?Q?tk29KB5JLo4a4YLCPa4a7BckQB6+By9iJZylqoT3nf5VPc4IYYIRz7nozZdD?=
 =?us-ascii?Q?W2IYCvKbmNPzxbdVoVZQTXQSxqwmuQYEsJ1AuJhckGIrTkpGDcko0pszq+rp?=
 =?us-ascii?Q?aWs417cceJjOLfmtNXhsyYJ5UyIUg9XLuxQ4iCnQOVfs9APyxjD+i4420ge+?=
 =?us-ascii?Q?hE3K9/QMrnUDoWDXEbgTggJZai3k7TX/4uCzTcrRkDmReau2cJXOyCc+d87H?=
 =?us-ascii?Q?hcHuAWZPYv3xP9miIFuyEDF2RV/Xxm5+NMhWW2YTm3c+so/Wsnd1MDksvg25?=
 =?us-ascii?Q?ihv6muBcba6Rnujaa+PlWC1hECmO6iN+S2bTe6YADjXLV6MbpsBrhzaOTxsk?=
 =?us-ascii?Q?tBB6MVfK+5Q+3BeIDv7ZNygYajokr/aQ29UxhQE3mCE7rzYP2d+yKmMtxaE9?=
 =?us-ascii?Q?YKThjfHDltqA5WRTo0qLaalxbaVlTfVPLwlM0pI7qUreFYcJPDW5o0/jfmNF?=
 =?us-ascii?Q?rGLg0+fimEvEreTd+fSJf7i/amcveNLJsjfLFTywMx14Pzd6f5BYlE0GqFa6?=
 =?us-ascii?Q?MkM5TcARO0GuU4PjG+5Lj62Kg2dzvpH52wELvG5s/XnBNgyAkeMY3F/sqxuN?=
 =?us-ascii?Q?1O1yAZsCGnSoUfOZ7+G8L15VV+DtXP4ymwdHRlZ7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f0a5b9-9bc7-4a0c-da09-08dd8c77de17
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:27:41.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKn15CtErLSOSNddLjnLaVLXgC4FboZp6gfoL0zueU1hSRE3ptU/TEYYJxc0waCzhKqY4sVsoj7ldb6zHf/Hnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extract the common function enetc_refresh_vlan_ht_filter() from
enetc_sync_vlan_ht_filter() so that it can be reused by the ENETC
v4 PF and VF drivers in the future.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 8f2616fd83d2..ae2dbd159ab4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -234,21 +234,16 @@ static int enetc_vid_hash_idx(unsigned int vid)
 	return res;
 }
 
-static void enetc_sync_vlan_ht_filter(struct enetc_pf *pf, bool rehash)
+static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
 {
 	int i;
 
-	if (rehash) {
-		bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
+		int hidx = enetc_vid_hash_idx(i);
 
-		for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
-			int hidx = enetc_vid_hash_idx(i);
-
-			__set_bit(hidx, pf->vlan_ht_filter);
-		}
+		__set_bit(hidx, pf->vlan_ht_filter);
 	}
-
-	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 }
 
 static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
@@ -261,7 +256,7 @@ static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 
 	idx = enetc_vid_hash_idx(vid);
 	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_sync_vlan_ht_filter(pf, false);
+		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 
 	return 0;
 }
@@ -272,7 +267,8 @@ static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
 	struct enetc_pf *pf = enetc_si_priv(priv->si);
 
 	__clear_bit(vid, pf->active_vlans);
-	enetc_sync_vlan_ht_filter(pf, true);
+	enetc_refresh_vlan_ht_filter(pf);
+	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 
 	return 0;
 }
-- 
2.34.1


