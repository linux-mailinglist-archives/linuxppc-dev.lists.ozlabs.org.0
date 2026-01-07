Return-Path: <linuxppc-dev+bounces-15364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBACFCCDE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:19:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtD0ypcz2yFh;
	Wed, 07 Jan 2026 20:19:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777555;
	cv=pass; b=hmLmXYX+72OldF3a3IRzwCR0/SWGW5CdQsTvIbIT9P+c4NP50d1UhUFssat9HIJ7v7BCkEMUQdwvtP+WNFqoMmQC9DBst0i7DUJ94jYui2XfnoJDMZF9Or+fXBvSFpEa/R7i2yPZkSsoITJBdL5xg5MOhrcUwTllXMi6FuNREq5+IJH8zn4+aRcV9wNlhtY38vl7sv9aydL5fRXQP/GqWJGdd1ib3qRnZt7tuyo0kUO2jeSwsJXX2E4tGbhW8BcToMoBh875g7ePXIYf/eoRam183zk+c5CokRdrOvvpVDquee6BbpViwFeRq9zN3GDZtow/fxB4/KToun5PeznVNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777555; c=relaxed/relaxed;
	bh=LNizLYsMyYyYs8Qx7xu/ZxcKN5P0YsoACEl2Zbu3vXI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gMvAZzWfh7JtgJn99X/9EfA04R99/Uvgwh/9luGSChYedBslwrPQ7jGzaf/LqtuTYa1KbSp9m2HWQz1FGWKzrrfB50P5CEn5RprOByRg8XN/ZQ15TpAtN4M3KwINXE00rNww9fITzeReqBMOhBaLbjx8v7gqV7Q5k8iELQE9kUZyRQU95VP7dp0YLObkXf03ITfGCsAarZAVq2ManWxjVHAqQqcEXBR+e2IeY6dg4mvCpCFygbG7VmUSjKPLer5IQK60HetW/FKWTrC5VbS/PJ/wBLjyMuQtZrz1x9ty8xTDKb7U6lT9UnruKfxM/oXyQFpidjA29M6EcLQj4SnWpw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jzsFeph9; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jzsFeph9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtB2xMgz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHW/8AtMZ1yOYX6oWVnINVvU+SoXZQE4Df2hfV6Mdp62mixEUtgKebKDCkQ1O5eNZfI+ao+4oMHAMfHIItvS0ZikPYhKZb5UQp4vm+dfFKeuUCJkmMmlsuzvIHeGGgIzoDLM9Q3rdoDAmaJAN22DgqSI+u0pxMffxk1RfzhsjC9Khk/rpvRL3qUsXt1pua+eUoJR3rPRBL3ODTj21nLuAsfM8kjAyNmO3gEVqsOsY8fDTi6Fc/RHOZ3YcDP9hfBYizU+Peuivo7eNWZHmrydWicNe+zqSuMzo0QDELq2Ouo76C9oF1bY5FSx+z5aTG5jSfmgq02MfPykvsqQkJsntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNizLYsMyYyYs8Qx7xu/ZxcKN5P0YsoACEl2Zbu3vXI=;
 b=CYrcBinczQSH0cgT640spks+pJ9bgc9oNSTfZQtDnz6K5iFRfekjSK6bKnUKw4sTobgRLBpppTixg2ATvG3NF8bJuD2ka+a9D6MwdN06d8J/9Pp1YftQQwRXSnGJpCZlVZElH+DgDDq3C2hQ187BMlU67h8wxr/LG4m74suF1c+RlPjOxV1UN6UgotTdRDdYzFSB3pBrBQvnWORU5aCPWOPNUme4wHxB3Tkl9ycCiWVOCCdSF330ipcU+zkwthxhGELakAMFOI0CIzxgEJyxETskFGHMIuFTb5WgBXdJKdK4NJSrNpYUIQR0bAEIWwyWTYhRirefEGSmgKXWXzOA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNizLYsMyYyYs8Qx7xu/ZxcKN5P0YsoACEl2Zbu3vXI=;
 b=jzsFeph9NTamQhDtUAmrZO4/CJkNiQJy5igmep6eqcRH+p+2e39LaRAbK4ZD25CCBZ8idLHez7XKcrG1rBs5ufbV/2J6eEXFXues84vxWDglDEBwihkJ/NHhC5/zA4/anJ5uFfZAFbtczMsiTDITdNfBuHeursFHyCqkNWQmkFmpuhA2HIl3PADlEnFniDFxJhTUtvpjkwaMPD1jFu2pNFzVCwEAd51BtzHnvum8Ao8uU1VsNDmskuUVxMa7kO2EAowv3+votEXQVXPU7/y2cQAMvBP/NPFZM7XPsCIRGOgvXIKE9pdMksNLa9+pZhVUhlFxpNVzlH2M0555jXsANg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:18:32 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:18:31 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com
Subject: [PATCH v2 00/11] Remove device private pages from physical address space 
Date: Wed,  7 Jan 2026 20:18:12 +1100
Message-Id: <20260107091823.68974-1-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::18) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d012cb4-ef2f-44d1-2c58-08de4dcdb9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LCo95jmciyJYfj0jfbtfZOFCARFsOgMwiSIIWPT5QZ0sH2RgveWFH+CKOFqn?=
 =?us-ascii?Q?tO5j49KpRVAnKLwTIM+/l/Br7pDWuQu64iQTkMgtTEtwtrLhoYD9TFOZ/lDo?=
 =?us-ascii?Q?f5tUhfM4dtIRT56umKa6qtDa+HxA1Sv0RJGO/bo/41nWc6nCsnmuiPNZl/N4?=
 =?us-ascii?Q?JuePH7QAxNVlE3eY/PRjRKBNSPqhspjgVEYmasdg/lR/Cw4FnE3QOFscEwRC?=
 =?us-ascii?Q?MyjvvGaaoy7pVK5Hp76eQ9leaxNUvkdiE237fsNZHdPiZLPJpYUuUhsthqQd?=
 =?us-ascii?Q?/4G+e5HFjQ97U9j7KrIrJ5yvJWu/E745BWWb0lezPEnvOfnUkmg1+oKa4PzP?=
 =?us-ascii?Q?DQo8M3+OFa2x7yVGVfpa8CYSJos6Ce60aGUA0LklVisUGYdOkfyqrz3sEDMp?=
 =?us-ascii?Q?lMM+ltiEWLvIfY6Oe+CG9ZGiwIEzGcXHVuBtPy3HdkMQXIkgq/rfzGH0RXot?=
 =?us-ascii?Q?uq8B5Pu5DjRiMFwuuhrazctbcI1htYtHZlrym+BFloYxTpE8qZtmPHCYGuZh?=
 =?us-ascii?Q?ZWbO0eM7S80cqGGWlMEPDFDEi8EGnrPuiN8hek8B65APNqX9rozpCS+KzDcb?=
 =?us-ascii?Q?6V+DWoFRTChUjBngjB9+8GkKrVpS1YSIFYMlllRNmQjrHqjpxg5icxW7Ahsk?=
 =?us-ascii?Q?rpCssTEvuU3fV+tGFXet2DmgvmqP4dNlREkm22qt7tdxWdUOb7bb8oWeAQwT?=
 =?us-ascii?Q?/Rvr82jKB3LBMGl6F3Lq6yCK8/p019diEObKurvOMz7g4q3gEwWKa71rs3TC?=
 =?us-ascii?Q?B/hAnBftr87a+eJxP8O1WvOT5A1IDVmdnSFczC/5B92Aj7l09UrOvyTVz3uq?=
 =?us-ascii?Q?fhCTHx3CN+AJLFTPX3WaAEEHe1E1M+B/RzZz3nCh5uCofhpuCwUZDCQkbbKU?=
 =?us-ascii?Q?Av7ufZXuJvYSpCrEmBDPzG8TRCb6meAnev9m8FVtA3PI1WG6IyULSgZfiBfR?=
 =?us-ascii?Q?2Kaq07ktMlaAaGF/gsW2kX3vwxMEnXvO91DOWKsdB/eKWa+R7QLd7V9FX3uC?=
 =?us-ascii?Q?4yQjp7BdBGmUNpofPS6Lu1K9HgmC67w3FP6Cu6mQFb+9zDkWh9xWBMlkDCyQ?=
 =?us-ascii?Q?HP5ptrogFYkTJSDQm1Q/OMUsZ7FHfJop+eGjFd7hma0RwvZ+k680FXOg2CcZ?=
 =?us-ascii?Q?U8d1uB85ypkGWNSdHu200dfka/+IgXZQH3/JxED8DEnWyf9nUjiHu0bnGQoU?=
 =?us-ascii?Q?r36bndLb0kMz9QLwODhct0dtPd4vIChh3q+rc+srihZpB+tC1t0yA4s0+Ncs?=
 =?us-ascii?Q?pIbzHPwTD4Pgx7MWhbldX5xrM8suHaNdaMnKxj/ppQ7DUPiRElIVb8UfI/Gl?=
 =?us-ascii?Q?Rnzx8khXodlPmwhNHiY1SAyks/TdE8qp4xFl+o8HODGxijY8QnCKMaRkjokf?=
 =?us-ascii?Q?obOq+7ne0HEPe8S/x06EsjLLMzlCJJr1lGM9wh8eVNkN+qTpQ+gyv3zfjqbr?=
 =?us-ascii?Q?lJX8fKGLzLpZWb+laz0aGrGn6T4qWY302k2h3MltEjBAAq9Z/vhJQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vr3H5vJHU782hzKDQ6nsp7FqMjU3OGAb3BBvv2ghmiC0RuPIfoNy6bhm4ljh?=
 =?us-ascii?Q?eQbei+EUPvnT15blvvChU14KJ66m0uUVsraM34reHnyThiaWCTG8125p1ej2?=
 =?us-ascii?Q?UzJxJzVt7atPleYVmw2pmR+vSCcDKDGLo0xU1mRfSCbaFvtpB1uQD1t7cm65?=
 =?us-ascii?Q?jpg/c9YE/uGg4teVXr0yOy+D4kLa/DktnY0OndljFeSSpC1IAx1YpQ4XmCNb?=
 =?us-ascii?Q?hWsaIPIKqTBIQtT2uUFwth5TP1tF45NODmHFWI/o5z3ZOrAODc0v03R/1nEQ?=
 =?us-ascii?Q?c60oUy1sALMpAzQgcxOyY7lJmvxDe2+KuEnzfDE1QNQCPXArwTbUy/ySCo/q?=
 =?us-ascii?Q?z7bZsWjHoK6oJ88Do0r4MJa8QUIZVJfwIJsqFuJw8bfXsE+QttHplnTIRhZ1?=
 =?us-ascii?Q?gBT7+a2X9gAxpQx/fIxHp/UiDg6wOknS7cEWc9CG3zYelA8bZI1XU5mUFeEW?=
 =?us-ascii?Q?wkilVT7HuA8SxTctGjqQYslJavvnUlGF3uEkTUcdtQoZWOICPoMjE+OlmYop?=
 =?us-ascii?Q?cvCJqosMngS2xMsopFyhs5wy5OuVdpsqVRoWBWwnWdEz2mDomcrzpltoC9cI?=
 =?us-ascii?Q?Ple4J1eBPe6j00K5wxYBisLUjJhtsYUGpoM1FEOTZxW5+FP0S3aqQ4kb/j4q?=
 =?us-ascii?Q?8c0QolIOKkZZKvjq9PwqOIr39g9T3mUKLsR5piQbzXWro27qRIVYd9EG2V9+?=
 =?us-ascii?Q?GjuM0gmfjguYyU+Y03WLokUpoFA83Vy3i3RvZmfmtsbo9ruFebkhk9m4CVfr?=
 =?us-ascii?Q?lIXodlxoeuM4l1UhLbbd4552kWNDKayD6fodHO9ZobI76JQaQb/i35FqmlD7?=
 =?us-ascii?Q?YJ5m/hqXift62fsW+x8qyMJ0XbOiliZNx8Dgwrz1lZ7VrtpeCeikO+AUojqf?=
 =?us-ascii?Q?w9y7Gp5i2CW/wEM7p9SixqG66MKdm/6nTdPB8N+GKSc3mt2oE5tny1yXedca?=
 =?us-ascii?Q?1SGDpCp5YNl6YB08s5IRZuBfKNEoWBMvkTOcGhmIUmmfnLXJFbZ7cw7ValPd?=
 =?us-ascii?Q?4lb85EIMPhlxnKf6A5p1GO436G4gp3gqYO/3MNAB4wjXPcEZhg4vta85JCwY?=
 =?us-ascii?Q?BUtw7SP7otOk1RI8kpit5ZNKqmHMZcJEZIat45ZOdO/IKsfSgnrsTgU0D5ED?=
 =?us-ascii?Q?25ntTDOkM/LQRUY/NyjKq2Pgh7klb1j4PUJq6f2ustFm/SpHNHe56xKB+4vj?=
 =?us-ascii?Q?rMngosamJywHi7hR1sdQe7PZOcKSumnX7LrqkRQob6u61Xr3TaH5p7aZ84rb?=
 =?us-ascii?Q?76LhpB/0SJSQ4XZUwzpbJDQCgwx7dUsTLySTn8uXxPDSMOP5MabW/CRNJ26t?=
 =?us-ascii?Q?8otmMDRnJDPm8iFv9gHf4XKxtiNWuTpvohLcSr3Ez9pcSTHFXczxxT9M+8SO?=
 =?us-ascii?Q?MVprXNjrbDFwKxN8TXN2NfT+SIB6qeFalzJbSmM9H39pTcfvgSS0vMwxPrOU?=
 =?us-ascii?Q?ftJJ8X6N1Gc0sDUYDUDaWZ/BXMxmN/PHGKDaNchvYEuxOEvtmvYTTiU1G/sl?=
 =?us-ascii?Q?3GHDQcAoWN6k3ZLmaURHStXDIYpYB6qIL57dBNtRnv/y2/b7ACDtWBRdJtEb?=
 =?us-ascii?Q?T3GhUYnbehQYFJqJjF2sBksfVa/QGvEbu67AHD8gFsdibaGTmytmQQyjKE+h?=
 =?us-ascii?Q?xIn7B9GWfnhxViRpWfaS7dIlctYLWLEyY5IxPNP4OKJ2xa8kcw3riAy0AEbz?=
 =?us-ascii?Q?x0ciJqwMEojROhpdb4zMR77x71ruzZN/VYuhY37y1qZnnNnJjO6PN/XoaYxr?=
 =?us-ascii?Q?t5qvKnU7hQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d012cb4-ef2f-44d1-2c58-08de4dcdb9e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:18:31.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPNNQiGktcohng+0T5lZepDvmoQ1EdT6M1Y8Tlk+DetoNDG//nXuSPq4+OfSdW8WHvyCv+DlTDhOV+fCoFdnnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Today, when creating these device private struct pages, the first step
is to use request_free_mem_region() to get a range of physical address
space large enough to represent the devices memory. This allocated
physical address range is then remapped as device private memory using
memremap_pages.

Needing allocation of physical address space has some problems:

  1) There may be insufficient physical address space to represent the
     device memory. KASLR reducing the physical address space and VM
     configurations with limited physical address space increase the
     likelihood of hitting this especially as device memory increases. This
     has been observed to prevent device private from being initialized.  

  2) Attempting to add the device private pages to the linear map at
     addresses beyond the actual physical memory causes issues on
     architectures like aarch64  - meaning the feature does not work there [0].

This series changes device private memory so that it does not require
allocation of physical address space and these problems are avoided.
Instead of using the physical address space, we introduce a "device
private address space" and allocate from there.

A consequence of placing the device private pages outside of the
physical address space is that they no longer have a PFN. However, it is
still necessary to be able to look up a corresponding device private
page from a device private PTE entry, which means that we still require
some way to index into this device private address space. Instead of a
PFN, device private pages use an offset into this device private address
space to look up device private struct pages.

The problem that then needs to be addressed is how to avoid confusing
these device private offsets with PFNs. It is the inherent limited usage
of the device private pages themselves which make this possible. A
device private page is only used for userspace mappings, we do not need
to be concerned with them being used within the mm more broadly. This
means that the only way that the core kernel looks up these pages is via
the page table, where their PTE already indicates if they refer to a
device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
use this information to determine if the PTE contains a PFN which should
be looked up in the page map, or a device private offset which should be
looked up elsewhere.

This applies when we are creating PTE entries for device private pages -
because they have their own type there are already must be handled
separately, so it is a small step to convert them to a device private
PFN now too.

The first part of the series updates callers where device private
offsets might now be encountered to track this extra state.

The last patch contains the bulk of the work where we change how we
convert between device private pages to device private offsets and then
use a new interface for allocating device private pages without the need
for reserving physical address space.

By removing the device private pages from the physical address space,
this series also opens up the possibility to moving away from tracking
device private memory using struct pages in the future. This is
desirable as on systems with large amounts of memory these device
private struct pages use a signifiant amount of memory and take a
significant amount of time to initialize.

*** Changes in v2 ***

The most significant change in v2 is addressing code paths that are
common between MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.

This had been overlooked in previous revisions.

To do this we introduce a migrate_pfn_from_page() helper which will call
device_private_offset_to_page() and set the MIGRATE_PFN_DEVICE_PRIVATE
flag if required.

In places where we could have a device private offset
(MEMORY_DEVICE_PRIVATE) or a pfn (MEMORY_DEVICE_COHERENT) we update to
use an mpfn to disambiguate.  This includes some users in the drivers
and migrate_device_{pfns,range}().

Seeking opinions on using the mpfns like this or if a new type would be
preferred.

  - mm/migrate_device: Introduce migrate_pfn_from_page() helper
    - New to series

  - drm/amdkfd: Use migrate pfns internally
    - New to series

  - mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
    - New to series

  - mm/migrate_device: Add migrate PFN flag to track device private pages
    - Update for migrate_pfn_from_page()
    - Rename to MIGRATE_PFN_DEVICE_PRIVATE
    - drm/amd: Check adev->gmc.xgmi.connected_to_cpu
    - lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE

  - mm: Add helpers to create migration entries from struct pages
    - Add a flags param

  - mm: Add a new swap type for migration entries of device private pages
    - Add softleaf_is_migration_device_private_read()

  - mm: Add helpers to create device private entries from struct pages
    - Add a flags param

  - mm: Remove device private pages from the physical address space
    - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);

Testing:
- selftests/mm/hmm-tests on an amd64 VM

* NOTE: I will need help in testing the driver changes *

Revisions:
- RFC: https://lore.kernel.org/all/20251128044146.80050-1-jniethe@nvidia.com/
- v1: https://lore.kernel.org/all/20251231043154.42931-1-jniethe@nvidia.com/

[0] https://lore.kernel.org/lkml/CAMj1kXFZ=4hLL1w6iCV5O5uVoVLHAJbc0rr40j24ObenAjXe9w@mail.gmail.com/

Jordan Niethe (11):
  mm/migrate_device: Introduce migrate_pfn_from_page() helper
  drm/amdkfd: Use migrate pfns internally
  mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
  mm/migrate_device: Add migrate PFN flag to track device private pages
  mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track
    device private pages
  mm: Add helpers to create migration entries from struct pages
  mm: Add a new swap type for migration entries of device private pages
  mm: Add helpers to create device private entries from struct pages
  mm/util: Add flag to track device private pages in page snapshots
  mm/hmm: Add flag to track device private pages
  mm: Remove device private pages from the physical address space

 Documentation/mm/hmm.rst                 |  11 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  43 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  45 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
 drivers/gpu/drm/drm_pagemap.c            |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  45 ++----
 drivers/gpu/drm/xe/xe_svm.c              |  37 ++---
 fs/proc/page.c                           |   6 +-
 include/drm/drm_pagemap.h                |   8 +-
 include/linux/hmm.h                      |   7 +-
 include/linux/leafops.h                  | 116 ++++++++++++--
 include/linux/memremap.h                 |  64 +++++++-
 include/linux/migrate.h                  |  23 ++-
 include/linux/mm.h                       |   9 +-
 include/linux/rmap.h                     |  33 +++-
 include/linux/swap.h                     |   8 +-
 include/linux/swapops.h                  | 136 ++++++++++++++++
 lib/test_hmm.c                           |  86 ++++++----
 mm/debug.c                               |   9 +-
 mm/hmm.c                                 |   5 +-
 mm/huge_memory.c                         |  43 ++---
 mm/hugetlb.c                             |  15 +-
 mm/memory.c                              |   5 +-
 mm/memremap.c                            | 193 ++++++++++++++++++-----
 mm/migrate.c                             |   6 +-
 mm/migrate_device.c                      |  76 +++++----
 mm/mm_init.c                             |   8 +-
 mm/mprotect.c                            |  10 +-
 mm/page_vma_mapped.c                     |  32 +++-
 mm/rmap.c                                |  59 ++++---
 mm/util.c                                |   8 +-
 mm/vmscan.c                              |   2 +-
 32 files changed, 822 insertions(+), 339 deletions(-)


base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
-- 
2.34.1


