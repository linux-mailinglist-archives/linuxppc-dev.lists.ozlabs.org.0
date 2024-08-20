Return-Path: <linuxppc-dev+bounces-215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D950B9580DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 10:27:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp2dN3XK8z2y7K;
	Tue, 20 Aug 2024 18:27:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c213::" arc.chain="microsoft.com:microsoft.com"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=duagon.com header.i=@duagon.com header.a=rsa-sha256 header.s=selector1 header.b=uQUVmE68;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.a=rsa-sha256 header.s=selector1 header.b=uQUVmE68;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=duagon.com (client-ip=2a01:111:f403:c213::; helo=zrap278cu002.outbound.protection.outlook.com; envelope-from=alberto.amori@duagon.com; receiver=lists.ozlabs.org)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c213::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp1cn5FsCz2y7K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 17:41:44 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N357p17kE4YJed9TOSW3uIDFJ4DG+PfvIJtlHiOX6UTYE4FyHFMtrM9rkMqVHQF2UzADzztxHPx0O671AzowLxh0KABh9i02A1vjIVhbAFkwFAlWeBdYIo/02FiHGQE0yA2jjri6Dtvh7dbRPn7DCj+ghneEEkcBknwox3GY4/QcREFgTrD/uOOcdf5LBw7lJnXXcEwCmbdGSmCQmV9jlMoVfii3t7NuQiy4VUVqkP/I36egKzP8MLUwIJP+RHQw3/APej3pQGky3qfa6y7TapTIXJh8RwtIZZ6PVdnsf1tHnaOA/JWj1aD+ONiuGAmoV0bcv5yR3e/t6l1vPO3Xbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGhsUSqx8BaXmE3W5Ha1fmuSFlg2zRalqhx+llEQagQ=;
 b=O6LFZaoHpIIZ3Ouz+efg0HrB7J+Nufyo0TEdHrYy3U+3bnlZxJvhL0U+oL6lLk3wwphf9NxZ/hjkE/MKvngLTYPAvTIbHSBsnTIINxc4ykjgEiuo5I3RXhrSU666MhgWgCPv5HLf0E7uj493cD5AgoebXjg7EFQ0bSS1Nbz9FIs1gjdhghiw6TBENxzLU8EE2MMzgV5N9tNeE71i1WUFUVDx1r/WwfQqu77ph9tGiqQBy9I5qsdMXiy7y+bCW/HEM797As8xa9oS7Op+FvHZ58bBcZpLL7bWTGVXmbSCbvEyc1eZT/IBZufW24IwT/G4kg8dPDdHUHrrrXuLHRJGjw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=google.com smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=pass (signature was verified) header.d=duagon.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=duagon.com] dkim=[1,1,header.d=duagon.com]
 dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGhsUSqx8BaXmE3W5Ha1fmuSFlg2zRalqhx+llEQagQ=;
 b=uQUVmE68zAHb2L2k5VO4FJcQFfAre5teDrbGgE1DesmVvAJeerKlbzAeH3KO2UgaLhUPmi70gdeIDaak5Ny5UdxPRKQ6F0OvawqionacJ05iMR3em/A2M4i1rjSYGX6CEkEUSL5MQJvmGLBbwF940T3sXX7YqlehMmh7aMs4v8Y=
Received: from AM0PR10CA0050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::30)
 by GVAP278MB0881.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:46::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 07:41:09 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::6) by AM0PR10CA0050.outlook.office365.com
 (2603:10a6:20b:150::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Tue, 20 Aug 2024 07:41:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11
 via Frontend Transport; Tue, 20 Aug 2024 07:41:09 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4Wp1c45y6YzxpC;
	Tue, 20 Aug 2024 09:41:08 +0200 (CEST)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011027.outbound.protection.outlook.com [40.93.85.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Tue, 20 Aug 2024 09:41:08 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO8LCrCwW7yRbzAs5uCIaTyQuoVdvv/CKa7PafsCzBg4Krj4A3k1kHiYEI4DEEZ+1Xd1/kG8vwtXuf03+iy8Jpt/lrpcUZWKbs0gNZFnCbe5JEbg2sYizu876tMbWfRzrZ+/iGD1GZ+kRrgpf7RXQl6MkUvpFGNckX1yDYReEkk6xcMzupliUiqD7sEdeFsRTrOb0D0eWqhwfsaC4bBZrp17Jo557fV8flqzcYaqehEJGnRNMaAwc/dGQApL+z7Tps1EDivZuMbIVBJUUXGpFIKyIqO5sQPAnxSqyOXy3vw2vNCBL24PebehGy2rtc4vIL/piLNdG0QDiprwZmcqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGhsUSqx8BaXmE3W5Ha1fmuSFlg2zRalqhx+llEQagQ=;
 b=F8N6gETm8QiZdtnA9MysiWR5MMifRomR3qXPt/qr6OVhIq/rAz6tMzHj3kLtsknL4ZHCrtqYY0SOH/v94MLwT1QZbzKSIaEgl7W65t6Jo3aCnxF6uKlXfkbukxCaC4Ym14mpz0FZ6t9S8smPgfKTIPmA1f2+hWikTd/7Lv8uyVHsqkvB33w6IDYgq5/4HwMxG/G4IXX6UrgZGmNQrTVVuNKRWDXGSc+N31P5quLUfEyCs/jfO1VD/O8Byf3eQ/q0s2h6bLdS1ge98dm+ueMYzROx2MR/G46lJ3jv9pzp8pyBdzIyIXOetVjXimmzRkj7mNz8lXcMIwmqwbLH/yi2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duagon.com; dmarc=pass action=none header.from=duagon.com;
 dkim=pass header.d=duagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGhsUSqx8BaXmE3W5Ha1fmuSFlg2zRalqhx+llEQagQ=;
 b=uQUVmE68zAHb2L2k5VO4FJcQFfAre5teDrbGgE1DesmVvAJeerKlbzAeH3KO2UgaLhUPmi70gdeIDaak5Ny5UdxPRKQ6F0OvawqionacJ05iMR3em/A2M4i1rjSYGX6CEkEUSL5MQJvmGLBbwF940T3sXX7YqlehMmh7aMs4v8Y=
Received: from GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:21::8) by
 ZR0P278MB1232.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:7f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.25; Tue, 20 Aug 2024 07:41:06 +0000
Received: from GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2dfe:6978:5fe7:2148]) by GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2dfe:6978:5fe7:2148%4]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 07:41:06 +0000
From: "Amori, Alberto" <Alberto.Amori@duagon.com>
To: "helgaas@kernel.org" <helgaas@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Question about AER in latest kernels
Thread-Topic: Question about AER in latest kernels
Thread-Index: Adry1CjkbaFx39wBTmmWQcafrKasYA==
Date: Tue, 20 Aug 2024 07:41:04 +0000
Message-ID:
 <GVAP278MB01197B2CC845E9A3DFFA4EAF968D2@GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
x-ms-traffictypediagnostic:
	GVAP278MB0119:EE_|ZR0P278MB1232:EE_|AM4PEPF00027A63:EE_|GVAP278MB0881:EE_
X-MS-Office365-Filtering-Correlation-Id: c98fcc35-c9e6-4d78-c472-08dcc0eb750d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?nXnhzUEajnnebYLWHXC8g1JCEVupTUNp0SgzYvSCBfekTPkBiEyBUMZhyIG9?=
 =?us-ascii?Q?5DukMVeBM7yaCqYSdYWBRooM7+TLn4uTNczakv7kK74bESO+Gn8cINe68Vb4?=
 =?us-ascii?Q?FrGAmQvcOSmX2wm7bLjlmcEu8l3fKCWRNyXPSTAqaEhfeASmHGHBlzzWdxN4?=
 =?us-ascii?Q?hQ2WuwiMsmZZuZ+tNDg4DLLFxBsq8iFWBAGmtjYCptfGvoExQZlww94DdFSA?=
 =?us-ascii?Q?a5zUZs60bZB4WGcvWIOypl4CDOPyBSQ9r9Mu3zzmZU9dskqZDJ3saRtiyvqw?=
 =?us-ascii?Q?GsLi4v/FlRivwEtAAGaieNiZDStEmA8X7NPDf+16Qi/R8/c2mv6EDuP69Bna?=
 =?us-ascii?Q?QIMpS2uunG6T4AQntyz0WIWd0qmIe/svnmFMayeb1cSUBpejqdtdS3qdsavS?=
 =?us-ascii?Q?tYd0kvFAo3rffoQR6iwU7zMTjuoM9f+9W0HeR5Hgc2a0u7Q63v45PrURRZ+u?=
 =?us-ascii?Q?/YDK06ce0gwXhrLIaiFc4XmLJQAsgk2psUq25Zd1veuBise0jopOkuGqKeXd?=
 =?us-ascii?Q?XqTKkqLG5E+PVLPCUbMAKEfpVdoq0H1y4xcOvsdn8KV5To0ojaADPa0zrb03?=
 =?us-ascii?Q?miiYlsirMJrwCke2VxPQ2RdH3Oq90lbagPUJWd3vuKliDP79TzCvSj0OFPGC?=
 =?us-ascii?Q?BZKTzpNBiOZvq1qTtmMmGpPpQpjhdXXar1MQbiQ3zZZut9terw+1wk6H84O/?=
 =?us-ascii?Q?RB/gNZbEaSnnFLOKCkeqXcbITLZcxxtN33sU/i7QP2I2PzNF2s0nOA0Z0zMR?=
 =?us-ascii?Q?fHDoKSJcmLOEs9E4+jmkmrDA8OhVxUygO9HDNv4RQM0x7kb/+cJ9xQLVLRMw?=
 =?us-ascii?Q?tzPpqpRB8ywXICYVDSJjPqUrb0Iptc0Fn4kYn+Q3KNfRCZM3EuFxLvG4ze14?=
 =?us-ascii?Q?rHJ91yPhnXFa6fDaFmewMuGd3zTdKaVepdfVdylpjjKRdjLb0UzLRvEGZoIZ?=
 =?us-ascii?Q?WT9uMdixoXynpIadOHTdxOOB+/RiuSKSLvfAgvR1A+ttuZQLQWpg7H2pd1l9?=
 =?us-ascii?Q?l8V7fD2LVz7OftKGfD3/Es4exvwVph1HbtmsNmcmyw+WwqyPA7NTgjYAUbUg?=
 =?us-ascii?Q?7mSQ+Msc7B18U8cYkdrk73f/eFnbjATSv4DlbJB/wvn4WYtFF4vJQBVMY2+g?=
 =?us-ascii?Q?mOVVCVZoL2P13shGiJ/U/xkdt04bt0SBAFc0jtf688PExIlysCnevcOzKWY6?=
 =?us-ascii?Q?WjaN89hl6GogOVq1Ok0c/TjW5Nhc6Vqg05dYTpUWVwOVrCb9a7T87eeCh6YT?=
 =?us-ascii?Q?E7YFqTGwKCc7IjKCUtj2MlwBdhJWgd4BXqlmnhM+1r+PSrYMY6xtoyUrXT1R?=
 =?us-ascii?Q?ga/DzqzXq9Vfa6TwLXrQQgYAKd8YkJ3Z9iABF/BT3xHXNtRtRb+Gg4Sbg8x/?=
 =?us-ascii?Q?UBWjiaI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
Content-Type: multipart/related;
	boundary="_004_GVAP278MB01197B2CC845E9A3DFFA4EAF968D2GVAP278MB0119CHEP_";
	type="multipart/alternative"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1232
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2e62253-bc5e-4916-acbc-08dcc0eb7248
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BB0QYigrAmqBCK88T4bgZvzHOEGDDYBlPMyyhbPj6MImqBNpzEeJw5bvCWiJ?=
 =?us-ascii?Q?Gz2aOtUEYKAPjpv9LN0T0BFXR2bNnruJctqE3/LQbIh4eDlEAaLAXDxbX/KK?=
 =?us-ascii?Q?/GHqCm1K/4O1GDCBwwzzS4JH0Tm+hXaBq1UVWvnHSlLsC7SYj7/CYw0PXfVi?=
 =?us-ascii?Q?Ksu1P3UdTj2gdOsrc6RNMDgouJ5I9egAaQn7VCVchEvYag9H3KFO+wcLQZEV?=
 =?us-ascii?Q?YWdABBVocprHf3xDpm+U+NaAjqgrzZv6DR3PNk1Y29toewQwJXpGwkpeKizU?=
 =?us-ascii?Q?ueFAt+pVta15iNmHPIyY6ykH7+1RodPYwL6Pv1HJepuFUVc+h3fSi273FV3Z?=
 =?us-ascii?Q?f5JYGocbOcmaRtTKQel55gmf6B6cranZq7z9Sx+mCGZ8UZJf22Cs6zug4/GI?=
 =?us-ascii?Q?r2hzL4dNDL7yg2Q6yHzIEkaGtFwSySrGgoS8/PSAUiapwwjHogTRwNeazbNe?=
 =?us-ascii?Q?NdK9ondI+ZtNT0ony6cnIPbGdN/p5oQP9pT48LvDCZmcv8FvVKNkybXsQTBj?=
 =?us-ascii?Q?VVjQOFHnAyfBdxS/UlOmEJPXcpHAw6suJ/iKo8Wq97BPFROO+ShlnYnXlCp8?=
 =?us-ascii?Q?G43uk/u4w+H1CwO/D6VyzRfEqzOQdKNiUjCxX7xuLgjnb8N4Bg038FpVM5ay?=
 =?us-ascii?Q?yeGac6OPyHY4n7sUb0FdN9zBhFdiWw4H6dypQqFSutWsSh5blQ4I1TTOFyxj?=
 =?us-ascii?Q?gUkbST+2RYCFsxqljoGF7aH3Di5ROZCO433fKJj066tRQkj1k8QJ2pSrFUBu?=
 =?us-ascii?Q?D10qDC0C1Y4sKbdF7NGLPO1iOolY7+Z1oFltno+cJ4jH79hD1+Ycjpei2LRF?=
 =?us-ascii?Q?T2BwhOEMMxggsZz8f7EqVFf0kQHAC4qNJVmiDZ70gUkLJ9GCNlSYlZ2/Tl9I?=
 =?us-ascii?Q?nbPzmm1CC78qbOaz0ms1oTJKsDZsqjM4+Kwlr70AS3DR7UFuLcZjeYP0zbcf?=
 =?us-ascii?Q?54BCsc6oqgSFDvjgb69rQ1duXX82yjGMyu3wVmXYCGgFi+OChxp0FNeqWG8F?=
 =?us-ascii?Q?cH0QNtti7Eizk9I3rIVO0i8wHzAN17GZbuemPvvOTStOu8Qy4UKKDb6nZDsD?=
 =?us-ascii?Q?Zf5KvYpQScN8cFunoojBpgnii4Y+Mj2u1Isr7OnfTDK81+mqwVWF/t2VY+LL?=
 =?us-ascii?Q?T5p38XZMFMx3BOcKGyxWFUuMeLjKWzRteDS1ZG5fHNuxO8WKTuEgBIeqKx3u?=
 =?us-ascii?Q?D1sU9b/NE5js23goeEYfSh/fNxnHQv3lbKLRrbDR0ZC5cjfA+ZiWAVl+3oQ7?=
 =?us-ascii?Q?tvCpw3WsqPUXiVZ5m3mS9WYt3Ch+K48PxUKb6wRF+cAeB/VFY1/Omhek75tl?=
 =?us-ascii?Q?BGENOTxIGqUNqtL0vjyCEP3gA17pTxwDeX2+Ed73ZlP12rQodeF3c54WQRcv?=
 =?us-ascii?Q?tkZfYcURwL2LztixIVOKre1rGcll?=
X-Forefront-Antispam-Report:
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 07:41:09.1264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c98fcc35-c9e6-4d78-c472-08dcc0eb750d
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0881

--_004_GVAP278MB01197B2CC845E9A3DFFA4EAF968D2GVAP278MB0119CHEP_
Content-Type: multipart/alternative;
	boundary="_000_GVAP278MB01197B2CC845E9A3DFFA4EAF968D2GVAP278MB0119CHEP_"

--_000_GVAP278MB01197B2CC845E9A3DFFA4EAF968D2GVAP278MB0119CHEP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good morning Mr. Helgas,
Sorry if I am not posting my question through the proper channel, but I am =
not so familiar with that.

I have noticed that the Kernel API pci_enable_pcie_error_reporting() has be=
en removed from kernel 6.6

https://lore.kernel.org/all/20230710232136.233034-3-helgaas@kernel.org/
"pci_enable_pcie_error_reporting() is used only inside aer.c.  Stop exposin=
g it outside the file."

This caused a build error in our PCIe driver after upgrading the kernel and=
 I fixed it adding a pre-processor check:

#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 6, 0)
    result =3D pci_enable_pcie_error_reporting(dev);
    if(result) {
        err(" Unable to enable PCIe error reporting");
        printk(KERN_WARNING "dg pci_enable_pcie_error_reporting returned %d=
 (ignoring)\n", result);
    }
#else
    printk(KERN_WARNING "pci_enable_pcie_error_reporting is not available i=
n this kernel version\n");
#endif

In the newer kernel docs (see https://www.kernel.org/doc/html/v6.5/PCI/pcie=
aer-howto.html) this paragraph has been removed:

"8.3.3. helper functions
int pci_enable_pcie_error_reporting(struct pci_dev *dev);
pci_enable_pcie_error_reporting enables the device to send error messages t=
o root port when an error is detected. Note that devices don't enable the e=
rror reporting by default, so device drivers need call this function to ena=
ble it."

I guess that with the new kernels the AER is implicitly enabled when instal=
ling the device (e.g. when pci_device_add is called), but can you confirm t=
his?
Or maybe the call of pci_enable_pcie_error_reporting() was superfluous also=
 in the kernels < 6.6?

Thank you in advance
Best regards



Alberto Amori
Senior Embedded Software Engineer
Phone +41 44 743 73 94

duagon AG I Riedstrasse 12 I 8953 Dietikon I Switzerland I www.duagon.com


InnoTrans 2024 I 24 - 27 September 2024 I Messe Berlin I MEET OUR EXPERTS I=
 BOOTH 740 - Hall 27

This message and/or attachments may be privileged or confidential. If you a=
re not the intended recipient, you are hereby notified that you have receiv=
ed this transmittal in error; any review, dissemination, or copying is stri=
ctly prohibited. If you received this transmittal in error, please notify u=
s immediately by reply and immediately delete this message and all its atta=
chments. Thank you.

--_000_GVAP278MB01197B2CC845E9A3DFFA4EAF968D2GVAP278MB0119CHEP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE-CH" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Good morning Mr. Helgas,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Sorry if I am not posting my questio=
n through the proper channel, but I am not so familiar with that.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">I have noticed that the Kernel API p=
ci_enable_pcie_error_reporting() has been removed from kernel 6.6<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><a href=3D"https://lore.kernel.org/all/202307102321=
36.233034-3-helgaas@kernel.org/"><span lang=3D"EN-US">https://lore.kernel.o=
rg/all/20230710232136.233034-3-helgaas@kernel.org/</span></a></span><span l=
ang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,san=
s-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">&quot;pci_enable_pcie_error_repor=
ting() is used only inside aer.c.&nbsp; Stop exposing it outside the file.&=
quot;<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">This caused a build error in our PCI=
e driver after upgrading the kernel and I fixed it adding a pre-processor c=
heck:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:red">#if LINUX_VERSION_CODE &lt=
; KERNEL_VERSION(6, 6, 0)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">&nbsp; &nbsp; result =3D pci_enable_=
pcie_error_reporting(dev);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">&nbsp; &nbsp; if(result) {<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; err(&quo=
t; Unable to enable PCIe error reporting&quot;);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; printk(K=
ERN_WARNING &quot;dg pci_enable_pcie_error_reporting returned %d (ignoring)=
\n&quot;, result);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">&nbsp; &nbsp; }<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:red">#else<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:red">&nbsp; &nbsp; printk(KERN_=
WARNING &quot;pci_enable_pcie_error_reporting is not available in this kern=
el version\n&quot;);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:red">#endif<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">In the newer kernel docs (see
<a href=3D"https://www.kernel.org/doc/html/v6.5/PCI/pcieaer-howto.html">htt=
ps://www.kernel.org/doc/html/v6.5/PCI/pcieaer-howto.html</a>) this paragrap=
h has been removed:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><i><span lang=3D"EN-US" style=3D"font-size:11.0pt=
;font-family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></i></=
b></p>
<p class=3D"MsoNormal"><b><i><span lang=3D"EN-US" style=3D"font-size:11.0pt=
;font-family:&quot;Calibri&quot;,sans-serif">&quot;8.3.3. helper functions<=
o:p></o:p></span></i></b></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">int pci_enable_pcie_error_reporti=
ng(struct pci_dev *dev);<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">pci_enable_pcie_error_reporting e=
nables the device to send error messages to root port when an error is dete=
cted. Note that devices don't enable the error reporting
 by default, so device drivers need call this function to enable it.&quot;<=
o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">I guess that with the new kernels th=
e AER is implicitly enabled when installing the device (e.g. when pci_devic=
e_add is called), but can you confirm this?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Or maybe the call of pci_enable_pcie=
_error_reporting() was superfluous also in the kernels &lt; 6.6?<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Thank you in advance<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Best regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cali=
bri&quot;,sans-serif;color:#002663;mso-fareast-language:EN-US">Alberto Amor=
i</span></b><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&=
quot;Calibri&quot;,sans-serif;mso-fareast-language:EN-US"><br>
</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;mso-fareast-language:EN-US">Senior Embedded Softw=
are Engineer<br>
Phone +41 44 743 73 94</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;color:black;mso-fareast-language:EN-US">duagon AG</span><=
span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quo=
t;,sans-serif;mso-fareast-language:EN-US">
<b><span style=3D"color:#CE692F">I</span></b> Riedstrasse 12 <b><span style=
=3D"color:#CE692F">I</span></b> 8953</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif;mso-fareast-language:EN-US">Dietikon
<b><span style=3D"color:#CE692F">I</span></b> Switzerland <b><span style=3D=
"color:#CE692F">I</span></b>
</span><span lang=3D"DE" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black;mso-fareast-language:EN-US">www.duagon.com</=
span><o:p></o:p></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:6.0pt;mar=
gin-left:0cm">
<img border=3D"0" width=3D"600" height=3D"3" style=3D"width:6.25in;height:.=
0312in" id=3D"_x0030_.ott721kvj48" src=3D"cid:image001.jpg@01DAF2E2.19B9D23=
0" alt=3D"2024-05-02_signatur-600x30px_linie3.jpg"><o:p></o:p></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;color:#002663">InnoTrans 2024&nbsp=
;</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif;color:#002663">I 24 - 27 September 2024
 I Messe Berlin I MEET OUR EXPERTS I&nbsp;</span><b><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#C=
E692F">BOOTH 740 - Hall 27</span></b><span lang=3D"EN-US" style=3D"font-siz=
e:9.0pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
<br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:&quot;Cali=
bri&quot;,sans-serif">This message and/or attachments may be privileged or =
confidential. If you are not the intended recipient, you are hereby notifie=
d that you have received this transmittal in error;
 any review, dissemination, or copying is strictly prohibited. If you recei=
ved this transmittal in error, please notify us immediately by reply and im=
mediately delete this message and all its attachments.
</span><span style=3D"font-size:9.0pt;font-family:&quot;Calibri&quot;,sans-=
serif">Thank you.</span><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_GVAP278MB01197B2CC845E9A3DFFA4EAF968D2GVAP278MB0119CHEP_--

--_004_GVAP278MB01197B2CC845E9A3DFFA4EAF968D2GVAP278MB0119CHEP_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=3983;
	creation-date="Tue, 20 Aug 2024 07:41:04 GMT";
	modification-date="Tue, 20 Aug 2024 07:41:04 GMT"
Content-ID: <image001.jpg@01DAF2E2.19B9D230>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAgEASABIAAD/7QAsUGhvdG9zaG9wIDMuMAA4QklNA+0AAAAAABAASAAAAAEA
AQBIAAAAAQAB/+IMWElDQ19QUk9GSUxFAAEBAAAMSExpbm8CEAAAbW50clJHQiBYWVogB84AAgAJ
AAYAMQAAYWNzcE1TRlQAAAAASUVDIHNSR0IAAAAAAAAAAAAAAAAAAPbWAAEAAAAA0y1IUCAgAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARY3BydAAAAVAAAAAz
ZGVzYwAAAYQAAABsd3RwdAAAAfAAAAAUYmtwdAAAAgQAAAAUclhZWgAAAhgAAAAUZ1hZWgAAAiwA
AAAUYlhZWgAAAkAAAAAUZG1uZAAAAlQAAABwZG1kZAAAAsQAAACIdnVlZAAAA0wAAACGdmlldwAA
A9QAAAAkbHVtaQAAA/gAAAAUbWVhcwAABAwAAAAkdGVjaAAABDAAAAAMclRSQwAABDwAAAgMZ1RS
QwAABDwAAAgMYlRSQwAABDwAAAgMdGV4dAAAAABDb3B5cmlnaHQgKGMpIDE5OTggSGV3bGV0dC1Q
YWNrYXJkIENvbXBhbnkAAGRlc2MAAAAAAAAAEnNSR0IgSUVDNjE5NjYtMi4xAAAAAAAAAAAAAAAS
c1JHQiBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAFhZWiAAAAAAAADzUQABAAAAARbMWFlaIAAAAAAAAAAAAAAAAAAAAABYWVogAAAA
AAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9kZXNj
AAAAAAAAABZJRUMgaHR0cDovL3d3dy5pZWMuY2gAAAAAAAAAAAAAABZJRUMgaHR0cDovL3d3dy5p
ZWMuY2gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZGVzYwAA
AAAAAAAuSUVDIDYxOTY2LTIuMSBEZWZhdWx0IFJHQiBjb2xvdXIgc3BhY2UgLSBzUkdCAAAAAAAA
AAAAAAAuSUVDIDYxOTY2LTIuMSBEZWZhdWx0IFJHQiBjb2xvdXIgc3BhY2UgLSBzUkdCAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAGRlc2MAAAAAAAAALFJlZmVyZW5jZSBWaWV3aW5nIENvbmRpdGlvbiBp
biBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAACxSZWZlcmVuY2UgVmlld2luZyBDb25kaXRpb24gaW4g
SUVDNjE5NjYtMi4xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB2aWV3AAAAAAATpP4AFF8uABDP
FAAD7cwABBMLAANcngAAAAFYWVogAAAAAABMCVYAUAAAAFcf521lYXMAAAAAAAAAAQAAAAAAAAAA
AAAAAAAAAAAAAAKPAAAAAnNpZyAAAAAAQ1JUIGN1cnYAAAAAAAAEAAAAAAUACgAPABQAGQAeACMA
KAAtADIANwA7AEAARQBKAE8AVABZAF4AYwBoAG0AcgB3AHwAgQCGAIsAkACVAJoAnwCkAKkArgCy
ALcAvADBAMYAywDQANUA2wDgAOUA6wDwAPYA+wEBAQcBDQETARkBHwElASsBMgE4AT4BRQFMAVIB
WQFgAWcBbgF1AXwBgwGLAZIBmgGhAakBsQG5AcEByQHRAdkB4QHpAfIB+gIDAgwCFAIdAiYCLwI4
AkECSwJUAl0CZwJxAnoChAKOApgCogKsArYCwQLLAtUC4ALrAvUDAAMLAxYDIQMtAzgDQwNPA1oD
ZgNyA34DigOWA6IDrgO6A8cD0wPgA+wD+QQGBBMEIAQtBDsESARVBGMEcQR+BIwEmgSoBLYExATT
BOEE8AT+BQ0FHAUrBToFSQVYBWcFdwWGBZYFpgW1BcUF1QXlBfYGBgYWBicGNwZIBlkGagZ7BowG
nQavBsAG0QbjBvUHBwcZBysHPQdPB2EHdAeGB5kHrAe/B9IH5Qf4CAsIHwgyCEYIWghuCIIIlgiq
CL4I0gjnCPsJEAklCToJTwlkCXkJjwmkCboJzwnlCfsKEQonCj0KVApqCoEKmAquCsUK3ArzCwsL
Igs5C1ELaQuAC5gLsAvIC+EL+QwSDCoMQwxcDHUMjgynDMAM2QzzDQ0NJg1ADVoNdA2ODakNww3e
DfgOEw4uDkkOZA5/DpsOtg7SDu4PCQ8lD0EPXg96D5YPsw/PD+wQCRAmEEMQYRB+EJsQuRDXEPUR
ExExEU8RbRGMEaoRyRHoEgcSJhJFEmQShBKjEsMS4xMDEyMTQxNjE4MTpBPFE+UUBhQnFEkUahSL
FK0UzhTwFRIVNBVWFXgVmxW9FeAWAxYmFkkWbBaPFrIW1hb6Fx0XQRdlF4kXrhfSF/cYGxhAGGUY
ihivGNUY+hkgGUUZaxmRGbcZ3RoEGioaURp3Gp4axRrsGxQbOxtjG4obshvaHAIcKhxSHHscoxzM
HPUdHh1HHXAdmR3DHeweFh5AHmoelB6+HukfEx8+H2kflB+/H+ogFSBBIGwgmCDEIPAhHCFIIXUh
oSHOIfsiJyJVIoIiryLdIwojOCNmI5QjwiPwJB8kTSR8JKsk2iUJJTglaCWXJccl9yYnJlcmhya3
JugnGCdJJ3onqyfcKA0oPyhxKKIo1CkGKTgpaymdKdAqAio1KmgqmyrPKwIrNitpK50r0SwFLDks
biyiLNctDC1BLXYtqy3hLhYuTC6CLrcu7i8kL1ovkS/HL/4wNTBsMKQw2zESMUoxgjG6MfIyKjJj
Mpsy1DMNM0YzfzO4M/E0KzRlNJ402DUTNU01hzXCNf02NzZyNq426TckN2A3nDfXOBQ4UDiMOMg5
BTlCOX85vDn5OjY6dDqyOu87LTtrO6o76DwnPGU8pDzjPSI9YT2hPeA+ID5gPqA+4D8hP2E/oj/i
QCNAZECmQOdBKUFqQaxB7kIwQnJCtUL3QzpDfUPARANER0SKRM5FEkVVRZpF3kYiRmdGq0bwRzVH
e0fASAVIS0iRSNdJHUljSalJ8Eo3Sn1KxEsMS1NLmkviTCpMcky6TQJNSk2TTdxOJU5uTrdPAE9J
T5NP3VAnUHFQu1EGUVBRm1HmUjFSfFLHUxNTX1OqU/ZUQlSPVNtVKFV1VcJWD1ZcVqlW91dEV5JX
4FgvWH1Yy1kaWWlZuFoHWlZaplr1W0VblVvlXDVchlzWXSddeF3JXhpebF69Xw9fYV+zYAVgV2Cq
YPxhT2GiYfViSWKcYvBjQ2OXY+tkQGSUZOllPWWSZedmPWaSZuhnPWeTZ+loP2iWaOxpQ2maafFq
SGqfavdrT2una/9sV2yvbQhtYG25bhJua27Ebx5veG/RcCtwhnDgcTpxlXHwcktypnMBc11zuHQU
dHB0zHUodYV14XY+dpt2+HdWd7N4EXhueMx5KnmJeed6RnqlewR7Y3vCfCF8gXzhfUF9oX4BfmJ+
wn8jf4R/5YBHgKiBCoFrgc2CMIKSgvSDV4O6hB2EgITjhUeFq4YOhnKG14c7h5+IBIhpiM6JM4mZ
if6KZIrKizCLlov8jGOMyo0xjZiN/45mjs6PNo+ekAaQbpDWkT+RqJIRknqS45NNk7aUIJSKlPSV
X5XJljSWn5cKl3WX4JhMmLiZJJmQmfyaaJrVm0Kbr5wcnImc951kndKeQJ6unx2fi5/6oGmg2KFH
obaiJqKWowajdqPmpFakx6U4pammGqaLpv2nbqfgqFKoxKk3qamqHKqPqwKrdavprFys0K1Erbiu
La6hrxavi7AAsHWw6rFgsdayS7LCszizrrQltJy1E7WKtgG2ebbwt2i34LhZuNG5SrnCuju6tbsu
u6e8IbybvRW9j74KvoS+/796v/XAcMDswWfB48JfwtvDWMPUxFHEzsVLxcjGRsbDx0HHv8g9yLzJ
Osm5yjjKt8s2y7bMNcy1zTXNtc42zrbPN8+40DnQutE80b7SP9LB00TTxtRJ1MvVTtXR1lXW2Ndc
1+DYZNjo2WzZ8dp22vvbgNwF3IrdEN2W3hzeot8p36/gNuC94UThzOJT4tvjY+Pr5HPk/OWE5g3m
lucf56noMui86Ubp0Opb6uXrcOv77IbtEe2c7ijutO9A78zwWPDl8XLx//KM8xnzp/Q09ML1UPXe
9m32+/eK+Bn4qPk4+cf6V/rn+3f8B/yY/Sn9uv5L/tz/bf///+4AE0Fkb2JlAGSAAAAAAQUAAklE
/9sAhAACAgICAgICAgICAwICAgMEAwMDAwQFBAQEBAQFBQUFBQUFBQUFBwgICAcFCQoKCgoJDAwM
DAwMDAwMDAwMDAwMAQMDAwcFBw0HBw0PDQ0NDw8ODg4ODw8MDAwMDA8PDA4ODg4MDwwREREREQwR
ERERERERERERERERERERERERERH/wAARCAADAlgDAREAAhEBAxEB/8QBogAAAAcBAQEBAQAAAAAA
AAAABAUDAgYBAAcICQoLAQACAgMBAQEBAQAAAAAAAAABAAIDBAUGBwgJCgsQAAIBAwMCBAIGBwME
AgYCcwECAxEEAAUhEjFBUQYTYSJxgRQykaEHFbFCI8FS0eEzFmLwJHKC8SVDNFOSorJjc8I1RCeT
o7M2F1RkdMPS4ggmgwkKGBmElEVGpLRW01UoGvLj88TU5PRldYWVpbXF1eX1ZnaGlqa2xtbm9jdH
V2d3h5ent8fX5/c4SFhoeIiYqLjI2Oj4KTlJWWl5iZmpucnZ6fkqOkpaanqKmqq6ytrq+hEAAgIB
AgMFBQQFBgQIAwNtAQACEQMEIRIxQQVRE2EiBnGBkTKhsfAUwdHhI0IVUmJy8TMkNEOCFpJTJaJj
ssIHc9I14kSDF1STCAkKGBkmNkUaJ2R0VTfyo7PDKCnT4/OElKS0xNTk9GV1hZWltcXV5fVGVmZ2
hpamtsbW5vZHV2d3h5ent8fX5/c4SFhoeIiYqLjI2Oj4OUlZaXmJmam5ydnp+So6SlpqeoqaqrrK
2ur6/9oADAMBAAIRAxEAPwD5N56m8+7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7
FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7F
XYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq//9k=

--_004_GVAP278MB01197B2CC845E9A3DFFA4EAF968D2GVAP278MB0119CHEP_--

