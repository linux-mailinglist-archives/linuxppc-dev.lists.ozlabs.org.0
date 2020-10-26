Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99130298554
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 02:32:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKHPX5LJWzDqMM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 12:32:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=rick.p.edgecombe@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=wRAtcj3s; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKH0q4gdszDqKM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 12:14:01 +1100 (AEDT)
IronPort-SDR: 9Bk3IeCg1UqtT8MyHF91q4dF+JD+KwOljCxk6uqOrC73z3ziHAoN9esVZIhCEIYSkIWTCECr8C
 vPLJqZRhwSag==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="165274058"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="165274058"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2020 18:13:59 -0700
IronPort-SDR: hzP5rd6h1liHzJ1ArnZZckrdy6N3K8dKKOLAieV/L4158tR82BX7e1LJDkOfSGvTLfex9Xdkji
 zZbFr3k+vAnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="360833707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 25 Oct 2020 18:13:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Oct 2020 18:13:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Oct 2020 18:13:59 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.51) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 25 Oct 2020 18:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+vFxiZRRV0bWM4jYv5POtHlru265Y3DPSxNqrIhDUCb+GzTKKUJ61tutXCrWEfQDHZQOPktXhb6MCna9hcQTFjhyNFo6WDVah6FDlJSmZRyNMWLpzHqYUyc/6pfxR493//oxKMidgDo2H9MbYieyClUqOLBw1QfOqwh69maAebAZMiFcdIMIMmt29B9/8Prsrp9VtgF5SS09rMwI0M26VvP5MyhonRi5iQcZhWGoKAMZQ3h09C6ybndWf6cXbC0ADwbOTI6rC9cAU5qzMkgrvFUZz6qD4FGZcKkGcH5L8TcLhAeD7MDBHyZBNecLdTy2y14dphaT31U1Sp/u9X4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCdaGHTHtP8gtA6Z+FFbeq6bpqfZezEc0ccEOpAX4Es=;
 b=Yfh6uEdyv+jPo+OA2igO5GioyPMKCxAh2ylZZ+B44zaljjKGAMYaO//bRtV8t5uxTTiAdgKRn8NvXZTb42QlrtLtnZW13bcObagqEQg0IGBwb/9lfFk/dkr8TCO3iQVZajrLembZORVSP7YH5XvsHcFAW31QIXmN+hh58eO3AEvRyeYIimtf5ntS69Znf0SiRQzcNsoD4ixnKm5h6kM/VPOSaokJT3rmE6piy8fRbYT8j6Tyd86hu5svBy1/PzVZ++6uvqViCpjptgqAs4vI4WHfB7ovKShhXNtjDyRNs7BnRZMPXIXxLflL0kV4b3hMx8Z4uqv6uGnH15nCRbi8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCdaGHTHtP8gtA6Z+FFbeq6bpqfZezEc0ccEOpAX4Es=;
 b=wRAtcj3sKYRJ5ymp7oUIK5o29NAVxQglEGvXMuvcl99D0fUGRZfhhEcycMPG1G5JM4QMLrnmoY64PR+Lb9yy17DI5n+g+y1GuapsyNA8MYoQeVWJn0UGEsbV7tgjpvQ3EDQD7xT+2OiJPLlOP4rhKPbqLiqUTnDmDSGcU2nEEDE=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Mon, 26 Oct
 2020 01:13:52 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 01:13:52 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Topic: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Index: AQHWqrf3SYgZeORHqEa1kMKSitw9UKmpFReA
Date: Mon, 26 Oct 2020 01:13:52 +0000
Message-ID: <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
In-Reply-To: <20201025101555.3057-1-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.55.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc039678-a76b-496b-93bd-08d8794c6723
x-ms-traffictypediagnostic: SA2PR11MB5098:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50985A3DAC48AC5E20C24F6AC9190@SA2PR11MB5098.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DlgT42S+6Ct81Dm9PP4kfkEe/8Y/RjSpoRaeLZJ++8MLtIEIlars7vy2Nxa1GvGFJIE4G8LbnE9giiOyxBLLlGncblj8SQByYgMPKB/k70VDZQyo/LvvXdDzzIIuIAzytctc6tTCRgm2c9Th+wYPKujikSrPF1rC2GCwcLnTDsIE2ikyR24Olorsf1jQ1qpqLjl+/4LN9OVRBO5GLuMlbfGbYHWWL455mvXWrwT0I3zZzP3ml4Oqt9XkDRirpK/SMx9eHfH+S/sQcY/b8+SMB55B1SNuLKY+l71TIv40vFheD9PHS6iNXHyMD77MSMkQPrz6CFkuGC80OKHvyRT/6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(2906002)(6506007)(8936002)(5660300002)(26005)(316002)(110136005)(86362001)(7416002)(83380400001)(4744005)(6486002)(4326008)(54906003)(4001150100001)(66446008)(66556008)(71200400001)(66946007)(66476007)(91956017)(8676002)(36756003)(186003)(2616005)(6512007)(7406005)(64756008)(76116006)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3eyK9ztK9ty2x56AFldcQ9PmeiaKtSRGFMDt7eqzfD/tu6WByW+j8aKkQ0ct9biUj6MgDPsBg2orjrc81BJqdLawoba+H0EZIypdkWEIM4mYsDxncmgtLEnibHV/st1N6tgiHq/+aAphYvWm8LpmJRwMZJmzisOwWOA4qhDx2XciyEJswGCeuliStWHcr1OWg2CgEVDolti+hVaqzxEi67n7PkvDM/68WRX15jSgxZ95f3sijpTwZhF+gpqLrSTHP2l0C1Jmxp/zHcZmp8DNj2lCzuv7i2ZuQVQTPa0M+tsluKejArzMzVRyDA5+qZK4nRv6C/2Vb/91Ny9xlYxDZdCv2D2nbj8qKAlVCHyu5tqu3C9Zh7PzWRAAfeTKwpbCHCcVGOS6s7gpmGIDvwbBHqblftp3vE+3KaZK5jsRiXD69qd9W8ZT5kFVnMlmwhfAyjdTlqS7DCRggfCnzWVNfMzPPN+KGSXdJNr0UOox9BW2rmSHODe3iFQDzyaln+LD7WPU5vs+PeO/a4jeNjzan4iMt62odWQNPVF3U4a0aAOKpeaYodXX2ct63nKoZuCriKCGIIzk5exuDYTT3yyw1DyvGI+Rvnx4Rw0YLbvPph/iTMQ099tSNm9XxZNCdgHZYD5hICuR6HSKyIEvgNMgtw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4492F646F7F0A418B81F65A778FC5B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc039678-a76b-496b-93bd-08d8794c6723
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 01:13:52.6366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKKnNFImuHLI+4Vw+Koea6r9Mx1bOYKiGLXlTj4J/aQ3X1WvWnoCnIe38BbeUKOcrdhpUX7RdEVXLskwj3AppXXez7mw8KYhdsWEkKT9los=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 26 Oct 2020 12:26:40 +1100
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
PiBJbmRlZWQsIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZGVmaW5lIENPTkZJR19BUkNIX0hBU19T
RVRfRElSRUNUX01BUA0KPiBpdCBpcw0KPiBwb3NzaWJsZSB0aGF0IF9fa2VybmVsX21hcF9wYWdl
cygpIHdvdWxkIGZhaWwsIGJ1dCBzaW5jZSB0aGlzDQo+IGZ1bmN0aW9uIGlzDQo+IHZvaWQsIHRo
ZSBmYWlsdXJlIHdpbGwgZ28gdW5ub3RpY2VkLg0KDQpDb3VsZCB5b3UgZWxhYm9yYXRlIG9uIGhv
dyB0aGlzIGNvdWxkIGhhcHBlbj8gRG8geW91IG1lYW4gZHVyaW5nDQpydW50aW1lIHRvZGF5IG9y
IGlmIHNvbWV0aGluZyBuZXcgd2FzIGludHJvZHVjZWQ/DQoNCg==
