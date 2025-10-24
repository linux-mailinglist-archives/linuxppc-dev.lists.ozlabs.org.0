Return-Path: <linuxppc-dev+bounces-13271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353EC0666F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 15:08:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctNW30CTMz3bfQ;
	Sat, 25 Oct 2025 00:08:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761311294;
	cv=pass; b=AMAX5VYK/AoGvzGsSk3yQ7Q4MjmLybumRTJjR+bgFmt9onTF1jpZiCJtkNswYlf36ta0lmrJGB87hXWbO0+xE00S+HEzUJg9HTxZz7J1sW2zffIYTp9WksDfWEbjhoPDaVkpw2TgcJt4dshUYZlqXgsboibbmGNN7E91UXu8iFf8Ze36MU+xdnNK7Su1vXQGyIelZRlM2qPAmCO+vbJ3qREJ4AjcUAxJ1LLX4g9LSCx2MB2UnfXtTYCmi3kMG1tM81wM3Xp4xtgnc9cUs5uYk41GJMgARx3XSIUNaxfZc7fan3jYjjq6Z9PtG5JMHSrVUVVX4IvkhupzG7v4CZUT0g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761311294; c=relaxed/relaxed;
	bh=q8Q875ef2HBXuBAztErsbrhW3L2dCskvvAOYpXinSto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l0qfG2RiQIRxC8eJKP8WxvXP6dEIhAdqZwpC4zqAzWUqoSj8xAlOSO0c0rjI8F7ALnhKlYnVhMXvYslYfNl5gzmRMrOyuhGruGVUQKweQVyN5lzLNLFuHePDUlg7AACybWk8w2uzNwFDiSRzACfwE/XZ8rwKiwpvILWJgFm33WYJ4xp7brVSoiAKXrCkDCU0ke5EdQpA63hl02eg2+5QHxPDoUE4UN5zar/lauTk+Kl4Arq+J/07S0zaxBPLdDBPQ1KPPBTzgxaXVeSVn+Oy2f+5w2WLigsnvEXYNhqUs+Y2amtK5wsj/ppNB2CrF9xK2OJd8idPK7V5DuujgNWsDQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=brPkRdB1; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=brPkRdB1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctNW04Rzvz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 00:08:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwSprKU/UXcIKhwonuDXUs6Pi/pMYA5navuYQE9DvZGmrUvByXeWkf5xR4dnZ81rqsX2mmb1suuMGkEYKiVJOaSjge5dM4O/5gIFmF2jfUKs7UcIs7fuJ5rZQ39eiuMnC57EWaWHWkoFflogaDFu1+y5Mw1TjNL5AEvV67205BkJxp2VxHY/YxImDK0m1GdRw2LtFCYQ8/k6F4qU9+eEsuhj19y28y8JjdzSKTNbwhOHpkBYz2Y9Oik+Kr/ESoa+G9MHojeWumQ7x6DYlxdPlv5ttQqSPMTdBrwkGXt1MFtR5oFO45yo6IaF9nkYNKQ1zYy1jLYC/MJbq8b7BsLQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8Q875ef2HBXuBAztErsbrhW3L2dCskvvAOYpXinSto=;
 b=ZU4edTqkFSTabg7rUbR5QUEQejWaYLyyq5Hof98trfY61iGqJLT0eUlxgMGQTM/Ze+3AT9x5Jxg7p5PovAOkY18Ehp6y3DoiczBp3HXMba5bBzuPW65VVzQHC7GocVUimj78dMaUSkvPeEmKUjW6hF3qt7K/bp6/yjz5gVHKJ5zXJrieszj2IvtBmeUuBbj+k4GLrseTKdNA/2948FodpOAcmjrvS2cnneYLCK9DYy5wMb44HOYfn+WltEHpZWHTyKP9yts9vE+1LBXIGnXwrBLgprRvfsS5fyhMldBqEYvDr4vk60xfxAg+P7EfzT6f/EHxxOoPa4wqb/ngJBahHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8Q875ef2HBXuBAztErsbrhW3L2dCskvvAOYpXinSto=;
 b=brPkRdB1dnpPtx8sYBg9NbvsIgQyQJuxQnliiBnaV4fMu/sHJ6ekj7V+MJc7whgRUkmhtXJjEHg/wFAOvaqN/t68vT95bgQtsCuhwvIi4nAuDKHiFgNJfdiYlolJIUG2px0Dhodv+bs4Cg76ULqYhe8FGVINV5s0Q5QWPbnsjgDrE5AuNwY2OX4OvRbo8RFCcc06tzghZK5nRkM9lZSPfFlvDNYSQW5WEejCoW7YNa7jHQGP7Gh8heXQ91saNwV9oI4pzaI87v+54xl5eybv/ga1TB/ygbdvv0bvD8pMnp6fkA9IPboloZcWR80F2vBdiHB3L1zB9N9Ct4aiIXUgnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by OSKPR04MB11413.eurprd04.prod.outlook.com (2603:10a6:e10:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 13:07:46 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 13:07:46 +0000
Date: Fri, 24 Oct 2025 16:07:43 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: fix device reference leak in
 fsl_mc_device_lookup()
Message-ID: <ywza55o3baosjwncxicrhaxiyu45wyrosqlxbxqkzl77schchw@sxfqkmr44mz6>
References: <20251023150558.890-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023150558.890-1-vulab@iscas.ac.cn>
X-ClientProxiedBy: AS4P195CA0045.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::18) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|OSKPR04MB11413:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a92a9b1-4975-4557-592b-08de12fe532a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6cX5RhzIi0zVYuO/TZkjx14fG5d8mdmiOC1PDE+G0V7eCp31NhXLisM0UCKT?=
 =?us-ascii?Q?LsGL2WEcYTetPwdBVLtq80uEE5GO70PuvarKRM7L7IBfpLrNJ7n/2fW0pvAc?=
 =?us-ascii?Q?+bvhXQM5aSt0x3t6TdjNl8qh9dVsMYbNuMw7idohvyEV8zVpKlIVcKfYLLis?=
 =?us-ascii?Q?zhzma9OzN1/fNsSgwZ87ojIwlq4PpwMJ1T4y0GBPpbRi930IsTzwhkbXE2Qn?=
 =?us-ascii?Q?bguWMrCpkLdeYGRMiNWKtxEAm2VNxV7zGSLZebWLamzWG1GwgnUS5323Rm5+?=
 =?us-ascii?Q?82IF0RlvLA40iHYHtvj4OcnWxJksxkBKMju1WQv3hkafOhlJSqZddCXR2TzV?=
 =?us-ascii?Q?c/0YNIOiXgQXJRNxwJYPmsPRad01AsFvjsvAv1fpjNUH5I2o24sj+lF/AK83?=
 =?us-ascii?Q?MaAODGLgGvRI1/X/1doIXKWzA1/CM9/AVVDbf7MbrOrOl5nxPby7WpA9Smhq?=
 =?us-ascii?Q?RiJxXRi+jUxqTgR7vE6lMLxh3QoyjSQ0ChrHAgvwdg1GWOsF8KGSft1vzz9J?=
 =?us-ascii?Q?wpTszkx0FSv4q2EQioy0LVGkWMq/WW6nUfaySvV1qPdHOQ1geqFkMIPnJVkb?=
 =?us-ascii?Q?HxmPfq8q0uvOGDjuEgKse7N/9A2LuZ2dWpDza/LUVwZdNWMILhN4HvJiSZYV?=
 =?us-ascii?Q?BAmE01uuo3s/mfJqsA/7TkIp/NpMk5iv0pYAzl5nBQ6kTus8sHLuS4bap+Qv?=
 =?us-ascii?Q?ZH/cJf7KowuptkQ1qex18oVTwMBcIXsAdetmsVUO+fHIkF0UquWMhwFDKrjj?=
 =?us-ascii?Q?9835GRw5nbp1Hhk6Z3lB6CvoLyEB8SfhuZxIROnnVagIENwrlPr6F0FDopsR?=
 =?us-ascii?Q?5a+KEwAPTFuT+qhEE2ET6mEYEZfVmgdcTv1jxj16HdWYk5hlKsDxNwUP4oZW?=
 =?us-ascii?Q?AYY48gNgXZfoKBmW3NbBHQZiehvg0HFnlAWnZ+fZUAx666N17mAFC7F3LB7+?=
 =?us-ascii?Q?wxpx2f+JTB0CJkUBYjOqyGzxHRLGZO/92ZenQQWTU8LolU3jB2HPvj30BlJa?=
 =?us-ascii?Q?sRXj4JUA5JdU7HfQ4dJjX+kTpHxHhgJzVpIxdQuTypsZmsxJ5ctAoI9hg04X?=
 =?us-ascii?Q?RHeGTKUe51lKE4DXqjJgKRONdx2q7UFQWZnN8LrWeyHBKeGe3SNhMq0rObpQ?=
 =?us-ascii?Q?OVGu0lYLxdiZgI8r0XS9bce3XK9IvbbdEmgaAQzzDR9EDMxyKLzbF1xg8Nd/?=
 =?us-ascii?Q?y5DyRr8lwYFo+hEO1RNiAknhulPsyOarZ1KmBdmCbSWt5bW7Nz9g6Zc54y3q?=
 =?us-ascii?Q?uVNqKQCEWJJL9iYj41YezZXDHqRpAZDt+BRJy8CKfDeCBQ1BpBF/LmZ3/qzl?=
 =?us-ascii?Q?D+vmR+K6WQrY4d1MXrNd+v8rtqHysxV0foVsCAk9/s6QXt7tpcyNbatnNnRw?=
 =?us-ascii?Q?7jt5iyrLdfqICSYORnaA7UcQWp8ULD03LXlxPIkTm+Yzu2glRhCCRRol0iQM?=
 =?us-ascii?Q?NZU2dfztm2M0BR12eC7nbCSBqkX6f8HI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+GiLm53krV84OaucSH4RmeY4wiGnrsvlyvCrSUxh89fDL7Oy2OOT1aTHP9cd?=
 =?us-ascii?Q?cN1OP5142v4sMUlPJxMXRghdhg3wz7Q3YIIX8E9p94dY4jfzXBxJONUjCqjN?=
 =?us-ascii?Q?odrFnYNLjkqaQDesJld1pyc92iVMu6kW/P/CFSzIdbH7rZzKIthYF3d4Rmqr?=
 =?us-ascii?Q?ibHCNKIJkXDx11i2wt6nt+evZ2hQ6S6ZMYybKC+P7s9kmWEH2wBLgu86TTPw?=
 =?us-ascii?Q?tyL4FW+d73Cjdbme6G7H4c1Y4a1PrlXhsru7XPwaKzKCzUXufYbm1KEcytAc?=
 =?us-ascii?Q?RJvOS10bmB4rvMH2P1W5366A/oDykB7bS+V6WOzswOU05lu+SB+Rj9l/ksPl?=
 =?us-ascii?Q?II1723Pj3vvGj0WkO5xOcbWWePFk3PMKkuSUp6HEPiM5INDYtTKorTPMhyv4?=
 =?us-ascii?Q?G0P3eTl4VXKkBmNW+neALvbYEMPn3GiY8IJgjuUUeXFzLeTKuR+EsbiffKIO?=
 =?us-ascii?Q?EifYoRqgACnQCUJU5zcTGVIfA0zRyAdguRrkvxeS5vItXJ9WljqemDit7xa9?=
 =?us-ascii?Q?X8QsUE/FLRMhxH2svqFpoFc0TWy/FAnemRWboiG9eXPDuQEDrZye04j5/c9s?=
 =?us-ascii?Q?KvOASOu/XlT2mRFPvRUP+UdjdoEQ1kyXiH4YNcs03hju2G627M4BEoczvOTJ?=
 =?us-ascii?Q?2heyoar1SvVvLlr/QHCYSuK0LwB/f/6yHsjnx9gN1P4+SYf+2cyflQK03em2?=
 =?us-ascii?Q?JMY4q9zAZ52iMNPKhj/XbigIdMD8H3VFForJstBFGDO6f9B/Km47R/hEj9wW?=
 =?us-ascii?Q?qm0yk8j5Uxt8pFFh4PTAMt1N9Lk5ezuaM3WigwEyAxglmsRHN9vox+fIUvwq?=
 =?us-ascii?Q?ETYGvOxPi26JyKLSF31bxR4p254t7RkuW63cNp7Hs+Rj9iARCgQxBkbxYJaV?=
 =?us-ascii?Q?/3L1EcvNGpSP8/U0vmaaV/NGu8fB0Sg5Kvi6mgx6Yruh7LWQcVJ5pTMgc5ej?=
 =?us-ascii?Q?NLFtAglVTuiWUlfRg3pZT5X4hLfkl0/+63JVz+X6IqmyJuDFe79FnfIurI+v?=
 =?us-ascii?Q?+2X2AR03Ub7kqXZLA1hX5+/XsjjbQCjY1TpiEM8yR9a9NmXKp93+sZfWg5RG?=
 =?us-ascii?Q?B373FSf6GGMr3mdvaVQsuUQi8rp4UyyaO2es18n7czFsO6lN4ECOH0xnqlNK?=
 =?us-ascii?Q?NUJ5NzCrgcYLrjVxAUtWquDjsLYYIm0L+mRAXpCc5TBppfZLrohshrtz+8P3?=
 =?us-ascii?Q?NPfGd99TEe1ZxzG08y7jJD9Pp19QqVVutyBUHXJPsXB0GksB4H4azacGUXye?=
 =?us-ascii?Q?NjFupHFiIN8h7tlR60+S6MFpAW5jISOxdQSPTtr45w0CBS2ZXhhEC8lTD9M/?=
 =?us-ascii?Q?TcDoYkhMt8A71RrmPGJid2Uyd7gRek3TmlzPtXKuJ3xm8lr/ieMBcOkR/m+T?=
 =?us-ascii?Q?wivAOQGCsWwyrfZcK7ylo8zxQ5cXxMRdSFvKie1oTXcy5ijGygBUsRuLALu8?=
 =?us-ascii?Q?/LSlEizkibxiF1T5cH7iOKu/lVNcTbF0+gDyw79iknEZCSXQwccWKshanVtn?=
 =?us-ascii?Q?EsgbJIzEd8C7CnY9k8QNvaF5Nd0AEect33931sKMXna7WzbubfQ36T7e2kOR?=
 =?us-ascii?Q?LG/smTMjW74d0cvZi7CEEqfMUz53r40MdhuJ8YOr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a92a9b1-4975-4557-592b-08de12fe532a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 13:07:46.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8GP+bn4sUYhEq7BO3TSK1TGC77Wbmxu2atdnSAstCfQTCE3ZmalwgkL01FsTqia1XJTF1vxZIYuMKpXLrr3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11413
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 11:05:58PM +0800, Wentao Liang wrote:
> The device_find_child() function calls the get_device() and returns a
> device reference that must be properly released when no longer needed.

The release should be done when no longer needed, not even before
returning the device to the caller.

> The fsl_mc_device_lookup() directly returns without releasing the
> reference via put_device().
> 
> Add the missing put_device() call to prevent reference leaks.
> 

No, the call to put_device should not be done from fsl_mc_device_lookup()
but instead from its callers when indeed the device is no longer in use.
For example, fsl_mc_obj_device_add() does call put_device().

Ioana

