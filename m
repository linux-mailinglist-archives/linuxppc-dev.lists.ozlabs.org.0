Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E05E299653
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 19:59:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKkfG50MbzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 05:59:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=CNt2PJpH; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKkc55G6PzDqGN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 05:57:40 +1100 (AEDT)
IronPort-SDR: wzhuIfVtv+ccLtiHO9/QzxL4XpmICg3rM2b8q+OJ1HZ3V8zn5IDOVu82RSv/Wxqz5cD3u417Cf
 lBOr2N3G6dLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="147256362"
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="147256362"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 11:57:36 -0700
IronPort-SDR: kDCuGF/INurHLzkGxp1atk6PecmLBn+41125sYA6Q4z690BfomjRZkbSkFslIQU4FbWDNQy8SR
 hMAuuCKdljbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="361099020"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 26 Oct 2020 11:57:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 11:57:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 11:57:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Oct 2020 11:57:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 26 Oct 2020 11:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRtcACMT18VEnjz5dQkzdP9yk8z4iGtrnCS5VScWmhATTM/DBgoNGeRA2xaEpZMToTX38H6JqIcrlhV3P9T5KtSqHQDULXRDmLmVsvKCMza4708Wj/xhUmb+GqAjLpX5sSLTLgJD63VFDF7iZVJjGuo5YX9lowV0C5UEZdr11hbDmhYmbEBX6J7umyur2ewrLhCN2v0IgwhqaGzH3ulhTUe2hmcFMCUFYd2DFCy6clFJvQ0dU8ttdLDnsccnkeZB1AaVT8odD6yuUb3nQ8DDneXcwktwJoS6qqPtIbOEWCbgLJt1p4oKGrZeVz9ReSyPN0rbA44BI0QIq0xr3BxRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT/jmZB+JeNW9FSro3Zu1DhxjPqZtbl1rGi0ooZOMnY=;
 b=hqwrYaHKk2Eus3utHyYsdXAmPWEibzmLZBwpiKeF9rOWvqaieXUzL2THop+AbiJRVw4JnImeHGZoW361kiS0Z1kqQstI75v9daT8Zxgk/0H97TxM7Bm3rN8SSAZdkDttaMCWK21NJ9Swqm9BbeXig/OAgSxmTm8FzyVZWIj6xMYlyV7giJFEMD+xOdVcHFLWHD5+P3cmcrDXxtvvdq8RAMG50UQFxyVg9NHRNNFZk7VNqoJc2BSOUKmPpBF13J8U2Dz8Q1n5Mdfs9NhaXC2SYDtmwp+gdYtYQN+5261pBY11mLwexBjTlgu4RaZD6JBkEtY7xDTfbIxv/FeLi1Li3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT/jmZB+JeNW9FSro3Zu1DhxjPqZtbl1rGi0ooZOMnY=;
 b=CNt2PJpHMNccCX8emcaKNwstcrNWJNuoOsjMVCdQA/8OzUDsVa3ZfUeMFsGiq90B4G/PUysEDYx59me+g8b+oWfZ3Ey6WzIBmuVPzF6gWaLtFtG1iriEShwaP1X/Fu1HOkpgyB1msqz4qsfFN/ujGdJxnkAFrsxbyMC1rDg0hSE=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB2670.namprd11.prod.outlook.com (2603:10b6:805:61::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 26 Oct
 2020 18:57:33 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 18:57:33 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmpCzYAgACQkACAAKKAgA==
Date: Mon, 26 Oct 2020 18:57:32 +0000
Message-ID: <a28d8248057e7dc01716764da9edfd666722ff62.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <f20900a403bea9eb3f0814128e5ea46f6580f5a5.camel@intel.com>
 <20201026091554.GB1154158@kernel.org>
In-Reply-To: <20201026091554.GB1154158@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ff5ae49-7b36-4024-8d5d-08d879e0fefc
x-ms-traffictypediagnostic: SN6PR11MB2670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2670258C5426027F170B537DC9190@SN6PR11MB2670.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gbW+iMo/Bs82ZT7ywfNN/D9qUA2XLqXil+b1CHYx05cm2iGVWywoMc5gq9B3sBg0JvowexS4GirlAOJECkMFYKxdk2b7RGdhJfhC+I7/svp/pGrOsr1UHXmhxCuJP2+Y0i11oA4b2WgrFheOLWdvdqQKNrdo0mFE1MyUv5ms0MfUS7jsycLluESb8IKMKR6PHtS6j2Fy3qvF+lvH3r7bua+1Yw82EmIUimxU5HjzZMGY+Zd/qkUxu3yE4FH6JA6F2W463PzGndBfIbeIEUY6K4Ait98fjJVHMPYiAlopkA1A/nZscj8s3sK1YQbueETL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(86362001)(4001150100001)(6506007)(6486002)(6916009)(26005)(8676002)(6512007)(7406005)(8936002)(2616005)(36756003)(186003)(7416002)(2906002)(91956017)(76116006)(71200400001)(478600001)(5660300002)(66476007)(64756008)(66946007)(66446008)(54906003)(83380400001)(66556008)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5pN9ujDgUJvGEnb/4+6QgHpP2B/+8qA3Z15GD2rPS0Ou8DOVUM0mqvY8e9cqYFH79erItZ2GG3ssxp0aAjSO/3Y8NtfJPL+2vasb2h44DkldhDOo+nlhDTIjjfifbMMJT6hnrjZogFabZAU+y47SEQ0cOvKERI0upc6FOJw2RCLH44PAeRoA5Y+Rpw8JL3iyS+mGlYgV63R/YnDyMyg/uaT2kL11xCMmyzJwVYYlaAlzBmZnj104ZEqevUkEZjTTgt09l/le8D8GRWCcvjdBm4QOnAYsDy07EQCxp1xE7CWq1mr5JMzybNptakNfI2hT5GT9ukL1DmcHo0USfqQ5g37qN90yjEy8BR58CGydmZ3eBPFI+NXSJmaLSXIYTSpSPQ4JfJmXwb70Ne8HDLg6vEjH+LsfZJaQmAhT6uG+U6ESJXlrmb7xK5BDLS1I9I/f6Av1CRhLcwc4vfQgSvwcYUIon43vdR0a9QoJTzuxt9xIkpCQ1YwJp7inuEhuy4RdRMv3z4ve9klTHwaWiBLDnRnfKqc0FFEwDhmSt5NKmVGBug4y7HaZVO4muZXUtMbUCw5rdLear6YeR10qJCygRta6hXxMVru+PfzKWec7iqjfXEVTifMHRt1d94WB+6rUTO8cyuxAhzu6jeDpTjPCIg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C54C396FD8B75148BC4BDCFF5A414CD9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff5ae49-7b36-4024-8d5d-08d879e0fefc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 18:57:32.9485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJEotTFxYRcT5AhVWylIGfgF/JtWN8OP/KguE9Q+/4woG0+Dq3ohn9pjeth1BF3Gf0wEPYPnJ8SFUeYMKgvoj1W2/UA/ZzcQhJ/ZWz7+RnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2670
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
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
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

T24gTW9uLCAyMDIwLTEwLTI2IGF0IDExOjE1ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAyNiwgMjAyMCBhdCAxMjozODozMkFNICswMDAwLCBFZGdlY29tYmUsIFJp
Y2sgUCB3cm90ZToNCj4gPiBPbiBTdW4sIDIwMjAtMTAtMjUgYXQgMTI6MTUgKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgd3JvdGU6DQo+ID4gPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4Lmli
bS5jb20+DQo+ID4gPiANCj4gPiA+IFdoZW4gREVCVUdfUEFHRUFMTE9DIG9yIEFSQ0hfSEFTX1NF
VF9ESVJFQ1RfTUFQIGlzIGVuYWJsZWQgYSBwYWdlDQo+ID4gPiBtYXkNCj4gPiA+IGJlDQo+ID4g
PiBub3QgcHJlc2VudCBpbiB0aGUgZGlyZWN0IG1hcCBhbmQgaGFzIHRvIGJlIGV4cGxpY2l0bHkg
bWFwcGVkDQo+ID4gPiBiZWZvcmUNCj4gPiA+IGl0DQo+ID4gPiBjb3VsZCBiZSBjb3BpZWQuDQo+
ID4gPiANCj4gPiA+IE9uIGFybTY0IGl0IGlzIHBvc3NpYmxlIHRoYXQgYSBwYWdlIHdvdWxkIGJl
IHJlbW92ZWQgZnJvbSB0aGUNCj4gPiA+IGRpcmVjdA0KPiA+ID4gbWFwDQo+ID4gPiB1c2luZyBz
ZXRfZGlyZWN0X21hcF9pbnZhbGlkX25vZmx1c2goKSBidXQgX19rZXJuZWxfbWFwX3BhZ2VzKCkN
Cj4gPiA+IHdpbGwNCj4gPiA+IHJlZnVzZQ0KPiA+ID4gdG8gbWFwIHRoaXMgcGFnZSBiYWNrIGlm
IERFQlVHX1BBR0VBTExPQyBpcyBkaXNhYmxlZC4NCj4gPiANCj4gPiBJdCBsb29rcyB0byBtZSB0
aGF0IGFybTY0IF9fa2VybmVsX21hcF9wYWdlcygpIHdpbGwgc3RpbGwgYXR0ZW1wdA0KPiA+IHRv
DQo+ID4gbWFwIGl0IGlmIHJvZGF0YV9mdWxsIGlzIHRydWUsIGhvdyBkb2VzIHRoaXMgaGFwcGVu
Pw0KPiANCj4gVW5sZXNzIEkgbWlzcmVhZCB0aGUgY29kZSwgYXJtNjQgcmVxdWlyZXMgYm90aCBy
b2RhdGFfZnVsbCBhbmQNCj4gZGVidWdfcGFnZWFsbG9jX2VuYWJsZWQoKSB0byBiZSB0cnVlIGZv
ciBfX2tlcm5lbF9tYXBfcGFnZXMoKSB0byBkbw0KPiBhbnl0aGluZy4NCj4gQnV0IHJvZGF0YV9m
dWxsIGNvbmRpdGlvbiBhcHBsaWVzIHRvIHNldF9kaXJlY3RfbWFwXypfbm9mbHVzaCgpIGFzDQo+
IHdlbGwsDQo+IHNvIHdpdGggIXJvZGF0YV9mdWxsIHRoZSBsaW5lYXIgbWFwIHdvbid0IGJlIGV2
ZXIgY2hhbmdlZC4NCg0KSG1tLCBsb29rcyB0byBtZSB0aGF0IF9fa2VybmVsX21hcF9wYWdlcygp
IHdpbGwgb25seSBza2lwIGl0IGlmIGJvdGgNCmRlYnVnIHBhZ2VhbGxvYyBhbmQgcm9kYXRhX2Z1
bGwgYXJlIGZhbHNlLg0KDQpCdXQgbm93IEknbSB3b25kZXJpbmcgaWYgbWF5YmUgd2UgY291bGQg
c2ltcGxpZnkgdGhpbmdzIGJ5IGp1c3QgbW92aW5nDQp0aGUgaGliZXJuYXRlIHVubWFwcGVkIHBh
Z2UgbG9naWMgb2ZmIG9mIHRoZSBkaXJlY3QgbWFwLiBPbiB4ODYsDQp0ZXh0X3Bva2UoKSB1c2Vk
IHRvIHVzZSB0aGlzIHJlc2VydmVkIGZpeG1hcCBwdGUgdGhpbmcgdGhhdCBpdCBjb3VsZA0KcmVs
eSBvbiB0byByZW1hcCBtZW1vcnkgd2l0aC4gSWYgaGliZXJuYXRlIGhhZCBzb21lIHNlcGFyYXRl
IHB0ZSBmb3INCnJlbWFwcGluZyBsaWtlIHRoYXQsIHRoZW4gd2UgY291bGQgbm90IGhhdmUgYW55
IGRpcmVjdCBtYXAgcmVzdHJpY3Rpb25zDQpjYXVzZWQgYnkgaXQva2VybmVsX21hcF9wYWdlcygp
LCBhbmQgaXQgd291bGRuJ3QgaGF2ZSB0byB3b3JyeSBhYm91dA0KcmVseWluZyBvbiBhbnl0aGlu
ZyBlbHNlLg0K
