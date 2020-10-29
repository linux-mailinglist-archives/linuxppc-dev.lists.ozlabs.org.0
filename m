Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BE29F90D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:24:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMhN11NGCzDq6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 10:24:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=sHYtkacO; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMhGm4hz2zDq6B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 10:19:27 +1100 (AEDT)
IronPort-SDR: FLH30kh2KxTuiQ2pI8nLM43hXRwvJieQHmw83a8cI+FnSfaCPDdnriDMhY9M1paGSBwUVcxHIF
 Z6WrSVn5ZFWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168625696"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="168625696"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 16:19:21 -0700
IronPort-SDR: EacVCkt+Idgux8T4QRvqC2LMmznM5Ir3X8oA6NfvJL0wKj6klWjU+RQkjfw91fepr7Z6yScah7
 rVmIJkdsu4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="361665180"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2020 16:19:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Oct 2020 16:19:20 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Oct 2020 16:19:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 29 Oct 2020 16:19:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 29 Oct 2020 16:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbQH/NrgqaX5kmQOZ/Xq+ZRb+8ln/I9hK7r6pVi0aS/+2pJk1bdF5QNtm+XFxD9no6kDeZV4EQ4WZOBhWq1+C7wf0cB2yWGSOwzebQGf3QGz0OzSk8+C/yH2EU2hkWOqlx64TtFOm4+lKFQygb0kYz/a+gaNR7+/wn6sEHakQps6QlsSAqaIkk7cK2XhUkK7KFeNDyablCPtpdbiKaBJPtt7X+0qICHq6qX9j5rr3NL2Z5wktZNZ3OVoj2uJuKAu8RPLjXoup207APV6q7Z8PLqPmE+k5VZBPeyP5kRDylgg9S6msjkb3mvwDHvU2+srT6LSWsM6fZarfJiV3w1raw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlkKRLsjXRaHph13IEtdL+fwzUtGJxn0yGzCa4w0aVk=;
 b=MUGZRjmjMNuBm3+ARIyIKugGHVq/t7Sb+pFexPEMAy4paCErbr50dxVmvbDow0gQUsZspPx1/2U+jFoBt8k3hwBPORixH5sR9+6DAQ8IsfE3q37skCR3vZTTSV10uzsHnf1cdN6H75K3rhoOtCedjVVxuRnos/PVaM2FJPzXyshdTYwqmJMif6SermJrUgOaYQnl1r5NSba6eMwj/qTjrLAqKAd+fnst9gIAfMBf8wmPI8YakluTn1km43uJRZne/xwe/Q48lUDL/8yPnNP9sYsMEOIPB66bMoBGaH22Byr5oyT9MjNK2o7I/4UX1OYy0hiKRrxzfN+ArH79BagCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlkKRLsjXRaHph13IEtdL+fwzUtGJxn0yGzCa4w0aVk=;
 b=sHYtkacOjt3LFvR9Pc4YdnBzPAVMrCEGaOoYT2ZV6YM4vRDf3C8tedmx4KrAqKglWC5ZyrNx5G+N8CHbCPeqcCQahok9UHWTbtWgy8FHv6dMDuErAzzmDvCWpCD9t4o9ovOPBUay743zafYSmTPJb01chYTVqpbu7SpxH1aUd/k=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 29 Oct
 2020 23:19:18 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 23:19:18 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmtiYWAgACycACAAQJvAA==
Date: Thu, 29 Oct 2020 23:19:18 +0000
Message-ID: <604554805defb03d158c09aba4b5cced3416a7fb.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <3b4b2b3559bd3dc68adcddf99415bae57152cb6b.camel@intel.com>
 <20201029075416.GJ1428094@kernel.org>
In-Reply-To: <20201029075416.GJ1428094@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.54.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b7bebee-1e29-4c9c-7598-08d87c610f9d
x-ms-traffictypediagnostic: SA2PR11MB5082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50828EBA8F73327589D59CA8C9140@SA2PR11MB5082.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UgzqgZYeU8jfSl1RANTSDQVihV2tNzmYTaoRyWHKVnYvN1TpEpoTiRweZgwrTyADA/0EiNOKvqhPYlSerPNMa8zqLysQcbWgO8Uc8XkEKlFb7cTiz/7fQ7aSn2lAro8E01C3ccBoGKrZiBKXJ1h6d0wHDwvu48fEH97otaumd5A9S5P+fcFF59NzDFA8NEepzKL74vcGUdRnQiTBVEs7X73BskSpoLeKeFQBlUgjrqKqQ+I2zZpjE/idOjAfB9OankgHYeVBnGfQZGAIvASdYBziAczns/dAoUHSJahluC+VEul24cigmmjiaoXDcUNXOr0xF8I7bZ8PIsxYmvrbMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(66556008)(66476007)(64756008)(4326008)(4001150100001)(36756003)(86362001)(2616005)(26005)(5660300002)(6916009)(8676002)(316002)(66446008)(76116006)(6506007)(91956017)(186003)(71200400001)(6486002)(478600001)(7416002)(8936002)(7406005)(2906002)(66946007)(6512007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qpQYqLLAon6LEwZNKLf4AJoZIsa5wxWDCF2POHArhqq2sq0RAoft4XlpAAj3tXijW3TRCXkMnq6Q4pGPabqXlke4WaF/L0OoZUcxo37QkQICPzfK+sH6tN5bySuFYunrXiGYCD9mpmSFKLvjrRWuFS1sWgU6RFQpskC4Jqp0hqPqMxnH0c/+7bCp8iQzjOr+/spmSCsMiN72buLP93ri9slBRVy+Xgy8Tj15HV11todUxUGqd0tuIxEjdlGPgnUDCOWCSiBRttiQ55fopfmsUzMKwDg9wSJRfe+33Pv/rg8XxszxNvl8ry9wK+a76rqmxqBjdKGpgqUX0Y++avBcOCoVbyf8WlmSCBmc1WRd9SU1ECGwr4VEgxkStmIfBUwX4/fRBTEwJZQNrikMz/5cgPtp52W6DHHLMb+8NlGJUmmPs6Bqd5hksKQXr4f5tpxkyrtqt7CFjuoxG6K8mBGss0PlQmZqt4WxqfD+ltHzKVXCEYr3Mby/ixDfZJG29utf45p27F0bv/9WiHvSomx8vCuqnLXb13yjSyN54tkBVoLb6Awzg+aWcGCf7EPJqiuOp0V+OoxjE2d0mRwYXrL8RaQchOrFND0P28/O1D2w4EuLFTY+D+8pAj9zaZmqbO1unoZfOAhPGNaBCn/gT2xE+w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <11D21EDBF291D74CA174712AD209EB75@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7bebee-1e29-4c9c-7598-08d87c610f9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 23:19:18.7375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S68+5zl9Am2ZgVcrJ/pW6AKc6OUcFGZR0mmKsMuUgDr667MV1ftgnOIEAjIt9PWAiwy3DII5co5NazSo7PXSDuMpAnCYXlBH0vmkUxaOZ8E=
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

T24gVGh1LCAyMDIwLTEwLTI5IGF0IDA5OjU0ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBfX2tlcm5lbF9tYXBfcGFnZXMoKSBvbiBhcm02NCB3aWxsIGFsc28gYmFpbCBvdXQgaWYgcm9k
YXRhX2Z1bGwgaXMNCj4gZmFsc2U6DQo+IHZvaWQgX19rZXJuZWxfbWFwX3BhZ2VzKHN0cnVjdCBw
YWdlICpwYWdlLCBpbnQgbnVtcGFnZXMsIGludCBlbmFibGUpDQo+IHsNCj4gICAgICAgICBpZiAo
IWRlYnVnX3BhZ2VhbGxvY19lbmFibGVkKCkgJiYgIXJvZGF0YV9mdWxsKQ0KPiAgICAgICAgICAg
ICAgICAgcmV0dXJuOw0KPiANCj4gICAgICAgICBzZXRfbWVtb3J5X3ZhbGlkKCh1bnNpZ25lZCBs
b25nKXBhZ2VfYWRkcmVzcyhwYWdlKSwgbnVtcGFnZXMsDQo+IGVuYWJsZSk7DQo+IH0NCj4gDQo+
IFNvIHVzaW5nIHNldF9kaXJlY3RfbWFwKCkgdG8gbWFwIGJhY2sgcGFnZXMgcmVtb3ZlZCBmcm9t
IHRoZSBkaXJlY3QNCj4gbWFwDQo+IHdpdGggX19rZXJuZWxfbWFwX3BhZ2VzKCkgc2VlbXMgc2Fm
ZSB0byBtZS4NCg0KSGVoLCBvbmUgb2YgdXMgbXVzdCBoYXZlIHNvbWUgc2ltcGxlIGJvb2xlYW4g
ZXJyb3IgaW4gb3VyIGhlYWQuIEkgaG9wZQ0KaXRzIG5vdCBtZSEgOikgSSdsbCB0cnkgb24gbW9y
ZSB0aW1lLg0KDQpfX2tlcm5lbF9tYXBfcGFnZXMoKSB3aWxsIGJhaWwgb3V0IGlmIHJvZGF0YV9m
dWxsIGlzIGZhbHNlICoqQU5EKioNCmRlYnVnIHBhZ2UgYWxsb2MgaXMgb2ZmLiBTbyBpdCB3aWxs
IG9ubHkgYmFpbCB1bmRlciBjb25kaXRpb25zIHdoZXJlDQp0aGVyZSBjb3VsZCBiZSBub3RoaW5n
IHVubWFwcGVkIG9uIHRoZSBkaXJlY3QgbWFwLg0KDQpFcXVpdmFsZW50IGxvZ2ljIHdvdWxkIGJl
Og0KCWlmICghKGRlYnVnX3BhZ2VhbGxvY19lbmFibGVkKCkgfHwgcm9kYXRhX2Z1bGwpKQ0KCQly
ZXR1cm47DQoNCk9yOg0KCWlmIChkZWJ1Z19wYWdlYWxsb2NfZW5hYmxlZCgpIHx8IHJvZGF0YV9m
dWxsKQ0KCQlzZXRfbWVtb3J5X3ZhbGlkKGJsYWgpDQoNClNvIGlmIGVpdGhlciBpcyBvbiwgdGhl
IGV4aXN0aW5nIGNvZGUgd2lsbCB0cnkgdG8gcmUtbWFwLiBCdXQgdGhlDQpzZXRfZGlyZWN0X21h
cF8oKSdzIHdpbGwgb25seSB3b3JrIGlmIHJvZGF0YV9mdWxsIGlzIG9uLiBTbyBzd2l0Y2hpbmcN
CmhpYmVybmF0ZSB0byBzZXRfZGlyZWN0X21hcCgpIHdpbGwgY2F1c2UgdGhlIHJlbWFwIHRvIGJl
IG1pc3NlZCBmb3IgdGhlDQpkZWJ1ZyBwYWdlIGFsbG9jIGNhc2UsIHdpdGggIXJvZGF0YV9mdWxs
Lg0KDQpJdCBhbHNvIGJyZWFrcyBub3JtYWwgZGVidWcgcGFnZSBhbGxvYyB1c2FnZSB3aXRoICFy
b2RhdGFfZnVsbCBmb3INCnNpbWlsYXIgcmVhc29ucyBhZnRlciBwYXRjaCAzLiBUaGUgcGFnZXMg
d291bGQgbmV2ZXIgZ2V0IHVubWFwcGVkLg0KDQoNCg==
