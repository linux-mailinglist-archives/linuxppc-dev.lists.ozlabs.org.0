Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47364076D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 14:05:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNtTF5XYvz3byj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 00:05:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kHJl3M8Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kHJl3M8Z;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNtSJ5GZlz307C
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 00:04:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669986257; x=1701522257;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8pf42RGz4FHJE0Rl/WyfFubpCcQo7x8hA+IHUUMjWt0=;
  b=kHJl3M8Z3gi0FWC+RPpsXUx6uKlqgPjCSEBCGnGkjeHJgF7wcorvCfz6
   pBWvlD0OI80xNhl4UJoCkLx42qPect0+NjQyqxN06Sh7bRgZYYDbL/+AV
   KP1bAC74SMzt3TKc0Sbt9Q3R70LZFMrRypuT/TWXfTNuAlxXf9XQf1s3Z
   mKXAS+R+0LC6d92yS5EquH98WexCPwHacTL2mFXtplEhtnsT1msOLXA5j
   /UmcoCyTIqjWMW+z2NGjoqbLaQT55RUnUejr4SGWMkbXvmmSw/4p+qJV4
   mUWqLngK4/84o76dJ5FE0n5xLeyWPMcyDIgasFXI0yTLP9k5Q7mvx2YsD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="380237596"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="380237596"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="787280404"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="787280404"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2022 05:03:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 05:03:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 05:03:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 05:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4Ct16zivN8WVxqbQ4gqE4iukadbu/gLMsUrj5w7CXfFHSs0JrljV+XPb8tJG/rmz9jEGFXZetdJywqJpTaX2TlfVA7XunTu3yJ1gi+Q2pgFlCwX/CLKFZo9k7nWILluZFl8U/U/zXRb7kVD0C8wug7K/5QQp+v1M34AGzsGR68jnZIs7M5H/8Zl5zpdm451ThjrIAM15u3GXeQvblmxFytujlsGYv7MkNJB4NXBJNKq0zEwQsV7FA3/zB09bn8zPExRidcQ5hvVUdSuYZwXJz0zhO8mfFjXVFs5DS+UOeBMYPb+rAmesDVJifsJWM+TP0/VXqnY7t4ymceLK9pEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pf42RGz4FHJE0Rl/WyfFubpCcQo7x8hA+IHUUMjWt0=;
 b=m9PlZbLfQMln6VgBBO8FiByUssmHY0xu2JyMd64f+H7Yacf9l0WurxT28YEbbfoUMb6L5oK4YD+ciOhANp3oFnILErZ6SSbxexvWBDMCdkHe0RIh9FMxr0h5gSuYu4WxHq6vzAiInuwUQ0VoPKItnyR2m/UehOwSFkzDI/ozSQ0+K7x1rrs7AP13jlY3masl7asAr6v0rs6BFKyO+SAR+A8kn+uWTIxJyy/tGP71FcZoA75beqIfWd+9f0D7G82I7yrTHfhNh/jls4ilwbk1SMDzc/RGvpZ5iXdoNNRv/icH7enKY3TO7kOD7qx2irTB6aKT2ItZ8JvswvDje1TEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 13:03:37 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 13:03:37 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "maz@kernel.org"
	<maz@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"Christopherson,, Sean" <seanjc@google.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "paul@xen.org"
	<paul@xen.org>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "anup@brainfault.org"
	<anup@brainfault.org>
Subject: Re: [PATCH v2 40/50] KVM: x86: Do compatibility checks when onlining
 CPU
Thread-Topic: [PATCH v2 40/50] KVM: x86: Do compatibility checks when onlining
 CPU
Thread-Index: AQHZBREUXZvrwOe3yEGmbvrorekRL65aktaA
Date: Fri, 2 Dec 2022 13:03:37 +0000
Message-ID: <34ed147326f8c0b0c7df4eeacb62fc802d030de1.camel@intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-41-seanjc@google.com>
In-Reply-To: <20221130230934.1014142-41-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|SA2PR11MB4841:EE_
x-ms-office365-filtering-correlation-id: ef3c0535-b6ba-4363-57d1-08dad465a030
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oKi8sZuTlJagf/pWndO/Vu3HAx3CSvMdSiWwyBQF4bjSrCWGG9tIRuEUndeG8c29DFxSyWuFDsx7fM/yPDhoID/++xEUkvf46Z1A9T7XcBQ2kw9WE1knt/LnVd/q8mxtqdqNDndos/A6OJ1jQE627GSQRP7wwwGmNkWLE9VpZeO+YSkMWL8y99PwkIp54in9RyZy80yu8YYPNNLxd6bpvXJo0MF/SzSU6s5aagNGUnlkTvjxqnGnXjI+ZXYhF8Qe+bTMFaQKWwmmfhVS21GhOTcgc8gcNRHb8W+VcOjiXhuLqM21eTDEaW/wkI2PNwykpdv8dIu8sRjrcd20rYYp1Lmz9aiP/f+FzH53/wLj4euf958KYTTjVUjnECPcEfoYGkEf/gogThwI+NTiSK6jLHR2Q+sQ08+eyR2+WhLNEvXAAsyFLoy9kOncoRCAZBaTsF4Rq3mqUlDnvI4evIbk8rzD2RCzCUl7bUDO2yPhF87GsOgT68stKsiliUWg0W0c+OcTZe3Q9gYyxp+G5XJRxk+kz+wKfZYWaIMijY/ZBu4qFD9s+tpr9/FlLfb8TNxae1YfvNcP7yAYfTlk+uqiAcRJ743BuDEmT1HIhXkEyZe1BIYvkT6zY3iuPucFErEmZawpiizdImpxJkMHjo1cvpKjeouXJv+RRd4oN0Nd7ynhPWJTJPywtT28Z8KqF6iCVDFOtY1G0Z/97QzPwOkC2yjeS7Q1MtAn97sChNe1aU4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36756003)(4001150100001)(2906002)(82960400001)(38100700002)(122000001)(41300700001)(8936002)(5660300002)(7406005)(7416002)(83380400001)(38070700005)(86362001)(921005)(71200400001)(110136005)(54906003)(478600001)(6506007)(107886003)(76116006)(91956017)(316002)(66556008)(4326008)(66446008)(8676002)(66476007)(64756008)(186003)(6512007)(66946007)(26005)(6486002)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zmw2aStEL2ZLRVVDc2p1S3M1ek9rWWE3L2E3MWVWTzJCVEcyU1poUVVPSTFP?=
 =?utf-8?B?Mzgyd0UzQnNlblQ4MzRSaWdDbTRnc2Q5VENBblVlUVhQeFVEQXNaWVEyZHQ2?=
 =?utf-8?B?N1RjSkVIUVM2Q0x0REdRUk5tUVdPN09oYlZ1SkFmdFZnQVo3enRtYUFHZVFJ?=
 =?utf-8?B?dCswd0d2SFNidndTUEpZZW5DK1M5QTFJQkY2V01GSmJKK1hPeTkrVm50WXlO?=
 =?utf-8?B?Z3Y3b1lEb0Q3SnFUbXhGRWlDOWZSbjFpR29tSmNCS3ZUSzVDaUdKWUdtT1pK?=
 =?utf-8?B?ejdML2YyL3VDY3R5Q0dLRFgwekxMYjduQXBLN0FQS1BCYVZDSVRiZk5ab2dF?=
 =?utf-8?B?QVBYazhNT1MxMFZoN0MxYks1RzhUV2Q0V3h1cG0wbTY5dlVieHVEWTFSZ0Nm?=
 =?utf-8?B?NjJ1b0RYQ21ZdjZHWUFwOGVFUk5yRXN2aFNBenRSeUIzVUdmZUZwV1Q0QnFt?=
 =?utf-8?B?Mm5HWFdzeWNkVS8xWnV5M3JEQmNwNkFFT2lhZEV3eXRla0c3MDIxRHlVamI4?=
 =?utf-8?B?VFNqYThCMkIwYVlHY2k5bnN5MVdQM0lLL1NHZUI5NzltMm5MZ2RLelhtL09t?=
 =?utf-8?B?ZVdPRTVHREdQQUVncmd6WGdTSW4vQ3JLMFVHKzFJVzFvN3dyM1dXVW9pdXFa?=
 =?utf-8?B?MUdCWm5YSGtZdmNMQ2JqZ3hNOG5CMnVVczhKWW1YY3lwcjZZZnZpN2p5S2Jp?=
 =?utf-8?B?MUF1Y3ZjQXh4QzJ1eGVCdy9Rbk0wa0kyNVBGZlA1dk1TMmFSKy9ubk93ZlZF?=
 =?utf-8?B?VnVQc2hlOEZ3WjlQOEtVWWY5Sm4yaG96YkpmV0lUMnNnVnhCK0haQWJhcjB2?=
 =?utf-8?B?cTl4MkovakNKV21KcFpNenc3Z3RrTUlBMXhCRGpHTlZ0TVRZbEMzVE1mMkhE?=
 =?utf-8?B?NmlLU21GaUx1RlpqK01pYVF2M2ozSk9hUWNSN1IvdGphdGhjdm9xZXNXd01i?=
 =?utf-8?B?R2p1eGdmbktGY2xNNFRoc2FTVXpsa3dmSGRRMk1nSzFMeUhNQjZkYkxWd1Rp?=
 =?utf-8?B?bGxJeklIMmVlQm5NZCt0bHhVUzFYZklLeVZ1ZVRyUUdFanJTNFNhVjlidVQ1?=
 =?utf-8?B?QVRXeXN5SHB5RjVsaEVvaythU3YrL0EyNHh5a3RjOGoxSFNpbkVVSnMvZ2l0?=
 =?utf-8?B?OE1qNzFzT0hOZExpU2t3Z3JpbDN2QnkyWnpZWFA5ZDFTQzhNN1NzWVNlRkZR?=
 =?utf-8?B?OHQ1Kzlqb24weUcyN2ZoRC95K0lwc29DYUZhMlQ5bXpGTVFFVmVxQWRvcGRi?=
 =?utf-8?B?a3dsRmxRdy9ueVZBbTdoZE91SE5GSmpoR1pMVzgrRmhQamVhUEo3Tm14N0xv?=
 =?utf-8?B?WU9xYlJKVzFZbWJOMWFoMG1GYWZubVN5OEtPRXA4eXFrMjh0YTRvZFJWamJR?=
 =?utf-8?B?cE4xaWZxOXM2cm1UeXZjTUFueDJOQTBLYXN3LzVWeWdtT05Dc05kbWJhTEND?=
 =?utf-8?B?bk9tVm5BZ2gwZ3FOR3BzRlhHYitUWndyeUFqVExTT2Rzem1vR3RnVzgwb0tz?=
 =?utf-8?B?VlB2NmVFVG44dlRvMkpuNjhZVjdNdDZOVUFyb0VDOGRsQ2J3TTlOQzJtS3Ix?=
 =?utf-8?B?aGpJa0JXNDVZcUVYT0JNa1dxZnQwMFhKRXRBUjFpaEsxejFhMnp2cGRYdmth?=
 =?utf-8?B?SStxK3ZQU1g0VFBYTndHVUtndlpCbDBxUU5Wb09FN1U2dE10MVpCTkpTZW0w?=
 =?utf-8?B?RkpkMFJjNmY4N2J3aVRNQnY3U3hCWURUZnFTVjFnMVllenpvd0NCdEx2VFc1?=
 =?utf-8?B?dDdQQVBpRTBkc0RVOWpwbWVjTjFDMWk3WWZEdjRqbHlLMWx3UFloWEJqQVRk?=
 =?utf-8?B?YXRmMEhSWHJVeEkrcUhXUXhLaWhyL01Nb1ZCVFlXWXdJSE03WFRhRFVwclVR?=
 =?utf-8?B?S1JnK2ZYZ0p1MVUwYTZKaXN0emlTOGVSRmI3NXRTdnlYaktJUGxvRTdrbTV4?=
 =?utf-8?B?NW8zTzEzL0k1S0Zzc05VdU9tdUtqd3pGVlVDbWtycUd4NTFrcGF2dkFqTXZq?=
 =?utf-8?B?aWRzdTlPWmk5VVhsaHRQc3FiQnFvcXZRaVBRS3hBS3BsY1ZxYUR4V1hMTVY2?=
 =?utf-8?B?Tm1LeFFQMGh1RjFma045RUhOYStaMC9SYmJjaDVCOGlDQ1lPZW1CUjZCZFZ1?=
 =?utf-8?B?YkZFV0ExVVVCM0RqUDJ5M2ZJc0VzUGVmaE9TWkoxWkFaN0svV3RJR1BVQkZk?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3CD97BCF0B11640862D6F94AE0223EB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3c0535-b6ba-4363-57d1-08dad465a030
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 13:03:37.0029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbI1EnGOowZzySemxmwUgZScCF9kwyDrayz7aC4S4CWQ8pduPw1ry8cYv/AK8h871sDirqoMhjdYPe52PLOuVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Gao,
 Chao" <chao.gao@intel.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "philmd@linaro.org" <philmd@linaro.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "james.morse@arm.com" <james.morse@arm.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTMwIGF0IDIzOjA5ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBGcm9tOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPg0KPiANCj4gRG8gY29t
cGF0aWJpbGl0eSBjaGVja3Mgd2hlbiBlbmFibGluZyBoYXJkd2FyZSB0byBlZmZlY3RpdmVseSBh
ZGQNCj4gY29tcGF0aWJpbGl0eSBjaGVja3Mgd2hlbiBvbmxpbmluZyBhIENQVS4gIEFib3J0IGVu
YWJsaW5nLCBpLmUuIHRoZQ0KPiBvbmxpbmUgcHJvY2VzcywgaWYgdGhlIChob3RwbHVnZ2VkKSBD
UFUgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIGtub3duDQo+IGdvb2Qgc2V0dXAuDQo+IA0KPiBB
dCBpbml0IHRpbWUsIEtWTSBkb2VzIGNvbXBhdGliaWxpdHkgY2hlY2tzIHRvIGVuc3VyZSB0aGF0
IGFsbCBvbmxpbmUNCj4gQ1BVcyBzdXBwb3J0IGhhcmR3YXJlIHZpcnR1YWxpemF0aW9uIGFuZCBh
IGNvbW1vbiBzZXQgb2YgZmVhdHVyZXMuIEJ1dA0KPiBLVk0gdXNlcyBob3RwbHVnZ2VkIENQVXMg
d2l0aG91dCBzdWNoIGNvbXBhdGliaWxpdHkgY2hlY2tzLiBPbiBJbnRlbA0KPiBDUFVzLCB0aGlz
IGxlYWRzIHRvICNHUCBpZiB0aGUgaG90cGx1Z2dlZCBDUFUgZG9lc24ndCBzdXBwb3J0IFZNWCwg
b3INCj4gVk0tRW50cnkgZmFpbHVyZSBpZiB0aGUgaG90cGx1Z2dlZCBDUFUgZG9lc24ndCBzdXBw
b3J0IGFsbCBmZWF0dXJlcw0KPiBlbmFibGVkIGJ5IEtWTS4NCj4gDQo+IE5vdGUsIHRoaXMgaXMg
bGl0dGxlIG1vcmUgdGhhbiBhIE5PUCBvbiBTVk0sIGFzIFNWTSBhbHJlYWR5IGNoZWNrcyBmb3IN
Cj4gZnVsbCBTVk0gc3VwcG9ydCBkdXJpbmcgaGFyZHdhcmUgZW5hYmxpbmcuDQo+IA0KPiBPcHBv
cnR1bmlzdGljYWxseSBhZGQgYSBwcl9lcnIoKSBpZiBzZXR1cF92bWNzX2NvbmZpZygpIGZhaWxz
LCBhbmQNCj4gdHdlYWsgYWxsIGVycm9yIG1lc3NhZ2VzIHRvIG91dHB1dCB3aGljaCBDUFUgZmFp
bGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4N
Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5j
b20+DQoNCkZvciBWTVg6DQoNCkFja2VkLWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5j
b20+DQoNCj4gLS0tDQo+ICBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jIHwgIDggKysrLS0tLS0NCj4g
IGFyY2gveDg2L2t2bS92bXgvdm14LmMgfCAxNSArKysrKysrKysrLS0tLS0NCj4gIGFyY2gveDg2
L2t2bS94ODYuYyAgICAgfCAgNSArKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0v
c3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0uYw0KPiBpbmRleCBjMmU5NWMwZDlmZDgu
LjQ2YjY1OGQwZjQ2ZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYw0KPiAr
KysgYi9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jDQo+IEBAIC01MjEsMTEgKzUyMSwxMiBAQCBzdGF0
aWMgdm9pZCBzdm1faW5pdF9vc3Z3KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkNCj4gIA0KPiAgc3Rh
dGljIGJvb2wga3ZtX2lzX3N2bV9zdXBwb3J0ZWQodm9pZCkNCj4gIHsNCj4gKwlpbnQgY3B1ID0g
cmF3X3NtcF9wcm9jZXNzb3JfaWQoKTsNCj4gIAljb25zdCBjaGFyICptc2c7DQo+ICAJdTY0IHZt
X2NyOw0KPiAgDQo+ICAJaWYgKCFjcHVfaGFzX3N2bSgmbXNnKSkgew0KPiAtCQlwcl9lcnIoIlNW
TSBub3Qgc3VwcG9ydGVkLCAlc1xuIiwgbXNnKTsNCj4gKwkJcHJfZXJyKCJTVk0gbm90IHN1cHBv
cnRlZCBieSBDUFUgJWQsICVzXG4iLCBjcHUsIG1zZyk7DQo+ICAJCXJldHVybiBmYWxzZTsNCj4g
IAl9DQo+ICANCj4gQEAgLTUzNiw3ICs1MzcsNyBAQCBzdGF0aWMgYm9vbCBrdm1faXNfc3ZtX3N1
cHBvcnRlZCh2b2lkKQ0KPiAgDQo+ICAJcmRtc3JsKE1TUl9WTV9DUiwgdm1fY3IpOw0KPiAgCWlm
ICh2bV9jciAmICgxIDw8IFNWTV9WTV9DUl9TVk1fRElTQUJMRSkpIHsNCj4gLQkJcHJfZXJyKCJT
Vk0gZGlzYWJsZWQgKGJ5IEJJT1MpIGluIE1TUl9WTV9DUlxuIik7DQo+ICsJCXByX2VycigiU1ZN
IGRpc2FibGVkIChieSBCSU9TKSBpbiBNU1JfVk1fQ1Igb24gQ1BVICVkXG4iLCBjcHUpOw0KPiAg
CQlyZXR1cm4gZmFsc2U7DQo+ICAJfQ0KPiAgDQo+IEBAIC01ODcsOSArNTg4LDYgQEAgc3RhdGlj
IGludCBzdm1faGFyZHdhcmVfZW5hYmxlKHZvaWQpDQo+ICAJaWYgKGVmZXIgJiBFRkVSX1NWTUUp
DQo+ICAJCXJldHVybiAtRUJVU1k7DQo+ICANCj4gLQlpZiAoIWt2bV9pc19zdm1fc3VwcG9ydGVk
KCkpDQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiAtDQo+ICAJc2QgPSBwZXJfY3B1X3B0cigmc3Zt
X2RhdGEsIG1lKTsNCj4gIAlzZC0+YXNpZF9nZW5lcmF0aW9uID0gMTsNCj4gIAlzZC0+bWF4X2Fz
aWQgPSBjcHVpZF9lYngoU1ZNX0NQVUlEX0ZVTkMpIC0gMTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jDQo+IGluZGV4IDY0MTZl
ZDViN2Y4OS4uMzlkZDMwODJmY2Q4IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jDQo+ICsrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMNCj4gQEAgLTI3MTEsMTQgKzI3MTEs
MTYgQEAgc3RhdGljIGludCBzZXR1cF92bWNzX2NvbmZpZyhzdHJ1Y3Qgdm1jc19jb25maWcgKnZt
Y3NfY29uZiwNCj4gIA0KPiAgc3RhdGljIGJvb2wga3ZtX2lzX3ZteF9zdXBwb3J0ZWQodm9pZCkN
Cj4gIHsNCj4gKwlpbnQgY3B1ID0gcmF3X3NtcF9wcm9jZXNzb3JfaWQoKTsNCj4gKw0KPiAgCWlm
ICghY3B1X2hhc192bXgoKSkgew0KPiAtCQlwcl9lcnIoIkNQVSBkb2Vzbid0IHN1cHBvcnQgVk1Y
XG4iKTsNCj4gKwkJcHJfZXJyKCJWTVggbm90IHN1cHBvcnRlZCBieSBDUFUgJWRcbiIsIGNwdSk7
DQo+ICAJCXJldHVybiBmYWxzZTsNCj4gIAl9DQo+ICANCj4gIAlpZiAoIXRoaXNfY3B1X2hhcyhY
ODZfRkVBVFVSRV9NU1JfSUEzMl9GRUFUX0NUTCkgfHwNCj4gIAkgICAgIXRoaXNfY3B1X2hhcyhY
ODZfRkVBVFVSRV9WTVgpKSB7DQo+IC0JCXByX2VycigiVk1YIG5vdCBlbmFibGVkIChieSBCSU9T
KSBpbiBNU1JfSUEzMl9GRUFUX0NUTFxuIik7DQo+ICsJCXByX2VycigiVk1YIG5vdCBlbmFibGVk
IChieSBCSU9TKSBpbiBNU1JfSUEzMl9GRUFUX0NUTCBvbiBDUFUgJWRcbiIsIGNwdSk7DQo+ICAJ
CXJldHVybiBmYWxzZTsNCj4gIAl9DQo+ICANCj4gQEAgLTI3MjcsMTggKzI3MjksMjEgQEAgc3Rh
dGljIGJvb2wga3ZtX2lzX3ZteF9zdXBwb3J0ZWQodm9pZCkNCj4gIA0KPiAgc3RhdGljIGludCB2
bXhfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdCh2b2lkKQ0KPiAgew0KPiArCWludCBjcHUgPSByYXdf
c21wX3Byb2Nlc3Nvcl9pZCgpOw0KPiAgCXN0cnVjdCB2bWNzX2NvbmZpZyB2bWNzX2NvbmY7DQo+
ICAJc3RydWN0IHZteF9jYXBhYmlsaXR5IHZteF9jYXA7DQo+ICANCj4gIAlpZiAoIWt2bV9pc192
bXhfc3VwcG9ydGVkKCkpDQo+ICAJCXJldHVybiAtRUlPOw0KPiAgDQo+IC0JaWYgKHNldHVwX3Zt
Y3NfY29uZmlnKCZ2bWNzX2NvbmYsICZ2bXhfY2FwKSA8IDApDQo+ICsJaWYgKHNldHVwX3ZtY3Nf
Y29uZmlnKCZ2bWNzX2NvbmYsICZ2bXhfY2FwKSA8IDApIHsNCj4gKwkJcHJfZXJyKCJGYWlsZWQg
dG8gc2V0dXAgVk1DUyBjb25maWcgb24gQ1BVICVkXG4iLCBjcHUpOw0KPiAgCQlyZXR1cm4gLUVJ
TzsNCj4gKwl9DQo+ICAJaWYgKG5lc3RlZCkNCj4gIAkJbmVzdGVkX3ZteF9zZXR1cF9jdGxzX21z
cnMoJnZtY3NfY29uZiwgdm14X2NhcC5lcHQpOw0KPiAtCWlmIChtZW1jbXAoJnZtY3NfY29uZmln
LCAmdm1jc19jb25mLCBzaXplb2Yoc3RydWN0IHZtY3NfY29uZmlnKSkgIT0gMCkgew0KPiAtCQlw
cl9lcnIoIkNQVSAlZCBmZWF0dXJlIGluY29uc2lzdGVuY3khXG4iLCBzbXBfcHJvY2Vzc29yX2lk
KCkpOw0KPiArCWlmIChtZW1jbXAoJnZtY3NfY29uZmlnLCAmdm1jc19jb25mLCBzaXplb2Yoc3Ry
dWN0IHZtY3NfY29uZmlnKSkpIHsNCj4gKwkJcHJfZXJyKCJJbmNvbnNpc3RlbnQgVk1DUyBjb25m
aWcgb24gQ1BVICVkXG4iLCBjcHUpOw0KPiAgCQlyZXR1cm4gLUVJTzsNCj4gIAl9DQo+ICAJcmV0
dXJuIDA7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0v
eDg2LmMNCj4gaW5kZXggZWU5YWY0MTJmZmQ0Li41YTllNzRjZWRiYzYgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gveDg2L2t2bS94ODYuYw0KPiArKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMNCj4gQEAgLTEx
OTY3LDYgKzExOTY3LDExIEBAIGludCBrdm1fYXJjaF9oYXJkd2FyZV9lbmFibGUodm9pZCkNCj4g
IAlib29sIHN0YWJsZSwgYmFja3dhcmRzX3RzYyA9IGZhbHNlOw0KPiAgDQo+ICAJa3ZtX3VzZXJf
cmV0dXJuX21zcl9jcHVfb25saW5lKCk7DQo+ICsNCj4gKwlyZXQgPSBrdm1feDg2X2NoZWNrX3By
b2Nlc3Nvcl9jb21wYXRpYmlsaXR5KCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsN
Cj4gKw0KPiAgCXJldCA9IHN0YXRpY19jYWxsKGt2bV94ODZfaGFyZHdhcmVfZW5hYmxlKSgpOw0K
PiAgCWlmIChyZXQgIT0gMCkNCj4gIAkJcmV0dXJuIHJldDsNCg0K
