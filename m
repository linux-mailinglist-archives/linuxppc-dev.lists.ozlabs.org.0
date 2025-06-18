Return-Path: <linuxppc-dev+bounces-9500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE9ADF6A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 21:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMtcL3jztz3c8C;
	Thu, 19 Jun 2025 05:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750273842;
	cv=pass; b=WVr59t8hcrAada4BlZwi/RVQK78OSdWk7G+AnHiyo5pj5FNNg1E3dFKuZZP0/nZpPW9NlQwwLe6+clf5Z5/uxyPef796lmSIV1GnB7blawEUuWK0tRLBvlWsudwzAGUXqq+4TbKrgaJ3AksHe+al0qJiTSN9c4rVsu38uCfwBAfx9b7S0LjzLM7IqRtByxl4ascU6ZEHZGxppCkRJYhJ+ZlvI1nGi10stRa4KcaeLuufy51rilOsdiPGdJ0qcfsB6uDEct+MqVqZvAnKcWo7sVgHcFtBk0fFq55AlugmPgDD4B50PxOruYL+ZuCMS/NjayW3OnCT2IsdKTTHqPu2Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750273842; c=relaxed/relaxed;
	bh=Kr1ucAdzhuPBSYm277iLPVUHjG6+LfJxNq3NVaNMrm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T0ZK7vQ89Y0CekAPScxfNuMQInslNaW0W9h9qLXeHTYnFnD5jq6VB52w7hAByhSmDXB4cvLEd/7xuF8W2raZjJcz0uFudEpqUCA4GoDAMOe4lWShRVc+T25VNTtE4f6FYlV3jZHC0CeP2FXL2XUpyCO+UDEw2fLC1iI+dCgTS8fUw/rjXkNUwqgxi3T7Kxc6vr4TpA6B89QxE3/VIDEIVAcqS96ed6FZ+RT8nnHs86kN7+4HopzuH6C2rB894/lcCd0FyjYz7+XSmivtQLp6e1XCly/wpuGGqRg0HBFMEBtU4zk1SYebtUt6UiUH0/uB1nVgIw/YO8dUu03otW5z7g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qAS2CFm/; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::617; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qAS2CFm/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::617; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20617.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMtcH34Qwz3c7j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 05:10:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uq1vXZ6mSmKw7MbFf8iK0W8QjXZf1pr8nZjTYL60ic5zJ1b14S3sfJ6Sd/b9PXByRm/WvhVMhnbEUJAboe4+HSXBlj53kACgq5978SromsgzTdaXUpN/LEvcmX/tM/mhn0Vc02w83eu6n70TbNSw6fM/OoHtWG412MsWjPizRFuDBzmbttvJl0sLVpzV0mYItPeC0dSDuacFMMi/jSRdnSfmetRq7jo59unZKkA+vflyO7NpoxR4mK8SNXs76qrqG6odFAMa43sUHzSy2YItp1ArJ1kVCW//fsQV3iNJ3W5EHVAHOQyGU7PVkzV2QzUpkK+CYjMmjUNgOgkzveeZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr1ucAdzhuPBSYm277iLPVUHjG6+LfJxNq3NVaNMrm0=;
 b=J80s6gIylL2jIRjq74vlY15BpGChsXqEv/ftTJK2xXU8jbZfpMsrXhwCTDQ6TWuCbQDxAdJBw+y2fAzk0jhEuHUW6zRB0+3+U2URaXc6Ve8zKqm6K0VFvVIMmrGN0EHkqkSKrLmwd4V4IqCEGFJNCYFHAYzU+3h9pcncDRg4+i8v2e7axcn5N8W0px/JlcWosiEIbq3cTcTw4flPtasO33oL3Y14WUI5cY+Jwl0InVjn1daQ/Z7oJybTdEsNoq7Ub3aRBeXnBsM5ZoQBgCAh4XL/yWJ4fjOWwUxItR7admudR4H1d+MxFqHWGNdaQQqDFU6lsi6zAOYDbO+QTZ4lCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr1ucAdzhuPBSYm277iLPVUHjG6+LfJxNq3NVaNMrm0=;
 b=qAS2CFm/x7GO9LGWJIw4NImSNDOmnYLrQ/FJxKykFneD/QD3N4GMUvUzcND6teuiUh0m3IgKglpPh3zYNfW5r30NI+J8Ucq+m043C1InDocwpXx6pqUjqAI49/Ma0os6KfbNFOqMVYbNA56bYrpGoqyvLobPx22gnLoz69nqBHxHPtbdb7Xtyfu4HYWdRkTdkO9vdmFMMo6pAinHRd5WK6geTXDYhlucdPk/k1Ssejt001ZH8JBNjY385wP/gzKfE2scor2xRVlnLYqq3vAulo9xvZGnodgjfqS9/matZUjTmWUnYiP/pSESmlvMuNXnzKgKlzIurJ5jRhpjI5F75w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB6637.namprd12.prod.outlook.com (2603:10b6:8:bb::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Wed, 18 Jun 2025 19:10:16 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 19:10:16 +0000
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
Subject: Re: [PATCH RFC 08/29] mm/migrate: rename putback_movable_folio() to
 putback_movable_ops_page()
Date: Wed, 18 Jun 2025 15:10:10 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <AD158968-D369-4884-806A-18AEE2293C8B@nvidia.com>
In-Reply-To: <20250618174014.1168640-9-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-9-david@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN8PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:408:d4::40) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f24617-9e9e-4c35-ad92-08ddae9bc262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PMHSta2xY4BOazYoqXot9skOxRN2l2iIZ1HYPz6RzKJX8cnO/qjgdZG3DDH7?=
 =?us-ascii?Q?Qkx7S+BlJJXehmo5kTmzYbFnN+6TwhP2jam6qA7yjcAAJ/FAnvUrR75wv2hb?=
 =?us-ascii?Q?gfUNaIE5aS8/t2JfRZGVMXtHk8UO1W0TruV2eD/UijeRKplso8/XCj1kWLrD?=
 =?us-ascii?Q?6vnr2UN5Kuji70PAu+HCS1kjYy1ygVZgIjwxhj9Ft7YvbrzXx/dQSAcbh82Y?=
 =?us-ascii?Q?gbL2WvYxzj+uPFSzpxwy8jkIW79pvvutzk+LemaokCEaMvgQIszRMfcCDxgC?=
 =?us-ascii?Q?SveI6lCTl+BJvaYb1NHbqeruORuo/dpg39eVWwuhEyVCRXnvteZpOvDUa4Yn?=
 =?us-ascii?Q?ELmqg/ul9Vu8kdWxBJJOllI31UGYFK3S58xYGsEsoFiFi/JoalaMBkdsFk8Z?=
 =?us-ascii?Q?k5b3ii369rKoZGY7cp2Qvolf7IROHvb+yURYr97RLOuJJ4SVMdIcyHAFx+es?=
 =?us-ascii?Q?O6X/3+TEVMeemD66LgltBpdyFSqV9fkG2u3363UFjsZNjAJaFf3N3x/9U6T6?=
 =?us-ascii?Q?6/npCp7ejmeYTCyS7RQXmZu8b+5YsZij30iXJkDusZYNntBW+hSNeW6MJFVV?=
 =?us-ascii?Q?/KRYFHHZvgOxg3jxRR0cPJHNeHjffZ9i+mLBuII2PbnOXK56cje4UBF8dEIP?=
 =?us-ascii?Q?xqw5Bn3P2EIroXTIMV6bM3mL+rNF5ngn6tvcLOHOF6SDlhozgA6YmB86up6+?=
 =?us-ascii?Q?jBox6Sc4OnMX6BHDvdNdYMd6FEJsdHA+svR5/U3uQC5OMdZwx0KuQlZX/ozN?=
 =?us-ascii?Q?1ARSupTfxcUsNxy1nJI5P5UdoG/lUaZrFHBI74rE2JVqx4Jdzun7Bda/hPnE?=
 =?us-ascii?Q?wq2aeBewZITKuruRY54nKLybvTSjjco1agKADst4/dwyXYi7RkPJG4Y2TE2y?=
 =?us-ascii?Q?luKl/XUrFyTT9yYAgZK1CM6o3TkxXyEDNfbDPzKzHR5mdasx5sB+e6D+ke0G?=
 =?us-ascii?Q?xdFZQhuPKIlRsy7YBkyIyMmfjM2mLuthihHoG0f+7KApmG4CKTCX+kWwrmql?=
 =?us-ascii?Q?50hmMaQmOpjDsg/OyvfbgOlo8MlsknDHFqd9+eCVwDnIy/zrV1eJvX5H0DID?=
 =?us-ascii?Q?3YOa6z5sHx6AFnTRJyqRjnqeIpkhntS3yVDfjti5rCRo4SgKxlygryRjCQRa?=
 =?us-ascii?Q?Rwi9+mAjx1YK6EhYsDWB8+pLcrp/DiVbdcL1H2JxuOgh833GcuLo2wYfP5qi?=
 =?us-ascii?Q?IEm2tT5MJQONNLoxsQyVUtOfVGGlzllS3+sqSbMpy8NPbi9PTuBePmzAb4sK?=
 =?us-ascii?Q?g51b2Dqso2Q90BT9s6LatreFozo2fepebg99+++VA3G9SzDbmRyyNeBh1RPY?=
 =?us-ascii?Q?My/FVB/jdxbRJDbskeWZb+AO3FAKdfm0knnGnm9z6PU/ltkES74PAylJlJbl?=
 =?us-ascii?Q?G3lV/XvRwo4YcDYbBKFNZuPE6c6Dc/9VfDDVWF7lEtMpxcQCxfEU2x+9m0Qd?=
 =?us-ascii?Q?MUmi7xieyPM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OrU7s5zXdBiZaGcvSoFtCLaWCMzlKQQaIwp7w6ySeSFklVqE5mHeeMhv3je9?=
 =?us-ascii?Q?EWQwziMFyDheU5z+rfFALpgHeOraPt5KmcgW2uW4JgLTJAaUmSglQtF33RMI?=
 =?us-ascii?Q?Mxtji2SpR1srFKyMrUMMlVYemL1upZ1lXm4AosXshA1dCGyHUKFkKPKmFCaV?=
 =?us-ascii?Q?d7zpk0eZT25eqocbe8bwWEUIgzdok6keirsZzruV8HKay99xtAQWaXY+guej?=
 =?us-ascii?Q?TsdbFTGt7hPPuu9YmqozIKGQMGSlger2kSGwehUZNT7+HDeIjOw3RH4WMQ+C?=
 =?us-ascii?Q?/EKk8Syl3GCaZOiNNrBeCrgFl27oL83pIpkXjn4AH1Vn1Nc8QQMJPO2YqLLk?=
 =?us-ascii?Q?CYfeIZts6fFcSGsOGezoqTZZMC7dsFVLPxs54CLjaP8AgoX9Jv07k8mpMKcW?=
 =?us-ascii?Q?ZzR/kgUN9U07LfsbAfOGeaisStXCKhG/th2ygXVTC5sgE4L1yKzQY4JSBCZH?=
 =?us-ascii?Q?P38raB6kMTCyp+VyQjbF1NnVM6OZDzXc1XauVJn4dNyCQWn7DESM327wC2jq?=
 =?us-ascii?Q?wRV7yPYkiKawlkQWgl/PE+azs0O5iT7Ch0suJZ/Z5z37v8ofRNzCcKnXiacC?=
 =?us-ascii?Q?y7Qxk7VBEUiBnxsWoQWGJa8zmSF0FSeqySjfA5cX6gbpQTa0FGyz3osP20TC?=
 =?us-ascii?Q?6/I0boob9+nzap83QZLvX+FDnrybDnPIZ94VQFvTbv0rOCpxqA/HNAWqQaCp?=
 =?us-ascii?Q?3via+nPQRkkyxkqpVc/VC407JmvwLM1g0BsgLrWJCprayxFI2tdPRWrxtJZT?=
 =?us-ascii?Q?2zJnN3A+GWXkfR/Xs+EXQsxi/MUy4yWNl9rj5FTvGcK0ykRUU9+Let/iO7q+?=
 =?us-ascii?Q?me4aiJA8gJw0Ax8b4YvfTp2lkqBBTS4aI2+BME1Rl7evTxzOYS7CqQz9m8UT?=
 =?us-ascii?Q?3AadKID+dLuTsUR1luLoEf2KDFl/HK95tg50RQDlZ4v55ZGteDA8OXXC78xX?=
 =?us-ascii?Q?Ysvck5R7tSn7Uivv5GaBbUA4AnLeJVcKlF+XWt7UFtLM+rxYgYAJWM/jg7RN?=
 =?us-ascii?Q?auYfPGJEvUOezPJa4KtViY4jXI3TMUBjznJjRpddLn7mmVsLwhlaSOhTWg26?=
 =?us-ascii?Q?49xj+OlEhvYVPcGAXoId63h1EncIwCMzuDUX5VBSFDvdVrrHARFVbi63cnv5?=
 =?us-ascii?Q?Vv/M6opzcZ4tEHs12GO7YEhrMCEAHjdEGU8wAclATXHq6Uj8U+2ZYQk9z1KP?=
 =?us-ascii?Q?P7m8m1yyoWiQz43bX3boH6vM0d9KfQ9J8xZR29V3smYc6PXAGmWRf0MzslkJ?=
 =?us-ascii?Q?u0qq7MlIglaSePrld0YdOgjr9MDc9o1+bAQU7C42mdoNJRYNngj5bryoEswq?=
 =?us-ascii?Q?cgsp1Ccib14AumWOV01iDZUJz2r4qFif+7zrzRYG5WrKOsywktl+Uw8Puvl0?=
 =?us-ascii?Q?ShMiH1kMUFPn8iqjGmLf9k/d3agnTOw/UBoGcpmxszaSU9fknJ3w95Jfz7U5?=
 =?us-ascii?Q?TTPEZcRmVAxy0tj3M/bCzTUfckPrbP7AHpTBDrW57RU475FOqc19F+XXOWAd?=
 =?us-ascii?Q?JEQ9cCnxeVstCssaC/0CcQ5vqjgg8Br8nZmVkIZ6abWfX+5cQ8WMXSZ23Voc?=
 =?us-ascii?Q?OandTNTWpKWe5uMEfuBRLCnRXJ4yJO6HkAGzvZ1i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f24617-9e9e-4c35-ad92-08ddae9bc262
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:10:16.4171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZX0YVpFKi2hAYnKUwAFlmqtckgzicV/2JB93W8O157uQFnayKycGmT8zvW8v8Lo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6637
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 13:39, David Hildenbrand wrote:

> ... and factor the complete handling of movable_ops pages out.
> Convert it similar to isolate_movable_ops_page().
>
> While at it, convert the VM_BUG_ON_FOLIO() into a VM_WARN_ON_PAGE().
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/migrate.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 6bbb455f8b593..32e77898f7d6c 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -133,12 +133,30 @@ bool isolate_movable_ops_page(struct page *page, =
isolate_mode_t mode)
>  	return false;
>  }
>
> -static void putback_movable_folio(struct folio *folio)
> +/**
> + * putback_movable_ops_page - putback an isolated movable_ops page
> + * @page: The isolated page.
> + *
> + * Putback an isolated movable_ops page.
> + *
> + * After the page was putback, it might get freed instantly.
> + */
> +static void putback_movable_ops_page(struct page *page)
>  {
> -	const struct movable_operations *mops =3D folio_movable_ops(folio);
> -
> -	mops->putback_page(&folio->page);
> -	folio_clear_isolated(folio);
> +	/*
> +	 * TODO: these pages will not be folios in the future. All
> +	 * folio dependencies will have to be removed.
> +	 */
> +	struct folio *folio =3D page_folio(page);
> +
> +	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
> +	folio_lock(folio);
> +	/* If the page was released by it's owner, there is nothing to do. */=

> +	if (PageMovable(page))
> +		page_movable_ops(page)->putback_page(page);
> +	ClearPageIsolated(page);
> +	folio_unlock(folio);
> +	folio_put(folio);

Why not use page version of lock, unlock, and put? Especially you are
thinking about not using folio for these pages. Just a question,
I am OK with current patch.

>  }
>
>  /*
> @@ -166,14 +184,7 @@ void putback_movable_pages(struct list_head *l)
>  		 * have PAGE_MAPPING_MOVABLE.
>  		 */
>  		if (unlikely(__folio_test_movable(folio))) {
> -			VM_BUG_ON_FOLIO(!folio_test_isolated(folio), folio);
> -			folio_lock(folio);
> -			if (folio_test_movable(folio))
> -				putback_movable_folio(folio);
> -			else
> -				folio_clear_isolated(folio);
> -			folio_unlock(folio);
> -			folio_put(folio);
> +			putback_movable_ops_page(&folio->page);
>  		} else {
>  			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
>  					folio_is_file_lru(folio), -folio_nr_pages(folio));
> -- =

> 2.49.0

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

