Return-Path: <linuxppc-dev+bounces-13076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF8BF41F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 02:11:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crCQc5hWZz3069;
	Tue, 21 Oct 2025 11:11:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.14 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761005512;
	cv=pass; b=RcBPyeodQU6HlqpClSNO51ISDh+L/vaak60wYE50fK6+Zv4Xs8oIRKlbL62+hMJCb1tlz5po11YuArl6SozpG24s7KzkYyaQeKI+KXEHdwooybxohgNoseOSqP0XyTLfQOYndIU2R9h1aVNWbzFcqhX0a9QplNaI7RdZWYXlAmCAISyk6jACJy3xLMvw3ZcPezcga35c6zolaPiVrJXfv5QgwZk8mjXL0/OOpvLijw5Uxn9r6hytf4b9q9pSrVF7s21rknN6+/5qRGVSjlqq/+A/xWWIfV9U5JVyWAnKtV7H/yBXrcT918NFXAuj8im78y3B9zqomYLbci7mjXzDiw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761005512; c=relaxed/relaxed;
	bh=4/P5PEnHF5J7v59EbqS4q/E1o0MvDUz4rBjWsmCr6K0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cjCcC6FE7NvGFccU5JVGfqr+mdwlHfNKGfhD7Npj2ydb4M4KtHQeyBd/KFk1rfDpE3wyapv8PyRQR2qYwKzJbp20A0dyT63qCQ5Lr26qOwvf68WlwzY+RTZ2M5QEgBKsLLHzS9NKU0k/a+ZdlwngUOs4T1NL3jmSxLdMnt7miN5NSHawC6j94on7u/wQk4b1cMAjB7mMg7qP0GF8wRdCGqB2FwigMxr58nruRdIMTI/JXv+IR/FbkugT1z0k8wAL3YyfDkNsBK727TGmFXhWCR6NM3kjyqTTJ6R1HOfcJ01YsX9HQnuNeDZaomFgwuBmsguIUYmzp06WaO0XBegXiA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iz4QhSvY; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iz4QhSvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 21 Oct 2025 11:11:51 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crCQb4V9tz304x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 11:11:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761005512; x=1792541512;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4/P5PEnHF5J7v59EbqS4q/E1o0MvDUz4rBjWsmCr6K0=;
  b=Iz4QhSvYt/fMeVsKPaVKp/mEUcztmDgsQSc39AtuD08i0PrymRR/k/Qp
   Y5nqKA8KgucwUCny+MtI4pTVYsd2uXiLoebo85bs4MJW0d53333VUudwZ
   0McEtUAk8Z6dQSJt5afqSvkEhI9ERTD7bKyPjiCjmlsPd+4LUvwQt/4v2
   4J/nhCTlkaSNL3A1lzLzYY75GJ1n3eSBsORxJ06gUaDWUJlVGvGJE16vG
   b8O2dnKTUdEQaVQcoskrMig3hqnxke7KK31cg6yyZzEdUyX8Ffme6wJbQ
   s4Pkc/wMD8I9kw2F5y5qvt/v2rGAGYvlYzcOQWAvMAdu1uzxhwsPWaScS
   A==;
X-CSE-ConnectionGUID: pSY238PGSI2pXOwbOrlFIw==
X-CSE-MsgGUID: rSycuhQxRD21CSXmt7L6ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66963386"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66963386"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:10:46 -0700
X-CSE-ConnectionGUID: ylakRwKLS3+Ww5l5Jw0QhQ==
X-CSE-MsgGUID: HPPHgHHlQz2dubk5Pnpikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183864056"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:10:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:10:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:10:44 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2fYWhkgRfb4IkgdwlV8AyEfaZer9oA/FeAlBWuIHpd2K9KvfvvqoldQA6d/MYBTTANdf7HYo5svolbmLCrieSI5RdkRRr5FigMlPBdO1wqF8W+4z/JVHvM2OBrojDgtpngjBjyWpNa9l/ErtHTkJYyPPtaHLPuOTFw5FIIOL1/N/VT4ge/LWnmWo5p51M0vDhXFqTS26ipe8k2ktpbxnYbEajHdw50CaKg9B+nttO1VK0DnobxYtSL54XIr8JTvAM+P6ev/svc5n9yGKNp57eHI5gmAvc3KPovLOvXD7abqzJF5LUtyBokpWfNqS8Z3j8XAlTd9AloTWOPKGDtIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/P5PEnHF5J7v59EbqS4q/E1o0MvDUz4rBjWsmCr6K0=;
 b=C9vf5DYfBZhKh0GtseHGE+uer9fPEIoNUKTDHuGTh2CogspJzdvb2TBRFR4ASOu+iDon0nZ/qyhhz5siCRQa8G9ZqpxvdWI/hq9OhtQk2GFIcdDYMeO24hduGqFxGD97cnNm1LML8/8MDZAL9DRInFk2o2WaHGRDPsGUfMFMm9KVSQblXZAPJLtfEJUUJYCX/3wqyweYHUDoudNSMq4BsBheugyIjZQ+20xRaS5/kbcRjuDEej1g0l8kShj+JkCDvH+AlmIAtN+8zTO6hs2oYX77QhCYnUKw2h/fANBDYo3t4402HMQHJ/qhJWqE9SRSkw6bFG3/92i4pO3hcu7uEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 00:10:34 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:10:34 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
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
	<linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, "Zhao, Yan
 Y" <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Weiny, Ira"
	<ira.weiny@intel.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"Annapurve, Vishal" <vannapurve@google.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 07/25] KVM: TDX: Drop superfluous page pinning in S-EPT
 management
Thread-Topic: [PATCH v3 07/25] KVM: TDX: Drop superfluous page pinning in
 S-EPT management
Thread-Index: AQHcPv2gdZSGwNyid0e7qaWmD/EyMLTLwEIA
Date: Tue, 21 Oct 2025 00:10:34 +0000
Message-ID: <8717e83c9c8fe0b30e1fdc0a3439bf0e1718a142.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-8-seanjc@google.com>
In-Reply-To: <20251017003244.186495-8-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS7PR11MB7950:EE_
x-ms-office365-filtering-correlation-id: 4ef8ffb9-5780-4310-328c-08de1036418e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MFV1NFhzOEVzb2FmRDZieTRnZ3NkMUNzTVNJWDFDMTBxUUcvM2tCaGlBWktF?=
 =?utf-8?B?SVIwU2lVM01TYzZiOXJMV0h2NVhRZHFsWDZjSW1tZjdRTEhRV3ZmRlQ1WURG?=
 =?utf-8?B?UXd0bVpSUGNJN0VWNGJqcTh5dXhobzcrckdvRWo2S2JsMEpGdTExbzBkY1BG?=
 =?utf-8?B?bnFJUkErMVU3emV0TUJnYnNWdFZKRG9XcWNOOEpJZU1CUUxSUVJTaVFQQ0lu?=
 =?utf-8?B?bWUvQTdYZFVmY0huMU8yc2FkVEg2dTdtVDZJM1ZWaThRazFGUGFMOHBFRUhZ?=
 =?utf-8?B?NWZTOC82eXorSUN1cXBGNnRVZ0hLcHlUK2tKbFBhL0c2cDV4RGIwSXlXU1la?=
 =?utf-8?B?M01yVmxEdCtNYnA1VW9BZUdYS2tqdzRnOWhaN2J4SzhkQ3F3VzBnS0xyUk04?=
 =?utf-8?B?YlNqTm5uTnAxSjI5WWRHOHA3RU00QUdzUk9xcjNiY1B1N1VBa2hvWUhIT1JW?=
 =?utf-8?B?ekdaSmxKaWk4UmNleGJQQW5KdjQ2dndDcFd0enA1dUw5bVc1NVh5MjZybTZF?=
 =?utf-8?B?WDg1L3EvTkp2dE42N00rdmM0c2RPQi93ZktZSC9RYkVhNEtRTVBGSGZ2dDJs?=
 =?utf-8?B?c1lzc2FpQ3hmSjI4M0FzZFhNOTlETTdPeUNJd3JPZVNJNml0V0FqV0d1OWU0?=
 =?utf-8?B?dG1GTlFLOElxS0NxalRUVW8veUVUSmFzdEVxYVZDZnRxQ1NUaGFNLzBGMlhy?=
 =?utf-8?B?VXJwRFRLUlR0UklpZGRRQmx5UktkQ21HcUtSL0RvdGpyTmdOMTEwUHBFTThC?=
 =?utf-8?B?czVRaG9pMjBxQmtCd2x0cjhZUmgxZW5GWlE2L2l3WW9oZ0trcXptS0lCbEY1?=
 =?utf-8?B?OXpxNHFlWHpFMS92UUtwR1hJZVpvRVg0OEpIWUtqTUYwZHlFT2VydHQwTVhO?=
 =?utf-8?B?aWFuTC9tbEdLb3ZhRGwxSXUweEFaWHhVd2M1T2dLRzZ3NUJyOFM3eTBuR2lv?=
 =?utf-8?B?MWg2a1o3ektsNUY3aTR2Q2lPT3I0aC9oQTJ5OTlBQUhVS3JsaUZDNC9FRmVq?=
 =?utf-8?B?VWhmekwyVWZxOHphbXZaY0tsbWtpTHczYnU5RzdNaVkraXVnaTBIditETkY4?=
 =?utf-8?B?d0Rudzc0N1dUdXNBazRsZGI0ZXl3cDRZU0h1aWlPRzRKY3kzN1pobjNhQkw3?=
 =?utf-8?B?cDVtS3dyMHBveXhtVEl1WWlMZVY4ZENsL0cyUDNyMnQ2ZkVyTmFhcTRJRytm?=
 =?utf-8?B?SXpVSTZPMjZBT0txOUtQY0lJV3BpSDBZdkc5L0lWRE5CcGl3Z01tUGdjd1Vu?=
 =?utf-8?B?RXk4aUxtUlhnbGcxaXU4RVdUYVlCdFFBdFRwNGZFY3ZDMDRSQ3hqSnpoajEr?=
 =?utf-8?B?S0FDWVhhWGUwUitwVHlJTW03SlV6aWQxVFhTd1B2TWZBNFhSRXBiUEJaNXFD?=
 =?utf-8?B?dVdBWGY4bnUydndtdHRIMGVueEM2WTdwcWpod2gyZFVSZ0EwOHJzS0k5SlNq?=
 =?utf-8?B?RHh4UVhEdWVYUDhubVlBS1FRQlVNTnIyUElJS2dYZ0JFeks1TTQ5YmZPaEpD?=
 =?utf-8?B?QjRFYnBjdGR2ejlveHRiYWNlTmNseTlQZ2ROVWQzN25DK1FId3U0b0RUeGFK?=
 =?utf-8?B?bXo2RkVoK2dwOEw2WFd3dlgvRlpad3ZYYXZZSG0wbkVXb0N2bkxKRHJMWmdP?=
 =?utf-8?B?VlJERFFmSk53MEsvdkh4bVRQYXZyMTkvNUxIc3lmZm1iMVZTQXNibVlIVy9j?=
 =?utf-8?B?VTgrdVlldDNMWW1VZ1VGa2JqTzRtZFRldjN5cjdUdTF3QTI2YWI1WE9Ec3pr?=
 =?utf-8?B?cy8xKzZIZDZDaEdZMGJuRFh2TkhPdWlLaU5vYWVPWit3RjNTSEZQU2lFTVJr?=
 =?utf-8?B?T0tCR0kwaENmSlZZU2dyWjZmdXVLZ29GK1Fkb0xnTEdBcFdMd2hqRVNCT1Ja?=
 =?utf-8?B?SWw0ZWdhMGM4RmlYMkNpeHhFQmZpWGNMVjhNV0VFdGVORFB1S0lqQThWVXBr?=
 =?utf-8?B?WmZtWGF0aFhBNlFubmR4ZjhhR3VGYjR2L0dyRE9WYmZaSWI2UzV5bDJPVE9r?=
 =?utf-8?B?a0dUdU50c0VKdnpGKzlCWGI5Zkp2NXRpUi9NVlNDbzRDK2doSzJiUUduODdG?=
 =?utf-8?B?SmZieTdtakl5YWlONTlLY3dyN0lOMlBTRG9sQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFFNZTN0ajFRMWN4Y2c5Z09jTGlJcjg2MXFmd1BNcHo1ek85K1JkQVFTMnVJ?=
 =?utf-8?B?WnNpUlQ1UW83Y3F6NnljZFhUbXJIL1RmZDlFa3RVMitDMmNYTHVVZVVYeGJn?=
 =?utf-8?B?Z1JmNDA3NWV2N1MzdWJtaGlwNnR4YmxXRDJXbWl6cVFYR1BhOVREQitDRjN1?=
 =?utf-8?B?WjlQTDhjTWNEOWtVMEJ6SEM4S3M1Nkw0MFIra1A0c0ZVTlhpbFRjL0NVRW4y?=
 =?utf-8?B?Y2p1bVl4MzVTeG92eW84djVlVlZjcE44ZGZkMDlKdnNNTjZqdFkwQlRvTGlJ?=
 =?utf-8?B?L1ovQzhLK1dKbDZCQ1huUUczQTU4UlZ2ckFYcjNkWVV0emEyOUZ3M3d4Y2lp?=
 =?utf-8?B?d2d4WWRnaGlPcWRnQlJkQk5kL3RTSXJZQzdlKy8yTWdqNzg0ZFBJaGhIZ1NH?=
 =?utf-8?B?SzhTZDJiU2I5aDB0ajlOeFlXR0k2c0dldnNUci9MU3VCSFVCWlE5NUZjcjJy?=
 =?utf-8?B?TGJnRjhPT2k3RTdKMitabGhscmllTWM0UlpETEh1RXdZa0hJUE9NRVJTLzk0?=
 =?utf-8?B?cDl0T1RQamRlbTk3QjJLOVE1elJ4RGIyZ2dKajBySlpJQTRVeTA2N3FZWm5t?=
 =?utf-8?B?MFhEcVZ4K2diak84YWR6c3VKVDM5RDVxMEZQUndVeGJldThiNUlpV0MzWmZV?=
 =?utf-8?B?QWFoa1RFOXQ2c3J6dVJZTS84TVRlUTNmY1BNSGMzajd5OC9NTysyUkN3RkdR?=
 =?utf-8?B?UUVEMER2eWhqL0h4UnVNZ01GZlNVYy9BVFlQbWIzNXJjRmd3cjZscys1ZmZ5?=
 =?utf-8?B?SW5FR25VWnpDQnh5d1VvTzB6TFp3Wkt2ZjNUTUkxVHpySVpCeFo2S2duS0x5?=
 =?utf-8?B?QWZIdkdxYmx1dGd5TEowM2JuVTRWYUcwZ05ubXlrWWZWeDZvV1MzQzV6WXEr?=
 =?utf-8?B?YlJyZSt5cjFabE0zVDZ6ZzAwMFR6Q2FKRGNxRmdvNXZRY01uNUpuWXNiOUtP?=
 =?utf-8?B?L1p4c1NwOFJXZUc4R29oT2NtNEZmRVhQeWhMR05FN24yU2QxYTJiUnY0ZVZW?=
 =?utf-8?B?L0pCWkZEdENtZ3JLMFBuTDBRWnJmcTdsMno1Tm1EcVJMbGJyaE9aYlVORTZQ?=
 =?utf-8?B?b0dvTlJjcEVSWDFMMXhBTGMwRFUyNGtrN0g2NHNDcjRoNThaUFo1N3c5eTNo?=
 =?utf-8?B?eU5TWjByN2JJT0ZJODhJemxaVnY0RXNycmJZVVROcDhXdHlMOVF1dithTTJK?=
 =?utf-8?B?MVpLc2JqbWtKYzdPNThlU2o4TVAvbkJnUDFzOG1OZ1JxVmF5K2FNYm5UN2pR?=
 =?utf-8?B?OUxPbGllYVFXK2U2NUVYclpsaEg0U1laSGkrYkdyRkhIdXNTNVRMZXo1SE1o?=
 =?utf-8?B?OEFmazZHRFZscjBQQmVDanMxd3ZYbHN3TlBFUzlVc2YwOTdtWVUrWkREQTlV?=
 =?utf-8?B?dENLZWdVaU9WcnhBeVMrSWtZa1JTUGFNSDB0NE9CZWNpUFpUb0JZNi9EN1Z6?=
 =?utf-8?B?R1A4NGtpTnlrbjV4QXo4Z09JSzhYWUw5MHFVY041emNlS0F2WUhJWWRDZnJO?=
 =?utf-8?B?MlF4ZGNVVHIvNkR2cUNxZzd0TzIwRnVURGRMYVhNMG9PWGRFWHJ0VE9RSUQr?=
 =?utf-8?B?TEpmcEs4YnR2cUYxMkIyOXh4OFAwTGlLMnp2dnJ3bEhobFdxb2FIZnREcnNv?=
 =?utf-8?B?Q2pDVTBWZUZYTG1wb0V1TVNhMnhmbndpRTI3STd4Z1QzTWRIZnA5c0gwQ2NB?=
 =?utf-8?B?Tkd2VGVDenNibCtsWTJmTkt6YjhyTTBMZnJxeWY2cWNKV0N0ZzAwN1J0SDlx?=
 =?utf-8?B?c1RxcTNMd3ZBWENEQjU5VmM5WVFsWTUwUWtnK1JUNm1BNnhtaHJTck1WOTdr?=
 =?utf-8?B?LzFQREFvd2tWR1FiZFZBbVRRQ1NnckloYVhSZWx0NytQeDVqL1U2NlJzeW04?=
 =?utf-8?B?dEpnQ2lPdnBqYmt3STNhVE1GTGFzQU1ZbnF0V3NQb0hPV2tkRnQwZEp0TXFH?=
 =?utf-8?B?Z1RhMHJoeldJcVpzbDk5SDhJWVZFZSt5dVhmQW4wNDNFOTdGenl3QU85L0ZW?=
 =?utf-8?B?b3hPeEV3ZkVsWUhxdXFXTTlSb1dRWmtzY2w1ZEhYd2MrWTJHNGFmMU1YNjhx?=
 =?utf-8?B?aFJlWTR3UlZ5cWVteEZFeHRSNEJvYzViNHNYZVo4bW5GZ1Q1WFB6bTE2Rlpr?=
 =?utf-8?B?U3Bob1pHcm9yMCszOGgweFFjUVNCNFNUUXdTc3lweEsyTkt5NTBFd2hYM0J4?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46AD426650BFE841BE74F0A02D5C667F@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef8ffb9-5780-4310-328c-08de1036418e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 00:10:34.6883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MfggLSiAfuTQrHrNIdQ6rnuA/yZg/rMqIUcgzOoYEt+DQ7JDz2FfYYV5K+dw5yrhQwTC9iAwWH6CjlovOdnxfWDWfxinScPuHq2FTGxHsOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBGcm9tOiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+DQo+IA0KPiBEb24n
dCBleHBsaWNpdGx5IHBpbiBwYWdlcyB3aGVuIG1hcHBpbmcgcGFnZXMgaW50byB0aGUgUy1FUFQs
IGd1ZXN0X21lbWZkDQo+IGRvZXNuJ3Qgc3VwcG9ydCBwYWdlIG1pZ3JhdGlvbiBpbiBhbnkgY2Fw
YWNpdHksIGkuZS4gdGhlcmUgYXJlIG5vIG1pZ3JhdGUNCj4gY2FsbGJhY2tzIGJlY2F1c2UgZ3Vl
c3RfbWVtZmQgcGFnZXMgKmNhbid0KiBiZSBtaWdyYXRlZC7CoCBTZWUgdGhlIFdBUk4gaW4NCj4g
a3ZtX2dtZW1fbWlncmF0ZV9mb2xpbygpLg0KPiANCj4gRWxpbWluYXRpbmcgVERYJ3MgZXhwbGlj
aXQgcGlubmluZyB3aWxsIGFsc28gZW5hYmxlIGd1ZXN0X21lbWZkIHRvIHN1cHBvcnQNCj4gaW4t
cGxhY2UgY29udmVyc2lvbiBiZXR3ZWVuIHNoYXJlZCBhbmQgcHJpdmF0ZSBtZW1vcnlbMV1bMl0u
wqAgQmVjYXVzZSBLVk0NCj4gY2Fubm90IGRpc3Rpbmd1aXNoIGJldHdlZW4gc3BlY3VsYXRpdmUv
dHJhbnNpZW50IHJlZmNvdW50cyBhbmQgdGhlDQo+IGludGVudGlvbmFsIHJlZmNvdW50IGZvciBU
RFggb24gcHJpdmF0ZSBwYWdlc1szXSwgZmFpbGluZyB0byByZWxlYXNlDQo+IHByaXZhdGUgcGFn
ZSByZWZjb3VudCBpbiBURFggY291bGQgY2F1c2UgZ3Vlc3RfbWVtZmQgdG8gaW5kZWZpbml0ZWx5
IHdhaXQNCj4gb24gZGVjcmVhc2luZyB0aGUgcmVmY291bnQgZm9yIHRoZSBzcGxpdHRpbmcuDQo+
IA0KPiBVbmRlciBub3JtYWwgY29uZGl0aW9ucywgbm90IGhvbGRpbmcgYW4gZXh0cmEgcGFnZSBy
ZWZjb3VudCBpbiBURFggaXMgc2FmZQ0KPiBiZWNhdXNlIGd1ZXN0X21lbWZkIGVuc3VyZXMgcGFn
ZXMgYXJlIHJldGFpbmVkIHVudGlsIGl0cyBpbnZhbGlkYXRpb24NCj4gbm90aWZpY2F0aW9uIHRv
IEtWTSBNTVUgaXMgY29tcGxldGVkLiBIb3dldmVyLCBpZiB0aGVyZSdyZSBidWdzIGluIEtWTS9U
RFgNCj4gbW9kdWxlLCBub3QgaG9sZGluZyBhbiBleHRyYSByZWZjb3VudCB3aGVuIGEgcGFnZSBp
cyBtYXBwZWQgaW4gUy1FUFQgY291bGQNCj4gcmVzdWx0IGluIGEgcGFnZSBiZWluZyByZWxlYXNl
ZCBmcm9tIGd1ZXN0X21lbWZkIHdoaWxlIHN0aWxsIG1hcHBlZCBpbiB0aGUNCj4gUy1FUFQuwqAg
QnV0LCBkb2luZyB3b3JrIHRvIG1ha2UgYSBmYXRhbCBlcnJvciBzbGlnaHRseSBsZXNzIGZhdGFs
IGlzIGEgbmV0DQo+IG5lZ2F0aXZlIHdoZW4gdGhhdCBleHRyYSB3b3JrIGFkZHMgY29tcGxleGl0
eSBhbmQgY29uZnVzaW9uLg0KPiANCj4gU2V2ZXJhbCBhcHByb2FjaGVzIHdlcmUgY29uc2lkZXJl
ZCB0byBhZGRyZXNzIHRoZSByZWZjb3VudCBpc3N1ZSwgaW5jbHVkaW5nDQo+IMKgIC0gQXR0ZW1w
dGluZyB0byBtb2RpZnkgdGhlIEtWTSB1bm1hcCBvcGVyYXRpb24gdG8gcmV0dXJuIGEgZmFpbHVy
ZSwNCj4gwqDCoMKgIHdoaWNoIHdhcyBkZWVtZWQgdG9vIGNvbXBsZXggYW5kIHBvdGVudGlhbGx5
IGluY29ycmVjdFs0XS4NCj4gwqAtIEluY3JlYXNpbmcgdGhlIGZvbGlvIHJlZmVyZW5jZSBjb3Vu
dCBvbmx5IHVwb24gUy1FUFQgemFwcGluZyBmYWlsdXJlWzVdLg0KPiDCoC0gVXNlIHBhZ2UgZmxh
Z3Mgb3IgcGFnZV9leHQgdG8gaW5kaWNhdGUgYSBwYWdlIGlzIHN0aWxsIHVzZWQgYnkgVERYWzZd
LA0KPiDCoMKgIHdoaWNoIGRvZXMgbm90IHdvcmsgZm9yIEhWTyAoSHVnZVRMQiBWbWVtbWFwIE9w
dGltaXphdGlvbikuDQo+IMKgIC0gU2V0dGluZyBIV1BPSVNPTiBiaXQgb3IgbGV2ZXJhZ2luZyBm
b2xpb19zZXRfaHVnZXRsYl9od3BvaXNvbigpWzddLg0KDQpTb21lIHdoaXRlIHNwYWNlIGlzc3Vl
cyBhYm92ZS4gQnV0IGluIGFueSBjYXNlOg0KDQpSZXZpZXdlZC1ieTogUmljayBFZGdlY29tYmUg
PHJpY2sucC5lZGdlY29tYmVAaW50ZWwuY29tPg0KDQo=

