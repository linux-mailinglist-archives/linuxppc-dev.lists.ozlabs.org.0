Return-Path: <linuxppc-dev+bounces-5347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A2A14729
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 01:55:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZ1VF33sdz30Th;
	Fri, 17 Jan 2025 11:55:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::623" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737075301;
	cv=pass; b=SbyNVLkf1F+t6tz5aMMhFsJP8ifs6oFAIGLt9oB7k9U4zW/sXBAinSU/zEQTAiLnZZTKveeUQcYwyphhTP4DmD7kYnj1O3lrgUCUVBmIHgJx21ug+tXlBysUl0OqfEPd8adOGd3IXC9HVhNimgKUCoShJJd41Nzv6ooE08qHz7BH5WMTY18wALrf2V9FWNO7GIwUiJENhpLbd9OGiM3w1OSyLXRbV/TMSfg5tHk8s3Rpzce9AjzEaeQzRD9YvPOQsyk01torsEQC7VhQoK1jiFPz11uOSsP8q0nFnexuiLDJfk+RFJ/qgSPTdThK2VWEnEsr69RG6aUHzrjK9js6xw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737075301; c=relaxed/relaxed;
	bh=PsorMIcWx4N+7qkEgr+BbXGvsZfm6KhzZ3DohD8VoDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Km5Xb4MPhHY+I7xbmwCNrbFgvAdkFDUQ2cFdNlwAD/xokHmZrpIVlhVRpxavXvve6JdY5dfUCAaKb3ui9M5XDu8xgRCCmq1x0eN43ouHUSfAtSxndU/bZwUGzl7DezTbQvpLV3pSKQVAkdlTn225Kzv2CoR7uYzNwz4gmgx7J/9nd/ZNhuH7yNLoKuP62fNq9J9lsalhP8CoMyhzzJQV00DPU7K5dupUahqRkCiyvKBVaDTWVknwGh52l93aKVjkrVXD02V9Y+fviLbAVdMzIxt9nOblpllKhmGonsQS5uMxCXaaqMQf8cfLtKth768m3iCJT/drKJAJ+GUXp2QdSw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jM+15JCa; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::623; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jM+15JCa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::623; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20623.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZ1VC43kwz30TQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 11:54:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgIdxjJkvCmQ/e6mEJ+Pd6+7OFVulTIb5IM4i6ZSvzZbQSHpSSnsgOzcBCjszAA0CDpJ6QdcGKRD9HIuatH2Oz++3Q86SdexfQYCMAeY8LFm6zy6dH4qdk00l5JwjVZAU/pkfO5pC6mdK4GXfXLNBTOa34Lgqmqew5Qe/jlpZzjJ8PLgxBjhPd34qWBjtPGlqZhMYvlaquaCF+wj4oBkRumtbwzTFzvCCNeI64wEE8phF7iCJMVcLpRoRlyYRaufhzv6J6hg9MZaj7OTVtEUc/6zCQKg0rbYGkJnwa9Zx2vvuZOsk6V9lVBYfHv4u8x44LRjuO2D2CyUgSpIuzXUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsorMIcWx4N+7qkEgr+BbXGvsZfm6KhzZ3DohD8VoDU=;
 b=hw8Cd/9NtVX5fCF4TJkjD3qEGS0+yeM4B/z0UvRB3/gEYjD9Xm1Tkkz8kjDf1z8oJO1o4fyCefBRfSwy6oRxd24Y+oQigYp1qNRHugzCWrJtk6lH2zCm2y7TfqsXmCWJE4I4w5uyL+WSyNQyxLzDwow2SC+YMa8BH43P+btXaMsMBYpT9HFIr4MyfgKZ88NPxG0Gxb82GEhFQTJLyr7ixH38sm4lgm6Jf32F/an2TzvoBfAqEtb/7QHYkxNTYT1IEaY2sORxBouxcz7coHJmQuo3ZQlredkE6tLHydAPanX83IqPs4i76TzgClQ15vIxUGb/3p+bNDdiAky/oXNxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsorMIcWx4N+7qkEgr+BbXGvsZfm6KhzZ3DohD8VoDU=;
 b=jM+15JCapMpp5APia+ATkjD7NdAk2jFQLjmAcsaMwGB7P5LWIeSfPxrTTljgzeaeiyT/YyZx0ScICQ9BLDE8VfoI/5iPcQ/M1I5fR4ADpvwv6fHbGq3R2HLII0MIIs7ZBtAzShHSqpjeNM2q7DphRMfMtwdUHCg65mPPyjJAyKMtBpKi1DG+KmCxlR5suTURgV/xDl2gn1HPJU0O8UF4ntNh8kpv6D6Zw8a4Q2K8K7F2ZxGRghaIbmV2fUZYb+alyguCv/upvVJqQ+sUaGIx9xzJFzlHjiwqugZjETcRW+caAMu8/0AAoUASishwqaTsnxn2dk0kzGPUZrpTnbNgOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB6804.namprd12.prod.outlook.com (2603:10b6:303:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 00:54:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 00:54:37 +0000
Date: Fri, 17 Jan 2025 11:54:32 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	alison.schofield@intel.com, lina@asahilina.net, zhang.lyra@gmail.com, 
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, dave.jiang@intel.com, 
	logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, 
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, 
	dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, 
	tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 08/26] fs/dax: Remove PAGE_MAPPING_DAX_SHARED mapping
 flag
Message-ID: <unu63k4trmt5klmors65j2or5vd2ghmfayrd3p22cquoyrjvcy@fynjzwnr5t3h>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <b8b39849e171c120442963d3fd81c49a8f005bf0.1736488799.git-series.apopple@nvidia.com>
 <6785b5525dd93_20fa294f2@dwillia2-xfh.jf.intel.com.notmuch>
 <pxpog7xsknwpaqh44vjkg5anegfwxizn6sgpdipntsljx5jg2s@rwqa5zfxooag>
 <67874b46c0493_20fa2941d@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67874b46c0493_20fa2941d@dwillia2-xfh.jf.intel.com.notmuch>
X-ClientProxiedBy: SY6PR01CA0037.ausprd01.prod.outlook.com
 (2603:10c6:10:e9::6) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f14e47-71a4-42f9-85db-08dd36918414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HFJ7cepUJaPX6BJv8plAbENAUfkUFRUMrfm0+2owzS0bsgRxfDFPWsD2tRzo?=
 =?us-ascii?Q?/HuT5tDiz314TbCtrMCJAj9Z7HbV/FeXYm9sE33AftbyIs9Vp7/xW61LALbZ?=
 =?us-ascii?Q?TQdS+4Ymb0+bdOK52ZvXkFsHTKjTpTHx6oEntJJHtpjo4K+DjLLaRQrUq9Bz?=
 =?us-ascii?Q?7lOPdj6yLyDh39RDasdtdO7X9Alt5LnV58YsjRnzA1xO9f8NC/Huw0y/5ESi?=
 =?us-ascii?Q?WOSK9JtxcLpDUfBC0wyR21An8wcsSS+dH69QiObd5SWbaOBQis1+z8SzPlDT?=
 =?us-ascii?Q?59XfMS/HeF/jb3h0/+iYCYKd3Egkg1yYYgAAk+hPY3b6MTjbWFpZ7NuWPq4U?=
 =?us-ascii?Q?TLspUokk99MRccCf7AZLCLPRL3ZwU1rKvksLN+dmtRWgNdfPFMYhdoD+hTV8?=
 =?us-ascii?Q?gRwV2J+nkj/d0Nud9LlpLqJn1bWjrDUQodtLovcfy/gmM6lsjxlgCE3bUX06?=
 =?us-ascii?Q?M0ksEDr6yBj8iT/Xx5qyDp1EZIAP0WSCV/DMwzDM3zmu1BFCHYhj4laCtOwh?=
 =?us-ascii?Q?LasAGNERcUphIgn7+FURhTdhxwDJbg6UuPLM3MMRNX0hutVVuoFtqg72tQER?=
 =?us-ascii?Q?xnwhVwcmeYSYt7cE1nk5z2MGifCwjBFNJy7UzYgo9fdakeAcOy7GhwwQNhkL?=
 =?us-ascii?Q?BijCkjMsq2cZp/Ypsgf9/uaWZ5jjkxeZ9fzyXM3Dji0MhK1VRIrjYmEBkQ3M?=
 =?us-ascii?Q?VJ5cdN0DNme+iyTDJPNib1SQcNa2rzTjNNKF+aYVtjyWeDURB6wkb65oASPq?=
 =?us-ascii?Q?PPAlHRoMYCEhceshAaj3Tfq/b+U1wVsWZU4aHC9gUnhioQwvWtuUym/MZvwv?=
 =?us-ascii?Q?mKalTPRRd3Y3JURUccpar1w0w/QUUTv9JQj0OxQ/uCL+2XFdticignv0KUgP?=
 =?us-ascii?Q?odQRSkFEU9NLPo76nQVfxoFr5vTIWzWtR9oQc5euxpFLbqZlR7b6kemFM8/J?=
 =?us-ascii?Q?+p8TxBph9u3tHw6ldgzgDtbCtoUtYVJdYH12QcVR2mVNkNpnSsmIaFyYXv/g?=
 =?us-ascii?Q?BdOvHybthoquRXbs+1drsbHG+wZiDdZgXj/vgyL3C6QpNz6N5CUxO4ydANwK?=
 =?us-ascii?Q?4GLCFlxeS2/7ao2Eamh6g1hf7nFLVbU/hQ/LC6ULwZvcqt5A6jtD6zFzsToU?=
 =?us-ascii?Q?+SBUCypH7bJBINz07vpYv6hLpujDY/QJ8Tcly976KbHsI5W2+jClh2YpP/HN?=
 =?us-ascii?Q?AOTSqbnRXFuqQvQm/3jnuZvIlErdeN9IboGTq55O7eGHWFN4S4PyLhInIaap?=
 =?us-ascii?Q?5IEKWWiFIOhjK8Fyg9oRAk6zbg62DlWZSKDSeEOQjwJVwWLFuSkRkp54hSGa?=
 =?us-ascii?Q?osUQItTWdrSVG/wYP3teaphPxt5flOTghz0iAttBfKbhE6QTnaVt6+RKDpUr?=
 =?us-ascii?Q?Dheu6Q6Fz+yQeGrXN/Y+cWTybtsf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PrAhdCqXGd9V4QSXI2u7X0ckPAq1T3jnz0PbJ//ll1y1Laj3+Df6hquRQ79z?=
 =?us-ascii?Q?i4gRcpeV9YAbika54Pi93MwFZl+PXAs0idxTBNkumOHUxyEijkthTuN7ctrC?=
 =?us-ascii?Q?3739nxnGkBpA4J3thFSvUab0inFVNHPnXqG5Q7TDRXOOcJfSFy/Zv421hFxg?=
 =?us-ascii?Q?cYA+omq61f6poC695f/gcFuqPh2FXKlSZYtcDliSFT3l3/fow8iJCPu1KyY8?=
 =?us-ascii?Q?KMogaItn+S5xh+QBrXPQ03jg213bMqReRqofdVUYAcolE/TSAl748BeogI3q?=
 =?us-ascii?Q?4upZH1Gic/WCDjPvNixW0T8iX07nT6Wxnb/q8icMTH8JLjjIIfVQC3VyE3Ty?=
 =?us-ascii?Q?eCIEKZnsz+TniKxaruzxW/PdO7ug6IEl864oZd3j/mmYvc0jDh08m6H2iKhT?=
 =?us-ascii?Q?1DADk3xSL5mYaqLM6H0TwKLRnc+2uFcOyrVnjTKfycYQh8X3u5OR1DOfkJJe?=
 =?us-ascii?Q?PETE8wXZxB2hxD9eRlsChS05IkDogN5JOcFDCx3BaKCiQGWfvZxIhsX/lqHA?=
 =?us-ascii?Q?l1yGImSvy5DJQQZ/ZnqKHitkUP8BoDID/wb9HGN+PfqVvJfs3J/R66wIAK1n?=
 =?us-ascii?Q?+0DAzdPOoQPwq8JGHYxb1+v23kPLcXFdIlfm0YIn5FtGoLq2cZXtpglXJYdn?=
 =?us-ascii?Q?ZbCtPPWpHp1/zi0v2WTz6X0p1zxIOsdoy6O3Qr62oTTRLQvKjwyMp4ZKNABz?=
 =?us-ascii?Q?j236CY8TzQl7PJ5zHYlA2ov67oD6MbVBCJlpQO1Hg7FU/MrZUJxz/nt3D4aC?=
 =?us-ascii?Q?bS2DGByFkppFTv2/5Jsx5tL86FAiHnKORQtCsTtHkkuQiXC7x4HNHmNO6d44?=
 =?us-ascii?Q?RN/GDpf0CzjhuJAKDNW0z6fXVWHglCE8QR4KR7UZylbfZ6ioz2288L6sT49J?=
 =?us-ascii?Q?j+SNa7kEFTF5hGI8dELx3FurjsZUMvy/lwpS5YRzKzXXgjagljGhh0AhN2fI?=
 =?us-ascii?Q?JyQ9gzEZAcZ5Ogf5N73TZoGqdLQyc6kDpseYfMcU1tw9lzWRBTGMg3jMKGNS?=
 =?us-ascii?Q?n6UjcrV1LTriA1to4n43h6KzN/GI+wcTEvEXMVlAWEWDHz25bBV9gEM/w/YV?=
 =?us-ascii?Q?GUjFsj5E/QuMQmPUt2s0vCf+L2PdAPR2NxsHfH8FZqteC5AZnuHBkoXyJyGH?=
 =?us-ascii?Q?HPGKMK3zMGCKPB8TlJwpNB7pRuDV9mAnRhAIL8UWo5ZI/h0Ya75jYBDVi+/9?=
 =?us-ascii?Q?JIKvR/rjzpmxTc5nqn4wApVcOsaLsdMBrTOpWhllSPTgngJY7eUhdB2lVPPj?=
 =?us-ascii?Q?kAAY+/xz9cpX0A+jaekrMySP+ocPSugIDyGs4xcmJRNU7iRfZo4ojtLcY5PU?=
 =?us-ascii?Q?PsQ6wKa4T4r+Z/SVKh/pZDr+HdgibQ21SKLzNUixtS2uYyQqz9they6lfCk+?=
 =?us-ascii?Q?pTAcjJRjh3GniUi3Vaq8j+Vp+nIB6pFkzNAcatXGA+Yf4g2dZfn5h64sUy1p?=
 =?us-ascii?Q?6b1xp8QFCgMMzunubJeAculcUVeyVMVxKjKoisj2QAxqhuNPzQu3efRcT3zE?=
 =?us-ascii?Q?ffRlhac2dl0RSe4gK3blvGtLnNRfvoMsHOku40RdaJNECpcqIWSFPT566H/m?=
 =?us-ascii?Q?zQyh05vcIy+ITPkQ28bbaHVJ/T0JhwKehoG8jXxM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f14e47-71a4-42f9-85db-08dd36918414
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 00:54:37.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i14WgzCUjuccS7tyN4hfsg9KaBuV0rLTrosYsEa/RkH2HKVRcjScdGdKSGYrnKLdRbyd/CzcLjWmpEG8q0fyDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6804
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 09:44:38PM -0800, Dan Williams wrote:
> Alistair Popple wrote:
> [..]
> > > How does this case happen? I don't think any page would ever enter with
> > > both ->mapping and ->share set, right?
> > 
> > Sigh. You're right - it can't. This patch series is getting a litte bit large
> > and unweildy with all the prerequisite bugfixes and cleanups. Obviously I fixed
> > this when developing the main fs dax count fixup but forgot to rebase the fix
> > further back in the series.
> 
> I assumed as much when I got to that patch.
> 
> > Anyway I have fixed that now, thanks.
> 
> You deserve a large helping of grace for waking and then slaying this
> old dragon.

Heh, thanks. Lets hope this dragon doesn't have too many more heads :-)

