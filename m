Return-Path: <linuxppc-dev+bounces-13128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0FFBF82F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 21:03:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crhXK4RxCz30V7;
	Wed, 22 Oct 2025 06:03:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.16 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761073409;
	cv=pass; b=YLDDZBqRyv05pRnOcIwOgk/QMhr8Lk168W89BsFZ8iRnpG39qF80QMUOCmhEz2Jjp3EBLY9/u6cuvD+W83zKjtkkUmsXvYVhrjIUfobiQJg5vKDMel0hC33ewGVn0V5I+twD+kyyvxUJeGs2+OU/RaCrA1WkiQaG5hbzVJTrkKMyedvSN4iOFpfNhXJ1vEByliFXmGMm33r5G08rl9S8UHraXEvO4m6Le8hsqGYBvpsLDsEzFXbobj6z6z31nm38zfTLMEhXAMwtA5vupZkwXcMJxJ0BfN2HALkNMjHYncJjLYwmkLjDJ6eu30RQPa6vJfkz5yQqnCoTcBXEjpC/+w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761073409; c=relaxed/relaxed;
	bh=PzV3fAz36CG929Nqa+Vmpwf5O23/sB4991deanYjMnM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b0Z+thz8wLkTtVa06FvoV5TTbN6o1MG3SRfO1v/W/2AFhmBNLZKscI8AgBxA3p2r3aZLb63Qe5JCuhaxzGQtW+X4sbkI5zsRq+B3mZ77UOjes7aXe5GEunTSh9s3sor8nZdC/K7BmISm5FPt98yzO0Q+5/wxmLiR1rpSTnFCgIg9ruP4q8GLaJKcXgO6foEy+aV8DNXL6W6ojWU2iqQctpwm/TQpqfoHzBO0YaE9r34BVV0Lmg9kb+FpGWS47LQ5if6+YJAfEw9IdSS075r4PPr5T1ni6e8NDE7hBCv0KlFGuJme3osnMz7mXwq7FwJN2zLwDBgH4O1HWS6VVW/eEQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J6b04pTV; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J6b04pTV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crhXG6RXVz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 06:03:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761073407; x=1792609407;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PzV3fAz36CG929Nqa+Vmpwf5O23/sB4991deanYjMnM=;
  b=J6b04pTVZyGUSsXKQ9pDbCx0TDyaU00LpDpSwXsrBlIZkxdJ8BOgVjyh
   bMJRxpNciMENurqjFooP3wS3JXnnA08ZhC8z22NebjUTs4ISTW6KGCSQf
   XqkUQuS5kEKI8HUYPm+GfEdoncbMkiCJQOX8eL6AFzFDE+FmXeqK5ekqs
   cCA1DrFg5gIUI3ISXCTcYWS1a6Ig2yM/FpYsGIkNjh51nhfpYFpXXsskw
   OXDpLqe7ZqGKS+wgZ3HPg+R44mOmqpcZFNnIAVkluMUh/LBIyahLaXlgT
   KbSQ52rfGlOC0yU5SqdAgObualOjUEf97boiRKSX3/TXD6dpijyjHbhj3
   g==;
X-CSE-ConnectionGUID: 6NR3uriLQvy5K2gjzhbCPg==
X-CSE-MsgGUID: nic7vCfOQvWLue86mas86Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50785560"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="50785560"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 12:03:21 -0700
X-CSE-ConnectionGUID: Bx9mUSJWTbCQYca+htR7hA==
X-CSE-MsgGUID: SIk4PR6OSqiBKU5Aq9wKAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="182873900"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 12:03:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 12:03:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 12:03:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 12:03:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6WEwUzYRSYo2dVaVG2RCSQL3Fqf/Bp4BNsMJM6F4GzFSQLMHc9MWIHzcTzVJJgu9XvpqMQwgKEH/RLY2tT+tSXsQltdgellrxzOPoKtSvZHop8Zetvdl2lQU1GV+RdksWeM1EJMHFunTM1pxSyjz2kaUCGm1fMLoSjiweDQiLqFYZ8SjZfoHc+J0bSji4OnOU6w6YmCqqq9diJGzCYCXsNY2nF8/ja2mLyp+6f9hxFI3O3RVBM2NANpHOd0Z5K/yAJwZ2vi0K7uAfF8QJb+q94zlwm2sg7ZL0O2ItkGup8syxI7SecDN6MHnrMWBZLeQPUmUMEAxv1tugNsgYJw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzV3fAz36CG929Nqa+Vmpwf5O23/sB4991deanYjMnM=;
 b=oWTgdF1ikcB7hfjIy51tsTVsPvLg3WDEt3x6e5HtZiMo+Wp1LqRiTWgWXNc3M+9etW4uE0BYHQj5P9w/2sBnYnbU6KC61V5Rk4aGaSj6gHt/ShEN6ygX0Rp7FnKCHFSoqDvWLT91koTIwMH5/stK6ablYLvi22tbR6n9Tk6rsasY1jt3gq3tMc/EuA8Hkf7ZMBdnreKlNFMrIBa7oihd5b0GpZYM+/jlxLE40q5oDBNS7lb7QrAkedlUIV1EVP/3vziBHw4A81kgc8ApMU4pjJCfhlyKqJnTMpYAF525fBz5LPGa9ATtd6NB/sH7P3vIs2ycAbM/bR6J9LtKPbmJFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 19:03:18 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 19:03:18 +0000
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
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "x86@kernel.org"
	<x86@kernel.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>,
	"maz@kernel.org" <maz@kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, "Huang,
 Kai" <kai.huang@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"pjw@kernel.org" <pjw@kernel.org>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kas@kernel.org"
	<kas@kernel.org>
Subject: Re: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in
 tdx_vm_ioctl()
Thread-Topic: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in
 tdx_vm_ioctl()
Thread-Index: AQHcPv2wOE43VneGUkej4wzVYW2G37TLwBqAgAEZKICAACN6gA==
Date: Tue, 21 Oct 2025 19:03:18 +0000
Message-ID: <3270d9d05f4be252a11d5722267135201a976759.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-24-seanjc@google.com>
	 <d0b369c65e33518d57a40a70c0d13f70bd64db47.camel@intel.com>
	 <aPe7M1aUPwqDmQbY@google.com>
In-Reply-To: <aPe7M1aUPwqDmQbY@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SJ0PR11MB4816:EE_
x-ms-office365-filtering-correlation-id: f0ae1d0a-aa2f-4151-a9d9-08de10d47eec
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZFlkQ1d5UGxkTU4wNFdzMy9qcmpxMHZ3K3ZmOWpmSHNoOE5NTlBBdXZwMC9w?=
 =?utf-8?B?QWUwUmI0Q2NpWUg1ZVM1dmFpQW82VTdrdnZicVJodHFXMnk4emcyUGY3UlE4?=
 =?utf-8?B?ZkhWVng0ajFRZVpBUng0L2tKUTRKbGRXY3FBUE81Vy9XMGRoYVRhNW1hTi8y?=
 =?utf-8?B?MVI3QWRxZEhUYnEwWXNDS1F0SURuNjdYSFkxeGNhNU9Bbkk5Q01LRFg1RTY0?=
 =?utf-8?B?dGZtYUxEOHNNajh3VWFScnF5eXhZVTZRU2t6TU1xTHkzVHU4MndWc0pwZW5E?=
 =?utf-8?B?MTRrWWJuQlZzbnB1ZTdKcjl1aUJLK0xJVFcxNFVrVUVqcit6UUJkWlliVi9v?=
 =?utf-8?B?QTE5ZHdwdHh3SzNVc015OWRHdHFnaGhIRTFVbjczTWxweFM2dEJ4NmUxU01m?=
 =?utf-8?B?RVZyWUpnYkordUpzY1ZwdDFmSER6Yk1UZmtxMktUbmF5R2NpMUlIeDY2ZVZN?=
 =?utf-8?B?YVNNY0lxMkFKdS9peWFsdUVoeGx5Lzd1V3BlNVZERmoyNHZSd215VnVsTk1q?=
 =?utf-8?B?R2xSRW5MZ25SOU9MbTc2MFMwYjNjeEJQbTlmQkp5ZVJMZklVV0FpV29HemYv?=
 =?utf-8?B?VlJNdklWOFhpRm9XaHlHUmIvalc5RHNxQnNVL200VzZVa2dWN29UbmxXaU1R?=
 =?utf-8?B?RHJWc3d6eHVDNEpvbVJvczJ1dzZKU21ldDFJbWp0bXVxdVBpUzRyUTN5VFhM?=
 =?utf-8?B?QTRNaGU2dXVLUVNDQ3o5c3ZuNTZwTVorUDZlbGNxT2RtOVBOdm1OTnZuMFJo?=
 =?utf-8?B?UHEyWVMzbUhtQWxUS3hsRlpJOHd5dXorMFZURGNyNmtkbC8zU2Y2Y05PYTRy?=
 =?utf-8?B?U2U2K1AwNFRMcGtyaXgzUGRqakZ3cU5yN0x1YklRZWFEMjZqWWtCc2VVZmZQ?=
 =?utf-8?B?Y0hrVmFUTXZxRFMyUzArRE00OXc1ai9MeUszTmUzcnpLdjJsUEtZWGJCZDhE?=
 =?utf-8?B?a0svblhCNjl6SkV2bW1ENGtlZE8zZ3RYTzhDSHZpOUUwcGxveDRmVnkwQUty?=
 =?utf-8?B?VU9mcC80TmVxdGpwazVNOUlVL1VKbjZkdWlOc3BDb0F3QTEvSjBFbkxyNFRU?=
 =?utf-8?B?U2RjeGlNQzJIMjEvM0FLUG9COUQ1azZEZmtZZEV3UGVQVWFDNXBDb1hDTUlO?=
 =?utf-8?B?YWlRblRQYVNHTSs1dnhvU1M3cTh4dnRvbldEbVhwZGJWelM3aW1FVS93aDZw?=
 =?utf-8?B?d1FabFhPc0tMdjZFNnN3bVNUS1o1eFF1Ym9kc0JxaWxPTUE2YWRCczFGb3Qx?=
 =?utf-8?B?MHlueXVzZjhCenlsNEV4RXd3OTF3bmM0RDlGZWlQamlHdC9KTEN6NTNZSFh6?=
 =?utf-8?B?cyt4dkpaUlZzc0hTYnVXQnhMNXgrMnkyY2pWenNFd3Y3NkcvQ2FYUHVTKzk1?=
 =?utf-8?B?dXFxN0dUdzdmRTM2UEFwN0tuQ3dCQXZrS0duMnZXcGsxV3VDZzBQUkVFM1Na?=
 =?utf-8?B?eHlUNjd2R25DWVZPL3czS0FrRW1USk1qaDZoZkM3Uy9NZ1FWcnJqaWdURUlQ?=
 =?utf-8?B?M1l0U1FsWlVCZUJvamNuM2ZEL2ZPeVJQT1l2dWRmUmhXak80dm92WERFdnRB?=
 =?utf-8?B?bFJnUmNVdXJXeVl3Zm5DOWgwc2U2YnNITWJ6VDJlTndEa2FxTDVYMHdFUGFY?=
 =?utf-8?B?cExJZWlZcXplUTA1SzA5S1ExOVZBbExhOTNxL3BLMGxIMnlkMW1EU2FVSkcx?=
 =?utf-8?B?RUZneHZCOGtOZUVrV2kxeDFycjVienE4SFNWaHhJTXV0RTIrbFBTWEdSN1Ro?=
 =?utf-8?B?YzhiNEdXK01YZ3RmZWczT2cwZEdUZHZFUzJBZEV3TFA2dE4zWXpzcGdKbHQr?=
 =?utf-8?B?c0phTXp4RFphN0FQcXFHc1NOYUx6cGxFbjNZN2Y3d04xazdtbVNudUJ6VE5h?=
 =?utf-8?B?aFg3Um9PT1BoNUhxd0N4WDdmbWVlNmVST1RDZERBNnlBNTR3K1l0bjQ0UjdP?=
 =?utf-8?B?Zm5mVFE5dXpkYVNBdTVpN0x4WUE4SVFiS2p0cCtzOEJ3RkhxSjVPTURiWndP?=
 =?utf-8?B?QWtCdXlWcHNQellKU0NPZURyM1ZPaTlSS2NiMVh2Y1BOY2V1dGV5a1VZQk5l?=
 =?utf-8?Q?JlDvh8?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UG9mOUZBVFVmblZZT1JDakpTNFVuNC8zUnZpcngrNHdoZmp3R2ZiL3ZubHJZ?=
 =?utf-8?B?eHNVdW5vdDdCZmR2TDRUeEFGeUp5OU5EaTg1c05sdzR5aDQzRG1hZEJVVWdB?=
 =?utf-8?B?Z3dvMjlCM1IzWDIvNi9XSzNLdDU5ZnFFMnpHUEZZdGJuZUYrVGhXTWsvZkZp?=
 =?utf-8?B?RmkzSUZwQ3BScFVwajFVRnkvU3hYZHo5b0hNaFQrQ1lJQm4wY0pOTUlUWEFt?=
 =?utf-8?B?OVJmMUdGZ0tiaTd0c0tta1g2SmVKYUFLa2MvbUdNTEkyNXFZQm5SNG04Y0ZD?=
 =?utf-8?B?a1JSRFRrTHREbnpKYUw4cGt2aVdKVDdHbmx6L0szcjFHc0dOQ1ZQQ3RveEI0?=
 =?utf-8?B?a0RkaWRIYk0weGhhNWJhc2wwMVVrVWdOaElXQXJESmJhNkNoS3lIZVlZSHVL?=
 =?utf-8?B?a1ZJMm5XR3dUR08wUmVpYVE5THJMMStSWDNGY3Y2SjR3MitJUi9JNGR0d001?=
 =?utf-8?B?ZzBGWFlnTlVCay9kZG9vTUFHOFBNa1F6UGIxYmR1dkg1U1l4L1RMVDlFRThi?=
 =?utf-8?B?SEZwQ0I4U3NFVDcrZERCUHBVWkFGUEdsUlVFdWZNT21DT0NXTDZQOHBKOHI0?=
 =?utf-8?B?YzhIM084bkFIUFRqOEl4QmtpSXE2Y3JHd0tFSndyNDR4VTB5Q0JBSmRlcXh3?=
 =?utf-8?B?c2hObDBXcWxaZC9XRzhBNndxRjRrWXNnR1VKYm5HUjdzcEVFa016MUhmUUl4?=
 =?utf-8?B?cWlNR21DY3p4TzIyb1k1akFIQ3VVMjdrNTV6d2RJVnFIUGNrUURHMVVJK3ZQ?=
 =?utf-8?B?dW9UUStVcW95UW9DTDlJYSs4anB2MFc4cU15WUozQS9lWEFNcHNHUmpwZGVW?=
 =?utf-8?B?V2Vocjg0N2ljVGtzSy9tSXRLQi9nNE9laGMzU0tTV2VZeFp3TEJXWWpSZ1BS?=
 =?utf-8?B?RDcvS1VsREZHcFFBNHZETDhwMkFQeEVsUW81Qk95Ykk5ZTF4RjZoK3kzWUpS?=
 =?utf-8?B?YStzYVlKY3AwWFJnd2Z4bDBib3p0Q21CYU9OUzBITlg0TWhpRC9QTHIyK2w0?=
 =?utf-8?B?cDE5K2JKNXlTWE5vd0NLUFl1cEFaMTI5a1BFeVhrWVY3VldtY0IvN21veVBn?=
 =?utf-8?B?dVBDRXl1MW9IM1dKM05TWkRjRVc0OFBjWG1PRzI0dmY5RjlMVkVMc3JuMkVP?=
 =?utf-8?B?SkQ4K2k3UTE3Si9FZmZPQ3k2bUdCUzRMRHZUSmx4TitBTWMvTnVlaTg4T0lk?=
 =?utf-8?B?TUtPdDlyUGNGV0JjQ2MzRW8wV1AvWEVnbzA3UmpKbmErcDdSczBIMVZiZVpy?=
 =?utf-8?B?NU9QQ1NYMVJmSkdZb1hlTEs4QU9kR2ZjZzBtMCtFRHVPckp3aEJHZXBPdXVi?=
 =?utf-8?B?cFpLUno3NFA2L3RoQ0c4ekhONmE0TU00cGZ4OFl5dDRQMUYrY1NyOG5NS2E1?=
 =?utf-8?B?YldvZnZCV1FkamFvbmtLMGVwWmxtWGlTVlh4RldoUXNGYy9kdlR3SkpHS3A5?=
 =?utf-8?B?KzFobEd1OHJXb25OYnlOMWZaV3JXSjc4eVJ1aTRSV2JUSEVaRWRQU1BLRy9Z?=
 =?utf-8?B?Q1NDV2FzVzNjSVU1Y3FYZ2lLTkdNVHlITDFvNlArYTc1RytydEl6MDF6ZGpz?=
 =?utf-8?B?NEtla0kxR1RQV0duQmF1d1RNYXZmczAvekNobGgvU0I0UGkwNHJzTE92MjRX?=
 =?utf-8?B?TkdSUTNPck5nTXkvRTFPTmkrZG8zQUlOTGNEWTRRbXRKcGZQRklobTRiajlJ?=
 =?utf-8?B?RnlrWjlmWUNwREZWSUVlVHErV0RXbWkrRjhDSEhBelZSUWRSa256ZlI0QXlF?=
 =?utf-8?B?RWNYMG5OamhuOUpXMnRPRkxmcFpxTFpYK0RlV2pEdDV3RlRkdUVtOFlLNkkr?=
 =?utf-8?B?UXJvanNtemcwNzJ0N0NjRTFadXRzOFlFQmZtUWhQNTFRK1Avamd6eGRUbkU5?=
 =?utf-8?B?Z2JJRExWbENaMzFlTzhpVDN5b2tVSWFXNHEzcEo2c2swVHdHR0NrbUFFTnRX?=
 =?utf-8?B?ZlZuUSsvZlBJL1ltZlIraWx6STVObFllSGxYUytON1RBQkNrS3U3WnNGL2NH?=
 =?utf-8?B?c3IvbUY3T1ZoQTVIY0RyTXRQbEUzRlc5TmtOYjVDK1B4ckxhMWpvZE4yM1Q0?=
 =?utf-8?B?aFBnZ0N6QWt6Si9aL3VtMWphNzZnUFVkcnRIa0FsdnBYTmdCVEtUN2QxNWZj?=
 =?utf-8?B?WElRUU9yMVpONjNrVGF4bTAxQVd0R0FZLytTdXYzVDVtbEJYVTg5bmY3WmxB?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D715145EAA45F34088B6E13FEA55C304@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ae1d0a-aa2f-4151-a9d9-08de10d47eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 19:03:18.1202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fc3iOUYmznZG01ZlzgGzn0ToNRiUn3dYm+aoAa5vrBdo0MEwM8zgJ9JaGLMFHyoL2J4l43+h1NHXxGuYZ3XtbjbUMXS3Z1QyM14eq7SEPmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVHVlLCAyMDI1LTEwLTIxIGF0IDA5OjU2IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBObz/CoCBUaGUgZGVmYXVsdCBjYXNlIGRvZXNuJ3QgY29weSB0aGUgc3RydWN0IGJh
Y2sgZXZlbiBiZWZvcmUgdGhpcyBwYXRjaCwgaXQNCj4gZXhwbGljaXRseSBza2lwcyB0aGUgY29w
eV90b191c2VyKCkuDQoNCkVyciwgcmlnaHQuIHNvcnJ5Lg0K

