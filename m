Return-Path: <linuxppc-dev+bounces-16013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE0D3B807
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 21:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw1l63JyPz2xSZ;
	Tue, 20 Jan 2026 07:09:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768853378;
	cv=pass; b=eLrxrPl9Y98JOHYZoG4h7jlzNcu1gMJRK8cpZ+DbZYVj7zWA2cp1rmokYv9HpTTMm9sQHd+oDf1XJ/ZCJv5ibxuDORGkRdrn7iBkfJ5QPfKVP3Cu9D1AoBz5nUNlDk3XKe27h8gMqqku+TLBLKG5XWhX+ralEz0nMiDdTkbj79XVnxwMAn5PwL3SoVH72q9sQdUeh0zv2z9sUFZCItS7kY+XX/hpidXHMOyDpqIUiGEy3Tq/bF+6S2XrUhFdWC08xoTWoONs4ej8TdLKF4vtd38x6kKF9Y5YVH4jn/1jJBdKuReBXAgLx8cP4aBHguBR6TwWs9UtcVSaCgz59p4w/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768853378; c=relaxed/relaxed;
	bh=5w9b0Wc602lEyDEDt2I9NffLLhHoUR798dqnbTmpvLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IjeeiPCcv80oT9aQjLUXRF/8twUhtOCgpZf58dmpBz4cbvP2dK0tjsDZU+7WjcEpvL04rgH4GBsrcv4K7KZhRQJI1ZKu3lwszt7H01bMlOsaV8BHXGifSN5/miu0ElrUH1/jwkIKeEl1s+egl0YejO2GfcCjh/tMF5Uk/HjS0MvqSFeOUF1G2AQU7NrhjjiTxrkA9bXt2HDY6NYOE/2B9fXShpFR9QjtbRu0lxhXQ+cGTl9Yoz+Zo3RBUSQWD/sDQ7V4QKZdxBwGydXrWb3shYVzG10x70XJRZedp3UhfRbsRulz4SjFnfpeXaWQq2l+rbONzPz726d9C23OjRItbQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hMsV4ilE; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hMsV4ilE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw1l43t2tz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 07:09:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJZQVew/2iqUMzZOG1H/P/IpPZhrtZJrMgLp5/+aPS+h7/qUxBJ1XpxiERPPRfE/hrUPF1kCkQjSwaocI7CQR3vt52eaJQs6TJKJck5ROIkhIiOCyodsUj7qX9aSotpdEVUoPAVm2WUpIVPamCdNgXtYg8/jmu3UW/bJZ9uDxcdao2YQ6vKJkx4SjIhGClLweGFEH6zUPpcfJgqtcmSzdf7Ils/8aYElx+qUDNJJIrF0D6EjqtoEg1cNDWMBnWLgerOIIsM3gmhEnh8Jp15Vz6tt+2h4eXm/+134rCCHvifRGQvrRmA2EoLoFrGD3hZ+Vhcfsrfgw8dbD7GNoR6MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5w9b0Wc602lEyDEDt2I9NffLLhHoUR798dqnbTmpvLY=;
 b=zNpXHL267g5pAFjFoaGXcHIv4mz66o7jEVfZAsCFzsLFDMtc71IpVsflOMYGSGv6AQV3GioPzKZDQaxp9uCod1oqii+VBAZBoR7zyWRfsxZmC1dVxlMV1Xrv8964nHn9zcipBzP2t1KWVpb20+PTCyoJl3ShqEDNhJnar2fwI5iwks+knH8LS9bgUjIfWsAUViSVALsnSfA03R7t5EDMm1EdtsMougYB1oJYj53M96jZ0+C9DQKWyer0jxqQTniuYoSrOvHNOuK4TNtlBB31JLNfuzSLtemgaVnX+c4QWCJBtHgpNefOgPpmaOWvOWQCI7gQkq2uj0e/N4sW0nSxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w9b0Wc602lEyDEDt2I9NffLLhHoUR798dqnbTmpvLY=;
 b=hMsV4ilEM5H3FsX/D+pgpKxZcuo+0+w0ozb5fcXpziLUCtvxe/4ap0FuJJKJpxUzbQLQvBKOFg9fM4Eb1Ghe1YBqxxvMoiywYqMwYsxCLPvRpg9VX2d4bryo2NkLDYpfRRnjp48+x008Tb1yKJSGYcL3ggKfulS+G0f63qHPx39GZyNWtMRiEiCuIzczubDiqj9h5VBBBW1kJy+vWKV4Oq3LdpFLB1Smt+q0TDAYbtghLEfcoB29O3MeRHyiVUG8jovsgVA8yEShM3uADccW+xm859kepG5aUmNiXCtZP+/tYyL2FhvTGwnyt0yatEvq4jC5HrwBLe/LOJMLtDVyHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW4PR12MB5642.namprd12.prod.outlook.com (2603:10b6:303:187::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Mon, 19 Jan 2026 20:09:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 20:09:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>
Cc: Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, Balbir Singh <balbirs@nvidia.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Date: Mon, 19 Jan 2026 15:09:00 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <96926697-070C-45DE-AD26-559652625859@nvidia.com>
In-Reply-To: <20260119142019.GG1134360@nvidia.com>
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
 <20260119142019.GG1134360@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW4PR12MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b5b21f-de41-4716-4579-08de579697e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PcUARg40dFbhF5F7p56TzxUkbCX/uNuyff4Y0mAicP9gUj9gsnJzGECTmRaZ?=
 =?us-ascii?Q?Ltsia3JbJZ5fgZ7uMzJX2xQkyfIclmyCasv6woPl8axB3zrjXepOZzqcvhFc?=
 =?us-ascii?Q?5tp9dQh45eSRPGJL6vksB5v8X1ivHzzZEG+jaj6Ud0I5clmnBOCxAgUGP7C9?=
 =?us-ascii?Q?h4FGHbhS/ZnQGzbyFjLFC6u58+oxxltRWsBtMrXYX5g2lrU7zEbhicC9jU41?=
 =?us-ascii?Q?crN8aVVm+LdZPf5Ga7YDHcvs3Xzb027L84bVZNVfNU9rcqUTW1Z4rcn2m9ZQ?=
 =?us-ascii?Q?qHhFnuaqiNR9IfM6i2qiKESLNks5Gq/zCjMtTqC4RsqZr5Pl5+ItrDj52gO4?=
 =?us-ascii?Q?yZpoPZS9KDB0bL/Pj8SJHRpvrRtoglwhYAW9/K75k7/+3oqDakBGzu1aOucH?=
 =?us-ascii?Q?2XnTPfK5bcUMxtXqgS505Y52UD7dvMlgYHi4VjxSMGSyjUA+wgoTKZEHiFlA?=
 =?us-ascii?Q?Lc19Dty9aInj3WSQZ1QmIflwawYXbW4Ewq3A7vm6f16a/WAZpMQwoaClgqPk?=
 =?us-ascii?Q?CgEn4q8pQgHpW5fQiaFZ0ew7UT/lQ9Y2IDIrCBVDF5smgF177wluENMr52bi?=
 =?us-ascii?Q?m7DgiWOfgNyqaMWACfTZLtYQ3fZ7hQkwRjQRg/EWMwfI/2PEWQzANDstWQ8l?=
 =?us-ascii?Q?qRfmCT1mYSPtjvRjU/w6y+iZKSjk6f//FhYQtGwhjiR3kpCu6uGVtNqgHBXk?=
 =?us-ascii?Q?C6KS2MW0ZN8srUZWSJScAiMypVrkmSqOZGqqA+F/vG+MtvanTJsekTpXN1rF?=
 =?us-ascii?Q?KNVfFB0DpkMS/H8ANrpEOxDglUxl8t3tqmsu6HlhVyo6r5nvaX4ZtwcMnI/e?=
 =?us-ascii?Q?w39SULVFj7lXxfQ4VYpJfpBq91/4bZ0Gwddi2iDB4phTd9N1DB+uqy4/ORnt?=
 =?us-ascii?Q?71leMozWAp8xemX0TyRYtiNYu4S1xQLdygP0AmtqNAzEbOre/gqgLnz7oHp6?=
 =?us-ascii?Q?E954PEDZbCAVRUdSMoZqq54u9bI5MiQQK2zdlVIDR08StlUjxCSdffRVod58?=
 =?us-ascii?Q?Q8/v3Hicf8ncrJxERgGU1cNW0vXe17fd85Epg6+jKzTTmJBucQ8CkzYk+kam?=
 =?us-ascii?Q?bn01zZicQUclZKFCSpMk9i6y9950fuRMgvKnwzr7OyV9jlohM9PxIl/xPf9C?=
 =?us-ascii?Q?lxxGb3aGAreVP8WQuHVUrYRG2JfPRwQWcxp0OrZk4GLqPhll4bZlSLWRIgcd?=
 =?us-ascii?Q?ep3N3iFBZfV0nrsR7kTaW1dVG2GxL/siJK8fBxy1JZXXbIPEAqGzw/0nRnOu?=
 =?us-ascii?Q?q7VZ29zZMUVcwVhBtopfDy9AbuhnHTnC0u77K8HzUA8cX3I4V1U+9aoo8DyX?=
 =?us-ascii?Q?U1prpNUz1p8qAXUVYF/dlxU40Klqt6bKcXdYWh+YH3a9iAkXvdrJ4IqLCF4Z?=
 =?us-ascii?Q?bh4E5xvmi9nKlR5ixYoGdHBcfu7NBt7KePozH7wHJl/YDzfeFNLum9ITdODu?=
 =?us-ascii?Q?CX77ouwigRYzjQU2QCfmtCdZdSMnPtlaXgY1kek94xbHacI4pMeAzKQb+7+x?=
 =?us-ascii?Q?97DJ0C0F4kHOAa2DudoTmHO8wF6MgKJRYS89jxC8H2w/27P4N6eZud74QxnP?=
 =?us-ascii?Q?cAR0P9Ka2+aHBF2amyE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cvIEao9ALLUMICxyHnl1Jlm1tEDJU/nkeOlmCCdh4Sny7+3uEor5w4s7RIS/?=
 =?us-ascii?Q?Bej1kPxvjrdNTybFBXBVw7Q0b7gB1Jub9xgIEIY1yaX4Z0IDsYS2nkP8Q9kM?=
 =?us-ascii?Q?8EGsHUXUW85kBvrsE/KcLD1UfNFTHb4/Ne194yU62Egc4wPv7UsZ5MPTbm1n?=
 =?us-ascii?Q?F9IF0m28zRl4kB09mtxGUtMRwp64cD67ians6BuXMCoUdEx/k5pRFlvSiKi8?=
 =?us-ascii?Q?DANgTKtbF3+zq5GKIrO/tHjOmlzkYCOmhBLDir/AMxaJqyunMKpE6PNG13m4?=
 =?us-ascii?Q?J81JU8FkoQlqEH6lKH6y+R8Osxl+pI1alI3VqtzkE2+91EX6VttN31E7V5hL?=
 =?us-ascii?Q?btDyBaQV6C9yOQBEGs7NO/Uf4YQ7RW+G5/4wBLQXs0JV6h+0H/kE2ueznvRP?=
 =?us-ascii?Q?lmH1EHvITSHu4pH0UXtGxJR8x7wKp7aJJxB+IiF87GMX15b4qIeMtuUXhVG2?=
 =?us-ascii?Q?ao3pkKHA/dTY9ZnFr7n9VrSykODjeminA8q7HgzmUhsiRQwzDUmBWxytyYmu?=
 =?us-ascii?Q?4e0FkY0fDRRiIC+gEIp7sH6AC5BU9ndsmxkFafzuA/YaA2IUYK9P4QGE+gyf?=
 =?us-ascii?Q?wE6qZf5kehIZom+cINKUHUWdBjowPbsMKS/v4+eyIhTQdO3+ijWu1+AmCvzj?=
 =?us-ascii?Q?4NJqB0lBdsiX7gnrFe7A5zrO3IbOpGID76R4pQeG3g4C2680nnw1eF/8lsTl?=
 =?us-ascii?Q?ivk6a75Gb0vBBAv7QGuecfFyzi+Cn2r2ljt46xC4SLnvoMZh/DzYzwQ4mSsr?=
 =?us-ascii?Q?J2P5sUqndVuTIutzPRm270YZzRw4OPz9EQlH7YJKDgbabQzK8tixlMultosA?=
 =?us-ascii?Q?JaO4zqAnOvcNkwAvNYhSnkbTSBq9lPRSjhiR//ywXkn0uB+uPMUlxMxqsKof?=
 =?us-ascii?Q?pxpyUarUAIyucpbq+/uF5CPyZFi59hJxg1fCljb6cEZOj2U/s/AVp57jxqS2?=
 =?us-ascii?Q?7F90DcULyzkg5zdc8VOZImPSkOdOoTAkQgTV5y/+gXN9wLz6wJVM9lJ7BWs7?=
 =?us-ascii?Q?DFq/SaF8rn3RHDQguBb2lTNpKnGAy5KgQCQB487iSHHqMPJoMnW0XPXBpxmZ?=
 =?us-ascii?Q?H1EOk1ndshxb0EWMgQ/efREFV9iEI6MC93Lbtln08dUTCXQX6gnFu04X7WxV?=
 =?us-ascii?Q?/XIkebAjuq6M3NASNS42tJ0MhYjcDGrxLar8y81PwW0A1Cl2JXDm5+XYf6f9?=
 =?us-ascii?Q?1UXhYS4ULteE3hpGJXJEWAoEWVEfmZazTzRcINqTFRMokxiOLi7MB6p1IhZP?=
 =?us-ascii?Q?4V7SMy7/IAwXZbZIXlsD3yUbH/bMszK4AwGCxsq2NYVx5QNg1ZZZMoXoqAiS?=
 =?us-ascii?Q?4/R+ZIefcHUhJJjO66rLft/D6qv8V4VKGU3rw8fw0Q06q90mf03vQseTshN3?=
 =?us-ascii?Q?xGrHCr2jAW34Ao4V2mV5bhNVS12uPmKLt8PfHxGQbc0RRRvnaW1qidKoglUO?=
 =?us-ascii?Q?sBcTGRk/DwFeLEq1NQcovinAYauZ1CkHnoweoQxuCf9YYBLFgt5Op6aJa4Wk?=
 =?us-ascii?Q?1mb1QJK+q77fqK9L2WRJSbIS/REsRFgSj+0C40lqxs3Nvdk4KP03MY6v8vwZ?=
 =?us-ascii?Q?6k0/Tsy2yn+plMAXgDqJDMZDJl4cYkF3FcuW7vye37840RH/OahcwRU2c/vz?=
 =?us-ascii?Q?03TeE+iYriTrGzM7Ps3nVP4pLG4qmUi3jyyd6qrG2oQm1PkdYyT3Y9Lq5gfa?=
 =?us-ascii?Q?BO026pCr4ebpdFYUcQYdZehs/SzKgu0xwvToCToFZbzbiCls?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b5b21f-de41-4716-4579-08de579697e7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 20:09:04.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+0h4q1nCIB9UIOu9klgtW7PtqfipbwGmO71cxSf8zcWCCf0sUAArD6Q9itNUNs+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5642
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 19 Jan 2026, at 9:20, Jason Gunthorpe wrote:

> On Mon, Jan 19, 2026 at 04:59:56PM +1100, Alistair Popple wrote:
>> On 2026-01-17 at 16:27 +1100, Matthew Brost <matthew.brost@intel.com> =
wrote...
>>> On Sat, Jan 17, 2026 at 03:42:16PM +1100, Balbir Singh wrote:
>>>> On 1/17/26 14:55, Matthew Brost wrote:
>>>>> On Fri, Jan 16, 2026 at 08:51:14PM -0400, Jason Gunthorpe wrote:
>>>>>> On Fri, Jan 16, 2026 at 12:31:25PM -0800, Matthew Brost wrote:
>>>>>>>> I suppose we could be getting say an order-9 folio that was prev=
iously used
>>>>>>>> as two order-8 folios? And each of them had their _nr_pages in t=
heir head
>>>>>>>
>>>>>>> Yes, this is a good example. At this point we have idea what prev=
ious
>>>>>>> allocation(s) order(s) were - we could have multiple places in th=
e loop
>>>>>>> where _nr_pages is populated, thus we have to clear this everywhe=
re.
>>>>>>
>>>>>> Why? The fact you have to use such a crazy expression to even acce=
ss
>>>>>> _nr_pages strongly says nothing will read it as _nr_pages.
>>>>>>
>>>>>> Explain each thing:
>>>>>>
>>>>>> 		new_page->flags.f &=3D ~0xffUL;	/* Clear possible order, page he=
ad */
>>>>>>
>>>>>> OK, the tail page flags need to be set right, and prep_compound_pa=
ge()
>>>>>> called later depends on them being zero.
>>>>>>
>>>>>> 		((struct folio *)(new_page - 1))->_nr_pages =3D 0;
>>>>>>
>>>>>> Can't see a reason, nothing reads _nr_pages from a random tail
>>>>>> page. _nr_pages is the last 8 bytes of struct page so it overlaps
>>>>>> memcg_data, which is also not supposed to be read from a tail page=
?
>>
>> This is (or was) either a order-0 page, a head page or a tail page, wh=
o
>> knows. So it doesn't really matter whether or not _nr_pages or memcg_d=
ata are
>> supposed to be read from a tail page or not. What really matters is do=
es any of
>> vm_insert_page(), migrate_vma_*() or prep_compound_page() expect this =
to be a
>> particular value when called on this page?
>
> This weird expression is doing three things,
> 1) it is zeroing memcg on the head page
> 2) it is zeroing _nr_pages on the head folio
> 3) it is zeroing memcg on all the tail pages.
>
> Are you aruging for 1, 2 or 3?
>
> #1 is missing today
> #2 is handled directly by the prep_compound_page() -> prep_compound_hea=
d() -> folio_set_order()
> #3 I argue isn't necessary.
>
>> AFAIK memcg_data is at least expected to be NULL for migrate_vma_*() w=
hen called
>> on an order-0 page, which means it has to be cleared.
>
> Great, so lets write that in prep_compound_head()!
>
>> Although I think it would be far less confusing if it was just written=
 like that
>> rather than the folio math but it achieves the same thing and is techn=
ically
>> correct.
>
> I have yet to hear a reason to do #3.
>
>>>>>> 		new_folio->mapping =3D NULL;
>>>>>>
>>>>>> Pointless, prep_compound_page() -> prep_compound_tail() -> p->mapp=
ing =3D TAIL_MAPPING;
>>
>> Not pointless - vm_insert_page() for example expects folio_test_anon()=
 which
>> which won't be the case if p->mapping was previously set to TAIL_MAPPI=
NG so it
>> needs to be cleared. migrate_vma_setup() has a similar issue.
>
> It is pointless to put it in the loop! Sure set the head page.
>
>>>>>> 		new_folio->pgmap =3D pgmap;	/* Also clear compound head */
>>>>>>
>>>>>> Pointless, compound_head is set in prep_compound_tail(): set_compo=
und_head(p, head);
>>
>> No it isn't - we're not clearing tail pages here, we're initialising Z=
ONE_DEVICE
>> struct pages ready for use by the core-mm which means the pgmap needs =
to be
>> correct.
>
> See above, same issue. The tail pages have pgmap set to NULL because
> prep_compound_tail() does it. So why do we set it to pgmap here and
> then clear it a few lines below?
>
> Set it once in the head folio outside this loop.
>
>> No problem with the above, and FWIW it seems correct. Although I suspe=
ct just
>> setting page->memcg_data =3D 0 would have been far less controversial =
;)
>
> It is "correct" but horrible.
>
> What is wrong with this? Isn't it so much better and more efficient??
>
> diff --git a/mm/internal.h b/mm/internal.h
> index e430da900430a1..a7d3f5e4b85e49 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -806,14 +806,21 @@ static inline void prep_compound_head(struct page=
 *page, unsigned int order)
>  		atomic_set(&folio->_pincount, 0);
>  		atomic_set(&folio->_entire_mapcount, -1);
>  	}
> -	if (order > 1)
> +	if (order > 1) {
>  		INIT_LIST_HEAD(&folio->_deferred_list);
> +	} else {
> +		folio->mapping =3D NULL;
> +#ifdef CONFIG_MEMCG
> +		folio->memcg_data =3D 0;
> +#endif
> +	}

prep_compound_head() is only called on >0 order pages. The above
code means when order =3D=3D 1, folio->mapping and folio->memcg_data are
assigned NULL.

>  }
>
>  static inline void prep_compound_tail(struct page *head, int tail_idx)=

>  {
>  	struct page *p =3D head + tail_idx;
>
> +	p->flags.f &=3D ~0xffUL;	/* Clear possible order, page head */

No one cares about tail page flags if it is not checked in check_new_page=
()
from mm/page_alloc.c.

>  	p->mapping =3D TAIL_MAPPING;
>  	set_compound_head(p, head);
>  	set_page_private(p, 0);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 4c2e0d68eb2798..7ec034c11068e1 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -479,19 +479,23 @@ void free_zone_device_folio(struct folio *folio)
>  	}
>  }
>
> -void zone_device_page_init(struct page *page, unsigned int order)
> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgma=
p,
> +			   unsigned int order)
>  {
>  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> +	struct folio *folio;
>
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().
>  	 */
>  	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << ord=
er));
> -	set_page_count(page, 1);
> -	lock_page(page);
>
> -	if (order)
> -		prep_compound_page(page, order);
> +	prep_compound_page(page, order);

prep_compound_page() should only be called for >0 order pages. This creat=
es
another weirdness in device pages by assuming all pages are compound.

> +
> +	folio =3D page_folio(page);
> +	folio->pgmap =3D pgmap;
> +	folio_lock(folio);
> +	folio_set_count(folio, 1);

/* clear possible previous page->mapping */
folio->mapping =3D NULL;

/* clear possible previous page->_nr_pages */
#ifdef CONFIG_MEMCG
	folio->memcg_data =3D 0;
#endif

With two above and still call prep_compound_page() only when order > 0,
the code should work. There is no need to change prep_compoun_*()
functions.

>  }
>  EXPORT_SYMBOL_GPL(zone_device_page_init);


This patch mixed the concept of page and folio together, thus
causing confusion. Core MM sees page and folio two separate things:
1. page is the smallest internal physical memory management unit,
2. folio is an abstraction on top of pages, and other abstractions can be=

   slab, ptdesc, and more (https://kernelnewbies.org/MatthewWilcox/Memdes=
cs).

Compound page is a high-order page that all subpages are managed as a who=
le,
but it is converted to folio after page_rmappable_folio() (see
__folio_alloc_noprof()). And a slab page can be a compound page too (see
page_slab() does compound_head() like operation). So a compound page is
not the same as a folio.

I can see folio is used in prep_compound_head()
and think it is confusing, since these pages should not be regarded as
a folio yet. I probably blame willy (cc'd), since he started it from comm=
it
94688e8eb453 ("mm: remove folio_pincount_ptr() and head_compound_pincount=
()")
and before that prep_compound_head() was all about pages. folio_set_order=
()
was set_compound_order() before commit 1e3be4856f49d ("mm/folio: replace
set_compound_order with folio_set_order").

If device pages have to initialize on top of pages with obsolete states,
at least it should be first initialized as pages, then as folios to avoid=

confusion.


--
Best Regards,
Yan, Zi

