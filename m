Return-Path: <linuxppc-dev+bounces-16151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BxzCZxGcmnpfAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 16:47:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A746929B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 16:47:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxlnG6whGz30BR;
	Fri, 23 Jan 2026 02:47:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769096850;
	cv=pass; b=g2rjgCC2LFY1mrTZaAOqx1njDg8oUcnL6HkW4mD5yfydkqcLPcJKpKw/Gz0E0Ki4hyR+W5yxfeXWJqNVtZ+Z/n5eKgp4/4dKe8DlO8n9REvJt1biUJo9uKTCsP0lB9lSVFpxj+3s9H6fR/VS6DnMhQXHYUxLJsYBaBn0er6ZfvMtnc6jjBgQGQcc0Txv+WBLHxatsbePJCNrUwe0Zh3qqg6evsCNbe+cvvHDXoEknVP4WlYz/mUgYQVej7nDMrlKzNgRNxdZL4+H4tGWBoZiz2vuWxPBJFEDlAJCOySXxQgRpamM4er7Eus0kkQJyWJEYWjKz3Jy/GKgSb8t+i8bYw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769096850; c=relaxed/relaxed;
	bh=urLRoIBEUIKjiUtuMX6/RhXFrlQUu0ljUyUgyCTDCgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CXir4B2ABt44nRXg3CJWlw19yrjoTdNljRnVdxe5iaywujGrLGNb9mb9RcTltU9hV2o0S0YXsosT4NJ73gVW28Ij8eOsS1zYKSaZuWLQXvoCmdas/ZXA/RtvvnZB7gCwxv//XNM+msJlgoYcy4OM2z3i04wfpZG0X2lNPm9YGHhgFlUF5WJclMNtXbg38WrPHKnodTGlQZYQ3qv/ZDMRR3FgJGlz394MTvwy57j1E1VsWtO16lkeGxoXNAueQlndvhFF5YXVl+1DNO9lVa0YQLjgJJXATYJg494bhwdW+scucLzVD5QlXNoM5Uu4FL6XTnDufpM5Z77V6hfa68MFSg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NeztxjFf; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NeztxjFf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxlnF2RS4z309H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 02:47:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1hntf+J10Wc+3Hv7poOapR5c8+zLAhhvTiisk8s5Q06AvLBI4+Q+q5xSw0qb+ph5634Y4PP5bnf/ddv6MS+GgxiO5N7/q0wenCky9fmpblNSFiSFaXwARw+f1TKJeKK95u/1qY+UHqiDXt0SHhc3+tnbVSdoUnHYngsULkOUZgLQwYFhUEVRnFo5Gaohf0tOfxh1OCw5zqVvZZQLvLmLLY7ppkcaBgRNImiSj7Dmtdqmk7RXrRcUlEKjEj01LnbHCng0ZMDercma8b3Vda/uJtuSFlBcbXk54D9MCpnObIoEUdQiO9bWI5rhdlIikkTUKPZqh63bSD1sxMRbhOdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urLRoIBEUIKjiUtuMX6/RhXFrlQUu0ljUyUgyCTDCgI=;
 b=zBWm1JAqg/d96H6sksdKd4YBdInKj8eUU6/NSPZ0gtcArmTaDNMpeh7oG8Ue/FcPSJbJo0tOZveibmPfYFlfsIfw5GgJJGPS3WykAVXAZhjer4MppHajUBWf3AfAUJEEBU+90y6LVFYi7HOUmIAFqaqL1Puo8D8I7Vh1leGn1gJ+NTB8cNoGoF6GSi4+5sjlqo8PsU+zT2Tq9pknb5WxbEsyW1CtdZus8fbHLCIePJe+kJxv8f4brkAi9jgaHtavUQ56PUxiEpICihXYX13Wzb94HMBzRl0Lg4QAG7PAxi74fbpoosBduPeQWMceT4dOGWrGtMgltKQYLxVSWTX25w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urLRoIBEUIKjiUtuMX6/RhXFrlQUu0ljUyUgyCTDCgI=;
 b=NeztxjFfb/XCKZywgF1ikrJGBwwFfT6XHaov7k8FJ4XH2JOScFhCxjUfVsbdAsXEY1WzQz38Ze9r5020u+EM6FwhDw9Rdcs1S015xHLv4YMgdwdPnj1c9GjTktDPRoIi5oP21+AST9VjoiPoBRvbtCI93yxDur+FNFkveMbVpoxp1FcOGTP3OrOb4Z3zFidocNRyCp8+WOLaOL5EEzDeLywzVMOPW7KkYBdhg2PsP+b5etRuXkvpQBzBgqGkEhvccGtRmGu0QxeDRXKleXIfJ/nXXltmPLi407y9Xba2atb+0Ikj3WQt4XJjXoOo2xlSTIi/5KD7W65sfMhpkf8Dug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 22 Jan
 2026 15:46:50 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 15:46:47 +0000
Date: Thu, 22 Jan 2026 11:46:46 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	adhavan Srinivasan <maddy@linux.ibm.com>,
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
Message-ID: <20260122154646.GQ1134360@nvidia.com>
References: <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
 <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
 <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
 <20260119142019.GG1134360@nvidia.com>
 <96926697-070C-45DE-AD26-559652625859@nvidia.com>
 <20260119203551.GQ1134360@nvidia.com>
 <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
 <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
 <20260120135340.GA1134360@nvidia.com>
 <F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0363.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::8) To LV8PR12MB9620.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 6619fffa-3efd-4f3b-38fc-08de59cd739e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ohj6vJhRcoQx0d14rJ+KUVn630uJ0OjyBmRLufFHoNPDUq9wqhGhBsSWCyHs?=
 =?us-ascii?Q?5YPxYiPGzbTI95G/Tosh/PEWY4YIxyKqM9P0/QFhWN9H+mAkzdX7BMLUzDCH?=
 =?us-ascii?Q?Wn91BCJnDrMXYm4EUJICmdzS0aQofZS16JC0sAQDjt3qTv2N1wtbBCHiNw8I?=
 =?us-ascii?Q?vUhWQIIWF8Qiwf13QX48aeQf61Lr0T7AN4a+nofJnV68KFlMU/1H3sp/tVf7?=
 =?us-ascii?Q?6Uj1NmizFTB6/cO7bWwvKufbN0o64Zi/dul0yyQFl6IZ8hnMBo/nafS5FpZJ?=
 =?us-ascii?Q?eNzuVqNsk9mIUOLmxZwJICLZBZZ6jmjD3HO2LPkxRt/lsRjmVERA6FLE71FP?=
 =?us-ascii?Q?WsPStBDbYELQ/N0BdXyKRV29LLI7Ny8/L12N8NJMqUY3gOw6ka3j3UQUgVHF?=
 =?us-ascii?Q?YHxYfwN8u9zgOznfORp3xh4K/EDQLFIw2qUYuEOwIEdbpNTBkP4xwXw3yzuw?=
 =?us-ascii?Q?qI0NjfzKRhBQtRStUetRK+QZJjHOgAPtSA6wPc8JH5oEqClCOcstWw4WcWpW?=
 =?us-ascii?Q?PwmIAogOgXtCUpr2Qp6CP9X0TufJOp+VkIm1uj9PHuFFeU1+0R8Y93g1qIpN?=
 =?us-ascii?Q?vwbDHpKbKdypgBOD5MHFvFX4JOfc5KHLAVcrcBrIvDi2pOHUNSbPZKKAe0TI?=
 =?us-ascii?Q?/4h8CXIhFPf7em/wcWgkmMaG0Ig9RlvoIWz1XRm+JfytRqhoiLD4gYIJzXKP?=
 =?us-ascii?Q?ZsGRoSSt+WAe4lCSy2sbG6rTCZIuIAKRsdDmh5MwHUy5FbQBmJ67RRgAx36+?=
 =?us-ascii?Q?0j4uuTs7j2ZNJPJbkbDV6b9dFyG4m8Rdm2UL8rbKf+7/wldoB+jStJJ8h9ic?=
 =?us-ascii?Q?kuIKwaz7Q9ZkUL0ih5rIeFisPLf5vWZ6O7V06+TlbqMD+5oYJZCDxoBf9aam?=
 =?us-ascii?Q?3FENRWgqoE/vnsMO9aWgfpckUgP3Kar6EDVCY3AjCbFAZVMb2oyqeA9udkyN?=
 =?us-ascii?Q?m7w2Scy42T4M0KsrKK8Y8XDe5hHecvKaIku5etlKUV4uNiFdw2bULmVVAncB?=
 =?us-ascii?Q?CPbRGF3S+Cw0jWbeTi3fixQWx559sCNbqikUUBAVmsw8RBKSPI+JVPUV7RwF?=
 =?us-ascii?Q?pLWJxni5bB3uZGd3a1aiTPnhrFsrKnZvkZoYpNhiJ1NMLBQ85sd67DH53YY5?=
 =?us-ascii?Q?lB/odiXJhICIDrK0EtAdUy1aCwQsNF8PTI519VIVKDJ+GXZXlDKofSWT0YUd?=
 =?us-ascii?Q?caerQEosFEqZdm6lJGmJkwPet3yllCN3LyPobXKRrxRpgVq6oc/zkPLu6QCC?=
 =?us-ascii?Q?vHGm1ZmSd2yUOaN6VIjjcX+l1kzEfSUJCWYH4hue+IhHpbJKQQBMdfEvqtGc?=
 =?us-ascii?Q?UHlmvKsPF8bHftyzqnCIbTF2UjTAqIoXDw7jEvRWhGFzitJP2y+Tq0v15Gux?=
 =?us-ascii?Q?YKbjfR6F+ylGNATaeXrun93eJzhM+prGXaa+LX6BxtWaQWgV/K35688NF7l2?=
 =?us-ascii?Q?gqailK2Dwl6I8WBRCvmNfYjBvQeCAEx0diyWoLUmt8QGMKB7BvxY1CCRSRQX?=
 =?us-ascii?Q?Ym2O2PVDDKSItKO9pjcjE7WutgsoqKtfGagKU0I/HWLx1s4U0xuQyJmEOue6?=
 =?us-ascii?Q?ftfkYvUaRqSr/VDgWQA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E5Fs5KJqLjfrfdCxIzohuRce/HV8FgniJIFkYD4lqISS7ma6j3xVErWMm4CA?=
 =?us-ascii?Q?ssbKy8+xYyEDheYDEu80czgFZxfyxrCGnOe4YLJiVD3saDbtU3wdoZIfzEJK?=
 =?us-ascii?Q?asGVYAMLbvgvkVHLwvKGAVcTj+RArzJcSO5Yo+jKmBTRpmI0DMWMVH1H6pjk?=
 =?us-ascii?Q?aQGXK6fP7MLASzuS2r6OQNYaS7UTM8CR/xppROWd5BfDUYoAGBSo928klec7?=
 =?us-ascii?Q?sg9Z1LsIhaxCAvEGpcvZc6FEjQnMUJpCBTIZ4Gxj1FDNRX/OgHXHGkkgC6Cp?=
 =?us-ascii?Q?lt22OYx5eidO7HBBhnNhIapEQh0asyouPbFl/sJ1qtyEszYnEKWtSNSukJNW?=
 =?us-ascii?Q?btraflU4GZHy1R2uf4IQCd/MyMwCy0YTGOGK3UbjK03wAemqq19PiBR33huS?=
 =?us-ascii?Q?bll0+Sx0umj5xU4zHM5rc5JdMFMsBvEyTkW6TesZNmYiMGwqFr7riOLCOgx1?=
 =?us-ascii?Q?j5sFdHv291N95kv/WbpI6jooA6wRHJAS36NE15piwyju3PznC4+OSEQ4lTfc?=
 =?us-ascii?Q?q9PH01RHNZJNHQhbRzeibQPKyAx6Y3FtyT34VGCL9NmIKBBA//AbHVJsES85?=
 =?us-ascii?Q?fCEhtl3+D6P1kAS7RjSKqu9WRGaCNtmTydxJKeEOUQn+l5vuX7ePYXBhsaEM?=
 =?us-ascii?Q?1d4dmhNSOyaPSAkwDbhs6m0VA1Ko4UvhrXJ0FhZe5kW2qX0sU/wD5K+mvAeD?=
 =?us-ascii?Q?kuB7jBYx84y+NQng2Sx6r2qNMDAqPiAyLnKxZGwjySK7ztDNgBIBNOpeicmn?=
 =?us-ascii?Q?LBPsd2axGHGIVKY1cQpjIcVU5ubYaefwmdu043WIg6ijffnoyM4BTSzlJSzE?=
 =?us-ascii?Q?XY8OE+gItu8mNXewXzCtjOIP49xs3i62bmGaHRQRxNB0Uq5A+JzKBS1ARlkG?=
 =?us-ascii?Q?ogGzN13BMsneyWgQWsfEvnXGedVUeG7Q4exZDQcSXAeD7GmG8aXdBKdNj6+U?=
 =?us-ascii?Q?q+oqISKb0MS9aJSMPE1WzS24VrlXCgqCHV2CptoOYdWQ6/iSon6dAe0fQl69?=
 =?us-ascii?Q?RG4Bq0wpjUn6hYYwxWE6VnHiBWQEXOoAZZaXRoY9Z6LZMMRhC4hYAjeJ8lr+?=
 =?us-ascii?Q?ek/Cn18vYZRORri6SiD85LkClJ46PklsEVu3DURgFXwLa2tfHga5C4XUneoV?=
 =?us-ascii?Q?y1vcsuK0Cg6CMBzsKTwjbHyc5FyXcsW+KgPZjNzTAkHeJEERtvOxvDlXTMv6?=
 =?us-ascii?Q?gVsR3469y3KZlcLoTM/661eHBBCkLO6n/sHjqLoSSWorSOEgkCMfSapewc6Q?=
 =?us-ascii?Q?Xnvc7JHSh6hOgM+Sgs9JcIb6XkLx1soLqWQoZa/GI5tgaMQXRYesLe0/hJfq?=
 =?us-ascii?Q?1aOk43ByRVAGMl1vxoXr2+3FO4h4hDwF43F0gyEj7UiwLoLOe5vZEhEHwlHy?=
 =?us-ascii?Q?5rLL/6oxihjaRSog6zrqgBgIKXpui9eerb17ERs5CEgYAIblX34y2dZNAnEC?=
 =?us-ascii?Q?HSL3iFY3eYBZcXjKflIW1BWVpPYpNht1//WJnyaKMDVqYpolMqwNCFM3YOnc?=
 =?us-ascii?Q?+Ce9SmKXLd8f+VV7WoYMuSCUMHcs8ZS4iZRmtYNLbn0msHoyavh7EzGsgKA0?=
 =?us-ascii?Q?pqHgZzRRVm/wJUBb1L/wA7vvQBwEWkkzcv8sG9rjxNx25haKT3hnCQgzMrYD?=
 =?us-ascii?Q?iOH+A5Z98zU3GUJPipZaNiaaxcex0BAvP9+tB1icCV871OqXSjYUvWY1RRtT?=
 =?us-ascii?Q?x+blK5vG4fjOVBDIvK445VpbdQrH3qG+obXZwRJ1iuQcXOfIlUtTQyTAhN3T?=
 =?us-ascii?Q?lUMOZfpMqQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6619fffa-3efd-4f3b-38fc-08de59cd739e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 15:46:47.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61UuDPbnbQgYaKMW5ue6PUb8TuV9NI6UMg7dVvAEh1C4w7RgdricARs5c63CAC1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16151-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:balbirs@nvidia.com,m:willy@infradead.org,m:apopple@nvidia.com,m:matthew.brost@intel.com,m:vbabka@suse.cz,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,infradead.org,intel.com,suse.cz,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,linux-foundation.org,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 80A746929B
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 10:01:18PM -0500, Zi Yan wrote:
> On 20 Jan 2026, at 8:53, Jason Gunthorpe wrote:
> 
> > On Mon, Jan 19, 2026 at 09:50:16PM -0500, Zi Yan wrote:
> >>>> I suppose we want some prep_single_page(page) and some reorg to share
> >>>> code with the other prep function.
> >>
> >> This is just an unnecessary need due to lack of knowledge of/do not want
> >> to investigate core MM page and folio initialization code.
> >
> > It will be better to keep this related code together, not spread all
> > around.
> 
> Or clarify what code is for preparing pages, which would go away at memdesc
> time, and what code is for preparing folios, which would stay.

That comes back to the question of 'what are the rules for frozen
pages'

Now that we have frozen pages where the frozen owner can use some of
the struct page memory however it likes that memory needs to be reset
before the page is thawed and converted back to a folio.

memdesc time is only useful for memory that is not writable by frozen
owners - basically must be constant forever.

> >
> >>>> I don't think so. It should do the above job efficiently and iterate
> >>>> over the page list exactly once.
> >>
> >> folio initialization should not iterate over any page list, since folio is
> >> supposed to be treated as a whole instead of individual pages.
> >
> > The tail pages need to have the right data in them or compound_head
> > won't work.
> 
> That is done by set_compound_head() in prep_compound_tail().

Inside a page loop :)

	__SetPageHead(page);
	for (i = 1; i < nr_pages; i++)
		prep_compound_tail(page, i);

> Yes. One of the issues is that device private code used to only handles
> order-0 pages and was converted to use high order folio directly without
> using high order page (namely compound page) as an intermediate step.
> This two-step-in-one caused confusion. But the key thing to avoid the
> confusion is that to form a high order folio, a list of contiguous pages
> would become a compound page by calling prep_compound_page(), then
> the compound page becomes a folio by calling folio_set_large_rmappable().

That seems logical to me.

Jason

