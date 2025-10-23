Return-Path: <linuxppc-dev+bounces-13188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203FBFF688
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 08:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cscBV3Pkdz3bd0;
	Thu, 23 Oct 2025 17:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761202274;
	cv=fail; b=c11C6ePMczm1OiGJnqlXLd1at6m1i/8DsCEbA6XXQ+gZ1a/OuUtXbGVNfWq4Jr0rGSki9s95pkAU/eIh/m5gGmHNgntKw929KKjlnhTvcpBpC2e485L1s7mOnJ8r/lNVSGGReaYbfYlWUuLLXR0uzg79yYHpbZzN0N2e4mnDlEC1IgMiktv9PRCtB94z7nTbfdVzyWtA4PnWE2IwwppLJMhqn4HxUOBsEmL4GKUr88KZowIYfH6oGpRVn0fZqZjrxCt8LTbvrJQ6kU+nEV9Mf3Ak0HLkcYXeE5oRoMDUPUjPnsfU8kIIJJAn8e/6JkN4/P75sgyX3jp7r/H9VaphsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761202274; c=relaxed/relaxed;
	bh=UekXzIC3UbmQeKw6smjaggT4jnaWJqjn2QCaQE3ig/E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dKMYkQRU43j14dwdPKTPgrrQ2hKzpZocpF1Vgi4eYM+zem4gkUWIwiXRvAoirKxKuup1l+FBIxoR0gAXqyErE/31A+1ow1d2vpuBQDfe8+gEITNpWDsVabmfQHqAVA1As6YtAsVjzp3QKhF69535kkkTM4LT2PNdlVfzHmuFcniN/rRXitckQN7eAsqJovP7/Z6S9Gs7fXbOhUgiwzeuNL6JZQySrREeKcl/OVlIHofzW5n+CN3IWir4Pjmuf0tsSKJ4NPKzcIZvdbRjY0AZbSBSh+SGgXjBm/00BjqToiDCMECQB+znq1qMA0vsHre/Zfhq1oXBjN4qoNBjRIU2SA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MJfN6ldr; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MJfN6ldr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cscBN69tlz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 17:51:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761202269; x=1792738269;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=OSlOjLBzh5Hc6E4LJM+xs6c4KhyZak55GZ7sSzXP4+Q=;
  b=MJfN6ldrsKGV5qUOZX6FvTqTRRuAPP4AKJe05bYgvsxikPCXNEYXTSzm
   aPse3AzmPAAuiDp0VKS80ZMVq4p9c1M5Pa2mazcqrnNc1fLdAPliUYtE8
   ae4HeuwxpqnSKqz6Qx5Qq0ZFGojn0clrXUQJ545xMZOyI9/CIv35bpsvD
   /A0XfIlCXjhx+4IeHrEs+RCrMkjIev2l84XZVc+5UXhFYTD9UzUMIhYod
   LUVqRur+s81rhABs4z4cHwMoB5Hl2SU/85Yd6UFLyUv+XhagGpJhgPXh/
   xpQ/nGUcXrl6UFw1UShF0LS5r52m8f92mNEWRTJ9Nf9Kc7OwwYemhCkem
   A==;
X-CSE-ConnectionGUID: rcNq/ijlQQaeTgUvZFxf2A==
X-CSE-MsgGUID: EW/ZPOPxSYuTyHj+R5NiCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67228016"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="67228016"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:51:04 -0700
X-CSE-ConnectionGUID: gVMxoDFaTkqovmx+BIvyng==
X-CSE-MsgGUID: TRpIYm/OSjqfbldZE0FKiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184138746"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:51:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:51:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:51:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRz0Hz3a6AcvwtI9yZCVJdT2jCaFD0J9P/R5Bs1IR882lfSy4PYcoZGjBSrI0zBp7bkz55Rks2GxwnhlShR4o/iCSs1quMQqr7YFe6s5bBRhljcBjEjkr38kJdvcEHp1OmHOeL2saSD0+Jx7jsJ+Vpu6xFvBVVVoBOcXEU4PJVDC3kjw/i5bN5yj74zoyWSy7ee4KL/+6KsH67/7x+o0YD3Sk/h54ZQI0uBlsFS6WsJfWWsOlVIIJTzkD12syW5bg3X/ZQbCsRas9oAEV3xKCPDcrg/eUBIeHNhgNmV5IoEnuRwwPFwZHOsuACYXm9JQLawod9gvoyZzrtnf8opHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UekXzIC3UbmQeKw6smjaggT4jnaWJqjn2QCaQE3ig/E=;
 b=JLXtL0EPzfHGhZazf9f0SaLriwsfeq9KhJ5sQqmga1KrDWVfXr+obGtadaTE8Ea98FZ8uVfBCw6q4YMpNT7lYVJulFaFk2UnavlyzjH3yhBWqMkxGrkQXCP4t0jT0kB689vnS2b9AEFS8D4EKwWaGV1ivjetsQxmAvpy2kasJrcuTcwUBU5P0LFxOX/NDV8ljN4ATM2wWzRNxdpBLhWG6VD/GLCsvE6tCdLjfhzdTVGXiF5tT8IxKCmyD/jqAaoIfGAqlif+ZOwAG/4tbiXBE8RaeGoT7G9AiA0LvU/CXtWOllEDqZGM12NL0Cb7D9ai6A+hsOznnjZcgoRNkJBcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 06:50:53 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:50:52 +0000
Date: Thu, 23 Oct 2025 14:48:51 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A.
 Shutemov" <kas@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, Vishal Annapurve
	<vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
Message-ID: <aPnP07JAYdJurxKo@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-5-seanjc@google.com>
 <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
 <aPe2pDYSpVFxDRWv@google.com>
 <aPiQYBoDlUmrQxEw@yzhao56-desk.sh.intel.com>
 <aPken0s-0MfdSd5o@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aPken0s-0MfdSd5o@google.com>
X-ClientProxiedBy: KUZPR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:d10:30::9) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|BL1PR11MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f7cf40-87a3-419d-638d-08de12008226
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HJEzBMhrM394w1ZdwhSGGigjBhy32OLPYi9fNlrVGZ8SDf5+tBlm2sOgsP9v?=
 =?us-ascii?Q?+fv1KaSvOHmEj9ypSS4zbqqiP11VJ7zXkJKOwdzDigB1QAjo2z+BCL+QDaLc?=
 =?us-ascii?Q?bkW+jWP76yUPpRZM54DrWE1sBkIYKE9gaJGbbnsGivvmlq7YCGbStHDyIBSb?=
 =?us-ascii?Q?8Ghnfx9DuwoGls5uDj6rilK+jkl63Nj62bh1alawP/rIHR0rFZOzPizh4er7?=
 =?us-ascii?Q?cmO+6T9sd+ht7tLPvJcTA/Hg8mCi26M22ZcSXr1ZV99NH9TcQGFeQnZejRb6?=
 =?us-ascii?Q?wcDtniQLV9znFkcf7i/FlrL0j+gVyGEFuUkvP/F+dOE8S3WJu36zOQSkMbH7?=
 =?us-ascii?Q?INZkdCOjdHNoJqS2HQV0n9bRn5WumkJLMCVYBQTnytNax/8GS7SKr7Ywj0QC?=
 =?us-ascii?Q?gknBHO05nyESTkaVkW+KNHpyj7445NkjBWcv6UqqObX8O0mQxGxrl/I58OgE?=
 =?us-ascii?Q?0lYvECVoGEhJ82JlJ0Nj8aEGWLj45Krnf/VzyaA6I+IebYV17cd7MP3F+mOH?=
 =?us-ascii?Q?r6NvSPZyMUtG3TYrl61Dpf+/PJ6Q4Xh8s6y7FK+YRWS1h6Q82uqyACzgtNyT?=
 =?us-ascii?Q?5kLaNbWc0gAe8efrMX/5fj6+DMt5ccpyYjq5jdYNnki+a4PKUPPFt00E2FFs?=
 =?us-ascii?Q?BjyU+bLoG6YeCUMn3ZgCgd6I3oBfVbOn/vlZKeusDTt0ghJSj5mc8NIDFGaQ?=
 =?us-ascii?Q?0SGolKWlqXvcLPAWDjInSfZXNLBnVeIxcdvXVElF5frH3If1iShFVXftqNxS?=
 =?us-ascii?Q?rgH5l3QhmtjK3eB817JfCnxLrQZsOFaiC5yBm0VM7x47yiUml+qEvRS+E4k5?=
 =?us-ascii?Q?wluqcmgqEnGxkzQo9o8nUYE6kWFOKoh2Lny5SU8XKq+BKHhFhKbGpbCL4tpu?=
 =?us-ascii?Q?no9xO838azgwzoCsqWM042WCDbMLKFSKJK+eis+XogiQw5b//RGYkB5arFfS?=
 =?us-ascii?Q?ZnZ7FRIc/xb1QgQFdUTA+5D9sATwslyvmyUur2bahD0qsNQSvNg9Zwp4Juwx?=
 =?us-ascii?Q?0qOeEfNycStJI0/C0c/0vRVNwfwMmi2SaOdKnaztRoN4R5h1b85xCYcNUFdf?=
 =?us-ascii?Q?330iRWaDSGhcQ3Knt5CaUYgHs7bvr+uBKnwv2Ue69MXLO01sUdkxS5EW03D7?=
 =?us-ascii?Q?GqCbzqvNBowGrbeV/dr27TyZge4yq/WBr22Ty2ptRllwcC7WKs81S6SzzzLH?=
 =?us-ascii?Q?7a+i0gnuR92t0keOz4MtQTMzbYpDy8j0gPSjDR82CEnu2hiInUzzKMgfvt+D?=
 =?us-ascii?Q?ThTSU+3Ky+VKPbrl7PpjeZyLQBKItLSOYTLE59U6akomQRoPFtYiuL+hVyEO?=
 =?us-ascii?Q?iSmEQiQWgC73W6CkASEOKTHe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5ZwIHEmHKDWc2CIthNXCaznZQG60YjLsXxAkKU+yfeI3nweB5kxev2oqBhr?=
 =?us-ascii?Q?1ZDetMQFeMQy7hTkMrDjsAhA40IldcftvjEekzp7ozUzqPcE6P5edz9UjPeK?=
 =?us-ascii?Q?pGMG9yF4Hzf3kLdB4b4D2zpP8R9e8SwshDvaGd4Vl9gp41q5Kg4jmt33l03N?=
 =?us-ascii?Q?fwDAQMrGqKVI6nCMZVBtWo08VO5SI1p5lDtUOtTfsZuNVadkIrH/4UOpz6Tx?=
 =?us-ascii?Q?FdJ34T6JWhlLg/ZrOixLAxAD6q5EFSN8fMl/uY9sNVhLkoSeiIwVoGWNKARa?=
 =?us-ascii?Q?Q8O1011S+Rg7AnQounS5Z0D+E8lBE6xfPtZRmKnrrdLUpwRQvS7zUauVtgbn?=
 =?us-ascii?Q?QNLr66bxw+U8ARvmAIYTMXp8FVCQH94iomynm98CIkml0KVI07h/AVYEEHX8?=
 =?us-ascii?Q?Gw2gUG08/ZY3EosCg5OogdDGzyQH1SepriO65UdwGdybjtrpZlEsmWq5nHX5?=
 =?us-ascii?Q?qfY7DvCHgFNLzKf2gJY7gPSHg/1WzoPc7NIcoRdFGpJeZizX2lY9CMT/Geg0?=
 =?us-ascii?Q?mc9HPaRYa6gUeKrqxoGhUNWSGENkdb8/vzB2v2Is8DD2iL8i04Zw51cgdScE?=
 =?us-ascii?Q?Rwe9BcvY8dYRJyqWiKkFx+hVqRcVEqPb8cwC6XQDmKER21t6bEtpwXXCzyWC?=
 =?us-ascii?Q?/hLS/4hkA1iAkX4sh/HQn6Sb0U4Y/Q8NWUV0jTdsKRJ1f81EIpfVxdQkI93A?=
 =?us-ascii?Q?AcqG/gOVonU7LVd7PpZag0CyqJJNEZY0UW2rcfPJ9YhAs0Vtev0G1yvhDX7Z?=
 =?us-ascii?Q?uy7AsCfCqPYUKHKZ2kzobbtdNb1TyzhkxQaGXCPdivojVmKB6WhMIW7IfIZo?=
 =?us-ascii?Q?ZgNkn62llvdXJRugrGIR5gDxhYQQX6zzv1X3YmPaGVb1y1cDAuCE7VRBKosK?=
 =?us-ascii?Q?UNultuJfNwELGEE8W7rHy+KdXTKuynZ6LLMX5JwWySaN/FoBPWPpW5oZBUco?=
 =?us-ascii?Q?p05+OAQQzesbULlafUiiuTCcMMz6nqVTWnHdfwIPHYbipcJ39M0f97CT0lYW?=
 =?us-ascii?Q?/yoOGaN5y43cnem4HcVL93gioEOruAsLYcepyKdlTaOLd9MCjcdRal/s7vHX?=
 =?us-ascii?Q?4gc3ALymtLOP62vqk2HIKmKpAr8lXrWnS6SNEbDt5vK15QjUfkDIq5LsunuM?=
 =?us-ascii?Q?3VOgrr1dzOpp/jTHQhbc2yUkN564Voq/8wPbkkcLHM37th+wUEpbg5fKLvkQ?=
 =?us-ascii?Q?b/tYKJOGhBkrNEMpolUJoI5KpXfWIswd42vwxwtyxUEGtp8Eek4AobUjWa8t?=
 =?us-ascii?Q?3XUgBsJMX1Lru6gYaue2jCylnWW2GO5DrYZg4aP7MjLYalRi5SOgePUaiLyh?=
 =?us-ascii?Q?VU9FFb3Y9kUx4yg5+deN7DzTIz16eMnQGLMpHjH102esoT4gsMQexGryy+9T?=
 =?us-ascii?Q?YV33LsH2qMUdq83C8iAoicus0+OO5AS2EEmoZILF0BLmXw4nxukgM/fu38G6?=
 =?us-ascii?Q?bYcf/ymq1+bqr/f+6ex6VsADp2PUnEFM8chcyoQVnj1oh6oDqtWiTVru2QlL?=
 =?us-ascii?Q?My1eVh7H1UELfqwcT6POcqv9NJymflYtkKazRkCSrlZ8ldlF6rWZthCJrPOC?=
 =?us-ascii?Q?8foAxqQSSh9kUKjlX2CzPbgdM+zDg5VfXlXFQWsT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f7cf40-87a3-419d-638d-08de12008226
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 06:50:52.8079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dToDOJxRyQKTAhIqAhtL83ISX5Ga6jBXFVjpSA7EBO77TTqLIDpzvStY027HYTL0JIx37aqEpACcTWKyqiKXtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 22, 2025 at 11:12:47AM -0700, Sean Christopherson wrote:
> On Wed, Oct 22, 2025, Yan Zhao wrote:
> > On Tue, Oct 21, 2025 at 09:36:52AM -0700, Sean Christopherson wrote:
> > > On Tue, Oct 21, 2025, Yan Zhao wrote:
> > > > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > Is it good if we test is_page_fault_stale()? e.g.,
> No, because it can only get false positives, e.g. if an mmu_notifier invalidation
> on shared, non-guest_memfd memory.  Though a sanity check would be nice to have;
Right. The false positive is annoying.

> I believe we can simply do:
> 
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index c5734ca5c17d..440fd8f80397 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>         struct kvm_mmu_page *sp;
>         int ret = RET_PF_RETRY;
>  
> +       KVM_MMU_WARN_ON(!root || root->role.invalid);
> +
>         kvm_mmu_hugepage_adjust(vcpu, fault);
>  
>         trace_kvm_mmu_spte_requested(fault);
Ok.


