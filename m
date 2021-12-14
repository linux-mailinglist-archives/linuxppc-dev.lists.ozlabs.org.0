Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDF2474622
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 16:13:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD22b0dpRz3c60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 02:13:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD2252HSkz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 02:13:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgbcZqnL6WZu77DTDUn2zhybYPGF3g/oDoaULrQTQ2V6TDSxke4858qe4+Yd5b7+1kqk3BPkIzdb9BdY2Uku4fVEHWjrsNnTpRGKKWGa4tPpucEbaZP2pUkHkSdfDIHxs/ERG7SkQEuWy1fLWy0xgGnlCZ/n7V/2Zw4TbY21Z4knZWMDscpctBLWZrIxOi22Vl3/F3ui9YLo36m0DjN21nxgK8mGWoX9SygxM7BD3xgS90hV5M5wHdZH7NhyqLtKgoozVcUvFvpyuhRBlaeAXNjA6/Q3eOZ3QrpnUZgVEHEO2KZfR02hgTIT8cxXkfzIMype55zt6jqHaNZpK2ujQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XJuzL0LXyXFaT61ecNID/rQPzUm3iu1flCUZscQ3CE=;
 b=MIhmSoxpswY8Nha/drWXnQq3cmkjpt2Wh1S/47m662UFlC/rpMTuvVb1Hg38WecE2D4KzqYE5Bp3yx4J1qpcQRpE8uaPgRhbXETY7bVdSSP5tNp2JBdn5qG0oGTAOk7+0g8NBjK1T/D9sb0aCNamEh/v/ZSzrhqQZSb5MDzKRf/qF9HbnI2UIG4RjJoHjSbUsGyAS8rAua83R9DfGrF4MTke0MZ+0AaWMvcYWojU0rUSV+QXiVtpOGc4Dbj8ieVDNwjzQjm14wlePg6ZJpeJ862a6k5ykyqJVzrJRlRmvpBA2o23+pVaG9ieqezViNXmRn7RhGCk+KDgRW/h2GiI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0867.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Tue, 14 Dec
 2021 15:12:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 15:12:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Topic: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Index: AQHXy/a61L5ufkyTwk+E9T1IN+85JqvoaYCAgEhc+YCAACuvAIAABD6AgAAAzACAAATPgIABWRaAgAANHgA=
Date: Tue, 14 Dec 2021 15:12:54 +0000
Message-ID: <fd778195-8c5c-e6c3-c119-365730f6035a@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
 <20211028093547.48c69dfe@gandalf.local.home>
 <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
 <20211213121536.25e5488d@gandalf.local.home>
 <5511f43c-192a-622b-7c72-52e07f0032c2@csgroup.eu>
 <20211213123338.65eda5a0@gandalf.local.home>
 <fc3099b8-9f12-3e47-08a0-05abc37a0482@csgroup.eu> <YbipdU5X4HNDWIni@osiris>
In-Reply-To: <YbipdU5X4HNDWIni@osiris>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52c9d760-cdf8-4f76-fe4b-08d9bf14340c
x-ms-traffictypediagnostic: MR2P264MB0867:EE_
x-microsoft-antispam-prvs: <MR2P264MB0867466CB49EB1C79128B0EEED759@MR2P264MB0867.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9UFRQeaCuls2k9gQt4ayWXTP1Ia+ogfshNiidn6pUsyXMZYA3fskRaGDqUo1SiWc4ReoeAVAMVIrrAF4oFPwnNk6Yr8RHgAK9/v/T6fB7fNqaQDbVbqQiPX0LWmiVrACnAnRc8cMwPPaTl9Fbtg1CDU+Ep5cUEJihh90SLKCuWDDL8VMfPHwrvQF8N88CXWh32OfW6tcctIXIRRRJIKczNRfOrTK+AAAWjLkC8F1HBnR0UjtwQgkqsI/0oIMXmfuxBhlSAeDbr8XXsxTtFFbBtGDrU1WDTAwifDrJ/SMM3wUMer9to/GI/TDo7Rgp/7gb7HRVRAbLteDNmdqhagVaU7U8oyie1xa2Dny/oPLweNIGUc05HhF5Qk4He84BRHZeNlwD3e8LEPLv4KEfy3hc7ow98K02WvdOZzVzcBwGJs4cLonfdrxqkMOwDAfiS+JeF48Ppv8dh4FnePb3qtv7XdsVhSPIV9xG62BRiXw971o/z4r5NA92vlEYX5nBVV21+vIS5JUezvsOrkxjELzMRGuwhzVrQdZbBa5drbY/DvgcUN6/kMKGIm6lFAVl0TXDyzmdjq2BKHUEDo0LpCZOs7PQnsI/h0VPGLHcYqBXmiZJvnq5tGlJvKkPaIzYM6/wN3SrAx/F3YTE9S85SNRTxeTY2XgB5SlkrkyVaAByHEE1w1ATHm/OeA5AxKrKejQ5WURaeFwmzVFtnS+sub9EmLzNPg3uK4iu0t3ZdIKxGefpbVBpzG6FQTtXEQ11GEsRXPB+gDmRws/2kpt7NpUqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(4326008)(54906003)(26005)(6512007)(2616005)(6916009)(6506007)(76116006)(44832011)(122000001)(31686004)(66446008)(91956017)(8936002)(66476007)(66556008)(5660300002)(66574015)(66946007)(38100700002)(64756008)(36756003)(8676002)(2906002)(508600001)(186003)(31696002)(7416002)(71200400001)(6486002)(86362001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T20zRnpFd3JWNmw4TmRKYWswNVJlWGxsREVsK2ltSG0xNlpxQ29tcmRuL2Jo?=
 =?utf-8?B?TWd3SjVoWVB6OGUxNnVFRytZaUFrNVA5ZFVEbU9rMUZkV1BRbkVwZDRjekxC?=
 =?utf-8?B?MW1hTittVDF2NnhKSmFXbGNHYUZZVmkrOEI0MHZKVWYzc3AwZXJPMC9OcUlC?=
 =?utf-8?B?RlUwL1Nsd2JoRzlIUlVBaUtzbHRkZlNNU09NZWdNdUs1cFlWRFdNbGg0alY2?=
 =?utf-8?B?cDMyOER5NkJTQXhYTTlib1JkdlY4bmIrUkhiQ3RKSjZvMHZSMnVIKzdZQ01Z?=
 =?utf-8?B?QTdFK1V4RmJ4WG93WWgyS1lWSlViNDhQcHhmWVZicjMxWXd0d0V2NDBzbUtQ?=
 =?utf-8?B?ZmlPVENzaGVVNXpQd1FXdlpORVdkODZWbVdrTGgxYmFSc0hHd0V4UmhxSThx?=
 =?utf-8?B?cEVJeHdkR3plRVpEbVVLRFdXU0oxQ0Z6Q2tqQ0hLT2hjZmdGVHpIT0NheXlQ?=
 =?utf-8?B?ZEJoK25YbEZIMDNrbm9aU01jNUhlaHp5VXVRNjFxcjVGNU1mbTFzR2dWREZu?=
 =?utf-8?B?cUhSQUdPVEFvbUQrOGNBWk5IVlB0OTRMMmUzTG5aNnRTV0QwTkFMc3lwUU5W?=
 =?utf-8?B?cG1uVFF6U0xOVWVyckMrYWxUVlVVbTc3TUVHaFBQSEt1b0g1c3NFZHlTZ2U4?=
 =?utf-8?B?ajhrWS93WE5ycTVEc1JDUGVkS1VLcnBuNEZlbld6aXVjNnl5dzdRM3grUEph?=
 =?utf-8?B?aXVWbDNHSGhxakhnaW9UTkwrQmdRR1ZpN0lHUWlFOUdZSDl6NFVEdFE1WStI?=
 =?utf-8?B?K0ZmWFhxUERPTmxQYnY3N2JqbWFEZkJiWFR1V3ZDSk8zMkNVOUlyaSsvall3?=
 =?utf-8?B?MVQ4dm84WlExZWEzSUJBR2pIdVdRZ2NUTUlCa1QwUmt1aVJ3UHBJZ2M1NGs5?=
 =?utf-8?B?b3o0SmhtK0FHSHYwWHhTM1RYcHJISHBYV2NZSHRlcUR4VmxoS0FTS2gya1c0?=
 =?utf-8?B?N3VNanA0aEExZ0RGU3NFdTJoR2pUcmF0TkRyU2hpVE4rTVZ0UTRVMWN1UGVh?=
 =?utf-8?B?c2VoSFVkWEl0MkJNZ1M1allDeHpVKzEzQlZ5aHBmSlBhclluZ3EzVEI4aXd2?=
 =?utf-8?B?SlZ4Z0R3SzNGZmhSdlpaa2VXcE9TdnI2OUlqMlBDd3ltdHlLM1M1dmZkdThG?=
 =?utf-8?B?cCtJVDRRYnA3aUpmSjZ6aFBUQmpjSHp6Q0oycVVVSmZaMVY2ZHNadFFGNXdr?=
 =?utf-8?B?Q3VQMnUxRlNkaGVpL0RqRlc2aVRFaGFDSU5BNWUvdzBUUW9PT0NMa0x4VEtR?=
 =?utf-8?B?OGVpaHpsM1dyMlJEamJoWUlNUFdYcjBEanhmb3VsMEZLcTZaamVvYWFxRHR1?=
 =?utf-8?B?Y2xQMzdvREREN3UwRVNZQmVZN0hlQkU1TTJ1REt2TWZFc0V2VjRZUW5CZmNP?=
 =?utf-8?B?NE5yN0RPZXJBenNOM1BFa2lMdE8vajN0c2pLZ0p6REpZNnEzUEVOck9YSzhi?=
 =?utf-8?B?NVRUK0RQanZpS0lmYXNQZzlhM1hJeVdNQzJqblVTeGFMZ2RUQUdIQXlqWWVE?=
 =?utf-8?B?OHpmMngwS3RWRnZERTliZkcyMEpWNEd2R0t1SmxwT1NNUStSQXNKRnk3aC9w?=
 =?utf-8?B?c2phaWdaYUc0c1dNS01sdE5OWVVoRkZvcnpyMHNmMnJtQWlqVzJwSHprdHVH?=
 =?utf-8?B?d0JjYldndnlZVkVnWEQ1Uzc0YVZwdkZ6b2pYTTIwS2lQeTdxRms4ODJ4dlgx?=
 =?utf-8?B?STRVeTFtbHorMS9DZ1duTHQwazNJVzdtWi9zYjRlcitzY0JlVFFBbHI1RGpS?=
 =?utf-8?B?dWVXVmhiYTVGWllZS2cvbUt1U0JzNXk5aisxKzErcW1EZEpmb1JISTh4MXdw?=
 =?utf-8?B?WW00V3Q0SkRTY2V4K1Zvc25Sd0VqYU1LcExwYXJPdDhjcnBuWU5zTUplRVJI?=
 =?utf-8?B?bVJXRHFsb3JVS2pRWWFDRnlZWFcwRzA1aDlWKytDZW1yNVZFaEd0RmxMTGdT?=
 =?utf-8?B?NVFOUktwVHdmd29ITy9veDAzWGYzZ1laQ281d2R4S0ZiRCsvRUc5Ui93THRu?=
 =?utf-8?B?R0FDQjNFR0V0MG54cjJydDRxRnFjbHVZUnk1di9RVUtkdUZaTm1qdFNnZHBo?=
 =?utf-8?B?MVNTZHB5Q2pmOVRPb083cEZ5T09raENUazVSRlRqSERjcFhKVWtYWVR6Vzhk?=
 =?utf-8?B?UU5senptUk9DQUlHN2sySVV0bjZEMlgxNkgvV2NaWXE2QUNzeWlSblJtV0JI?=
 =?utf-8?B?SkJOMXZZMEdIcGJnRDNWT1BiaFQ3dmR6T2dZOE92KzlXZHJEK1VFUEZ2WXlW?=
 =?utf-8?Q?khHAlzlkjOtlb1fKRmJWzfty5xDdcfIPvcy4LFizrM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECD0366FF3EB66438A7971EF979BEA75@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c9d760-cdf8-4f76-fe4b-08d9bf14340c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 15:12:54.1968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSEX5TGYji3FBijOSXPTOAhwmCF8tnjjzZYdZWFAGSOQkMJ1NMlkGKSVzCOhAdaRQ0LhAUF/Q8upF/Az/nmhakt0M8mRXZasOrPFv2QIRK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0867
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjEgw6AgMTU6MjUsIEhlaWtvIENhcnN0ZW5zIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgRGVjIDEzLCAyMDIxIGF0IDA1OjUwOjUyUE0gKzAwMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBMZSAxMy8xMi8yMDIxIMOgIDE4OjMzLCBTdGV2ZW4gUm9zdGVkdCBhIMOp
Y3JpdMKgOg0KPj4+IE9uIE1vbiwgMTMgRGVjIDIwMjEgMTc6MzA6NDggKzAwMDANCj4+PiBDaHJp
c3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4+DQo+
Pj4+IFRoYW5rcywgSSB3aWxsIHRyeSB0aGF0Lg0KPj4+Pg0KPj4+PiBJIGNhbid0IGZpbmQgZnRy
YWNlX2dyYXBoX2Z1bmMoKSBpbiBzMzkwLiBEb2VzIGl0IG1lYW4gdGhhdCBzMzkwIGRvZXNuJ3QN
Cj4+Pj4gaGF2ZSBhIHdvcmtpbmcgZnVuY3Rpb24gdHJhY2VyIGFueW1vcmUgPw0KPj4+Pg0KPj4+
PiBJIHNlZSB5b3VyIGNvbW1pdCAwYzA1OTNiNDVjOWI0ICgieDg2L2Z0cmFjZTogTWFrZSBmdW5j
dGlvbiBncmFwaCB1c2UNCj4+Pj4gZnRyYWNlIGRpcmVjdGx5IikgaXMgZGF0ZWQgOCBPY3QgMjAy
MSB3aGlsZSA1NzQwYTdjNzFhYjYgKCJzMzkwL2Z0cmFjZToNCj4+Pj4gYWRkIEhBVkVfRFlOQU1J
Q19GVFJBQ0VfV0lUSF9BUkdTIHN1cHBvcnQiKSBpcyA0IE9jdCAyMDIxLg0KPj4+DQo+Pj4gSG1t
LCBtYXliZSBub3QuIEkgY2FuJ3QgdGVzdCBpdC4NCj4+Pg0KPj4+IFRoaXMgbmVlZHMgdG8gYmUg
Zml4ZWQgaWYgdGhhdCdzIHRoZSBjYXNlLg0KPj4+DQo+Pj4gVGhhbmtzIGZvciBicmluZ2luZyBp
dCB1cCENCj4gDQo+IEl0IHN0aWxsIHdvcmtzLCB3ZSBydW4gdGhlIGZ1bGwgZnRyYWNlL2twcm9i
ZXMgc2VsZnRlc3RzIGZyb20gdGhlDQo+IGtlcm5lbCBldmVyeSBkYXkgb24gbXVsdGlwbGUgbWFj
aGluZXMgd2l0aCBzZXZlcmFsIGtlcm5lbHMgKGJlc2lkZXMNCj4gb3RoZXIgTGludXMnIHRyZWUs
IGJ1dCBhbHNvIGxpbnV4LW5leHQpLiBUaGF0IHNhaWQsIEkgd2FudGVkIHRvIGNoYW5nZQ0KPiBz
MzkwJ3MgY29kZSBmb2xsb3cgd2hhdCB4ODYgaXMgY3VycmVudGx5IGRvaW5nIGFueXdheS4NCj4g
DQo+IE9uZSB0aGluZyB0byBub3RlOiBjb21taXQgNTc0MGE3YzcxYWI2ICgiczM5MC9mdHJhY2U6
IGFkZA0KPiBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfQVJHUyBzdXBwb3J0IikgbG9va3Mgb25s
eSB0aGF0IHNpbXBsZSBiZWNhdXNlDQo+IGZ0cmFjZV9jYWxsZXIgX2FuZF8gZnRyYWNlX3JlZ3Nf
Y2FsbGVyIHVzZWQgdG8gc2F2ZSBhbGwgcmVnaXN0ZXINCj4gY29udGVudHMgaW50byB0aGUgcHRf
cmVncyBzdHJ1Y3R1cmUsIHdoaWNoIG5ldmVyIHdhcyBhIHJlcXVpcmVtZW50LA0KPiBidXQgaW1w
bGljaXRseSBmdWxmaWxscyB0aGUgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MNCj4gcmVx
dWlyZW1lbnRzLg0KPiBOb3Qgc3VyZSBpZiBwb3dlcnBjIHBhc3NlcyBlbm91Z2ggcmVnaXN0ZXIg
Y29udGVudHMgdmlhIHB0X3JlZ3MgZm9yDQo+IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdT
IHRob3VnaC4gTWlnaHQgYmUgc29tZXRoaW5nIHRvIGNoZWNrPw0KPiANCg0KSW4gZmFjdCB0aGVy
ZSBpcyBubyBuZWVkIHRvIHJld29yayB0aGUgZnVuY3Rpb24gZ3JhcGggbG9naWMuIEl0IHN0aWxs
IA0Kd29ya3MgYXMgaXMgd2l0aCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfQVJHUy4NCg0KVGhl
IHByb2JsZW0gd2FzIHRoYXQgdGhlIHNlZmx0ZXN0cyB3ZXJlIGZhaWxpbmcgd2l0aCANCkNPTkZJ
R19EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBub3QgYmVpbmcgc2VsZWN0ZWQgb24g
cG93ZXJwYy4NCg0KQXMgczM5MCBzZWxlY3RzIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJ
UkVDVF9DQUxMUywgdGhlcmUgaXMgbm8gDQpwcm9ibGVtLg0KDQpUaGFua3MNCkNocmlzdG9waGU=
