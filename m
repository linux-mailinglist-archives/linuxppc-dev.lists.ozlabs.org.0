Return-Path: <linuxppc-dev+bounces-14808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B59CC327C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 14:23:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVyKf3qlwz2yDY;
	Wed, 17 Dec 2025 00:23:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.70.18 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765891382;
	cv=pass; b=ArLLVnwJ0qhH5gPk9+ODeR8VEc09CYV9RhZYmYi07NorH2fFDPWDZ6QrQaChMkX3485OrcenipJ+ljSf3p6h/Lvpt1nZemWDshXU/nlj+jtg1MhOQUA+StQfs0337lw34ocJvK52y3TaYKMA28VvZlDNFHE4NLDW5Oc5ltwujBAGiRWwaNl40j0wAbNU//Q3+3pdpOr6eJUI1vGJzfEZPeoRny65XqjQVcQkNcL48lyzpUxvgPv/fUdNIINTSeRAQykK16OZxACtepfN4f64aOTqqtjMvNvXYFM2NGjMnNVIEU8PZy6iiQGLRmhqmxObslf+liS9eyL0VtCQ/4UBAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765891382; c=relaxed/relaxed;
	bh=kK3zCUip5XCRGu48iFZkzA2Fe77kNPkRNCmucJsTZp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iycg29GwNBZdk+iPNPdW0SQxI+xBjIQ2UKKEz+zLrkVgIh2tWUBZcvU640zK0t5ChTNvdw8GOViCXvloAvwDwl8mQF1cIRVJcdzQq3t78Pyl/OAN0dDNFTvGfZNT9U6fGlp8jgGkZ1IWswq2GWPCsITc0aNKYbDrv9h7OtYeeLHoCZjCXAyl51bJrntjw+V5achXBtrt8lE9WxLhIXh6MzUI2bRUHtun1x0525B1Qt0S7cC4s3+MQPdKZkmiFgB2MVkOjvZVv3Z2kBISmO4sBC1GOe8zEWu14nPPZlfBkFgU0hKr27Jb3WVSK39OvBdDCp8NAzrmJLZVv5Dg8q1QyA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hMGRubAE; dkim-atps=neutral; spf=pass (client-ip=52.101.70.18; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hMGRubAE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.70.18; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVyKd53r6z2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 00:23:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5A8NY3R3Kxj5sDsKmvmTrjBdZApZH6JPqZbmHeprazrAlHNypp0OqUZkDUFix/QuEz+nQ7KLhiEfDCaNpaNiAlFL8tay6KXX15Z5ngR7E7IU/2le/WM+lyC7sTojyWiVJztgwSo3o/lo+v4qHAXgy2Wl0r9iexlwieqDSGsuAL6JpS6PaI34vcQHVBffwJrHMMSLVHYMglzsqi3kUPTU4jflcYWpG/HnvJ8tqtEAy5OB2MQj07h2EjrWDMuKAtsTdFUBGn2iR1cNOnCbkDjqnCCty7qeVU2raXDsKevtD2PenfqksFZ2AiGpMlo10SjHcu6XzYcM+IkLfKyLeA8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kK3zCUip5XCRGu48iFZkzA2Fe77kNPkRNCmucJsTZp0=;
 b=O4VLOITDLfe6INwcITyDtBCdGgbEqJIdXROTrNslGLj3I1fQrzqoma3fHcPIeCW1RL9gS/0FKceZbffyxRS/hwHWgbqoAk10cHL7hSucbxo0v6oD98E6RRb5otaBB/KgjK9+AfMbRgK+4JEnLdPShiufpByCAxi7WJkmwkffG+wS20dQHUL7DhDu+JQh7qBDv8cemvpqgiE3SuMQKwZBnezBz5BygUDjH4FrIP5zuDbHNNQf/MY+6AsSldW2iN2M4VR6cW9w7vJSouRYwCtTGRpwmBIsK5vR8tXC9xAAyC9Z29S5RrhNtTE90uylXRw2c3CHwENmNcghXsHe7D/rWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kK3zCUip5XCRGu48iFZkzA2Fe77kNPkRNCmucJsTZp0=;
 b=hMGRubAE06moLYmVXy7SklTtcOCgTKFijG94dzmsJ8KzGv19M+myoMsuvG5mZy3szLSti8fK95O/wZUWSexOBA5a9zeUQjZDb3Zc1DFXw8qNcEJuhulUOZ7msfWEMBIcYtXcoPK7e2PVgW6XQd7fok4xGf51RdUST7vNXmNpSHwbbXWoOxTmetEJ/mzu3L959/zdAuOW5EzwXjF2mq+PvRosG74c8AB19kzZm3asSBsSRWTpnWwsbO+MeBedyRUIyAUsoGtOJ3YakLFT4gzZ1CvVU3VSOgIFJuZI0LKj6b90LH87lGsvBheaSuWgTsh6roSaorLVU8dcEu2HTpd3eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8242.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::7)
 by DU0PR04MB9443.eurprd04.prod.outlook.com (2603:10a6:10:35b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 13:22:19 +0000
Received: from AM9PR04MB8242.eurprd04.prod.outlook.com
 ([fe80::9be4:fb7a:535:5c08]) by AM9PR04MB8242.eurprd04.prod.outlook.com
 ([fe80::9be4:fb7a:535:5c08%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 13:22:19 +0000
Date: Tue, 16 Dec 2025 15:22:16 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: fix use-after-free in driver_override_show()
Message-ID: <7to5mxgie6rpv4kxfcvt3lol3mp5qchzjlu5ayzkhnej4rs7gw@wyhtvzjugwer>
References: <20251202174438.12658-1-hanguidong02@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202174438.12658-1-hanguidong02@gmail.com>
X-ClientProxiedBy: AS4P250CA0022.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::12) To AM9PR04MB8242.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ee::7)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8242:EE_|DU0PR04MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: fce13776-c9af-45eb-1dbd-08de3ca6239b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LTYFaaJ/J3TpZVrL7w+1D6Kt5nzKpbahMpUG6LI55nWEqJwehlzLqikWZta2?=
 =?us-ascii?Q?5WdTgMSYDm9S8Ix9q8ZoTeOvkK9l/pyE2lQqx6a8xGiytUdgDMnoyEDoxndN?=
 =?us-ascii?Q?nFR2QjHLDXsqWX1XOh5ty1gomU5JUAGC5zsotwXasP7LNo/8GRGya0zRGIlc?=
 =?us-ascii?Q?OAiahcvMkcH5HbGIHIDb3A0DP9BSu4yk9D8IjDSkRaZLA7p9ANaSWbYItOzX?=
 =?us-ascii?Q?mu6a04qV+iJMvzfw7abWkqGavZ5pgpnQm0MYWZ3HUJsVY1g8QvXONaQloCgm?=
 =?us-ascii?Q?vWagT5Xe9RPnGTigKkSAHjee/A0jkuTkduQFUPmc2z2V7RiF7DFIDGNh/xB5?=
 =?us-ascii?Q?LybTrX98VzuOq3CI3RUUAUElRyVsCqbYPjvpLM2TVeDbQXaiSuUHpF20Y7KI?=
 =?us-ascii?Q?ekD+nHvEyZAw1oxL3keALe/vmWrzgJaGBBw0tvz1ecKLFCpPMR+ZmNWeFKFA?=
 =?us-ascii?Q?cGOtDuq95Tine+uQl+0NsQRLJWY8Bj0nd8ZzZxIivw4maUwfC/jcYbU9ezKk?=
 =?us-ascii?Q?7Dh1wnhRFHdWOIRlUeRftT5Zg+jLLlDqPCQsoWU2TQd6ja19SjoyV3MNILNv?=
 =?us-ascii?Q?NFQqR2OJBc7M5AWDBccsX1UMEYTb9MdUaTPnQ8UlWSP9aNs+iZuigOTTjt2x?=
 =?us-ascii?Q?OmuryTRo34v+NKZANj2YQxuLvPw5YQ83ZkhyhZnBf1LRMxOWns6J7l02zd8z?=
 =?us-ascii?Q?d7UhxMU/zcOjwp/ccsVDTLnP6EVq9ftj/otyM8SzjoWPrXBQf+mXwNZDt2P3?=
 =?us-ascii?Q?/lLi4F/F3nGICM+jgHVxNCNSx8R4nbFXEhP51ZSllera/e2YikPAHf3dP3j9?=
 =?us-ascii?Q?uCycUaCmZRvXxs5RK5px1+qnl4thl+rBflYJPxhFnFsruOll7li1GaWkOJgE?=
 =?us-ascii?Q?TxbL1vQy5NumLVtrTGGOdUIFSdZtfD1v9fb/yVPBQmpJSVckRE5mF7bFrion?=
 =?us-ascii?Q?ik9dbSGMLTNEqnJrYzQg+v13Q8j9YkyIdq8uCp9eS9YaA0R7ArU7wtZrxCg0?=
 =?us-ascii?Q?wO95g5h6yhBVDRnYW9YgU5jqJU8IUUMnMUOM7KEk7XOLbTkH9Yw3YraSA6c7?=
 =?us-ascii?Q?yAA8XTpvCbX7XuDLMj00uWXWdN5U0wU9fu0MeWPW3LgyHEMXoxW1kva+SBN9?=
 =?us-ascii?Q?xG9ljTzuevBvgdwJCOj3hNmWcG91LVhxwGBPItaMcO6zlIu3wo4ce0EehUjs?=
 =?us-ascii?Q?NOsSQHMO7ZeK3aw/3HQYqTajtEr72T72Foz+FKEJoiG6qOB/ySbPwX4wdpFZ?=
 =?us-ascii?Q?iRlo05CccZ0pJko/kXo/7OG7HS6SwnjX9NcFaInK0FF0keSlRqOs1JeHevRK?=
 =?us-ascii?Q?K4/8hNu2gP/PxOLbhSqgZ+xmJyTCH9xb8fEsvGlHJH0iEgU95TuDslWpREpn?=
 =?us-ascii?Q?+exbnKll1Z791FJS92aOQ9lgt/o0I1Z2xeY/NdoulrNV9e+W7j7hdXTWvDJ9?=
 =?us-ascii?Q?jHOQqnd9qXT5jnHvEIFr4SFYu8UBeZFD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8242.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DpKCYVyR27kb7ntQMLAi1pMUjyqh5msObuRSxAwKRqX17xJCsx5mLQal+ZVy?=
 =?us-ascii?Q?a4niqMhOHs8X5P/f1pDI8VhJBfkwhB9++LmaMKFB1K8lMwxv7XsserABw16B?=
 =?us-ascii?Q?zeSK0FKE+F3y4C4QbFpoed1d2zSyMd5em0AplAJlZExA+OM8jlDtcwUtxQRi?=
 =?us-ascii?Q?a9Q6RqvattRMra9R0kKAHU8ODK/HvVOtVQB/2JsUzp7O/kqL8zP+KlPnEzv5?=
 =?us-ascii?Q?E1PY8tVatcRoQDlG4GJdT3xq9nzwmUkqynq3Gy3Wdz/BC6pO+eAzZ3YC7ihk?=
 =?us-ascii?Q?yn7/WxFOxmBxcAnUH6U+hwJKiVVvznrl2oFG6qIUeG0H0UDMkweqBcv0BKJE?=
 =?us-ascii?Q?6hJpcHdWAIzMiVOETWc+8+HSmk8zEaHfMYiTqbTQ5xcaduJVffzejdWqDj4W?=
 =?us-ascii?Q?SbJzZ9N9gzgGbbsILBjJwkelbjZpir17lA1rlENMlXJluA7x6JPjqgPQkR2c?=
 =?us-ascii?Q?K9BcseVda0LC3gwX3+Zhd1vWMXGJfbSkF3WNDzUoiuz4Hk1hQcNlcguwUGAi?=
 =?us-ascii?Q?2O/n3NKxOdNmB9GcznyKaRpcak7DMx8XCqR/9r3YpeAYKOjfia5Dr/BmfrPx?=
 =?us-ascii?Q?EwUZhDtKzKpS0IBMXTS74DLBd5F22vp72Uiiu3fv3f0TDXk4+DamIJP6Ip6q?=
 =?us-ascii?Q?gWi7AjYFXy5rjRotNXAejS2qRRw5Y1Dht1DdDDZ6tHpwUBUEjeBTqGaU+f+K?=
 =?us-ascii?Q?F7+5rCHc9m3jyx5lq6hvY/OEQmkOkSLfylC8z60zMFEABtaJNwiMqQVVfvOK?=
 =?us-ascii?Q?TIiy5bJiqU8KFV1wySXx9+pcMTq7X/JfK+dNlNGnWjZ7ys4xZ6up85mDxPGT?=
 =?us-ascii?Q?98Y9oVj6LYTfaPrxGcodSACjTYCSnFlfNIncm7YvnKtlTMRskfn5RS+Je6yJ?=
 =?us-ascii?Q?9rJIO9+SBEd4scklZ2rUHilfBnX8c0nxAZrwx+tsiCrY85jz1Bp41cy/O21q?=
 =?us-ascii?Q?Wtk9y62CYoqLuTPIw9RCUz5FPFLooLF2IBx5PffQ+2RWDMpIsa4DAnU2yi+b?=
 =?us-ascii?Q?Sjwmgb3Xxttfh9tG1+pGm9z6WVrZSAPILxgLWIvc1D1+dfRLtbUaAhCb5gg/?=
 =?us-ascii?Q?vuDJ4uIgJ+B9jM8QPAYIQonITuLefMEVCFRZh7TW0XFQqXTtba0gQetpTayr?=
 =?us-ascii?Q?gKifkQMtDDi60MvVZfhQPBI7AcfmqlovYBGgFi7DTgaoLGgl1ANmt60XVNrh?=
 =?us-ascii?Q?3X/FKfaVPbW+Vs/QzANOltq+H7PJpqwHb9NqoOQCv50bOFE4GGETw3kBmi5H?=
 =?us-ascii?Q?7TkzQyWR8kVCB/CVRsQCcTX4GhqR+vu+FTsYnDZzPy5CZWsPpkha/wJHwAlW?=
 =?us-ascii?Q?rrxselLDBxOB96gpEzWpEurpcWTRUdx1vlJTANIahadkaMQXojMIM1d1SS21?=
 =?us-ascii?Q?DKErUVVVpEg8m12xbd++hUtAHSfAJtbostzFgyYxjnzRdWORkLqidaoKo+UA?=
 =?us-ascii?Q?tiBOpIg0HT1nwl2SBDh0DSI800EVabZr4f+LICl8aEeHlrrorqD0hfZHYdNT?=
 =?us-ascii?Q?DM9Usl/AT3E49bo2WhYneW8hM/HD6WWsszZx53edaM7nEOZKPFfMwr0IjoQ2?=
 =?us-ascii?Q?cOhJZ/aKVxKCAAlUd9Mhr5qQlIxUeRRC1vXcQiwz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce13776-c9af-45eb-1dbd-08de3ca6239b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8242.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 13:22:19.4320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AM6ES6IhK/YkdKV9o74MYt4JPHEPmLT54T7CxF3urNWzCioihLznNPe06PyjykHoOcmZGykgdoCnlnf/N94BMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9443
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 03, 2025 at 01:44:38AM +0800, Gui-Dong Han wrote:
> The driver_override_show() function reads the driver_override string
> without holding the device_lock. However, driver_override_store() uses
> driver_set_override(), which modifies and frees the string while holding
> the device_lock.
> 
> This can result in a concurrent use-after-free if the string is freed
> by the store function while being read by the show function.
> 
> Fix this by holding the device_lock around the read operation.
> 
> Fixes: 1f86a00c1159 ("bus/fsl-mc: add support for 'driver_override' in the mc-bus")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Thanks!


