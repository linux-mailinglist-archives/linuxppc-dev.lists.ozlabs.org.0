Return-Path: <linuxppc-dev+bounces-11757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104DB44C53
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 05:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ1zF1pZ2z30WT;
	Fri,  5 Sep 2025 13:28:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757042937;
	cv=pass; b=kPArAkOQKytc9RBFBlWLkgNt3gUqwd4Ik/1QgA5FA3FDIg6iTmcoUR9fJrJlgzh87WPHdcXiQv4DYnOmQI/rsz3qcEVv2mxGvq/WlLM0S9BTqOlykQ5On5YH4D5orp7g6BYOkdXiodeW6XJFTd5lc+C0SFvlVLxO4aesNWiA9ooGRQZk19x7ZyKGpRHItoou0zvgBxaOXmqon/JYIO0V2qluroQlCuOflNYIV8WrsSfKm20ehvHv9OEMMYX6PutDn0/GYYyvXLVQv7GzyCZKFs4Wzeghu1Rtrkv6CXPV+jVuCgmCa4MahYLrwGWPUotqFrgOvgZA/AYTKVpSMgk3Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757042937; c=relaxed/relaxed;
	bh=dHFkgakyNCVSxQKRbNck9whIVjsTzKubs59VTD++kp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AWFxTdsj38WYVoX2Ee4vHOKamIRHgVp49DsRsSpbanog/5RB8K44Faz5oVeSqkoT5XkiKGN2O2mvcxo9/FXqGBsPBxEcznDoJ8SdSYfXBY0W4C+fGmS6XGVBlG8yboW/3gzRw+hdiSAKMzkl5Z5hbgk022TMSvQ8paJlsZxcYHfDBryjbzlMV9ZEyK62C1197hdBSvORItSAOgIIZDAZPu8Im4bGdj7JlC7V05FjQCmTymnvqF+mZIDR+wpLKFSXCrl/AXWyxL/1HHgY8qMFXyvAnRn1xhB/gK79vRWhj7T81jiAG8yLGt+f9ef719iOwfgh1QF/rljfSU+50MPYmw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eF0HKYse; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eF0HKYse;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ1zD2gsZz30Vj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 13:28:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es4fIuVPDl0Wixft9yxKE0zHyE83vK1ZYcAtTBPkIowSWUi+tL6IDbMwudfig6P6t7MXB8i3gUAf5ixAhIAzgGCcvUh80F3KGWD/oSfgqA2AuWgrs88MtmEdtj35vpPqhHlPMSvyA7nsVg1LDu9Sg/lGNxAw1FLIxwaoEvjBFb7+/AdmBL6aCzOVlPM+5r4KE2iFJOA5QNxfoEBg18ItTpwS2t5eZhb1AYGhSB/K9M4T8VSlBmqs2+j+kzjhQmF1oeWakDarhGU8mcn5TzkcVeYbfnUkJLygOs+DCNQEmiJt1HHosAJvn/QjDzg5Q6nszaulCree8pAlT4SINJ0yaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHFkgakyNCVSxQKRbNck9whIVjsTzKubs59VTD++kp0=;
 b=GozE59RT8rLezDhf8Um8XMVKnvGEmNPkrwYBWAbA56j8DYBwhR1lVzyJBnvN+CYprFA8yoaCwrt7VtD8s9phRT3l7QZuGgFFjaP1SJzC4S/EFE3OHeQLT1xUMK2cYn2lFL2LTIaWRblpTCy856Gpuj+ejjG2Vcw4g1fAmwJb2pCPG6NiOEBocSeoM+U6EBgxMVzvwuWQSCTl+3dQDXcWWpucvXDxcoVyYqN62SOAHApvGdluGG3boLvE9KopuXcSO3DTtob4kwffvmDFUus/pntcJHabsS43BZMFD3R+lOkir+aSY5kgz2f2S0tv6z6+RLFSkMWSGaD3oirxRj75fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHFkgakyNCVSxQKRbNck9whIVjsTzKubs59VTD++kp0=;
 b=eF0HKYse7SSgpzsXcJsUVnFfCLFBMw4Rpu0dJQ5TOz7HXuFzVj6uxlkQvfOTSW+2BZMFBkKbwQ+LvD74ybrBezUCMnKVErIGfrBOzh31CpmF0EVOQ9KkNUj6G6rh3CGEoyaeqz2E6XgsshX9uxRPhk2uBat4FiA/FWSXcgco2or+7Vl/MA1LjWBm1xNclzEgV415iylNHEM71du28uwoDfhYKAc5aCIXAEaN3aXeK9V9cIHMb2xgZpNuMP6I2UysZGdRS/YYgj0GujdP+wAmNYxKBIhdbhUGmAUhJBuvXw5cR6VrP2/BJ2V9CiCEQRJsaVhJSB0r4stYAvE5mhyzuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DUZPR04MB10013.eurprd04.prod.outlook.com (2603:10a6:10:4d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 03:28:51 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 03:28:51 +0000
From: Wei Fang <wei.fang@nxp.com>
To: richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	Frank.Li@nxp.com,
	yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 2/3] ptp: netc: add the periodic output signal loopback support
Date: Fri,  5 Sep 2025 11:07:10 +0800
Message-Id: <20250905030711.1509648-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905030711.1509648-1-wei.fang@nxp.com>
References: <20250905030711.1509648-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM9PR04MB8505.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DUZPR04MB10013:EE_
X-MS-Office365-Filtering-Correlation-Id: bfabc4b6-b428-4693-3c0d-08ddec2c53b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ns0APdsWLaP9uaPsYDIVTX83u7uR+QnHLN8+nGUTTe2/evdApSg0aVX9s/JA?=
 =?us-ascii?Q?1P/0wlkvm79sv8CPUL421iTBZAN/ckrvZ5eSo+g70cTPe0tgyetmasuVCjsp?=
 =?us-ascii?Q?NOXI5sPBYXxlf7gvyJLn8g9FeIaPXjDIyszFKe0mnOU6wYwilQ8jW+aNtPL6?=
 =?us-ascii?Q?QJY9pyLnvOnWMFiTgA9gWpGYQX2WW0IQpOY/rC7MqNml7Becmqx3YnhlJvZM?=
 =?us-ascii?Q?uIkgBPp07x3YG7ahFG+OfJz3VCcf3Op+Q7Ta5rEsw3I8mzilJ00fmK/F17AX?=
 =?us-ascii?Q?J+T0HVs4QBkyD1yf3T1gnMrqcGUVXaQxdn4/zPIEF2g8eDAvDPeFpsCQmuAQ?=
 =?us-ascii?Q?1euT5kJ2oWYGL72le1sV8nxbkoEGKFwjV1OSLb/9XCC0hpMqj+tu4y1eCgeR?=
 =?us-ascii?Q?M1+uUkXeoJTPKNSXQ7MVoCdkV/vQnXrU+aMf2Lru9vl5jvsnlv6l0gb/J9jw?=
 =?us-ascii?Q?ruEhgNGy1XqZMQNFCKUVr4tDciWDwd9Adeq2dzVSDrohtW/2kAUUiCA0XXft?=
 =?us-ascii?Q?n95U+CIjydn/URVTDBPsMNIEgYorTEZ0hgW3kh6jo2Wo68T/mHS7i1l/KGRf?=
 =?us-ascii?Q?dsrKhKPHUkGfVMjcGQZj0dMPARMl+G7p56AMJgeXYrnteWt5aLDRXmfutUoR?=
 =?us-ascii?Q?Z142m0rikdKk3S5U2Tl3Wca+odwctA5qsxYnZOjVqwXtLoJG4kA+YWaOS+Z5?=
 =?us-ascii?Q?3baPrbV9HoCvrdpjk9d2aPxv5iSkkbkEFFbeb1Th54ApZ9fBMe4XNwb3S86F?=
 =?us-ascii?Q?n3gJ7R2qI+M4lcvjx4ZIwAhYInMJKgdMFyO1SGK0eau46o1EROIm3cabmt0S?=
 =?us-ascii?Q?dSw/tNcCBFtJfaU4CVkz2xqx6ZhnTXfrXH31VJKYIbP/gVi7PcWUWBZTNP9Y?=
 =?us-ascii?Q?FFs80vDGxS/dbUf9H+6yZf4e0bBVguZ65NnBTt+8cQItR2WURrzv7DwjUyxP?=
 =?us-ascii?Q?PD3iz4EJ+RX2RL2C4IZUDl7Aj57JcnCwdH3ZyQbkwcQPDKgPAJB/M4x7ilX4?=
 =?us-ascii?Q?Dm/XD4x5cpWFuptf1gMEN1ChKpoUT3FTETxJlIxmHmDDwhvYlsWNUXrd50HX?=
 =?us-ascii?Q?+FFdw+FzvrrXvBmpVaa72SzROGbqpU1whkMS83i/AZr5Abe2my9eSH3GdbEr?=
 =?us-ascii?Q?PWXLmDXvhyzW/PodSnr1l9DLJIZYFMvn0CKt5vm5IxdQ/8fff1yMAlF6V50c?=
 =?us-ascii?Q?MkMsDgoTmMRNae1Bop5Bvnux5UZ1J7+fe6Fy/OzSFV2WfytxYBL5b+a2A4QT?=
 =?us-ascii?Q?gS/s1DS7gjvbd7lPJOOfyX1A6prA1C05V1pLpjkba+f1B1+02GkMdsEcmdF+?=
 =?us-ascii?Q?1n5LGOqNDjtbwPQRUEnKChro0Y0HSvVNPaBx/TZ5ld8hnORoznE44da2WGw3?=
 =?us-ascii?Q?L9+zVOOny3N/8rznBC6ReE+t6rs665iSUDBYTfQR5SfsMeE05BYITp1KcLL7?=
 =?us-ascii?Q?k0u2+Y5sCXbXcRJsb9fN/pCSpoOmBfIJaATHGeVqT+qCc4KW2ppldsXKJf0Y?=
 =?us-ascii?Q?4/GgJW+6+BwoqKA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o9DNuoDH6FejqSxcEwhIEsNsmnlA3ZX4xmMvBAahjHJDiwqjrq7deL3Wev1r?=
 =?us-ascii?Q?RoLxUo3RFX/le8wPV57EZGELjyd2pus5FTf6LJf0BRkMIGJsAy977CppcEga?=
 =?us-ascii?Q?JDrc5OZA7nEEmX94uQREOLm3NalmWOZlWYysEBH9GiZLDZQFtmEET2/T22w4?=
 =?us-ascii?Q?z9UD31yq0OFjXTtlTBu3sGOPy8+bxEhiiU/R3I3n+B4b+udZippdGrdBWA5T?=
 =?us-ascii?Q?RZ8OfAHkTus/iqd1h3ur5FYkmRADpbZYtErerDcLr25wVkWIvP1f6BVPzn6w?=
 =?us-ascii?Q?kIBRuv6GPMGO/ydyAZtu4UDJo73qH+ch7WQBRBMh3BCyer7hOgO2NC1HEAZH?=
 =?us-ascii?Q?mi7p9+yfBnAc9UFqS12kao/fI3B+ABI6SQAKqnGryNy3r7n7It34BuY6YT3+?=
 =?us-ascii?Q?zmeQ8AuVed5NNTx+R1x/zdp28/nnTzNG/4BWrgHjLtLgpt+i9/PNqYNFpADk?=
 =?us-ascii?Q?+ur32mqx1d8YUSBQUrgFoWwkKhhJJIPsCHZ16TDLAF27nPp1T/kqdcfvB8hc?=
 =?us-ascii?Q?4ShOqZQunCb5A3w95tO5CtdzNAdoCKEBfn7BZZq5A/yOUKx6z+SF6mm5LVdf?=
 =?us-ascii?Q?abg5TVcllLj3uytThIysdhOOA6gZeRuJ3kfLA05ghg+2LgR34m9Ig1L10ved?=
 =?us-ascii?Q?EG3XGmURmhStmKMFeUh7Mo8Rj740svR3gQDAVAxAXsrcX9I/dlulvrwLrd96?=
 =?us-ascii?Q?tAvtYPG6pXGxsrtXzTxObLzXNu12P7Qq1b+Uc1Y+Tt47lo2Tdcok94VLHFaW?=
 =?us-ascii?Q?AemC1Aogn0uye6hBPPfovQeMb7NgYQ64CVEP0dk/gmZjrF7hG0Nu7w/Xgm0Z?=
 =?us-ascii?Q?ak84GYUvrZRqclo1ilxQqS1JHUuLtanmy4qhmCuOsE4X4tRrgUibLLiFhrPp?=
 =?us-ascii?Q?wRQ6I4gArFE/2nYS0dSePkx5VFPU1L4C9Phyil15j4cOnsC2csb2fd+/6BLw?=
 =?us-ascii?Q?7HEcOsA6Ri0pBAahFSC9RG+g4qMCEYSS4t58nmqTFJeFadTmQzdBrqK3X5iu?=
 =?us-ascii?Q?nPBFl1mr/RJhO836djFf1JONFCn1Sq9yScbGKFqmt/04r7bu2dBJKW1BjpLR?=
 =?us-ascii?Q?Fs4BE3iPC5j3xQ/8BCyWVg/m3peqdXZxpLHlrj5rF/vBZVQyXkIXhOgZ/fdq?=
 =?us-ascii?Q?FUJ79lC/Eoydhh54dDlMBxKv5Er+j0yGYRHlPGjghwBPaPzK3I3AzQMA8ZQP?=
 =?us-ascii?Q?Nbff3ICJEG1qY1U3q0bED8RUlinKu96fv/kS5NCSqYNl0BI8W2GTzTtJCIfQ?=
 =?us-ascii?Q?QmvBHHH7SeGDvbni4ZLzdJDjOKa1NNtASPt/sSmSPkPvgSiv5MSvOJW34wBo?=
 =?us-ascii?Q?YIqyRDCsLqPIUz3YelQTKkX5M7jx7Kw/4ec01UxD4Vl7++wxUduOcObquQUa?=
 =?us-ascii?Q?QgRsXTD7QJRiwHLqQ1GsyN6JXxxhmzb38BuNRUGJ7JPq4vkvLHPWhYsJbRuI?=
 =?us-ascii?Q?Ljhu57SZmib8BdkBt16wLPCl8Hf/SGZD1/r1MZuw1I9agn47PunZ41Ut8FUs?=
 =?us-ascii?Q?YRh2UTjsKhBjizG6tOLwsqzt94NCXfVYm7Y8Q83I7+q+46iR3nuSR+644vPm?=
 =?us-ascii?Q?SfBurMZ23i1uI1GwqLwKVzglWZE/4moyyGx2BLVf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfabc4b6-b428-4693-3c0d-08ddec2c53b3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 03:28:51.3737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frThWA4VQJOEqIiCP/F14n4fiPwQdsKshKd15S4xJgFqnAFsyBB+WVQ1MOA2jNqFMa2Y286JpB4TqMjusL0jFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10013
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The NETC Timer supports looping back the output pulse signal of Fiper-n
into Trigger-n input, so that users can leverage this feature to validate
some other features without external hardware support. For example, users
can use it to test external trigger stamp (EXTTS). And users can combine
EXTTS with loopback mode to check whether the generation time of PPS is
aligned with an integral second of PHC, or the periodic output signal
(PTP_CLK_REQ_PEROUT) whether is generated at the specified time.

Since ptp_clock_info::perout_loopback() has been added to the ptp_clock
driver as a generic interface to enable or disable the periodic output
signal loopback, therefore, netc_timer_perout_loopback() is added as a
callback of ptp_clock_info::perout_loopback().

Test the generation time of PPS event:

$ echo 0 1 > /sys/kernel/debug/ptp0/perout_loopback
$ echo 1 > /sys/class/ptp/ptp0/pps_enable
$ testptp -d /dev/ptp0 -e 3
external time stamp request okay
event index 0 at 63.000000017
event index 0 at 64.000000017
event index 0 at 65.000000017

Test the generation time of the periodic output signal:

$ echo 0 1 > /sys/kernel/debug/ptp0/perout_loopback
$ echo 0 150 0 1 500000000 > /sys/class/ptp/ptp0/period
$ testptp -d /dev/ptp0 -e 3
external time stamp request okay
event index 0 at 150.000000014
event index 0 at 151.500000015
event index 0 at 153.000000014

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/ptp/ptp_netc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 8c5fea1f43fa..75594f47807d 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -21,6 +21,7 @@
 #define  TMR_ETEP(i)			BIT(8 + (i))
 #define  TMR_COMP_MODE			BIT(15)
 #define  TMR_CTRL_TCLK_PERIOD		GENMASK(25, 16)
+#define  TMR_CTRL_PPL(i)		BIT(27 - (i))
 #define  TMR_CTRL_FS			BIT(28)
 
 #define NETC_TMR_TEVENT			0x0084
@@ -609,6 +610,28 @@ static int netc_timer_enable(struct ptp_clock_info *ptp,
 	}
 }
 
+static int netc_timer_perout_loopback(struct ptp_clock_info *ptp,
+				      unsigned int index, int on)
+{
+	struct netc_timer *priv = ptp_to_netc_timer(ptp);
+	unsigned long flags;
+	u32 tmr_ctrl;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	tmr_ctrl = netc_timer_rd(priv, NETC_TMR_CTRL);
+	if (on)
+		tmr_ctrl |= TMR_CTRL_PPL(index);
+	else
+		tmr_ctrl &= ~TMR_CTRL_PPL(index);
+
+	netc_timer_wr(priv, NETC_TMR_CTRL, tmr_ctrl);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
 static void netc_timer_adjust_period(struct netc_timer *priv, u64 period)
 {
 	u32 fractional_period = lower_32_bits(period);
@@ -717,6 +740,7 @@ static const struct ptp_clock_info netc_timer_ptp_caps = {
 	.pps		= 1,
 	.n_per_out	= 3,
 	.n_ext_ts	= 2,
+	.n_per_lp	= 2,
 	.supported_extts_flags = PTP_RISING_EDGE | PTP_FALLING_EDGE |
 				 PTP_STRICT_FLAGS,
 	.adjfine	= netc_timer_adjfine,
@@ -724,6 +748,7 @@ static const struct ptp_clock_info netc_timer_ptp_caps = {
 	.gettimex64	= netc_timer_gettimex64,
 	.settime64	= netc_timer_settime64,
 	.enable		= netc_timer_enable,
+	.perout_loopback = netc_timer_perout_loopback,
 };
 
 static void netc_timer_init(struct netc_timer *priv)
-- 
2.34.1


