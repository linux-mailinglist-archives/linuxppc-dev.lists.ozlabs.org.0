Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0829482F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 22:10:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mgg9lD5O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd6xp0GQXz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 06:10:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mgg9lD5O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd6x64m4Rz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 06:10:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722888603; x=1754424603;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xexUsSlJuxAmR01lkpRe5Bi89XRK3XdxA01gLwbrrQQ=;
  b=Mgg9lD5Ota355HQHMCsnG84IBGGgkOjQWCRl9nf3jVH4J6xfRy72yIrb
   9zkxNIZa2AG5vpZdJf2GuoR5XYoaUxxV9BkyThoguSVvvJWjkAGKF8aZS
   SHqrNs42CwNBkcO/3Gi8TkhjH8Gx9DxEpXE9oll/qkC0pOlyT6UhAFSJ6
   oV4QZN8OJbmIOfFjEcPfR+3Qhf5a7pSHGLLq9g10IFg20IjlY8LwbNGBD
   1/hpNqQQ7xOtiVhcx7Fw1G1TfowIn/p8hlPAb21NJ9ZQiYWzJ5AgXNb6A
   UXEyAiN8O/VM4ig7W+3ycbY5kJc6Ekd6rZepPA7k7JsCXT1ce5v1u3i/6
   Q==;
X-CSE-ConnectionGUID: WV08M0uHTjK6/97u4zYnHA==
X-CSE-MsgGUID: TzhtWRQETbWmgCupgCV9mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21024359"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="21024359"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 13:09:59 -0700
X-CSE-ConnectionGUID: +lSM0o8HToyh9VitbA389Q==
X-CSE-MsgGUID: qyiorVnZQ26F03kczXKkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56192488"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Aug 2024 13:10:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:09:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:09:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LklszmsgKbfFCbLDnkF8MazBG2UmtPXMxnrND+hsHSzkdTpFFDzxK8I4pro/Chz6WPKG0LGTYXfMr7tI2KcGXKDS6Isg6w+hLhgChUJHhComoUXhBhWOVSJXB9hZMPMtYtsJgsrWSEZdouC9qN244tVxjDbRRkAKmTq+4tdQNgoeaAF7YnFOGfYw24apnogJIH1AhkRMBHaqTq+MyCgvsuCZ8CDvZ3y0rqZMrtNBjJ4lrgdjNsV6+PKD5vYiWmPbpzZ/kZyo42HdbYmO4uYpocIA/IFM+amOGmciJin2fKlyXmXycw8tXZbFjBsw/UHuwD8teeuhsuaSY9Hi+y0vWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6Moaga2EI8LbANLmifr+jujmq7TevU1TLpIzlzDeLA=;
 b=xPcw+hfGFRIdqTUOm6XcFzb5BXCclvPfSPGqJiNCM7/UKLrv6GHB0pjVTT2XEzaqL4tL9cJDCaYkdbEYpiKCHV5uM766P5s5Rdz1fo7dxsExyoe8Ac+c2ux1kaukeGez8tiwOqFMt/mOWoyj5rd4VWbbGvg3rVXtx5rheBAzkDoz1RXo4joGzDZg9Vi7RKIHHzqJAFdeqh6SmZAUq30mMY9QOUs7LfGXOrT9UsyVoteaQ3bJ4BP4+s5X8z4cEqXOL6RpClK7HT1z+Hw6A6g3MHEoqn9xPd18dZfXer/7fITdER36WsKMKW5BkjHF37ImmNRPXm3zS29T1sRWg5TYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Mon, 5 Aug
 2024 20:09:56 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7828.021; Mon, 5 Aug 2024
 20:09:56 +0000
Date: Mon, 5 Aug 2024 13:09:50 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Mike Rapoport <rppt@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 19/26] mm: introduce numa_emulation
Message-ID: <66b1318ec02a0_c14482949@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-20-rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801060826.559858-20-rppt@kernel.org>
X-ClientProxiedBy: MW4P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::26) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM6PR11MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b5c11d-cdeb-4277-0466-08dcb58a934d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CTLkbw4dSBrlk3rgMilC8goX/EBGn2WJP2htVxFChcIk4kkfVtOSJ78e1ckR?=
 =?us-ascii?Q?GzEzvZLJmjpBnkEHW+La9WsAqDAv99xzdOdPMUvdE7ELQN1wnR9GL3fIyGEH?=
 =?us-ascii?Q?b/0MQpK9/lKOtZ4Mf9C30TWGQOPIKilECSmfjkkHOV6x/h+rlOW/o7hmwxdr?=
 =?us-ascii?Q?nxHT9uF6ZC2DUaR4ETmOckl+stq7rhwmJvfXE0qk/yrp6D5vJchaLt6nWQcG?=
 =?us-ascii?Q?u8LSyX9zFNSkYOt8GeEUdnwhmbZfyNEHfNcCoz5PFWolRmmA0qn+XkoFh9wT?=
 =?us-ascii?Q?f0Ghl/KDr/I12Yg2Xxb5koY/owDkH/5eoG7ILXADfBmFnL7IFgEsTB1CxFrg?=
 =?us-ascii?Q?EvF/tUfj2SEZub11w9+payWPsYrPpjRw1kp19D5c/D9jHLWVlmwjMCFDd7vL?=
 =?us-ascii?Q?W44Gq3SiTFthlf3Qko8ylEn4qgRxzZELlYXLFgGEYrj09QWgMwR3u8II0m60?=
 =?us-ascii?Q?AuS+vEYxjzpnnhL6MHJo7quX+qRnfPVyagyhUE4gblyl2lVdOV0GWpVgRJ5K?=
 =?us-ascii?Q?IT6hwVFZbIHxdv0t+orct6sepX3KMTgzV1/0f2g2epJS0w+8Ow1zSlDZguVf?=
 =?us-ascii?Q?sMKfhFtPKFvn/KmGglYA8iogE/sP+qgds1tRilZmrkzAUJIOeg2q9qaZoVOW?=
 =?us-ascii?Q?Z4GR/plYE8gysYxnI6kA6PPKaWdtm63ZcidTBBN0s3WyOO4U2IoL8PX/8Sc+?=
 =?us-ascii?Q?WOrBf1Ok9LUBVBq9DS2mOHVDXaY8U9fY5eDhTrcmuE72ZARAwga/zWB82Q+x?=
 =?us-ascii?Q?zSgckN+DHx3KMajSpiPRlpfgK/7ARghziIRV4T/M3gycfTjnfIZtd/P9NEfO?=
 =?us-ascii?Q?5Pab5zjqDWLFh2/GLlJo37H11I0CqXgOSqi9LCHP92v03He0/cIoQabtu+Kd?=
 =?us-ascii?Q?5YqcFu8vcT6jrmXRZEU/bJ4g9pe4FDRfr/zo6Ip6B9qKcI6x3doNsw/Gp8/a?=
 =?us-ascii?Q?ATRoJV6mf8/wrtmsgqhACcnTOCW2kMybGvBSv4NuEZuMLHlZPajnlsHp6RGp?=
 =?us-ascii?Q?Vyfy+mQeV+EOxnWmRidw43Ahht3QdM2OWjmmIt1iC+pONxRJSo8RB6Y3uzVQ?=
 =?us-ascii?Q?iPeyrLtygDkefchXiqe9Ng5e2Y2TpdqRmetCFF02L/vII3tou2O+Ykq7y25W?=
 =?us-ascii?Q?hA0P3LQV+TwbrjvQyJejf1yqI8OpSy4EnQru+xH9+4TKlCbqxVteLt6rIL4d?=
 =?us-ascii?Q?0BCKlfjFtfPj9PEK3MfQQWgY41jD21kIZkvulTucH8L7aOd9FVwinbYtM5+H?=
 =?us-ascii?Q?sgKb1TLOi6qokCHo6oW1sGuLiL1qi9hUyej8XOwmwYXmNw6gGDVygkOExOZO?=
 =?us-ascii?Q?st3gPDKs0mpRJNk49nbLriwTUBw6HYJO1kI43oo95A0pEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pKZeH1nnc88PrgwRwBQF8ITGFigfDjjLu6iuXLNhVOQfyRSBsEi6QWf3d8MG?=
 =?us-ascii?Q?NpPpLiIU1i2OAbEupf7THAXQoiyyrLSa5sHCibOtXn0+6O8tdXLfeZhjf6iG?=
 =?us-ascii?Q?SQWbnZmhVPbGlcxQZPV2U0Wdg4rm1ruLh8AtpoB+00xzvNOkhWvoaWyVtxjO?=
 =?us-ascii?Q?9cq9mkYSQE0TFaEfpe0Pde4rvrV1NfV603jqBJiBzpciJ8X671e2dvhmvhr6?=
 =?us-ascii?Q?DjXN0iXm84L4k4XCTSYeRxulVjbMA5mepS5SRWYFi7bYoLP+06rzuXihZ8do?=
 =?us-ascii?Q?eSTM/DJf5F8Gm2T+nB0jJZtZY805erZKXxwqbfIwKqZY8KqwiHCSYanpKvVt?=
 =?us-ascii?Q?U8P0XlC7qJLomFU9c/96bNAVNiEOocaR0gPSDFXAixvIltrjN+6aJmdYDw9S?=
 =?us-ascii?Q?PS+u6SMXBdv2PsVowlk8/3/CyImI3wlwBu+yQihLdeqijsg7dOuY9kn69XcE?=
 =?us-ascii?Q?7C984m4ceNJ1WX7bAbenoAFMylGWbym1pjAOtc0tAKb1icJDxTHuKx+wMLvC?=
 =?us-ascii?Q?5H8mnHKJr36KdDi4x1c9aIFaW37JDfzwfdhMAE7uUlKW/tX0bvmdTvmNkkU/?=
 =?us-ascii?Q?BBBtuL1j1qMcBKM0iIFYjKXRw+7xRmre9z0IhfAdlCulGooIBBRHsG8G5WIF?=
 =?us-ascii?Q?q9f/hKnq9vwR6NrGZyf98If1IvrSpEK+Evja+HMTYI5t0fh0OadXZoaUIBh5?=
 =?us-ascii?Q?t0CFIyhFs4u67KFA2P56YTEZ/ZjZHNvw05QGW94Y2vLqz6YrdTpPKCJNnHf9?=
 =?us-ascii?Q?eY1u9ZDu+cVG8rYDxFuJGiTRpFGtkQ7R9nGBxMuDrqfAsFbcumVy3JMk0dq+?=
 =?us-ascii?Q?t2+96OTWIakEEkQ69WpmA0pdY5mVhjjRgUTuEQsZLWMeUnsop9TrYtG+Kkpo?=
 =?us-ascii?Q?Io8XWnF7gr1KM6SJjzpvErNQRcividF0qx14/30taarTYA7JIWOSvHoK50cv?=
 =?us-ascii?Q?FQBWRa4HYhE682GA0xyIdYnJVQxbdrbIEEwpKxkeMVRJRf3bGdZxomATdfT5?=
 =?us-ascii?Q?4Vb5u4gJirFaFVCVVUmmjjhSZfwWcO28ZvxKwMjQxd+hoVUv0DNS0IDzqHOH?=
 =?us-ascii?Q?CPVOa34sag/JueoXS85NcUQGfGHbvDgnlyM5FIaIuP737LaUEaX5MVkUbg1R?=
 =?us-ascii?Q?UJ7hGoKjX33yfWZAvmM62Tw1Q0jPiHcuWzYr1smXtmPFTkkHRTZgk4GQ7gPK?=
 =?us-ascii?Q?395Xx+AAvVJwq01IemWUiZ3KR8s1/dwiQvvIHL+B+tcP3BP0/wGy7SlWk+Kf?=
 =?us-ascii?Q?dJJelS1eHYxwW+Y7rdJJeNCgpGq0E7Pk6CAb5uwflLKKYDkq0NVfYakYAqYj?=
 =?us-ascii?Q?Lddr3yuk66M90GIlUFCRe8XB8fiJ1BF+cZoqWUXVgct2/aBWKvMdXYR3napg?=
 =?us-ascii?Q?spkoTjjXuMgNH41hg1OMEOA4lFU1FVzPMJicY3gHaOjUZc7q2g+LJWOSgBPB?=
 =?us-ascii?Q?JegknA2v00Nfkd4sxzgzH1XkjhBy8SAyFUxiESTeniRmsK9AOgdLduJoPPn7?=
 =?us-ascii?Q?7IK1utpbHEN9MWKOQG79Fx1nkYFkLDHggldL75669fJB2lIL26yALvIQ835p?=
 =?us-ascii?Q?A7isCD/sxo/0zt4c5rxXmpSrLY1SIsw1XJd8tyY9RHmR6LK0VVx1htEPJx1W?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b5c11d-cdeb-4277-0466-08dcb58a934d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:09:56.2167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJSDi99nlMF1U87N1OY5MEH1Gh5h09/BNjzOeUSn7xwuUnI/Cx9Vzj1foMj+xaji2Qbe1/hNXG4Dno6EuMW2a6WR7ZH5zM95A1ioGFMosT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
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
> Move numa_emulation codfrom arch/x86 to mm/numa_emulation.c

s/codfrom/code from/

I am surprised that numa-emulation stayed x86 only for so long. I think
it is useful facility for debugging NUMA scaling and heterogenous memory
topologies. So, glad to see it upleveled.
