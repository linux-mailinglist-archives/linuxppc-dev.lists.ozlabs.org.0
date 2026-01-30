Return-Path: <linuxppc-dev+bounces-16435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBm6KWeNfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE2B9965
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2XrK67Mfz3bfY;
	Fri, 30 Jan 2026 21:51:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770305;
	cv=pass; b=PKHd7MD8KjYvBNEPoxfDCS9Kt85ineDCrv6Wtk40amZDXGgOzVMgDmwe84Mh+4IYWRXUNst8Yxofy17ozYDhQJsKssHnFEvbxDYeYzZ3jbDbhGBBG1/8MMl3xAckhcWjo6uI+73O7Gj+PHbc7n9FGQzWbH5PXeduZ8RIfcgLgURNkZbiDBwUlJysC6ej0Pu5/86F7ogI3WWLMNRGHKL513XQ62PYO/IF2SCAjslSwc8eEDlRGhEvo5qMBj1Hv7SomDK0aheV7i+EuTMGUVZLVelPk2Sh1QR1IRbs2SOzS5jMEBQ+tt8TI76ueKYJ7K7N91BKQCJSwJZoRkGLJI4jwA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770305; c=relaxed/relaxed;
	bh=44VXs0DdkHzVsIy/CsPvvqAnow0el6Pgh9B4iKsEvP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eFDmDlz/63DEAlJ3RhMHVLDrSMk/PKiku/XUzrDg81DrmEJnh/oO5ilm6QEGhWnxzIwG3OJl3o6MNmgZ8W/io6HoR70OJkWUIqNF7VbEFDAPm0lXF7giPrk3J/lnq5keOMYdBIf6ZHV3CECCpRstjNxW8KK9/mmd80QSfvX2IPzR/Jiac19SlBM3ugzyQSaC0SaITBqvYvX/IieihfCqJi/za3H17I2ZRBkOQ/MXIZCDOrrz6X7GYnoKkgS2ovckFYnFxIFEFstmpOrU8+rl+aXR1v4HtN1MwgfU6EOvop5hU9UGIwM/BKGfPQITd8wzMTJt+ROTa4t/rMj+ok5u8g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L/o2sZBp; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L/o2sZBp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2XrJ6JSJz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+xtQEHxybH6Ui9bp8RcIr+FFl9HuKIzgKTcOaNi3alOe/dN6BRzoYpWPEACLzfMZToJTYQyuowGTZ7QzJRXL9ej54ZTinkzVXT7LfNRPkg9UlYkuSDtPLlCen7eUvh2C3Nmwejfa0bKPMrYGxRBAK4TaX+tA/RuQGDW38gS2uPPIHNSEVsMlbujKjFwm/CJucZbHXR0RPmO0KnGZwHDhUMrehFSSycSFM3TXXAYXMv3Rh6QrAmDANgeAILnhSvksHripFFkk54Jn5qfvai8g5fBIJHwFtjk47/vaCaNPxPC95Sjno+loQOzhBp0WXMB9lqx81LT+4PrIF5YcvheKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44VXs0DdkHzVsIy/CsPvvqAnow0el6Pgh9B4iKsEvP4=;
 b=RKZ8e1te1zv8QCTVUuN36ir8M96aDetNRl5QuqLMOLrX+isVkI0Plp6IcTEbt01JBqFxU3bCFXoDMGGtvEzR1qjuygV5mrXNLXt2/7w+ywnnvlN2DpW3iNnVIZaLbT8NJVVtNg/TjusrPvtjdkkQNy3Bilwu+9j42VMnoEQSzpxuYMpF/PrK7MdD+Md2515liKkWK3Wmqft5kO3lQfIcRtWbxLhMhQaT6QlNmHs958LOuBpRhPoo9w0g/LI3sZrz+90Sr9Pf6Ba/wKaG5JGJRrMuBxdmDSXF1RtL44TQ909AJOuBzqzPoVxmnS9FTQdvz66V1jfpg9Vgfm1oszKr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44VXs0DdkHzVsIy/CsPvvqAnow0el6Pgh9B4iKsEvP4=;
 b=L/o2sZBpA3HngXkDG3XVJ+MnamgJXZQIfieQjC4AtMDVXQSDDk8L0kyDB7Dp/B/kDy06ZzyTAHHGfbkbfmw8xoelWvsly+Ncg2rPDlbIqpxbqj1AIwKxCtkEAz7gAngkeToxAdx+GIyEHTOavKxLi3wiwNsGYTOi9u2xnYF8RWFosqk+tkFKT+Dc6NlBE31Ce9KH3K64jsENOE90tHO7NNPrdMuLXUQK2ORJdAnBEMrdtjSK6KgCjXnZpIrW5wmKqeX1y2s83Wps1ve9EjT1Yt/13d6XEwMyqbdIC94VHGu79molFLKR9BQgXLbsW3oslFl9pEcnRwxzIf1AvLkpbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 10:51:06 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:06 +0000
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
Subject: [PATCH v4 01/13] mm/migrate_device: Introduce migrate_pfn_from_page() helper
Date: Fri, 30 Jan 2026 21:50:47 +1100
Message-Id: <20260130105059.51841-2-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:74::48) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d06b245-3f53-4aa2-9bea-08de5fed7801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e9sL/99i/wiEDWN0JgnWAwUBWjARl1T7bX/KvsfaYqMYxZ4f/OBmdl5Ylrp8?=
 =?us-ascii?Q?Es8igzeVdsvtfV4pnoBSGj2EOXl2p/utap59lnfJNat0aYuY39sVJn+LowBh?=
 =?us-ascii?Q?wCMKhjc5x3OMt4Zz8xMHp+5ln5B35zXrAUorwMgt9SjoOpaGpnBqfu/P4+38?=
 =?us-ascii?Q?ESB1GAUy3tV4nr3PzhsgJko8+Sx/2VA68qKnzH0leeKs0yYUd7E1KUNKiRvH?=
 =?us-ascii?Q?TpzRMldPdFior7oMv5AzBINBo+XZywPLTqlWzWKTkXVKf/q+uRXVhltvK2KC?=
 =?us-ascii?Q?pDGUK0Lb2W7y1eAY9J992ZDDZDB/1PfsPNVNBQAGv3ReP6AMPONyP3bwveiB?=
 =?us-ascii?Q?58mNanhpI/4yyOcfuYEfFQKmjvi4eT7CGXoyPTFpVV3xZTj2/2fDsB5Cs1mn?=
 =?us-ascii?Q?dB3YfmmUVM5VGK2J0CdEJODIGM1ofM7bqJ/45IkgqWj+ZmNQiaWR9K52JFhr?=
 =?us-ascii?Q?f43aWxVG9QjyE0TFBxAs6yydg1L4wHYeYXwvmsCzo4fgvRwloTeaAXp3n3Jd?=
 =?us-ascii?Q?5FJjsXPWHxdAtt+fP8CAOfZ71DSj0q1x+uqeQ2jDTQThVNwMQ5iDlT8LlsTv?=
 =?us-ascii?Q?tBBkb3a90N3quTS+JW9tC52eutQmUjA8PzOF2rTaKypmqjZtfVoCZoWYQ83V?=
 =?us-ascii?Q?a/OXJsTOTci3Np5xKxH0j+mHEYDap0/TS/mLZ1HjhpFhXl/5SOLh+fUNnLoc?=
 =?us-ascii?Q?sLKanCV/DtZCBovjmsIbPnbymqL/MYHL+HvH6cxC6Ic8pryE5vVPKL2BUZQO?=
 =?us-ascii?Q?rZACmh9SzArJ+S67TTDyQ8fAw0hDnogCEhk4e2P2nmzJf9Am2Dez29is0qQ0?=
 =?us-ascii?Q?tBR2o5FMW+0KjlTJZob8wu0PqP2qllGZG7NLTS6JbncyRihI8ZhSW2+7QppE?=
 =?us-ascii?Q?OyLzRwnHAJdFs15MMn0dX8dJz50wjN9bh/GJYYQ+miQMageZH0fzOJO7qvjr?=
 =?us-ascii?Q?Mfo1uTuPt8IYbL/WHueg3sx8WLW8qVhpEOM1a95NLombWRzKoTlp/A6KS+TR?=
 =?us-ascii?Q?tw82PUcG6fA25NOS1ojKG5OSfBd+VlcEEnut+srtNV3BYKBmCORIRiz7VTec?=
 =?us-ascii?Q?WKXzC5e3IawlvWxoaiYxNtmKZapTUdXrtwExH/VDcAZiIJOtSGw2++Pr1Dcw?=
 =?us-ascii?Q?Zqbd8TkuwmCfvMFI4r6IyR95LGvkDgcmMtOWiX1ACZvOaiyLe/rTbd17rIwz?=
 =?us-ascii?Q?KJ/6Z/HGDcuZAMbTd1Ei4tqVjz9nDV5TevQt64xZpjWTOPfGj3AFcXrNShSs?=
 =?us-ascii?Q?+hcNdLbBmuy0OGRxDx6EDDeYXyDxmAbU05sx8MIASDRSyEzD1ZZXKqC7emKd?=
 =?us-ascii?Q?O8exzBOEM3QOFxbRr8MVdRTCDIQP1RUf4LyW2JNojZNvaJ84OUdZ5dG+WHIF?=
 =?us-ascii?Q?IjK1TkeGwU7zoWxJzQvKsT/POS6ksP4jhBzWVcmOiRkxICOi4WDx05Pl9R0i?=
 =?us-ascii?Q?xSrlhJclXhE8iKO5PIpIR8mYxGJS5vEGeVopM8YTY4fl1Q3TvfmEDby39lqf?=
 =?us-ascii?Q?MMq9NjvO5nEDoP+yXXMqmd7cAh1UOPEOqhbgEnefIpKnEIkNwTOkEnMfIZng?=
 =?us-ascii?Q?7JVvVK8reyhG+wk6v94=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JHkq5slrmOcslzVQKH0dpRyM9n9zqmM/tjkzBSwQVHk7d9HNohKxdfuFOnlV?=
 =?us-ascii?Q?sx4pNjl0Zp6Te4kFHjfECDhn35qTXd/I1jqW3vKS8ULCmZ49PgbBx8s0poXG?=
 =?us-ascii?Q?fX4gCm6cf84WqvbL/UWJ/tmqF9o9a3kAgDK/PjmLACcBmknpBW3SVkG70Vaf?=
 =?us-ascii?Q?/hxotojisD81IHFXoHD6Alk3jKGzIKotszvhCYXAlLxaroozDoUimSiCPYif?=
 =?us-ascii?Q?TaQBt/tY9v6iUpAZTDvLB5INWe7+3vLuOsMJhR6mWn3sW+C7+T0FVGqgvLU/?=
 =?us-ascii?Q?i3d4b0wiG4tKYOlCr9aH+ocyYXo4dbBbeHOQbGdKwj4lWYS/pnakiy+TlrUB?=
 =?us-ascii?Q?3Zn9zG0AmDsCcvWsW2YdavxJGupvjFqsyt+slJf7T/On0Zc2DhKrI3hYUG9O?=
 =?us-ascii?Q?Rso8EHFaZkkX44O2+O7aTTBTVcy57B//TG41Xbe7FR1PGR3B0WaxutQ2rgD4?=
 =?us-ascii?Q?W6Tc4wPATEirbFUi1bNLWUPHftbMy468EgJkFxh2YslgPfzoL2jSVO5cdWdF?=
 =?us-ascii?Q?m3Ab3m0BOVc6mc43rL1amctPorsHSbEhiALeQFZBkHgyVKHGxwJnpGF8Cldi?=
 =?us-ascii?Q?avePlBXbbN3t2z1Oc0OlTHeM79wvvq32irJBE4UbyZjav2a+h2Xn4rlFxQkb?=
 =?us-ascii?Q?FRAXfH/iuAuJsVnR1h/udTwQO9XiYtIMZgjgkaqACSiZeUZ8hskZVlEdYC/q?=
 =?us-ascii?Q?vJw/ArWbiigB3w1xARRKsjZjfbO04HCCM71Pl34Ssc1SvmTVHizcSZ++bMxL?=
 =?us-ascii?Q?O0Vnz0FIaedGIAopDCO15MJ2sAe5BmPl+gfrQCo5GSLxprxSwpWgcKmct5w3?=
 =?us-ascii?Q?zY1suBYyh0YaD5llaPu5qjaCGEqPrl7UJfIzLpPMZHZCl/DHRgJ3KHNEyVWI?=
 =?us-ascii?Q?zbvOzf5lGhKEr0gX/mWePJwiMlDvxcZZa45Mvnh00O9bLEI1LSBqi5dylr48?=
 =?us-ascii?Q?AS2+LM+r8e7Dj8TEGipByqbxftcoxi0pOuOyokCaUQneifxhTqGl+3YdhF1m?=
 =?us-ascii?Q?hRvko/RvKtr1AqvUUbGt46ufPETMf+t88GXYOICYYkRmTHI41yPjpKOQoUfz?=
 =?us-ascii?Q?Crhh13SD6HbmVpWELjzkeV7JC/XqtPsHHbtrQXR3JSo9qnCodhjAjCiwbv16?=
 =?us-ascii?Q?ZWcXiE7IjVbwOEkrJc9/zI/7ltZpLvzWHs2aLstj4ZKx2diGF2wt2CRPCJyM?=
 =?us-ascii?Q?DpEg3DglVKypZgoz3Q5A9IqgwfyugpxvuyYafSRrhs1WZ1JEUdQMkILI649+?=
 =?us-ascii?Q?Y8Kyge/myjii7gR2daLKLIrbcyqtmdt+xzhSDISNW+19pT+ViJUuCeCGqeaU?=
 =?us-ascii?Q?jYqkJQBNBswRY70S6oKEHQXdi4skTgdKNTKnmr7nPKd9c2Y9TKO1MimwCnfJ?=
 =?us-ascii?Q?4vagRTGcV0LjbLRW9BPoeGqEnGlfGL2Tlp6LvefnQdQyF8GrNuRIAy2XyN1n?=
 =?us-ascii?Q?ok6yBTwz6WG1vbKS2u9bHpZZY5c2muAmMJxP8fK2QBl5AZvCe+3JvI1ySEZm?=
 =?us-ascii?Q?HI8JekGjgczJ3UZkJF/cNqoEVOzl3tyKNfRfL3BDVzix1HJlDE7mCZeEqIk0?=
 =?us-ascii?Q?aQHvF8LZBIG42mPU5sS9g5mZuSCgtz9QOUQbyG17xFGAi/2q5KAjFB/HEYS3?=
 =?us-ascii?Q?ltP4mpjCrWHfUhrhZvW6RMK/jOMjfC6tHe8loh1GVZXH+Pxk7haBe49v+h1V?=
 =?us-ascii?Q?PHMKShmSv8JLspI1QmAJz/AZ0iN1SCJsrHVP3bbdrm/D5cgE0Y92LsAn7Gjm?=
 =?us-ascii?Q?qkY+gJY8FQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d06b245-3f53-4aa2-9bea-08de5fed7801
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:06.1447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R50ps87Znsv6dyjl4/2GYZy/ib5/RIj8EyMV3NDNMGC8gL6gpEhPwxyYXUCn7bx49SEGGre+hmRpBotCvTNyLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16435-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,amd.com:email,nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D4FE2B9965
X-Rspamd-Action: no action

To create a migrate entry from a given struct page, that page is first
converted to its pfn, before passing the pfn to migrate_pfn().

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new helper:

    - migrate_pfn_from_page()

This helper takes a struct page as parameter instead of a pfn. This will
allow more flexibility for handling the mpfn differently for device
private pages.

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
v3: No change
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 drivers/gpu/drm/drm_pagemap.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
 include/linux/migrate.h                  |  5 +++++
 lib/test_hmm.c                           | 11 ++++++-----
 mm/migrate_device.c                      |  7 +++----
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e5000bef90f2..67910900af7b 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage));
+	*mig.dst = migrate_pfn_from_page(dpage);
 	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 7a8990b30fa0..1f03cf7342a5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -652,7 +652,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
 				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
 
-		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] = migrate_pfn_from_page(dpage);
 		j++;
 	}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 03ee39a761a4..526105aa4b05 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -742,7 +742,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto free_pages;
 
 		page = folio_page(folio, 0);
-		mpfn[i] = migrate_pfn(page_to_pfn(page));
+		mpfn[i] = migrate_pfn_from_page(page);
 
 next:
 		if (page)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 58071652679d..a7edcdca9701 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn_from_page(dpage);
 	if (order)
 		args.dst[0] |= MIGRATE_PFN_COMPOUND;
 	dfolio = page_folio(dpage);
@@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	mpfn = migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn_from_page(dpage);
 	if (folio_order(page_folio(dpage)))
 		mpfn |= MIGRATE_PFN_COMPOUND;
 	return mpfn;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..d269ec1400be 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+static inline unsigned long migrate_pfn_from_page(struct page *page)
+{
+	return migrate_pfn(page_to_pfn(page));
+}
+
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 8af169d3873a..7e5248404d00 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -727,7 +727,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 				rpage = BACKING_PAGE(dpage);
 				rpage->zone_device_data = dmirror;
 
-				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				*dst = migrate_pfn_from_page(dpage) |
+				       write;
 				src_page = pfn_to_page(spfn + i);
 
 				if (spage)
@@ -754,7 +755,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
 
-		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+		*dst = migrate_pfn_from_page(dpage) | write;
 
 		if (is_large) {
 			int i;
@@ -989,7 +990,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		if (dpage) {
 			lock_page(dpage);
-			*dst |= migrate_pfn(page_to_pfn(dpage));
+			*dst |= migrate_pfn_from_page(dpage);
 		}
 
 		for (i = 0; i < (1 << order); i++) {
@@ -1000,7 +1001,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			if (!dpage && order) {
 				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
 				lock_page(dpage);
-				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst[i] = migrate_pfn_from_page(dpage);
 				dst_page = pfn_to_page(page_to_pfn(dpage));
 				dpage = NULL; /* For the next iteration */
 			} else {
@@ -1412,7 +1413,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 
 		/* TODO Support splitting here */
 		lock_page(dpage);
-		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		dst_pfns[i] = migrate_pfn_from_page(dpage);
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
 		if (order)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..1a2067f830da 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 			.vma = walk->vma,
 		};
 
-		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
-
-		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
+						| write
 						| MIGRATE_PFN_MIGRATE
 						| MIGRATE_PFN_COMPOUND;
 		migrate->dst[migrate->npages++] = 0;
@@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto again;
 			}
 
-			mpfn = migrate_pfn(page_to_pfn(page)) |
+			mpfn = migrate_pfn_from_page(page) |
 					MIGRATE_PFN_MIGRATE;
 			if (softleaf_is_device_private_write(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
-- 
2.34.1


