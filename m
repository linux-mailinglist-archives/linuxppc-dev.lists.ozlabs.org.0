Return-Path: <linuxppc-dev+bounces-3966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928A79EC2EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 04:10:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7LFZ2p02z30DV;
	Wed, 11 Dec 2024 14:10:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::607" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733886626;
	cv=pass; b=A+APm1IEro8EsYQIm1uo/Wd98vOG6UHg//OQt2IT1Pnky9bNLQFL0GvY97oWvRigMywipyYoYH2lrxYgS7Nu/PB2cpWx4/YyO2yJnY0YQSXYs+qjDQG+sQg3qf289Xh5roC9F7qKq1jd1aj07HENghriLAMmhclqtiA3FGUM/fBp/aJDyuy5Kxpu1sTj48Us7VmKC6HidQoQDM1QGFMaXmhSQV2We/aixUiX6FiHaa2n+685wVXtlwPG2z/mGIjo3KPYuE+977gNi7byVJDyZ4SmtpUNgb0xJGCFO96SJ3InpW5KG4fgaaCTmqxdjHWS8JKqRr8K46Tu8SCmJ+vn6w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733886626; c=relaxed/relaxed;
	bh=zal/wzdQq/rIXs68lVbcx3KnHpTzn6yzH8JcSZgZiwk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TUuh5pGSJOAwV/hNEjYTtqRjlnJxyePLaHW1VIXN7Z2JBuu9unxCdjXqUdBMhXz5zOLWy0nJFog2irkKdTE+F/696BlUWqy/ruMzbzznTPb8+i6oNrW/7R4Dt11TTR/UiRQF+l5mxcsMrId9rbiogpBx4n+x8VRrok3hRjBwhSorSyhtrNda55b6Nf8nJawVUN5D3rytU8aJKBZUfcsx5eOMqP4CeM14Tf2FoQSsDk1H+stWQ/w9E/WaDseUOW4t8HesQo6A/qSv0YAfPxKnBM4zsi18KFOaIfYKohWNx3OksM5unfzsz7ZIJnO4E1HV7Nto6hql3uEHdtowkC0Kow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Vd5onoxz; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::607; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Vd5onoxz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::607; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20607.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7LFX17Fxz3050
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 14:10:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDmXOlATyxFdgtj/ae9WNUwkcG7IjdqkyVIMtd+6OVM4G9AZxtxExK41Bh1Sg5Fzzbop81BmDEMlO9dVoGyNazgsf5TtKy8CGGwMsAQNjqOp3/OFOHHr0PGkJsm6ljlXNNCzvaSn0PCs8iK7K//j4Fh7bfRSpytvYfCW0l5VqDCHuGIQIPE8+dzDtzkK8xwUKDXRwbebYw39+1x/oebtAq/uDLr0IsT+Kue4bj8XrSnNYuotbiaO3jEw2yVbcXOi0DksYpn/LFc0iGTE2HCa5xpmZreO+V8FFiF6yKIFzt8Ln0y001YG8BUfVWRQuPVzcu7nCbSJVq+gZJIixulCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zal/wzdQq/rIXs68lVbcx3KnHpTzn6yzH8JcSZgZiwk=;
 b=VxnKlN89APwyYDgBjNXmSnpfpNmecFm4Zh+XfdR1YVfyY3i+Md9LqsAHB/1UsfZYcfzjagJ0QSKWt86/76kaLWY4wuPKcqZLhzKFSTN3g02wSoSrtQVdnpvHhUkPEM+dITTwDQ4Z7RAlnnV/hAJm7KF4iFuAObvJ6NT3L0NYnEyH2h4lbNAE6Mh7CiRlB/MAxywR69TuoONBQFCfljPK1C4CVDxAmBxjz6VhB53f1DPyJ8veTGb0ARIu3SjfH+3g22lTpjFB58BbBNwoL86onRBK+kxKFr8sfC2DiukXRixOz4Q5s3wVbAczMdvv00tE/T+TgbwenmuFlBX1tFyK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zal/wzdQq/rIXs68lVbcx3KnHpTzn6yzH8JcSZgZiwk=;
 b=Vd5onoxzoWPgT99HKs4n04/dL45/RMYqqB+bYR7cxTj27/EdKa/JBsgooNQr8Sh7JoDEWLKnUUdKdxGRBu4941AgQ20bftKUo1DRibe+kfep3aSWAT0eH3DMCK0gHeq+gkLfNUys8IludpVu7iOTtQhYAhe+hucjAG7QFzenSiznK9Q86sVGvVAlra3iQYENHKxlkIMslikkfCPeWqvIOK8dP4v4SEj0qRjFV337NXzgJKqskVm4iPi7LhIACKzioeq/RpCE3a4nVAeKtx3RWOdO36WpaIfGFWXp192mExp7erdpJUoTB6Nn3go4gZCnB4eEovyDYujR0AIJqR3byA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB8033.eurprd04.prod.outlook.com (2603:10a6:20b:234::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 03:09:59 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 03:09:58 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 0/6] ASoC: fsl: add memory to memory function for ASRC
Date: Wed, 11 Dec 2024 11:08:43 +0800
Message-Id: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: c571b104-274c-413c-7483-08dd19914b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WpwKlmp8cHyNOygygAsNPlAEf4CjhD0SWgYUMR3jeR9JexDK6NMSc0gmeS+0?=
 =?us-ascii?Q?5Q/rM878Gh7fI6LMnZQK2Eiy6N27hc3Q48UuW1yVel0sjmdtsR7jtS+QiEhP?=
 =?us-ascii?Q?HfUsE0QfBUyun7+EOCPl6lT/+z/DpJVw0C1XcUfb6D9KKnQLePfzL3E6YwZR?=
 =?us-ascii?Q?hiJ0OOttqrsmojZA+PLiZeSLwsa3BccjpuF5cqRGkHNL6xGpgkyDM5xCpAlW?=
 =?us-ascii?Q?D6K3QQO/AnY9PuRuim/LMdugHtyVRCZosudAk/KpsG8bFF0yH06BeUwXRBpV?=
 =?us-ascii?Q?Oc1rVssT6gChw6dB9p2WbbMe+AVh2p6n9r83gI28L7o3ndfpFxLp6HC3Kr6A?=
 =?us-ascii?Q?5hJUyz3XDn4QyjSij7AYzxz8uAasW0KjXPkCnQ3H2Tm7/k/+Ap+0jFDS0sRm?=
 =?us-ascii?Q?39V7wbTJyTyWnfCX9RJqkD1A88UaECV8QKMdazzS8IpcNCwiLLmcX5eYhTVd?=
 =?us-ascii?Q?2UTYf7yKAu0h0UJFSJeAuCJ5wsJk8pHW6Uazd6XZeiqBfSF8Wj64a+EIbAKc?=
 =?us-ascii?Q?rsFVoHm7Rd3oKM35Dfo3WL6xcqaXyUPy44X2LptcnwXxRrWEFjqXhf6t2+Y2?=
 =?us-ascii?Q?8uYDIaO37t99qkLCjSSmbcmhj6YzrJAOTpjTgHGJ7+ApcW53ZTVrvsnzmIiK?=
 =?us-ascii?Q?sN88GsDmOsa1FT1+oYRqO6F2HOAAG/qfhEQ7280d2YqwYMvkulOadkyAYiXx?=
 =?us-ascii?Q?nO2zXDIYHIibGrchtgOl8umLH3cUgDQwaOY+ArsPw7Tsq5uK2S1eVotO5H0X?=
 =?us-ascii?Q?B9MLdAkTuI4KAT+rnGyFuOmUducaGH+flR2UBUcng8+7isPXHsuo1WN60xih?=
 =?us-ascii?Q?3Muo9gtDzEq+zBMQRMugp6lKkSPjmJMjL/7Nrq439tBZRhLShqv/MPD0TnBP?=
 =?us-ascii?Q?Z+158w4LocMPZbNUc67rqhlMX8XQf2ewszUMLp/GwzrVT4j7Gog9jYjB09Kc?=
 =?us-ascii?Q?Z9mudonMdz+WEhv8fOGlZ6FdiweyC7ZJnw0+hcAgbADqSwEsEyQKsNRNa74D?=
 =?us-ascii?Q?97HocySqKRqonBBDivBp7EUDe+gGJfy56zBlEqB4Q8ZlDN479JGNDeosDLQs?=
 =?us-ascii?Q?Jn9q+8lv6UXgDGB3vijBa4Avo6nd0MGC5hxhf7jAWK1LhXJTQcEBsY37Zsrz?=
 =?us-ascii?Q?gTejbzmjpDexJ0SaymcXNRawzI0tWoGrvXo+cndxH8Y8Iy+0uIBTN/O8pTAp?=
 =?us-ascii?Q?OIBUsqUvTZs3mGQEXVOGkkMqsfrh9zPIl3VtKC26Yv5lV/DBcGALeUQNTphe?=
 =?us-ascii?Q?rIvn/bnBaJPjG6rjrbFNRTURt+w5itahWZ2V4rU+gsseB0kXKpt3HFXcce4B?=
 =?us-ascii?Q?xOjAB+q32UBx+5IMXmlArFmQWTZpz8fNYh07DcHCyDrPDSkK1CtQBaScQ2zt?=
 =?us-ascii?Q?ZKQDgsW+aMMjgLnMP4jbIYY2V1Eg9tjHoPxgpd4K0FmPXOZz4/NBBaeTuoDF?=
 =?us-ascii?Q?QGJZ4YS9rIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FYZMnARaoFmJG7CsDdll4twW3+kGTjt+iYG8cCBFqWssUFMgUXQ9st8UbYaJ?=
 =?us-ascii?Q?nRZgHKyeQCg5h3JR8LDAOlfX0yL6jyXk755broSHnzdBpjQ4oATYoYS3zI8J?=
 =?us-ascii?Q?xFr87QZ/ZeC2VdA6z/5huPMdn559oasfvCl23/i4K3inrMRjEAHmfDWonBNV?=
 =?us-ascii?Q?FPUVQcBSnF0qFfvbX4GBsBFqxjj/AHG4HY0j7duzZaEN/sefuCFRlC3RkbeL?=
 =?us-ascii?Q?QMHtpnE6Ejxv6yDNOkyH0QrT+5dczU6X7i+rySPU0oqKJz0nObIKx0MEGiBg?=
 =?us-ascii?Q?alEHDWO9TKgFP0JOFt5JcXvd8lwBkRtrNTN+k4fGvp8NpDb+ffFZsjjxY/RQ?=
 =?us-ascii?Q?xBCyeeFqZBR613mcVgT8OPg3roXGVLqvErYfXznoqRJx22olF66JlIuk+AOv?=
 =?us-ascii?Q?9ekfoaxIT0pEwsqiQGGuHIG/Yy7W5dqV710d2kETbK8DTByd2rwVcuUXOBwV?=
 =?us-ascii?Q?h/+zv/H0yran86Ptmw/u60OhqaWxdW3UNrwsHsayqbskoQNs3xufsLC+sd8u?=
 =?us-ascii?Q?QpIQCYGFg911QPjvWc2SxABnOKPGmIJ/AbQeLw74GIdXyqnIgimuUgWYEGeW?=
 =?us-ascii?Q?yK7wQyrWYOEY9vrGlroFWOhF6iZbGDv77Ae2Twzn9/qPSxQeNtJ4DViqHFLv?=
 =?us-ascii?Q?1FgGgLi0pMA+che4wVbLRsBdpUQpp7BsjrxZJXhuZWVaEXXouWx5Z36YJO1d?=
 =?us-ascii?Q?Ri0SSnMgyLRMcEiR4I1mjx5xkjTEvlEqRL4lWBprRYk5fu+2CrylbSx7ZUIo?=
 =?us-ascii?Q?UNUXXjOWYUzdJj/brG4rhN4WEwhMU2JRHzJ3tOS1C1Mlrgmalp0K4/WStvgM?=
 =?us-ascii?Q?xBeDpNeS3vJN9UkdJAdqTUwaeu0eJwu6TrtblZgK6CTHFGBgpnkeKUjCZkQw?=
 =?us-ascii?Q?z4mj7xE93gY7s5u1USGkTjZ6olkffce1QqBpEyIrXmOMXp73Lz84VTYVkO/A?=
 =?us-ascii?Q?CAhivWvYkbbXM7yaOn/ZD5+8pk3RgDjcwUsjTcEj5MPyDClQ4o6PtsJuTpBX?=
 =?us-ascii?Q?znbye5/13M+XUO1tqnDE6EeHzxGa9XHfFt0TvC+P6ZhcWw0LEdxzEfB1G+oL?=
 =?us-ascii?Q?bQH/5uZW5ORhBeiZf6H+QXhSWwckWu61OTmTOFzjdzzxzuSUxDBr236Qav/o?=
 =?us-ascii?Q?+yPhKiyjCtzt5RjclnhyjCgsolVauHM6QTkLRfixf0XXGgkH9gHpPkDdV0B2?=
 =?us-ascii?Q?BjpAvOqQOLYMsu6J0IjiQYRrE5BCmJ+5LBS0Eajgt69n2KrAbsCmUv15ZBGO?=
 =?us-ascii?Q?zNCjaUjFDA1NbNDPbuJqyszFmUQtWz/r1zqWsbcJd24iA3S69/kniIQ38ZkM?=
 =?us-ascii?Q?PDiRYXilcLO4U8ilHi0jvHOci8eFGunDlL2AioKVh6U2h7tfmRLm9kr0yqFd?=
 =?us-ascii?Q?ITsbH4ZdADWy0PE5EoxSCzumHlZiACqbo7PlQdxZX3qNA1vFtV4UiY+CjlFB?=
 =?us-ascii?Q?5c/85DP40RdEE0368d85ZxWcZJVtbOLzDukUpAy5KuAfoiFcPJpfDYQRG11A?=
 =?us-ascii?Q?esTaVkMPDsIXX23r6+6kJM9Vj7/ZinwEjrZSL3G/VB4hPQ+qUuCtihSTQ9fu?=
 =?us-ascii?Q?8DPP/U/PFaNUQLcC4XIvTug+Pk061iuq62yhcEEg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c571b104-274c-413c-7483-08dd19914b92
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:09:58.7505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gVELQOvUZIptM647QZ7rx8lTphwkrIuRN3Uy5FrrRYoEi2IefcDJsxoHvtCfX3wQQ4Qd3znZ4cu72G8eQ7UBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8033
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This function is base on the accelerator implementation
for compress API:
04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")

Audio signal processing also has the requirement for memory to
memory similar as Video.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module, after conversion, then asrc
sends back the output buffer to user. So it is not a traditional ALSA playback
and capture case.

Because we had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

Other change is to add memory to memory support for two kinds of i.MX ASRC
modules.

changes in v6:
- rebase to latest tree, change to use 'MODULE_IMPORT_NS("DMA_BUF")'
- Add Acked-by: Vinod Koul for patch 1/6

changes in v5:
- Drop Jaroslav Kysela's patch as it has been merged.
- Add Jaroslav Kysela's Acked-by tag, received in v3.

changes in v4:
- remove the RFC tag, no comments receive in v3
- Add Jaroslav Kysela's patch in this patch set. because it may be
  better for reviewing in a full patch set.
- Fix the list_for_each_entry_reverse to list_for_each_entry_safe_reverse
- Fix some coding style issues in Jaroslav Kysela's patch

changes in v3:
- use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
- remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
- remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
  Will wait Jaroslav's update or other better method in the future.
- Address some comments from Pierre.

changes in v2:
- Remove the changes in compress API
- drop the SNDRV_COMPRESS_SRC_RATIO_MOD
- drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
- define private metadata key value
  ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD

Shengjiu Wang (6):
  ALSA: compress: Add output rate and output format support
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc_m2m: Add memory to memory function
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device

 include/uapi/sound/compress_params.h |  23 +-
 sound/soc/fsl/Kconfig                |   1 +
 sound/soc/fsl/Makefile               |   2 +-
 sound/soc/fsl/fsl_asrc.c             | 179 ++++++-
 sound/soc/fsl/fsl_asrc.h             |   2 +
 sound/soc/fsl/fsl_asrc_common.h      |  70 +++
 sound/soc/fsl/fsl_asrc_m2m.c         | 727 +++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.c            | 261 +++++++++-
 sound/soc/fsl/fsl_easrc.h            |   4 +
 9 files changed, 1260 insertions(+), 9 deletions(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

-- 
2.34.1


