Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D911E4E21A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 08:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMRmR5Xq9z3bSy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 18:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMRlz45qCz3036
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 18:57:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK6/BKbtG1bXulIsbhT8ZTYBStY5CqzuKc/DH9yKyk1jooW4fNRwB4Xpx2f2sHv533Uwe1A35VLsHVIRFHfo3Wl7Z2CrqgKfofkRLPJlArr2dZ/Eh8x0N0GA5txUqTvnovxKVIrR/hbxQjsn0qd4oKqJWxFxFhBFohMRiX4J+arBLF2dC1aAxOePQ2VwWWznP20GisH4AozUeScGLjpQ9barLnTA2kKflSaQ6FSFj5/DlTYbDvCrfVr9uRpY3nntSG4PFNJf6aDR8VvHgPPPD01xVdiP5WhiA3r6lEyu6OJCfB/jfUU00gSu2pHWW1WCdjmVRZOTn200qvnilCMt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YBBhUybv1MhMc6B/pHiHpEOpNszQ9ARuBjBbzMuNZU=;
 b=j3J2HpCulW0av7UOLZYINhOj9Ec+YP0giGgvtWUZ0N8DsfMBZvGhLqg0YOcm/Jn7qOIk8rn8zsYBImhqJU1ZGBFH1gmRgg3ICM4MxlT+Ku7kylyhrM04RcEhK5HJT7FZY+Cft3uYIgsuNP7ZIBR6PEuQp+aL89g7s5Wr9dXNJznlVCil0zyCktXdWCWNEcex3OSMNeRU6jKB//x1FC0zo6mrScLMJf6bhwMWpWzMS1r4B0i8IXgdCW3NB3MgimeDmfqb7qSEba53tchyDIzanCDtnPCbGHOuQ5ok75CMpozRyFmYXOlqarJkPK1cDiO4w7/PtAZcykvO8z4R59nYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1876.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 07:56:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 07:56:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Sathvika Vasireddy
 <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Topic: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Index: AQHYOsOkMhd+XrYXYE6fzWpV8XELvKzFK0EAgAP1goCAAFwcgA==
Date: Mon, 21 Mar 2022 07:56:41 +0000
Message-ID: <a688b641-a8ef-8e6b-4f94-da5edd1c6943@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <33447256-81d1-8844-d82f-e8ac94f65fbe@csgroup.eu>
 <87pmmgghvu.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmmgghvu.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1477918-b7fc-4f18-7a4b-08da0b105629
x-ms-traffictypediagnostic: MR1P264MB1876:EE_
x-microsoft-antispam-prvs: <MR1P264MB187685D37B303C8D977F062CED169@MR1P264MB1876.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EfCPbLtEZ5g+92NDBsjEcLF2llJ1hNjLTZRPm2AeTj7jpi6ZZieTMsYhwpFMQyczZiWIr526c2kbH5Qk/O/mRVUXhFAxv9P4/jvbA/827elj8jJE/WVuRLUuq5Rba4OtnOKPzVdFD7qqrHvL0x6UGeYYabsfIgBzhjwF87kQrPwJgmfTfV9V3yhmoQMwspvg8PoES0qjW3w3lLSIBbJEG0OLruN5+euNlRlxq+6yqjQImxfS20GpT12wEnFNEwNZM2ZqEHAkEO4Z32ZO5TyThjTBkqvjMj7MGaZvCPQiSEUwSG/wqolYaQDIbU6pLwNDbmPLU+Und6AnvXgaLSNJxCs9ocvO4jlWE6724paVtRdYD4S2Jy5HaYjT4fEbwpkd4nRtet8qvkgTxLnpneqaNqG2fBgo+i7oQjsPir6E/zESnTYADlDhb0pe0/09qexP/2ynZMca80Ua9DNCIdc3eLFCYl/WUl4HyPrASDt5F7Q+F/1AcNImhGZ1DaOclQwZ0jwVA/8ON6v2p3HmLYvFJBxcU93lzaewxdclKxLRsgjcwgaV3VTOceXNoeN2ZN5+V5aWrfkJmr2jfxpjCcJRqEvobkD0nvA+sOFWXUuOUQ90rkRIbCDsdB11Ku2wY4WvjzXBBVz+sc7Wir1jbGyBudifGbOBdJeUUZ9dGKfv8K29kjXTLp5U0p8ss1fK8BVGhGUK7nQ0qXGspRn1QmT9ZS2UJ3eU4gHYHWJl/pkEztEWfmXAYTT2aE8UqSaOYsXnTFYPvCV/sW6vyH+MvZEqPmMgxRAO/YlGgrZKgyH8kF9RgD16HSxkBW5uHbTZT50FN1EYbRHNrX+G5vkgIrNBF6RSfizzXi4G+Vti8I5MergMPkeRMG/FOdA2nd/0logaRXf5JSARnGE4f11MqgbhNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(110136005)(54906003)(2906002)(6506007)(6512007)(71200400001)(36756003)(31686004)(508600001)(6486002)(966005)(66446008)(186003)(26005)(4744005)(4326008)(76116006)(66556008)(66476007)(64756008)(38070700005)(66946007)(2616005)(8676002)(38100700002)(91956017)(5660300002)(31696002)(86362001)(44832011)(83380400001)(8936002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjJoVWxoQjJKZlFadmVhenJraVB2cERJRW9nbjI4RlhHVkhVcE1hMGpPajBy?=
 =?utf-8?B?TlZGWkxpdWRQWUVudDE2Y1R5aHZkUVNmY1JFWi9pWjl2QVBGc0RCd1VQdFE2?=
 =?utf-8?B?enhJblRKTDRSLy9DaHBXakJvT0VSNkJ0cXduWEJlQTlwVERGSUw4blZSZmhK?=
 =?utf-8?B?dE5KMSs4SXRnWW03dlFzTVpRaVd3UmZibmI5b1lCM3grK1ljd3g0V201WDNp?=
 =?utf-8?B?T1YvTDZsZThIbXhKZkdaUW9EK0R0T3d1ZzRVTUkwc1hRR2F6SFA3dmdTY3Ir?=
 =?utf-8?B?NWk4NnVIejdwOVVrczNteDhtWnorZHJ4WDBtU0FNZTZTcUREcmpaU0RDVHRR?=
 =?utf-8?B?N1Q3Uy9OZlVzai96ekFvMWV3aXEvbnZzcGltdWNmcmoxby9zd00vbFNocDNY?=
 =?utf-8?B?L1pPaDZNVlRDS1RTV1lHOXBBVkFmamVCcVlCbTdTTS9SN2hhTGVNakJESUtt?=
 =?utf-8?B?QXgzaTBrWm9CVU5MQnVpeWV2VEM4eCt6RVl6QmRLL2poeUVWWXBmRGFxUFRj?=
 =?utf-8?B?R01uc24yNlFiRXhVbFN6SHNaN3lXd2Q4VXBXK2EwT25rcURTbGcwcG8zVHN0?=
 =?utf-8?B?N1FNL1JxOStqSk13QklveElQTzQzUHN3bG9lN2dsWDZpWlBPNm1acXZrTVNB?=
 =?utf-8?B?eTFjUGxwZ0Zxc1hybVhNU2VlVlBoNEt1Umo4OU5iUjZhempjR3pJRnJhUDBX?=
 =?utf-8?B?RmRIcGg2UUpZZm9lNG9wQjlhMHF2d1RQMXlCNWUxbGREei93eWZzNTEvUkg4?=
 =?utf-8?B?ZElEY2MvMWF4OWhDZzN1b3BtcG1kT1NxSVB5cUF5Q1JFODdsVmoxN0NNaGx5?=
 =?utf-8?B?UEw3eFZZdnNxdnFrQzNzM0JtRWZoV2NQUW9YeGlEN3pGd3owQzRHWG1zNzlN?=
 =?utf-8?B?SzFvY1V6aURKYldFTlFYejM3RDl3OFZLUU9Bc290d3piVHl0UXV6a0ZDK3RN?=
 =?utf-8?B?TUhTc21pdk9OR09rZUVxMVV5SFBEeWNkTDRuY0RYYW5JTjkzeG93cDArV0Uv?=
 =?utf-8?B?Wmx0MzVGVytiQlEveUdUdnF0RVAzMXhPUFNxWjE5UHI5UDJZdHdabHhEY0dx?=
 =?utf-8?B?djhIcHdTVCt6REllZGRseXhYcW9ndU1JR3hPaThyUnlxWkZ2SlU1N2JiUTdk?=
 =?utf-8?B?MEJCdmlvTG1YeXMvSmxUSnoybDNaQXI3SEQ1ZG5SeFdhMlBHWEVOTy9OTmp3?=
 =?utf-8?B?ZzZHRVkwcEh6WW9ESjUzTVBmUUxsTHQ2d2NJNnptTU5teER0b00ySjd4ZzRy?=
 =?utf-8?B?K2lJT2Frb0xPR3orcnBFbDI1c3FCN2JoV0QzaWV2YXRKd0hDb3A3a1RNRG9z?=
 =?utf-8?B?eW5jK2w2ZjNTSjF1QXY2Tmx0TlZoa1dVbzkyQjIwb0M4NFZ5TlFGTjJUT2xR?=
 =?utf-8?B?dldnN0FpbGU3OTBVT0o2dU9kMG5XazlRb1Y5MVNDRkJrYXgxNW5LbWJnc1Vv?=
 =?utf-8?B?U2lOcGs3MFdoU3lZV3o0WHNVMm9QcHM1cUN3WjNGNWVoNUZURXAvTWhYRkFm?=
 =?utf-8?B?eXhtR2NYUi9tL0JWQ2QrMkMwdmQzcHdoQ3lwQjYwaXJnRUVuKzEwSm1hWExV?=
 =?utf-8?B?VEpPOE1vR2lvTDM0eFNJYTdmYVV3bzhKellNRFM2cGhNdU5mWlorZUI2QlRs?=
 =?utf-8?B?c21iTWltVWQ1V1pDWXFOeHRZSitTdE5jUHRLajArdWNRaERyYTE4Zmt0S1hr?=
 =?utf-8?B?akxPMCtseExTZHJIRXdkNTFIVjRTVStaUTZTTHBMQ0tZZmtzeklVMkV2NC9S?=
 =?utf-8?B?TzFHeU1ndi9kem5rWDdiWno5eEZ6TERWaXBxcnJyOStNM3BaamcvUG5yT3Br?=
 =?utf-8?B?L0ZnOFFkMTRhVndKdTMwTi9PYVRRQjd0UStaSUZ5VzZ6d1NNVk9QZS9rYnpl?=
 =?utf-8?B?VmZ5K2FpbnB4QXBod3I1WlhGZ0d2S2FVTlVvOVQ5NFkwWXZ5dGhxMTdFUEU2?=
 =?utf-8?B?ek52MEUxMDh0cGZST05zNjdGWEwvKzhKbEtwK1pvYUw5bjR3czUyMVBWSnhx?=
 =?utf-8?Q?gWOrI+JXsPwhLj1eDp9veZ83z3A50Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FAEB5C697D2494FA8D98F98BF587DE2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1477918-b7fc-4f18-7a4b-08da0b105629
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 07:56:41.8662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsHztAHIzbGDsSGGHR0Hx6Ftuo8qwCwm9FDr5eSbG61p4EMSbTZXw0jMU9IIuAUGycXnJ44y+eKDYmvMQGJXuCr3NDkpA6w1T1Tk53NwJQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1876
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjIgw6AgMDM6MjcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAxOC8wMy8yMDIyIMOgIDEzOjI2LCBQZXRlciBaaWpsc3RyYSBhIMOpY3JpdMKgOg0K
Pj4+IE9uIEZyaSwgTWFyIDE4LCAyMDIyIGF0IDA0OjIxOjQwUE0gKzA1MzAsIFNhdGh2aWthIFZh
c2lyZWRkeSB3cm90ZToNCj4+Pj4gVGhpcyBwYXRjaCBhZGRzIHBvd2VycGMgc3BlY2lmaWMgZnVu
Y3Rpb25zIHJlcXVpcmVkIGZvcg0KPj4+PiAnb2JqdG9vbCBtY291bnQnIHRvIHdvcmssIGFuZCBl
bmFibGVzIG1jb3VudCBmb3IgcHBjLg0KPj4+DQo+Pj4gSSB3b3VsZCBsb3ZlIHRvIHNlZSBtb3Jl
IG9ianRvb2wgZW5hYmxlbWVudCBmb3IgUG93ZXIgOi0pDQo+Pg0KPj4gSSBoYXZlIG5vdCByZWNl
aXZlZCB0aGlzIHNlcmllcyBhbmQgSSBjYW4ndCBzZWUgaXQgb24gcG93ZXJwYyBwYXRjaHdvcmsN
Cj4+IGVpdGhlciAoaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBj
LWRldi9saXN0LykNCj4+DQo+PiBEaWQgeW91IHNlbmQgaXQgdG8gbGludXhwcGMtZGV2IGxpc3Qg
PyBJZiBub3QgY2FuIHlvdSByZXNlbmQgaXQgdGhlcmUgPw0KPiANCj4gSXQgaXMgdGhlcmUsIG1p
Z2h0IGhhdmUgYmVlbiBkZWxheWVkPw0KPiANCj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0yOTExMjkNCj4gDQo+IFRoZXJlIGFy
ZSBzb21lIENJIGZhaWx1cmVzLg0KPiANCg0KT24gUFBDMzIgSSBnZXQgOg0KDQpbICAgIDAuMDAw
MDAwXSBmdHJhY2U6IE5vIGZ1bmN0aW9ucyB0byBiZSB0cmFjZWQ/DQoNCldpdGhvdXQgdGhpcyBz
ZXJpZXMgSSBnZXQ6DQoNClsgICAgMC4wMDAwMDBdIGZ0cmFjZTogYWxsb2NhdGluZyAyMjUwOCBl
bnRyaWVzIGluIDE3IHBhZ2VzDQpbICAgIDAuMDAwMDAwXSBmdHJhY2U6IGFsbG9jYXRlZCAxNyBw
YWdlcyB3aXRoIDIgZ3JvdXBzDQoNCg0KQ2hyaXN0b3BoZQ==
