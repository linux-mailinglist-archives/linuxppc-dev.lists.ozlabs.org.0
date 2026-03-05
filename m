Return-Path: <linuxppc-dev+bounces-17763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN86Nh/0qGmfzgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 04:10:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BB520A709
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 04:10:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRDzz38Bvz3cB3;
	Thu, 05 Mar 2026 14:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772680207;
	cv=pass; b=V/2d5RcAQaS/+huKe5nxy0EdsfQPUOG2r+OrLRzA9Binbd70NHiQD8YRZPqYtsFgChXdHdaRrkW0n9lBvohrHZZbGnJNnx+52n7AFTaRT9vKJjU3pHjczQaxnrMOPNFUZcke3hFkidBwpSxMLfAwT9H7Q9/wk/Ouv6hYbMD+OSDGktFw6B4kCwucRHuf11h8v0fSYt9X4XQ7rYCRWIkgRskPsNkXtOmni4HYIsYr/9Nr5XT6GC2bF5Bqu0ni/31RWK5p8sP9CCLyKv+AwLsG/wK6y5F2wryMnozPK8yKZ8+RfY+eA9LelIcjLrKMB/5Vc3J3BOv68h+OyAEBMhI6/g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772680207; c=relaxed/relaxed;
	bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b9vZdQU/fc7apowYG7MZa86mWkZvBlUCYOiO1J51PpgSkEHKCN4eMYCZdPzUiQHvIQayg2ZbM0a3CKv0IaNzWDue5x2L1lIgx8hg9Cx1OykCGpw9kzESkGzK6MIN0GfDGiGI9+JVj1veo+PNdp2jCLcwDiFqorekQMfDtTPSJp2tUhcbMSTwCA+IQVXIYi6ACJXsq+7BZldqLAV0mPbgGHdxByBT8E7mgDebIkPZYnXh7NFtQXPwWp31B02KxsdmKnNCDebWi5qMvDXErQ9GGX4LLC1Xzex2Mie3h90ED/XmBCuMEpYVxkgqxNO2sVXXAeLxE74VjMtZF+y3ay2jLw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V5hTD3BL; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V5hTD3BL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRDzy3VQ8z3c9M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 14:10:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slBb+NiYWR0FipMlrEea18WjDU5RWwL4tT4lmLG/tF2jKRfsOoUob+dFycVWLD1WW4aimmEXmQ993QnZGaigOk3Yp4F//swRVsPoaFKp2oFIhDEExCU5HLmGI7Og8XBKB5VY8Wo569RrFfHhtA8Td+k4OVDGDxWWoUXGMadoZJrdEHSFvxinxAD2HGFsVAN7PpisYkNEkdudxerl/GQoQUgMdhqz1kSYWk0vvfD37J8vELzYlAuomSrLzVj2d5vL/01g98qoKgRvBzNB34pJACbZ8gYOFemmLV2nOic1K618KA6ha2uVKnJnUrXwuGn1EvwvwG3kNq3N+mIwqt+tnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
 b=mEoFGANJaZHoWad5j7e7WU4eT+RPoZSk+/aCQpq9NfJyyqCjedMhIXS3p69fClMJvazFlHsBDdIZtY4rlrdr3T63Z+AKBV9m/6oLQem3eAnKp8nB0W+i+eRPRFllRc93KL3FaRqPhGdEnEVvGI2s8klluLL+ZrVl64qFOgO6sYLoiuvtqoyLuCdgYRlWzeQyqTEhV4788Zz5joRJjuxv5qCRh7VjM08voK2j+zORhlTq2RR/BLYeCBYn9J25jysVj0mq2AxUCWl2JBhNfKHrBEhsWaJEqwCVMeOIKpHKAMdquXc48ZtUcAFcLxUBlDaWxKFe47lSeqExnLo5104yAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
 b=V5hTD3BLICqRxeBbgKDC+q+SRxKSbD7FjXgjrRt/3RVIM+L4sl04XXRErz1OCrdi3WHgQrBivijMuqd9Fl0wEJtbrsIiNc4epNHCLrT8IwZNXjW0g8ZvbMrxeBdX5cBv35oG/Oo0Vc5gyCcb+NMP3LX/roEa36ZSNvh/Gh1A2uBg765YZFTR2HTQCefFkA3DMTWkd+YYWCv+p5kuw7W55+hOkugX9QQCdAJvX0ncu1XB6zsdKarM1KBZzwroJR9AvDjBoSXiPlzMG9S9NMG2JQC8TG5ct1mbXjfZBX16pKktw/2UKtW/ZHZnNYp6OYpUqizc+ucsrYDILTDxPz0kHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by PAXPR04MB8159.eurprd04.prod.outlook.com (2603:10a6:102:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 03:09:49 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::4dee:baeb:a5cf:1664]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::4dee:baeb:a5cf:1664%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 03:09:49 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] ASoC: fsl_sai: add bitcount and timestamp controls
Date: Thu,  5 Mar 2026 11:10:30 +0800
Message-Id: <20260305031031.3808182-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
References: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0094.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|PAXPR04MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 03160b02-cea7-4234-0606-08de7a64a913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	ST+Rf9PtEQEACzd3W00y4Bb8UnZkTH4cmhl5jzPXxSPP9TMnm77jcIwagDiG1OFEHRUcLHhkqVVs2jaUa0d20kJtPgmOzYucJlB4P+69+L5ISYJQUpSzhCnhvSuwOJUrTQnmsjOULJv7jRqfIiSFlv8Wfq0bOYfp+GL1Yw883N9ft19Dz99Y0thbPL8pbC0Zc4KXHHfg/DFJhqczRBU/szaSj5UCL3Cf7SLzWkWLz/3S+A5DFfgB+ohDaKSp73gMPpbtevQd4Il9tEhbklT6DpV3WPzsaAUofmCFCNR54mq1g+caeMU3dKiD9NuN8nY6HdFFtEcewrTA6C7pL7D2fQYYA17zGC/ZzAv8Q1D+OjdCQUdJAXbG2dZTi8lsphaqHyLOUVV/L/Xxn1LRsOdLtBkdou47muFD87+hKzJ5Y7PAJ44421rSbblCWWx4+eG53s3YVaS8AlcLxzJeDVgrIORIF9Bsj9cjNDlb4ci/Sxsy1z1Lz0+9rpClataEvnMxVc4nwkxkkU04a3neEmoLcRvCngg0zE6LP1IEnYUZ523FyxuGLipjyQRZem7SIAwTrSRCXfowLnwRegB0QzOC2GqGS++1xHsUlDCvjcKnvYu/iCFZZOvbDqE6ZzX/qU/fb9QXwkcBmUn1ovgyKo357ii9fYdXlPFVl6MbYGijgdigfg2RsAM/fmMHRQzEbX9/w2vj+Qx6QL8hlQInhxi0GZCXSmBcMUA3zQRSaDWn431Y0P/M6MQcvgpYghJwmNLlgjTPVZJGdwhXOfMvkc3kZyBJSn/dcHZoLmsPJG9HzQ9YSn39+u+WtXCnK0H2GDYx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?egSV7HHK99a9O8JGs8i1QkXYs+XNi91Pc3CHboUfR0QjxSf3XdGXN0uNbtlV?=
 =?us-ascii?Q?hh36Ye8mbAP+mZljl5DU6nOX2S8KThBsYU29ZQ2/ZBi0apbc5qMylDlCL41I?=
 =?us-ascii?Q?CUa2Cl/URp48BI6+/6dL0imNTldNoSkB2xCxy9H6+Lk9j0b7oPpKhFWGPDW9?=
 =?us-ascii?Q?wAhtcKqJfbKgzval24NAM8vVsfMONoRB6wP/IDHkWn2fHB74piS8kxhK2tWQ?=
 =?us-ascii?Q?t6m7UnLG0V/3Ow0yahNxvmhQgSqKZxhBgKA0sie7paFWekAMjzxMi7dZ1YcN?=
 =?us-ascii?Q?HDFqqu3F9kZ08x8ViA9QoVuRvS/sroSkdPzafFAHKxf6RS+kiOxpDiyrjpEx?=
 =?us-ascii?Q?5zMLnRVgVG4etlBa91pQL9c5gtdTDYDgWrylmzmAkbB8cyckxqx+FlCKKfj7?=
 =?us-ascii?Q?2w/xNOoQXT+VkBcbk0CJYd4Ez2TyAmjrFtWvBzI2cvH0/xP/u6aYSXQSNvfe?=
 =?us-ascii?Q?J6/naSPCP15KC0a4LzFx5zsHtyM4V1Id4QUguq5bryeyvWN7NKYJRwh2YUbJ?=
 =?us-ascii?Q?ZVSxhd/J9dlb2DMt/1IWZYZxanI4AeyBQzwBA1G1NP0q/l2aHTzSLCb60kCC?=
 =?us-ascii?Q?xp33U9YS6Q1APzmsu+4yVngjP3mOoj6vI+CSQ+hL34Zv+wETdVVM8+enXlGJ?=
 =?us-ascii?Q?rvDl3ao32D11HyjZRSsVrbC9jMMlM+azuK0rt9A8bDmf6BIo+TC7DfiCLoxu?=
 =?us-ascii?Q?LX23wZfomOtQHvbmj4BbnvKi3vrWYgvixmz6cRRPwFn0pRToNOy6ClAFz2vB?=
 =?us-ascii?Q?1WstTgq6y16Ea5wJW9+DTiuyj/x8H7QF/A4y+6gbS7jiyp0r9OuIydkW2GWL?=
 =?us-ascii?Q?kGpBCGqmPLHgUgunCVNCVFmeKW3J6uZyHORfK7ag8riJud99qeIaMid9GpFQ?=
 =?us-ascii?Q?DMz5GJ+SkYMkpOu8Ileq4FUMi9ECqCWIsCkX72MV5elU23uYXC0XBhFRumEX?=
 =?us-ascii?Q?D7tm176xygTweC6WBUhHL8zUoXD9HCs8iFG+LtxPbodycQoHFGPllamaKk8k?=
 =?us-ascii?Q?ycvwYYdwkRKu205VkO59g9nLOmgzjRpSoDG1EJyEMug2IO/yTM3kEEklJq/C?=
 =?us-ascii?Q?o4SwtglJUfbullqilxEUDxdpPm1tBZGMuVtGlUhDMG9jVXw2HetQQCWbrfyr?=
 =?us-ascii?Q?6WkjiSSwr9oYAcerLNdzA31FluHUBwS2ERMipmpEGYcOSEXuI8ohU+qxpt7E?=
 =?us-ascii?Q?FpUvHhCfhM2L+6LzJm9HDf/lHkdsIAjMgTw7+9VoMbFs4BxAM7WaF/Yy+V4q?=
 =?us-ascii?Q?e/XdOESOwAJFsDxGTGqssZez+TeI8zuTNwACMrfn4dNcil6R3qCPOV9GITiH?=
 =?us-ascii?Q?isDsxZzbAKEDl+61zSObCRoHSKfScZClB3aFVj62Pp5XlGTr2X7iW8cDhQgu?=
 =?us-ascii?Q?pnireVjeL3L9bjqH70BDrP/prby/T/3ap/Ee/wvMIJ2O8M2rml2IsAd/o3OO?=
 =?us-ascii?Q?Ux9DcKKxxonKPoKDK9tsCqMMa3M355KOah8wqrwgx1BZWSxwDNVSjcvyrwZD?=
 =?us-ascii?Q?Av/00uKCKanOw61052H38uIdtzzTrCi7W7Hz7ksYDszPckTp6tqfSUkiBZpZ?=
 =?us-ascii?Q?0omTZDTL21d9eKcm0r8MdZneXoCwGO4MEFysFo14gUA7p9Yn6iyEe4Hj/ss6?=
 =?us-ascii?Q?vhDCT/9wPFDfKuy+enMlin2dJ8diYHIbznwtRyaLbeDeTMSmgShZrBFawG4g?=
 =?us-ascii?Q?MhNK4FuFF/IcHuDCwN1yYU8oI1Cm4HoDGpNsaRWC35lnw3hudUx/y0CiqXu0?=
 =?us-ascii?Q?zcEfhpsKjg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03160b02-cea7-4234-0606-08de7a64a913
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 03:09:49.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/PuNh2+n9ms8S+4m/Ss8zf9JotJzV2Wh57ReiJ3N4mEEQSDiXyisUKjeKc5xIFV/sl34IovfA/LBJEcSTIkww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8159
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E3BB520A709
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17763-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The transmitter and receiver implement separate timestamp counters and
bit counters. The bit counter increments at the end of each bit in a
frame whenever the transmitter or receiver is enabled. The bit counter
can be reset by software. The timestamp counter increments on the bus
interface clock whenever it is enabled. The current value of the
timestamp counter is latched whenever the bit counter increments.
Reading the bit counter register will cause the latched timestamp
value to be saved in the bit counter timestamp register. The timestamp
counter can be reset by software, this also resets the latched timestamp
value and the bit counter timestamp register.

The timestamp counter and bit counter can be used by software to track
the progress of the transmitter and receiver. It can also be used to
calculate the relative frequency of the bit clock against the bus
interface clock.

These bitcount and timestamp registers are volatile, and supported when
the module has timestamp features.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 62 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  4 +++
 2 files changed, 66 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 148e09e58dfa..aebb5278cea7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -41,6 +41,48 @@ static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
 	.list = fsl_sai_rates,
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_SAI_TTCTL, FSL_SAI_xTCTL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_SAI_RTCTL, FSL_SAI_xTCTL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_sai_timestamp_ctrls[] = {
+	SOC_SINGLE_EXT("Transmit Timestamp Control Switch", FSL_SAI_TTCTL,
+		       FSL_SAI_xTCTL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Transmit Timestamp Increment", transmit_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Transmit Timestamp Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Transmit Bit Counter Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Timestamp Counter", FSL_SAI_TTCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Counter", FSL_SAI_TBCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Latched Timestamp Counter", FSL_SAI_TTCAP,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	SOC_SINGLE_EXT("Receive Timestamp Control Switch", FSL_SAI_RTCTL,
+		       FSL_SAI_xTCTL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Receive Timestamp Increment", receive_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Receive Timestamp Reset", FSL_SAI_RTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Receive Bit Counter Reset", FSL_SAI_RTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Timestamp Counter", FSL_SAI_RTCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Counter", FSL_SAI_RBCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Latched Timestamp Counter", FSL_SAI_RTCAP,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+};
+
 /**
  * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
  *
@@ -1010,6 +1052,17 @@ static int fsl_sai_dai_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+static int fsl_sai_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_sai *sai = snd_soc_component_get_drvdata(component);
+
+	if (sai->verid.feature & FSL_SAI_VERID_TSTMP_EN)
+		snd_soc_add_component_controls(component, fsl_sai_timestamp_ctrls,
+					       ARRAY_SIZE(fsl_sai_timestamp_ctrls));
+
+	return 0;
+}
+
 static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-tx-rx",
@@ -1063,6 +1116,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 
 static const struct snd_soc_component_driver fsl_component = {
 	.name			= "fsl-sai",
+	.probe			= fsl_sai_component_probe,
 	.resume			= fsl_sai_dai_resume,
 	.legacy_dai_naming	= 1,
 };
@@ -1211,6 +1265,14 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RDR5:
 	case FSL_SAI_RDR6:
 	case FSL_SAI_RDR7:
+	case FSL_SAI_TTCTN:
+	case FSL_SAI_RTCTN:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_TBCTN:
+	case FSL_SAI_TTCAP:
+	case FSL_SAI_RTCTL:
+	case FSL_SAI_RBCTN:
+	case FSL_SAI_RTCAP:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 7605cbaca3d8..af967833b6ed 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -196,9 +196,13 @@
 #define FSL_SAI_MDIV_MASK	    0xFFFFF
 
 /* SAI timestamp and bitcounter */
+#define FSL_SAI_xTCTL_TSEN_SHIFT   0
 #define FSL_SAI_xTCTL_TSEN         BIT(0)
+#define FSL_SAI_xTCTL_TSINC_SHIFT  1
 #define FSL_SAI_xTCTL_TSINC        BIT(1)
+#define FSL_SAI_xTCTL_RTSC_SHIFT   8
 #define FSL_SAI_xTCTL_RTSC         BIT(8)
+#define FSL_SAI_xTCTL_RBC_SHIFT    9
 #define FSL_SAI_xTCTL_RBC          BIT(9)
 
 /* SAI type */
-- 
2.34.1


