Return-Path: <linuxppc-dev+bounces-9492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B344BADF5E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 20:32:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMsmd1xmFz3bsY;
	Thu, 19 Jun 2025 04:32:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::62f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750271569;
	cv=pass; b=MRUK135a3TNE+5LKKLteaZYmizBSaiNm1pfsV1SmdsW08ekAzBLREo7OVfYJQccS9ZSSaWUSIm+e65cm5kLiD7M+DQYoFoHtblZWwIb14UBC6o/0T3WYEnHNpHht78aIGb/14N2hBz6PyH5fVkG3m3Vl5R0i5D0jpfANIN/o7RC4h2XNpi5euJsQOkZsOPDAVo4eQDqKmS//2bBq5kRe8eyciGhADJtU1RQa/DzBwm0WqnQtly8hZ5YM3o1oBaTrY8LS6X9wByhy2UVkB+VKzL8QfQjwG2RdwJ3gXwX5ArkY6cQjwGR4Y+hjoeV3eV36orPk7d+VyqUCFmb3Ar/yow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750271569; c=relaxed/relaxed;
	bh=81krn+59tOTKbL5GPBiMr+NYgG6giE/kZjheAbqXnK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eaDs6tLrIlm3DvNnTKQbl/I0rtXXTkGv0erynh+hxo7DGPl+wI5oyFLP38ZA6CkemKcuQ1u1ZezVTOjsU+uvV6BfYuemQi1CYdTACFKv/4isykJcmQ3x1ne1kLi+H2o0f+Dn3W0rc+GMOi/huRy4Jdr8+Vl4rGQD/Ux3jsLPQwTAlhZ7HqPcF3QYB5XfMsQtxIPCe+WV4h8i2V9wtq65uSUg9iuuGlIlRTEEPO6IPrI7oQfCeUL95axltBHN83EOnyUK724yxCEvQreGTP79Jo+qUhAkWfulhWbcxt6oFMgSCH+TDZjdnN0h9I6BOQ9rLBz3bXNkjXX+VJC4OKwx4A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Q92P8/kW; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::62f; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Q92P8/kW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::62f; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMsmb2pgfz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 04:32:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qB+Y0SXoZtOzONFgndzNCbI9k6tugEQdawww/tXWGti473QNy94XVTZPFREboHhEurF3KwrfnWMY1QV3uhFHheELSr5YzheR2FZ3C77dSrvLxc6SeJuzVZr5hEsR9WYMkY25aCah21fC93x8yjSNFtc+M/8q2/Y24ck+1alnNGw/FdTMD3fsTBKje3esh7o1vtUSqr+J5Y381ES/KxAh+05DT8uW+WNpLL7d0mnvxMeWk6Yq6wTtSZd1LD0BBewero/GdkVcFJaNFgE/Js3ca3u64CTl2ho/Di2B7Rm77BP+wlSsrqrNpibdSD1blkXEhfo9RjY7PkSxO31VgWn27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81krn+59tOTKbL5GPBiMr+NYgG6giE/kZjheAbqXnK4=;
 b=zAVekdyaQtvQeau0/uvvb3Xi3sEPWs2UV7u3RVkKSDL6LL0cLjVp0eLi0LsU8eyXLzRhunJYTw9aNExnVg6eDiY7TVMIsqmFKUrGtk4vMDUNxv1w7fGv0oyWvFy0vCFEpNKjPlGMkuTqxLMgoJFAPLtW4RIN6hKNx9Rmuv2JxJgv6ZZkSLIVJiqMLgTWT5KxxD6oPlER3DxkO6rkk4+1AViqLgfHu9ClV64FntNbIoNG3XFIwAuNNhJia6p13QC9QPIT59v49hQfTtDyBee5UYMPzvteB6Gq/c5EsXhoN/D7tpxjbDBjZmiiD1RN/bLTlKPWVYlMdwd4qYRJPD+DzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81krn+59tOTKbL5GPBiMr+NYgG6giE/kZjheAbqXnK4=;
 b=Q92P8/kWb12fVWHacS4Osd7SqMCNIgIFGl3pi0NzsQL+iVZDUOhxDzul+8fOULGq59bE2WG1klEJAikHEXWz4F2VQgs/B7kHYLjuLU0tOKONnCh/cfODm5wQnQAXqPUZAKulTymV3z6wfVDM6eErtxUFHvcFIOCR1GOCUsTIK8XLBPBJ2EE7Ghvpqq1IRukkSSg4ZdXq8Oe4yEXz6uSDbegZoywv3ZTGHrNJBfLZuknqRj3Jvt7FrTbLabiwFVbAydFYLYgDZwtgS8vCd+DqocBgpnbX7+KOUolmEqCsy4tVPHB43nVh/LpSyEv6CmOO0tw5BzSuWdAOcYPpSauwVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY8PR12MB8244.namprd12.prod.outlook.com (2603:10b6:930:72::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.40; Wed, 18 Jun 2025 18:32:26 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 18:32:25 +0000
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
Subject: Re: [PATCH RFC 01/29] mm/balloon_compaction: we cannot have isolated
 pages in the balloon list
Date: Wed, 18 Jun 2025 14:32:21 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <F0624D53-D30F-4DC7-A09F-4699BBCF2C44@nvidia.com>
In-Reply-To: <20250618174014.1168640-2-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-2-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::29) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY8PR12MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fcb684a-a356-4a38-fa20-08ddae967915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?igGELBMsh/s4hQ7J3v5mbuB+tx4+GN3AEEWbQfpAdVQMNL41km5AWoI5TPkD?=
 =?us-ascii?Q?dJs7Lq0qq0L7cLJwT9oTaqYPy5n542LZ7jfaakOWF0hPjS81JSnfgYGLx6zx?=
 =?us-ascii?Q?g+UJffG58kDtnwf3jofsJodUcgLmm70bsU6LRxoFwIwYCZ6LlyW6aFZRzD5O?=
 =?us-ascii?Q?pd9AvC00UF7arsXJlVkfDj3EL4q1Eg3ATaGXKoDG57ZFPrViUsJS9NHx0Ifl?=
 =?us-ascii?Q?XuKlJVKHvpdm2mfVUP5UCPzuiGvnzZ/TyJhAfIO77knctkdO0DbDnYZwxxI6?=
 =?us-ascii?Q?WXM0zFiRz8vqU85MmxMlqRnvqC/CVsufK0kAbhK6ZsShHByLGA3WyamGwgOM?=
 =?us-ascii?Q?LYw+zJHe0Ef9BL8X+Rs6dXMjFMZojm25iTqZrRrq5CfuzM4YJE5DRo0HcGsh?=
 =?us-ascii?Q?Ldce531OmYYrHiI9uQpXhlHY6FxXp6KDIKelyhF33J20W56HLH8GUHHFZbRD?=
 =?us-ascii?Q?ws0xGVv2twrW7gB9ycOheCDMjGP7lH+hWDRMklyJpIbc1Bt2qAT3kt/knoe+?=
 =?us-ascii?Q?zNhYQDOiza2F2Y/FCObO0BPFyx3kibwrUctnBQSgnfRehdBY/moFgvBZp8ns?=
 =?us-ascii?Q?hCvtREoF0GAdRBH6li6r27SVoaxh0A3lAsNZLlIGlVhGih6kbgR9BuUE+wX/?=
 =?us-ascii?Q?itEXjf85HgZdZqZX32hYahv1bRIQJeKTh2UfxuYIlrcjLuxJusPrUC1mvlOh?=
 =?us-ascii?Q?lCeGBME+giOF+hLEItSrmBx5iGJ8stjJFb548C8bpOlmDI4j+eWatItWJ2pD?=
 =?us-ascii?Q?buRwG1LzgddArkHl7QV4QRXGoXDdG1AvSPimqEi5QK2QKwabqoBkL5q26SF8?=
 =?us-ascii?Q?sgkivMxvbfoY6yncWeq9BX2Ruuk1MZ370lPKvFLXbIVvhuaAtJmROfR1HK0N?=
 =?us-ascii?Q?OEN44PmlZxq62abDuTbQveypcchSveiSyKeg+KpyiC2j5uymk9MGVTNlvjnA?=
 =?us-ascii?Q?jfiYRDyvjn/MngMKSLVuq+JWCnjcS0dN+4ozt+zY6a/qfCwlDabjOk0C559Q?=
 =?us-ascii?Q?giiErEKq5KzPXda2yKNg+yC9fD3icrwCNvJxgz3BWmlnoRV/nOb6YMJcrdtU?=
 =?us-ascii?Q?knJ7MPArF7aQnxGkHS89p1Gg14q7FahC9Qfzq3UcoNZmq6hP4FL+Zddzfq/J?=
 =?us-ascii?Q?hwJs91ejlFATjdYSQF6xzc+STcdgR/tTJNhfxMGhh5ghERjDUj2eFPQXpgff?=
 =?us-ascii?Q?bp/hIGdpP9L7BsrlMqXPABdQp6FF8M3JoEOIh/4dgOYxbx1w7d0bQ19do/1q?=
 =?us-ascii?Q?CQrPwmQ0wPdwqjjpEKUds77p0KXVyfxJEh4ppXnNO4R0svp+Z71wNwONKq4r?=
 =?us-ascii?Q?2tW5YWb+oWxgeRsr8nUcS4klsetGBYplgOe1Od9AiXWC8CjmJE/6tA8jJR2y?=
 =?us-ascii?Q?LedjkTBGT6qjd3AtLdq8Ew+4/3bpT4atv9tlYwYBN21ICORlZmUXhihSLzcl?=
 =?us-ascii?Q?1pWtXG8hwec=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JrtAFXb1Ditaau+l7gHyW5gvrkxTPeBveT+Q5UL60yvpVCHxxjRGZdOBFlx0?=
 =?us-ascii?Q?jgW5RGbbgpr4Gyc2cGnIpCm8ATsweioj1ed7iz7rJg7D8lnZOh17MM/koLw4?=
 =?us-ascii?Q?XoUBc/07gkPdM+ABhZAAAMTjrcY2FSDLvhX+kUqkV0aUsrmpsmnG4GJhGDbY?=
 =?us-ascii?Q?cbpJuGp6v/+37DN5FVItOVIWcR8Ybkbt9QeuBqnx7oclmHmi/SMz1OfDwF7M?=
 =?us-ascii?Q?D1n38iZp6Pt2vQmRaR0oYF1IAA3JoX3jlruvF/cki/GZY+DS5gRuGoASkj+J?=
 =?us-ascii?Q?hfziwOlbTuZ5HjgPgJsSrD941CTvMldXF6SaY1RMghcGgeX467TQLxtZJRrx?=
 =?us-ascii?Q?c4YGkXDKQf8Pk2jgqyhGwbIzf1QxLBibxEbYOKmgFp1gvfBCqSQkHIfc0bXA?=
 =?us-ascii?Q?Mu0c1deTEfkQ2zsjojVaC2NOhL66GjNvV3/OmDpElGK3D3hxDy8GQYi2mUSg?=
 =?us-ascii?Q?w4iPz8cEku86xcV156oVJkqdrvF8L47DKmoB6fp68xIeq1p4l2szQBYyDts6?=
 =?us-ascii?Q?h/6JVguQOgOf8/Tz95dAoIE75N09Z4RytY9fxF30pBs3HZ8vIw/56dtUe7yu?=
 =?us-ascii?Q?2bZYEO+5hFcYXnOuHrjOsS6NtP1OL1wo9Ee7b9jNpWOg7EqeKr3QBh7bVjhl?=
 =?us-ascii?Q?NDNImTJ4Cj5VjDwnke1XiOjxo5aWwbMP+mnjuOUTzPS8//5oZPUa1petip9R?=
 =?us-ascii?Q?95FYu9zeRMi8iapHtmW9mzwkpRBiKVz9oAPtnBUCr87sH1xms25oakC7Q5RS?=
 =?us-ascii?Q?tauxCkPXkriLopH0pwk6Hj2Sl7FbtZCGluFfcKJH2QRPOvqVmWHAAn99izOf?=
 =?us-ascii?Q?rsU0XV2p3YNVVZTMRh189ikQyNE2ST1Ld6t5hvfGzmJJ3+/UYAXHIh2GRUaG?=
 =?us-ascii?Q?roBk1jAhyBuOiMBek2xX+FeCmMtYh68IrOnZSBsl/1PzX3HLPV7D1MkTNK2p?=
 =?us-ascii?Q?su+Eos33IF8l6Brq6lb5FpTsjC62hZFg9ErVtFm/gtlzP6ozlU92uqEQYkWq?=
 =?us-ascii?Q?fN/YZc7ZQyGJpYz5bO5mNTqr0bfIdVVKsrYMFFJl3ToF9IxenubkJBHVwlqB?=
 =?us-ascii?Q?0TzWq+xDbX9R31Rh1Y2+KczNxPMMt4PxRhWGoGC+AbzmhWU4a9Fi14D2T+9M?=
 =?us-ascii?Q?UkmfSEwldMuH1yOXF4x1L65Flfxxpt2HAgszL6A77vn5zmgLkeIS4eq8CQgx?=
 =?us-ascii?Q?iaJwK2kFBf5IhguUFgxNsFM8M8R5maeIQfLheQXPlpUrm6NkTst//OWo99tC?=
 =?us-ascii?Q?NDt73QOvvAacUGaitq5oze2wbB4h9IsDP+QQHpKzvx5d/2ulsp1eYqSLX+iU?=
 =?us-ascii?Q?MQTWWsro2CUXlAiQYZedt6MVIEHbKlFugQ8lYACdNG1+2xdCUNpi0raMUgJG?=
 =?us-ascii?Q?5yUDcYVQThuQDSsyC9HtMbh3SN3mGl0VyUKH7rTTDg8sq8RmKj7CDK8pv/0l?=
 =?us-ascii?Q?NTv21/udXDnxvemEUekcP91oEj2RqOT4qKKKjKGOO6GDibNat1wHvoVsvvh4?=
 =?us-ascii?Q?q35ZXbzBeOCzMtwgQvATRIjIFYY2PpU61WIxyvo/bZgg8hT5bXEUiUtDHR9u?=
 =?us-ascii?Q?F23bTYp7BShAX4VXh0eEjL5ZoEvMdxhg/eqyN/5H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcb684a-a356-4a38-fa20-08ddae967915
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 18:32:25.8922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76M7PW5Te3zBF2FaeD7MQ718xu5eVldtZEFBSMX/JnEC34LFvlQyH/uWjA3MT4EN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8244
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:39, David Hildenbrand wrote:

> The core will set PG_isolated only after mops->isolate_page() was
> called. In case of the balloon, that is where we will remove it from
> the balloon list. So we cannot have isolated pages in the balloon list.
>
> Let's drop this unnecessary check.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/balloon_compaction.c | 6 ------
>  1 file changed, 6 deletions(-)
>

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

