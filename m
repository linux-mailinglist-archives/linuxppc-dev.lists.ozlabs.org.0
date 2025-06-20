Return-Path: <linuxppc-dev+bounces-9591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013C8AE22EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 21:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bP7682kKsz2yf3;
	Sat, 21 Jun 2025 05:37:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750448240;
	cv=pass; b=K6fY2f1/z8CEbBuAaPMGcf0FbrAytfHpZBFYDhdHROmDguMtcdj3KZXSi6aUUu1XVXIOZAxcNy1F72Se50FvLR2iVG4Rm9yAuDf/qCId/2YKHsET80Kp8zIhS2Rd1RloEjhU/VAJrwMK+nuF479UBP72gpyhECje8BcdR6d/z+xHG7WMFc3B0LcTmd7fu0wtXQ609ruKXbIsYTlR/IhtYGI6/KvajyfV6CUzsaETTN9FwxvpUiQED93h2bf9ScLXocXJDs3ZayyGgfbUcWEkNo+tWOKvIjCtdoaQeUSC5IUF5s4Qp9xQjN+W6Z7jRSPmB/ooxY1J31rtawPugl0JJw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750448240; c=relaxed/relaxed;
	bh=VI7TBazVA7tItFx6bQWapzKucGzweMn/P54LiQAQe4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NjJRAMUHaMBonXbNV4j85h76uk9iTJXHh7NegfDCBrwWEXclXcfKig2938Qk58qNoZcNtzyLvi0TFH8bPHLp+EgDDZNPUfoCm11byA2OHpWF7asCYEGGsX70Q7OIgKV2MRz7tshBa1Y2D7k/Tk6dalFnxM8OT9drFDL5mUySfsJZgvm457rQahd7QFLkLbq3LTlEzbY6qoKvhffWfBxUNlb4qPWAhkToC/5ADFM17Q3E7f2kynT1K1XbXAG2ovc7xJt0HeMjlr/hXmna/ZHd1fIpj+9g3BTpog7I7RDJqkeVCkgdOt9dKgRFwU4kGTtq+A9LJp+ClOqKkiwdQv12qA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fBfrTGAW; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::627; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fBfrTGAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::627; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bP7664pXkz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jun 2025 05:37:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+pDKGKnclb1bPr8GK/DsBsr+anorwmHrYLL2Ko50MYcym9myB4cUeMfRAiVfI4phpO5PqmTOe6kPlp2MfX7bV/6BigF2sPzITlA1XOUDCkHlQjMp0zpW1/MCLFac9t0FBxBo5dbbBN646U8bK8a+MafkOD7TBnqE8ykHLQq91uN/zDdXdbQQeLNktkUMM8QItU17cUu2ronRMsk/CFYZTilBQhp7UlY1zCj2I+4ts05nFBrG+y0fwxSyycfOCnVP4fpzu59bOwKhdKeqYq64VGwHhifUGdeKSrVYmf5T+SwCSjn+a68Pncf4svJEMrx4Ku7LUBmrChtmGYTRgochA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VI7TBazVA7tItFx6bQWapzKucGzweMn/P54LiQAQe4Y=;
 b=Rz9hji3ylWeG9BZ6mA7WbSsctTX6P8PlRnqZG4l2OfI2E2CyjHEiyY8IT8nP8KMW3firqmQlDjkUY9krN7x2XvDzyW+GAEGb8bZxsf75bHso4gv21jT04FiX1RpH9zhj3VeV6F6cMutWfG/6qUG3V8z8D9La1/v/MRfTtNSIL+HHnX9Gt+2H5qYxTtTflNE97nSxBEIuCFO/ZrC3EKxOhmBFk0FqSBAlq6t4CnYAsPnTGkntI6dN2bBQV3eEVcYrUoJZFatNRNoj9tk5fGUY6LX03nP3BbBDDXPcatpF/GRa0qdaE2OdiHwBjwFSY24hMBav2imn8j65djeTgEhmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI7TBazVA7tItFx6bQWapzKucGzweMn/P54LiQAQe4Y=;
 b=fBfrTGAWiOYccuuQ47PGeMAL4mrNdAFxm3zZMhpsUdMxBGcWuwwNveyio7AQrDeP6aupg50cg8ztZNR2+WcIvDcgqQCwJeAPmqdumX0Tgm8PoBfYLvitb/aJpW8gA8CJqOyEDnjMgWGs/YkO05x8b3XpV6k5/pi7Pvu3Pm7yKEVQRxy2uOBqJQ8vofTRNL5oiJZSpIgI8yLT+RaJShq1RnOF2JIur0mvecuoZ8P4uOZykkoxOn/QOpxMdCtTwjlk+myDCxoC4Nu08w5I3anb6lOZV5vQccKu/5n5/osWXXSuQ2ShVkWvDtOKd6l9a3KZC012qrIycfFnGTDlUr/b1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 20 Jun
 2025 19:36:56 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 19:36:56 +0000
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
Subject: Re: [PATCH RFC 10/29] mm/migrate: remove folio_test_movable() and
 folio_movable_ops()
Date: Fri, 20 Jun 2025 15:36:52 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <E8840368-938E-4AE1-9D1B-A2C71FF663BA@nvidia.com>
In-Reply-To: <20250618174014.1168640-11-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-11-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0787.namprd03.prod.outlook.com
 (2603:10b6:408:13f::12) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 6012c98a-b440-474d-1f3e-08ddb031d127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mydri1aERD4XrA/eia2JWXXchBp/7PnpQeQveLln/gkaO2aabMzouuVWJ/K+?=
 =?us-ascii?Q?2W+Rgj+Hq8zJypc8GelwYLYSq06rrymouqKpNYbZjfqkujEQ3SPLOQUtP/5u?=
 =?us-ascii?Q?JHxJKBrGAFiUvZOEgwMi+6iSf+BQKI2+qQ7T8elyQhDmhEK7vMHmVmxALzT3?=
 =?us-ascii?Q?YE6NbZLRzLeMrmr2swp1yQiDQRxmmOY/gtSI6xUMgbi+6v6aDCZTRyP6FgMD?=
 =?us-ascii?Q?5OjDLMRfsLAnYLD2BDyHlsdBm+Rr2oXZPCXndgjO0TdUsH2AkpvG75L3woiN?=
 =?us-ascii?Q?H2LpbwHZzVl/CeAyXANkHgWunRdhMXrrBtrq2yyH2GaHmW3yuCDetZbNZaUR?=
 =?us-ascii?Q?8qtoi3mb3dr9UrUNc9Xn2Xnk28gG1y5SjdqvjQdCufhY1pG6uywJ9aYJTJdA?=
 =?us-ascii?Q?aaYwoweHUzvQTDeFJ86OoId9O+3Yon04H9T0/mBwHqcue/ndb7N0wF/6EpSA?=
 =?us-ascii?Q?m/lVGGHh6mL4bAJDNWN43ZOhHgXK6Dw+rA9+5Ea372l4hjlpnweOj5crGL4R?=
 =?us-ascii?Q?okeJWr14D6UpEK+ZInlJC57jMIYteNLc+M84HQO+d9YmflmV1y1Km+DySC67?=
 =?us-ascii?Q?XiMAxvXt54CLJM+NB8VGq6Zf0bJt4eoMW6Kk7Rbi8D8CvflRT79Bnr1Uo88p?=
 =?us-ascii?Q?MbiI2rd/GmJmvKi8+AD+LeGWv66NNCYHsYiYA92D4l/hLjBWyEZujs23W+75?=
 =?us-ascii?Q?yNU8IeO8vhmWHeedH3etYFNdNgihxa75/LosNefEeinRztxcoaHz1cmVjQN/?=
 =?us-ascii?Q?GI6eE/UT2XeyjHP/+EjPXfFLmUzKw7am0/AjWvG5moLn4ZbKQYXktpvPgTBv?=
 =?us-ascii?Q?27GJDGxQgilaWnYQnsNZrt8j9kAgxSGFUjZpuYQTox5r2530VOxH0jBLu+oa?=
 =?us-ascii?Q?aRlEJ9PZG26pW5hp9+0U++ce2MDgdV6xIAznzM7ivUq/JQBxjQPD0ab7mAVT?=
 =?us-ascii?Q?Ht2Pbx9B3p49zPd1Z2H7ThWPjv+7aV7gF6OR/2ngNpRbY3s3QA8VfWpN9pdr?=
 =?us-ascii?Q?UDJ3Q+J3o6VXnrCFji3YxM8XxoQ0Gi2KwEUBE3fGkPMjhi7Ypu4K4ZJyFHVF?=
 =?us-ascii?Q?KxrJaeZNnLWmOXf2FogXekREHgQ2fcaVQuIlaXZhDS2NxfoQn+oRRNMacbiN?=
 =?us-ascii?Q?r6VRS6JphGWZUo4K4WxtKi7+ILK9bQpFot7gkyoUVf+/PHnFWDhkXUw5cAVJ?=
 =?us-ascii?Q?EsdnG9MImE/Y4ECJHX+KftUVyI8pg5m0b5jLkPwWkZaIyLrtGyd3taLNB6h6?=
 =?us-ascii?Q?xWikbzfxoxJSPwbRONiTMzYsLuf3jmV9DiBUmp2YD8bf6kz6aWOSsMaUGAWs?=
 =?us-ascii?Q?YoKFDfx3mh5D4fYou3ZwXSr7GDE88pib6dAXiyGF3onkWheG7UAGYHytaBSq?=
 =?us-ascii?Q?vVp/M/eCkwS8kDQ5CyHjVd/zs3YKJ0B2nvzMGJXRDYOk97iqb43HUZ+T2lkV?=
 =?us-ascii?Q?fZti/tTpx0Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xn2FzTTxReRyuQ++fXNhlWHxsSMDkmdiwV+MdUzgCGiurwOEK5hvuao+qDwA?=
 =?us-ascii?Q?nN3Q1E9dOWl+mE7Zu02fE2yMNInQNIhfhu4o37aVvfNtfDK63x6LJLbcWoCW?=
 =?us-ascii?Q?WpWuKQuRvvXYvSiozLPD0R5qNaNJJI40sBo0dyvPcW0S8rKG8h9I3RlC0P1q?=
 =?us-ascii?Q?KYj+BhCcmLcHkCD3Qqoe3wvUMrk6TcIEL78SX5ORIDCQyjo+84jl2ib63Pjc?=
 =?us-ascii?Q?YWewX+vwLPNxmCHmRW4+krcLJTbB9MzN7UjRzMO5prSIbH39GLhHmEI54m/F?=
 =?us-ascii?Q?1hMoSnscUHTvHE9I35Owpc+SyakeCMCf77VaxCYopVjYp33g250x6FxjMmCs?=
 =?us-ascii?Q?8KX97lZLyP2wicwfiorlHqofJWQl3id6ttraNr3GSrUBae8EtbI1BpkszKuX?=
 =?us-ascii?Q?zE0HUHFq2iQxb+wadEkoPIEeYE19O5g/HS5G5YpXXieKIxdi6G+4CQClANFr?=
 =?us-ascii?Q?zwf3yKDh411QJVX+cgWQ/LxaXPy3fYsy8rkqTtv3s42lXGSODmLjVQyQxXPx?=
 =?us-ascii?Q?KxZ5OpgG4CC4b49npFRiOYluHupvdpsJMMXFNDsj6pGF77b0Lv6xmimDsmbN?=
 =?us-ascii?Q?cj8TMMv7L+ROji6/YM1ocVOuYTTwPgqIYPEl8hu96B/5/+3tHyvnUEuTw1Mw?=
 =?us-ascii?Q?I6YkWnARe9Lm92kZNx7a1HTzi80kd2iNuV+jSLiT0H6+y1xOvTWsXSixOI6T?=
 =?us-ascii?Q?8jaeuBE5e6GcgydM7dWhCZkzE3sUrt7PDLVcg6GYB7TIKmOJ4Dk3+5uY7QRj?=
 =?us-ascii?Q?PKvtbinRNP9B8DELX/LnhXw/OxtwGbR7RPDLNA7YNpsYDVKbNl3EO/tnBN6M?=
 =?us-ascii?Q?CLGIXAlwMLFG2oQ6CXWm/dcL3sgjIwHnDaDfyWPQIkBUsokggRN9UiKrbSlX?=
 =?us-ascii?Q?B2nY9KpXGws/aWuAfidD1G+HWnAhyKc/J9tfU4iudx1aoQ36m2snv6+HjWzv?=
 =?us-ascii?Q?GAs4roQt4UYfp/iTfaX48a65ET6xHGFKiNi6TD884VI3Y1wirW0R7R2AqTqu?=
 =?us-ascii?Q?oLKvJkos9O4LIwgInPt/kkHH5JAtiN6clIHmUKnFkN6oGunmlGL1anpC5Ueu?=
 =?us-ascii?Q?FFsC3zknDQb/8F0ZRKQ0QSirZglRCYGaFo6LlnpPfwTTAmj/JOSwXpfDQoen?=
 =?us-ascii?Q?ERV2o6QO7hx9C5nmt7ilSlKFjiKxy/LuNdDStUy4Nx0s3l0t5NIhJzJ9rIjR?=
 =?us-ascii?Q?JrxhEtVPHNrmlwiyiX7FijNeq2fhuVmhXu7KhqHAX8uaZiJPEDALIUJ+fF3u?=
 =?us-ascii?Q?tY3JH+Vakn3OloGAmOhuRFKNlExKAC2ZamaODPZXEcNL+BQQACs+cx8Gr+bi?=
 =?us-ascii?Q?GPqzLxM7hZxECuRH8IVjay/8hbS0WJMGG18mOfQG1M5bKtvbVh2OK6vxv7io?=
 =?us-ascii?Q?5mqpaov8/cStsHapN2L0i0/yjMjloEeN1tLpC/rMR5lf6M9nKMGJLZmAiZgk?=
 =?us-ascii?Q?FiyeGDPH6zuQDlO3eiz5FqREkye6y0KlIXKWjFFBntgfBUj/a6e6YzRcZblQ?=
 =?us-ascii?Q?+OUl4kLmVYuI+GiuKdNfGm/CVuLADcdtNU8jmIC8kg9P0UlJENWM8Ad0Qjyf?=
 =?us-ascii?Q?/Y98NTLOlTPSdGCtXLINPFYpuWdcBraYGGLOn6Fn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6012c98a-b440-474d-1f3e-08ddb031d127
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 19:36:56.7980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6WvMwRMDHbXnkg3idOR+0tTmSla/YOmlTl3dbfYFyGpyQqohuUAWgBxqOHhfVz6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:39, David Hildenbrand wrote:

> Folios will have nothing to do with movable_ops page migration. These
> functions are now unused, so let's remove them.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/migrate.h | 14 --------------
>  1 file changed, 14 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

