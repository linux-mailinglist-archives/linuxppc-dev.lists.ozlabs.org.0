Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750894827E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 21:43:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W16Ot7Zd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd6L441tyz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 05:43:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W16Ot7Zd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 06 Aug 2024 05:42:31 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd6KM4SB5z30Vh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 05:42:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722886952; x=1754422952;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6pOYLP6od8hjvqCBXgSQv4WMd9HIqeyR2zN5Sy3Ws1k=;
  b=W16Ot7Zdid2zQb+vFOTndFaIWEHRiRUqjhI5V0b8kpP/OLJHIFZomKZ2
   Tmrswzd6o4N42B0dVX/xauXsIm3QUcNVa03xk+yxnbkvgL722wsw8OELs
   DQ/CzrRh7BhvjY7tCYC1wgElQDHBYflxmS19RL/G19huOQjfeK1NKVA1w
   1D1bdED0JwJA6HQfcJhJn2p21TmvbN6OREmzVlV1+vziDZ6gfrYqvjg6M
   HTGkktdcrnf14XS/atFQ9FSdrr8V3V3v8XZ3pR8qWABe7MG+JjsHeqp21
   4L4Z0NZnTWT+pKueZ+/ux9fXs1mhbAy2Qb+pIHUCWneBB1b3NI6ovLdbK
   Q==;
X-CSE-ConnectionGUID: O/tDeGQWQP27L17MRdBb9Q==
X-CSE-MsgGUID: n7lh+RndQwaFZV62hXF+AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21050769"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="21050769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 12:41:15 -0700
X-CSE-ConnectionGUID: LcpgeAz5QeizGgsFK2bIlA==
X-CSE-MsgGUID: T4Ig4LEoR+SCh06nDXprng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="61074381"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Aug 2024 12:41:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 12:41:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 12:41:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 12:41:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DM2EYJsCd9j9VM+Ukz45r4Pz8BWOLtK4/jHX2Kto4bW3OpCc3eAnqYDz2di2NZBFzcTEeBkQcigFyku6Ibw3Wj02qYnlrhAfhWpfPPNAtJN7cjpYlFt+egiWl+FcUDJRib870Foxpqcf8VWjR5u53p8k5I7ey4heLLi++5erfDTfnLYbrkw6M5YUgOi9F4g337gTWO9xpdaWQtVhKUShrZhun8JYbmtfDPCiC4q/cTT3cG0WTGpgOSRmLmFQVS3Oy1nrcHm5VrYHHF01DbOGJ/oYBM6TwvXLw71XUnj3+zaunYp2nQTgCr3AOjJ7LffoSWCPGmmyXwdts0w8SCCu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7o7OIuO/8DACrVXxCR6stF+5hOAU2Qwnp0B33a7QZ0=;
 b=cf1/ZMAp7UkSmYfAIl0cHKbn6NKUEnv9DSR3qBFcsL2d0EahUG/sw/bAAPejFZLE2CmhZtxn4Ic8Bnlfzuwh2Rnh9eHyDwSNzsM+XANw8LWwBALyhRAxdnwgC7HG3yzuVnN/0VRy4skl51WN75RrsGAkRv+iIENzB6TG+WnyGonNUlTM1I9KzA5smUeh21edI8wnOaBFBmusXbd0titX83zfuHabSvtZ10pEz9eNiD2Rv8nBjXjvthZa9sjXaFp0etAr8BNPfxMvjc4iBiF8FsxtbDbJ5j0FZP3hUREUs25ZmefMQXBbFPW139f+fBj5+9BZbhfgNT6eRAWQky2syQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 19:41:11 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7828.021; Mon, 5 Aug 2024
 19:41:11 +0000
Date: Mon, 5 Aug 2024 12:41:06 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Mike Rapoport <rppt@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/26] mm: introduce numa_memblks
Message-ID: <66b12ad232a7_c14482943e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240801060826.559858-1-rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
X-ClientProxiedBy: MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::14) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: f5adfa75-1c24-4b07-519c-08dcb5868efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/C0HvF2KBPxvj1c5uocAJRZXuRuXOo5VRi+DXjdHN+RCNG1gHVDny4LNeGSW?=
 =?us-ascii?Q?GXu3F2BM+F/5y9v3Rh0kBsoS6zomYmk6Q1Np1mRbzHnKlbpWUKJftoww/aCU?=
 =?us-ascii?Q?D85+gv52Zc+JePudtt0vbttuL6h96mb3ABAmaNTxRSzD2PoOm4/OP/6q+GNs?=
 =?us-ascii?Q?UG6o62L7eLqzcpz0rSakgap48J0Uc8sYiIlRtjppLFPMiab+QjLrDlk2+kEV?=
 =?us-ascii?Q?JowlwCCf8sGj6l/FEgVjII3Td205jaotT479C8miqkdDK0Uk4VZa+j5c8cm6?=
 =?us-ascii?Q?M1iorsxhi1MS8qRl9ObhKw30w8pfCpcjfp/VRQMYcp8aMaCd4NUywe36Mb+j?=
 =?us-ascii?Q?jChDVGKb+cfwPrt4YG9f8EpeEwEBR2K/4Wcz6c7cKHZ8Ym6ILhjHoHUnC9Ul?=
 =?us-ascii?Q?N2dX+K5bRz8PHFABSZEhRknOqrqeQ+q1B2d5DPvEqXoRmW6yv/XD3I+CGo/X?=
 =?us-ascii?Q?Wf1urtaF9w+ulvLDzbRvPYXZd+k1U7u9Ty1FEicm21gnI3mb6g8UqwDZiLtz?=
 =?us-ascii?Q?2j3M8HJpaEIR5GtUw3FvOdedOQpSTG2a8vIKZ4KZom37jpcRXP3ORRNi21Ll?=
 =?us-ascii?Q?8WHMVhrP411Re7o2wz1eYKJElTcogu+jGXttXhtipt5utqMGfWXQCw24EBQH?=
 =?us-ascii?Q?mQlf2NjIuPKRZ+DwzhPdghcYdh8GgW3QeEsPuOkKWOUwk88DMTra88o+7k/X?=
 =?us-ascii?Q?pvjE3cRieAa5ahyo8gt5QBCIruwIaxBDib8byPV508wEpZn9+D85z/n58b0v?=
 =?us-ascii?Q?NasOHZf3iulIEqzNaVYc+6Umvc4z06ICPIzvzVwEjAXpmDEtgMuWSKnWg/2t?=
 =?us-ascii?Q?7ICgxAEh1QzRgdQMANjUs5T/g+eHLW1YOhkXueNyCWVl3jwYUSXIwur+xKmJ?=
 =?us-ascii?Q?c8kCOuMCUv0qGzhbjs/VfKSvg8e8oIrMxSh4H2dXNTkcoNOsP4eem3RYQywO?=
 =?us-ascii?Q?VVhEHv0WWm7KPO+KJBaGdEDbK/TSpImuXk/oXlNMvckfzUhnfP9Llua5pDKI?=
 =?us-ascii?Q?AwyXkXcvPGbdw2OXUDppX5ZzZqALd8aGLKms/AnhLRqX2vt5oFmHnfvQAn7w?=
 =?us-ascii?Q?9l3vIIurJvV+QUAnp3HfW0DZY/EtQolks+M/R9tYGC4Sxu1loKBEc1pd6yo+?=
 =?us-ascii?Q?NWQAcZGH6mmwB67u5FB9Xc2YdmeBuAF8A2TIWCHH5IeqMq5XMpHXeTS/rzWF?=
 =?us-ascii?Q?MV73C8pozxmk4lon+yVvgX/Z5qDoLn36vOcWBkYQX3KwT1PrqRksulKQT4t4?=
 =?us-ascii?Q?RK0LxF8olFMjrGqvPaAd7g8A0WyCNBby+pwLZq2qsA14FNbvqNtUtl5uw36O?=
 =?us-ascii?Q?vQfPlKgAq+W/+Yyf+YWu751ZN5RCAJeuqKjszR1fQW8hKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8zj+UA6335GVl28s/ih9W67inaScvCPYo7SxAFeRpgA565nVajVNiTji0uGZ?=
 =?us-ascii?Q?FaE3fsKA8gmX2On5NKQawzwsZthQQUNTo824qhIw+MZoaL6O0khm4mcHFDs/?=
 =?us-ascii?Q?gCETwUg0/IgR8wRha6TLzZsaOoUx2wwMJUaf1+SqQSN78Sk2EQoO12NAtB9U?=
 =?us-ascii?Q?lj6HQkO5SMyy8MD4sf5u0J9HrYhc/BYosGrIn+opKbCsATdUNT5fGgD7n0Hv?=
 =?us-ascii?Q?tfzSAEQXFEXL5hai0Aker/gTmNornGL1ohxnlX7n9iPoUFtG2439YkgySQsN?=
 =?us-ascii?Q?aK/4EovNR4IUFF3UEAeJgE5JNhFx4P0wU/QLhDni9NYV4Z1++Up522ZDSQwr?=
 =?us-ascii?Q?mDqjdPJNY9X2uT6sz6zKe7P759q2enyiexpj0JEMGjwGs/y04ANW1Lc6Gugr?=
 =?us-ascii?Q?PagDDcseu0qHq7vjjD9j5OUd1+z0mdP9LssFyTmIN239mFViOrQRdrV1hM/T?=
 =?us-ascii?Q?+Hju9D/sjdyfk9fzLJ9D+zJtskSDg7XZkyHg+lK90R/rlLA8xIcb3uvA3ZrO?=
 =?us-ascii?Q?IrluAAssIKCxYwIS51PVUUG644GWg8SRtigdFg+Z9IMC0EucXZU4JSyHlGtX?=
 =?us-ascii?Q?eDoIOYQfKQyk3uChjb06B3+uKIw1N0/XsPIlj4DB5+SmBNYtcIDbBFJT+8me?=
 =?us-ascii?Q?VI5vDRKgXjh5f+KKW+nwdh1Ym/sBFkDX10dFAyeudLueooBbb+5UTGrYQTuw?=
 =?us-ascii?Q?m4s7PMmUBCXsa351WW56Zy8Ex+6GafJHVqraa+fOpfpoAs9DmLxctSdEaEU0?=
 =?us-ascii?Q?n2bf0CYV6Cpfkcv8AOIfrJWvmZUOLzkQFpuvDop7K0+6InCaWjNciHFWjDeJ?=
 =?us-ascii?Q?CABBgVykLzel+wc7XYmu8aq6KAL1R8v1R/1muRqyguRmt/9c4NQdlYilptGs?=
 =?us-ascii?Q?xfI9OnVnUC+He7hRfLexaXjvJ5CFus0cBV4TOlZwRwoP021RBepvluemSfZl?=
 =?us-ascii?Q?0SSrNSX5NqJdGV+B86TaImQdZKrOx0GFq2awb7FU6MrxVONhQ5V2huxGeW9h?=
 =?us-ascii?Q?e2GNGwQkpkM0f8Y+oKBIs5o4PidS725jHNicGv7+HosyImaTUUxRuUsnrhcO?=
 =?us-ascii?Q?jRHion9+1uFoxjeNPp34Jf9l+bXQCdVVLpO094J2zEkM9KPVn81Hiulii4sT?=
 =?us-ascii?Q?U2dBxFlFZ/bB0L2YYfZuu7O0yB0HEBmqQSbdkGwtoCZjzAeEa6CS7cqVcZYv?=
 =?us-ascii?Q?xsqk74SaouEn7Oxu0DcWX9vmp7zUkeFDZNHVqpITtPV7cnz0KKLc8654zT+G?=
 =?us-ascii?Q?UxbPj4DaDSywmZdLjZ86Ty8s77bDY1C7Q4R65vqw1NXo0idoqp2LGY45heY5?=
 =?us-ascii?Q?rFWxQGCCm5zdBMdzioSm2wn1PR7mf6rvcHauHEX3L/Wdndtfh7/BQxQdxh++?=
 =?us-ascii?Q?XhMC1UlcI5qFXek5pyx2Ye5VdI8LgI74/arx9csiIKAwqOV1vjGCnu+uNG0o?=
 =?us-ascii?Q?EQeqgHjZQO5cN/Bdcx6KZXjAjcaC/FiUM0AHwA4NXSgP4ZQF+Yfj5v8tqLbw?=
 =?us-ascii?Q?MxlG4uqOh3rJL/HadC0BqCvbXrsLXzyFwJiHmcnLuSfOGtEiWqJ8OA13W1sU?=
 =?us-ascii?Q?05CCju7th9cU/lKHPTgYMfoYH0HfkNVEb6159NFVqjVqGi1IIN+GvL82RM8m?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5adfa75-1c24-4b07-519c-08dcb5868efc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 19:41:11.0556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOVSbcZZDgpIoyWkDZApF+HaMl7H25Y/Ju7KqdHp7U5RHCpywNJmxboPRBfPV4inpTsT0yvtTqw9qeUXIIAKif165cO3lpDZtvyUMYSum0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer
 Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David
 S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> Following the discussion about handling of CXL fixed memory windows on
> arm64 [1] I decided to bite the bullet and move numa_memblks from x86 to
> the generic code so they will be available on arm64/riscv and maybe on
> loongarch sometime later.
> 
> While it could be possible to use memblock to describe CXL memory windows,
> it currently lacks notion of unpopulated memory ranges and numa_memblks
> does implement this.
> 
> Another reason to make numa_memblks generic is that both arch_numa (arm64
> and riscv) and loongarch use trimmed copy of x86 code although there is no
> fundamental reason why the same code cannot be used on all these platforms.
> Having numa_memblks in mm/ will make it's interaction with ACPI and FDT
> more consistent and I believe will reduce maintenance burden.
> 
> And with generic numa_memblks it is (almost) straightforward to enable NUMA
> emulation on arm64 and riscv.

Hey Mike,

So interesting to see this come full circle and instead of moving
numa_memblks to memblock, just uplevel numa_memblks. From the
perspective of having numa_memblks enhancements work for more
architectures this gets an enthusiastic thumbs up from me. Let me go
look at the details...
