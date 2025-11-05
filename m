Return-Path: <linuxppc-dev+bounces-13784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0A0C343C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 08:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1cXm3Dsqz30Qk;
	Wed,  5 Nov 2025 18:34:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762328088;
	cv=fail; b=e91SIW3VK04cqkQp7b5CTEMdPngmdgLnGQMgbt//ps83fJSmRFpGMkokCeQxYOlRP1zudvDWGW/HfNMf40R1d5ss7AKx+fY9XsBNu6XOq1T7TDe4lJbCG1z/r2fuH8YKe1eNXBVyMoFZSWYODFsaf26ZLdWyNNfiw8hcfZqeM/LdZoxxjZdmcPS8zgueDdDODfIVhKJ55qGjktL7M58MjtPCmSHcTu0dPXOfAKAOaYtupWu/7bK5EzqkeT3GXtJvN4HZRdsT9W/5nCIaw/DWoT9S4vfZUmYDyWZlVvWhxFwtv3C8EE1G2brx7SubUm5xS/drRUPMC20MDetyVvw68w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762328088; c=relaxed/relaxed;
	bh=jrbVvVV7Lbtrq3MF7g7soch5HyB6b54V8ztjd8tvPBQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gFF/9FP5i3gDVGTui6P1pmm4FH8S458CqW75x5aqWhsoYSd39B1msnKJ2I8TCu7lNKyNU2Gozz0BXm0oDxpUso3c25ZQ9IVKgY02x0h8Slxo8U8gBeo09HYTca7MEp9Gy4zXM0Ht0kroHxMynOqbK9xwD9YvCh7jVLIthm0YHeefWfhMnIUY8V1L8KH9CQWWWI8Sa84SlBPCsMKkBtszhHw00HvgOdCOjKvJZAm5l6rSl17b0ZxFfofksDPhBurJ9QJkzuGHFPt5Nz4F+4QcSYtvFrWETjwpTJ8M/i/t4kjWXVevBmRuF/UColxHGV8T10JWi6LBd29TaGPWoT7Mdg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b5J95WgD; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b5J95WgD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1cXj5ycQz2yjp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 18:34:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762328087; x=1793864087;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=zq11GAr43sPwTZR15h2cBItUdusfxqdwx8osk8sOsk8=;
  b=b5J95WgDe0cuqRiMoEB9y/Xs3K7RO93+EgEcfuUU3PxMqgLx4DGHROnI
   4J9hn0zvCxZiU4+YciGYT3TkCQNQKknUgXsRoyylX6G4Gg/3YK1tZ+Rkm
   szqASHpl5rp34yysou0aoJ+OKTkPrXunwqQ9BvWtm07id+LwPh81f0bIP
   1XbvvUSwVvf0IfzjNaDKPCr+gaUQNoHp0IU54L8bPDZnclbFzeLwyS+So
   28cqPtXzMJwPhWa4XMCOY9Jjva2jmbrRyau0AYTgn3Bau05zx3wTuB6GD
   6PTVCyXnLjyUrQH7KuYL78iYBdDXj/gV+ONSISmzOIlU6pTRtH9bOZ9qC
   w==;
X-CSE-ConnectionGUID: mRFkU0V4TdeKrMy8LAfmdA==
X-CSE-MsgGUID: qgBwh/XMTQO/41H/dsy1EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="87062609"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="87062609"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 23:34:42 -0800
X-CSE-ConnectionGUID: pX3ZU/frT4a7OKigT/M1fw==
X-CSE-MsgGUID: 3XrUvOEzT9Sq8ZE2yBxXiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187830649"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 23:34:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 23:34:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 23:34:39 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 23:34:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YE/tT6AaxbMLYDrTnZHlBQIPJcoMq/VCgpLrIXz7fwQhAxyCNzqp9LOa1l5tvFCy8n7jF6gBHyrJkEtb+/3RzCqnOriBPtsvjHCGLbdJ1/t7LJqXXsQf9bmQEj6Ru2/4tY8fLXlkxzRQgUUlZucRUQX3pAiisHrUAHALk5GPKMM2G0fuCcbunM3ynFPtI42HAIMSxrp8s7Ml+012JG83ImDZN4ERi/+UHYEbKyB+jxYjlueXvZokC4Z/piPvW97+51VbSDVgNv7UUyeQO4uAwiphUlg/AInwLTGaHd0PJQw86EibgL1QvYOn9GBYARqXOSMWQNhju5zeTtGVVdKvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrbVvVV7Lbtrq3MF7g7soch5HyB6b54V8ztjd8tvPBQ=;
 b=JELLnAkaiAqf0Aalj9lF5cqTo45jgmJywFerhLuRXiKMEi5j69nYWpX01XRTFQPcm3bG73nCqZ7qR8pklIQAWx2Z2DtDqs4chtLh2S7j3XH/DXIEupq7NSselxfVjMZ9vGA6nLjDBFEQ3VHr0uW8e9bwa+3kFLU5GnY/8fLS7OqzxN6PaJo63JitWtRDH8+jptXHH00FVxHXGsMV4TpymN2wzSGdNjQdoMEtbWIb1p91/DXPT8liRRWUH7hldQ6tSXJBC5THVxpiBvisFHaE6yBZNLo4lLqjUmdyrYchMLhMhV3kERZRZDwDAKSI+TqplyW4Bafx3N1KxsOmBp7+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 CO1PR11MB4946.namprd11.prod.outlook.com (2603:10b6:303:9e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 07:34:36 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 07:34:35 +0000
Date: Wed, 5 Nov 2025 15:32:29 +0800
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
Message-ID: <aQr9jW/7zwWJaDFf@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-5-seanjc@google.com>
 <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com>
 <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
 <aQo-hus99rE7WBgb@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQo-hus99rE7WBgb@google.com>
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|CO1PR11MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: caeabc42-1357-482f-ed2e-08de1c3dc4f9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jBFHBRiy+lb25Spc1JhPYuYeKD43Qs/ynhp5zsi0PUBNVxYf4JTceIcdPRi3?=
 =?us-ascii?Q?9miPSO0FGiXZWPd0cTbEC9L+gplGxqcfn4dht+XcaslLy5nrpsXFQyC6ONEP?=
 =?us-ascii?Q?fJyZ8eoTu78zNwEG+egIW+sdUudyIaG9FIzgP7hKHiGiXyZtZPEA/ljKw7FW?=
 =?us-ascii?Q?S4IMHDiQfbKJYdNGbnXND1MDpoTuUGsq555LI2NgoZlak65xnuwXlHMIfInM?=
 =?us-ascii?Q?CCZypwI4TSR5uhRXaO7ctX3pzTJICs8LngQrhsxe4qmb7rpvgpzsawGj6Ayq?=
 =?us-ascii?Q?WehL4jTsAIFvd5s6j8yklxwkaR1+U5vSR534dO5APVQWRsD7lDj24HSwg07/?=
 =?us-ascii?Q?wbpc3ZEsELW0exH6SlGunfH4XVlS/U+7Ikmv+hqHL4CRpD7l3OFl+MSCrt0h?=
 =?us-ascii?Q?CAHIPipq/7TTs8OmJXobd6ry+PkIL5Z76fOlDVBQaIxuAA4cGVETv+6duIcD?=
 =?us-ascii?Q?K+kcFvpmPlATh2IRtydEYSgUXyADODkfrIGPg0MuBc3rOlja7th7A58lQBM1?=
 =?us-ascii?Q?i0jHmKhDqt1LCPLW+RDuSZgTNxV1gMRIRySQpwtcsuOp78gMFcgbOKjtwDwd?=
 =?us-ascii?Q?snSLCugg4P6J0MGZg6QoA17oNdw+8CO6nz/9gFGUp8Ae3tyGNPDeAiwKGkVB?=
 =?us-ascii?Q?RH8lZBGs63EPjL6P8IuMQzPgJ7bVbpN3ol6JjELlUQGzv10WBUtyY8qBRYFA?=
 =?us-ascii?Q?mrV5w1DszlcFSXsAGabZMrn9jltQ/sKpc+iygwmxZSaHqv24iTsFH0cRtmY+?=
 =?us-ascii?Q?8QPvsI0KmOVfsDAePBaa19uURLayQl1LBijNBbZ28uc2IjJPPv9kASFScMTP?=
 =?us-ascii?Q?1r9kDMREe9dK+SEldoA2tNHDWSuCy4Sa8F50n0a6XCYpx7+nndHKEWsF4ofh?=
 =?us-ascii?Q?jZRoHo5n0O/52P+8J7kBwSvg2U8Xu6RNgVYZWi1K0NWrW1M1JN62QBC6VZlr?=
 =?us-ascii?Q?KMZwyXJap9SCsCI/2izeZiPo0SwSQWn68c5GF6kVqCc7CeFWJMl1wwtswpBu?=
 =?us-ascii?Q?JRA6Z9GWR1SU8PDnZYuPoDN8JWy0P1w0IHWF78BagnL9GkvhJj+XsveLhtn2?=
 =?us-ascii?Q?KWJxRTBXAD5n0Dam86szTuqlQa8o2pd8S0s8KjfQwJB4OS3LO1vEeBy25nhB?=
 =?us-ascii?Q?ipViIIMnVbbs61n69nxtjx5wTx2kHpfb/fuNsl3Up7cBmmNVyk5Kzm3R55oR?=
 =?us-ascii?Q?xcRkunKUzcgOIJqignMhHVQGp7rOmScxmS4Cv19/8faVrOKPhKVUrCugtY3S?=
 =?us-ascii?Q?zqVzUr94cRsfEl4NCa8cNspKqXi6T17YHZitn9sDe8pT4oat6yaevFJSLKvD?=
 =?us-ascii?Q?Zi0DqKJCOKcskyn4lvCHxddyf1bp8YOSxZoSHrqaLmQdv7ZI6FTx3GqUxVM5?=
 =?us-ascii?Q?AE2FuCmW9kG/Un7RRoi5RvNQlV0BK7fNR1Q/mEl64eNZqynDtwyc+HY7Nl48?=
 =?us-ascii?Q?qOti+qdah/qr+lHMlDLORRU2B2uCejHTgW6wIsmKbxlML88ez3GV6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gmDFeY1fENQOZnVS1n6LUcStbd0grd1f5fUdym78JeRfLOTL1dojCpcauoSi?=
 =?us-ascii?Q?ShSIQ+H33aWBigY5RLjNB2wA5EQ8ATx9UZ2+8WNh+N4EeK5fwNrbERyxfYSz?=
 =?us-ascii?Q?mIfMNn+IJNHTPBMsTogUfMXHj36Dh/jYiLZ6b+Xt83XM0F35/PV+l046qe/o?=
 =?us-ascii?Q?rFqzfHN1ZrmggPz0DN0SBmIymX1bG5Xqyi7dQD2HXLnlIu3onirg7fpbUjTb?=
 =?us-ascii?Q?6IkjiEEsSep2laMmevsHbw62c4bIyUeyO6gYaNRV7bDChZVncDvHf/8sCI2a?=
 =?us-ascii?Q?wqQmbJfSbYOPmj5l54orLkfXhKY/w3Huvf/oQ7+43TVRZAY4NGCpRY8gLm8S?=
 =?us-ascii?Q?PgOJqCJqYavk17nR7oQvBuvC1HFuzFnp29q1/tuJXJAZ90KmFOXnbnFBLDSj?=
 =?us-ascii?Q?FeYvbNLUZHa5X0oTUgQg1R0Is5VYmkhCKOZVphOntZc+Ex3LeHEYq1YlHavo?=
 =?us-ascii?Q?Ewlq0PX8c0m1qRrZPWcBCGQGs2qnbjJNHyg/hQn6GXKv2wibnGGCyLdd8lOG?=
 =?us-ascii?Q?2IzTZfO3xUkcPwDCke8RLIC3Y1AuYY9hNI/1jq9ZmBGAhLi1FrtksaQKJVXg?=
 =?us-ascii?Q?JbPjyDu+6nXmamQyCNO8UuyfFDFa9iJQcsNIw/TurZl23F6R07x5Z7vVG1oy?=
 =?us-ascii?Q?aViG4qHuJjGx4PFTlEdgbBOzpswqpX90h4vMRJ/uacdsd4pqKm/l82qCjgNO?=
 =?us-ascii?Q?H52ocqxJ39EhafdP9fHtDtl8XVQ+RlAKkO/vHlFPPLKlaGe1SexUM+UDcbN0?=
 =?us-ascii?Q?ZdgFuVc04ah3amXh8EsLhvCjK9EBopCnz2iNtc3d7L7Zz9UW1FgV6GoG2EZG?=
 =?us-ascii?Q?+hN61YKYdJ7yZ2KC8X6LvjMN26wOimHb1gaKeMTXrHBQwfDZdyS3xVzynpPV?=
 =?us-ascii?Q?tNPWSLVvWkXrBHn6Fu8P9oSct1Wz/WU7GcGbFKEVk/TvT0R47mYljncwlwX1?=
 =?us-ascii?Q?CkW0XGjqPosu8ph3zEu1M10vg0l08BPT+VOR37Uwfjre84zzobFwteS16rcp?=
 =?us-ascii?Q?jjjxiRNFXc3UUFoUEh8KrYIGKIJwr/02xxn9ZFQE5W1X+HTP4SSksjYkHzei?=
 =?us-ascii?Q?5URGkpgETb7Xs00io26beo/Ahy8wzvxXZ9qCI8aQiOrlmzA/LrsKwHPLoXGg?=
 =?us-ascii?Q?nPLD4kEJCCK1HqopsP9Q0+JkrtZ46xDXZUVg0MhDp0FYc8XmYlxtgfRbvRmM?=
 =?us-ascii?Q?8D/sdRjkqWI8gCPki0/+obDpiWNAHjUm+HVy+dRZpQQPZ9fKYinbKY16aA6u?=
 =?us-ascii?Q?MySottrEtPAiJvdnMUAHRAasEscYOg/sk4ZGgRhWIxi+mqyuQmG4Vwmme63h?=
 =?us-ascii?Q?+ZwZClTIPon7KyCiIttUpVwGNcIa8ZiZNfdNoQvDcPKiIOnaMBCVJ77soCrj?=
 =?us-ascii?Q?K1K4hPkaOWPTvq/i9QkAGimFt0GV6xmpayzSVvvMbD4dFnJLv/VLhC3qTC7/?=
 =?us-ascii?Q?lII2/GVgyMqbZcs/8Ec5Wipvu8Dl6xtzTc4xGj3ZGoe8UlGZrNR516QQcp3B?=
 =?us-ascii?Q?/6ln2QfFps46TWTtgBldyhX7WBPAnIlCCQp+hATmwHXoRpU83mfQeAj+dhk9?=
 =?us-ascii?Q?nUvrN9QQ0dpgPPRAPPGShuIlTfzk526SuTH6UBDe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caeabc42-1357-482f-ed2e-08de1c3dc4f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 07:34:35.8381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMyY9RXdGWP7Ql1BfNYyjYNqPXr0x3JvaWvyLpHEI2YluXdHvTVtA2QmLRqCARVxVRAhGoyHlLYmuWZXjX/2lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025 at 09:57:26AM -0800, Sean Christopherson wrote:
> On Thu, Oct 30, 2025, Yan Zhao wrote:
> > On Wed, Oct 22, 2025 at 12:53:53PM +0800, Yan Zhao wrote:
> > > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > > Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> > > 
> > > Hi Sean,                                                                         
> > > 
> > > Will you post [1] to fix the AB-BA deadlock issue for huge page in-place
> > > conversion as well?
> 
> If you (or anyone) has the bandwidth, please pick it up.  I won't have cycles to
> look at that for many weeks (potentially not even this calendar year).
Got it!
On the other hand, do you think we can address the warning as below?
The code is based on [2].

@@ -853,6 +859,10 @@ static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
        inode->i_size = size;
        mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
        mapping_set_inaccessible(inode->i_mapping);
+       if (flags &GUEST_MEMFD_FLAG_MMAP)
+               lockdep_set_class_and_subclass(&inode->i_mapping->invalidate_lock,
+                                              &inode->i_sb->s_type->invalidate_lock_key, 1);
+
        /* Unmovable mappings are supposed to be marked unevictable as well. */
        WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));


As noted in [3], the only scenario can trigger the warning after [2] is when a
process creates a TDX VM with non-in-place-conversion guest_memfd and a normal
VM with in-place-conversion guest_memfd. The two invalidate_lock's don't contend
with each other theoretically.


[2] https://lore.kernel.org/all/cover.1760731772.git.ackerleytng@google.com/
[3] https://lore.kernel.org/all/aQMi%2Fn9DVyeaWsVH@yzhao56-desk.sh.intel.com/

