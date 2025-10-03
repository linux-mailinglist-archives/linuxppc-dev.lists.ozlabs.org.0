Return-Path: <linuxppc-dev+bounces-12653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C98BB7452
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 17:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdX2C0pfsz3d9H;
	Sat,  4 Oct 2025 01:02:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c101::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759503730;
	cv=pass; b=VQVI3cZBnCtx3LtFoDLLMO/ZF2x83kizw/XrQpoGFGhYjiUSrUYGDUQmqm3Rf0LGm5rZdkZyT1vRuLMHmltTGFMK2TA9AYzsToRXUkGdHt08B9kDMgIugLZNSW/8/dgaB8a7EwpMT8M8a10BE55/d6l4/uMerqehZ3HL0M0+CTU35L80U9zTQXPYUAN4gPsu76JW8tycO+nxAAUphduFgWSI5Gieu6046BaveEc5kZa2dm2SFY6uYSJMUwFHPcqnF8XKqFrXxv2euCtf8/rIaSnkgxAOuenDGo1vr5N8ETolvcRheKWQMr4qu9l+fqGnn1k+B9VcflpG1MAI/Tn6Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759503730; c=relaxed/relaxed;
	bh=fsuqmrBFlwfbzpdvfnwFd/qS1kt2Xi7ZRb0POdUc6Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CGGuWXtuFWVXjb8oAlkjY2Bwy8Ks37bAKee0mxKdeqZH+FB4YMZRhNohdCbDVVWkvqaH4So9uP/gCUPHQbAxvAVxO7xePVaD3pXgSYpEY8gd792YlcM035wRhYpvuo6ku8+DQpo46hlr/Ed+i1uDAP02QsJonYIqrnLNy50h2DDdeSJUvWLDvpkA/DtXOgBS5oTTpn8Z3mbYEP7o0mllFjVymlo5CbT4IWPPm/iGQLIlOSbsQwYL4rrF1M19o5TRHb4QYtLbqwqsJiMteqyf9Wg4OG9aJtYlbS9EE1QRVqK/SEeYwkWs6Ki99pG0pJBgps951Do6jN7k9P2oBdsUyQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vfhkqua8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vfhkqua8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazlp170120007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c101::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdX296m5vz3d9B
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 01:02:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2C7FAS80d/8xmmWNKvVsZc0PxzbQ91CN0hf8aVXmlwtRQAdskugRF42XxNc+9gVDzvBcLafJ5hkYIaZxuX6Wqahonz/tSjzLmZNUkJVndHfYNBxJ02DRwAr5DiiAMqK9PGteKtHX9xDPikk+vU75nsePrVj/Ao34zDuhJt5dhdCQYPRVLtqpZk7pdiAGckFPtKHNPfcBoxeC/3M5knpiFGVYAEYTixNoOPhNgw9tVg9iO/uVeH5FEY8zJ748hhfJSC92FtO+pF/VvOCRy8ytSbtFzEQ47i0aHou25Hw4WVkz237qnrF/GW6N8rfUbkVO+rsrQMBfK8jAaCve2ccAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsuqmrBFlwfbzpdvfnwFd/qS1kt2Xi7ZRb0POdUc6Aw=;
 b=Zt85PuSEiep+n6tU8auKTaoj34VhSPLfq9p562ei29agtEI/Jb5J1mdIA19M+U2tzLqdVvyE4JyFWAtnuoxq6GGDqfnsAFz7LwbipWPEPQoDPS+I/39qExsglrrYcL/q9Hub2CwwL+vQnAW4rb+ogUUyvzwCWjk1WcAEG9DcFSr1OkpeFu2/KP03VEbA986meVgBW+Dk1BfMjTAJBBs7nUcwzp7w/KXp7PCxTjltUxyKZ8NNWu+8RFcS4SmIA4CpoueKZMF0P7LFRYaXvFI09ugz8fbRUQVDKDuQA2yl3ABgJkeT5xnOpblYbi6Np9f48nWDG72dBsbMQXVgR1DknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsuqmrBFlwfbzpdvfnwFd/qS1kt2Xi7ZRb0POdUc6Aw=;
 b=Vfhkqua8/TmFsRAnPNsfg4Y1NTi2LCSoD87EPKFC3acT5VWx/2ygbjb7UKld55kUtvZ0gZwfQb27YtSpCikCr8oWZqFU7qfXQ6XkHq8to5azD6zehO+STrmak+PDGx3wfjhqMuznaXXzqJqGUZsfSpxpQ/rWRbwwnaVldMrdiTMI4clIVTQ0AK9iArC+EA2RQ/7v8SDf1JR5PEYYi78AAx9ZT9RXG52MlmxnTSh+qY0hkRv1FyTVa84oIX9kRMZDJNketFrfghCcHX91AEu44g1TwD95hqAAtQTmdy4O0Fs3ZYgZNow8QkYgLuCiXk4TRshA0/SnHHJ19huaiTcmfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by PH0PR12MB8099.namprd12.prod.outlook.com (2603:10b6:510:29d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 3 Oct
 2025 15:01:46 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 15:01:45 +0000
Date: Fri, 3 Oct 2025 12:01:44 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
Message-ID: <20251003150144.GC3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BL1PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::20) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|PH0PR12MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: d39aeef7-5934-4f8a-f2af-08de028dc53b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vNpjJPqDQn+WUgcK0SQVciNcoHk4Chyi54klc5Y6C8xGfiWRbekVDrf64Q/p?=
 =?us-ascii?Q?1yKPqIQJDzk/ijNNk+zLBHUBe2wkZMCAz2hhDVcE+seqJTzso8LsW3i1d2RO?=
 =?us-ascii?Q?PvrPA70VhBoK8XG6P2GAMNL/s25nt0uQBRsA6C/s+/W1hnT8Q5CRy1ICR3/i?=
 =?us-ascii?Q?glKJp1dhOV+LxWlFSPlQFo00dLwuIMIQW5iWoA34mS6Ma7NVIp/XuNfSSEqY?=
 =?us-ascii?Q?mf/09aK3YgBm7MkMjP/WjoaxrW5slmejUVO/XRqE/Z70tZ/fZnZ+V2dQuBme?=
 =?us-ascii?Q?sa4rL1GV0lfNrLiEaT+p+ILldSc6z/ghxthGrxJx8Lsf0iLdKN+11iqiEXVN?=
 =?us-ascii?Q?Myk3XNJK8IiFoDlQmo0FbWSdiOyg+AD+cmCUn7XKrx5y/vsE7GTn70JDo04y?=
 =?us-ascii?Q?nooRz+eQcs4xgGNaEqomV0q8rXvvzcTy0vUtwMXlbNLhJW1DBH9xgzhVS+lG?=
 =?us-ascii?Q?cJ1/afH82tBFrDGQlrpt+d7PVqL2cjMDiO7TR99YzP4yYJkeQCXDTbGxh5EO?=
 =?us-ascii?Q?EbqrMQFWwIalRMsk6IowMnTtp+cyGWV36Y+WpX9aR/KSdNAAEgDrnNUgW0wB?=
 =?us-ascii?Q?mDmswZPEXFD9wH4s0DAqXiu0u62d+E3CqPqfZBi+eBIeHcpL08l8lsXdi/cz?=
 =?us-ascii?Q?dYcOGTX15EgwoqojWPF9WOJI6fbshgEhc1euXnRA0XdId/mZ4kfJ5LipZwSZ?=
 =?us-ascii?Q?aNzlnP2sXNWs8u2h5spxLJKw8rmUFBkpm/IwnqQsYm+p91vdeWbsJ5dTfeN4?=
 =?us-ascii?Q?IbcEzcZ2eaIpo4DN9hIJPFgvAICUvFpOHN+ljbUo6fj7kEkhDOpeSSlBRM1c?=
 =?us-ascii?Q?I6cH23sSXlxJvvy58No9kBr+cO3oZYNh+VC5PiTcfnl1ojMNpN7o31LOrrDG?=
 =?us-ascii?Q?vv85TCEonxqMkUlC10I/Ln6pFWyRZdrnPQBjGBVynZDAchq23Cfa351DVePQ?=
 =?us-ascii?Q?XFSCCjNszyaUSuKUfnMVQx9xykaSAHc6X5Sb+36dzGF/yeATwVbtyThQABIB?=
 =?us-ascii?Q?HzedVzcG4u5WPHfsYCtJILieQTfxYmtrk536Lbr7WVwS5pIQjyGrhys3arkT?=
 =?us-ascii?Q?i5bJ/px6tcNw3cZouT6GLZ9M8zKWjG+vkFEL50fcHps4e+a/YWe5e2EFvDXM?=
 =?us-ascii?Q?lMzRIS4O1dvYGel3OdqGuguQtlNSyCBOCKI9yq6bslb/LxasMWQKx1IBjzzw?=
 =?us-ascii?Q?23GrN/JFP5CbFB7LjsHreBSfw8xH2L3csTGIdcZfDThlyW8SYw/pJYhX2WqO?=
 =?us-ascii?Q?RF3QmlPYgdi2SA8hUFLn9kCDq9YEk1bAa5IEd+xpeO3/nQQRIKD3K8px8dXX?=
 =?us-ascii?Q?cfQmgPmZEU6yank/bjcHy3kbN58zSzPyTu8ThMkZynZTKf5VJkp9jHepXjfh?=
 =?us-ascii?Q?HgpHkUO6SIEMCjzgiEdeS1jFvYohHhgxOOD/FwGWpWKb9fHx48r+mWaU9egO?=
 =?us-ascii?Q?hVD1ZkW0qdrWvAEth90gZFfuYT0Uo6Fb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LJ7D6TypKQFtFF955g0wVEF93OAnBgU960gzotDze+EhhUDTQDevsS/WRlce?=
 =?us-ascii?Q?eIqoB0yc37o0SKWx48sGrkJ3Be5mzhyxvNijTP1BhkgZ4CyqaBdAeIl2Fon+?=
 =?us-ascii?Q?UDs6wT0U3SfLbZe4jur6ef97PfmMlPfXQIQWO57nS/DXOW3hLCZ0CrGDopuW?=
 =?us-ascii?Q?UHW8YIPR8Ihz9jMKG1rSJrRaNiBWB6hzF+5QAllGLCeKUcY5A8RweCosCEDV?=
 =?us-ascii?Q?J9GCGTlM/OWkQaz+guTqVTSuYNaTZoGwkXf3Kcq1/wADHSC0Yjn1GqEjDk8O?=
 =?us-ascii?Q?Xy77PX09rQhncFDL1BliFNpea9yu+Zy/SwmHJT+PsEei4DyE0eQNzVk96EE0?=
 =?us-ascii?Q?yOKmpoRK0BQ04MlQmhkgK/3XjxfLeWeq2LgBlUWfk+ZZwrGvn6HAyPl74Rmj?=
 =?us-ascii?Q?s58jIqR4rANNY7V0GxoeatgK/B+1mCyiH+9alaCrHl7ArFUIGGGAIzjLZU8T?=
 =?us-ascii?Q?hXPY67Sh55Wn35mC1dDrPqe+DYnDtdu0cMMl2PtWrCbThmRcEmYLQqSLV4jY?=
 =?us-ascii?Q?rBUSwb/T4gK3gjSHgHwxrBMEH2i8Fv/gS5AGyg3hBEYU0aS5S3KyBTPW0wUY?=
 =?us-ascii?Q?9xyp58BQ2o0s75+3LILlKGTlAva6F5APAohV/v4xY5l/i2nQQ7wKfcgq38XF?=
 =?us-ascii?Q?LnjZw1NWjeXUAMXB9ccYZV/5HrA3xhSgy/LMJIVOCj0jL7v1IgygypqA9Ngt?=
 =?us-ascii?Q?byvvRgdQnuL8vb+00lrBkg1wEdj3kaIBk3Bin3bwMsI7mj5JG6i/zDHmkmar?=
 =?us-ascii?Q?rSUhaWHCjXDiGfKskbZ2nvMbCWBOgwpDt0sdj8xj/9O9VrsaUsyGtFVor9j1?=
 =?us-ascii?Q?oUXN12dDM27n2akZ8uVsuXKC7ibGkP9OAh1rcr9d9ITF6YWO8yd79VxIKcUU?=
 =?us-ascii?Q?to2AZyLUt/uiLEzFTu17udCsJON346OeoPsV8BUvl17NyPquQNd1Cmp9N2m8?=
 =?us-ascii?Q?Dq7EHtC5y8p9ZnbAr69JJuymT2SDUfIKR1ePoFa8hTFbF0Ap6KcabWBe29Vn?=
 =?us-ascii?Q?DaYnFD7xfKuQASt+CDw1wSYzu7sMD0gvUXjrwkmqbDy+IVxtfeyRMFSePxk9?=
 =?us-ascii?Q?0GZblP8EYQRK72NMLao/1h2QVP37fovSVQDPtJCiCfXY8cI9EtlYY7UA5QZW?=
 =?us-ascii?Q?RJXP/KuJktZs6QQgGiPM1+e/14RktKdvrBRjDGYtZ0K9Jz/e//0gP38IxpNS?=
 =?us-ascii?Q?Pjrzxp28+9z39OISaBwle5M6iS+89ih8xzpf5FdsAZnpAeo2/GldUhEwox5A?=
 =?us-ascii?Q?Ipydx3awMrTxcHsevwi2RAabSkmcYeQeyO0TUSk63BEii9UP3WS/WDgYivJ5?=
 =?us-ascii?Q?80qXvcrCQAzQlW5LeLTFPnAo+tFj1/3GLUV7/NcDJEjbnaC2OVfsVQ7FHKcP?=
 =?us-ascii?Q?tUU8BYHIiXszcp1aVfawi87P2Mh8TtgakhBmI70M8QkbGDog1STMzik6eVJ8?=
 =?us-ascii?Q?reWvnAxnvOQUxGLoW9jVDErTVOeqTHtdVAGuLfRDyKyl1mLWxgozqM3UGdw5?=
 =?us-ascii?Q?I9U5oBVux4iABhBq6ID5Av+z4FvmLtMuW4bneFVFCTKyXWuLl0x++fZCK3VH?=
 =?us-ascii?Q?dWTHOYo+sUVdicM0hR4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39aeef7-5934-4f8a-f2af-08de028dc53b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:01:45.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0TXKo72/YfB9r4sK6u8PWq4YPz/tyK5yX6FiMluFDZPdeOp1RayNBE6DJQQfNYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8099
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 06:02:23PM +0300, Leon Romanovsky wrote:
> +ccio_map_phys(struct device *dev, phys_addr_t phys, size_t size,
> +	      enum dma_data_direction direction, unsigned long attrs)
>  {
> -	return ccio_map_single(dev, page_address(page) + offset, size,
> -			direction);
> +	if (attrs & DMA_ATTR_MMIO)
> +		return DMA_MAPPING_ERROR;
> +
> +	return ccio_map_single(dev, phys_to_virt(phys), size, direction);

This doesn't actually use the virt at all:

	offset = ((unsigned long) addr) & ~IOVP_MASK;
	if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);

And ccio_io_pdir_entry():
	pa = lpa(vba);

Is a special instruction that uses virt but AI tells me that special
LPA instruction is returning phys. Not sure if that is a different
value than virt_to_phys()..

IDK, I'm not feeling brave enough to drop the LPA but maybe include
this note in the commit message.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

