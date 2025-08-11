Return-Path: <linuxppc-dev+bounces-10820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D9B213E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 20:13:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c12nn1Pv4z2xc8;
	Tue, 12 Aug 2025 04:13:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754936029;
	cv=pass; b=dMDP5sLhTtwMBhX6q/kDMoDKF2Tyy0uuM22cCT0b0ST3cXB8Du4jlx8rjjxoG2/elfIyxfR3C8KCiAzWUuwI2NeMmJokKvlodBmZ1snDP4iTNrHM9VTIq6yEbEG59tyWVm/3d5pD/4OhsUG83wGD6/dWt56bYQhds7qLbXaDaI+OfZKyrF0Ho7M4CfziCmLZCdlPMGwZgZYY0SXUzZWlkbawcMomhMcsP9bV3d1A9X/IA76zSsIO1Ar5Uvx+pdtJz/Kslmsl3S0+QDE/IqTE4Sfm8CexBWGRU/5s/lvNxGwQT/4QhLq2QPtJCBfVtvedKMniAgY6xohbqcK8M3XDzw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754936029; c=relaxed/relaxed;
	bh=sGV22iA4648kX+1SLXqRIJp9tvQz6hauCgYznHiUf3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g4i8gxbj2bhnHxcBI2Wt81vQOjLMI5TcgCsnEdvOv1g1jDiKfmlz1LTml5hCOBEpzmTJ64+bs+xoxkDQqz5ITqULSEojPziREMTXNydpw7X7UlJg0E7gt4Dc/k99n3WiG3drzzLymf/pkthN/SrIPbFlH/SvYDI++yY6oRgieBYD04JfA2F7n3nbsX8Vt65lz0VclcQTP2d9nvQthV7pbW9qCfIljo0waVeKq6FF2imCT072Mb8nJOJF5IVSJCCf6R3p4yo14jum6/XlxLsnkcku/ZJU2UPa3Y7qGfGBbiv8ywvwnDDn7jIugMJV354HbPNbVjmy/6wadbBcq7B+UA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AGmRNIvl; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::617; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AGmRNIvl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::617; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20617.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c12nm1TtSz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 04:13:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqCibHb7WfynOrKG6L3+S3QJW86vrFs4Jj3opxomgcUmpdUUl859ZQVnRQKHINNxLwosbznqrSKvMCCG2BRPvTrWUQaBhVYFhFRKOw+Xx/smhrYLedcIjfx85rgJPNMns6LpD7Ay6sGsJvmVO0/IGwcNw12WyDkXPotRkXMZgyu573BheoFzCNhXLj9KYR2D+tDLbrxrgITlYltKs5szC+ovr0Z7+G5F//O7mRseshcUC1E196JxHOQ/fh6J0gcR5z2/1Ukb9BENnW7gUnqmoPBot6l4zH+aYYe5l//My3lKe02UT80KuUX/KbxZok1dMXvTOqd6kp0naUc2GJT19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGV22iA4648kX+1SLXqRIJp9tvQz6hauCgYznHiUf3A=;
 b=mKjS7iRqf9RtZ7IN1IIw08y9jGiU9MhTc24bWHVEXjHug6s52va32X5DsKRr0bNPCTt7L7ncwltrliOXqyYW1dHR+1goFnyOD51EWbIoYSXGJqQ2h0OA8uC852s5EeBzdLB9XRosqulnL3s7NHTKcssbcUD3saDL8NB14lPyABjKLlCJvzl1UCpLP4z6PqW4hXgQLafrudWhuKKkIXpglM0nrWoHjelXxYLrG4oahMpCTisSQ+fuJ1CGWD3CbN8jfuZ6Mx/hmnwejxhIeZHJgkv47twoGtHeQ2r/V27G8i0bk7JP188uz6ZT08X1WtwsnoC799JeOIMuLwRTcT/h7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGV22iA4648kX+1SLXqRIJp9tvQz6hauCgYznHiUf3A=;
 b=AGmRNIvle1xNuzTW+OowrKLrpxVus2WO6EddvsBkKGE6ZGkNcZCWgNVPRKstgy/kKXOzoIildUPW3H346rPL/CzNywsQqEepi6n0S4lYjqd2i+5Sriho9skpFkYm1tmWmZcZjisgCro66daFSArrrkJfRiBXkdqqgHEaGbMR7l+3yl+T4czwAB6R9cMOju5jQ7OE1l+nvwJcOE3cWLEXDmMngGsYkYV2Nyet4aFV05JiqbZXp6Go3fmL03Z7EWsWx4ia0dBvhZzwaTPUY545QScGGfBvrR/jQgkJoz9FzChJqKew02EkIG3jeZqa2oTgoAMYa6QqAC6QsuPkszWCfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB7739.namprd12.prod.outlook.com (2603:10b6:610:151::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 18:13:26 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9009.017; Mon, 11 Aug 2025
 18:13:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-aio@kvack.org,
 linux-btrfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>,
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
 Benjamin LaHaise <bcrl@kvack.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Dave Kleikamp <shaggy@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v1 1/2] mm/migrate: remove MIGRATEPAGE_UNMAP
Date: Mon, 11 Aug 2025 14:13:21 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <B4A54756-87EC-4795-855C-3F80114456FF@nvidia.com>
In-Reply-To: <20250811143949.1117439-2-david@redhat.com>
References: <20250811143949.1117439-1-david@redhat.com>
 <20250811143949.1117439-2-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:208:d4::14) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 8197a7b4-0230-4ff8-9333-08ddd902c42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GlB/C9QUMNoi5RlZS4KAhVuYCrDyzlwNMMpuKf5R2+GrizrTmWwV6wmufBSv?=
 =?us-ascii?Q?eYeXizzWXFYP/6fa/pHQSyj3gxjBukLSrROUM9Daag4D/LHXcKZAy2ZJKj0l?=
 =?us-ascii?Q?Jy/IwAgy0wlzXFcH4A3hJqGiVCcMkYvN/JL40a6QFa1J1NuBNc/j4nT109v+?=
 =?us-ascii?Q?KMTBv3DI0T2ty/Uw21EbRRGi4njeCeblvR9FLhxMfn5TwJ2b/CfKQJKf5q3E?=
 =?us-ascii?Q?ofJ5XWd+W6Lke70i9QfWREvQkYViNRmqhCMYAMpu19+je7wI64JgC767IbY+?=
 =?us-ascii?Q?glNou6LoJTY8rNFvw89m91g1Ro5fmOO7dYT7kv4OARGYboWf05YDv0AmIveG?=
 =?us-ascii?Q?VGtxEEKz+8+Jpiphn4YkS6tU3WXxr87PT7AAzCtwnnkgaCwIC2um5gTHiFKZ?=
 =?us-ascii?Q?Ke2niPQQhIKmzdHU1VrJwFKZVuxNAP/JCQB0sHIMjKXoFZyo4C0a69SndSD6?=
 =?us-ascii?Q?yvcjB1wiqh5YrZR8W3xaoLKJ0Q1aMz467pU5BQoRL1NkPqS6538rxZlgyjl/?=
 =?us-ascii?Q?rFow/Ep1CrBtU/KXR53ureRVgkubq5GS+L3RP2L5eG0noZwzxufZjygKAayp?=
 =?us-ascii?Q?A0HtpGi+aZ21pa3cJvAGggO0Y2z2yHYAG3jn45BOrr0cNJND9aO3+P0Yf/T+?=
 =?us-ascii?Q?2LoeGinA42qccikW74AzScXb5YLA74zbtwmA2NyizjG0zfiS7qf7vVQqow9e?=
 =?us-ascii?Q?x2boKigGQFgAT7/mvHHispzZ/tvRbU0o+16HO3xqnCkMpWSL9UTVfMDxAe9f?=
 =?us-ascii?Q?BzfTioMDJN7RfI1NrUyYIqOU/a/JGyQkanFvtifB0K4UPkw5DG0CkzO9mQMj?=
 =?us-ascii?Q?ZnqDj8dKtOqd7icl90T5Lfk1jo4W3lKP5H2hJhEjyplcuvsuQjr99/J4MrTi?=
 =?us-ascii?Q?n9GZ2VOvZPkrWzVe/9F1yLToLA0vAy9HuFY6szg6B9uw0i0Zu0hT6qJC0zoi?=
 =?us-ascii?Q?ZxQ2sqRoyms7vBr9a2iP7y2oMnSMFUhuaBQ5GsReRyCeTLi99nGT38447DWA?=
 =?us-ascii?Q?TR8mgd3n9JV1FMXyVVKWYyQziyPsGa+bs8ganaEayXFy9p+1YOcpfk1yaWp/?=
 =?us-ascii?Q?3dPuEg/mKlt8NLbB8Upa2TGGVpMjrTEEib1EvwoEPNbVHesz8229kwWRgMT7?=
 =?us-ascii?Q?ibPcAmnjIvQiTlYDkHkfNSi57rAE9GYMczcZOEKCwv6D1ZyP4NyDaW5PqHZn?=
 =?us-ascii?Q?iaiVxuIB9oZpdrNp/RGKfXFlG/MdZZCyMczOT/3mV8J1rshYCHrFk8QGtU9M?=
 =?us-ascii?Q?POEX1iUcnkjGT2kEerseHmiW7Hk5Z4kQHfXfO/2OnW2gDS5AGcCPQCcGgHW7?=
 =?us-ascii?Q?rQwl+Hln7F9188vLLym+7Gh0fHKX8m/y9NG4WpP+drsOuGJ8wDd+iaxccKw6?=
 =?us-ascii?Q?DgpUmkg+2g2dkygaSD3FoSpKSiNC6o4Gh0iOMOK9EYsFO7hVTg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xIXEu2/iE51CsYDVEPUWzoXUh6wZlcKDn9UW/O5fkTqvwXJdguDCKVokARjF?=
 =?us-ascii?Q?VsxzWD3KhxNRzraZESPM3h2RoxQlzkpB3a0uR3rP1jjxl7OCt9zDLUSUsTVr?=
 =?us-ascii?Q?gTlFeaMYz5VpTa274rHhPloDcKQqThNgFDhmnhMY1vn+b+zxGYGWtKxYHpxG?=
 =?us-ascii?Q?jpGl6o0h8Xj72QvrMdTLqDwoLPgHgj9iwyl2bGlPqKe/D3EhG7omTt7fRNtI?=
 =?us-ascii?Q?RzX3LJ1z6g6twB8K48zoMLKr9ipFb04slwAgU01/1vovBbTvN7aksZVL1jkR?=
 =?us-ascii?Q?pc6kE4gsGXn+r3joU6iz7GKfLKyeuPWN6SObX4FVlw4QFx76T+bS1jX4+yph?=
 =?us-ascii?Q?12ZoZhO9OiwIoV+QbWM07JmZG3V3LSu5iJC2Rr0SfsjKeE5J3IgHb0UmP/Oz?=
 =?us-ascii?Q?WI8wycYK4kcWSm+EWzuryFLATaHPOkvYD3OnU+kCExXKHSdlArI1lq71R6Qx?=
 =?us-ascii?Q?tRNASA/7DuJpqBV23P9DaByjB0hKTjmp1DU0HHpXUWgNikN1ehlnnJEqPP/R?=
 =?us-ascii?Q?QMPUP5q5U57nkOkNPTfsLLWpaJvNeL1NGRg19ZT6EwY3xKU6VTc9WEv5nxdY?=
 =?us-ascii?Q?n1+T8zbWL02EcyO3Wa/oiOvDnlTzMARVC+l1B5sQzolCVjQdvT3pRY5hxe8s?=
 =?us-ascii?Q?KHR6CvbfMsHSn4JqB+3GOkRUTGuQY8nxP68MaHyvVB1NDCRmeaiYnTRau8O6?=
 =?us-ascii?Q?MfL888oT8SQ9fKuRIPmIatNmn7hyrwkV7Yl4+NNfCci757D6UoRo1Omp8RAa?=
 =?us-ascii?Q?cTNQBwiMLHBXM416fEY4pQ3sk5LCAgoT6KtSU19Cn6n69tALZHPEBaOT+bXE?=
 =?us-ascii?Q?Tiw9hJQpCHU2CiTey1R1VN9cgISiWlBK++AHKmKeMp4j45hPCkLqQniTiyRQ?=
 =?us-ascii?Q?td1MBEAYPdr03+rkiqkWd/MdMXearxdD4AY2Y1sIDRxOZ/feVCb0ppFZhCIN?=
 =?us-ascii?Q?N8gq0ZKuLo5kvBvrNzQp4UEUPIjEekPzfWG7z33nu2LPgNMXSyl4xypUupAu?=
 =?us-ascii?Q?bZ7GUD15kbWH94rP3vqQz/c78hwSxaSgJ3i4qlToWg5nSNvzPub51YK03Vsu?=
 =?us-ascii?Q?txe2uYEGLEklNUyVKttSKmzSqAF/WWuc54Wv0dNziUC6AM5lTxw26L2SYqxR?=
 =?us-ascii?Q?Vb/8gsudZrWLfCmZvCI9w02Slg5ZuUl5gX12kJIFtnNgtCafOoVPZWelcW1e?=
 =?us-ascii?Q?DCay5RvUT4XCCdfe1A0ExFiZQeGXIGOX1SUpleLsHsvs0+npq0MKHnR9mOR2?=
 =?us-ascii?Q?xHW74eDjiS5lZC4+xnSdg7nbT2EptxhRmyA8LHjHWGE3t1CQM7FYnzDfs5Gp?=
 =?us-ascii?Q?nj+qCkkzc458DMWn+MwYT3i2m+OCTXFtySlNLtlmPmVP3tTZOZMc67zqA4YF?=
 =?us-ascii?Q?+g9HkQEv3E0jnOuaELihkmUwhvzUCawOHJzHMkbVqAYDf0jkfxnFyIGGGnp6?=
 =?us-ascii?Q?LOpVk9W5/07uQ6BgFziCumIWCf/zv+M+wCeH0PZASRNKlc3FmVMOPNQ/64Vf?=
 =?us-ascii?Q?t+crWITAGvc0W5lEnHXdc4pNhfEZcwAVGqSctF6vrO8qPaDPfYnVH4fOu7JK?=
 =?us-ascii?Q?iVAmKGEN87VF7Xa7vE2GChZ4b3PBLXEyOXMw6TP9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8197a7b4-0230-4ff8-9333-08ddd902c42d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:13:26.3436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3mJLBJ94ddefQBmjiKbvY7QVlGcoxAjEbRIWBZLMSDXcDvVKrUUcq0hlpZifjCS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7739
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11 Aug 2025, at 10:39, David Hildenbrand wrote:

> migrate_folio_unmap() is the only user of MIGRATEPAGE_UNMAP. We want to
> remove MIGRATEPAGE_* completely.
>
> It's rather weird to have a generic MIGRATEPAGE_UNMAP, documented to be
> returned from address-space callbacks, when it's only used for an
> internal helper.
>
> Let's start by having only a single "success" return value for
> migrate_folio_unmap() -- 0 -- by moving the "folio was already freed"
> check into the single caller.
>
> There is a remaining comment for PG_isolated, which we renamed to
> PG_movable_ops_isolated recently and forgot to update.
>
> While we might still run into that case with zsmalloc, it's something we
> want to get rid of soon. So let's just focus that optimization on real
> folios only for now by excluding movable_ops pages. Note that concurrent
> freeing can happen at any time and this "already freed" check is not
> relevant for correctness.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/migrate.h |  1 -
>  mm/migrate.c            | 40 ++++++++++++++++++++--------------------
>  2 files changed, 20 insertions(+), 21 deletions(-)
>
LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

