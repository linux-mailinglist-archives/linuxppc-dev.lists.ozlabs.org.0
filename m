Return-Path: <linuxppc-dev+bounces-16059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 325ECD3BE13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 04:53:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwD2B2zDGz3cDr;
	Tue, 20 Jan 2026 14:53:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768881202;
	cv=pass; b=HXfIBZ7i0u/cOpuvuG2wGYH/YnxGvtRoOxaiii/1wbDwm7OdP0ERGdy1Xkr+TQXb5MnYeX8dwnsydVRRTLkjMaFFM1AZwNI/MYD4J+QCFMmz38nTf3pvzAFEy9+meD4TYpdI8WYzGL59olp+Q7CLMhcWk6TBQOduZDxozwnkkboPFGGtWJBvpH7CjLNrDlz+k27ExsXwq8IEHTwTY0hLbwsFT5NXC9QBFxRQHSCXgn06vsSIqKGam5TePFlxMwQF1o9yMf+hWxAN+Gq3TNjv+Po05DyZ3mPa4qp9GQpeLS0LXOYcXW5NAVBjxnLajYO5PiN7oQ+ei+ofkKvVjc5yIA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768881202; c=relaxed/relaxed;
	bh=LeFGoEWsSWDhNcyLGGYBwNWJwiiZ4UjXbKENET8uby4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gJBAcLX2KeEWjoadN7qyiVW54JF125q0ni+uaqn6Ur5SN9O+vLXXudZbcleEQEnEA5jcCZdWeWptyDJnRjF3sfW92J5MzTHg+G6o/4oVsJ75J2sisBjQ8ADVW2obMEvMyWnILJzLhyCAfQ7fnYkstoQR2dqGuFBf+3ZhKFNRXp3rnSiE4E/canJ0mfrFnETdB0JG3gIxP73EW2Pi/F2HUKifWQvelZnI+Zo6M15t5hV6MPr5CkvdJH4ZTguR5UYlZJSMYS5h/LjmTcjWz68s6gZnYZYWDMAtZcqYSLuEa4ZYcVIE/LotZnY3T2yS/GTiCMpOnYBBHuZxXjSn///7Xw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hobRgqqz; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hobRgqqz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwD2958W9z3cCC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 14:53:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Za23qeb/1mkoQs/TWM2Z0lX9SX6ByKrVZuiY23UCIXDucTVpco1lACLYt6n/adB6oyOC80IhE+dWz7NFoZRsy3Ux+4B9Rb6VORLnrluXE+mREhSCUkZX8Efln6NbDAhXkMAJW2lpv7FCV1dnaRaJgGWwoz/ZzLiBywZsRIaKggXVxjdkXtMGYxwXDUB98S3VIZ3ibXIi1dbf8hJvpMKfjGDNPnJQB0zAygzzBScbqjGNX8C5/moLY2Sc6ul6CluDiEjzbscxDp+FRpCCP9e5p/ByvD4ghxE3ZSyHiv2Suq0iJ8zJWInef6/LV5bJQHO3GdkxFBZFg+6RVMMnL99hOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeFGoEWsSWDhNcyLGGYBwNWJwiiZ4UjXbKENET8uby4=;
 b=goUu/nyZ6YPRB/hiZ4PKWf/d3WRabZ0Q24DiWTSg0iFxKJjUPeNBrcwdOpfj7oRbGfHAfKGA5J6QbYsX+qbkrVSOOinMR7ySqtfbok3L3xPB2p7HPYSic72hwvN8e09jdCbFrEWDze5uN9V4Z85vLBc9HbOkZTtAY0+d0QkhkD6+IS5583Z/bVSkoEY7wB/S+RJB49Asn91dcvsPWLq//hKanXpb+Y6zc97UZ85MYk0c23MGxqdQaG+hsstnrp4I5T6enh4zh4in1ooPXgvEe4ScN7UMEc6coqy7FsbZIO0yUoFS1AWOYFZPpDTeLpTXvCw0fA/C068HVa93VycLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeFGoEWsSWDhNcyLGGYBwNWJwiiZ4UjXbKENET8uby4=;
 b=hobRgqqzZH/pjcjvX6Ok+dUy+KnowHzumGVw6BP45z7LXbz9nDvL49fR6Yi/y/mWR20fg3InixOJ2ZpVjksbRmg/niV8ZJTL7mzMq2JF4hWI59zQa8+lhYBEGuuywwE6fZ0Ds52Jh7FmCKtmRggeXavQWzcBLHBeAgxbseqTHI8/TWh1eNpar+nVIcRC9dDAAIlXOzVdwussK2aJiysv2pqowrodiUWLmSrRE3KyCoph1jc/Y9w1jQLV+WzYLx+XUGdgoxCHSTwBGAa5ITnLmr87i9B2Ibw9Tq3FpiHuqqRXutJYxo8cH3HYbA57/n/I1CUpZ7qaUL7kHJNRG/IRtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:53:13 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:53:13 +0000
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
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] ASoC: fsl_sai: Add AUDMIX mode support on i.MX952
Date: Tue, 20 Jan 2026 11:52:10 +0800
Message-Id: <20260120035210.1593742-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f35df32-cf2b-48bb-e35f-08de57d76f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R161th2mZxxKvZT5GK0eGGOs0y46m+0Issq9Hg7nxBdsoOuaVrJ4msSUFTVT?=
 =?us-ascii?Q?jJupH7HRLxjthKwr6E0mEU2NSqGV4L5pP+2iwUuxOMnaR/PSpqxbu3PMklZz?=
 =?us-ascii?Q?SvUzep2Hb575rOxkFjxRagYyfuQP/7zYDuVJrulIQeMn66mVVCOk0gGZA7qf?=
 =?us-ascii?Q?NOyhlFqtmcQZpFcZ0c2rLsYo8ttSpdvGlyo/AuPyXKrWHePTkcZNyzTwzt2b?=
 =?us-ascii?Q?1FnbCYU8vcvybyMr8MuJpw+lNU+naA5rYhuF9YIasNvu3OHob2fsvJcy4OMs?=
 =?us-ascii?Q?psEKWbUEsqxxtrO7omKKCc4vTmbt2Amm/jUtcZXD6MYGssaDwqXJrjgdRNzL?=
 =?us-ascii?Q?rW7HX2CGJRyFLvaN1xFJknKJLG5ZVFf2RVW2MqloLY3WPv1uVNyxysR/Ao6n?=
 =?us-ascii?Q?7Ct3hVWUEepGKx7qFbNIhg3tdDxpTKVC8xhbXGTZEklHdNUm+sEehFV/YcCf?=
 =?us-ascii?Q?/1A+u38HGwUzoFSZIu6T4iQ6kbrcoVcoDBYX8lBcnCd5eEMzFYjEKW+5c2MV?=
 =?us-ascii?Q?PC/h2nUauB/k7AxwfMvNCu1u9miKpayG83++kV3KzjmW7Vw040Lecs9TDNN8?=
 =?us-ascii?Q?1n+X7q3HFvod8jT+oim10eFQCFUnz+i0Ujm07f/hg6KXNbUay93E97InXgYE?=
 =?us-ascii?Q?DzSO7Rw3vPH3u5Xjdax8iWo1BIjZCAa67SGef5UL0MK6JQcN3m8ElPVj2MSX?=
 =?us-ascii?Q?bF/csCGnQtEtoiW+UD3h8Aq0HDQlIKzTQHb5wtS6fStyzSY3Tf7j4hOAnOcT?=
 =?us-ascii?Q?jTc2Ce/63zlFdodTWUO+2kDdCrx4rQYW1gbNBpHh8wL+08/FZndb/QEgtbQq?=
 =?us-ascii?Q?ZMZv+f+JiR/Giyo0PBguB9Bai8l4uSj0hyl3BlO2U6BvSwV1zWAcAhSQS6AU?=
 =?us-ascii?Q?CIPPoGnx+JVz/R+5PrOuv0OTWEL48cd1dOcczyY/N/7ax92MlSsYCgGl9E8A?=
 =?us-ascii?Q?MrJeergbk3PvRvmZxsfOXQboGAx2GyMDOVVmbxvgWFi/+m7RHm+pNsi2ZV7J?=
 =?us-ascii?Q?227jAw0CzQ6xGstxhwUypZ7cLfYef9DCMsNooIeFTfzfWFScfRZmhtOoWuGp?=
 =?us-ascii?Q?w0+nI8PALPvI3581jCjr3HpEDMJhfFzbl89S6VwfG5KJ1rWwfILLjC5MV3Kk?=
 =?us-ascii?Q?L8FqlBrmQWOpowotgCg2DUf4pF8lDKQbRyWUpEhU31NudkWCy0yZLbqC71qL?=
 =?us-ascii?Q?c/Vsdoi6FJTmUKs3lPANnUCnkLnueDMVkmd1mEVeHW/TsZYMXHcmFcUN71ra?=
 =?us-ascii?Q?d7oQWs6q0iABDHSW41W6BI5uO2FqnAQta7SD2xbdAHuJ3biijlasyMLvebYg?=
 =?us-ascii?Q?M0vFKn3yALFTArXu+AlmRBUJNsoy9XMmgw7mXnoL6PZNMTWm+1hkvh2ENdt6?=
 =?us-ascii?Q?6z3FgJdZjMuWR2iqdQPTWQqc/Of7JXaOHzOG+KHcFJ9WPUBCBrpy3GiWI0mW?=
 =?us-ascii?Q?KdFon2f9a3DNLeYldJW3RCQHCX0oOHUaVGYr8cc2qPTqgBLX57jRBX/0iOnJ?=
 =?us-ascii?Q?1ZtUnrrKCkn9PlEsBGMTk/pa2l5wpVK31Pa1t+laejam8cWDk5589zFq5qhd?=
 =?us-ascii?Q?zBU+v8/DW3+oct4ZRVTLp1Tm12cHHhRHSF6MPLNB67NMmol1to1PP5XGIhfA?=
 =?us-ascii?Q?tGiHY/hJViXVO673lw/gtAeWFFatlYBW2e4IKGWndc2R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AVMgjNGYhBQEZw15x62nwu4Q0pkeumyQmvihYs0D/xodS+SsPBv4mX3FDDbJ?=
 =?us-ascii?Q?g5BSoW2CdDH95iy+c5aiXlaqzZIew7b+DB4Ptp3mAxC5158H2y1PzmK/nHUr?=
 =?us-ascii?Q?VQAs1X6TvZIx2CP1eGl9Ih8RaQmzO4Mo+2pBzqPg8VS68CVNMuLoUqCEqY+s?=
 =?us-ascii?Q?2aCX7VtoKVnqNB37H3Wj2F4ATl/gNt31QZucURDmMHZh4IX9pguHxpICEsrA?=
 =?us-ascii?Q?TW/Ww1V8DZU0u6VyNiqhaIK/wWbxqa2OwAI8wIW2swo7T+knuf+njZQ6cIMp?=
 =?us-ascii?Q?OQALaqbzVmEnAge7l0mPZ+/5tSSJ8F3xY/VsDVleTlm343pYlDbvmRvlITpS?=
 =?us-ascii?Q?z13ThFD3CYyKwO9qOfD3vZRbWwlqjp+HJuOyAcepkdt9IH5tJNLSBW9TDdkG?=
 =?us-ascii?Q?cKcw0hF+nEEc3s/0FgTGlRghItPwG6jVki5z/06ht8zsP+fVdf0ESIcaZ7sT?=
 =?us-ascii?Q?KSZoyReM95exIjYf6NOtsiiUah3UiXA8c1y+wMzVUf4JCs8ZBaktyHI32SQ3?=
 =?us-ascii?Q?+4i8NWjLAcW7CqwFjEkOkxEOpHzhA9qZMPEGPtRBnxWTd8V3/vZuDShvqvZu?=
 =?us-ascii?Q?PCM2wboeb7gZLEux3insSFY4VpCMDjlyBnYEc6DtHn8h0R/IM2Vw5KuVvDf6?=
 =?us-ascii?Q?6zdsPHFVYvycsofQx3B7genbH1yzFPWPLHhsaPGkTZQeYX9TIXFGPUDsm68G?=
 =?us-ascii?Q?UQfmCGc+UlSUTcNEBSExNCNhKeUjylI633MrL8SyakzuBA+pf2AUA9nitAfc?=
 =?us-ascii?Q?vZo6JhGmyAaGDTHm3qwszSLUe5ktA28qZm08ij+xIx1iU90qnDsk+wKjXYz+?=
 =?us-ascii?Q?sxTpOKD/lbTKIFu+V4eLeJeJvgQWV9WKJ8vU67GP7zFLQ3uU6QxXt+5/ynCY?=
 =?us-ascii?Q?7rWdcHXLh6xloACKU5wvrgCnIZSDdB6d3d+8N/wbSII90scRlMr51Ugduwq4?=
 =?us-ascii?Q?X+UjQn2ZRt/NU+koLz6yuG4ZZULeSdBgv2O9veKtimo+nxWoRj+sDlVBzjmJ?=
 =?us-ascii?Q?sC2/Z1eRRUHEs3rgwYV+UmLWnnlbVFTzNf0SoHYNKT3vA+PT6pRVqEHoyBEO?=
 =?us-ascii?Q?Zs5rohHBR6MDgQ1qJ/uXAcC5M6HWPtuZcDiU+JkO86stuWBaogaleYtwDT+N?=
 =?us-ascii?Q?6HXAQOKAZRQeqEoncNnbDM+m4lCWq/Vn2QP4BSP4Mu8dL2QT2hXrTFPeLEH6?=
 =?us-ascii?Q?oD4P/T+YQ7eXOkrML38YeXQf5vid1YLnqyzrnQt00k+4TTb+XUKLZ3XyBSV9?=
 =?us-ascii?Q?A/TYgIy8uUtNa4kKFg0IbUYJUCiPkPOG470w4nujFhLZVka2lXNF08T1Gnkv?=
 =?us-ascii?Q?yWkCoPJDS/o1KVlov3TkrsAsD1JI05NrxecJaNBXc/ZtuNLk8WGBAoJfna4M?=
 =?us-ascii?Q?JzysYT1314UVmoyQwL33FO4dnygpWXRSpcRYFMbaa4Q3bECp1pZSnqgm2v0Q?=
 =?us-ascii?Q?yHh6C7gbaistgOI1AkRfxFDyBsLkAgm/a8CmR5rM+ZWMNn29a920ZWD/wVaD?=
 =?us-ascii?Q?eAlwqS5UBP7ql8hRQVQUmLEBoF0fxZSGNWntpGYJC+KuFNB2qLGOO1zDJk45?=
 =?us-ascii?Q?a3NEnEdM7xzAB353B8M9j1g/RhnJFyOSOaXu1dGQjGmTK4MpO775/lt0QJ+a?=
 =?us-ascii?Q?3euyJSwH/M6ATbwXILzf8/pddXF6FpPfPIGkM+W2MZiMOtXyxo2HdodeVqqc?=
 =?us-ascii?Q?x/gXAt1SVgdlMWTkOWVoyKUyzRIeZIygYkqeh5XHPWF1WkiACMXOFHnlRbYM?=
 =?us-ascii?Q?o9lTppp6ig=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f35df32-cf2b-48bb-e35f-08de57d76f0d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 03:53:13.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH0rKKGq2wC68nfgIA8G5+e/QybG0pBhvmh8Aaf6tqP7oKTW/zbZoHYx5BGpUTqrawk9Sub4hrTWc7WmAbFcaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

One of SAI interfaces is connected to AUDMIX in the i.MX952 chip, but
AUDMIX can be bypassed or not bypassed on the i.MX952 platform.

so add 'fsl,sai-amix-mode' property for this feature, with this
property present,then SAI driver will try to config the setting,
fsl,sai-amix-mode = <0> is bypass mode, fsl,sai-amix-mode = <1> is
the AUDMIX mode.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/linux/firmware/imx/sm.h |  2 ++
 sound/soc/fsl/fsl_sai.c         | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index a33b45027356..ba5d93bd6158 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -26,6 +26,8 @@
 #define SCMI_IMX94_CTRL_SAI3_MCLK	5U	/*!< WAKE SAI3 MCLK */
 #define SCMI_IMX94_CTRL_SAI4_MCLK	6U	/*!< WAKE SAI4 MCLK */
 
+#define SCMI_IMX952_CTRL_BYPASS_AUDMIX	8U      /* WAKE AUDMIX */
+
 #if IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV)
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 2fa14fbdfe1a..9facb7c5ee0d 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
@@ -1429,6 +1430,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	int irq, ret, i;
 	int index;
 	u32 dmas[4];
+	u32 val;
 
 	sai = devm_kzalloc(dev, sizeof(*sai), GFP_KERNEL);
 	if (!sai)
@@ -1598,6 +1600,21 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
+	if (of_property_present(np, "fsl,sai-amix-mode") &&
+	    of_device_is_compatible(np, "fsl,imx952-sai")) {
+		ret = of_property_read_u32(np, "fsl,sai-amix-mode", &val);
+		if (ret || val > 1) {
+			dev_err_probe(dev, ret, "Invalid audmix mode\n");
+			goto err_pm_get_sync;
+		}
+
+		ret = scmi_imx_misc_ctrl_set(SCMI_IMX952_CTRL_BYPASS_AUDMIX, val);
+		if (ret) {
+			dev_err_probe(dev, ret, "Error setting audmix mode\n");
+			goto err_pm_get_sync;
+		}
+	}
+
 	/*
 	 * Register platform component before registering cpu dai for there
 	 * is not defer probe for platform component in snd_soc_add_pcm_runtime().
-- 
2.34.1


