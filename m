Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34EB94836A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 22:27:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eJQPY+Vq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd7Jk5m0rz3cmr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 06:27:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eJQPY+Vq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd7J25cRJz3cR3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 06:26:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722889587; x=1754425587;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=NPalB0dL4Gm3cP8Ax/Da+Dk/ksh/LGkkgSWDud5FFMg=;
  b=eJQPY+VqpqDQlV1xWOdSoOPpMUB7u6Mn0TR4FN9jPm0v+9tYw+LWNxwl
   lsy9xrG1JEs/tMPzhy8WN3Vm05tBrfxiPwPOeraledAW+yJqrvsgv0X72
   VgZ9m5I838dV2tw7flIO0WLkPLzlxiTMi0KXskAF7cUPb44PMHyeVDccX
   cAECxVO+H2KmujW+N3P0ahaAJXVH1zF3NmYP4OLRkSHVrTOXUbSeCCOyf
   hzEIFE+hi62x2uvwkWCeZWyRMacCCSZh+c43LPz0H04SQhA2wMbeSM7mf
   QxyzsIstAN6TgjGnUeO22mLN9yE+gw2ZHU+q//pHTy6smUjNDN/Rs6Ton
   A==;
X-CSE-ConnectionGUID: CNOWBKn9SzquzxwLwjRgZA==
X-CSE-MsgGUID: 3kS7d1ADSQ+3zZRQlov17Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="23789578"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="23789578"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 13:26:24 -0700
X-CSE-ConnectionGUID: nqiOt7XhS7CPFtskWU1i7w==
X-CSE-MsgGUID: BUZ7RhCxTBuDQiTjXeuoYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="61094202"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Aug 2024 13:26:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:26:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:26:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:26:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY8kq/VPIDFkn2epkAHy43BjLUD9/jiF/y2xMXL/UQ5DzqzUejFFIlGSIO1DVZZvvhpZ32CLUchI0dD2TK3yjHNva6Qc+7uQKJAEDHhMhgzZF2YEcjJL1xanUxDbZbf7dh4B7iVeS2k2XIXMwaJOk0WfGfQkjnThI9DWHLz8mEw9UsXUiVV8FYNKnprYOsYDHPkPZzx4oi4rBGDKzYa3U1+6NzwmO+lMHu+nyJmRKRXezvNJVOjMMlIrE/pw241DinUtD/I7olYV5ViV7y84AoAcIx81OksGBsu4/hItgzkOhv/vUK79iPF7TY4ChFpfMqklZIGSHcWx2+H2D427Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP9A5FmudYehYnHl82tb4FTAOigIeMbpmD/vInFfAP0=;
 b=s7bFWfs8SA4bGCzPrSovPYwldWF618vqTEKrUTM1DgkCDDHeDQvWHtDkmyVvaoITkOcchcMzngSEAzsHN6IX6p5+YwWvhmS1jHURXGi/hZpoA68jiX3/qCt+DUoEp31tfkzkdFiWd9ZlK4Slbjw+3fCe1kAEDAO2JZq45GC+7nUGyIHTenim2cGrFFHtLvRB0/aFIYA9iKkesLwR3bxh8qhM9eaaPZO5XkopdzOporVowp8GfuZ6faovarmYf8vNEQH3uQ3A1+yLSUEaFvnaorAHpMnLb5289vi13lMYyFbO8rmX70S/DM8ZnEbKWfhDlYw3sQNxhVCaqCz9nhotew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 20:26:19 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7828.021; Mon, 5 Aug 2024
 20:26:19 +0000
Date: Mon, 5 Aug 2024 13:26:13 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, Mike Rapoport <rppt@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/26] mm: introduce numa_memblks
Message-ID: <66b135659ad15_c14482941a@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240801060826.559858-1-rppt@kernel.org>
 <66b12ad232a7_c14482943e@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <66b12ad232a7_c14482943e@dwillia2-xfh.jf.intel.com.notmuch>
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|LV8PR11MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b0f811-4971-4af2-8b5e-08dcb58cdd17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YERVX2wVlYt+ysS2EoF4EsZHqd+7xH/7VzDgDIHF3JQxgOK+urMQZvDZ2HMm?=
 =?us-ascii?Q?h/krpIz524sjPumhxFf7RZGKqgcYDyEkdxfsdu8Ypw0DH3ADukZoM8//glei?=
 =?us-ascii?Q?/hKcb6o6uSI+uqshYYdtdq199zdUQJYnabTQmP9uh+uvRBr5RsKpgK83nSft?=
 =?us-ascii?Q?tSYu0a5wtSZavhFeOYARRl6xcNUltMn5lKJlgDs5FWuydL/4VtM71k+BeQ5d?=
 =?us-ascii?Q?bXhIc0EKyIxQQPADwvl6B3c9bxxw0n56T441PIvI9lIqmoh1n9wZpEXjxEmt?=
 =?us-ascii?Q?mYkNd1+HLSQCmAPRkd9+R9CiC3e2xrj0NSLfjKqwJGN58RxPX18Nf910RdWM?=
 =?us-ascii?Q?ih0jSLyRfoXhUo8hZGlASsS03YfWmymU6Rc5SICUnUez/UsAB93LX676s75a?=
 =?us-ascii?Q?SoI3Y2R35F5Yt2ScaGTvFLTwjERBIArlYeYTILXnmCsFspbYYIsay6rdRvGu?=
 =?us-ascii?Q?Z8OfriDY3DdkRJ7KN01cuIcOINPhmLYm82JfRbJCLYkLYnWzzHNirf3p6QF8?=
 =?us-ascii?Q?Q6QqaOWGhBwffYg/aaSa5CsjuT+IgJYxKFLT4PuvXV3T/+AcYo5vfO/vsnov?=
 =?us-ascii?Q?1XuAW0JjO1AvZGLhaXQznLPxid2rQP0ApIuHTwQaJw+PdKgo1bO9izq/4sO5?=
 =?us-ascii?Q?Z7dNeKmoVENgwgW2VCM9zHHhRRQwNJtxUa4Wpb/tVxoM0V1IxBZ0dfpdQ8bQ?=
 =?us-ascii?Q?XxNw+boMrdDhD97zBQF+kgxy1BdoCxsZj6oTztGtW2erzCj9eWuXbj9HK11Z?=
 =?us-ascii?Q?5Gh/+KoNtUZzVl+GgokypNLnJVfAzPmIqgH2CqzgMMX+1Ci+PyOod16mjB+h?=
 =?us-ascii?Q?KmV7XTeJ2FaxzhzdwAH2irlEFyfSG2sHJFCwGIpnW1X+UzB7q+KMAUEDyP4v?=
 =?us-ascii?Q?EUm7qOXXSawBs3+H2bgAnm6xTYcfRI7GA9YYUl2OEExKmfXcOdEkkTWyjDfa?=
 =?us-ascii?Q?TwuxjwpTG1/NC/4a9M8sUaFjlIdjQ9H3YnpdUt/grEb8bewUAjew0lfBZ5H/?=
 =?us-ascii?Q?Q3h+9L2csShM1yOZd/ko8ze2CRCCgdOwEGyLq4SHbpKU1WOKZTsP6f/iLXkH?=
 =?us-ascii?Q?0SQfFLaMDdXnYmXN3/rq6GfhoEfZz2x4dBZLZxGrHUsPpJw1vK9L2ANDiqes?=
 =?us-ascii?Q?0LF62DzlzQnf8Rm7cXLDucT0/Yl6E9qemDB505pMjK0kojz3BsADY1QYbr0c?=
 =?us-ascii?Q?nt9B911GDUunqfy4wiuVpL2AIKssITuaCje+7oOqq4a1ax2x0SdRH8zKONC7?=
 =?us-ascii?Q?O5fYkrxJBkr8N0ruYfgermP4y1fsh7IhQlSt5G+sHWzBBntJWtqyNGRUnu9T?=
 =?us-ascii?Q?YoQxWlmAasdzbguDDo0z+olS/sLdAQch22wV9qIrMW7mnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VfSolK1oQra9tIDD1NEdQw+q+Xxf1iqUpZqG6D5Asxa6rVCS65jt61NbWXgv?=
 =?us-ascii?Q?eYvwRnE6m8+1AM2kvNrhyPPhknV/U3H3LRsAWKIigYzhX9vP2GLI7iH4sNDy?=
 =?us-ascii?Q?EdkWSeliPs2xPOLgr7EJz2OoAHGUSb6D0x23nv9X+WhV3tRoNpEct6NPd7VJ?=
 =?us-ascii?Q?ldk2AQUcF5D7o0eU8fxNNO4EmNyj4C+KGyh9yBc5zSXyD44GQI5aRwzPnWpm?=
 =?us-ascii?Q?cVOVTC3vGHQrrWyneYyiyuYbbeORNTM7ztOlMVx16KoUUJwQplBnIiBQGKTX?=
 =?us-ascii?Q?3XK8u7Hs2Ef9WHo73r/yLFgpMDPV4Jwx0ypg/3DIMnCVLPtPZdO1uIqfEPMZ?=
 =?us-ascii?Q?Cc4bhoAWPginMW8r+qJwnFHiqXYbhI4j6V6RZbQ3k75DGC97U7u4ANi2NBOj?=
 =?us-ascii?Q?wDSv7eE92Gnx2Zty+NyR5WEDfNMqqLWTAtu3Y1aQIt1aN8WrU1QFuvW9DNp3?=
 =?us-ascii?Q?PhQwcpai5DWakCL2oPG+pnuHzALSwfgA/gnkoVArtlGTfxaQsW5vyS6CCZvV?=
 =?us-ascii?Q?TF0GVRnRffdIV9Qx0GpdMp58LhjFOCmKyNqXjL96hegTOI+3VvUUuszCIF27?=
 =?us-ascii?Q?cOSEq1s+qeSxuLBOReYjXZy/TAS6VQfmwBQxgYSFSixfflgEshfBsQF+k52B?=
 =?us-ascii?Q?1BNAGX11HsV0GGRQp05jffzMsgzi14UfE4c41XxxVyJOyeZ0dKiY4DsGz//U?=
 =?us-ascii?Q?5jfrtCEIoYQstmURfu1JoJFCgU6yNnpVnkp7VfqU/JUvhXpZEgZdlroOehIZ?=
 =?us-ascii?Q?+Oretl5ZUzgR9Z+ZdNLBmatqxBK+mhVEnr3xp6gtBGE3+4MOe6jCgU69ps/V?=
 =?us-ascii?Q?KujNoMVu4vAV2BsOL8+/cCWP6dpX/XBbDtgsbRnxN+YnYJbUtc80JygYztME?=
 =?us-ascii?Q?JLqpnggrJiMwuY2ZUcvXYEU8PEAsbgvUc8Jkz1cWpEbrBq7qAUqazKWopCiJ?=
 =?us-ascii?Q?vffSomSCkCLPIudATbfWdEg0D/z+4Q1h3CCdCUKeR/kCg6WaTXrN7RhEcK9j?=
 =?us-ascii?Q?Vgr/Skjib5YxTnecjlG+0vffls5VwZvvlwHiLuZovfriZw7/jmKTjxs6CRDL?=
 =?us-ascii?Q?Vz1C+wJyYv5DoQNtNiL3ZWW/D/OiJZENpQPpWCAlPABxQLfPkgo8QFd5kGpj?=
 =?us-ascii?Q?dvD+cIXcCRjwOOJLDdX/c85ssCD8/3jaxCgNkPOb3cGYOGn2btyuKzPIeo9+?=
 =?us-ascii?Q?IZuLSKOMxoT6kiQYlPXbPsKoJQ0U8T2QhBjMsRA3TnnMmjdB2MyM7cQkGyjh?=
 =?us-ascii?Q?tEfcHiVstgu6wExS471cpGZ3AfJJH948ZhTMinUqGetmraoe0bzQkWXpSEyv?=
 =?us-ascii?Q?sRk42DwBk24Unt52myINGfJDhBbc1RxSi+uKXI2k6pa6/v2N5Ff9+H97aa3a?=
 =?us-ascii?Q?zTmafi4ZIZcNMwpMKxCoDOulDUpSeDuRDDD2xGzMy969vXBrmCkYXz/JApTu?=
 =?us-ascii?Q?7LIe58d6DGwmKUC+4gPNkA48yT3qlN0Imj6gtVeJVG13LoXKs5SWg603ltSQ?=
 =?us-ascii?Q?InNOb8CH0EbJUsLKyYwGOYHsLE0U4o0bb6L8HD31Y1lOiNKx2HUxBEn4njUV?=
 =?us-ascii?Q?xW6JyCESP9fp8OBmwy+O0goqZ/+RhNwpYloZH4pKntIXNJRuX70ZD5E3OQQG?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b0f811-4971-4af2-8b5e-08dcb58cdd17
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:26:19.0701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfToQGCd3Q5fNawrKolrB4LBs88jgJxexZ24u2ypnw0dJkyvJMsY+zfDDNrw067Jri1Xyn1O5U960fBkm+5QrkPP1Vo/xZj3ECFVSpbTK+Q=
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

Dan Williams wrote:
> Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Hi,
> > 
> > Following the discussion about handling of CXL fixed memory windows on
> > arm64 [1] I decided to bite the bullet and move numa_memblks from x86 to
> > the generic code so they will be available on arm64/riscv and maybe on
> > loongarch sometime later.
> > 
> > While it could be possible to use memblock to describe CXL memory windows,
> > it currently lacks notion of unpopulated memory ranges and numa_memblks
> > does implement this.
> > 
> > Another reason to make numa_memblks generic is that both arch_numa (arm64
> > and riscv) and loongarch use trimmed copy of x86 code although there is no
> > fundamental reason why the same code cannot be used on all these platforms.
> > Having numa_memblks in mm/ will make it's interaction with ACPI and FDT
> > more consistent and I believe will reduce maintenance burden.
> > 
> > And with generic numa_memblks it is (almost) straightforward to enable NUMA
> > emulation on arm64 and riscv.
> 
> Hey Mike,
> 
> So interesting to see this come full circle and instead of moving
> numa_memblks to memblock, just uplevel numa_memblks. From the
> perspective of having numa_memblks enhancements work for more
> architectures this gets an enthusiastic thumbs up from me. Let me go
> look at the details...

For the series you can add:

Acked-by: Dan Williams <dan.j.williams@intel.com>
