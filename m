Return-Path: <linuxppc-dev+bounces-10821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D824BB21408
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 20:19:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c12vp39k0z3cfd;
	Tue, 12 Aug 2025 04:19:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754936342;
	cv=pass; b=XbYLmyQ7Vsa58guio1+wjF3O7kVD8U2m8hOV48ystJzDJtUm2b96UVU0Ve+eKZp5sBBVW3MZ/2xWmoe+MG1evdw9fNOWJx98uRuatgsj/eGr+QZEW37DRrefZT4atgLu1KIOvnP0a/H3W1/SLFhzuRaxmDUha/WTU4F3v60QXRKsxd4wd6Ym4/zoOA70UL8mnLtwN40KVoooKjpplJuuzx5xbj1jUJgSZ3rLNXtma5B3d/HkuXHhdDa4q1BSpkhpG1troH38MwL6hn8wRRZFIaUWNoCe3Chcoon16gJjaF1+3cD93/tLot78VI4nF/iFdu1olCXkZFRJpFQmj27VZA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754936342; c=relaxed/relaxed;
	bh=LbJqTzC1UIzdo+ms9ENliUvYOi6OT6zVj900iav1E+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IMOWF4lQVyFSLRXlRtCLPqSXHa+wKc3IkuZErjbp6CYCUPHquich8umbDBP9EFS76Y0DRy7qqoxrN+VVOndCZJsnl2pGauOLIlUqUP4GDKmNwoHYEHGWP+kaZDPxw70hiL74hxi02MdI22wxkHzJcR8L5rR7E/U3S2beJH2CHxfNjdbPTKAjspIN2T6byS4/XAPIxEu3ATf0Ljm404bMdG4eNmI60XpMWV9l8o4syCJN0wR8S6Tj+f0a0Icp/jwBxPYvCFjlhvsVkA2b6jCYJy6VGuNrM3XBjfUgFbguQ/OcD8jsSJ/7YMc4ztvcBtGY+5z0HYJihNzSw5nTy7LvRw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KjKLS/Dr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::611; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KjKLS/Dr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::611; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c12vn36q1z2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 04:19:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyZqyrIbVgnBmuu6QHKf202xwvOoNC+8mES8fe7sruP0QN9XngQNvU6cjlY6M1k7anQ0HOr3oWmBWdeNyole58AwoLxhl4BamuG2hb8jHX4WCoEa+md6vNq4ZhbV76LfduWkAti6+X4UyuJGl1UDMBe9PNLB2+K329+6F8DnCMnOYccgFCbTJ5M0zutFvduhiSHOFrULXoYXaXBn9uWg5Ok/R2EbzEE1JcP+qBiaFTEf4fgcNdhU/0KY0sOo26Qo21pdWFIcqpL4OGCPyudpjJ3qBFfTC40HCm0ooybo7q/x8jzqUsWb0fHtMHp/l9zyy3hbiIWo84gU0wO7GPnjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbJqTzC1UIzdo+ms9ENliUvYOi6OT6zVj900iav1E+M=;
 b=nvE9nG6Q/MM+UTI7cIOiLlwPyTe2cYyTouy6aADap3NHYJYQ0rZ0+x07aUZg3430WHAQDtTJ38WdS497bvA/kWgU/2anCMCicTdSZC7UsGZhQTCNRKzTHFemlA5ocK2jhCTbL48ei7X/GYJ4H0zqL0lB9U1LRBLnHfGQUA4MN56Ay9++UJNYJQu4I0uX8+EDG/1LgfIb1NBk0Ic7MbDKf2JXpfuL20ZhHz1iu7jL67cfdCErYRPA5leo8aemEosBGJD08we9djI7SrynCHFecV0rvJZ/2sVvKy7HCMWV2wIs/R1y6IN0VB6jiQqKHMbkVp9SXgzd0yeAAMCWg+Xj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbJqTzC1UIzdo+ms9ENliUvYOi6OT6zVj900iav1E+M=;
 b=KjKLS/DrnG8VrXkMmsMinNsCC0KwOu7YeRiF6aNt0H3nZExV0gapj0ah7F7vJXITGO8mGRc7M6/s4k0/frR/MXlA4woC26jCkO7fMrV9X60qNn8pezxhnCmxXXXsxjTyHM5+WWxS1GqXFzBmiqQNm6l3VBXMaTgO6YPDJzGftRv+8HUg3Lvd4QIWt/SyjLjS7qsjObYrfeyTwL/JUeosrjCNIw7AxLyqS0diOE/xRBOYYwuiiME27W7WvXxHJsIDejql/3Z/wcP3MNea0uwcjhRn39ODjnSLMLKvrPwDP0GgSjvAlXkypCy3KEWFQFQu7fMNbKxC5MfAhcfvGoVzXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 18:18:42 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9009.017; Mon, 11 Aug 2025
 18:18:42 +0000
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
Subject: Re: [PATCH v1 2/2] treewide: remove MIGRATEPAGE_SUCCESS
Date: Mon, 11 Aug 2025 14:18:37 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <E26CCE5E-8198-4919-A38E-DCD2F65F0BEA@nvidia.com>
In-Reply-To: <20250811143949.1117439-3-david@redhat.com>
References: <20250811143949.1117439-1-david@redhat.com>
 <20250811143949.1117439-3-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BN8PR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:408:60::32) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 153aec37-4d92-4965-22a1-08ddd903807f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hbuE9OG6yJs+Pr9CJsUHGDYSZ0ghGt0reM+xyg3nU7XX2gCS1BpP9k+cCJgd?=
 =?us-ascii?Q?f4mGEulrttudJbM5sJ9Qpl/p1nVKso9XgglB3ReuUuELodoI/S40NjRgaKOV?=
 =?us-ascii?Q?tq6X/QspHflGOzCfZT3O0Cedhs7DOfvlcIfG6iTVOExe7yoC6iPea0vgtjeG?=
 =?us-ascii?Q?FpeDmArxHvsElG3zLfzhiu7JxUMRqJPPywbBUuyylYQZFCxmUkBuav4bH4o7?=
 =?us-ascii?Q?aY9TaUKLtRf9pcfq12K733MqAT8WrACYgqnFp3i6WUSVONlP9H6n3zjgk5qK?=
 =?us-ascii?Q?LHSqbgn12tJFKMhA+mAa+VdrUfysP1wiKgkR23kQQiCmSSHGadax5KzXbpYx?=
 =?us-ascii?Q?h0/c8B12bjPVHcjRmECGTTWBXMzgiZWeVM4VDDJrZcIih2/WW+4j26UMxPi0?=
 =?us-ascii?Q?Kshtr+rrMfIkdjU1PnRVBQUe+m4U2fTznFvL6HJ+T3FfZJX1EgA+q9O+h2dd?=
 =?us-ascii?Q?vrI5dSmkzpc4nv7+59JxYavp/CfMrQmA5BBvnFbx9ZXij4HeGoWyombF1SgE?=
 =?us-ascii?Q?pVoV3Elk1WOFkDiqI/KBdcqvCaas3cnEP6QctDkUsc0LkmKOUuNE/k8NBNfJ?=
 =?us-ascii?Q?pYoabMUCfsY4AsQGqGByxTD83GQciT39C2ABbGQL9i7rXApAP85gRI4NWuer?=
 =?us-ascii?Q?jALP7cIYWBPSTi58yO5t+8OaAkQ1eIUCc7EKgs56kmrkmsZAHQXPp00qJVZb?=
 =?us-ascii?Q?CRvz6zBwNzQ1BudbUlOooy2wfrP8QHQQJn2f327QZcb+B1A+vvHx7xg8001+?=
 =?us-ascii?Q?VnbOvOpeeX/Pb2vd9n2eDOS1o+mn0WzVYwJ5LrunGyEER3MLywqEaIDKOJxc?=
 =?us-ascii?Q?Ql1sAs9UOWz2PToXcj5TExl7xVP1pPAVBsAujYjjJPoBqO24GFMU5rYKAjkS?=
 =?us-ascii?Q?HRXbFiBAnIAkHT9m71sYUuNQwY7897PROoHLUVTEi3bF2S43HnQMenxZdIPd?=
 =?us-ascii?Q?kRkhgHSixbgu8qVU9GdP1GnZqOM95SFEEzCYmN/bEiffk3eztPbV0npk1rfz?=
 =?us-ascii?Q?9ukbEcLjX7a3XfRU1I7M0l5kiE7A8famOgfU5MwXh3jHowuSWYZqd9L99gl1?=
 =?us-ascii?Q?OzmbDHXYDxtPvTbEu2ogtPNfgrEgOdz2mLU1B6ZguULEOEwfozhX22exfPSN?=
 =?us-ascii?Q?DHw4wQfVJkgySfZyzS+qs5IkFH0pTtSx1XgzhHK2kfC+QG6IXqM7OW1Mz+BP?=
 =?us-ascii?Q?xwTdozBjE96T5a95AGf78RqWQfI4rS7lMPvKVcPWBpq5TJQgLA5K7bwW91Oz?=
 =?us-ascii?Q?uTMZfKR9FVmr/C8oUAbTL9c1NSva7vlwL/ChLkz1lBY0hPd+20EOSEBJG6vG?=
 =?us-ascii?Q?M5AaufkDXsqzPdpP6sMvNBcAJJ9JA57fwqSB8defFOZovS3dP96pns9uyPfh?=
 =?us-ascii?Q?GIAWkBTkx73OtL5Pi+nA6UKHWGHRbu0mckJZsYdKb5vgVjHnY2mQJTNOS8YR?=
 =?us-ascii?Q?jpdh5u883zE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?osXqi+aisRmQzqnwY6QSeMi5yq5mYRyeAkSd634R6f6vRobE8X6D4+fu/2OQ?=
 =?us-ascii?Q?5O9OEnV5Oo+s5Ep67+O0Z6OjfC0w8kZ2ZS0dRohBPQA8gs7Cn4X2y2tbXJq/?=
 =?us-ascii?Q?9mGVKug+RV78BYR0IoZxJk9M06DY7GM4H1yh+jT+fJWaK2orb4qG1yGEGkNi?=
 =?us-ascii?Q?Ma5cQfEq8hx5zt6d19VtZojVii4H5MgjH5+A5sNIE72UZs655Fn2f0dTl2vA?=
 =?us-ascii?Q?OnLP4K2nPPZAnLivkgAdEJ2xskovSj6KwIh5XJ3wtlF/00CKydCzB4Lh58Zt?=
 =?us-ascii?Q?lKqoWJC/XT+ldsf+TT4Sle4RxJy3HIrdbaP8rRC6QjilOQcrJwrkicyAdUMg?=
 =?us-ascii?Q?dpAVYlcf9A9mlx3NI/scXEm5yCkm15AHA1hfOpfdZQN96f1rQ9bBYIWjD2A+?=
 =?us-ascii?Q?eJeV9nytcJve/KcSyhQLHdVlW3rb2P9P3JyrHwkGKoaRPCt0WAwGQe9v6rI1?=
 =?us-ascii?Q?aqc90I7qjoXg4RBmf9mi/mPTvoS74dokKYw1/mZ77WXinA+T94qMXqOSpPKs?=
 =?us-ascii?Q?HHqZdzLAv7Eqk+XLWm+OCP43z4DXDQU+RfGcflJJ5KYedl9uiGtFKvZdBj1z?=
 =?us-ascii?Q?hHslljVcLvzGClYuz8L3nytngOLR6aCZz0FVG08tGTCGPI1HykA0ll4IP/ir?=
 =?us-ascii?Q?p2Wxv9YMQ3z78JnoHNmrHEGzZ8hDD/R/upRC0+f0+whJvi5mpCeqYq1VXDnV?=
 =?us-ascii?Q?Jais0yBXe29dLB4T8oBWmr3U6G9eo8tQFb/PU6LY394oY+YsJvHS0mPqv+Kx?=
 =?us-ascii?Q?HJFUiu6Mgn+QhcLlLiQMgTw6vhq9BQsW1mGKaU79Xh3zvNlEhyURZ9SOpCiv?=
 =?us-ascii?Q?QPDard2nm1JHw/axRmWjwbyubMK8tucjTZ7mCIe4MtLEQH0b4J8aLpXtN2dB?=
 =?us-ascii?Q?vwWyVrw5t8ZPmZexHFkN3z1b9pQ/j03nQHtqKworZfSo4MBECudJABJytvgZ?=
 =?us-ascii?Q?1/Dc8ubvHV1+N/X+WFjJ+USNPlWbac1FS1qBjptxQlqXr3RXLSuy1l0Y0/NZ?=
 =?us-ascii?Q?5BsIsfY9Kuip9/AWoPRp9uNiD92OlF1Sb9waqm3bKSMqggNNd6DnM/VnI6+s?=
 =?us-ascii?Q?cker0P+H8gPwW2eS4tgg2UflWpYJYdhVAmRi44SHyjMZrLdWss96qRpaLCHy?=
 =?us-ascii?Q?ctB7FxahJIq4WaGAm3EERJEoJ1e1baSou4xzPA/8g92lhLFdqiVqy893mBT4?=
 =?us-ascii?Q?zap56gLnagD5SSNbyi5pTHX3zfHbm89k3UwHKkwXOtcvNMA0HgU6kHji17P9?=
 =?us-ascii?Q?tMwhVVgWVpU5XVynJF051A4y1mEUr/+NVC+bUY8YakJshT9eV0p5kR+HKNoD?=
 =?us-ascii?Q?RAEUS3T/MSlcCiBog7xLqR0J4Q9uL9N8NODzuKVvJD6kKF6/yRMB37e4xd+B?=
 =?us-ascii?Q?AKIlqMoXNMSOMqg/5gWdtwq4Tzwasl2z7LiJxo1qH2DMP0s+Krcwc56KX2eY?=
 =?us-ascii?Q?WbP/OrMaaA6eU2g3LMYWa0DbsStOMZFqaoAa3LZeUGiAs6u6K4G/zYvo6uyj?=
 =?us-ascii?Q?OLOT+SKZ4F+UVHoryxPmvPcyr+IQGrTbK0guEBmYljVpEaRwVJZLV2F3/Uvf?=
 =?us-ascii?Q?ee4jmtCjwGn1/eZ2hul+nA4WSY+OpN2hh9tupvhL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153aec37-4d92-4965-22a1-08ddd903807f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:18:42.1949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyiUSeA7RBxkch5hSEaQBtnTlQ8xSqer34TMHxD406jYXw7SqdC4GRZDfdwS97us
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11 Aug 2025, at 10:39, David Hildenbrand wrote:

> At this point MIGRATEPAGE_SUCCESS is misnamed for all folio users,
> and now that we remove MIGRATEPAGE_UNMAP, it's really the only "success"
> return value that the code uses and expects.
>
> Let's just get rid of MIGRATEPAGE_SUCCESS completely and just use "0"
> for success.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/platforms/pseries/cmm.c |  2 +-
>  drivers/misc/vmw_balloon.c           |  4 +--
>  drivers/virtio/virtio_balloon.c      |  2 +-
>  fs/aio.c                             |  2 +-
>  fs/btrfs/inode.c                     |  4 +--
>  fs/hugetlbfs/inode.c                 |  4 +--
>  fs/jfs/jfs_metapage.c                |  8 +++---



>  include/linux/migrate.h              | 10 +------
>  mm/migrate.c                         | 40 +++++++++++++---------------
>  mm/migrate_device.c                  |  2 +-
>  mm/zsmalloc.c                        |  4 +--
>  11 files changed, 36 insertions(+), 46 deletions(-)
>

For the mm part, LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

