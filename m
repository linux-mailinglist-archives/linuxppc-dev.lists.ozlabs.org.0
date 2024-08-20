Return-Path: <linuxppc-dev+bounces-224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80F958647
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 13:57:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp7J20NRZz2yD8;
	Tue, 20 Aug 2024 21:57:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c213::5" arc.chain="microsoft.com:microsoft.com"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=duagon.com header.i=@duagon.com header.a=rsa-sha256 header.s=selector1 header.b=V6/TbiW3;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.a=rsa-sha256 header.s=selector1 header.b=V6/TbiW3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=duagon.com (client-ip=2a01:111:f403:c213::5; helo=zr1p278cu001.outbound.protection.outlook.com; envelope-from=alberto.amori@duagon.com; receiver=lists.ozlabs.org)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c213::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp7Hz71RJz2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 21:57:34 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=K9I0I5FucbdQad1tyVjzeKUpfs+RsFaxmWNLHLjfm7pw87yZdXT6edhRKfhF7wdpG/NxQK8nV76T7VebO1fIZGOHsmk08ST8SLBh4ASW/KRf+305GnXtN6XTafJt3q1w7NEf/s6mENGTDXg7q6Szzpu1k6to4hqqBp/YLytNjy93MidGlYt796PlqaXiqpy5RFopKjSbUV2SLo6zxCRO4dHhHk1XzsGG8fhKhMfpo3dsQ+mAxE4Ts0K6Fbaje+M4H+tPKYF9qMS0LbcVWXk85AjQE5ZJGoYBqi0FWF7NaJO0MdvV29uxZ4vrH54moZzMlGp8PLbKHDk4M6ymdFqIiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yur6fJDVHM5GWlmWzApShpJbbPrTyXZUU+2u2+8L5yg=;
 b=cwdn9swnihrcN2VgEaowFfUTIsXbRqbIim/SYsRv1o21MrJxQjljkduQP0tz23kAHD8AfJ6LkOOx101Ta44G5rkD9NNmMi0b/pSt+JlD7sKxT0SnNgKyvm1xD05WM9HxUCdDVZ1pIzjJwHDgN3vOckXEh/KRgdEt0wbpsJIA5UzopPQ3mvuVL4QHlzn2Fnz7c9kFTpmy74d3o9IVvf5XWo6gqCfX8Q7oQ9LeTsd5HcDy6JQJtx/HJsNxyts9QXGw3m+lbyQr8+RSo01rc2w6STzYyYzVq23mHbIIDdbOU95f0QVlSylIPhMtyp4Uc9dSRArEyhuC92Scc+0i50Ndtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=cs-soprasteria.com smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=pass (signature was verified) header.d=duagon.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=duagon.com] dkim=[1,1,header.d=duagon.com]
 dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yur6fJDVHM5GWlmWzApShpJbbPrTyXZUU+2u2+8L5yg=;
 b=V6/TbiW3gcot1mhYWGWzQSgXFUwmjwogb18gzEPJJMcxv/63gIg/rU7BJEY7VNqFe9lVtMaev9EUTkO4KgnUIzyJwWTaD8DgkJBZutWWvu8gxrJtZS8BB6Rkkw7bR2gi0DXcnjCM/HhinLEoPp4/Pz1B6lJXGDpjK6hj7uJQEjs=
Received: from AM0PR02CA0093.eurprd02.prod.outlook.com (2603:10a6:208:154::34)
 by ZR1P278MB1715.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 11:57:07 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:208:154:cafe::a) by AM0PR02CA0093.outlook.office365.com
 (2603:10a6:208:154::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Tue, 20 Aug 2024 11:57:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11
 via Frontend Transport; Tue, 20 Aug 2024 11:57:06 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4Wp7HQ1NDQzxpF;
	Tue, 20 Aug 2024 13:57:06 +0200 (CEST)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011027.outbound.protection.outlook.com [40.93.85.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Tue, 20 Aug 2024 13:57:05 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxmixmkxoIYgXRjUtsg1oN9zk/5XPZKB+MS5gOLAgZz6ZOLR1ZTDpjZdiSielQ4YVaIh7Jc/iU0lBfM9v+X/xiTtx5LCkvYBeMughxKjY01J2NX44c8c3QbPyswr0Rb6thYCcEgl5KXvoUnXHpl/i+Ae8e2iHqdia8Ooa4rk9REPatbD7kofrSORNIeNlgDU9OJ3utXyZBIx6V6T/heyxbzdjBuea3ufqGgB1UxUAr/2tVrdT04YxaZrMT+eHJLShhEN1Pes66HsuhVPvbNjbgiH5DV1lvDjfSQyDnGxuRu5plhw6IoKBQ0AtoKK9/vFxWEHxUI2g5BRZR/xUZGqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yur6fJDVHM5GWlmWzApShpJbbPrTyXZUU+2u2+8L5yg=;
 b=m1YdFCLDczM4L48BwR1Ln57Pn+W+UIc8MBvG7FscfRONLbcT8eG2f+LLnGeQwZNMg7StCVWfYs1blBmNxrlnDULodSYpeZgAxbzZJYReBzNYdirby+ipkrphEyvfMOGglRGHALLmjJt3rVW7nFuugW/cumlxF9UrcTeaSBw29tjIFjEcJbbpWAPZ8H4Ke2SatW/Vg0netLVfQx5a3WWcQfZtIzhvSNxbMltJutUPlHfPwNLoURrB3Y44dfga0+7d6wEidh3kJIaVLsXpoUQpmf3HAUfrBYm9A6NGjwdJl/e0LMC8oH2xcZI8usn+hn+/vdXqHVMxYi8WyhNRP54hOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duagon.com; dmarc=pass action=none header.from=duagon.com;
 dkim=pass header.d=duagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yur6fJDVHM5GWlmWzApShpJbbPrTyXZUU+2u2+8L5yg=;
 b=V6/TbiW3gcot1mhYWGWzQSgXFUwmjwogb18gzEPJJMcxv/63gIg/rU7BJEY7VNqFe9lVtMaev9EUTkO4KgnUIzyJwWTaD8DgkJBZutWWvu8gxrJtZS8BB6Rkkw7bR2gi0DXcnjCM/HhinLEoPp4/Pz1B6lJXGDpjK6hj7uJQEjs=
Received: from GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:21::8) by
 ZR0P278MB0106.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:19::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 20 Aug 2024 11:57:03 +0000
Received: from GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2dfe:6978:5fe7:2148]) by GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2dfe:6978:5fe7:2148%4]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 11:57:03 +0000
From: "Amori, Alberto" <Alberto.Amori@duagon.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
	"helgaas@kernel.org" <helgaas@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: AW: Question about AER in latest kernels (text format)
Thread-Topic: Question about AER in latest kernels (text format)
Thread-Index: Adry1iiMmzIfH6wMR2SKLqe5Prk8SQAFmmoAAALVeYA=
Date: Tue, 20 Aug 2024 11:57:02 +0000
Message-ID:
 <GVAP278MB01198EBCF1458B1183C71B51968D2@GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM>
References:
 <GVAP278MB0119BBB30DC2065981D978B5968D2@GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM>
 <cd4c1c76-5457-4da2-9d95-2a52d44db378@cs-soprasteria.com>
In-Reply-To: <cd4c1c76-5457-4da2-9d95-2a52d44db378@cs-soprasteria.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
x-ms-traffictypediagnostic:
	GVAP278MB0119:EE_|ZR0P278MB0106:EE_|AM4PEPF00027A5D:EE_|ZR1P278MB1715:EE_
X-MS-Office365-Filtering-Correlation-Id: 17146aeb-d10b-4031-203b-08dcc10f36ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bDJ3ZGt5NCtGb00vakQ4dlU1MWF6NkJzay9CcWk3b0YxRlVEbFhFb0hEc1BW?=
 =?utf-8?B?aG5zWmtTaWtZWWZNRmpkN2ZXbytDWUd6WHR6eVhXeDNPd091aG83T0lXYlRK?=
 =?utf-8?B?NHQ4VHNaS3dZWWNhUk0raDlDUzlXcmlqQTZ1ekZkdElSdWF0eVlWT1ZTNjMy?=
 =?utf-8?B?enRsWkRYYmlJWEZZWTZxMWpyWDNhMlFGdi9BUGthcFB0STJXMThTeFFXVkhZ?=
 =?utf-8?B?WXVpdFJBa0U3Vm1LbzVBYUsrV0xUVEpaWjJ4ZFFIaWxib2p5QysvTDArcnFr?=
 =?utf-8?B?WjdoVEJCS2Q0dWFIR0JmMDhicmhxUVpjUWpOYzEwSGNVc0RYQzFrK0RlV0ZJ?=
 =?utf-8?B?VmtvczhyellGOGRSZ0ZEMzdPdzZITmpmZzMxa1V2QmRGTVhqck9pRGVJdlhq?=
 =?utf-8?B?bCswVHFxMzdaU2VKOCt5eTFTQjgxa1p2RjEvc09NM0dZVmxydlRPeVpFMzVh?=
 =?utf-8?B?VzNKTDFPU1Nvb0d5OVBKQkNsZk1OekZKbU5lUWJqRFpUZjNwRCtJVkRlTXQy?=
 =?utf-8?B?V3hIMi9VYThBSWw1aWlUU2x2THhQYXk5S254VHUzUlFVM3pLUkNOeG53U3py?=
 =?utf-8?B?ZklnSE9kQXVBV2hoQWFvSzBxMS8yQ3l2Qk1VTlJKTk5remR4NU4ycHBlVkx1?=
 =?utf-8?B?VUlhaFJQSTRFSll2Nkc1aXhPRTlJL1YzWHJrcVFNbU1lR0dBS2JkSUxmSE4z?=
 =?utf-8?B?d0lmdk5JSW5PVHlrNTNxZDdYcDNLV2FuYXBYK1g0Rmt1dThadlk2b3g0Wjhj?=
 =?utf-8?B?ZURrZVFqeEp2VUpWMnBGdXVXeUR2WjdnY0syeG12aXdQa0lnNnJzOE5mS2Ny?=
 =?utf-8?B?alRnTk5oRVhEVGJmMTRtRXBRbnI2T3VJTWJLczVxMDhHMnhzUXNpTktFczZz?=
 =?utf-8?B?TEwvYkVwR3ZPYmxYWkRzOXZuNjBKYVIzb0p6bnBBV2NUMzY2ZGJEYy9rTzhu?=
 =?utf-8?B?c0JYWnVncjVQQjZZVEFvdTh6RFAreVY5OW5hTlJnZlcxbzJYS3IxN01wM0lB?=
 =?utf-8?B?dmVlUlNWV1phMFUwWkRZQzZQdS9TYTdnVnhxdEE0S0RmWGxyT2M4MVFIaHlS?=
 =?utf-8?B?SmtneWpQOFpiK0hTdFhXU2Znd2dLaFRDdHNVa1g3QWhjMkh3T3kwY05WY2l1?=
 =?utf-8?B?NWhkVEV3VkN6K014eC8wQ2FnRnpVSFEwWWN5U293ZjJBZTVLU1U0L25Ia0hu?=
 =?utf-8?B?eThiOU5POUNFNlYwYjFYS1o0VEI3NDQxdnpOQlRtcXNuZlR5c00zUkY2dml3?=
 =?utf-8?B?RHprWXFodHUwaG1YYU15U3VpNkRaMDlpcFJ1SWRUcWw3c1FmaWZhQlpjb2pK?=
 =?utf-8?B?eEhSLzZyVTIzZHB3TTZRR1JPdmRKci9WZk5HanJtTTR6em5wdk45dzZqWDU1?=
 =?utf-8?B?b2VObjBQaWxiT3V1VVZmMDU0Z29INExCQVpZcjFWZERBUGtOcDVxSS9ZTkRI?=
 =?utf-8?B?Z0NVM055QnlQVW9qbUp2a0VoN2xBbnRmWWg4aG1DNzN4NW13MjE2OWFZUGtz?=
 =?utf-8?B?bytTZFgrdEZ6Z09OeERqK3lyVVY1N2tHamRTVTk0SFA3Rkg5Ym01aWJ2bkdN?=
 =?utf-8?B?UUh3L3J4MzA4bDlmQ0wrLzBVSnRrNjN0N2xtNkpNdDdtMkFJZWlLaVFRZzJy?=
 =?utf-8?B?aFRYOGFha25oMFExUStuK09aZDViRTU3OVpMclBaZnlxNGdFNzQxbHMrUWVI?=
 =?utf-8?B?VjJxc0wxdXg1M0R2K3NNSlZrMVVQWE1UTVZ5RWg2YytFSmlaTW5PcDdFWTd0?=
 =?utf-8?B?L3locU92Sm5nTForWTJZbEhJNXNHQ0dCS2VsUm8vNEN6MU9wSkxGazQ4UVBz?=
 =?utf-8?B?S09qaCtzT1FUdU9WTEFhcC9CYVh6eG84RmJsb1lJakI5TWFIaW1nOW9ISlRW?=
 =?utf-8?B?ekZ2RHpiVE9La2tZbURJQ2xKSWg4RGl0eksvQ2J5TWYzZXc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0106
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	beed577a-6190-4678-2625-08dcc10f3407
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3VJWGdBZGZ0MDUzWkRQbkZJUzdEd2l6YllvS2FZck9IcFl0WkJPNUFGdXNE?=
 =?utf-8?B?ZXlXTU9kMmNSVC9vSFd2WTdNVytmZU4rVXEvRjJjYVpzRXB4TkxnS0FsdUlu?=
 =?utf-8?B?RXMvdWx4ODFXRHcvU3ZaWVNIeHJLR1V0cFBZYWVUY3BCYTVaUkNseGFWZXkz?=
 =?utf-8?B?WlQxWXZpMnAvK1V5ZDg2L0J5M2NzNVVzZXNOWnZqenJzOE5HbnE4MGpRcm1P?=
 =?utf-8?B?ZHhEZ01sN3ZOZDZwUDY2RlA2RzFCeUgxQ2Nsc3NiNHBCbnFlV0JQYURNZ2JM?=
 =?utf-8?B?aWhVOVVUc2RBUlRuemlWYTR2SEc5M1ZZeDU0Mlp0dnVBeE11OTFrMmFiUzVH?=
 =?utf-8?B?ZEhyWlk4ejVOdW9LM0Y2Y1ZKMUk3bjNHc3J1YU9TTkF5OXJuN0JqdUtRV0FY?=
 =?utf-8?B?TEhOTTFxY09HSEFtTjhlb2tCdVVudjZXSEw2QVFRZzRxSlNyaUVheldaZTBD?=
 =?utf-8?B?NExvRnBCa3NQUVpjdkNUWWNTeDJ0bUVKMVJoQkhQU082Y1NialE5cUZyY0FC?=
 =?utf-8?B?ZXFMaE8rc25GVmFjUTV6YWVKU0Fadm41NUlQcTd1Y3BOdHBNRzI3Q2p4YTlH?=
 =?utf-8?B?WE9KRlhoRytnNEc3aThqZ3dLZXF4Mnl0UHVueWNNWmcrVWpSK25xMmwwY1hn?=
 =?utf-8?B?UDBFYlZqRHh4Q1U4SHBoc2lIeTdhREhRYUY2VlprcFpXdWhZS2Zpa3E5ZVlI?=
 =?utf-8?B?ckFWVGowTkw4MzdWN1BLWWtKTEZKZVRDYlEyOGRrTUlKSllDcmx4a1BxUGV3?=
 =?utf-8?B?YVBpendhQjVJMlZ3S0pDSTJ3dCtnUmhkUnJySEprYkVlR2VaT1dxNThQR1JP?=
 =?utf-8?B?bmZBUmx6R09wNGVDUW14eEJMSkk1OXF2aFQ4eTF5TFdxakRVSDQrL2RlazRi?=
 =?utf-8?B?TjV0ZStzNjYxYUVGb2s1Uk41YUNPWXc4aTJQQTR4dXhVL0svWVhVanZ2UE1H?=
 =?utf-8?B?dDErekoyeEwzS2F1VCs4VCsxeUZ4SFJVb3psb3U0SEw0S0ZHbW5NOVRlQ09Q?=
 =?utf-8?B?RzUxeG83Mzltd2NodzZ5RlJ4WHNGSFRjSXFPK3JZWk9RTWtIQzlPZS9xVzl0?=
 =?utf-8?B?MUVyTGlIQWg2dlUwYnNvQmxVRTd1V2ZrUXBLUmhhbTl4MVhLWTh2dVNHeGll?=
 =?utf-8?B?NDZoMkFqeFpmS0hMaHRvbk9EUk9GY3RRM0lMR25ma2xIN1VJVDNTNy81eDNU?=
 =?utf-8?B?b25tRitZQUpyWjJwa2hKMWdGSzdaQ0p1eFlGbVdOMGoyeC9FV0FmVk5taXpn?=
 =?utf-8?B?QjdnaGx5ZGFUNUpMajNISThIejd3dnJ2aHk3QjlHeG92U3pBTWhlbjlweStI?=
 =?utf-8?B?dlM0Q2lHbmdyQVlxdTV3TFkxNml0Q3RCSEo0UmViNWZ2NDZEc2ZwZTYyWWl0?=
 =?utf-8?B?Q2FNMHZZazIzd3FmcTdzOXdSSHVUNkRNRUw4ZzBHbUhqZzNpSTVDcjJGbkRn?=
 =?utf-8?B?Yi9JZFJ6YUFaTWJjQWJwVFI3VzIyVDlST1gzQlgyVzBHUzJLRkhHNFVaWm9Q?=
 =?utf-8?B?N284U2VIeFlia3FyQjdMRjBOZk93RTF5OVQ2NXJGRHQ2eUlNdkt0a1FXS1RC?=
 =?utf-8?B?NkdkalFERDJtK2JaSzN1dS9LMTk0MkdzcEVWb3FLdGZKV2syQkhaYnM3Tm1X?=
 =?utf-8?B?dHJqbVBrWEFIYmdVNUwweU5BbkVWZy9VaDAwTzdXY1ZBSFlMMklZYkhXdFdR?=
 =?utf-8?B?Nngwcy8wZVZ6TWNOTy9rQjU3MlVycjdneHpSdUJXbTFidTlkZzBiT2szY0VP?=
 =?utf-8?B?dTJZWXZodXY0M0RtN1Y5aENTYTdWbWovQ2NuWFpJc3BqYWcwYXdzNGhNOGVD?=
 =?utf-8?B?RnY5Q3Fxclk5ZENmRGcxVjA4S3dYb1dIQWl5VHNQQVcwNDl3NlBhelk1dzh3?=
 =?utf-8?B?VmdaelJpa0ZnZVUyWVo4VGdaek95akZHTXB0RzVSSTVTMW1zOW9vQks4aUda?=
 =?utf-8?Q?xmZRfmo28BnUyGQqRUfXymY1G4xGhDYZ?=
X-Forefront-Antispam-Report:
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 11:57:06.4418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17146aeb-d10b-4031-203b-08dcc10f36ba
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1715

SGVsbG8sDQp0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgcHJvbXB0IGFuc3dlci4NClRoaXMg
aXMgdGhlIGluZm8gSSBuZWVkZWQuDQpCZXN0IHJlZ2FyZHMNCkFsYmVydG8NCg0KDQotLS0tLVVy
c3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tDQpWb246IExFUk9ZIENocmlzdG9waGUgPGNocmlz
dG9waGUubGVyb3kyQGNzLXNvcHJhc3RlcmlhLmNvbT4gDQpHZXNlbmRldDogRGllbnN0YWcsIDIw
LiBBdWd1c3QgMjAyNCAxMjozNQ0KQW46IEFtb3JpLCBBbGJlcnRvIDxBbGJlcnRvLkFtb3JpQGR1
YWdvbi5jb20+OyBoZWxnYWFzQGtlcm5lbC5vcmcNCkNjOiBiaGVsZ2Fhc0Bnb29nbGUuY29tOyBs
aW51eC1wY2lAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBs
aW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KQmV0cmVmZjogUmU6IFF1ZXN0aW9uIGFib3V0
IEFFUiBpbiBsYXRlc3Qga2VybmVscyAodGV4dCBmb3JtYXQpDQoNCltTaWUgZXJoYWx0ZW4gbmlj
aHQgaMOkdWZpZyBFLU1haWxzIHZvbiBjaHJpc3RvcGhlLmxlcm95MkBjcy1zb3ByYXN0ZXJpYS5j
b20uIFdlaXRlcmUgSW5mb3JtYXRpb25lbiwgd2FydW0gZGllcyB3aWNodGlnIGlzdCwgZmluZGVu
IFNpZSB1bnRlciBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24g
XQ0KDQpIaSwNCg0KTGUgMjAvMDgvMjAyNCDDoCAwOTo1NCwgQW1vcmksIEFsYmVydG8gYSDDqWNy
aXQgOg0KPg0KPiBJIGd1ZXNzIHRoYXQgd2l0aCB0aGUgbmV3IGtlcm5lbHMgdGhlIEFFUiBpcyBp
bXBsaWNpdGx5IGVuYWJsZWQgd2hlbiBpbnN0YWxsaW5nIHRoZSBkZXZpY2UgKGUuZy4gd2hlbiBw
Y2lfZGV2aWNlX2FkZCBpcyBjYWxsZWQpLCBidXQgY2FuIHlvdSBjb25maXJtIHRoaXM/DQo+IE9y
IG1heWJlIHRoZSBjYWxsIG9mIHBjaV9lbmFibGVfcGNpZV9lcnJvcl9yZXBvcnRpbmcoKSB3YXMg
c3VwZXJmbHVvdXMgYWxzbyBpbiB0aGUga2VybmVscyA8IDYuNj8NCg0KQXMgZmFyIGFzIEkgY2Fu
IHNlZSBpdCBpcyBub3QgbmVlZGVkIGFueW1vcmUgc2luY2UgdjYuMCBmb2xsb3dpbmcgY29tbWl0
DQpmMjZlNThiZjZmNTQgKCJQQ0kvQUVSOiBFbmFibGUgZXJyb3IgcmVwb3J0aW5nIHdoZW4gQUVS
IGlzIG5hdGl2ZSIpDQoNClRoZW4gdGhlIGNhbGwgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIGFsbCBk
cml2ZXJzIG9uZSBieSBvbmUsIHNlZSBmb3IgaW5zdGFuY2UgY29tbWl0IGJjNGZkZGMzYjMwNiAo
ImlhdmY6IFJlbW92ZSByZWR1bmRhbnQNCnBjaV9lbmFibGVfcGNpZV9lcnJvcl9yZXBvcnRpbmco
KSIpDQoNCkNocmlzdG9waGUNCg==

