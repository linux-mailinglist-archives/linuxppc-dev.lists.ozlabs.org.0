Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FCC474BFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 20:33:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD7pS4Y3bz3cDn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 06:33:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61c;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD7nz1smDz2yRf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 06:33:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPddrK/SBp3wXcWeaPaPWTaHH3N6n1QS9WOuO0tl/+rMOB6bbiamO4PllZ/p/QlESpcrOlvWsVTqJhO+hVuqTp3FxNPg0rxZOoDvT3igrc5tE50RLv/YV4dT5zd0lEkiemB4XUOPTlcWwMfIGmNCr4zV4z/ult66yMZK/CiRm7Shfiu+3swoo8x2P4IKcafv9EGdB48GfsPX5Y/44xvKLaUO/V/0EmWvFN0/HbhDu/PSLN/xRgyBITHTDpXlRzl/Evf4Owr4nlEaD32L2UrRwZEiYRnA0vHy4HDzkZ/guGcrSqYscQ79T+/ZnF0C1ApIRRWMTX7q3cYERBvIZbeizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqCHIP88qam0ZSzERMWxsmCFiwP/hmVtrZJgEpdbkAE=;
 b=dq1iFchi9rc+Wvf7k7qyhyykGvL5afPSFIJwKWxLKMIGRDdfhYf+0QL0OHYQny+z7SzMEjY2MkUGkIneZxdapCltHapPKWVHIlYYNjAUbK+7LQE9mCvLmW023xavpst+PrxX+98VUyTdb3wkQJ9cG7uIX9RgSOGdoWLnSUDGxTY7ld1eWAEkrpqeV2YxrQqIsk0ZnVHwt7pEBwSXqb4kGnbMdFMv+LvYB26S2Bw8MdDSxPyr3LjED4cidJSUVt4lW2j0nq5JFfJkbLguqztfkDgy82vDdJXkP3DuOLqz8RelE0JGqAqZfdxIdRgoztBz2bzcz7NRlrze2WDsNpI34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0261.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 19:32:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 19:32:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
Thread-Topic: linux-next: manual merge of the audit tree with the powerpc tree
Thread-Index: AQHXyhGlv9NcChlzxUqn6eTOsDZjzavlG8oAgAA7YoCAAWBkAIAAA16AgAAsAgCAS62bAIAABqsAgAATXwA=
Date: Tue, 14 Dec 2021 19:32:42 +0000
Message-ID: <1a78709f-162e-0d78-0550-4e9ef213f9c6@csgroup.eu>
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au>
 <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
 <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
 <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
 <CAHC9VhQPizVLkr2+sqRCS0gS4+ZSw-AMkJM5V64-ku8AQe+QQg@mail.gmail.com>
In-Reply-To: <CAHC9VhQPizVLkr2+sqRCS0gS4+ZSw-AMkJM5V64-ku8AQe+QQg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 118e9199-c5d7-4796-0e4a-08d9bf387f8a
x-ms-traffictypediagnostic: MRXP264MB0261:EE_
x-microsoft-antispam-prvs: <MRXP264MB02615A3A4B4885D6509B1859ED759@MRXP264MB0261.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oWR1bHDfhsO55t6k5Q6HFmpHYJBvctSgR83r/zYznm1h/UtbtwSiq17eFR2SQuA7yusHTTy7BuMoIzJiGCE0uwn8tekdp2S/vOWRMNBSmOuaeSkGTm+ZHTCnd7wj2WhRGBvyp3qhyS/IE0dM5BOV3yJIy8OdCeKyIao3o/bjcOKr4vYVgcsCgOJTUfxMNixp5UKyLRzWw+0Rkwvc+GaJRZhU6A77t4zS/PYJtLD8QtZCSMjV4CDQnoqyCU4xAVrlh5YG1erV7v7TqvbMnGKFXjHlKuKeE/CwNU2cSrPSKpE0iuQlUvyiSMGtYYaCJgURZZgE9wZAJqwJEcWSVKjQbZVUXfXL0Yu3N22IBSlkxyMgA0V7I/p6t4ofpNdDoH+khR0r73CQ//8+5hLmjo4I9KcpAdcj3OjrEDFt5xZ9XYaYOpXqbjNGi3e6jEAy5kjS/7gwJ7OZ1UPh2T6AldwLNzwN/2zCszdvCvJIrOrf/AJrzakSulUvUS0uANOqsnNnPaWlB45tW278cdaLrfu451lIyDQEcOe7Wejmi5EBaN3/uSDqTb9BQ7M1+gdJ94oDUJJXJYPuU2OLIgZ4X7cUMJWu7PGYRDFbdRX81fA0Zx2MjDTrtwbjPnXSX0n8noiHeQ6lcrBParIT6jNdDnFrcmZcAqyhqjodVacPHw1EWbCA87OtprzjTiYQ7lRv41NnRZOe9f/1oxIi4RmK5j7NZkcQMJ2E+CLicAQX37H9heC+An3tFJVswES/fM57l3BuVuwCihHO7oArHl0c62zeVJTpp8sQeDQqMIZeUYSRpc1XBRwedw5PHMpdE1dJiE7cSn9Mm58GkDY5PVtyAzm7qkkBz7ltgiPopDUd+H74YKQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(6512007)(26005)(53546011)(44832011)(5660300002)(508600001)(8676002)(54906003)(36756003)(6506007)(966005)(38100700002)(83380400001)(6486002)(31696002)(38070700005)(71200400001)(316002)(2906002)(91956017)(76116006)(122000001)(8936002)(66476007)(2616005)(66946007)(66556008)(64756008)(4326008)(66446008)(186003)(31686004)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUR2ZU5McndQU3laNVZUdDNkaXdjRXM1YWtSOWlpanhFaXNIRmdScERFUm54?=
 =?utf-8?B?R1BWdUJrdERNQXFTOXQvU0djd2d2Y1pNMUtRN1BnRTlhK1A3NEtwak1WNGVW?=
 =?utf-8?B?Y2Zja0tqMzFZRlgra1Nzd0VydXRiMWtYOStBb3VMalVxVHJ0MGo0L3hUTFp5?=
 =?utf-8?B?TlR2ZW5JNTRIQUVPVjhLZmxPS09lRkdZdWtHRC96a1lmTkkyM2Y0am13WFNI?=
 =?utf-8?B?SkdqRmJrREZ5bktreFZtcURkb1NIakErdFhvRnFFM1VWdXdMaW43UHdMNXor?=
 =?utf-8?B?T2U5cWZGMS85Tk56WU1vZWNSdGNucmVWN3BVRTJqUjVVSG8rUkxnUnV0UU5z?=
 =?utf-8?B?bWVDdDRVcnpRaC9NV0J1RCsxd3g2bEtyRVJ6WkVyVmNVdE41dWxLMGtmTGNM?=
 =?utf-8?B?QzRqZVZvQ3l0TXYwNW1hMDFDMnlHK21qUGNtRy9KMDlMSmhYd29TOS9iWlFs?=
 =?utf-8?B?TU82cXI2NFF3c2dlZWY3UHlrZXlEdXJpMXhNSHJib2hnajhSOHNiUlRCdEhS?=
 =?utf-8?B?UnZ5UkhjbEJ3RDh4RXF6S2ZrOGtzUG00dlNIdEF1WUNDQXQ2alFZcHZVOVhF?=
 =?utf-8?B?MG5IOXlDYUtZSS9HZy9iYi9kOTVmT3h0QkszK1RtZklBdHR5eGVvMEVIS09F?=
 =?utf-8?B?b2NkMWk1dk1pUkt6Mm8rbkZMNUM1TkpNa1o1K0N3WE9jdm9qeTM5WE9McWpy?=
 =?utf-8?B?VGoyWlUxVnIvKzNnUmxmRGNwVXllNy9SSlBqZGsyaGdNaW1tbW5HOU9LV1Bs?=
 =?utf-8?B?QkxNajYycUNwTW4zT3dNcGlPc01QeGhJejJrMmxYMWxoTXZPdFEzQ09wMnY3?=
 =?utf-8?B?bXFJS0pydDFEN3piYVRNamRXNVd4djRHVFdZRURDOWY2WEJUZWJxREFZdHNm?=
 =?utf-8?B?OHRqamJITW1ocGVSeWgyRGN2RWdKMzM1KzVZMmZJTXhQZHJDU0QxU2hFVExi?=
 =?utf-8?B?RUJ4aE5UdCttT0dqTWtIcjdJZXJzb2w2ck13RVNvck1PTDBRQkU0T1NBU0Vs?=
 =?utf-8?B?bkNRL0c3aXdMZHY3MGZIejNHZ0Mzc2FQNFExTzVteERZSXlQdTFmREg2dmtn?=
 =?utf-8?B?alI1dEFqRnowNnZYQjZvYUg0UVdjQXFqeWdGOXNoc2YvNVFGTndVUTFtQWxI?=
 =?utf-8?B?ZGtOVDRLYXlrakVheDVObEdFS3pOUUNTZjVwNGRNQk9LN3Naalc1aGhOcHJM?=
 =?utf-8?B?SkFxOW14UjFUazZsV2FOWFhCa1gvUDM4b1I4bkozbmhYb0hlcHBiVUdnazVk?=
 =?utf-8?B?WkRGcnhRTWJjNTk4d2c4Z3Q2cXRXaDFxOTFtMWI0cmJGUmljNW9oYjlxSXlC?=
 =?utf-8?B?NVRCNWdWbVZObGdsL2ZtZWQ4NGcwcVdJMTl3T3NJYUx5eUU4TzBPM1l2OHZZ?=
 =?utf-8?B?NlFjc00rbnl6bFdtTUVWV1laTUtWa1ZhZnZmRkpRcVVmb1lwbTR6MHRJZVdo?=
 =?utf-8?B?cmRwamx4STVhODBCaUhsczkvUDMvQk4yQ3RiRWJmVDhlNEk2b3F5OUlqc2d1?=
 =?utf-8?B?VzRVazJ6blNheXowS0VwVjhkbGQ1MnpzdzIzbjQyWGVjRG14RHJFcjdSRkRa?=
 =?utf-8?B?S2lYM2YvcUlIRnI0Z2ZiS2JCUTVCNVpla1ExK2lRRXg2WERCNVUvMWlYV3V5?=
 =?utf-8?B?MlFqejdteDU1MXNLc3BxWm9rTjhVbDJuWDBBamx6OHdXaW1NaTFYQmV3RzlB?=
 =?utf-8?B?K0JKYlA2UU45UTN4R2dzN1RQcEs4QUI0YjAydDhqaVh1QjRwVVZTakd1K1J1?=
 =?utf-8?B?U0FEQ0ZacDM1cG1YdjJmTUZFdERKcVhiM1lwUXI4cFJpcVRFa245Qy93ZTV0?=
 =?utf-8?B?NTRYRm81d3lLYm1uSS9RMlVDZnR0K1dmTmN6Yld4UktOcTRGdS9jTk5ZZmJZ?=
 =?utf-8?B?VlRvU1ozaEdMVENka2E3OGNMbWc5bEJrcklBbTBTbWhvc1pPdHVLZWU2Vytw?=
 =?utf-8?B?WmFqMGx4U0RoRFRZcFFrQmU5ZlRTdk40TkNjdHVDTnVkYWhGTFNNdXlvcWNO?=
 =?utf-8?B?Wk0yVndzTmdYZXNpWkFYMnB6NDBhYjN0MVEyMWV0OHpmWGVkMkZLNmNjdzJ1?=
 =?utf-8?B?VlMvK3FleHpMT3VUTmI0S09OODI4Yk9qb3lKTEl4TUQxVUJKcEw3bXI4UDBI?=
 =?utf-8?B?OVZlWHRKL1g2eENIVkV1cUFRaDFHMEJpREplMDBKY0pMS2ZBV1c1M2k5bnA1?=
 =?utf-8?B?eTFFU0VrL2lkaGtVcGV1Zy9iZzBVQnArWXpsbDZPdUNSQ2R3MGVoNERlekY5?=
 =?utf-8?Q?aOUiK7h6idibyXcyTEzms0fdCuBlwat66k4lZN7gD8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A77D6A36BDDE0947BB99C6D29803F2CB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 118e9199-c5d7-4796-0e4a-08d9bf387f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 19:32:42.8145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tHkX3ln5o9wPNdeJu8KIyKG51bQezatnnOqB0dTFy3ZKaeGKacjqNX7IJeIP9ZGuQH1rpgZHaWUQem0E7UrF6ZY5okbrqxSYz7wwa8P2nyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0261
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Richard Guy Briggs <rgb@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjEgw6AgMTk6MjMsIFBhdWwgTW9vcmUgYSDDqWNyaXTCoDoNCj4gT24g
VHVlLCBEZWMgMTQsIDIwMjEgYXQgMTI6NTkgUE0gQ2hyaXN0b3BoZSBMZXJveQ0KPiA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+IEhlbGxvIFBhdWwsDQo+Pg0KPj4gSSd2
ZSBiZWVuIHRyeWluZyB0byBzZXR1cCB5b3VyIHRlc3Qgc3VpdGUgb24gbXkgcG93ZXJwYyBib2Fy
ZCBidXQgaXQncw0KPj4gYmFzZWQgb24gUGVybCBhbmQgb24gYSBsb3Qgb2Ygb3B0aW9uYWwgUGVy
bCBwYWNrYWdlcy4gSSB3YXMgYWJsZSB0byBhZGQNCj4+IHRoZW0gb25lIGJ5IG9uZSB1bnRpbCBz
b21lIG9mIHRoZW0gcmVxdWlyZSBzb21lIC5zbyBsaWJyYXJpZXMNCj4+IChQYXRodG9vbHMtQ3dk
KSwgYW5kIGl0IHNlZW1zIG5vdGhpbmcgaXMgbWFkZSB0byBhbGxvdyBjcm9zcyBidWlsZGluZw0K
Pj4gdGhvc2UgbGlicmFyaWVzLg0KPj4NCj4+IERvIHlvdSBoYXZlIGFub3RoZXIgdGVzdCBzdWl0
ZSBiYXNlZCBvbiBDIGFuZCBub3QgcGVybCA/DQo+Pg0KPj4gSWYgbm90LCB3aGF0IGNhbiBJIGRv
LCBkbyB5b3Uga25vdyBob3cgSSBjYW4gY3Jvc3MgY29tcGlsZSB0aG9zZSBQZXJsDQo+PiBwYWNr
YWdlcyBmb3IgUFBDMzIgPw0KPiANCj4gSXMgdGhlcmUgbm8gTGludXggZGlzdHJpYnV0aW9uIHRo
YXQgc3VwcG9ydHMgUFBDMzI/ICBJIHdvdWxkIHRoaW5rDQo+IHRoYXQgd291bGQgYmUgdGhlIGVh
c2llc3QgcGF0aCBmb3J3YXJkLCBidXQgeW91J3JlIHRoZSBQUEMzMiBleHBlcnQgLQ0KPiBub3Qg
bWUgLSBzbyBJJ2xsIGFzc3VtZSB5b3UgYWxyZWFkeSB0cmllZCB0aGF0IG9yIGl0IGRpZG4ndCB3
b3JrIGZvcg0KPiBvdGhlciByZWFzb25zLg0KDQpUaGVyZSBoYXNuJ3QgYmVlbiBMaW51eCBkaXN0
cmlidXRpb24gc3VwcG9ydGluZyBQUEMzMiBmb3IgYSBmZXcgeWVhcnMgDQpub3cuIEFuZCByZWdh
cmRsZXNzLCB0aGUgYm9hcmRzIEknbSBydW5uaW5nIExpbnV4IG9uIGFyZSBob21lIG1hZGUgDQpl
bWJlZGRlZCBib2FyZHMsIHdpdGggbGltaXRlZCBhbW91bnQgb2YgbWVtb3J5IGFuZCBmbGFzaGRp
c2sgc3BhY2UgYW5kIA0Kbm8gdmlkZW8gY2hpcCwgc28gdGhleSBhcmUgaGFyZGx5IHN1cHBvcnRl
ZCBieSBhbnkgZGlzdHJpYnV0aW9ucywgZXZlbiANCm9sZGVyIG9uZXMuDQoNCj4gDQo+IEknbSBh
bHNvIG5vdCBhIFBlcmwgZXhwZXJ0LCBidXQgaXQgbG9va3MgbGlrZSBQYXRoVG9vbHMgaXMgcGFy
dCBvZiB0aGUNCj4gY29yZSBQZXJsNSByZWxlYXNlLCBoYXZlIHlvdSB0cmllZCB0aGF0Pw0KPiAN
Cj4gaHR0cHM6Ly9naXRodWIuY29tL1BlcmwvcGVybDUvdHJlZS9ibGVhZC9kaXN0L1BhdGhUb29s
cw0KDQpJIGdvdCBpdCBmcm9tIGh0dHBzOi8vbWV0YWNwYW4ub3JnL3BvZC9Dd2QNCkkgZ3Vlc3Mg
aXQgaXMgdGhlIHNhbWUgPw0KDQo+IA0KPiBGaW5hbGx5LCBubywgb3VyIG9ubHkgcmVhbGx5IG1h
aW50YWluZWQgdGVzdCBzdWl0ZSBpcyB0aGUgUGVybCBiYXNlZA0KPiBvbmU7IHRoZXJlIGhhdmUg
YmVlbiBvdGhlciBlZmZvcnRzIG92ZXIgdGhlIHllYXJzIGJ1dCB0aGV5IHdlcmUgbmV2ZXINCj4g
cHJvcGVybHkgc3VwcG9ydGVkIGFuZCBmZWxsIG91dCBvZiB1c2UgKGFuZCBhcHBsaWNhYmlsaXR5
KS4gIEF0IHNvbWUNCj4gcG9pbnQgeW91L3NvbWVvbmUgd2FzIGFibGUgdG8gcnVuIHRoZSB0ZXN0
IHN1aXRlLCB3aHkgaXNuJ3QgdGhhdA0KPiB3b3JraW5nIG5vdz8gIE9yIHdhcyBpdCBhIGRpZmZl
cmVudCBwb3dlcnBjIEFCST8NCj4gDQoNClllcywgTWljaGFlbCBkaWQgb24gc29tZSBQUEM2NCBz
ZXJ2ZXIsIGZvciB0aGlzIGtpbmQgb2YgSFcgdGhlcmUgYXJlIA0KZGlzdHJpYnV0aW9uIGFuZCB0
aGV5IGFyZSBhYmxlIHRvIHJ1biBuYXRpdmUgY29tcGlsZXJzIG9uIGl0IGFzIHdlbGwsIHNvIA0K
dGhhdCdzIGFub3RoZXIgc3RvcnkuDQoNCkNocmlzdG9waGU=
