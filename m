Return-Path: <linuxppc-dev+bounces-6872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC38A5B8D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:57:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjhK4w9nz3brv;
	Tue, 11 Mar 2025 16:57:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672625;
	cv=pass; b=b6MMKLU5zPVeJWHfB96NdLQTmDV10PR2auaGMsna5et0LRvAAoloE5vnNsIhzXuqzByiGzfmRDwm7xtLviezJ9BXOmPeiEoVlO24al9mMDXuN263CoMLRWJY9bc3Z2yxQDu6cWLtPOlYAYHWu7MRgIrt6RQEVej1MydiNdYvinLnF8XmF2bhnPyns9S6KTb7sX127NkdItN9HXNNndNtLMQYWpq5FDD7nJ6WqckZWsxboRc+toukHHmxmXHYNCCZv+mkZK1FBiBf65TZlCJx7i1vAXr2eL0037S/PGhkzNBu8VjqfRDt1V1sdZSBsNFIGfzJNgKEje6BlSLOswI9Rw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672625; c=relaxed/relaxed;
	bh=nBi+JMbOAp78xjUEm3yQ6Aa9g8YVGYoiFlauD7QP1i0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Le8IW12tDviIe+N0ziVXqmCOTk5Y7w0sfSVgBdqSz9N+d5tbCLW8oYDvztr7qAb8xfmURIdP2lt+hahouzTK1isIa0jq8lsMd4W67VyVGqDILeHiVQsZZdx80IZbCDEtB0qLa2o3JwPTKYb+8sPIxmrfQXOSsJjtCR77gstWtXeoC++4oO3V4KNp2tt10qWZ0xinfYZAvKOE6AQ9JPKpAbcDbSM5gwuq/i8PuCYfky3obtAG5IjE6bKCNnAUIE6Dn1dFGKOtjUe2ds8a9xYbH/Kyp7ebKjI25pNC/we4xty7lJztF8iEFtb4R8B7rbrg7v8kmUpIhQkML/BesAorxg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bSpqgbRy; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bSpqgbRy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjhJ6FFMz3bsM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:57:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNXnaxTfHotxRQ0CdT7q3zJIv84exB8M5xoHimgmAY8SCq+ItBDpmE1Hdmc/1ZutKtVivjGhYx5Nrao8Shm9DUiZSP3JIBA46xIZqqfaeW7EFGgnY8Ns0VKF9aFx6sIsNExJ2pWMEOKXywtcrzEeTGQFCpFNIJiXZHLdjhk5JkUioBJ0xMV8aRnvxRbEppeQIkZf1krrGg1ZAYz4kJ/TcymyJzjpSbh9v2KoyyQdyyPijnmszkfxvDh+CK1iu4TnL39LU802T++59QLiDluMb9//Yg3D82nWJqHZnioRE4T540U1FvjvPVzu9iuWcZJwzcBr2PnKLLrR5LUbQmIiLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBi+JMbOAp78xjUEm3yQ6Aa9g8YVGYoiFlauD7QP1i0=;
 b=q4LCM302pGpx/yZmozs4f1C1CYkqJJVEL8W8PYpcMZWbJqdMZtbR86w4ExEaBH6ocbZkxTzpqTrQFe0ilTZ/DOC/lTrmOqo7Ku17C8qLChl3ZkLOLxUYubTgCULLExP/qpQeQOO0BLUxUJnyFdTqVU3ADnJOfRPCFuuR3jhTgxVxEBgchkmLhs+6innIxnp60dGfvr142CRD3L807iJuGZbU83Wb6NQo+ffLMBVUbT2K2neC+XsOkpVKVBQEO6D8E5KrMZQVmu3/+0aH5fH6E6Kyk4ILFvg+f+0KHR9/ydf0TNwqe/vIIFbWuLmkN2+rJIHlqi2evahOlkKdX+/GQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBi+JMbOAp78xjUEm3yQ6Aa9g8YVGYoiFlauD7QP1i0=;
 b=bSpqgbRyZFA1bMqGH+I4iZYVD/VLoayVaxo6TFjuswooNBJJjD8oHa5grs3vubNqUfB4RlrNDFXCZtwxtlN0GGBFzpcjCZRIArP5HCzs0CpHBXOm0h0r932nGd73Fjyks5qGbyin2YHryug0LL2VUPEJPY6WcEZjpICDqnv6uYpwMBuKIelKm4g6E569SsjrhC+QsW37ySPWFyqjSFQVrrvAdGolI6k2J7EdcRea/jAg2m2WWjKLSIam0BWVQCsU2XIuMIfNE/RgB+/kPylrUGdvYore8Onb6vIjN2EkfG/4xvjbzEIz4e6eTPP01PINNBnu1LJUIL4eOF8F4Fp8dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:57 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:57 +0000
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
Subject: [PATCH v4 net-next 12/14] net: enetc: add VLAN filtering support for i.MX95 ENETC PF
Date: Tue, 11 Mar 2025 13:38:28 +0800
Message-Id: <20250311053830.1516523-13-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: c18db58f-024f-448c-15da-08dd6061888f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yzxQMuFB5csI8wXV3TvXi1oq4gTeJcQaucZh38BPR4T0ExRcrb3VK04giXr7?=
 =?us-ascii?Q?oFCmaK59apZbkEZarMMfTsriI2xuAoPmtCGZDChkBDqNO3FWluxmDhvaSpiv?=
 =?us-ascii?Q?nu72HG5Uz6pPOzI9MYYg4wQWLSn8KreeGy+8zuNnD4WUuwtI8pr2A7lQhIJs?=
 =?us-ascii?Q?8Qcg0dwfC+GIAiJ79f84YdwlOBEXEljRDKZHw+wbRvGHek6vOFbt62br6yCN?=
 =?us-ascii?Q?Xigw2xLNTSMIWStg13GGiNa06JFLA76haEJtnNm9POtd3DqXrC9n3+avYcsp?=
 =?us-ascii?Q?DBqGnexGFbD1Wu5yDdfGYlE0mZIuaDKafCE6AYJmDbFyIFMCErK3LDcHOVri?=
 =?us-ascii?Q?BrA+1ARntUfkWPWb+ESFTbr2+JfiompFO0EGX+5K7bBBHVzcLVlNKFiXrq8z?=
 =?us-ascii?Q?2Ysy0ucSGxkrw0Yvb928u3ZYDU995DgAnoQXY7bzOCf+bN1Ta6l7NOq6oJNa?=
 =?us-ascii?Q?syE+dFIitfRcJBk3FML50n3YAHPVAaSdJ6B4bFN3YEwp2mYhqkFVb/kE2K94?=
 =?us-ascii?Q?8bjTDYJ4Q6zv7udxX2B+8kyzYMGwuro7xKOsQvV3cTuRjcNA3kF+f7QhVFP1?=
 =?us-ascii?Q?0RCrguylXUF1YYa7gX85rxP55E9OlIaePQ3q4ikBKrdbOhSsJw+mmEirbGNb?=
 =?us-ascii?Q?EgsLiNW1hAl9vEIHxT/RD2fTmsnRORU11Nk/kufvfRuUKpprgCl7o7AsLeFM?=
 =?us-ascii?Q?kM7jyX5V6Jn6ulgBWJak6UkQrZQ6dgR3OtPEXXiV3XYKCKFgnKmXSWFX6Rzm?=
 =?us-ascii?Q?GYBtAtHA7QkaOjIEZTZh/ZjqwBF7JfZNOZl3QJ1dYpQZ7YNzSGnk/ChbzkEt?=
 =?us-ascii?Q?VcXveTRQVkAI/jeGalJnISFB2mHfEUS8jLDhirLClk5fY/6c7vDy2xE8mqJA?=
 =?us-ascii?Q?01RcPB1uEejbn2MbWuijrmmF4Ntf1D90T0kfj7I9mTttpSBkCeKbHualdstP?=
 =?us-ascii?Q?whNxENDT8xNQ/CqLawHTKQQibUzb/RP7/9lzS5gkmFSYWMnjGRwP4iJVyYaZ?=
 =?us-ascii?Q?SCLg11O2JIFidiQWkPbkC7G7VrHe99WEzcU8wdluwpZWJN4r+RjEcr66B28D?=
 =?us-ascii?Q?rvrgC4LPvRJuuoB9Ma9TMP16CEcvMu64bH2mvD53c4SwKJty9RbSwT8vFlsE?=
 =?us-ascii?Q?2dGpAJ//TWpmJmdp1CXK3cHCToCQgkYKdqXtZjq0t7hRn2b+2+PsF9oIwcQX?=
 =?us-ascii?Q?3EjssKUNanNn3ut8sQMW7H4GCGFePJST3b7zjThKiI54KQgqf7WnUKeJ+Gco?=
 =?us-ascii?Q?PCtmBsLPRS127vRfloOSQvyedJEvEYNbEWcGdgswxAbsNr4FT4dEbJDl1yNZ?=
 =?us-ascii?Q?j51Dgcwu78unqBYkbO+9oJ6IgDsNqosEYMXKJmMcyMVo074R42iQcS/ZWmsZ?=
 =?us-ascii?Q?V3XMn6ghAWdG1n3NkyaJajAqZqmKC31guFHSSj0sOzCPW+sA/OisHxP/wlre?=
 =?us-ascii?Q?ZIdNv/0w77/219xPkGNa6+PkZT/2O0D8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3CSn/UwOcrqf0Idwhylh/veuSIzsokQNf71wppSpKVsUWIrBJ8o5puz0Yb5U?=
 =?us-ascii?Q?k1HujRINiR+CIlXr/YQPvmuoOuXfwW8J862iTcFyufNE/NvHzkC5JyDRxNh2?=
 =?us-ascii?Q?emnx4cIMtsEtQQhKJK4nF2WCbI0cFiLcpVBY254A1BXIswXGrE2NIi9pcP27?=
 =?us-ascii?Q?XounliZI7PS3gZhy6kcAX2pUYhOinFIBr6IisnYT+jmU7HLS2aE+fht9DpXj?=
 =?us-ascii?Q?8aiIGVAAcj9iQvE5qemdiKBs6bIit0h141hPpMtf+0NuNBQEWR79JcLE8jUV?=
 =?us-ascii?Q?ECG838mgmxWZwJZ9GmtYzQaIttY5Tln/pKUoXKC7Y1DKoTBNlVx+LOoja1yY?=
 =?us-ascii?Q?f9V5c3lqN8Ah4dbdckFoeHOfEC0B/QluC/2QGYSt29iTtOQGS/cbpEycj9Qw?=
 =?us-ascii?Q?+Fcf24pr8nqddBSksw1h2FC4bt0FVapkw1EM5r2iBOx3AbT5JysCY6Omsfss?=
 =?us-ascii?Q?KfE1GUogJIwuLA1HAjdpigilKjhhKsNlspRY0oeX2FzfcFJ9sKYzh4BgwWgx?=
 =?us-ascii?Q?ShmKa72qi7zW1dTIt61z1EgJDhU+1tFZ3DpJWygoZQXvWrMnkH/l3FR4uBz8?=
 =?us-ascii?Q?6waXQcdEr/dijGpIDicoMHOu+frTDRdhL37OD+7SC4Nrbkv2gqZAoNvS5hx3?=
 =?us-ascii?Q?014gPDK03A8BE3QfB6JPlssWv5ytKH4uznH19fGJTzVsgWj1p9mh6FbNAJZE?=
 =?us-ascii?Q?oVxWuzmMLL1PWqWt5ieHtjuTBg1suS5vaJfbBVAVo5p3DUajgfBVLDLkB3Yu?=
 =?us-ascii?Q?StEXHx8ePjewfQkVbCDaXxEC6lLvwhn6rztK7pLCJHaipOYiobvknJWKnk+x?=
 =?us-ascii?Q?D1xmlNILvMS0qOgFAYl/qz/TZdn0GnOh3FfGhUP7ZRUkGIzfgcBYzldAQ/kK?=
 =?us-ascii?Q?7waU7tQlGZRR5pYb6wZCDLfih6wxJMD6Ow6Dg4VvL8fE584uf32ErF2ovedo?=
 =?us-ascii?Q?DwqyH+mgZBxjjHUG7fCCgSvHPUDnm4E6PVb65snwAxseQ8HN0MMjAlufrntZ?=
 =?us-ascii?Q?LUcbUbTITwwcSht09GiCOhDkRFk7f+xaxfNZ0PiZN/4jVZWkbBeE0ll9Gf+A?=
 =?us-ascii?Q?YGahoHL+QG1CS9JcqwYW/d77i/f+Sn2/naNWZQQrkOPJtnNmPFs6/MkQWz1R?=
 =?us-ascii?Q?L7kjgzTIo9lWouNdybxNdVShm2tQ+pWFOGlJ0SqMOMllkJb63ySDIWcvoT3S?=
 =?us-ascii?Q?Tu5xtw8VBWHmZ/TSMtxHyW+52lY23xuCNSIubKoXH+1EJhT6g+9asU2dqVBY?=
 =?us-ascii?Q?02DX4UFuc8zXZDKA4SZYf0Wyt1u7MToVcIZPlyR/ahRs+LB4RlljhKLkyq7o?=
 =?us-ascii?Q?z1nZgTvUKSi39QRF30AG/EArmNsfOPtbtJQWqoBy6VtcmisP4Uxq2fTZzOTe?=
 =?us-ascii?Q?0QfbrcEVfTNYF5o9mRk0WjDxn8pxQ5mrGEFYLx5+RKlzBi4XupZUPrHrOVOQ?=
 =?us-ascii?Q?+62jTmT+x4Svq7pTSUdj2QsKK8pANWU0KGJmfq6yWgWHVmEqajCXyxocHALX?=
 =?us-ascii?Q?MFuKxgX4uH1P9Y94M99dUQ6mPkxDCOS5p0//xjAiRrmBJqGn7pBFEMYc0KhK?=
 =?us-ascii?Q?zmU8gTEDdZAkQtIYPUpEi/S252taxDf7gWblz5cR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18db58f-024f-448c-15da-08dd6061888f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:57.8440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3vlko1BQOOPxDbCXLqanHKAtMX3shtQb34JFuke+qC0p6qkZlFeU2SOBJaWzWdtucR6qijPPPZb3qE4FAcb2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add VLAN hash filter support for i.MX95 ENETC PF. If VLAN filtering is
disabled, then VLAN promiscuous mode will be enabled, which means that
PF qualifies for reception of all VLAN tags.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  4 ++++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 20 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.c         |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 826359004850..aa25b445d301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -107,6 +107,10 @@
 #define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
 #define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
 
+/* Port station interface a VLAN hash filter register 0/1 */
+#define ENETC4_PSIVHFR0(a)		((a) * 0x80 + 0x2060)
+#define ENETC4_PSIVHFR1(a)		((a) * 0x80 + 0x2064)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 53dbd5d71859..4abbbbef00ff 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -101,6 +101,13 @@ static void enetc4_pf_set_si_mac_hash_filter(struct enetc_hw *hw, int si,
 	}
 }
 
+static void enetc4_pf_set_si_vlan_hash_filter(struct enetc_hw *hw,
+					      int si, u64 hash)
+{
+	enetc_port_wr(hw, ENETC4_PSIVHFR0(si), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC4_PSIVHFR1(si), upper_32_bits(hash));
+}
+
 static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
 {
 	struct enetc_mac_list_entry *entry;
@@ -407,6 +414,7 @@ static void enetc4_pf_set_mac_filter(struct enetc_pf *pf, int type)
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
+	.set_si_vlan_hash_filter = enetc4_pf_set_si_vlan_hash_filter,
 };
 
 static int enetc4_pf_struct_init(struct enetc_si *si)
@@ -696,6 +704,16 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 static int enetc4_pf_set_features(struct net_device *ndev,
 				  netdev_features_t features)
 {
+	netdev_features_t changed = ndev->features ^ features;
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+
+	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
+		bool promisc_en = !(features & NETIF_F_HW_VLAN_CTAG_FILTER);
+
+		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
+	}
+
 	enetc_set_features(ndev, features);
 
 	return 0;
@@ -709,6 +727,8 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 	.ndo_set_features	= enetc4_pf_set_features,
+	.ndo_vlan_rx_add_vid	= enetc_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= enetc_vlan_rx_del_vid,
 };
 
 static struct phylink_pcs *
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 9f812c1af7a3..3f7ccc482301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -135,7 +135,7 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
+		ndev->hw_features &= ~NETIF_F_LOOPBACK;
 		goto end;
 	}
 
-- 
2.34.1


