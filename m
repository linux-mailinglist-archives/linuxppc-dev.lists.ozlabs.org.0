Return-Path: <linuxppc-dev+bounces-4227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7309F4200
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 06:14:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC4kB0XjCz301x;
	Tue, 17 Dec 2024 16:14:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734412482;
	cv=pass; b=hWTGPFytM+mcgmYGKfjM0oU6PYkQ/8V8tooJO1ueehv2WcuHtGcjWkZXs13ghtYCLWGW5neY48wX6Pke+kKw9AuRmFgCg6cBYK82PFBBvmUePl6ckIomVH2mYAA1ZnX3nl/gvjvGdmYQQ/xtRiXeygiZ/wnuqhJLZhNUm/LGF205wT+JyD7pn1iMfDfAsTQBZSjGhYl+DRjuWcxm7vtKY/kYREEAu7rWvL0z1HBk3YbREhFIp6rTq5y1cgqJI5zOh0ytn7vcGbAF41lrjC6aPwyIWT4NNNPPnFXCoPUgn5KlX9h5fK8+u3IcbrzuRMBUjZUEr7WTcnGNtdPHk/2NMA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734412482; c=relaxed/relaxed;
	bh=rWLD/0xp0BR6MUjdXJUQ+QA/Pxu3/82VW88rj0w5N0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gjjmc+pUTBEh5gp8ye2ua1AtEru897rVQsjJafOb7zXign3x9PBmO8Z24scDNyhR066kp6xIHGdlHdIYEoE+GrKl2/a+4hmXxLI5bmxPHRQe/arljFEwiU20IPJXqW0pMTxJIK7pgu+tkaITXc97SdmjlS0xDGTV7ZxyPiVeJ9rYeN/bWs383LtT5cerNO39oKCisZEIrw4RlaFqUDNMc4Y9ahrnc2SEp3mBPnA5qa0amZ1jkGh0LLtWtILzXr0Sw08/gvJPbCngS+cnGLLkQV83IvIcujw/N2mRYmg6IQVOpVIN2uwu3tyjYbcOlfaWWMT301pSjbBn3Hyebp8wmA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=robvJ7UX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::603; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=robvJ7UX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::603; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC4k91m9xz301B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 16:14:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuhAM4Lz3Lzkh59oZymTxkTQb/yV6rdBlqoY5Vt4hvXq5zzOBADgffLYZZ4h+Y91XpPgn50XXHJdSCovO3Qff/Xq6uE2bRG2MCyUQu9n/e64e4BmB5OKRBFLcKbZcPh+veVdf8siZ3HiR+W+huvY63712MD+muFLidjP12iV56e7xwThfeLXco1/dsC8bb3N1eZL3quw4ngezfux4kDQDrr3xU/Jrn+dxY/kFjGXw0ok7YBTD2Hu/gMn/rJB6wVDfM8HViRfB8vQGH41P2BUNPS2WEIhj7cAwO1FGJrpdql7I0Ys/a28iqI4/Vr1cPDTQ8+dnPeuU3BxrMFfwHQnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWLD/0xp0BR6MUjdXJUQ+QA/Pxu3/82VW88rj0w5N0E=;
 b=Q2/e3YmzJHJxz7CHu6bw07MCFUz9gY4CH5w657r8DGXbUrUCbXbQPHWuU81+O8y/S3x+ISQV9LJu/tcvxsoTqC9mlGqaAwv1nYyubJyCpchx6bsNxmmOKSax9o4mCkX8ZKETAS2V1B3xKRpcUlFdPgTVNLshMeSwDeEXWA7NCOy5yUb2KZHKtUczC1tRnS+xtw3xknLDIHolONn+DCJBiYphEIdvABgVXiwGDljlzRZ3WpOh6uqEQzrYjs1R7Lg/RSz0PGH0kwS/JxyLfodoFKgMR5z5iO+nt+w2+1b7eEpKnTY5vhTeyeM7u3z3gRL8D0fo97RnDmAs4qT4qmiL9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWLD/0xp0BR6MUjdXJUQ+QA/Pxu3/82VW88rj0w5N0E=;
 b=robvJ7UX4m02ou1t8/5gJJxqgqpgOa8hm+sKcitjmnnESl6NsnLDQYg6K5Hek3L1CV3S3lVOOUe7gc2iNcPgCTaWwLby8LWASzaimFnTOv2l/9FvPTbsrmP4Wjo3WMg26tPv8QD7Lglaxhh+orNmPTS/eVXuffFWGK1YUSZG37CcqPIRapI6lz3saF+M07y43E9HUa6WOAbWmSKWYLzYORjx8hBxCCZMTKXqlDCfknCyLZdGME3s6o4ff2UE4DquhaDsWAWbabzAXuU5huyr0Zpt6GXUvRjF3LdlIF+ARbjahFmhfK35lS4u8lAXskEFqGa429QBSkyJr1zomq2xzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 05:14:22 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 05:14:22 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
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
	david@fromorbit.com,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v4 09/25] mm/gup.c: Remove redundant check for PCI P2PDMA page
Date: Tue, 17 Dec 2024 16:12:52 +1100
Message-ID: <3f20b8d258d4eb72e1eadd5926d892bc61f0e0d4.1734407924.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0043.ausprd01.prod.outlook.com (2603:10c6:1:1::31)
 To DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f9a3d2-d41e-4f69-cf41-08dd1e59aab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KeXdUNMXcMsffmqLV9xai82k9RB04qFYy6FM0459edjpdfrwrFxHFmcrPjFg?=
 =?us-ascii?Q?pcFzrHAT6nldxRu0GDOwxaLS/wNSqmoAUpoR7FBsy+s+2+at4vni1uNIbz4b?=
 =?us-ascii?Q?RZd0UOzteWy4X85GwtCCCzaRd/NfKtWbRd3NzplYahNIgRh5nkcyssAh0T6c?=
 =?us-ascii?Q?QQuOXk/uSISoIhpO58NAEtkCnRwn9Wxrh0tGBLDhU6rUdhAt/syKTuoPG7S2?=
 =?us-ascii?Q?aIuyJzxxr6ot+nDkyWkiT+EhdZr0NoK9nMObY1jFdO2zL4sEUhZAus5ClRw/?=
 =?us-ascii?Q?e/XDWo9EZKtJXv3OqNaN+vciaLLQQg+BK7sauALve4sBtlT5GCjd1ms7Skya?=
 =?us-ascii?Q?WPJZRoe4zumnE9w8YyNiCcubkxverJuV90qy62SJ3MqoTz6LAJP3sLU+X73Q?=
 =?us-ascii?Q?WhmUwC1tu19Dqf1NMVcTj6V6UfPvHEFyiBZI92zHHANHNDKJg8qk2DUI0QQG?=
 =?us-ascii?Q?o5JAZ9CXjlGgoVlGD3Do6nhU+VSSiXchB3umJL5FrEYTO/OP5/cFFe7QuPUo?=
 =?us-ascii?Q?XSZVsrORqRaZzZnWVfcbELQj4PtrOjQ4Z3/+RFfE7j4kSU4CljLREhSEWtyH?=
 =?us-ascii?Q?4UtaUxw3qkr1mZbK6ieFzP/Ai4oh4zCdePpQtsFaemn1mSntcF6AGnLBagw6?=
 =?us-ascii?Q?heLV0vTLF+KTDzypvWB2BBoUHymAPKTC2ZcXL4SKmNHbcVFCFl8aVARgWIP8?=
 =?us-ascii?Q?Usi/YizZkX6az2rrbLjVba3tt+itxb6SBhlIx43ZIYyC5JiOwyXZ6sCo3TTR?=
 =?us-ascii?Q?AlkPm+Fnjmo20ZqhAErN6tX/ihQLB/QljGPtobfIgsuxfXdIqWRBJQQi7CyV?=
 =?us-ascii?Q?AHp+/Bemt6ZP+uh9qOYMk97YY8FryltMe7E2n5sn6F0QjThWZzRddOMkDrgO?=
 =?us-ascii?Q?CMsaOtiZkh3X2fAl6rIdYgUbHEXQ9xOz98VzINvhTLxF4h+mOJt/JJXY4Di2?=
 =?us-ascii?Q?bCDRE1T1SVVmhvRYQcIdv6XGgjS9MHNFvzy33Y1aWswB7XNmQJJj54xV8twR?=
 =?us-ascii?Q?a198kV40uLMI9pcwOPJcgFadxVe26ztUmohXzZA0+v5wYwEWoYiRR95gG7Z1?=
 =?us-ascii?Q?dFKSb5KJ8eFXu/nf8d4W+FPWkZNz4clrlB4OnLvS5XRflnS9jTR90RPeSRws?=
 =?us-ascii?Q?K2XmwKdclmb8upg/GrLotqwUg0Sc77GnFS8W02ZiwczW8rpJ7JzdbHO/9zs4?=
 =?us-ascii?Q?ntxPsxDcQ4F1FsSwpd/C08+yoIO9mqUkTxAv73NbUDoIFK7Nbny0ijcVTvE7?=
 =?us-ascii?Q?1vzlNHqf6bjjECHkyM2JWP5oNt+YDzf1XrAvqFjjmDLeDLWwRcoJy5sNS1iF?=
 =?us-ascii?Q?t2nFmsuCD/IOm95zTaecbu6Wls/mGggp46JIBnreWRce0aPfVA+U7MYET/Rd?=
 =?us-ascii?Q?bOzdz5lqZ3O7yY8g9TZbYgLmXjV4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WBoQrfBQeZmgmNQcOX4zvM+MvaGtbXdAx65MIguRpaPV9yWKIMfJ7tQl3Fg+?=
 =?us-ascii?Q?90g0i1eLZJPLEj9cjkDN9NeAD3COIVz+zBCVvkpgaVu2EDb3Y5QPMb9YVhkH?=
 =?us-ascii?Q?Byvjv6Fu7DOLVHyPEevZMudZYyWF6pOshjSaO8OHSmNhtcXX+K70unyPY7z9?=
 =?us-ascii?Q?GtHyLzCEnxLU/HPxtZudRjJVPDI0wqTqb77s/fCBDvtylRxP0qBqusauU+f6?=
 =?us-ascii?Q?NSFVHM+5Wa6Vjj0voHtrlgto9YJ8U1O3dTxhcy+sqAXMy5YNSvmeRsDMJyJc?=
 =?us-ascii?Q?jTrjgevC59zwgCBYoScjLwtsrAtiJu2eJJc6Xm9YsWy88q26lUNj40CfhBme?=
 =?us-ascii?Q?PwTk2axAnTFvGC5rLzbADkBipZWN6VOJcHkcbgs/ZVeIIqasjwnce3BrS20C?=
 =?us-ascii?Q?baGZfFsv/plv9HpSnzgZqDOGEfIR+XVXZzlQlcfH38l36Wdz4HTAddAWNJFn?=
 =?us-ascii?Q?JIdCJviKg/ALyJNEgHAz3f6nk9K59zgI+akKdjI67wRPn7Zp0ZdAPOMpr3t7?=
 =?us-ascii?Q?FZBfHkqyFzDVsroILZdX9SQrEr27A3VippZp5CtDGbrw7WLdNsRdJ0nqS16U?=
 =?us-ascii?Q?lv47nkHFW3D/l5iQe1oyJ7tbkFC/OA3FNZI+f0/5JJyOIttSdQYRC5Nm90/s?=
 =?us-ascii?Q?D5wR9SbOH5/OK4AgrWnNimr/vZss7lBVydSbAVxrYo0RF3TR6hi0GwjZDWux?=
 =?us-ascii?Q?j4h88A11n01GpTgA6w3nth2InyUR1ZmFvbSUG2GVA8HKVlDlftlrTR5tU2v1?=
 =?us-ascii?Q?i9x+s45S/5IgNagJ69ODd3x0rvc8orULaHJioIIn9FtMtPMhiAFv6zy+L33P?=
 =?us-ascii?Q?vsKgQcF6R9vLol9KPjknzg7QnUj8Gm+jr9S6Q13BDEYtFeXdyCxt2B3cDxGI?=
 =?us-ascii?Q?Tk2A5f1lN7KN0qw7cZ2yawegPWYhtKLJRl6fLYLnd8lhajJ8U3k4UudSpXWx?=
 =?us-ascii?Q?oSOh8h6N80ywRyZGOyNZNCtsdDEai/DPASlL5Q2YslEj5/0ZIukx/PHPgc96?=
 =?us-ascii?Q?8M9pzgWbvSrJWgjsblQOoHbWS8k7Eb5lAH9HO60HtEUsZHNksD2DBPXqpfu5?=
 =?us-ascii?Q?Jh/cksQy7h04nG4/C87Y50pyqo1jtsbskrcXduooFyQMeDD71g8pp2+2GPcg?=
 =?us-ascii?Q?rb+NTzGUMBVwD57zENxVtSn2v1G2QkYVzAP82W8l7LHHwmz2kvw1GkSMuUsv?=
 =?us-ascii?Q?dV8KTp+G7JZyY1e/aT4ZUgMKiejQjDFCQYtnIltUswkoA5RM9S48QUS2/LCs?=
 =?us-ascii?Q?a/+AKWu/GRTK1kzUwiTG/dVs5KtbNvVSpX+69Jcx6TTOeDlGEMYDeUEesGoe?=
 =?us-ascii?Q?iPgzafhT+HZZzeKUyFLAiAXR1U84uBCMX9ZAPC0VxwIMWLYPCiAZZvgUpMy3?=
 =?us-ascii?Q?+zzj6SpzyJjvujzr9UZmapSYMnuhptYaYktbNV0UBj2Qb/5R/FCcSXvMghJe?=
 =?us-ascii?Q?qjxzqPOy7UuGKJoT4Qh1TBieS1JdJ+csjzqMlB5F5Ly98vDebaJ2LuJaZRmz?=
 =?us-ascii?Q?FSU9kyfxKRpi9SBZH8nGnv0QTlh6X49SmN5LwU3/HFOfY2h0GyxcFMDvAQiE?=
 =?us-ascii?Q?yFPTxlt3cewmpFX+5WKNRhCB5pYpSMfLuSR4Fqjt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f9a3d2-d41e-4f69-cf41-08dd1e59aab0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 05:14:22.2245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPj3/J6ZZvczFuiRCWVB0Ngx7fpRmpSVxMqP8vhMMljvOpS/6xepKzVErcVcxLNsIy8Xs8wegRtq3Yt5NF/4Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PCI P2PDMA pages are not mapped with pXX_devmap PTEs therefore the
check in __gup_device_huge() is redundant. Remove it

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Dan Wiliams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 2304175..9b587b5 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3016,11 +3016,6 @@ static int gup_fast_devmap_leaf(unsigned long pfn, unsigned long addr,
 			break;
 		}
 
-		if (!(flags & FOLL_PCI_P2PDMA) && is_pci_p2pdma_page(page)) {
-			gup_fast_undo_dev_pagemap(nr, nr_start, flags, pages);
-			break;
-		}
-
 		folio = try_grab_folio_fast(page, 1, flags);
 		if (!folio) {
 			gup_fast_undo_dev_pagemap(nr, nr_start, flags, pages);
-- 
git-series 0.9.1

