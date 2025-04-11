Return-Path: <linuxppc-dev+bounces-7615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A96A85963
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:19:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt1451D6z3cCM;
	Fri, 11 Apr 2025 20:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::60f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366680;
	cv=pass; b=oEN77NLZhJr7bhqODk+MsWjnNV6UN7xGkLSi3Y1/s5yOVTRuqAHBN+A3KUF+dtqc30E+XwpV0LzI5BM/wtRcr1WsrtjpadV2AC2+OpTV7VcY6eoWbArBVUSpL7CESYjm+5nJxLKl5JSQzjYjV0t79Kvyba2BvB0bp+ghH2E2sM5VpCOW6WtBssgVCuXZJK7qmnzufe8i/3L5Gb90P+yNjDH2UtvVin0KmzKQebXfNc9uBDlX4ti0it/AS6JwZlhLM9p/uGMCoMCZpUSrcKtSne6x1ZsWyrepvyAPinglNvu0vBzHXNHrtB9pxXr39Jq7tAxI/FZdtnTQb4VInS6/EA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366680; c=relaxed/relaxed;
	bh=b6qd5WwkupPB4CzTmiXmEiyLijwZnXHBr7Acr0eGQ1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GwR8w/e18phxv0dzGGHonn9dwasqCNPKK96Lgr3nE5IWzSy0qNmW2Vjc+CROd8KavrwWhwCng4BIEhxc+3dCA2NzMAP38okZ7kBVGVOgganTLNac6jIivd7eY9g4d8gU6jdTLNi2B4Oa/1aQ5rE9phAhn3kicQFsxBr9Umoi6zUrabH7blh66dph+Eg5sj9WoDcqYYZauk0y66NrQbD3tfvynca6zXE6HtT52sQl2h0tdvXXiCwHjlK1xDaICXIEb6ZquWu/uonmOs32QkQTypYrH0V91FKFZY7CtoEGDXvDtauJ1r5RCDGfoH8NwDYEbERKR/UteCjEPBkcc0l5kg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Dlo1ZsYr; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::60f; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Dlo1ZsYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::60f; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt140FYvz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:18:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7A8pECrWopJ0f/eACWLzAsAjhVSlfG0xb94psd2Wm7SsXY4G90qwpVO9giq+ecoulCpQoq6du1jAwDiHWA9UXCE+5rN4okKhrhQ6/cpP6pzGM1oa2mbOS8BQ0+zJ0leNSLpZkcpZI3XQk2aqeyR0AqebFdbsG1L8ANkBDzPanjeZabes6EjkC4OXcIIFLbTywqvNzpGb1Va5AbEo1pBpiWulQQ81jmmwpmykNSzdwxlkN3Fy1XSwTBFQRO8hSGqCCGD0kt36533hNK7VfmrsfmB0/HAuVjK0OdbNGQlfhRVvY52RbdqpsPNpJUUsMyRyfqM80oxxXCTbG9PoH2bCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6qd5WwkupPB4CzTmiXmEiyLijwZnXHBr7Acr0eGQ1g=;
 b=aj8qThdZ8d/I8TtG2Arkz5kRDrI2ycnbNNr0YP+dArl9U6kVUHCSgRP2wi1fUsB8i4Su2IcBF+W2pfC8ihBRDJ6uzrOWeUUTDqTbhuKP4PW2Wi3+yMpJVpEQEsBsqUgqgcVdcN0sX7Smao7fPCxQfwN7n7JjTsavJzwuRvtFY3txHWHWeDoz9UnoR3PXnTMkCb8V+8TVOO6dZnGs3kyJ78LIot80pKEfg5PcsU7XnY/QEG3w3vC7a4F2upcPITNABhBnnOkMpyyk283ry2Vyzn0Z15j0qyfR7gzibtrMZAKRwIwc1yW/ZG6KCq9Syc0iZCplczec3NfH2zo2uQ8EqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6qd5WwkupPB4CzTmiXmEiyLijwZnXHBr7Acr0eGQ1g=;
 b=Dlo1ZsYrTT2DPKtD8JXtKWGVKq6XXuwxt9J9PJtfR8la1XEwNFt6JoxAtVEnNtp2PwQ/BtMIHgIgm2e2oSldMDgbDD81S6RpRhiAWLsZSRoO4n+zja0C/BQskLhYFoKQfzrpSIDpMGqO2bpr6gwDQ2cZQBhya3PaQcASXzw5RzHtc/B4E0osOHGZc2vghAi5SgbL9kGGwk0E9x0E1jq3aI9y7GyVINtVPKOf1Skq7idJA5GJaHJ++XfXPcvTRGEDkqxbZjDCbPbxEREpxlVGADnjGtMmRSTp1cKnH9tHX1pBpBiANM96yWx/2s6iWOpk4MOHdznpfVxH4tPF59xCZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:57 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:57 +0000
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
Subject: [PATCH v5 net-next 12/14] net: enetc: move generic VLAN hash filter functions to enetc_pf_common.c
Date: Fri, 11 Apr 2025 17:57:50 +0800
Message-Id: <20250411095752.3072696-13-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5c9260-99a9-4055-59d9-08dd78e22105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eIzwXuM/edCxxqB3mKmq4MNy/eAH3ekKZmgP0Twzsw5re8x/BPEQa88gqnVU?=
 =?us-ascii?Q?dvhnv9/YV/pw4423Xkbqxv//dCP/l9Vu6ALeTNC0Y0eDM8PXGQtXVG1GsRhX?=
 =?us-ascii?Q?+xgdy0xSwexbQvEXRW7Muvu/nBQLW769lbXBGDlNQWsMXsW6y7FuV6cBItEJ?=
 =?us-ascii?Q?MdWkZ5RGt1Glgm4PRcAtdlOKU5Q/NcyT65MxzzbFDKN+ElJY7X5Ro/oreROt?=
 =?us-ascii?Q?QBhMJy7y9KmCYr5p9R3kx7JCtLi2wUY7EkrskKjDF1gRNqnZZ3nLqZ316bHj?=
 =?us-ascii?Q?5xbRytU64LyCzs+NiEpXKcGCyDoZZlpCSSjnkHUS7iodw+mNDNGK6f6vR2F+?=
 =?us-ascii?Q?j3/64PC34Tc5KUMDlMOhqTwoZ4rswkHZ+mY2o5xOMmLpTH3lbO8xcxn+cEfi?=
 =?us-ascii?Q?yNYD+/u8/t65BFiyqL3ww37+kpiWFZsJlUyHCzu3/AMymlA01B0Aa9U3a+J6?=
 =?us-ascii?Q?FBPE5SnXzx1hkfroNqkjK4RGhpLSfgZ6TMVJ7m3wXbJBJgaZh6zIForyQ/qc?=
 =?us-ascii?Q?PsGFH5PxRIIcCTlHV+uaaPoWG+NfInd+JODOjrW2+HVc5lrsjgsjju4F5Un0?=
 =?us-ascii?Q?dEwbXGdMfmH5O8+8ToJZNKZnvYlQrEatoU0D5B3FVRdBFDDodOfDWYYrzEeW?=
 =?us-ascii?Q?2OMFfPy7zgbNzIxdJc0UNytv0N9FZ1BiQwDtH7TeAQNVtqWD2FhThPOwSkCb?=
 =?us-ascii?Q?/KmZP+FtJWN3/YHTfHk5eKae2ImoLBlIqOrqP9kBzkkiT288iv3bsyVIzwBa?=
 =?us-ascii?Q?RBgEKAgElLxct2RJYDo6Up3F2OffVTY+xZDK0JP61nxzlZXOdBoLyuC8kqKz?=
 =?us-ascii?Q?Dn8CTt3b8fvLf4XvvZ7fb4q3fkqGe7nurQ+sA7/Nqpv5BhKFH6clfWPkKXNt?=
 =?us-ascii?Q?fsVsL2RwqZpKo1WvqRosNy3Ka3puQLJQ+3M+AsGfcc4741LJQr3LtgMmM9p9?=
 =?us-ascii?Q?+kySoPU4POw1I3hrUBu0zcmxiDmElTuNK+geDaG/wP+v5YlvYlXUutGULUU2?=
 =?us-ascii?Q?X6EitBAFXzC6eD4pJImoJKkG5f9L8p3f9PytsdH7DLmT2TNX2lkXiw9TUVXO?=
 =?us-ascii?Q?FyHTu8lGNXw9Egdze/6pJjSY9r5ti+nEMob7mgjjjqfrKC9stUm553QNdl7w?=
 =?us-ascii?Q?lwF5Kkb3G2wDQAmqTbeh/+TEgezqtYROFT7JEU94DwQ5z7o3NFDASc51DKiU?=
 =?us-ascii?Q?jB/5BmaObk6v3MhG7JfrNVHhfz0HxjV9wTkI1yw1jHFKCMomihMEJIqgeYPa?=
 =?us-ascii?Q?TPQ8SwmCOp1dW5w/jzRXOgZzBZpZjVHDTbkOkDiLzkbyv1lmMxzyTDdEqCtH?=
 =?us-ascii?Q?HUeRSUhFO8Fls4nSURxV7EFp91pbxfMCBGB0QzUr3M1QSx/jOlDy05WxHeTP?=
 =?us-ascii?Q?EMKZB/gaKWaWArOTpfDD/camwhx113G1bLgJSgopXhRWpln7Mwa80jJmbE2O?=
 =?us-ascii?Q?SOYt+l2Zkbaya9hX/dJ59kyWkPTXyqwVAt7dYu50pbtmnA72cChpAg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Abe9vtZnYPGM1fP07GMnyYXrWUhrcnHlZfeMThYxjz9XobwvpE8vSB944c1L?=
 =?us-ascii?Q?CF0vJj1fjnTovLsNeLwOLj7tmR13bkFA+7QvQq8LoKQzFvn+sdowTV+ROGvx?=
 =?us-ascii?Q?QC0LjF8Ly99C21GUCfMTLY4MlqNc0LjvREcuDaEcNOJWM2uZzssdK1n0pMuB?=
 =?us-ascii?Q?Y/DQhDo346wrYnY1Z2gecMZPbl1MUwAYTSKq6iEjSeMvABnqVMa11CjIqKcZ?=
 =?us-ascii?Q?uruOg6n+IxMkfoj8ndxybO5NjroL/UNhfk86Qje1v6DZ4BlC+Ab5FQkFJ4JZ?=
 =?us-ascii?Q?dq8hnKxc4y6IEyLo4ng1exYOcNmN/KR2U7S9F7tx8nXZqaFA8276+NwWUGiA?=
 =?us-ascii?Q?JxM0TByVrYJVL35vQML5R8TpbG/mbjqN2YLrwZJLnltt4MZUcdEL1K/kDLs7?=
 =?us-ascii?Q?EJqhl888a92N6rskMNgiDoP1nArc1rxnoyoVX0qu0eA5BAgjrlyv2S6kywaV?=
 =?us-ascii?Q?HCmwDsKoy/e4a0ZLBLgPzq6EogoSW4g85bHwRwmd3SD0yHL2zJLTx4ci+LaB?=
 =?us-ascii?Q?CgYyHaw2f7fLNVNXgtNGMx78lf9Q/hJob/QYzO5JI1fzinlnXVvizbdJEkos?=
 =?us-ascii?Q?vQuCRKdouNzK2vqmkMzuKuRgcRFxLVnseyY9YFQ+WKAtBZ0o/HiggZIHQBOo?=
 =?us-ascii?Q?SYiHRgsDypcp5CAo+p4EHRKRs8SBfWFFbwq/4rKIm1RrXKArDCh/j0E48Z+u?=
 =?us-ascii?Q?/GMAxOGoh2jfVCYB3Cs5yMTB5thn2rqk5fKPJNykZiQ4nmKmdqPfKnNQ34RK?=
 =?us-ascii?Q?H5awl4VOlpvgEB+Q0LwGi4wQWLYqgO+dM6Hez20qC5WyDdxk6NkzxgcvZOCH?=
 =?us-ascii?Q?ku+AsUUrf5fPc9Hg4BV3YPuTGCcM139VQ/m1vK2IYL04pstJg8Si7V+QCLII?=
 =?us-ascii?Q?F52GCIkCzfX4XNcN7+2Aeb/prlHPZdPOCGLtesRMOzMycBQ0WwwHeFlGMCQd?=
 =?us-ascii?Q?IFltSmo/CckFDIFu0X7ZyWiCgwJ6mtSOmTf6rK0jZqpi4zGU2LfcZxMIyX5y?=
 =?us-ascii?Q?jXKJgWtxczCB8UlQR8YY0OiBBQ4Hc2vVvbFVXsFW972fNKIn7vKgxrA8ae+p?=
 =?us-ascii?Q?t04/x0eMV0w8rnNifrmQ4eafYRxMZKT1fHBxQge6EZ4hLVw9mAC4RKNyoFN+?=
 =?us-ascii?Q?/XsOFeNZXAm42XtBZmVOolIx9A7npGcCH33/Y9x+iY7SYTKmrY8hf5zYKFKb?=
 =?us-ascii?Q?Nw21exxyijx/4fl+uRg6+x48Eoajdz9XMMtnqFvqPn2fzNtmR4W8BRG6X4m+?=
 =?us-ascii?Q?EOKyTDfE5W038+ktBwazg+AxiVQrjldOOCdinnlzJGgqDId+QTa7O/ClK1j7?=
 =?us-ascii?Q?WT4p5+PJgguM7tK96CfIloQRHWGjcUJeXMOncNOarY2XCI/pei5YZx8i2WOi?=
 =?us-ascii?Q?XOw18Z0qLErIjRg02bx0Yrl3EoSlr3HgGj7C64B4Pf1nTzs6uBmrA0xCcr3A?=
 =?us-ascii?Q?y1zU1drR61MdJ6fbPCP4deMdwpmE7lvgYXwHt9K3nbpSzORgRCWdeY26xLmm?=
 =?us-ascii?Q?7TD1u+/gPhFMof89SwhWvvuIsVFUai64EL/Utj7wErFg7ZKTBI9idm248ATy?=
 =?us-ascii?Q?uXstEWvo/a+xQ+vdnuc9ZW4fr/y8K9pTj94fOWMh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5c9260-99a9-4055-59d9-08dd78e22105
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:57.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrOpvg1C93dGJ65brvjDuY0XQwkaR96sVbXVcvlDnQMtSRWzm9JYc52Vr5SnNRKd/HZaEqZZA3xCONITeQZ3Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The VLAN hash filters of ENETC v1 and v4 are basically the same, the only
difference is that the offset of the VLAN hash filter registers has been
changed in ENETC v4. So some functions like enetc_vlan_rx_add_vid() and
enetc_vlan_rx_del_vid() only need to be slightly modified to be reused
by ENETC v4. Currently, we just move these functions from enetc_pf.c to
enetc_pf_common.c. Appropriate modifications will be made for ENETC4 in
a subsequent patch.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes
Remove set_si_vlan_hash_filter() hook
---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 57 ------------------
 .../freescale/enetc/enetc_pf_common.c         | 60 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.h         |  2 +
 3 files changed, 62 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index ae2dbd159ab4..6560bdbff287 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -216,63 +216,6 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	enetc_port_wr(hw, ENETC_PSIPMR, psipmr);
 }
 
-static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
-				     unsigned long hash)
-{
-	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
-	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
-}
-
-static int enetc_vid_hash_idx(unsigned int vid)
-{
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight8(vid & (BIT(i) | BIT(i + 6))) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
-{
-	int i;
-
-	bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
-	for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
-		int hidx = enetc_vid_hash_idx(i);
-
-		__set_bit(hidx, pf->vlan_ht_filter);
-	}
-}
-
-static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
-	int idx;
-
-	__set_bit(vid, pf->active_vlans);
-
-	idx = enetc_vid_hash_idx(vid);
-	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
-
-	return 0;
-}
-
-static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
-
-	__clear_bit(vid, pf->active_vlans);
-	enetc_refresh_vlan_ht_filter(pf);
-	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
-
-	return 0;
-}
-
 static void enetc_set_loopback(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index a751862a70b1..ed8afd174c9e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -353,5 +353,65 @@ void enetc_set_default_rss_key(struct enetc_pf *pf)
 }
 EXPORT_SYMBOL_GPL(enetc_set_default_rss_key);
 
+static int enetc_vid_hash_idx(unsigned int vid)
+{
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight8(vid & (BIT(i) | BIT(i + 6))) & 0x1) << i;
+
+	return res;
+}
+
+static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
+{
+	int i;
+
+	bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
+		int hidx = enetc_vid_hash_idx(i);
+
+		__set_bit(hidx, pf->vlan_ht_filter);
+	}
+}
+
+static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
+				     unsigned long hash)
+{
+	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
+}
+
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	int idx;
+
+	__set_bit(vid, pf->active_vlans);
+
+	idx = enetc_vid_hash_idx(vid);
+	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
+		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_add_vid);
+
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+
+	if (__test_and_clear_bit(vid, pf->active_vlans)) {
+		enetc_refresh_vlan_ht_filter(pf);
+		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_del_vid);
+
 MODULE_DESCRIPTION("NXP ENETC PF common functionality driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
index e07cf3c35001..96d4840a3107 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
@@ -13,6 +13,8 @@ int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 			 const struct phylink_mac_ops *ops);
 void enetc_phylink_destroy(struct enetc_ndev_priv *priv);
 void enetc_set_default_rss_key(struct enetc_pf *pf);
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid);
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid);
 
 static inline u16 enetc_get_ip_revision(struct enetc_hw *hw)
 {
-- 
2.34.1


