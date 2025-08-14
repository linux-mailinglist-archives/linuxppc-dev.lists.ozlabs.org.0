Return-Path: <linuxppc-dev+bounces-11012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 562ADB268D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 16:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2nLt4by1z30Qb;
	Fri, 15 Aug 2025 00:15:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755180902;
	cv=pass; b=M135WdA+O4y60AF424q5PA1QIWLybODfJsC+sv0ojPCpwKRjqAlE+0I72h4SJ7JDjWCJlX/P/lBYorsXjvkLDOyezC/bOOZYpKylU3vVU31VyCSEw5cdiQDyM35Rzl6bMBpi8uQRFUuF7QVLOa73EIUaabh53v2vxuBrXQQa8VZJ7DMTmoJIKHJSC4lJheIycQtmDxUmBUv/xyMvfZbEN+/jWJudxFcrvf4K7NXjzqX+f8MEoL9ODyQiVWzaFl4qd2JjTZhGDg0W6uZ8IeiquQIC9MiqXISGqbaxqY+YFNjhivvpFULgDDsQsaBQA5OPLdga/8dWjTpFBSOZW95d6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755180902; c=relaxed/relaxed;
	bh=ruO6zNzO4KB71Lkb6cSwWsEi4wP8AIx5i5wd80Kfkcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QYsl0boTz1iFc4r7d1kiCyDFH67IZP8XlubeG9EYLTA3Oa4A/DBHCubeqUlFaIzz7l6hED7kZ12cSllkRKZQEComb50FRnhSoSbM43lczxQv51/Uh4xOu8OIQGKQlFnVeik9Zr3qbSKdOgSaeuzW/e2bOsKwDuHews9X6IINVkS2yYTpYMYsiy9sAPdfWWy+uoTZGs5Q+SIEH5Mp4m45uH5vYzwiXVQCAFkJlpTuBqNQPChD1XWDkv1pNks6DpG8mG71+QI6X0Kaf7RNVAyhAPKe4XXEHqATbJ6WWtEcX0dfIxEIdtRD3XgPp16tnPXS7zyvJmClsvs9K/GDiiBT1w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EiAYv4Ep; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::601; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EiAYv4Ep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2406::601; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2nLs5RSHz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 00:15:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU/BvIQz3DTXmYOdGLkh+HDcnJ9GH6Ik0rR2UlhlkjgtsQw8N4vsmdx5kcxRf1WgiDTFsBFEFGCSOko8OFp8bcXwF0hLK8E2XfhX0cfhH5I7AKTc8bfK1oCZNB8hOUrPCxA7JqoaNyFbWZOU4PSR5v5zcdbb4Pi6IAJqPlmwtwt5n+8ppswVwPBEj5hbML3avj0BGinez1mF0WlYA/xUIcuC+4Yz/6i7lBq+K4ELNOTPkl/WJwqYJChB1021V9OXylSalQvRZo5fOoOymQUM9CxZOWx/1sXx2apLf+xlqGlUEg5dgzC29XiWSlL4YTx3cGe4DCq4i9yO3m3emvrROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruO6zNzO4KB71Lkb6cSwWsEi4wP8AIx5i5wd80Kfkcs=;
 b=yxXRDrAQc+7mUCPP3py13VkcS1bDJC/YtuPGqof3Dbi6jopCxGFfEmfXcscFobyNUqwyETyivD//2ExukT43zMU8DPwYweB66AXZvSW7ljhlr0o2/vukDatbk8XWea1IGCog2XUGb965zuON7Oi1oFRqgR/e5OGcC3T/24M3R2Jr8zGu7JUkfEmu/hSPmdnVDr1nrxc6Sv6eno/kHxyPD1iRzFQge7UqXIVIztrZq1sa2bpY5GJnhkzCLe3nTqMbnQxdBuWrjLPMcZpoJAQ+lzldYMFFiqton8T/2g+c7RazWm2M8DRfrfjZtFQlr8XAR0JE5uKUGS8qMHAMaeuh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruO6zNzO4KB71Lkb6cSwWsEi4wP8AIx5i5wd80Kfkcs=;
 b=EiAYv4Epcj8RrMO6/lmFl5X0ZqQ0yWhj19Yc3cOkghZpr4a1bbc5yMdbT1f0vEPcgbNCsQAgCHa7U3LhYuZ2jA6OuLoHt0l3aNOOcRKggQiYDbY9m/dhtGEg2z702BeZKdwnrZPLRAvHrOOjGd32buyV/OPmF9MN5ZEVSb6qVP0E4ZTjl/cTiBDg4s268TtVbm4e05g1mZYPEdzALI4QDba7IXBgt5LP3IIAN2GSdJCmZKDqCmihxrUJocW9FnMDtcI5LPQQA5kYxifJpOMGXkhBO3C6faR18kGIZvtz3eWdiF80hllGZZm7PRUiB7Ga6i1QdJmTse+JWnvkMxGBEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 14:14:38 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 14:14:38 +0000
Date: Thu, 14 Aug 2025 11:14:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: Re: [PATCH v1 08/16] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <20250814141437.GH802098@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
 <20250807122115.GH184255@nvidia.com>
 <20250813150718.GB310013@unreal>
 <20250814121316.GC699432@nvidia.com>
 <20250814123506.GD310013@unreal>
 <20250814124448.GE699432@nvidia.com>
 <20250814133106.GE310013@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814133106.GE310013@unreal>
X-ClientProxiedBy: BL0PR02CA0137.namprd02.prod.outlook.com
 (2603:10b6:208:35::42) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3ba93d-4319-4e2a-c39d-08dddb3ce778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WgfRGDEKKHuNso3gGtoTuh6waQ9PCACwW3Xer9wmxp9cTa3pI6GwFYV/fJwL?=
 =?us-ascii?Q?uMkVfKCSxkLu46+hc29ievexAGINSRbhu7JYwTU0XfwC3xuq+YaufFGnn3Vn?=
 =?us-ascii?Q?cpMOGqWuXDbpmMy1LmmxLX4aDD9c/RqOmAZJpv5mfDHm2clHXS4UgOzngTmD?=
 =?us-ascii?Q?pbnofH4YtXT0ZgTGt6BiOFvtENoyZJKCby7Mjhgffi7jeZkXgNkkuF7vGmDh?=
 =?us-ascii?Q?khvbdocQDP08VF8PzLtV9eIf8x5rWeQfu6y+bnEf80Xy+CimU6ZVs1mHDn8M?=
 =?us-ascii?Q?Va20NUjK0kGA2V9cveBWcp/bdylGfAuil7IpGcakYsc2DunpQ+m0adkeTAZu?=
 =?us-ascii?Q?pt97X1t1VXWEBN7qg11nJjbx87HF0c35kmDZeoane30eKI1Bwgqzk4KxsN0k?=
 =?us-ascii?Q?z2GHRAf+JSgcqz0hbOjiQq+F9anqyTVIQdz+aJh1ukalLlr/564G3PicNHbt?=
 =?us-ascii?Q?LPr49wr+78ylFSDEfISFwIgF+JSVYmhqvuofMjkbjsA2VuQjCYrOBrsJSYKf?=
 =?us-ascii?Q?wMjG6p7RvK/pfthf9CtYkKkCAiTp8ebvlOWY8iJxJxT8mucsIvDTNZU4NkDb?=
 =?us-ascii?Q?v0z/o73VHfPBC27fiQ7o+HO5EAktvti/ZcKDRf08rN7aiM8orpyNVQjVcAE5?=
 =?us-ascii?Q?VqHSsE83Ap2qOC4Wx7MWNvrlIahR76FdEunsArmKGx+5oAodiWNfvS0YGRN2?=
 =?us-ascii?Q?VrwJ3wryf4khSFgTIn+gN6nhx0u6l5XkEYHm7FDjqJl4vRLw4hASIP8RPhdg?=
 =?us-ascii?Q?FUVWaoCQo/loIiSItLdVI/vuuhQeMh4Pd3UBiEK+RdifW819zm9snPMqmXPd?=
 =?us-ascii?Q?yzLK5bGg6d9o7ql2oRHHkDSuSxqkaRfTpIPOj+3Ik6+IdkEH819IP0T984MB?=
 =?us-ascii?Q?GERjJw8I3qTw4+P9ABEaHpJZMCGPKunnLkCiBknbFemf3qrgbnlF4PYGUlEf?=
 =?us-ascii?Q?R9s9oEj6fb7pdgt3Z7D/tAq4XuVinG6vE9c0bI6Oie9pipyRh4zv9StX+RUC?=
 =?us-ascii?Q?RGoziCckT/sAPKLn5kmwdLJ2Bkrg6FP8q2mAIgX3tkXxcQyI5/yb17j9TwAC?=
 =?us-ascii?Q?lpzSIu+TbmEYvn8q5IdYZyx5DES0g/s71DK8Ti7Ec6jOzGc6oio27eoJysym?=
 =?us-ascii?Q?nGN83B0XBGN+5RqszR5hWf9HIdGLIWbj5T/HjUYiuiv9XOsIw9JalLguZMxu?=
 =?us-ascii?Q?Hf0Ft6F9d+Wvak/bdzCaK099hIAZdCOQOMhLaduD5CPwfLnd28P1Bhq7q0oy?=
 =?us-ascii?Q?zB5CNRS3xpulZ+kuvwZqEWJlgn3X7IkhLKPVXqqsSy7EdOFAsB5mpKbBM6jY?=
 =?us-ascii?Q?xXn942Pbh5gEZhdr6pQyBJvhkJWKgRDJ2qcsJ9lk/aMqe9n2ldHihoCyfuvk?=
 =?us-ascii?Q?LbSAMpXbaPP9O8ofI1/42MZWsfBTk9ZAceTNxZbfU7nYlIeRaEzyLAZLLkDf?=
 =?us-ascii?Q?PugFFIpY5EA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ms6U7vBXPCNXfF0GBhVl67iuvMBy5svsyOMzkXNcqhzlYf1dmYfKq2Nmij66?=
 =?us-ascii?Q?OVFGvrCOTzbOh059BMs8Tv9pRrZyWfT6AoFkl6pqlLn1AwuNLIUBcjypj9Si?=
 =?us-ascii?Q?DisYDAzEuEmEY8ycUcNzX50mNwZqWctD3qkLmCe6DfDlcBmbBuzMI+ce+KUB?=
 =?us-ascii?Q?6B2e7Wgunr8p4yJYBk5XBHGix/CkyA6NI+7rhX+6KxvyJcboBaP7kGqSLNmq?=
 =?us-ascii?Q?+KxNz7lYKeI2HFVQ8imPYyMAANP6ep7ViJxkO7OUDseBi9qt/ce7kSCoalyF?=
 =?us-ascii?Q?wo/ef9acXkJMbu5DDF0AXieNFw7wQYWAjfko1OFeF1fe/cQw0JoTSj5MZzhm?=
 =?us-ascii?Q?LxPUPWHGEPd9ipfz3oTPSl5tb1ts4zqUOGB4W7PRmEsS1PQryPt1Auy+kCoo?=
 =?us-ascii?Q?x5HrqWo3yCR6xYlpJ2CKzWgAzDzJFjn3lA4RRzZW/5Rmja+E8m57KY2u1CPX?=
 =?us-ascii?Q?w00gf6QzDLL6kxLCEUGqHWvYlhF+TAVPT45UaBUe7+zAvpXZJWT4qK3BB+fu?=
 =?us-ascii?Q?nsiuwGIKa+U+yHvfI/3QxGP1J5OWvjcX1f8OmTtQxj7heNGEf2nYwiVKqRwA?=
 =?us-ascii?Q?zFpBrMRMlp4V2p+m7y4272Rvs+6mXdf35v1RIb1GwREMyrZXXTTEKFc/qesT?=
 =?us-ascii?Q?/eyXLujUQ7citeil4d8XUsdbwnea7L8Ng5Lj35chGwPoAAU73YMaupxQ4DJV?=
 =?us-ascii?Q?sDA3RpAfP+C/qKCvYjs+uDSQfg19c9GPIvAzL2mB5choh3ThGojNaTxt21wz?=
 =?us-ascii?Q?2OWWSQbqxheAY2Ie/XZUrM+fulMsQgneFpJfX1uCK3BYY3REG8qiHcYQcIDv?=
 =?us-ascii?Q?Mp/HyTJ+r5eeOqgN3rwUK2nEKoSXN6xcSN1K9PWZvCVVXw4D3bNH7L6s0+s9?=
 =?us-ascii?Q?wkySC5pM60VQHd8f/+hCv+tlHvaP2MPRTKmhKAkbobGb4WhBzQqSYZA7TY73?=
 =?us-ascii?Q?yukjLnK/vX0ZRyl/TVGMVuZ2lSdjNfFhBIQ7MG9eZi1o3TLQ4QDCFlR+ZiYT?=
 =?us-ascii?Q?Dfnv3T2LSKCksXjW69M239HzwkibI36EpyYyjfzZLrrnBWMQbRVqNKj4oA56?=
 =?us-ascii?Q?EYklt+EqszRlpS/LmjnVgif78n3Eb3RdRH8bYqx7oLD5mr01Hd6hGMo1fkhw?=
 =?us-ascii?Q?ALOjdVyv93NltYqgqO/AWdryKewXkFSpcQUI8SbO4EAlSL57X/PVnw3ixwyE?=
 =?us-ascii?Q?VnAcBOD10mUTQ4fztbJXcAmZWihBN+Dm1OKQmzHrXrOPblHtKgpos4Hcijne?=
 =?us-ascii?Q?yGBu3B1ET17jPIbAMJ/YiMb0MS6Ajq4RYxkfYfklDymLw4v697LNdTEA/e8T?=
 =?us-ascii?Q?S61phmSvM8ieJ7/mxeLujIRjQ+wkqDdszaaxQaOHVb9X/kh5Bzhcg3E1d+Yt?=
 =?us-ascii?Q?vmZ0WOYbT7opDnmYKQryUIbKXFxeYevn7YRSnKElJmwTNScKbhq8DcsdNnkl?=
 =?us-ascii?Q?exe1kSYhiadVK8Va5w7vBTB2ics02mUjfwdQQf2YkuOBJUcaaJFjCoPnyw/9?=
 =?us-ascii?Q?ZZgPIjMlMGxv5RQJU1oOs/y+Q35UxqyCbBx7IXQBVCRn464QWGHBBiSMnUCU?=
 =?us-ascii?Q?Wej8KLKb55TFSByZORY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3ba93d-4319-4e2a-c39d-08dddb3ce778
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 14:14:38.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kxcnpRJdzkjJSknvpZS0FJdfGyvwWOi0/OrxCvD+JZOt7jnM+9F/HzOjYt2sbRA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 04:31:06PM +0300, Leon Romanovsky wrote:
> On Thu, Aug 14, 2025 at 09:44:48AM -0300, Jason Gunthorpe wrote:
> > On Thu, Aug 14, 2025 at 03:35:06PM +0300, Leon Romanovsky wrote:
> > > > Then check attrs here, not pfn_valid.
> > > 
> > > attrs are not available in kmsan_handle_dma(). I can add it if you prefer.
> > 
> > That makes more sense to the overall design. The comments I gave
> > before were driving at a promise to never try to touch a struct page
> > for ATTR_MMIO and think this should be comphrensive to never touching
> > a struct page even if pfnvalid.
> > 
> > > > > So let's keep this patch as is.
> > > > 
> > > > Still need to fix the remarks you clipped, do not check PageHighMem
> > > > just call kmap_local_pfn(). All thie PageHighMem stuff is new to this
> > > > patch and should not be here, it is the wrong way to use highmem.
> > > 
> > > Sure, thanks
> > 
> > I am wondering if there is some reason it was written like this in the
> > first place. Maybe we can't even do kmap here.. So perhaps if there is
> > not a strong reason to change it just continue to check pagehighmem
> > and fail.
> > 
> > if (!(attrs & ATTR_MMIO) && PageHighMem(phys_to_page(phys)))
> >    return;
> 
> Does this version good enough? There is no need to call to
> kmap_local_pfn() if we prevent PageHighMem pages.

Why make the rest of the changes though, isn't it just:

        if (PageHighMem(page))
                return;

Becomes:

        if (attrs & ATTR_MMIO))
                return;

	page = phys_to_page(phys);
	if (PageHighMem(page))
                 return;

Leave the rest as is?

Jason

