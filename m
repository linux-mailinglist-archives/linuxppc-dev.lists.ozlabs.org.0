Return-Path: <linuxppc-dev+bounces-1196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1E9727DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 06:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2r2x2Nkyz2xxy;
	Tue, 10 Sep 2024 14:15:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::61a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725941721;
	cv=pass; b=nlwnfQTxuxu7uZ67aM4QwrbVgKLt32TalbMrAi1B1CqjJHhYwFHvMmZmz+LgSMzznizmEGS28/G8LG7paLUjGwdVWWrwFDQIQKDMqtEwbJQwJ0vJbspjiHaNRZB4dGOU2BD9s3hdiiW2kwvLiueouGhJrZp0hCC5mZIuON5bsh8TgY+W5jK76ANdmCmjqAESzj6CZz7NRR1DyMxV92LNOAZFezDOwWzvB2icQfZkM4MW1QSIIhE/JLG9eOBYJgLWiS6w0v5+P34isV2jTKNdh4FgG1wu14xcEM3zWocjT6wUXXkjxD7Eq4yZm7Dl0meJWvusEfT3wLwbgX8JabMzIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725941721; c=relaxed/relaxed;
	bh=Dj62ZU2eq7PwQ0A+RevWVIS5zpn4ChQYwj1ZgfGOnqE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gmCaRS/RlN0M7jvynGvDTAuEJepYfMC9I0ynAxSY8bx5TOkFf5KvI/vRkhu0xIvvagk/RXHyB9XJMfvH1QhLDfP8vmO9Cmf6dLD0CY4IeSowf4d9H+KGqsFTRZgHgIc55tT1YNq/VA3AFZEVk5s/PV0BkixpLhd6lPNGxVBBY4GCY/S0yHQJJcpWKCoI0I23cJRSuqowL948xYMcVedb48fvaSmajfPduQK72owIQipFc0mLQtnQxJzBbgu+6/0jajTaQRt4J4BoEVHMATSE03srlycWE9i+NjGmD7DNLR6ecm8cJ9cdCRaXkjNy1o2y1jGEqlkFlBRr/BODU7XeiQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HTUO8EfS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::61a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HTUO8EfS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::61a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2r2w3WVTz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 14:15:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rM5WWDVJ9LsaCuXzykg1cuBj5MIvlPvuyZQ1SluLsreZIfYl1PFAo+T03vPNOicuzUFPjqxUx1XYz2/7QphBn6iiNfcqyOrxC1Tcf8l9yPLjdBNOnujWS65TyaDaMj0FRk+27ikYbz1gmfZQ6tawZ2Ye0ieg3JYGQ9PySr1XfCrVh9tNhJSQ3DFh5MeLnf5ThiD69bbVRBURKQDdO864g0o1eDg1cSUc59ln0iEpOPnxyWtieS0k9Gv8fuZUan1pH0d8m0BYWT0OZAz/987VtwdWNvcLEwaSNokzim5ZkhSQ01UrChvjJhkHqojHaOlFZLsV6Zs7K3MXL08MvBg1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj62ZU2eq7PwQ0A+RevWVIS5zpn4ChQYwj1ZgfGOnqE=;
 b=UMmoceg+HqG/tFPoeQW+niJDAo9PIp7Qp+4LWkWwaLjmLrRl2yril7ZgED9lCevv4lfB3v0p3dYyiEWFZct2Bebv9UmoqVQwv5JCfSqwuugT50+A/xu0WnI1a3AIrTHjPIrS4DWTPZD5+Fy+Owi6lNn2DZL69m+gKsj0j6LvV81ym7qDMpmfNPMJJD/73Zjickkw75NwFsiN1ejaUlJ7lp0qHO3Zg6zcNhB/ML0Us6xLtNH8FaQasNobHA1Y0sK1uK0fKW6zP8FUfs2tNofV537pXh9ef/NQTXT4ZrD6pYHaLyrRrB8ZPqzIVpxwtJgrt0UAN8v1Z25tFd4VauOBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj62ZU2eq7PwQ0A+RevWVIS5zpn4ChQYwj1ZgfGOnqE=;
 b=HTUO8EfSTts2vYfVJ8zMhDu1HglM1yhL5XyAqKGHg6qsjJSo87qNtVtNE6aVZchoof1CdXZCnskPdi5qpSEfcn+AvxqoM0VcVA/kgpEKWJ0BUxzQFXrZNXXqz0q5p+yOcVndgLh/NLbtWKq98Z1KnpxT+TDJzsFw4Xjee4444AvBT9okw8UBd/+sMeKl7MhVfBM4UxhRefQkJpBYZiTKLaV7/WvVnlo2wHgBLdrWF5qHbMxoIcnyypeetjEa3s8OFdaxmv5dtE6zCLIDEUJOnPmEQVrE3zDn2PA12e2UabX3m8ELfhVhnh6UlLOCXZaifGzv3Mu2zRHt/51sUd0qzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4148.namprd12.prod.outlook.com (2603:10b6:a03:208::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Tue, 10 Sep
 2024 04:14:53 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 04:14:52 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
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
Subject: [PATCH 00/12] fs/dax: Fix FS DAX page reference counts
Date: Tue, 10 Sep 2024 14:14:25 +1000
Message-ID: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0044.ausprd01.prod.outlook.com
 (2603:10c6:10:e9::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8c6d14-5803-4892-acb7-08dcd14f1e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZnnUxhzQR7dfxgqIEtbukVwcYcdO5dLJ3Jh/eWMYLdqcFwqPWR2Fr51dF3nm?=
 =?us-ascii?Q?Hv/flbdNsRGbIeoSAeiTCKPH9Q35A//cyyhK8t8up5Lx70r9vAdrD2Z6+UDv?=
 =?us-ascii?Q?73u7svLtJ4lW6w31Zh6VUW9hIl/QQTxbn2BbAmqCW9jglFew9WbjLn2rwxl2?=
 =?us-ascii?Q?C3NhdgRHPKBdo4SeBPYhVsPARR3D7fF+qY3/R17lYsqn1u3Qssj5B4J3t7nc?=
 =?us-ascii?Q?iu5V2tEdvGKa6NMAZBWnC+7PcLZdYU8wSv5nGRHwvuITPYy+rEGOrSYmVvYG?=
 =?us-ascii?Q?xlrFx5o+UmdAAt2fxEcZMyng1u7ZNAwgUQ6t8N/SFFIMgfAGetJyDqy99BGv?=
 =?us-ascii?Q?ornTlW2TyG4dpRsP4EYGTAuNXiDkMIgfK51gBFKrLFKyDu7aGxgGcffAHF82?=
 =?us-ascii?Q?hkQHiCj6wKbq3NfgujeqV5BL/uP8lX3zE0q84V0KO3v6b2gCbf1qlVUMjK6+?=
 =?us-ascii?Q?bjmHZmvMysQOOceWk4TIQhsUqpk1GMLcWQuKxWidJSB+PiIGyF0DO5T0vgnt?=
 =?us-ascii?Q?G12EPXRcTf39IVmR+Wr2A9rGRGamlP6RF/Ch8f9pAz8dL8rKdznrqyPX/G6D?=
 =?us-ascii?Q?yr2WcsxgQXr7IGoXVYTV1OzuMOVf2vj1a5lytYz2EEXnBQALJ3LXWmJdt8ye?=
 =?us-ascii?Q?YOoZ16uw6vlbGlOvSP+gHddbRZqHTgyXaDSwqErI+DH8W9bqYh+7xpQnb3yM?=
 =?us-ascii?Q?LOM8bEI2k/oRg5V7L7DHaYd9YMvb8ezMpQt4U3BNh7wLraKBDeVv6CnGVgHO?=
 =?us-ascii?Q?7mVTP2HCtQXUkhx6Tnd5jVaiKiFAreLqeOaH2ccQByiQ49FU6XMHpuwghD+B?=
 =?us-ascii?Q?H1VAChH6U2FD90oaec4PjhYHUcsuSF54dNnTicyueb+u7vABSRAvlqeMG+9A?=
 =?us-ascii?Q?zL78r/+iaodfvGhVbEA6wdBCIAGWJzc1ma6OY2xdF62JA/7CS5WrYkL5o7CO?=
 =?us-ascii?Q?sWMsnguj25Gyt/FcTjRt5lUgXxnvgB7zzUqHw0Wbmv8lPLKt23SsvLm2vnJP?=
 =?us-ascii?Q?/Pm/FeSguKFqhFVAlwU57XMh4pbBYuVUHn5ui6mOFK9fgR+uqUb22kE8XEvg?=
 =?us-ascii?Q?KbsykVaAhVsIe3QA5bew9PWwvBiQNQmhEBfZvwq2ESKYKvEzwr55HuZB9uIq?=
 =?us-ascii?Q?7xsE7T+5mpfPAX3zha/KpH75MkRTQo37frJeAALsjS8n8+Zg0bkNhxBSsqxz?=
 =?us-ascii?Q?c4+/XWf3J7+mya8czXcAgS5y2aR2sZ1cOKhcFx1QN9SCAGWZBeOzFpVynQTE?=
 =?us-ascii?Q?iqGdrytEL/yMO/ymIVBV3hPfneIyO9uiXDXDviNwVwncZ8HkuMbfqDPbU7i5?=
 =?us-ascii?Q?FIRPzCTt138DBNvVnLY4QLCXighNd2bFBXh7vFKOL7zcNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iPvvvgL0LwQD9VoXbVEZs5zSoU42BUPo89iMH8kSCOutf8qTEMsRcdUQOIuJ?=
 =?us-ascii?Q?P/++b8ARUl5pZ0H/k/b4d2NjXILJPxnrk5EYM+2ZXKzrnME9B+7It1thtGbn?=
 =?us-ascii?Q?CJz5pukbXZGDKuUn88nv02Nx8+VaC3YMoltWyUQ+E/3H9CRLsx2ZmGWuDg/Z?=
 =?us-ascii?Q?oa3xOW6zmYXQxueXB1M/Fy1tHoKVvH5MRhsPFarkMaSM/Qnxy1hnTyrdPRzG?=
 =?us-ascii?Q?D/oxr0p/V7K/ulg2r771Lxtn/N4xS54NCSN0JkaraeNfXdxadfv6gcH5mYzR?=
 =?us-ascii?Q?Y5JAGva02XK+HbMzjW9cVZmlXjoSNw/J7BwwPinnabY9CTJ0Qnp97gPIqzke?=
 =?us-ascii?Q?SfrN6Wm/5YV7fwd/PThFbk/K+3CWTyVUzD788OQYjCOa7jTHrKC9WrFnybkW?=
 =?us-ascii?Q?FJolriEs0BpF5NcbA4fGBZdivC/17FvMCH6GTt6QJJKpmIFuQTW+dN2+sTSH?=
 =?us-ascii?Q?O03N6jBot1N6cEqd3cdb+seunWsQd1A1CVOfXPeb/1bnMrVPXOgxaUF3EfKQ?=
 =?us-ascii?Q?zAy/AHVsYXkDYo24dYezHksJPb2qh6+1ix1/whjF7RFAZyy2CRftljy/HAgr?=
 =?us-ascii?Q?K+yjpBYtjEBfwDDjXRIJ9XnwGPuqJ5lnK6Y2REUokPWTKZaL031470n5vBNA?=
 =?us-ascii?Q?5efxWMhoPMhoGOTe5YMz4s7gsDTs6OJawiuBy8xOiUBsfME0RaR4ouAr+QsE?=
 =?us-ascii?Q?kywh+9qbJmt8snAEGC0YnY/7JeNDqqQ4rmifXOusnBo4i8qG8D3nDbDaUUVD?=
 =?us-ascii?Q?pPdJ+Y5j4BHIPI+iMdjExrWs4kBivGAotuFu/YdLjxEfrDkOFbek/OyyhBav?=
 =?us-ascii?Q?WVtrISa3ChgoVng9lGh+tdaLmLnf+vLwbWdRuf740ewIx5oInnM+nIflf7Lr?=
 =?us-ascii?Q?kbxqBs3KlQIbUOz+BU7oW1CP1SEAfK9Ae0rGIdpU2o5Hp9XnEVE9ONyLFEAt?=
 =?us-ascii?Q?LL05IbIANmx7GXoMIWf240xM6hWKvVTDm6zYWE+lbdNk9SounQ4YR0ZveacM?=
 =?us-ascii?Q?AX+cUdqPgzb666qFdxWW7Fs+c0C9XgpdOsCW75zCPevZ4TiccgGXL0vgQB05?=
 =?us-ascii?Q?2kwNmNJhS1+9uxOlljUnKIzYNx4zCXyPMaqJP2JJ/NKtPxUrliJjL4u8Arq1?=
 =?us-ascii?Q?k/l8HtpP8p/yr4mjDY+Jhdd80H1wUSxeCHyCVCVR97eY09iebRvueHQnEIYD?=
 =?us-ascii?Q?Nm/c6zYWuwZ/OxpRjCYAnic6tAtudOrv5TMeG9Hd61wFY1AIMZpI4J2plqWw?=
 =?us-ascii?Q?o+KzLnVin07Lgyi5sYDVuXTBVrsegVUV216yrVGBeDbVMzKDTaSm3gnKhIeC?=
 =?us-ascii?Q?MaFzXvgL6mUAjs4sqO88ithBaptOnxQHRDhyeqnrZT9aleczbmLweR1l+gWF?=
 =?us-ascii?Q?NnI7LRPHfxjXE/C1raxSpOb8BSb03cUNJR9R5v7JXg1P7YyJsV+ps+sDCe+m?=
 =?us-ascii?Q?GLFd+lAS+nBr7nu8imyWAIiCtlaWd98rchOx7X6bX3qAj7p3rh6AzRZtXYeQ?=
 =?us-ascii?Q?yApoD36xIYxfof5q5MGFHLZa+4AbY8pJyQwEblfLfNRRlnrNHWP27VyvJFyM?=
 =?us-ascii?Q?VYHaJKukJc1DexdZCcyxRLOdBV6gdEhx1OUMxZ9r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8c6d14-5803-4892-acb7-08dcd14f1e8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 04:14:52.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5lg8OEyikUpYwdD+10eHGMDZwYMnwBqLwF6nDT5+1jKdfSfKS/v70Y79y4aPL2TQVh8iVjjvAgV9SkYzEY9dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4148

Main updates since v1:

 - Now passes the same number of xfs_test with dax=always as without
   this series (some seem to fail on my setup normally). Thanks Dave
   for the suggestion as there were some deadlocks/crashes in v1 due
   to misshandling of write-protect faults and truncation which should
   now be fixed.

 - The pgmap field has been moved to the folio (thanks Matthew for the
   suggestion).

 - No longer remove the vmf_insert_pfn_pXd() functions and instead
   refactor them for use by DAX as Peter Xu suggested they will be
   needed in future and I see there are patches in linux-next that
   call them.

FS DAX pages have always maintained their own page reference counts
without following the normal rules for page reference counting. In
particular pages are considered free when the refcount hits one rather
than zero and refcounts are not added when mapping the page.

Tracking this requires special PTE bits (PTE_DEVMAP) and a secondary
mechanism for allowing GUP to hold references on the page (see
get_dev_pagemap). However there doesn't seem to be any reason why FS
DAX pages need their own reference counting scheme.

By treating the refcounts on these pages the same way as normal pages
we can remove a lot of special checks. In particular pXd_trans_huge()
becomes the same as pXd_leaf(), although I haven't made that change
here. It also frees up a valuable SW define PTE bit on architectures
that have devmap PTE bits defined.

It also almost certainly allows further clean-up of the devmap managed
functions, but I have left that as a future improvment.

I am not intimately familiar with the FS DAX code so would appreciate
some careful review there. In particular I have not given any thought
at all to CONFIG_FS_DAX_LIMITED.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Cc: dan.j.williams@intel.com
Cc: vishal.l.verma@intel.com
Cc: dave.jiang@intel.com
Cc: logang@deltatee.com
Cc: bhelgaas@google.com
Cc: jack@suse.cz
Cc: jgg@ziepe.ca
Cc: catalin.marinas@arm.com
Cc: will@kernel.org
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: dave.hansen@linux.intel.com
Cc: ira.weiny@intel.com
Cc: willy@infradead.org
Cc: djwong@kernel.org
Cc: tytso@mit.edu
Cc: linmiaohe@huawei.com
Cc: david@redhat.com
Cc: peterx@redhat.com
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: nvdimm@lists.linux.dev
Cc: linux-cxl@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-xfs@vger.kernel.org
Cc: jhubbard@nvidia.com
Cc: hch@lst.de
Cc: david@fromorbit.com

Alistair Popple (12):
  mm/gup.c: Remove redundant check for PCI P2PDMA page
  pci/p2pdma: Don't initialise page refcount to one
  fs/dax: Refactor wait for dax idle page
  mm: Allow compound zone device pages
  mm/memory: Add dax_insert_pfn
  huge_memory: Allow mappings of PUD sized pages
  huge_memory: Allow mappings of PMD sized pages
  gup: Don't allow FOLL_LONGTERM pinning of FS DAX pages
  mm: Update vm_normal_page() callers to accept FS DAX pages
  fs/dax: Properly refcount fs dax pages
  mm: Remove pXX_devmap callers
  mm: Remove devmap related functions and page table bits

 Documentation/mm/arch_pgtable_helpers.rst     |   6 +-
 arch/arm64/Kconfig                            |   1 +-
 arch/arm64/include/asm/pgtable-prot.h         |   1 +-
 arch/arm64/include/asm/pgtable.h              |  24 +--
 arch/powerpc/Kconfig                          |   1 +-
 arch/powerpc/include/asm/book3s/64/hash-4k.h  |   6 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h |   7 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  52 +----
 arch/powerpc/include/asm/book3s/64/radix.h    |  14 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   3 +-
 arch/powerpc/mm/book3s64/pgtable.c            |   8 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   5 +-
 arch/powerpc/mm/pgtable.c                     |   2 +-
 arch/x86/Kconfig                              |   1 +-
 arch/x86/include/asm/pgtable.h                |  50 +----
 arch/x86/include/asm/pgtable_types.h          |   5 +-
 arch/x86/mm/pat/memtype.c                     |   4 +-
 drivers/dax/device.c                          |  12 +-
 drivers/dax/super.c                           |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |   3 +-
 drivers/nvdimm/pmem.c                         |   4 +-
 drivers/pci/p2pdma.c                          |  12 +-
 fs/dax.c                                      | 197 ++++++++---------
 fs/ext4/inode.c                               |   5 +-
 fs/fuse/dax.c                                 |   4 +-
 fs/fuse/virtio_fs.c                           |   3 +-
 fs/proc/task_mmu.c                            |  16 +-
 fs/userfaultfd.c                              |   2 +-
 fs/xfs/xfs_inode.c                            |   4 +-
 include/linux/dax.h                           |  12 +-
 include/linux/huge_mm.h                       |  15 +-
 include/linux/memremap.h                      |  17 +-
 include/linux/migrate.h                       |   4 +-
 include/linux/mm.h                            |  39 +---
 include/linux/mm_types.h                      |   9 +-
 include/linux/mmzone.h                        |   8 +-
 include/linux/page-flags.h                    |   6 +-
 include/linux/pfn_t.h                         |  20 +--
 include/linux/pgtable.h                       |  21 +--
 include/linux/rmap.h                          |  15 +-
 lib/test_hmm.c                                |   3 +-
 mm/Kconfig                                    |   4 +-
 mm/debug_vm_pgtable.c                         |  59 +-----
 mm/gup.c                                      | 177 +---------------
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              | 221 +++++++++++--------
 mm/internal.h                                 |   2 +-
 mm/khugepaged.c                               |   2 +-
 mm/mapping_dirty_helpers.c                    |   4 +-
 mm/memcontrol-v1.c                            |   2 +-
 mm/memory-failure.c                           |   6 +-
 mm/memory.c                                   | 126 +++++++----
 mm/memremap.c                                 |  53 ++---
 mm/migrate_device.c                           |   9 +-
 mm/mlock.c                                    |   2 +-
 mm/mm_init.c                                  |  23 +-
 mm/mprotect.c                                 |   2 +-
 mm/mremap.c                                   |   5 +-
 mm/page_vma_mapped.c                          |   5 +-
 mm/pagewalk.c                                 |   8 +-
 mm/pgtable-generic.c                          |   7 +-
 mm/rmap.c                                     |  49 ++++-
 mm/swap.c                                     |   2 +-
 mm/userfaultfd.c                              |   2 +-
 mm/vmscan.c                                   |   5 +-
 65 files changed, 591 insertions(+), 819 deletions(-)

base-commit: 6f1833b8208c3b9e59eff10792667b6639365146
-- 
git-series 0.9.1

