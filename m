Return-Path: <linuxppc-dev+bounces-14310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CCC6C12D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 01:02:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dB1rS2GDPz2yv9;
	Wed, 19 Nov 2025 11:02:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.20 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763510552;
	cv=pass; b=fz1F6SPek8L3nUcPyai4PljcS7vw9UJ/SyUdk9D7KK3fPCS39Xnwcnm2gL3JCcFX88/CxDR0GJ24ohV5prr7aVKdNb7uzzSBXPo2rQJE5vwjcROELpkrS4PNz4OX+M2EZuqq7Uk5vptC4inOgIypzuCCt+FG6L8VnmWuOr+E1b2nPsrE1QZV+WnLXdsgPlEfUoLmQpoU6aFtzrbr3GQAVc9LxjUNepXx6u0NyHTqArOBmQVnjhJjnp5Id/LMqbCTP9p4HFXOxrXDmDp/8bnjTRW0I4RnRpZ4pqcBJ0IIfv6dsCeQaOLG/SP6gRolwxJ039NeXlAaC9QzfyuFV+cDdg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763510552; c=relaxed/relaxed;
	bh=6ehWNyduTbrTPdiobTvLtfvXjYlMQdG5MBQdV8VUGZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KdPZXn2mi5IDqGPlt5MRsoMTCtphaduVp1NQ/Zs1Lk9Kp10MOn3kV9veu0GxmLvROIZHI482xi4O0vBH4SCniXMnl1joqSodTJqxW9eCxVbLNgmYg1jqOHYDYzJUfcuzJvFTalLUOhoDrQXr9evviQ4uqKrsWk/2YfShc85zuqQr4KqgugjSOrO5ht2dJ3Rk+bwn4lZS5pc6VGexNWviUuznDq4znOjlUa+4DBGoW8d6AFPUtkWarZfEpmqEa04lul+FiqZv/Mk4Qd3Gn7g8DFPwVOLnqLrkBKYMt2CzIbD43nQbLubxzmG3zWz/yt7WTBVPMk226c76t/w9IeH9gg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jJZmfmYz; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jJZmfmYz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dB1rP3KWXz2xqh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 11:02:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763510550; x=1795046550;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6ehWNyduTbrTPdiobTvLtfvXjYlMQdG5MBQdV8VUGZs=;
  b=jJZmfmYz5EPGD7vb7042NdYOKvWOaxw3pzD//Yhb+iqSQVdfWEPlmTnu
   dtD+uHr5+0iHyk6cONNM7L0EuF0bC5BM46Nv9PB9t3qX3uewGEQzjMYEZ
   l/jUgEJrWftuvXtvI335d+L4piftMSEsM7DlRHpeuZRcyNpGAPnq3BTtP
   65crktB3vJtFR0WAzze7hDo5sRkr6TaHbhJd2NeJrKNOEQaG7j030Qpu2
   r8QtpnI7tPA0NPb70eHRVQnpumsSqwPK9HZUdIouLN0xA1x3m6KhQWhVg
   xInxHkfqTzjrh1Bn+3y5DSzEMkIYPFKP5LEoa28EdqayTFUbvQAQxDntM
   A==;
X-CSE-ConnectionGUID: buAnTZmHSFi2xDFFsLLa1A==
X-CSE-MsgGUID: SkqzuEu9QK+leWBcyhy0VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65249203"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65249203"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 16:02:24 -0800
X-CSE-ConnectionGUID: 1GoxQLqRThO1WPfNv2fWqg==
X-CSE-MsgGUID: LfF4r/RCS/ecY8jzVzsQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195827162"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 16:02:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 16:02:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 16:02:22 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 16:02:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTPbia1P6GkHTCoWH+BSZBCogJMCz6H6hVFXF3ik9KIfuMiSTI08g4DSqUQH2mGwcW442VUCWNPbVUOOtV7TGEAkzvk0VSCQvAYv68uf9dDdvfO6zIPoQnaU8PCjqmPFN3+lVNDwDzEIyEAJdkENWJg2iACH5lRkNKZ3yB2PsuoAXowg6UgCNwh/siLt9IIqSY4HanYvQyksj5IvM3w3e/Ne3nv7UiXz/cQ6dxfdNxAeGMfwpF9Lq4Wp2qcvoxj9DGeYTiPqYuVR29EIAj3IoFiWIxF1aLaQ2hCH1NjbDQyCWLjETduxpixVqqK4d5MCWjJqqQaj5D1jRBsbgALudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ehWNyduTbrTPdiobTvLtfvXjYlMQdG5MBQdV8VUGZs=;
 b=h7MqDuHOlB8UZkorSvGcf67SEB2FVIte2mriL3XZwQtZZHuISr522OFjREjirtqiedhjVADQXs7sCE5cTToE4cgLZ+ca3ovFPeCwMyylFesgTE2JlCX7RBt0LWPD2ePDxEKmDFLAW3gzqJ7Xz8ASxBWFPc2rd4eFR9D5DT/4cgN0Sr1qKEI1NwSmlB5NnaoWXxLFEfNspzTKu0dnHKqyegAb6Vlh1xScRXJa08UkCDi/zb44JEdkR3TQUV129aAVSbedcebBVUIGHstViI6D7pYwD/J8Thb+030cmlmlJ+8TRHqKNdE4WN6EJ6uUmPdY5pHSLXO8gZsDoiFGlMxQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 00:02:14 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 00:01:53 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "seanjc@google.com" <seanjc@google.com>
CC: "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "michael.roth@amd.com"
	<michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "Annapurve, Vishal"
	<vannapurve@google.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"anup@brainfault.org" <anup@brainfault.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "Huang, Kai" <kai.huang@intel.com>, "Zhao, Yan Y"
	<yan.y.zhao@intel.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kas@kernel.org"
	<kas@kernel.org>
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
Thread-Topic: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
Thread-Index: AQHcR6HQe5TyQjVg+EaivtbibGxV/rT5N6EAgAAIYgA=
Date: Wed, 19 Nov 2025 00:01:38 +0000
Message-ID: <7da382bbcb33413369ba4fe5d706c02f0d7a8422.camel@intel.com>
References: <aP-1qlTkmFUgTld-@google.com>
	 <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
	 <aR0Byu3bd3URxzhu@google.com>
In-Reply-To: <aR0Byu3bd3URxzhu@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CY8PR11MB7036:EE_
x-ms-office365-filtering-correlation-id: 7e342b77-4917-405b-ecf1-08de26fed468
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UlBOMHRyZzF5STZwUUZzV0dwWktYeFFxL2oxM2hsT0hkb2hhM2RxZG1BS0ZC?=
 =?utf-8?B?QjZwQlRJcloweUtoZWYrT0ZIVU1sZkZWaUI3aWI4MzlGUkNUa2V0aVl2L3Z3?=
 =?utf-8?B?dlZYVms4MU50ZUJDZ1lwdWJPVktIa0lSSjhmSlJneEhvNHBadnlpZ01kRFRr?=
 =?utf-8?B?OC96K2MxaTU1b1R0dnp2TWJFdEFVbGJiVW9YV21POHBJd2h3Y1l3Z2VpWExh?=
 =?utf-8?B?NzJLaUdXK1NlYWpxU3ZZNDRZR3BsWDUyM3JlQVZnWUFvUnJxbEZMT2hIeWhP?=
 =?utf-8?B?YlhXc29mcjhSMmxheTFpLzdtSXQrZXR5QTY5MVZ6Um5ONlI3Y1IwdTZScHZa?=
 =?utf-8?B?eGhTT1FjQzJOSU5zSlRiR2tnSVR4WGVEUFVZZGF3UGtKTkxYcWhaQ1VHWGUw?=
 =?utf-8?B?Z2RweTUvdFZEa2JqdWg3M1RwZTRaOE5ybHo5NVlpNFpsQTIzNnF1eFRwUTN4?=
 =?utf-8?B?eGN3NnF5eHdTM1d5MHBDZ0tpTk8rYURvMlBDZ3dPaG5RNHRNcXVoTG93eVZp?=
 =?utf-8?B?S0RaaEc2c21BcDFabzFOYk9RSVVxZkNZbWVKQ2ZweHRkNjJtbjFUTWw3M2JZ?=
 =?utf-8?B?andDbnF6QXRibUZYc1ZFN09ha3BxY0pNeGlZM2N0M3JkemNKN2N0N01SUWJU?=
 =?utf-8?B?WUdmbTF3ZDFCb25NVXRIc0JnV055U2tmbXVsU0cwSHd3UDZBUFF6cGRkL3V0?=
 =?utf-8?B?RUlTbFVPQlpYVklLZVoxK0lTNi9iSWNUSkFobWkzUVZCQjZtVklVWUNTU3BI?=
 =?utf-8?B?SG5GSFYrQTNVMXRoZVYvaFFXQ0NxVjBBWmNnQjJyVE03SEdzNXFKcThhSFJF?=
 =?utf-8?B?bjVtdjRsQlpzdWJKSW05UkdCMGRzbHNZUm9ORTJmaWFsZS92QkJUc0pMSVhM?=
 =?utf-8?B?akRsdDVaaUEzZ05FcExuRjJidWNvbFZ5TEl4TksxNzJDZ1lNMUFzalE2REJW?=
 =?utf-8?B?MGY0a0hYUXl0cGVXZGV3SHRpM21yeVlhZ3RRb0YvNDZOTGZCQ24xaWI5d2ND?=
 =?utf-8?B?UXVUNy8xQWY0SGZJZTJmN0c2dGZGanhqSGRmUktBd1dTbGorTXRQQkc0aXdu?=
 =?utf-8?B?cC9FY2RTVDR4SDA0SmpZbVhxRVd5d21VUUk4QUJYcUNtL2VLMjd3TDhYNEJV?=
 =?utf-8?B?THViankrakY4YU5GOHJKaE81Zk5hVFA5NVVEdmI0S2ZodGdIei9Nbk51VC94?=
 =?utf-8?B?M3JSUko0VXpiRFpVbmlyaC85S3pYNEVseFpIZXcydjlxUlpYMTk4cmJ4MDNG?=
 =?utf-8?B?NFVWNGVNK1dVVXJXWVFzU3VtbGpoTVZia1BDWHpBQ0NKaE5BcmlXckhvQ3c2?=
 =?utf-8?B?OUVqblc2alVxT1F2c1BURE9oVUV0RmxJaGwxaUlsNTRZa2xPSjB3OC9BMzI0?=
 =?utf-8?B?ZWdMcStZTWtQUVU5YlF5SktOTWd4R1AvMy9aM1pXcUtxd0NEYTVTakdGOFFr?=
 =?utf-8?B?aWZFZGhKMk9hV2I4aTBzaDdtMEYvVUl6dnA4dVhDbXQyTGJCVTY2anB3RWEx?=
 =?utf-8?B?UHhNb0hhV2I0aUpCdzJvcG5oRUp0bkNhVkJPY21qK0tna3E5S21VOEFuaVph?=
 =?utf-8?B?MFR6S243S2c1RnNOOElNQWxCQmF2aCtGVnk0OTlOWnA3MVA0cHlseXRJbzhj?=
 =?utf-8?B?QVZROWduNGdZam1CU3Y3UEIwNDN1QWF2STRKa3IxZHBlRlFkZUJkYm9UU20w?=
 =?utf-8?B?aGxJY2pnWE5sMWtsK29vWUhrZjVMTTliK2ZycE5BbU5ZdkNuMGlxaUZMUnFs?=
 =?utf-8?B?Q2N4N0oyb0l5eFhRV1RNTXdYR3dkMjBRem1MOVpWWC9STTZCV1R4eExKUEMv?=
 =?utf-8?B?eUdaUndmVStISEp5QTFIaU93cDNlbGJLMWxqUnk3bTU3VkFjOUk0YS9IYmVl?=
 =?utf-8?B?MVRQdW9ZVStVTmNYQkw1eVBHanRmYWtxYjZlZ2JWczFCL3NuNmFZVjVOQnZT?=
 =?utf-8?B?Nys0Wll4YU40elA0YjJvaEFMME0vM21DeXVFZzNjS3hEYU5sWitoUkxDcXQy?=
 =?utf-8?B?VnhmR2s4cWhGUVkra21lb01RK2pxV3I0MzF5T0RSZjhJaVA3MWwydzBVZmxq?=
 =?utf-8?Q?FwlPES?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZERhOGd0RXBxb2dMbCsyNkYydTN3SWQ4L0dvMDBKbTBGQVRUS3AxWlYyYlFO?=
 =?utf-8?B?cndSbXlPblJiOFR2UTVyTDFkczNEMWIzbjM2OHJPMUxBYk4wT3RLUDkzaFk0?=
 =?utf-8?B?R1BaMVgvMlZJOHlrYjZUUkNtMGxXOUJLV2d3TmNvNS9lRzFhT3I3QVlydnR3?=
 =?utf-8?B?SDcraE5naVR6NkNiY2dXR05ZcWkzVHY1S3pKRm45OEswMVJ6OXBocHNLNWx5?=
 =?utf-8?B?ams0NVZrTEpvUjBxL2lCWTZoYThub20rOHJ3QmlMRCtxUmNINnkvSXhIMWRv?=
 =?utf-8?B?aFoybzdNZ2ZJTFFjMXZ4VzM5dW9Ibmd2djRid1N3NkF3YzVzNXIwa0lJTW9y?=
 =?utf-8?B?N21wSHJnQlVGYjF6ZUNLWjFOR2xYWHVjRlZmNVVnYS9ZaWFsMGo1R0ZOVEEv?=
 =?utf-8?B?S1NMcUlCbm15NTllSGRpeGJSZkdHNTRNR0h5RVJzbGpic09nT1ZMVU9yMXVU?=
 =?utf-8?B?VGVmL1hIQzVXQnNZQk56M2FaeThHSUVQOXVUUy9WUlUwY1pvNHRzVGFGUHhq?=
 =?utf-8?B?VU1LVUZ4K3JySitSMERXS2dVc2tNVU11c21obzY5OC9nc3lUcFFOeWVST0t4?=
 =?utf-8?B?OXhocFRBbXg3eEtZVmdDejR5L3NRS1lsVnJKaXh2NWY3WDNOWFF6Sm0vYjNM?=
 =?utf-8?B?cVlhaUEvT2UwTk10UVQzWktzTTh4RzFGRnRtQ2FRelZSTDFnNXFWY0lldDdR?=
 =?utf-8?B?ZTlOOEJWeTZPZ1JkUnpkV1RITVIvSThtdkx2YzAzN2FxS3dRMk11Y1NxbGV6?=
 =?utf-8?B?QUo2aTNEVTFZRkJVWWNDQXcxa0xNR3UxTmNvNUZ6eUx5UFZReS96WDUzRzh4?=
 =?utf-8?B?SFZ1ZmVSamRnK0MvMDlpSkxocXFRZ1RJclJxb1RKWitJZHRxdDFJVThhVmxK?=
 =?utf-8?B?dTZsdDBMdGE2emcxN0RGMFhiYW9PcVJwRWY3QllUVW00MkxZVHQ0TmpOWG1W?=
 =?utf-8?B?Vjl1OFEweE5WZ0NESzA0R2JMczdCUDlLVEdCT1ZaUHRpNThZa1lrTmpVMURO?=
 =?utf-8?B?dXM3YW1DWVNrNW44RHNNcXI3bkxpWWFjdUxqRTBtRVprc2JaMjZDbXk0Ukl2?=
 =?utf-8?B?ODlNVFgrVGJ2S09XTEErVDl2RG93N09DSWdHTktpMUZqaHBCS3BabklGLzcy?=
 =?utf-8?B?d1Nibm5ScVVTQ0NXb0ErcklHbjNiQU91S09pdmMwcDBTbjBJbWZpbEY0S2J2?=
 =?utf-8?B?N1JHYjZUZ0pCbmxRb1IvV1NLeG9kY1hpanJJNjcrLzRScnRBTTZvczRoaVlF?=
 =?utf-8?B?VG5UU1c0a0U4N1YxdmxoRUN3UGZhekR5VjRGNWdjYUk4VDl4bExwUGo0UW43?=
 =?utf-8?B?WnR1V1lYUjMrak9ibWtsZWdBQ1l1bzliRVJGN0Y1dTU2YXY3S05iRitGTHNo?=
 =?utf-8?B?MXpqY01oUzY2UWNiRkF1cE9Wa0JDSEwyODcrbEUwMi9kdFNWU3Q3MWcyLzh0?=
 =?utf-8?B?SjVVUjN5WXM2YWxpVEZnYVc2aGFrWnRoSjBRRDNqWlRTL2t3RnB0R1dDWmJz?=
 =?utf-8?B?b3lNTm1uNWdkaUx3NS9mQlBIMFJyeGZGU2RTcEZoU3psU2lOUmV0blZLQmVP?=
 =?utf-8?B?blhTM0I5TGQ2SUxwT0dOa003V2dycEpoQ3l2dVZBTEM1M3U0UmpLenZvb21U?=
 =?utf-8?B?eGgrSXNnV3JjRnQxeVZjRDFBUnhZVVB2ZFJEd1pSQVdTUENRMFY0MlA2WitC?=
 =?utf-8?B?SDIxaVJzOHBlMy9wZUdQWGx2ZER1d2lEcGp3bEw0OEk5K1krM3ovcnk0Tklo?=
 =?utf-8?B?YXRnZzBDV1pqdTNNNndEVk9rNHlpa3ZvbGFoTUtxVUpLdUc3MFRic2IwWUht?=
 =?utf-8?B?UFh3b296V01Ga1BzR0I3T0NOQXZ4K2VWd0srVU1INHhvZU85Njl1VFdwOXlS?=
 =?utf-8?B?ckp3TG9qOVpvb2hoZDh3Q3pQZDVJbE9wVWFnV092Y0lWNnY5NkF5MU40ekR1?=
 =?utf-8?B?K3dEbWt6VXBPdFVhb0xjRGZNLzBJOWUzWm5MUnZvSWNKUUQ1c2ZUZjh1R0Vl?=
 =?utf-8?B?Q3lKYVgvYXdKbkcwM1dhZmU1b3FQU0wvWW5PK1R2cjQvb2xoKzFtUWNNRE95?=
 =?utf-8?B?WHViSlYyQU9tY3duNEFTd3FnR3FwcC9BWGljOElNZkVXU283SU5oQ2hWSTgz?=
 =?utf-8?B?QlNrdWc4c09uY1R0UjJhZEhxVnQ2M2hScStVUnV6Ri9iK01obkJXR1lqNmlK?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B07E8DF676F994D813D865A6E90E776@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e342b77-4917-405b-ecf1-08de26fed468
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 00:01:43.8066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4biFjeAguMwXOEtyzs9PdX9APEgeGNG+GmdYJekMXPExEjwmCL3zWqhq4b2CoNO23gx65D52Yrs1JoVO3hcuWhMoZLYaV0b+TEGjBNw3ISI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVHVlLCAyMDI1LTExLTE4IGF0IDE1OjMxIC0wODAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBJbiB0aGUgZnV0dXJlLCBwbGVhc2UgZG9uJ3QgcG9zdCBpbi1yZXBseS10bywgYXMg
aXQgbXVja3MgdXAgbXkgYjQgd29ya2Zsb3cuDQoNClN1cmUgdGhpbmcsIHNvcnJ5Lg0K

