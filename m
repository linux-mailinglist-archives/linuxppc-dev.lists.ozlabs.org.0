Return-Path: <linuxppc-dev+bounces-15371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE5CFCD02
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtL404Rz2yRm;
	Wed, 07 Jan 2026 20:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777562;
	cv=pass; b=Hedzd6t+VWkZmR8lgSEFb93MnaTuR03+B3fq4aTD7iKPFwaPkjMLe1Ceo/K9Kl029eZBMIHB7kmP1uow5IMBSL9wzvvsS97fjByoXAOxH9+4PBYcJ4FqzvN91Q2wJYhOAM3flBMuNCkKbHeuOIX0xnmbx1E2VX7II3ihF7i5Skkp9E5y+doWwukWlopGZWrDPo9c17rHOcGvsPAV+9KJ9lmsMM8/r1XeKvk1PXccUuONTJeGKt3Hmw6yauMOl4IZ0vve46UM5kvqyYj/SWJi9JFvE2ZyTIs2FdY+s7TDhXrtdx51Zk5hIXXugXX+rJu13PppBAltFEr9U8/+hCyA3w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777562; c=relaxed/relaxed;
	bh=EijhbkwoWflkBd1JtjlUZeAmfp2Jg31nhxyHaejtBe0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h8xKbzzdAlpGDpm1EovjchDEVcLb2gnrBVs0tMJ/hdB2VfrwnoEyB2oDFWNMGKIOndqGUM35eM4GjuzEvS6bkX6JDFhsLuqO2xrKVcAn+l0W54c90lwOLwpaj4FNFP99n3TyTZSf7I3oY/Xw9ijvq/1MSA3pNZHlNr5kpnGxcJ+pLz/35987OYcIvh66ZPQ5MgTCWVV2QDwQbgk+voCRrLcBtsqy9tYZOlU5/gVn57SM/nYXxKd7gu6zK4P1P08yabalblmeURNoji9WgzBh/dMV+MRLkRuXsUFUOKtNx1giAPpijO7MqYRTMEy+emVg1XmMWQG3B9xmLi+cL4Jzng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PVszHrzX; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PVszHrzX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtK6THrz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoSB/4M39WAPrZzkt46kkip1GEkoCQJtwwTYJUudbXM0fif9QLZcrNss/o07inWqCKX+5j2zo9Ih5ru3hj55d7vM33pt8iEXMOefaMXZcTru461YNrjmzbYcfGPcoVCTKNW7v2SwUgEa9O/dS6fEIHeknW4QAzCOHX8SL/HEgneUYJRHkMaICAMr9C784uLnggFgPUvDuFelwG9HMqVz8WtXVBE+Rzz/pgNNn4C3Ur0BrZOyPwNDZ4cJBtHJd9winCR7Ur5XEvfoqdFLRshU+SvUY3y3H78lD475zYS4FqhMomvdvHXccTdH6d0a8UknTzn53vBnlQZVFoHypU+wRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EijhbkwoWflkBd1JtjlUZeAmfp2Jg31nhxyHaejtBe0=;
 b=CmwQRyfa6C1UYRaxsJ+CzzOedSxep07zh7RAoURRwDUcr4YXcbrBKaMWZFXsEsOBn8pbmw3153SrFRYfwVn2Is0tJza5EkZaUWAOFRiJ9Md8JLaP53FQq/Q0gnFAsUiX7wgT7dnZVSu8r7P4AGyzHs/RiaKVbh9Z3w6CjfWIOY/dEV7sS6Q7p4ylJg0yEO2FeJ9MYIQLNV0tH6UfzH5Ab6aeU1KXN8ys8PHCKZIJct09p327LEKvHugqFuzy1fduE5qTHsq8VKV6X60pTjHUF8gaqwJAn8yQZM7MkvBgDxd1yKtaits3TIw3XEiW58J+6h5LgxUkyvJhuSVjPmsCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EijhbkwoWflkBd1JtjlUZeAmfp2Jg31nhxyHaejtBe0=;
 b=PVszHrzX14MjyIMFX2CWTKMuoLL8dBa4wAYGcKNR0pg5jG+azQNaNBwdBWH3HGHwtmrC6kV8r0Dzp/AJVNbQ6ZF2zfRNGamb1ZpTsKkChvT3f5FLTNRsUnO2XWsieVRI6VO1ab2v5cPBEcw7wYiG5YAiMoMm3vriNUjE/u/Wkic+nEmbyImdP4SNZFSLvNrVcMpCD07E7jauZbDbY1jXblPva2TzkGkltQp4mqh/Vizzy2VubzUtBwu+MHJMx+zycwXb842bTB9t6RkrjToQ3gH0YrwOC64+sgfxQ1dJ19JwZ1FX9L/z68Otox37BC5Ar1ZdmYLMRzWljjv2dvOWoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:19:03 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:19:03 +0000
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
	Felix.Kuehling@amd.com
Subject: [PATCH v2 08/11] mm: Add helpers to create device private entries from struct pages
Date: Wed,  7 Jan 2026 20:18:20 +1100
Message-Id: <20260107091823.68974-9-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fdf2a3-5021-4c40-ccd2-08de4dcdcc76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B3TdwsoEzgXlbEtoPQX01Wp0GSFbG4Jyd/yr6t3rQmkGCftNCO1oTNT57439?=
 =?us-ascii?Q?W2ITYmS5egBhEsZlYYUl94FnuvW+0YS6alhVru0JZdiKusq04sJs6Lg9TKxA?=
 =?us-ascii?Q?3S1sz7+LORfUJn5U/HNxh9nt6+vVRfEjdkhYOeWHONrs4uvIsnLhU0hua2Oi?=
 =?us-ascii?Q?ymjPnSf7oz6YPI1kTV2fUvMO3seo7QX14fPcUHXZC14sNR5UXQkf4Qk0QOV8?=
 =?us-ascii?Q?8Vgp5CSd2C2oGGnyM7DxAKigU3g2NqNNPsIYDWgeATkYpkX93LVhi9Jucs2h?=
 =?us-ascii?Q?V05cwJbFtqPY3X5Iw+t/GfWwgofVnvYBUEho3JRo6Mz4c06PDR/rlbXEXwSx?=
 =?us-ascii?Q?RKfeW8LquoOczyvKQEOlI+T2HuIv2yCrC19zUfN3q/pHoGNCjlUKpfAI1KFm?=
 =?us-ascii?Q?kZdsNSHOuXsFgvCySwFw1Amv1AggCIxZRv6p+1qAUQ6UMXzDdD6V/rcxZOfl?=
 =?us-ascii?Q?0yGKEZiNbAdpDlV6LRyqe81zPaJfmgMKv6zJC8Qc3R052rJgY/WRzYAzz5uw?=
 =?us-ascii?Q?w8rkKeDNs4ST07i8Zpv/2skd9xQACa7+6TPK1OX+VwhmoJYkspOZ38JtOB3Z?=
 =?us-ascii?Q?adAIgo5SaJ7QXQOBGzxwiaNmopNyTIVUXQCNUKka7CAZhg3U2Fh3rHcxwkmk?=
 =?us-ascii?Q?ZFPZZTk1lSCMiQZarz4qv+uRceiWVbRpUtObWZJNEKn8qAVSaDCvD1JT8YdH?=
 =?us-ascii?Q?15iC5ivpCKvngxbvD52oaDB2fAfR3LA9mt841BqGhzWHEj3si+CNxux8pNGF?=
 =?us-ascii?Q?zZX/RWcyzsS6MsvYrg7oHrvXCPj7siMQniliIDIJUvUxjhzhS7tfmU7MFON9?=
 =?us-ascii?Q?Tj8J1PSEPltpU08jQF+hXrusKibnxMZp+xK+qfzPLFY4gpYmdGprZ3AVcneQ?=
 =?us-ascii?Q?4FXTFA0iJsc9q82pGAd0keweca9jttb4YvGEC/9AJiHOcWuHIdawcawd9CHg?=
 =?us-ascii?Q?icxXtrgPXHOXop4S9A907EYTJV6vLGgOKtOgoPuboZ1wr4IfnjCHNmssJ82l?=
 =?us-ascii?Q?H2G8D8n/WOWBCh5VGL9FmLLPtMjOMJpMUJHychKOV0lkIiAmEHd1L+nj48IP?=
 =?us-ascii?Q?Afih05cmsxZBfxcP0RWZ2rhXC/MEMTqruf5LtI5o9aTvEJufVe8cZAJ42xol?=
 =?us-ascii?Q?5wov1+CZHE6IldVLpW3m0XBe0fd4j03WOdOFYSVeeg8YpZv295Wf2/2FOVsk?=
 =?us-ascii?Q?3DKZCvQ1qj/XWP3yHKx6HEt11x9h02L7EMs/W86XvDqMpWyq3wk4XPpK/STE?=
 =?us-ascii?Q?jSxfsLheeQiGApA3RnB5i30DOQ3QXXdFZU4dj+pwsn/heuwx14bcx0avkZeE?=
 =?us-ascii?Q?2yaoDEO8DIeRf49Tls5vKYO1l9MFBEbpsEcGl4/fIBy5Yog749irvqfZRQrw?=
 =?us-ascii?Q?Pf4smsbwWZBhkBaGWz3c69BOapHVId8sLst0aFeo48ypeSYEa2oUnhbTI22A?=
 =?us-ascii?Q?xw/xzp7AvdC2FPR02Id9bZHlSZWMCssS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gr0ZwzQwhTcoXNj3aRe/dtH6OijGozl1JhtbRv4hJb0NlzKS8Hp4KO66t0IF?=
 =?us-ascii?Q?t2aheyGRjHKAx/ILPm7cpJwOWE9pOk/bB6IzAaWU1H3ORXNL+HmdQV7UXZeq?=
 =?us-ascii?Q?Lw4NW2zvn5nU4Hqe7B7Zwo/92BdSTjH3K4tX1HKj/8iyTV67PFHerhWAGnZz?=
 =?us-ascii?Q?UvfKUL9ZgvSGFy1bENko7Mx8+1MbXOopHvMKBFS6C86j8226scZIgY3LZyIR?=
 =?us-ascii?Q?dqsuQ9EHN1al1G+vqdKvpP2DnvnZQ2fv9j32r4hxHi0TTQgI92fINKyPXrIP?=
 =?us-ascii?Q?Wxs4zjrhmLe9HeYJXafuQFX5cd3URsKO0hUK8sMmMzO1YuZs30nVnWpkqwjZ?=
 =?us-ascii?Q?yTbGKlb0Egw1fmMTZU1zHW6wOH7F8IS3MaqWEN3g9Unkj6YOIDNYukHFs0Vn?=
 =?us-ascii?Q?kA0EexDnOQ5WrfSyS23RnCV5IXCoba04Jk0fV/RaYnGYWdlo8YrbbT6XdIq5?=
 =?us-ascii?Q?nIfy3Qjd+el6Cfw35OMxR2rpzaoHK8zwtYVHIgUu1C8nS1sjLqppD7+ZWC+Q?=
 =?us-ascii?Q?z/lfQzn1rYCnp1LLLXZQtQmwibk9o6af1X85khysmH9jQXlBBQthKjW8wBrD?=
 =?us-ascii?Q?ONYkLZumjqQ9b2kl0EnOtWOv9KnfyULpk5vCs4pLmVuX/y/pVmNo9t4Wu8HA?=
 =?us-ascii?Q?SAPk/77l8Zql2S8pr5E8aF36VAEpBlPM9g+2MQ4trSuAH5nsMpa71m0fwlge?=
 =?us-ascii?Q?XFYeRbbNKtHoA1Cby075M7WWTgyrHBRfy/1idWMUDmgtckTglWQU25VFy+83?=
 =?us-ascii?Q?UF++BB5S9DbNs+vXlDSM+LsPfuJLM1CWm8KpJuJ+vqdLnbjbdWjxmOrnQ9Ye?=
 =?us-ascii?Q?p6ICGTvejXTMheMcpq2T6aPKPlbTy9qsw4R1Vr1X6PUXyPMnOEDstfrMEPmk?=
 =?us-ascii?Q?qFCpCg9azDyg4/JmFhHWW4s812V+pMYYtHHVz4K7HYHnNfpQ7fERH6KsKbiM?=
 =?us-ascii?Q?3tKDiaZFKTM3Q9oLRTtBp6m3KLpkkudjmYPC9GrVbM9gq9bHrhyAea9GSjf1?=
 =?us-ascii?Q?GofbM4dwetmwnLSnJSkez847B5ILmWALGPYgIS7O+U99jOUwrfkAYtEPUUcd?=
 =?us-ascii?Q?fytn/w3BoZiGRB0eN0vTOdU+K0y9SYhwolwArnAHxYlKN4rX6/JFoii5Hbbj?=
 =?us-ascii?Q?eX2oY6shfVu1YhXestzryqpU6DW/cxKdVroBhUAo8IzX4FlrtmVOL3Jz84li?=
 =?us-ascii?Q?ujIhNr5ifMO7z19iR/icyZO/rX3BBUqcbJpNZW1TlsTn2DVzdjAkfDyNzKHF?=
 =?us-ascii?Q?iLCPEIPs/VlNb129uKiEK7LE8kF9rdFyk4tPomDH6J32dFbDudcwY7cjJ602?=
 =?us-ascii?Q?xYzmzKPulsrodN5vAAPUpUPO5AuNjP4V9nWXO+cIPccZWSvJBm/B1DT+4W15?=
 =?us-ascii?Q?9oITnXsOhSUpL3IXdF8PrHBccKu0HYVex3FKBsaUTwVE+WJmV6M3HgR4+G2D?=
 =?us-ascii?Q?4QQ/bE+alAw3R4mnkZK+tx86qIYKj6Sw5f1GQ5S1TcjhQ9ezbE/NsPpR2SOr?=
 =?us-ascii?Q?FJawXHd1tB2CUJxcRhXq8HMAbbnK5bQLaIdTEf5bx699ZHAz4q8oeys3t4h+?=
 =?us-ascii?Q?uM+oal1g0G876xramSzqUK/04v19aaz8nn3UrJCaNDH+pqjAiZYbH3gMHug0?=
 =?us-ascii?Q?zW2JoVwvvvVpzahQ5qyu9CqBuCLpaZUQwvtJ4c7o1nvTmEnuiiWmQLlmWeMg?=
 =?us-ascii?Q?OYryy1pOG6ftfG28NADGRSmayGR19oBKcAPYrWD7F9q8pBrtmVEtG7nDqvoT?=
 =?us-ascii?Q?TucwD9twtw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fdf2a3-5021-4c40-ccd2-08de4dcdcc76
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:19:03.0211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPjd/67uHwvPe4IOyg6VAtHwlF1BVLsVv4zJhvdJqclfrfQ6eaUkDrCKFHcJKkc1FU0Oomzk7xJmwHGye1Y0qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To create a new device private entry for a given struct page, that page
is first converted to its pfn, before passing the pfn to
make_writable_device_private_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

- make_readable_device_private_entry_from_page()
- make_writable_device_private_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
v2:
  - Add flag param
---
 include/linux/swapops.h | 24 ++++++++++++++++++++++++
 mm/huge_memory.c        | 14 ++++++--------
 mm/migrate.c            |  6 ++----
 mm/migrate_device.c     | 12 ++++--------
 4 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index bae76d3831fb..f7d85a451a2b 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -138,11 +138,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_READ, offset);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
@@ -191,11 +203,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e3a448cdb34d..03f1f13bb24c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3219,11 +3219,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * is false.
 			 */
 			if (write)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_device_private_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_device_private_entry_from_page(
+							page + i, 0);
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
@@ -4950,11 +4950,9 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 		swp_entry_t entry;
 
 		if (pmd_write(pmde))
-			entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_writable_device_private_entry_from_page(new, 0);
 		else
-			entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_readable_device_private_entry_from_page(new, 0);
 		pmde = swp_entry_to_pmd(entry);
 
 		if (pmd_swp_soft_dirty(*pvmw->pmd))
diff --git a/mm/migrate.c b/mm/migrate.c
index 5169f9717f60..6cc6c989ab6b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,11 +399,9 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (unlikely(is_device_private_page(new))) {
 			if (pte_write(pte))
-				entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_writable_device_private_entry_from_page(new, 0);
 			else
-				entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_readable_device_private_entry_from_page(new, 0);
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(old_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index c876526ac6a3..0ca6f78df0e2 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -836,11 +836,9 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pmd(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
@@ -1033,11 +1031,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
-- 
2.34.1


