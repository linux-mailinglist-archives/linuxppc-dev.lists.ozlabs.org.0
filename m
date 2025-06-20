Return-Path: <linuxppc-dev+bounces-9598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3FBAE23BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 22:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bP8dp3Chvz30T9;
	Sat, 21 Jun 2025 06:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750452382;
	cv=pass; b=ZLCybdVXrqq4Q/1wIu+axTzVQGO9/eMb54F6R1UjHrRLqBJC/GtHI77Ar5HDcInOwcvAipsiYmIt0rcH92wus3FHHsItfiVIa5hCgS7G9yKRgCbDaO7kK2bw0MWuO5TnX0oKtJwknh/o0Q+pwkLJH3VkYo7bmMU74bhrAnb4luRnimXSYpbLVH19bRDXcr0DrIyWrGvoSML0Rj+L9t7XXayR5p7GPfhr+OpS+trvHmgEdjpoBZuWmHzMqH3Bqk45MqHBNYr6X3D+f62cmFgMSQxZ2FBP0dfrVHwngoHqIbgps4wKtBW5LG0cihku9OO+/QQZoTVUWNkaYdhe2eCbfw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750452382; c=relaxed/relaxed;
	bh=i8hzGLujZtHl5q+u0tvp7yb73QzNIDj2kyzRuCh/huk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XaX1B3nTd4BSaDhO10IdP0veX1O/bNuww0XdOUhLeIxHVAzxtaygEwisGRuaf7xGOcLL0sPrZPPvsOVAfSp33BHaFJKvkDm3dVymsMplmMrYW2+6IOlD699XLTgIZrAKdfwGLZGN3tl/0PKENLBmzr3Rn0xDzspnot8oVdatyd6qaPYmfLpBWVMM0AxRMaMhUhRFgLQXe8WTX6c+4KgH0Uz/FGTWZLPm/ZyDcxGkSb4EKMNvkvBw7s4ORKrBqVHma/R4/pP1wr7mniSYWYhkAk75L1GHr9I8GYThQ6f9LpPYZeVF+dlPhpqxEqx64Sgh8pliUQRmrqrA3vBPIZGnYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pyED8Jdf; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::621; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pyED8Jdf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::621; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bP8dn2vZpz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jun 2025 06:46:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEeAOXbBPAFd9LlTBehBN73D8aPstMdA519cB+u8DgijNfG/hRnxYVTkasX8gdurPTCkD1mq81PezbPxI4j/6Be6t5LwYlbVbfNIpFoba5w2Bfg6KunS+8mhTNy9pj6kkC9ZYBzH0cDjVwUg/yDYYtc+fLYZodW3CrVbTFHGx/Ig8NiUdRZ1RhQbPWJDNecd7gBfn8tf8Qymw8+jGbqLfLU4RLF7K4YP34O0t3JJEiJK9einl+GspOpyG7VZgk+LgMmNsZpCtfGhjnpYQqJdmjaeYwLvjWeSY4NNeFi/Q2xiRyRwauXrjkyZ56y7KtUks9Iq/6TU9zJdeYYrAD71sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8hzGLujZtHl5q+u0tvp7yb73QzNIDj2kyzRuCh/huk=;
 b=Et5VpZV22IoTKChafp+0vM6oJ3XEJVEtz9kNnYO0pDl+Cr9y0obwixxGFcxzTX+gRGiv9jJ6G0AJr4Uq8LL74IaO4oNWv45RYGaTgmlFPONWJZtP+amSNUqcZtA9FUN/MOLNDOYLQiFlf/FK1EKRKm4jUgIhZ30e8VjpqlmK9DiUmuBH15x76agu3nbtrC7fDvOAwYoDxXUiNx0st2H7ghoR1hmJcrVVkWeKSiyVX1y0fDBeQ7lBi/x6wj80xoHfSf4j4cou+cgwEDXfut6xI4E3m8P/elBhIKeQy2wA8C6d06lQXuypZcwiwJHaQiJTCoTJ6wcguVLQtejJraCvdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8hzGLujZtHl5q+u0tvp7yb73QzNIDj2kyzRuCh/huk=;
 b=pyED8Jdf3TjCL9EkDb8OcZAAQuvqvqPb1NENA+akjrlRESyO/NuG0g4YZ9iB+k8Lf8Vmvl8uWBJDclY4mwxmYjzOblWGJckMQeS9L6vFH0nlLDhSfuNlH8TU9IXEVTpmIaExhX/ESMPyOLSnGg/vt/yanajwmzXoas5kI3pAH8cUniGIkMWkXN6NdlmnJlY8RRhPpoAxkbIEoHotpe/ZxeQcek22iDqvlFosNi7YANZ1HoUyldlx7v4d0bzuRy0MlQ9wmTUmvVSi0tLVna4mH4DprKCn7RGkTT+o91TSwNmCRL0b0kirdhkWMSQDVbAFACnTwJOaCvXNs0BrKEdNbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6075.namprd12.prod.outlook.com (2603:10b6:a03:45e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.23; Fri, 20 Jun 2025 20:45:49 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 20:45:49 +0000
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
Subject: Re: [PATCH RFC 19/29] mm: stop storing migration_ops in page->mapping
Date: Fri, 20 Jun 2025 16:45:44 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <7C7C7468-CAE8-4B4C-BADC-2D343FB32426@nvidia.com>
In-Reply-To: <20250618174014.1168640-20-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-20-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0134.namprd02.prod.outlook.com
 (2603:10b6:208:35::39) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 63977d0a-2cd0-418b-9d7a-08ddb03b704f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ajgwCJz8nVN+L9z6Bg3+SFzyVYBWCGH7lfB0znXUff3ecbzqItP/cX14JvKB?=
 =?us-ascii?Q?GQpV/+GYcmemk4IRwqOb/bgI6++Kbg/TDD9j+a8UU/OA0EGhKvY2K6rrxr/q?=
 =?us-ascii?Q?+E/ySdG8qmY/LYaZ46RpSuHyvf7wSE/913/mgRzn289LmuLe74Z5FEb8tFbL?=
 =?us-ascii?Q?s+ASQZ8BV3D1nao+1/mi7h18CNIL7KMFHVaz03MBRn9scEs7ldj8nEmmymNc?=
 =?us-ascii?Q?HmTfkQEpPhOZccg/Oh55F5i1sh/EOpZg59vpFy9F4U8ogvo5ZZNsihZeXUhc?=
 =?us-ascii?Q?GxQctli6s87h9Qx6JbP3YVzRXHx5+5hR58Fuh/nyNniNr1AVaQJPig3IbUtT?=
 =?us-ascii?Q?CwLNkZJuup6lFkPe0UASHdR1BXp5h2zgAnuGIhP6fHFQVfgXPS/Qxa3+Z2u1?=
 =?us-ascii?Q?1Yu2pynMuCJ1yBv9CLwxoMxSHtfUOffK9Z1QOo0jUCnqKTdztRH7/sz1Oui4?=
 =?us-ascii?Q?P5muTwG8odwr3fX5s4YO2Xm5BiYL8tpqr8QhkE4IOYikk7HyhyE7bqq2pI/D?=
 =?us-ascii?Q?raovoBy3aJ8ul5fXj7H1Km/xwaP/S6OrNr1PcNJhAQQxk1Qqv01T9sO/ur/L?=
 =?us-ascii?Q?S+4Bs74vSiIjCz6Gv4rcIQ5BnWs7l1zwd6EBs1ltzGMLf4OnOKLl92SRfDYC?=
 =?us-ascii?Q?0lm1sxgz8xyuOwx2XYW7g0cTik0J46fg8gI8MMOHf/vpryYUHxyf95nOjhHv?=
 =?us-ascii?Q?fL0OOLy+MvQlPywnJJu/E20wxiY/g8NXhiGRVhzMeiEzn8gZIPARxXqDMJ0o?=
 =?us-ascii?Q?FIIDZjefIz3QFydwq/yLgxJpEUP2KTInmskGL2+Si1eKSpcHq3aSXu797LK+?=
 =?us-ascii?Q?hJbUOOKD57wfLAIxR0SbSL/JU9XXIw61MMp/LNi6eYCcgSKbs8RiuJFHGLOj?=
 =?us-ascii?Q?3emAnpc1KRbXyZatQFJ7tuuZ2quf806f4cBNf0bWpglRXKgXdeftrJYliNnO?=
 =?us-ascii?Q?UgEnQNeH+83oThUEWQiX1QhQLJJ3HagbnzYDsy7qDalBA2YCXkL7cVKNM/rp?=
 =?us-ascii?Q?rO+Vhrx32bMRapVsmyQlCV4VCI7TXqj+JZ8pApVKZcdvmVIi1nFunCZRdJ6E?=
 =?us-ascii?Q?N6gqKR12U9rOskHUj/LWRjajUzGCVXIK4OYUKmXAfXNqH+HlPOH/KQ7tWoWg?=
 =?us-ascii?Q?byLs+9ioaT/QrxKjxsNQ9+th4KMvie8BSSpae5MQLHzDGnuAe/LzPjs+wThz?=
 =?us-ascii?Q?CMCVBIFotjfJa+Qap+EftyGe+SA/cFSQPsgW4NiueOcsh8gYACteWGMFdJzo?=
 =?us-ascii?Q?0rQwrRgQVF4VJiXtSee7a6a0AdtNaAlVtLYSJkpo/SYODhdq80oddsWKbhOx?=
 =?us-ascii?Q?Kq4nAH1sGiBask14K87DDkW9y/Ht+5qpVgUG78cz2zyin2mQ1wmm0EioDU5n?=
 =?us-ascii?Q?CIuM/lkusYSnyQv9KBI+NokDVQGPHTdkJcf5ytrma24YkguhFdtg/Sr2Uf23?=
 =?us-ascii?Q?sQxRE5AoRGw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IfEuABRjgA1VAE4yOWB1CNHxBLZ+HPnVYpIRuzidkIryQCaa2DHSVhsbhIGA?=
 =?us-ascii?Q?cbnwLkQUSLnk3faAb8FqnNmL860SEczGj2OcDrnNVXAAOF+6Bl1Sd8dkCSQF?=
 =?us-ascii?Q?ahQwJN08bW7pix9Ri4H5sH18uIFbrfMW5qAxnKtXnkgBBvsHXph6CHfNdNIF?=
 =?us-ascii?Q?WjUEpRqWCREbYXmM7YQnRAW0+971GythVVMbrhvGicbIjDo4BG3aOz5YEvWi?=
 =?us-ascii?Q?yUAognIiQXJTJehYJNr2zLVHgyPfBXYDfpnp0qSrgKBuWLEY5IGkUeMufbCo?=
 =?us-ascii?Q?DfIANfdWYwXKG/uHOHKTOs5pVxNmsiUkxuqrJOiYfZP7Ud8/m4+xzkejayj9?=
 =?us-ascii?Q?c9nhBXWZIKiVPFGbQFzn++Sk2yjPLkZ81m1NxpwlcGgpWIWrlh3Eu2qvaKcP?=
 =?us-ascii?Q?rda0YsneHIA17/mk+k4krTvIVunzKHBcLYDO60XeI2C7qTcGy2Vr83kGJ1pz?=
 =?us-ascii?Q?ACdGp1Bt5xmuhqtAGiHrDEAwTwmWESkyNNBoFFEo8PSmubfgZO9tmTgO3z98?=
 =?us-ascii?Q?bvTP5+ZRiE2r3hdzVlM0C6McFk+0dXhaSg3f90FDmjglYDAw0syJQl/FE3gc?=
 =?us-ascii?Q?c1+72xf3vRHcZ8Q78JDSPqyuUPz6V06EGP7T8MquLsnAqxk7MkNqJBpiQOZ0?=
 =?us-ascii?Q?5W/nM7ZJEf/HzC92/VUeLzMH/Bv3A6sYEAew/zz30rIFEhYeHGHCERFXQPf8?=
 =?us-ascii?Q?xEJxJlocBpYmzFT1qf46Xuf1LW7gomVkRi6pXjLttCRzoSAz5USQIrhCab6q?=
 =?us-ascii?Q?4CvlETJ4RV0zEUcE3Fnh5viwj69auLEv39OMc0vbORIawt6hfKUKD8a1C+Fl?=
 =?us-ascii?Q?CODiwcPm2aTJGwaYg57DQCYoUQYGfhKwuL1Wuj9oIQxJu70sZw9O1OIefpRG?=
 =?us-ascii?Q?SF6t1DjPXjsvKiLK0l/au2zm/NYzZxkpBmxEphJjqG+XIY6cUt1aPasUFDzq?=
 =?us-ascii?Q?08LtthbV5wzrecEXRR1Nc7fBxLFHkLle46+C0FvfB7pJl5ldrCuh2hxBkSm7?=
 =?us-ascii?Q?fKptheoR3H/vFxo5F1s2H0nquAb1fwkGqvOeboUFnUa18gdPJL6C35sjw7K4?=
 =?us-ascii?Q?gGoZS/4YmLl9ICDFJ2xy0bNb3AXm33TY9SbZg4tn49ogbmyQQX4vkPSD6xk+?=
 =?us-ascii?Q?h2P4SHtSx63Yv1YsG0hmZbhVqwLLerydJBKg+OKjoN81rv1SBmRnDIBzYYSe?=
 =?us-ascii?Q?y1jXWnC5YiVurTSs2FR9Lpw+5P5BmH6mnTiSHpNC4dKGmjp9qdP0lJACu8S4?=
 =?us-ascii?Q?CZ42LJ4cEyiJEzFW3BnIQnbWzKccmOMHXCBWdp0Cy5CNXHWDZZQj5HiitfYY?=
 =?us-ascii?Q?Sl7s/ACKoyHZK7jIddlgqRlUvyFqfUZ0PQWuJP8sq4Foeou0BPFoA+fVG3eV?=
 =?us-ascii?Q?6uGYrwFYKzloERCufAP4SYSsF/aZjAz/UFOvGavtpp0CZLruoc0OVMFybs4d?=
 =?us-ascii?Q?D7Q+S7irHsClPZq/yoibw2EQDv0k25efoJ1N8FuAn4gSm/DnWY5kHtaRowaw?=
 =?us-ascii?Q?+6pzisrTJZ2rmQ1R+nChOsrpUt9+h9g3kZ14zVNceamWxKt9ceiJLxiCPUNW?=
 =?us-ascii?Q?2Wch1qmtav/OGwmEBqIrx55MkAzXDHJXG47oHdz9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63977d0a-2cd0-418b-9d7a-08ddb03b704f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:45:49.3159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+G4SoU2Px2GYtCcZG89p6JSXt25vn2UWtMpyqWealSy6KQ8QikysQ7Sv5RidJNi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6075
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:40, David Hildenbrand wrote:

> ... instead, look them up statically based on the page type. Maybe in the
> future we want a registration interface? At least for now, it can be
> easily handled using the two page types that actually support page
> migration.
>
> The remaining usage of page->mapping is to flag such pages as actually
> being movable (having movable_ops), which we will change next.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/balloon_compaction.h |  2 +-
>  include/linux/migrate.h            | 14 ++------------
>  include/linux/zsmalloc.h           |  2 ++
>  mm/balloon_compaction.c            |  1 -
>  mm/compaction.c                    |  5 ++---
>  mm/migrate.c                       | 23 +++++++++++++++++++++++
>  mm/zpdesc.h                        |  5 ++---
>  mm/zsmalloc.c                      |  8 +++-----
>  8 files changed, 35 insertions(+), 25 deletions(-)
>

Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

