Return-Path: <linuxppc-dev+bounces-13622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D4C22C03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 00:59:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyLh41BnCz2yx7;
	Fri, 31 Oct 2025 10:59:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.13 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761868788;
	cv=pass; b=RHb6eXoeacEJDaShA/I31wTTlG9kH2QR8blvieA6DJmEv4n1xwW3QB7cgLcjyv0+C/0uMSdrU/oMf/TU+yMd8jvQkF+XzLEsHjejWbeFnV3sFqihcNQgoxTKecNgwd9r9vXkFdbh9bfDUlFmI7Y7mE1DKYeJT083M5wjGkHnb6GfZcoYz0I33pfDeDcjgIZheep+8bzgTGjThviHf98osqzTd6FRiM3m/9bBcNOxDDaEhW9xGz4twl3aiDSDI3Q0DxdCexonMu6ra4IrC20nq3M1KdR7Y+SzrwnsZ3Shl39QK9MzyNVzfZVOgs3pVGpzp+TKEDQd94sTZtbwHruQZw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761868788; c=relaxed/relaxed;
	bh=7UirJPKLM8xmx0pnB5z73EflNQX1WTvY0sD7DKjUKWE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QDRtfLdPywfNiuxbEqGt4XeDAMYtgMLpqf88VT1PsNhG499BN2tM5rclghzF5BocbXVDRrJ2Xms0zJ7M8vX2jtuOzHtS48y5fzYrcq4keCOBxFV+UJLWdhF9eHoD7CcOVkoGtIPp+QVJEoYV1SLGe3PcX2CSN2pJAn8bwOafuXitL7JCVtG6TADzi1taPlbvRvPTPQhXbJQ8nJA6oNczY3pw7DKDxlT/btsKa19Sm24GsbNntqhWjeYOWeGn4ogznV2NJ0nRbgg10wieX1RNs4VWr33dhrix65jD7PwD0HjTb20E8osJ4h6/Y01CBWcyEWjNz16F27eD9CI+ms/AsQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OFkDrIr1; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OFkDrIr1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyLh10Vl4z2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 10:59:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761868785; x=1793404785;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7UirJPKLM8xmx0pnB5z73EflNQX1WTvY0sD7DKjUKWE=;
  b=OFkDrIr1dTOPslk/xJNutZm9P0OmufzDHqTBkhgkdYlUfWM/f/8a2MON
   f7JJv3mhoeiUXamDcCuce6VmbYlpICO0pZrirRxz0bf8H1dpHt26mki70
   nOkOAyGe6ssgBipq629DYMOq3HgAHutlUxS34z9db3aGd+VqeRCBkyZuT
   wEnVZNA4qg4az7i6wPisSRnHOInpt0SQz/O1xx5NYhswwqKhFwDhJ+9K5
   wL0QDvAPZggMfdpbwGUVA3ABE2juBeK29779+0Ezn2k5/7ogcoYXIRKgB
   +iBJdC0UOAWiKWTdUhryNi2qE10Mvq2xiKffLDC2xKdVUy8MibFhEr4m7
   g==;
X-CSE-ConnectionGUID: pPQC4aOJTjm/9+K9pZfEUQ==
X-CSE-MsgGUID: E8rc6AZeTI+6f/8hWc2zzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75143092"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="75143092"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:59:40 -0700
X-CSE-ConnectionGUID: +Pm+4bokSjm9YwZDQ2z1Rw==
X-CSE-MsgGUID: Y6LZt+P1TZywCT2lKzmw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185301330"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:59:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:59:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:59:38 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKHPlxwmcSo0XZ3vabNLRUguZgUcYNt2gs1v6eA9+6if659WrkTfyOajB6lrP3UNC8h+LQv+FA5uGv06ubQD8/6xmGoVvlnNQ5VB+WeEmbnqXeXUIZDzDsomkxhrR3m1OYI2KMd4CIs2KqTFin+0MDABTjFRErZAXgbAPnBS6kS+JNSwsD5pS6fvRIp1eI8+SfOWxQ5lktSwdMOu4HHwgIcM/k0IHfDhGYCOuBSzHdZMr4Zr1ddIJFspHFb/I+HypWMBHcmleKB4Yrv8DGFzzEjRbbF2249Gc5rpWR3lTvgPQi7zX9ToNz1Z6ROOj5A86i1dvKbykeoPFK8r4ULMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UirJPKLM8xmx0pnB5z73EflNQX1WTvY0sD7DKjUKWE=;
 b=oSqX9ZOHH8lSJjTfA0YupJL7opgk7YjpYzX9L8jIv3ZaFPdblk9zhKi399cncPLAUzssciVenYczdn64/OYpKs5ROKfKyHGOOGzP/Y3dxdhr0NoJx5xwbCYxzhW0EFdZ2ejgE7vXOhMhICOaE4C9V69GuGAncD34Y20J483iB9bJI6l223L1iP5UY/OWSPXVKT6IHlRFoiY401T2lYIq5emPojxdUfb6U196Qw89innUl/pPqo9Jo4fWPZ+tFCzmG8Ux2BGKBHGJfU6B2lVzDXgF7jfBye+8jWrM38vzQhu9jdpwJCe5yddiWHIO13JB/8lfXhwl6GlBYmfq9rKIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 23:59:35 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:59:35 +0000
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
Subject: Re: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
Thread-Topic: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
Thread-Index: AQHcSdlJe5RLgiFVpU6t9BHZboMY5bTbTeAAgAALoACAAAVEgA==
Date: Thu, 30 Oct 2025 23:59:35 +0000
Message-ID: <00f4bddd2e7bf7ab1b1718f97bb14f2c85bbf0f3.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-13-seanjc@google.com>
	 <6572689b28a76bd95bc653b1fc1131fa57ed7669.camel@intel.com>
	 <aQP3eJmLTHscDoI4@google.com>
In-Reply-To: <aQP3eJmLTHscDoI4@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CY8PR11MB6866:EE_
x-ms-office365-filtering-correlation-id: ccf96db3-a8b2-4b09-1b12-08de18106089
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?U1Z0eml6eGxNRnlUcU03c2h2aEFlNy9ad3JHNjY1dEsrM3h2RVVZc3I3bkJu?=
 =?utf-8?B?Z2Vyc3VqdnowUnJyQ2xiQ3ZVb0lxMjlKYUFlOW03ODZWTVJsTkdodWwva1ps?=
 =?utf-8?B?NGVXbk5uMW9xaUJBYjRiemhZRjBKMUdnbm9MUGJidDFMSWcwaU5wVllIK2F2?=
 =?utf-8?B?eHRiWkp6Q1hWZUVUOVI3UlhLTG1RN1hGWkxIa1lqT3ltREZiUDJEU04wY0RP?=
 =?utf-8?B?NVRrMjA4Q0xOOVJ1Wmt5elkzT0lmOGZUY0xsTHEwVnlyMEtwR3JjNEZxQzA5?=
 =?utf-8?B?ZXRyWGFZaUE3TTBaVWhuVzd2T08zRzc4b2txMDhNODVjVjRYczFOcXk3eE8y?=
 =?utf-8?B?YStobklhdUFpa0FZa0p3ZVVRRXBudkE5T3QyRTBlSWJUZTJyRjZ4aXJCOTAz?=
 =?utf-8?B?dmpjMWE0RjlKNWM0dXE2ajVxMlpvcVdacEFyNk1INGMxMEM3MUsrdzJMMW1F?=
 =?utf-8?B?QU1IWnNSN3pMM1VDUGgwZjVtZVBldGthOUwzbmZHaGNRblRsdDQrbW5HaTRa?=
 =?utf-8?B?N2VYcC9aNSthY0U4SEw2WEYzeHo1d0QyaWtDcFBBZ0E3VUVNcFlPY2NEVzVO?=
 =?utf-8?B?eEFpQXJ2YmR3Zm11dnhmS0VjaVlCTjk4YTJQWXdpNUhIZUYvMk5qV3VZandE?=
 =?utf-8?B?dGdHYUJCbEx6UjhmSUJVcjB1bGRkaWxlV1cwMTJTYndCcnY1VHk2MVh0Wk1r?=
 =?utf-8?B?aW9ra2s4LytYTEUxd3c2cy9rYVdMaGFteE1Ob3ZkVEpyNllZTlpGU0lxb3Js?=
 =?utf-8?B?cmEzM1VOZUtYUnIzRzVqWkNlZUY4VjR5OG5lckRPSXpvY0ZHZUV6d3BMU3Bu?=
 =?utf-8?B?cUk1RDdJM1BTa0lxY0R0OC9JRXJjQ3lPaXdySWlUZE85QTgxMURBeXZ4Um5X?=
 =?utf-8?B?ekpCYnlzaUhVWE4vRWEwaGpTVFFaTUZWWFl0MDFmOEFxQ0l5VTNJUXlHL01L?=
 =?utf-8?B?eUI2UHpzUVhGZXlsTnNoUWVHbytraHdBK2NwbVdNTWVkWGFSRzBCQkhTU3RT?=
 =?utf-8?B?RHVVdS9QeG5KWmdNMGlmeEthdFNydE1YelFwc3BLanJKZWJsUnFRYzlRSk1U?=
 =?utf-8?B?RlZiQnltb2VRU3JPdCthY1RIeTZIOXFLOGdWc0daNG11MmZ6S1VuUDl3UWZh?=
 =?utf-8?B?S0kzNTBhY2FlRUVWN01BekpUSFlabUFMS1BGbUJTcVVsUlVkaDlocXdTcDVo?=
 =?utf-8?B?RHNLVUZqRGFIRlU5S2lUT2lUTldJQndsMEF3MXFlZ2k4Sld5aTNzUUhHYWRj?=
 =?utf-8?B?N3M3WEhHUS95V3NBTTNXd2djQjYzQnQwaHF6VUZnUXcyT0ZkQWNJZXFOQ3Jh?=
 =?utf-8?B?ZUZtT3Z5S3Fqdlo4c0tmallsT1grYVN2bjdCczAxa2VLVDhZeVBlNzBwOXVn?=
 =?utf-8?B?bjhsZnl1RmVVNEFDenVVWTc5TlRaWWZpQnB1SEZtOWd1R1VKZFB5MWoxVmh6?=
 =?utf-8?B?RUE1QVZ0ZWY3dEdNQU1zS25lZnNHVG5xR25BRFV5U05GRWRwb1VKRFByMDhQ?=
 =?utf-8?B?WTJSRGhVZFFTbzIxdFJuRS9PN21iZnFBMzNjQWF1ajNIMThyUXFRUFVZcW03?=
 =?utf-8?B?OTRidE1hd2xVQjVDdkxJdTRwZzhGWlpMWDMzNGxSVHRIOHJjRVhGRVBKNnJH?=
 =?utf-8?B?WnQ1ZnB5RjNXZTlFZmVUcGkvNWZsUmYvbTZCam8ybmFybDg1dnJrd3VhY1pw?=
 =?utf-8?B?aThRbjEvVEtjbXlGOFgrYm8yR3V5ZDgzWG5uQWZtcWl3aVFta3NuakpxRXRE?=
 =?utf-8?B?ZWxZczczZ2NVUTJZcnhWd2JDS0lyQnZ3Ym52NWx4eUJZZ3RJVXNqUTQwb0sx?=
 =?utf-8?B?TE5HWXdUQnJORENVQWVPMU9IVDJkNyt0ODBqMXRkclk1bFRIZEorN1pKdDRV?=
 =?utf-8?B?bXM2QXpOWW5tSGdYTUpsOXp1ekJsbHltb0xmM2xOektGWEhXMVZoTUhvdVVM?=
 =?utf-8?B?Vmh0MFFOMGF4L0wvdXJISDlkS3gyN09YMUE2REdxdWdYTm5KYWtJR1czTUZn?=
 =?utf-8?B?Z1FEZDh1SXljTWY3MGRrRy9CYjAxeXVDaklEbVJneFI5V3ZXKzdKS0RuUFM2?=
 =?utf-8?Q?OcDbxX?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGlzWHhjTHBOVEQ4UXNKenA5am5vb1dSaGRlVnVMVThOR3ZEWTU4U3ZPdS8x?=
 =?utf-8?B?c1NpSkJKUXc2Q3BSM1laWTJiREVSVndpZHBtY2Q2NXdEOCtCcklYYkV5SWZH?=
 =?utf-8?B?RVA4ZU94RGZOM2c0RUhyZ2NNbitMaXRHaHBpRUhYd2xsMGgzOXdyQ1haNURy?=
 =?utf-8?B?Y3ZEdTM4RlZkR2tmalhyZWljQmhkWmhRUVd0SmRQaE1UeTJLR2EwS0tRZy9L?=
 =?utf-8?B?aENySU1aUjFySTBIYW1OM09NajhqZW9NVHNoU1BoZkgwYitiZ0VVVTgzT1Z0?=
 =?utf-8?B?VjN2MmROZDhXQzZsTk9Ba2VlVVZnd3p0UHA5WnNXMHA5Nlo5RjdsemxhYkMz?=
 =?utf-8?B?dTR6WTROTFJVdnpZVzFQNkhNNW5zWXVIMVJoc1JERndHRjZUVEYrVzRzWTdu?=
 =?utf-8?B?Yy8xMkUzVkhQSnpJOWNxOE5UdWo1UkZNcnJOR01WSzg4YjFWR25LSnFDamNy?=
 =?utf-8?B?YmNyRWtDNEpnaDBYc1RrbzRZNkdEK3U5bXYvTDY1ZXlyU0N0MGc1Y3ljaUJS?=
 =?utf-8?B?SFg1VG8yeVhLb3lKNmNVK0F0dnVvbEQvdmZkT1hvQ01pQldBZ0hBUDI1SFBZ?=
 =?utf-8?B?aU92bXFjcmVSa05iL0tyU3p4cHhTb0pGS0xTL1plUVlYcHB1TTJWWGJiSHpY?=
 =?utf-8?B?UEhQNVFEaHJhbEIvM3l0UHV3dTg1Uk9pRmprZXBidlBKcUdxeDM4K0FPNVZv?=
 =?utf-8?B?T3JHVENBV1U1Y2l2WVYvM2ZXVHBLVEhMUTJIdnpRajlaVytDeW0vNjhodktZ?=
 =?utf-8?B?MlFmdm5IRnhZaUFyNWZTSGpndGh3NXd6bjlSK1h6QXJ6SElGR2hKeWdYeDc0?=
 =?utf-8?B?aDFNN0FYU2VQSWF5RzIxWEFLRFdLeVRWT0dnekRGUXhPM0V5REJCdHlCTy9h?=
 =?utf-8?B?VmVPbldIM1pyaDhIVG5CYUtUeU9RWVVuVXhaL1ZMMGRzT21sU0RCcDdYSnBj?=
 =?utf-8?B?Nm1ta0RSZmF0bVFpZkJQTFdyMXR2cVFtWUZobHVzRVlDVVZFV0xtVjJ6OHEw?=
 =?utf-8?B?YmlMcllJdGtaclh0aE91UkwrQ2wrQThBTEFMb1Z6OVNUQmMva1B5RFZpbXdm?=
 =?utf-8?B?MWZGZzhxMUQ4RU4rSzBRMEpVd1E1NDRTcDZtZ01Fb1RORU9KV0Y1c3R2SHhY?=
 =?utf-8?B?bEttRFg0ZGRxTWFLdXp6MFdPelprM2I0emhzTzRuYStZVWtza2RGNk9jN1Fa?=
 =?utf-8?B?ZFlxOHYzU3Q1R3kzZDFXNjNQZFZJUm9ZY09jVVFGampSUFFJUlRTRE5uMHJY?=
 =?utf-8?B?aUk2cyszd29ldTVIc0VZOHdaN2ZSOXVia0xhSDR5VytiR2pXSm1Wa2ZKNXly?=
 =?utf-8?B?MDBmcVlDNWd4YVE5Y0tjSXhZd1gzVlRzOGs3YWhZVS8wZ0VuRUovQlltSnhz?=
 =?utf-8?B?NW5YUjVuV1loUDM2VWRIVTlkeFlhc2Y1eVI1bE01LzFYTW9CVkovZWpjL1Z2?=
 =?utf-8?B?bmUrR0RmSVV6WnJjcU5yOStzMjlWQTV0TkYwa1JtTExBWFc4alR6RDBYbnl0?=
 =?utf-8?B?TVBVWWlyWTd3anFVdzhKVkFHZERBQStTMEw5YU96d1p3aEV2MmdGREdodHYv?=
 =?utf-8?B?Z0pudFNXQVRKcDRmcGNrdDVwZTByT0Q5TnRsM3lIODgzWFR3YnVtYWwxVUwx?=
 =?utf-8?B?SjZtaHMzT095WXp5Y2Y5eHBQcTlzaDJSK210QTFSSmdiVkR3Um4vQjJwVnY2?=
 =?utf-8?B?amlBYlp0OXFXWU1rc3JYbUNNZWc3TGIvSU04VjFBenFuRmo1dkVEbHZTd1pE?=
 =?utf-8?B?ekYrWlVCL2J5NnJOR2VteEtXT0FmZ09QUlMydzhqTDhiVDl2dnJ2R0lEcHFy?=
 =?utf-8?B?TlFyWVdURVJZUVF1TDBZQi9wZHVpWnNockVFdkhOTzZUU0djek1DNURKckZL?=
 =?utf-8?B?QWZMK1dLclp6czBiVzNXY2JnYjJmZllHeHZSZjM5aFNHV1JWcStObFcwSmZV?=
 =?utf-8?B?UzJmbXZ0b1NWOWdMSmFvT3NsWFRURnMzRytLMFBkbnpPSjRTUWhCaFM5NmhU?=
 =?utf-8?B?WU1xSjc3Ui8vdGo3MkYyL3p6cXhERWxBZjhGWFUxajcvN3N1aTNRb3NSekJv?=
 =?utf-8?B?RW5iYVNwNWFrV3ZXSFZIV3Jsa0tjbUYxakp4M2N0cFVxeWpQWk1Ja3NJQkJL?=
 =?utf-8?Q?Eakx/PemZjHlXuwBMBF2xf1YE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2B3D8C2B9457043B274403F339155E0@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf96db3-a8b2-4b09-1b12-08de18106089
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:59:35.1247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iEOKToMo80F6N0xfDK5hGh5THUSKeonDHUBP41WE3SrOD/BcK5m1oQiHqoXvsQTiWR2TPI0PQWkRhzzZ3l17Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDE2OjQwIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBPbiBUaHUsIE9jdCAzMCwgMjAyNSwgS2FpIEh1YW5nIHdyb3RlOg0KPiA+IE9uIFRo
dSwgMjAyNS0xMC0zMCBhdCAxMzowOSAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToN
Cj4gPiA+IFBhc3MgaW4gdGhlIG1pcnJvcl9zcHRlIHRvIGt2bV94ODZfb3BzLnNldF9leHRlcm5h
bF9zcHRlKCkgdG8gcHJvdmlkZQ0KPiA+ID4gc3ltbWV0cnkgd2l0aCAucmVtb3ZlX2V4dGVybmFs
X3NwdGUoKSwgYW5kIGFzc2VydCBpbiBURFggdGhhdCB0aGUgbWlycm9yDQo+ID4gPiBTUFRFIGlz
IHNoYWRvdy1wcmVzZW50IHdpdGggZnVsbCBSV1ggcGVybWlzc2lvbnMgKHRoZSBURFgtTW9kdWxl
IGRvZXNuJ3QNCj4gPiA+IGFsbG93IHRoZSBoeXBlcnZpc29yIHRvIGNvbnRyb2wgcHJvdGVjdGlv
bnMpLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4NCj4gPiANCj4gPiBSZXZpZXdlZC1ieTogS2FpIEh1YW5nIDxrYWku
aHVhbmdAaW50ZWwuY29tPg0KPiA+IA0KPiA+IFsuLi5dDQo+ID4gDQo+ID4gPiAgc3RhdGljIGlu
dCB0ZHhfc2VwdF9zZXRfcHJpdmF0ZV9zcHRlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLA0K
PiA+ID4gLQkJCQkgICAgIGVudW0gcGdfbGV2ZWwgbGV2ZWwsIGt2bV9wZm5fdCBwZm4pDQo+ID4g
PiArCQkJCSAgICAgZW51bSBwZ19sZXZlbCBsZXZlbCwgdTY0IG1pcnJvcl9zcHRlKQ0KPiA+ID4g
IHsNCj4gPiA+ICAJc3RydWN0IGt2bV90ZHggKmt2bV90ZHggPSB0b19rdm1fdGR4KGt2bSk7DQo+
ID4gPiArCWt2bV9wZm5fdCBwZm4gPSBzcHRlX3RvX3BmbihtaXJyb3Jfc3B0ZSk7DQo+ID4gPiAg
DQo+ID4gPiAgCS8qIFRPRE86IGhhbmRsZSBsYXJnZSBwYWdlcy4gKi8NCj4gPiA+ICAJaWYgKEtW
TV9CVUdfT04obGV2ZWwgIT0gUEdfTEVWRUxfNEssIGt2bSkpDQo+ID4gPiAgCQlyZXR1cm4gLUVJ
TzsNCj4gPiA+ICANCj4gPiA+ICsJV0FSTl9PTl9PTkNFKCFpc19zaGFkb3dfcHJlc2VudF9wdGUo
bWlycm9yX3NwdGUpIHx8DQo+ID4gPiArCQkgICAgIChtaXJyb3Jfc3B0ZSAmIFZNWF9FUFRfUldY
X01BU0spICE9IFZNWF9FUFRfUldYX01BU0spOw0KPiA+ID4gKw0KPiA+IA0KPiA+IE5pdDrCoA0K
PiA+IA0KPiA+IEkgYW0gYSBsaXR0bGUgYml0IGNvbmZ1c2VkIGFib3V0IHdoZW4gdG8gdXNlIFdB
Uk5fT05fT05DRSgpIGFuZA0KPiA+IEtWTV9CVUdfT04oKS4gOi0pDQo+IA0KPiBWZXJ5IGxvb3Nl
bHk6IFdBUk4gaWYgdGhlcmUncyBhIGRlY2VudCBjaGFuY2UgY2Fycnlpbmcgb24gbWlnaHQgYmUg
ZmluZSwNCj4gS1ZNX0JVR19PTigpIGlmIHRoZXJlJ3MgYSBnb29kIGNoYW5jZSBjYXJyeWluZyBv
biB3aWxsIGNyYXNoIHRoZSBob3N0IGFuZC9vcg0KPiBjb3JydXB0IHRoZSBndWVzdCwgZS5nLiBp
ZiBLVk0gc3VzcGVjdHMgYSBoYXJkd2FyZS9URFgtTW9kdWxlIGlzc3VlLg0KDQpNYWtlcyBzZW5z
ZS4gIFRoYW5rcy4NCg==

