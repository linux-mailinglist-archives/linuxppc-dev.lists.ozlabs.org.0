Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F2C640754
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 14:00:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNtMr0DJjz3bgm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 00:00:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fFZbX6Ax;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fFZbX6Ax;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNtLs4Mcsz307C
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 23:59:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669985973; x=1701521973;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y57nduZJ/KnCsYoa25EcTNImNFv7hA7gbKPEVW0u2B8=;
  b=fFZbX6Ax4G8/JZGJf+RupiwE65tHZYeWG1jD90ou5ED17THaOrNOF3bY
   eIxgJ+A1ZQyZCkp5sLdtf0XqXzfDFmUSQlUuXC8L8vGKTct4wJ6Gc/5pm
   fP06ZZ2VPGNe4mEMgEgNtCkCPTowty/HVal5J4UVtoKYsVD4q8MVNQlqg
   Sh1I+A3L2Qi9MXzZBREequaRk8WBo9eu3wdcPAYNQGdnhp9h34+Y+ZICi
   J4kpVxzCrXzkSPK0sKCKsUpp02lc9KWMehTC//KwVROhDCyM+/C37zKKO
   ypPmUUdRkGKyhznuAHbBR3kHKdNN+4IZnQGDhTEAFFAX2KcYtwnpNyL/B
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="315974582"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="315974582"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 04:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="638744065"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="638744065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP; 02 Dec 2022 04:59:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 04:59:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 04:59:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 04:59:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ST7vJ6slVCnrTkS92Zj/FSz7aL3+bJB20/k0cZW4XErsgnSe5L80eG5MD7bU2W/ClvnXCLGsh9RMDKRSCSUwyMbFHH6zL2XJJWhZjDCUPdNkzP7dFVn+nBMPtKjXksyt02TDYX63mV+3D4wXqH/Xe9bIEXd3+TtcecQn39iG2Tgn5yDu7HUv8izQtjYjKy03ee+4mtyzSC2nznGNRiz+CG5KGYT6RmxXPTAQKh8CWtnf1ULKnWm/6T58L/ewVszYdJZ6/rSDUT8+CjqsGd+qdAaxjQFmWyeGet9EEGGLcncnytpFE8pv+Oa9Wrr+WYgsr5DLlxah4ragqaf1KqpQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y57nduZJ/KnCsYoa25EcTNImNFv7hA7gbKPEVW0u2B8=;
 b=La4d9ubClC1jAgz3B+Ie+xeXyUjf2s/tPKlmqCfuV+hWHJjKhuQMeKevSPGOqkJc8r+Mqs+usoKXCfKicaOvTS/yVsUOFTmeKi9f6vL3i6ZQ29Cx18/MaPLZ+Pix9bNc6XaxygxQg9lDPwV1QLO3e8ITFxSCduSho6vJYdxG1mZ/zAbtqq6+iiYBfKA0LhzY+H8C1MgDjxNiOlakclW9Ot7ykmrjFnjanfoUGXoXnyxVhz8gXa8wktZ83fqtExKBAHN53lZyXFitWrxaQsE2B+YLp3EZdnntB02rclMrdMqL/UtDS79YE8LEAdivDb/dYiucHlhelRe4EO3iGP2g1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by IA1PR11MB6394.namprd11.prod.outlook.com (2603:10b6:208:3ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 12:59:02 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 12:59:02 +0000
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
Subject: Re: [PATCH v2 42/50] KVM: Disable CPU hotplug during hardware
 enabling/disabling
Thread-Topic: [PATCH v2 42/50] KVM: Disable CPU hotplug during hardware
 enabling/disabling
Thread-Index: AQHZBREJrC/cMYL66UyZW4tPjPbYXq5akY8A
Date: Fri, 2 Dec 2022 12:59:02 +0000
Message-ID: <8b1053781e859aa95a08c10b0e8a06912a2b42a2.camel@intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-43-seanjc@google.com>
In-Reply-To: <20221130230934.1014142-43-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|IA1PR11MB6394:EE_
x-ms-office365-filtering-correlation-id: 502c7b12-9880-4a37-9254-08dad464fc66
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PeGKPdhdn9NEmZyXrYYhpPW+HYSwujBEj8H2bvWaUs6TE2lXQZ6PkM63ycyAo5YT5+b8QJ+62USGuMHEkGCfyUAM2Ha6Kn4sWRST5o6z5+zoHS8Nl767R3AlgeJqBRFKnriPNEkRJXhnCFFzres3TqvlgZUc8bfki+OQNXEPlUPYXnt06tm7mM0CR7mQ1YkrSeQ6IBQk1DFhqangs+RiEyPQt3we77wSQKyKxbsKC7FSVKQ/UQTMs6wLFQiNvTDm495w7n91ZcpLGuBERmQhXzTyX0EhNI8QoZNnM8oHMgbNa5TK2132WaAvmChnVMMOncl+dUKRq8m4i26OMFWWviTzyynlb+TzNFVL/lFJySeOYEDe+S+u9J3Fak5DlY9bT7z4I9ZbBhR1tpuEP5L3oEmPcebRq5WOHVhpYyK7AmwYOy1v9KBQhRgV7bE04hEmY5PqCZdh1Sy2McC74CCnzqGQXqsZJP84krRxhWnVS5/xmRJFdfuPN2BklUTjRS81LKppNHG4krDvl7JpiTA5GCZy5lJ3UovkxcUBLo73REZgUBqgUkuGdKU7Dvqp6vkMGqGRlX33OJr9+kxjIoWUcF7pmzYokMkZIYgAaXKfrxj6UYCynqjhM3ceayVOX7mDCv1JuWYBp4hOxWOIeLzeMlx72zOJ9pzPZT1secD4AxR0X1z8t/Pj1R7yXuW2+KLGFDVGPmL1bBOloqNEW9UjJ/DD4q6n8vRTpyYnWcvkLsc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(186003)(26005)(71200400001)(6506007)(64756008)(66476007)(8676002)(76116006)(66556008)(478600001)(107886003)(66446008)(6486002)(91956017)(66946007)(4326008)(2616005)(41300700001)(5660300002)(8936002)(7406005)(7416002)(83380400001)(2906002)(4001150100001)(38100700002)(122000001)(82960400001)(36756003)(6512007)(316002)(66899015)(86362001)(54906003)(110136005)(921005)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzRoUElXUFV1SzEzak5UMnNzamVsdzJTdW5sZlR3b1lGYnQ3alVWTlJEUHBn?=
 =?utf-8?B?RmUvRDNFYW0wTGZkak5lNHAzeTFMUUFUMHoxSFNsaExHRFVSSnZRanJHYkx0?=
 =?utf-8?B?TW1ubjVkQUpFajBGbzlwenR3Y1JkMDVGdVJjL1kxellkLzZDUzRYS29qNHZU?=
 =?utf-8?B?WDBqWWhRbzhlaVU1K0c1eDNuaEJZaWV2MjUzSkdDb0swZ1ZLZDY2R1pUUnlz?=
 =?utf-8?B?aDR4Q2hVZUV5eHQyTzc2bHNhRFJYTm0wNnk0REdpUE1DaCtKUmExZVE2SkRr?=
 =?utf-8?B?OWxMZDhtSUFLcVhpMUlSc2ZzZlkwMjhuQVRtUHBiRy8yVHowNXNxRnREZUNB?=
 =?utf-8?B?RjlLTmFGTXBxV004MlJJaFBxVTNtdkR3UUtueDJZQkt5VGxxazVHZjdKTGJW?=
 =?utf-8?B?SDZoaHN0bFRwSWMvcUpoeUV6b0h2TG9Xa3l6VHdZTTE4cm9nMElZOE5kNDM4?=
 =?utf-8?B?L0pWbVBRSGUwaVlUTzlkVy9oRWZYRWFuSVZtWGxZYk9Kc0xSRnBBYmtYL2FI?=
 =?utf-8?B?WEJFRk1NcUx0eDNCQWFHdDhISStkUXJ2eUw2cSt6T2k0NkxNMExrU0V1R1Js?=
 =?utf-8?B?MXI5Q1BQUzBpMjliRTk5NHVMR1N0eEN1ZGtYbSt1UDVkb0lnR0ZSL2N3SU9j?=
 =?utf-8?B?aXlhVnhEbWhIcHRSdkpPOFZ0RjY0NHUvQTNJc3FMenRhc25pYkhkNmlpdXho?=
 =?utf-8?B?aTJpdDl5QUtFN2E5Z29TMEw3YkxIZlFOSVlWUnFnUkpyMnV4aXhobjQxNXBR?=
 =?utf-8?B?YWVZNm9YazVrZ1N0c09KVzNwWnZOTHpEeFRGWHkyUzBYWm1GUHZhNDdiZ0U1?=
 =?utf-8?B?Y0lZMWdsVVpPVmt0OWk0V1JNeWRCOWlnK01qdTZiTXZjeGxHTUJDalJZWjk1?=
 =?utf-8?B?Tm4wRVh5STRld0VLdytqam1laDhzUVE2L1V3RDQ4RFFTWUd6enVjWEV5TU5o?=
 =?utf-8?B?ZTd6a0p5d3R6V0xmT1BFY0JZem1tOFRBQnErK0RPVG0xMDBUQWJOa1dCSUVX?=
 =?utf-8?B?S2NqQ2F0Zi9RbXVzazkvUTNGcWl3WDNCMC9RSkVDb2xzQStLY1BhcW9HTE1w?=
 =?utf-8?B?Z0ZPRUV4b2JUUWhqNUg2dXVrWDFjNjhhbDJQZjVXblJOemJBWDhTNDdZa05D?=
 =?utf-8?B?SFdyS1lZSkQ5ZFZpWG9iQXpGU0Q2M3NueWUwQlJTc3lOMEljYk05VzhhRjdI?=
 =?utf-8?B?MjdrY3JNZDJuR2JQZ2Y0dVJwZnRUdGxrakltb1dGQkNRSW5CcGp2UW5vL2lQ?=
 =?utf-8?B?d0dzZ3BtU3BrSW9qMmV4a0hvaG8zZEgyR0orZUs3Zk1hdlNiODAzbFVwMjJh?=
 =?utf-8?B?eVh1a1VhZktaTThHc05yQ3RVWmVFcXE4ZnRNM3hOcWFkb3ZDUTE5azJYL1E0?=
 =?utf-8?B?bWJhangvNi8yaWVHemZsb0J3TWFlZW9nQm9sM1NyV2NGTmlXUFp1VGNDUEJt?=
 =?utf-8?B?cjNlbGNvNkpPV09UMDZRdmRBTGlTdFUvTzIzY1E1S0JhVzdPV1JVT1JIL2Fl?=
 =?utf-8?B?ZTdoYjBmTlVneW1jdGtTK0ZiRzg4eXNkV2thVGdOQ2lzQWFKM2RsYllRZTFh?=
 =?utf-8?B?bnNwbUZ6dUpRUks2dTVaQzhPbnNHMEZkWG0zcElxZmhMeFBRTTFsNEdmUm5E?=
 =?utf-8?B?Um53aWY0ZllYVWkybGI2MGhOS2tVRWtXR0tPV0ZkZWZrZkVCR0gxQTJEZkhV?=
 =?utf-8?B?bmtJM3J0VUdIakx0N3hXQ2NmMk04WWFyTnBadFM5YnV2MEYzUmNYK3VPYU51?=
 =?utf-8?B?em1NWDhJTWRXRFpDaHNzRkJScWl4NXV4dmZNNkx2aW1QRE9LZ0F1Qm9RQVR5?=
 =?utf-8?B?Q1ZQQnBBVjlJZ2FqTHJBY1ZjdTNuRTBTWlpaRVFtQSs0VldBN1FGRTgydXZJ?=
 =?utf-8?B?ckxvNkE2QzQrVC95VzE0YklMMVZVUmU1T3oydE9SVDRId2ZuVW1xSmFTNGl2?=
 =?utf-8?B?TUpuNkZuZS9RRjVWN3Y4ZzF1Y2xOZjJ4YVFuelJ6TDNwdXZXNDFlVUxaYW1w?=
 =?utf-8?B?VUV4b0hkWVJRLy9DNTZtQTRiaGpGSGFMTGJDN0U4UlAyRWhFWC94TVU0QlpC?=
 =?utf-8?B?VXRZOVRCSkQrdGZ4SUVuNUQrRU1BL2MzallYc2hPTW5zL3RCNFNvZXdYRzZ5?=
 =?utf-8?B?c1BnWnVQbncwL2VjY29zNGRDTzBpbEcwd2hhYUQvOGR2L2hiTWNLa2hXNkdZ?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C396E37D994CC4CA9103DAD20883EAD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502c7b12-9880-4a37-9254-08dad464fc66
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 12:59:02.2588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2rjsNgdpw4MaFE4mt1ix9UHTIUKI8sSXwA81n3LkH9NsxPOfxwgwsqIFU4AjF6r25IcvPJmhd5Um0ddBD+WSVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6394
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
b3RlOg0KPiBGcm9tOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPg0KPiANCj4gRGlzYWJs
ZSBDUFUgaG90cGx1ZyB3aGVuIGVuYWJsaW5nL2Rpc2FibGluZyBoYXJkd2FyZSB0byBwcmV2ZW50
IHRoZQ0KPiBjb3JuZXIgY2FzZSB3aGVyZSBpZiB0aGUgZm9sbG93aW5nIHNlcXVlbmNlIG9jY3Vy
czoNCj4gDQo+ICAgMS4gQSBob3RwbHVnZ2VkIENQVSBtYXJrcyBpdHNlbGYgb25saW5lIGluIGNw
dV9vbmxpbmVfbWFzaw0KPiAgIDIuIFRoZSBob3RwbHVnZ2VkIENQVSBlbmFibGVzIGludGVycnVw
dCBiZWZvcmUgaW52b2tpbmcgS1ZNJ3MgT05MSU5FDQo+ICAgICAgY2FsbGJhY2sNCj4gICAzICBo
YXJkd2FyZV97ZW4sZGlzfWFibGVfYWxsKCkgaXMgaW52b2tlZCBvbiBhbm90aGVyIENQVQ0KPiAN
Cj4gdGhlIGhvdHBsdWdnZWQgQ1BVIHdpbGwgYmUgaW5jbHVkZWQgaW4gb25fZWFjaF9jcHUoKSBh
bmQgdGh1cyBnZXQgc2VudA0KPiB0aHJvdWdoIGhhcmR3YXJlX3tlbixkaXN9YWJsZV9ub2xvY2so
KSBiZWZvcmUga3ZtX29ubGluZV9jcHUoKSBpcyBjYWxsZWQuDQoNClNob3VsZCB3ZSBleHBsaWNp
dGx5IGNhbGwgb3V0IHdoYXQgaXMgdGhlIGNvbnNlcXVlbmNlIG9mIHN1Y2ggY2FzZSwgb3RoZXJ3
aXNlDQppdCdzIGhhcmQgdG8gdGVsbCB3aGV0aGVyIHRoaXMgdHJ1bHkgaXMgYW4gaXNzdWU/DQoN
CklJVUMsIHNpbmNlIG5vdyB0aGUgY29tcGF0aWJpbGl0eSBjaGVjayBoYXMgYWxyZWFkeSBiZWVu
IG1vdmVkIHRvDQprdm1fYXJjaF9oYXJkd2FyZV9lbmFibGUoKSwgdGhlIGNvbnNlcXVlbmNlIGlz
IGhhcmR3YXJlX2VuYWJsZV9hbGwoKSB3aWxsIGZhaWwNCmlmIHRoZSBub3cgb25saW5lIGNwdSBp
c24ndCBjb21wYXRpYmxlLCB3aGljaCB3aWxsIHJlc3VsdHMgaW4gZmFpbGluZyB0byBjcmVhdGUN
CnRoZSBmaXJzdCBWTS4gIFRoaXMgaXNuJ3QgaWRlYWwgc2luY2UgdGhlIGluY29tcGF0aWJsZSBj
cHUgc2hvdWxkIGJlIHJlamVjdGVkIHRvDQpnbyBvbmxpbmUgaW5zdGVhZC4NCg0KPiANCj4gICAg
ICAgICBzdGFydF9zZWNvbmRhcnkgeyAuLi4NCj4gICAgICAgICAgICAgICAgIHNldF9jcHVfb25s
aW5lKHNtcF9wcm9jZXNzb3JfaWQoKSwgdHJ1ZSk7IDwtIDENCj4gICAgICAgICAgICAgICAgIC4u
Lg0KPiAgICAgICAgICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOyAgPC0gMg0KPiAgICAgICAg
ICAgICAgICAgLi4uDQo+ICAgICAgICAgICAgICAgICBjcHVfc3RhcnR1cF9lbnRyeShDUFVIUF9B
UF9PTkxJTkVfSURMRSk7IDwtIDMNCj4gICAgICAgICB9DQo+IA0KPiBLVk0gY3VycmVudGx5IGZ1
ZGdlcyBhcm91bmQgdGhpcyByYWNlIGJ5IGtlZXBpbmcgdHJhY2sgb2Ygd2hpY2ggQ1BVcyBoYXZl
DQo+IGRvbmUgaGFyZHdhcmUgZW5hYmxpbmcgKHNlZSBjb21taXQgMWI2YzAxNjgxOGE1ICJLVk06
IEtlZXAgdHJhY2sgb2Ygd2hpY2gNCj4gY3B1cyBoYXZlIHZpcnR1YWxpemF0aW9uIGVuYWJsZWQi
KSwgYnV0IHRoYXQncyBhbiBpbmVmZmljaWVudCwgY29udm9sdXRlZCwNCj4gYW5kIGhhY2t5IHNv
bHV0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNv
bT4NCj4gW3NlYW46IHNwbGl0IHRvIHNlcGFyYXRlIHBhdGNoLCB3cml0ZSBjaGFuZ2Vsb2ddDQo+
IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPg0K
PiAtLS0NCj4gIGFyY2gveDg2L2t2bS94ODYuYyAgfCAxMSArKysrKysrKysrLQ0KPiAgdmlydC9r
dm0va3ZtX21haW4uYyB8IDEyICsrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
a3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jDQo+IGluZGV4IGRhZDMwMDk3ZjBjMy4uZDJh
ZDM4M2RhOTk4IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMNCj4gKysrIGIvYXJj
aC94ODYva3ZtL3g4Ni5jDQo+IEBAIC05MjgxLDcgKzkyODEsMTYgQEAgc3RhdGljIGlubGluZSB2
b2lkIGt2bV9vcHNfdXBkYXRlKHN0cnVjdCBrdm1feDg2X2luaXRfb3BzICpvcHMpDQo+ICANCj4g
IHN0YXRpYyBpbnQga3ZtX3g4Nl9jaGVja19wcm9jZXNzb3JfY29tcGF0aWJpbGl0eSh2b2lkKQ0K
PiAgew0KPiAtCXN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjcHVfZGF0YShzbXBfcHJvY2Vzc29y
X2lkKCkpOw0KPiArCWludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7DQo+ICsJc3RydWN0IGNw
dWluZm9feDg2ICpjID0gJmNwdV9kYXRhKGNwdSk7DQo+ICsNCj4gKwkvKg0KPiArCSAqIENvbXBh
dGliaWxpdHkgY2hlY2tzIGFyZSBkb25lIHdoZW4gbG9hZGluZyBLVk0gYW5kIHdoZW4gZW5hYmxp
bmcNCj4gKwkgKiBoYXJkd2FyZSwgZS5nLiBkdXJpbmcgQ1BVIGhvdHBsdWcsIHRvIGVuc3VyZSBh
bGwgb25saW5lIENQVXMgYXJlDQo+ICsJICogY29tcGF0aWJsZSwgaS5lLiBLVk0gc2hvdWxkIG5l
dmVyIHBlcmZvcm0gYSBjb21wYXRpYmlsaXR5IGNoZWNrIG9uDQo+ICsJICogYW4gb2ZmbGluZSBD
UFUuDQo+ICsJICovDQo+ICsJV0FSTl9PTighY3B1X29ubGluZShjcHUpKTsNCg0KSU1ITyB0aGlz
IGNodW5rIGxvZ2ljYWxseSBzaG91bGQgYmVsb25nIHRvIHByZXZpb3VzIHBhdGNoLiAgSUlVQyBk
aXNhYmxpbmcgQ1BVDQpob3RwbHVnIGR1cmluZyBoYXJkd2FyZV9lbmFibGVfYWxsKCkgZG9lc24n
dCBoYXZlIHJlbGF0aW9uc2hpcCB0byB0aGlzIFdBUk4oKS4NCg0KPiAgDQo+ICAJaWYgKF9fY3I0
X3Jlc2VydmVkX2JpdHMoY3B1X2hhcywgYykgIT0NCj4gIAkgICAgX19jcjRfcmVzZXJ2ZWRfYml0
cyhjcHVfaGFzLCAmYm9vdF9jcHVfZGF0YSkpDQo+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1f
bWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYw0KPiBpbmRleCBmMjZlYTc3OTcxMGEuLmQ5ODVi
MjRjNDIzYiAxMDA2NDQNCj4gLS0tIGEvdmlydC9rdm0va3ZtX21haW4uYw0KPiArKysgYi92aXJ0
L2t2bS9rdm1fbWFpbi5jDQo+IEBAIC01MDk4LDE1ICs1MDk4LDI2IEBAIHN0YXRpYyB2b2lkIGhh
cmR3YXJlX2Rpc2FibGVfYWxsX25vbG9jayh2b2lkKQ0KPiAgDQo+ICBzdGF0aWMgdm9pZCBoYXJk
d2FyZV9kaXNhYmxlX2FsbCh2b2lkKQ0KPiAgew0KPiArCWNwdXNfcmVhZF9sb2NrKCk7DQo+ICAJ
cmF3X3NwaW5fbG9jaygma3ZtX2NvdW50X2xvY2spOw0KPiAgCWhhcmR3YXJlX2Rpc2FibGVfYWxs
X25vbG9jaygpOw0KPiAgCXJhd19zcGluX3VubG9jaygma3ZtX2NvdW50X2xvY2spOw0KPiArCWNw
dXNfcmVhZF91bmxvY2soKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGludCBoYXJkd2FyZV9lbmFi
bGVfYWxsKHZvaWQpDQo+ICB7DQo+ICAJaW50IHIgPSAwOw0KPiAgDQo+ICsJLyoNCj4gKwkgKiBX
aGVuIG9ubGluaW5nIGEgQ1BVLCBjcHVfb25saW5lX21hc2sgaXMgc2V0IGJlZm9yZSBrdm1fb25s
aW5lX2NwdSgpDQo+ICsJICogaXMgY2FsbGVkLCBhbmQgc28gb25fZWFjaF9jcHUoKSBiZXR3ZWVu
IHRoZW0gaW5jbHVkZXMgdGhlIENQVSB0aGF0DQo+ICsJICogaXMgYmVpbmcgb25saW5lZC4gIEFz
IGEgcmVzdWx0LCBoYXJkd2FyZV9lbmFibGVfbm9sb2NrKCkgbWF5IGdldA0KPiArCSAqIGludm9r
ZWQgYmVmb3JlIGt2bV9vbmxpbmVfY3B1KCksIHdoaWNoIGFsc28gZW5hYmxlcyBoYXJkd2FyZSBp
ZiB0aGUNCj4gKwkgKiB1c2FnZSBjb3VudCBpcyBub24temVyby4gIERpc2FibGUgQ1BVIGhvdHBs
dWcgdG8gYXZvaWQgYXR0ZW1wdGluZyB0bw0KPiArCSAqIGVuYWJsZSBoYXJkd2FyZSBtdWx0aXBs
ZSB0aW1lcy4NCg0KSXQgd29uJ3QgZW5hYmxlIGhhcmR3YXJlIG11bHRpcGxlIHRpbWVzLCByaWdo
dD8gIFNpbmNlIGhhcmR3YXJlX2VuYWJsZV9ub2xvY2soKQ0KaGFzIGJlbG93IGNoZWNrOg0KDQog
ICAgICAgIGlmIChjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgY3B1c19oYXJkd2FyZV9lbmFibGVkKSkg
ICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgcmV0dXJuOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgY3B1bWFza19zZXRfY3B1KGNwdSwgY3B1
c19oYXJkd2FyZV9lbmFibGVkKTsgICAgIA0KDQpJSVVDIHRoZSBvbmx5IGlzc3VlIGlzIHRoZSBv
bmUgdGhhdCBJIHJlcGxpZWQgaW4gdGhlIGNoYW5nZWxvZy4NCg0KT3IgcGVyaGFwcyBJIGFtIG1p
c3Npbmcgc29tZXRoaW5nPw0KDQo+ICsJICovDQo+ICsJY3B1c19yZWFkX2xvY2soKTsNCj4gIAly
YXdfc3Bpbl9sb2NrKCZrdm1fY291bnRfbG9jayk7DQo+ICANCj4gIAlrdm1fdXNhZ2VfY291bnQr
KzsNCj4gQEAgLTUxMjEsNiArNTEzMiw3IEBAIHN0YXRpYyBpbnQgaGFyZHdhcmVfZW5hYmxlX2Fs
bCh2b2lkKQ0KPiAgCX0NCj4gIA0KPiAgCXJhd19zcGluX3VubG9jaygma3ZtX2NvdW50X2xvY2sp
Ow0KPiArCWNwdXNfcmVhZF91bmxvY2soKTsNCj4gIA0KPiAgCXJldHVybiByOw0KPiAgfQ0KDQo=
