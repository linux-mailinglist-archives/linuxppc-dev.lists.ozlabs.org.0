Return-Path: <linuxppc-dev+bounces-10445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D425B1577C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 04:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsG6t1rn4z30Vs;
	Wed, 30 Jul 2025 12:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.13 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753841798;
	cv=pass; b=DenaRaueuCpoxMH9C48iJzNXNOvmkTkmRZzSqUHmQktyvDxFGkkfxGtoxyDl05Rs6Sen7DJJiYWZc9jlJ43PEadt60Mt1CqUMmwx7c4qtLKUBWadx/egZbows0qVCXLy/fnmOHbxwGbXpWTN1hkdjtsbkyJXBNWv4zEPf4rFpFfm9+dPk3fpcECoPMeXNvg581vmqwm93CUBTIWvLf8Qih71SNbhhZA296jrzNPCh8fzO2oi1ljkpf7Zr4REXsgboT5drXi/Rh9j5kPpIwgBCDs5C64eHW99WYom8GqRKgS873GK4KghV/TwKPR6o01dSZc7zS830tJZ5X1kSGEQ2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753841798; c=relaxed/relaxed;
	bh=QEvwMVfAXSrn8cKRLKesU/eQwtWxMgprgWX3sDx8I7A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MAxndEMZdh5L9n6zNkA03EcFqdMgzQDp7aUe9+DIgEAdZPtBGDCrg49hQ8mWhX5n4Ki0vZcJ50/oRNWOiOGxh4QHCLz+0ATxthsksigZyj6A/EaF0cQxLW8+ijrBku/BqHoZ/zk/YP6RTfxqjwg/kpGjy3xJ+iyNq95Qzs2ODwAXH3cxAt/USOM+OQo1tfQyuSi8chyC156750dQYYyqyjB46D0+xgs+nm0xY8RCJkzZkXcU49tfbFNSMngUHGDQ3eB0e8oCTzEI2leoVKqpohZAajRFdudJ9W70cD7fby4CiD86vACXNOqIkBvvj7NoKjFE/bJWtdr1NWoelSNjkg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FhfPOiDm; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FhfPOiDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 30 Jul 2025 12:16:35 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsG6q5s7Lz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 12:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753841796; x=1785377796;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QEvwMVfAXSrn8cKRLKesU/eQwtWxMgprgWX3sDx8I7A=;
  b=FhfPOiDmUxpo7QPRuy/akDNx1fk+ytjyBq/NQRYJIa+kcrZnhaQIm+yj
   WB7KOuyW9wXJUaz6xVnwj5hWpkFGdXAZze0TOsTsiaDYevb+268nWCruH
   z+l7ZT8lEx4fJfNViNwi8jMOn2wdCuKAOYpkSXXGAyvKOCgiOP9+FXLXb
   76+QZFmsmtKtGF81ylVEBODv9Hr0CZTJp3gfUdalz5XwbjXxD1QlPyiYC
   nzLj9b0Sm1Hfu4TuIyiRF24kx7R+AxPFLfrzIyDcuVGkrTboonZdcP0ws
   QZML+CszbPxqcOwWLu9S3inc225H+muoeS7G48nJOlrDs5OtEJLP/zTUe
   w==;
X-CSE-ConnectionGUID: UOGwae5gS0Wzd32PBd5N6A==
X-CSE-MsgGUID: iWdfHn5NTpO9wkMmEEVq9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67211547"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="67211547"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 19:15:14 -0700
X-CSE-ConnectionGUID: gHvXZ2sySp2J0j96ut1yag==
X-CSE-MsgGUID: hqiQDHvMRACX4b99a/DGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="168149446"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 19:15:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 19:14:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 19:14:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 19:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssjIy+86oGHa7p8pxb8ZbOgCsyiQahNiEFutlPmczfBIgiYRN11wGpOdBa3Vkn6mK+Uq+XEVt7C21HKuN8kOK8QWkFrkMme8LzictnvihC+oTowODIFm53QAFQgkqEoLVhsScB4GgbsF87azUr7RC/nB0/DcH81XstkAk3A/7b+CH0n6B+5FiBeTDI8QJrUR4jgCKwVx5SHDFxURPdFx5gehy3ZecANl0cA/VWKPKjopT+lJpsE+M+klGMEd+aOY3CIO53T+mcJIXiY6haKpng6aWgVurqgp+6LRxoIuPX4U8qqxYvoKLtM/OoeAgU1rZEEDq/jgzPjrjdj7McWhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEvwMVfAXSrn8cKRLKesU/eQwtWxMgprgWX3sDx8I7A=;
 b=kDbUgHKracE2On4/hB7/qRZKCM+DSEzFo27Y0Uf/L5LUFh5yF7rb6DZ/ONRk1dGUAj1PNj9JGsWsafHpUyKcvomOjcfAQx3iztTqw1Z6xoiGLMkSBVq/82WjLBQ13+950ZHnl/mXNzheEvudm7xDHVqupe3j2K0Q+Ehbeq7hQndKICDTcNSs2xvZsr5YxsQqc/T4WCPD/tZAScCobXd5me8QUztPldfP1V5cjTxCPsEGVgAi6QGNtKgFNtGrAiEkf8/dvTpLFPymptFgibaFka5mc3r2V0w8PJB04KqrFx2HC/od7uqJL93eWwq2wpSHfAKxQqq7A17XawZ6bvEJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 02:14:14 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 02:14:14 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "luto@kernel.org" <luto@kernel.org>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "dengler@linux.ibm.com"
	<dengler@linux.ibm.com>, "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "freude@linux.ibm.com"
	<freude@linux.ibm.com>, "xin@zytor.com" <xin@zytor.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"acme@kernel.org" <acme@kernel.org>, "jjherne@linux.ibm.com"
	<jjherne@linux.ibm.com>, "jarkko@kernel.org" <jarkko@kernel.org>,
	"namhyung@kernel.org" <namhyung@kernel.org>
CC: "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: Re: [PATCH 6/6] x86: Restrict KVM-induced symbol exports to KVM
 modules where obvious/possible
Thread-Topic: [PATCH 6/6] x86: Restrict KVM-induced symbol exports to KVM
 modules where obvious/possible
Thread-Index: AQHcALCBg6j5Hkn7N0SjwLU6zeGNfbRJ7eWA
Date: Wed, 30 Jul 2025 02:14:14 +0000
Message-ID: <745fe95bb826db5a1f8bb0723c482e1c68d984dc.camel@intel.com>
References: <20250729174238.593070-1-seanjc@google.com>
	 <20250729174238.593070-7-seanjc@google.com>
In-Reply-To: <20250729174238.593070-7-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH0PR11MB7447:EE_
x-ms-office365-filtering-correlation-id: e87172b7-bd23-40d9-4529-08ddcf0ec7df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d1pIMjJLQW5QQmEyRUoxRmJqd2FuN25oeFc4eW01UkJkRHZCZVJJZit1L01z?=
 =?utf-8?B?ZDhiU05KUWlaMDJlVG9nRitPTWJRL3AzOVJWVTlyYXQ4dzBSd1k0dFEzRDlV?=
 =?utf-8?B?SSswZnZoUkg3SXh0b2lSVzBxNjVzWk9wU0YrUmR0NXVOUXpoc25Sd1pHSUlP?=
 =?utf-8?B?N3RoZStGengrUG1KNWEzU0FMeGpJRGxab1VqMWR1Ly9sTE1STzJrMzlJY1cx?=
 =?utf-8?B?bm1BNnQxT1VvS0tKUElnbk1SbENaUkpPRGkrd0M3L3hoUXBrWSt1bmh0N1RY?=
 =?utf-8?B?WWJqRlhGWmFaUWJSTnhweTZHUVFqaFBqeU1TRUhNeXBOWW9QRGFWN0JCaU9V?=
 =?utf-8?B?TFV4ekh2K25ZZCtEWHBFWTgzK01HNzhUMGFiOTBuMEhUemJtd21kQkVlR3FB?=
 =?utf-8?B?QWFkWVl1QVRwdjMySUMwRGgyRkZocTVzNldIbEhqQUUybFNWenpqR044aFBO?=
 =?utf-8?B?MXAvWFNRUFJmS2FWOTlOckxTaUFoNUkvUU95U1ZiK3lxVWFXc1NUL3VsTDQy?=
 =?utf-8?B?eHV5NkFXWG5GMFh6YVZxTHU4cEVHY3RjRWkvdDJaY2Q2VmJEQUFrb2p3eU5k?=
 =?utf-8?B?WkZ3bm5GVkROUXhEN2s2ZHlxRS9mTzREZTdUTGlnT1pMM0h0d1dCWDFFb1Zs?=
 =?utf-8?B?M3Z6N2diU3d1SENuYWVZanNzT3hwTzZiWEpDQ1RXT0JFbjd6YTNNcUpWMXJC?=
 =?utf-8?B?b1JIcUR1VTVpWHBDeWdoSDRuZkJ0bW5weWR0N05tOTRkOGIxc1RNcDNIYysx?=
 =?utf-8?B?VXR5YW1xWmRkcFJ5ODZUNWNMdEpUQ050UVp5NGhQZm9Ya1hhRjVmcFBlSVkx?=
 =?utf-8?B?MVAwR0lBMnNZdExoZERzMC9yL3M0eGpUbjRpcGE1YmdUbHlyeUVqNElJbldV?=
 =?utf-8?B?SGd1Y0pMcHV0SUErcmZpa3NvRkhXZWQ5UzdUMllWQUZia2VaWHJ1Qm1xVGZO?=
 =?utf-8?B?bFFpU0VvZmNSczFsMm8zQzZXdkZMaXFuKzVmNmlQeUNNUkkxYnRKdk5DZ3Fq?=
 =?utf-8?B?OEZVRXoxUFltajdVR1NueFg3Q0VIOEY4QUhxTFZSVFZiS2g1VGh1SERRZURu?=
 =?utf-8?B?b0lQeXNxNVRYK2ttT2VxdGVBcGRFQjBVTElnK05odVhLMTZoVkVKclVtSmVo?=
 =?utf-8?B?OGJGNUxQalgrTU9CaFByMm5KdzBiREpJN25DWHhJY0xjcXptelM5KzIrQk8r?=
 =?utf-8?B?REE4anpORENKNVQzRDVNYU52Y1B2L0dOa093NGFMVy9NM2xpTWtaMjlTK0Jr?=
 =?utf-8?B?YjdmUEhTb3BzcGJBVUdER1FTWitwS0tUM2xRdnY2VUJGL2F2RjFyeFB3U0dL?=
 =?utf-8?B?QzBuTUV1Ni9PZHJEcDJnbG43cEFiQ0xNdlRsTlAzUWVRbm5xR0YxYmg4aG4v?=
 =?utf-8?B?Qi9XVVRjWmQ3QURCMzVUdXpLT3A4VDROczMrWFYvR2JELzFnblJ5MDVGU2R3?=
 =?utf-8?B?YkJFSC9zZ1hjWUt6cU1TTWp6WG1ITlpSOTZscFJBSnMwUkVROHlMQzJQNUpz?=
 =?utf-8?B?Z0RQUm9yYXZhRVBKb2ZLSUgydkpTMnVNUnBZY3dCeDBlc3RhTERaVzJzRUVq?=
 =?utf-8?B?M25nTDc3SzJqaURNbWloUUNxdFRPeENFWXlYMlFLdmZMZnQ4RVNIcUZvMmZN?=
 =?utf-8?B?M01udFAydTdmazIvVU5DWmdQTjMvL1BrQklmVzlrK3dVM05Ma2RHMkgvc1ln?=
 =?utf-8?B?SUsvbnZTb21tU1N0bGE1c0RpTFBwQ3NtUEx4MTg2eHhaYzhocEJKbUJ1Ujl1?=
 =?utf-8?B?SlA2VDd6bTJSUk83YWJVWmg4RXVndFlJMU00MHkyTWdXUUhrQVZ0UnJkcS8r?=
 =?utf-8?B?bWFjeXR5M1FhclIzTTFWWUtoNnNvdFZHekhreFhMOFdxZlovS3dvaXRobU8z?=
 =?utf-8?B?bUNCT3dUOWE0c3VnbFd0TFdEOXBDYnEySlpXZ2M0dHRBZWdFOFVicmRUbXAx?=
 =?utf-8?B?aTZmUEd3UlJyVmJYRTRUcVExeTFUaVN4SUxYTXZLaW1HV05GMDRUVVUyWXIw?=
 =?utf-8?Q?0HDgVVWDci170AHhdbI783A+ZPyyIE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTVjMytVbEJvTzM5S2twVTI0U2N2WFJpZUF3MFo4QWFybGp4bzFwMzZRRHRi?=
 =?utf-8?B?RkdaZ0l2WVlSVlFQZ2xnYlJYZkNCNHE2cTVudzg3NjlaMS8zc1NyUGNaY0Rx?=
 =?utf-8?B?UklJQ3c0THNFSE1TQzhXbS9vcjdpNnlod05qRVMrMTBIaitFN3FrNmEzRXBF?=
 =?utf-8?B?dlV1c1RNU2RBc0liY0sybU5SQy9WTE03YnFtLzFtTmhjcnMrbVR2YVJkYURo?=
 =?utf-8?B?blVING1objc5M2ZFcTIza092aGI4Zm9SWDZWL3MrQmdvRWtUdjhKbFloMExs?=
 =?utf-8?B?SVRweUFBRFZoZy9udVpxV0lqQmpZbWxsdmp1QUZMa3NsSDhRMnVITnl1MXd5?=
 =?utf-8?B?c2xRam1TWHB3N0JGMEQ1SEJEN2JnU3pZbkx2SEJEUWRwazM0cmVFWlptY1Jm?=
 =?utf-8?B?di9aUDlDSXptMk9rdDYrdTJ3WWRCWG90WDhPMXVjRmwrZnM3RVF4eVpJaHhq?=
 =?utf-8?B?bGs2bmpsS3MrRkVMVHRuRXl6dUpsWm5kZ2JhUVJFdzB4cXRXSWpuYU5NVDlh?=
 =?utf-8?B?MFlXL2hsTW1VaUsxdWd0TjNrbXNIdmdsUDF0WHo1bEJyMllxdktVWDc5czZ5?=
 =?utf-8?B?aW5kRE01Mmp0bkh6VzdMenFDVGxjK0pEcTVjclgxTm1PZlNJa3JzUzZUREI4?=
 =?utf-8?B?UnUrNFNoc1BVWlRWWEN6V2J1ZHd6VmE3VFAyQkhlZ1orN1drNWVKdmVuOHpM?=
 =?utf-8?B?ZkVhTjFtU1FJRXFmTERDM0M0Sm5yTWhBN3luMUs3RG1pZUlDUkNqVWJEK3R4?=
 =?utf-8?B?YUN1RmNDVUNzeFdlYjhSTkI2YTQrb3IwdE5Ta2RqWS9iREllalE4emt1WXRj?=
 =?utf-8?B?ZVVtSlJsbzh2R1hsamhwcjhsNjRLb245REdvQVBMY1BMSG9aUEZ1SFZXRVBY?=
 =?utf-8?B?Q3FMbWc3dDFRNXZCN1lCWThiUFlId1ZicjlFSkRvQTRrdGh3Qmh6b3I3eklM?=
 =?utf-8?B?YWU2MEloWVpqL093VFVwTHM4Vyt0KzNvY1VDRkdCVXpUQktrRDBlUkJITFo0?=
 =?utf-8?B?Y1NDQVVpZXU3aVZlS2UzZXBzVUI5YnA3RmxPUnkrd28xbDR4Q1g1YmtlTmd4?=
 =?utf-8?B?WXZoVUdmOU5rcnBKY0tLWEtjWkpzNUhHRDgxMlNIQysxNVkvU1BVamQwWnVR?=
 =?utf-8?B?aFBNYmZ2MTd1Z0Z5ZUhJeFZzWHViR1hhU3kxSlpld3kwdzdrWVpIdHptZjZy?=
 =?utf-8?B?dHVaTjYyaVdZbG10bTYxS2pHOFJBT0ZXcmx3VXNMMlJIZGtXV3NRdm8zcHBo?=
 =?utf-8?B?a09ncllhOGJqcVZQUGdkTnBTMHhJZ0ZtT3hobjdSTlJJOUt0d1B3Mkx3bW5r?=
 =?utf-8?B?OXVXcE1hb1JOMVNBd0xIa0xJcUM4KzIyMUZIM2g0Nldpc0kyaGFvek9WTUJC?=
 =?utf-8?B?U3Z5MmhiTS84R0IweTZSSTdTK3pOK1lvbEFsdUtoSWxlMWVvQXhIWEdBTzNW?=
 =?utf-8?B?VittSWhLM1JFc1l3UlBqd3ovcjVJV29Gb3psTzVNS3BybFFhTmJxWlVzNm80?=
 =?utf-8?B?dFVPb3MrMEFrOFNCV2x0dTJ6b0RITkllUHVJMzFiRU1PYU4zY3ZlRy9XR2hv?=
 =?utf-8?B?MG40RTFZcmx0K1RRcVZuSUNoazhId0pQMmdkY0NNSHRpYk1wTVZpYTFhTFU5?=
 =?utf-8?B?ZTloZzRJMytNQUEvbmVPRnRCamhLanN6ZlJpalJ1dHljT0hkVXNhM2x0N0g2?=
 =?utf-8?B?U0xXUm53eHEzMEE3WTRZRnkrM0NPb3pTdjFkNFdLK3cyTVdPKzBUbHhlSk5V?=
 =?utf-8?B?c1g1b1ViUEs4RWNUQVhWTXkyaXBIRFlaT0pjSEwzYW43R3lzQnM1elRXaUJP?=
 =?utf-8?B?MDl0SExDUmh0NEZoMUUwQVFkQXArQmNETFNCTm16eGxHZ202b1dkbFErb2t2?=
 =?utf-8?B?dlh4cHBTTlpkNnVad1dUTG02ajdiNjQvOVFHTU1TY1lhZENlcndLajBRMEpY?=
 =?utf-8?B?azg2bGpZdlZObzFjNUNvLzZDQThwRUQ0OUtmeTF5U2E0ZU50aXFWUkdLMy9O?=
 =?utf-8?B?V0xoNTRhQ0s4bllFMHBYL3phZ3R3aXFKeHNndkRGUEQ3NHloYzNjVzJ6OWE1?=
 =?utf-8?B?M0M5dy9tVGJ1NnNLYmFsSXVLZTZ2QitqMHBsZlhNUmhveXVacEhYQk1mN2h4?=
 =?utf-8?Q?3GKbKR2weeAbITlzlRzJoyzQ0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6C65F26F9785D4A9C4D40BC6B1611D9@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e87172b7-bd23-40d9-4529-08ddcf0ec7df
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 02:14:14.5948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWIi5BGLpAY/tmDMWaVFz04W2feSP07VG5lqwBo1v2w+Keu3SNsBiZ2FPU9xid4xF7z9Ktw5WrPLAwHkzUoDTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVHVlLCAyMDI1LTA3LTI5IGF0IDEwOjQyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBFeHRlbmQgS1ZNJ3MgZXhwb3J0IG1hY3JvIGZyYW1ld29yayB0byBwcm92aWRlIEVY
UE9SVF9TWU1CT0xfR1BMX0ZPUl9LVk0oKSwNCj4gYW5kIHVzZSB0aGUgaGVscGVyIG1hY3JvIHRv
IGV4cG9ydCBzeW1ib2xzIGZvciBLVk0gdGhyb3VnaG91dCB4ODYgaWYgYW5kDQo+IG9ubHkgaWYg
S1ZNIHdpbGwgYnVpbGQgb25lIG9yIG1vcmUgbW9kdWxlcywgYW5kIG9ubHkgZm9yIHRob3NlIG1v
ZHVsZXMuDQo+IA0KPiBUbyBhdm9pZCB1bm5lY2Vzc2FyeSBleHBvcnRzIHdoZW4gQ09ORklHX0tW
TT1tIGJ1dCBrdm0ua28gd2lsbCBub3QgYmUNCj4gYnVpbHQgKGJlY2F1c2Ugbm8gdmVuZG9yIG1v
ZHVsZXMgYXJlIHNlbGVjdGVkKSwgbGV0IGFyY2ggY29kZSAjZGVmaW5lDQo+IEVYUE9SVF9TWU1C
T0xfR1BMX0ZPUl9LVk0gdG8gc3VwcHJlc3Mvb3ZlcnJpZGUgdGhlIGV4cG9ydHMuDQo+IA0KPiBO
b3RlLCB0aGUgc2V0IG9mIHN5bWJvbHMgdG8gcmVzdHJpY3QgdG8gS1ZNIHdhcyBnZW5lcmF0ZWQg
YnkgbWFudWFsIHNlYXJjaA0KPiBhbmQgYXVkaXQ7IGFueSAibWlzc2VzIiBhcmUgZHVlIHRvIGh1
bWFuIGVycm9yLCBub3Qgc29tZSBncmFuZCBwbGFuLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2Vh
biBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+DQo+IC0tLQ0KDQpbLi4uXQ0KDQo+
ICBhcmNoL3g4Ni9rZXJuZWwvY3B1L3NneC9tYWluLmMgICAgIHwgIDMgKy0NCj4gIGFyY2gveDg2
L2tlcm5lbC9jcHUvc2d4L3ZpcnQuYyAgICAgfCAgNSArKy0NCj4gDQoNClsuLi5dDQoNCj4gIGFy
Y2gveDg2L3ZpcnQvdm14L3RkeC90ZHguYyAgICAgICAgfCA2NSArKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0NCj4gIGluY2x1ZGUvbGludXgva3ZtX3R5cGVzLmggICAgICAgICAgfCAxNCAr
KysrKysrDQo+ICAzMSBmaWxlcyBjaGFuZ2VkLCAxNDAgaW5zZXJ0aW9ucygrKSwgMTAxIGRlbGV0
aW9ucygtKQ0KPiANCg0KWy4uLl0NCg0KPiANCj4gLS0tIGEvaW5jbHVkZS9saW51eC9rdm1fdHlw
ZXMuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2t2bV90eXBlcy5oDQo+IEBAIC0xMSw4ICsxMSwy
MiBAQA0KPiAgI2lmZGVmIEtWTV9TVUJfTU9EVUxFUw0KPiAgI2RlZmluZSBFWFBPUlRfU1lNQk9M
X0dQTF9GT1JfS1ZNX0lOVEVSTkFMKHN5bWJvbCkgXA0KPiAgCUVYUE9SVF9TWU1CT0xfR1BMX0ZP
Ul9NT0RVTEVTKHN5bWJvbCwgX19zdHJpbmdpZnkoS1ZNX1NVQl9NT0RVTEVTKSkNCj4gKyNkZWZp
bmUgRVhQT1JUX1NZTUJPTF9HUExfRk9SX0tWTShzeW1ib2wpIFwNCj4gKwlFWFBPUlRfU1lNQk9M
X0dQTF9GT1JfTU9EVUxFUyhzeW1ib2wsICJrdm0sIiBfX3N0cmluZ2lmeShLVk1fU1VCX01PRFVM
RVMpKQ0KPiANCg0KSSB3YXMgdGhpbmtpbmcgdG8gc2VuZCBvdXQgc2VwYXJhdGUgcGF0Y2hlcyBm
b3IgU0dYIGFuZCBURFggYnkganVzdA0KY2hhbmdpbmcgdG8gdXNlIEVYUE9SVF9TWU1CT0xfR1BM
X0ZPUl9NT0RVTEVTKC4uLCAia3ZtLGt2bS1pbnRlbCIpDQp1bmNvbmRpdGlvbmFsbHksIGJ1dCB5
ZWFoIEkgYWdyZWUgaGF2aW5nIEVYUE9SVF9TWU1CT0xfR1BMX0ZPUl9LVk0oKSBhbmQNCm9ubHkg
aGF2aW5nIHRoZSBhY3R1YWwgZXhwb3J0IHdoZW4gS1ZNIHN1YiBtb2R1bGUgaXMgZW5hYmxlZCBp
cyBiZXR0ZXIuDQoNCkkgdGVzdGVkIHRoYXQgd2l0aCB0aGlzIHNlcmllcyBJIGNhbiBzdGlsbCBz
dWNjZXNzZnVsbHkgY3JlYXRlIFREWCBhbmQgU0dYDQpndWVzdHMsIHNvIGZvciBURFggYW5kIFNH
WCBiaXRzOg0KDQpBY2tlZC1ieTogS2FpIEh1YW5nIDxrYWkuaHVhbmdAaW50ZWwuY29tPg0KVGVz
dGVkLWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5jb20+DQo=

