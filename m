Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B694835A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 22:25:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ypfu+K8w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd7H65TFHz3cbg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 06:25:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ypfu+K8w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd7GR32Vqz3cRF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 06:25:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722889504; x=1754425504;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Sp6UrQjHfKTIiV0OxajD9WUV9lTbrwyfJd9vqA0ZyB0=;
  b=Ypfu+K8wOg4gmlsQb9JxinjEUoaqpbXFPABhrEsf5zCwj32V0SnghQn+
   vcEqBwl17fOel+7Jx4k9K35r3J/EX7MWyxSQVU2kcqbIDbjOeV74AG+ea
   v6M+W/kJPvgsiHnzLg+m7dUZnmHOKEceXc27rFHTmak5GVXod9DrKFm7H
   JoY+8u+ZvSXVMf7bj1tHCaDUJ/c3YMt3wOKRcs+7DoABR/bxJkxJETeDK
   D1fkdhfVKbn756lsXnW+g0mFn7WDXfgqQYGjbT3dzVCiT8wJjQOz9J9Jh
   woncvNw/s2y8R2e/JqBNDlbS41XQN8Fz/N4WznjLrK24+LDACaLA8pZbC
   w==;
X-CSE-ConnectionGUID: /JkJ3TTLSdakG9gnfVWgbg==
X-CSE-MsgGUID: 4VY22GRXS/SHC+Adk156tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24743219"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="24743219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 13:25:01 -0700
X-CSE-ConnectionGUID: 2zmwJoKtS/qutvqEWww30A==
X-CSE-MsgGUID: 1iGc26FXT7yxnT94c8YbJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56220125"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Aug 2024 13:25:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:24:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:24:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:24:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=freLFleVfIQUSqD/VmeSO9VXbluQ9pp1IFvsYFxfCPHVtQPBgStevb6mZcvJvjKcdYiVRtOx/d4t18oDsJH1NF4Eb2vhtBy0sooPlhLWUdC/QjYj+FSKBYRyf8laO+/0PbX3epfIgodeynI52klH3DgjP9T6NWrHi5Z9nsnufUAScV/8H92m5eyABe923kMk0+qXCQlCjJbDL1DvaccqNyc2fkTy71SlJxntQMNzR+59dtGxORcvqWVDoSQP6kf0ZuknjeIKK08rTDToDv7NkC2iRGxgdTDo34Y8PUae5unL0rPBzODUK4dkRMeVNKNy/wR3A91hSygRNTk7AGxdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2wN3ZvgUlYhiyuN4HPI6ZEAm+LjxfzvLNdV3iKwYEc=;
 b=bjET+OAP+5FFwyOXxTiv8PCIUHkOgdHtLrn58dq62YTKCoVpKeiuNIccYh78ZZMaOI4VOP472xeDw43TeN2zMCN0Jwq384hPkeWPhe2vrW99p5prWgviXYOHAfXiyqDGjzgQOoVN3ckpu0CCh7sFT32R3od5l260hEteEpumN8o4MUNHS0Abgp0SubcxeenPdmBF6rFJ5LJ8OBOXVvD8Id8CvK9vjcI52MsTd+6jCjuUFZRyXoC/HKKg5s5Ihy0v8y1NUWvJUFkJcOJDhWZzkj9PoXtBl3V4GycZeS3v0TaTtbtD6PTizp9FX9HbfKD5zAYQ0+8AFnvcEttKEYP3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 20:24:56 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7828.021; Mon, 5 Aug 2024
 20:24:56 +0000
Date: Mon, 5 Aug 2024 13:24:50 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Mike Rapoport <rppt@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 25/26] mm: make range-to-target_node lookup facility a
 part of numa_memblks
Message-ID: <66b13512a0fd3_c144829488@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-26-rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801060826.559858-26-rppt@kernel.org>
X-ClientProxiedBy: MW4PR04CA0145.namprd04.prod.outlook.com
 (2603:10b6:303:84::30) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|LV8PR11MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d41d9e-5cf1-40be-f00f-08dcb58cabbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eBznTBjIHsKdJuh5TFO6oStZgwqawyp4tjN1H0ygNtkBv8os0RSGZA7FtpYQ?=
 =?us-ascii?Q?JLqxvf+mrS1vTvJn6Ksz5RFsiCri+li4Mo4Q2kLKeVK8WO4T73gX+/di7f7h?=
 =?us-ascii?Q?XRfVwK9kd8ntSmS28Cp1txpPE+FI154E/I6O/Iu7J2hWzW0RsX/bzOqzTUND?=
 =?us-ascii?Q?ufe1SVNcfRzFp8wKAt8YxaJJ9Rud5806wJT9qXSfjY3MYMTb5u6crsQc/Vph?=
 =?us-ascii?Q?qm+48fJQIxKbmnO/AnK2U/t19GELmVqQ2gndpDJU82Cy6rnLFhxLo+czMMsz?=
 =?us-ascii?Q?OZoSkFq5OsaHo396Au82afRckkEilK0CevTgtpQk2MjYAIFe2FzMdSaU7i41?=
 =?us-ascii?Q?m4r4MNNeMxf4V9ais7WgWHM1idl7/sJXs8WPSXncexFBLOsfjuF6pyZPlSVu?=
 =?us-ascii?Q?+GbWPaWubdv2KnB9YLN6SrnHNNlQXj98QP9YCjdzEGSRi85ILqlQfUTtywrl?=
 =?us-ascii?Q?J+pOFsI8cyghpJW/ud8FDQZ3QW2UsgzLRS1YlfU4z97VMbJq/P7nOtrJrHRz?=
 =?us-ascii?Q?0WWE7pQrG1UmovEczYVNpCytz3B9QCb5J21p/IVab8XRaWBWEEI1LqbNanfU?=
 =?us-ascii?Q?Fjsvns15HVbfXa54dXxb+OenVSnyBIL+labdUIfEv+dZmcPCB9Z8FgsHknmj?=
 =?us-ascii?Q?FfQxh1/CWQBWWPjIbjfuNIqQ6D2CpPQJgMneZTMYCELrXKic0iYeVA5px+Li?=
 =?us-ascii?Q?R/OzcCXKTtZ796UwFZr8Qb3L32e67vY4taaZcCNu2QWIdzEcUo4oaTUCiJwP?=
 =?us-ascii?Q?Yv47BV+mArjtRuDk/xHuTxom+LwHRjYCdqQVGuEOukT5CIFNDTR+/suPOEmW?=
 =?us-ascii?Q?Y9nviiRsnlCjpL2NTdA6IHJ46wnplZI9Ypg5whsFReI2DDDBwyThKnJzIVhn?=
 =?us-ascii?Q?Lm9J/Ur7sTMphom+w3+WNfqH+2NfhXJsy6RdEJuTgdrT2kvCfEAEq0Er3iAD?=
 =?us-ascii?Q?zP+vqcuKYSefFqt+jSvwqpJC+05XHkUiP4bhGiyvcZe7wqhN5z9UHsa+bPsH?=
 =?us-ascii?Q?yql/CRYRwgHy6VCrK9kYRMZeaMhYd0uE+l96DgwhqHN4CfD839yaHy196YII?=
 =?us-ascii?Q?dyPy0jNsMvnXNP7quFw8DbdOWBE4x7QITNLiDxoqigP7oWzLVb+F5gJoH100?=
 =?us-ascii?Q?bSRmAIJOk+ftv3/uBvm+IRDS8CaugmbRk5ovMUY3+DjwpbstdsbhC5ZCSxes?=
 =?us-ascii?Q?NRcvhZhIngmrT9V0wAGTY+mP/ZVwDGihJ55HCOj21XV3hRTpxDW48DNi3o9J?=
 =?us-ascii?Q?/VRBlFOQTM9D8TCobsskkTdQIfc1CGnYnolXd6q2oi1lm08r5CjsvIEQOnZa?=
 =?us-ascii?Q?E0ccOwUQ0sUM1EUUODyJ5nmdIHPO5uQSypBW6SQPZivv8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pGV1HyXyZq4XiBhT8Uabr/RqyYhCP7tqNTCr3wZzMRAHE0n2ndBVhmgf4tO4?=
 =?us-ascii?Q?brtC7MwprEO21qgk8BS+8tfVTFk8ZRK0V9AFr/56UMF0B3GH0UaM9fgpbzSW?=
 =?us-ascii?Q?geIHeC8JlrzE8uRhDKEeCpLzfqywPmWENu3riyAqfyelUqiR0/EfdoVqmwRY?=
 =?us-ascii?Q?kdQEoP0/br/bw+pkOBuR1NgVP25AV7fWZTxLld6knLLvoNn0WpJK6v3sUPC1?=
 =?us-ascii?Q?vWDrfhiHcWqQKmcA56v6jOdCiGY6Sa01xfpYRKfnsaloR4Blr1bcIm/Z+Yu3?=
 =?us-ascii?Q?AcN3K1i+p0M4WHrMBdKuJLx3mEZ1fDy0gyVZSDC+LgrJxLUw0NdmDzKLuq0f?=
 =?us-ascii?Q?6kUn/A72Vo++WyOUQCPBctpURHtOaIS0QaTNYC7eED/ePjc55hdtm97znZAF?=
 =?us-ascii?Q?e+tvU7lC0B+K8jRg1dWjdkVGv5x4njEeGIz/A0iIaChqc+qLj0A2eLbrrUML?=
 =?us-ascii?Q?kUqtZ1gERS7tWMIo9erqhlwtCLU6B+hvK189llkU3tMeDZNE/M0V/vJWIu5q?=
 =?us-ascii?Q?KNHLkGNBquWkb/H8PP6kIsH8ZeOvKuFCQxs6Jou8UEjU8Mw4qr6cmIbzWy6Q?=
 =?us-ascii?Q?R6EDm3TLJIa5zv4/V2higyW/p8bFABsMxyACBIbfcTZdPN847mReSoUJI1jD?=
 =?us-ascii?Q?C5kkWl0gZ/teR4C6JjekUAEKNFPKdQ1YPbeuXuAzNPtXx9GjzRfEJOVh/B3v?=
 =?us-ascii?Q?bUmsL4xGSNRLt2sVEDTjCH843MQcq5ps6R2tLvv4e1JnwL3JZemSD35rQ/D4?=
 =?us-ascii?Q?8NowguRsnXADKAChG0FMEwqpi5m7XrCSp1AvvHoodwtLicUbM5eWympz3QWe?=
 =?us-ascii?Q?Xa8eOkkyjqwR1AM2fmJTpHVXBY3vXyZXY0RXpA8mfz5kbnDlQJfLFlOu1QYA?=
 =?us-ascii?Q?yt/8iC4k4Xdr31z4iJ591j2x8uDuBX8lKKKAC6ul8G1XgZMNCr9awj0xP2OI?=
 =?us-ascii?Q?l4xeJ3EF2wkFZYmTyvXMEs+BZNW/PsbFqodB1s9tXoOg+S4qvo3lly+/9izU?=
 =?us-ascii?Q?6VuDgLJ1NsjMgIETxJV0ndS2QDKk5LRcM8mqBzEpGxc564ausyTbpouYM2W4?=
 =?us-ascii?Q?+TxePo5pZ8y9iM6ygEj6USYp5qLCmEqcWoRHXeh7KvKvXFHei81ypw4mzioV?=
 =?us-ascii?Q?IpKmWcRvrJhp9USIanJVIKPx23+y105qz6pw3IC/mrI8nTGyIg83ikOlVC7K?=
 =?us-ascii?Q?CmAElk65TlHX22jTYAfYIK2EAqM/wR0LdNOiAFnjYQfwl1GOkAuHEeTMwj71?=
 =?us-ascii?Q?3q023e62T6/GWKSARHaZabXsE5LyD10ZFCJeSMh/7u9M0JLyyI44zxwluuVn?=
 =?us-ascii?Q?SzVMMzhMSJWT0+AFwFhqFo2aKLf23NCpVgese0l5bhQRDwwGlcPy4ydXCfkN?=
 =?us-ascii?Q?DNwCn76VV9rvhNPDWDqclzGwieOKHLncxZZsoP7KQB9gv+CxqmvJ3s5D2ZES?=
 =?us-ascii?Q?02VhDHGycHk4AhlGK2lz/9BlHo9UvghGUJYP2qINJhG2AoWfrMwit0mGTT8g?=
 =?us-ascii?Q?P+vCM75AFD4lVJuCk1IBHBOYsxjCxiBtv0WvaKJVj6Gb5M+rB87BUYbtfQR8?=
 =?us-ascii?Q?wz+UCB7yIiPXF1o7cvdwgD74pLjH6SA3zy+c1YL3kXU7a7Ut4qIofCQqIUeO?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d41d9e-5cf1-40be-f00f-08dcb58cabbb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:24:56.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwejzbO57+MkvcuTdKnMe/mEWX32gqlwOWtULyQjHrFHuNGY/VXmP/axItoYZRtEgA7CsNN82jDQBE7toI4CULXl8xfOB9i2l5mk/o8bhRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8772
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
> The x86 implementation of range-to-target_node lookup (i.e.
> phys_to_target_node() and memory_add_physaddr_to_nid()) relies on
> numa_memblks.
> 
> Since numa_memblks are now part of the generic code, move these
> functions from x86 to mm/numa_memblks.c and select
> CONFIG_NUMA_KEEP_MEMINFO when CONFIG_NUMA_MEMBLKS=y for dax and cxl.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64

Looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
