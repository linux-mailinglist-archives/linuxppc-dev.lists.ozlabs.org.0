Return-Path: <linuxppc-dev+bounces-15995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28560D3AB8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 15:20:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvt0h2LBqz3bhG;
	Tue, 20 Jan 2026 01:20:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768832452;
	cv=pass; b=BmBCsiSahV3crfveXh74y8EeAEhYSDX3631Tiqm/1NR7fYEea1WtoYf/1oODgRgPgRpkcdO4wcPwN7kJZ8IYPwpLeJ6wz19VmZ4Ty2GhVNRMaAx8pfDjBub0WOZ09B+ksRvtMI7qXj06SD5B44JgXr8xYF+dUS7mtlD/gStYYJ67oQalqH9z8HhPnY0aH156P3tlJEjbRTNckuEhWIsubupVE+1JBE5TXYnqBbfPolNGfIajV4qExNcMjMiWC+bVEN2pfbN0FSIVVHrew/X45bOmq9mTgXCJUjgfuaw69uctZsz+42VmiV6qPfhI0cWrNzXLIzT3ppYLLg9A2w8MQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768832452; c=relaxed/relaxed;
	bh=iCNnr7NUjm5/1nDgaPXZZoWC+17OmNd33pf1v65MhW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BtC90dq2Nv4AWaVfgv80P/fuRFE6i8Ioq7qtvUFl5ht903nI6v+Ml0l3EQNl9TSAMfPqJjBoXAJkCE1W/eiXFunbEpYXEQNUoiKlpaPVOvp6tR2cn7KIIzro1zy9rEssZ4jf/Ad2VxdUx3PGR7aHrTltoaCwIfwKxc5zAdKgplY3pyHvVjZhgmU8S+hcvdVvciY8jaccmR7+wgctJEZowgnRAtF8SLe4QKAMl4LpqAGDn7mF78ipK7jaL9zXV9CpEnNK1bLHYO32LzYXWLhFVbtk3U5H0feR9ZGMQuUqM7imuxkXHGXxgKAo1umQEBCWQOKTrgUTqiLqZfxWEv+/hA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WOs3lDaS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WOs3lDaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvt0f68gPz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 01:20:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ycl8ZvOEjkMFTNMNRm3aDOFR2u15apMVmA7LQbHP0PS7K0nMdlXbqA2tZNxYv/Y5ogYkCjR/tAowYOkU1IfD05IzBczdj/DxDN2jZxkyP97ep4fsK/yZ0MHKV8PVhXTmkIvcFkvhaPSOV1MbPiC7be7jMhKOnayucP5iRHMw8SFvMN+4M8yHiAXpJXg44oIWDVXKbFk/PGWQJIa8E+NjgHDnC5nufIMsjz2mh6MAAPzGii3ANnYrdLaRVuOgaHP/HWKlQ8OpnnmlmPgIABe3zReNMFi/MO00Rr36cTh3+8r8zZ/RP3HhskMzsq+BIMahWours7RtqRwrAayfjQI6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCNnr7NUjm5/1nDgaPXZZoWC+17OmNd33pf1v65MhW0=;
 b=RgsVKqxbYMjwBbP8/ftRaE70cISRmSvgU9g4iEgN5cgtaoYm7MHOt4VnNHZSv8RrFm2IOt7TvFlgj/3LRVtLWQwUXbuS84NyZqjJJG7T/s+uck6UF+W5/aE/+2sOf7KERJz3dVh3ladhJaN5NZIaG8ZEowgy3UanXnNwzq+roi3ecDIRfJ8ZGnsqM1ICfDcXlocogovyrTKGgVijN0wv+Oj153u6s5VA6Yc4lc/KIyeB6ClEA/FoxBbgqmJtd65F6M6gUAemNGD5h5QdZz5DaMmH7aA5qpO0/dUmwbQJHgYCbCWo79pgK2fl6LJxDGZF2qYxHU1OgrlYh2aL0apCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCNnr7NUjm5/1nDgaPXZZoWC+17OmNd33pf1v65MhW0=;
 b=WOs3lDaSdVVavS74MwtJ5kHFM0FCdHYFjpJ9UXnq+E9vqLsC+kqQ1zmOhqVRgwY3S/u+u96CCccUYm5JYygbU2hMvxeaG8rR9oF4XagssFKpA3p2bhwZIs6FpMHRj2QAGMqNwDqskGRx9ZyS1FTplNLdhYmzqlceg0Put6YGD9izykKt6oRrrCVu1+NQX39W57w8vDfPd594kpWf2CUzdjvabK1t7gnEIVA0G2RUy5OQY+8KhChauk2Q6apH5yfHOcTXs/koEAl3v2qJA0th9euUL8+Fx+OOPG48wwjJuAbVnrHbsvhsXxftVqOpBUjBEdEdZ4WOve+laOIHFtt8ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 14:20:21 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:20:20 +0000
Date: Mon, 19 Jan 2026 10:20:19 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Balbir Singh <balbirs@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Zi Yan <ziy@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260119142019.GG1134360@nvidia.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
 <20260117005114.GC1134360@nvidia.com>
 <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
 <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
 <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
 <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
X-ClientProxiedBy: MN2PR14CA0007.namprd14.prod.outlook.com
 (2603:10b6:208:23e::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 0090533b-3dc0-4c52-06ad-08de5765e0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LoEN0bw0YS9QODI+HLd0i6RV+fi6M6ZIgolk8Cp/x2iU3hTg6SdG4YBbK/FV?=
 =?us-ascii?Q?4XxBQkFRFBB9vsupBtulHg3ykdXtq/ECXZErkIsTBjPLHPjrvXTf9wsLX30E?=
 =?us-ascii?Q?dywWvmrtumGTm+ETZ1+oi1XJr49Ldlz/4PJJgM28WcNd65e1cYpl+3H/2VgU?=
 =?us-ascii?Q?9L0bhblRGA1EnjeQVLvQYTIC/mkGT48As0ggBg+ce0kjp45P9Kst6pljBCDJ?=
 =?us-ascii?Q?NTIxZDc7LCXcVbn8TAd7WpkOt/j7L7CZxSo+wySNtD6zdEm9ldjuc4n3U4al?=
 =?us-ascii?Q?bdg5FB+eIqzzaF1IK14AuRQfwwSS3BR4KvSDLN6hLitY07Wol3wWukktEaQH?=
 =?us-ascii?Q?J9yUWZUWHs37y7VB7fFJa1lWC+maXewmkSfl8XSizNxLpxX4KpDccAS3KInH?=
 =?us-ascii?Q?NPFEaznPHnmupRP/RiFxLFq5NsaopXC2ClzWhRzwOtG/eRomtcHOd+NLEcLQ?=
 =?us-ascii?Q?J0Bm1uugInxcGkCFwoVyN0XkCF6JGAjUTLzsYVzgGgHV7eUi0KZ+IFICAO9u?=
 =?us-ascii?Q?3+ILL+Sd+EkbOOuMuq/rPZbc5Kpn25mP3C5+kRdp2gwzV7gE5K8p3omWFZP1?=
 =?us-ascii?Q?NFRPlJdmDOlLQ08KAy312GXQntpHb94Hr4zAP8THNOgMvr1r7KifTDkqZtST?=
 =?us-ascii?Q?hMLJI9RaSopGF6hI5vLN0rEOYbjM8ttLNMvrBt+eeZ9qGANbfXPmKPt48yud?=
 =?us-ascii?Q?wuGJT1+aswfYzqI6p+DlmLFMPc4wA1N259paS8Bq6ebyI5vyaqJcr2nFzYjC?=
 =?us-ascii?Q?wEuIuuORj0cfg5weZxNrcUWhRiG5RvzqJk930ghPpXdS/sfBhWkJrghAsZbL?=
 =?us-ascii?Q?tRkaneE34K/3d05Yp3X9Kl52LxxCbeP7qNGsRnK8GW0zFCw4je8WGqqbeIKm?=
 =?us-ascii?Q?zcrSxjgdS323Eu4CQxbZzY0XNoDr4LpIiOjgT1/HEEO63fvQOdX/dIFnCtng?=
 =?us-ascii?Q?2OlxaY6xNrL8SXnFHTr5oVsHfy36wPajkmY7R7gjG3Ms0TZchqX8VbDR0fwP?=
 =?us-ascii?Q?NFyd5oVysHwqHS6fP5ZjhAEeRCsjClZzDepVq50bW5lVJKms95aL9An6dEKw?=
 =?us-ascii?Q?1xPOGcWXd9U0dcGVk63EU82ol0tDhvkgjdUM91W/A5QnteqCcHscB2Zy2NQY?=
 =?us-ascii?Q?Zzx7tdcJfJpz4nc00l5Y0ub49C81OBAtwj0A5fx4F02cNCE4fwtsxah53OLg?=
 =?us-ascii?Q?0yDJinRE2mNoKIqt7WtvN+rDnmV+eCEMnhAZkhCiUh3zk8TbSjOmvWEJmyLI?=
 =?us-ascii?Q?4DFOv6cVyx4J7MmQNPpD5d6AfIEt30MgMaSVulWTivxnDM9rZjPrbNdffTi8?=
 =?us-ascii?Q?7u6UO9H0SbwdQDsEk1+2nfOO63dzWZVC/mXU5fgr17v4pI/HSQwwxkoOPV2D?=
 =?us-ascii?Q?F6dMQdxh1V1ZesfBn0DSQksdD6FPwFhROjlPfCdTN2RDKQ3lgYBOUpwnmpi/?=
 =?us-ascii?Q?ZtAFWXRRMvHtso5G+IVdikW4jKZ/ozZZ6nC0VSGB8uO5V9lEqTyrZN3Wm/oe?=
 =?us-ascii?Q?MSN3vw8Z4rvjll3x7MX0QZQaMsGkYdtI/5qbuS99AggxCjdLrzXstASv0YJg?=
 =?us-ascii?Q?eDBF9XWFfZcr9VOqkzM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yZiOPg9xsIusNXWKYrcMlAkd//pisBeQtzjIy2wQNOxFeT3S213+qnBqdP9o?=
 =?us-ascii?Q?kq7jOOLSRZx25oVCQCu/WjAALBMNcUmI2tP+IMdruuEzvY2i9t9nhFbxFa+U?=
 =?us-ascii?Q?momjG4yGw6KQJpwKgdUPEFlJeXzYDc8VaxZRrlF4UKqj5IoPZyHjcQ/rK0nQ?=
 =?us-ascii?Q?UEltPwKfduUif1w+cdZCv1VIxDrUaH4n0pwdX6EXagIq016+qsxivTZmT/p7?=
 =?us-ascii?Q?1g0v8a3/p+X8M/lwsxBsp+lya2ME4t8Mh/S1SU10oq2Xt16YKQinooCYni+b?=
 =?us-ascii?Q?KtclZPVuFTxzWhE+0RykC+3I3Gg0Vz9zMjM1ou5Pf7S7vzucZlcNZSdq6w6q?=
 =?us-ascii?Q?HSNEYIaUzfhBwCasBKOpcMa2+cfwf1JPFFUkElgxU+n2iGpxhJ+Hn5ZCBVWS?=
 =?us-ascii?Q?t4o8UXtniK4HaKj+gpmqZSbp7B34WmpqBSkb8BICDpjoyiGWNzaKWNCQhzL0?=
 =?us-ascii?Q?IzOjIFH+lSY9pMx1YJWJQ7Zm0Y5nazVffDDYgKsc96ydzIeu05+6Q4tZdmWZ?=
 =?us-ascii?Q?8mVhP8+byWqLUh3YDpPtP3Hrm8/M3wAYvmgtBWhaQFq4l+rw3CTlhlKu75gs?=
 =?us-ascii?Q?UyDOTnJBH6OF0q0Vgn5gHlSmfV9pz7jW60s9aodTaYg+tAz9dbZKRemTxjmZ?=
 =?us-ascii?Q?50yaI7tg7/+H5tOf/Qhs3w1N5KMY/8L87e6YXnhgvdvk5Rc6nAF6+roeUtEb?=
 =?us-ascii?Q?o9alh4qEd6V/2FDw49/jUVO4xCMGoY65lYCRlfFbFVPM6pMCGHakxPDa6he0?=
 =?us-ascii?Q?r8nX9erU4mfd7pWZOJJi40DHFEOXkrVp02qIDiK5rzeYEcINFfBmFP32hdWR?=
 =?us-ascii?Q?seXcCBuP25wss4QFsJrYL7zUOacbFBhIvV2RfWlRQrvpHE1aazGRCaBqHgR4?=
 =?us-ascii?Q?tbchTcPj80EDEwjSu8m+OZqma5xd4U3RRZguQGYKuwyDY4LqylGj5Z75xE/n?=
 =?us-ascii?Q?aIauAR7mf6HV3cUPpTAEWMJx8k43GJW0CSYKFkhlpMb4ttpZZ+lnqR1lVYOJ?=
 =?us-ascii?Q?+bQbx3FrMDDd7lEkcF0Byb5eLcMVtm0704dLyxvwAnz8obvDbao1N1iMGftO?=
 =?us-ascii?Q?rEy+SI6haRBNrOp6S6yAXhybstydtKLMMtKiYkD2c2l9doYX/tS9RbuQW6bR?=
 =?us-ascii?Q?b3yjyfPmnIQcfICdNX9rPDF3Luxu08DsDWywoHWMdoQZZr7dnkwufkNWQdch?=
 =?us-ascii?Q?8GEnyh2jGviWKEvWU1/rYr8Epz4GDUG7tvZgFHRUfMo+TdyWXjeAsvcpgipv?=
 =?us-ascii?Q?qvJDG49waxkLEssgVN2VmDwyFtYqD3/quxpMh2VuM/zYU1UXo273rNyHxxvR?=
 =?us-ascii?Q?4xcU4OkXhJirZP7Y/4Vr6804tLKJp+Y/ROfDXtySzVphxrVThAGmWa3NcEOW?=
 =?us-ascii?Q?0kqwvHhEExrPKXQUwl0yFI3MQQBkt/POI3rvaZnUObQl1eIRmf9ZZLM28wG2?=
 =?us-ascii?Q?vCABytuzxpK3B/UVNiVhjKI5Ie0J9aZl+zsyDli0KAztNlvkSEaJIWlqDwqc?=
 =?us-ascii?Q?Q6WwTbS/F3ThoKEGoOBTg5rTgqUkgsVIR/RAkpC1HL1/REoS6tY/B0rMpm4E?=
 =?us-ascii?Q?41tgJ2YvnLFRXOwgf8t+VPo7fdk9Jn0dW8LVLNQu8LfcGJqKNAoLqq6XxTlo?=
 =?us-ascii?Q?pgx+9ec4tTah96exu50roD1tAUYXhoHtSZkxBpaWXkpq8oTolgJp/3CO/ynM?=
 =?us-ascii?Q?qEnr32tqo5VNwPbWmOvuXDoEVqtaWtDy7LxCVu1DvKC1Mkqj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0090533b-3dc0-4c52-06ad-08de5765e0b5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 14:20:20.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TOulGg/0Qeus+stAinh5JODxd5DbewXniOsPQ6m+fCqqlLgh67kJabR2vwgZZ1+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 19, 2026 at 04:59:56PM +1100, Alistair Popple wrote:
> On 2026-01-17 at 16:27 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > On Sat, Jan 17, 2026 at 03:42:16PM +1100, Balbir Singh wrote:
> > > On 1/17/26 14:55, Matthew Brost wrote:
> > > > On Fri, Jan 16, 2026 at 08:51:14PM -0400, Jason Gunthorpe wrote:
> > > >> On Fri, Jan 16, 2026 at 12:31:25PM -0800, Matthew Brost wrote:
> > > >>>> I suppose we could be getting say an order-9 folio that was previously used
> > > >>>> as two order-8 folios? And each of them had their _nr_pages in their head
> > > >>>
> > > >>> Yes, this is a good example. At this point we have idea what previous
> > > >>> allocation(s) order(s) were - we could have multiple places in the loop
> > > >>> where _nr_pages is populated, thus we have to clear this everywhere. 
> > > >>
> > > >> Why? The fact you have to use such a crazy expression to even access
> > > >> _nr_pages strongly says nothing will read it as _nr_pages.
> > > >>
> > > >> Explain each thing:
> > > >>
> > > >> 		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > > >>
> > > >> OK, the tail page flags need to be set right, and prep_compound_page()
> > > >> called later depends on them being zero.
> > > >>
> > > >> 		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > >>
> > > >> Can't see a reason, nothing reads _nr_pages from a random tail
> > > >> page. _nr_pages is the last 8 bytes of struct page so it overlaps
> > > >> memcg_data, which is also not supposed to be read from a tail page?
> 
> This is (or was) either a order-0 page, a head page or a tail page, who
> knows. So it doesn't really matter whether or not _nr_pages or memcg_data are
> supposed to be read from a tail page or not. What really matters is does any of
> vm_insert_page(), migrate_vma_*() or prep_compound_page() expect this to be a
> particular value when called on this page?

This weird expression is doing three things,
1) it is zeroing memcg on the head page
2) it is zeroing _nr_pages on the head folio
3) it is zeroing memcg on all the tail pages.

Are you aruging for 1, 2 or 3?

#1 is missing today
#2 is handled directly by the prep_compound_page() -> prep_compound_head() -> folio_set_order()
#3 I argue isn't necessary.

> AFAIK memcg_data is at least expected to be NULL for migrate_vma_*() when called
> on an order-0 page, which means it has to be cleared.

Great, so lets write that in prep_compound_head()!

> Although I think it would be far less confusing if it was just written like that
> rather than the folio math but it achieves the same thing and is technically
> correct.

I have yet to hear a reason to do #3.

> > > >> 		new_folio->mapping = NULL;
> > > >>
> > > >> Pointless, prep_compound_page() -> prep_compound_tail() -> p->mapping = TAIL_MAPPING;
>
> Not pointless - vm_insert_page() for example expects folio_test_anon() which
> which won't be the case if p->mapping was previously set to TAIL_MAPPING so it
> needs to be cleared. migrate_vma_setup() has a similar issue.

It is pointless to put it in the loop! Sure set the head page.

> > > >> 		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > >>
> > > >> Pointless, compound_head is set in prep_compound_tail(): set_compound_head(p, head);
> 
> No it isn't - we're not clearing tail pages here, we're initialising ZONE_DEVICE
> struct pages ready for use by the core-mm which means the pgmap needs to be
> correct.

See above, same issue. The tail pages have pgmap set to NULL because
prep_compound_tail() does it. So why do we set it to pgmap here and
then clear it a few lines below?

Set it once in the head folio outside this loop.

> No problem with the above, and FWIW it seems correct. Although I suspect just
> setting page->memcg_data = 0 would have been far less controversial ;)

It is "correct" but horrible.

What is wrong with this? Isn't it so much better and more efficient??

diff --git a/mm/internal.h b/mm/internal.h
index e430da900430a1..a7d3f5e4b85e49 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -806,14 +806,21 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
 		atomic_set(&folio->_pincount, 0);
 		atomic_set(&folio->_entire_mapcount, -1);
 	}
-	if (order > 1)
+	if (order > 1) {
 		INIT_LIST_HEAD(&folio->_deferred_list);
+	} else {
+		folio->mapping = NULL;
+#ifdef CONFIG_MEMCG
+		folio->memcg_data = 0;
+#endif
+	}
 }
 
 static inline void prep_compound_tail(struct page *head, int tail_idx)
 {
 	struct page *p = head + tail_idx;
 
+	p->flags.f &= ~0xffUL;	/* Clear possible order, page head */
 	p->mapping = TAIL_MAPPING;
 	set_compound_head(p, head);
 	set_page_private(p, 0);
diff --git a/mm/memremap.c b/mm/memremap.c
index 4c2e0d68eb2798..7ec034c11068e1 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -479,19 +479,23 @@ void free_zone_device_folio(struct folio *folio)
 	}
 }
 
-void zone_device_page_init(struct page *page, unsigned int order)
+void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
+			   unsigned int order)
 {
 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
+	struct folio *folio;
 
 	/*
 	 * Drivers shouldn't be allocating pages after calling
 	 * memunmap_pages().
 	 */
 	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
-	set_page_count(page, 1);
-	lock_page(page);
 
-	if (order)
-		prep_compound_page(page, order);
+	prep_compound_page(page, order);
+
+	folio = page_folio(page);
+	folio->pgmap = pgmap;
+	folio_lock(folio);
+	folio_set_count(folio, 1);
 }
 EXPORT_SYMBOL_GPL(zone_device_page_init);

Jason

