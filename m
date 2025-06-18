Return-Path: <linuxppc-dev+bounces-9498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A426DADF645
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 20:52:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMtBl2CVzz3c7H;
	Thu, 19 Jun 2025 04:51:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750272719;
	cv=pass; b=NmC0VWQscmRJHS2Gjvh02WdOd0nZIXkwO2Oy1rJFr6iLqn7D1m7ZrBH872L2+xu7GyDfO61OTz0bwr2SOHJqmSSB5hSwIUhKDMTOs0RS0OWOw+D0j6QniQ+hINvGKzszJcgYltL81zMO9bnVunNfq//+mUSFj+S0E/1jCkxaEaXbw0NdjMmsnVnnpWgQPIKM3G6PopNXflZ6N/AgDufSdsEvp7/Obt1w2Nq0/BSgAD7ksgN1g4J9wP/CZ0vupOngvaUfLDdZ2JfAtwrj3kIG2fBmHgCfVRG752zjI4ncj5uo/TjRLZ1hviOcvyZ5F84xvhcysspk6r+l7YDgb+m/7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750272719; c=relaxed/relaxed;
	bh=KOm+syp0wOSCsB/nWLAH8iwXyzVL5xErzoD4g/mrM8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MBhYv9+zI0JPHjWD+92FYEeGceQUfHzILwzzShCbFpYaSGZGeX5TxFIDQjTcnwSJJrr6OmyYoHLtlyeZiID192mEYLhC8bbLlfiyYVUFbLPxi+YoRMphrdNkO92hohjhEepBL9/kPwmxl6itcHoFytoLZOCaYZU8ZN1N3RkLY3Vjl0QSjaZR9unayFUe9y/XauzlsUmKKGSkeBQ8wagNOTdJRWrhjCDL6CAUqNWfTyc0AeUy2e79PH+fZTPwGCwZKOj5KbhzFqeC38K4TfSCHFa5tSjuSvzoAevR2axo6tHyfn4k/z6CIcUQs9YsW6KoEelYs7jXVhD3ssLkCdeA+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R99HXOwX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::62b; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R99HXOwX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::62b; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMtBk58Hyz3c78
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 04:51:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNEd/kWuh8WHuslZw+Czw7Sm974AqkLic8/MeVfYtr3mI5IcFrQ86lMuggr8ymIYFG2inFjLnMbMR/ueo2uPVVO+5mUprd29ImEYmy8Gxu/mHrRuviJlquzvXdBGVhVivBV0Nx+82AUU5lbNWMVUKdTlazUqLKbWvb/iuZgLIsc1N09BJhlCSfPIxB/SCRYwocO+pXIKT3KB/01yaIjttfY0glohOTUAwtHQWcMP+JURUuGq4M6qcjp2uOrNTqm3OAeS/4ZUlhTzQb7t8rg43TW0xWS4v4P2mabXNBwY8qQPCaX3N00PPo2dJ1hiDHWTTYdbSj2jsDthE7fyJr9O2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOm+syp0wOSCsB/nWLAH8iwXyzVL5xErzoD4g/mrM8A=;
 b=GILeZzk7fxlaiwet3f9oEqa+4YPOWMGqECo6HGU8oiupWaETBaTQK1EUEugQ+Cym4kMWgiyfKs79tmFl/aJUYPlH/F4e2ZOX7KkEMUmqWCKxdwsYOi871nHG5Zj3RE89uYCc1A30CN4dkL7mNZ2ezyRsmIQU4pkHG8hXAlKWTg5hVMMTV2qlvEQ7cE9tTJUKGVlW5PfKexJMZHd1qyVL+6irl9bCp1dJ4a1bXVrvBI/uzeGYLyum4k57XqG4GFMfP/+mLgHH2Eb+Ia4X5KhLNzcAXSgSqnlDS47pMpzHpceWlpTylydB+jJ+7DKaBhHwBEO7MKcJQQl7EfmQD6G6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOm+syp0wOSCsB/nWLAH8iwXyzVL5xErzoD4g/mrM8A=;
 b=R99HXOwX8sDighHLG2IrMjwfHwNNQb2nh1ayriZeVal/fd3gA5TKe+pcr+izDSHl/lVCDTetIdSFpU5UUt7BszTcHSz9Jw0N7C0PiusFSKtSgS2gpNN0iKkDWKJ2/22LwQuafl05ALuQlO8V/yaDPblK8UHzCE0sNkHPS8hSBEk1WBLzSfF8JgD2jW9Ln4UM6fuPtGbQHvHYA8+fR14Bc5VahQEPitB5VYBraoIRcTscQVvrGWYNoI0qhNuk184InpTM/u1+QBaUR475hxtI/6n2x40TDZm0nlOUTC/y1R3kHm5Bc5J5Vu9zTvf7CNY4TdT1ABehvg0a+6aoDJUa4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB8850.namprd12.prod.outlook.com (2603:10b6:610:167::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 18:51:39 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 18:51:39 +0000
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
Subject: Re: [PATCH RFC 06/29] mm/zsmalloc: make PageZsmalloc() sticky
Date: Wed, 18 Jun 2025 14:51:34 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <2DD630DB-90D0-4F0E-A673-D82822CAE564@nvidia.com>
In-Reply-To: <20250618174014.1168640-7-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-7-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0438.namprd03.prod.outlook.com
 (2603:10b6:408:113::23) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB8850:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe5e7be-517e-4b83-54c7-08ddae9928a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uONQc2Xu5ANK044xeIybXElApoBaxj9IWAHvvtIBCHusBd2pWJ8TWy+B7e/Q?=
 =?us-ascii?Q?AldVl+VaCnelxJXRqawCQTTsd6iG4Pam3jXIhZKySTeB+hTXQzj4XyaKyz+t?=
 =?us-ascii?Q?1/62KRCsLwgUA5bpCTuOGoxOY55f262ILMVN1zU1yzPwNdVCCFIvrou8lbTd?=
 =?us-ascii?Q?sEPVZfA4WZMNg+m0u3547UABylnA2qRrpzLihInu55aG6+mTl2yIqPiYQKKh?=
 =?us-ascii?Q?76sM94+JfHyhPEMAHLMg0Bh/vZfsiNrksfQx5OXQHV2sfjy6BJ4TTDYM/7nE?=
 =?us-ascii?Q?huRlzFg04HzqfZvBCzercTYlTdL21lB7vUbrFAtjGYdGfhg8RkqJyzF2qrFi?=
 =?us-ascii?Q?UyAQ9Dv95pMDVmXX/+MReWgat1FZw8arQWSSmRavMT2a6XExtzIP57aHlwfs?=
 =?us-ascii?Q?oZ+YweBRIIvwXLGqNoDPrYQHN/R+2WX3+d7mATNFb7oR2wCdhbunMPLsiVUY?=
 =?us-ascii?Q?OFk29nb8deAoQZfTkXsKRkcCM7MhauSi4tfOQ3mv8n0W9dz7zJwc3NbIFW+0?=
 =?us-ascii?Q?uTwUiP5WaOygc31FUgkJfgKWWmqa3n0mXfGDvjE2UTiWhFJb5mV6B8TAWs6W?=
 =?us-ascii?Q?1MedpFui9+FRavKiAItMX2aXJ3mPlcRdpAVTzTp8Py/YBEqJAeSm4xrTQ/Ki?=
 =?us-ascii?Q?yRgkBP5y2nzd3WOfjqli2paSCY0q4Pe+p/C2e6n2zY27mo5ctWML4gukfuZv?=
 =?us-ascii?Q?kscSACk8KtwCwBbMPpIax+8yS0RQP3nqTzq48DFO76cPqabc/KwwMR4hWRY+?=
 =?us-ascii?Q?oVRb2FeIoZqdXqMFw+iaPi/5BUp/xtkUe73W05sq+2m3i98TpfQYh9+kjBdS?=
 =?us-ascii?Q?Qz/WmlwzlcTjU2DGP72La9Wh8LtVI+anDUeMWiJyxy76uevu1jVMyGKn/s5w?=
 =?us-ascii?Q?Ps6obz47ixHsiYthSsS790PSXN8eDuzO+0gjbfsD8OxqKnRzWCijC7kQYUQJ?=
 =?us-ascii?Q?gWFDZdfUZl0aSVPeoldW4vkWqAuG9G1OlR7pyFwdAyy8ow5iXgo/AHaUvqgm?=
 =?us-ascii?Q?ziSIscoA8rRExLviiJmbXeagpb5pXQYWBY8WHM28u7viM0B7n1zv4Gn+4yet?=
 =?us-ascii?Q?c8cyMGy6IbL3sf7+OUjlsFKI87N6GSHXZZA0bcKhUhjpsoqDtW6TlcpOuJEO?=
 =?us-ascii?Q?hcbBCju1Bd4TJdti6XP0Ya5wetEBbd5zZhvEQHVsaIYhSn1POP2VqEALPCpj?=
 =?us-ascii?Q?IcjxCziyDnqTYiBqqKuheI2qO1GfjQL/8GHj4YxS/vtoOTaMUsXWdsA+W/hs?=
 =?us-ascii?Q?bLSQvNzCKwFmkAwi0hTy7U7oD1rGAQiWyIAfOQcZ6WBhtp9A7RTRZqU8Kgrb?=
 =?us-ascii?Q?WRr6eHSVxPHn/l1uA1r9hTOBtR+SBkz8qhSzewc7CwEf4CxhMdNdqHwBlHpe?=
 =?us-ascii?Q?aUI4LTUYSR5UE5KwJCbr3fuxL0UUGwQQpl4kr/23D1uvoEgqN2G17Ue2gMNg?=
 =?us-ascii?Q?kDW54WWVC0E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k363E7AxeREU1UbQtAn7ubq3skRV92w2zCXjcoi1MtYG/2nrAKOGkVcx7EGY?=
 =?us-ascii?Q?Y0oeeNZD+5ZY5Y446Rsh9qAt83g889wi8hsk7NxwgaukiM5gAmafG4SR0Kh4?=
 =?us-ascii?Q?ksgE0qtlg0vYUACF1sg5wXG+KPLy7Oy07rjx6x/7wkZKGWZoYM0yFq7NczdW?=
 =?us-ascii?Q?5B+o8g4oNcIQH2uP49IqEdy+frrY98lCgVAV7ojRl7ZEfQLG9wQDcZvSRLWA?=
 =?us-ascii?Q?HXNi6F9NdIqR6jLLc1O7CQrMJtSrH6S9RzfFu/q7Qh72m/V5anb+6yUh6jzu?=
 =?us-ascii?Q?wUuiClguasFjOqKwNl2TwzFDwRe09VcypyZSmJ2C8D0Ln+FsC7Xy2ONwVjRx?=
 =?us-ascii?Q?7tkt65X6O2eS5KHDvkfVMq7cNGovIQK1T6hG7ABUsI68PmCEfvZeqnTm2jXe?=
 =?us-ascii?Q?tpyKwLDuIZYIENkbbU2Ku21TP6T/JTR8vR6Ti7eYKoK7bYVS57dlWzUiTjQe?=
 =?us-ascii?Q?gKRcZuWnCWWsXrm+06t9VFN2onKSsb3I75l22Z7jOocLD0F701y6QC9ionpK?=
 =?us-ascii?Q?yvMGtDUr8g3/BQucRGgK/l0t8gCcFfS59RFSxz3az6bG8TO8PMBXBDI3l/Ji?=
 =?us-ascii?Q?3Y2f1/vWfreMotJ8ObXpGB68Gdm4D7pNE+pBQSDZbA9qUZJU4TgnvJmC94ta?=
 =?us-ascii?Q?3/mH7Bq50egsZYBJGZvgy82kjfpPWD7vM1cv2RMU8G0kvkjfKPhD35fL28vM?=
 =?us-ascii?Q?cncT54E3t3Ltdf2ip7M/ux6/5kiDbA33Atc2efztFpuXqOIikOAYpDzmk2Mo?=
 =?us-ascii?Q?kMG+ftqOCS3JcSw4GKLEkZ0b7b+w3WYlkE+rEOm+ZLH5Upwa8aNWzRx2e35L?=
 =?us-ascii?Q?vt3Iz1rGDC8J+Y6on44hR4hwRZFvRVD6oKkLgRoCV+xWmgTyn+0WZTnH7hv+?=
 =?us-ascii?Q?8UsbU0Gi9QxchO+pu86lFO8fkZvkVhnXxRzLeOvejGfi4EobzWjJhbf0QeY0?=
 =?us-ascii?Q?NO8pKfozMWQUT96hDsk0tLqtpQCtG0YUqKjo44g6ROsm/lzQ8jbUxwB/p+82?=
 =?us-ascii?Q?4dMiNDYOudNr4Sk5psP6+LsdQq6bSpb+eIM6kUAux0Xr3mvrBOfDh7ILJCIy?=
 =?us-ascii?Q?JKbF7k34YPBWw9RMJduYGGRYVXzT9LTmVvA5ou5othQcYgnGMRZCqWQ5iWxD?=
 =?us-ascii?Q?LSF9tdN3e1iNyT+Q4Bfvh+RuDZGZLFQ9wsFhqMmR7c6m38Hb1eJAF1G39iUY?=
 =?us-ascii?Q?k1RO/LcmwiSOcFWnNWSMroZDWffrxtW8Y40u/uU3I1mUZlwysWEgURRYFVru?=
 =?us-ascii?Q?u/lqvrj7ViPK/q0X/vn3DiawqFiaB688zCrWBCrt2QDwYj3oOldz6t7PH0cx?=
 =?us-ascii?Q?UeDGT6gZs4Uv+v+7LpiVHlmfxO9Nd4DQxmyNSrU/+GxVFXVcET/cW+r4zgXG?=
 =?us-ascii?Q?pMSs6ymhpfBlinIWwmE6EVQZer8Kji8zY9ZsuDpvshzadzoSNAYv8a2yZh1V?=
 =?us-ascii?Q?qagbkczJtapY/HV0z9GuvjaacnrtLJjKOWWiIxSthLFLkBG/9auJdq4uDXmq?=
 =?us-ascii?Q?d6OhKS6TQzLjYBmozLOkjoao6xQkwneDYGswrd3FdDfBhbT5k6KMFdRGEvI5?=
 =?us-ascii?Q?c0Y8dTkO25cW5qmJSaTJj4winACWm1lESyD2Q6xQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe5e7be-517e-4b83-54c7-08ddae9928a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 18:51:39.4400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNCJE1C9MspPbNCw6EHdBYpN25Bwnyo3OvBrKNURT2YxnDDS48K0fXkwHJyuc1hl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8850
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:39, David Hildenbrand wrote:

> Let the buddy handle clearing the type.

Same comment as Patch 5.

>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/zpdesc.h   | 5 -----
>  mm/zsmalloc.c | 3 +--
>  2 files changed, 1 insertion(+), 7 deletions(-)
>
Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

