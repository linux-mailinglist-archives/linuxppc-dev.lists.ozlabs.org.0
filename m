Return-Path: <linuxppc-dev+bounces-5282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F83A11978
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 07:13:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXwfq5NhRz3bWf;
	Wed, 15 Jan 2025 17:13:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736921619;
	cv=pass; b=JvW4CyF/5BMMRpcPtigA30NchxHHdHLRMqhDtJFfMVYIS4Vxb246aQX1ojDr9FSONFjZ71cAMPykiBO2jyjtHSXyqFzURKJug22YtkiWNLQole2FkNh7nLGsMgCcTsTEVBxj/KFDiRFvMISegDXunWEwqWnUu9LvQfQZ9fWmGCo6y3Rz4+SMB0Nnqi9vzLPRotFRZKvhJArmtVZiTW7/uqp7Y95bDGzNNVK23fHid6PWJ5wVSYloE7Gn+0Vtuir2j2QIDuNctRcmAlcQkgq34YzL06QyTvlm3jSzx9zxKC+aZ1XEvN9O3oAZbfu0agYlzqxA2rz39/77N3KoDDKNxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736921619; c=relaxed/relaxed;
	bh=8i7m+4tEKy09KwFIIpP4u2uYGjMk/TAW5hNJLsZDwF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LXyueUXSjoXdruYo6MRrsvri/dhQ/Wz7ySjP2rhVKDtGosB4mrvebGkuUCuI3puEEaiNL/vt1FrJFka2CXSh9PkyLIq2H1mpJ0aCPqqvxemGROI11ab/pDsW4At0BJEajiNVLWWJ0qKVZtO0WMnaTvuzu431PTS6YcxkJyvL7yYO6kyrHGLntFZgU/ou5tdxr1wM/n/1Xuj0UgO1n77Hq1agKjzSoCDyeQ7YxzmSLksLCQt5cWo9HtIQl6ldDaYoP/AD4BzhLFmjheq9/G3w2dvFszaQypa56h5F54jMISzNBxvBlvQhz63qITi+vVEbKTy21Zc1c2KUaSFG9tG/SQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RlWs6Rsz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::60a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RlWs6Rsz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::60a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXwfp5Q4qz30h5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 17:13:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEwf8NO5a4REt4Hc1+zoDEfwtenZV+9SiGUoRBbP2ErNQO3wlr88tC0WTi1gCh4CCHZONIu9OTybNRD5GZSMbSRBq91NLP4xl7L0/JmR5T280FSwqoA8bJC0VaF4+JCf2zOxSFwj/LQ9ptqVpNdjLjR/q6jMDrnMDi9SD12+Ccj3Dz5WTUlVxoSOcVk5EHpX3sKKY0LAqWWZs4GYM4EzTU+IHse6xtFWbztYqG3FNrkXWWIHofPXKkxbyp+tXlbZml4sqb97gMxBB87HR8VTH8di9WgSr/1pwrXIakbp3XBbZS+vaNQDXmo7E8rZJmEgIlPgbzfAS2eQTrwfD/TBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8i7m+4tEKy09KwFIIpP4u2uYGjMk/TAW5hNJLsZDwF0=;
 b=MMzY76YcT9x5lVLbfw0rMwGlcvRdhp0wxHVz2XvlGXn5ukHwcr2ZNn74B0XTeEq65tYOhbdNJuO0OHsAB1+6o/Pu3jk2FNIYprmEyEGAd1mYU1rMqW6iKEGboOLoLqFa0ukLSfRR/zqYBWXhYWYrkjDXZoqEADeYfg5B6zNwK6795oKfv2okCunU4+4VZfNv5238mzeGV6E8u6snv1od/IMZ9mLeB+D7gPMXmR1VZovLr9yC33OCbMlyVrTTfzl2n1Fxcj4rYE5qTpVA1VyzoN/Z4rXMMfOo50tRDiOAYvwdAywbI5L4zR4w1shlG+RKrvpqU1B9PlwiHgJpc/KyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8i7m+4tEKy09KwFIIpP4u2uYGjMk/TAW5hNJLsZDwF0=;
 b=RlWs6Rszx43scF3V7z0rnK+N1RTMQ7HSXGTyFOqJbq5H00hgYse+2gppPP4u/IttZuekJoNaJJJ4eF410P8M7AZASissxdoIqDKSty04tNB+R2StGlXR82ygrZc6ys1ZFxbCj59Ku3fEnFg6MOqivjEOL/L94Xc7B5KCDySSs8LfNx0KdcgrxnpeSf+BiSTUo+iv4JzXFnMxrxGDVlsEJPRhZ8PAC20FTwAfqscNNutGOzwVyzjqpxrB9SgQYgUYELBhlfNfWeQAIVTvjTzbd8t+nPM5xRwnQ6iUiNyS4AiGVUbFx+MvJX5eRJJwnKDzPR72vMMnoMXvhdb2/bgilw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.18; Wed, 15 Jan 2025 06:13:18 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 06:13:18 +0000
Date: Wed, 15 Jan 2025 17:13:14 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, 
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net, 
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, 
	jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com, 
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, 
	peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 13/26] mm/memory: Add vmf_insert_page_mkwrite()
Message-ID: <l3sd76gurkku2bnlcudk4lynd5e3b2ayqu36u3xhkvd4j4b2fi@zijtvmdu3v55>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <e75232267bb9b5411b67df267e16aa27597eba33.1736488799.git-series.apopple@nvidia.com>
 <17d32dc8-39c1-4aa4-ab8c-873c78097fde@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17d32dc8-39c1-4aa4-ab8c-873c78097fde@redhat.com>
X-ClientProxiedBy: SY5P300CA0033.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fd::9) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe63252-ab80-4b50-5e78-08dd352bb44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BrWey6KQ+NdaFxgy26CywsfC3tFUhJc6Xwf/MVx/ho3x+hBJW7QkH38RTulI?=
 =?us-ascii?Q?BJiOzyObEXwPTASyTjk7q9+72FPKmP/OcPzT6ErQ79PS+C3NKyAele2i1Lix?=
 =?us-ascii?Q?CRtn8S2MJGMHNfdhXtxbuag+SQOYOSABzGfJ2HMjGfQrzwvk7nnDTt4BXlDp?=
 =?us-ascii?Q?HJPv4dtSde19Pyp1w0+dBXU5plsEloMQl7oZGvCZdl6H3aK2JEyqYAeGmGEc?=
 =?us-ascii?Q?/CdstctaYwg1r2aj1k3b+fE1vKuKirW+uvB+G5YjTlMzoUkUp4/VZbPIb2KV?=
 =?us-ascii?Q?Rpt5VbO/TABCOT5WImRE/tS2bV0R+YPSA5E0xhQAD8iDM88QtjpnkK7emaXt?=
 =?us-ascii?Q?/uG8FN69gFnQBwlbU4CmgxZdwaHF1cfRyRMCxvFmz5irgHdLLVAzuSuNShnT?=
 =?us-ascii?Q?HD5bRaaZBJ/xkE0GIsvhbJN2nnNhl6mBcjVlkPUCGfrdT8ukAzwvsW6MyC1U?=
 =?us-ascii?Q?GQHGIi9RGmrpszYggtmCvHSDMlUIwPXoE0BqjUKchQ6JzbV57I0i1sBytZjZ?=
 =?us-ascii?Q?GyF+ehQtcDmmySur3I9r9TUZmA0IR9qSzj2q0/X3MJvdLVbBUM6yfzcnFhzC?=
 =?us-ascii?Q?C4gLL2vnB5qcZ+RdMsv0vW5WeXYaYZQ8Ye/D8L0i+7BgbiJquEjFMOmOyH+U?=
 =?us-ascii?Q?QYDSyeptBO7scPiREY0VO4yAvm8yNlaug7G2bVMP4jGwf+916TNSGNxWmG3d?=
 =?us-ascii?Q?3qGwy4iv4rsCBOtf6ObhJr0VVOpUG5N/DnlfTkYwxPNMYtNLzVVMCd8ygUsU?=
 =?us-ascii?Q?u9Phrhe/H/Tg1GvyajiCl//6syYnCDIsPd8BVRPqRCvmjpHJxx9Ldut4fTDn?=
 =?us-ascii?Q?Jab4+egr0XiVmTuQ/FdmcECiTHTpfQaOknXgYuVxqgrb2L3I5EO/OnzwjwhB?=
 =?us-ascii?Q?mORGTzVmmzrsZ0BOEryMWmKYVRCEV3fSL7CXbhVrmZ4HX8t7XMjWK9laTfgk?=
 =?us-ascii?Q?+XdM8uaEQfXYFXlCZj9nhztNA9Kt73gBwAjwlJJ8pHsJOVtpgnfUHODTjQHk?=
 =?us-ascii?Q?caiL3IcwLP0mGfYkOZpwzxUUJOqecw1emO3iM2tzfgFKauix+f3pYsMHLWIA?=
 =?us-ascii?Q?RdfJgxbE3emHaw2lu5ijJQyDNG55ueqe7/2PGqIq17tTSPwmT+m71/AzkKMV?=
 =?us-ascii?Q?m12xt88L8oOvwHpwCIQ5qIKBcGkkWOZhrcUfeEQS3hPoqw4mWNdyYTAs9jCi?=
 =?us-ascii?Q?UpT9HYm556ohI3LKCpMAYUvQLDd5W5vv24sm8m+r/D154WHTVxPjOyZoaTc7?=
 =?us-ascii?Q?fAE8qiJs6225joh4W145fdLv2w3A5PKZVSwHqfiFBgRwRmN7F/6r/LeN5PbK?=
 =?us-ascii?Q?8sd90IkLwmCtR5ObC6pkdiCdvcdMERa2zWPKiivWNb6vSe7IdSxcJcngYlNw?=
 =?us-ascii?Q?CLq86TjAhBlqK+GuSvDurQXnnfeW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4r1oCQQfBEKhvFZkvULSb7nCHsNmWPX0pYQ35ch+VcyUumBm8MWTdM8d+nGQ?=
 =?us-ascii?Q?22b79wfV1NSIyzRRk5nQrKcBY2v5jA6dXdhYgFZanLAINrK7/TP2cokfqe5q?=
 =?us-ascii?Q?DVdhBnxH5hTZzPjBxpHRyXOycT8Iw2Xfq+SvkWrAZjhSQq+t0g/Cx1KC83kC?=
 =?us-ascii?Q?nmKXEM22AvEVWppbeuFHcsHxdhuXQ+D1tsWluPqDEESD2yh5UTM23XJy0HdA?=
 =?us-ascii?Q?wH9e37R8WLmeDgUgIY+ARq5Q8HAqYUEo4DyA4RdS2/Rurl6nt1ce0nfQUbgI?=
 =?us-ascii?Q?BRHRvU/CxWxrTftSAS9YkbZE3WbLMIMIZmKzM3C2wcH/W1PnAf15Dq7zpljC?=
 =?us-ascii?Q?FTjgxSwb3XJCFbJX07BPZsjPbJpLmLa94t3hH7G25Nb1DemsJi0QUivbZlgd?=
 =?us-ascii?Q?t61kGcvScfS81og/Wl8oRlRbionm4E9n6L8QBoaDaFpL63PSelkUHcuI6NKF?=
 =?us-ascii?Q?xnRjGDaxkOeccSyCX+cy34JLFcE6uiTQrPILPIukZ8/8TrYnMZp/xjYEaUsz?=
 =?us-ascii?Q?+ZV2Nz5xooLssMack2BCkZ8dTqHoNK+ujJ8vl61s//jMZzCC9nLs0UrxbUCM?=
 =?us-ascii?Q?gyv+KiQBhGbLiG9HJAyX5kj5s8iDmZfM3+wEdHWq4iMA+6xwkFW6KLk7lrH8?=
 =?us-ascii?Q?K8MN19Y59HAbjtlwf3ChBT6GKBojonuC4RQ4JqsdWXqv/OVb2QBUr6SRFcXl?=
 =?us-ascii?Q?DFkeOInSMamiJJiWyNGbI1dbZ21LCpspGV06q1poc25vvowHa9/2RQuXcqSw?=
 =?us-ascii?Q?FZO054+UTKQGiSVLF8+04klLmlNXLSZftXr9pVkE5nr7l4pXhDTfBWRTSsSA?=
 =?us-ascii?Q?4NICtxShNBpOUDFMadmvmPNBPrql9iOXF4kJycrw611AHTWV+RagFJaDK8Rd?=
 =?us-ascii?Q?xkC1SaBvly3PjCxiwZ2KCGu9U9/t2nbYanCsfnYEm4pBlT4dYxfYw3v7rKny?=
 =?us-ascii?Q?mjnHMIFmiAk3tmlznAzmsdeEqZ+YTLvMr1lWixQv+HKRTYYqin5z4lt8SHJu?=
 =?us-ascii?Q?zFsmkwCiexEtTmpM/s233K+DQxKdJ88i4A50RTB0ywXcV0LYD5Owm513FMlJ?=
 =?us-ascii?Q?EYqkLjpA1B04DGIMhdG8NfWKGdpniWWgyClSLRIw5x5GbDurTsoCEBLTVnNn?=
 =?us-ascii?Q?+gefblHS2HEfgxcX7embiBh2QDknR3GYPjhobk/UPGRVjiWhL39JTzxBl/FF?=
 =?us-ascii?Q?hEvKk46wSS3gAqdguZF9NTDhzwt4gASfxXm/HtWHBgFMfYHRXNzid9oF+8sI?=
 =?us-ascii?Q?fvzVHGSGpOkOOLmf2f/J8HUo0cq5bxeNZLmsLUZfVUEpsvj9JoV4pVUrr2mE?=
 =?us-ascii?Q?aYFrBwvkAk7ZyY9xoUXkUdr/Rsvy/nPHSpjG2hwjDCuyr0obidsCxC3ywA+a?=
 =?us-ascii?Q?X1tZNyLnYPz+SJjSk1qI7mxjSwmlq61IYSxTF3CkDV8BBnqsgJBcf1G1T+ik?=
 =?us-ascii?Q?rBjaZpA25Dy2J+zoileU/jRRgs3EHmeccr0WBGxja5eSFuRfjo8VgUJXWxiy?=
 =?us-ascii?Q?qRR0gZ02HIpyAwvo0FrA5wu9EY1q8fDF22ke1WbeaVkmMMxn1l3Cdc/EtCX0?=
 =?us-ascii?Q?3CKaiw+/WBiQL8kYwSayJDZbdNXNnNC4dkYrc6ZW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe63252-ab80-4b50-5e78-08dd352bb44c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 06:13:18.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTnAVhG66jhTJ73wDY1n1OecFpMHAVq4fVzDXEASORF7d/emeatfl9a0OVFtb7UfIw6TVBweq3WvNENW5U17ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 05:15:54PM +0100, David Hildenbrand wrote:
> On 10.01.25 07:00, Alistair Popple wrote:
> > Currently to map a DAX page the DAX driver calls vmf_insert_pfn. This
> > creates a special devmap PTE entry for the pfn but does not take a
> > reference on the underlying struct page for the mapping. This is
> > because DAX page refcounts are treated specially, as indicated by the
> > presence of a devmap entry.
> > 
> > To allow DAX page refcounts to be managed the same as normal page
> > refcounts introduce vmf_insert_page_mkwrite(). This will take a
> > reference on the underlying page much the same as vmf_insert_page,
> > except it also permits upgrading an existing mapping to be writable if
> > requested/possible.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > 
> > ---
> > 
> > Updates from v2:
> > 
> >   - Rename function to make not DAX specific
> > 
> >   - Split the insert_page_into_pte_locked() change into a separate
> >     patch.
> > 
> > Updates from v1:
> > 
> >   - Re-arrange code in insert_page_into_pte_locked() based on comments
> >     from Jan Kara.
> > 
> >   - Call mkdrity/mkyoung for the mkwrite case, also suggested by Jan.
> > ---
> >   include/linux/mm.h |  2 ++
> >   mm/memory.c        | 36 ++++++++++++++++++++++++++++++++++++
> >   2 files changed, 38 insertions(+)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index e790298..f267b06 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -3620,6 +3620,8 @@ int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
> >   				unsigned long num);
> >   int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
> >   				unsigned long num);
> > +vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
> > +			bool write);
> >   vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
> >   			unsigned long pfn);
> >   vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 8531acb..c60b819 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -2624,6 +2624,42 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
> >   	return VM_FAULT_NOPAGE;
> >   }
> > +vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
> > +			bool write)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	pgprot_t pgprot = vma->vm_page_prot;
> > +	unsigned long pfn = page_to_pfn(page);
> > +	unsigned long addr = vmf->address;
> > +	int err;
> > +
> > +	if (addr < vma->vm_start || addr >= vma->vm_end)
> > +		return VM_FAULT_SIGBUS;
> > +
> > +	track_pfn_insert(vma, &pgprot, pfn_to_pfn_t(pfn));
> 
> I think I raised this before: why is this track_pfn_insert() in here? It
> only ever does something to VM_PFNMAP mappings, and that cannot possibly be
> the case here (nothing in VM_PFNMAP is refcounted, ever)?

Yes, I also had deja vu reading this comment and a vague recollection of fixing
them too. Your comments[1] were for vmf_insert_folio_pud() though which exlains
why I neglected to do the same clean-up here even though I should have so thanks
for pointing them out.

[1] - https://lore.kernel.org/linux-mm/ee19854f-fa1f-4207-9176-3c7b79bccd07@redhat.com/

> 
> > +
> > +	if (!pfn_modify_allowed(pfn, pgprot))
> > +		return VM_FAULT_SIGBUS;
> 
> Why is that required? Why are we messing so much with PFNs? :)
> 
> Note that x86 does in there
> 
> 	/* If it's real memory always allow */
> 	if (pfn_valid(pfn))
> 		return true;
> 
> See below, when would we ever have a "struct page *" but !pfn_valid() ?
> 
> 
> > +
> > +	/*
> > +	 * We refcount the page normally so make sure pfn_valid is true.
> > +	 */
> > +	if (!pfn_valid(pfn))
> > +		return VM_FAULT_SIGBUS;
> 
> Somebody gave us a "struct page", how could the pfn ever by invalid (not
> have a struct page)?
> 
> I think all of the above regarding PFNs should be dropped -- unless I am
> missing something important.
> 
> > +
> > +	if (WARN_ON(is_zero_pfn(pfn) && write))
> > +		return VM_FAULT_SIGBUS;
> 
> is_zero_page() if you already have the "page". But note that in
> validate_page_before_insert() we do have a check that allows for conditional
> insertion of the shared zeropage.
> 
> So maybe this hunk is also not required.

Yes, also not required. I have removed the above hunks as well because we don't
need any of this pfn stuff. Again it's just a hangover from an earlier version
of the series when I was passing pfn's rather than pages here.

> > +
> > +	err = insert_page(vma, addr, page, pgprot, write);
> > +	if (err == -ENOMEM)
> > +		return VM_FAULT_OOM;
> > +	if (err < 0 && err != -EBUSY)
> > +		return VM_FAULT_SIGBUS;
> > +
> > +	return VM_FAULT_NOPAGE;
> > +}
> > +EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
> 
> 
> 
> 
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

