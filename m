Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1715229D17B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 19:33:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLxzC1JnMzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 05:33:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=SF5L4+t2; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLxxZ0r6czDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 05:32:00 +1100 (AEDT)
IronPort-SDR: /S9G4rc5Zgt4/giC0iI/A+38ENPwSQLkZvhLHdig2SFAunELGFalTvEVe4hu8omIu8tT4MtjWg
 EvgeOerNMeOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="156090039"
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; d="scan'208";a="156090039"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 11:31:56 -0700
IronPort-SDR: k8WEu2xJod9Gh65MDikTUTVL65k/9697+11gvxY2ZrL0kbs6/CG9HEv6zQX8FN11DsCCl95h9R
 39eMB5iiQvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; d="scan'208";a="318688762"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 28 Oct 2020 11:31:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 11:31:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Oct 2020 11:31:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 28 Oct 2020 11:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvi+t6ym82FpU7Ces4k/Bk5U5Dav8vr5cbEgfDJYXzOki6o1VpZIHqSUeNr9zpmKzX4XS5dJ8my4MeHGMqcSUMcZNT1DXeCd+WMNXJoRVEVfis1IYxJQLS9fFigHX/AsPYLGt6t4/VyIxPOcierl3Hn7VG9tAsxmfCjR82NWSS2JT1iV8vA/IZoUalZvGoAntsKDIscKEdtftnJxnHAU2H5d6tkPH63r4vLWhRB2a5LDYRo3dwAqDkAZNNbQkVxrtLZtT+b3b82OcORqQUYORuyawcA+ZJ6BPy6zcjd8msGrLN67boR2pWYeH5cDAuYjzOo+23IZby+segRl0JtGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q35qe2M9jKLfjQKtKKvinybSElB4zMUgzTHnvsZXZIc=;
 b=WDlCcTJK9mFwrl90CD+Bilf6aDMcE6v7mQXEiQDZc0z13usx/wxR3xdI8Qq++vZu3Rhhe3d/TBTujdWS6j3ETYIfTVV+ACJHovHq4PI+Wzfgr8CFd0xz37R7HiyLTIw6I+eZhRL73hbf7oPnfiAwSB0kQGnDCaIV+WZhAxGJAQWiAtEyX2XoNah+1InMT+cqPrKZKoOXLqKIqEXetVlaVdjs4qxwAnAPpq3xFYMuk2YrOKPxNGZClNChCIPT8ZKShkgLxK2cNDfS1l5DOSfMHjJSIHhFGdA7iWwMJCYJXqWhaQQlFo0+z23CnGQDqmITenzd7eRjDUR5icn8mvfmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q35qe2M9jKLfjQKtKKvinybSElB4zMUgzTHnvsZXZIc=;
 b=SF5L4+t2AJDz22YQPZNWPU8NNUqu/Jt3HXXhL97Lx/xlfkSMebBQNcBlpH4+jKNtYV1cAV6mDpCdgWsoTL3c/wldZukIEwI61qU7pU0c2zqkyaEsUtfhGruMsesBi8sqTNVkXqB6fRusUHehZYkM+ZlHKEHnewqqXW4qYqSu4Dc=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB2701.namprd11.prod.outlook.com (2603:10b6:805:54::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 18:31:49 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 18:31:49 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "david@redhat.com" <david@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Topic: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Index: AQHWqrf3SYgZeORHqEa1kMKSitw9UKmpFReAgACDwgCAAJbiAIAA89wAgAACU4CAAbpVgIAAe4CA
Date: Wed, 28 Oct 2020 18:31:48 +0000
Message-ID: <0471581f783632648ab5d38753f16ed34ef0d941.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <e5fc62b6-f644-4ed5-de5b-ffd8337861e4@redhat.com>
 <20201028110945.GE1428094@kernel.org>
In-Reply-To: <20201028110945.GE1428094@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb37a9e8-1868-4ab8-7aa2-08d87b6fbb94
x-ms-traffictypediagnostic: SN6PR11MB2701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2701144BCD9398EF655EFD5DC9170@SN6PR11MB2701.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kisrae4O9TdSGdLxkfMvZ8ZWPfZDxVGM8vR5KDHVy4PjAKAIN794zXfPLH5RTy9qBhtBh7F1ekysCKaYUcKAtP322hfFxiD0/pJ4HZfWzz6g6dRZT9V1XCv+eeSl08P7sDZoPusfyHcyaU/9Nwc38ZENSPwCgMa4Bs89xhaD4rqI2QQ8pTBhYZcN8N/QL4wCB+R0g4Ytl/O9M/k0PRyu1NmtYuS06cL448xON905zWQt/mTSj6kknyohUV7X/gXqjDaKFetQPVNgf/K/pgfYg/Q6lt6XTjWPhtPHwf4wQed6KWLo7flX9mFV31iTUgGbV4mNcdZhaogFI5j5NBusdYqSumcL3e+4lCSRszRnMBRKwd8xHYjNQD7Z4UNMBzkkUPhRsX1Ofxb/iSF5sF24Gg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(66946007)(4001150100001)(5660300002)(110136005)(2906002)(8936002)(4326008)(83380400001)(36756003)(76116006)(54906003)(186003)(316002)(66556008)(91956017)(8676002)(64756008)(66446008)(66476007)(86362001)(478600001)(966005)(26005)(7416002)(6512007)(2616005)(7406005)(6506007)(53546011)(71200400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: uObe2BXsB+uCnnpInkYfumv6HdVo46M0bo+rIsPtvmc4w9MQrjq2QKwXzXXTQ+vnTS8MCPqbFIqaG3PJ/w/k4m1UOLIls/6vkgsvfgo2DJo0pWSOIGDQ+5YLhl2f1EiZDoAzTdcijnmP6vf46+LExoFXZMmVJRWcmXlR8J+UrAWU+SB7Pkpte6DE4PjEqTsu+jMdU/nhEzdo7XW1ECRkxXrNDRa5J7SUTADDtYqP3VP2ztzh0+onY32VEYdCddkoLNL5S/Jne04L51t56ng/m8SPEiUc29mKsZd6ECB+n2abcGM+7h1iwiLZ0sp+q0jXOpPrFeVkn08hamVB6Ktk40DADiL/jLHtH87xu9Hw4BqtjSUvF9uH6ObHh22CtHeWOEioYz1YsSpn0qxY243hvRmQJrh5KcCjGDCvswpcWPtRxrS//aabfne+JAVBy08YUAO3T9X52WZYX2vFjY+Lp/7vymkOd1AHT9dYdbckgMJExhAS9lwJrmoKTS/tSD9mPit3a4UJ+/gOZjCAHSMHJO5J5ExDSIuLAAMk06BoDcb4TpiGQPtb7WR7iYZDXl2B8KaBv3ecz/vZAGorxjL9nxuZAi1vTGtRB4XzSoTnIm0e0etuexQJ3wv+FU6yW80LFsvjpP3w8ExcGbcNl24TAg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <8984C15CA4511541805C8B1A65EC6DE8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb37a9e8-1868-4ab8-7aa2-08d87b6fbb94
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 18:31:49.0042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XcDCWGO0I6jZiLVC9xQ6R+ruEappaKJBJ+hpXQi97HJSQa7cpSPtWhSmdYH0eQNBnbom3lFT2Ea68kSpyG9JHOPvMNXFhIH+w0iTPuGwmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2701
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
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

T24gV2VkLCAyMDIwLTEwLTI4IGF0IDEzOjA5ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBPbiBUdWUsIE9jdCAyNywgMjAyMCBhdCAwOTo0NjozNUFNICswMTAwLCBEYXZpZCBIaWxkZW5i
cmFuZCB3cm90ZToNCj4gPiBPbiAyNy4xMC4yMCAwOTozOCwgTWlrZSBSYXBvcG9ydCB3cm90ZToN
Cj4gPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDA2OjA1OjMwUE0gKzAwMDAsIEVkZ2Vjb21i
ZSwgUmljayBQDQo+ID4gPiB3cm90ZToNCj4gPiA+IA0KPiA+ID4gPiBCZXlvbmQgd2hhdGV2ZXIg
eW91IGFyZSBzZWVpbmcsIGZvciB0aGUgbGF0dGVyIGNhc2Ugb2YgbmV3DQo+ID4gPiA+IHRoaW5n
cw0KPiA+ID4gPiBnZXR0aW5nIGludHJvZHVjZWQgdG8gYW4gaW50ZXJmYWNlIHdpdGggaGlkZGVu
IGRlcGVuZGVuY2llcy4uLg0KPiA+ID4gPiBBbm90aGVyDQo+ID4gPiA+IGVkZ2UgY2FzZSBjb3Vs
ZCBiZSBhIG5ldyBjYWxsZXIgdG8gc2V0X21lbW9yeV9ucCgpIGNvdWxkIHJlc3VsdA0KPiA+ID4g
PiBpbg0KPiA+ID4gPiBsYXJnZSBOUCBwYWdlcy4gTm9uZSBvZiB0aGUgY2FsbGVycyB0b2RheSBz
aG91bGQgY2F1c2UgdGhpcw0KPiA+ID4gPiBBRkFJQ1QsIGJ1dA0KPiA+ID4gPiBpdCdzIG5vdCBn
cmVhdCB0byByZWx5IG9uIHRoZSBjYWxsZXJzIHRvIGtub3cgdGhlc2UgZGV0YWlscy4NCj4gPiA+
IEEgY2FsbGVyIG9mIHNldF9tZW1vcnlfKigpIG9yIHNldF9kaXJlY3RfbWFwXyooKSBzaG91bGQg
ZXhwZWN0IGENCj4gPiA+IGZhaWx1cmUNCj4gPiA+IGFuZCBiZSByZWFkeSBmb3IgdGhhdC4gU28g
YWRkaW5nIGEgV0FSTiB0byBzYWZlX2NvcHlfcGFnZSgpIGlzDQo+ID4gPiB0aGUgZmlyc3QNCj4g
PiA+IHN0ZXAgaW4gdGhhdCBkaXJlY3Rpb24gOikNCj4gPiA+IA0KPiA+IA0KPiA+IEkgYW0gcHJv
YmFibHkgbWlzc2luZyBzb21ldGhpbmcgaW1wb3J0YW50LCBidXQgd2h5IGFyZSB3ZQ0KPiA+IHNh
dmluZy9yZXN0b3JpbmcNCj4gPiB0aGUgY29udGVudCBvZiBwYWdlcyB0aGF0IHdlcmUgZXhwbGlj
aXRseSByZW1vdmVkIGZyb20gdGhlIGlkZW50aXR5DQo+ID4gbWFwcGluZw0KPiA+IHN1Y2ggdGhh
dCBub2JvZHkgd2lsbCBhY2Nlc3MgdGhlbT8NCj4gDQo+IEFjdHVhbGx5LCB3ZSBzaG91bGQgbm90
IGJlIHNhdmluZy9yZXN0b3JpbmcgZnJlZSBwYWdlcyBkdXJpbmcNCj4gaGliZXJuYXRpb24gYXMg
dGhlcmUgYXJlIHNldmVyYWwgY2FsbHMgdG8gbWFya19mcmVlX3BhZ2VzKCkgdGhhdA0KPiBzaG91
bGQNCj4gZXhjbHVkZSB0aGUgZnJlZSBwYWdlcyBmcm9tIHRoZSBzbmFwc2hvdC4gSSd2ZSB0cmll
ZCB0byBmaW5kIHdoeSB0aGUNCj4gZml4DQo+IHRoYXQgbWFwcy91bm1hcHMgYSBwYWdlIHRvIHNh
dmUgaXQgd2FzIHJlcXVpcmVkIGF0IHRoZSBmaXJzdCBwbGFjZSwNCj4gYnV0DQo+IEkgY291bGQg
bm90IGZpbmQgYnVnIHJlcG9ydHMuDQo+IA0KPiBUaGUgY2xvc2VzdCBJJ3ZlIGdvdCBpcyBhbiBl
bWFpbCBmcm9tIFJhZmFlbCB0aGF0IGFza2VkIHRvIHVwZGF0ZQ0KPiAiaGliZXJuYXRlOiBoYW5k
bGUgREVCVUdfUEFHRUFMTE9DIiBwYXRjaDoNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXBtLzIwMDgwMjIwMDEzMy40NDA5OC5yandAc2lzay5wbC8NCj4gDQo+IENvdWxkIGl0
IGJlIHRoYXQgc2FmZV9jb3B5X3BhZ2UoKSB0cmllcyB0byB3b3JrYXJvdW5kIGEgbm9uLWV4aXN0
ZW50DQo+IHByb2JsZW0/DQoNCkl0IGxvb2tzIGxpa2UgaW5zaWRlIHBhZ2VfYWxsb2MuYyBpdCB1
bm1hcHMgdGhlIHBhZ2UgYmVmb3JlIGl0IGFjdHVhbGx5DQpmcmVlcyBpdCwgc28gdG8gaGliZXJu
YXRlIGl0IGNvdWxkIGxvb2sgbGlrZSB0aGUgcGFnZSBpcyBzdGlsbA0KYWxsb2NhdGVkIGV2ZW4g
dGhvdWdoIGl0J3MgdW5tYXBwZWQ/IE1heWJlIHRoYXQgc21hbGwgd2luZG93IGlzIHdoYXQgaXQN
CmNhcmVkIGFib3V0IGluaXRpYWxseS4NCg0KVGhlcmUgaXMgYWxzbyBub3cgdGhlIHZtYWxsb2Mg
Y2FzZSwgd2hpY2ggSSBhbSBhY3R1YWxseSB3b3JraW5nIG9uDQpleHBhbmRpbmcuIFNvIEkgdGhp
bmsgdGhlIHJlLW1hcHBpbmcgbG9naWMgaXMgbmVlZGVkLg0K
