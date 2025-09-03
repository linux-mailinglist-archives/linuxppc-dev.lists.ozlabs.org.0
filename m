Return-Path: <linuxppc-dev+bounces-11653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1244B41971
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 10:59:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGxPT4CzWz2yrV;
	Wed,  3 Sep 2025 18:59:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756889965;
	cv=pass; b=IL4+MwzMX5onTamGiF4eUBqSvwBHOR9fPsoSauXlgfcXWtl3jbwdY+PDMsVg3KlrvMPM4VMhrrExIQmfWagqE4vj39/UyhugG97lTcYMcQ6/uEhniDzwGsDvIH1YxUWpsy2TuOhb3xYX+aw0w9+TYudW0iZF5cF/wBxA+ixXhspOwi5pkb9S74MZLo0D/kE0+lt9+vpZ+NxVoSJNSXElhZ8e/HIg7EdNV3V1+1RJOAzist4fvVPH1mJng8My5D4AqIdau2KhyS4wlYZapFT/aNjIF9Iki5PngSXX8nFhdKNUmGPfazvB0ZXZx8IizkNRubJsDST/TR0b6+kDUEZKsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756889965; c=relaxed/relaxed;
	bh=rbKUh4rDtzbjG2qFlDf/7rIZszNNmLsVfJ1ClUpiCfw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RIDM6WE3yQmawyngvLFeQNvybfcQda7OpOAMQ9Wmer5Hg1OEmjqX3AfxkmuyDDGev0PryiYslYekUQ8yLsP6XBrc3Nv1NRhSlxz1ijSU+Q44OGJFSECxndW0jNRvXIqTqN3juUNJ6WcisUtAIBMfno3oEzGxrYPgWtDJ20qSmgycRZhdGiUqM+Od7TCApQPeOv4dcwrPmo/8sFym4ily/8ypRkfyCNE5CI+H09iBCeHrG0hdM/EFH97wtFeL2e2iZxDwUYMV+hlGzq9deRb5JAgrTbZux7mJM4gzPMxd0Hexj+M7W/XBy1U1dT97y3CuFiayIJFPu3CDXGQJUUbrUA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ty205/DU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ty205/DU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGxPR4g21z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 18:59:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2fKHH1kuFFXfcdYmjd/0tE72AE6ZoyINWTTXpC/AqlDPZoq1Adsuo11XNDZ048tge/m60vfrkyNKX/SbN/DGGVtNeCUjtJgOBS3mCfqAGzN8OENeDvAu6qi9MeHGEd4I5d9w3EjcJNa3ZL9EROhUtvB/GTfAQz+OlGpiThsIJMrEu/bNLd16JMAnhN64otPtLB/U54h9g6AK4zylxEXH5VK6/EWCpQUtVzdZRwYcBN1oC4fQWcwJqcgFKYz3Gek7k/IchlLDQDefmXkivlON2if7tCPFxZ6VG5Y5mN2mmSDjF49XSFNpaax4Ra4Qh3jBiuicx+S8/XdBAXW/WTWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbKUh4rDtzbjG2qFlDf/7rIZszNNmLsVfJ1ClUpiCfw=;
 b=O7Uu/XAJXX5UrwdhGLYpmG1vtykyZHU5bpQI3yIE4Z07UXpXvB2jTCVLwe6KKyRYAs4U09WPEJU62kUVuxvBxw1yiUV1jfyyeBI7FIlwL2S24NYDqNrfsNDJm5VKKOyUnQEQQyL7dt9LHtYt1kjCCkzEyJQy/6GH6fQWhpeq+dubq4Jezqet3KsG+1ZGKX0NnLErktaCVb0ACCmDnR4p1vn10hCeYrRCYQHVZCSrxegpnyg2twPwO8bbsShJJZneSYAR3U2mrfAqYjnEdZYRKhm5jI8Gvw0hJbypcj5QqnbtAmV3fx0/uoXEhS/5d4doPGaOcXUo9pvnmZ479vmLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbKUh4rDtzbjG2qFlDf/7rIZszNNmLsVfJ1ClUpiCfw=;
 b=Ty205/DUJyt3+BqBR1x/HPdkGlkQUs9Ezc7nvly9kYcR3SVny4UGXrCsNr2jRc+3BZ0sKmZqxGw/nNFAj1oNcdno+xxJ5uUJYnqUwuHkgQV+zbh5alYcbx6OO0PDMAgya5e/29g2kYo6fpgz9ac6PGm8s9rP7WbUzZnfa2oavWIWvD+bNFBwYNORlO20l+/NHrUNqP9muE2LCtD8JgqkAJHEtn5jkM3snzIBA1OjoQSgRGvDg9n0JrHRBqlv2X50bws/vW99uouHtGKTIhceAdFX928IibtA4DS6tYDgbPys8Pij0rhLMclAMuW4HVtiTYDFWB3G7j4Pqde2lHa7Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV2PR04MB11190.eurprd04.prod.outlook.com (2603:10a6:150:278::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.15; Wed, 3 Sep
 2025 08:58:54 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 08:58:54 +0000
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
Subject: [PATCH net-next 0/3] ptp: add pulse signal loopback support for debugging
Date: Wed,  3 Sep 2025 16:37:46 +0800
Message-Id: <20250903083749.1388583-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GV2PR04MB11190:EE_
X-MS-Office365-Filtering-Correlation-Id: b147246e-8109-467d-a4fa-08ddeac81bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|1800799024|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hS2w8XAOgAHZd70oFS45eKq6UXuWbtuJnfgkMS+K3t3GiNSz5nhtqw23kmJG?=
 =?us-ascii?Q?6dRol2nqUH20I8uqonorMwBH+IRh7VU8GTVHwGQcBRYSVh1DYj3+4zxVJ0AX?=
 =?us-ascii?Q?blyO8ul+4lDj5tbPQDjEkNqUx1UnEFMbsR/Np6Y6LH9xRTOYVLWjJu/NyYLc?=
 =?us-ascii?Q?lO6+MxE/b+c9cwAPw+1gLwjaOyFqFMXk2hFfwEVzBvRPUuAjyYTeZNAzSGPp?=
 =?us-ascii?Q?OUH6uj6QnAx9jHyVropTcshMplcgo4YpIhaR0v5y7Vc9O+BiU/l2a8VCo7td?=
 =?us-ascii?Q?o2b9Tkca7g3+kbOn4UTVlMo0J2kD0mGA8uOgmu1IkbomHXb2P5IfqM0I/AmQ?=
 =?us-ascii?Q?yae2TYIBwfiWPajVuk3gLWtYi3kDHqi5nBj/TsPbpbXyYqbCCFhjgIPPZAvo?=
 =?us-ascii?Q?ddLP6haAW6BqsDgTlbpKCq7/O8U15DoUVxljhacib/q5oOZzLG8fPAv085qK?=
 =?us-ascii?Q?5YkFkpfqMDJebgdY0FS4LNtOY6Iu9PxOonXdJ0W3c3fkaOx6dG819Zo5TdaL?=
 =?us-ascii?Q?QsAkZSR1fjsMVdFcebpkJ5Bwtqey10lyMgn1/S1WjVC8bZxeHlDcGJPf4Ia7?=
 =?us-ascii?Q?4kyQErT0FYpfUO1GXKmBARAGEOFXiFtXJxnum5scB5A8sQRhVg3SOV+54/G0?=
 =?us-ascii?Q?svoq7rE3RqdEivZWm1roc2lsNFam58wGHjqj1eC75jy0MNI4nwEDkSwsydYS?=
 =?us-ascii?Q?Ildbo3Jry2FAVEfF4lh3aUzZPT9T6IbkpwUww2AbqHH3EJwJn5rVhnbe1wyB?=
 =?us-ascii?Q?+nptSDv9vGDWtnf8hiUcOA3qR1owzUwlAfJqSUDj87gKaEpSNWSQzLd93XDj?=
 =?us-ascii?Q?kdZiV3bnhsj6IXyMM5DFxfwnlgHJ4R/8/LZEDgSreO88UQCbCwhzdgk2rF44?=
 =?us-ascii?Q?/KDTvqEgD+Z3pqdoo/iuQPxb8AWDuXefKNtZa9IivY5yGZzX1EZnwXjOLKBy?=
 =?us-ascii?Q?BR8uu8xxT/gsAAK/NRk+m+i2I8LKBOSVrLHGvDPpTrMm/vp8R1sdlOEUyFVc?=
 =?us-ascii?Q?nA2Wb4qsns3rsfrVAKgO8tvCKcXAj4jYkqUPPmZXOWtdmSNEWSVbySfnQtil?=
 =?us-ascii?Q?RAMRfNai6jBnFz+cYrjhhXO5xY/4LrQcqj2+2cP9bXJcy65FkDcwmhK7haQu?=
 =?us-ascii?Q?PwhMGVppbOLIznyFBb3IQeBxw+VPx6ztq4qWaWWhLmDDJU7JGVi9o43cW8gq?=
 =?us-ascii?Q?OEQ0NCiR4kt/xiz4POH7SDIKKEsDh/0VKw0jBrjrjwA1VScSFFWDUSR9P2aM?=
 =?us-ascii?Q?+5aNLrYuH5DaV+/RvhVFwfitFor9iXLgfLH51gNU7KQlZ4OvyQEmUKamV8Ux?=
 =?us-ascii?Q?cnSSx7K4FFneUBY40h0Ks8y/8qqeRjkE1IQvgRXip4dy6KbVqpYJyLRvJLJY?=
 =?us-ascii?Q?wYrD118ajTygmr2dbOY55bOf4QkOeSilK7hI64t7Hycv3nkOdC0CcohTuUKg?=
 =?us-ascii?Q?tjZRjgefSqRWMDcfB9JxClqHQKTEzRk4EEyM3TbN1jujsym9vhDHWbzMp44T?=
 =?us-ascii?Q?O1cvqeZOLfaLqVx2aesJ7/AdHks3W0I1+0Cw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/0Ybr4MHFLelmRM8Ikc4gBpheMpBUjxsNxzleEB8FD7x09b4Gg7m3WSrK8Xk?=
 =?us-ascii?Q?Tuc9IO8IjGUe63s0mhKhIIMFueIdg6KL0ULu8k/158JkbUlky7Db21Wmc2dl?=
 =?us-ascii?Q?Bxp1bPUMTPhQRA+Ym4TCRJ56y8cEuQ26M72KC6NoxBK8k7wHsodn6VjJzHcS?=
 =?us-ascii?Q?It4WwDMYszzr7174yV/e+vWsKb+K8qOQCsE3l6PBFxJNWSnwK//Qp4Ygx5H2?=
 =?us-ascii?Q?hYssMZZ+sJzdX9j04q/5gaNhKeg60B0gRMUbP10m34crSWGEHBqRTRWuTv9h?=
 =?us-ascii?Q?CP6Htqt823UedJKhQ/BMV2THnmPFM02yRFb+cfP4oDPajSwb0tORXkEK5K/g?=
 =?us-ascii?Q?x534UBt0seqy64QTykWZoh75zXuwgLOH0u/n6a8t0sSsuMrxcSd4fLxstGNP?=
 =?us-ascii?Q?l+HvD2ds41ts4NcMyvPQIzNpJBbWGRiEfwWLMXNmVHjJmK8ayy9NjSH4Coi1?=
 =?us-ascii?Q?/F8Wj7yz6F1pOR7bdThJNsdkuOmPtVEknCDB/Y0YXsUgrf3osLNP2xhtfiLi?=
 =?us-ascii?Q?gXREFP27VSFMPfK5yQDBiLq0GmXvDLK3zCptn/7qOFbss6Dq/fZMAM+v+uoB?=
 =?us-ascii?Q?4zFsmXzHoCGPODp/VK2l2jJrEM2Q64Obaw6tNjR7zzpHEBxjN/MyxESpXI8o?=
 =?us-ascii?Q?3fkWZP7epj+OI/vNdtaXlo6dG4EAaZAfNHg32BLGM0C1cDVYgNeP33pv9b+T?=
 =?us-ascii?Q?i3cqSfwQ+alz0+4gqx0byZGz9GAJFiacjnYVhV5CKBBUCip75OodvfeinReY?=
 =?us-ascii?Q?+QJAE7p2wXUfsejHGptICLYonSUT8j/DZDKk5hNGhmEy6qiUPxNbKVIk1ixv?=
 =?us-ascii?Q?/FR1L1AX9Bw16e0awJexnm4OmeRCswLz1aG2DYm7nHQpc7kpq7mB2apmoDHx?=
 =?us-ascii?Q?kSzB4vCHtjq5IJKjEBeiEJGEmGYi7IzKc3rFdkbU30PstnpM4RdqXu0oVFgh?=
 =?us-ascii?Q?ISDeVAhlNI5EyaQqtnZZgDRcJzo+Dkl+vJGuTz7CeJz6H0LHOY2dHwPPF6EW?=
 =?us-ascii?Q?cvusxqEZY6W60og+k2rJUh9AwSKLiAdgTVFHwpLcd7gqTZ/pAgiz3/uxBp+3?=
 =?us-ascii?Q?jcI1hntmBhBNlK+ODJY3oncVMjAikKOzMsfvmej/yC0gOQv81HyDb9kt1qWc?=
 =?us-ascii?Q?mn/T1pINdf9w9qaanlmvlMVb3tGRmDjklHN3vPH//AZ56fQuVRihb0zF1VFa?=
 =?us-ascii?Q?RLqAYstHkn/A8+GR9deHb3pdS1s09D0sxqf8WZ0rJhd7XtIsgO/ED+P6nYZP?=
 =?us-ascii?Q?P8IxCkEfn47iG5hBe5vAASxAfW9JRRAGayng3fzU6FAqZHo9H5elHERA3xIy?=
 =?us-ascii?Q?2rp9gUa/2FtU7tTjWmmi71OaueGYCz/7/lGqIsG1RyRMO59zD1b7cFqdxdk6?=
 =?us-ascii?Q?QUwBUCbIcQqwlbU8RQ6gXrU8FigCdEIMHtlhYh3VLXFJObzFEehGt5oCSs6J?=
 =?us-ascii?Q?gg7qlDn0COdPlE2u8zfpQ3yJKRCAmdOooK70xzuMwFBC7qT6HqFzoWibPMK8?=
 =?us-ascii?Q?S376lSrXvbfYWBHcw0bYWXs07vnWTgNJzJxuupXomYL2MuakfQZZsi5mYtv1?=
 =?us-ascii?Q?znAVIkGM0bi4wt0CObEDOxG4er7TVrfL7B+lWCgb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b147246e-8109-467d-a4fa-08ddeac81bb4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:58:54.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYOc+qcE/I9HNI5Wp96I00A0/64HIPOwNvTdhIIwr2XVpZyiMAFqrJAO4ooqWS6eBIjAB4V3lVe/S2o5sugTNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11190
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some PTP devices support looping back the periodic pulse signal for
debugging, so add the generic debugfs interfaces to the ptp_clock
driver. The first two patch are separated from the previous patch
set [1]. The third patch is new added.

[1]: https://lore.kernel.org/imx/20250827063332.1217664-1-wei.fang@nxp.com/ #patch 3 and 9

Wei Fang (3):
  ptp: add debugfs interfaces to loop back the periodic output signal
  ptp: netc: add the periodic output signal loopback support
  ptp: qoriq: covert to use generic interfaces to set loopback mode

 MAINTAINERS                      |   1 -
 drivers/ptp/Kconfig              |   2 +-
 drivers/ptp/Makefile             |   4 +-
 drivers/ptp/ptp_clock.c          |  66 ++++++++++++++++++++
 drivers/ptp/ptp_netc.c           |  25 ++++++++
 drivers/ptp/ptp_qoriq.c          |  24 +++++++-
 drivers/ptp/ptp_qoriq_debugfs.c  | 101 -------------------------------
 include/linux/fsl/ptp_qoriq.h    |  10 ---
 include/linux/ptp_clock_kernel.h |  10 +++
 9 files changed, 125 insertions(+), 118 deletions(-)
 delete mode 100644 drivers/ptp/ptp_qoriq_debugfs.c

-- 
2.34.1


