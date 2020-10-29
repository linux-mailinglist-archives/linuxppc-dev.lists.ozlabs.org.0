Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD729F90F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:25:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMhQ83HYJzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 10:25:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=GkUuVOQ3; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMhH94WmrzDqVr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 10:19:49 +1100 (AEDT)
IronPort-SDR: gPeMYKBRdU4wZqoxW03E/wnSJcseerG4PyLUjwFomx/Dmae/wA0S5mc/q/KXJf6S+53M/j6KGu
 CS3FeXBGkVtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="230165736"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="230165736"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 16:19:47 -0700
IronPort-SDR: D4G3AykV9+EjYWZ+eBTCelU68pXmX3Imr666vTOed1NPp2IoUNJN+Q54a0RrucK9LQ3UMwb+qA
 UQwp0UDCXxCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="361665330"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2020 16:19:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Oct 2020 16:19:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 29 Oct 2020 16:19:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 29 Oct 2020 16:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+gMr3M3X/7LaUKGHr9SoZfV0LvqAV6J/fkohpMyLWHk1M9f8PFB68EKla6YyhTTFTDqXOQsybOMjap5tpVZj2obHPUZt58Xge89S1rUhJj7ua260aSlcSN8iMlBgwmVkWL04VWMezAEhVZVp506NPhRBCrCcekACmkV2DcJlbsr9KWtW5CBXzs1AfI9gwWGQ7IMNwn4vG3vjqzQZ82Z+7TePEOKqq2S3P+6cTy3FLKsxc1Wlzc3KJHeJrlbWvLROYQhjq288BS4Z3yn+ulovTYksxNNArfKDFZy94P2S5anWkViIi/dw8DB42xA5mieZLy29wCx8F9niSjDoy5LXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO7AP/YWx4yE/ZTLqLUmiveJg6xTIWuAOwHJzfq/m4k=;
 b=SDvfwC4WYCuYWuD9QpSqfzopxd9XP5SonRMoUxpoZKRwPq/mqbjQrYif/gpGTa3MQkfjxW/Ks3jIJkTpJemnARgws7Mxh/6Awk1z8MZ5ZcDSuthHGeF7zdCeBFPNRYadsL7P0ddGGKOY7WAnVTZM9Xj5ymc1EisNDE3/MLVJc+rJgQ8Gnlqpp5Sis0SO7sjd5bf5I+vnXWldslFQLXoGPylQqBe11T/DD/uXqJd1cCjjSDRP53+wfYm3R1kCivgpzxUfCNaHzKN/JZYuizArgHJmL3E/FMbKgvFylMOnJ0kLeRTUH+w420BumK60mgpvCzIY+JjrDNyOsLZcp4Cvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO7AP/YWx4yE/ZTLqLUmiveJg6xTIWuAOwHJzfq/m4k=;
 b=GkUuVOQ34PnV4LHx1XpHjKNV26OwBWeg/YYEp/L5DYWYkHkPrTCHwQDOq4VYTDWvBwLdWEGOzSlLmvO4A9txeCsCo5LBNe3FATNLa09P25I6MkejWL8xw5DZLvuJRN+FmG/tKYZCPrE8qBcV+qAHdij8yOARtY/iLhZkrwsQu4k=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 29 Oct
 2020 23:19:45 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 23:19:45 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "will@kernel.org" <will@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Topic: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Index: AQHWqrf3SYgZeORHqEa1kMKSitw9UKmpFReAgACDwgCAAJbiAIAA89wAgAG/kwCAAAMDgIAAn/WAgAC65YCAAP2BAA==
Date: Thu, 29 Oct 2020 23:19:45 +0000
Message-ID: <b519c0cec8ad8e67d7a43251e45e49d17d5cfbef.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <20201028112011.GB27927@willie-the-truck>
 <20201028113059.GG1428094@kernel.org>
 <9e77d0a939eda3029d6ae89bd14d7f1465b0559d.camel@intel.com>
 <20201029081225.GK1428094@kernel.org>
In-Reply-To: <20201029081225.GK1428094@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.54.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f65f7f7-55f0-4d82-05d6-08d87c611f80
x-ms-traffictypediagnostic: SA2PR11MB5082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50829B8CB5C7FB54955A759CC9140@SA2PR11MB5082.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qymfxompgOrWzlro/sMPTGY9YJVX1DwlGdD/d46SzbnToKutCQB8Eh+wpcTKgI5jqZnCFiFujFALoc3TsOGx6J6+TSTsmwZjVH+hdYNEavYMOiefPyFSpP3tmYgvUGmWWdEt+cS4pZflGu4Z3Yb4pnanhJAZchYgVEKgPsR1baMpxCOMglQOhh0esOlWs/Uhg4FJ2f4y52Nrk4V9stKWnqp1bhG04M4pwPKC0IlJlU0yi5U0algzd2zV6PuvgFXwvqDlI8ykLre5FV0h14pnneEhR6aXut60IQ0u1B/NupQqFmxqdhppKM3r7jdQsdRc72SDvc+Oa7cM21PSR1cCxg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(66556008)(66476007)(64756008)(4326008)(4001150100001)(36756003)(86362001)(2616005)(26005)(5660300002)(8676002)(316002)(66446008)(110136005)(76116006)(6506007)(91956017)(186003)(71200400001)(6486002)(478600001)(7416002)(4744005)(8936002)(7406005)(2906002)(66946007)(6512007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: p9rsUQY8foFuX6RZTf1VRl5EiYnCU2DJXadVx/RRJnVW+thy97FwnRc+6yOO4nqUTRfxjLVA5pHQ8hauiaReSs9W9VKiyQ30BDtc76+BdoB4xDeOscsVX3dpcVqdGhwWh7Q8cHnozmypfWXCPMNmOsneGGwFOsoA2Bywj+r/wniXdMPcWFkJqp4DJXBOxFtvcUb7FPrF7CDEOMEJONVcdcTC7EiiMW13+GgOaO63UNg3dXWBo7UvVKUhNI+kt9bv6kLlWkyvTFOAzuKVZZrvkwW4UI1Te7zthzFvTBaQGEaujKFprCZQ/uWKJK0yS2/YbmKnzEpH09Qyng5RuM2gOXN7FCO1dPLuXFmb40j8Y98wTzbE435TvG6T5N0PMWL3ExHnsQDIEttNjN24AijOtDI3yiM878zF47mT5zTzPc6FK5Jog+TFaBdZH6EjZsXx8p4f6rzHfulZaWD3z6BkNaYcPeBfsF+VLlRsj/IBs6epACMqJIQJGcQAagnuE2YhRM2N1H38lA6rfISji+E0M3V5wYgbpCinAth4+mFB5m27FhEe14I2hMdjDGnZS4TnShpKAp1ag+uueon/wLKk25jpHgCuA8uCfnrbmHYKqSjmSaEZZjloc3Ei2XP86Hf+m3WQ7DJAc4x5ToYGJkUdww==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A24A2063217BB643B1E13F94317ED6B9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f65f7f7-55f0-4d82-05d6-08d87c611f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 23:19:45.4071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +RcybrvbdhfunvXnqzm9lKtFLhZ9fAWekAHNXbChfa/6Xd/oGhaT1uEOVEObC861XIEEZsuH/OpGoKidyGhe+V9iidyz2SzuQeVKEkgCaLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
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
Cc: "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIwLTEwLTI5IGF0IDEwOjEyICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBUaGlzIHNlcmllcyBnb2FsIHdhcyBwcmltYXJpbHkgdG8gc2VwYXJhdGUgZGVwZW5kaW5jaWVz
IGFuZCBtYWtlIGl0DQo+IGNsZWFyZXIgd2hhdCBERUJVR19QQUdFQUxMT0MgYW5kIHdoYXQgU0VU
X0RJUkVDVF9NQVAgYXJlLiBBcyBpdA0KPiB0dXJuZWQNCj4gb3V0LCB0aGVyZSBpcyBhbHNvIHNv
bWUgbGFjayBvZiBjb25zaXN0ZW5jeSBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMNCj4gdGhhdA0KPiBp
bXBsZW1lbnQgZWl0aGVyIG9mIHRoaXMgc28gSSB0cmllZCB0byBpbXByb3ZlIHRoaXMgYXMgd2Vs
bC4NCj4gDQo+IEhvbmVzdGx5LCBJIGRvbid0IGtub3cgaWYgYSB0aHJlYWQgY2FuIGJlIHBhdXNl
ZCBhdCB0aGUgdGltZQ0KPiBfX3Z1bm1hcCgpDQo+IGxlZnQgaW52YWxpZCBwYWdlcywgYnV0IGl0
IGNvdWxkLCB0aGVyZSBpcyBhbiBpc3N1ZSBvbiBhcm02NCB3aXRoDQo+IERFQlVHX1BBR0VBTExP
Qz1uIGFuZCB0aGlzIHNldCBmaXhlcyBpdC4NCg0KQWgsIG9rLiBTbyBmcm9tIHRoaXMgYW5kIHRo
ZSBvdGhlciB0aHJlYWQsIHRoaXMgaXMgYWJvdXQgdGhlIGxvZ2ljIGluDQphcm0ncyBjcGEgZm9y
IHdoZW4gaXQgd2lsbCB0cnkgdGhlIHVuL21hcCBvcGVyYXRpb25zLiBJIHRoaW5rIHRoZSBsb2dp
Yw0KYWN0dWFsbHkgd29ya3MgY3VycmVudGx5LiBBbmQgdGhpcyBzZXJpZXMgaW50cm9kdWNlcyBh
IHByb2JsZW0gb24gQVJNDQpzaW1pbGFyIHRvIHRoZSBvbmUgeW91IGFyZSBzYXlpbmcgcHJlZXhp
c3RzLiBJIHB1dCB0aGUgZGV0YWlscyBpbiB0aGUNCm90aGVyIHRocmVhZC4NCg0K
