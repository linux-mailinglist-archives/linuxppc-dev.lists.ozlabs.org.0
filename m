Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BBB456BD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 09:47:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwVfD5tPpz3bsp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 19:47:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::602;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::602])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwVdj6NNnz2yP7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 19:46:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ppm7ciWWtfD2Y0BX1aXuZJcofIhYAIzExzp83NwGeM6ky9hby8+HwGpwHyL73hy6bctc4SgokQSOfRQu15U63mk3U3lSuowhGtR9AdohGdpdBpKlQtuyFvIlj3fEPyDwZNpksdwLAgqquDJ5WyR7Zt3vnjIrvYn4IKjtI88YyW9JQ3SEtJh9eBKKW3cIhbkRndNSCVqRxQWI6M6+Zf1q7onJ4oWN4vYdo9bGqtfUQeCiUz3jXHlslecfBEa6JdKtimg1rvtSCGn5NyvNdw2o/lFypY6/hhb+mc1oiXa2/CNnYRXKT7gOmF7kyQ3CfEtCHSs/Yqm+05+MVoPip7AuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1D7ukfFdzDmOo9xKUfp8KNgYIAL8o9jEQVfmHntKl0=;
 b=ijsLcbBVM3RiCoxSDvTQh41dtbbuJLfRqPuK0ZKo5aZLHSoIffCj4k10E7GlA9ImKuanj4kjbPX9iZAZkyttZfsrrx15DnE80P/QNoF4jiSpujXNFo/rhnxI0ZdbVw5hN3xqkZkjujaUr40VsNIpxZcPRYxNr/BS5jU92ipLcV7RnEp6xZLwhczHBjeuQoN4UjidOT/+K/yWQ90Lgx4In1YIdPwlyNMV0nbXSMQGZKKphtU/jKXuDtfpX0tBtnNupWEz+WSF1Z0YlnDDbBUY2YqkDhViSUXBJ4dDGfiRzuIuzuNBW10L/uJjDBMBBoZI/ghelUmXe4/QJqkHqfOvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 08:46:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 08:46:27 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
Thread-Topic: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
Thread-Index: AQHX3LvryzRFrAdRlEWrhghMjlgE5KwKimgA
Date: Fri, 19 Nov 2021 08:46:27 +0000
Message-ID: <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
References: <20211118203604.1288379-1-keescook@chromium.org>
In-Reply-To: <20211118203604.1288379-1-keescook@chromium.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e33575a3-c525-4bda-90b5-08d9ab39133a
x-ms-traffictypediagnostic: MRZP264MB3035:
x-microsoft-antispam-prvs: <MRZP264MB30355F1FD29F2D1F8ACF0E81ED9C9@MRZP264MB3035.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F07h6PP6y3Enjz+owoUpYcFEMb2Sivyaqs8pAvxktPPuundqRgDpEaI0F9tZx0p4bMAeKLYokVXniATpewcZw+IOhbaNwSt6glv3pnrdlo1mVjYbBYIoEV/srdZfZiEPEOAURnFAheRKmyJ/IqFsn9GgQ8l/6TjacVDi3qzk89GXDN969JD7us+LnHGN6d2p1CvnLl7ZqXjHB3UDCzNKuoELWB9jTDgLQWwT89hBmfERWtgPalwfcLHi2juIHTcMqnJoIqNDixhYgulcgCnUYYnCehg4Vk2QNbsTgzORqjVqoTCtoW7s3M5cFW6jbeEEg99abWHnXGzvpFksJyd/2x+1VOj4VHb/iiyqFPLBZNSU9Keiok5i/Qn0ayMtHp924mWFJzKjAZnocplpN3Pf9XwKJMhB0xEc5P3/dVWek1j3d2pzYJmm5N+Wbvdn3xl6159p6ypdf3fWfKziYZOszfGs3ARW2x8VHFaYttOK1r5LxRduzrqJuLgeRjc/vvafbTw3B21eWhoHRizHrJvkZNziZjkJ5xKiFcMccCi2SyjpmNfqiZfDAYgy3olnSTc40tOGt+qr3KaYYenlJFzAuweIWuOT+tAIBgEf3AQGN/pxJAeVRTJTpI3ibX5iecJepQTFcIB3bXQmWBmWAn1ryfUDRbvB1F0BxQeRhHSLaiMCCCTs7G1INHiH0R0kq/cECXnUYYeP/lQriF0NHyazJ0oNYtRfZ9VXkul6H0y4h51DS+Q/Bu4kshowjq3PdPaSrP6JYWdmX03hJyyk9DLd+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(6506007)(8936002)(186003)(38070700005)(316002)(6512007)(4326008)(2906002)(71200400001)(8676002)(5660300002)(508600001)(91956017)(54906003)(66946007)(7416002)(86362001)(66556008)(31696002)(64756008)(122000001)(110136005)(66574015)(66446008)(31686004)(2616005)(26005)(76116006)(38100700002)(83380400001)(66476007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjM2YU1nOEt1Qk5jdzNMdXF4N1orQkZlY3NQZmtnc1JvdFNxeVVEbjBMTkNz?=
 =?utf-8?B?QlA2SEtwY1Y3UHhhOXMyTDlLS01lK3ljQXg4NVhqSUNUenl3V1h2U3ZFQlRZ?=
 =?utf-8?B?Tm1IK1Bad2JuMWRJbEd0OHlDRzRzcHRHbzNNNklydEZXVERjZ25NeUxCK2tN?=
 =?utf-8?B?cG9pQmQyVXZRRkdVdlg5OEJ0aDNuWUFpcHNuMTNpaFVkSGMzUlUwZTVMYzZ5?=
 =?utf-8?B?cy82Um9nV0xyQ1pXS3NwRmZvcmtoLzJaNkZKNmpSNmk5NmxlK01MeUdmb3h5?=
 =?utf-8?B?bysvaGROQzFqa0k2aS9WdXBtYTNoVzZId3FOWm51THdRdUc4cjhqZm5jdWNY?=
 =?utf-8?B?T1BRUjdzTnI0SW5iQlhPbWtId2RYcEp2OEF2b0FUV1pRaEhTTEF5ZkNNcjVJ?=
 =?utf-8?B?T2wxZ3ZwMEZ5WGlDVmRGcUpINDE3WUd5NHVIbXJEeFcxZnY3TWdyVmN6cVo1?=
 =?utf-8?B?TTFrK0M3WXQzUFh1bTdHQ2piZ0JsaDR0ZUpmeFBLS0huYnQ5S0tWVHU2T3F4?=
 =?utf-8?B?QWVuaXBXVi9RRVFndHUxY0hoTG9STVl6ZEV5M243NXlPWnVUQVFSbEZ0Ly9k?=
 =?utf-8?B?UnMxRHpVZWNvQzV1SEV4N09kMU52ZVROeHpPSXk3Y0NWRVZwK0Rvc25EWE1E?=
 =?utf-8?B?WCtML3l6SzNiNklTc3NFLzVqTk5uTXgxTWZJVmlwTUEyci9uV1c0RTNPTTF3?=
 =?utf-8?B?RXhLa2N1bzllOU1LbVRmRWY2K3FSUzRFOUlMYkV1eStuY1RwRFUzbmQ1Vkxp?=
 =?utf-8?B?NWpGZHJ3UGIvYWJRN3dxZGxXNjVxeDE3ZUtoNzVOVGJ0OGtVUU9LWkgvZFJ5?=
 =?utf-8?B?WVg1VUhTa0NVWUIxbzFEN2h6SHF4U0hLbERoN0JvZ3RxQnZDTE5CdmlqeHpa?=
 =?utf-8?B?R2FPcUowN0VhbWVTcEx2TThYcFdVaC9RcEE0dnp6M011OGRad1VhTlJMY1NJ?=
 =?utf-8?B?c1BidGNERXFYSkFKMEhPUHpxZTBVMTM4Q3FrUTVuRm1ZTFJFNUYyNFRoYytt?=
 =?utf-8?B?WlVpb0VMcnVPcmExV0xnVG1xeW5JNWpFdGNLVlNhai9paHJNMGxGamlpV2pq?=
 =?utf-8?B?dWRvVUpGdG1XZEhaOVZaYzdpRzJ0RGJ2aDhMZklwWGRDVGduT2duSU5XVFZM?=
 =?utf-8?B?cEN0QjlNUzdRZ3liamlpcTBqeEI3WnZHUEpTTTc2aWM1R0o2VktnN3ViU3pn?=
 =?utf-8?B?SytSZDBaMFZPMnlFYWI3Mlc3N2oxeENzdmltakt3Z1BOVHM3bUlkekNmKzJK?=
 =?utf-8?B?Q1Y2V0JaZHNZd2VXNTdTVVROWExUbnF0VzN1cE94cUdLYk9ETXkxL3BNbEJz?=
 =?utf-8?B?TDJaTWc1UkRadjJkUmxkazh6NUNCZWxOSnFLUEFlWG9jYWZ4NG9UWWV3Mllv?=
 =?utf-8?B?b21YaGg1Ym5ZZkhXWm03Wi9GejZVWnl0MjFjRDRXVldKQ1FRTmtBUHVRNWwv?=
 =?utf-8?B?ZktDVTZXa2Z2czdydjNpR1kwOW9hOE9jZ1hPOEYyU1RVVjlhcHdvVjhlKzU4?=
 =?utf-8?B?TmtEdlYwOGlNdEtqWlU5djYrT0dhS1hEajA0WkxrU0lSWjZjZlpQZEovSXM1?=
 =?utf-8?B?dXowbG1Kd291SVdldUhldjZIUUJXUzI4dk1SaGVJd1MxKytBeEJFenJZNDRI?=
 =?utf-8?B?SmJjbDIrcWV0QlhuWEQ0VnVNSXZnY1dPaXNKc3JkaEg4cDdrOWt1dmgrNXo2?=
 =?utf-8?B?UW9xZ3hpM2NzMGF6Mk9ISTB4SDY3eGRCNmdIZVFjczY3VWRPc29MZmJNVjdt?=
 =?utf-8?B?dmFIeWh3bXgzZHdMMndTUHMrVWdHdm51cWhIUU1nOTdVS2lDeVlrWWVKd2pO?=
 =?utf-8?B?WWNPUUxLU0ZCOTd6SllHMklIZkZwM2Z0bHh0ZC9xMzRXZUVLT1VuWGVFWGxC?=
 =?utf-8?B?TWsrdEd4QjE4QkZ2RC9ua2pvSGw3WnhhVGhsRWhEOTVucUhVQzNweVdLcmU3?=
 =?utf-8?B?czFaZFdEN1dnNWxYNCt6WnJySTlGSlRzanFSL2FMSFhxVTJUdndNc1hoT0pR?=
 =?utf-8?B?aTErVmkrYklvZW9la3dOTVk2azRqS0Z6WXArb0JmR2JjMHRNNXZmSGgxK3NO?=
 =?utf-8?B?bDJUUm9aeXA3RmYrenZEb2Y0YkFyRlhqdnlWcmdXM1FzK0hsUmZ2WjdOSE1N?=
 =?utf-8?B?U3VvTUdzVHpBcUY4U3hOT21zSVgxWkI3eXRBdGZNMHZjRlFPWjh0akFUNjNH?=
 =?utf-8?B?bVVld3czdE1nNWJwczFBWnJCL0lLTDJUTFJWdUEzaFhXRndQV1hXYUZKcXhp?=
 =?utf-8?Q?2ho4Ren5puEBxNcp4ZbTV1lfL2jTmqHJm0W6VUyPrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D48CB13A674D7246A0135BC7EF5AF15A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e33575a3-c525-4bda-90b5-08d9ab39133a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 08:46:27.2800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGHvFxUCE/QTU2G2vg2zx+lqrRUDv1stnCUQa60n7vMaG+JMpjMj8BAnSFsV5llwOhAuRuXyk2CAoAkYKygqQGfW+L5x2SAyxSjdwH3I/WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3035
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzExLzIwMjEgw6AgMjE6MzYsIEtlZXMgQ29vayBhIMOpY3JpdMKgOg0KPiBJbiBw
cmVwYXJhdGlvbiBmb3IgRk9SVElGWV9TT1VSQ0UgcGVyZm9ybWluZyBjb21waWxlLXRpbWUgYW5k
IHJ1bi10aW1lDQo+IGZpZWxkIGJvdW5kcyBjaGVja2luZyBmb3IgbWVtc2V0KCksIGF2b2lkIGlu
dGVudGlvbmFsbHkgd3JpdGluZyBhY3Jvc3MNCj4gbmVpZ2hib3JpbmcgZmllbGRzLg0KPiANCj4g
QWRkIGEgc3RydWN0X2dyb3VwKCkgZm9yIHRoZSBzcGUgcmVnaXN0ZXJzIHNvIHRoYXQgbWVtc2V0
KCkgY2FuIGNvcnJlY3RseSByZWFzb24NCj4gYWJvdXQgdGhlIHNpemU6DQo+IA0KPiAgICAgSW4g
ZnVuY3Rpb24gJ2ZvcnRpZnlfbWVtc2V0X2NoaycsDQo+ICAgICAgICAgaW5saW5lZCBmcm9tICdy
ZXN0b3JlX3VzZXJfcmVncy5wYXJ0LjAnIGF0IGFyY2gvcG93ZXJwYy9rZXJuZWwvc2lnbmFsXzMy
LmM6NTM5OjM6DQo+ICAgICA+PiBpbmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmg6MTk1OjQ6
IGVycm9yOiBjYWxsIHRvICdfX3dyaXRlX292ZXJmbG93X2ZpZWxkJyBkZWNsYXJlZCB3aXRoIGF0
dHJpYnV0ZSB3YXJuaW5nOiBkZXRlY3RlZCB3cml0ZSBiZXlvbmQgc2l6ZSBvZiBmaWVsZCAoMXN0
IHBhcmFtZXRlcik7IG1heWJlIHVzZSBzdHJ1Y3RfZ3JvdXAoKT8gWy1XZXJyb3I9YXR0cmlidXRl
LXdhcm5pbmddDQo+ICAgICAgIDE5NSB8ICAgIF9fd3JpdGVfb3ZlcmZsb3dfZmllbGQoKTsNCj4g
ICAgICAgICAgIHwgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IA0KPiBSZXBvcnRlZC1i
eToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEtl
ZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3Bo
ZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQpIb3dldmVyLCBpcyBpdCBy
ZWFsbHkgd29ydGggYWRkaW5nIHRoYXQgZ3JvdXBpbmcgPyBXb3VsZG4ndCBpdCBiZSANCmNsZWFu
ZXIgdG8gaGFuZGxlIGV2cltdIGFuZCBhY2Mgc2VwYXJhdGVseSA/IE5vdyB0aGF0IHdlIGFyZSB1
c2luZyANCnVuc2FmZSB2YXJpYW50cyBvZiBnZXQvcHV0IHVzZXIgcGVyZm9ybWFuY2Ugd291bGRu
J3QgYmUgaW1wYWN0ZWQuDQoNCkkgaGF2ZSBzb21lIGRvdWJ0cyBhYm91dCB0aGluZ3MgbGlrZToN
Cg0KCXVuc2FmZV9jb3B5X3RvX3VzZXIoJmZyYW1lLT5tY192cmVncywgY3VycmVudC0+dGhyZWFk
LmV2ciwNCgkJCQkgICAgRUxGX05FVlJSRUcgKiBzaXplb2YodTMyKSwgZmFpbGVkKTsNCg0KQmVj
YXVzZSBhcyBmYXIgYXMgSSBjYW4gc2VlLCBFTEZfTkVWUlJFRyBpcyAzNCBidXQgbWNfdnJlZ3Mg
aXMgYSB0YWJsZSANCm9mIDMzIHUzMiBhbmQgaXMgYXQgdGhlIGVuZCBvZiB0aGUgc3RydWN0dXJl
Og0KDQoJc3RydWN0IG1jb250ZXh0IHsNCgkJZWxmX2dyZWdzZXRfdAltY19ncmVnczsNCgkJZWxm
X2ZwcmVnc2V0X3QJbWNfZnJlZ3M7DQoJCXVuc2lnbmVkIGxvbmcJbWNfcGFkWzJdOw0KCQllbGZf
dnJyZWdzZXRfdAltY192cmVncyBfX2F0dHJpYnV0ZV9fKChfX2FsaWduZWRfXygxNikpKTsNCgl9
Ow0KDQoJdHlwZWRlZiBlbGZfdnJyZWdfdCBlbGZfdnJyZWdzZXRfdFtFTEZfTlZSUkVHXTsNCg0K
CSMgZGVmaW5lIEVMRl9ORVZSUkVHCTM0CS8qIGluY2x1ZGVzIGFjYyAoYXMgMikgKi8NCgkjIGRl
ZmluZSBFTEZfTlZSUkVHCTMzCS8qIGluY2x1ZGVzIHZzY3IgKi8NCg0KDQoNCj4gLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgIDYgKysrKy0tDQo+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9zaWduYWxfMzIuYyAgICAgIHwgMTQgKysrKysrKysrLS0tLS0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oDQo+IGluZGV4IGUzOWJkMGZmNjlmMy4u
OTc4YTgwMzA4NDY2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcHJv
Y2Vzc29yLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oDQo+
IEBAIC0xOTEsOCArMTkxLDEwIEBAIHN0cnVjdCB0aHJlYWRfc3RydWN0IHsNCj4gICAJaW50CQl1
c2VkX3ZzcjsJLyogc2V0IGlmIHByb2Nlc3MgaGFzIHVzZWQgVlNYICovDQo+ICAgI2VuZGlmIC8q
IENPTkZJR19WU1ggKi8NCj4gICAjaWZkZWYgQ09ORklHX1NQRQ0KPiAtCXVuc2lnbmVkIGxvbmcJ
ZXZyWzMyXTsJLyogdXBwZXIgMzItYml0cyBvZiBTUEUgcmVncyAqLw0KPiAtCXU2NAkJYWNjOwkJ
LyogQWNjdW11bGF0b3IgKi8NCj4gKwlzdHJ1Y3RfZ3JvdXAoc3BlLA0KPiArCQl1bnNpZ25lZCBs
b25nCWV2clszMl07CS8qIHVwcGVyIDMyLWJpdHMgb2YgU1BFIHJlZ3MgKi8NCj4gKwkJdTY0CQlh
Y2M7CQkvKiBBY2N1bXVsYXRvciAqLw0KPiArCSk7DQo+ICAgCXVuc2lnbmVkIGxvbmcJc3BlZnNj
cjsJLyogU1BFICYgZUZQIHN0YXR1cyAqLw0KPiAgIAl1bnNpZ25lZCBsb25nCXNwZWZzY3JfbGFz
dDsJLyogU1BFRlNDUiB2YWx1ZSBvbiBsYXN0IHByY3RsDQo+ICAgCQkJCQkgICBjYWxsIG9yIHRy
YXAgcmV0dXJuICovDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbF8z
Mi5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWduYWxfMzIuYw0KPiBpbmRleCAwMGE5YzljZDZk
NDIuLjVlMTY2NGI1MDFlNCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWdu
YWxfMzIuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbF8zMi5jDQo+IEBAIC01
MjcsMTYgKzUyNywyMCBAQCBzdGF0aWMgbG9uZyByZXN0b3JlX3VzZXJfcmVncyhzdHJ1Y3QgcHRf
cmVncyAqcmVncywNCj4gICAJcmVnc19zZXRfcmV0dXJuX21zcihyZWdzLCByZWdzLT5tc3IgJiB+
KE1TUl9GUCB8IE1TUl9GRTAgfCBNU1JfRkUxKSk7DQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19T
UEUNCj4gLQkvKiBmb3JjZSB0aGUgcHJvY2VzcyB0byByZWxvYWQgdGhlIHNwZSByZWdpc3RlcnMg
ZnJvbQ0KPiAtCSAgIGN1cnJlbnQtPnRocmVhZCB3aGVuIGl0IG5leHQgZG9lcyBzcGUgaW5zdHJ1
Y3Rpb25zICovDQo+ICsJLyoNCj4gKwkgKiBGb3JjZSB0aGUgcHJvY2VzcyB0byByZWxvYWQgdGhl
IHNwZSByZWdpc3RlcnMgZnJvbQ0KPiArCSAqIGN1cnJlbnQtPnRocmVhZCB3aGVuIGl0IG5leHQg
ZG9lcyBzcGUgaW5zdHJ1Y3Rpb25zLg0KPiArCSAqIFNpbmNlIHRoaXMgaXMgdXNlciBBQkksIHdl
IG11c3QgZW5mb3JjZSB0aGUgc2l6aW5nLg0KPiArCSAqLw0KPiArCUJVSUxEX0JVR19PTihzaXpl
b2YoY3VycmVudC0+dGhyZWFkLnNwZSkgIT0gRUxGX05FVlJSRUcgKiBzaXplb2YodTMyKSk7DQo+
ICAgCXJlZ3Nfc2V0X3JldHVybl9tc3IocmVncywgcmVncy0+bXNyICYgfk1TUl9TUEUpOw0KPiAg
IAlpZiAobXNyICYgTVNSX1NQRSkgew0KPiAgIAkJLyogcmVzdG9yZSBzcGUgcmVnaXN0ZXJzIGZy
b20gdGhlIHN0YWNrICovDQo+IC0JCXVuc2FmZV9jb3B5X2Zyb21fdXNlcihjdXJyZW50LT50aHJl
YWQuZXZyLCAmc3ItPm1jX3ZyZWdzLA0KPiAtCQkJCSAgICAgIEVMRl9ORVZSUkVHICogc2l6ZW9m
KHUzMiksIGZhaWxlZCk7DQo+ICsJCXVuc2FmZV9jb3B5X2Zyb21fdXNlcigmY3VycmVudC0+dGhy
ZWFkLnNwZSwgJnNyLT5tY192cmVncywNCj4gKwkJCQkgICAgICBzaXplb2YoY3VycmVudC0+dGhy
ZWFkLnNwZSksIGZhaWxlZCk7DQo+ICAgCQljdXJyZW50LT50aHJlYWQudXNlZF9zcGUgPSB0cnVl
Ow0KPiAgIAl9IGVsc2UgaWYgKGN1cnJlbnQtPnRocmVhZC51c2VkX3NwZSkNCj4gLQkJbWVtc2V0
KGN1cnJlbnQtPnRocmVhZC5ldnIsIDAsIEVMRl9ORVZSUkVHICogc2l6ZW9mKHUzMikpOw0KPiAr
CQltZW1zZXQoJmN1cnJlbnQtPnRocmVhZC5zcGUsIDAsIHNpemVvZihjdXJyZW50LT50aHJlYWQu
c3BlKSk7DQo+ICAgDQo+ICAgCS8qIEFsd2F5cyBnZXQgU1BFRlNDUiBiYWNrICovDQo+ICAgCXVu
c2FmZV9nZXRfdXNlcihjdXJyZW50LT50aHJlYWQuc3BlZnNjciwgKHUzMiBfX3VzZXIgKikmc3It
Pm1jX3ZyZWdzICsgRUxGX05FVlJSRUcsIGZhaWxlZCk7DQo+IA==
