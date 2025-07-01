Return-Path: <linuxppc-dev+bounces-10012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE168AEFCD6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 16:42:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWm3M0jN6z30FR;
	Wed,  2 Jul 2025 00:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751380975;
	cv=pass; b=eki10g5Ivi89hBQRiU/thM3c9tj1LDAa4iRQVtNLW8YqYXFlo6WgaXZ8IhpU0GwBiQIdj6ydKZE3BKZPtIaFKGeMJ9L/zUhWtFe5y9xoWq8d2p+RzWBF2rnG6p/x5mkvnqNIwu1p4qrT8nVd/KtzBddohSNXWEVs/KusEsQKvqha4umNOIlSnnrwd1cgrAnuGSE2Y9u/rK5jTwlS0qtn9GWHDbaMjxI3ttAyEk4u/MSIU0wZWGAyvHQiOirzmjmFhPq2WfOJFBk1e6KQM48d2y37XvAF+kYNyqDcWziSm7ILXw6IMIQOT1GZi83LALN94dfhxBPfbMB7FXiWT1IWlw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751380975; c=relaxed/relaxed;
	bh=55F0DnEOnVcghpcpeyZOnU64D9v7S1tlK2FSfnVU9Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i8TYl6J7whQzlDsx8wC3LfsoBUhelb7pvQ4QlvkM8eXUfTluPT/S6OasN/vbcItK6DurtCKjlJOeDX3lcvd3uGwZtW/nM6JuXrDOGY1FuS9vMnwND2nTKoJJbk3YihZe4YQQUUE9oAIGX7k966f4B9F35+x3fsI+gcn6gAe/dHmh4mMFX37DfqG0hOaEboJbmR9agRO8iMFmGvg0WuI+pgey9RK2ynSmXVeHLklUSgy2hntge7HBd1SZYSQWCrpg93rkg5uidIwKdxlXHqn13ZAefVLFxTaorqstX48cSFQf7L+AU/vU+3aLa8XAmRHv2XNRmD/3d2V/I2dQTyxSEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Bwi570hu; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::62a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Bwi570hu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::62a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWm3K73lTz309v
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 00:42:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shOVK/XRB7iSXV/Z16zKA/ApILCG9AHPomeRnL/kJDlB++yipsDTxSawqL70IzTyuXnzYJR31E0H3NWMhgzxu1e6qoBcm+z3ugNmxEwcAMba2eWvopuboboZ8G78O3WyoH89sqRva6s/gRejaTC7yR1Nr7WByxSFHhP0olOdnsSeK6tHnXDN3v2cBTE5nHdicOnBtNafH+K+j9iugtOfYMn5ss4WG0UUp5prKcnNmpQUxoQ6oADsjdzZgRsalnVZI0027bjGKyeXtwCkF15rjKy2rL1tdKpplM6nWXioxDLBuW02wbCWGxj4V6gVVXSqMDAt8kYnAzkmM4lvKcMYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55F0DnEOnVcghpcpeyZOnU64D9v7S1tlK2FSfnVU9Gc=;
 b=yt67sVKFGgHbi1+yqEa+B4uGPH7Nealilf+kOFheOE3+P58Wh9qCWjnea19ZqdZJ5x5+LvcqtgrwPgvBfwaIiYWiijF+uE6fkLFzulNEEKwitMqs8gSOgyW8Fe3mjWhGFtFmleHp8DrE30cuMgp2je6hFjx1p1vPqbP/GSEopWJ55Qsvx831WcxbciYF6j1/d1AHa5UEULzgTLJtp0azVdVJOn74TlDm4pd11hhUMnJk1F50HcjlNnuJ/5fKftP+sq+lsdfAN77wFlRkuAwWYDH1uzH8b6LsBe2X3UEdhf4KfF5LDwfErrFfU2qRrRuYKf4c0Z9HBim8tqzk/9NUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55F0DnEOnVcghpcpeyZOnU64D9v7S1tlK2FSfnVU9Gc=;
 b=Bwi570huOPsZ6YJa7xqNlry0R+Z7iENvFaUZapinvVJXfNiuPm/Mks1ssEQoJydoKFQ2fQlIrVcwjuJYFUIhuu4jUtZUoDyYHutR12+nefVyZ+NAek519VynpO6xDpG6vCKGQlXRfPWPMDBsi073Jxwsgk0h0LQ1FT61KId/WUdFrT5hVVLjp6++WMXcDiTPxJW5EziW0BOEIFFuCA+vsLc48SSij/sHV8IahZUt/qLwp3FgNZxmZWHzA/HbfeRYiDS8LkR3iCFDMefXIY7gsjHqHmao/w1foZP8XGFq2JgO9H5KeNd+W3sTNa0kE46FAb9ZgciAisE0jqq6zBN1nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 14:42:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 14:42:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 08/29] mm/migrate: rename putback_movable_folio() to
 putback_movable_ops_page()
Date: Tue, 01 Jul 2025 10:42:25 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <95053F4D-04E7-4961-9DBB-1AEBB4B71255@nvidia.com>
In-Reply-To: <20250630130011.330477-9-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-9-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0258.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 86453715-a9b4-404a-883b-08ddb8ad8245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vq6r2rSXg41q4gt/3E2OszCQnmFvEVfRmYButbkENJBaDMcgk8eB6mm/Easb?=
 =?us-ascii?Q?DvY8wVd9Xx617BBUwwLJPqq/U+iC+YMxHPODb8i8Y8rPsBaOsbSh9IlPrfHh?=
 =?us-ascii?Q?PsuJ0GiAfBFya0S3jR7YzrnXKU+EDynUwIiH7xDdug5vEoA1w8REZyhVSPXl?=
 =?us-ascii?Q?C7am2h78V3feLDUgE4pnFjdJLBTcnKb8jGXA12f1E8yvhkJ3C6Z28fuVx5BM?=
 =?us-ascii?Q?ErCGIUkEcp9KBGGgZ3TlHZ/U+OaNPY1S1rAdfwaGxLOsLzv8n0mxWx/POKhw?=
 =?us-ascii?Q?7wc8WkAKczThVjp8VtjqplNIYNJCUuL8RiWfMtMelrwEJedxPjlLd8FG3uOC?=
 =?us-ascii?Q?6VuHvdZnElpiFTzE4AR+4Hapl4aautQHKfI1MfZhyVXiEqzfSej550I1wgt3?=
 =?us-ascii?Q?70J7W7fmMhNptZueI2/U6W2vfh50WXLjHnqGHICUO2hb7sTl+coj1G8gthVY?=
 =?us-ascii?Q?nf16JcYjnWpPHK/MGOZ77fgl77SM6umCUKzHUzcMnOSxMnLSTCrvqBzSI5ay?=
 =?us-ascii?Q?rR8uyCLls+Oof/yRWw2nPaRTumNgwimm283tjTTo6vYD+1tA+QqC2c6ETgIS?=
 =?us-ascii?Q?fDtky3jGYK6MRIxxwpPnXAiNcRDQN3N54uSbtHtBtLylQ9l7NWOQKNxMjO/D?=
 =?us-ascii?Q?idHORIF1f8pWPGJX+nnPE1G1yRr2yCZQR1ySeUm7Q3TW8xoLkzqwNaTsG/8Z?=
 =?us-ascii?Q?mME7FTOd8uUAitw/G3tckMia7UfbQNqq6UGWITb1LZF+bGiDaPf+Vimvves4?=
 =?us-ascii?Q?DaivfDLh7wGLlU4GFsKVnM9Mx2mqRAiJYQYFxvH1CnoQoAwzaJK3u/PKFKsF?=
 =?us-ascii?Q?GTwBI9zogrw8PCRbCwHSDYtKNvteCvEtkrdud2a8doRdSu/8ZiORbQ/NyhZ0?=
 =?us-ascii?Q?mNkSelj9kbVI6ZsS8AzlZDFQG+TF9cCWI3mNjAMHZqzwBxzffDnbXtn0JPa7?=
 =?us-ascii?Q?32wAc7tNnUpsbr/UVyGs5nfOFGqocAt/0QoV3tkhsg3KxDOgbAtanB5Bh0lK?=
 =?us-ascii?Q?cRgMWlvuRACBp09GZaAMG9YGW6wGiBr9mMCNKXlrKA8izCNcQMPQbRIAzGHm?=
 =?us-ascii?Q?DRp8ECxuDwkS6ejJWtufKV3q6GmsNXiUgsMNRoOfuWUwUkUPHarxm65qCCnt?=
 =?us-ascii?Q?ipcgPNUW/CzTixQ/EOM3GOdGSr0+JbdozfjTq8FoOBuiv2hX1ArvYh4SlA13?=
 =?us-ascii?Q?Ug6jgpomHhvvRunJmu6tf/TULz/+8vRQFmEjigP4RRczpEvl6r/zNUoipi88?=
 =?us-ascii?Q?xTeTiQADl37rj56y3DnW0gevyUFz2goWLpf8Ra6JwHp5TzUfrcmdp0auwGUs?=
 =?us-ascii?Q?VCGi9Q5fq0tyjJlo6MrjwazzdSGgubw3P6t5vzvLobCPXTXyzBM1eL7tXfVC?=
 =?us-ascii?Q?TMQ0cEWdfMXxzPB2Bb0Gg2yeasfeJSU/HWtpaAyusAguElF6anSjLkYsepjk?=
 =?us-ascii?Q?GlYgmHWo2z0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mn0gOkmKvHoqW8wro7OeItqiY/Ilg2UOp87LREyOEo19tBCTatGdcd+ZAGva?=
 =?us-ascii?Q?MOdkV5AlOYtRjB1e2S5EBjEO2xAsnGzuv4ZKf2DV/g6WN43Z9ycSuIhnsXob?=
 =?us-ascii?Q?H/qYW/fB9ba5v43GsYXO4Eo7DEYpXFVrkbc51Y50XTrLWuFFdTzsXNuztpr9?=
 =?us-ascii?Q?j+x5sAlntd8w3Vvuy3KKtydK3PFP6cQPfYuiWh/vKrRZqWEaZu9EaZ2ewewr?=
 =?us-ascii?Q?abzwGs+5ZuQCXVlvRcpF2NrYLX/wJQ9IumfPNqykuPc2sZUM5/QYsBKGHtHQ?=
 =?us-ascii?Q?YzxXZC5ofAWzQMFGy1jNT4DltUV6KzlW/D6DxZQVHU3XtsT946n5wJbuJGek?=
 =?us-ascii?Q?xRe41gtXOfx61853xM9Muj54fg1uGqUvq4EI9Pl16v9QQiKcHm9O2EmZ6gAl?=
 =?us-ascii?Q?lWeEWQsovKm+bEu8exv9C+EM07f7K6S7PorV9xtkBoQk86gcrL4/gHYKmXqx?=
 =?us-ascii?Q?CrRpVXQKfbebeZ81ncEQp9zRkrsmxM80HmR00oEkThlZHdFsNCrbcIiM7/Xb?=
 =?us-ascii?Q?Fl3pAZaR12Z8U/WBpwUJmt3KwUXvwYSw7RaAozb12z+9zryvhOgoJA+Sccq5?=
 =?us-ascii?Q?FZjfWh7w1CaK7Rq54ApR2G1NESRE7cH+U/UsgZfz1hfHcK8SeeyYR4uSSfUa?=
 =?us-ascii?Q?AvYIYRYah9t5t8Ziek1cmXWjDrT9BEqFX1gFWCaNFQvT9c3bGTG2PpTXSMAJ?=
 =?us-ascii?Q?2lfhSppqVlfb6vZz3FfFcIPMqDrzv5Jpzy77dqtYMkJBBK+E0UXnL3WFkiy6?=
 =?us-ascii?Q?Q91ZjIZFatKgtf6bU+L0BMR+uXzx69Fzq0iWwR9y54fgLDJsyhHf+2/YQUtC?=
 =?us-ascii?Q?mD3IZV625g/U8PF5RwGI4LtdtcrmLmvnObVPJ2JIWLMIiOSGLZJFQmtliwtQ?=
 =?us-ascii?Q?5VP6GICvRRKp/MxV4e+IJRxEwGnmtkBrejxOpkFriWVCdtS/vKUaf/KF/89W?=
 =?us-ascii?Q?iz2+wUzFm2RaSObgUJqGZq1TWKKy7u45bKwh5HIBHx9vmteDicZAXvdeN/mB?=
 =?us-ascii?Q?+V9lbF0akiCLP7GdRceDCUKSR3iobRegBHEni5RFkTv+jiSHWUdlTLRW0Ksq?=
 =?us-ascii?Q?CRuORLvYjQBD07EMXWfRShS6ueUPXRvO+27rzjqpM5JkIo1mLbw4WvRnSFWx?=
 =?us-ascii?Q?t8rs2sYMaGnDbgNDn68/tq6LXYkHAylTX/0pGWuoaFAOZvEbckfK5qTSEcJX?=
 =?us-ascii?Q?mC/910R5JH6TF8/KiXlfOcQQpfQ4fCgBkhxi9HL58m5RcqsHkqZIpXgApj6h?=
 =?us-ascii?Q?yoM/AgdkcHphczvlhvspZ7J3972+UoOTArZhDQXpqPq5x2vNWtlpWTtyJAh9?=
 =?us-ascii?Q?cD4+ITfqFylEnYwfToM3qiafJoCQxJCXYCRw+3NX9rzHP0BWFcu4jzutNpDZ?=
 =?us-ascii?Q?IE+UdgkSdSgLnHGDgbosX9LkhZXP8iH9g+Qbt9xDTt0NhcFS0n6Es94H0kcj?=
 =?us-ascii?Q?aIj669u+4I2Ybb/642FrYZcev4WtAQynhAS1bRxUuQfM9O3Oj3A3uqic0NQA?=
 =?us-ascii?Q?2EAJuEW6rjDNGC6jcKwMrxcvAD9TZWe5C2sg+0DgCo4NHoFpwyaw9JY2K88M?=
 =?us-ascii?Q?hIjmHOIKFYjQB0298UQvs65syMGig7gzrGKNcT18?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86453715-a9b4-404a-883b-08ddb8ad8245
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:42:31.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhTvUw3s2tE5uMaIAhkhCPYj0PyoMdWRf9R7e3xUXWkgjOROF7Nl2D0EakRgLTRT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30 Jun 2025, at 8:59, David Hildenbrand wrote:

> ... and factor the complete handling of movable_ops pages out.
> Convert it similar to isolate_movable_ops_page().
>
> While at it, convert the VM_BUG_ON_FOLIO() into a VM_WARN_ON_PAGE().
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/migrate.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

