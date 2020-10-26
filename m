Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 915EE2994D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 19:07:29 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKjV65XYnzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 05:07:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=UbYscDRF; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKjS83nfjzDqNR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 05:05:38 +1100 (AEDT)
IronPort-SDR: CrbJztA1eLByxBrmO5CxQRtSIQ5f19ic3V3D6T/Qvq/+CfvPjh4HZ3PWMiMN8doqIGfEnpsV40
 0B8R28js7Odw==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="185694897"
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="185694897"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 11:05:35 -0700
IronPort-SDR: Uc8K+VFVZ93aVM/70+ctVCa853/stfzAFxIAPyYpUo5uk2WnhoTIb5snEL1Sv8PyU2Z6/3gbmM
 Wks/iF1281vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="349992430"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 26 Oct 2020 11:05:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 11:05:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 11:05:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Oct 2020 11:05:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 26 Oct 2020 11:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtvjJ1BfbAxGwy8/BIXUTBnOWEa+Sb1xd3bT23USlqbYSJnJ1fMoDe5JkmeRdafXD3l2l5a8nm/0hjCaz7bBZ/JVVtfso6sLMrN+PQCnz8c2kk0hFnBolhFdQoeHMTnYG9G1xsRNcExnlbymrJsiGg/hHJ/amBOpd00CM2dH7kxNeImzlXxGE5ieCUrHBS0m0sWyTQqXe0d2CQoZh+CPwu2vdNl8tX88Vdk6pOawDHP0l07YlrIeb2jE4vAx86JQF1FDxJCVFT0pti9Iy8CdIeQnYY9ljR75BkyRBw2MNQ9P40woBt4DYXIuxXPuQZPJ4j78q3SGOg90i7WOKge00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI9SKFxZvC9/fJMUywS0/LT7gv1p6aMQH877Grvd/0Q=;
 b=LPwvjbIXl3L0TPRnC+uP5vycj8P2NKiNL3oZMQXhB6qQE7RYivjibIBkZ7l2Gf712OOr36PWob0nQSj1fs/PPyRQpULX4pZClkXBSl6GtuPst2TGgxqHPorjT40dXdqdoy0gczubGMNk9E6docx7YPzK93Pu0TxNmaZmAAG2RWLyiek4us8AyuxMh5+fnNHpsU4CynY/7DRoucWWHUB++W9rP1+2uXdwO6mbT1tZswm49oE3is3b8jhSyxAxGwl4+/wWFsJo/uYV1jr9Jjxh1TzVAIhTBNHcbLuK4sMlVuoP8Xlb7ZFHZB7ID1C3EbFdDlCDgrF6VHExq51wj6UMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI9SKFxZvC9/fJMUywS0/LT7gv1p6aMQH877Grvd/0Q=;
 b=UbYscDRFf13GafA72jxAfFhbWgsANwlb6qLyXctmu4QYM8hqNQgaggPIpfbkYMj5FwmCr8RHlw+jfGkddvRbUVFVjguQayZJvU3n7jeCSbq0NLm6mXMbzwdK0jlwQI92L6phrSjZnqNf0imFLFxFQaAi9qXJUxb7hiCEgv59sMo=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Mon, 26 Oct
 2020 18:05:31 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 18:05:31 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Topic: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Index: AQHWqrf3SYgZeORHqEa1kMKSitw9UKmpFReAgACDwgCAAJbiAA==
Date: Mon, 26 Oct 2020 18:05:30 +0000
Message-ID: <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
In-Reply-To: <20201026090526.GA1154158@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 757383ae-c314-4130-c79f-08d879d9ba6c
x-ms-traffictypediagnostic: SA2PR11MB4956:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4956DFBF6DC6124E41B60183C9190@SA2PR11MB4956.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8gugbyRvXc1FrYJthS1/KT7bV9ujecCUln/j9Asi874O5De+jDJCp3Mg3Mqc08gZS0nrTjv/qATfmpl8zNTGEngCbaKVGgbQJ5ZhvZ2dUnKTxr9mVHf8eJoYvhK2CTtV9ymJtfnUdpePeecN0j1nn7fDuQ+HRo5CirpCXUlVplqx3HbimIxVrh3ha2TTweL0gsLxP4OGYdfut1gzM49h0aNEM/VJxflWtswXo3PgJcPxBU5SdD2J4NO1AYOtapw/sFmIJU6TzyYAavyvL/UsdLdTvvAJUWG3AaqUcOMohZY3liD3aZwdM6ook6jPtoDN4i41E6feO/szdnDABEkNRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(66476007)(66556008)(66946007)(186003)(83380400001)(91956017)(478600001)(316002)(66446008)(26005)(54906003)(2616005)(6486002)(6506007)(71200400001)(64756008)(36756003)(7416002)(6916009)(6512007)(4001150100001)(76116006)(4326008)(5660300002)(2906002)(8936002)(7406005)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: u6Y97UyC5dfZkZY5bjEaYRgqOLONgvzb75mSLbCRug2w34dlOkPVpWXAFRiUyj5/JhyOA8CdqditoYx2UpExek/EwoHuyCHm6pXa11HyKW0Iwrvn4WTdcyjxTGPp0JydnYay1YuM4KeCWP4oZkLNdPAHdJEKyO+9AeF8O3aGJdwgWCdbVKxCkQH00EBITNQ0fkWjy5NXbv5aRBylNRwxAVQi8Y3jIIcgOaYOYCIavDG8yvxhhLKl8cGzGtMOaZ8jxTKx9P/V5yH/NAaTZZNsfyujOOleHpMqSCI8kbP5Ib0t/zA1GHBJLISsbQqFBNePoabJY+b2R3aIQVhtVCXCiuDwwAZ3aa4MuSVsj07gFxJFNAUn+F0UOLsWTnGgu1slyYv31/3hk8RaqpGavo4pYBhYGxFWLXjNY6QCN5j25D2BGir2uLsxcBgb3H5cmp75vK2S+ryQelvPVVB9oNBdTuEN4weAzsln+Wmb0MtxpllxgNX7SaYHqfrEjm3GnUj4HlYpmfN2gJMzNwgm6PRwZbEmVkasPdDl8by9Odj3WFSbc+t6jTBeztaPELdB9nPVArb1ymjAw8EzjQzPCHYBhPYiRvBsKclOdktUKtRYsiw1yZpib006Czp+Hz2eLCJteLsO7E/g1NgPdh4p8yGcIg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9F6DE933B80F84DA6EA9C88BA9B05F4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757383ae-c314-4130-c79f-08d879d9ba6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 18:05:31.3661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQ2kBQXNfq1dLhyfcQFZ9pWdMDNoCDpS79wzzMNDV7orkFmVpIWFnNkhKC/mogzdcrAO8ema/BYkJl5wo7vwxWaAVJI62zFOIC1a/BojB1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
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

T24gTW9uLCAyMDIwLTEwLTI2IGF0IDExOjA1ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAyNiwgMjAyMCBhdCAwMToxMzo1MkFNICswMDAwLCBFZGdlY29tYmUsIFJp
Y2sgUCB3cm90ZToNCj4gPiBPbiBTdW4sIDIwMjAtMTAtMjUgYXQgMTI6MTUgKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgd3JvdGU6DQo+ID4gPiBJbmRlZWQsIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZGVm
aW5lDQo+ID4gPiBDT05GSUdfQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVANCj4gPiA+IGl0IGlzDQo+
ID4gPiBwb3NzaWJsZSB0aGF0IF9fa2VybmVsX21hcF9wYWdlcygpIHdvdWxkIGZhaWwsIGJ1dCBz
aW5jZSB0aGlzDQo+ID4gPiBmdW5jdGlvbiBpcw0KPiA+ID4gdm9pZCwgdGhlIGZhaWx1cmUgd2ls
bCBnbyB1bm5vdGljZWQuDQo+ID4gDQo+ID4gQ291bGQgeW91IGVsYWJvcmF0ZSBvbiBob3cgdGhp
cyBjb3VsZCBoYXBwZW4/IERvIHlvdSBtZWFuIGR1cmluZw0KPiA+IHJ1bnRpbWUgdG9kYXkgb3Ig
aWYgc29tZXRoaW5nIG5ldyB3YXMgaW50cm9kdWNlZD8NCj4gDQo+IEEgZmFpbHVyZSBpbl9fa2Vy
bmVsX21hcF9wYWdlcygpIG1heSBoYXBwZW4gdG9kYXkuIEZvciBpbnN0YW5jZSwgb24NCj4geDg2
DQo+IGlmIHRoZSBrZXJuZWwgaXMgYnVpbHQgd2l0aCBERUJVR19QQUdFQUxMT0MuDQo+IA0KPiAg
ICAgICAgIF9fa2VybmVsX21hcF9wYWdlcyhwYWdlLCAxLCAwKTsNCj4gDQo+IHdpbGwgbmVlZCB0
byBzcGxpdCwgc2F5LCAyTSBwYWdlIGFuZCBkdXJpbmcgdGhlIHNwbGl0IGFuIGFsbG9jYXRpb24N
Cj4gb2YNCj4gcGFnZSB0YWJsZSBjb3VsZCBmYWlsLg0KDQpPbiB4ODYgYXQgbGVhc3QsIERFQlVH
X1BBR0VBTExPQyBleHBlY3RzIHRvIG5ldmVyIGhhdmUgdG8gYnJlYWsgYSBwYWdlDQpvbiB0aGUg
ZGlyZWN0IG1hcCBhbmQgZXZlbiBkaXNhYmxlcyBsb2NraW5nIGluIGNwYSBiZWNhdXNlIGl0IGFz
c3VtZXMNCnRoaXMuIElmIHRoaXMgaXMgaGFwcGVuaW5nIHNvbWVob3cgYW55d2F5IHRoZW4gd2Ug
c2hvdWxkIHByb2JhYmx5IGZpeA0KdGhhdC4gRXZlbiBpZiBpdCdzIGEgZGVidWcgZmVhdHVyZSwg
aXQgd2lsbCBub3QgYmUgYXMgdXNlZnVsIGlmIGl0IGlzDQpjYXVzaW5nIGl0cyBvd24gY3Jhc2hl
cy4NCg0KSSdtIHN0aWxsIHdvbmRlcmluZyBpZiB0aGVyZSBpcyBzb21ldGhpbmcgSSdtIG1pc3Np
bmcgaGVyZS4gSXQgc2VlbXMNCmxpa2UgeW91IGFyZSBzYXlpbmcgdGhlcmUgaXMgYSBidWcgaW4g
c29tZSBhcmNoJ3MsIHNvIGxldCdzIGFkZCBhIFdBUk4NCmluIGNyb3NzLWFyY2ggY29kZSB0byBs
b2cgaXQgYXMgaXQgY3Jhc2hlcy4gQSB3YXJuIGFuZCBtYWtpbmcgdGhpbmdzDQpjbGVhcmVyIHNl
ZW0gbGlrZSBnb29kIGlkZWFzLCBidXQgaWYgdGhlcmUgaXMgYSBidWcgd2Ugc2hvdWxkIGZpeCBp
dC4NClRoZSBjb2RlIGFyb3VuZCB0aGUgY2FsbGVycyBzdGlsbCBmdW5jdGlvbmFsbHkgYXNzdW1l
IHJlLW1hcHBpbmcgY2FuJ3QNCmZhaWwuDQoNCj4gQ3VycmVudGx5LCB0aGUgb25seSB1c2VyIG9m
IF9fa2VybmVsX21hcF9wYWdlcygpIG91dHNpZGUNCj4gREVCVUdfUEFHRUFMTE9DDQo+IGlzIGhp
YmVybmF0aW9uLCBidXQgSSB0aGluayBpdCB3b3VsZCBiZSBzYWZlciB0byBlbnRpcmVseSBwcmV2
ZW50DQo+IHVzYWdlDQo+IG9mIF9fa2VybmVsX21hcF9wYWdlcygpIHdoZW4gREVCVUdfUEFHRUFM
TE9DPW4uDQoNCkkgdG90YWxseSBhZ3JlZSBpdCdzIGVycm9yIHByb25lIEZXSVcuIE9uIHg4Niwg
bXkgbWVudGFsIG1vZGVsIG9mIGhvdw0KaXQgaXMgc3VwcG9zZWQgdG8gd29yayBpczogSWYgYSBw
YWdlIGlzIDRrIGFuZCBOUCBpdCBjYW5ub3QgZmFpbCB0byBiZQ0KcmVtYXBwZWQuIHNldF9kaXJl
Y3RfbWFwX2ludmFsaWRfbm9mbHVzaCgpIHNob3VsZCByZXN1bHQgaW4gNGsgTlANCnBhZ2VzLCBh
bmQgREVCVUdfUEFHRUFMTE9DIHNob3VsZCByZXN1bHQgaW4gYWxsIDRrIHBhZ2VzIG9uIHRoZSBk
aXJlY3QNCm1hcC4gQXJlIHlvdSBzZWVpbmcgdGhpcyB2aW9sYXRlZCBvciBkbyBJIGhhdmUgd3Jv
bmcgYXNzdW1wdGlvbnM/DQoNCkJleW9uZCB3aGF0ZXZlciB5b3UgYXJlIHNlZWluZywgZm9yIHRo
ZSBsYXR0ZXIgY2FzZSBvZiBuZXcgdGhpbmdzDQpnZXR0aW5nIGludHJvZHVjZWQgdG8gYW4gaW50
ZXJmYWNlIHdpdGggaGlkZGVuIGRlcGVuZGVuY2llcy4uLiBBbm90aGVyDQplZGdlIGNhc2UgY291
bGQgYmUgYSBuZXcgY2FsbGVyIHRvIHNldF9tZW1vcnlfbnAoKSBjb3VsZCByZXN1bHQgaW4NCmxh
cmdlIE5QIHBhZ2VzLiBOb25lIG9mIHRoZSBjYWxsZXJzIHRvZGF5IHNob3VsZCBjYXVzZSB0aGlz
IEFGQUlDVCwgYnV0DQppdCdzIG5vdCBncmVhdCB0byByZWx5IG9uIHRoZSBjYWxsZXJzIHRvIGtu
b3cgdGhlc2UgZGV0YWlscy4NCg0KDQo=
