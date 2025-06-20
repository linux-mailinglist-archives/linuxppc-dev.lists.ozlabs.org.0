Return-Path: <linuxppc-dev+bounces-9597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22915AE23B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 22:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bP8Xs4bzDz30T8;
	Sat, 21 Jun 2025 06:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::618" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750452125;
	cv=pass; b=KZD9H2upW7s7eK4clCcCyPQoKirWg8G/HfY6u5o9I3duRYPw58CgxVxWkoZ77JqcNzj7woWBMc1e6A15GE3cOhiKvv8tdLyeLV8TRVwCdCVaYf1p6Pt5u6CqJ76yHmFzVqXrDyt68CqAwr4dtq1two0gYGy4nKglE6htffhFXBSBXil48EtmgUBHrGWPRPxMPqs88NJ+ucerhzLzYpqL3ybICS9anSSz7/kC0BflrhJPOcNkzo80GrYXAr4IsMl+7H/18S0JGzicfDtUM3cXwa0L+YhbIvip5aA7+RlTL9KdKozPR2cs9V4T7PSfUF8vdOqgZfydlbjVTcqDYUREbg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750452125; c=relaxed/relaxed;
	bh=R2/nS/Xo1oyiwtPJ3gYZ6AP+sYip5zDeC7yd2I030dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uv806/8v9Eh+vv3v6yxxyJki/gkhvHm4Q/ATmI3VacwizsTES5hVXh3EXnb7Bx/L5s4+yxlzA0Rll/ofZBeacXaozyGiTmss+mFctj7Mm1wWXqS3Uh4RnNJ4kW935xkxkvbMwD9V7CFMc53YB5QecL+Q4jmqpuYp+DHRWtag9QMbrf/oTAkZvdp8NSljIgyYIrYxr7wBlbtXBhG8z9BnpdUKL5qg45XnYu3GRAmL92Dp17MBMZUIJgW5kzf6ZJS2ZY8JXqycWaPNC51G/B2UTfZYKwOdcXJJc2eraefKpjflwvDaWml3yHeLtD+18d/0RhqN63nbw8JXpoE+uTgTag==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PmYAnxvu; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::618; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PmYAnxvu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::618; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20618.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bP8Xr2YRYz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jun 2025 06:42:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eycJ4TMzOrLk5Ehhx/bmqcW94NkCEup51X20wOf3VvjpES+YwixsLWeNzXAVs9baLLEY0/WMh8+Pxx7gc5G9Sx+vvROd4HilCzO7NbtIWO2DWefPCO9XDsQ80pma5EfkAiPJDYqmZRao6fRs7sSIgr+w4CY/RVqggHnCUqinBTFLw/nkFjmEVln65Z/3JPv3cUxxB/11ExE3Jv3gUs+IIt/z26xXCJdWv4ezRVHggv+yW0Olsn3rsiVSkxwhnTWxDhzGnxSUHQ9yoYmkCyVQdvwSu88HE58D6m6ydO+pX5vBUpz95FrkQPoM/c7G1UqVyRssLVHm4w74zq0f7s70zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2/nS/Xo1oyiwtPJ3gYZ6AP+sYip5zDeC7yd2I030dA=;
 b=c3HZTzxGWVPHZYzLv28sSgbmj5tDSnnom2gXf/4C4Bqvtuxyp2YhBjmfm4YGx6PdRlikVqMDTeYNKLvKBEkjExcu7Wj2ofj4wwVmjn+91tofhh9Cndk5Z18+zh266SgYnUco48s6/qTzRq4seVMOGcAZJeaXSxHEvM2q3um8fY4nuBGbugs7OtSfT5CjShTISScPUZtQtG8OnwcLLkrdXSENMy+KAxJv2f+eDkAUUG2NTM7eOj/uH6iZ+LnbGHxJj8Hx9Gtdujh1lpTVpAdBb0rpoYcjfJg32h2tz2dYIq78Tid+gumFDmqKwLNkjqDDllcjSG8o1tOYQOmLjj4iwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2/nS/Xo1oyiwtPJ3gYZ6AP+sYip5zDeC7yd2I030dA=;
 b=PmYAnxvuYj0aS6tH4YVC7u5Z7zWgW9oemZgUtivFzPj+yEY5WWTIlQk34zvVRmXRQ97KR7cVYLwOWzlGjsPInsAHdPsgdjTV1w0N0t1yOuKOC/idipgtO5vqXWlnnHU3oCuLfLEqjbnHT6Kbs2As26tIzw2Z3e8n+Uzfk48IPdQONgjJxPANiJ4UkSRgDgY5mPfLrASiGtou/1rYt34bKUY8YvC3bjA7MGDLOj96db0IsEn8i580YjHXu2ugqatM476Z8v2q4ZQaKfa4ZwL6IIZwXdvX+iJLU4WaPcLw2LHnRY4bMYxLUqymwCTG3Cr3cyj0EOO/B1EWLs/fsRT62A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6075.namprd12.prod.outlook.com (2603:10b6:a03:45e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.23; Fri, 20 Jun 2025 20:41:44 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 20:41:44 +0000
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
Subject: Re: [PATCH RFC 18/29] mm: remove __folio_test_movable()
Date: Fri, 20 Jun 2025 16:41:39 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <5055937C-B3CC-4CBC-90C2-1F4BBABE2C09@nvidia.com>
In-Reply-To: <20250618174014.1168640-19-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-19-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:408:ee::20) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: c5538260-f94d-4ad5-6fab-08ddb03ade17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MNs/jprbVhy75pIYIl9QXU3Tj2+UBboLNs+jXJ3o4N1EjkM3YmHhs8F5MBWC?=
 =?us-ascii?Q?W9dnXww9khLQBhndxxWSNcqNnQklWCMc4B3/Jg0mdgkFFHM1gibLDlbPSyVn?=
 =?us-ascii?Q?Dklx6Z8epgnkcyue63QooXmyZV6OJo1UcMCk9CvtIVNef6jyuqV88/8O8au/?=
 =?us-ascii?Q?oOT+aUoFs+PwYIlL/rIGM1UAIpDhGhxQhiVshPA/nAlHwCqH2S6wxHqQybBD?=
 =?us-ascii?Q?wiYOHMCpmRUY1OBMHJ7gw3PCMthm5n8FOP4rhwtQN9CUNaTmuE+PaK6bzYBl?=
 =?us-ascii?Q?OhMSBrCjqYoblO3ZU0js8TpfPyqGPZ8Y5gxM+OM5HEIWkkZ7pYhv1Zvr0zAR?=
 =?us-ascii?Q?PMdukTKvUrBURpS7pweD3FK6m0VszCL0G8Hp9zfNuIwCMe6t5yBZUVgEnrvu?=
 =?us-ascii?Q?q6n0A9YSE9cGyRfhWjIGZyJIc8hadfY9BfwB1J5v8uv/hMM2Mi0Z02NLEjHA?=
 =?us-ascii?Q?7MQIRL5pP3NG39KBNNLBc3f7sP7bnLEd00y9UUYSqvRrjQmE3qnkd+BcPExZ?=
 =?us-ascii?Q?G7KWFAN0D35pFBGb48c04qZ2D3Yk+87pxyEsHjB+YwWiazLtSst1g7dPVzVY?=
 =?us-ascii?Q?5w4galeOM+BJH2STCwB6e9m0q72p83K8xzNT5f9C8iZ8iA/J+w8pGOf4GbLF?=
 =?us-ascii?Q?R8mDUSgVuT2bEExz2cixAjAKe3pILEUJmAZ1qF0/2HgwOoMZsP+Pva8QpuK9?=
 =?us-ascii?Q?srURKOhSsBgmRoJ0oq0VyzdeFdeNKbuKWeA31FHtrrotdWDlzQ6TykknW7kG?=
 =?us-ascii?Q?fR00dl5nI3Afl6uvRtEfJNdtKq36ySV9lzqidC2tCnf8ii485mP1JU5C3Ira?=
 =?us-ascii?Q?TuWpf+ReH8gPOon/GJ7eqWYQwpl2uVNY+Y8QN+vX9kbwVY7QM6dd3T+KzA/k?=
 =?us-ascii?Q?dE+tDDyuOTV9Frt/Ozy0iWxBwD1fWjJnMDBMv0b8uisy61sDAzZzG741dzYN?=
 =?us-ascii?Q?MAU5Q5apytEyH5FFDX5Kx9DoCBSZV5z8vcDoE3qo9wYbiO5m9Ji96NT2fYvX?=
 =?us-ascii?Q?2CH7tI6IudeUIXp/XxbPnWiNM2N+isNBZFIXD6GzikCNiQC8tRL+STvD6PDK?=
 =?us-ascii?Q?J7RsgsnXTZlSGU9wEqE9nE8l04ZucIOuJe7xe0sUKbzz+MQ6oQsZZ7FH63xr?=
 =?us-ascii?Q?vmpoTOyk3m02RR63G+mRmp3RtD8tAEZcEH53cFnMSGC2nqS8JBNcRsuU7lts?=
 =?us-ascii?Q?bNbYC2t4puqwwPEK/hMH9WdwiHitL5uHDyk/Sa1yFcQVoKZjBVpB8T+LZ54P?=
 =?us-ascii?Q?c/ocM/l+HE5fWjgiCRnu9+iJCWibjaPuQgiULIS4Se/CGS2nL4NPQLc5DSMG?=
 =?us-ascii?Q?XiPX7C+GdQTIf4nImezNW97iz0TTTyRbz699hRpzZC8OGugNHQCpBQs22aH7?=
 =?us-ascii?Q?iKggsrbSE3hpFUdYch6udGM5rLS8/+GRLCMS+35rjHKj42G8/IlFHNR8q/aP?=
 =?us-ascii?Q?sj0y0HlKzoI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IcbYyWK6UNTofLs2xXKWOr1/StnQzwEsU0Amax9bpIz+Trn77NFkGGQJ0EDk?=
 =?us-ascii?Q?XuxnfEzlhCPFVm61ruXbHSmbIv+4mxGPiQsh6AedxeH8Bvsemp7mC8UlWNKK?=
 =?us-ascii?Q?ZcsWUlz/vF5nAssN8wwG7Aw9GMAZwkuDn5xMlQpSMnM6HgS3h4q/Q8X4UnCJ?=
 =?us-ascii?Q?FEK2XAMwWCIxp0yTJ/o1RbwFCJJvWIFy0FliJk9UDm+J18QYddRN9zVXSUrO?=
 =?us-ascii?Q?zAuSpBuNHFeuVrhI8aSoo7+pYXeq5A/bljLEwLszyGrSneAxf1BxGp3YlSYi?=
 =?us-ascii?Q?d9Ry1nzVPtvuQHV6dvZIz4nnGV9u2do/1U3xBbFlyTZ+0iY6fMdgyfVruUN+?=
 =?us-ascii?Q?YwxYbi0d9b6pj783CqeAUZ8KlIPcgIeIwBTAsEzo4+fg/SQDw5TpBN3y3DCY?=
 =?us-ascii?Q?Ib9RJ7vGVK8m8jumjpxbA/tGtsKxgYf8fV9deUfdjervt2eSG6hmsj7jM7wx?=
 =?us-ascii?Q?w9+oGX3XB6NUbQWM+sBCniM56gFcVfrcMixn1zVWjgxB4/z8ZCp5/LM/jfED?=
 =?us-ascii?Q?oXiFWUqH+qtkkwmbVaR8m25/JJKywrUevEnWIXgSmgwG+7RHC8Y0Pna8fz/S?=
 =?us-ascii?Q?d5CTF5kzDmAd43BEnTGcH+6tbH2tskjfPrFMZKRtsunAxqGdmD8buhNZxfts?=
 =?us-ascii?Q?ITcUgG/p/zVMlYD/mVmglMvONsjfqU31c9arB2hPZ9s4199xs8BELoMJr5QT?=
 =?us-ascii?Q?oBb04ToaYa2ne+VU5gL2T003eiZt5d7kH1Qmrrbr8MdlKDvzKT5lMntXq2QE?=
 =?us-ascii?Q?G31VZXKoeOF9qmHO4/FK8tvoJwTYaxAcGqZ9C0a/2Fblvob9X6PPmXuV5Yie?=
 =?us-ascii?Q?fyC6Jqiy4KZAS7tESqNbIaGHQFEKGnhXbPYEVW84AKB72L4CktKLSBmoJcTi?=
 =?us-ascii?Q?adLLiRiGRhp51TcM7IFb0qBIDzKpryxKAtNZ4CUcr0A/63Cofv9Io58UTaTG?=
 =?us-ascii?Q?frYw2axMAOptAqlWfeXkkjN9++5RZV/u6Dy5yi6a9lMLKZFG3fi8g6Gbe+Ix?=
 =?us-ascii?Q?KS37E6rbiszXDBrPgvWWb35YaD1EcI36cHc8vHxlYUH18NMoEZzQkdV9E6n8?=
 =?us-ascii?Q?aB7+8RlZ3mA37jf3pVCLe38VZFzVexgefyi9lNzLIvT6olUqGa6NrK0N+oQb?=
 =?us-ascii?Q?JtXiZxrYm62Th5AvjJZUzb7rrZXyD3MjHHm32hFf0gxOwDnNw2xgMzWES8j6?=
 =?us-ascii?Q?2GTlpAyIzsxJTNBQpJmfKfZlHWYIhf48Zso9rC8A3XmO5WOJLQLfD6hgul2k?=
 =?us-ascii?Q?+okQLqk71xmXRG3h4WZhgLgYuuRVbkAWhVrMGWJ7/DfVA2Udc48ocnyoRCvZ?=
 =?us-ascii?Q?P4tsllwJSxyFC9ivQoyxOYcZ7LT0MpSa9EtqKQpURrTx6ILpDqj5QHzEz8u1?=
 =?us-ascii?Q?gK666KHzcRmfY7RqGycHwnZmLdGU3cvuPadPy4zWlLRW9S+rFMxTW7dHyfP8?=
 =?us-ascii?Q?ZYzB4MnwTLtm8sTQZuoJRha8I2RYY9fqAe/KwVJs1qotnzAFFgN21NGSYO0h?=
 =?us-ascii?Q?95srvmMITzvWVbFgquddLCArdPXaHIV01ddnjOpY236NdJVdQto5qfZKQvIC?=
 =?us-ascii?Q?RTXOZYfBycLVdumBlHiFvj4t5MdZCjaTht8zOjfT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5538260-f94d-4ad5-6fab-08ddb03ade17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:41:43.9472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gNhRgxVhSZ3wXsU2UY4EjIwaiefuriw0Cp2A5QBdkIqrqQfO+Z93HyddxFKaBFz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6075
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:40, David Hildenbrand wrote:

> Convert to page_has_movable_ops(). While at it, cleanup relevant code
> a bit.
>
> The data_race() in migrate_folio_unmap() is questionable: we already
> hold a page reference, and concurrent modifications can no longer
> happen (iow: __ClearPageMovable() no longer exists). Drop it for now,
> we'll rework page_has_movable_ops() soon either way to no longer
> rely on page->mapping.
>
> Wherever we cast from folio to page now is a clear sign that this
> code has to be decoupled.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/page-flags.h |  6 ------
>  mm/migrate.c               | 43 ++++++++++++--------------------------
>  mm/vmscan.c                |  6 ++++--
>  3 files changed, 17 insertions(+), 38 deletions(-)
>

Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

