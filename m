Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A329D26C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:24:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1mx3CwhzDqvV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:24:49 +1100 (AEDT)
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
 header.b=Rldddwmx; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM1ZS6F4dzDqlg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 08:15:44 +1100 (AEDT)
IronPort-SDR: xlw4shBoe4mczpHcI/zQZEaXPKxTshNcGprydH7Rw25Id8FXxVIlQX5NA3AHBiTbP+esQWb7O6
 +LzFUJQqwxfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="147621065"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="147621065"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 14:15:41 -0700
IronPort-SDR: gtxxgM7N+xzhVMbZb4ZlUx7yJyo24qrJipNYJQTRA2Wvm5a7usoSj1q3M2YWM3r9xQ5lKbqV1q
 4vhc2nYCdbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="350743016"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 28 Oct 2020 14:15:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 14:15:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Oct 2020 14:15:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 28 Oct 2020 14:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naKT6xdjpEwEJA3sxk3yHS0jrS9werBjDLEOe3dU8mUC+vFdYW2+azxUrriFxqyFbMMpYlha98nRyv4CMac2gjywvxFJ7WTLbXKtkUjf4IvrtnBptnSxJjOn49/uLngChecGNdhZs8shVSXOAwy0XvfN6NYOftHFlXAZKCjtnZvI//0v0LJCKpY2I7VfefAL/1y9RGWz19Jtqokokp509riHdJ8mBPblHTFq4zAhL7+p/DLy/QoeX3L8zYj8oBggCzO/W53nyFJS57I2pCD1ONeAqnjRNn89tAUO+9tErdImFsnVRIB4nBU5nWpyLF62YCVJusTv9sEQrNKjKJTsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjndY2lYTfTdjTw8DdB0/klY+dGykydX7sBoy2Bru9A=;
 b=mqg2fID2oqgNaHfgwliDfSnrTnVq6p1eCrhfHEi81Lut2tfzgBPy8m5o62uu3httxWZiOGoGaIZXyycvgeHHX4L4G75hbn5hpxaalwzRMs5lNO7Xjc9gcshDsKmRITlL1h0O/oOBj/AFolM5nTkgFt6EGTDKkwL11EEwC5PxM88dvq1f25VqfamXhfl5LR14K3wyD0mGqW84JIhXnRcDZk7CQODi/jTYiMasf3mFaWJyRPeXGnCsbmcrhBOgYWyT0isKCDN1Br8mCiB+dOmI5tkd7SQ2viPFkr0LJIsK/QslxnRXorUforv8AyxIO3ddygCr4TUK5hmZpxs3LqcBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjndY2lYTfTdjTw8DdB0/klY+dGykydX7sBoy2Bru9A=;
 b=RldddwmxQygxC52mi5QuDfOFMM7cUNsr2HVeBQFjPIzBtZgtCDaIP6gWal9RdEnw1mal8aJzD7ZBPSymSizi7yMoIQ9bezdz1nin6Gl+E8/okLm5AJ/U3B03pOigbpAX+RmHS36romkY3WVvfLV6fFBwOXEn3V6ZhNt4N7oa0SA=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB3280.namprd11.prod.outlook.com (2603:10b6:805:bb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 21:15:38 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 21:15:38 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmtiYWA
Date: Wed, 28 Oct 2020 21:15:38 +0000
Message-ID: <3b4b2b3559bd3dc68adcddf99415bae57152cb6b.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
In-Reply-To: <20201025101555.3057-3-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96bb975e-2509-469a-dcd9-08d87b869e7b
x-ms-traffictypediagnostic: SN6PR11MB3280:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3280D14DB862EF38BB86EEE1C9170@SN6PR11MB3280.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vxRQYMBT+wNP4IwGhgFILe3n5aZvgwKXdHnC7hfcwzY8hJXisEz+U5TZFRNLFQ5hFr9aLfk80cB+ty+6N0dakPJuEpFLHF+ezpLDwP6Cf4hI2PTyqpTwGISUZ2imwUOFuhPpakvV0WSxqwxuOfs0alovc4YsAxrT86pumb7jqb4fXODlWF88U2QBhB6tJ+4lVaPG3AZ5dTMtc6wz/Sr8YPNyLBWrCltG7HOctONX1fIDU3XUcyIjSy4QIWt5pg6ZCfRoPqlsHLAfHnrRrxb1H3lU3/mbLJqfho5eoKsQKBLBWpwGFvmYaP7AtVgy0Goc9RmOR5AGCHs7z9NahW9s+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(76116006)(7406005)(91956017)(36756003)(7416002)(6506007)(6486002)(83380400001)(86362001)(2616005)(2906002)(4001150100001)(186003)(6512007)(71200400001)(64756008)(4326008)(54906003)(8936002)(316002)(4744005)(66556008)(66476007)(5660300002)(8676002)(26005)(478600001)(66446008)(110136005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kCUbV3gAcUCX1YObZMPYByBb1wLvIhoX2RnJI4Gonw08TfaKjAueXfxIFAO6CdPfQpjxec47NMZYQ4zS4gXYOuU36yNPPfmOskmsD+GTVjr9xuGDXQ0uoAw26Arb3hK4ftZBYOaKs//PFQv16tXSGkYjr7wna4ZMXwwoLCxnNMr/2zHi/guO/Bnhw620P7JQP4B435O6g0G9rhAket7WSYjKVCjkcfQgB4KeTGSUCYP+K5/GxwWJO0/+fsw1jATb1c107ZgyGD2IO0WyN/+Xi0DsY/11iv3g3yNdJCTEVvTjh2LE0izTR1/ynV4LGGemVTBLvmHh6G8BYx8DN4J9B4zLk2BZrzOfpD5Ah/4iRNgbx/akVy/LBIH7IcRQA4gSaU2tM/d7sXFKLsnbV0c4HNsukSjrwwlnUs//iQ7TjKhhvCnHgD8b0xoTrSff/TrYAgEdwp5FtunLhvH8Llx0n//0fxVogmh2MbY/fj/SS2lsfiAKNgj4eWzaduZNaYktad8GT/wwamS8UC5UEC2hcXFK4KCjMSVkJRh9igsvfdVR87e3dVk8gph3s7ZZF41RJVxyplHXlM32dwcuXq3Xh90S3x/Mip9QcxA8riMxAVdF1xrx6chpXhn4U/erdk7TXHA3hwkI6Ui8PpSiwpSUiw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAF0959967EBF445A06BE79466629D75@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb975e-2509-469a-dcd9-08d87b869e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 21:15:38.6557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9aQoHtg1DLalfWBo37yiD5QdwvCp27cYz444ezwEcRbr4c9AbdANp7KtHAQUhEheH7ZO6hcQGXjo+702UBz/jUmQRaMObIf6tnKcryR3ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3280
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
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU3VuLCAyMDIwLTEwLTI1IGF0IDEyOjE1ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19BUkNIX0hBU19TRVRfRElSRUNUX01BUCkp
IHsNCj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZA0KPiBs
b25nKXBhZ2VfYWRkcmVzcyhwYWdlKTsNCj4gKyAgICAgICAgICAgICAgIGludCByZXQ7DQo+ICsN
Cj4gKyAgICAgICAgICAgICAgIGlmIChlbmFibGUpDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IHNldF9kaXJlY3RfbWFwX2RlZmF1bHRfbm9mbHVzaChwYWdlKTsNCj4gKyAgICAgICAg
ICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gc2V0X2RpcmVjdF9t
YXBfaW52YWxpZF9ub2ZsdXNoKHBhZ2UpOw0KPiArDQo+ICsgICAgICAgICAgICAgICBpZiAoV0FS
Tl9PTihyZXQpKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47DQo+ICsNCj4gKyAg
ICAgICAgICAgICAgIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UoYWRkciwgYWRkciArIFBBR0VfU0la
RSk7DQo+ICsgICAgICAgfSBlbHNlIHsNCj4gKyAgICAgICAgICAgICAgIGRlYnVnX3BhZ2VhbGxv
Y19tYXBfcGFnZXMocGFnZSwgMSwgZW5hYmxlKTsNCj4gKyAgICAgICB9DQoNCkxvb2tpbmcgYXQg
dGhlIGFybSBzaWRlIGFnYWluLCBJIHRoaW5rIHRoaXMgbWlnaHQgYWN0dWFsbHkgaW50cm9kdWNl
IGENCnJlZ3Jlc3Npb24gZm9yIHRoZSBhcm0vaGliZXJuYXRlL0RFQlVHX1BBR0VBTExPQyBjb21i
by4NCg0KVW5saWtlIF9fa2VybmVsX21hcF9wYWdlcygpLCBpdCBsb29rcyBsaWtlIGFybSdzIGNw
YSB3aWxsIGFsd2F5cyBiYWlsDQppbiB0aGUgc2V0X2RpcmVjdF9tYXBfKCkgZnVuY3Rpb25zIGlm
IHJvZGF0YV9mdWxsIGlzIGZhbHNlLiBTbyBpZg0Kcm9kYXRhX2Z1bGwgd2FzIGRpc2FibGVkIGJ1
dCBkZWJ1ZyBwYWdlIGFsbG9jIGlzIG9uLCB0aGVuIHRoaXMgd291bGQNCm5vdyBza2lwIHJlbWFw
cGluZyB0aGUgcGFnZXMuIEkgZ3Vlc3MgdGhlIHNpZ25pZmljYW5jZSBkZXBlbmRzIG9uDQp3aGV0
aGVyIGhpYmVybmF0ZSBjb3VsZCBhY3R1YWxseSB0cnkgdG8gc2F2ZSBhbnkgREVCVUdfUEFHRUFM
TE9DDQp1bm1hcHBlZCBwYWdlcy4gTG9va3MgbGlrZSBpdCB0byBtZSB0aG91Z2guDQoNCg==
