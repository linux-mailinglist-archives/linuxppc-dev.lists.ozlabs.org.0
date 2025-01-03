Return-Path: <linuxppc-dev+bounces-4607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F16DBA0043E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:24:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYS51jq1z305v;
	Fri,  3 Jan 2025 17:23:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885429;
	cv=pass; b=oJ7aO5BEDa20K2iLerBNYGHzWeIeZRZG2llIXq4XCIkhJkYPJS6QVt5aXxFgoJogcZAtz4ykpshOwOADiqGGDSmCqjJDJd+4/3XMRuzAEjvwIOqhP4MqXCF92tAXSDjhdl/TW+1TWLO1UBAlQmupZbGU+btWEriVOLySpbLR7qBvRP8ynOHKpVn6DoO5QuojfFd+SA0APHMf1v6DydITeGyggM2H8PD024UpfQpXpdTE78rxpHH4lqG3VCVFrQmsa2qRjC+Mi3v2PBWjfjfqIpr6RbhfmfuaZ6rQyKlpDvQwIsfLSeVIUzEi7vxtdB+iihbjQKC2wsGbPLhJG9NyMw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885429; c=relaxed/relaxed;
	bh=SKmbdyjlUOnASRV1UUrBtrrn//m7/BQBjZhIlweh76w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DuZFbTKLznKMcR5sptXcwOYZ6Z/wtgqtQCUnaTofYx5/5DbL/CQzSk2RWcHdTrmtRnqca+XoCMU5WZy4VqsZ3P0IiXrtI7JdVTXcp1w3P6ui5oU8HWloLQIBGeGGQyRbQuGjnbQUE5QfNd7nZ54/gsG3AG3B6aUyAqqXYEQ3rwdawSL98PKDe9KUUE6PNqbfjesCVBsoXfRrn8+uhg6TU70q1VlFxOYMqJu1bKYhqm4YTk1MSzHRu2nkcalDARAEVaWhWxGdfw4iQ1pvsXtQDa3tYdostlG4KtQW7cUdyFR+aXjYXfVARsksaZUsFk6cbdE3B1XYD53hcrNmVbQdsw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LddhqLa7; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::602; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LddhqLa7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::602; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYS42L4Wz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNPdM3U2cQt4wNzwBnvgUTn3v4zAB+3SdzgEkX+epFFXbSVO9+OvlW7LdBfWJWROYgyFAkQjdW2Khz0vIgRjCGjszCw9uzTpcDsHvEwByXCyJerQg1vT/Ov8fOe5qSXux1eBy4LT+RXl+EXxbTZL8rxQfVZ34WO3ycKahscxwBNPnBlm9hF5+cbiZHypOCnTLnZMwo1KT22tJrSmGhmC2v7LI0Hq+phMhsWcXws9wmiCZVUQprlZI9x483RjsySqbU3ZmtRio963GdXOA78SbjDmgy0AgKgOUEPQ/tvetyfxZ37zH7e+SEzdULFLeS5+96mgst0aDosycqrFN9yqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKmbdyjlUOnASRV1UUrBtrrn//m7/BQBjZhIlweh76w=;
 b=Uw86rrG+90qFt1lECsBBInVVPh3yIaDEgjIRT6Aypp6XAXRGJbBy5d20tsRoMj63Ckn//nLr30jgPxnr9O3p1Yqer86CMmmwpXU6dGi5kFLd/ngwl2X85bZBUEWgreJUPhSi2p6fU6ZiKEoJ4LmyzGBrS+o/viokHxchUDJjUtnvQ0tIFpTsd0Didehfywu05bmayg7ar6A8m0y7gUTSBGK7fDlhI+sK9GJEcSHSFORIUilNnI8hO4nEWL0GpGXJFziLikwMwwtNulYDenqzqaqVm1wQwSJtbKUONWIWqA9XJnZE/ep5h+G/uPCzHUKl1MNs/dcmstnGyz0IElDyWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKmbdyjlUOnASRV1UUrBtrrn//m7/BQBjZhIlweh76w=;
 b=LddhqLa71Q1J/I5/UiyWMnIgQTBCNyACZ3VdXlihd5szeQ/D6ovZRYUOJgwzlkKrHNVQo9gCuKD+839eQTB2Q21s5vRDQBuQ5dzeIHAoYdTjha4j43j6wEixojx/98AxCV5O6nrDEq8sRonP5dcT/IUmyI+37CxxfIra4ArzW4AJ6Ps3bVe3BS+Cj9MVjUbIAhJxtwP2/XSpFUDOautJfiZsMp3g56HwxkEAFo0CFQyPx6NsRIlGvyzPr2CFbMUNExTkCBzPwiqIxIQ4P5ggSK6FtABNognhzP+WjD+uAHLRr9XUJJDmkbPXWwMofRwmQAdb/sEO8jGRYSSOwdo+QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:34 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:34 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 08/13] net: enetc: enable RSS feature by default
Date: Fri,  3 Jan 2025 14:06:04 +0800
Message-Id: <20250103060610.2233908-9-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103060610.2233908-1-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 2064172a-1899-47df-ed00-08dd2bbf26af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EKyXHaR0n0tSiZioKvjc1PGJ8UoDdwNncuFbw1yE0Q4vKkzQblzE2DcZGTjs?=
 =?us-ascii?Q?5Y4s+SUtsIPeXW3d6DkVUWVQ241/AbjUwQ3cOD90GYQzIH4M7YD2wPpFjtDB?=
 =?us-ascii?Q?WpeF8HdNGPD/PI1hEtAjiJdObJKqgF0lxbie2OTZvvFwj10tQ2rExizZURhR?=
 =?us-ascii?Q?6MyRY0K2RtnDYNQY74Uzc4BFGtGPTDHunCJbx5xV5iVU+qRvESlLnbfULMLX?=
 =?us-ascii?Q?IWn707q/hOE70TWU8Mkum+NWwqspIiBOJkgED+unxRuD/ecPNxsDVHSLgrQt?=
 =?us-ascii?Q?g4aln6q7oAUpvnZSVH0IPjkprPP3XhhKmWQbI46JZp/zHh9t8aR1FCPUCWxz?=
 =?us-ascii?Q?E7RFrPbnX1riOkW+2ai+7w1ON7XlUEaOYFFaBD3Xpx7hmCX4bPuQs/orOTTP?=
 =?us-ascii?Q?GxUASf+7xYOu9D+V1ZNslM5lDB5DlaU8GL40+rpNtSObEUo7117mrrdZ7mev?=
 =?us-ascii?Q?p/nz1MuONPHzApEIXuNBCV+eQJLlccywFcN0BtiEI0MkAqppj9SAGUshoi00?=
 =?us-ascii?Q?kepH+CqwWH3cw7MAq+ktf4q3NrFhykTyfsdgNKm414ywrQL7RyLz9QyXl46b?=
 =?us-ascii?Q?sIVGT9/LfW16protDhNW5MiQWr/Qfem8GwVjj0iciYx06mz/gZ+Y5XMoAZcg?=
 =?us-ascii?Q?F1DMDY1vX5UT5Vtt2zdg+x1+fuY8ysXXegEx0l6UrX0jGN74rTKzgKxvrzGe?=
 =?us-ascii?Q?eUCKhSzjlAf2SBMRocFM0wNKGvoZOMxk2pHDQ5gUQQP+2LmL/I0SdVQETo9a?=
 =?us-ascii?Q?cLpaSNnCupOlo7IR3J5ZGzGQqDcajMq48tNsya7dOFxoW9gAM5AxqsiB73DS?=
 =?us-ascii?Q?HOc1jrNSH1EppK4WyPBDwQ0b3atXxeZstYTDybGGmT+fH0LLUim3SwQJNGZA?=
 =?us-ascii?Q?4x/ZxOGkwsiyx0gU8G+5dVaq6wtLsv20H0CsmerlaSHJRHn4lbg9ceh7bYU3?=
 =?us-ascii?Q?S8hUT5NpdIy9aeU2XoKsXKT7EALTel+fmtEVEEho0cOrZValY+qjiVXGjpE1?=
 =?us-ascii?Q?efOEiB713dsMb33IVBi5bvTkl0GHAR7gveiLHmH389+buu3r7Ki08GFfHToW?=
 =?us-ascii?Q?7J3yf1aKl+ND6YXHJEyhNxtbbVfEaLFBtE3H+AQK1MCqYI8zaykuKwUnOi7/?=
 =?us-ascii?Q?no/nY6i7Oo5xcemtqD6obsB6zOmcriXUYJsWiBnFv6UCqPC9TI4dbVmFjXuW?=
 =?us-ascii?Q?eTLeNm6dV6yl9TDXdOsiazPIxitfDIbazMSHSAuv2Nje+7lcnCoYlUfT5tVM?=
 =?us-ascii?Q?blVyybiCSTkQYnm9ZOGS1zSzUSIaF9rFvetTn6p1UyZqFKl7ofnBAyzxrkkr?=
 =?us-ascii?Q?+oJD5ln1FBaFzigV2lCPB6xPSLkCbxZeYeQEsFJZgkN5+0dywL+Q0r8I5awg?=
 =?us-ascii?Q?0kOV1H6FvEr4yrNTu7Zgx9h4/OjAS8Re6K65+0FVRExkq4QZZfLK/hy7YzTf?=
 =?us-ascii?Q?asQ9VGJ7jojndQVjwSoXaz1mTXBpZNQp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8OVgjBIta+AVFL7JE7GpRlp42pL3nqqVTZZxo4ZDr6Bjy8xblB57MWN1LzC6?=
 =?us-ascii?Q?1gDBIG/er+zTNAFdriy0s+JE0ciV0P7RYIU/aRIKmZxDuhxvPtlTLqvMtUor?=
 =?us-ascii?Q?pvdQzOVZXBBzwtRY5d3sXVCZCLtvO1WzpC2EK3NyX7ae57ve152d662tiD/5?=
 =?us-ascii?Q?bwvTD+Uoqk4lV0X0Z88Xx3/gaHoODlw0TtKeIZSr7ieINXOFuUKh0ZILpDw7?=
 =?us-ascii?Q?VwSi4bgpwWksG8GSOWyavgds/wy/1WLPLxhRh+Ht/hphQpfWqXr5lzVGgjva?=
 =?us-ascii?Q?jWS3KaNYzbKkufV4g7Cc7pPE12rlmxK/k5y/R2BgIe5S8f1i68ea+PszNk5s?=
 =?us-ascii?Q?73giBgnt6XrhJRhWgFYE2FDWMKfUVKnRpKAI9Fw7e6+KqKvSawG6B6HFvxam?=
 =?us-ascii?Q?2zOEiClxzj8duAD2e+HVDlnvARb5HxVBSSLhk5TgnT/sGlWl7qXRwZKyiyRR?=
 =?us-ascii?Q?+JPVkFIaUf5HUCpoY1X5eHwm2oRbyPaY2DBtribNCq0dBIPQofac3YZldV5/?=
 =?us-ascii?Q?aP4h6dNTNk3Gs7cQaQJAKXFr2BYOI1V64bM5n+WHcUNCwsJeRlfgGwT7CdQO?=
 =?us-ascii?Q?BCWv3VUUaf3PvBhnm5o0E7UL37g92c8Z58z39ibHRwWqk1/nkDlvBKGoFM+r?=
 =?us-ascii?Q?XRdbzVJ13rpeVn3D1QbUhomPO1ZmpuFaI6TRWsB06TZkzqF8awOqzwc6x5fq?=
 =?us-ascii?Q?xJ+MepBcKqlGaIGdmlpZ4QQ5ZaG3lv3epEMYVq4rFHCVYWMrQMiA0BttXDlq?=
 =?us-ascii?Q?y1mwK0PM+LguG1/CReh6qgdjZ0p/o7KuTVx2zbkg5RoFGNpTrP4yCeKZ2Euv?=
 =?us-ascii?Q?4h+HOsl3G2C1BEqo9IwME8uR+CGODkVjCtrbxNvKkEp8d2eqzZva/b2FrFcV?=
 =?us-ascii?Q?WtvpAlf5bqZKhW6H+9qeZ31nCBIdxEblXdI+xYn0aB9ok/HTJLszUBihKn6r?=
 =?us-ascii?Q?EHinERH4X3RExuxuV5FtqLnwwtEiDapbCLPufs/WUTwj1C9qWJz2Xe++dA4t?=
 =?us-ascii?Q?Y0nwSwxkZzlCjoiHBRfZELbO2PuZEchohsffikGeGTvaicMm25yDnqSRQ3gX?=
 =?us-ascii?Q?zKqfAAG9d3ZbFry94S2Vj4wvPWp85M8is4fLPilBEl5pj8QrbOtKlXZYDNI4?=
 =?us-ascii?Q?uPjgELSkmv97CwUWRoyBay6pvLvZ4pApfvsgqL3YCdvAzivNrHlc4pbDaBYL?=
 =?us-ascii?Q?JC0a7Xbzxo3Cg8atHFp6NqYCEjZoLtmSNpPqEb0kmp14uK6gNSm0yAHHy5Qn?=
 =?us-ascii?Q?YQ57m8AIJ5lOj8w1PskKaLOAGxVKtxh3G9IeESpaKCaqP/JS9FKFGc7XkUs+?=
 =?us-ascii?Q?AU5PMSGYmO9XaS2Gj+iu0FBUImDEvl0zW18oSgqTLwDmaAQzUj5Og6DHyUka?=
 =?us-ascii?Q?l7O5r74F8q8XD6//HLSkX3k6I4XuMY33yFWhKhoz5aTQnAFp60GD07jOOIuX?=
 =?us-ascii?Q?Ej16zffnoi3nPxelCK/zNo2N3n14sUSWbLzfuUPGI9N1dMeSeY/ysb34Iu97?=
 =?us-ascii?Q?BMn/TPizk00vO+gk6TgtDlJhsLEik+644Mne1qH8OuhGI8Lx5tbhJ+1vcczL?=
 =?us-ascii?Q?aPs8019lYS4yUeKGGsXY+MbNpjC2mH0psbFnzx0o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2064172a-1899-47df-ed00-08dd2bbf26af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:34.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiJzmxKRC97dk7hSnfa+pqNSuDocSVZqd5x6oU14NIAv+82/vpjwSHtzasLy7x5Z5S/u9RzQX5dLWbO0ByYl7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Receive side scaling (RSS) is a network driver technology that enables
the efficient distribution of network receive processing across multiple
CPUs in multiprocessor systems. Therefore, it is better to enable RSS by
default so that the CPU load can be balanced and network performance can
be improved when then network is enabled.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 35 ++++++++++---------
 .../freescale/enetc/enetc_pf_common.c         |  4 ++-
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  4 ++-
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 233f58e57a20..e27b031c4f46 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2378,6 +2378,22 @@ static void enetc_set_lso_flags_mask(struct enetc_hw *hw)
 	enetc_wr(hw, ENETC4_SILSOSFMR1, 0);
 }
 
+static int enetc_set_rss(struct net_device *ndev, int en)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+	u32 reg;
+
+	enetc_wr(hw, ENETC_SIRBGCR, priv->num_rx_rings);
+
+	reg = enetc_rd(hw, ENETC_SIMR);
+	reg &= ~ENETC_SIMR_RSSE;
+	reg |= (en) ? ENETC_SIMR_RSSE : 0;
+	enetc_wr(hw, ENETC_SIMR, reg);
+
+	return 0;
+}
+
 int enetc_configure_si(struct enetc_ndev_priv *priv)
 {
 	struct enetc_si *si = priv->si;
@@ -2398,6 +2414,9 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
+
+		if (priv->ndev->features & NETIF_F_RXHASH)
+			enetc_set_rss(priv->ndev, true);
 	}
 
 	return 0;
@@ -3190,22 +3209,6 @@ struct net_device_stats *enetc_get_stats(struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(enetc_get_stats);
 
-static int enetc_set_rss(struct net_device *ndev, int en)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
-	u32 reg;
-
-	enetc_wr(hw, ENETC_SIRBGCR, priv->num_rx_rings);
-
-	reg = enetc_rd(hw, ENETC_SIMR);
-	reg &= ~ENETC_SIMR_RSSE;
-	reg |= (en) ? ENETC_SIMR_RSSE : 0;
-	enetc_wr(hw, ENETC_SIMR, reg);
-
-	return 0;
-}
-
 static void enetc_enable_rxvlan(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index c346e0e3ad37..a737a7f8c79e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,8 +128,10 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
-	if (si->num_rss)
+	if (si->num_rss) {
 		ndev->hw_features |= NETIF_F_RXHASH;
+		ndev->features |= NETIF_F_RXHASH;
+	}
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 072e5b40a199..3372a9a779a6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -155,8 +155,10 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	ndev->vlan_features = NETIF_F_SG | NETIF_F_HW_CSUM |
 			      NETIF_F_TSO | NETIF_F_TSO6;
 
-	if (si->num_rss)
+	if (si->num_rss) {
 		ndev->hw_features |= NETIF_F_RXHASH;
+		ndev->features |= NETIF_F_RXHASH;
+	}
 
 	/* pick up primary MAC address from SI */
 	enetc_load_primary_mac_addr(&si->hw, ndev);
-- 
2.34.1


