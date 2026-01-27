Return-Path: <linuxppc-dev+bounces-16330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF3RHMEneWkIvwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 22:01:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B1E9A877
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 22:01:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0yWd1kCSz2xQ1;
	Wed, 28 Jan 2026 08:01:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769547709;
	cv=pass; b=QO7WHHpNhV+c1ZlOy9y36lBpE7cz9kFzfGRXiPlD0fTUdl88b4E7NbahGS7wTzVASJ6BpTNi+PeNRKnCMXl9BVdldIfkeeWkif8U8ub/Z4k7aPxnEyL7eRJgsCNAAwJse8HvaNqpd5buSaYasYCC8Zf10F8h31dWFv2KJxw2jTYABDXpPdFDbCqazuERjHL15wDuhNJBJ45IfHeHldXjzqpFwD/WxdLALhtfwpWbEgAb4q7ckU6EGwkDDIAEhq9n48/xrEBXFqBzbhFnbOuKDVoipzPnKyY5DhIXiPyAo/MsI6tTPOBdo3MLWJF29DIZV4xi15r8VXo6PfT5v1cyOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769547709; c=relaxed/relaxed;
	bh=gaqI3OwIeMouuLobv5DJAeXMC69tZTqxpB+l9u8X3P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QKoBu5AGk6B/ZztJjTFxDKdGUDlCOwBMvL0kHU84FpCyOE2m9djwimIzhWXGj5WCE7HMVCcxsMkgflGv9LB5aMgAlIoU/k5KDmc23L/J+T5nEfp+YsWn84i0Z+REDs9dU8aREVGuIzXLj4tlXyuflzb0cqeCot9Bw832gUlhnQPz1NfPStVoTaVqNZ1AabP1lR2Pa4LPum0ljgbOaJsGzsQ7WaMb98BRtpTFoobCtKJysaACaRAQtZuOhznbBG8pO92Fe/kJPEatW9Eh7RzKWwzzZBRvzmsvcXBKfVA0e8MhE6O8JcLjp9ZAKz+XtXG7RlWEToHfi0cjnU47JDf4EA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uVqayyQG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uVqayyQG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0yWc1Bsnz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 08:01:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln6xSEP6txzkCu/A5AYuCYlZvT+ErIx/AkF27ThdbLl+yeaiDulzYmCLrt6TJBPmJDpdvrhCdCDKIv5op68GnTYuWGTj/3djLDrVwkwSZuGVLod2sPWbTAohntg69G40lVoFm84P1m0ftIRz/N6xnX/pUJ5jCxTx84jz1g0rge4U91F46Xj9sI6PVoPU9XVJ6xOfdknlvP5mgT2V9MPP5lc1pJ6UCZoxvw/o7bagsG6DiKFMjUIjsvj5dTw40Vp/ZM82CUIClRA3ARaFcE+X8vKHNEZXbcGgsmX+Ed3j31SJ/bo07ip7D/OXa5/YeAzirPgGQv5AlX/inLY1yFVEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaqI3OwIeMouuLobv5DJAeXMC69tZTqxpB+l9u8X3P8=;
 b=t8tAbSqAP12TkJ0VmIJP/9KLkhE2aBCOT8cfzsQfSrUk7OE2AlHibNs65zmOi35pmyh4RA0feAZPUKT7xaDJFjXzz527NJDrPxxEnaK5+XkiNbHLYh+oyzv0EXP+lNz2zyDaL8TF5gK8jiJdjweiZmLvcTK04dDssQzgh8m2icDW2gwB2kQ8MEpaZ+iX3ctT6uoX3QqpuMMw4mmghTx4DStKjZw5Qcm0JaVueIF5VAxbhqfSZHXIJlcSS/zEwSBI4quOVoz3MWOcgv1lvnrmBo1zTGCeHQwBal+h+otshC6FERgO22zLEFPmeAGVhUoUxlkUge8o8LrePqzDpQfy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaqI3OwIeMouuLobv5DJAeXMC69tZTqxpB+l9u8X3P8=;
 b=uVqayyQGJ70Bznw2I5YiA8ViVHXsm/EAgoopPZW287UGLEzFt9ywGCSBY2kfONjzf9PXB3jzXWt+u3sR54WxhaO+OjNkVgyiOu2aZSBazF4NZdtmG+Rc6DbXmhLSCpay9EF/e8OHB/iVVZamrQvSBGkYrgro8RxhBTtIr5tG7BUyLqxdZ/HWpc/1O518Syuj/EP6xdBS0Bfj56OyAWLnwf0clcgqyG3IeiYPhu0nC+1p4AHUcbqvg1vhna0hlsqZ1Aty2CovMEnXT+UwoNe5gePsk48yTiFNzWLPbFrMtJAzx2r1ZOKILxFtfFj+l2x+WJSDDL8ojsbNpCXLck1eDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 21:01:21 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 21:01:21 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com, jhubbard@nvidia.com
Subject: Re: [PATCH v3 05/13] mm/page_vma_mapped: Add flag to
 page_vma_mapped_walk::flags to track device private pages
Date: Tue, 27 Jan 2026 16:01:15 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <7AEEAEF2-5876-4EF4-B79C-D95E4E637A89@nvidia.com>
In-Reply-To: <20260123062309.23090-6-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <20260123062309.23090-6-jniethe@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ae36ba-40a8-4f37-526a-08de5de7392c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EKBBYPJR1IsNI9gMqWPlRvgZQPLLo0MFb4ez7CtfX0vKus64UhWgVNRUrU40?=
 =?us-ascii?Q?nbqXJTMk0Cq6u5DdJWqcBX9Mmm/RXdDbcYEHLa2cwMFjjNeNKsTw1KkOxXhm?=
 =?us-ascii?Q?F4kWJvWrwTaM/B++eK+aj4rCPYK8n2MG9NlCMetnByvNSLE0SEOKG8IHVVId?=
 =?us-ascii?Q?szJ1an7RmaT74X90IMoYz0gKIkjT7G1MqtI3t5VdaEpXHm4qCCpsF/M39cvL?=
 =?us-ascii?Q?sBRtGJpXwdssBa/p1Fxuc1VsNOEfC35OAeVo7EFJYuWNYFxYd5uOv3Dsl4eR?=
 =?us-ascii?Q?I7IYD73jTLACJEfl6TmH1FWAxs8F7Jl5HnRc8IIEp78WDh+efLPkuGIO5FLf?=
 =?us-ascii?Q?qFy1U9zt3XmiuylsdhE29UKQdSu/xZZZH16LvlhwudafnoTjKXycTUtqWcLf?=
 =?us-ascii?Q?53u/SyLFR5CvoHnbIB+U6Y4vWVqOK4Dd1ftHDQC8g9WcOE+wdFa+yA6jLNr6?=
 =?us-ascii?Q?6nG6uy2+0CD6C8a1K3y/suZjqPKVm+bc19cZkrhEH2KpL8rtQnvRtzVBoqoS?=
 =?us-ascii?Q?DYG7u41+CflbADSArTPJywL92Z8HjErNB05ZWhNnpkgI17fpMP69bW9IBzDb?=
 =?us-ascii?Q?j8dqTqlCcOVD5beWH5t22k0eYM57bPY/brnB3mpaR0IUxuz/rOB5ymlBhvB1?=
 =?us-ascii?Q?6hBTC5TwIPuoxsfFnl4klLL187aHYJbiiummp/kDWUL6piwb3CjQjoUoCSqB?=
 =?us-ascii?Q?kXJra3rAEVKbHeMg4zDZ26Vj/4MjJ82KcEs911mzipfPMMPYpNPjiijGvJas?=
 =?us-ascii?Q?oqUKetCzXOZHVunRsy2KNWRxJn70pOTUVSGgWJUzYM/0k3Ya4cZuxv2+3CF9?=
 =?us-ascii?Q?hipEb4rr3TDwdDCT+x7XqSNGV6YKtPCDCSyM4NWsvfKQqE78cTzRnhiMpvD6?=
 =?us-ascii?Q?vmeuiOVAhrrjmMVXrqKe/MQAR+l3XNALcS5lIhjAqT6zqGIzFggtd9K2ZAMi?=
 =?us-ascii?Q?lNaHYHqUCJfJYAcmbzNtZhJxhpnv1F/eW7qMY5qUbinhCjzdwMk6W0qBMMwf?=
 =?us-ascii?Q?SffOJVGI0SfvnYsR3Y5RVuupStszEimU9mhWibTrdppIR8RY4NYRksDHW9am?=
 =?us-ascii?Q?bgBGTcwhxkSQrG8VtYz22u8g0A61NIk8g71q9SyHvUjlFd+mjR0D6eSeAwUj?=
 =?us-ascii?Q?eBnQdBbj69Vp7cgpG6AeNHUX2pjOFBTuenisQDXINXjdJt2npCwtHM8beh0N?=
 =?us-ascii?Q?xEnZZzKbzCVTG4+5wuCddKDRcCARC9MvWLGf6ryh/vkYdkxq+WByDLTcQE00?=
 =?us-ascii?Q?p6X7jw14ilg+DswqI0GgI+CE5zY1eern9fqOx2stXionA6I6pWZCdIknzXMt?=
 =?us-ascii?Q?k7BqKv5nE0JZIxIQcg+ycWNtBuogwxgDW652PHVo8r2w7zmGuYNY6MvpS+Qr?=
 =?us-ascii?Q?SRmVOnOj8aiW1INSFT+Ox4/g4LOl81IpPQ7meLeENPJaF7lnzDm+zWAl7vz4?=
 =?us-ascii?Q?teaeLD8Kx11LOsweg0deQhCt2PrMf1Y+3M45dzuppZvrLMhRpK46jmAUNH9b?=
 =?us-ascii?Q?y8qu9hp3RoqoRSxKhRC1NE6pKv7/KpQqruOxCzDYxPut7ZqmVxhp7fTWeWSu?=
 =?us-ascii?Q?+Aq7EZyNSsBSlUfyTiI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QIpyNnjINwQsIv455BZiYa8utrEZ6+diqEIIGtYiUwB+qACtnQRGz5qm6R6m?=
 =?us-ascii?Q?jKXpgDoWbDYzexEnyFdC6BliwR9WnGjyiEnKljAaBuQkSfTqwl976VKhQj/L?=
 =?us-ascii?Q?64zMH2TIeQhln3UNHJn/bKdWaPwuKwsAwHvJlySQ01HXKP5xloIKKv70+PGf?=
 =?us-ascii?Q?kxBoq51twdZx8br0/zZsBcUg5xiAcAMbkH/EGvfi3E4+Jm0vBZJW/uBGV4/n?=
 =?us-ascii?Q?LUyxkWcjXet6dtDmJRaWzDd9ZIYotDX1Mro9XloLGKUsp5oN062y+vz83A9+?=
 =?us-ascii?Q?PYbPV963wvcdGVWishI4ImmMvIOsc/KScAaMPAcxNJ+7cTwQDpioZA17oaRl?=
 =?us-ascii?Q?isl3fgkj3YbkWLmI2/ic1sA3dnOAiQs6h8q49Wqk/wASgLZ+dhtQcTBssG9c?=
 =?us-ascii?Q?tDRWmoXod0dnV468NlsoXjbprz+/6sTOeWRNCZjO9Yg990WMXGCP2dEQRaHy?=
 =?us-ascii?Q?quWFRcFDBLYpCLFZ1Jnr8iKzrWg8vt1f88zVOhJ1m9rypI7jlX9w3M7vpkff?=
 =?us-ascii?Q?o+hR7T/xpUobAf84eiVqrOjPd0sY6j/6ZwIt38i89k1H8o2S8if8tZszUlUM?=
 =?us-ascii?Q?0j0ENf1TOA2b9vjySw3m4etdXPDuXRRTBA58eSvVNzO6hZTDoy9c+xdmoS5q?=
 =?us-ascii?Q?zTLLTclXb2yRW6GYuoDOWSZBEIUhVWYz5OcXfFXXLqFkjNzHivPhgTOmYd2E?=
 =?us-ascii?Q?4ZIoYMkQkTvSU6PJ/1+M6YtMi9/1itqOMuqd+8g4/DCj0nip9BlTw/dh0GEI?=
 =?us-ascii?Q?VSzu3pGwk1zFwogq2lpswTuB4LNMOdELfFOSEFKNu/isfIyzPtQ2ZE/ORSMk?=
 =?us-ascii?Q?sL162R8dry17VeVPHGnMmksSDApClpJWvolytgMCLc+bsmda7eX8zULR3GK/?=
 =?us-ascii?Q?OGROsvj0QMpkPX77ATLfNjp0NQSzEP1LyDYPAs282YkbX3kzxk5Gaf/tM25X?=
 =?us-ascii?Q?/tPDa/MXnLJ5Vqa6wYRrn3SuSwpUJlU82jq0/KbeVE41QwTY75zCVp8UqWro?=
 =?us-ascii?Q?vtecG0YIjq/f515vBJt1td8+MRXjE3DZe3VTeGe2HOdvbTbzgYBgOHK6Uw87?=
 =?us-ascii?Q?TldMrcSRRTMoDT4pb19KJM4HahO2hklbZR6hDJ53nN/PcpB4V1GZVWqd7xyL?=
 =?us-ascii?Q?nrCji+QhxeUH0fkvXrjvY0Bw+ugRiBkln7X3kUkVAnSWa7qTEmyHKK3XbKOe?=
 =?us-ascii?Q?QH4UO+LhKLP+9VeecU5u8Mv+KxPopdl7Ojv5ANCBMOB8t5TDZcUHQymom2UO?=
 =?us-ascii?Q?Y9C0pgrenpSRobGgXxUS5NKb3lrm+n2pKi4pVyymy7oNw01nKtoGguMK+dsI?=
 =?us-ascii?Q?6G4BFPCbgiMFyqmMirXAopFagQMTeUQb2qSlqnb5seeTrtxytMN4BtKqfZFo?=
 =?us-ascii?Q?0Ds8tSWPKvQOZOxFqSizmZa3jcgtPDiz36u1Yyoueitb1MK4zIr6+rwRvdr/?=
 =?us-ascii?Q?deTqEECoeZuPT/9Mbf3ZzRzpoM7sJo+qIzMatL064bQlQwcQlUItm4sh9eTZ?=
 =?us-ascii?Q?930HTVmprQjT0NYh3HzMkjDi5gk4Yl9nX4eAEr2o+yCDrKsikM0t5vO7aVaN?=
 =?us-ascii?Q?iPzB/KEjdOf5Ok2DNJ8SberZwDLf2P4Il0bfA+gVQhe/YvWsGhNcU7tcvoNT?=
 =?us-ascii?Q?dHtmMwFGBSHhLDqqsRx0R4W+/WzQ/YDkYStsthNGHdyE8V3pRXKIM6v1d76t?=
 =?us-ascii?Q?UESARebIVjnpOmXPpKi+TTSeqUJJd55iGlYzNbIJovZn0Ebw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ae36ba-40a8-4f37-526a-08de5de7392c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 21:01:21.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8+FRpKrWXCiVupAJMMDpKOlqnPP7Bw/KUPJRl5NcZBbkQROp38gvOrGr+VsN0Pm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16330-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: B8B1E9A877
X-Rspamd-Action: no action

On 23 Jan 2026, at 1:23, Jordan Niethe wrote:

> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have
> normal PFN and must be handled separately.
>
> Prepare for this by adding a PVMW_DEVICE_PRIVATE flag to
> page_vma_mapped_walk::flags. This indicates that
> page_vma_mapped_walk::pfn contains a device private offset rather than a
> normal pfn.
>
> Once the device private pages are removed from the physical address
> space this flag will be used to ensure a device private offset is
> returned.
>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
> v1:
>   - Update for HMM huge page support
> v2:
>   - Move adding device_private param to check_pmd() until final patch
> v3:
>   - Track device private offset in pvmw::flags instead of pvmw::pfn
> ---
>  include/linux/rmap.h | 24 ++++++++++++++++++++++--
>  mm/page_vma_mapped.c |  4 ++--
>  mm/rmap.c            |  4 ++--
>  mm/vmscan.c          |  2 +-
>  4 files changed, 27 insertions(+), 7 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

