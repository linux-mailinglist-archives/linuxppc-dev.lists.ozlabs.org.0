Return-Path: <linuxppc-dev+bounces-3570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A49D96C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 12:55:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyLcX5YGRz2xfB;
	Tue, 26 Nov 2024 22:55:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732622140;
	cv=pass; b=D4LfxcfMm1NkNsLgz/fLgOOtp4vNvgO7BZE6JEk8HY4JaBgThwFbqXaWIee+HZj6cr7jDdlc5sgaAuUFJ69jmoVTNbEvTT76AloACcVDXckI3bWR1yNyo69QpkgIJOQvrdQr5eSmBcmWF4vnMq1T/A90AdIJ/wguUfkQAaCbA1dk9VOrYITqfDztEdW+ogNCBofF8fqBdaTXmeRIhVv3UMMT9wWIn1DL3vO38knbLm6t6vXMiu/iNYImYHxNwwXbvR8SoTrV+RtBkILVePBwTMGIHyCDVpdDETa/Ljeq1T9SMX8Xk2hMCegQisU5m4KSgymy0WXqIRHs0VUD4/Q8NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732622140; c=relaxed/relaxed;
	bh=Fk+uqzNjfiUIgmzzhqDaMO9X9dX9HqbjRWfo924qcXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PJxb8tVSKVp3Bi0SYRpDLvhjBZHywa5s+4JsE+o1HQelqHO/hiVyotuzf66yLZ+akA04/6urbkGy5FupkjoE8U7iwZJJmxUJ0HJdYp+Q8ChbS8Gbjue3ZUHGPcXTqJNaZp4wGPA+a5Ge79XH/B9uLoCgVOYNC5uzPa9EsG6iFZg3sk9piB3RxgorrJ80tLl264z71Z5z5aEEj9zgRE2/qZtFT6WvwIWei6W6+K1lQOGIA8hdrYyoLZsHwQRgpTAyVim6fA/Okvl/AETG2crv7n8VMX9t8Gulbqw4Cz89Eu9YoNFD50/2H8uCVncgHqf9fznxqvyb2AAbXAWNWP7H4w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JoL2Z/zT; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JoL2Z/zT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyLcW6lZHz2yky
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 22:55:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTu1UxZ6MZX7HeoPE7kguPzOtGCL1/66sqmLWqn6BTQ9n7dlC9FFkcnkEhyPM0gsnFk0/lixGtpBybwKtZvycKuO+flPFKHqi7ZtJ5TsspV59z0CF2gMeqUAnBPpt0L7SqOqvq+ke4cfRgb59X7bhDUIuuhxDlrZz/yoMOzzfBTtDmzpBEZnoA2e3IoQ9bU2iReAe/b8ggkVlqZABeZvVJmwZA5Ih7q1Tl/F58I//DlWztbf7tnfjM/tw1nIE+jvKcFK8CL6PVPomJSsY/6nA9YcdcidJyA+AxXO9eMFqARiYunzQG07YSys5GmzW5FX+0JFf1FmNNlIAiZAK6w8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk+uqzNjfiUIgmzzhqDaMO9X9dX9HqbjRWfo924qcXc=;
 b=Fs8LwPcBnr+QLqLtAfOIXftuvrEKm9KS6DFERGYW/K8/M7H5NBYF1fxr33FkNmlWsdDfd8aM5GiCPBvEBJYgfL4UTV9q1/IbgQrocyuvAqy/HF7hYqmtwAvChT3aSrha97Uo3G1tRlNGEbFZvP7Kgxpb09DObrzucW0S/YfZ5XDq5o/QijxK2F1nJTYyFtD9jcDtloBReDQu/m5ufzdAIFU3/OObuvzXqAvsSNRXmNMV7fX/pDbDgeyU1LNcG9JIiRc++oPrHVQPIBRCG4XgAQG/PkudrMZioflLxvMqMTrED4NccgCHWPNeDNgfb/FVhuJq+a6sv7eSCNbDvgDwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk+uqzNjfiUIgmzzhqDaMO9X9dX9HqbjRWfo924qcXc=;
 b=JoL2Z/zTEqPJ9spMocNkb3v4MjxLZo7WH6MDU6C01/0foLhg8iPHr1i1qgmLYJ1hHnZptHl8t0OqSltq4yTlKqK9fDNbmTinyFIFcmLnDaP4w0nbxwiXSbq0Rk7Iof6UGE1HDN/jJoAm94riXbxI4s77v4/ofYqJnUfgYkkXLlPTqDrmW+WP7xfyIc0qU0MN+9SmlvZHjAicTAb3y3nJJzTOwmaUej9mdBeDu2O27SuQSY+UwKL+AO1suCsZgKo4esVeK7wKKleGTixIyyS8ji/BBZYs+bPhPfL6cPfyvEAv51e+0XFd0yu0tdvgRCoWMygZffZ2y3HcYTP4hZ4xog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB8504.eurprd04.prod.outlook.com (2603:10a6:10:2d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:55:16 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%5]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 11:55:16 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 1/4] ASoC: fsl_utils: Add function to constrain rates
Date: Tue, 26 Nov 2024 20:54:37 +0900
Message-ID: <20241126115440.3929061-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241126115440.3929061-1-chancel.liu@nxp.com>
References: <20241126115440.3929061-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 0278719f-c722-4eb0-b2b8-08dd0e113191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YjhOP/Ppweg3u772NWEQVQjkqIByweLiK9+IiC0Zk0entXGVcOWA5gPoXLix?=
 =?us-ascii?Q?1NjTU+2ZfJqDGlJSl/IG63XqirmFkkF/ZCqyso97rzyUCSczNpjKt20OtH9c?=
 =?us-ascii?Q?HgBOkYXgpQ494fXOSPygJY1zk4gc6daEDNc+Km4R6EXCiM4s7symY5GICQmr?=
 =?us-ascii?Q?XjBlSI06N1vE8owysKHKvUVrsjRJTGjK4xGGssBIJ0/sEMwKfusZ805s0JId?=
 =?us-ascii?Q?NrhbZINly+x5qc68IHPDorQDJZ+RLxvMCrtMIgmfIP4qoVdeImPhu6mt5uGd?=
 =?us-ascii?Q?eTlZ3rcX7wODYIUVbCpoxtk104U+u/NsEYsrmblhvmsBmmmLvvNFAKQLQTdl?=
 =?us-ascii?Q?6v6yB9VQAzms4wZ34OH6cuF0VaixJhEEmEiy9f4EyWMj5Pj3d9BtClBwPuHk?=
 =?us-ascii?Q?UbU2gZb3DI1LCKnid+ztz2KL0neF6K5hkibdCoYSFTj4FFgG+IbUMsuGOu9L?=
 =?us-ascii?Q?wFgzruG2dvali1uphsTE9o4oXbZNblwiW8EFandJXymFcv8KExHxRTu4cwq4?=
 =?us-ascii?Q?Kz/5NAeDMFGV1/NnU4XGBbfkrkY+Ec90N0EEY3XhzA49ZcxdUV7vDZkQe51J?=
 =?us-ascii?Q?om4UAbJL22xJho+KRvI/SjmvpEvK+6BlXJQQp2ZHvqslmI5Apqsx1LWg0TnZ?=
 =?us-ascii?Q?obt/yiLByQtGolPy5srl4Vq0uwGmny2i+Lan/qjVK9ZUbJ2EiY7oDRcgNRkQ?=
 =?us-ascii?Q?lZnPmZDDEC6qFKUteNvMcoZgOXx92VoYSpPR7FrVinsAFqIqlFI3o/WtNEzP?=
 =?us-ascii?Q?S5P7/CSXGXZjw3l5a6frsROIx/MqI7w9Blk8rLax90iVVEd6JAshkoqNSbpt?=
 =?us-ascii?Q?I071e9JuOMEQq4w5P8O7mhd/1xnNsjIocSCQ3PX6Yvk5ctW3Qcem4DA1dR4h?=
 =?us-ascii?Q?YLy1KDDq6bHC1jvWqA+Rl2w0Qmh3DUTVvk9L3gGRWeeoAcH7VG5ceIgOzLm5?=
 =?us-ascii?Q?SGQxDKy+zx4drkNEWRgPRzKeGZhIZcuR93l4sA3KvVaf5FIIKu2dmOm+tRns?=
 =?us-ascii?Q?w3z956bRQLWaVrJuDqfHstYz9NuRBQ321PaBsavvdA8qpHUplY57wulL7eyL?=
 =?us-ascii?Q?0MdoKXO88t7tl7sT28fzlxpvEfYJk8z7npk5ZCr4gWfQKiAivBATo5yro9ln?=
 =?us-ascii?Q?I9Ercn0pnEkWWuH/YxzFMOTmwqJi61qnio7LxDWJZaYmWXYRvWl/v37ZQ/jC?=
 =?us-ascii?Q?P+LU+Pgpw9gFEaUEqlSU68XcajEOIOaRT+OHMrXToWWZBpip9PSM4jN4KQcc?=
 =?us-ascii?Q?0M0XwTWP543lzvTWJyYMRiVR1fRvzFRtP/S42Lu+i39m321PWbC8q06pIBeb?=
 =?us-ascii?Q?73/VpDDMlWKl3+pKx2ka7XZ9eHXHZmYD/cOqg+B903RhrXQib3J/Uv/lQ3s+?=
 =?us-ascii?Q?iNdSOnyYdpvOzq2Zu1RGj6ZGy/qxPwvHw/XDhfMQFPd/MlEHCWT4D1R5RmPt?=
 =?us-ascii?Q?jIVig1WT9NY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1EyY0ykPhjlaSjMc0fGDgx0ewEiRiCW/Gv5LfZZ2PBN3OX1/jQFIyWcHBpIg?=
 =?us-ascii?Q?i/RqrLb9HuoJMX15ERvy52d517r+PCi296fBuNDMYfY4dUZj0SE5lJydUT82?=
 =?us-ascii?Q?BPP6tTBMkVUB9u4g0BDgtPIF00rcNsfLnOJz+AaKDIjZxDE3TnnM3WRwoNvS?=
 =?us-ascii?Q?dlhKzvSMuHIO3he5PHMD9VD6cGfJFQcuc0Agh+Ruq2L7u0PlZUvxY/7FYQq+?=
 =?us-ascii?Q?0Qq85uIAwyl2PGjSHcql6q9/DZ1OTEgBF1cwp3BUctXs/oeOHplfBI3ngQcS?=
 =?us-ascii?Q?kQLUrlgmMj6IErpFvGRJ46m7wXf0yA4RT5aV05CztPvlBFDIn9hWYiakgJDq?=
 =?us-ascii?Q?Zfar1eIsNyUcdqEutKaISITDqlhe/DaJC8MUmA0s8s6Eb2v01RnY1Xrzm+el?=
 =?us-ascii?Q?NbzvQbN906WD2gnN9fr5JwPw8SoVnQULDDRO8s7k8dXIuB4XIFK9N6PTsRaF?=
 =?us-ascii?Q?fX12/D01lT2yfIz9UVhomPmFe05p5fQG+Ln2nwqy4WheQjRkA4Qj/uVq/CXD?=
 =?us-ascii?Q?2UBQtMpuh15jeahBfJljNhXOmpjGKOj8L4/3Aq2njtlUhZ7tgITsmGCGzPOX?=
 =?us-ascii?Q?c3ATDRIA+8c5SBGJ54alP0lHP65TTYXMRKTO6wLHl+Hvmel0a1uqhCAnbd3E?=
 =?us-ascii?Q?zbjqA7n8e7eD4f74uKQZAeFiPry850ex0r094bz3R77BDXjNtgd9zE8fZhTU?=
 =?us-ascii?Q?+TAF523XLE5y3IXxw08jCGXTyp8OaPcXjtw+aww3enLUPdZ3FTfV2ng5231j?=
 =?us-ascii?Q?T7BhfBvZ1Fotd6rPINj3L3Ni/YphxfEr/o6F3kNMoHP4S871mjWUHOurgamp?=
 =?us-ascii?Q?Ctb1amDtho+W2wqyGefwisLcg1MuXgIXzlpyseyGv85n6W/F6lZen5hfTZx/?=
 =?us-ascii?Q?PRj50AmmziIC4itIWTQqd+ZfR+pQlleX5uePnpGEwpAQsbIdYyXWMxR23ZR8?=
 =?us-ascii?Q?Yghx7vFt0E4MfXOtzC7zA0ELyWhEr608fuqLuB85TvF55ViflfIrSoQngRpi?=
 =?us-ascii?Q?YIy0x5bIm2FD1G3gIjd+XH/eVQN4CkHOjt0eyV/4bApG45bv80UvEMe2ZhUu?=
 =?us-ascii?Q?ObaAvri0R/2NOB5wZaz1AjdVTXi7XFN2UeQ/+2wp6HUG1+UNd6wWHO26dyT0?=
 =?us-ascii?Q?h6PdhWctKRLkE6Pwpc4yLa2hnH4D+1nACWOEfROltJL1GYY3B28P2lLQ0ZK5?=
 =?us-ascii?Q?qcZY1cmYzGqI2g7Tq9SdAc1F+t43TzNSG+7EntDwZDVsaKPeiQy7iYS9Up8K?=
 =?us-ascii?Q?yW4fjLlw4y41/6Y0wlw/BSs0zdKktPDAickar0zAFymTAqNd7zLPOJQHuauR?=
 =?us-ascii?Q?JmRPB+Lc/AVfLr23NMKuoYXlqYBIuYl9G+pVYpgbZuiY0nmJQVMgfRI+vgfH?=
 =?us-ascii?Q?FMu/1OPnTZisyaa7Ec9UFXO7kJweDFD8/zRyGXdNvVfCC0SRLJMSuOOucxqX?=
 =?us-ascii?Q?TsV37mIvXXWtDNnGLS382p1putxHkSGymwDIjCsWMyuDLvyshpnq7DAJ5zlC?=
 =?us-ascii?Q?nLAQNzVUEYi2nVL1dGYpI3qZ4G4l/gCdnl6g0IhnoYAzfsugZm10QtMonaPk?=
 =?us-ascii?Q?67dl2MoAC7HssVvfkGFkalRm83YMrfP3CXHO6dxy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0278719f-c722-4eb0-b2b8-08dd0e113191
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:55:16.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ut32hddKgrYEkwBGk7/I1DWzrYEDIAmWWSkGJYNOzE3sXHWAIn2c/KEaq24Cs7dzbLFxLm49bLSCbcAYI5Ot0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8504
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Platforms like i.MX93/91 only have one audio PLL. Some sample rates are
not supported. Add common function to constrain rates according to
different clock sources.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_utils.c | 45 +++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h |  5 +++++
 2 files changed, 50 insertions(+)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index a5ab27c2f711..d69a6b9795bf 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -152,6 +152,51 @@ void fsl_asoc_reparent_pll_clocks(struct device *dev, struct clk *clk,
 }
 EXPORT_SYMBOL(fsl_asoc_reparent_pll_clocks);
 
+/**
+ * fsl_asoc_constrain_rates - constrain rates according to clocks
+ *
+ * @target_constr: target constraint
+ * @original_constr: original constraint
+ * @pll8k_clk: PLL clock pointer for 8kHz
+ * @pll11k_clk: PLL clock pointer for 11kHz
+ * @ext_clk: External clock pointer
+ * @target_rates: target rates array
+ *
+ * This function constrain rates according to clocks
+ */
+void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
+			      const struct snd_pcm_hw_constraint_list *original_constr,
+			      struct clk *pll8k_clk, struct clk *pll11k_clk,
+			      struct clk *ext_clk, int *target_rates)
+{
+	int i, j, k = 0;
+	u64 clk_rate[3];
+
+	*target_constr = *original_constr;
+	if (pll8k_clk || pll11k_clk || ext_clk) {
+		target_constr->list = target_rates;
+		target_constr->count = 0;
+		for (i = 0; i < original_constr->count; i++) {
+			clk_rate[0] = clk_get_rate(pll8k_clk);
+			clk_rate[1] = clk_get_rate(pll11k_clk);
+			clk_rate[2] = clk_get_rate(ext_clk);
+			for (j = 0; j < 3; j++) {
+				if (clk_rate[j] != 0 &&
+				    do_div(clk_rate[j], original_constr->list[i]) == 0) {
+					target_rates[k++] = original_constr->list[i];
+					target_constr->count++;
+					break;
+				}
+			}
+		}
+
+		/* protection for if there is no proper rate found*/
+		if (!target_constr->count)
+			*target_constr = *original_constr;
+	}
+}
+EXPORT_SYMBOL(fsl_asoc_constrain_rates);
+
 MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
 MODULE_DESCRIPTION("Freescale ASoC utility code");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
index 4d5f3d93bc81..21b25a11ecda 100644
--- a/sound/soc/fsl/fsl_utils.h
+++ b/sound/soc/fsl/fsl_utils.h
@@ -26,4 +26,9 @@ void fsl_asoc_get_pll_clocks(struct device *dev, struct clk **pll8k_clk,
 void fsl_asoc_reparent_pll_clocks(struct device *dev, struct clk *clk,
 				  struct clk *pll8k_clk,
 				  struct clk *pll11k_clk, u64 ratio);
+
+void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
+			      const struct snd_pcm_hw_constraint_list *original_constr,
+			      struct clk *pll8k_clk, struct clk *pll11k_clk,
+			      struct clk *ext_clk, int *target_rates);
 #endif /* _FSL_UTILS_H */
-- 
2.46.2


