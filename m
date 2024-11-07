Return-Path: <linuxppc-dev+bounces-2958-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADDE9BFE71
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 07:28:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkXFr3QBrz3bjf;
	Thu,  7 Nov 2024 17:28:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730960912;
	cv=fail; b=EOQiNKbQcP7/RxMekhF4vS1JRgcmsM+CL6CEzj8zVQ7I4pE5yyWLO/OKNyq6bd1tN370ABE1Xc6jZv2fSw4cF8MuQHhxWyiY9iWLrdo3kb8BegQxQRCve83FGrV8QXb7OOEO8ZejK00mNEajJNQZgfjL1JzTTMl4WWR84SeeU18/N4HSkA0P3ShsRzZc/uHjb7hCXe7Z7POK0PsP4zyV+HE2NEpUL+u5zj76hVkQxyMvvHnMT+C8NWpP58yjXc7rlFj/beCERAQiavH0mJgpdsGLOGupcfN2Ls7KgvyXg3oQxgCXw49zUp137mgEIpgWuAQdpnR2mviHoZXSIbfwaw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730960912; c=relaxed/relaxed;
	bh=Lzbiy4dgvBuUKU/ngGPcQWS5zP84MriMlZDZMJYhvqw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cbzaltwprVIZlt3QytpQ1PH50WNVoCpGCVG9gjU++3xd2QFVO9wvl6PkIxH3M3NK0N4MZBmT9ADpE8DpXdKsMAhTu+yavpU6bJc69se7VtPPZmf9AQln4VovJO7y3Z9W2qsVo8ZVKRsf5pOYFoR9Bk8gAluS2tgfw8kNc13m91HMMYrf0LwHMJjxfCgKSOUdj/JGkaW5xjULDS/SyRtei8cje+Z98MkD0hHPyBHbHLmm583qw+Bmlqg1RhKV4dmdOh080aZPo7FrgjThAkVt9B3J9rs8t0EuIhrqgo0W5yWT/3az+5ywhn7ZmkU56jkzRgCUHiivSrESqnMhk+wCtQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DBTiJQRM; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lucas.demarchi@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DBTiJQRM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lucas.demarchi@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 07 Nov 2024 17:28:29 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkXFn3jBVz2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:28:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730960909; x=1762496909;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Hoh+0S0hd0eJ2Etmjrb2mnMTyhRoDvd5qjGWHoWIge0=;
  b=DBTiJQRM3VvfIVwu9IyvdmaBjoc/sErQbpz29PN8Pp2lQRLvweqH5+PW
   UcCEyVSO9Q4OgDwscGQyr8AmWIGUtsLMENVbxEr1p15Sjo9KbptfZ9jx4
   L25vel89fMGxg+BqVqMgPvoAXD+/cVxRfw/nziwYIoiFsyjBPBqkaqsV9
   AZWp66+LVrUIjbKY6dtnGrmRMXUHnUsDZG6PKsddxLKslINnHTzXOhoNQ
   9hNJgQ5gCWF1QFBAo7jcYcWOUqYs/EZgFHxXyahwY4V2TnxQsTLG5QfOR
   e8J5URCAnUAiQFbtHETC+t4W+N3LlQtmbIuaf35dK3eQWM/6PUnkazYwd
   A==;
X-CSE-ConnectionGUID: YaNK04LkRGqiwteIX8FCqQ==
X-CSE-MsgGUID: bAqSkKy4TqSMN7PjMoRg4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="18411181"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="18411181"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 22:27:18 -0800
X-CSE-ConnectionGUID: o0ZpHOgiR2af0rWcQc8Jig==
X-CSE-MsgGUID: MP42oc16SHq1zSjoRtHMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85280531"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2024 22:27:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 22:27:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 22:27:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 22:27:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkBNKCTXbMxO75A0CTNm8TJwOe552xs2QQn5orX06JgTwRmkqomLCTJo9ImfCgvF7qNMGnrOUJ9Wa75djpKPl4g+uqhKNvvEoygTdroiz0U0+UQw2k1ZlMHR0cOYINjTe0oYnD45BGB6tSfHBHGPmCN1l3oKxUKsO4hN6VIkGjSyvQCv6PTaP2UNB2w/OCZIp+xrfI7v9pQzSqNsiKACbYIbq3Cu6Ik2xe1PrLVg0IDu1Kz6cQfZJI9+2H1w+O5ZYkTqISZ+PMO8acy+OCUorghTpEDzib7Li8H/nV2D3OAgdIC4ncDRUDFUElvVbKyyhYf25VXkwvflfZ51RkLKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lzbiy4dgvBuUKU/ngGPcQWS5zP84MriMlZDZMJYhvqw=;
 b=FDpSxkHL+GtW8awd2prJ63CATbZHmfYr52w7yWujj570Ii23JT7i/PuCQPPxwJXtKmmL4lWzf8UOiqR4WFLvqr33M+ccPxlkJJZjxgCMJjNo0jr7Y0sqwmK7CtWz7y2U6wFYOGnAkOL1+A3Ju11X/SzL4VJW7I5O5avbXGfoyG9Zl11bVng1u+RI8kyhOGKL4BKp7FpEPMdoiWRhF9tNW/UgLeeZ1B+rJbpxgZ7qTrcgiRLM4Myzw9g+8e6DFhj+21H19+weMfReNhXmLiT8kVPy9TjkQPdR9dbAcvhhHa9TMqn/tS5oTzTxNCHAlWSqIxn8ofQo1/nseZXUuJbuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8727.namprd11.prod.outlook.com (2603:10b6:408:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 06:27:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 06:27:13 +0000
Date: Thu, 7 Nov 2024 00:27:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Maurer <mmaurer@google.com>
CC: Luis Chamberlain <mcgrof@kernel.org>, Lucas De Marchi
	<lucas.de.marchi@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-modules@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <hs5fxluchiconuonhziu3qh2ol5bsdxva3cuny2mit4i3equzt@ieueiius5x4w>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
 <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0308.namprd03.prod.outlook.com
 (2603:10b6:303:dd::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 559a3601-7d9c-4894-acec-08dcfef5374d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RTDRr5P0mPE709fus6wsU+HoJ7yh/Vh5f1kHmObi0CD1Fw9WPfl4hnpxyVxJ?=
 =?us-ascii?Q?bnhL7w7+h51b/hoFArBiCCgCx6GLpGkuXnDdSLbcfipisqatyDIs+WyETFuA?=
 =?us-ascii?Q?WhnifpTnAPCLwXycSqYXD3mh4GXSF9kl8qxYNDx6K1cuEv49u+U5Gj3sn0MP?=
 =?us-ascii?Q?uf2Apf5ay2d8uBwunZrOlBdwN3ck0W3pkaUe1/hMnazYgRwHj1e9B82VPNJ8?=
 =?us-ascii?Q?/GHtgL8LcrZU/aCwz9nrKC0xXG9hHoE3QXCpAsgz7b/dq8OvG9xUIddJRmic?=
 =?us-ascii?Q?nxdNLh6MsiO2mCT58PbJPjtnqSwFHsbs8ffaAq0a4gkc6nwCUozqYsdJ/444?=
 =?us-ascii?Q?RtGBS98Cq1mBrL6l4VQX/RGb+DwY19+Wh2kgYjbE2SSlxQGqdBQLR/Dysohp?=
 =?us-ascii?Q?c1RCF8SalSgDVAPASyH5CFZr3Ua/Hw5Ap0q0Ej/B670hsxu2HH0KXOjFj72k?=
 =?us-ascii?Q?V2T4QhoN0OoyxkmlUban1hqhopuCPIKGx96noXfKPL9EIvISnBJiyMW/4PjN?=
 =?us-ascii?Q?WgoAT31rm5G1QRTd6W2tolFRnbsZ0c7O1ky6mmbQFbqWfdvn4eE7FBtLeMzp?=
 =?us-ascii?Q?fYooUv7pS3ZZ0NnS5cSZao9R98TIYqT9XePaXg3M7TWcWcsVhpAMOt6KAJL5?=
 =?us-ascii?Q?bELAVjS8A3NQUDLARVvTixP8DC4GqOaHQWdW+c47oAzUyHRrdxUnAZs2QNS8?=
 =?us-ascii?Q?BS9QvULYXy4Go8gAyagcrfJl99Bwz6Oqp1LqowCnTjSAQ7tLe+AGYIP2amB8?=
 =?us-ascii?Q?fPWS5/6WE7VjPbqdKfnCt0m20/nYICxsdaJS8qLqaXbCwXFG0O2eoDRG4xRQ?=
 =?us-ascii?Q?g/31mMHxVjjH4vm3Udi0BFGd6jboVH4gGsMWntPmUnbPOgMpIFAKth/6gxpM?=
 =?us-ascii?Q?9LlPJg4PYVD22LvxgV5FnXu+nMnIu6z/553p96ycvgxPbgsePRtj5qBQFwsj?=
 =?us-ascii?Q?jZ+wH5umlSffuL8eUn34M3iqMB2db44FDKCNUpw3VbJ7WSLMSIc0SI4hthsC?=
 =?us-ascii?Q?0e1lQie6NuTNCOpJ0nxv8MyJbjf/DCHPDHcUTVrpFEQtY9OebM9O6NTJHyr0?=
 =?us-ascii?Q?7FSgiARkQmxn3r3E7JfyquNmpmRWSAe3aX35kuKKgjg9p0dGLqnOWJvtP/dQ?=
 =?us-ascii?Q?CeMbpX0CJAkLiqUlRod2hM4yD50GTaqdGojDNtkDEC39uSTukXkdl9PYGFt+?=
 =?us-ascii?Q?TlR7o0n+Cb+BHlEIZsYV8Ysc6lIRBfuVJamUljNbUp/GmwGu4HTkD/l+HtYk?=
 =?us-ascii?Q?LL/Ir146w14T+AYoG4+bd5JLLiA9rMQhiyv8pjok9yutvhEhxUalYsdaaP0e?=
 =?us-ascii?Q?AIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cm5W3CJV9jic75EXXALC9rTvYILbebLpZZR82SR6kM4sZppachlcvUELIiMc?=
 =?us-ascii?Q?5rMIEnUDD5hu2AsJzcCHgyshuL5NxiGNE3EwyvyLI/JHvRqXIb3856N/p9hv?=
 =?us-ascii?Q?rdtEEN3GjNvyeS1RuLBdg+kLIp5M4UcFANdmBRWYJ/y1Ah7GM/BT1OCOTPU5?=
 =?us-ascii?Q?znUqpmdKYOtYhE7eHMenkof8DO8rPnVZdTrYPEZavJWLCxllRVvURM5rh+ae?=
 =?us-ascii?Q?2TT5sHD5s5VxQN+eAgakZGhGDTOxyVUW6EPkQD825y6yPGKf4exVh2AEvBrF?=
 =?us-ascii?Q?j3iVo+i2iHFGIY7Oa/4BRq0BJJU5DrgtLTu/n5urTqLDgXLr77zvZQYF1BS8?=
 =?us-ascii?Q?gag2JCMTtrecUgi0UQfjHqGpHh6mAQ8raLRNCR39fD79NEKYYgwhmyHcdqYM?=
 =?us-ascii?Q?ByKxHyTS4D76UIoyQK88miOyx7Setlw/6o/lVejOfCri4S94eLd4Y1IUncHz?=
 =?us-ascii?Q?+jgaNeF/NHoD4yZTlt2GbwqL0zznGFt8ydKIALOExLWXCKM8PeQASkHnyA2A?=
 =?us-ascii?Q?Zp7SpgE5P98KS9t8X+FsHsbzSzgoDDviBKm0wBzkzxuqsbRs1+LxC7I/xs5s?=
 =?us-ascii?Q?havgNjQxIn7OhmO7bhlm/QQ1Zc+sG7ZNtSOGMz1Osap1k70a9kFivV5JKhBH?=
 =?us-ascii?Q?fejaGN6pYY1qALwjrEJXV2+hoazOQ+YUqsJMGPUxucEZgjKrbG3phUxy90wn?=
 =?us-ascii?Q?MGYMxWjOLZgACoRid78APB1JMcfIWBfp1MS22oRLzV9lN4g2iCKB4S61xxhU?=
 =?us-ascii?Q?LvWmrKpD7NeVPmEWf4pKS7XQu4xmE2AttXXdz7wnvpEe/rL27i9XYmY1ujtl?=
 =?us-ascii?Q?MY2Nn00E//OcZ8ydNNXdRdBBTb9polZ4hGCMh8yfORqvulfYQ2dg8KmApPa/?=
 =?us-ascii?Q?VuV6DJ0RYTQOUg2QT1qxJQwdQhMmUHVb+zQHS4onW8T8clWsvjm7rMWcqJZu?=
 =?us-ascii?Q?2hmaVtFpz0h1ji5B3hYC5YuMfTK059vFcjx1VYHTJ9He8hmK0uQAoJ5Rr06B?=
 =?us-ascii?Q?klSMbdEX7MF5GgUibhFs++Dy+qagBdcZXcT2PmBEnbukl7y5C+shVkhDDmex?=
 =?us-ascii?Q?zmMWMjOlxxA8GuofYnSlw5+UI6t++IGFn7TvkVejLUqg7LWOX4qbT6btI9+d?=
 =?us-ascii?Q?OptVPXz1kjIAtRy0QUpEgJoELqjN+nywdmEAbGM2Zgmtf0gy1lqCfs1Ykh09?=
 =?us-ascii?Q?Ii3LO4Ji9rasoRHJ3s9Kq5kZZ0bPoTOLFTynv84kRUX/CMZndJrmUQ+Nyhae?=
 =?us-ascii?Q?BGHClWZY5I7M4pFe6PuPYx+V65ybSdYHOyPBDpxY3H/+F3vTfDQqOSvvM9DB?=
 =?us-ascii?Q?xCCeNCSYdnDpBsrzgO0uN9e9ebeqT2Hbb/AZ6ykzAvxX6RygJB4gDzZzsZag?=
 =?us-ascii?Q?7UJvFHMhaeL+ioF7GQe+pPfz8ETvj8zMdM6kEJCdjL+eu1+8O+weVP1TdeK5?=
 =?us-ascii?Q?ieNeyphf/r3QVwXGZcQOpptnDN20GS5VgJ1P8fj9t21TWh+bhlYVYGL15cBI?=
 =?us-ascii?Q?Tvm79dg98oYpjKVqsvUEeA3dsfBTx0/lPNNcOpfx7yfo8P/gknKPEoux4SOD?=
 =?us-ascii?Q?0jYqK9pMqHEhshlSNMhh1Kn8mc1E5HkrWxb8cqud4ar/87mVAhZiKJG0228j?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 559a3601-7d9c-4894-acec-08dcfef5374d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 06:27:12.9617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzipivz/qjyrHVWwOmg3jMXt9wJaOCk+Sg6QQvafiy/P8uNmZ1SIOYwda/qy2CnrQ8flaoLOAqQZy7UEKSUh781a9LASJJ9f91omUx8ZA+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8727
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 02:19:38PM -0800, Matthew Maurer wrote:
>>
>> > If booted against an old kernel, it will
>> > behave as though there is no modversions information.
>>
>> Huh? This I don't get. If you have the new libkmod and boot
>> an old kernel, that should just not break becauase well, long
>> symbols were not ever supported properly anyway, so no regression.
>
>Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and

how are you setting NO_BASIC_MODVERSIONS and loading it in a kernel
that still doesn't have that, i.e. before EXTENDED_MODVERSIONS?

Please Cc me on the format change and if possible submit the libkmod
support.

thanks
Lucas De Marchi

>then load said module with a kernel *before* EXTENDED_MODVERSIONS
>existed, it will see no modversion info on the module to check. This
>will be true regardless of symbol length.
>
>>
>> I'm not quite sure I understood your last comment here though,
>> can you clarify what you meant?
>>
>> Anyway, so now that this is all cleared up, the next question I have
>> is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
>> userspace requirements aren't large at all, what actual benefits does
>> using this new extended mod versions have? Why wouldn't a distro end
>> up preferring this for say a future release for all modules?
>
>I think a distro will end up preferring using this for all modules,
>but was intending to put both in for a transitional period until the
>new format was more accepted.
>
>>
>>   Luis

