Return-Path: <linuxppc-dev+bounces-9592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDDAE2343
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 22:07:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bP7mx0z2hz2yFK;
	Sat, 21 Jun 2025 06:07:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::615" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750450049;
	cv=pass; b=Gt1WmpwlcT/f7LGXRoZuG8QLJX3VJj6c3QS5m70jCWgq8xUavyeejNzlsEHkgio2H6AqTt603FBf51P5F7HbL1PD+G2tE86sMe3bAi7djX41Xo/zhpnueOGX496Owt7VO/GhtK/lGbQRjXm5MHhg1BDEK5RUYki9TO2wwHaBDj2W3Cl0bFPJ4NblInJWM6pndJ4Bm3hAKopRBXlvcMV6g7wKemQmTbPAw6W4Hj1buCb08pQK3AOlOLTa+bgttb6XJ2EfkOk0NeDmrq2g1Ebg97hJylHRuHuvFIzBmCcUNuMQq+vdYX3nOsmxagDwH58+P1+NevIDOmCyu6rv/IVoSw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750450049; c=relaxed/relaxed;
	bh=JRJaq032iquXnTMM6Wkdoa5RDmHyA/miLDygjjtrhDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D/MdQXvduQtWBn/XWUWuKGepQA6/GMkLtc6DEaO96KlmvGRs+pm//yjyqNtgHjVMpMpEUR6/ZEfpKUDBYMyXrs/hBsH2kuvZW04aKPNod+jUxbw6iq/mclZ1NHWRSiOFxXXp4UeCbBjDeP+WHmg0yv9MxqweBnODgVOspS2Q5Qj2IKNY752D1nWl12BpvWnDMlBC5wsR8vGyGEJxjHSknxQEjFxT0vZNS41cc91r5DZ4LOoqz7K7jjP+GU2nVEaN/w1O4NodSgLBKowLaer9wgG0fa9j14XYYJxjO+wY6WZo28TOVIAkugVhAlzY+jEL8kFksseofDhXb970cX/6NA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Dm4IfULu; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::615; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Dm4IfULu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::615; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20615.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::615])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bP7mb15m8z2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jun 2025 06:07:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F42g4YSSWDIfQtrl5RB/DDtHU+j0oDNxRDNkpoRQSP9Tw6KfRt0dYv1C1ZxQHvJJGEMqsiZUxQwvZ61XbOSSbn3THzGYkxX501tqQg6C5emGdoeuXMeLCCZ7v3CsYpabrgFYfug9mofO7Nr57CXs5iuJ2mvCxJaGgfsNKaUBGQMVJ4k1kvzT9qObrmy7UJEp0+nzoBY0bmrEE3FIxzN+t1fBMNc9aFJx6R/07Z7P8+EjphguX6nbMmsOuyzFzdESecXexOaFtuPmFKkai5VY0Gtl1s23cX0nPJpW9bxApIUbDDJifFf0tkBZ8sYMmmpdYPKOqXcULxWR5uY6WPni/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRJaq032iquXnTMM6Wkdoa5RDmHyA/miLDygjjtrhDs=;
 b=eItk1JoLtbxsSgHg+DPhJVotqoSKnirwILN+eAdkpoyf4K1yc8nVC6T/i/A7nieTbLNhgKRczIQjH3lV2oezaMa0gZ07VaAaWlb9xP9K9sYp8klZpyN4vG1wV54z53h7nlCAidJzAEO3HdW3rb0RNnQOqmryIQ4zhAAkHAq6spG+YfT1K+z/aS9UVAVtIN5c1a+ToZ5t68SH6QwTGEDabwLSPq+ASXhLYD1licRu0++/xx20Jw/8ZKe8Ez8lxh51lEhdt2KGwTVWSoCQcD4IYCfJNd5OKR0Rtq2NLdoKw0Cm/YZ1xKZGIJ2rIuRFks5zpfchtIM9fZLox6WLXLLUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRJaq032iquXnTMM6Wkdoa5RDmHyA/miLDygjjtrhDs=;
 b=Dm4IfULuWKzL7aCIpginek1PubzYPoT/ZQCW3NiUrxQ6OUW9HiqQV3d4NxO+jYKfLGT88m69R7+C875lwM5Gv/d8hu5NPJ792TxUXQq1RHv3xyN+SqZVMbEWRyVNZ8fRAA71+weyxVRjszOjw/o+d4PTVt5gHZeIDFipEbu8STpn3rjb+J/DIyRIIbCEMZIFMhjRoODz2B8E36jf4Xuy7Gx/eG/GWptJSJablrOY/kTsJMGHu4Nql3px24+LFq0eThYXod4TyBY/xqJewLRdlXRFYIJf9irR9F9NtuEPvgG+/qFzQLwiAJaS9UwL8vDvxmVb0eJnun06oh2SfUnrSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9205.namprd12.prod.outlook.com (2603:10b6:408:191::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 20:06:50 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 20:06:50 +0000
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
Subject: Re: [PATCH RFC 11/29] mm/migrate: move movable_ops page handling out
 of move_to_new_folio()
Date: Fri, 20 Jun 2025 16:06:44 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <F139FA8E-4F0D-4F48-B25E-036FE9B585CC@nvidia.com>
In-Reply-To: <20250618174014.1168640-12-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-12-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::21) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: f91ec0e3-0b37-4668-2280-08ddb035fe75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hp9Sqn6rAn5RHT7MTEUIGzMMx1gehCQo/IgxOFg3m20fZqkoYUnaQORs13ay?=
 =?us-ascii?Q?RTYzYE4Z0S8nVbZKbjrAeWZH+VsBEwMJ5hflcGa1VY/QSJEpwbAcYF6KZGqC?=
 =?us-ascii?Q?aWzPqY9SodUq+c/wEKbyytSeEb7/OVU/8s/JoGkripOUa1I693o20mKFBfmJ?=
 =?us-ascii?Q?wK2BBssXnfhCh1IrAuZML9jC4A4K+YSSGzeVQcNiQjtw2fGH9xcasmXidXeK?=
 =?us-ascii?Q?KwR1pm1AnwCm32SuWEikw7pl+aZwpB+PkqqcksE2dPyOV3o51gQBCfcUOVP4?=
 =?us-ascii?Q?s+p2sc+azN9ATIQT8zGkDFavzMrkbDSPWP4stdeeQE4kq9lfUCbxexizmvuu?=
 =?us-ascii?Q?9eV/D+hBba0ApNQRdPkUQ1Mv5vGo7KO/twxXABKaqWogWlburPG2Dw6kweO7?=
 =?us-ascii?Q?dd58lH/9qkLY4LPER7FsM41ovWoEdznrDPX0gAAj0EOCa3pPmy7k0eH2XL76?=
 =?us-ascii?Q?ZmGRvVLtls2/bAPZPbrXmbd3MB7lEqB3nFEcSBbJWFe7nX9F10gmBJi95YNC?=
 =?us-ascii?Q?oPuh8sgnOMlKBENWyKwEd57nZ8nkAkLenvr8lDiTfzCSH73cLfoFEYL7mYya?=
 =?us-ascii?Q?ire+08RmZ7w9Bvp4H8Gg5KaXPk5V3INQOxBqR31IwjPiJUrMMGcdTl4Bbu9L?=
 =?us-ascii?Q?RoXjVRTIsu48lqN4lXUu+5kAf4GjL+w7/P7eXSK8QlOsc6Rk1LmmrNpXRAgj?=
 =?us-ascii?Q?+ABq/oMLEikFcP63xq/0f4Lf2jcSqv7Br446Ysi6o+bQ/XX/uBtczn+NnDpq?=
 =?us-ascii?Q?9OIkjhk5aunYv8zW4pWmkuw058xLKOzd5D/fObhmos4Gu975iGWXmHQFDztj?=
 =?us-ascii?Q?5ZqGBt9lA6SXo7QadTPDkXBTCNH3MwWEYvVTtczTW7+aa0GRud+Jq1CQjYkA?=
 =?us-ascii?Q?9itt9kVxOVq224kkk4WWxEbDdJFZ62BkQhQKCbVSQCiKQqru4Fv1+CDQoBln?=
 =?us-ascii?Q?ku6aTxmVK1kWmgDYhDMFGDQ0b4lIGdhayWASEJwBkiq9D8O8OQ14v0fu/OEz?=
 =?us-ascii?Q?HWOSOO233aTIWhAVGPCDK5Kqg4DE4+xRsLXhmRTGVFjaJDedTpNx97NLUgLi?=
 =?us-ascii?Q?WO9uzaHKoAjFzOE7g9qbx2gx9bElvRM/z50bPekyqyV0SH6xbsz94Yr4Cz1y?=
 =?us-ascii?Q?wsfZn9Wi6UPAvFn4DTBF+RpPtzeQR8YqOnNOBQaIi7U8UmHSQNbB0wXucZHr?=
 =?us-ascii?Q?T8gI5UV6+6c18QX27+b4LOxxVGzp1ZdXHrFuQLcBicoQzhymkl8qlTetZA1Y?=
 =?us-ascii?Q?++sVJFrJWp0on9JN+E0SzrviQEaWJj9m1U7d6x48I5BaG4fbVzcgT32zgHdP?=
 =?us-ascii?Q?Ta73rRObAx6ivx4UoV4OQISXhgQ3qB9TE0sEZmhqWob7Z6yVnUAiB3WLfqPy?=
 =?us-ascii?Q?JiMGiGCojbJaL4EZgK62zc9p9EtY4zJG+7Hew8UCJPS9w+WteAG09ltgqoAS?=
 =?us-ascii?Q?hSFe8KsmCS8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kYVLuixCyaGPErnqEgzP5HsDEMkJtwsmHCwOPxDcKUXcpFz/zdLXnzCZSyn5?=
 =?us-ascii?Q?MQQkuEAWjol0tzrnlU9Qu6pii/XjAK7AtPd+MJNP53C4picCJpKWz1J9G1bo?=
 =?us-ascii?Q?UTf+P6CaODpjNM29naPH0avf3YdCDrzoWm8SiAbdFfVShoupUEVBFb4Rc31S?=
 =?us-ascii?Q?Gv6MIj8FNiW94cvvByJXbd2ycUupDECySv0riuH6J897CfV1Y+VE1HXsmN8B?=
 =?us-ascii?Q?w9Tp8NnbD7CjfNbuP7KgfYBJFVfBjXIp3Yl/9ANWT7KLwDHxbYMHNoHKmFtY?=
 =?us-ascii?Q?X5VgQl04aiHPb4HrDwqgGZFJobcuzlgC16pNRVYLRYULC6M3tlHCBU3VG8i/?=
 =?us-ascii?Q?jWML7xGRRn8aNKoMQ9i5oc1pxEyxXjCmGT7UDo0+BYj7SVY8fju/cOcJBp11?=
 =?us-ascii?Q?bMotkCB7mdwURMHs+bcuLqD1RA8qbO4yMKt65g7TA9Ibisd6Y8uTB3IrQ99U?=
 =?us-ascii?Q?SBCwNeS2tpNS4PN/D6kwQMz8YIg7X7B2GdZtvTMsj6ZFmgPwyGXCp9d5zfhz?=
 =?us-ascii?Q?/VjOOQMQQ1x9N6Gw6A2dN8ZyujvwA3rXROrEk6SKKPPrJT8745OFsMURo16n?=
 =?us-ascii?Q?i8fl6NQZfhPuswK/ENzre9SwpCFIr1gVijbndPngvhDANDKxKAAWmOopnx6W?=
 =?us-ascii?Q?08lUZXLr81glmM5JOhdYVJN4Lk+FlkPShPGSd+lZnW8JnjAv9++hpNxPMcrk?=
 =?us-ascii?Q?CyoIDDhCQOeoWv7Lb9SC7kVvoI9Qy2gkkvmZyQ1pKzJVJBcbm8+tFDywSv83?=
 =?us-ascii?Q?WlvY7JAZ8eKqiViOsoEWnzzmIUd5i1g4doycGcX7oBxFAnsygWs1+lNxDzIZ?=
 =?us-ascii?Q?CAjpRQKvLmqiTivOHbsBBZpuXRcZy7wJGYocuo0snQXB8xqeXgs6Wj7HJkN9?=
 =?us-ascii?Q?6sz0bcyxVA5LNS1v8hfB4jYS7ml9mWdAX6R7rL6NOW84383w+wUCzPkQ9fLr?=
 =?us-ascii?Q?pfftkcXoEFz7hBlrzQ7JnuCqFRY1SfIdOn2AuRT3TM0T3P1kNLyz/7JxEPE9?=
 =?us-ascii?Q?KEzN7D0FampZ2KrbCbZj+Pz6oGKsoxfzqwdFUIFQ0oYQ990H9PYygcD0Ocib?=
 =?us-ascii?Q?c0Wbz6XsM4RRxH3dz6JzwVkcT3IhEm9muGLXBP0Ff7z6xvxVK37DNXnwKu9p?=
 =?us-ascii?Q?E+gP8xAQkkPM7p6zS7QtUiCyHtFaaxRqUs8MtCqbgFmTchwcOVx0N6Dzjk8t?=
 =?us-ascii?Q?NgqbKgHdvkgljQ1X8vlyNNRBfj3Rs/4a7pQeJcLueMPYo0SRKfD7LAmTxqZh?=
 =?us-ascii?Q?Aw1oFntesEY3J165ZePbFLKAFB+XvDwiwpInSeiTJHxus2mC6ZHur1Z1Y7Ds?=
 =?us-ascii?Q?9hKGCRj0Xs9QJ6nsmcZ3r6oGlskGo3M1AtlO5hYyaofZEKZLngR8HPjt8kbn?=
 =?us-ascii?Q?4S56oc4SSygjcMEvDxfql7uqTZ3pLJ5Ellg/Ir1enJ0eps3SCkMDC+/7y/+s?=
 =?us-ascii?Q?qdhd0sJKLmETF3yRV3ywqZbTTJiHjTcmZgBIvVDKee82L5FNwbKLVHY5ueU7?=
 =?us-ascii?Q?+eIG69rFF5r5rEIfpzTr1Sx8cZJ9IZB+kjgdBI0BALimPUMjRvaEcwF8yG3x?=
 =?us-ascii?Q?m/xI67lRACRxfDmKMARGyMW9+KxlWz9kIeyP7Zo+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91ec0e3-0b37-4668-2280-08ddb035fe75
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:06:50.7737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYmwVt8LDFQcC8zyVRqocWIo9Q2sRCOBGehikOTPLaBkTQuhbx8rFJhEPBl9Y5P9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9205
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:39, David Hildenbrand wrote:

> Let's move that handling directly into migrate_folio_move(), so we can
> simplify move_to_new_folio(). While at it, fixup the documentation a
> bit.
>
> Note that unmap_and_move_huge_page() does not care, because it only
> deals with actual folios. (we only support migration of
> individual movable_ops pages)
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/migrate.c | 61 ++++++++++++++++++++++++----------------------------
>  1 file changed, 28 insertions(+), 33 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

