Return-Path: <linuxppc-dev+bounces-12543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F0B96F39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 19:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWRLT0ykNz3000;
	Wed, 24 Sep 2025 03:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758647408;
	cv=pass; b=Gg5sWqwh+F/bIK+bXbxeVB87hrKsoTCY9De4LzDIh+4lsUDIPWxtHc2JRjBVunZWdM9Xif7rHxWzE9zIj9AW71gZjNdfDINqO28YzuQLrscrsm+sFOYR26MPDzf2Jfd4ppbRLJbmxR2HdJgkLkE6/T37fY80Z3LrnA92f6GvfdbYJtyQ0ElL/eIXTyi/49s1ULg+R0Wnj97iCWiZir/Qk6Sa0j49A/ahYEex10+U1YRpRqLHE65HdSt/iMLl2UrFW7AvqGm34v1Sv+8dHsQxkLBy7Q8rOLSj8UZLrC99UgEmjDUOZYcirSe3Hi8WGwIZDgtJl5sbNhccNknfOXvVmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758647408; c=relaxed/relaxed;
	bh=zfBJt5ORyJeWyTmriSi9rxIRbYwbq9D6z6afL/pAXS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KE1Ug7J6QpoyHDnK4B3dkAG4HxdpTi5jAe/6TWCgPNG3kGajKonMfFfO1ZqGonMuHp9cIV7+N/P+icEtTcxgqDAyN0imItQuv21dgbaZHv9qv5YC/XwF93UwO0KVecymcJZon3JJ3NpwL1jnUEmISqkRrzQg3qmpWm9t5L1TgciPY6Zp7XiP/Nq/3/J+deQf+ZL2QaJMHI3AvRCC6JOhhAA/H+5qJPah/Ml1gZ8YMKO8NbOQxZ7BePNBYvgoaK/mBEqVHkhJ4eWEvaq2vz17uZgfZrnKD8pLb08C3MT/edtkCNNsqSJRPMCHKCBP0bRQRqAuzq5yXlyCbmjExdm8wQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Clve4RHO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Clve4RHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWRLR5G0Mz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 03:10:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWXggwVgG5+rl5z3SotJHQW1m4VjyXkt4rjniHHR2g+2Y3BHmjdoAqeVdP8k6mFe4IPb7kV+kge+ua1wSDvFL/quwLj4xhgtg8qlTIIUhCND6ACY1ARSrSYQ1pBHaSOpuwWRUe4OCI33oN+aektYyfNGfWTTlHi5lIwPl+an8UXKbN+hNUXK9Al/EyVpsysGtHD3vdUrEgNt1EMA7AVtqQwfJvPDoxL69kJrBOAbNaM3P//k0fFCX16uKv5cS6gw5sNS6VeWBk1hZgy5h50/yWGLyF4jP1+0rbw5DoPWdZbzD2HEXux/VkFJmyXHmptrQF3nI2FE+1vg30x+4Ui66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfBJt5ORyJeWyTmriSi9rxIRbYwbq9D6z6afL/pAXS8=;
 b=c4pMUCw0BfP/FSxTb+iJvOpFnhv2VZ5tk4N0rFUs3VE5JxKA+/LCYfsgEscOPhkcBmn8mnqWcvQBR8ozQh3kBNvhm/k8t/iXX0N3X3MAB7NL+3A7G+2SRwEnBiw9tNhNJ++RJMXlSFhasUB3UKspQrLRpqDBn809urbmvdRpCe8BQtw+rAQ3B6qSQMHUcXgjB97FDu8Z8M/QGUR/kkKu8BrcsyDg+z1FjySil2bvtHYp5VbPFYh3DrMT5KLkFnOVJE3g2Z9jrRPkrKYpnxDMu5ap+AsWNINW9UHaB4ftMQ/b789+skrb0bomTQOX2Z14ErVFPJGj3bG6xxi2XV3jKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfBJt5ORyJeWyTmriSi9rxIRbYwbq9D6z6afL/pAXS8=;
 b=Clve4RHOxCmnuRZI1E6kaQWOMfhYl/gXKCQEkQ5MRl2kUIrjhbIR4RSReFQ4rSuBhHkpAhanzX9NW2skuKFHEmfVa54Dw9rU1UpMbeRRdeCaTVsqubTq5izKSmZ2udMsGlUy976lrNdGvdmcewLGFwRbyDxCvRPRoebjb0xsVLmuoCx7xSrUXpYQ2q6w72pNlFOj9SpzTionNFu8B24ImUw3Ndcfg55P7wKftC1gE6vXBr7HTN7jnMw935VCoF1V33cShDJxWK0rx+upcHZ3CsEhvN/LdNaaegoduC2dMaXY5bYkNtV4+9iHn88R4gzIty8gy1HBx5HgdWMNwtZsXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Tue, 23 Sep
 2025 17:09:39 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:09:39 +0000
Date: Tue, 23 Sep 2025 14:09:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
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
Subject: Re: [PATCH v6 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250923170936.GA2614310@nvidia.com>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
 <aM1_9cS_LGl4GFC5@kbusch-mbp>
 <20250920155352.GH10800@unreal>
 <aM9LH6WSeOPGeleY@kbusch-mbp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aM9LH6WSeOPGeleY@kbusch-mbp>
X-ClientProxiedBy: BL0PR0102CA0062.prod.exchangelabs.com
 (2603:10b6:208:25::39) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: bc204952-1979-427d-43f4-08ddfac3faa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SJmAD6P8WrWWuHZOaif2sELSogZjML3CSOMNpyLWiBOtInZlQ+z3+HEwPek+?=
 =?us-ascii?Q?xMrD+nXnpvB6+wyNA1MiGP7PUnMUXGOAo3Uji+JoeKTFjjpa2Wi8Tbdyy306?=
 =?us-ascii?Q?lwMaY9apU4XbSh6ZMNDCYILAWKLg9xO1o0WaQX8X0t8PvWqGVI05dXYUfaJS?=
 =?us-ascii?Q?dP23xF90g3yxrMg3E0ZweazGKCUtcpUk0BvZseMZ9Mn3ZEYPDC6SUqNTPyT5?=
 =?us-ascii?Q?h9T0/JdzXqp5RVHFb0bCnTeE1SrhMbi0i6Rwq9D+7fSAiRtjgDGvD08j6Dh4?=
 =?us-ascii?Q?9zDSElycQTqtC+SxuEXwPTeBP5j6mXPlytrpc/8I54CGMdxY0OT/iG0EKH+k?=
 =?us-ascii?Q?fKXK1lmN2YB3l8NfwJKB3i6Bz1OJ+8wsnPpvf5DTWI6QOizZNh1dlKcg9Ons?=
 =?us-ascii?Q?TwWJMjyGVaKnEc2KUnRHPRc9MXBxGdU2tpcoHFFMsv9ME5toHcHyY+5fBPyE?=
 =?us-ascii?Q?3Lb1wA0tfhFmNLq9dByW3S/Z+OHToqipzWlBOL6llXnYqFA+YekgTSmj5THl?=
 =?us-ascii?Q?IUevUbBBCkjpZQxFLPv0NEJI2jBOhEfviO8nRNoLyQPmgl2v4GXdiHmnd5B0?=
 =?us-ascii?Q?qgOqPkxSpeWRVpwdlX+vRBOY8V8aTOnh+PZoebudEvEnynv7uqK6MA0Pr1F4?=
 =?us-ascii?Q?+TlSLo1HaMFQ+fiKgoBluBBPW4Er7lSbish+pOk2mGuC9aJf+Flh7VdsNF6A?=
 =?us-ascii?Q?UBkhE3SDC/eCbRcZtuyp5GvG8SnptVS3yn2DsSwwLQpvFtNh5A2kh4ZNKih5?=
 =?us-ascii?Q?QE5ni5X10wtQk9Lj7T3AchwuQtLJwd4rBA7qvGl2P71YUZWb2LPuBW0/72Ko?=
 =?us-ascii?Q?HO0ZQDsdrG8umM0sZrIhMKAFizButughBB28ZD1cnb+YnbeglqerRHRo9O8o?=
 =?us-ascii?Q?1tTH5/UldaE30aM/XBB3HqZ6cRzzPdXjNJQwa2kWysbdYBzArHi4lJOq6uT+?=
 =?us-ascii?Q?mZxfrv0YS27avYVToN6qcOyuSpCKxEBWrDJacnMkhhw+w06PXPIWOVgcLgod?=
 =?us-ascii?Q?pRGBSZmi4gYf6GWVOypTrxrQ0KtcbuO8KCcCkSjevTbrbQp5gUbkFJW/lEoY?=
 =?us-ascii?Q?zELONf86F3MT5VsZE9116D1a+e6lzmJCL9whVQqkV5sdp1irFJ+ropB9qI/k?=
 =?us-ascii?Q?gGCmG061yMAzLvZxz6tc7q3/3RWpV+zHLlQxPe1v04t0wauH76R68fyv9HNn?=
 =?us-ascii?Q?zn9NF6ZRGRZ5r/qNo2Uw/19OKlKFBpbeXLMMvKu5NQTSsADFKP7IT7jD76xH?=
 =?us-ascii?Q?mn/fba6qnsgXbTXfsL0KdhGksYcRoJxVvi8p2TUhJ41p79ubs5tNZJcXm0IY?=
 =?us-ascii?Q?Nd/QX/TgbDELc27Fsek28z6L76ISG+5VrCn+LPiDjw7PEuA4X6IpJ76tIYcL?=
 =?us-ascii?Q?6ccVwWP77+YQSyB29uu+HetpBBRd/bjPUMECjnJO/TWb3cSYEl3+bHX392Dy?=
 =?us-ascii?Q?2VgYRkJLZZo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9brSa+bdlvi/6eftqG0wEDppljbQgJEznYpb1kQH86dDICWbUMxtWiwK0/X7?=
 =?us-ascii?Q?4rEWjqAc1kRsokCGBoz/oQbnANRsFgz673fviV3zWc3btFSRfD9I/XSh4cqp?=
 =?us-ascii?Q?Q+Q+8h58Gm0cfSghyhxjy0uUK1l4e4fzZLwD04xX2uZPZxg3rHzASRTDh+us?=
 =?us-ascii?Q?qgCFEDJR1PuMoPABTM36UOjJ6ub0/RXqf1Q10EItpXz66f9Eqppjjk/LCCMf?=
 =?us-ascii?Q?49LiQkJ7Jeo39RkV8AIR7CtfJoLZrdV3MdmykRQ57YzURLJzvykAbUMGKRFx?=
 =?us-ascii?Q?OQFm3ar9RMXa+/T8WxRzXgwMvRW/YW7wivCv74tpewW3AhCRCEu+wj3SOSB+?=
 =?us-ascii?Q?4RlQ9MjNbsW7Jl9giTy6DXl4x6Fu9qIX6oRShn8Uilv+pRN/ry8KE3UcA+Wn?=
 =?us-ascii?Q?ULvpHSCX1TyG+D3TBfE5QuTqlCG3isyhf2JNFtZpdroPhK0r/PANzfcv3BWG?=
 =?us-ascii?Q?5+EH4FUjAbQPDabCUvlrG6EzUYfox05xMC6bLMoreyRPS7Ojy2mp1v2pIg7j?=
 =?us-ascii?Q?7c1YIEg/truGG6QwtrwM4sI/9Vf+vz4UxPJNkExIvW4XDBa07XUdpPIfdPwD?=
 =?us-ascii?Q?wx9RpRN+d13xiSLdQIFkuqZII6bHusCMmTb9E4narF0h5L/oEgpOqxsBcHBg?=
 =?us-ascii?Q?ewdVKMLIBuo4fNrUkHkFKGzyKxveEUg9bW8w2PUI6njWI+DQIkg5J+YF38uK?=
 =?us-ascii?Q?Ew1CW/yzGdWCvjC7hpcT8Ks7ALN72NOBDVhNCOMPtfuQ00fdyYU/ImkkcDCa?=
 =?us-ascii?Q?OgXhBxMQtCnHPN/94sn7nXKb42TanX5SvZSuubFyUn9YK/MPNCkdbSd2cvPd?=
 =?us-ascii?Q?O+eiBurynvlcVjvyQvC6tIMszTe9kXiIDrHL6h2TvytWCOgZyCSBQYmy8HjZ?=
 =?us-ascii?Q?AJE8h0BeCiD4GxdgQU0B9kVCJ7SRRuaVeWcG/byzaTRliSgzwspmNszSU7vI?=
 =?us-ascii?Q?w1zJZCrHgFDVq5KyG3ask7NK2W0l6gI+hQBLGORGHW4LJCSId4OVNZlD53px?=
 =?us-ascii?Q?qw+5w0iybqAX5cb/BcIO3BvJd+6Dvl9TTQXENrWmNE4hrPzOz3r/cCf6XjLK?=
 =?us-ascii?Q?MOa7ZLp/kRBF0xUqB0hEEAt7uVdrDwUHTBraQMBLZdDZS6Yh5Wmnam1J2ZZu?=
 =?us-ascii?Q?gL5lGS0Sa8F7GW+ZQWERfs/8h3BinfAAwALQr+XognophwGG/PoHnulu55wn?=
 =?us-ascii?Q?N6N61LxtGOTnozw9ccWDX9sp7X/5ZZUgMTNqDe5HPkkzf8E+TRIWQaSqsUMZ?=
 =?us-ascii?Q?h7hVC2StbNxHjI6L/97Q4lxxwCOl59nYpHes7gqUxhZIKkFj1NJ/QML71bGJ?=
 =?us-ascii?Q?SRBra1y1gGCD6HM4rDZdFiWixSvuP/Zl8olGEJUgiYR0LZo7l2+3qJ0DENnC?=
 =?us-ascii?Q?5qugSmfjHJFJVySpdCgDiGx7H/u147UlCRCnLlNsX1sBgdSO5fMLmg1bj1M1?=
 =?us-ascii?Q?8KkyHbCIbZvB+TBvJjr+HZZoL9DomFAIc8tlOZAIx2zdP7zX2hvfN/h9EOpe?=
 =?us-ascii?Q?dRp/8lGy1sAFgNZzIblQrUHChTBvYY7FFJUihHYLu0AQAC7CntY0Dde2YTGz?=
 =?us-ascii?Q?SOVUD2AqRajEjF69PyqwB/dZIVBwUeZ/PoDq/A15?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc204952-1979-427d-43f4-08ddfac3faa1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:09:39.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceigpDcxetN7qTmDdR6xf/u6VfAhbxjc3VgXcalLxLEkjfvE0x+7MsjxHGl5BBWd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 20, 2025 at 06:47:27PM -0600, Keith Busch wrote:
> On Sat, Sep 20, 2025 at 06:53:52PM +0300, Leon Romanovsky wrote:
> > On Fri, Sep 19, 2025 at 10:08:21AM -0600, Keith Busch wrote:
> > > On Fri, Sep 12, 2025 at 12:03:27PM +0300, Leon Romanovsky wrote:
> > > > On Fri, Sep 12, 2025 at 12:25:38AM +0200, Marek Szyprowski wrote:
> > > > > >
> > > > > > This series does the core code and modern flows. A followup series
> > > > > > will give the same treatment to the legacy dma_ops implementation.
> > > > > 
> > > > > Applied patches 1-13 into dma-mapping-for-next branch. Let's check if it 
> > > > > works fine in linux-next.
> > > > 
> > > > Thanks a lot.
> > > 
> > > Just fyi, when dma debug is enabled, we're seeing this new warning
> > > below. I have not had a chance to look into it yet, so I'm just
> > > reporting the observation.
> > 
> > Did you apply all patches or only Marek's branch?
> > I don't get this warning when I run my NVMe tests on current dmabuf-vfio branch.
> 
> This was the snapshot of linux-next from the 20250918 tag. It doesn't
> have the full patchset applied.
> 
> One other thing to note, this was runing on arm64 platform using smmu
> configured with 64k pages. If your iommu granule is 4k instead, we
> wouldn't use the blk_dma_map_direct path.

I spent some time looking to see if I could guess what this is and
came up empty. It seems most likely we are leaking a dma mapping
tracking somehow? The DMA API side is pretty simple here though..

Not sure the 64k/4k itself is a cause, but triggering the non-iova
flow is probably the issue.

Can you check the output of this debugfs:

/*
 * Dump mappings entries on user space via debugfs
 */
static int dump_show(struct seq_file *seq, void *v)

? If the system is idle and it has lots of entries that is probably
confirmation of the theory.

Jason

