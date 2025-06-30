Return-Path: <linuxppc-dev+bounces-9869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ACDAED4D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 08:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVxR526V5z2ydj;
	Mon, 30 Jun 2025 16:42:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751265729;
	cv=pass; b=Xwgwjk24ER3SpGctsaFHJC7sGvXUpMtNL29jNm5YlXNbkzPcmCCDGQhRBR1Af7UsQH+XjjiVLLyL46gKZuBvhMuKSs9cHj7qsPzwAQRxbeV0Y5ui5QlFrA8LrEZmXSRxjeSbIFWTTMUVOd/AtQVq29cWP0P2VME0aiyHSAwCTD6Oh3V9PDrgjBXH3qk9YYkCUcpc6ThrYIp+PZxgCd2J/nfVSfQ4u1922WcUw3SrjDUlXzYQtdb2U1jpaH5mbQ52PJtBMCURCinUS1DeybZqpR/yXsTgMoB6hyJZ8NVf7skGQcwxghSTKdYyYMUmbMKUF+QQGIYgMSOjVyZcBI4z0g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751265729; c=relaxed/relaxed;
	bh=n84GGnr1O4AP41/l/7AI2KHUOcaglNt1YqGoPwfk1kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Igcxyn3Q1t+Xt+rOevPO8ZuaDIvXW4sg7q2af1FXbL/ivp5PU1WkbIp5CFUEYjyXrsBbmLQTnViq6rRiNDukoKgVIGFa1ZJsjHAHx/+ttIsEaURsfs5pQm3waLpmp0Oiol7lygkRh1Lp2tFRLOenawLkFjQKwLA87xFhOzkTcrcrAZ9QAPLLGvZP0ltDjD6OXPfQ43GuHk3wVp6xNdhOcXDGYW3C5YdDjUoaqG+sgOQg9m4M9mEzdSmi3banhX3Ev2/vtuZORLl6zVLaUUkv481B7w5NPMT1moSfJXMsdfIoxSjisq5SnfYiB2/2QuMaF5Tffb6pEGt//ZM1kX2Cog==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m28f3JUF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::619; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m28f3JUF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::619; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVxR36zl1z2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 16:42:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUb8RPeIGJBlzMbJUMQr+0HJ3VbH3MiNpVgNc+eWLOVh1IyZanabAOw8MruQzTAZ+5OZ2eve6saEplGxb6NkODGKovXDRL8jqxS4bmTQyyB25D+A0OBeCmKLulf3xNz/bYMArMm3JBoplcA/ISgHVOK4L0KcpRdIaebAEKcU7vpY0D71R2n69w4czAuyL2cysbrs9E1UOuMAwQ1D4m4xD4BEPLPCZA2d8ZsHC/gWv8qXsUi4wb/tFfB7vK4WYmepM6QWrXZ+DSpj8vRq+xSwMM56/MRgp46HSB0RrRlN2GxME3gslbWZ2fUTvDhgJAqcGqsHR/6/0LDdSNf06mFXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n84GGnr1O4AP41/l/7AI2KHUOcaglNt1YqGoPwfk1kw=;
 b=M0CuAX6U4DfDCpqTYvgtj3lvTCJw2tKRDlEmGOleFKdK1qfuV1ztKhrwOlmM7hty01RRXJNJ+8PlIeh2gvEHPKMzPF3EVuj6MUsrlvU/5wCUExs7eZSEUcAiBQxghC+HIPgQzCo0Ayr/Slx+R3dlZPlERpT1Ne0mUxuDLRXdKyyWaO4WXEgthGeQadrmprFa81vZMDqACgHvKtOG4ohIEMCj+K2Ie9bYQMcB7laRLdC7freWX1ty6qY69njOd+2UmAEmY+LvDlCndXDEYTvF1bntGkI7Lad/vu3JZAVp8r14K/yrQ0QPEpkhyGP3W2PhBRjCXsnQSQkfMLIyqsXnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n84GGnr1O4AP41/l/7AI2KHUOcaglNt1YqGoPwfk1kw=;
 b=m28f3JUF65o/DWtaQ6kVARQmT+MUH1xDdruyDiGxLPXE0SjKhWT8HC9Ob5kNFON5HJ3fBUpelTaHljm6xdai4IrlIKbzJNZSogn/hRhfoQwc5Z5PJ8fTbXCdo5ElCx2LjQjFiVYGxm/NEYywEP/deYyR1tomIlcEvLAsZ6xilDv53Z7rFDbZwo7sz0T5BqUBtt88un7GtX27O75SyRqZJCIstfIImQjPzOMjyw9K9sL5FV+hYisG7VhdpkECh3BDkeozp/RVTI1GLUyP8drKb0vJ2hvxs6rry89Za5VF9bSy59qv+Sp0EK6KicF/jD1MNFLoKG8fc5CAZssPOmE0ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY1PR12MB9628.namprd12.prod.outlook.com (2603:10b6:930:105::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Mon, 30 Jun
 2025 06:41:46 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8880.024; Mon, 30 Jun 2025
 06:41:46 +0000
Date: Mon, 30 Jun 2025 16:41:41 +1000
From: Alistair Popple <apopple@nvidia.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH RFC 07/29] mm/migrate: rename isolate_movable_page() to
 isolate_movable_ops_page()
Message-ID: <cdvsv53quadure7mfgbrxuggzwj3w76lc24bfu62mf3txnblgt@k3psviu3q5fl>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-8-david@redhat.com>
 <9F76592E-BB0E-4136-BDBA-195CC6FF3B03@nvidia.com>
 <aFMH0TmoPylhkSjZ@casper.infradead.org>
 <4D6D7321-CAEC-4D82-9354-4B9786C4D05E@nvidia.com>
 <bef13481-5218-4732-831d-fe22d95184c1@redhat.com>
 <87h5zyrdl9.fsf@DESKTOP-5N7EMDA>
 <nr4e7unt2dtfav5y5ckmsrehu37xejqonarlulzcn6mnhnnvxl@o3ppo34wqyyj>
 <878qlaqc4k.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qlaqc4k.fsf@DESKTOP-5N7EMDA>
X-ClientProxiedBy: SY0PR01CA0008.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY1PR12MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: 31549e38-fdb4-4f89-9030-08ddb7a12f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dyA0gVnFehtUhCyOMf0qDGRcnJnWd6ni5hyLf9UFfAHIlZK8bbEshFH9SfI0?=
 =?us-ascii?Q?T89FVz5mnFxgsJu4dVPYzSuIRFOHdxwqVRMQVR7CQoaTO9Ak7pnmJtU4fsFi?=
 =?us-ascii?Q?h9rzhGYXG83c/JTZJA4BOVfBpSLLErXG5UOEx0gReXzeSjm84EEihKHgPaR6?=
 =?us-ascii?Q?EEGrmfcOPaCHMwdpno4g9piEO/Nf/SuAbywNbn2qdMOtHNJSya896SXyofDH?=
 =?us-ascii?Q?MqOGMkod+sGO0WOXf0d/1sOkie1y5iun2wOSbRiFI+oz38oNZKQeowoO7Clj?=
 =?us-ascii?Q?ez+I1upqcybPVp2yE4bXnepDBfrBlbxSoKZMhH4RFrRQsLFmqc5m+/a9yGmF?=
 =?us-ascii?Q?MCQXWcqxLGmp/Uems49g1HytILEjoLtMKKH+AqAusVJgE0skfhNC112Xs/aW?=
 =?us-ascii?Q?oXLDeHFIUEQTG3AHyHKNMYAEzZHTG0BBQk4iUyBdCmy+rILV3eY0Zhe6wlKZ?=
 =?us-ascii?Q?iTfns7E1S1WC5ETUF0F+jNyORxTrcj4y3aCZ3NFahp7LmHYfkmpZ6J1QzqN1?=
 =?us-ascii?Q?V2lFmK/WFEzJByxJxTVezYtO+Joi8PE+NtbrdEKO5W+TLiMXRM1bF0RRxaBz?=
 =?us-ascii?Q?INPRgSC/oPx/wjKVY8ZxZcsWqnJimm4Zr4gbAaltUL7djUfmU/yzGzBKteA2?=
 =?us-ascii?Q?E3kflCxLBYHkuH7z4czZ4YJGcbF0ODXj91UksS4SOH5QyOOjAvPhthERBqVs?=
 =?us-ascii?Q?rfApukAbNHGS0+ynBaFnJ/2ohzWVgpv06JwxVGxIAZ1lfjPhYzh3TYjZU//l?=
 =?us-ascii?Q?j2plAfCrxUJhx+x+xqJe6sh22+8IDXOC3XQZ1MrUUPCqXxeriy8FjNyqtb0Z?=
 =?us-ascii?Q?BOY/PS2CbMPnU5VhpPx0AdQH27f04bj+XYeMRuOlxWOPLGAJIXRFAAU6FQG+?=
 =?us-ascii?Q?Rao2iryHA6qPa568IvWDHhhKlbQGoHkxc0oJMaas0CZNfiuK2QMv5qraHcmu?=
 =?us-ascii?Q?MI1NTQtkI+nXm00Xf+l9On1F2fx3WHuNnvmiUyJU1ebh68OlJShl2owrxhpF?=
 =?us-ascii?Q?LGCKJDEJFhdaNG/cu86s81dFCSt5iiZuzshCeHrs4Psvk+Dw0ic+ry719FGB?=
 =?us-ascii?Q?BYceN5TO8z/YOLN35eH8+daNjm4qYRQVjW2zaFIvis4WHuA/WVkioviLjjDg?=
 =?us-ascii?Q?NxhQbKjbImINUGS+nlonXGDXDgevXSPCPBPVxZqZ06ErCK/5xjNTibtBrJKE?=
 =?us-ascii?Q?W8AIPjGYzFUFHg976VhBQrW8Ge7sCKC0mDJMZa0sWTsmAak8O4Hy1nHCkdnJ?=
 =?us-ascii?Q?mWZIYS3FjAhf9OFIKq4LiY6ldc0wXJoezDoj0e6FDR9VkcbZ63R6pl164V/T?=
 =?us-ascii?Q?GfJZ5KDcoBT6EUgOi8vLa5dtYg84BFxIROweUn0MbdjCKOZbH/0+3RQ5kr6b?=
 =?us-ascii?Q?fJm0vFXNcb8vjQN1TnEy1rpSBQLIGUBAN55FZ7Mh8DyFt7j27WRj+lknRAeA?=
 =?us-ascii?Q?f5TPk2WMpbk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BJtC1xv/WNFa+6d4XgOdawM3jJJ9Qal6GmpekSdgKVzFQPtdOAl1W4c8VgFW?=
 =?us-ascii?Q?VXit8+36Q0SPvbkZmDu4tSQYOr4YiYfSmhjhvZULWRclOi2pKNrOVThpJEc8?=
 =?us-ascii?Q?b2ZofZ+NxgrZgskoL3+bZa4AQ8lHa6cIxNpf3nETQsi7vYOjtjqzcLB8HIvR?=
 =?us-ascii?Q?dnLO1adWeMRAxdqP5gShvDhnmzbx3nIyYITsfI/9by/p8yVUE6+RJrMDCG24?=
 =?us-ascii?Q?tWMQBn3P6lgc6ij+/oUU/dnseAWXyBS52M0Ladm2+1uUQ+QnUFkI7vN+XDTR?=
 =?us-ascii?Q?iCD1A1v8/N23hfKtG6D+VNfJUvS0LRRHK9TTvzTtjwRuWeJuK00rOiKOBZil?=
 =?us-ascii?Q?I/g9E7Klm2/L8P1b+oo7Q3yZOugNQ11+LoV+H5wnorGRzOkjrAMUUfM3L6Si?=
 =?us-ascii?Q?4nWwIvWwBc7GVpyDLV6wC5/BeHXE8cWUnUGonsIXtLO7amhzpBc4s+HfKXfO?=
 =?us-ascii?Q?EjYgd9A8bc6oMPr88X9cPPcVPwJ66NfCJVaBSVDjzLdHFTcVtpvBlrozpk+0?=
 =?us-ascii?Q?8lvld3TlihOjZR4VWkMIPUlMIZx2aRfOQ9LeL0q+y1EDw2wGMfnnpSdpu/i7?=
 =?us-ascii?Q?jBIPjGGaO3M3jEzJO0UlSyYMQi7w+0UHFABJ0JFG3ldtiJSCMImuoJ4Uz59M?=
 =?us-ascii?Q?iE8dxWesnzFBnnziXSXnnDlD+wVkpwA1S3jBCC5AYlzpYW3mCYvi5OmCM/uR?=
 =?us-ascii?Q?D/AoUO590AML2e8HU8tXzR8tK6IW/zgBLnstwJuGhepJzFwbuRPGEior8iQX?=
 =?us-ascii?Q?jzgvmgTKYz5+VrlQY39n0i3SP2YFrhVABdMgPlUTc3plc8mXEQjInlex5w2d?=
 =?us-ascii?Q?zn/ChhCVWekYbeIkZPCeoyw2/U/zH7NN82Z27rZnQiTlmMrm/mPpZPjR76Kt?=
 =?us-ascii?Q?4uN2znKfRemIpQqjanJlq40QWTWkZnH+Vja++X6rVUq+4Aip64Gnh6bjL0m8?=
 =?us-ascii?Q?xYhpPbBEIGBzciik7HBYDUJFZ0jExJp9hYgxqAkW3hf+k3hPVMivVHtA09kw?=
 =?us-ascii?Q?uRPjKDtwSzLSkvMP5EG+6je14n4Uo2eAkJUacKT6kCH+7fzs/gUYDQMahfsd?=
 =?us-ascii?Q?dDhTTcUjbppR63n73ujm6aqT/JxyPgouVxkv3mIx7fc0MkcjRJGx8f6W+h6L?=
 =?us-ascii?Q?axANE+6okVKMPNGHZ5T2lTdJJeBcuhp+H4Xz07oTIEnwbKbYaSKjIc8fNWB6?=
 =?us-ascii?Q?ZpUQ05VGHBUokqgB3jt+FRHIHbKRnQ5bO/KMkLZc+BUUs4hbzFiEKnP6onk7?=
 =?us-ascii?Q?TmjQKcMnOofDlbXLPC4vAqzKPdpWoW7rsUR0rCbBIqfpv/lnzkSkfza4wvgw?=
 =?us-ascii?Q?zlVjTNT+k5C5Bb03VT+DlbFb1O4GpfKEabZOA7sgTQPwUf8daEo3d29deS2p?=
 =?us-ascii?Q?vHR461jKmpfOVEQNTrMwD9La9Qhe9qTR3FySI8Q+xffJj3DnhI5j/lRjOdYd?=
 =?us-ascii?Q?4Lghx0RZdU9bSlNa6m0DaCieJ3Rqhpa1ygnCH154r9ZYvhybeh1X2sbiexmL?=
 =?us-ascii?Q?voozNL/RWroetCl0HH0YMRxCdsH4jLIKOpukkKUtRMFcHryYxxL6j2vlCA8c?=
 =?us-ascii?Q?VKcf4UEcMAd+8bMxTHSOIKSE8GFoUMYx6cXt4Ufl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31549e38-fdb4-4f89-9030-08ddb7a12f0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 06:41:46.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbBJ0fikRvMAP4KIXiZ75EeetHN2npqyljX5rlIRKqWyS7IY8N2YBgCAr1Ivbq0s8/JgrPR2e5vGvpNewHkl0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9628
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 30, 2025 at 08:58:03AM +0800, Huang, Ying wrote:
> Alistair Popple <apopple@nvidia.com> writes:
> 
> > On Sun, Jun 29, 2025 at 07:28:50PM +0800, Huang, Ying wrote:
> >> David Hildenbrand <david@redhat.com> writes:
> >> 
> >> > On 18.06.25 20:48, Zi Yan wrote:
> >> >> On 18 Jun 2025, at 14:39, Matthew Wilcox wrote:
> >> >> 
> >> >>> On Wed, Jun 18, 2025 at 02:14:15PM -0400, Zi Yan wrote:
> >> >>>> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
> >> >>>>
> >> >>>>> ... and start moving back to per-page things that will absolutely not be
> >> >>>>> folio things in the future. Add documentation and a comment that the
> >> >>>>> remaining folio stuff (lock, refcount) will have to be reworked as well.
> >> >>>>>
> >> >>>>> While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
> >> >>>>> it gracefully (relevant with further changes), and convert a
> >> >>>>> WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().
> >> >>>>
> >> >>>> The reason is that there is no upstream code, which use movable_ops for
> >> >>>> folios? Is there any fundamental reason preventing movable_ops from
> >> >>>> being used on folios?
> >> >>>
> >> >>> folios either belong to a filesystem or they are anonymous memory, and
> >> >>> so either the filesystem knows how to migrate them (through its a_ops)
> >> >>> or the migration code knows how to handle anon folios directly.
> >> >
> >> > Right, migration of folios will be handled by migration core.
> >> >
> >> >> for device private pages, to support migrating >0 order anon or fs
> >> >> folios
> >> >> to device, how should we represent them for devices? if you think folio is
> >> >> only for anon and fs.
> >> >
> >> > I assume they are proper folios, so yes. Just like they are handled
> >> > today (-> folios)
> >
> > Yes, they should be proper folios.
> 
> So, folios include file cache, anonymous, and some device private.

Oh maybe I misunderstood what you were asking. We have anon and fs folios, and
we currently have device private versions of the former. However ideally I think
in a memdesc world we would have anon/fs folios, and the device private bit
would be in the memdesc or some such and so at the level of a folio we'd only
be dealing with "proper" anon or fs folios (of course in practice we may never
permit device private versions of the latter).

In my earlier answer I just wanted to highlight the fact that order >0 device
folios now look the same as normal higher order anon or fs folios. Ie. we don't
do any of the special pgmap refcounting, etc. that we used to do for higher
order device folios.

> >> > I was asking a related question at LSF/MM in Alistair's session: are
> >> > we sure these things will be folios even before they are assigned to a
> >> > filesystem? I recall the answer was "yes".
> >> >
> >> > So we don't (and will not) support movable_ops for folios.
> >> 
> >> Is it possible to use some device specific callbacks (DMA?) to copy
> >> from/to the device private folios (or pages) to/from the normal
> >> file/anon folios in the future?
> >
> > I guess we could put such callbacks on the folio->pgmap, but I'm not sure why
> > we would want to. Currently all migration to/from device private (or coherent)
> > folios is managed by the device, which is one of the features of ZONE_DEVICE.
> 
> Yes.  The is the current behavior per my understanding too.
> 
> > Did you have some particular reason/idea for why we might want to do this?
> 
> No.  Just want to check whether there are some requirements for that.  I
> think that it's just another way to organize code.
> 
> ---
> Best Regards,
> Huang, Ying

