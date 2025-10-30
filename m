Return-Path: <linuxppc-dev+bounces-13610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3393C228A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 23:20:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyJTq4KNkz302b;
	Fri, 31 Oct 2025 09:20:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.10 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761862847;
	cv=pass; b=O0iToEkQ9ZfL6pDyNB/ZLOWXkQ7fhggkqHNJftT+M1jwFba6/eT4VlDaW0f1rpgr8z2HI902m1W6Y7buNxXGMqv4j63jbqcwugiUkcrztHmjJEuwPa0EgoctK6ZwOeY21yK7Cws+tRU3QOS7n/8rr8hJsqzvm2r7hZEiM6olMIDZQR7IOuL6PVDD6SbXxmUC3Nq9mq3fvbowjxiHqHHpVENyTy5irz3mT216NAIWkC5BU5vhwOFlSH60kSabpl93VasoyHmMqaJzCR9e+zDpZW0q6UcLVqfp3TU2e5P4T8FF/p3r8XiP5yClnq4neq+PnTFb9R+QxauOGZT0CY5KhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761862847; c=relaxed/relaxed;
	bh=WUbLlRsvry3kUqi7goytXLzAOFij5PCYamCuPrbn+5U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XU1Duhx3p8sMjVsGfGVd9dyaFTbxakV8hwwCsx3XjB42coF7Mlux0/nVkjd+MCrjEdzbe3hZr5MHLEpKSBAacETVLHj0yokTpthUed/Wlq3QsWQNfWZmrxUsZgi2xm48B/tsjc66F02HGdlXNgUqsEXWk3wXoRKqZHBMhJ77JyV/1dD0XoBgmbCrf+JNfqObQjHTRlttB0OG9CanQpGyaJCX/84P4kuJ3Cp6G7wPU8hgEXAWz16mVrMCDykIt6Wz3BLnPgIXRVOVvuo1Ja4DBXAxL0t69TBZvESatNH0usGcNDNq8R2nj0nJV+KLSjc06ri00PPpntwoJZPHFtL+ig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XM++I1zJ; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XM++I1zJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyJTp3Y1yz2yx7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 09:20:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761862846; x=1793398846;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WUbLlRsvry3kUqi7goytXLzAOFij5PCYamCuPrbn+5U=;
  b=XM++I1zJRSPCpiBC0ccu1SJNmJS3yo79+5EZ65IVYgUBDOfVp5iPx3lS
   SzmFkCNWKJJnIi0S1QqRqm1w3nxJAU/G11+JW5fCe0O/TdpiXFAfbnAFm
   wF6iAW0QOCzsRZGjENUEmwQSZaOuAalORWvaDnFpLUT7qlXH9GAIoXnBv
   JupfuVpUwyDezJm9dygmwvLR8Dj3Nl9xo5po9U2VUJin0cRU3vIdhu2bN
   PWVN+8gQuy6im70HvfVtnyjkkHkGZ4cTriEFGY83MTwCU+uvN5o/b7MZY
   XhuYYLSK7FmfBBg3qM0AMXcz2voZcTo7x1rjCCQ6296qhLpw8G4cuFOAS
   w==;
X-CSE-ConnectionGUID: W8b6Lm3WT1KFOdFkgTSNNA==
X-CSE-MsgGUID: Ho/Zkv+tTFqHiSyuxwzNkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75367850"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="75367850"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 15:20:42 -0700
X-CSE-ConnectionGUID: GdgUes6qR6uUWrVUhirSoA==
X-CSE-MsgGUID: pMcZRkdTTq+L+Bp8GUhgEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186008390"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 15:20:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:20:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 15:20:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:20:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2W/WnY8DgFzIOiZyT9waKI3hyDgV6uuvqsj+r3gm8kBlxX0TZZHFLTZE6/pO1c4UAYT2AfVwM3IRsvRuYcIhY8P/X49s09/9CDxFJAGwdtnhQqB34w3tV2OhFm7i007tN7ZaVm8hZrwlVRsMGRwuSCzR/vt2TpxumWNsqAc0f5jn6LN9x8NMq1UvhY66Ra+joFeVps1hvDKDfavBXVXKPxAEEipHime5FLYOuzUGl++JO8G1D5c0OAxgCn8/sqeceyQACqBsVkSTRvbYapEcXLFOnwUu6mH/TZlro2u9p9HcAI54PeNoMaRsHDvbskwzdnVz3TLxmLca7aB+1XYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUbLlRsvry3kUqi7goytXLzAOFij5PCYamCuPrbn+5U=;
 b=fqWRNSarLlzNQIwWpuCwyOlNeg9ZDNZ4fUsRUz9iA7i7ICodh0ig1F1ZkY6AaxpItNs66tRvSJJJWzwJ+BKNyC12zOUWuUHJ334w1f/vomHlSCfjmI6AvHefzFhd2nYHasHEDztPavzEsnVUlmrOwy/oVewA9JGCd/tGvnBykCJ1TyeYHmdZH5+s2IGK75AN7lJI3iAs/pqf2u0amNoM2/TmKQHmueg/ehODIYv/UyooQAUKP4wqq8tdEiC4/HO6I8SFrYIaC2KpG9EkblpjAwr6cevPHy5uOWh9ZCYN5tM49by1DGG1zoRFAzDQA0NwCT8MQCA66i8ywkQcMNNbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 22:20:39 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 22:20:39 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com"
	<imbrenda@linux.ibm.com>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v4 09/28] KVM: TDX: Return -EIO, not -EINVAL, on a
 KVM_BUG_ON() condition
Thread-Topic: [PATCH v4 09/28] KVM: TDX: Return -EIO, not -EINVAL, on a
 KVM_BUG_ON() condition
Thread-Index: AQHcSdlG5rljUYMKqkS/rR/jBPCD07TbQyEA
Date: Thu, 30 Oct 2025 22:20:39 +0000
Message-ID: <a9c3de395b377118a2cbfe0e7abdf7fff139e787.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-10-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-10-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB5819:EE_
x-ms-office365-filtering-correlation-id: f1cc8075-4eac-4c62-188a-08de18028eca
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?SE5QU3JvdHRWbHk0Y3J5N0Z1SmZOdmhvRWRzRlBiOGlzWkNGRjdKb2JjTUZZ?=
 =?utf-8?B?cTZ0c0xKSlp0cm5qaTdaSUJHM3VodDBvYWFPZTJ6dUM1TVI3eVNDV1pDQWVZ?=
 =?utf-8?B?b1Myb0Uxc0wySnNDNGh2eXlUVXd2em1VL2NzZVNQWmdORWNMZWFWRCt5dU9p?=
 =?utf-8?B?NEZLNzkySmVrWklqUDZ1Z0o5cXMwcktCT1Z6cWR5TzBUYkhkcnJ2MmxzTmla?=
 =?utf-8?B?NHR3MTYrYlVlQ2t2OXlOcmZYR1lGaGlmOE1XazVHelpuVFliUHZYaDVVSFA2?=
 =?utf-8?B?alFqMjdzSzM0WjhJV0YwNStrL3Z5S1hsRjJxMHhWOXMyMkRCZjg5Z3RCZlF0?=
 =?utf-8?B?STFsdUQxUi9JOXB2b0F1RHBPTG8zSEdEakVvSnc3Qit3MC9xVVV5WjhKL1pa?=
 =?utf-8?B?WGt6eDZzTExuYnJFcFNaaGdja2RtN0F4MWlseitpcUhIZHJvSDFwcW9kWkUr?=
 =?utf-8?B?Q3lHUndabEFpUU5kdmVMemEwTkdSQmtXZzg5Rmp4VXVGdWpaRk5ZVzVwRTNp?=
 =?utf-8?B?ZCt0STg2L3dsekx3NjdNalV2NVlUVzAxYVo2U3dMU2hLYXN5dVJhTDFzRlNo?=
 =?utf-8?B?MURqem5sMGNXbXFVNDE0QXQvMXVqSXZyb3ZRNlQweDh3RUtaeXk0Qi9wNWJY?=
 =?utf-8?B?UzF4bk1ScnNMZ1FCMXBhL2xDc3V6eCtEZmo0V1h5YmJoSFJVTGVvaGdXMmQr?=
 =?utf-8?B?WkdGbVVLSDhoc0llYU1ldWlzeHRwOURpRU9UZWtwTW8yQllNWXh4cGp0Qkty?=
 =?utf-8?B?OGYxeEdITjJ2NXQzaU5jL1dLWWs2NDV5aWdwSWY0eFp3Q0Vud240emxnNlRV?=
 =?utf-8?B?akRYYXRHSXl5YW96bkNLYXhzNnNIU29nMk9BY1AySDl6b3VMdVRFM0I3OHZX?=
 =?utf-8?B?OThZMnBoN2RDSkVhRjQxbGpVNHBoVTJta0UrZTBqcktTbnlPeXBLSmZUbEhI?=
 =?utf-8?B?K0lHVmVmRzh0RDFyQ1F4emhoMmdQRFB6VmRVcDZPZUlqNzVNV2g0aTdXem9E?=
 =?utf-8?B?NTlCNHdvbFp5ZzJtc01qQ1B6VEQ2elg0S3VVQ1N2TFc3cFJOWW1aUWVBUXc0?=
 =?utf-8?B?QURsWERsbGZDeGNJNkM1ZHdLeXYzRUdFUTJ1REJBdllNRUY3VHRCdDhTVER3?=
 =?utf-8?B?aEVSTHFmN29aKzZCY3NPYVFIVE5wODh4SWxvK0cydXFLWkRjaUhPNHg1VkRV?=
 =?utf-8?B?U0pUaEtxeldlKzFVcWMxUTdad2xYL0JsYmtrbVJta1FZVzRsQ2dMUFZNbkNR?=
 =?utf-8?B?c1BlWG9mcFJ1MG4zUVVJenBKUGJpcGtjRFFDdytmMVUza2VVbm1USWYyWWU0?=
 =?utf-8?B?MEZqYlg5N0djU0hqVUk0ZU4vaEVaZ1BYOUliR0NCbVRsdi9ZMXlQUnJzeUta?=
 =?utf-8?B?M2JPZEZQWnRaRWFSZEh2TGlnbzJEdnNsVWNlZTRRRjBPbTVKZmluSlgyUWor?=
 =?utf-8?B?UXBvd3lxNEhQWW1kU2NITGNWcnh3Z2FCUlozQmhFVFhoMmNvYnVGbEtqVzVt?=
 =?utf-8?B?bGN5Vlc1UWNNM0R1Y2pFU1cycGE3dTlrUHc5a0RPMDVYdFA4aFNiUHRYZFFZ?=
 =?utf-8?B?VHNCL3V5bU8wYTB3UkVXY3htNDltTXZqS3ZqN01hZUZXWkJQbnJrUngyR0FO?=
 =?utf-8?B?WWhvdHNsSFlpdkNxR3BwZnRoTVJPcnZIRUhVNjIzVlMvcmE2RUFLeWFDSXZz?=
 =?utf-8?B?V2xRdzFkeU5YR0N6L3pnNjZraFpacXBHcy9uMWlCS2ZrQXBYVyt0QUFqUVhm?=
 =?utf-8?B?WGFsRXRmckFCMyt3dEpSZUZoc1NVTVcrd1gyV1dSRVpyZDY5SVZ5WHZWU0ds?=
 =?utf-8?B?SzRqZHc0bysreWpadFNRcnpab3BqZGVHK255UlhqK1BJam04TFcxL2Y2ejNn?=
 =?utf-8?B?eUd6QXFrWlk5MndlQkxTNWdBOG9oWW84TjhMd2dkcmo3V21pcWtOODFrbGpm?=
 =?utf-8?B?cVpKODlpSFd5YUxDMkI0d0s4QlFUdUgrU2VKTXZGU2xEUHVCUmJrVnJGeWtJ?=
 =?utf-8?B?NEJUZ2NranpVRnh6MVNPVS9xUk1aQ2g3V29WNUVWcGRoYWtDdGV6TG1wdTdh?=
 =?utf-8?B?VVZpM0FBbXN1QXZOVDZZTkQxcksxejdnN3NnZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFRKR3ZZRWphRXJub2c4cjhMWUVoRVJzVHdoa3Y5bkQzbVJKQS9rNEMrL0ow?=
 =?utf-8?B?ZnBPNER1Y3ZBWkhoclVCdnFiR0U5NTJib3BNaGk2L2NKKzMxNXFidVA2ejBI?=
 =?utf-8?B?c092cDBMUFNIL0srWTFnNDBIQWVHNHppbmR2bFR6Y2JEWVlxMkNjMHBDQ3A0?=
 =?utf-8?B?ckN0Y0UwazBqMUs0QjJkUDJwZllCYmVHZEdDTEM0ZnZ2MWh5aXlTaU9EN1k2?=
 =?utf-8?B?c0tod2h0b1pCSlRtazc3TysyN0ZMa2s3SmUxRXM1UWxvTEhjeXlZeThnZ0Rr?=
 =?utf-8?B?dldDdittR3ZCVmhlV0lsK3VGS05YbXhGTVZUa3J2ZXpOMnltbGFaTTgwQkJL?=
 =?utf-8?B?WUFtWFFVNDA1dVJtN0RPZE52K3JIVHJaTHUrb2ppRFlQOGljVWVFTkp1byt2?=
 =?utf-8?B?QnZBSytUUEVhbDFyWjhhMGxJSE5wSTRHSWxXZHVzNVJWbjR0RFRiR2U2Lzd0?=
 =?utf-8?B?cjMrTEJRd1J5UTExRUFvUVE3S1BkYmUvSndPTEdYenBvZThrQklWK1Z1TTJt?=
 =?utf-8?B?REF0Qk5wUXJLVVF3TWhJQmhoTVFaQVMyS3JSbXpJTDVCMndGeDF3RVh5ZzdY?=
 =?utf-8?B?ZmlNaGhkbDRPQzhwQytQZ2dWa2lzZlM2MmpoaDFqRWZOalh1UzRNVjJXYkhi?=
 =?utf-8?B?ZFl0cy9GRUZSdWVoY1BuMWhwWVQyUkJDaU41YTRvRUhwOFQrZ3dXYktnb0xZ?=
 =?utf-8?B?TVdzK0ZTbWhnN0hZVXJ0dGFMU3VWck5zSmM2dkxBSTdPMHZ2TE5QOG84VmQ5?=
 =?utf-8?B?V0l5VWxiQ1NUakx4YWhZNVVhM25vMHd0ZnlNQmcreWx1ODBjUmk3QmtETTg4?=
 =?utf-8?B?K0IwZHFxN09JU3NvQjFUU1F6TldTV0tkRWU5VlJENUFqeHBLU01vUVZCR1Zj?=
 =?utf-8?B?bTlVdVNHYlgxZ1dBZHVXVnBCMXBCWjZiVFFSb01Dc1BQcGVSclNpUDhiYTVm?=
 =?utf-8?B?bzJMNEFjajV3RFcxcnRjQzV6dXZvWG1BRjYvM2NQclRpT05hZEpaaHJBc0w0?=
 =?utf-8?B?UkxEZ29SWUR3QkpmSERHOTFUbEFpUEwwbTMrTk9rdktPS3JIdEhCeC8wZ05x?=
 =?utf-8?B?cllWWnRlemJ3QjdGcXNFMHYwQ3dQU2loeHJzOHJPK1l2NStMeGZLVHJsNEMx?=
 =?utf-8?B?VmpxTG5HbDNaRTlKYVlkZEdGZFprZklKMisrd0IwcVc0aWFYM2MzcUkwcmJ4?=
 =?utf-8?B?czV4V0VnQmk3Ym5yZStzRExoSHpLcWVjZnFiN3dNSzlIZU1wSm43bDJESFhD?=
 =?utf-8?B?MW9vZkZncE9qU2ZKMVduS3NKT1VPUXJOQ0MzcmxUVHdDNUNmaW9YRWc4VjhQ?=
 =?utf-8?B?Zy9XOUVjMXEyMGc2cmRDcGhISHZ2bmNFUDZ5NzZEMGl0WnpLR1FaUjh0Vlp0?=
 =?utf-8?B?aHpiaWJ2WGIwdVFMUFF2Y3VwZko1ZnF6REFZaDVnQ1NTZTZPRjV5YXNqbFhR?=
 =?utf-8?B?UmIrNVNJTHE5K0ZxT0pmZVA2QTdLNnpZbUp2b0JUbFVHa3ZJejBORTJYdWli?=
 =?utf-8?B?WnFReUIxZyt0ajZsWXVlRkYrdGVha2k4OGlXZ2ZzQnFQT0lLREJnR2dKckI3?=
 =?utf-8?B?L2w1VmdRYXhOOUhkQVV6V21XOUMwajFWbUc5WW9haXpKalErSU1TQ2lPSkZl?=
 =?utf-8?B?cWFrTEY5aGl2TGtaaS9ZM09XNXRGaWFWcmVQRmZQem1nTkpaNzlidkZYTFZl?=
 =?utf-8?B?azc2OUNSV1QwQlhUNkpjZEhReUluZC9BUmZzU3ZHc3FRSGhIdnFDRVc4MWJx?=
 =?utf-8?B?cVFTWTdHdVNiWDdULzMreHJqdzZMbk9jUEcvYlpvTkxKb3FmVC9NOE8wT1RB?=
 =?utf-8?B?U21NR3l4LzRNRmNIMlNROE5GbkxMY0FyRGtMSlEwSExHTjZRNHpyTHY2bGlK?=
 =?utf-8?B?M1QybS9pdFlJN1RLVjM4cUJtWGZZcm1EeEI3WS85NGVuRWVuM2Y3T3J1MjN5?=
 =?utf-8?B?Ynk3ZWZPT0xQam0vb1lnWk9IaGdCYnJ2YUR4QWxWSWNCTFBycnhRMlplaFVU?=
 =?utf-8?B?dmFOQWlBam9CK3lVMjNFTURoelZhWlgzbTlURFQ0RCthRE9VeTAwTnQ1WG1o?=
 =?utf-8?B?RkI1RGxiYy8vWndFRFNwWHl6aDAvZ2xqMjNiMWZKTkVKVEUzN3lpRWlWcTQ4?=
 =?utf-8?Q?tc063NBgVXdRZZZIWIG23GG3W?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA8EB50BA3D97E4BA3A3F6DC2BF0567B@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cc8075-4eac-4c62-188a-08de18028eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 22:20:39.7482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +GkdUQajecg5dVxWf/lo/ewYYHRXphVho/3c6pPaswZjNMTK7MqOsePvm9EYijCmktj1Z4pS9xOXK3guE5TrrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEzOjA5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBSZXR1cm4gLUVJTyB3aGVuIGEgS1ZNX0JVR19PTigpIGlzIHRyaXBwZWQsIGFzIEtW
TSdzIEFCSSBpcyB0byByZXR1cm4gLUVJTw0KPiB3aGVuIGEgVk0gaGFzIGJlZW4ga2lsbGVkIGR1
ZSB0byBhIEtWTSBidWcsIG5vdCAtRUlOVkFMLiAgTm90ZSwgbWFueSAoYWxsPykNCj4gb2YgdGhl
IGFmZmVjdGVkIHBhdGhzIG5ldmVyIHByb3BhZ2F0ZSB0aGUgZXJyb3IgY29kZSB0byB1c2Vyc3Bh
Y2UsIGkuZS4NCj4gdGhpcyBpcyBhYm91dCBpbnRlcm5hbCBjb25zaXN0ZW5jeSBtb3JlIHRoYW4g
YW55dGhpbmcgZWxzZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBSaWNrIEVkZ2Vjb21iZSA8cmljay5w
LmVkZ2Vjb21iZUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlu
eUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBCaW5iaW4gV3UgPGJpbmJpbi53dUBsaW51eC5p
bnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bn
b29nbGUuY29tPg0KPiANCg0KUmV2aWV3ZWQtYnk6IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVs
LmNvbT4NCg==

