Return-Path: <linuxppc-dev+bounces-9642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B74AE4697
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 16:24:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQr1X4bM1z2xKh;
	Tue, 24 Jun 2025 00:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::630" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750688656;
	cv=pass; b=kHOFvaRW6b4AaPTyU4j9XudxntqORoYcQ+XtYd71L8T8u08vI+NALdEoWi9NGUyphBFmz6lkFxcZh9ehABNzszufEbNSP20Q0YcGSltLdBpYsY3iT+TCTTCpOj1Ip645JNGlBVfcnJig8Hv9hs79L/S6bgn2qzOYd2ayb7qXr9xpvC6uLktZhCPZreO1ucVuZrvVm5FN1nl4kysKUbF9VPTNJWZeJTI24rUSYjQRAIN91OMhbXaZsEP4zFftYG7Yu4XDKf1sKAP62AbdqtidncaxZF91A1PdD4Ve+Kk8+qSJvWD8SiKqQxxFZU2U3g/E5yCQJdKnG73GDs8ldsLtdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750688656; c=relaxed/relaxed;
	bh=8p0eZyi8SY0IETtpjRnmIZRmC0o6uV6Sz6V7BnjQZ00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Au8wBDrdzkVev6gHukcrWrudxiv7W5Ql564+Y5/HtKdXtigH9g/c1CA3PAUhjzl436Y58K7rHPzcOmie3cQWPOYR/H1U1hWE/av/gHtnVbENSSyaqMya5YO+35EFL/71T/HgeDWkNqNKcjWMwcQ5itx5+SydTKBLVI8KOX96QCelNNtGl+yaMkRnqabOdIrcdLbDnFgigqD9AjQXdRqznNnT6jfSnYRh1VUM4F+0h809vNYyhUGF//CiQ9apab9msCPDjprW7U9hm7WEzGhMcWiRNbjHNlFDXy/IvZwXQ/V9hImKpuCuzzgQU1NMaCZhNAKI5m+tojVR16Oyv1NiYg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lLNwhTn+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::630; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lLNwhTn+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::630; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQr1W5lx2z2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 00:24:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kujUF7Nn2QdDX+1BZKctW+wGxQkZFEvEzLZXFGs9fTxyH8AIsxnz5ETfud7aZ11TU4liegMl2VuDaIdRlXqHLQZEuKCulwc0rMYMaSv2Kog7XQgFe7/jBgKbvAWoYdYOLeU4VYCwhE2SNglx1cRm7dctWP7hYPlT3AXk0xLVxXjEdSNRq9LT7QSawbW9tjDAzRvoXlGk1f0cJtd06d/pRUa0IjmGHx69E0X5VIvbCh2D9FsR8Op1kBPRGvjFHHsvEtWa5KrtnxB/1Au/KEs5NDdhaAZrgtH5qI/YKNwU8OHgzRzkQe8OUkLKVDBIoovJcWMrkrbTLh8d3VYrYz+Rpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p0eZyi8SY0IETtpjRnmIZRmC0o6uV6Sz6V7BnjQZ00=;
 b=owbyRyPxvk77RuNASItLnjUl4+kG+i/CPx7W/Tp1NfS8dsP3wLkUNsp1f+6RyMT/I1unq4CzXotpFfNtseR4VNkKzCNLsWhTrbTkqDha0WyQyvsHey4gqwpDeg/eTxyoPs4AZZ8E6TJ5VpQSgTBIy9nOXn0vdlfA2QCoLQeQLRVd+NUOINvd63eYzX9Bo6lKfpcvd8ZE1X5beIqARtKqESOjxCWutX14wsI3SixitmUpXsJeb6ZsKh66DALDauFai0sneD2cIknV6CHpsnXN7VtfJ/B/o2D/XRJG1JaeIGv/P2znL6I/gbh+J8qGoMEz9cr65YBtmHQeO3a9FUR08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p0eZyi8SY0IETtpjRnmIZRmC0o6uV6Sz6V7BnjQZ00=;
 b=lLNwhTn+Zi0CRcfyVEAJk5XyAkZj7rlMJsMKTtEqL5VWGe2hBQ7PnWwl+yBwEccZWcbPi1qQNJIy6jhs2WizUyYIWXiZ2f5g3V98bx+NDUynr6Hd3RG+f7J99QcuJH0MM83hYRqzffsAMGGmuNSxT8ABnn8SNkRIz7Aqs/4PIiURBDBLrubf3R+cAzp8FNH12qWpXTRrqqzCDgBdL+BtnQ0xR7H7HxTqjXK8diX4fmQoW+7gQj9UaWkX2gs+f+sAe5hhLT6rOUI2NY2tYaba//wEzpfcOdhIxAIPIruk97/xcAY/7Ks5RQMH1hyTc3u27w7yE29EH/Ov/LVGbWGDfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9358.namprd12.prod.outlook.com (2603:10b6:408:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 14:23:53 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Mon, 23 Jun 2025
 14:23:53 +0000
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
Subject: Re: [PATCH RFC 25/29] mm: simplify folio_expected_ref_count()
Date: Mon, 23 Jun 2025 10:23:49 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <A9714726-55DE-41DB-A5BD-57DE6E8EF2E5@nvidia.com>
In-Reply-To: <20250618174014.1168640-26-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-26-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0848.namprd03.prod.outlook.com
 (2603:10b6:408:13d::13) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 54185383-7a2c-4cb1-4a0d-08ddb2619473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5yIHzlpzywQVzsIJty5GPZ5ARyrwsbBIlFtP6B35bWN8cs6c0T9oDZHb5g3p?=
 =?us-ascii?Q?GhmpMg11tfvZrQjpIXs/Bj3T/XtTqKjD2GyvJv/9nexfDF/Fsg8t1WqwdTBI?=
 =?us-ascii?Q?PbMSnpYS55BKt5qMS7LfErfRXoVr8ygmdN8wk82SChJ54eJBoCkMr9eXsUrC?=
 =?us-ascii?Q?1+vg054YykhvtcMXNINHmomNyS86GhoP06iHa7GhyULKSEx9Ou/Vqq/5L0Jk?=
 =?us-ascii?Q?PXRJlkdv6xt7UYlKTG4MPFc0zZucTwL0ygpdeNYeyEv5aXSOA0sTI7rVOCTf?=
 =?us-ascii?Q?TVfOH9zBuubsGa+shu2qxMGDj9S3I+Iyg1fobvpY6kR+1FLKTQA8WW7Y97Hh?=
 =?us-ascii?Q?8iV4CB8bSgvgGbFO6smhu5ssidwqWUHXgNua+20IdfgcsUaBpwe5ruuD5UaG?=
 =?us-ascii?Q?tU3eBB9m7PPKQZo57bTupmiLCJgZoFb3Y+NBpgXvbp9Z+CY28gNp5YsKAlM5?=
 =?us-ascii?Q?HcTU+iSAWJQEyGP3mvSJhYQSuqcgV2LzKdJJyc/PGl6uORJGMHi2DGIyh7ME?=
 =?us-ascii?Q?Uimx7XPGe+dCUYFf3PYv3nrp2lv4hzfqTiMSPYxQTZuHcUk+0ROOfSwEE0AB?=
 =?us-ascii?Q?EF44vPi+jlZ1Zc8rC910ZwYS9F1FfZfK8z1oSqz6imwBUiu21Q7jm5Qryc95?=
 =?us-ascii?Q?IE2YhALau8yFdd74hudHmcwca6/8ZnYpTNMf3IKJE2pX3R3/667apuccWlyL?=
 =?us-ascii?Q?glI+ILvm8/99LXDHAYiwWPS/N3puHTON/BAa7/HnECPMjhj73KuWhK2Yfa+H?=
 =?us-ascii?Q?Ydfy9UCeoQeeFlxicO0y3e8IncOvqqPrXj0LLRNhPftu9NzLabqq+YSWEPNg?=
 =?us-ascii?Q?LdLfRLAfVPdsYimTtYsBOD3ZV9N6UJ5Tuvgy3AWba6wLgMgZWhO7zziSn8Cu?=
 =?us-ascii?Q?xHBg3AAi68F2WRxBfv5JLmGyjzgvVuSnzbRPFCxXuhdWD2zV7zY/wJsv3cDq?=
 =?us-ascii?Q?j8XoKTbelwRJlALpoaGMYSuBo53E6xKbVSss+pTyyUtZMLd0chfyIqCw/DUS?=
 =?us-ascii?Q?kBDYyUx0cim5NILO0Z80lg5SklsQ2s6osj8VzFKYKrIBTORQBQf+WVbIrJK2?=
 =?us-ascii?Q?8hWCIoQGAfH8tKr2DS89+CNayk8HATQyZ9O+t5oe1Y3uQCMqDFDmt0MsOq26?=
 =?us-ascii?Q?13B6jm3BHd0ywBwX34Pu+b8+vL3RD+M7tICdp6DnkOSiDx7HFViQIhLdXcb3?=
 =?us-ascii?Q?LtLYH9l5VjHYMZNU7cyafRMt9UkOKkRDLJ4JrEfTI6Yl1s8fIBo7A9CzugBk?=
 =?us-ascii?Q?9DY7GmVRETCuemkp67d4nwU/iyksWlY3jrx0rVlLYw+KWsG+Vwyv3V0ny83E?=
 =?us-ascii?Q?7NND9RoyVUB5/VIIxb8ySDmiRpSLF48XE0GngxQbqhHhDyCgCDgWTd8hgv9+?=
 =?us-ascii?Q?NoZOp5DvwuVFhpbTrJgkBXMUIA84KyZKGJn32CcCIAU+5HzXsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PAJDZB6KwSh4r9BkdDY2QkVLuPl7PAFAb+71ik4cgV6J4+jDVnPX5+uyS3J4?=
 =?us-ascii?Q?oQLmRDsAP52L3ZXAa5+vD5R9BQjZFdf4P9QKNr6/AyjL2TNbfQXlpLuujDu1?=
 =?us-ascii?Q?zDuzUeZmBY9eXL0fFSP2/jyScWH4aEz/xq9km0Qe8+mGgOkIZzXAUk+ORbNM?=
 =?us-ascii?Q?jXRh91aDz6KexApH/02x2LZrqMJi597oXm2h76vG6u4Px8IM+XTyQumHhak+?=
 =?us-ascii?Q?zBJXrrpz3iUnPxNM+/PqQtXo41xDgMegxgNP/d8y0X2j5+ZUqH8kO3/JYsCA?=
 =?us-ascii?Q?XRgFMUQGs1v5+OYHEXKtZE06eO2QK5TVxghtTj2nsLQzcYSnVuFSFgdNSekd?=
 =?us-ascii?Q?9/LqSX/eGGr4p2pyHSsPvb6UUlVTsaR+CSKB6pUYK7IWjujhP4yHJfn/aonQ?=
 =?us-ascii?Q?Wwr7vuH5mQODDrLMhrE3QBcSSf7eCk1jxnOKHTr2ROLUa+P6ijUfvg0UMT+z?=
 =?us-ascii?Q?C+a/uyxXjnN/1jSShGQ1mhLP3c6dP5kVIiHctTXNoAQPI3VHucwy1Nx7kPN2?=
 =?us-ascii?Q?+WdMyefKinzbupu2UW4oyGn1EIiv8re52FpsvKvIw7QpQyySrqMYmAhq3c5D?=
 =?us-ascii?Q?OBAkbDuFLxPjbG+uTVzdp9kfIn74PLaDu3QoSajMZVEPiylDRmeYVFUT9aSK?=
 =?us-ascii?Q?lp+zcT8XNlr+ezJG4J+pCjkRwitufRwVwqQa8KdMQXfoX8CeVmkH8K8qUlrw?=
 =?us-ascii?Q?Na32/1ZuCf/VebBcwwyxY6n6TPFRVqK9MknLpjhGsCg5uh9TtdjjrD25uWKr?=
 =?us-ascii?Q?n489HyhqdQg3uNa7LDdpU/nuQ+/5DSzS+MOPlj+TSLn23xaJkIFwXcMuDHDB?=
 =?us-ascii?Q?d2v3jfU0KUk1FQh/Lx5sfN9ZAjHRrte2KX4gYZhXLITGI//ZJfjEirGr+kgG?=
 =?us-ascii?Q?EpQxIYrThS+D43cu38AxTEoK6K2+AQfM5Ts2zt0K7FJizWICcWSD2jeiw2b/?=
 =?us-ascii?Q?xMvplESQEKy5mZx5gBJ6lhEd05w6ZwnyGEgKk7rmpShDyxxbRhp/e8tDouHY?=
 =?us-ascii?Q?EWqB9rIbz6pFDVp36C8S902Wax8JR2vEndrioStOj4uCsm2Ts/jPKZJ43tfd?=
 =?us-ascii?Q?30xSc77M92XcbvYRVBCNfBV1OzsCr5EO4UxlEJxG7dFWwsVajwzrGHy9IfrO?=
 =?us-ascii?Q?mcWKan93Bvd24BQFlpejhZHhGLegetD4HaJASDEvaQ2wDItw5XTpLPh56Qjk?=
 =?us-ascii?Q?7wJe4F8xvGK4qlYl43CmXy8fsn0vUf3CXXp3w8ENFib9ITWHubaaw9Hw5+yJ?=
 =?us-ascii?Q?ZKhandlunME/TP1xeJfRPrYUPCiugWywEaPpY2/2HL2QLgbGCCFW1tAAtOBk?=
 =?us-ascii?Q?VdDCO9cNFSk7uEPElqoNGkOMF38Z3tLFyYDMsHoRSpxkKZMRHavBlp2eay2M?=
 =?us-ascii?Q?0/I3wuPws9RmC+4HXghFdH96h/OSZG6hrivYyOY8DVEfUDAViM6oFUxKZTIN?=
 =?us-ascii?Q?5aUFLnya4n9wgVGE9i0ZCkWhFlDdokOwyi/rYEfrG9BkP73gezvOtyCaw2Pj?=
 =?us-ascii?Q?hHaJOj1L/zHraQlhQbpXdRPRtaTewVskv2VpqyFSeHM7F/MQpILax0Pr64dJ?=
 =?us-ascii?Q?QNOB5z5Qfvh0nr9Ygo8wbQK7TvlUxDKULeuZPHoK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54185383-7a2c-4cb1-4a0d-08ddb2619473
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:23:53.1155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaIGel2GAbRZPRw8f0SMVHsNIdIJfoApKlrSMLVUY2m4AbVdUesdPBpFEGWnt0vs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9358
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:40, David Hildenbrand wrote:

> Now that PAGE_MAPPING_MOVABLE is gone, we can simplify and rely on the
> folio_test_anon() test only.
>
> ... but staring at the users, this function should never even have been
> called on movable_ops pages. E.g.,
> * __buffer_migrate_folio() does not make sense for them
> * folio_migrate_mapping() does not make sense for them
> * migrate_huge_page_move_mapping() does not make sense for them
> * __migrate_folio() does not make sense for them
> * ... and khugepaged should never stumble over them
>
> Let's simply refuse typed pages (which includes slab) except hugetlb,
> and WARN.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/mm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>
--
Best Regards,
Yan, Zi

