Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C954788C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:28:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlYY47D4z3cX9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:28:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlY12q6Vz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:27:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvXJlfrpH6P8fLdyX1+QQy1PpC0ye/+CWB/vZi1GF+RrGTW9vFOfhDkCURK/x6E+gIq/y/jsQ0IhLf26/ky9ti5Ecr+uMzueQck/1/EDxawKGi7ujBcCAXaF6i7gzXk78ktKGC9qLHUcUqF0rgs6DHpUfCpKpavd3xtnNUQxnHW5AB4yGmF5WpOUzANUrLQn7ew89Fu+ipkGeo7A1LUfF5rUi4nCPYP4Al1w9ulNGkk/HlNgJ1BpZM1RUlGueljE04ySebj9LybmZgH5TBEMthJJNmTljW3JQAVKjeCc6tKbu+Kp6b4Iue4GzpG59FdTH4qAtDjeiw7vDG7MnvTsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxkiiv5aWXf24APu1d1uK6OfDrNuBPm/o2ry/Y1/mR4=;
 b=MRabhMo4NVvkYxwe/D2JQY8uzL+CfVeuvLKtgJhWq8Kxv1M5mjrY05vTlBAEqk/QtePfTY2ird63/j90/5TyKUl0Pr3lM1Og7W6nkSJxSA1kasOrqdThC6kKyA0y9B5ulLs2P/QwTp602JWaWdZLrHuCOaqAdpPtlD9MxgYVWGneriRyUo5hxT1qBwibI1EqWxa7Sw4m/9X2tQgHgNqS8zX5aircNZgkXZ7fmTTMN3hXi5l0Cgat5b5txLArZ10GneJKvaXx3K7vjMqfTSmdu7wSMSq1sJA4He0UKdnMBShDrAFIN5mCe0uHzHKbw6I700ja1TtpgkTAvygtIF2CKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 00/14] Convert powerpc to default topdown mmap layout
Thread-Topic: [PATCH v6 00/14] Convert powerpc to default topdown mmap layout
Thread-Index: AQHX8zCkHNu2aU1u5E+ScvtgOHEdKw==
Date: Fri, 17 Dec 2021 10:27:07 +0000
Message-ID: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e708540-9ef1-4204-1ce3-08d9c147c6db
x-ms-traffictypediagnostic: MR1P264MB1650:EE_
x-microsoft-antispam-prvs: <MR1P264MB16505D5B1E12B8EC64C45E58ED789@MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ArTtyVRZ6hV7Z/kD3FD/ZjpYPlp8XQDrFtcOeoxjBZ2HI2Xak79TwQa+Ia0A+p81hanTDfXgfckfGg2MQamjhDHoyP/I+dHgtLJWY1yppPBOyMyPYHHn4ts5hWWwVj0hIZnLWPWxI2I23OwRIrA7+BEixIGzgUKQadtjAltVGOpLsHwolL1XZHErKJSJzo56+CU7MT1vP+H5VIkMSWHX8SnqONAFRnA5YU6Zj4tnlGTavCDikYKIs2+GFQrvf60YhEeXFXAblg0znPrceAuYkO8hwvG/t81ukjIopzsBZjSs5+cm09MP8NL0c2P5O+E6r+r8dWnSIocC1LAG56Vdh666jALSOtpwkQ9TCv3IcfQMHnfMCx/+xfBoC6fqPo9ZKeL2sMIuhxZ/2KnNKEZjy54dPNWgv/dm2M1eSFAZ3WczzBXvRQVsVLuUyf16ucDLeQuddpid6a3exk0/C9Xf+U6Zho9sa5TiHBft/CYNSepOhiNn8LmlqZW+Lp5mfCsCAjYftVy+5esLUx2rfWzEafGN/KyIX7n0dCQg0zN1cWF7BiwNXh1sDinuY/0nyJOdYBu/ef3TL8on+J4h0/ftFKijPNUKRRDFh7FEklopPqlqGJ7Lrp03i03og8Jjt0tbd08HGn0cYAh3ZbIXnaA1Q8PSFWhKVTxSewLDiHlrAYw7k/UDWkw3sLOR/PrTUe9JHKD1is3fmtMIvI0atyA0rg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(6486002)(6512007)(8676002)(83380400001)(122000001)(36756003)(6506007)(186003)(86362001)(26005)(38070700005)(44832011)(76116006)(66476007)(64756008)(66556008)(5660300002)(38100700002)(66446008)(2616005)(91956017)(66946007)(4326008)(508600001)(316002)(71200400001)(54906003)(7416002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFZuaTlqdk0xMTNjUURXcFZnRVJ0STlkREloMVVsZTF6SkRLbGlFKzZBU2xj?=
 =?utf-8?B?S0dHWjM4NjN6SFJJbk9EeHBoaDhrRmpLS2lGaGljaHZ6REUyMEdTdHJmVVo2?=
 =?utf-8?B?ZzMxSElVRmU4UmJpZDYzMjFZMmhWYkJ0Yk4xa0FnS2VGR3RUMWh5WFRCTGVJ?=
 =?utf-8?B?U0JJUzlyR3FNbGMxNjJhZEdmRWRwMXVlSDBXdXQveWR1dWwxMTFkTGRlVW1I?=
 =?utf-8?B?UGZtL3dXY0JtN1NUamQrK3ZGSGtxVnVpS1hTL2lpY01CQW9iOXF5NVc5MzlC?=
 =?utf-8?B?eDFCOTRLQW5nVEt4Z1Z3VGxwZHhsT3dVaHNhMFZiNkZtZCtvY010cjJ0VWQz?=
 =?utf-8?B?TVNZWTdQUVZKaFZHRk5YREZIWlZKc0RDQThpaCt3RXJubm5YbFI2RDR1d2dV?=
 =?utf-8?B?VEZTWWVad1UzQjRubE5uQkxoV0hSa0Z0WW51dTZDa0dYcUp3M2xYNFEzSDBT?=
 =?utf-8?B?d0VpeWlydHVCREgrcG9KeVZNWFJnT0NINzFnS1B2U1V5eG9OZ2NFRWJGZVpS?=
 =?utf-8?B?S294U0d0Tno0aUpZTkhHWGpYSmxRaytzaWNPUi9kZEVlckNTelc4MG9Ub3hE?=
 =?utf-8?B?TFY3OHo2UlRKM0ptNk9sNHBIekNiNFVvallHYk5zNlY2N1VUbUc4TkY4eERi?=
 =?utf-8?B?aUhOV3ZwUFJmTWN3ZVM0NW9RaXVHbmtzV0NiemZJaDJEZjRDc0Noa3dqTUE2?=
 =?utf-8?B?Y1R1RU9MSEJBNEJzNEMvYlVuU0pRdjJIMUp3Wmd2aStnNE5vUzNMNGZISGJX?=
 =?utf-8?B?NnNVSzAvV2dTMU5uR3FvMlVGZUVjRlNQaHBFbmd4T2RmNTVCT0hWbDNBMURv?=
 =?utf-8?B?TjNsUHI2MFZBZUxBUDZFZnpXT1huT1U2M3NvaDhETGlJUkJ1dG5tZktZT2Jm?=
 =?utf-8?B?MlhKY2ZwVm52ZW1xZkVwQmt3WFRBVXZTeTF4QW55QU15TWFKdUd6c2Z0SkhW?=
 =?utf-8?B?SVh0MHVjeE51OEUzcDlyNk9iNWw0NHc3Ty9Tb20yZ0IwWTRSVy8zeUhjN3lo?=
 =?utf-8?B?dXZxbE1EY1N1d0VJNXNiQXdGOVE2K1c3ZFk3QXZFOU0vb2kyWXFyS2RtM05J?=
 =?utf-8?B?T29MU3Qwd3ZhcVVyV1MwRWRoUDE0Y1hNU3BPTVFWODYvc0hOdVUrODhXZEFB?=
 =?utf-8?B?bTV6enJneDhrMDNweUhPeUVOdUdmRU1yMExxVitQeW01cThMY1RvWVNhdk9v?=
 =?utf-8?B?ckRERFhUUVNIbmdqZFk5K3AyUFBhb21haHB5OWFLRGlYUzNqTEZ6SktxYTA5?=
 =?utf-8?B?VUQxUzJqaTMrQWIrYWxWYllRcmtoQWdxZ1Q0aUJsMFpUbVNMd24xQ25oLzJV?=
 =?utf-8?B?YXhTeW5EOFU1dTMvQXNlS1FWRzh5THN0V0JVR05WVENSblBTalRQQ1lGbG1p?=
 =?utf-8?B?UzhUM0pBcG04V3UzenJEdU95a05OaXJ4eEE5M1VQakYrZDZVTmVjbGFVcjJn?=
 =?utf-8?B?REZpWlJyaFNEb3RhOElBbWthbXpyMEN5UG1GRENRY1BSaDQzNS9mVzh1MTlH?=
 =?utf-8?B?am9YKzVEbnpwUXlxT3hQd1lKWDEvUklxNDM2UHFvQk1ENmV3YStPaDlSQWgy?=
 =?utf-8?B?UllJVG44dG9JQitVYlpmd0tmbmhFRDdJVkJ6OFFBY2plTnlnb2EzWVdiTFRh?=
 =?utf-8?B?YVl5VFBMZGx2cDR1SzA5Y2phdnhEQ0hmTnN0RldCRWxTL0pGbmMwdm1Ia3h6?=
 =?utf-8?B?bmFmZ1hSaEhMblZhYjZYdUZFNDd1UTQzOGtwaTZYY0M1b3ZpN0VwUnpQMVI1?=
 =?utf-8?B?NTIvSXQxL29ZaG5JcGIwUlhXOTdMMFpqS2I0VXM5T1g5SWVLbWIzRXNHQnU3?=
 =?utf-8?B?STRUV2N5R1ZBUGprWHFGWG9CVFJZeUYzRWJCWVJKMzEwTzVOS0JnSXExTjgr?=
 =?utf-8?B?ZzJIcVE4S2x3dlplNXVadVRZSVVMRzE2Vk5tOUp3UkZzVzh0OGRXeTZUMHpm?=
 =?utf-8?B?MnZFdWZ5WFRzQjZDZWlEclNZWmU1UXBZM2RzR095eG5ZVThjdE4rbi9Cb2lZ?=
 =?utf-8?B?Qm95R0NpNUtvTmRuZ2Jqai9HbWtJdFg5U01tNGduS3h5TlZ4bXV2MTF6KzV3?=
 =?utf-8?B?UXowZmI0US95cW10TjZkdHRzQmRSQmhvN2pZVEtMd2ZJeHJUQThQbHhxM1k2?=
 =?utf-8?B?NXQraVN5ZGZycHpKZEx4TmlERkk0NC8vbVp1NjFJaGhaUStmcVcrQlBGMHdw?=
 =?utf-8?B?aFE3ay9UdTRaa0hmUFRhMHJqWlFRMzRGa3Z4WitvSnhORHYxenAxUFV3VnRz?=
 =?utf-8?Q?mI+q31ZdZNb9q+x61twmLus/wHQ+/fiR7gZDFIXdLo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15DA236F893ADE458E9F39E68DC66DCA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e708540-9ef1-4204-1ce3-08d9c147c6db
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:07.1785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmnLH//oQdLz0rF1GmpaNXZ5fiU3yZvGI5lALivG6qNVbn1K+I8Rtk7mwQq+G6tgU+LXSANb7pHZ/f174cPkvPzgZ6JSI5a0syB8mMq4WhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1650
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
Cc: "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UmViYXNlZCBvbiB0b3Agb2YgcG93ZXJwYy9uZXh0IGJyYW5jaA0KDQpUaGlzIHNlcmllcyBjb252
ZXJ0cyBwb3dlcnBjIHRvIGRlZmF1bHQgdG9wZG93biBtbWFwIGxheW91dC4NCg0KcG93ZXJwYyBy
ZXF1aXJlcyBpdHMgb3duIGFyY2hfZ2V0X3VubWFwcGVkX2FyZWEoKSBvbmx5IHdoZW4NCnNsaWNl
cyBhcmUgbmVlZGVkLCB3aGljaCBpcyBvbmx5IGZvciBib29rM3MvNjQuIEZpcnN0IHBhcnQgb2YN
CnRoZSBzZXJpZXMgbW92ZXMgc2xpY2VzIGludG8gYm9vazNzLzY0IHNwZWNpZmljIGRpcmVjdG9y
aWVzDQphbmQgY2xlYW5zIHVwIG90aGVyIHN1YmFyY2hpdGVjdHVyZXMuDQoNCkxhc3QgcGFydCBj
b252ZXJ0cyB0byBkZWZhdWx0IHRvcGRvd24gbW1hcCBsYXlvdXQuDQoNCkEgc21hbGwgbW9kaWZp
Y2F0aW9uIGlzIGRvbmUgdG8gY29yZSBtbSB0byBhbGxvdw0KcG93ZXJwYyB0byBzdGlsbCBwcm92
aWRlIGl0cyBvd24gYXJjaF9yYW5kb21pemVfYnJrKCkNCg0KQW5vdGhlciBtb2RpZmljYXRpb24g
aXMgZG9uZSB0byBjb3JlIG1tIHRvIGFsbG93IHBvd2VycGMNCnRvIHVzZSBnZW5lcmljIHZlcnNp
b25zIG9mIGdldF91bm1hcHBlZF9hcmVhIGZ1bmN0aW9ucyBmb3IgUmFkaXgNCndoaWxlIHN0aWxs
IHByb3ZpZGluZyBpdHMgb3duIGltcGxlbWVudGF0aW9uIGZvciBIYXNoLCB0aGUNCnNlbGVjdGlv
biBiZXR3ZWVuIFJhZGl4IGFuZCBIYXNoIGJlaW5nIGRvaW5nIGF0IHJ1bnRpbWUuDQoNCkxhc3Qg
bW9kaWZpY2F0aW9uIHRvIGNvcmUgbW0gaXMgdG8gZ2l2ZSBsZW4gYW5kIGZsYWdzIHRvDQphcmNo
X2dldF9tbWFwX2VuZCgpLg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCkNoYW5nZXMgaW4gdjY6DQotIE5ldyBwYXRjaCAo
cGF0Y2ggNCkgdG8gdGFrZSBhcmNoX2dldF9tbWFwX2Jhc2UoKSBhbmQgYXJjaF9nZXRfbW1hcF9l
bmQoKSBpbnRvIGFjY291bnQgaW4gZ2VuZXJpYyBodWdldGxiX2dldF91bm1hcHBlZF9hcmVhKCkN
Ci0gR2V0IGJhY2sgYXJjaF9yYW5kb21pemVfYnJrKCkgc2ltcGxpZmljYXRpb24gYXMgaXQgcmVs
aWVzIG9uIGRlZmF1bHQgdG9wZG93biBtbWFwIGxheW91dC4NCi0gRml4ZWQgcHJlY2VkZW5jZSBi
ZXR3ZWVuIHx8IGFuZCAmJiBpbiBwb3dlcnBjJ3MgYXJjaF9nZXRfbW1hcF9lbmQoKSAocGF0Y2gg
OSkNCg0KQ2hhbmdlcyBpbiB2NToNCi0gQWRkZWQgcGF0Y2ggMw0KLSBBZGRlZCBhcmNoX2dldF9t
bWFwX2Jhc2UoKSBhbmQgYXJjaF9nZXRfbW1hcF9lbmQoKSB0byBwYXRjaCA3IHRvIGJldHRlciBt
YXRjaCBvcmlnaW5hbCBwb3dlcnBjIGJlaGF2aW91cg0KLSBTd2l0Y2hlZCBwYXRjaGVkIDEwIGFu
ZCAxMSBhbmQgcGVyZm9ybWVkIGZ1bGwgcmFuZG9taXNhdGlvbiBpbiBwYXRjaCAxMCBqdXN0IGJl
Zm9yZSBzd2l0Y2hpbmcgdG8gZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiwgYXMgc3VnZ2VzdGVkIGJ5
IE5pYy4NCg0KQ2hhbmdlcyBpbiB2NDoNCi0gTW92ZSBhcmNoX3JhbmRvbWl6ZV9icmsoKSBzaW1w
bGlmaWNhdGlvbiBvdXQgb2YgdGhpcyBzZXJpZXMNCi0gQWRkIGEgY2hhbmdlIHRvIGNvcmUgbW0g
dG8gZW5hYmxlIHVzaW5nIGdlbmVyaWMgaW1wbGVtZW50YXRpb24NCndoaWxlIHByb3ZpZGluZyBh
cmNoIHNwZWNpZmljIG9uZSBhdCB0aGUgc2FtZSB0aW1lLg0KLSBSZXdvcmtlZCByYWRpeCBnZXRf
dW5tYXBwZWRfYXJlYSB0byB1c2UgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbg0KLSBSZWJhc2Ugb24g
dG9wIG9mIE5pYydzIHNlcmllcyB2Ng0KDQpDaGFuZ2VzIGluIHYzOg0KLSBGaXhlZCBtaXNzaW5n
IDxsaW51eC9lbGYtcmFuZG9taXplLmg+IGluIGxhc3QgcGF0Y2gNCi0gQWRkZWQgYSBwYXRjaCB0
byBtb3ZlIFNaXzFUIG91dCBvZiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS14Z2VuZS5jDQoN
CkNoYW5nZXMgaW4gdjI6DQotIE1vdmVkIHBhdGNoIDQgYmVmb3JlIHBhdGNoIDINCi0gTWFrZSBn
ZW5lcmljIGFyY2hfcmFuZG9taXplX2JyaygpIF9fd2Vhaw0KLSBBZGRlZCBwYXRjaCA5DQoNCkNo
cmlzdG9waGUgTGVyb3kgKDE0KToNCiAgbW06IEFsbG93IGFyY2ggc3BlY2lmaWMgYXJjaF9yYW5k
b21pemVfYnJrKCkgd2l0aA0KICAgIENPTkZJR19BUkNIX1dBTlRfREVGQVVMVF9UT1BET1dOX01N
QVBfTEFZT1VUDQogIG1tLCBodWdldGxiZnM6IEFsbG93IGFuIGFyY2ggdG8gYWx3YXlzIHVzZSBn
ZW5lcmljIHZlcnNpb25zIG9mDQogICAgZ2V0X3VubWFwcGVkX2FyZWEgZnVuY3Rpb25zDQogIG1t
OiBBZGQgbGVuIGFuZCBmbGFncyBwYXJhbWV0ZXJzIHRvIGFyY2hfZ2V0X21tYXBfZW5kKCkNCiAg
bW0sIGh1Z2V0bGJmczogQWxsb3cgZm9yICJoaWdoIiB1c2Vyc3BhY2UgYWRkcmVzc2VzDQogIHNp
emVzLmg6IEFkZCBTWl8xVCBtYWNybw0KICBwb3dlcnBjL21tOiBNb3ZlIHZtYV9tbXVfcGFnZXNp
emUoKQ0KICBwb3dlcnBjL21tOiBNYWtlIHNsaWNlIHNwZWNpZmljIHRvIGJvb2szcy82NA0KICBw
b3dlcnBjL21tOiBSZW1vdmUgQ09ORklHX1BQQ19NTV9TTElDRVMNCiAgcG93ZXJwYy9tbTogVXNl
IGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWEoKSBhbmQgY2FsbCBpdCBmcm9tDQogICAgYXJjaF9n
ZXRfdW5tYXBwZWRfYXJlYSgpDQogIHBvd2VycGMvbW06IFVzZSBnZW5lcmljX2h1Z2V0bGJfZ2V0
X3VubWFwcGVkX2FyZWEoKQ0KICBwb3dlcnBjL21tOiBNb3ZlIGdldF91bm1hcHBlZF9hcmVhIGZ1
bmN0aW9ucyB0byBzbGljZS5jDQogIHBvd2VycGMvbW06IEVuYWJsZSBmdWxsIHJhbmRvbWlzYXRp
b24gb2YgbWVtb3J5IG1hcHBpbmdzDQogIHBvd2VycGMvbW06IENvbnZlcnQgdG8gZGVmYXVsdCB0
b3Bkb3duIG1tYXAgbGF5b3V0DQogIHBvd2VycGM6IFNpbXBsaWZ5IGFuZCBtb3ZlIGFyY2hfcmFu
ZG9taXplX2JyaygpDQoNCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgICAg
ICAgICAgfCAgIDQgKy0NCiBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0NCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2h1Z2V0
bGIuaCAgfCAgIDQgLQ0KIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvbW11LWhh
c2guaCB8ICAgMSArDQogYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9tbXUuaCAg
ICAgIHwgICA2IC0NCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3NsaWNlLmgg
ICAgfCAgMjQgKysNCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHVnZXRsYi5oICAgICAgICAg
ICAgfCAgIDIgKy0NCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFjYS5oICAgICAgICAgICAg
ICAgfCAgIDcgLQ0KIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmggICAgICAgICAgICAg
ICB8ICAgMSAtDQogYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgICAgICAg
IHwgICAyIC0NCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2xpY2UuaCAgICAgICAgICAgICAg
fCAgNDYgLS0tLQ0KIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS90YXNrX3NpemVfNjQuaCAgICAg
ICB8ICAgOCArDQogYXJjaC9wb3dlcnBjL2tlcm5lbC9wYWNhLmMgICAgICAgICAgICAgICAgICAg
IHwgICA1IC0NCiBhcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgICAgICAg
fCAgNDEgLS0tDQogYXJjaC9wb3dlcnBjL21tL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
IHwgICAzICstDQogYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L01ha2VmaWxlICAgICAgICAgICAg
IHwgICAyICstDQogYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyAgICAgICAg
IHwgIDMzICsrLQ0KIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9odWdldGxicGFnZS5j
ICB8ICA1NSAtLS0tDQogYXJjaC9wb3dlcnBjL21tL3sgPT4gYm9vazNzNjR9L3NsaWNlLmMgICAg
ICAgIHwgIDcxICsrKystDQogYXJjaC9wb3dlcnBjL21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAg
ICAgICAgIHwgIDM0IC0tLQ0KIGFyY2gvcG93ZXJwYy9tbS9tbWFwLmMgICAgICAgICAgICAgICAg
ICAgICAgICB8IDI1NiAtLS0tLS0tLS0tLS0tLS0tLS0NCiBhcmNoL3Bvd2VycGMvbW0vbm9oYXNo
L21tdV9jb250ZXh0LmMgICAgICAgICAgfCAgIDkgLQ0KIGFyY2gvcG93ZXJwYy9tbS9ub2hhc2gv
dGxiLmMgICAgICAgICAgICAgICAgICB8ICAgNCAtDQogYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9L
Y29uZmlnLmNwdXR5cGUgICAgICAgIHwgICA0IC0NCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aS14Z2VuZS5jICAgICAgICAgICAgfCAgIDEgLQ0KIGZzL2h1Z2V0bGJmcy9pbm9kZS5jICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyNiArLQ0KIGluY2x1ZGUvbGludXgvaHVnZXRsYi5oICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNSArDQogaW5jbHVkZS9saW51eC9zY2hlZC9tbS5oICAg
ICAgICAgICAgICAgICAgICAgIHwgIDE3ICsrDQogaW5jbHVkZS9saW51eC9zaXplcy5oICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICsNCiBtbS9tbWFwLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNDMgKy0tDQogbW0vdXRpbC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICstDQogMzEgZmlsZXMgY2hhbmdlZCwgMTg1IGluc2Vy
dGlvbnMoKyksIDUzNSBkZWxldGlvbnMoLSkNCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3NsaWNlLmgNCiByZW5hbWUgYXJjaC9wb3dlcnBjL21tL3sgPT4gYm9v
azNzNjR9L3NsaWNlLmMgKDkxJSkNCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL21t
L21tYXAuYw0KDQotLSANCjIuMzMuMQ0K
