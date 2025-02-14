Return-Path: <linuxppc-dev+bounces-6175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB684A357BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:18:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNhF3d2fz30WJ;
	Fri, 14 Feb 2025 18:18:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739517533;
	cv=pass; b=XRPuuHOVWnBOIRuS9ZcwCEIE8CUXyrxEZaEO57kHb2VDNWUpncQivIE4G3vn0OYLpzXkRvtjqagguC+I/Evv4TxfknSGtNcnX+DzBpEVW+lI9c8cw5hLa21OASRv7tLm7a9KpGGPi8T6XSxEjHYigIExWk/plQxyXhkswk6IrsYR/vn/xwAQT5B0c04b84DkkG/LAT7cluFfSr68CGTeutK/mvCwR3mbRNDOxCxE2w3y8TGY65f4JzpvxbNvDM4SDGqjEoHEbomrXHQioEehNdQ/u0chkNBghitvT+ltgpVt5yYLX1tJ6m8IN2Ev0i3kncn52N7uiY0XwkONQk8MWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739517533; c=relaxed/relaxed;
	bh=djZ7OGIeytxWR8I6ZeAgwHGFZjhdUKxOp2h94vljgDo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dc3DoMFIZ/gdvMMOGsv17UXZqNf3eY0Q3Ule6JTQswDaSJGF7wilVDjisQzTu5+rEH94M6KXB9mxtdI9Wimi2AfeEIVnuT8PlRk51qoHKlExahVlKqTpKfJgAbeFOXEEqxzLx7B0fg9OV+ML7WMOLgQhD3Lif86ApcO9b43E1UxlNX58qZkyRB9g7qZ2rbSs5NhuzKL5IRdbz0CSLiMevhgoOoNBGKkKfcPqgtrgRq8xzNm5eM5MZPwoTppU3JMIsChaOvNWyBxC7XT9497qgvWmPNh14Wj4S09jvg5vqyGjis6uXee17juiZ4Ssy3VBFKzHVLtTpZ1rcnqftib8Nw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JMjJ6TYv; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JMjJ6TYv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvNhD4xBNz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:18:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKcy2K1KhMcVPy2xFvi51IFXv4ptDXcso7LPcZQZcefGrWW2GetmMGbVLyZ1ahBrYUF2Tm5oIRG1wXC/3+Gc/SoB7ZMB3mz4t93VqCjnnU6JNk805BqSX/UASqiNbRDysQoHUuMVJkvjHfhjOBiccVX0XED5FXbe1vB6/zhkfQmk/K9P7oNv+HqnnTE4dazRBpVpT0aElYpaIOy64Xrvw/fHaf5MAbAFbMDcRircl8zrL8YyoC8tIxwGSpnHsa/sNOIENtvsX4H/6X+ZoWP7C5HRPKtyr7A0XcjTOD0nwYANpJWirc8Gr4ENqTwpK3Hwvxu7hr1143LxQVAeJsrw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djZ7OGIeytxWR8I6ZeAgwHGFZjhdUKxOp2h94vljgDo=;
 b=M+JkNzc1Y4cqeAZYH/S5TT+ND+0GE9bGXPWuTA9Us3OSlK+Z1+ouXrU7vtymyg9CHNGcsBLqCnotMn5M9PQaomChgElI5BwLl110KrqVfKepCuuC5NbYFq1S6j1Jlnh9/jASjCxkCtlDCqeUIGji58rK2kDjTBvyeFQL6CoDkWLkE/jc4sXz2I/XMW0XRf6DrJzoq9vHdYXEcn50AY/8oPebNwlSkXGscgy0L6KWd98VWPw7EVmWYhb0FReJYObfNJS0b3tB4c9EcNXGDTt7Hj70gKtm42rVGqvX9dITJaLP0PqM4CquqD0hCFqbuqD5XKzpGs2PgvyvGesVw7tLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djZ7OGIeytxWR8I6ZeAgwHGFZjhdUKxOp2h94vljgDo=;
 b=JMjJ6TYvGhtprY2J8O8ZEyyReaAEZ39LZJDlSZQk52mCZjgNRLDICJZlW/JBE8p2PU23HLOXI3eHXBJHW0WZbdqyEBfghEGE+4gn3IF2VVnx4Dyp3sTz/4VGGFafGVqXN4tnPHyfGEA6xAoqpLbaR3BAUD7YVyrJMEoltlCDRmvmGdXQx7y/l8NqfsU/IxGmQlajRwCd/yqzTGQY4vT+ZmMNoV60gMopmGlBbh84/Tbteo8HJl8jAKMvDMBPVo8KSrF/XhcwnruS2W6oLvHYjrtBNhGOPHRh3LL0pCe3Wkm8zCImypgLpiIclt9VmrLJbqe3VEOmgTWW6C7NIdC0wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM7PR04MB6887.eurprd04.prod.outlook.com (2603:10a6:20b:10a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 07:18:29 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 07:18:28 +0000
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
Subject: [PATCH] ASoC: fsl_sai: Rename stream name of dai driver
Date: Fri, 14 Feb 2025 16:17:47 +0900
Message-ID: <20250214071747.229719-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To DB9PR04MB9498.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM7PR04MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 51622916-1e7d-42cd-05b3-08dd4cc7c71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LuVliDGepiNIZyXyogiKgoHMA/4tqC/vqisWknTTF7frw/H7XZnpljNaIGRM?=
 =?us-ascii?Q?sjqK0vL7dmmc1HPIGE/I0IqugUuIWf2+rx0cbwXCSjuNDFoAp5UgesGN7eHe?=
 =?us-ascii?Q?wri7uy04Lv8iquwDRQS+UUz+ljelYlYqD3rxqMQo18e+o4TT2YKbP3Odnz95?=
 =?us-ascii?Q?3phixj8HJ2m131nDTdh3rxg7PqMGiSAVdbhv/HS3lC8yvV7I0BZ19lPhQDmk?=
 =?us-ascii?Q?MdIQ9X/DeEwDCBjHDZod8tCtXcifGhLlsfRNyioqKAiozrqNz1iYqGEYBOqd?=
 =?us-ascii?Q?9iKHzsSYXjqBrZXQCpk7gTuTpzHE0tPHBjGCnfQevzZsiWfFFEa9yW2R+m1I?=
 =?us-ascii?Q?I2zQfD/YxxltRo5W+3evyYEtdV1LAtXxRAtYerFTW76r8uzR+uPG140rcElp?=
 =?us-ascii?Q?HUPCRMarOz1NtXnoGsO7S4+cN+NILAsr/eCk0DH79ChhgcGo17FYOwEj4p4p?=
 =?us-ascii?Q?+qkMK3qpKr8/cgvd5lIJZ+5V2nnE0VtSWoGS0PemMs9VeAItU9eslNbQpjQ5?=
 =?us-ascii?Q?zBAa/84uEQhAe7HvuNAd+h0ZgTrlzQQ3KR+ONP175Wd4O9rJcV0Ujtj8zI4x?=
 =?us-ascii?Q?2r0mITkEV1NkSDhQsSrntZv6QCoJt7szBCYLalVkl8mOdMDlgqsF10YB3wgV?=
 =?us-ascii?Q?i0XSEZHe8SDjg4LLayBiw95/zDYjCxTNT7M66NJ7b9YiUeqRk9Mk9m0n+Mkp?=
 =?us-ascii?Q?FMfk2+4X64c78KeUIg3MQ2gUw3+WAUg3f7i+Ci8BfAhjIg+PTAqqcg4EB31T?=
 =?us-ascii?Q?Uv/xYD6Ir2Z/HWYUfexP2uRyjBlzDUk8z2R9pYYBHpi/IFvbUSXCQWAvWL6Y?=
 =?us-ascii?Q?2kKX5Gea7aFNgq9XFdKekvLF4Fhouv7ejVdFfF44JAg8NIgGZJhV4ZKJ3QGj?=
 =?us-ascii?Q?tTbND9ak81JEk7JULSuTBmmohj5vA3Ld1cYQbYJGfTip/kKTwLqYYfU9MPMV?=
 =?us-ascii?Q?J5lSHAPJ9QgjC7DM4OyTsLwwtZ5N0VYp/6GTLyKKj5ZErQpAkQDcteO8jy6/?=
 =?us-ascii?Q?8rHjJ35UYzYZgnV+JcB3o+caAFGk8aHcv9pyD2y0SihWibf4gw0V2dluv72f?=
 =?us-ascii?Q?wAymVA7k8GIPZv2Mm8gH6i1HxCQzjo9f82UuF6NesciYy1y5qA7rJ8pDWJps?=
 =?us-ascii?Q?0BlXyQbvufSxLpu384kkwo9wnVzmErXbZgeuzHz1RgU2XPH1nSOEqEztYk8K?=
 =?us-ascii?Q?vd2VzmnVdgddLvV2yQxD2itn/ifCxna6PeUGGSvsWX62Jsrintvjum0kKdzK?=
 =?us-ascii?Q?3O771hqtI56md6f0F0ORJYpr05w7hcV+GW+zlD6m8obc8hX3TT8USyRIxjec?=
 =?us-ascii?Q?kISzdmcwUUs6xuqpll+1D13lNaqydrmJIyLZ8GLlj9CdnUFSG7n8ftruqNo0?=
 =?us-ascii?Q?1zDigAqMVIcymDkiXU/3ZrT80nITtm8nMXc5F4Lx02zG0GLLQVOnHGfrqLb3?=
 =?us-ascii?Q?M5cebhpBG5/vz/+V1yNxOHXle5WCX7jOI95wIPTMvayOiABjUuA3Cw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0fASn0NgU1NRG5DmFlIRcxlxbPteUV7Y1tARuJdj+O75C/UG50oXjDyXhQO1?=
 =?us-ascii?Q?CLWlWjw7h7bbgRd7T2wBHKf0MDyDabHl/g94W8751AotrKgqqLKnuYZY8/gL?=
 =?us-ascii?Q?r+6fdzKs8oN43LYhb6PCcMMsnR+xwGiMu9HYy518uok0kkcPfcQkB8EqjweN?=
 =?us-ascii?Q?tVwwsfXg8nMY8taowiNew97mdsabM8pVQ5q4XKErVzVOqgHxMGClFk31MwGN?=
 =?us-ascii?Q?lOplOCgNMEx8hvIHYgNQX6zH26pc/RO66VFSYCXFIXxwkDKlkKYFwv35kIui?=
 =?us-ascii?Q?sMM0/izGlaHTbFglanOrc/2cHnwYcPDx9QC1qSjgQpIYFWzXSt+dO+Hh5k8E?=
 =?us-ascii?Q?WApzTZJQWEWyF7nDzUmUcQjHD7MkzehOC1vjMhVOm8LTm6OBTEKkzEaNqHz7?=
 =?us-ascii?Q?4LAleA/95Uu3z5pfwXYtanc+zW7frQ+5odLZmNq7a2PaGsijrcIPXSGxdgW9?=
 =?us-ascii?Q?tJCpYmpnGfGzYMtxRGZQzTvHxVO2CoiOWd8vWZidhDny1rR/3hCnPK2IuhGm?=
 =?us-ascii?Q?xqzA8uYVzsQX/n/rG5EnP/CndDZkfATVZ7JS2eOJFJk7tcmksq84KdXSE69q?=
 =?us-ascii?Q?Xq9DdjJ+j7wgqxNKJtJ6jzUcRTXjGWY2Tm5mGMVhQqYJEqc6t8denMzhgtFe?=
 =?us-ascii?Q?ZNblCtZPxcgFZrlKEUO8qbzekLL4lRTRyiJB0LZu/lTodWNLzz7FElSfl0pU?=
 =?us-ascii?Q?C3lO5Jq/xmSAAt1tMn/U54MunajiprQ0TBHJp1p3Fr5UKNUuOqo2r+Pg9bFz?=
 =?us-ascii?Q?T7E0hbnUzCvnvpCJDtyfwGLDGHy6hDWOw3aDR04Cay73BcLCs5jvkp4a/pCH?=
 =?us-ascii?Q?979YT9NBwDQibemX/wYaBz+1x3v8UF8VGD3sJ7GSFWfcg55v92PLIJ9kbb+E?=
 =?us-ascii?Q?MGoCsSTB7KchzFr6lPsAcz6zSD0X7ll2whP2SnNOm5aO9Xn7MG0N+jJfPmOG?=
 =?us-ascii?Q?Dhhx7LErQX0iu/LeEp+gvJs7ufsoPaRyZPVbCgSJHxzJOsXA56KKGrdLGvaK?=
 =?us-ascii?Q?hsxRHCjikEY3lpdl8O/XcA/FXrNe5gVDXiyNC5CpH9CP4q74Xj9EOAIPteVX?=
 =?us-ascii?Q?runTTBvuIEJ+dq66ZumPVXYEu0Mx2g/Jz/g3CCPeC1pBOy7PrnhF06E3tOXp?=
 =?us-ascii?Q?meFFZwh+u4op+/bqEzXh+q83U6XWHa/osuS9ubejDoSx+xVl0koLWeUHOXrZ?=
 =?us-ascii?Q?sHNTBOuCCTF+zDZ70RDtVMZf7Evrnshwu6Qlq3CtHqIe7sgpoD33Z577HCb9?=
 =?us-ascii?Q?rY8/Z59lRMuknCL0hAUExuBiUK+vrSUIOlrDyJg1Ma4gyeVWG3IRVVnxGz/e?=
 =?us-ascii?Q?+ZwBxGHBrznqKNmPRhtepulNlMa361xgZ/Yb9xWZHgfvHzzpkEbDYGAUxRqO?=
 =?us-ascii?Q?7fQI4h/oSa7oi5i22M4BbIyZYQEiclUV6bP8ltqhNHccw8zTMXhsk0RqWBL1?=
 =?us-ascii?Q?tiSxjKwOMQjSydz9STz9BPprpDV2nPf2BlqWIBujaRnC6Fe2JCy0uEBccSFd?=
 =?us-ascii?Q?rvvAOk4z8oshmzbGvxzt9T8/IxbiUUHZM6u5GAbHJ3XFiLhacDvSuil2Ekds?=
 =?us-ascii?Q?zD/OHq0eanE37m6tTTrU+xlyKAApaP3tt8eNYQox?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51622916-1e7d-42cd-05b3-08dd4cc7c71d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:18:28.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Do6yp1LAr1z7R790un6EyZFN4oOHC/B2CRBeJj4UBagtapqx36aAdplYXXLbPYd/uPjkRL91BDqQF3AhpgsR0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6887
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

If stream names of dai driver are duplicated there'll be warnings when
machine driver tries to add widgets on a route:

[    8.831335] fsl-asoc-card sound-wm8960: ASoC: sink widget CPU-Playback overwritten
[    8.839917] fsl-asoc-card sound-wm8960: ASoC: source widget CPU-Capture overwritten

Use different stream names to avoid such warnings.

Fixes: 15c958390460 ("ASoC: fsl_sai: Add separate DAI for transmitter and receiver")
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index c4eb87c5d39e..9f33dd11d47f 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -994,10 +994,10 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-tx",
 		.playback = {
-			.stream_name = "CPU-Playback",
+			.stream_name = "SAI-Playback",
 			.channels_min = 1,
 			.channels_max = 32,
-				.rate_min = 8000,
+			.rate_min = 8000,
 			.rate_max = 2822400,
 			.rates = SNDRV_PCM_RATE_KNOT,
 			.formats = FSL_SAI_FORMATS,
@@ -1007,7 +1007,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-rx",
 		.capture = {
-			.stream_name = "CPU-Capture",
+			.stream_name = "SAI-Capture",
 			.channels_min = 1,
 			.channels_max = 32,
 			.rate_min = 8000,
-- 
2.47.1


