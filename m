Return-Path: <linuxppc-dev+bounces-16445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABIxIeuRfGk4NwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:11:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B8B9E21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:11:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YH01stsz3bf3;
	Fri, 30 Jan 2026 22:11:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771484;
	cv=pass; b=k4M5TaLzWzZpYPONdjx5Icsn68DGZf6wiiuh1ZZXVDcDrRJOXRFVC0oWbfbm4CLN5oywiqrp/yTdRt0j7tkQRHzLsqgDZqKey7ABS1CSla5nQvbk0qhDynEdMpfbXRHuN/HDYQseuiD1ps3V7SmdnHT0YjnjHXLk0YENc0HM8wNSEYYb9zRs+tmf859hVX6bDaEikd28ywYELy3fcKueLeLVs3IvJNGSaq6JEAVD3mB6E+5FUzCt8Ow1ZBEvPz508Q7f2IcZYezIWnRRYmOMMFIAu2LP+1Z+JSF3H6EgjmtTdhop1p6aZUqrHEuRl38FWsnFPqtCJInhsIK6mKt1Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771484; c=relaxed/relaxed;
	bh=GjKrklgDs0kHLYuOwEAzFFY0Zk7z76an4TOf5phzNpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LlVFgxRP2qtxBpnNPJjhACC05ELciw7Pb0MHTOrGvu9kNsNqwy1Tvv7INZ1EOtFOgm9cwPI2K6UNMu9pOxblEepx9Hqvbr/MCXkA1W4qpfXUadvUT3mTPCPeuepxaEGu6mOm83V1bVdc3Bsd3R4a0JoUyG0Ktsz34gyBU9EXcLLCe/HobKg2PXwn8/LmAVaFm5phlIaEG7wTsenwVCwgvlHFS8BIhVqzEn9UO9d7j6vFcv95Nnhztqxxu0WoYVpRU656cAoNkEZ+szqqYV0/mkweHdmBDjifPQqJSd+PS21Buo91e+7gYaG/UvfxpNuhk7alK0t5PCFQkQVrmogQ6Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SddCpzJ0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SddCpzJ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YGz2Mg3z30M6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:11:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDVpWdiCSTjYrJNP3cwJsZbYWdWQk+9P3sjcxqIFjcrhJuNmYYSmhyr27ncrSV0/ko4K4PdujLSYmsyIQ8J/T/DbSl2W8dWzSEzxRCnsFH9o3CsGlIkE/5WQ0uaGRHmfRZP3hnC9FLusWKJh/883yd8VLMVcGmbY82TGc8ib66gfXgm7xCzOwnJQpJvUhNxTETPvel3U5/QyQBu0kmw73qXAqLOEDbbRL/MTvjvaR+EUw25u7xPv9H7nzXaCJI4H/PO251ZbmvNPyzosaMF2KIRO9+rAAhNv+NFqByOxBq5ep/GKNBpA9u1F9L3gwi5gGSdEz1bXBbE9B6v9eVtpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjKrklgDs0kHLYuOwEAzFFY0Zk7z76an4TOf5phzNpk=;
 b=QJ9hDs/C1/ZH+seD6AVoXcjTmh9sD+pbBnG9Awwl/98JIWYFXPHnUNqB5dLGeTvOTl5mFS+4kk4/G0w7ZuR4Tf+cdBZq33joSo4ku4bJaju8U+yocrgoMwI3Fr+Y9F1wfeOVRZ9yw/+4PWIHHztyYg/ulznEhw5MQWb+ZStR429MwgUfSSJlqTc7enbTgPDBmpMefWii46IFgvFCaaZkkrbCmKAMi3xhW4prkVTvL0vNrZLz8XiGzUGuprbGpBdjO4HvjIWY2YZItbzgG0kDRkxzWMBURffTtrtOYvWmGh3gYTtHv85aq0NmLWemZSGIhmIfGC7U2y+wo/tLX7slkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjKrklgDs0kHLYuOwEAzFFY0Zk7z76an4TOf5phzNpk=;
 b=SddCpzJ0+fXlv1/Gm888JfGLaVt4rlpuuffsqyHGCPvHD4xkKiocEXa+iZIyeAjtETojyezlbEjsWRQ8fhztM2QV+W2lvcUxmISJ0/zUFQgIuPU2XMRr4Df7GGNYwy6c1KfapOG7+/EXp5oL4PRHXF4Lnw4013vZjAPefPBFaogMayB9dS7QNHaNd1gqx5UOki5AJepb1iqpdYX+UI+TiojsSsB46SKihxWhyk5Q6cyHawo1aoQo91FJfo0D3B8IrgzNu3nrL1BKUAmQ67se4I2jxDqxeF01yxrRdMVfpjMypm+NT+0L6725wV6rtp334jkXbvhuDGMe0rqT15n1GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 IA1PR12MB7712.namprd12.prod.outlook.com (2603:10b6:208:420::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Fri, 30 Jan 2026 11:11:02 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:02 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v5 02/13] drm/amdkfd: Use migrate pfns internally
Date: Fri, 30 Jan 2026 22:10:39 +1100
Message-Id: <20260130111050.53670-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|IA1PR12MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d01b538-f633-4aa4-8dbe-08de5ff0410b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E80221pY1hukEdPuvCQeb4vjfTMi+QZuHayIBaZ+KChcTwqI9Vouws6O4mPb?=
 =?us-ascii?Q?JIjmtHcyfFG7RRJwZfgQ0a+pdCYnYIREG3dNJl7tUYgfaL3dl2NkokIPOyQi?=
 =?us-ascii?Q?Gb0Lr0lbc/kZZv12rqhEVONLUYkTHrXyNmMnBAmWLHLphdPfoCi0KGosJe2/?=
 =?us-ascii?Q?5k02S8LMoTvInXOOHKw0K8q6kKyLUX21w0uo+RizX3lIXYTK5Ldt6WFefLCE?=
 =?us-ascii?Q?SIh01Mz1XGoweYDDDo1a+6UervrIRRx97H+9iN893WyYOoTZHua5PtTzE+hG?=
 =?us-ascii?Q?OlAjsQ6goMLw0QrM/u2OHaowRsGcMhQNJkCgZ887BZPHUd8joJbxGJtq9Nav?=
 =?us-ascii?Q?PPrnbdx2rBwEVmsjt/h8hfhkU3eKNR2Qy/rx3feO0l/sMt1IIYapOBCZ/Azo?=
 =?us-ascii?Q?SWR/81Qlyh2TNIm6gDj6UyGcmq/YRU8Lh0sb9BYhSVUaVcWgHcAulPC27N8F?=
 =?us-ascii?Q?+h1tuu36cAiDzmsF27qO8AP0Ys/43C+uzHfFl+VsDjanOHybpWgpdNnpCtbI?=
 =?us-ascii?Q?gtjcUgl7fUX0khQKSJp2T5MMncS8pfKSV9PLe2DoJAMNl6uZljdfctDyGPtF?=
 =?us-ascii?Q?U+dMDf+qxAVQy43ex8h6utxdLV7qjJp0v7eFYazRI0n9mBYgdwJsPiaPIShl?=
 =?us-ascii?Q?MOOo1rmisK3bVga5HDXbkn4CuGD+nKdHSsYT7MiyfR26nAbnvan7OmLtymyF?=
 =?us-ascii?Q?FUssvZ6GNzNPqUF2vq6KPKuVOBL69yNA+M1eBPKtwJu9KDllKIsbYqw6eQi4?=
 =?us-ascii?Q?1Y/hCvtP1CtH9ih+Ke5eIpBzkrqRdYyeBnjk4f8lNsRCPmjGIaJ3PDDN7yqH?=
 =?us-ascii?Q?pbJeFtTTDP72knmp25qbxG+abk32cw5B09/JjA6Y19V1KvQFjjwTxxp5OT0z?=
 =?us-ascii?Q?R7E4Zs3aGu48hSLTVPpFIrrSCkWqQqYS53wu9Beieno8TiT26RdCfHMjHKTD?=
 =?us-ascii?Q?1SRgxkMYkBxkLeHzF7gUNxFIH3kE30w8WkA+m8IRHkao6fY9EffyBbwOdHKu?=
 =?us-ascii?Q?isSpq2ZHqMRHU/Zjgpi8QefM3f6GirPHbz+IejTfJKHokoXsfIW7hBWjsxYy?=
 =?us-ascii?Q?lgBKMjsWduZPdtavt7RW94SZ+YLGgRsQ5nV+SeGC+ZTkeQCBSqCU6CSsj/Gi?=
 =?us-ascii?Q?3K0NGG0XoV3kAIXAkKbAaJXN2cMQdvMQ6j7xdrEyk7aLXazwOFEMTY0iRbeZ?=
 =?us-ascii?Q?cASz71+rwaT/dPQpFBx0Ufcup6FjYP5PckwIq+CptiImBVJRsUFBEodJJM1M?=
 =?us-ascii?Q?edEJK/dgD3YxNVjdTwiuwV3D1LeUc3qOb9LYk8LnKrzV1hLWDt2l1nKgIpa0?=
 =?us-ascii?Q?IIw69FV514aEzcnV2U+r1bH4B6d0hlKqT1SwSuCXbJUm0tBcoohcxbn3ZHJp?=
 =?us-ascii?Q?JL8AZ27GMHv6BVKWz7NBJdMg4WwfFb3qIw9Gdov/fd/6meAblvXA3rME2S9F?=
 =?us-ascii?Q?z9n51RPPOmPnWJVefbf7qUj/TXYIQFlFzt+PJwVH4/ol96cYfDUj1p9uf1X3?=
 =?us-ascii?Q?IgXw3Oi4nwb05OFCPKrdq3TCtIfm6BkYesvCPhOYjJMvg6LTMiA92d4m//SN?=
 =?us-ascii?Q?Q606ShmmtARXbSfinhQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+a2Y8fsQmsH+cfYKFSwcJCmpIPqy9F/aJylicjZ7yEQIAmLPgpHfXxPbGpPx?=
 =?us-ascii?Q?DUsVp5oSZLG6Fdt8/pcnKeDA+uy41ESZl2Y69sPjMCy8BlxjZWyjbGJz6Lk/?=
 =?us-ascii?Q?zR3jvgj67ZrK/qvBTXAD86Q3r1Zeb9kIpbIhsgFRZjJPLW4dvC3JWtuqjoke?=
 =?us-ascii?Q?bUVOvQvEOJiWB++uBM7PI6yzifjCwXhokNrYX5wbuu8X0fsp0haZEQ/i0Bua?=
 =?us-ascii?Q?2Ijl0YqtdXV8MP5lq6QDmhgqPN618yryGEaDZaHp6aMDeBGpHTQs+7mO5m0j?=
 =?us-ascii?Q?UkKJKGIYO/VvE7GrsgyZFBso/dW+JBpv50Q3e1/WHTEeB3KZj6otjP9kix8i?=
 =?us-ascii?Q?1BKHdxQ8sCfikatIVqrLvz5j008PupoenpGkglFenN6pPtNRasAn+rmuqh07?=
 =?us-ascii?Q?AtjRr0xjxeHjmimEMOzf3Tau1u8P26gC0zDvFKDDemBJGO1QuAUPdo9A7MCx?=
 =?us-ascii?Q?lTzUqO6F7Dk0v7oN5nNqyXRPHya4mbwCUnxe+bki8XqsK1LjEkhLwW3j4dsy?=
 =?us-ascii?Q?ZP73QxyKo7D8g93+hWaqiTZakMinwrBRyQtVxqH3dbpME1majxCrd9uNd4jY?=
 =?us-ascii?Q?EUTBRsHKow073MwYfT88eAw5q7rKR8FOIlAoSMJ1b6Smwyb3LLKrWCJZzKYU?=
 =?us-ascii?Q?od7GPnJY0YvtR24HCF2s7Qf7uUhNi5y0rlEAVn3TbZC/4BM1SalK4YWjPjeU?=
 =?us-ascii?Q?E4JcvIIYEP7K6G+NyqoNqifM7392C0IJNjkJfZUFVNjjW/KGSjuNTIu6Kyz3?=
 =?us-ascii?Q?xhRmW8e4d6YDCeJes3q7436r23ZBQfCnGF1VtniTBSG/f8mc+tMYU/P1McBH?=
 =?us-ascii?Q?g+H1I4Ppcxtn5bSIiFrcxb3TjfmYyYlqC9FQ48BCg2qxS5hdWgotsLXHnfOD?=
 =?us-ascii?Q?C6o53h/C0ltJVdEbFi8JDy7jYVNADFFqqTY8UvoFyYj/KPumaGJhqi/q+ZIA?=
 =?us-ascii?Q?BDchBZdEJzqKE5Nky1YPb8ktV9DiAzWdYYrwVmSNtP2sPiu/pQJVaQsi+gLP?=
 =?us-ascii?Q?RPXQLHRybMcrzqAnI9+jjo9PPh6hsqgYIKKa2JxfjFOxO2R8wKboKItdoI+Z?=
 =?us-ascii?Q?1PVfiXB6c7d+8pxjv3KLlNCAEKe93J3Ra47wTuY6HlA5rK299jX+S0FNHCO9?=
 =?us-ascii?Q?xlBS4Vc9JFdG5bIqbvz1FW50UfrYq2cn/lh0YsY94I1CAu8cGOBGinDDKExO?=
 =?us-ascii?Q?pQhWT+LYsJVwGvlAedXi05wGOPLXlf94HlepX+WIfYuziVZmdRMRS6n3eqkW?=
 =?us-ascii?Q?DlF06AtafqoD0C01iWYDCsv+leFMYUUdj9NAMrY7vbC1ZRgEToGi42e9PPna?=
 =?us-ascii?Q?ACKCZT/l2z1REWrD6/PSeopOx/G4+vK0DQlZfnUxpowmjZW9TvbxddxIAa7n?=
 =?us-ascii?Q?eNhMuc2UcAAH+xL+sIsZtejV8wQ/UdPRQrEHhJfTLfGj3l92Un3Mpw+XqSlD?=
 =?us-ascii?Q?4pIU+zXa8LxU/hkyf/MsYXzWVTGvbv7xGAaNlqXEChjUssAWML3tP/sqUhgS?=
 =?us-ascii?Q?ZFJtsChyED/ksiT4YqzPcnBWZk+TgSlQSkq4SSsn+Uptxaj+c6QK3Ag/NqN+?=
 =?us-ascii?Q?yDeQgApGdZ+NUR9M68E7WwkcW2SMtEpomrFbg7IUt0DLkeC69iL+OtuBm/fN?=
 =?us-ascii?Q?icrr6J9IVJWTW6mkvtRj5G1ZXfUpDVfpciBM8Y5+4YjhYu1LEBlI+T8quzAX?=
 =?us-ascii?Q?v35CzCmi751wbUOIbrWazytYHcajrpNheutAh9YocBE2bBhD5i9M83vwsod6?=
 =?us-ascii?Q?j4MKFR2YxA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d01b538-f633-4aa4-8dbe-08de5ff0410b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:02.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRXO5sm0l2eWT0Y/AdYZiX7TofSAJI7yIeelhXySEc0h2JBSDU9pSd+FhkF4KyfICLnd/vUNoaVhrnjgbcutfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7712
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16445-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,amd.com:email,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 9B8B8B9E21
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory.

Replace usages of pfns and page_to_pfn() with mpfns and
migrate_pfn_to_page() to prepare for handling this distinction. This
will assist in continuing to use the same code paths for both
MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.

Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2:
  - New to series
v3:
  - No change
v4:
  - No change
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 1f03cf7342a5..3dd7a35d19f7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -210,17 +210,17 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 }
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return (addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
 }
 
 static void
-svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
+svm_migrate_get_vram_page(struct svm_range *prange, unsigned long mpfn)
 {
 	struct page *page;
 
-	page = pfn_to_page(pfn);
+	page = migrate_pfn_to_page(mpfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
 	zone_device_page_init(page, 0);
@@ -231,7 +231,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 {
 	struct page *page;
 
-	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
+	page = migrate_pfn_to_page(svm_migrate_addr_to_mpfn(adev, addr));
 	unlock_page(page);
 	put_page(page);
 }
@@ -241,7 +241,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
 {
 	unsigned long addr;
 
-	addr = page_to_pfn(page) << PAGE_SHIFT;
+	addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << PAGE_SHIFT;
 	return (addr - adev->kfd.pgmap.range.start);
 }
 
@@ -307,9 +307,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
 
 		if (migrate->src[i] & MIGRATE_PFN_MIGRATE) {
 			dst[i] = cursor.start + (j << PAGE_SHIFT);
-			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+			migrate->dst[i] = svm_migrate_addr_to_mpfn(adev, dst[i]);
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
-			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
 			mpages++;
 		}
 		spage = migrate_pfn_to_page(migrate->src[i]);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 2b7fd442d29c..a80b72abe1e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -48,7 +48,7 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 			    uint32_t trigger, struct page *fault_page);
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr);
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
 
-- 
2.34.1


