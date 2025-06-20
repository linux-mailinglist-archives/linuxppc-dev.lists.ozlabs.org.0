Return-Path: <linuxppc-dev+bounces-9596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76510AE23AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 22:38:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bP8Sx2BR3z30Qk;
	Sat, 21 Jun 2025 06:38:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750451921;
	cv=pass; b=XttOgMPqxJzRDYvRxbJtBbtBLngILlim5bipOVImo60BBHW5cAgqIGnrKHETfw4UY51u91cBl/BflVAnhIpyA2PV/SCwX07K7wd+zhJHGNH9ioDgntCaUP+whlOs9xrgL9pCrHN0qyxQBq/gqEdst2Fnc+0ZRH9rbWB+rF+32DNo9ajg9NhNBdbZcBw7fsHONJzrjuzEtV/5RDerEhDNWDqcUpFBhVo5QZR7z7FXW8PgfdiuE/zS1AkYZthv3SXOLsmRFMB+8gYUakFVRFKsN0hoAEjiRrhzr6NUX37q9Mu1r6owtQenATkUHpqXqSv1dsfrLE1cDJitfGPhvLGHgw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750451921; c=relaxed/relaxed;
	bh=y8pvIr0tPRk2ci2+dRcLAlA0lniZfTDHSodUmHpD23s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C6WFQlkXn2OCEnlrF9TX/6/1rVLKeJk+jQRg7tvmky9fHR8Ksc1Z1n/9nwthGwwtXYYLtJPtpdecjtflncN7dd0Lvh2CbcGhzdgr1yA2L0wBumYaKSHTOr/tLHwawa61vU/VYR2XYWn76mse+jLZfyD0mZ5Z29yvGmOejDvegAgoq2nptfWnOJM/dEIw4obIERtJfvGhUIpZxDBrJreM3s3H0VbCMAgEC6cDduzBWfJ4bSePtTiF/ND3Fl+3ifdiMYz2F2q051iR9zdvE1z1A8/mtS3/yw1ubRYfL45feEZFPj7hY08LeFAhIt/33sG0j4VpJBQYhmMZoaQiIIehNw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uaaz9CV/; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uaaz9CV/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bP8Sw4lwnz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jun 2025 06:38:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPXy7iEIwV7kiYr120rAMw/xbC7zACjz8l5JfzOkhjR6F16KevBUAlKphIfOpn3E0xxXL5Vj/LgM3j3EMNgPT5j9TzhLNPuNTk6JUA1Y/wlpf5JMlQTwpWJldxIYaYYLdu235tVjGBe2YNtan13FBD3rnd+nDcltMkC3Qoi9E73rKir4aIvYo2e/DZmgIuei+SeNcTIT98xJyOE/K+NbKpuuJx5j6CBm+Cujyezm+M/lblWbJfKVllHrXqr222Mbl0IoXtde0AU21sbC2sNRZDJveQw9RWK6PH/367RzBP9vqniQFeGAUuKHOU/WOQjAbmRn6vVyUKDRoQYJuk/SuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8pvIr0tPRk2ci2+dRcLAlA0lniZfTDHSodUmHpD23s=;
 b=s8TtVMkUnZ/v4aXO7GU28fBza3cJD4t7ZCt8SS81JlHYFozd0COGD9A65iU8fUisIS0IFvqWqXmzklywCgiQz/Q1Llc3QDntbwUvzHns6erFB5ZSKty6ImxCDI27Vyvf9QN/defg3QIzlmmMXxnowLpQsjfFQYhH3OrCOU9xOUf/KsiGbbD53vgjP79wWLQ0mVVHL8NJJYkRaS3Hpas3eL8jMfaYxWjdISJ2in0DRAs/m5w3jnB4yXkEy83FNiSYP/I6n5JcYI8YXIBC+tMXzCBLfOtMY5GXEQF/xDsXm1DZD3qaLcopv1xxbMFfOTawlT6SIn9KnmAi2wsbZOLHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8pvIr0tPRk2ci2+dRcLAlA0lniZfTDHSodUmHpD23s=;
 b=uaaz9CV/7tw512anicgZBmOV2WUfTqHI9+sBWZgbLPmHHK7K/bz+/FeHgKhSLu/FEfBFVa+6d1s2zMxP97Ga4Xjlw0Kc6637714EPqW96fsjtyyK2xNb2HpqYVdqntv4feW55u6f8Bn0Bwjz3hNqh+VLo91Vf2nNvC1Fa+OJaRng45Nw6aN/3NUQ0nZaqkypSQvZpeJMibxGv1RnQ1T3Zazhf2Z6WyrXqB+gvv3VL9jeieGfb8Y99h8jjzOG/1lXZn7UeycN2k5a23g38B1g3o+qMsAIUBvb5Ua/IT/6pYFinTQ/wsapNe1FliwWIIxbFyCaTR7aQF2mlcsbsrQFUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6075.namprd12.prod.outlook.com (2603:10b6:a03:45e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.23; Fri, 20 Jun 2025 20:38:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 20:38:19 +0000
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
Subject: Re: [PATCH RFC 17/29] mm/page_isolation: drop __folio_test_movable()
 check for large folios
Date: Fri, 20 Jun 2025 16:38:15 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <09715CFD-164F-453D-97FD-FF83FE71B2F4@nvidia.com>
In-Reply-To: <20250618174014.1168640-18-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-18-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0066.namprd16.prod.outlook.com
 (2603:10b6:208:234::35) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5dbd9dae-3553-4592-825a-08ddb03a6433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xvV97kjwsWRLukG1z9W/FrdgpnCJpuznlU0lEummxcHyJzH4CXB+NpU7mPeV?=
 =?us-ascii?Q?mykIkRzjh1EaiRxkgRfYgKA+yZRnYwYZbFwuNRCzsslDpko0OZvO8yQfpk8G?=
 =?us-ascii?Q?3Gwgp/K5r9KQo67/6VnEVbbsZpNVa6RozJsA5sO6adm+sfsu0TR/LPjcAvhK?=
 =?us-ascii?Q?4GHRSeHNEqa10zjQ3VD6BPda/v83RwGTtf8SQBOPBnFVAgrssmGznYGDsFRV?=
 =?us-ascii?Q?iscpmWdMtMUUdSqKz5RXtzd0jjJkwEUgQsDmvEw6MX6yPftXcI4FnzpPRJqC?=
 =?us-ascii?Q?5ly2YNwru+gZnEohmWapuXT4GJmw+PG41xgOI5F/heAMGe4UGP+keenlClNI?=
 =?us-ascii?Q?pORBlTimDPHIxH3IlOEwkQ4wPmfqrpcCYlWb10UOZ9Qocc67eo9o4GW9jSpE?=
 =?us-ascii?Q?nbTZ71NB2Heo/+ifGNF7Mm9+Vwb8UCmF4EPnlXl/NAMrT0mC7StVJoQVPNmU?=
 =?us-ascii?Q?h1n86XmTjGp+mEifgUds5oHia2J3gzvcgtkgeSQw5mUZF/9NBidpj50xJgiY?=
 =?us-ascii?Q?kGXaRuGuMdiD6soWYePcEUab+0iMq6ALta7tJ0w4d6fuRuY8FX2ydWGFlXoI?=
 =?us-ascii?Q?N/aeLBWLW03DHaO09CUCbJBRdxZ6G8ZSM43hATkldHRDeCMZwQmI6PaaB2h6?=
 =?us-ascii?Q?E4LWw4xC0xFQYllVE2X+QsSaUVpW5GlMC4eZNOTQtvXChnayh3ApAuvtRxwI?=
 =?us-ascii?Q?tP2Mx6J5f1oXruWcvGtlgACsfNj6YL1S6/wJnTJyW1GXayelIBy1ckinyVVT?=
 =?us-ascii?Q?ougr5K/n85Vjw36XMhZ43v2XLMWMrd+L1I9QZY1cCwi9wTVThIyGxnir7F4f?=
 =?us-ascii?Q?E4r/WLB0mWLjL0Ne94eisFMppQAp3j4/qjUdoqH+R8gMw84W9IQ8dERsYvvy?=
 =?us-ascii?Q?AduilKza2E6gxv1P01O3pI1/1I5Pd0juxoifIlVQUJ8zxz0B8xNZPy6CzBiL?=
 =?us-ascii?Q?MCrWXgstxDhbGidlRxaEU9wEpe5JdgCbPaGcarLgWeLFZPj+VzqjWrv/8nIM?=
 =?us-ascii?Q?81C308ZNVN2g7dp/ChUKr5/qHfT17djX7lxv4sX0FUkWPH/zX2cRYXW9Tzvt?=
 =?us-ascii?Q?29xwxBxNxgYIh2fLRZRjqK2EB/OEaMeGmU/n+4G+7uPNe/eFSbFCF9U5O832?=
 =?us-ascii?Q?wVyRqBG8oB2Po7NBjNOUc+8VeyicwfUkt2Dk5LZrjtcHdUmbglblWFw5uR3b?=
 =?us-ascii?Q?B17/moln4ju3KKY8WM2XFB43S3KT0gpZSficRndBYB8O6FJVCAOtwN5luLIJ?=
 =?us-ascii?Q?L3YiLw7hAm5N3oq4jCfM2xAegSy8HAIylGwmynnIPcU8qWJlpgJOsFxkvQjo?=
 =?us-ascii?Q?BZFp3jboZ4to+VvrXuwRPSemEEHo2NdV+v4zkUOSbpj8qr8lqTV6v4ikYzNx?=
 =?us-ascii?Q?rSCu0HHyZDNhjCPkv05e/1Xo+87XjicvK8g2aPfy3I71rFNigV7fP/Lj4p3j?=
 =?us-ascii?Q?aLk5rYmQjZM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5+TS4LeISbI0K3W1MVMRAgqv0J3ujdYQWWsXxK/72U6OAjc3ccGHvXRahII8?=
 =?us-ascii?Q?h68mJABKUz1uc6JbKJZW9sUqAgl3xqDQM8N4tXpZFXyqLOG4n0HgsQwQoHTa?=
 =?us-ascii?Q?tHROWRuhYEEMfyEA6m0C6MLfmoMYaf5MSVQryDsJpubV6+SWC0oMeElNi3kj?=
 =?us-ascii?Q?bXaUF/iQHizwerNAmMQ2t1HXo2EWRj7tcR6OkIfzNUinHZtjonjNv3UpVka0?=
 =?us-ascii?Q?mnj6LHglWGALQCTFLKi+p4aL9GHwWTg6uvSMcShzVBHWf8rJ2y3NaiLifr99?=
 =?us-ascii?Q?X3QDeprFJlX7VQfMlGeApW0qp6VzLOntgPs3YsoHZSfF3QFAaTN0EjknONXO?=
 =?us-ascii?Q?BsZgUOhpjzm4zXa5kPGJEHCzW/qZymJpstqWxczkdFIyJIMvtd0k8QBnlu7M?=
 =?us-ascii?Q?jvDO1Ak0V3BwaYHxXFHqaQyXXmpCT9GX5B6htsLcAh9PP73HvX2InttD39/w?=
 =?us-ascii?Q?xUTy03qzmGy3yK4qeo/QjzQR8uJWIdj9Pg+ANqGfAyTSR/Bvl3cjACzeVHq/?=
 =?us-ascii?Q?qvQzo/3rjjY6Q7JJ3UqAPec0o1QnEu8KovdWWB8rkI0kkPcZkwMt7fwHQQNT?=
 =?us-ascii?Q?KW9Fsl5De7EyTcFCDIyxv8PXyPuOkC7zMHhDckGrZXaJO4J+6yf+EuMDLIkE?=
 =?us-ascii?Q?nEYBZ/oiGTRQWGI1zPrkLaHi/bnhDtxcfcPrSe7hRS2artRkxz5/18jRIgDt?=
 =?us-ascii?Q?omjPrSajQ8WgwVVmSjKoCiE/5NxqbNq8pWDrw5SRzLmRYHr05Pce9FNliuJz?=
 =?us-ascii?Q?dWZb6k+K2uiIZ3EZthMjZUjGUlGf8tG2AJYQ36cFfPM7gWCm2ZtVp6guJqDg?=
 =?us-ascii?Q?bH3wmXYoh3X5mFKTCx6P9eOP9qBP8VQL1FE4dgPf8FQCqLgT1LRTOxsJQwx4?=
 =?us-ascii?Q?0REvPLumWLuGeXqtrcYqHKC8rq+JRa2qYz2qj8qHDgnvbtluNtvqXh0Udb2V?=
 =?us-ascii?Q?X40tZSsabc1E1/3nakVOVuqLSBOl68dzdwlnG9xUHD3VwtsxG2xWAbLwFuuT?=
 =?us-ascii?Q?FIWw1wVhsNhlGSfnvonhQToDDEkPXStMoQlvT88/G7Mu+xPPDUGUfM4Bozhp?=
 =?us-ascii?Q?PGeCl7bIaFsPhYn5ou1kddvaOaoZMME9g3o+rko1J0qX4bUJsgNvL41sMxDM?=
 =?us-ascii?Q?HACL4VDyQWufRDTQDQh3oc9bRW27m1ZNQDETZj0aoatQ40Te02rmxfM7fWfL?=
 =?us-ascii?Q?yQwlTYyMEkpw9ewvtAK9IfvSlyYvn5q/olaHgNSujn1IBMN53pPTCt2LU50q?=
 =?us-ascii?Q?F6JyMgzviDbd4bJHlGBOdH54w2BfxHef2mNWb18hMznJMI5Eds1FrpV4pcO3?=
 =?us-ascii?Q?EOhk6lo2UIKKueMZjzZD/XmbhUF4ypvM3mFnwHwkwAM/bOvZpBKPiw0saNbB?=
 =?us-ascii?Q?s97PM7hGawSS0ChIBVdWS+aPzSpUAAKSLYvGWKuqbkYJJ0aCgLbq3zIpMadO?=
 =?us-ascii?Q?UEuCnugEWFvVCWPd95JTRL6l4MzdhvrlB4ScSxkeLIpnrVq+mxi2TXb6v8N4?=
 =?us-ascii?Q?WiSbuHdBZ6Tjb1AxQl/IxnRRyUSjSpJG3pQmSfsaShzGXMSEBA2JbKIwY4YK?=
 =?us-ascii?Q?+I7DKePJuqd5NeJeKkUNtFFNsXea68EgahAcQ/aF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbd9dae-3553-4592-825a-08ddb03a6433
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:38:19.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdM+ExTK6tJ61vzIP9PdyNc1nFxceb2BkTd8hkqgBJh5l74Q7hC6gzYMh065EeCi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6075
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:40, David Hildenbrand wrote:

> Currently, we only support migration of individual non-folio pages, so
> we can not run into that.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/page_isolation.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

