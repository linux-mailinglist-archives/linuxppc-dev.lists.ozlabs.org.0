Return-Path: <linuxppc-dev+bounces-3537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E19D78DB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2024 23:45:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxP713y2qz2yJL;
	Mon, 25 Nov 2024 09:45:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::604" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732488317;
	cv=pass; b=n2+h77TM5DOZyNQdy96JIs2MFzG41N2STOcVcB/uNOlfsIwRRTD9jemm49aKmoeNPa5Lvy8bW2wgNB4hp+uExzgh55ValadpW4kYj3cgyrcH4dgnv1et48B1pq0suzoZqZ+bmHN+y2A+aIAvdw9vm0eEZyjwYvKIEvd7oeP9mFE+MJuTw5cF4kgIhOeXntxUntXJutCT/HBjwiYV242kg+npuS2ipVnECvS7n2JLwXMzeHNrmei0Gi90njMuMuj32MU3+JjGsHhkFSLlkM6jZjfn3lt/CLLpY9jRksvuFj50P8T3uas0WSI5T9SyA4lcbx9E3dxyscpQxlXgVqXztg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732488317; c=relaxed/relaxed;
	bh=u0QE3J1WdM7jKNj2BilNkmIsq6SZVH90JFNJu4ZcePI=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 Content-Type:MIME-Version; b=Y+Gb25EPsPneO393y/XG2dgBbWKyAZMqix85rZPHNW7aNDczYdLVRr3btenDtLwuGat3X/6DQ8IUt233jnFzyjr7JCc6zuyBAmns2/+Ya/OGoFBQ0gt4QzOagM+/Ok3Wa6a3F/KIX5YEIiAzdwLZMvvicAiOnPWcgbvk32Ckiad8VVPxgzoc9v0dB+0fZvGMCzNhJ3BX7Rc5crxRWnViBn44Qr0m1DyK1cT9uEGtLxsVo9MzqdYKrlXnCSdiuIea1mBviAp3EvlYUaWJqQlNRRB5GEpIi4QCqxFRinxTYdnl3SeHfRjQO6Pu2MizEWVf+2YiiLcBiSuR3VULYvi6ww==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Oql5kt1L; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::604; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Oql5kt1L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::604; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20604.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxP6z3ZWTz2y1W
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 09:45:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd1qo9j82+7xPlfB6txnunry9X2ATTDXG1e0xByAdqnZRG3qjv4d/ICVDKvEwhLI44dHpxPFiVP9VjRgR4L18gv8WD2GjfwogjONLAgNLOxZY+mofoM7QeziDcCg3J2NU/cpvQcLQxeDiBsEvZmqqOxfDHLDEWw6X6ybrSIntftkbRea3oihKtULWN0455EN/OZAQgniHHbJUdr+ewd445Ddk9D0X69HoY5RBtemaTIfQdEocF1NrBRR79/Zj7zSAzKxLIgLVdNayNKzVXl9BEC61k8GBcBOZ5h6YgT9XvJgX6Jm3Ka7YsQt3Ycb50pOtdWNRDjglO5puGCm9dFTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0QE3J1WdM7jKNj2BilNkmIsq6SZVH90JFNJu4ZcePI=;
 b=qps/HECtnRQBM21U4zz5zyFg/5LtBTOax82pzbT5/CZiOV5GooHad9/Lt7aEpWZhq75EBPn2Pw6X4p4dvvBsB1O5ZjC8ci0fIHge2eF5lyEAc+cykUT11QSn8nf4m0cvigAtyy1o81MskbYKzCV4Pzk7GfOmggbx/D3aBZsPOkUTgSvcgA2p3Hv4CKv2zgPYfqtfzW/VRM8QrE93jAVnCkNvdCEIeskcK0hF4tHo9b0eppE1BOt2L3P1WPFXoqcvfYu/zbKi9qvTEoZ9URhnag4PmUwdCGzCHX4LAbQJDgqpnRpRTQWfMigaFsms9G4yDd+rIfNOXfWT5JzZjWpi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0QE3J1WdM7jKNj2BilNkmIsq6SZVH90JFNJu4ZcePI=;
 b=Oql5kt1Lvo5u9CHXKYDxpO0fdAo6Nocew8kf+oSQojVmZA6f15PIiX1qd22N4Nz6zF5H602BuaCDJW9Nn5bYlHcOyesA5K+Mb1P3ZXWZ8bJGohdiEc8ZGOPkPcLQTTBBqVe8EYCY4Q83io69LoeYWB7A1gV3LEzGFlahLB4lYTAGFSmPuuKbLcIE5DS98WjVHI0LRkjqnvysbcw87YfCrfI98C3S49FU0ElBxTqJY6sQS9Uc+YNCmbbWE+ZbANkQ6YYm1zJAiOgZVpLYdNrDap9ltX3xTSQ7n48Lj/ZLZf9leQBQSQYuVEHQfT9DhUb75SI/q1yDPLunGkzUOVQTLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Sun, 24 Nov
 2024 22:44:49 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.018; Sun, 24 Nov 2024
 22:44:49 +0000
References: <27381b50b65a218da99a2448023b774dd75540df.1732239628.git-series.apopple@nvidia.com>
 <20241122182013.GA2435164@bhelgaas>
User-agent: mu4e 1.10.8; emacs 29.4
From: Alistair Popple <apopple@nvidia.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com
Subject: Re: [PATCH v3 10/25] pci/p2pdma: Don't initialise page refcount to one
Date: Mon, 25 Nov 2024 09:39:54 +1100
In-reply-to: <20241122182013.GA2435164@bhelgaas>
Message-ID: <87ed30s142.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0035.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:206::18) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: 41197f55-8e94-4596-83a4-08dd0cd99a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SQdupjQbXUDBKMP8At6jHBYgD4Dsp1Ekh/AlAOhycVowikOBhhRmzN1fpU/D?=
 =?us-ascii?Q?mGB77mIjwCCTq2TyNvdVk1QsCBM03xcuJQ3oYKq8s4Q2oT8VpCgJTxA5b0I3?=
 =?us-ascii?Q?wZ0hLrpTCAyyNvL3EhmRmNb+td+qy8LIhfyFhq1b+cIP5etXRCsNaLu6iPr0?=
 =?us-ascii?Q?rGtnqSdIhaxPq+jMWEf4V8MZrkEKkCWbq/lhzVxCzkj0590QXV5vRLlmYzy9?=
 =?us-ascii?Q?fqyky4CC6LXDvzIxjeOWnaLLigatwboOdZEijSrUrbB+cMN2zMsYONQ8YQtT?=
 =?us-ascii?Q?fn8SFkpee2zynYVVSGY0lanssrGbPcnB5Vfbah5hCytCXhh2lrinYk23Tuy0?=
 =?us-ascii?Q?t4ai2tXvnZDsZPWYUE2hKYC8yUt4qpg72B3a9m1m48p3GZLlwKv4vuLzLoFb?=
 =?us-ascii?Q?zd854bBzL1Cw5xKvuY+DP9xC5x7oFo8ON5qQtJNnRRFd1KtZ4tmMZDua+UZC?=
 =?us-ascii?Q?e3gpCY+BIkBYGfNtZUYv23R96EvARDEUIaAMiv+1dCQ77l4esG67xJ5e8e0c?=
 =?us-ascii?Q?vPOPutqmDvoQa8XlF2QsE6/6a6zgFiABNbzZiPFi88k8ZSr2noP12CD9pM1T?=
 =?us-ascii?Q?VvHSkD3vyRJteVJN02CKOW0YNqkV7ibqou1dU/s8YNxxcMtGpNNfFNwDWVsy?=
 =?us-ascii?Q?qpESSCYPv5SHOSMcUjIf65U0aOxKgVEL3Qz9snXWb87UhOwFNZmXjjLtW1tm?=
 =?us-ascii?Q?aa32PFAZ19hzl1l3uQdph8ELHQlHGNjKNi9UtV+YKQyFnuhWX5jFzhuDaejZ?=
 =?us-ascii?Q?YUunuv97utO1ttmNXK4iliJNrrUUSY56jE7mGlBWikx0Ruje500zF4c+EqhD?=
 =?us-ascii?Q?peTnn1lUWp/iGumLvRpCJ0k+jGZmybGzHSnKwkyHnJ1e3BvgSmmfkZpu2cdm?=
 =?us-ascii?Q?vXI4K/oMboqlai8/RhOv3xBbhTI5SXkC9J8aWqh/uzK9GoWAPmPXGV2hCMHu?=
 =?us-ascii?Q?v+GiAOYpKAdkTL+S1FidEvInLWUvXg+zKbML1pkL0uRgwx2RuKCxL1j/m6eN?=
 =?us-ascii?Q?75vy+czvKAomJevQ4ky6ZMABsb0Ass9Pih+7qacfU+vkste2IHSfatMlhLoW?=
 =?us-ascii?Q?NKdBC8SXxdvRQE/U8rLgQ+jzZhT5j0eoENxm5lXy54gB410bUFMY+4cMVMpa?=
 =?us-ascii?Q?MrjF4dlEs53BXAv9811ezx0zyRfjcITDHFtgAobjC7t5mYKXempH9TLBlKFv?=
 =?us-ascii?Q?fapRdja1cXRz17oXj3Qhqpoult4vwQPpmY1rLQ6OgIft7kEeUcStqNniPFiW?=
 =?us-ascii?Q?n+gf2RkWcirj+U03DFjHu1CT6dnlOjakSyGWh8cSrXzKR8e5lFGqZtbJZT9v?=
 =?us-ascii?Q?QxyWO1swRiXXmK5pAk6HiR0RHeG6drAceEooINXMouhV1GJ9wH2QH3ufjUEg?=
 =?us-ascii?Q?Whu++pw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gzfwcbVtGjHfUlO1myAyhYK7Xk8LDiw1rPsr0EATWKyG/HwfFLAwppKvMbVK?=
 =?us-ascii?Q?k1eErJuHq3ACCCIyIfK92woa4VUQhw1RW5qF4rbzi8r+jYnXybpfTfow3Mxk?=
 =?us-ascii?Q?nuOU8CfFdBkoAQNy7YroY+SpUVmrKmKqnED5KHb6jlmfXUROaqMwJWTvrgzs?=
 =?us-ascii?Q?jsBn5u6Ce8mtOzBPpHMiiW0U4TZRxG6RTo5hdl0XmkklP0gTYB7AU6fgdC+r?=
 =?us-ascii?Q?UxgxZfCl7RVaCB2oZYbvP034OrcbsetDtB7kbLKbtwI08gIPvZcJh0d1F6Nx?=
 =?us-ascii?Q?sJYPpngTmb6GJGrBC55K3nG5t7700LUC3UPuHVtHzwGvRuSpkfLKJkajg6uD?=
 =?us-ascii?Q?xSsBi/aC8izVhndnF7+7n4KtsmS/uryo/htfvny+PdnHC1dK0hI4hqE40IAG?=
 =?us-ascii?Q?Jim1NamIezu5yG7QwzVwHDsZAd4kowZpDNqPw8eVNetpzkCNZVet+Z5CEpnz?=
 =?us-ascii?Q?sLMldADIzBuVJjy6ka2nxlZ2We7DdXo7dnjE6+xEzSBuKqD/6mIWpttiuBzi?=
 =?us-ascii?Q?ChX4n1djkSNTI4c6C+B/YyaLjFzeX4hdfpDXRnVrN8uGxXGyZ5sxdQxx1NRg?=
 =?us-ascii?Q?bMSNOe8SHg4/fOc7WYpr1n0/SJN7wEwrcIva4LcC0DiTn4V7ktsU20FdxmiM?=
 =?us-ascii?Q?+8UnvBBpYRnX9tdQ8qn+n5/S1FMBLLX3Wt4FONgf0EblzW/dqFt2bhzv09kD?=
 =?us-ascii?Q?di7BO87wz7J9nLGJw/Xjcya2bg/+UuxMvuGYRIgjUQxWKmoOhvsFkxC1JDy8?=
 =?us-ascii?Q?A5U40OztCqj+MTkva1axApfJHUsBiJOj/epWgJWMnI7uCxerlJTy/SC1fZoV?=
 =?us-ascii?Q?ro0fJsa9NitAwLUSQiRNFY9rmIq5TOy5aU8I8DZ08PcCekOgKM8QL7+9y6kq?=
 =?us-ascii?Q?YYK/XyUA5XWNxARRjQsyohzVMSXlltyyG03renjRjQK2PwOQi6VTgF5AJJNm?=
 =?us-ascii?Q?ju58FhDyz9FH6GgjgmcFLu+yFuKFf41mt+LfANyN1npSNcTYo4uAy5fnmTAV?=
 =?us-ascii?Q?P6cMAqCybpNwLLsyFVEJgdYqTmW0TNVgdREAqutMmg42qgurcyqO6eztlBd5?=
 =?us-ascii?Q?35iXZPcyOscEIqaIRJZIMj/X9X6CtPexLs8CInvwtUOdTO27vosdXAhv90sF?=
 =?us-ascii?Q?ELB/5SFk7oUg72srSbNCRZJNzqNmg5KFRZNd5GlJYYlDdMpJt3QNIrdHupPo?=
 =?us-ascii?Q?vMI3fsdl9/CoBfeeN9ePdhBq3RqB2IZak8uTwBuRa/qcxVIFkEDaQ6Y8FDjA?=
 =?us-ascii?Q?ex65oVzawFKJlztbwSNQTVNhDqMFzE1UybkoRM0V33R/j6DExIMpczhPAvPX?=
 =?us-ascii?Q?Mglh1+RtFbrbFDEI2DhTwL3q1RbslBSUPoRO8vlJn1TyPF4NdBfTPPwSpowR?=
 =?us-ascii?Q?sbfCmGJ32/qGMu2sw98/kHYw3eXZmUco11VtTx+bjL/mMcqpIR6gsu4Ozzji?=
 =?us-ascii?Q?1JUzS1mAJ7uPfSZbH1koPMgXo4dsVakhLtT2zZubieNOPtJKBoIy6mtfug3f?=
 =?us-ascii?Q?tH8BhDN5VaZ9Hl100UKbCD87ca0pM43qiCQYJR1GXBd/zQ896iz7AKlkk0FK?=
 =?us-ascii?Q?a2booJKTryCsUdOdoGyL7fRtnsNb3sM0T/ideNb6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41197f55-8e94-4596-83a4-08dd0cd99a3e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2024 22:44:49.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BC8pCDxCxdfKnPPrH/ZX+H1JtV0tDGsYYa/Gg9RF48lJ+M0NVAuyyZz+50q227Pw6KXv9eaoK3eLoW2lBmwVxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Bjorn Helgaas <helgaas@kernel.org> writes:

> On Fri, Nov 22, 2024 at 12:40:31PM +1100, Alistair Popple wrote:
>> The reference counts for ZONE_DEVICE private pages should be
>> initialised by the driver when the page is actually allocated by the
>> driver allocator, not when they are first created. This is currently
>> the case for MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT pages
>> but not MEMORY_DEVICE_PCI_P2PDMA pages so fix that up.
>> 
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
>
> Previously suggested tweaks to subject line prefix and content:
> https://lore.kernel.org/all/20240629212851.GA1484889@bhelgaas/
> https://lore.kernel.org/all/20240910134745.GA577955@bhelgaas/

Apologies Bjorn, I was so focussed on the DAX bits of this series which
had grown significantly and forgot to update the P2PDMA stuff. It's
largely independent of the DAX changes anyway, so unless you disagree I
think it would be best if I split it out into a separate series. Thanks
for taking a look.

> I had the impression that you agreed there was the potential for some
> confusion here, but it doesn't look like it was addressed.
>
> So again, a PCI patch labeled "don't init refcount to one" where the
> content initializes the refcount to one in p2pdma.c is still confusing
> since (IIUC) the subject line refers to the NON-PCI code.
>
> Maybe some sort of "move refcount init from X to p2pdma" or addition
> of *who* is no longer initializing refcount to one would clear this
> up.

To be clear I fully agree with the above, I just failed to do it.

 - Alistair

>> ---
>> 
>> Changes since v2:
>> 
>>  - Initialise the page refcount for all pages covered by the kaddr
>> ---
>>  drivers/pci/p2pdma.c | 13 +++++++++++--
>>  mm/memremap.c        | 17 +++++++++++++----
>>  mm/mm_init.c         | 22 ++++++++++++++++++----
>>  3 files changed, 42 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
>> index 4f47a13..2c5ac4a 100644
>> --- a/drivers/pci/p2pdma.c
>> +++ b/drivers/pci/p2pdma.c
>> @@ -140,13 +140,22 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
>>  	rcu_read_unlock();
>>  
>>  	for (vaddr = vma->vm_start; vaddr < vma->vm_end; vaddr += PAGE_SIZE) {
>> -		ret = vm_insert_page(vma, vaddr, virt_to_page(kaddr));
>> +		struct page *page = virt_to_page(kaddr);
>> +
>> +		/*
>> +		 * Initialise the refcount for the freshly allocated page. As
>> +		 * we have just allocated the page no one else should be
>> +		 * using it.
>> +		 */
>> +		VM_WARN_ON_ONCE_PAGE(!page_ref_count(page), page);
>> +		set_page_count(page, 1);
>> +		ret = vm_insert_page(vma, vaddr, page);
>>  		if (ret) {
>>  			gen_pool_free(p2pdma->pool, (uintptr_t)kaddr, len);
>>  			return ret;
>>  		}
>>  		percpu_ref_get(ref);
>> -		put_page(virt_to_page(kaddr));
>> +		put_page(page);
>>  		kaddr += PAGE_SIZE;
>>  		len -= PAGE_SIZE;
>>  	}
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 40d4547..07bbe0e 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -488,15 +488,24 @@ void free_zone_device_folio(struct folio *folio)
>>  	folio->mapping = NULL;
>>  	folio->page.pgmap->ops->page_free(folio_page(folio, 0));
>>  
>> -	if (folio->page.pgmap->type != MEMORY_DEVICE_PRIVATE &&
>> -	    folio->page.pgmap->type != MEMORY_DEVICE_COHERENT)
>> +	switch (folio->page.pgmap->type) {
>> +	case MEMORY_DEVICE_PRIVATE:
>> +	case MEMORY_DEVICE_COHERENT:
>> +		put_dev_pagemap(folio->page.pgmap);
>> +		break;
>> +
>> +	case MEMORY_DEVICE_FS_DAX:
>> +	case MEMORY_DEVICE_GENERIC:
>>  		/*
>>  		 * Reset the refcount to 1 to prepare for handing out the page
>>  		 * again.
>>  		 */
>>  		folio_set_count(folio, 1);
>> -	else
>> -		put_dev_pagemap(folio->page.pgmap);
>> +		break;
>> +
>> +	case MEMORY_DEVICE_PCI_P2PDMA:
>> +		break;
>> +	}
>>  }
>>  
>>  void zone_device_page_init(struct page *page)
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 4ba5607..0489820 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -1015,12 +1015,26 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>>  	}
>>  
>>  	/*
>> -	 * ZONE_DEVICE pages are released directly to the driver page allocator
>> -	 * which will set the page count to 1 when allocating the page.
>> +	 * ZONE_DEVICE pages other than MEMORY_TYPE_GENERIC and
>> +	 * MEMORY_TYPE_FS_DAX pages are released directly to the driver page
>> +	 * allocator which will set the page count to 1 when allocating the
>> +	 * page.
>> +	 *
>> +	 * MEMORY_TYPE_GENERIC and MEMORY_TYPE_FS_DAX pages automatically have
>> +	 * their refcount reset to one whenever they are freed (ie. after
>> +	 * their refcount drops to 0).
>>  	 */
>> -	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
>> -	    pgmap->type == MEMORY_DEVICE_COHERENT)
>> +	switch (pgmap->type) {
>> +	case MEMORY_DEVICE_PRIVATE:
>> +	case MEMORY_DEVICE_COHERENT:
>> +	case MEMORY_DEVICE_PCI_P2PDMA:
>>  		set_page_count(page, 0);
>> +		break;
>> +
>> +	case MEMORY_DEVICE_FS_DAX:
>> +	case MEMORY_DEVICE_GENERIC:
>> +		break;
>> +	}
>>  }
>>  
>>  /*
>> -- 
>> git-series 0.9.1


