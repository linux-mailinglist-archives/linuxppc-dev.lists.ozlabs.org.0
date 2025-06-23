Return-Path: <linuxppc-dev+bounces-9658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD2EAE489D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 17:30:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQsTY2R4Qz30Vr;
	Tue, 24 Jun 2025 01:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::629" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750692608;
	cv=pass; b=jgw+2Ta1xLGX4awvncmuDj+UDXFB6VOeBpseB5lsjiDLqesac/ago93BpTRMzvth41YYcvb4q4vabfZBWy7gjuZdWGo+9qC2ZxyO+Lgcn+4zElnED8woToZaSzTQHF1iAsF8ljeaThA089dtcxpJEeHPnNd2Hjrj+tEHCH0qm5BWHIm4qCyf4YmDsbYgg88H6A2BYpctreNfohD4atxsjchb7XVsfoafYPal7IOa05C9nScBeRJnhvaMOn7hNMqgceMPWExdKz3Ndt9MBIR0KcL2o3LKS7VhQNOM311N/f7b2qtcK5vhm1IbZQDnjiOtBOGpwQS7IuEZ+vqAiIz4og==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750692608; c=relaxed/relaxed;
	bh=BP4YhttcudsyLEHZIMJMYtq73RasqewWdRf4K0DHxgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gubh6kntqLN6xz4D4phsFWsDp9/zmY39o65EFH3gZBvuyVlbfjA0G37dbD2FPesf/vRjdDxgA1r5c3i2rrcoOSsukoKyBP5OIDf0K2rUCR7JQ2j0U6Rh2TmpOd/sj4+B+O/v8+woA46VXphLNdGHDM/l+geLypS/g3c5Env76+8zXTTI2Hdo1HzIu+wPqgjp/xQyVG6O/6Q/kZ/6yUqu2ys8drs9aQ1CJWhM6h1r9bgSoILaGvKk2Ul2dY7RRDOXyFZbvhL5XsAojQYUKOAkHvo8i1/y0lI4xXA+3YLpNtcDyLr82xjJcxEpSFtiAlXJH7VfnLb3Le/QBa068aO8BQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RlDWW3sF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::629; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RlDWW3sF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::629; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQsTX1jGvz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 01:30:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guhITH/EOl+xF/vDG1QkUAkZwpeH+2idLbVe4FR2YFnPaR1Yg/QFsCm91Fs66mSeqbTafHoTe6lQuCjFd52woj9hDbVg9wLl44KvbvGJE+KCkK7qYZWPpuIRknhNtm3iKeK2/Ofmo3txGV2ovnlhyCqkGQ3VQQ2K4d/TB7XPcPCBYfyzDjumSjhdpp8NSEls3JB1OxgSCwFI+MEruemZN39m14OrrP5mCGBI7Bx5IE4JTvvvGhjheTAiexS52fJSWIMZJb4FY93x1QQJc/RA6DInNwW1OjJB4VlAc0RkOAp8PEYnFaHPNgCTiYDG4QLNzi2hi/3hlzfeaqE4/R9g3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP4YhttcudsyLEHZIMJMYtq73RasqewWdRf4K0DHxgM=;
 b=nByqee/q8a8qMet+hoFsf3qAaKbhmbJe0TTQTXT1dzWi+95aFf20J/GYxc+zedYKNfg7ul18r5i3+YcDuKm7a9wWhMSb0E1Sbbjj/4U8FeQilT+LbrcjB0xW0VsCJn89PkZQAU3rFut93kTwKNKRqA3P62C7M+2nnMEOprncrZioqJfyNSU6NiYE2wjb4o/Arqpl2Y19lJqSYbHlhDuRNDC1lBNLAFV+dWpkcqCcwv4dHE4KPKeQRTv3viC9QwN/RP5zpxiHwZ4gnsJ5eNGslV9xDRipKa+kL+jx1DIo5uVItDKrlZEflHLYKPLRFCPqmlWOyeotGqx4orwYuh3HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP4YhttcudsyLEHZIMJMYtq73RasqewWdRf4K0DHxgM=;
 b=RlDWW3sF0qVek75MrMya7sOJBSpVO22NSDudFZyhPf+dW2oGPQ8X1QtzU1q+brRkG4sB30TLm+CFPxYKKDzbjT9VvYB3yIDRiVVA8vdGP9SN17VXE/+dLKb6JXHXfmlCvONLPFVjekWmUzdTpafRItxTOArzzlmU8eAu3ltTugZ2weoOVvGRZV3HS5GWUpwFrBuXK+wBe4D34EoAskKp9WrGzw/dR1JHO8WpkjW03xlYaE0AxucKPF45nvjlQlkvkEuzsg6iUPyHsQGXlxUic7/CfEMxJCMA+NZpVZHZFMM0eVMInGAFIac5TzrWzc7x6EuaUlbrGUMZoyewoWwAdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PPF64A94D5DF.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 23 Jun
 2025 15:29:44 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Mon, 23 Jun 2025
 15:29:44 +0000
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
Subject: Re: [PATCH RFC 05/29] mm/balloon_compaction: make PageOffline sticky
Date: Mon, 23 Jun 2025 11:29:40 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <AEF7E290-7B51-4325-8744-7CD3559FE8A9@nvidia.com>
In-Reply-To: <b0e47950-9fcb-4fb8-8bf4-c4a3c69387af@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-6-david@redhat.com>
 <D114CF56-016B-4140-97A0-42163727EB6C@nvidia.com>
 <b0e47950-9fcb-4fb8-8bf4-c4a3c69387af@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::14) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PPF64A94D5DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af71732-ea05-45d6-a6e0-08ddb26ac7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xFfsIvX9tfnEmmz4ccVP34+lkFqEt6E2pAigSYkqIHnFYKyFfTr+WGMdc8jx?=
 =?us-ascii?Q?JGJ33jCL5Ae2IGwMddO/Yl6DA/jZf9yDsxNx+Zcxl8rEl/o07LtaNsofwaaZ?=
 =?us-ascii?Q?QasiCNJ/4qqSGiefv1EG0l9Oc2HBOphlDyc/mlFdF4V76POdK2gvtUBvvyJb?=
 =?us-ascii?Q?bkZMnOBIKgysrz8chQ/EiEWHrV1SRV6XQuA2WryQSk+wG25ivWkyJVtMNqeY?=
 =?us-ascii?Q?+Y9RPvXg8zNl2W/R8kWk1f01506rog371UR87K5XGXgdmuvmEMwi/VLVgdxg?=
 =?us-ascii?Q?M+yjjWQd+VKG11jhLACS0yhCJNVoxGoWFUrlsbLW/qXy5gJVyJGuk3prMb1j?=
 =?us-ascii?Q?PgVbB/00cZloZwJ6+7IeViqy+zJ7pfCSB+Muf1cUWm8R9xMFJr3Shl/VWsc2?=
 =?us-ascii?Q?8sDTMhyB8K/ljNmTjzOdb5B/4hx8rHqwmhSIKR/BJn1DI+ehTmjm0ySk+nGm?=
 =?us-ascii?Q?4vGEnNuw/zl2tbbMy0cr2hm4P35fDDbUmCL7QGJABT1El+hhQuyEkaJsVkNP?=
 =?us-ascii?Q?antDJf9y1k9OxRnAXH4YJ4LCiI8EgalPGGQHM812TllnBgL3JwABMHARM0YZ?=
 =?us-ascii?Q?rpN9JNyZld1Hf/T7vW7ehAXErroMTQg6r7CcCfWY77hrKpb7XhJ4lMHkm04q?=
 =?us-ascii?Q?1A4pYCLW2Lw0hCVSj5zqRk03mfAaeFT8Ouyt32B4qOywg3Af88/uMKBaBlnZ?=
 =?us-ascii?Q?RV6HpFFnNTLVsri3OMYpmrq2uQhtGkgsBqAHPMZVgdwEGoVscfPBNwz0Qs6U?=
 =?us-ascii?Q?abeXrKvmm1Q00GVj05/h5LY1bXuw9iRQWERGI5DkIX0dvu4dJyasKojQuRub?=
 =?us-ascii?Q?Yu+u5Dlkj6VrPomej6UBck+ipPzo7yV6Vae5xXz9mWtLnqhoUnAhyUdMntlQ?=
 =?us-ascii?Q?OgcTdIt+07BoNbovbaxyjfc2MyOjbOaMl5YQQkawPmEVyDXDBzRuBb4Ijc0v?=
 =?us-ascii?Q?Gx20zPZWve9LQH4NRyVdFrOrvLS3OjV3AMhRahOSUkgJuzX2aXmCpvuENba6?=
 =?us-ascii?Q?A4XV7b7n4DJBqe8wKjg5HJ3xi/gjejpiKGJScZV14eq3VbhvPgKXFPQhsQae?=
 =?us-ascii?Q?okxYE6jryX4wEXB+H21SxYEcc/V8pr33XdVpDSTfM5W2qbnErp6kT05/wezv?=
 =?us-ascii?Q?1zG4dv41soDAqvvS3GGr4zO/+Dpk2xyh49xRzIJB/YlJbtKE84KQswKt7NNz?=
 =?us-ascii?Q?2VtQLR3Z0njl8e1gm8M6whxAy9PnOG0iDKSMlzyAljLCi7A3pi8DhpPJOCuk?=
 =?us-ascii?Q?0jO8uAX2R/4MsIiQ9V+kPaCZyK3E/tD3a9zXPrqNH+oh2tkwmiA8pQOq31/2?=
 =?us-ascii?Q?ZMiNw7Y1Z0abHYPVL/vRU9ucatSwfH0leWw/+Z0+vMZTR48w249zP1K2+duz?=
 =?us-ascii?Q?sI3EkqS1JjLvV/hGZBcAIi3hY0xXcI0cnTdu3dxAByUvUak+pHZnDTMHXgzo?=
 =?us-ascii?Q?5BWsUZ8Qkfs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ge5PjFHQcTR83hXoip0a09gDSXKwdKpDkqQytw09ldeFeOHNydRgGNR1EBKf?=
 =?us-ascii?Q?JifVPmrw4+Vj2hSAvmm4KWonM/f7UDwvopbAF/Nk0J1EcBouMkysoMChkpqi?=
 =?us-ascii?Q?5LHBD8SVFJyNjBOymUDUKjg8X2U6gjVpwzUEsoD83XMAM2JC9cc9/2pDm9Bb?=
 =?us-ascii?Q?Jyyd6HwwPbGGVuvBojQ9EYrmTGRPQRZoyGWoW1HDe4wZ/oz04aNcOj8Oav1F?=
 =?us-ascii?Q?TQua/usDHe+zBCbSXBiCFEzUemPjFgTUmcg1lxHDAjxiUAnfi37rY4YAlVum?=
 =?us-ascii?Q?v4prYo6O7jaX4AV3isIWCHOZwQnx3JFvbSbjzshRt907BbYOacvzTTUyfKWC?=
 =?us-ascii?Q?NWF+W6X25dsRVCd6Ei7uM8oQkibAKaiHZhPZCFmvftGjli9tJqFdfxGSnzCU?=
 =?us-ascii?Q?7QXlcPq2Yln1DTtT6076uei1EQRKiplUQtXY46j0omqvKLJhUtIP7Pdfk31K?=
 =?us-ascii?Q?r6o8rww6hFg5AycvZX8mpfFFp8eRaGZ+JRTyjeUOOZBeDNjDu6CkJdDi9TZb?=
 =?us-ascii?Q?76+mZWahkOn7YjkLmIP5WDMpur5l1a3+P9f9ybAS1/+pWM5orUoF696t9uXG?=
 =?us-ascii?Q?mg52aFRk1kW5xTBrNx/TodYuLXrabOhGjy2bAenQqjoTb12BjpP+ZEG3Og6E?=
 =?us-ascii?Q?fdASFVne2HHjnHahJrQycVN4+Gx//ZA9PTn/uKcQvmnh242TxGCMYmmU2smX?=
 =?us-ascii?Q?A8VIhOy9sBPxt3FGd09ZiJspIgG8BQpQyqZPribPjvheBcW2lo1zOuEMa4pz?=
 =?us-ascii?Q?QbRfL4E/DagwEb0bNtYXZCTSIhIiXovT23dxvX2YTQQt1h9jlfGfMEh0sdjk?=
 =?us-ascii?Q?UvEA7dWeaG9w+Oxsszq/xdsRxWqavwJApHHIZIdInucOfmls9VBlPMhbtgp5?=
 =?us-ascii?Q?iyOZ1Bu9SVF7zyKfWiQAB8ARDdEa+xwbQusneg3tTgHCCqeX56EjOFKQ8PY1?=
 =?us-ascii?Q?MeU2KCC7Xjpjlon5LznaPJQkbaV9vN4yd6wyCERgDIbpKdySEHkMJF1ol9Xi?=
 =?us-ascii?Q?fi/Ev2BnyqTj8+vcZOHzMAY8e+nkJrBgmXB4DjEkussQfrz6RCigUZoG6VHV?=
 =?us-ascii?Q?F8tboGHsfYKMDDdKDOhaVmo7LRRjmK0PsKMidhmvocQcimUugC0CUVHnbjsy?=
 =?us-ascii?Q?MOi4P4dUD0Udv6YGdstBLbcE6rMawfS6S9UZr1+e2WYO9vauBn99gtaiTrDC?=
 =?us-ascii?Q?5MGOy3cK36iDfG7hAVPZEZE+ka+QJ4NScHn+anO4FiV7JYjyjtRNCwWj/Ll6?=
 =?us-ascii?Q?dUMHYNOJ74I+ommKt3igp/Ul/wwbWxm5fvWeTfn80d0Wkv2tKaqZTTCDy/bp?=
 =?us-ascii?Q?+nzmEH3oLitBDtlDcvsvO9tMgnXsOGyEtdNJ6Up3UBDtp107Y5lw5ZkAPitL?=
 =?us-ascii?Q?yKKCFfpPsWWJ9T1r2tD+094g1NyRLQDICQaeBIYm4XAuHeVhzK8s5lTzKE0d?=
 =?us-ascii?Q?PDCyM5PSI2IpQ7X4ZG99xPRefkMZJodhgz4yyPh1KNJ865katht0yJbS60Up?=
 =?us-ascii?Q?gjcRJ8WYNemJx9joZJHmEMBkTfuT7/0sdUqAjWFq//sBtHDWc4XWb72aKNIB?=
 =?us-ascii?Q?d6JEHuYRfp36hRtDSRBnNEPGKVKpc/vkQFRDwZxt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af71732-ea05-45d6-a6e0-08ddb26ac7b2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:29:44.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YFT1Ccq3/Jvf3ZQuSESPIL9b+giMfTfFgTF9X2n/t46bX6CRsvDUK0ZxlhMYxeD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF64A94D5DF
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 23 Jun 2025, at 11:28, David Hildenbrand wrote:

> On 18.06.25 20:50, Zi Yan wrote:
>> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
>>
>>> Let the buddy handle clearing the type.
>>
>> The below might be more precise? Since page type is cleared
>> before the page reaches buddy code.
>>
>> Let the free page routine handle clearing the type.
>
> "Let the page freeing code handle clearing the page type."
>
> ?
>

Sounds good to me. :)

--
Best Regards,
Yan, Zi

