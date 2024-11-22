Return-Path: <linuxppc-dev+bounces-3482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB39D5745
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 02:43:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvdCQ0gkyz2ytQ;
	Fri, 22 Nov 2024 12:42:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::62f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732239778;
	cv=pass; b=jAUy5lSAbN6cNoXWQK3I+I/X5o2SV/+9WImmdtLiwcF5kv3plGsoLSlN4Znv7drfIgPJ4R6sCL6evQEBulqVbRwgBwKndn/3K75QzkyuCtHKEx13jH0/Wo7xJwVjQo9ovfpSNJW06lxLCvMznzw5NnItqjKmWHwewN2Hkl2P7S1iVQmfUAo7boqoD1L4hCg87Lgtdk+1LPwHKzD7MtKXwRN5XeJyzwo0uzPUCZLdhkcTZAmHaiFflWCK6BqeD7fcfYz4Ov1GKAA9Kb1K/K9YaAxLWEfgl7SLUT4/g+IIxk8WkfQ63xXvumpNyRBWnduF1VpNqhPINPTIzzaGVsbCXg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732239778; c=relaxed/relaxed;
	bh=DHbT0IBV5ti+9abv0ddG6PJRpIdYB3WlmdHzEuvfbG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dVssEddISTsskokbDg0HGa/WtGRIfbmbwsKA3SAgaJjg6pBD70INUJGQLizooYWGsvDW856XSCIJ5Nwim81l37+G1plXbSSlm57TcxlyQry06wc+zYhzf9tyK5gkIw5k4LVj/+69kEImj/35oBw2PNql6cE+uqhZnQYZYL0uphvcLiXlAKuAuEHD7p8wJUdEqCc/iQPI0ymijnVsNMWbRfKDUALXZwWxmbV9uo5ZCooLX0BVfp7mcp4jt7EVd+UWG64YQw8oEyWgSDcOLDIqxJLEr85Ia7J9xatow20VmY7mqSy/ywuA5m/Y5kgIGvaenDQoLs/bYnCQYt6+oHWuVw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YV2QLICi; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::62f; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YV2QLICi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::62f; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvdCN4Dghz2ysb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 12:42:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSo+WYEJ2IG4rGbiVtY9GPgeQG3xwrckWYGUlOBjcLz/Qpc76riBMg6i3Ug5DPS1WLle7RAaUfHJ5scUUylP9VnQULGQRHgiDZpzuRHnbQlIykyzspIutfOKN0UpITXMUnu3Gh0/BI+RYddOlPXFwNTpcZj4XfaljI+TyUGdwP6wXoKEAcq0Gr0EZ1jyT8LXnovqeaP//hFDfYAjAJD81+ahzwvvjPeSmwRTQhBp81XMm+aVEo1hjiL5bqZU8AJVOPRaYEYDxjiyUEPPSgpnT0BnW+2qQ9xlQIndTh+BcbPFXPgtrlLVhoPqHCqbXRrThW+3Wa+eBp8zxzGG/WRkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHbT0IBV5ti+9abv0ddG6PJRpIdYB3WlmdHzEuvfbG0=;
 b=I/c+GN+O5a+Hy1xtg4oVcc4WJ6xR483dZiYla4U7fVCYi/ruy1UQlLy76VRdPP75q4LKBKNYMGqqMxxBd7yju12EPorqIXL6rB0Gsgs5fTTwVl3F9lmh9ILeSRg6pAXFtIjWKryyohCBXl0Ci5/nVHrOEmhZVzylpwMLwln9mhf+ncxj5p7/APA3EesxuF5LNfGsqof7LsI6H1WakftliQ4FEHz3ZjgN4CFAyi8eVmyFGs/oSzd+yM3AI4c0nnYwOONk6+wY4kSCCT6ikuwv6B70BMrcAFBaXrEKkKmY+J8oj5dNcJ8+Ewnn4ezYiFALrEd9YHfQ8Sdbma7m4bsiwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHbT0IBV5ti+9abv0ddG6PJRpIdYB3WlmdHzEuvfbG0=;
 b=YV2QLICit//RchfhDym7W/banCqlk1Km3jc/WnEKxPjH5XQlMluYFLgbaegrn+F8Su4/Xxtp9PqhSX88BqINp1NoJUQgGxeHueMXXCHvYc0R6MpAN4UHaQSYZfmE/krTkf2YOje6PP8DUlOl8m+Cl4U8boYgvRYqiBLm8VCRrL9z4in9zKsW3lKCn4CVdti6XirahzO8oAe+gHSHpo8tGPC7SwoZzcfRu8jBUNSskNBsgJm00ByWyRU/nhdV5rClmjdTEX6Jo+tPPHD7ptcYKvFmDlx73+PHgkg+pLyMF7J+z6WI9MI6ecrUk2lPNC492hIbeV438MqBzvlFJwkOtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 01:42:36 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 01:42:36 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com
Subject: [PATCH v3 18/25] proc/task_mmu: Ignore ZONE_DEVICE pages
Date: Fri, 22 Nov 2024 12:40:39 +1100
Message-ID: <790644f0c5acd7c413dae08514d4122142967b57.1732239628.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0152.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1cb113-3359-46e8-a7b8-08dd0a96f0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nx7Z0v7/GDN/GQJaiVe0OsKPcZokfq2XNEKpNXWy5he9kUQ6jIZU2lXSqbYm?=
 =?us-ascii?Q?fr0uO7Pb7Fz/GW81E98vcc5SWW2A1aKa6BX7clICfzoWET/Vcp9sknhyoRnD?=
 =?us-ascii?Q?C62f1c+LwnwQ2NzRZw57llXuLzuQMJknN7B5UhzO70jD6AY42gRMVCj2wSXY?=
 =?us-ascii?Q?xRzYi0BEznJLfnaF2j8/eN05hDRU7XzSV4uBdkiYUp3clwNrCO0a72SWzbCx?=
 =?us-ascii?Q?rhvxNkJ5AcSGFtp17ZQ+txwRm6jHLE8Gn8j0vOUgfMRBIrT2zDIHHhE6tSLI?=
 =?us-ascii?Q?pIVLmx/dSbn+iaUzMlYWz6ey2XrmzCU1PJkFVF6HRo3Ka+Ka/FDK2rNavIax?=
 =?us-ascii?Q?9KQ8vAtRTbbNSY8gfvfAvhUVoxltPBQ7NLQ5EgpUpEUh/E8AfJ+1oYRizHzL?=
 =?us-ascii?Q?q6kgn5v16WadA/kORsfedM2E22fXPsiNu5h3Z0xy8TfJW7nZEA8bCXUX9z1I?=
 =?us-ascii?Q?AcDxO0kn47amMCXWqyhjenP+epdzEUuHUA7dzmuePfkXtR2DQODmMTHVGOcc?=
 =?us-ascii?Q?VvPgdK4pwh2y4zXquSRJsVV37+HIdLkquLwOJk1HXFIf7OtuLeBZu/Ddx1Zh?=
 =?us-ascii?Q?GXm+fk4gJXfM3VxO5IhXQs0jeYU+zNN6aMd+TWOAgzG7f+moL1VSDuqaCG4r?=
 =?us-ascii?Q?w2/HeQGSPUAlt5nXQegoxIb96qHoPVaaBGLT0Ey85zktauI2X0BcJJjuuoN0?=
 =?us-ascii?Q?QdXEemo0kiTb3RbvUI55TkwGcsWSB8nzovEe+QoDcrHIxx2afCqd/ozjsGPo?=
 =?us-ascii?Q?LrmabzeSgxPaM7veUUzIeyWa5DEBWRGtiT8wTpzzbF+cZtG0Ei0+1vLS5lbu?=
 =?us-ascii?Q?eShrqxy7fBXG7KKkNLB5YWJncyTlTspo+T7BU2GDWUDDqmbXcW269QPTRsbW?=
 =?us-ascii?Q?/aabJ5vGaEFANl1WGEX1f3r3KXHSWSsxic06o6Bt/cya7vC4QiKiNa2CZFAN?=
 =?us-ascii?Q?ei2Z9uFwCBGjPbpZsXSY53P6esrdJjWVg1INvb8L45Vec+XjijPwicngkzVX?=
 =?us-ascii?Q?Z8F2VrepRb0Fa30QOj/Eo8rnoHJw0Ze3M7XlF6bmoA44mX4jMd0lrwSSG9E9?=
 =?us-ascii?Q?wNAIerTFp1XrYnGQMUUT3oca9t3AnCK/61HYNO357R9nZesw5b05kx8LSqa7?=
 =?us-ascii?Q?S3VJRlI96NCoXvG7q+GUHNBTRIBPDsrpkab07iHTEfK8yMzVfQl+kumdHnJR?=
 =?us-ascii?Q?OUtMXtSju4r+HOiU7I3T7M/Cg0wG83yU/s4lhGRBQSsMyX41HIdNbVsbgg0d?=
 =?us-ascii?Q?CMw7PxbRLrQ5FX3xS4qtuqmkfrZW7BQAMd9YrFvYw8GaP1Ugrrok37K49GyX?=
 =?us-ascii?Q?3odEsEKrD/45F8pHTuC9qLbi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/fhSoXrQ5W2FzrDq5Vv85PAV579j8x6dftC3ODtciE4i96ODz+9DNXnBEAH6?=
 =?us-ascii?Q?pvHYz/ZCiWQgb/+wUAlR6VNYSyctrK6lzIJJr8Pq/JqUww+WhUGv7YFDixUf?=
 =?us-ascii?Q?oqXxeREqGyu1UB/RQC71nBWzF1VKFnMG3UyFxTAJ+9Gol6Tti3ZROmdF71EK?=
 =?us-ascii?Q?NjqTtl2ljBCryib0j5y9VjE1wfQ5mY3wmOJYYzGrgnDzE2jgJgAgWXIHM+2t?=
 =?us-ascii?Q?M8R1rSYrx2u/DjHvhCGxp36Gzv+xABWJom1IN25JSY3TxNsMjMSwdTxyjhP4?=
 =?us-ascii?Q?SLWzdr8Tjj/8EAiCUOtmUnV9fveLv/IpnjQJOu8oooRywVxOnZDZSy/cElmd?=
 =?us-ascii?Q?8C26mtYKYEVXCNAUUuXa0LnyKlYS0R1cKVjjNNMtfIMzBGGQwzr1oW4YpZHz?=
 =?us-ascii?Q?vfdNmjmHWf44RQSFJfsjGCBPe3qOCpRZN6/sbanaLvJHtozSibHfGTgAya4y?=
 =?us-ascii?Q?RXmuysPWtRIz7d6QJetcfcLSb0naFq/0TvPrRHf27j2leEu1xm/Md7HT9wWQ?=
 =?us-ascii?Q?pB2hBGWBPQADJl1RPDuk7YuAs2plEkM1LT+OwUTeOkV3eXyeJDSuR7KTWj1o?=
 =?us-ascii?Q?tBemjeF3RiIMEI39083WkW2obBP0zQbojzP85m4rpTe5BTQVS6gIBD24Noe9?=
 =?us-ascii?Q?aSxffQwL2tM9YcoQZWZfBG9AFoocNypNy6hHQ5rIUTCBfm7ojE6pP5BF+pQv?=
 =?us-ascii?Q?EjhGzsTNrbnCqDHWpI+NIeC+CmZRtsKWVnVBQqHoBWcAK11zK24NU28XYWk1?=
 =?us-ascii?Q?4jxIw+mW5DGBD9zEWbokBPNtJ9o9DH0GIVI7XCk620UGBRSfH49n9qwRW/hK?=
 =?us-ascii?Q?TjGCnScxFI55+xk+kgP7cE6Bmq8VGJs5AaTGex50PP3YeJG89umcfKwwKUCn?=
 =?us-ascii?Q?BvjLjq8Hz1d9J46rDNGQRzG/GrXpxktbNji576wDbUYmurylvwAM2aMS4Ens?=
 =?us-ascii?Q?dfiuKsQowgN2lczx1VUB9f2Xbk6a7Zt6d8kpzXrxOqdYVyYWog34Uyidz0a7?=
 =?us-ascii?Q?KPCOBMuZnnu1zkZkEFCD5peAz2PuS1b2IKlgiViORZNOXz7RrPflBdhvdQQp?=
 =?us-ascii?Q?cTzXRxV3DF8T+GIVi8G0KjfMTwe2sXFD36sEeHU38tR4FTsH3/P6/WfgdyUj?=
 =?us-ascii?Q?p8XaC5DgUYtsSEXSg0wPimjCkgJzUIki8BbzUVH6Xr3suL8rZkr2b5P8sg19?=
 =?us-ascii?Q?rUeqkqh5RC+zwUvNRbFjsbX94/dj5jTHRkwv/tA9WLe0CIerQy5pATqbCwbd?=
 =?us-ascii?Q?TbOkC5qKUL2OanRDjnImlimoDyoEJfhhUcbVqOWCZcQH49/5jNXw6L0RxJev?=
 =?us-ascii?Q?z/kmiXC7odgLuIlbaMXlRnaYfIqE58tUV+ApI6C+6+2aQRMzZhnqXIi5Yyit?=
 =?us-ascii?Q?0RrQ9sxocS3523jUZX542zQrm5kSjJJwKrGDm/tdRLh9Jtyt77J/jPO4oyS1?=
 =?us-ascii?Q?IK3MwuwKvwi8vnZ1I1Kowc/ZT7EMtn8DpKoddTr7WZ4242OYYFfoS2vSWPil?=
 =?us-ascii?Q?9Bs0//6Ay3HGQywh3ypLAkOpEEBOsBZluz3QhNkR1HGF1UgMPotJYfUXzDPT?=
 =?us-ascii?Q?QjTHkUYtBiXeqLTTUo5UYgtAaIUWmYG/ieN1QyZY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1cb113-3359-46e8-a7b8-08dd0a96f0f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:42:36.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOWXPQ9TA6lNmW5b6ZFVDr3wRcKccLG2ZFvVAdkcfhzyg9GWNi6zS3zJfevcBq/nlfK8lK7WU69+2aBhpMYdmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The procfs mmu files such as smaps currently ignore device dax and fs
dax pages because these pages are considered special. To maintain
existing behaviour once these pages are treated as normal pages and
returned from vm_normal_page() add tests to explicitly skip them.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 fs/proc/task_mmu.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index e52bd96..374e976 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -801,6 +801,8 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
 
 	if (pte_present(ptent)) {
 		page = vm_normal_page(vma, addr, ptent);
+		if (page && (is_device_dax_page(page) || is_fsdax_page(page)))
+			page = NULL;
 		young = pte_young(ptent);
 		dirty = pte_dirty(ptent);
 		present = true;
@@ -849,6 +851,8 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 
 	if (pmd_present(*pmd)) {
 		page = vm_normal_page_pmd(vma, addr, *pmd);
+		if (page && (is_device_dax_page(page) || is_fsdax_page(page)))
+			page = NULL;
 		present = true;
 	} else if (unlikely(thp_migration_supported() && is_swap_pmd(*pmd))) {
 		swp_entry_t entry = pmd_to_swp_entry(*pmd);
@@ -1378,7 +1382,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
 	if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
 		return false;
 	folio = vm_normal_folio(vma, addr, pte);
-	if (!folio)
+	if (!folio || folio_is_device_dax(folio) || folio_is_fsdax(folio))
 		return false;
 	return folio_maybe_dma_pinned(folio);
 }
@@ -1703,6 +1707,8 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
 			frame = pte_pfn(pte);
 		flags |= PM_PRESENT;
 		page = vm_normal_page(vma, addr, pte);
+		if (page && (is_device_dax_page(page) || is_fsdax_page(page)))
+			page = NULL;
 		if (pte_soft_dirty(pte))
 			flags |= PM_SOFT_DIRTY;
 		if (pte_uffd_wp(pte))
@@ -2089,7 +2095,9 @@ static unsigned long pagemap_page_category(struct pagemap_scan_private *p,
 
 		if (p->masks_of_interest & PAGE_IS_FILE) {
 			page = vm_normal_page(vma, addr, pte);
-			if (page && !PageAnon(page))
+			if (page && !PageAnon(page) &&
+			    !is_device_dax_page(page) &&
+			    !is_fsdax_page(page))
 				categories |= PAGE_IS_FILE;
 		}
 
@@ -2151,7 +2159,9 @@ static unsigned long pagemap_thp_category(struct pagemap_scan_private *p,
 
 		if (p->masks_of_interest & PAGE_IS_FILE) {
 			page = vm_normal_page_pmd(vma, addr, pmd);
-			if (page && !PageAnon(page))
+			if (page && !PageAnon(page) &&
+			    !is_device_dax_page(page) &&
+			    !is_fsdax_page(page))
 				categories |= PAGE_IS_FILE;
 		}
 
@@ -2912,7 +2922,7 @@ static struct page *can_gather_numa_stats_pmd(pmd_t pmd,
 		return NULL;
 
 	page = vm_normal_page_pmd(vma, addr, pmd);
-	if (!page)
+	if (!page || is_device_dax_page(page) || is_fsdax_page(page))
 		return NULL;
 
 	if (PageReserved(page))
-- 
git-series 0.9.1

