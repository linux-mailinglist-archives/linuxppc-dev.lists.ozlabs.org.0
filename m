Return-Path: <linuxppc-dev+bounces-13412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88067C12760
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 02:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwXC83DR4z3dVb;
	Tue, 28 Oct 2025 12:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.16 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761613316;
	cv=pass; b=KV7KLwiS0JAG/Vxe1g/isZtF7lb+xXViq0jG2hpyjtngsq6fUSpI81RDwVs/ADJ1J3NDloqziDNM78HQETuCI6nRHZETTkZWenraXDSXyKdzH24+Q1kRC48IZWBqwg5pT0qS6sCpiDXrTa0sjgcbohQfEWiT3xVJr+bv3JiyJayUSvFagh+D6s2TYxXK8nVFCZBoDuV0nAaPST8mVCx4NWR+CQlD8qLtnsOcBwcLVpe/r3iDUeBok6r3rHyMOXuB97+k0y0GCoobgr3uerG+NmMaPhRIXkqYfvMuySOcVXBlUL47SitrNWeAlnVLkuSXqwmbo6FZ0XlcUoHWLqN5fg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761613316; c=relaxed/relaxed;
	bh=Zx2nYBf6zaUXhclkIL/fGX2kpx1nvKhjnUCA/bUWi/A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lEeSo5cNSEHxLahrqyeD8Y86rPHVvOqMNfENnBiuUx9UO4Y7qOsm3gbqhvnscsRIMn6U7v4aykocb/OIZk/hRz2wXg+9bVESEhoxGaKU8WkUEzww5os49mil437Ii7xvtUqnt6sWDty+rrk8mdLGN3jxFh6ajivlT9pc5SNgmSu94mIF4zW7bAG5HsSmK2qbqrF2hvlhoq/fb/3/D8nF8R2Pk/nIJsGjmsZLMPmhnd7xJ7OtQs7KrNqNpws5CE6jL0tk3kowcsqLUiCQUuXIC6a5cWeN6pFai9OMuzqmSBfv7ASTw11/kgkaq8koO7cyskfXnMOfi4ald5p+tY8DSw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZmeibiXg; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZmeibiXg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwXC70NFSz3btw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 12:01:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761613315; x=1793149315;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zx2nYBf6zaUXhclkIL/fGX2kpx1nvKhjnUCA/bUWi/A=;
  b=ZmeibiXgmfvS4TKuQ1bsMsfLIaBPLME0R8B8RI2LWUMwVh3QK0fseX25
   exysjZzKRS1O912cA/neIjlgHGlL5AGn26UfuLxU32ONj31281EZtamGB
   QO0TaxwRImPoJ9kJzGYqV+6QA65RkpFCZAsda6dPHW31DkoskB/ZrwbDj
   Y7FTsd/3OQYmDZyGV76YbGhOev5SBSr8tG28AFM6vhQ2dlSh2WLktD/QK
   lnrUKBwiMyx6GwzG66svEqJC/9s6tLkytdrGc1hxfgftM8+jAtvPY0efx
   H6oAjag+Nyv/n627gWsO15fYQfwyPBTvUYaYHxaD007sE7tljpfg44M4f
   A==;
X-CSE-ConnectionGUID: fJknnK6cREWa4m0zgh6muA==
X-CSE-MsgGUID: Dp8z/CnTRqSmm6s4Yxi6ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63855494"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="63855494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:01:52 -0700
X-CSE-ConnectionGUID: gLRr3qwQRUax3gRvtyRvsA==
X-CSE-MsgGUID: KXGKmuG6RkOt5JjbO23CcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="190400559"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:01:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:01:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 18:01:51 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnU8N8/L2qydOSDCZH+iu6SBBk2ROxXWNYsF52jxKJQaT+4w41c6BbRZKBs9pgTsoIhG3xNXWnTbTDhVXBxjWkvRHJZtktXo4IEh4MdrCdDwI+xd8HQ+7E9agPSDdKYPYiEmj8p7i4ACClzDRXJJTh8b+FJf753qrhxXW1b0hbHBKAdtnVoW3dVsjALwNBSaVi4IErqQTG8RETtgjmZVPbQhcWsuSVxw2KYGH0tXe38STeuqEnAgprvWcN5iM8tNij5G6KOFNKV/9LoAhQqCBdy+laUlrTvUQuUNZBkwTjrSTC8hzytomLkBSk4FTJJdD4wy38a9p8XhCBqWC/PFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx2nYBf6zaUXhclkIL/fGX2kpx1nvKhjnUCA/bUWi/A=;
 b=r1LNqQ94MqXFzQb7TJYQiqYUdgYIKsjsu6ohP0qEWX5FM5beCCXkr5Rnbqwzy5oWbOW7+SenHrJ+81WCYkwdaG1Bw9V2l2+GYXvzspCJ9X9p13t2W6WF6qP4RUYItfQz8c54RjupIvgpUQFYt6AuCjFuFEWFty3a+Y31jFCDPRH9zce5CDOi11t5sKlmKzOBwVJvRzTWqLCatxXAAB/5nJf0iHfXXyBTbJAx5cS+B2V3c3BPCUMfzyGXhi5ZbR0PhfhYF2o1vmGiNHsv5FBtYvv1vJw5U98vHIlNsUbHohodQZY58FDdZziF8TsdrBeRihihOX6KJcRI+/IqrfjY7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 01:01:48 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 01:01:48 +0000
From: "Huang, Kai" <kai.huang@intel.com>
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
	<maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Zhao, Yan Y"
	<yan.y.zhao@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"anup@brainfault.org" <anup@brainfault.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "kas@kernel.org" <kas@kernel.org>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
Thread-Topic: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
Thread-Index: AQHcPv2zs83Y32BYWUWhhrWchNoLBbTWxYgAgAACcYCAAAbngA==
Date: Tue, 28 Oct 2025 01:01:48 +0000
Message-ID: <d9d85c1b47db9a3ef7681ccc2f1d088efe5df30e.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-25-seanjc@google.com>
	 <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
	 <aQAQLzxyGFooGtNV@google.com>
In-Reply-To: <aQAQLzxyGFooGtNV@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA2PR11MB5209:EE_
x-ms-office365-filtering-correlation-id: 616cfcc5-a9df-4fae-d302-08de15bd92a8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QlVTdXVkL2EwdHVZMFU5K1kvTVJtYkxWTjBCdlR0WnV1dkIxTDFESlFGWXQx?=
 =?utf-8?B?c3RFM2luUm5NR1V2SEZEamYrUmkyaUd0Qyt4QXZjc3JUdXlZaFN3UXU5NnVO?=
 =?utf-8?B?WlJSQ05rcDltK0s5bHR3MGJybWN6bGRTWFZrWmFIWjNyZmY0ZlJlSmxOekhH?=
 =?utf-8?B?ak11VTlWVUwzK200NU0wa1AweUtjcjJGMGVKVkFLUDFPZWQzNkJIK05IbkRo?=
 =?utf-8?B?QWJzQ3dNWEFPRTcrOExFYWI0QXVhdFJIQitvVUFqaXd6V0M0WkZMSEtUU1BS?=
 =?utf-8?B?SngzOEhGc3ZkZndmbVNzbUxvTy8yVzdDb0pNYlJ2UFVSSlZUN1Q1V0phSy8x?=
 =?utf-8?B?dExTZEhCTWpkRGNoRFU0R3F3UEhUOFU3OFNGMEtOZ3JTQXQvUWtEby9lTDVV?=
 =?utf-8?B?elpuNktuK3FuRmE5ZThrdEdaaXZPYjhjNzlYYytMRzdGNXg2VWVxbE1vWUFk?=
 =?utf-8?B?QjZIQzRyMmtBN0pnQkpOdnRIUHZNL1J4SFp2ZVo3K29ESEZ3OU9yTTdyWUpq?=
 =?utf-8?B?bmwwdXphaWw3bW5oR0lLbWlOaG1uK3Q0WEg2elZldXo5OHIwc0RvM0ovVDBO?=
 =?utf-8?B?WjhTd01IRTdQM2t1bTQ3S0lBbW1NeHBUMENXUklkN3l3ZGhNMExrb0ZQVEky?=
 =?utf-8?B?MUdocDI0Zlk2ZE5vamZlY0xhY1F2ck55Wm81T3lyU3RMakplcmRxWUs5NmRM?=
 =?utf-8?B?SEtqenNXVjRWWkhSS0ZTN2JTL1lqOXNDZjRCOWZoOUhYL09Icm5VRzEyRm5U?=
 =?utf-8?B?bXNHOTZLWEtaQ0hMUXJ3b3JiaDB2M1FoNi94UlhENCs4dWk3SnpWZFpZRlgy?=
 =?utf-8?B?dmpwbUJ2UC9VRnpRODkxM3pSYzlyVWp1dEpBT0xraXRGVXBBYyttbEJ3Q041?=
 =?utf-8?B?SHhHNlRtdHR4azFhRWJucm1zQ1FoOEdJMUpLN3o3QTlENVRnQ2Evc2lQVWFV?=
 =?utf-8?B?ZGpvUWEzRjdyVG0rOXU0QzR4TzFmYzJkZ2xqYTBsNG1JR0NqN2hJN3BBOXJW?=
 =?utf-8?B?OUdCdDhscWN1S0prMkw5RmFoSTMrNFR4ZDh2NHZ2ZVFQQ3dXajBScTVrTDhk?=
 =?utf-8?B?UDQyMGJ5S2hQdjdDMEpBRXl3OW5QeXdMSnYyZm5yaXg4YzAvZGVJWVFEREEz?=
 =?utf-8?B?c1VqVnQzMkk1YnJkaUl0WmgxVXR6WVMyaGVFS0dnWFZOWkIwR3djZzJIVHBo?=
 =?utf-8?B?R3NHT0RzdXFkTmk4MzRJZWxOTjdUZ09qWC9aK3YxbXFONFoxTE5uRzRhaCtn?=
 =?utf-8?B?MkovYzRWTk1IbkE3MDVkVWNydTdKVHpRbUhQRW1lVEFXSnhKcEZDT0FoVVhT?=
 =?utf-8?B?bGNPZWt2TGdUcGRNR0IwakZNYlJlVWxkQ0o0ZkIvLzRYYStja05iTUtpRkdn?=
 =?utf-8?B?WnJUUG5nVmVrdkphWThWSmFZcUhaWkc0L05Qa2dtNU9uZlZsR0FRaEZrNTVt?=
 =?utf-8?B?MUEySlRKMHVFVy8waGZEZjlTVEN6OHNXQzR3aTE4Sjhic0xXa1ZnTlEwRWhw?=
 =?utf-8?B?VGJIQkc4TE54R3NMeG1RbjFHT09uWi9tRkJkcFA5aG12Y1NmdjZISGJ0ZXgr?=
 =?utf-8?B?ZEN1VG5DUG5qdG1yRDdma29tNnRFTEFWR1ppUXlyRTdFdG0wL0U1VnRNeFps?=
 =?utf-8?B?TkNTbkpCZWpOalMvdjlaMm41QW9FaUhIakFRa0h3NGNMSmhQN2l4QmpkWnlB?=
 =?utf-8?B?Q0M5ZVFvVEZ1YVV0Wi8xUE9UT2JoN3dUYitsK1UwZFgzSUFUWnoxNlJjYnls?=
 =?utf-8?B?d0pLMGRFenhxOUx2QllIVXc5Vit1dG5KYlQybXBVcThYZDBXZkpucmQxS0JE?=
 =?utf-8?B?TTFJTHBlcDZCRTNyQkhDUTRvVi9CSXd3RDlrSjBWUVJJN1kzZXE4eERmVGk1?=
 =?utf-8?B?NzZmVENWSThvallXcVhBcjViY3duVDZoaHJzZ2xvdkF3czcwYlpSTjRSSzI1?=
 =?utf-8?B?SU5TRG1rQXptNFNab0ZGUDZtY0NLNjgxU0JGUmh4NUtsZ3NVZHk3Ynh4UzBi?=
 =?utf-8?B?ZVF4UzUyRHpYaElVaEFRUkdENTdHRXc4dFV0V2dnMjFBaERCdnM2L0FpKzZt?=
 =?utf-8?Q?dxiwmN?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW9tdUJDZ1M5RlA2bStwNEk5UnZwOUwvUkV3cTBIaThhM2U5WmtveUdQWlhB?=
 =?utf-8?B?Nk1XSmZUVWtYUThvTnRvOS9hby8weVkxdjJPRVZNbTljdCszL0ZRLy9nZzhF?=
 =?utf-8?B?cG5TZzVSUEhETG84MDk1Z3FLM3Rza0xEa0xhbzdhd3F4WUJoVTJZcFBlb3RZ?=
 =?utf-8?B?aWFWaEZFREt1dS9JcXU1Y096SHJUTDI2eXZGaHBHd1U2QWxqNzJ5cDJUZjNP?=
 =?utf-8?B?akVxd21DNXJ5ejdOZWJ0VmdXWDBxR2VaMTNIZTJiQkVrSHRVTGFnMTNtaGwz?=
 =?utf-8?B?MG1XKzlDbi9EQTFWZnJkNHFYc3VtNnFqUU8yNzVtMmoxeHUzbkRjWkFJSjNn?=
 =?utf-8?B?b1d3Y1ovVzhJZklsV0VYOWFmV2FRbENlZmFEMCtzclkwVGNnTDNXcnR2UXFB?=
 =?utf-8?B?VThZbUc3VUJIRWo1Vm1TR3NudnNjUng1ZjdFZjZrSFh0UzJ2N2pEclVld0hG?=
 =?utf-8?B?a0ZZUDc0M1QyZHFYa08zMlp2am1kK0laV3hZU0JNb1FxSWJHTFI1TW1mOVpi?=
 =?utf-8?B?dG1XdTNpVzJPSWE4aGFCMmE3eFJTb1c1V2JGNEIyZ215eWtoQmd2SVFqNjB6?=
 =?utf-8?B?dGlNR014L3FBbTZUZklYQTE0Y00zWU9xTjVuTkFOc1BCMVlhS2d2aDRzekc5?=
 =?utf-8?B?NnNLM2EzdEhyZGx1WFFzS1ZOekJDeE0xdmp6TlpaaTlVeUF4N1Z6L0ZybWha?=
 =?utf-8?B?T2MzVnVMTEpQRW53cEVWMXhIdnA2TVBnOExFSTNCYjVUVnhxOEMvcGZNakRK?=
 =?utf-8?B?ZXZZU3ZaTlloMys0M21SVFlOVWZBZllGWFlqeDNJN2NYSDJLc2kvenlERGt0?=
 =?utf-8?B?T1dDaFdUcC9vbEhHeWN5QUxMNnQxbUlrNkdIdkFzWDI3eHY4UURaampvWnlU?=
 =?utf-8?B?SDNaYXRKT0VkUmtobVpRcHFMUTV3blV2bmFHKzB2aFZNdjFhTkRUY0ZWSEd4?=
 =?utf-8?B?QzRWTGwrVHo1SlJ4WXBLRFVjTFZJYzdDQzhQQzRzSW1ZZDljTlQ5cHpsemtL?=
 =?utf-8?B?dXZxS29XdEg5RHoxWmNxUTdvcUU5TU9Va0c3bmJGSUhIZUZDR0c1ZWVmUXF1?=
 =?utf-8?B?dXQ0bndXYXRWdFV4b3hmL0FRWXpGYkQzajRneDVpWnY1WlcrdDVhcHRYQ0R2?=
 =?utf-8?B?emt4R21JMkNHNTFOajZacThBaFRmNXRVRkZvWW0vSStFSmxhM3NIYktFWjBs?=
 =?utf-8?B?OFlnbU5GY0Y5RHpvSXlURldoN1FQTnlIZFBBdmszcStiWENpcFJMZk44a1dm?=
 =?utf-8?B?d2k0T1pMKzgwc28vcFRMd2lhN0FnN3BKektGSTVwb01ZYXFnVkJMQmphZWZs?=
 =?utf-8?B?RmQrVUhsZGtYY1pDZjRHcEVMRXhjeWhaWXVYdE4xSEhMWWUvejlHWXhKdE9q?=
 =?utf-8?B?d083ZVM1NVlBYnJVYk9mdExZYmlMNzhtMllHdC85bUhLM1h4Tk9LSGtTSy9V?=
 =?utf-8?B?MFRVMlRkS0d4V3JIWkZRMVdRMVBDajRUQ3pwck1TVHZlcGR0WExSZ3BZNGFP?=
 =?utf-8?B?U0E3REE5TFg2dDg4bWo4TWVjM2tOcDhFUjNydWc0K0lzSXR4YVdBRng3NHlq?=
 =?utf-8?B?U3BEaDRnUGdXWE54anczeE0wNit2ZGg0NHZGeEQ5eXBwR2ltUlF0WXBEWW5V?=
 =?utf-8?B?dUJtMThNSGlWeVFLTGI2VHJNdUVqVmwrWFF3MUc0dXhEQ2Q4UGJCNTgzNk1Z?=
 =?utf-8?B?K1BOci9OOWpiVnc0TkRJY09na0todUZYaXBSZnE1Z2hEU3pLRS9FcGc4WFdJ?=
 =?utf-8?B?VXpvdHJHOHdjdGpMOGQvNU4zWlQ1ZldvSm5nTEdxdWhkVDVhN0tTM1FHYnh5?=
 =?utf-8?B?NzJScmJ4QS9ER2lYY0VnMmtiRHIvcjNPbk9KTzBJUHg4WkdKUzFJRWVEZVY5?=
 =?utf-8?B?WFJ1OXlZZUhsRkx0TkJQcm5EZFZaYklleWhTR3RJa3M4Rm9FNWVmMDJxT1cx?=
 =?utf-8?B?eHZsVVExK2pBQTVmOXllUW9vYzRpUldhbGJ1ZHpwZjJQTXljbjdMSzhwQTJp?=
 =?utf-8?B?U0lIN0RsVnhuUGJnUE0zeithTGdFdVZzckdoYWltWEtvd2RLSTdoVnNOY3hB?=
 =?utf-8?B?Ri9uQVFlUmJrMStRVUQxOVpYN1BRME8rV2c1WlhIL0dLNFIwaXJySFNFNk1l?=
 =?utf-8?Q?2OGQYG8ExstGA3erUPBrSreFj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21231AF9A42D584F85D363DC03F73CAD@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 616cfcc5-a9df-4fae-d302-08de15bd92a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 01:01:48.6088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0vQGgVSI06tf18lbu9FzWK3yhCzlG1J1E2oLo5/Zq6lsqq2cPqY/g/ADV/YIGBvP52rprTERVuM8j9KYXW5rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gTW9uLCAyMDI1LTEwLTI3IGF0IDE3OjM3IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBPbiBUdWUsIE9jdCAyOCwgMjAyNSwgS2FpIEh1YW5nIHdyb3RlOg0KPiA+IE9uIFRo
dSwgMjAyNS0xMC0xNiBhdCAxNzozMiAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToN
Cj4gPiA+IEBAIC0yNzgxLDggKzI4MjcsNiBAQCBpbnQgdGR4X3ZtX2lvY3RsKHN0cnVjdCBrdm0g
Kmt2bSwgdm9pZCBfX3VzZXIgKmFyZ3ApDQo+ID4gPiDCoAlpZiAocikNCj4gPiA+IMKgCQlyZXR1
cm4gcjsNCj4gPiA+IMKgDQo+ID4gPiAtCWd1YXJkKG11dGV4KSgma3ZtLT5sb2NrKTsNCj4gPiA+
IC0NCj4gPiA+IMKgCXN3aXRjaCAodGR4X2NtZC5pZCkgew0KPiA+ID4gwqAJY2FzZSBLVk1fVERY
X0NBUEFCSUxJVElFUzoNCj4gPiA+IMKgCQlyID0gdGR4X2dldF9jYXBhYmlsaXRpZXMoJnRkeF9j
bWQpOw0KPiA+IA0KPiA+IElJUkMsIHRoaXMgcGF0Y2ggcmVtb3ZlcyBncmFiYmluZyB0aGUga3Zt
LT5sb2NrIGluIHRkeF92bV9pb2N0bCgpIGJ1dCBvbmx5DQo+ID4gYWRkcyB0aGUgImJpZyBoYW1t
ZXIiIHRvIHRkeF90ZF9pbml0KCkgYW5kIHRkeF90ZF9maW5hbGl6ZSgpLCBzbyB0aGUNCj4gPiB0
ZHhfZ2V0X2NhcGFiaWxpdGllcygpIGxvc3QgaG9sZGluZyB0aGUga3ZtLT5sb2NrLg0KPiANCj4g
T29oLCB5ZWFoLCBuaWNlIGNhdGNoLCB0aGF0IGlzIGluZGVlZCBzaWxseSBhbmQgdW5uZWNlc3Nh
cnkgY2h1cm4uDQo+IA0KPiA+IEFzIHJlcGxpZWQgZWFybGllciwgSSB0aGluayB3ZSBjYW4ganVz
dCBob2xkIHRoZSAiYmlnIGhhbW1lciIgaW4NCj4gPiB0ZHhfdm1faW9jdGwoKT8NCj4gDQo+IEFj
dHVhbGx5LCBJIHRoaW5rIHdlIGNhbiBoYXZlIG91ciBjYWtlIGFuZCBlYXQgaXQgdG9vLiAgV2l0
aCB0aGlzIHNsb3R0ZWQgaW4gYXMNCj4gYSBwcmVwIHBhdGNoLCB0aGUgYmlnIGhhbW1lciBjYW4g
bGFuZCBkaXJlY3RseSBpbiB0ZHhfdm1faW9jdGwoKSwgd2l0aG91dCBhbnkNCj4gY2hhbmdlIGlu
IGZ1bmN0aW9uYWxpdHkgZm9yIEtWTV9URFhfQ0FQQUJJTElUSUVTLg0KPiANCj4gLS0NCj4gRnJv
bTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+DQo+IERhdGU6IE1vbiwg
MjcgT2N0IDIwMjUgMTc6MzI6MzQgLTA3MDANCj4gU3ViamVjdDogW1BBVENIXSBLVk06IFREWDog
RG9uJ3QgY29weSAiY21kIiBiYWNrIHRvIHVzZXJzcGFjZSBmb3INCj4gIEtWTV9URFhfQ0FQQUJJ
TElUSUVTDQo+IA0KPiBEb24ndCBjb3B5IHRoZSBrdm1fdGR4X2NtZCBzdHJ1Y3R1cmUgYmFjayB0
byB1c2Vyc3BhY2Ugd2hlbiBoYW5kbGluZw0KPiBLVk1fVERYX0NBUEFCSUxJVElFUywgYXMgdGR4
X2dldF9jYXBhYmlsaXRpZXMoKSBkb2Vzbid0IG1vZGlmeSBod19lcnJvciBvcg0KPiBhbnkgb3Ro
ZXIgZmllbGRzLg0KPiANCj4gT3Bwb3J0dW5pc3RpY2FsbHkgaG9pc3QgdGhlIGNhbGwgdG8gdGR4
X2dldF9jYXBhYmlsaXRpZXMoKSBvdXRzaWRlIG9mIHRoZQ0KPiBrdm0tPmxvY2sgY3JpdGljYWwg
c2VjdGlvbiwgYXMgZ2V0dGluZyB0aGUgY2FwYWJpbGl0aWVzIGRvZXNuJ3QgdG91Y2ggdGhlDQo+
IFZNIGluIGFueSB3YXksIGUuZy4gZG9lc24ndCBldmVuIHRha2UgQGt2bS4NCj4gDQo+IFN1Z2dl
c3RlZC1ieTogS2FpIEh1YW5nIDxrYWkuaHVhbmdAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICBhcmNo
L3g4Ni9rdm0vdm14L3RkeC5jIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3Zt
L3ZteC90ZHguYyBiL2FyY2gveDg2L2t2bS92bXgvdGR4LmMNCj4gaW5kZXggMTY0MmRhOWMxZmE5
Li40M2MwYzNmNmE4YzAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2t2bS92bXgvdGR4LmMNCj4g
KysrIGIvYXJjaC94ODYva3ZtL3ZteC90ZHguYw0KPiBAQCAtMjgwNywxMiArMjgwNywxMiBAQCBp
bnQgdGR4X3ZtX2lvY3RsKHN0cnVjdCBrdm0gKmt2bSwgdm9pZCBfX3VzZXIgKmFyZ3ApDQo+ICAJ
aWYgKHIpDQo+ICAJCXJldHVybiByOw0KPiAgDQo+ICsJaWYgKHRkeF9jbWQuaWQgPT0gS1ZNX1RE
WF9DQVBBQklMSVRJRVMpDQo+ICsJCXJldHVybiB0ZHhfZ2V0X2NhcGFiaWxpdGllcygmdGR4X2Nt
ZCk7DQo+ICsNCg0KT0sgZmluZSB0byBtZS4gOi0pDQoNCk1heWJlIGFkZCBhIGNvbW1lbnQgc2F5
aW5nIHRkeF9nZXRfY2FwYWJpbGl0aWVzKCkgZG9lc24ndCBjb3B5IGFueSBkYXRhIA0KYmFjayB0
byBrdm1fdGR4X2NtZCBzdHJ1Y3R1cmUsIGFuZCBkb2Vzbid0IG5lZWQgdG8gdGFrZSBAa3ZtPyAg
VGhpcyBnaXZlcw0KcGVvcGxlIHNvbWUgbm90aWNlIGlmIHRoZXkgd2FudCB0byBjaGFuZ2UgaW4g
dGhlIGZ1dHVyZSAobm90IHN1cmUgd2hldGhlcg0KYW55IGNoYW5nZSB3aWxsIGhhcHBlbiB0aG91
Z2gpLg0KDQo+ICAJZ3VhcmQobXV0ZXgpKCZrdm0tPmxvY2spOw0KPiAgDQo+ICAJc3dpdGNoICh0
ZHhfY21kLmlkKSB7DQo+IC0JY2FzZSBLVk1fVERYX0NBUEFCSUxJVElFUzoNCj4gLQkJciA9IHRk
eF9nZXRfY2FwYWJpbGl0aWVzKCZ0ZHhfY21kKTsNCj4gLQkJYnJlYWs7DQo+ICAJY2FzZSBLVk1f
VERYX0lOSVRfVk06DQo+ICAJCXIgPSB0ZHhfdGRfaW5pdChrdm0sICZ0ZHhfY21kKTsNCj4gIAkJ
YnJlYWs7DQo+IA0KPiBiYXNlLWNvbW1pdDogNjcyNTM3MjMzYjhkYTJjMjlkY2E3MTU0YmYzYTMy
MTFhZjdmNjEyOA0KPiAtLQ0K

