Return-Path: <linuxppc-dev+bounces-15098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864EBCEB460
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 06:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgyVB3RxJz2yG7;
	Wed, 31 Dec 2025 16:01:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.40 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767155573;
	cv=pass; b=IRSXZuceNgePvsP8Fyq5UgovED2O65RJdvwCWkF8GtmpNdYXTijQuQX9ZUMCrSdeTkLIypIPn40MJlCeFHn2acEaQ5aP7efvMhJDVQJ7whppcnqaPJAJWJOIwFUE4oN+74EzHi0s0pOm7uB7jfOJyoVRg6j8bVvTprUvAIVH/RwmpzdpyJ8+3OJ8KMUIsY24eZRRLbs5IXq9rIWzyXmo+NXo/GdlcHs1gzhg6EMPArQ+sTplLAxiZIanC59Qzy8OcTBEOmAKXgZawD9jFYsnnYLwJaQPE/zLu+jLrivslDtYSKiJNPTR5nyzSq3ThHh90heWL9nu8cg9NDWOJCv64w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767155573; c=relaxed/relaxed;
	bh=cC7NqMfretSx6G2m7QTG8cQsWZMOPf8BJqIavz7A2pg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cVE6w0NfUzJ7zy0b0kVabrTCtuHUsWBji0h5A/NdCofoI2e3ZtpQZoABu/DMQ5AbdN4DyY7ONGFQB9pRHYoGEnUqGAhhGLRnbh9dWFCOiKMWyJcZZ0AJa4CeIU/Fc7bJvXmvNLFix8FuE4Rnc+22er9tcqiSphRMIGjfW6bDNKFNQVfHbrTAmEtYmhHN5uHQh6iPHDrCcB5qmD2+ycFVopK3ybymhmzN0IEjpn/7qyayXInFhZF8pVaPFF7+lwUMyxD2m1SL9ca2JxlRFVzvIGG1eVrwbjJucYOYsqAxgEhnUZdjxN29dN/XPQqPdN18qm+a/P8HMeLbLZzfM/RJdg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AqDAbYxU; dkim-atps=neutral; spf=pass (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AqDAbYxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgxs10PrFz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 15:32:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UT6GfK3MwFKCjAi55E8ffaHWmuWyC6rUGwhZaeSUlimRp7+IO5/IXoeLsBAZMPHbiO6YmC/PgXzOEImHB8sHcV6IxDWOicL/spECn65DC9buNfeebMP3MlGfTFQ32lQdGiO4pGlCRQY9HtB/SOwac/nXdQR13K+BoygePXEGHZDb0QrVShw98lENzn07p2HiVmXuIOnZHdGzBIwBF6D0sWNz2QOJONCakhwax5ACzy55/sVT9fGYKRGOkSW1dqt5rDXyR6YeRdn95xcN8h1z7Cix6wh6OqKXT5OInnY23mxx7fN9lKxGxU4dHaVRUJeHDnXy8c+kNWWuluzjXkI6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cC7NqMfretSx6G2m7QTG8cQsWZMOPf8BJqIavz7A2pg=;
 b=hZb14CbykjSjANnDTPBjpyaI238V1iXkd5Gu5DzlsBIsW5EfZkIq/8xFhr54Rt5cqluCIcnogM0msjYLUeA051r/U5a7QVFhLwuZgWX7jqyjkCYb2KwpBEwHJnojSoPz8ExQt/oL0bdHkSQZC2LGgzOsxDcsdgqNksh0DdhyupPeXmEqkKmUc/f8psnIuTMafo+lEy3fOE81AV04o4hCyvrDC3A6Zbwhmi/HCXV1vSPCUa8eXtX0T3IjFQp2ykz4HVjdEggWiPJjwrtdo0atmpuSasJtSlda2wrExZWC7x6n2vac5Zet7axetiq8ZGp6h+x4nBQ8EEXUbRAtSLtpYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC7NqMfretSx6G2m7QTG8cQsWZMOPf8BJqIavz7A2pg=;
 b=AqDAbYxUA4tEQnXNN/pFRpDjM+uoba8N4jCaMTK9eFKd/8iXbqzbDwf6q+695glzWv3sVo/vwJvkCpCKJ7vJ/lL+SGD/MNXIIP2Zes5dy8Gu0um63d1SyNRoa2/PJhs9TcidS38KddgJf9saeGUJ8RY+NSL6FhV769aiXui7B5eFxtF9f/L+hTziZSq0IEtZ8/98Cjaw1vQLDehbPucHwsVCCCaHQ/UTXO6ZV4j5OR+mzdr6ffwgey+gNsOHPntCdezGgrlBWi3zqGVODMxA/ObctHPTW3KdISf50jYHb77lp89D8pwEsx27+MPcCoZdbdUPWw8ehUY18y3Fmx4Chw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 04:32:24 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 04:32:24 +0000
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
Subject: [PATCH v1 2/8] mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track device private pages
Date: Wed, 31 Dec 2025 15:31:48 +1100
Message-Id: <20251231043154.42931-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231043154.42931-1-jniethe@nvidia.com>
References: <20251231043154.42931-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5c069e-b1fa-4c8d-bce5-08de48259875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U4v3DvBvhFyPA+dmwI/4zYjcjNSTuPdLmE07gn5zvR0EF2zKJk7riBmAm/4T?=
 =?us-ascii?Q?/huTN6813RD/MnyTSiHLVpxQr8plSxzYZ9nvZQYklL7d+Q1AlHgBx5wp9LAd?=
 =?us-ascii?Q?RJqErMpsYtTtNUyYRYH7f5UFJmPnFNBShsxzpGMoSW00G3d9P4cEu90cCjqP?=
 =?us-ascii?Q?ue195gESkVlm13pOKEcJ/NdXlQ1H9g4mV7qXWaYb6L/musTJDmnYWa4bxBl/?=
 =?us-ascii?Q?uBhGggbKDwv86ZKKWD2peSnFcxQi6BSwmHNjyiNamcP0ZlGgNJc/mQ7vu8fQ?=
 =?us-ascii?Q?Xb/tYnLUg/znVhLFhVeLoGI82D6rPbugdJoXqy5l7XHl4Ux/yyZS0kIp5E4S?=
 =?us-ascii?Q?jHFoU81xGYPdv8GrUBgu+ajxiqh3fohPhR8MLpJysWOR1MLROq2aU0XKpzHk?=
 =?us-ascii?Q?/hQcnqRTWdhQzNRWL+ODb74OfVsF/lk4PfE3nPuc7wpy5TzaIQ+AcOrcnjbb?=
 =?us-ascii?Q?Oo37AfxYxLhnNahDAhmAbmOaD8ivrOCCUbxt2Ubg+GPMwmQr37pqfOUL7BIJ?=
 =?us-ascii?Q?tRsV+vkCeMJoULNdpQgL7Y8rPD9YlXruzfQY01uYTXiVuF6Q7zMg/Q6CPT8y?=
 =?us-ascii?Q?y6CnHReZHgd1oKjH6wyQoujoPRAvDXiVheWHXjfJCDKE63HwYjro0glpwqtC?=
 =?us-ascii?Q?lHsW2mlqxydthXl2wUQkzbMY1ZJweljwa0cZEh7Ue1PRXU8qYfFbK8RyKi5F?=
 =?us-ascii?Q?PQT3FutR8gb/vgpVVSXJerN7Z0no6ALvxXg/WYw6i6fOgNWxPyttoEXnlI2m?=
 =?us-ascii?Q?VJydwgLNNF9m4V/koSad/KWC8rxO9myCPTIoXeUnQy/2qJCWsX76tKA/lALm?=
 =?us-ascii?Q?QjKRcm5jI3ANxEe69KrehChZoVX8QuMagVP9SXL10NA5RACXNY5dko/6P9A4?=
 =?us-ascii?Q?fhbCzZ4ZSF36v+RWb7453ETxML2jjeEMLaZV4F3i0H9TK/nqyzSu8O/d9vax?=
 =?us-ascii?Q?h1zBYJ2PQ0UCHHQgLfZlvLY/Od8zSaqDYZsZYZj5Hl4wY2iL1WreO6QFznbx?=
 =?us-ascii?Q?Qpr4QbBPzeb5NmHTyYwOrFK9Kh3JyGo+SPrflq6Tad9kcgNtVcAcl0cz22Mj?=
 =?us-ascii?Q?AM2B+97Oxd7wk12uONqLLMc+2Gd19gup5aVYkbzPdZMNBIvoYSUZxHnD8F18?=
 =?us-ascii?Q?WPlBsBRvXXAjIgv/egEZ2vpPtjtxdJBx85jkG8hy6D5RNzsb4H5VuW7uKEkX?=
 =?us-ascii?Q?s0303gCFgon3VOsTdP4pPp1FIoIr5gR2oMyT9+cqBgnfGM+m3k39VqAPolWS?=
 =?us-ascii?Q?lrYoQptALc5aKaTjUOfbQcRsMHDgIKGWvhqexs5bMfDKEozekAchHRgFZ1L7?=
 =?us-ascii?Q?1hIDY7d+ArOJ8Ku/rG0pPB9MGFhgMawUayoV3zretT4sFF4zZJB+ZIdKJQlS?=
 =?us-ascii?Q?5LVRDfLIIy3QjwSRGY+YN8dh0n1rInLLA/nNylcO5U9hMMHMIcKB7WGnb32k?=
 =?us-ascii?Q?dKwAt0rW7Htaimeg3oazPcYDzvAz1O/E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VwYqUOILnFotvD+ZUIddhfI/jAlWfVyBc/pCigaSv9BLwOXgjl7InkSfWsG/?=
 =?us-ascii?Q?vc7g5SWcCuaCkG1wZZ3T5tYTuPpmPfAu9gSMlSojAAzFw3xVNFHn5z+X+HPb?=
 =?us-ascii?Q?Dif8vML9NaUHbhUOXmbTLaC+QVbWyjgVpuaiMfFBt8USylaUNPXb7knMamlE?=
 =?us-ascii?Q?yqN14VvPjpritUBnq53lOLDArfqe4ZFlcdj88MqwbhBYbRVBjjQrsqreytHq?=
 =?us-ascii?Q?1fQ2HZ3MUXMdrl15N2QoXZpJjij4j42qL4zABat82nH8XPmSSvJmEzfAXW4T?=
 =?us-ascii?Q?1zYnGjWFeyRq+rUQJEVIVVzVkA9CQUvF2KFrDebarQJCRIAe21QfFMK5K8Oo?=
 =?us-ascii?Q?8WrGUk//oc37IAIBDhowepBnI9nyPcqRX25gueLw3q5b+rR4x6mQoF1cVmzZ?=
 =?us-ascii?Q?Vc6b41TIY0IXvicCwZ5f0Ek4DWLKaHbCu0H2t91OWo2hpAxzHtOUHGcJQ0Bl?=
 =?us-ascii?Q?wqbOXqaOZ2lRFyhL6Bhg2D7UqvQr9drH7rPG0YhLVkCuyL9m5EatcX7z9OwK?=
 =?us-ascii?Q?fwN5E3sghxC5aKodiixzWvSBiUr4Q0BemokP7TBPIexT4qXzbaD1xQ1cNKFi?=
 =?us-ascii?Q?iaCwiYrAf6WybdQWRZds/5k8MHOsuefbfvgLqpg2dpmxtDeQw5lqygy00Emo?=
 =?us-ascii?Q?K/I/Tt0AQA2Rohbec19Gxr76R1S1WraZKtvz3us0gB2CQk/zjuyjkegtLFm/?=
 =?us-ascii?Q?yW2TtGLPpmmZP8ZI/0wUROWpiRNwy/HIRxhDJrXhgo9RkTFl52q4tanOuv71?=
 =?us-ascii?Q?ZgyOwD3vx6UzO+TgvyLgcXZSATvux9eytMAl3/U/R3vQ7dKx1b5stmd4ALcC?=
 =?us-ascii?Q?H7GHm+Ns+qfj0iTqF1pQiBdaLC7qx35ob/NWi4I+uKSHvs8XOPiGEqSInlPf?=
 =?us-ascii?Q?5IWP/pHZHCXhcU3dr4vGc2WGtBmQsoTZbL75EFi+nKmpkXpZBlhQBLnzFgJz?=
 =?us-ascii?Q?YJ0/CjELGJ3sZBqMJr0KV/WEvFO5O2b+XepP0xzAZPY04Y9j66c3Waw4PzbT?=
 =?us-ascii?Q?TkNVm4A4ZUuXsa7197LmT40+RFbqCIOPEOdy3+YhEpHNRPd/PQeK/OSt6dWR?=
 =?us-ascii?Q?2AQQa8RO3P2houzYOwBIk3vI19Iml4hizLDZulE+ewZZbwACNhc0djDW+pQb?=
 =?us-ascii?Q?cEqDjkms5t+ITg5fPi4qiDvekB+PYyQZis7locozycQaqTEqfNCSP1p7BxTJ?=
 =?us-ascii?Q?nywzO9WEB2ME4TJYOVLbJg1j3OSB/Q30QvMTwEMbBsrWbKeMhfKNwbIctExN?=
 =?us-ascii?Q?mh3ncHycpT/2Jsec9oMHOZLpbnJDUHvBT1ihFDXvsUxHscf3gl27dZm4egD+?=
 =?us-ascii?Q?qakHO/1y503w5uCBmmw9jyrgyh0P9+jhq5LX4+jy9/3OBEacgCaj4WvPaZay?=
 =?us-ascii?Q?CtBn5I7vIpuTCKgZsRb6gnmuqnPwhJl86gdKIpyuJ+Xy6yhx4VV+6IxMioRO?=
 =?us-ascii?Q?j41TZR4IFehvSk1gDWJ5ZMo8BunhXNBWB5trldH7IdzgvwZPkHcm62d/D51K?=
 =?us-ascii?Q?mpbmYg818CYizI4+vYiKmr/ryicHSyZdJkrS671cTr28ca6wYJYq13aco3Jo?=
 =?us-ascii?Q?Y6XPLzV5ve1JLV9+zJjMwGKimBW13eKklOq3w+iG4y3cDjdo1ssTv+oL3L2e?=
 =?us-ascii?Q?BKvWW/2AcuNLzu7TmIjZu/7KZBghZLd2uu50/LXeTHtiHtQVK/jP4//AWMwZ?=
 =?us-ascii?Q?liA30aSIuQpe5SOPvahJKswOslHjU6tFdPSK9zjnHHeKg+dOox0DyGGPTIZz?=
 =?us-ascii?Q?wTvClz1Jcw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5c069e-b1fa-4c8d-bce5-08de48259875
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 04:32:24.5223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roheWh9M/UrlDwOj8GIkrprntcB1aV6K7ne8Tf4b0NZSc+DNsTTxzOPlUPAVDO5ha9ho+qfbPmMnlcdfvIGxDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by modifying page_vma_mapped_walk::pfn to contain flags
as well as a PFN. Introduce a PVMW_PFN_DEVICE_PRIVATE flag to indicate
that a page_vma_mapped_walk::pfn contains a PFN for a device private
page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for HMM huge page support
---
 include/linux/rmap.h | 30 +++++++++++++++++++++++++++++-
 mm/page_vma_mapped.c | 18 ++++++++++--------
 mm/rmap.c            |  4 ++--
 mm/vmscan.c          |  2 +-
 4 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index daa92a58585d..57c63b6a8f65 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -939,9 +939,37 @@ struct page_vma_mapped_walk {
 	unsigned int flags;
 };
 
+/* pfn is a device private offset */
+#define PVMW_PFN_DEVICE_PRIVATE	(1UL << 0)
+#define PVMW_PFN_SHIFT		1
+
+static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
+{
+	return (pfn << PVMW_PFN_SHIFT);
+}
+
+static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
+{
+	if (folio_is_device_private(folio))
+		return page_vma_walk_pfn(folio_pfn(folio)) |
+		       PVMW_PFN_DEVICE_PRIVATE;
+
+	return page_vma_walk_pfn(folio_pfn(folio));
+}
+
+static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
+{
+	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+}
+
+static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
+{
+	return page_folio(page_vma_walk_pfn_to_page(pvmw_pfn));
+}
+
 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
 	struct page_vma_mapped_walk name = {				\
-		.pfn = folio_pfn(_folio),				\
+		.pfn = folio_page_vma_walk_pfn(_folio),			\
 		.nr_pages = folio_nr_pages(_folio),			\
 		.pgoff = folio_pgoff(_folio),				\
 		.vma = _vma,						\
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index b38a1d00c971..7fddafed3ebb 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -129,19 +129,19 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		pfn = softleaf_to_pfn(entry);
 	}
 
-	if ((pfn + pte_nr - 1) < pvmw->pfn)
+	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
-	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
+	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
 		return false;
 	return true;
 }
 
 /* Returns true if the two ranges overlap.  Careful to not overflow. */
-static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
+static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
 {
-	if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
+	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
-	if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
+	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
 		return false;
 	return true;
 }
@@ -254,14 +254,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				entry = softleaf_from_pmd(pmde);
 
 				if (!softleaf_is_migration(entry) ||
-				    !check_pmd(softleaf_to_pfn(entry), pvmw))
+				    !check_pmd(softleaf_to_pfn(entry),
+					       softleaf_is_device_private(entry),
+					       pvmw))
 					return not_found(pvmw);
 				return true;
 			}
 			if (likely(pmd_trans_huge(pmde))) {
 				if (pvmw->flags & PVMW_MIGRATION)
 					return not_found(pvmw);
-				if (!check_pmd(pmd_pfn(pmde), pvmw))
+				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
 					return not_found(pvmw);
 				return true;
 			}
@@ -350,7 +352,7 @@ unsigned long page_mapped_in_vma(const struct page *page,
 {
 	const struct folio *folio = page_folio(page);
 	struct page_vma_mapped_walk pvmw = {
-		.pfn = page_to_pfn(page),
+		.pfn = folio_page_vma_walk_pfn(folio),
 		.nr_pages = 1,
 		.vma = vma,
 		.flags = PVMW_SYNC,
diff --git a/mm/rmap.c b/mm/rmap.c
index f955f02d570e..79a2478b4aa9 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1112,7 +1112,7 @@ static bool mapping_wrprotect_range_one(struct folio *folio,
 {
 	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
 	struct page_vma_mapped_walk pvmw = {
-		.pfn		= state->pfn,
+		.pfn		= page_vma_walk_pfn(state->pfn),
 		.nr_pages	= state->nr_pages,
 		.pgoff		= state->pgoff,
 		.vma		= vma,
@@ -1190,7 +1190,7 @@ int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 		      struct vm_area_struct *vma)
 {
 	struct page_vma_mapped_walk pvmw = {
-		.pfn		= pfn,
+		.pfn		= page_vma_walk_pfn(pfn),
 		.nr_pages	= nr_pages,
 		.pgoff		= pgoff,
 		.vma		= vma,
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 670fe9fae5ba..be5682d345b5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	struct folio *folio = pfn_folio(pvmw->pfn);
+	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw->pfn);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
-- 
2.34.1


