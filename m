Return-Path: <linuxppc-dev+bounces-15926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F44D38793
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 21:31:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtBMy6w1Gz2xnj;
	Sat, 17 Jan 2026 07:31:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768595502;
	cv=fail; b=j5gOr1ivKK5GbjH6MwGrU+7Vyp4MjgM1OCitqJx4J9ngO1PkPRTuRdgNU40RrU0vW10hDiKIndUfMuyrYEzP0W1qITxjtSWu+ydf+dOpkzD/3l90bgaku4sBpRS9B+7fxKP4VEzhjFqxf2E7Ua+cUOWZ0ZzWc9a4JNZd1Ukg7evFirz+8ewcEvWpUsdOnvvHPgjGVxV+nWKjjz/6sejb5Pd7ONnoylR4tsj1xnX6kkeQ3GfMsiT/89HNMk9/fxA5E56tNPpPMHd/4aiK74GypuMwrCfhignyOkqWDDeW+CuAcoWxdQt5KWqg3yF/qSdvhJM+st3HLYdNlTpyk49lfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768595502; c=relaxed/relaxed;
	bh=IlkldRTJVR/iN9f1jSUsuC/lIzGC4K1jFyV3aFbHMY8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fWYhfkTJVWFW+kwaeEWyPXzYgiO+w2UaEvOfC9DWgGNlqWLRtGardQUAgamTwgBwXXEfBm+yZFS8IhjiwIhnyXjyOK+Ls6xSIprPGGbU6xUkNHoBss095arEfZ/rQgI5I1Z7YW9uUYsWABvYwDrwQRQoujfpyaIKT4cE2vhhQfB5Bf7Os6Mbaivfl1Jgb+CD7htDhtC9jleKpI2uVWx9cTZOKBgAL/FwqLIvMbS3I4KgTUkPNiWrIl6mCUWafrUhmpyVMfXwpiUFP82++Nj61UN2rDQegupOzZlAmvf6/3IqEk1lPNQ3zQpXV47YfbVfh7jfPXDDhPB8NkMiQFTYOw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4h/i/uc; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4h/i/uc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtBMv1dCsz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 07:31:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768595499; x=1800131499;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zRHXSgARWcD/IC0qIgx37ArrenTaWSjTdzkCe9X4i4M=;
  b=k4h/i/uc8JWZnrhAkGhurk7InPbGTA+a7J0ahCBWQo0f37blSZ6tJIs8
   v+79h2tH9HSu4HDZxgUSg9ZgGRFRlTITOJdOGFccVy5j1o03HbLFZXMvo
   wrXPsDNn1tvofLF6GL2TyrCj6TqoatAc2CczgXrSsnu/T72hz445cxoAi
   Lf7jAcFR5WsZpiOFwKjix8x92+69rgCcD/nLNjB4NOaqeqVx5WhAWEngA
   R3s/7slJg/I8EjlNXH/m7geTW21a333VdjoloaVbR6eBOPEXIxWbzjawB
   NWdP6BmJhUAS/JWu8swly6sHkkMPjjjSntpOTnveHE4hK/cGL5NC3u7WV
   g==;
X-CSE-ConnectionGUID: G8iYDwmbTZGQE/KvBtbfPA==
X-CSE-MsgGUID: MqC+qCglRPSNuz9uAP1ssA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69963376"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69963376"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:31:34 -0800
X-CSE-ConnectionGUID: 3V2xLr1yQaKAB6WymuIOZQ==
X-CSE-MsgGUID: jcif5qcJQ1qbp6rRJT/nqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205764368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:31:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 12:31:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 12:31:33 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 12:31:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gi0xq/cd6v74GopVtdKQ3FvDplfmRX2g2s8icsTheJBKzUYlBl0ouXMD+qk2Rtj1MgJRGP6U2udDhiXN9W9MNNTL66HeyoBAFP8uUtt3Xnl2uiKgdOAyp/3AgRjWnkTFarr0KsumrxE9+Mf/L4AVoynSs58ByfRO/OjpkoZgP5yDfKFULaLkciZIq7hYsGIXmJWl7lfiNNPNUhPdiZzoKl1eatFvwFgkeQ2Qlsjvp4Yh/nlAStbrXnp6Q207S7H/cKKG+iJBsJTcrb9f6z4hhQtpwvTUyt2LkME0WjVfeJ7XwJsrrSyRMAFfe8QO2MXNISvISX0l380YMa/fXFBuLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlkldRTJVR/iN9f1jSUsuC/lIzGC4K1jFyV3aFbHMY8=;
 b=G1NVFIu6EAxMiykJRuWkEhGzKVea65XAfwuGk1YmrIKGobXR7ffpFJZF9eobJR2HeAItbn7hAzJcxU0yM9TvixRR5/X4h8OPFtDrZr0G4Q+nfLRsrkdxbGDHKzKBWFjHUoq1uGvOnmwX22BSZW7bnkzX3wd+Qr9tzMzwTdsqQZFloKjIbEEzBsHa756w2y/ubSBQblJsqXdmUCXMB1HjU8Lwph9YJbjwOJ4h71KaKko5qbjs3KvZXiN6ZU+nLcwQId78AWFGvsfaYnFR6IwpTiw+qzO9kBno67XU4lnHq/hmY+kiWP9+J+5GbH7pL0aDe9z353rF49orXx0X0fGFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 20:31:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 20:31:29 +0000
Date: Fri, 16 Jan 2026 12:31:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: Jason Gunthorpe <jgg@nvidia.com>, Francois Dugast
	<francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, Zi Yan <ziy@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>, "Nicholas
 Piggin" <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Andrew Morton
	<akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
	<Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, "Balbir
 Singh" <balbirs@nvidia.com>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amd-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
	<linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b763f36-387e-4123-d462-08de553e3a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?67r1tO3LNZQR/Nivq0fJl0BG6qDKkv8yU90pAR3DWIaA/gvcJ6lZl16veJ3H?=
 =?us-ascii?Q?RIl7BxiCjNt8Le6AtXStraEPMeqw1CEctaZVUjqEauQwcrBC76lHRZNa3TPe?=
 =?us-ascii?Q?Caqx4WiFYsa/P4gh0jKLbZTzkWFAvwFTxVRZ7+ddk+YLahqJuuA4hTvLFAxH?=
 =?us-ascii?Q?wuMg/lFZVBJ5O7CaL/mt6LA5DTqv/NMxhv28qxYBhlwUdEOdItN0GumVKKhn?=
 =?us-ascii?Q?lsBYyZhVa6bKeV7N9fhZLs8DZnkYAJ/IE2OqmOpkYPwh6V3tnUKTsJq1311n?=
 =?us-ascii?Q?/GSfUz3BT10+KXKz6rjndCbfOE41ZiX5nchSQN0AIgn96oLBfnuMZ9H4eBkq?=
 =?us-ascii?Q?M9OG/fvOykDjRjU3V8cmvzWTnpSdm+TfoPKqnsIH9I2bZ/H6IkiDotrjDdhj?=
 =?us-ascii?Q?9qeqN/DS3f7ZmBfhnr0/QSy2J+gESeXGhM3gjst3w3QyjqrDMpqCko5ZbzP9?=
 =?us-ascii?Q?XXinKPuSytErHC122Nyb9W1C8RJ+jsLGGVc44q/n/IkUATKfqBRZHw1JxsgG?=
 =?us-ascii?Q?iWSDwG2E5PZ0D4vokCTCpubazqGKTNxKtE22FRqVB4z1Uu7rUJP6yUIePcPK?=
 =?us-ascii?Q?MDHg7LYURp3KrMqnEbNgeqAVss8WfdqUjuXUyvRfxQTqpRKVURbfZEbF0ru9?=
 =?us-ascii?Q?ISt0NLC+DlRXliIVgc9twFqiToVoZwyD85iJF1WLLixyKtde+zfY0Jd05Ipr?=
 =?us-ascii?Q?aK/xkYCGp8ZL8qoSqKzs3rQZ9V7jldvcrGVZLi4Vb/CQ4EDgsgWnBJAiWCSO?=
 =?us-ascii?Q?blDuQDZ/5KhhVbrJmEChNGATBgGPXmcw/3qE3sPoaK7ed7XFICgQZVCMPGln?=
 =?us-ascii?Q?V4BejuAN72/04r9Ydqh6brVJkEoB68EtfIiIvsNa84A/8mE+WNbUYRCo0uEB?=
 =?us-ascii?Q?NxXvi74Syt4QiNTekZ1aDyvBYSAz4BIuYe2BptPj+yIaRmZUcNoeBrzBP2q0?=
 =?us-ascii?Q?uivXKCTlKYMkL4Gq2kotzDfOuz+KiKrPAuJPGuBMrg7Z6ClIdLJeNZsUR/nW?=
 =?us-ascii?Q?ds7/VvL0EINZaGuZYhNB2CFCHTVrS4+jly1K6vw1gK+zR5ynp2tsZ9A5Isdf?=
 =?us-ascii?Q?z2rXvN3b1bBrCtH28q6aUVVzwUTuIek3dP6bcCUOf4Wd0NNySNoEr2phf3ko?=
 =?us-ascii?Q?mRhxvlC1FWVAUAkuXKTu1CVk5+Y49OGBkTuyhlIYbjuQrl9f25AFtS5n17pw?=
 =?us-ascii?Q?2tajAwtq8QSKRasXkhGS71inIUNzEm7waCoWbHc9OmSnhdYbj0HixJhv65aD?=
 =?us-ascii?Q?C0el90mS5btbMwP7NQ9NO+L2iqlJvviJeUCjZouMPpH2oYQDDN9h2h9W8SG1?=
 =?us-ascii?Q?5fWgurijWpVTxD+5YjsxoykPMT9Chl7XcHGB7Tfj/lZOT8OVMe4Qvyd1Quiy?=
 =?us-ascii?Q?gcVSG78t76HwZ1wFwLWAHhAVs0+nPDBBORdIaRYCJjJxMRmJ9zAi4FwN0WVH?=
 =?us-ascii?Q?jYHNN0zJ+SqzItNskKSL8O+fjqTckOkWXmNqyG3avQgY17OCgeCRr4RnvoYM?=
 =?us-ascii?Q?WFnjN3vGI6fjAd0ZH59dmG5JkH+6L1zqa5A8bJHNP4XJlsaBVPQqgRE1lz3V?=
 =?us-ascii?Q?Cso8Q0TDbUrCaH2zesI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?km0/CHszrJ1rCY6uT82DKz0kfEtOYGy1Cz1YuQ1W8TtIlMtz91In/p8fY/iH?=
 =?us-ascii?Q?FNIkPS8ErW9yUW45G+aY/r/Gi0z3b8SAeJnpqEAJXp9QQTGeTWDdmeNJFnW3?=
 =?us-ascii?Q?AWfBDlxRdoUxrbExHbvk8EEXmTZVgwztnqG5UB5GSDFYWymL3szoZk+S1ssW?=
 =?us-ascii?Q?+IMRHIGcFi++b3spE3/FTJKluGFhs3cz2Thw/H8CLJia7YD2prMmwU25TJkX?=
 =?us-ascii?Q?ZlLVLOAJoxo03IDIeiXD9Jskt+nsPPEs4YTaIE1AoTlazGwel/3Fs9LoqqSg?=
 =?us-ascii?Q?p1SkK/5WNFkoR+5dvHBmpjvgqOhL7KXxvM25IXm9maH5dxGjyTihvxR0T35F?=
 =?us-ascii?Q?qH+rI4cmn3dba3lWZ21qReQeeBv+ICJoWoYDvCgNU/cDO/xm2cRIeSt2BUIh?=
 =?us-ascii?Q?jTwmtwb1fwfctWuwZBDSkCUNeAEAyFVxMNrzwJM4BpdQHlLWGHAGVtb0xJdQ?=
 =?us-ascii?Q?tWmN25mO3kVF8OCW9oe+OqWmFYrBwkX3+hY1qKTR91nrZHws8uX9G+PHHmQe?=
 =?us-ascii?Q?aLsEQI7l6MLQclas4ZQEbIuCfrmjh9ShfPwUCoYMWMsUzIjhyeSprg/IwVyk?=
 =?us-ascii?Q?8hlOYwtfsH+C6kBFTkhCUruuxO/oSAnj8iOqXF4OEBqrJvrfFORScgK2X3OI?=
 =?us-ascii?Q?cEf6lSJKS74B2DQxS1mjU8yZG4/M9G2p1tt1l80JBa41Q1JpComEtA/Oio4v?=
 =?us-ascii?Q?3eYCPOUSG9nyylfBS1AwsfjkkpimDpINuXkRlEZY7F9VU04Y14sUbKlFre2C?=
 =?us-ascii?Q?uPz4nh80OK7J8BI+qDPaqaDpMHZjTP6WkhsmuPZaiX0R1I0G1WxDSK0O0Wnu?=
 =?us-ascii?Q?HIg/L+R3qHqr23dP6OeUCBAq5Kqq6oTIeCtWz0Ou2HpgChjMudvWuVGjHL9r?=
 =?us-ascii?Q?pXrW/08H/ZmNsJ1BnAPJh+oQiBFjpln1f8mLOne9CN/RBQA49KNtY/KKpy4Z?=
 =?us-ascii?Q?ZmL+t9/e7FUndzQ11EXu9QKL5Hl1cC/AJmsfMYkiJFmxu8lAn+pWaH4gvHMV?=
 =?us-ascii?Q?sxSbmGSPmDy4RQgmpDr9MYDqp1t5qV8uZvYPR7lMXUp213EgXHK3PaTib4me?=
 =?us-ascii?Q?EU1VH10zQBDGf5NnAbLTcVMHGLBay8I9RC7f1KaYJqAw7UM9hcOOVD+XiK3Q?=
 =?us-ascii?Q?BBmL7ZnnG2XvPUDOG61CWm8T0yyenaVhIHtStAwOl3ovE1YJdgqqcLUE3a03?=
 =?us-ascii?Q?GyPqFLRtfzbJXHspfaXaz7xbB+Rk0+j58+aO67OXvppat8G9j+La49qUJ6gM?=
 =?us-ascii?Q?uQL8Y+uJxxnkCvJH3MF+G8YPzig6Bl1muBzI4v0b2BPRg097kImpLrtsAJRP?=
 =?us-ascii?Q?3EJGQxQr7x/UeVsXNnBtS1IsFNNfJ8JFSiGVIpWMD8Btuw5DKRkJ3Fh83F0C?=
 =?us-ascii?Q?MrOmqhRi8NErlWBS8tMjIzi14MjGAZfXvj24dm+AU6emF5/ONx9e+17McSQt?=
 =?us-ascii?Q?ZO7yasIdvU6CFjV6xPLXelXRdkcMLEWB7nEB4wCvUtin5XfMsey2oQlBc74A?=
 =?us-ascii?Q?JTf1VY476KKrZWf7KXTBIDhdkBciJbKTq/cY0IPOw0Ye4/v5B0237seyLMm6?=
 =?us-ascii?Q?1wJ8CrrFs4rsR0zHfQFzJPk4MHOPmC7DOE+ZUY81zZ7Y84xia+7V8PBJ++wf?=
 =?us-ascii?Q?oun3bTsR4GYL7jdT29JoGGpxv3vCGR/AbCKQRkV/kIEgfplfkgsXUjlb8X/T?=
 =?us-ascii?Q?nn7kI/MyY2/MgaoTxNNomLEgl7JTwygl5wEAEOFKghUagB/ciEYu3Z4EQqRs?=
 =?us-ascii?Q?wKcCY0dYFsmP0AbYMCM94fgeD0DAOP8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b763f36-387e-4123-d462-08de553e3a68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:31:29.0680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNf01ORjjSy6yjXIHduQekp3qQc8aLTYRYcQMd87oNme9nDHE0IjLoPIuXLWk/dzvvwPZ1ksR9NgOh0sVaIzdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 08:17:22PM +0100, Vlastimil Babka wrote:
> On 1/16/26 18:49, Jason Gunthorpe wrote:
> > On Fri, Jan 16, 2026 at 12:10:16PM +0100, Francois Dugast wrote:
> >> -void zone_device_page_init(struct page *page, unsigned int order)
> >> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> >> +			   unsigned int order)
> >>  {
> >> +	struct page *new_page = page;
> >> +	unsigned int i;
> >> +
> >>  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>  
> >> +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> >> +		struct folio *new_folio = (struct folio *)new_page;
> >> +
> >> +		/*
> >> +		 * new_page could have been part of previous higher order folio
> >> +		 * which encodes the order, in page + 1, in the flags bits. We
> >> +		 * blindly clear bits which could have set my order field here,
> >> +		 * including page head.
> >> +		 */
> >> +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> >> +
> >> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> >> +		/*
> >> +		 * This pointer math looks odd, but new_page could have been
> >> +		 * part of a previous higher order folio, which sets _nr_pages
> >> +		 * in page + 1 (new_page). Therefore, we use pointer casting to
> >> +		 * correctly locate the _nr_pages bits within new_page which
> >> +		 * could have modified by previous higher order folio.
> >> +		 */
> >> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> >> +#endif
> > 
> > This seems too weird, why is it in the loop?  There is only one
> > _nr_pages per folio.
> 
> I suppose we could be getting say an order-9 folio that was previously used
> as two order-8 folios? And each of them had their _nr_pages in their head

Yes, this is a good example. At this point we have idea what previous
allocation(s) order(s) were - we could have multiple places in the loop
where _nr_pages is populated, thus we have to clear this everywhere. 

> and we can't know that at this point so we have to reset everything?
> 

Yes, see above, correct. We have no visablity to previous state of the
pages so the only option is to reset everything.

> AFAIU this would not be a problem if the clearing of the previous state was
> done upon freeing, as e.g. v4 did, but I think you also argued it meant
> processing the pages when freeing and then again at reallocation, so it's
> now like this instead?

Yes, if we cleanup the previous folio state upon freeing, then this
problem goes away but the we back passing in the order as argument to
->folio_free(). 

> 
> Or maybe you mean that stray _nr_pages in some tail page from previous
> lifetimes can't affect the current lifetime in a wrong way for something
> looking at said page? I don't know immediately.
> 
> > This is mostly zeroing some memory in the tail pages? Why?
> > 
> > Why can't this use the normal helpers, like memmap_init_compound()?
> > 
> >  struct folio *new_folio = page
> > 
> >  /* First 4 tail pages are part of struct folio */
> >  for (i = 4; i < (1UL << order); i++) {
> >      prep_compound_tail(..)
> >  }
> > 
> >  prep_comound_head(page, order)
> >  new_folio->_nr_pages = 0
> > 
> > ??

I've beat this to death with Alistair, normal helpers do not work here.

An order zero allocation could have _nr_pages set in its page,
new_folio->_nr_pages is page + 1 memory.

Matt

> > 
> > Jason
> 

