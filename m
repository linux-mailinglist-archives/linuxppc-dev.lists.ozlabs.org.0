Return-Path: <linuxppc-dev+bounces-10728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D238B1D930
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 15:39:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byStj5cg6z3cRn;
	Thu,  7 Aug 2025 23:39:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754573949;
	cv=pass; b=RcXXAlYgh4SjBCuqBZPfM1u7VaNU+ZoT7Sfqy0pO0dXpadTuQ4l3Ycmcf8/r+uNnB/k8AgAdl7ZiBp1TdzoWfL1SOVXfNdlc1NkX4A0XNOFpF4UlHn91leTIe51TmmdNUd7+v8C/h7TGZkiZ8GU0uy5SGIE/CxQOh6IAlMmnNzrd3MNnLL5VgkunbgN49n+4g85ZxVSKbRo3qWxYtQBIwzdbTSTvm0+D5xw0kaWksfLw3p9e77KuqIco8gvjUpXWMh3TOWLSOExVXO1LnfF777IYXhLr12Fi2lNcRFZAIYyRHm4Y5+S+JyjYjc0l9tckzDQMvWzczfNWWnzCSCuOAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754573949; c=relaxed/relaxed;
	bh=54Px3zvYf4CuEyxVRynpi6iF48N3mew5kEum4tnD5v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OIQx4qA/YLOM6QAivhz0RyC0sQ+P84kqYVwcqvHZVoZYKyGNWeJLy0KvpXUSetQ4LeRxpVP0yhW7IRUvs8cr9q32qyDxIcFTTFphr7dS6rnUsFgcp9VeGLxH3a3mjuChGkBsgT0/5E6XAo9fxxfR0ugQl5nAApeaFn/Fsb7CCu6NZ7KLYExdjXQPX+UkuZb2Qqa3LwVZPYWlg5nB22NxcFt3Mbrs560FZfj3w+ZryZGzDo9jekT29VX9bqalCWr0TW+4EZSSfsXTQXAPiRlz9Ojdr9jPJfEAvwj3OCPPOflEk274ztdEKe6dJCBduJr9Ijd6O4HLNnwQ9I3wykTLGQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Bf0mhOSD; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::601; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Bf0mhOSD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2406::601; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bySth4YTgz3cRk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 23:39:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odOtssjFOkCHYaLHQ+/p9kfwL3oWQqyiWiKZLpw7XJiF0foKdV34qpOhsa1iNCspSxVdxU4gA0WIItvoFQ9sRtdvvhlbhXyTBk5Ca0RXJ3RlP78IzX7daEYxP+3DERHoiEVZUq6MhT6APGT5uklKHYQGIFquSh71x2Puus3T4i8nJPnglcxkCDj+8H6wruHDXuIIsoc9Tm1p4FS/4NhFdVpTORh7rLv1w8bBVZVxzJvWspW37QJRE8JbsVFRKO7JzmyP7iBHI65AgMr19mjmpCkS4hgxSVfHwg581jbnkd35C/EEQ7HPbqjeAMv/llJMdnXVlbhEQw0Qywxz9wytHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54Px3zvYf4CuEyxVRynpi6iF48N3mew5kEum4tnD5v0=;
 b=WHGqL+evN1vHpZ7qbQ6RVVDVkvnpn9fYJEwlKcNw2tuS3UHw/cekUJCZobaYpQw5oT7ZwdVyQKnVpTVWm91I3/g6uByftqmmGJajARVQMwsOO9dqOj08ynUXbkUqDt6SJ5/gtWuR9mLD8+eLzSM5/PNlgbOjQw+WTLl9Q+Wilktn4nmyWf4bk60zuNCZL/pFTfeMO+nffuX/AI27zQBaZMKSFQQb2GELkui8GmIZSdjYczrggAtJANFiIiV2RKlxQg+TV+OCwfC3kU1vxB88biOmpAblynNudTd1fLMHTUoWJN7e0avj0G1kzWej0DCDpJG7TOjvkxlpUnW+JZo5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54Px3zvYf4CuEyxVRynpi6iF48N3mew5kEum4tnD5v0=;
 b=Bf0mhOSD+JdgReLtcb1INqB0/uyZWs8MTJetWOhSwa3/PLkVmbmv/hM6Jl3dg3NDMwPrsdDM/AlzyEUrUBURHkACZ6cjHLXiooKnG2YMGnzXwkRRzEcBCBNXbcVCGh58e12vxDNvxaaYSD3/bhb5e9s0aMvTNDZ9mGcWTWp5Z0O13GK0Lzmffv4MQJjFCGVLtyoFeRFT2sBeSM6zy6Jvlf/218RHAdsr+LCFfAT+PZAJJKhqdojdp/MgjqxqGvZgP7XN2ZxopR4zMA620B+mgkDwCkQXS11WIz7ZuvEqkQWL/b9jGOLORKloIcURxJ7DSXvoNKuXdOWI1COqBddbww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 13:38:49 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 13:38:49 +0000
Date: Thu, 7 Aug 2025 10:38:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 11/16] dma-mapping: export new dma_*map_phys()
 interface
Message-ID: <20250807133848.GL184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <b96c639433d3b614288be4b305ecba3a9fb2c00f.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b96c639433d3b614288be4b305ecba3a9fb2c00f.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0497.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::15) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6203ba-7b89-4eee-7a5d-08ddd5b7bd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AMKVoTshkoWihCrrnOUvbEbK3Gi7aXCYIDForZBGpYKryA4uJRbN0UDpbFTN?=
 =?us-ascii?Q?H/nr1xjNK0yCSTAH2/3voqKzqcPQ8JjFMyfvCCv2aMnvNbHTA33B63muGzmW?=
 =?us-ascii?Q?5DuQYeQkxu9Uw2xN2G18A8DecvYxjTEqqa7EJ52Dz0bjjAPXvhQ6AbLFGWBo?=
 =?us-ascii?Q?59GavV3fO9HNdDxXcrP+paneiJa1nxYzUrzHDIscVuUyHiCjrFZNgOHhDikR?=
 =?us-ascii?Q?7wcVcGvgI+hCp9HjXxKQW7tGN8V0FZgKJ/bqXmnsX/x5N/3zlk0pVa9FtJCH?=
 =?us-ascii?Q?CLPxOt79JdMBCRMDwcNL4hI95vmDbD6/mce+8brYWOpRzcZnRWyO0Z5vCBGI?=
 =?us-ascii?Q?JDKz/8pIG7Vb3fuJmFMrtI+6ePyGKdAZgWpMJplKOpaDdL8hONs1XFxGY7VF?=
 =?us-ascii?Q?svLNjoB5HWfHueL7yuniD8+OFfjxkYeo06UE1BdxGED3DIddzKnkvCsYbmy2?=
 =?us-ascii?Q?VVwT75RYTyr6y5rIgz8ZLeboijTMVYkuysX3l8Ek+VqpZpozDcvGgOwi5WrW?=
 =?us-ascii?Q?TLv867KYTn5yifskzFshdlklW2WRDN6LKSXpACxyJQaInAZ5DaBuhGWJmIoI?=
 =?us-ascii?Q?DaBEtwnyLGOS/S1BvFNEUiuqy0i++7tiaJLQxVzGHrqb1qEGEukHyzAMHjZi?=
 =?us-ascii?Q?TDdil9vH++NAqfwB+u16QWc/W04KAsYHH0kgRD1OlGGP4AQ/OWmGu2I69nP3?=
 =?us-ascii?Q?IeWJNgKGb2zPeCIR5L77759PtmgLjN9ZhwxCfwgEgrCcd6CywpMAD2pVM8hu?=
 =?us-ascii?Q?3mZVa0GoXXJgLkCn2cznn+Rk7DSN3JZxQZRyFAC7E5crCHy/caMXV0IW6cKu?=
 =?us-ascii?Q?u34KX7iKGK8KAze/O4LNUcsx+v3h1RnDfd/N/Rou0rM+Z5viJS4XumBIE1Jz?=
 =?us-ascii?Q?SzYPcu8cpkdfVKdtTBdSm0oGs3ugExQh0AgyzrygW3AI/wEbU+hmjREG4iGS?=
 =?us-ascii?Q?qtmNR6urQDwKamP16/n/ls1+o0YkvBPAuhiwtpUP9HOlaORcZB3FN29xVU1v?=
 =?us-ascii?Q?TqXUAq7QjNtdswDx9oAvbvt/vTce4GRKf/wneoIZAVvOjUckgyP6SfE/Y193?=
 =?us-ascii?Q?jwhYRGUwASumZDJM62eTSJoZUQEb7/X0M+i1nPjqPkJP33D4vu3NtK94/gKB?=
 =?us-ascii?Q?wGakF67m/iwQtk5r07m1A/AtX6+j5UjwVztZ34j7mNl+c1EeLAnYfnmrB7aw?=
 =?us-ascii?Q?sJwNviOQtRPsQfeJqQ/GG5CFr4zbQt7E0hoxpBm9rXEMb8O7/x3Nu0rM+YS6?=
 =?us-ascii?Q?rxP5rXjWZsJa9uzk+4HAdEq4C3vazwpTl7fBeNJsDiScIPUUvpC5+7OteGZ3?=
 =?us-ascii?Q?pM8bimM2DTTDvatW94F9tddt+JSq7lKAKgOsbF3YH0ARnXa7VuNBAwsbNsbU?=
 =?us-ascii?Q?Kt8K+jvchAm+kmGcMUFNcXaGLGeT2VGjqdTOqFq/nWWV8fszgKi6LZ8x6BWB?=
 =?us-ascii?Q?oJRmbUVR0z0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MBPINjYfPGiE5jDtZnc+kL6Tem1DGVvWnnr4IAqOJ3QqDGwGQYyBqSEdaTWv?=
 =?us-ascii?Q?rCrkX2y/Sk4d6j61UbByvUXt3nKTkD+MeO8cPgtXL/XPX2sGtHrb8gNrSr/u?=
 =?us-ascii?Q?OEKNTVQZ7CHsvHCdnd9X5FXuoX0i/hrhFXJMhY5OxAO2m5eI/uVKfnRhtNME?=
 =?us-ascii?Q?WfPPxcc0BXNl1H77XG1bbVfLl4VNWDgxX70H0hEofaU4W5E3P1swLrZW9mdQ?=
 =?us-ascii?Q?Feukc/5DifHe2SePpUv2EKDGC4VLP8K0ep5Ci+eTGyK2EaR19DpqUB7DqHVw?=
 =?us-ascii?Q?ocoo7Xx2dFbyGGwWrbx8IanAzYUqZ6w3V2/BwdDcAbpOYtPMk++ubsPaWkJS?=
 =?us-ascii?Q?86KBb6LCEKOCBbnz91YiL8E+jtdRHZk0nVLho1rNXZKq6wB0lX7GySKFPJYi?=
 =?us-ascii?Q?4omNcGV34wSS0K+GJyD46PR/zDcAmDow1riE3YHKDXpojGGSfyFt7iU3pvfH?=
 =?us-ascii?Q?wc8uUrVB+XPvmrMfTcW6f6GhHRWWtb4Dv4kTaBpvPOa+uihaAGvn0nj+7oA0?=
 =?us-ascii?Q?lH1msGlh5aLcnLykZ0KM2VqWGkDwK1aa8TxDl0T7g19lHp/PkCYYEyI4Oydg?=
 =?us-ascii?Q?x36u5MNNY4csSkfMtShIOKMjAXTOfgsV3noFPXKv7GWBj4G63jQRQy7KIztY?=
 =?us-ascii?Q?iPkXT0BhYBwhfcaZNLxAMZv/8/Vpu40Cz3B5loET0MoCiijmOSqhjQdf7GwW?=
 =?us-ascii?Q?D35UMZoK5FjnyeDHRoCkY78/CsRcdqBbRu0V6nzyYh7xTVf8SEmvcU4/IM9+?=
 =?us-ascii?Q?3LW+QVoPsOUarqzKeGJeU5AoFMb/rluC1yy28WSJumduJKF/GZW2yw51wFAB?=
 =?us-ascii?Q?AX9Y4SJw5BaOn58fwEy4isBeUtWN43pvqqdfGWTuVGltm4QnzrrRrmFYQxzo?=
 =?us-ascii?Q?YCfQhh0zaLBvD0u0iYz56hPKffO19tDiR+lPXZxIpIVEszLomukhAvwhOJUW?=
 =?us-ascii?Q?Mw+9j/MEH0hp09oZ3t8tmTi9yYBa4OvVYhtPBCu7s0rvRmL1yCnVTkTlJvQ5?=
 =?us-ascii?Q?l3+N6jLtVsMz+54ZIPO8T0dp0FSwyKmeiM2I57nUM+9+kei6xaLYl/nsyMcS?=
 =?us-ascii?Q?lFDpa4criGr7VWHlF9ecZdlmf8lRoqzbwaY2QJALFxY+Yy8lXP2jKXIhGrlI?=
 =?us-ascii?Q?nsR1LN7f5+rqLOuMwqDQX4KgxOZc2rBg31tXp98jmNTtVA0VPrwb7rTxuXnP?=
 =?us-ascii?Q?K7xw5frFaQTc7Tm/sId0dEa4GdyvSh4TxEDupjoJUpbOPfqqUDwiCgIA8VCG?=
 =?us-ascii?Q?qGb3DHiGYlIQyyN5h8MRnLL5ilAlfSWqxXHhjp5U3+BnT323tDZHc4o4W3Hr?=
 =?us-ascii?Q?xKkMQNzUFeKjJZjncuQgF/AamcRWrEHt26fXixwlZVz+XJNC3GEHrBc+Ri4r?=
 =?us-ascii?Q?0+lMkCA/HXc2Shv8z27rCCJ46nrnGEQEFheADapJYipY4Mc0WWth2NBJ4r/t?=
 =?us-ascii?Q?SM90I4M3q/2GCRG7KRKfbnaRI5P/PHGCBgNBYW/YrXQ62mQggCHMTmkRy/6E?=
 =?us-ascii?Q?aahjgO1NFxrLDGTYgcHOkgZKuqC/j4pfzuZPIHHd7UDLyQf/J9B+7fmCNSfu?=
 =?us-ascii?Q?sxifWglQ0mC+PDduUgw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6203ba-7b89-4eee-7a5d-08ddd5b7bd5f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:38:49.1750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONwX7mHa1EuCmMcNdBKJGTu1Z2nQrZWEhwSNbSygKKjIuQb9Rcj66qSQFOkzaU9W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8768
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 03:42:45PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Introduce new DMA mapping functions dma_map_phys() and dma_unmap_phys()
> that operate directly on physical addresses instead of page+offset
> parameters. This provides a more efficient interface for drivers that
> already have physical addresses available.
> 
> The new functions are implemented as the primary mapping layer, with
> the existing dma_map_page_attrs() and dma_unmap_page_attrs() functions
> converted to simple wrappers around the phys-based implementations.

Briefly explain how the existing functions are remapped into wrappers
calling the phys functions.

> +dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
> +		size_t offset, size_t size, enum dma_data_direction dir,
> +		unsigned long attrs)
> +{
> +	phys_addr_t phys = page_to_phys(page) + offset;
> +
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		return DMA_MAPPING_ERROR;
> +
> +	if (IS_ENABLED(CONFIG_DMA_API_DEBUG))
> +		WARN_ON_ONCE(!pfn_valid(PHYS_PFN(phys)));

This is not useful, if we have a struct page and did page_to_phys then
pfn_valid is always true.

Instead this should check for any ZONE_DEVICE page and reject that.
And handle the error:

  if (WARN_ON_ONCE()) return DMA_MAPPING_ERROR;

I'd add another debug check inside dma_map_phys that if !ATTR_MMIO
then pfn_valid, and not zone_device

> @@ -337,41 +364,18 @@ EXPORT_SYMBOL(dma_unmap_sg_attrs);
>  dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
>  		size_t size, enum dma_data_direction dir, unsigned long attrs)
>  {

> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -	dma_addr_t addr = DMA_MAPPING_ERROR;
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -
> -	if (WARN_ON_ONCE(!dev->dma_mask))
> +	if (IS_ENABLED(CONFIG_DMA_API_DEBUG) &&
> +	    WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
>  		return DMA_MAPPING_ERROR;
>  
> -	if (dma_map_direct(dev, ops))
> -		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
> -	else if (use_dma_iommu(dev))
> -		addr = iommu_dma_map_resource(dev, phys_addr, size, dir, attrs);
> -	else if (ops->map_resource)
> -		addr = ops->map_resource(dev, phys_addr, size, dir, attrs);
> -
> -	trace_dma_map_resource(dev, phys_addr, addr, size, dir, attrs);
> -	debug_dma_map_resource(dev, phys_addr, size, dir, addr, attrs);
> -	return addr;
> +	return dma_map_phys(dev, phys_addr, size, dir, attrs | DMA_ATTR_MMIO);
>  }
>  EXPORT_SYMBOL(dma_map_resource);

I think this makes alot of sense at least.

Jason

