Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA48C51832A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 13:21:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsyFk4jKPz3064
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 21:21:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::605;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsyFF543Lz2xKW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 21:20:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4bPh7lLjHxavNrx3KXZXIDiat76Rgh75t+j1I7XjSfeK7m6V+4d5GnWgczP7rJEVkTYcWlUudEp/0jZmiJNBBKzSSd7nxU4uoC/0W24eav6nX9JICgc2Yr/1cGK8CYbAXytki0fqQfsX2UJOPnz3exnlTtwEfHy4FLpvMPYSZVDRYMVkxi0G2hN2GFBTVSDgsPaFRMWFMs/1xAN90T4oQ67lk1arFqVTApdNTbsZ/lXTw7V1wTupYwNvuwh6tBUzsIc4YG1Jn3FcoV8elSjVCWDOKGlyTvLawDuRbmcmwEKUh2Lo/Ppu2jjyahYS5Bb4fpOKoVQhIBdoF7fQbQ8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QhDVUh5DMjnuahmVxIbVCX0cZIAz1JZc+sNWpdikA8=;
 b=ED5FGZmDPK1UOLIx3pCTCpj0MHy4/tzYzelljtWIjdc80WMOI510okmZqzyyB4ryHYGVbVpfGoonc8fOW3P9M6NUYsQHFN+mKRcEa0/orzGqH7B++tlqhIYn0yA9fCqsWlhpGdxMdU0KcRdchbwbL36YrZwQZt5qXQgs7jZJTW/l3WXg0Ge592xHkAFNUwQKIAq0R/Puty19eMWwpXYq4eo4yLtYMKk/1idY7+jPV+0QWwW2L51YziYBFkQ0YfTEgFYZjJlq9vzkO06Du4t9Z14QIltjqmMIWhOjUBJvmztSrLe6fjGf7Dpk4ISSFSS1ZoDybU/3oiIVp0JKAkw3Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2343.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 11:20:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 11:20:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak symbols
Thread-Topic: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Thread-Index: AQHYWhpl5ryAcxR0pEGOg1yZCKWDp60DyFuAgAErRACAAGpbAIAGVDIAgACZFoCAAMAVAA==
Date: Tue, 3 May 2022 11:20:22 +0000
Message-ID: <6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220427095415.594e5120@gandalf.local.home>
 <1651129169.fpixr00hgx.naveen@linux.ibm.com>
 <20220428100602.7b215e52@gandalf.local.home>
 <819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
 <20220502195251.5d862365@rorschach.local.home>
In-Reply-To: <20220502195251.5d862365@rorschach.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e50eafe-d54c-4745-52d8-08da2cf6e9c4
x-ms-traffictypediagnostic: PR0P264MB2343:EE_
x-microsoft-antispam-prvs: <PR0P264MB2343A78EF4EE0632A427DCA9EDC09@PR0P264MB2343.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QaHcT8HSZy/9RnygBx4tv0UziPsLbBrs+nYn83pRKNLRNGkBesd8i/MtDg6J0JAUPTAvvJG+w6fnIiH4XzD77BEaCGykAQi1ETzWa/ko4WJKj9iodV5E/jSsEyq1f+rOb8YFVmSJk4ZVQ0fa0xm77t3QW0RY+QDcs80qQ8Nsds+ZgdjpHijhJGN4SVRbrgYV6IcNRE2WK/YPGd39W0hN8jT8VwmxPOapwM6QX/tDlrW9a02U1fNV8fQsE7ZU98Z3ypCj1GDsScUN6Iq+9tTHOQ8ZZaiF9qGCna1gKTunFK8Cj4//ieQB4sKbmfg945EOJry8ZyKrSIG8F9ZSpc2UHAsJaixVXC/CxfYGKNsHtbpc+e7yjQcgZmH1GzLlewEBXdHmphoHJQccucev0exHpiCgZhXVfI4guTP50C/OSSkgpGLpgaYFbJvsuogQqTppM79lMKhr3Fimn9aP2q2wlm7WMgbbDolVkOGnDbr30W7ppr/7ApZiJCSaA2r3N5efUc3Y2XnEiUYAAUNz0FvsZWcNhB/0v0BggMv6eXXLE/NIZxjzkE8CheIzszaJ66fka8ACuWEYpxCpGN9/hCDX4vDK4+2RycEyseflor0wlZ2BiRUly3SjOtX/MkqRoH4T0wNx6jnWrm/rQymoAC+7ZWb/DBPrwXcsvlBvtAch63Pcm5M3O0KMStkCmmPAXSbQ4TMWBFUGksO1NfCQD4XC65vAFuvgx/zgiP9thesD0QjH5oCjy564eaqd4Rbwc7In1Y4LylBFk3ukoBcyAttUag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(5660300002)(2906002)(8676002)(4326008)(508600001)(38070700005)(76116006)(66556008)(66476007)(8936002)(91956017)(66446008)(64756008)(44832011)(122000001)(6486002)(186003)(4744005)(38100700002)(71200400001)(86362001)(31686004)(66574015)(2616005)(36756003)(26005)(83380400001)(6916009)(6512007)(316002)(31696002)(54906003)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTBFRHhLS3lSMlIxL3AvcXd4MHFrTE5IdEpWbm5JTG5tQWlpVVluUitZS1pv?=
 =?utf-8?B?TTlaVXR5dDlEN3NSRm1EcjY4Z0VCbmY2dHlvZmJSQzEvQ1V2czhkcm1OMmtM?=
 =?utf-8?B?NDJKdVUxZnFXMmVWbXYveFNKWkhDMi9hbUZXTlRpWWpMV1crdk9vZCtieWpu?=
 =?utf-8?B?bm5TWkUzUXgwVGMwdlp2THdjLzZNRlpmYi9rMUc5RDlCYi8wYjJGSVQ0cktz?=
 =?utf-8?B?MTU3NE45VTlVRUE5ZTRGMzNoOWxUMllIeXlKT3lZQVoydzJ3SUU2K3hBTEx3?=
 =?utf-8?B?RzVYWmNmZk9qb3hYSXZQZThGakZjT1hqRFcyU2toak1TVVdKbUFMa0FycU5n?=
 =?utf-8?B?bTR6QVl2NGluRWtlSENEUFFGZjdPVS9Iekwya0VaUit1L09aU2RzbUlvUmlr?=
 =?utf-8?B?U3YwWDRYdVVYOXBHVDM5eEMzNGs0b1Z5NXgrbjBQNTFHTnB4Vjl2cmM5OEs3?=
 =?utf-8?B?RUhhcm5MMWVzZnBaVVRnYk9SaGJjUkdjN2dpVUhjdkJjbjBpL3BRZXV6MlNV?=
 =?utf-8?B?UW5FMnN3MnF1aGZDc29hMmVEdEFmSDczcU0zSU9oWm9uSGcvRmZIQVpSVjlp?=
 =?utf-8?B?R1dTSkE5ZWs0dVlqekE4OExjR3NFVTFmeHVnMFM5VklvNzRtaUxndmt0bjlI?=
 =?utf-8?B?c1FXb01XRGlTQXVXVXZlaVhmaVVOYTR6U1E3RkxwckFYc2RkYVJ6YnZTY1Jz?=
 =?utf-8?B?N3M4emthYlRwYlYzRHFKcHlMNEY4QzhqWWFaZ20xNlZUd2RxNVEraXNFQm1j?=
 =?utf-8?B?QVF4QWVpYXl3Qis5OVBVMk9MU2V3QnBlcXVmV0lzMmpLZ1JNbFBGQ0VkS0la?=
 =?utf-8?B?c0U3SXJxNUlHR3lJNG5yZUZPZnlvMlp4cS9FOHkvdXJCZzZDTjdOWGs4ZmRY?=
 =?utf-8?B?UDRVZ3IrUWp6b3QxYmUwS2lPNllEbnI5R2RiVnZ0ejZ1SnhFdVpaN2hkS3BI?=
 =?utf-8?B?cnZuTUlCYkhuVWQzaVdFMWd6ZGpPMXo0cko4ZzdwNkFqUjFSSXVFa1pFa1V3?=
 =?utf-8?B?RklobEVDZ0JadXVNWjlFVGE5UzVsVm9lS3pOaXEramVPYndPb01nSEROalRI?=
 =?utf-8?B?TnU3NmpOZ1hQeXZGcmM5M1FhUzRWUXFWalFrSHFYTXlkNk5weWRpSzlsQm80?=
 =?utf-8?B?QkE4RlVSZmNiWExLM2RDeW44ZTd6am4rS3EvS0hZbFpZSEZBWEZNNldabWVl?=
 =?utf-8?B?MDNKSUlKQTFHSGRuMll3KzlORll6VjdjV2xlSld0QzJqSGlPczNjbkYvOXU1?=
 =?utf-8?B?ajNib1ltdkVIYXI5N3FqTCtjTzBvazhJRWhNWmFaaVdiZ3BmekptZWp1V0pQ?=
 =?utf-8?B?eFZtZFVQUHRWaW9BT1QwbVNDallCOXRnTUtsd0tpSkJJUFY0TXpkLy9MWVYr?=
 =?utf-8?B?a09ndXJRdGtqTjBDN3hFODl6bFdvMzcvRkVJbnVXUm04SktwcGd2dk5oaStP?=
 =?utf-8?B?TTliZkVZOXUvN3cwMlc5cmhrcnJkdUQwRGNkanZ5OHIySitIKzVTcUZZNldm?=
 =?utf-8?B?aHV3ZVJyT0xnL1RRY0ZXZG1abFdNL1ZhK2N0T3F6b3liK0ZjVUJZSVJWUC82?=
 =?utf-8?B?VitLbzA5L0lkY3g5VnpGeG1VN1p0Si9Cdjd6bmhEc1lyWERyK0huY09QVWxI?=
 =?utf-8?B?ekkvQlpDK1hMdDlRd3BFZWZhbWtrVDNVcy9HN2ZVTklqTHd1enBydTBvTGl3?=
 =?utf-8?B?VlFoczJhSS95Yllac3dLZWxhUklJZSsxSVV4V0dRSTZMSHByRnJYMkx6S00w?=
 =?utf-8?B?aWVWSFhoQXFkMzdEZlhXSW5LbkRBVkRsYXA1RU5ZWG41bDVVNk1wM25Cc3Bk?=
 =?utf-8?B?YURjZElxc1A0VmdscTFydFlmUFp0L285TEdBMFhldE1uakpQbld1L3BtK3kx?=
 =?utf-8?B?c0dFOTNEZEt6MXZxdm9ucTJhUERNWGNLVVhValNPSW53UHhxdlR0MTI0TGFC?=
 =?utf-8?B?MVJUbWVMSEJ4aSs4ajNTL1ZpTk85TnkraWVMeU1kT0NNc1hsVUtDT2U0eDh3?=
 =?utf-8?B?cVcrc1Y1clRibGpOSkxCTnN4VVJXNXhOblI5bUxhd2JUMTdGN1NFWERnRllh?=
 =?utf-8?B?bG42N2k2YWU0SHFXR2duYnhCUm5EZ0dicGFtUXFiRHFXdjVFdFhUcVhoZ0dy?=
 =?utf-8?B?ZDBvZ0JNMHZVekNGbEs3S28raVIxL0RKRkV3SFhKWTY3blNucThVdlNRVVEy?=
 =?utf-8?B?d0U5STVTOVVjUmZlMDFqaU9zNXBnbUVQRFEvVytQWTA1MTVVdWpXM3dKeXlU?=
 =?utf-8?B?b3paNUdSbDJzN3orcTVjcjcyNEdCWG5rM2xGLzBhZlV5L2JzOVdHdndpdHpn?=
 =?utf-8?B?YTRaRHdUSzVFWFh2SFNZYkpaeGM2NFVtNE51aExjbWNmZmJJME4wS0NnTFFr?=
 =?utf-8?Q?j7kJ2YbQSoPrB1GKnS3Ab9s64iu9ayjXYwQvr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71EFCC732E1C3D42BBF648768A37BDCE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e50eafe-d54c-4745-52d8-08da2cf6e9c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 11:20:22.1256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oNEGJx2CB8eq4H8//3BXPzvUsC4/qHT2dDf6jXvUwVLtGciqaceWhzUdq/IgkNcjmubKrSNH3sZLQpojtlO5qaf6HEd2VMlQPSLQwMMps9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2343
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA1LzIwMjIgw6AgMDE6NTIsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgMiBNYXkgMjAyMiAxNDo0NDo1NiArMDAwMA0KPiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPiANCj4+IElmIHdlIGRvIHRoYXQg
YWZ0ZXIgdGhlIGxpbmtpbmcsIHdvbid0IGl0IGJlIGEgbmlnaHRtYXJlIHdpdGggdGhlDQo+PiB0
cmFtcG9saW5lcyBpbnN0YWxsZWQgYnkgdGhlIGxpbmtlciB3aGVuIHRoZSBkZXN0aW5hdGlvbiBp
cyBvdmVyIHRoZSAyNA0KPj4gYml0cyBsaW1pdCA/DQo+IA0KPiBOb3Qgc3VyZSB3aGF0IHlvdSBt
ZWFuLiBUaGUgbG9jYXRpb25zIEknbSB0YWxraW5nIGFib3V0IGlzIHRoZSBmdWxsDQo+IGFkZHJl
c3Mgc2F2ZWQgaW4gdGhlIF9fbWNvdW50X2xvYyB0YWJsZSAoZGF0YSBzZWN0aW9uKS4NCj4gDQoN
Ck1heWJlIEkgbWlzdW5kZXJzdG9vZC4gV2hlbiB5b3Ugc2F5ICdhZnRlciBsaW5raW5nJywgZG8g
eW91IG1lYW4gdm1saW51eCANCm9yIHZtbGludXgubyA/DQoNCkluIHZtbGludXgsIHRoZSBhZGRy
ZXNzZXMgdG8gYmUgc2F2ZWQgaW4gX19tY291bnRfbG9jIHRhYmxlIG1pZ2h0IG5vdCANCmNvbnRh
aW4gYW55bW9yZSBhIGNhbGwgdG8gX21jb3VudCBidXQgYSBjYWxsIHRvIGEgdHJhbXBvbGluZSB0
aGF0IGp1bXBzIA0KdG8gX21jb3VudCwgaW4gY2FzZSBfbWNvdW50IGlzIHRvbyBmYXIgZnJvbSB0
aGUgc2FpZCBsb2NhdGlvbiBhdCBsaW5rIA0KdGltZS4gVGhhdCdzIHdoYXQgSSBtZWFudC4NCg0K
Q2hyaXN0b3BoZQ==
