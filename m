Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D3877021
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 10:55:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=c0rxJUii;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsJLt5SxLz3vYv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 20:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=c0rxJUii;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TsJL95L5Pz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 20:54:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHVsKxGXFC9go/AlVEJM++npfSLn1gB6jPCjYedTsHLl0LY5MjKUwy7l29mBlgm+H7kT0IWMYpdkHy4qRUvxY7qy9HmqYs/NzdWS3tVQq2j+JfpfmYZ+R6yYXUHHFRSInUYJcadVSKHLG+Ong+EqGI/4+j6Uz2Kc4g9RJngvbJG36ItBNda0s6O5nnisfh68kp2gBMM/eZdFZYZ+TjCmXtQGUV10KCShli6XTBO00Fi68T6Bexz9nTEQzhwlB4yJtg0cwSpTrmAOMa1SYhuiKA0zPn8zAFBx9so6LFkBKFyJH+txWLSMHaWuLKGbG8cua/6+h9WggoTX+4+sNHiRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhoCGnXEHzXRA4GWatYlmkJZJLwhmayNskiohW6T4fE=;
 b=WHNcXKK9F+ilEjxFezWU3o4SHmvw5PvK3+HHmBaW4sZFbiWzJcbFVfF/kRiHOdQNjfCqsRoN2dkabflNeytCR3bzdOYgf9DxRFL0JEwhJm42tOIg79e1r+OUbHNYrhrwV5o4PEKAU1HhQzmGtjJ125Hj6niTb2yCeHE4eSm43U+TviGjp2y8e5yg06qEw+V+mD0oJaF6EpKhMQj1zfF9s3eZ9qaVdM5uU3BVlgm9xDSiioT5YAxjNsmJ8oKZSbqbhRuuaa6F+uhcZs5XUQnb0nANky44UOxFDTNEGx5joARhUtnjcRxEIv+F6RW50RkkY5mESWJu9KQ/oTy5mf1Ntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhoCGnXEHzXRA4GWatYlmkJZJLwhmayNskiohW6T4fE=;
 b=c0rxJUiihet8wapEXjhPVhW5da9AJRQtNrCRu9ko91QzaMs03wniVLj8u8TIZEv9n8OsuHWUzLEb0YAHsBjqwd0/ariSzsbb5RPPprVE3K4LmLy1Uc4Xd3Bk1e8oJj5joESHTzDUGa74ybxw0YuuV4unuzc24YCJU4GCgTNhaQRpjW6T5LENm869OK2sUNaLbYR/oCtQ8UPccnTmDZKV96PaIcn0ivNobUOAIq6IW322psBLUwhKtERaK4IsIwxtI8EOJeFcQZelyXwHGQrW5q+PBNj8flor1WnNOKFRgm693/h+d5fTSfdNnjmBrzL7mi+s4gvVX+I+awSTMluehA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sat, 9 Mar
 2024 09:54:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.031; Sat, 9 Mar 2024
 09:54:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "irogers@google.com"
	<irogers@google.com>, "namhyung@kernel.org" <namhyung@kernel.org>
Subject: Re: [PATCH 3/3] tools/perf/arch/powerc: Add get_arch_regnum for
 powerpc
Thread-Topic: [PATCH 3/3] tools/perf/arch/powerc: Add get_arch_regnum for
 powerpc
Thread-Index: AQHacfNe3jEDhePPPkmbU6MiSyY7bLEvK6oA
Date: Sat, 9 Mar 2024 09:54:34 +0000
Message-ID: <6e09dc28-4a2e-49d8-a2b5-ffb3396a9952@csgroup.eu>
References: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com>
 <20240309072513.9418-4-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240309072513.9418-4-atrajeev@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3119:EE_
x-ms-office365-filtering-correlation-id: cd135fd4-50b1-43bf-c6f0-08dc401eec87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  c8uY7SMKUvuJGgrGki+tkzt4zba86479pw8c1BbIekjQETh5ehGj1at9cQUSNeSaKVFyx4tO2IEaKBNYjcasevUIFpe6OiLSiSffWRAPwTTdBkCPfYhwiVM5gIJffqfdLxMPt44U0MJzSxT2rcTjPecjSZ7qfHxk2Q8djW4Kdpuh4hlSwpJi/arLL2HMFyncyF3UOme7VOOwlMnH6cUIB2oBL7uD3UstSkBZYFFVvTd0Lqp8RhrazkTbSdpHgkiDvqkNlpVHNPtlN+LJQ8Kn6ICPdb0OkVGT4ZTkYtIRSecDe06MoHTP0srAy4Lg4lN1H1ryDjNi4Im3tcOauN28w77d/AqBYR4hFky/g2JzoycH7ftgtVQhV0yophUBEzI6M7hYAnSyp5x7lmgrKU+KgR9Nvq372cXtnAuFwlysOeZtY2lueLrhwsEty1f4yff+OkzO87rhKcGt0ccJK+rkU0oon9IqEVZD7gIdO9j08pIzvdt8KdwIOu0VuSzGLro0/C1GA5eV+34/sxAZthcQzWj2sG+330DlJNDd5kQptix82+TqCTR7MRM2qgEhoL8U6XaG8CA9jDLEiCa5mBTTjsVfz0qN/3AIuF4zwlYtsV1vV9IQ3UBlcotlbc4uBpWBIeX4wDGNJlvYOBgJ5fRDcM+bwhfBqCn9ThmP+7JpbkfBYLN089KEhNzzMxaQTdUlWEEPT9fk73iqnfexXD2dTw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NElkK0hGQTEvUDhYRlZSNmtISUlJeFM4eCt4V3Naa0ZjcCtzbjNTRGlrZTdO?=
 =?utf-8?B?Y0laVjRGYThPSzVKK3Bxbkh2eFRxaUQ5SXRXSjNUTjBCMTloNXZmZ2g4NW5q?=
 =?utf-8?B?UlRXNXFyemZjUHNiZ1h3L3ljbjlwN1VwYTZIKzFSc0JrY29PVWlCeldDaUZB?=
 =?utf-8?B?VnN1TXlxU0dreE0vY2N0UU9PeEVpNll6YW9Oa0JwZk1vejA0dDAyZVo1dURH?=
 =?utf-8?B?VWhGd0c5U2c2SVVSUE9pbVY5NVlJRklJR3VpZ0dCS25SS1l0YUxtSFNMMW9B?=
 =?utf-8?B?Tys1UFZtbEFQcGtPbE5icVh1czdORXR4SlJyK0hEeFpLS3MxVVZhRitMQnMx?=
 =?utf-8?B?S2xDOVJZMVA2N1gvQXg2VXdhcktzV1dsczJRZThUWEg0dXc2S3F5UGVGUFEy?=
 =?utf-8?B?VnVqZ2Z6akNhaVNneE03eCt5dm4wNlQyNEFiVXVZbmlzd3VSZlJvV2IvSmZn?=
 =?utf-8?B?Y3A2amptSGVMSndsSkdGbDJKTXJjNFdmeVVMc1lBLzVZSEZ0QkxxcEgwQU5l?=
 =?utf-8?B?UlExQ3RCQ010a1VPNi9lc203VTNvYkxTbnZVSWkzMVB6U1VUamJHNHhIRVp0?=
 =?utf-8?B?aGs5L1dud0ZqcnpiNUh5NlR2anJKUG9qVlIzNllNbmt2V1g1MkNOb3hZWjQ2?=
 =?utf-8?B?WVVNZ3d2cUNBam5DbjRPanRtNWtUY0tFcHlTVzFIR2tZNkNmU2NId1BjRHg4?=
 =?utf-8?B?RSt5WWo5TmE2UFdUVGI5bEYzb25Ia0t0YWtvSGt6VlNxRld0SjllU3k1WTZO?=
 =?utf-8?B?bnQ3OEsraTkxSVhNSUlKMEY1dGU2MEZvTVBqcXBHbXNRRWRNcDFCMGtTVWxL?=
 =?utf-8?B?cHJwUW1VdGgxRWVKdXpSU0FhQzR2bVNacGlHQUZ0WkprVjVPVWJKM0lXSDVu?=
 =?utf-8?B?RlljMFZvRXQrTTQxVWl3QjNoNzR4VHRrSkRyTDUwaklxdmJ2bEdQMGF1YUFO?=
 =?utf-8?B?d3hKVXJzeHZTRTBMOHA3MVk3aEtlbUdPTlQxQ2paRkc0SUxZWVRzZVl0d2tX?=
 =?utf-8?B?T3V4Rk5TdEtVKzg4SzhZamZPWVh5QWNFNW1vZFZLUmJqNlgwb1dtNnV0WmV3?=
 =?utf-8?B?Umh2ZXhpemxyN05VMWVrY2N3Zm5EMXRLeGo0ZlBxOHplQWtWejNiQnBZRm9w?=
 =?utf-8?B?KzBzRllabDY1bW4yc2xCYjk0RGc1dThrQ1VsaENjNm5RWGdWeVZ2Smh5NXdC?=
 =?utf-8?B?eE1GR0tQY3d0QlpOcjY4eWZYd245N251NlRvdzNzeWQyeU0zQVRmNE5HM3pE?=
 =?utf-8?B?K1Y5T0dVZmpSc1ZqTkNOSlk5cDU4U2pVa2UwZWI3MVZPTzFJNTFGMGFYeEZM?=
 =?utf-8?B?RlJVSVZRM3gxV3NpdHJPbGM5UVN2a0ZYWEZqZ1BXWENLVWtvM3JURVZCeGZv?=
 =?utf-8?B?WnI3NEhnUVVrWGpNMWJ4dnVROElySnN5OHpmZ0lYYnlMM2lmSjUwbGloMC8z?=
 =?utf-8?B?b3hFbXRsemQyaWcrcXdPZzRxaFVJYURtSXBjUFJNeGM0TmpXY2pMdUd2Vysv?=
 =?utf-8?B?cEhOdkdPOWp1YzdtRFZLSk1WUml1SCtONUdQNHdHRzRsVEJDSDdEdG9samJP?=
 =?utf-8?B?YTQ2ci9xc3NQallmeUhKOFE2ZzVZVmdoZUlEZlZiVWFOY0daMzRDb2Y5ZDNs?=
 =?utf-8?B?TXhBanNhbjNtbmtvNVBhVXBSY3ZFeW9FbFhrQzljMEFOeFI3N3dKYURPdlRQ?=
 =?utf-8?B?eEV4U3JncFJPNDBWbndvUklvdis4TG1XYVNPT1FETmcvOU1XRVJwSVBiMDIx?=
 =?utf-8?B?QjhuV0lXaGtiZ2VNSUZUY2ZWQnp6VWthMWxiYUhMcVJKSFZrczBkM0RzVE5O?=
 =?utf-8?B?bE83UlIrUXp5L1E3Rk1UZk5JWGt2QkRSbDRyK0YvQ3N4c0FhYjFhL1hpQytW?=
 =?utf-8?B?dGJGemxvcFpHZWxKeW9nQ3M0bDRmUm1XUmlwU2thd2tNMnhweDdOSmIvL0Z1?=
 =?utf-8?B?UEd2VTlKVXI0YjRyMU01THhXOW5nRndFZ1ErRGJpOU55N1FLZ2RrNE1GVFlM?=
 =?utf-8?B?TDMrTjdBKzVEazJEczZjRHhxRlNUS3RoZVFReDg3NTlDWm1jdnpNY0ZXWHFt?=
 =?utf-8?B?NDhnTHdUYXlxdDE0L2VPbloyaVMrcWRmU1N2WUVkMTdJUnVHVVB6SmxsVjNC?=
 =?utf-8?Q?4VAX+VBmOCDVqet4FAmR2VkVH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C003D63579E844E96682F8A6FA8A193@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd135fd4-50b1-43bf-c6f0-08dc401eec87
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 09:54:34.0981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wkr12T4QM2pgK0dkpHCGKE+xrPhnGqlJlv8WuxoioBBZB/jejWVGi5C83CP+EDkGRHYP507Otdsswpja76OC/5iwvv+gwYKuIApJOLwbEw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3119
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
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzAzLzIwMjQgw6AgMDg6MjUsIEF0aGlyYSBSYWplZXYgYSDDqWNyaXTCoDoNCj4g
VGhlIGZ1bmN0aW9uIGdldF9kd2FyZl9yZWdudW0oKSByZXR1cm5zIGEgRFdBUkYgcmVnaXN0ZXIg
bnVtYmVyDQo+IGZyb20gYSByZWdpc3RlciBuYW1lIHN0cmluZy4gVGhpcyBjYWxscyBhcmNoIHNw
ZWNpZmljIGZ1bmN0aW9uDQo+IGdldF9hcmNoX3JlZ251bSB0byByZXR1cm4gcmVnaXN0ZXIgbnVt
YmVyIGZvciBjb3JyZXNwb25kaW5nIGFyY2guDQo+IEFkZCBtYXBwaW5ncyBmb3IgcmVnaXN0ZXIg
bmFtZSB0byByZWdpc3RlciBudW1iZXIgaW4gcG93ZXJwYyBjb2RlOg0KPiBhcmNoL3Bvd2VycGMv
dXRpbC9kd2FyZi1yZWdzLmMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEF0aGlyYSBSYWplZXYgPGF0
cmFqZWV2QGxpbnV4LnZuZXQuaWJtLmNvbT4NCj4gLS0tDQo+ICAgdG9vbHMvcGVyZi9hcmNoL3Bv
d2VycGMvdXRpbC9kd2FyZi1yZWdzLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvcGVyZi9hcmNoL3Bvd2VycGMvdXRpbC9kd2FyZi1yZWdzLmMgYi90b29scy9wZXJmL2FyY2gv
cG93ZXJwYy91dGlsL2R3YXJmLXJlZ3MuYw0KPiBpbmRleCAwYzRmNGNhZjUzYWMuLmQ5NTVlM2U1
NzdlYSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvdXRpbC9kd2FyZi1y
ZWdzLmMNCj4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvdXRpbC9kd2FyZi1yZWdzLmMN
Cj4gQEAgLTk4LDMgKzk4LDMyIEBAIGludCByZWdzX3F1ZXJ5X3JlZ2lzdGVyX29mZnNldChjb25z
dCBjaGFyICpuYW1lKQ0KPiAgIAkJCXJldHVybiByb2ZmLT5wdHJlZ3Nfb2Zmc2V0Ow0KPiAgIAly
ZXR1cm4gLUVJTlZBTDsNCj4gICB9DQo+ICsNCj4gK3N0cnVjdCBkd2FyZl9yZWdzX2lkeCB7DQo+
ICsJY29uc3QgY2hhciAqbmFtZTsNCj4gKwlpbnQgaWR4Ow0KPiArfTsNCj4gKw0KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBkd2FyZl9yZWdzX2lkeCBwb3dlcnBjX3JlZ2lkeF90YWJsZVtdID0gew0K
PiArCXsgInIwIiwgMCB9LCB7ICJyMSIsIDEgfSwgeyAicjIiLCAyIH0sIHsgInIzIiwgMyB9LCB7
ICJyNCIsIDQgfSwNCj4gKwl7ICJyNSIsIDUgfSwgeyAicjYiLCA2IH0sIHsgInI3IiwgNyB9LCB7
ICJyOCIsIDggfSwgeyAicjkiLCA5IH0sDQo+ICsJeyAicjEwIiwgMTAgfSwgeyAicjExIiwgMTEg
fSwgeyAicjEyIiwgMTIgfSwgeyAicjEzIiwgMTMgfSwgeyAicjE0IiwgMTQgfSwNCj4gKwl7ICJy
MTUiLCAxNSB9LCB7ICJyMTYiLCAxNiB9LCB7ICJyMTciLCAxNyB9LCB7ICJyMTgiLCAxOCB9LCB7
ICJyMTkiLCAxOSB9LA0KPiArCXsgInIyMCIsIDIwIH0sIHsgInIyMSIsIDIxIH0sIHsgInIyMiIs
IDIyIH0sIHsgInIyMyIsIDIzIH0sIHsgInIyNCIsIDI0IH0sDQo+ICsJeyAicjI1IiwgMjUgfSwg
eyAicjI2IiwgMjYgfSwgeyAicjI3IiwgMjcgfSwgeyAicjI3IiwgMjcgfSwgeyAicjI4IiwgMjgg
fSwNCj4gKwl7ICJyMjkiLCAyOSB9LCB7ICJyMzAiLCAzMCB9LCB7ICJyMzEiLCAzMSB9LA0KPiAr
fTsNCj4gKw0KPiAraW50IGdldF9hcmNoX3JlZ251bShjb25zdCBjaGFyICpuYW1lKQ0KPiArew0K
PiArCXVuc2lnbmVkIGludCBpOw0KPiArDQo+ICsJaWYgKCpuYW1lICE9ICdyJykNCj4gKwkJcmV0
dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShwb3dlcnBj
X3JlZ2lkeF90YWJsZSk7IGkrKykNCj4gKwkJaWYgKCFzdHJjbXAocG93ZXJwY19yZWdpZHhfdGFi
bGVbaV0ubmFtZSwgbmFtZSkpDQo+ICsJCQlyZXR1cm4gcG93ZXJwY19yZWdpZHhfdGFibGVbaV0u
aWR4Ow0KDQpDYW4geW91IGRvIG1vcmUgc2ltcGxlID8NCg0KU29tZXRoaW5nIGxpa2U6DQoNCglp
bnQgbjsNCg0KCWlmICgqbmFtZSAhPSAncicpDQoJCXJldHVybiAtRUlOVkFMOw0KCW4gPSBhdG9p
KG5hbWUgKyAxKTsNCglyZXR1cm4gbiA+PSAwICYmIG4gPCAzMiA/IG4gOiAtRU5PRU5UOw0KDQo+
ICsNCj4gKwlyZXR1cm4gLUVOT0VOVDsNCj4gK30NCg==
