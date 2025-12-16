Return-Path: <linuxppc-dev+bounces-14788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 107EDCC1454
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 08:18:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVpFL4hQfz2yDk;
	Tue, 16 Dec 2025 18:18:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.162.12 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765869526;
	cv=pass; b=LWCujCulkDZHQV/EcwRRv382d/rvdap7Mo1pS9tU/BC+GTl8men3MlJKhwpz02l3Dt6Fx5b5eMpTErlHgRuuA2zRqEFKERTTtoRXToZjWW7r8itKZ7mG9PQ9TO//+fX3fNc8I64aQ/SsybSuClp6bbLyh0M3QbXzJfNikXsMaZ/7xAR/yAECzpJGD4V1KPgpv7JbZzsa3yxjAgwJgZpT+EN+MxUgzFww9xL9UBMZ/Lg+lozRK+giAjOSj6dVqNdE2jKYNhWO5MzKmyHBWQbmbl9C/pe0h8pTzs8XnABz9dvhwKWAhw5Igic1BiKdFI6ha6vUxsVTvHGnw4qmZm1yVw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765869526; c=relaxed/relaxed;
	bh=qN03QHrMp9TdajuWkod07erp5+TsrUXe0mQ65rqXhOk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ti+wQ/r+y7DRb/DIIJPkDpnC9nwCD6qly1A1u+66n7e7MPYjNlPPLyVt90dt+zEl5JtkIoEU9Cp6AqbkucSDlVWDQbpdAnuC66bw01jytSUUNE4PlYJOLWxPLUC9zvpD810UtqDBSdGQ+1yha7c7Bxi6oRAU8y0eZApfAaWYROhbIrgS9CgoaOuZeTSPocP/vmNjKtSexiKC+1TR5/QZB+64cJGuc1VMoYk6Dtnsig7012dJncBz8LFsJPmM2Ku4HzS0cWjME8z8/lcQcHvqqsrRClDUjYO+cnwHyP5szISfeOb7Ns05Zz90QHZuabQ5Kk9kxUAFMBhYDlOsQ0EhKA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cLMQa0s8; dkim-atps=neutral; spf=pass (client-ip=40.107.162.12; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cLMQa0s8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.162.12; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVpFK0vQ3z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 18:18:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdTjApSwo25zEIaAoSwXWhEbU7/Rhobi2CTw2Ge3jCjEM76gFZfGMqM3Cf4XP5TcC4xFnYmw24h6NzXcGMw+QcCLKYuRJ3v4RrrfwsmlyThWQkG9VjCKWTKOJVDOhdWdNrajdbDhz+9ZzOwuprM/vAzY1iFfXp+x9dX/cMUOYz47o4bRU/DV904yD3g5QzQOqA8KMN/0+9ywK2f/nLIH5PDZqExMQQowqN0XAHWyOBaznFI/R3CEhWYcugKdqsS2r2mExMrLtmSyOVMAhnOelDD8Jczv0fuahiCYy9RVAYb66zSLx91SWhR/C7kLBLij345ZaI+GwwTGkHGc9sA/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qN03QHrMp9TdajuWkod07erp5+TsrUXe0mQ65rqXhOk=;
 b=ITFCLltA7NX2RuBDeCMjD9Qai9N96DqixE4vN3N+gVGuwjC7GivB9PHjCaeBTBS49w+AzWrGuoHX9rlDKHX1ah2ewk7VNcJ7NptA+IfIF7LzcwwxAy04F6kgcqeZnhhDKjg5b/rsNUmnk/VEgxZ6/CTU8AV/lAfz1TD5aWGNtQKDzgD7NT9xHDsM6ZRTfOSqkk+kWXsGOAD6x8r8LZDNtqwQ0vyD+0mSxkD6W/DoyF7Km5tJcqaCobdG878+TYkdu0ejNCZrt6IPTuax4ifn3LPfpAbxjJuPTBNGJIi8/7AvPeTBqyXfW6wpjsegDpM2ynHWmyLeamTyKshEP6Yr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN03QHrMp9TdajuWkod07erp5+TsrUXe0mQ65rqXhOk=;
 b=cLMQa0s8HwsIpb1vY55KtB6XBw1KzQ2CX9k3Pl/VVS34fBMfbd86QnMB70VKsOl2Nt03IJE7eua4rpJasNPuGIie+u4h0I+1rwTgX5MeTgt8kpc3OQvc0wtl4PUJ5bMJSAZJvD01CWD7gnSAdo0ntfjU0x+ZzXHqypy6JfqxlwCKIlomAdA/GrTUcyQwBgE5iwXnNqKdq9LDUSgOL1FBgJF8uqZN5eymg8bfXNCsVHCe55Hu8HWqq12iPaFYIlpONyjpug3RpIFMNuGohBECnQclHqiHbA6N20Waqy6C3efS4UIxEdPicNUmWjz1bjfKPPHGO3EKes1LZ28DY5fwLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 07:18:03 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:18:03 +0000
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
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] ASoC: fsl-asoc-card: Use of_property_present() for non-boolean properties
Date: Tue, 16 Dec 2025 16:16:56 +0900
Message-ID: <20251216071656.648412-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:100:55::17) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 123de4a1-6b94-4837-8593-08de3c734029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cpheug8tW4+aAgccNGexUY3ApyDUi20VuG9MX4pGsT6hIKuSHmhL3gk8dz+b?=
 =?us-ascii?Q?FccJ/pUsGgHV0vjHlS5MTmVDljg6uQIHK2fiwC/U1Kmwgi8GWqvm5LUUmGKd?=
 =?us-ascii?Q?6ukgPySbGOP3smCAvfCzcxWSD2c7UygPF0puXXtXlRxmdd4U/lb3HQZzNr+F?=
 =?us-ascii?Q?P3Hm2SzccDw4K3HR9TwO5KpXTTh4DFW1HEs2w7RbswOm/kfeYvw4s/92EabM?=
 =?us-ascii?Q?Wr7iCVSG3q3D1URer7iKm25/df3Zdi+34Al0+7/kzpBc34Mtbd79NZsvN5FX?=
 =?us-ascii?Q?GCcXjh3U0NTZLDbv2i+HUvTgO09gXNVFTOHEFYP3W8q7GzUu5ScOtlZwnkHe?=
 =?us-ascii?Q?XUG0LBYZ4mKY/MmFvQLHaFgBJ2uLYoAYYOj63XJIlPi5ki9aYO5ucKgByCiX?=
 =?us-ascii?Q?Xslr26w3lRmdENjLB5pgpW9Y4WH+3teKxZaNeHhT7IZ4e7Y+ksINzhm4uZpj?=
 =?us-ascii?Q?6ZPcBjNWtBoTU62ULfNSAna3EWCznpFbH3i5hZCJ/kTwsocEIW5QD5yvcNI1?=
 =?us-ascii?Q?nHXnvt7rEjbjzPYH9vEgR4xw4rBhH5CAREOXj/uo04CspMKHt5SjHOQwDRuO?=
 =?us-ascii?Q?wzYctUf8uinENNga/5sDA0zjE5dhg+Enp2LCWFCZ7lE71BPobIfOenJtd8ap?=
 =?us-ascii?Q?ofL+/g92nOVvLIXTNElbpvZ4PKTwaCJCBjopDoH5tMs9fPW7hpVtIKAjkoq+?=
 =?us-ascii?Q?pJzd/lwQExLe0yjgcFgHYKoZnILmDU0yJQXaLKcvYueaab0lyeJkq43U2BQ8?=
 =?us-ascii?Q?9dbKcdwoWicvlZeN8Uls2SL/wDvdmWiCONrJKBfgFXVCjqkwoJV/bqpkl2fO?=
 =?us-ascii?Q?fIvkjXmFOmACxYyxGtpViSVwi2Ouysv0n0iCk0K+dsDdQZEdXde1u2oeYt7E?=
 =?us-ascii?Q?td7XzVscsR2gTlv7PxT48DbUidjwYgt9bKXLdhGcf0W18TM+oafdkncuECsh?=
 =?us-ascii?Q?+fBN79xDtVj+hL7ILpx3kCqnQnJ1SfMEWQ27Pfhbv9rXrNrB1aLB1bn2ga/N?=
 =?us-ascii?Q?RhJxRpev2zCnkFmhxaTEHgSm9KvHvOqqWJ4nRf9cSnJv23UrM3IQLNtV1Vvr?=
 =?us-ascii?Q?xdeFUCGS+Go4DgXEKdGCAaUs5ZflTB3V1EInFUTygIe/fyaxGpf1bELnByTM?=
 =?us-ascii?Q?6wmefXk0KkFAV8a6BoCHBuVNPaC2s0rw9CQuHc7VWInG1ijBskw/GRvWzcC9?=
 =?us-ascii?Q?52P1UKmhFK4hYy5owd1RcdJy6TMZF4cllH7u6b1ZbEoXbCCHfA5Wz6SUZ4pt?=
 =?us-ascii?Q?6SFyHf0EwbewEtW3TNHmFFfOPk7aybAPLV8shziXWv6ILvUztNnbfKQmxNQv?=
 =?us-ascii?Q?X4Czn7q7o8VGZGtz4s6BaSdTaE90jTmETjqJYDVF2owc3VSYEJXvGxHFb85a?=
 =?us-ascii?Q?rMkscaPfo5Re7nYjbeDp5fejWhntUKhH72reZdsvMU7SS/E2Z8GsD/aunNdM?=
 =?us-ascii?Q?CSk2Lh2aM4RolYVTQTBZK5TaNHMAnlCNZMveWQQqT8/bQqyVRlkPzCtIx5Zs?=
 =?us-ascii?Q?Rm7nMCGMOFBo070mjv1lCqOHWfmJ06MXv9nXEgvtWMEDDcQuejYO4Ym1mg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tbv81RyKiKyhJ/BnnGGTtBFuowvVObkdVy8lUdelI3Ykpbac3RZKiHcPGcPJ?=
 =?us-ascii?Q?bpWu62gBEAjWyZh4exvnzaeECR5KL5VhXfPvbxuRxQUGnYDs+N63FZrnfaVb?=
 =?us-ascii?Q?t9Cu7CUdGx/CGMedrFmIin1hBVfElTD/FChHpi2wIKIC3CsDKlLQbQElBMAg?=
 =?us-ascii?Q?q9VgzCtqchWqWkla+BY1BDxF1hh33GGrTN/oLJSdKROhexOsLow2ti4sjAUr?=
 =?us-ascii?Q?O57oDGn1YJSlVTIxqy74LjrPu3jDbv9ZsHht7eFSuk8lkAFnVC6UjWMMCbEn?=
 =?us-ascii?Q?qw74JpTLwO0LHN8ltGIjzWbNiq/ul6xhWWp+rD6sp3kjP3+eVSfJsE+Fq55z?=
 =?us-ascii?Q?wdw1/aftzOLsuClNGNVt3n+ToqgNM7U0DgHDl1UR1t41hSE9MQrgpgcaAxnp?=
 =?us-ascii?Q?jCPEVOsYB2wm4r5YU/2DXBIlX1U5bv8/r1myoA0C2pGmBACSMLzDM/3/UFuB?=
 =?us-ascii?Q?WHCLMrK+Dk18p4mshalTEpbDPo5jN5+7Jjut+IMEF6zirm+wcOE6kKK5LV14?=
 =?us-ascii?Q?+TvIuD4jg8+YjimgAP4kYN2L8+rSf+pDAA55aj/4iRjwwV6r8WJQtpJZLg7U?=
 =?us-ascii?Q?67iWNYmoHA+g6zbr5CA18pv0Zjgdb5g9vtncls63tGPdikcDlYABO489XpPP?=
 =?us-ascii?Q?Wv1lj/kuZN4Ck2St+Em6WQmW3xJJs0+kjsrySArGPTEjqdrBE58zd64DPQ1u?=
 =?us-ascii?Q?hLf+BllufNIAboxIVFFIE7gcjUmpTlSuecbNm547cyJ9Y7d8e5ihjCIkun2e?=
 =?us-ascii?Q?PwXvxc6ZE30VXfuhhM1LgoZqiYWTsEoo1ROEfeas+177lVE2j7HY/LDYGvcQ?=
 =?us-ascii?Q?4wieYGiuKmY7v7DIgHrsBCudk7zRO4d5aXU1ogJ0D8lJRoG+m9n9NEqRoIH3?=
 =?us-ascii?Q?XJ/9KahywoLidp2uLbbA0lLSmYksybskrGnTpmgWiaVyjkUgG0puqQXRzN1K?=
 =?us-ascii?Q?2AnJglKH8Q50vhtpFqrMfK9qi9mBkgTsuyEFrIedx8v/vP3yrZKHzmRY9LPU?=
 =?us-ascii?Q?5QJs5ubZxA9v+QFVuAVhPfYMBCDP2lywT1ANqN5YHflxPpfrhlFT7dWsgvAb?=
 =?us-ascii?Q?sKstyDylNL2Yy3lMEi1q94dbJuamvpf5eHJqnlTgyd+JoXc+nXTeZW6PbwLp?=
 =?us-ascii?Q?OKifiJvxRFEyCVCha+ycC+3z677gVUbhOVvCuhokCj0hRTrjWjqp/tAjuKRY?=
 =?us-ascii?Q?V2GLt3IESWKGTTwngskzGmmh5T+gDp5z4CBXQxgUJzj2WjWmauAuaigO6Ipq?=
 =?us-ascii?Q?OO+TNJ+nOLv3xHOxh75KXbdU+1fcxCk8MKXDXXWEJtGfnP/beb16uniQ0k3O?=
 =?us-ascii?Q?irIO7tvTockFlWbLNg5mXOJ6a3dqWq+BUgZgNO7nLpWV2AH6zxCppafgopNq?=
 =?us-ascii?Q?mPhatFoeY/XkdOp+wH00PGd/OjSfHoJpSDWPGFFuYpAj7XTqoHo1GabzuiIs?=
 =?us-ascii?Q?PidpfLETKLc3OM/FthijLyZf37a/0JghUVTRssasC2pnBjm2MI58cHhT3mGC?=
 =?us-ascii?Q?88svKGR1XJRBRFsgpD4EAmpCi7LwGhBGW2D9E4bPYNL78gn72Tr7BjJb47st?=
 =?us-ascii?Q?FSsV+O8umYETqy+z/KCa9WnX7bzrsssWz0uIYH80?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123de4a1-6b94-4837-8593-08de3c734029
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:18:03.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyvh5uYe4UAE7sjAeyiCB+FgPVI2xPYsLB97SHJ5SP/Kp5Zm09sg6Lih5wUMnpfmljpU21NFaC1PoK48QFjZrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.
Otherwise there'll be kernel warning:
[   29.018081] OF: /sound-wm8962: Read of boolean property 'hp-det-gpios' with a value.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 2c7eb0baa0f3..70a6159430ed 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -1045,8 +1045,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	 * The notifier is initialized in snd_soc_card_jack_new(), then
 	 * snd_soc_jack_notifier_register can be called.
 	 */
-	if (of_property_read_bool(np, "hp-det-gpios") ||
-	    of_property_read_bool(np, "hp-det-gpio") /* deprecated */) {
+	if (of_property_present(np, "hp-det-gpios") ||
+	    of_property_present(np, "hp-det-gpio") /* deprecated */) {
 		ret = simple_util_init_jack(&priv->card, &priv->hp_jack,
 					    1, NULL, "Headphone Jack");
 		if (ret)
@@ -1055,8 +1055,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_jack_nb);
 	}
 
-	if (of_property_read_bool(np, "mic-det-gpios") ||
-	    of_property_read_bool(np, "mic-det-gpio") /* deprecated */) {
+	if (of_property_present(np, "mic-det-gpios") ||
+	    of_property_present(np, "mic-det-gpio") /* deprecated */) {
 		ret = simple_util_init_jack(&priv->card, &priv->mic_jack,
 					    0, NULL, "Mic Jack");
 		if (ret)
-- 
2.50.1


