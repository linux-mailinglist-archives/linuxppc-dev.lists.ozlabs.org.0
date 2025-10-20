Return-Path: <linuxppc-dev+bounces-13052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69034BF00AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 10:54:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqq3g64SDz300M;
	Mon, 20 Oct 2025 19:54:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760950447;
	cv=fail; b=VGWOB5NTcuvHhGetgsCQ6dqwxSAOMJY3KpQInPghxXMKeaSa26a7vG+OzQk7mx/K2/aJs2KpDPDAh0PvJkkuaDYW357PPLP4TNFLpc3Le7eRuEc+XhSktn+vrX860hNuhMqX3gRWIuD6ZnSPc2zItVHew9s0dG6vX2kSJ1V5DtNVVlWHYlt6ScWJd3z74duJoURdcxKANSouKr46Rf583Ti+HBNqxaIvUjh6GZzu/f5elOMKsjvgTq4CdH4G+n5M+sF4fq/cfTheKv+qgYy9+V0thWX7ChEGLiau5PS/Pmq/hlJqAjRIlWD7emkqqL/Kc7LFa0KsBTIBDLuPmJx/Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760950447; c=relaxed/relaxed;
	bh=PpYZSNAz1ZH1FHiL/HmYYh2kOK9LqhQM0+AQtYwfaPc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NnXQUD09BYuL0hBpfKD6r97V2GoRam4jQVc62MwGnR2FYdncq1Cu4bHYmrIzsr7IR00cxFpR8Tn8X3h7eRSFiNNDKycpki1j/m8bf1ps3vDPK1nQBQbt4pZb9SbApQA6LzmTAcFO/gbvr40qyVeNVnCKkmvJ1SdcmF1hBj/VEsNBsxvhccgvkrrKaICQRIJYSLWeyhYZmCrIBcdLYQWAjDTwCZ4UIzxHIV13PDVe0wUYl4bpDaGyTMczao2CloItimMQvykWuXkKRyLE1Dk7WhMK7o0oHA8Hy6bcP7xm1LNA7L914u22RR5/pcgungxJurhryLv4rZ/kTkwvS96EYA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XQQlVeK/; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XQQlVeK/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Mon, 20 Oct 2025 19:54:05 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqq3d0Hkcz2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 19:54:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760950445; x=1792486445;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=R3/Ks3I+o/rolqTu05pxsoOaK92JoNY28685s2iEvpY=;
  b=XQQlVeK/xIe7Ow1wNqEzYUcFhJebrV9amR5C/Vdt4HmvUtg0S6VozhB1
   HBTym6iS2b+znEC2g1vTPXg8S8i3Peg5yVx+dhRNIr4k+PpsLHhklzIgF
   9BqaPhokda+fc/640FHGNSH6BPQxKHQNf1daBI1EsTWNDftfRJIItbOvA
   jCjqN6GKiEOAzd3ah3FmE01DfL7Q/fpkTm32+yATxOBjfjz/HpL4CNZ0O
   D9ub8+Sf0JlL/Zz+NV5d1HutAwwmXSmmQOrQD9YBhYSi/26dQLuq+2X1+
   MK6nXyPvacOzWsAz1Jc4EWSBePwfdNamGzlwg6lByudMJ1gcaYseMU0UA
   g==;
X-CSE-ConnectionGUID: Xl2v5UmUQ3WOAfzNKGZDzg==
X-CSE-MsgGUID: iEwjJF+JQ2OB3BYk6rNOXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="50632560"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="50632560"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 01:52:56 -0700
X-CSE-ConnectionGUID: dLxTKFXJTY6MrdXUNZ/Zag==
X-CSE-MsgGUID: NVuHT5VNRievNUCCIHDheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="220427697"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 01:52:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 01:52:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 01:52:55 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 01:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVyFOuqpsBqYlmQPi5idK0W8vw1TEfusTu4ZSMG9W5QDjrepLaiZrePX1RZxfggloOJsbE/XZi/Z/uhHOuLNqI6JhFwA7tUfsG/AFoNG8qh2hL7Eelkb2fmhL86p2OpiNMeqQj1Ckr25/OqjUWtLmM1L/eVJMGEu/a2tnL8ZTP4lq3G5lnz881vHISbxBr5zso25Y6RtVDHJg8QQoxr6JlhXUF9qPux2ZVgGxHkx+hRG104MAIdXIA+zfxeViKSsPMqrLKIT5RRSQ4rG23W1KBedB3wBC28pLw5psnyS4yGtEPFz07JnWkVLmF0VR8vULfsGpaHSuoDnPWzNNJmQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpYZSNAz1ZH1FHiL/HmYYh2kOK9LqhQM0+AQtYwfaPc=;
 b=KC8TnSvsV4l0NIjC9zi6p69WxUz8+cH3j0M+IY7mk97Nw4sAlZg/lS1+zUWEXT1TdqerRYXvSOcuOXZC9yXx568D308LnJnqiK1+am6m82bj5Hv8ItzSmWZbzwRSm95nntkheF+IemtjwTaEyV4BAOQt67yTmNQBFzMke/sG0gEf2d/n3/CYs5eprgZo1n1X5WwSLTaMlLYaB9Jq2O7POjB7Fp0XlpQl7iTPoplO76JK/De5sAT8X2nqil96oWEA9MkSQyVMv81N0DR41OPx+xNrcBa/z1/G+zareqkhBGLNYTKwoLRpjZwov3TatR7VAcv7IzlPXGMHYdrGHtgGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Mon, 20 Oct 2025 08:52:15 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 08:52:15 +0000
Date: Mon, 20 Oct 2025 16:50:18 +0800
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
Subject: Re: [PATCH v3 25/25] KVM: TDX: Fix list_add corruption during
 vcpu_load()
Message-ID: <aPX3ymhrw1qcbyZX@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-26-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251017003244.186495-26-seanjc@google.com>
X-ClientProxiedBy: KL1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:820:c::7) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: 385ace61-8238-4ee3-defd-08de0fb5f7df
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MSsAr5Rw1f9dxNMqfKvanA5mESHPHbuGTUlFPwwk+NO553lC3iwQZj5iWh8/?=
 =?us-ascii?Q?I1yOZyIn26aWOnfcgtPRDcpz6u3S2Dima3I2cclMKqwKEOm41gE7blnGicP1?=
 =?us-ascii?Q?3i9mlDNdp3QKxFaAm8WoC6nhDNCRDngq7N275GbSPZq7UDFTJzvseVQp2te1?=
 =?us-ascii?Q?dh7D+h8gx+bUl65cnT6MtEilqtbjgWi7xxu8shdGeBwHfdJClZGfj+lRdwwY?=
 =?us-ascii?Q?y0CE6YTHZi1mNXj7q+2iztuLr0q30f+fXumpQnrdcHxsUgKsSa4qW5fR6Qbv?=
 =?us-ascii?Q?zNNcmBab8oy1yNqC3CUOsbbq68eMvrPCwVudC7NAwj0uq7XlzrogPYNbZBji?=
 =?us-ascii?Q?UQXDo6V+O1L7/3ycUMHdTwd5rcMPGax0o0/m6kCnZiYR7y77yJIqdtEdt9ib?=
 =?us-ascii?Q?tZdGk54MO9fTlJN8ASwpNo8a6gbUXwpBuWM4QbqK2/shGIsEcI8kx7zoQgaS?=
 =?us-ascii?Q?MRplN4Lv2KYiWQldHoSWpmtaRVTg3urEZl193sARxbjUthiEbFNkQLV2ZoEs?=
 =?us-ascii?Q?zRRn00rVUVu7ggoGKqhcdA2ISLRolRKCStHV2r+TVKwExKNGFDI1F4PiKV6i?=
 =?us-ascii?Q?sAz8htnzS+X+Qaacs3wVWFlkQi2f+VOZRJouT2YHLd/NjCgNIEl94zycaDPS?=
 =?us-ascii?Q?mCqDMGErCQYoufAjlO7wDb33XEns7xoBU4P+fpGfi5I9vJemCiyHotE+NwM9?=
 =?us-ascii?Q?LdRptxWtah5DiX/BiTn6NlCUwfPEUehHAedwleEpmazDrYg4xPnSKuDvlutY?=
 =?us-ascii?Q?77t6zkPrjIV/t8F/2iRF09UInnifuDJzG6hPqOpZWNHtp6PXwBCY6GQQokgN?=
 =?us-ascii?Q?+AXBDgImEXHO7BFM55aK62Ze6W+WIxCOuBcJZXsC8KEKIQsIMhAiWnwQFYJO?=
 =?us-ascii?Q?mLA9+T/uYQslyGHWjy31WbjEt/or49Iu5jIBK4wCd/B+HCxk9Vx0UkS70ab+?=
 =?us-ascii?Q?/7MokDzZjJF/eHLW9Qj1zKz1wEVsEkCLOfxXc5SOvapqjtOWryoHuwNplmJy?=
 =?us-ascii?Q?uurhnRN79Bobue0ZzfmeTo5ckFXrhP7EN+dd3e3Tn7+5ZF3jPqEgNXGGhNgs?=
 =?us-ascii?Q?InR1NKKaUKY9rU0/T5NSSlM9XutMbpcW6Rztdh+XmUWeck7Y4TIqsdJUuTsa?=
 =?us-ascii?Q?hb5o7i+Fvpn0alrc3WyaVQ8LbAqOfy9OEM/JTm1QO4QPXvPl9uKF/BDNzHro?=
 =?us-ascii?Q?7jniVR7VWOqVeTv+zTJ5sgIw3zVtR+fqOjOb6qCJQ2zR/D2QVu4ZGs8qy8FV?=
 =?us-ascii?Q?Vms07Ia1YmpYeG/04paZLYg0y/wOP6HPO+GJHCHk4m9qQiaPJnwjBwOJrLDc?=
 =?us-ascii?Q?VjSNk2yY52UxLfZetUqkLJNPMGG7yMasO3fFyc/02IQrMLc9zL1O8DjUnNdu?=
 =?us-ascii?Q?HxZTYd9tqc1IeMC4s+lZKJCTi/0yTtBR6A9VdB7A67MTu74M02lzgl5sKh9B?=
 =?us-ascii?Q?x3VtDYCaOEX1c6Yo2LVEnfruex5HsJO5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZD6qemoO7wSEGbsmKyJ1SxSayW39544IPzqIaCBYpZ8FR7d8Wexj/4xO3dzx?=
 =?us-ascii?Q?ntVzfkNcvBfKl6c4RDnDiOzNYZXJ18fLjChHiB55q53Cr7HBtwh9A/mUTTFd?=
 =?us-ascii?Q?WLoWQ1u8unCSD++aNkg0LWivSnA94BVeb5eu0kcUrQ2M2x/5GuNxnp5rWw+L?=
 =?us-ascii?Q?yPG5Zd/M6tdymwTC8WbLWVVSGEeAWkoNvNq6Ts8rbJJSBzKfLPYarbt4O2hS?=
 =?us-ascii?Q?v8ZAaGgrKxiiV4UudHuvoxpZVnh1LFgbYktYpg+Sf8MGuWmYmQqTZSUx9dLx?=
 =?us-ascii?Q?mtywRfw4YCQ1oDgES+3Qa3r+zR430iIuRNWUQISJm1VHTJcnHNtswbFk2r7f?=
 =?us-ascii?Q?mKkd1AXOiow++0+DVuxX7mwIfPbLVtfu4RWsrCG61U68hBomaexFoOfayOzN?=
 =?us-ascii?Q?WGlPdbbyBc/5pb7aLC/KJp5lo5FCqpowO29DvjtPNmET05q7fD9HTlTD8w+2?=
 =?us-ascii?Q?/A+0qQY3dhd0nm2K+cqFgH/ltAnM6Lkm39v/DhCTHOYDDFv3YDhKTQR7P6dj?=
 =?us-ascii?Q?0eTTuNoEu31Lt0A8qHdePc/+ZJuMmskeTk41ITWuLrrA5IlVdRK0sswpnbx7?=
 =?us-ascii?Q?sktRg1qk+T1hCrjuVfLqxidIpT/XCTPftZJl1HMZuXdPBfZjFG7SfhuxdDa/?=
 =?us-ascii?Q?o5ZxWlrCl8fdP/utQxzYWpmHuMpFPTrBegJYyKFTgPm7fhbrCIut4uwr9uQI?=
 =?us-ascii?Q?2WOrwGDuk7OgWMTBm5qYPl/KpSmGpPmbNWwjjJTIEIjKGa6itDe2K1NHLhJo?=
 =?us-ascii?Q?fLYY/HNfwPxgJi1LewfWguhEkW6StvSmxwUzXGaY7SzmCa8O5wK/XYcbe397?=
 =?us-ascii?Q?YD0xLMNgYblF6qFifz25gZc5WC7XwqAyZQcXnN5Sx/Bn6HF8wdWuoIvUkspV?=
 =?us-ascii?Q?Zqgxbg2qkYparyOIcDuTQ90uSnFQ1ocpFIa2wPp5qvTkP7lmr7zqOaMmp5H4?=
 =?us-ascii?Q?eaLOLHi8d0Hp6gOnZnicZ+okcQ3lo5bC/3NJihn6kBfbQ1i9W8zOB0YFBbp5?=
 =?us-ascii?Q?Qd6df1WLl35RYKQKJQORtmOXizb4NvNilyKtDkZMmSliDMs4lCo/sdrGues1?=
 =?us-ascii?Q?jlwXxM8143UBsJFRe5pM5w4d0R+I2MZSg8z0H3XrTuOxPBwZaCnAy09+o4eg?=
 =?us-ascii?Q?VU3Uyab7U2jw9EUjjvH3+pMYnVT7XR6A5QBsm29boX7YgpaLblp0gbUzMkj1?=
 =?us-ascii?Q?MPZPaE4DcGIqcHDU5eXCYWsRLzHrV9R33DXK7TKL3N2h71Q8pPS3KvDZzMqg?=
 =?us-ascii?Q?0by5Fn/e7UGfM++ZS3HKC0fo047Lgaiusp31LvV39olMdqR1V/FuRkljakm1?=
 =?us-ascii?Q?o4+IGEW20t2CA0+LKdiQY9bJWTbGJWh/aO8WOmdW7vybUxWMuHynHXZm/Qz1?=
 =?us-ascii?Q?DQKdKf91ObG+319Mg2AOoySNqDI6xZCj3EncHSG586Ul5xuHZEDb5Qh4Zug2?=
 =?us-ascii?Q?O6U3mQyf1vZdMZfIku4e6fYWhg/dKpkZuHrWuWckek0ATjVJXRkHDGEdMFmk?=
 =?us-ascii?Q?QzocqoKJcUDtq+31mSC7xl1zbHCR+U4SvWU7vK/qUtjBRPJsU0sp2IQ4+y5g?=
 =?us-ascii?Q?pdRuie3OHSPJg9pHLmxKoqQlO5fB6yFv+tX1qzCL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 385ace61-8238-4ee3-defd-08de0fb5f7df
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 08:52:15.7729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH0rYeJWn5eNZLgR1OxzU5r+TGtu2eK1BP8GoO7/AUb528OlQNGXZrz07h4Hiqzo3U7Q/zq2EHyK0KHpx8GOfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 16, 2025 at 05:32:43PM -0700, Sean Christopherson wrote:
> From: Yan Zhao <yan.y.zhao@intel.com>
> 
> During vCPU creation, a vCPU may be destroyed immediately after
> kvm_arch_vcpu_create() (e.g., due to vCPU id confiliction). However, the
> vcpu_load() inside kvm_arch_vcpu_create() may have associate the vCPU to
> pCPU via "list_add(&tdx->cpu_list, &per_cpu(associated_tdvcpus, cpu))"
> before invoking tdx_vcpu_free().
> 
> Though there's no need to invoke tdh_vp_flush() on the vCPU, failing to
> dissociate the vCPU from pCPU (i.e., "list_del(&to_tdx(vcpu)->cpu_list)")
> will cause list corruption of the per-pCPU list associated_tdvcpus.
> 
> Then, a later list_add() during vcpu_load() would detect list corruption
> and print calltrace as shown below.
> 
> Dissociate a vCPU from its associated pCPU in tdx_vcpu_free() for the vCPUs
> destroyed immediately after creation which must be in
> VCPU_TD_STATE_UNINITIALIZED state.
> 
> kernel BUG at lib/list_debug.c:29!
> Oops: invalid opcode: 0000 [#2] SMP NOPTI
> RIP: 0010:__list_add_valid_or_report+0x82/0xd0
> 
> Call Trace:
>  <TASK>
>  tdx_vcpu_load+0xa8/0x120
>  vt_vcpu_load+0x25/0x30
>  kvm_arch_vcpu_load+0x81/0x300
>  vcpu_load+0x55/0x90
>  kvm_arch_vcpu_create+0x24f/0x330
>  kvm_vm_ioctl_create_vcpu+0x1b1/0x53
>  kvm_vm_ioctl+0xc2/0xa60
>   __x64_sys_ioctl+0x9a/0xf0
>  x64_sys_call+0x10ee/0x20d0
>  do_syscall_64+0xc3/0x470
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/tdx.c | 43 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index d6541b08423f..daec88d4b88d 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -833,19 +833,52 @@ void tdx_vcpu_put(struct kvm_vcpu *vcpu)
>  	tdx_prepare_switch_to_host(vcpu);
>  }
>  
> +/*
> + * Life cycles for a TD and a vCPU:
> + * 1. KVM_CREATE_VM ioctl.
> + *    TD state is TD_STATE_UNINITIALIZED.
> + *    hkid is not assigned at this stage.
> + * 2. KVM_TDX_INIT_VM ioctl.
> + *    TD transitions to TD_STATE_INITIALIZED.
> + *    hkid is assigned after this stage.
> + * 3. KVM_CREATE_VCPU ioctl. (only when TD is TD_STATE_INITIALIZED).
> + *    3.1 tdx_vcpu_create() transitions vCPU state to VCPU_TD_STATE_UNINITIALIZED.
> + *    3.2 vcpu_load() and vcpu_put() in kvm_arch_vcpu_create().
> + *    3.3 (conditional) if any error encountered after kvm_arch_vcpu_create()
> + *        kvm_arch_vcpu_destroy() --> tdx_vcpu_free().
> + * 4. KVM_TDX_INIT_VCPU ioctl.
> + *    tdx_vcpu_init() transitions vCPU state to VCPU_TD_STATE_INITIALIZED.
> + *    vCPU control structures are allocated at this stage.
> + * 5. kvm_destroy_vm().
> + *    5.1 tdx_mmu_release_hkid(): (1) tdh_vp_flush(), disassociates all vCPUs.
> + *                                (2) puts hkid to !assigned state.
> + *    5.2 kvm_destroy_vcpus() --> tdx_vcpu_free():
> + *        transitions vCPU to VCPU_TD_STATE_UNINITIALIZED state.
> + *    5.3 tdx_vm_destroy()
> + *        transitions TD to TD_STATE_UNINITIALIZED state.
> + *
> + * tdx_vcpu_free() can be invoked only at 3.3 or 5.2.
> + * - If at 3.3, hkid is still assigned, but the vCPU must be in
> + *   VCPU_TD_STATE_UNINITIALIZED state.
> + * - if at 5.2, hkid must be !assigned and all vCPUs must be in
> + *   VCPU_TD_STATE_INITIALIZED state and have been dissociated.
> + */
>  void tdx_vcpu_free(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
>  	struct vcpu_tdx *tdx = to_tdx(vcpu);
>  	int i;
>  
> +	if (vcpu->cpu != -1) {
> +		KVM_BUG_ON(tdx->state == VCPU_TD_STATE_INITIALIZED, vcpu->kvm);
> +		tdx_disassociate_vp(vcpu);
Sorry, I should use "tdx_flush_vp_on_cpu(vcpu);" rather than invoking
tdx_disassociate_vp() directly.

This is to ensure that list_del() in tdx_disassociate_vp() runs on the physical
cpu that owns the list and to which the vcpu is associated with in the previous
tdx_vcpu_load().

> +		return;
> +	}
> +
>  	/*
>  	 * It is not possible to reclaim pages while hkid is assigned. It might
> -	 * be assigned if:
> -	 * 1. the TD VM is being destroyed but freeing hkid failed, in which
> -	 * case the pages are leaked
> -	 * 2. TD VCPU creation failed and this on the error path, in which case
> -	 * there is nothing to do anyway
> +	 * be assigned if the TD VM is being destroyed but freeing hkid failed,
> +	 * in which case the pages are leaked.
>  	 */
>  	if (is_hkid_assigned(kvm_tdx))
>  		return;
> -- 
> 2.51.0.858.gf9c4a03a3a-goog
> 

