Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F6B4EBFD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 13:34:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT48X0blyz2ygC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 22:34:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT4804Rzqz2xsN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:33:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nn6b1ohZW5nOUYnfcSXyA2PdTqiHf+Haa3n0s+Tn3yNBrmj8i2cVMj18P9NS3tKJ12v+gKjGWNAax+/TM8Qh0kKvF1UT8To9fxavAHJBMxNai+5Azel6NXtczwxuJELg3UHctVV+LpX2n7de9mEorWiSlRh6n6xQTuFr/NKBAycwTqee9xbhHMUwYgCI+nqfbA5vLZo131PS1ZxeSzsk0NjgImQx8KtDHtlw6rWB+TsTJdO5TGo0w69Hp2Ioh2OA9BF2vjSH2kVJgvop8+l/3I/eeyhzKxObSOKcREM8GxIQsOYRKglje0MQsF4UVGVuqc8uUvyyFoXBgivHX+5uHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKC6FhSW3P4xAug//fGdQBxQTY7ZpwHhptouQV/06zU=;
 b=fN0ohM3rtqOQSov9CYbNGWIkZ55hH7shQExnmf4jxoDjTofcU7icxyHDsEd0NSm/vCShy+gSpbT8C914GzhY7wod+d3UdyIztvBvHS9aKdT5Fv4q+EgeBfpwKHb5I2lTQi0AuVFQi826z6cAKn2ittO7oOyGO9jjbauf2UC7F6FdkEwQuRZ/3A8IgyEZbzyYkb+OgYWFqIucFTdKAjyvcboGPn7tn9KwTTLFPn460GuFcMhE2ZDPPEfvpT1ITFrgvT7LT+aCI5i6RoI8atYzoz5DfGccsBCMzzzVZD6rRbGsUgBpVgi3kJZbkA6WHTzzKJfRznPaSAzBQc4cw6Boyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2728.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 11:33:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 11:33:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Thread-Topic: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Thread-Index: AQHYRCjanxmthYh57kig9Zs9/KUytqzXy6EA
Date: Wed, 30 Mar 2022 11:33:29 +0000
Message-ID: <e0776e34-7efa-f42c-c194-1fc3fc5cf445@csgroup.eu>
References: <20220330112437.540214-1-joel@jms.id.au>
In-Reply-To: <20220330112437.540214-1-joel@jms.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55c3b5df-346d-47e2-1b7b-08da12411cc2
x-ms-traffictypediagnostic: PR0P264MB2728:EE_
x-microsoft-antispam-prvs: <PR0P264MB27283F3A9AA5AB580CEA4731ED1F9@PR0P264MB2728.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zPHgQRqAl/hkixHCCL/Um0ironK805wMOpY0KDGGiEMa1tPFatHNpZ0l/QFDa9OdU5JaXKMhlMatshGJs8LC3//n0oIVcaMZ6zgrdO8irdk321/8HESGvBnUM/53hgJDDaOem6+7pjak/fTb5IgTcDjw67KjYRAVjytijc6pDHJhNkBA7/fK8v0evtva2aFPNnFYZ3oxNu1NvG7JK0P3sR33qpGaCqMVGCyWflky6KGuZVyDFa8ewDHDDvoOXWvT3J8BHuDKz+qFshVVaXE0MZGoc+XQM1XZjrrhgYyxz9zCsRlnMzF7XQwqUF0sID6PUX2MzNEkIKT4Gu3HA5rtPOHxcIZ4DsQlMfiuMgT5gk6i4do+/kHzjGOcZUUE5BmsdA2dTF2STprtO6bKv+Rgef/hKhJ+rIqCnMOSFBRCCTmAgMpUdezxmPtL5OnU1Sdrec7GaQ1YexJHyq37ct2Nr+YQZegfXG2unHGJthZZZt5AaSHTrTtEhoNlO6OhIGznBICA+w+o0TKImCtWHl/Ys4rzO1/W6aumCKGyB4ZJ6exKbi9EDV3oVfaD12B9rZc8UU/0hsHyw/q3UQ58aPhc3VldnCuGXs28KFZN28ax5m51klkXU9KbMCe6CGFezaMVfGYrIeBGSC/OTEuB9FHrLnVnBFrBy8lOgbV8LjQk/CnqYE4k+UvFJE8oH/0CZq98OQqrQtWaaJRwrMGxl3P98FV5KLJq0XQ0/i0X3lUVp+m7kFinKi7vWrQa7v4LS1opUw+eDykl/fRkK+VoXZKyneY1HJVMXpBXp7sgwqm56a2sXQ6T7+Sjj3yQamXgebzvwUC3DawL7rJfZFg+eJt2LMMn2lerF9v/UfNDc1An2ic=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66556008)(64756008)(66446008)(31696002)(26005)(2616005)(122000001)(186003)(31686004)(38070700005)(38100700002)(66476007)(71200400001)(8676002)(508600001)(44832011)(6486002)(83380400001)(66574015)(110136005)(6506007)(76116006)(2906002)(8936002)(6512007)(66946007)(966005)(316002)(5660300002)(91956017)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmdzTHNocHlSTzdIaW9RekNlNVdMRVFBS0UxU3krdzV2M2hlRVNabkdsQlhP?=
 =?utf-8?B?L2h6V25BdnlHMWVRaHAvcDAzb0RZYVoyeHkyOXdjRFJhL0VsZUI0RmdiMFJs?=
 =?utf-8?B?SjNQcko2TEx6TVlEZlFrU2xHTkh4MU1neHMxdkRIZ2ZUc25vak1MQ3pvbnZo?=
 =?utf-8?B?UVNlZzVtSWVuZnVJb1NzOVlTQkhPbi9MR3IwQkp3QTI4NStIaUxZcko0T0pt?=
 =?utf-8?B?bWFKM2I0THE0bTh1UnNGbm80QWNZQTA1amRpM0RqbWIvTTRqcGEwNzk3N09m?=
 =?utf-8?B?ZnVaVUdpRUsvOVRkU2syNCtNV21YUDJ3UVhvOHpCRzdjZjVWZmxJdWNYZWw3?=
 =?utf-8?B?NmFjK29kVTNCNTFpNmJvd3JKZjR2ck9DOUNVaXR2bk4zcmF5eEtuekF0b0Vp?=
 =?utf-8?B?b1F1ZmZoRnNjY000bC9rcWQ2QmtlUm5hbmdyR3hJL2lJdHVjbldYZlZIQXpP?=
 =?utf-8?B?MmwveGJ0Rkk2U0laYzl2VDdjZVFyM3JjaGJTTEVJd2hZQ2J6dmVEWGRPdld0?=
 =?utf-8?B?YWQvVHkzclFmc3YvVEJoWU9tLzJJUUh1S0xtcVB1WGxZcytoelA3ZHU4K3pH?=
 =?utf-8?B?TDlBanZRZXQvOTFTTzZDU1UzQjdwZlpFS1RsK0IwM2ZkK0M1NmQ2TldCVzIx?=
 =?utf-8?B?OTBzUEptL1JFMGRhZUdCd3d1MkNmaGRxN1lzS2RNN29zRTFCWlhPSGxRK2pJ?=
 =?utf-8?B?Rk5wN0l0ZDdlVXhEaXlXK3VxcmowQ1ZWWWl4QXNuR2dudFkxRUNXbzc2TGp4?=
 =?utf-8?B?YlRDL01wNnJtYjhoaDNmVnYrbndNVXJtZTkrY3MwbTU5VEUxT2x3NzBhclo3?=
 =?utf-8?B?bTV2NnUwS3JIVy9ndjFMNGtVWGFveE1JdkpCTWdtTFErWFFQV0FTcW5KVzhP?=
 =?utf-8?B?MzlXMTBOMENrN0Y0UmZTbUZTdUQzck11OURxY1JWRExXd1hTK1ByUFV0eS8x?=
 =?utf-8?B?TFI1VGFYY3N1MDVsOFlJck5FRzNoLzlHd1hiMS84anIySHVMck0yUlpTUXgr?=
 =?utf-8?B?bFljbm45cXVsVmlUWERwbU9vUktVb0VIWnJ6RUxNWmRFMEwrS0FCZWc2blVu?=
 =?utf-8?B?Qm1NNGFCL3RzVVoxZnl2UXZSMHFRYUZuZDQ5NDNZUzdOSEhjcCtHOExEeU8x?=
 =?utf-8?B?TVNCbVNJanJiWFU5Rkp0emd6c0JqOWVuMWpseFc4RWphWU9NbWNRa1Fldkxo?=
 =?utf-8?B?SDV6RHRSNWdNd29qbU5Tc0NGandta3Rrc0tkWTB3TTJkUW1sdTNsci9Db1Nx?=
 =?utf-8?B?SzQ3V3IrclBDTWJPck9rcCtjK0c2YmtENGJBYkhuallKaUtYbjUwVHVybFpH?=
 =?utf-8?B?MjFFeUVRTTJVSzVmbG5NOENjMmV1YlBWZnl6SmJyNkN4MzhrbkxFVVIvbXgv?=
 =?utf-8?B?QS9DOWdPc1ZONDljMkM4VzU0REhKWEhZcGdrY1hERG05d29PWkR1U3BJeENz?=
 =?utf-8?B?ZDVaN1lQdTJEVk4wcEFGUlVmc0RNaTBTa1BEeExVWmpmL0lCVEMxdm8rUkVU?=
 =?utf-8?B?YTRFVzdxVXhsMGVUVjNzYlNxVGhGcXVLbUNvRlo0Mlg0MzhXVWRsMjQxb1Vp?=
 =?utf-8?B?dTQzT3FTS0twNFVyS3VzL3VFVGZyUExmeTQ3ck10MzJocjNKMlBrcGh6a2hn?=
 =?utf-8?B?MUdiZmxNRHJJMEdLSUY0Zk9QT0MvNFpDOFJ4Vmg5dkRUNDB3QW90RlZkRllh?=
 =?utf-8?B?NlVza05sNnVINjhIWTl2VEVXdVJMOGlmK0FoRnZsQjFPWWtHY2xqeXNjNjBT?=
 =?utf-8?B?TENabkVJNGsza2dHRWRPS3Z1RktGcWdkZ290ZjlzTXUyWm41TEswK2lkUTQv?=
 =?utf-8?B?WHQwU2s1ekFmTzNrOGZGc2QzOFkvTnVpOTJhM0JSelNCcU5XT2s4QXUxczE0?=
 =?utf-8?B?aHZvanMxWjRlekx2SGZ1WU5xOFFXMkNaN0xsNVFIaU5GTDZSRG0yNTNhV1c1?=
 =?utf-8?B?Yk5uR0tYdlJMdjgzS245dkNjUG1Kem0vbGIzYURuVmpRWmJiOEhhYit4YUxT?=
 =?utf-8?B?NXM1UnhXOFNQTmZSS0ZaZ09KQ0swYit0cEJjRVR3bmYrN0l6U1MvUHQveVVi?=
 =?utf-8?B?VGJKQ0thVU5Pb3N3L0tEZnFEL3RWYm52M3JUKytBK0ZrQ1BuZVgyTlQxSzVj?=
 =?utf-8?B?TlVIdkx6QnBiUXNmbU40S05wc2tSaWxnY0h0L0VxR1FoVDN1KzVwU3ZTVDlJ?=
 =?utf-8?B?SkVFay9RQVhnaEFSVW4zem1LR1dUN3VlaG5CT0ZxNUFyZm9nUk12YzFHQ2lD?=
 =?utf-8?B?Yytid04rSEhTbmpKTFFpM1pNd0JJS2lkQTZZZVcrdFEwS3MrKzVNMm5EOW1z?=
 =?utf-8?B?WCs3U255MEEwVW5YUTJEL0FES0tRbEtPbTZvR2dtT3VLdSt0OTQxTU5GTWxE?=
 =?utf-8?Q?f1cgdwr/eccTfyX/ptvMeerIvt7Zb84H4OSbg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DD5487D2AA9C64F848CBCA644D4D6BD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c3b5df-346d-47e2-1b7b-08da12411cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 11:33:29.0222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+kIrcAoGj0P0VSsm+FaF41daxNoxlu0o3BI3MIK9H/IdNIbclCBIKuLUOuF6R0qg7zGqAlvi7OQR0ozzAtoNW/8+Z+OqpRCy7O5tP0phWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2728
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzAzLzIwMjIgw6AgMTM6MjQsIEpvZWwgU3RhbmxleSBhIMOpY3JpdMKgOg0KPiBD
dXJyZW50bHkgdGhlIGJvb3Qgd3JhcHBlciBsYWNrcyBhIC1tY3B1IG9wdGlvbiwgc28gaXQgd2ls
bCBiZSBidWlsdCBmb3INCj4gdGhlIHRvb2xjaGFpbidzIGRlZmF1bHQgY3B1LiBUaGlzIGlzIGEg
cHJvYmxlbSBpZiB0aGUgdG9vbGNoYWluIGRlZmF1bHRzDQo+IHRvIGEgY3B1IHdpdGggbmV3ZXIg
aW5zdHJ1Y3Rpb25zLg0KPiANCj4gV2UgY291bGQgd2lyZSBpbiBUQVJHRVRfQ1BVIGJ1dCBpbnN0
ZWFkIHVzZSB0aGUgb2xkZXN0IHN1cHBvcnRlZCBvcHRpb24NCj4gc28gdGhlIHdyYXBwZXIgcnVu
cyBhbnl3aGVyZS4NCj4gDQo+IFRoZSBHQ0MgZG9jdW1lbnRhdGlvbiBzdGF5cyB0aGF0IC1tY3B1
PXBvd2VycGM2NGxlIHdpbGwgZ2l2ZSB1cyBhDQo+IGdlbmVyaWMgNjQgYml0IHBvd2VycGMgbWFj
aGluZToNCj4gDQo+ICAgLW1jcHU9cG93ZXJwYywgLW1jcHU9cG93ZXJwYzY0LCBhbmQgLW1jcHU9
cG93ZXJwYzY0bGUgc3BlY2lmeSBwdXJlDQo+ICAgMzItYml0IFBvd2VyUEMgKGVpdGhlciBlbmRp
YW4pLCA2NC1iaXQgYmlnIGVuZGlhbiBQb3dlclBDIGFuZCA2NC1iaXQNCj4gICBsaXR0bGUgZW5k
aWFuIFBvd2VyUEMgYXJjaGl0ZWN0dXJlIG1hY2hpbmUgdHlwZXMsIHdpdGggYW4gYXBwcm9wcmlh
dGUsDQo+ICAgZ2VuZXJpYyBwcm9jZXNzb3IgbW9kZWwgYXNzdW1lZCBmb3Igc2NoZWR1bGluZyBw
dXJwb3Nlcy4NCj4gDQo+IFNvIGRvIHRoYXQgZm9yIGVhY2ggb2YgdGhlIHRocmVlIG1hY2hpbmVz
Lg0KPiANCj4gVGhpcyBidWcgd2FzIGZvdW5kIHdoZW4gYnVpbGRpbmcgdGhlIGtlcm5lbCB3aXRo
IGEgdG9vbGNoYWluIHRoYXQNCj4gZGVmYXVsdGVkIHRvIHBvd3JlMTAsIHJlc3VsdGluZyBpbiBh
IHBjcmVsIGVuYWJsZWQgd3JhcHBlciB3aGljaCBmYWlscw0KPiB0byBsaW5rOg0KPiANCj4gICBh
cmNoL3Bvd2VycGMvYm9vdC93cmFwcGVyLmEoY3J0MC5vKTogaW4gZnVuY3Rpb24gYHBfYmFzZSc6
DQo+ICAgKC50ZXh0KzB4MTUwKTogY2FsbCB0byBgcGxhdGZvcm1faW5pdCcgbGFja3Mgbm9wLCBj
YW4ndCByZXN0b3JlIHRvYzsgKHRvYyBzYXZlL2FkanVzdCBzdHViKQ0KPiAgICgudGV4dCsweDE1
NCk6IGNhbGwgdG8gYHN0YXJ0JyBsYWNrcyBub3AsIGNhbid0IHJlc3RvcmUgdG9jOyAodG9jIHNh
dmUvYWRqdXN0IHN0dWIpDQo+ICAgcG93ZXJwYzY0bGUtYnVpbGRyb290LWxpbnV4LWdudS1sZDog
ZmluYWwgbGluayBmYWlsZWQ6IGJhZCB2YWx1ZQ0KPiANCj4gRXZlbiB3aXRoIHRoYSBidWcgd29y
a2VkIGFyb3VuZCB0aGUgcmVzdWx0aW5nIGtlcm5lbCB3b3VsZCBjcmFzaCBvbiBhDQo+IHBvd2Vy
OSBib3g6DQo+IA0KPiAgICQgcWVtdS1zeXN0ZW0tcHBjNjQgLW5vZ3JhcGhpYyAtbm9kZWZhdWx0
cyAtTSBwb3dlcm52OSAta2VybmVsIGFyY2gvcG93ZXJwYy9ib290L3pJbWFnZS5lcGFwciAtc2Vy
aWFsIG1vbjpzdGRpbw0KPiAgIFsgICAgNy4wNjkzMzEzNTYsNV0gSU5JVDogU3RhcnRpbmcga2Vy
bmVsIGF0IDB4MjAwMTAwMjAsIGZkdCBhdCAweDMwNjhjNjI4IDI1Njk0IGJ5dGVzDQo+ICAgWyAg
ICA3LjEzMDM3NDY2MSwzXSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKg0KPiAgIFsgICAgNy4xMzEwNzI4ODYsM10gRmF0YWwgRXhjZXB0aW9uIDB4ZTQwIGF0
IDAwMDAwMDAwMjAwMTAxZTQgICAgTVNSIDkwMDAwMDAwMDAwMDAwMDENCj4gICBbICAgIDcuMTMx
MjkwNjEzLDNdIENGQVIgOiAwMDAwMDAwMDIwMDEwMjdjIE1TUiAgOiA5MDAwMDAwMDAwMDAwMDAx
DQo+ICAgWyAgICA3LjEzMTQzMzc1OSwzXSBTUlIwIDogMDAwMDAwMDAyMDAxMDA1MCBTUlIxIDog
OTAwMDAwMDAwMDAwMDAwMQ0KPiAgIFsgICAgNy4xMzE1Nzc3NzUsM10gSFNSUjA6IDAwMDAwMDAw
MjAwMTAxZTQgSFNSUjE6IDkwMDAwMDAwMDAwMDAwMDENCj4gICBbICAgIDcuMTMxNzMzNjg3LDNd
IERTSVNSOiAwMDAwMDAwMCAgICAgICAgIERBUiAgOiAwMDAwMDAwMDAwMDAwMDAwDQo+ICAgWyAg
ICA3LjEzMTkwNTE2MiwzXSBMUiAgIDogMDAwMDAwMDAyMDAxMDI4MCBDVFIgIDogMDAwMDAwMDAw
MDAwMDAwMA0KPiAgIFsgICAgNy4xMzIwNjgzNTYsM10gQ1IgICA6IDQ0MDAyMDA0ICAgICAgICAg
WEVSICA6IDAwMDAwMDAwDQo+IA0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vbGludXhwcGMv
aXNzdWVzL2lzc3Vlcy80MDANCj4gU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGpt
cy5pZC5hdT4NCj4gLS0tDQo+IFRlc3RlZDoNCj4gDQo+ICAgLSBwcGM2NGxlX2RlZmNvbmZpZw0K
PiAgIC0gcHNlcmllcyBhbmQgcG93ZXJudiBxZW11LCBmb3IgcG93ZXI4LCBwb3dlcjksIHBvd2Vy
MTAgY3B1cw0KPiAgIC0gYnVpbGRyb290IGNvbXBpbGVyIHRoYXQgZGVmYXVsdHMgdG8gLW1jcHU9
cG93ZXIxMCAoZ2NjIDEwLjMuMCwgbGQgMi4zNi4xKQ0KPiAgIC0gIFJIRUw5IGNyb3NzIGNvbXBp
bGVycyAoZ2NjIDExLjIuMS0xLCBsZCAyLjM1LjItMTcuZWw5KQ0KPiANCj4gQWxsIGRlY29tcHJl
c3NlZCBhbmQgbWFkZSBpdCBpbnRvIHRoZSBrZXJuZWwgb2suDQo+IA0KPiBwcGM2NF9kZWZjb25m
aWcgZGlkIG5vdCB3b3JrLCBhcyB3ZSd2ZSBnb3QgYSByZWdyZXNzaW9uIHdoZW4gdGhlIHdyYXBw
ZXINCj4gaXMgYnVpbHQgZm9yIGJpZyBlbmRpYW4uIEl0IGhhc24ndCB3b3JrZWQgZm9yIHpJbWFn
ZS5wc2VyaWVzIGZvciBhIGxvbmcNCj4gdGltZSAoYXQgbGVhc3QgdjQuMTQpLCBhbmQgYnJva2Ug
c29tZSB0aW1lIGJldHdlZW4gdjUuNCBhbmQgdjUuMTcgZm9yDQo+IHpJbWFnZS5lcGFwci4NCj4g
DQo+ICAgYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUgfCA4ICsrKysrKy0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9ib290L01ha2Vm
aWxlDQo+IGluZGV4IDk5OTNjNjI1NmFkMi4uMWY1Y2M0MDFiZmMwIDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL3Bvd2VycGMvYm9vdC9NYWtl
ZmlsZQ0KPiBAQCAtMzgsOSArMzgsMTMgQEAgQk9PVENGTEFHUyAgICA6PSAtV2FsbCAtV3VuZGVm
IC1Xc3RyaWN0LXByb3RvdHlwZXMgLVduby10cmlncmFwaHMgXA0KPiAgIAkJICQoTElOVVhJTkNM
VURFKQ0KPiAgIA0KPiAgIGlmZGVmIENPTkZJR19QUEM2NF9CT09UX1dSQVBQRVINCj4gLUJPT1RD
RkxBR1MJKz0gLW02NA0KPiAraWZkZWYgQ09ORklHX0NQVV9MSVRUTEVfRU5ESUFODQo+ICtCT09U
Q0ZMQUdTCSs9IC1tNjQgLW1jcHU9cG93ZXJwYzY0bGUNCj4gICBlbHNlDQo+IC1CT09UQ0ZMQUdT
CSs9IC1tMzINCj4gK0JPT1RDRkxBR1MJKz0gLW02NCAtbWNwdT1wb3dlcnBjNjQNCj4gK2VuZGlm
DQo+ICtlbHNlDQo+ICtCT09UQ0ZMQUdTCSs9IC1tMzIgLW1jcHU9cG93ZXJwYw0KDQpIb3cgZG9l
cyB0aGF0IGludGVycmFjdHMgd2l0aCB0aGUgZm9sbG93aW5nIGxpbmVzID8gSXNuJ3QgaXQgYW4g
aXNzdWUgdG8gDQpoYXZlIHR3byAtbWNwdSA/DQoNCmFyY2gvcG93ZXJwYy9ib290L01ha2VmaWxl
OiQob2JqKS80eHgubzogQk9PVENGTEFHUyArPSAtbWNwdT00MDUNCmFyY2gvcG93ZXJwYy9ib290
L01ha2VmaWxlOiQob2JqKS9lYm9ueS5vOiBCT09UQ0ZMQUdTICs9IC1tY3B1PTQ0MA0KYXJjaC9w
b3dlcnBjL2Jvb3QvTWFrZWZpbGU6JChvYmopL2N1Ym9vdC1ob3Rmb290Lm86IEJPT1RDRkxBR1Mg
Kz0gLW1jcHU9NDA1DQphcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZTokKG9iaikvY3Vib290LXRh
aXNoYW4ubzogQk9PVENGTEFHUyArPSAtbWNwdT00NDANCmFyY2gvcG93ZXJwYy9ib290L01ha2Vm
aWxlOiQob2JqKS9jdWJvb3Qta2F0bWFpLm86IEJPT1RDRkxBR1MgKz0gLW1jcHU9NDQwDQphcmNo
L3Bvd2VycGMvYm9vdC9NYWtlZmlsZTokKG9iaikvY3Vib290LWFjYWRpYS5vOiBCT09UQ0ZMQUdT
ICs9IC1tY3B1PTQwNQ0KYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGU6JChvYmopL3RyZWVib290
LWlzczR4eC5vOiBCT09UQ0ZMQUdTICs9IC1tY3B1PTQwNQ0KYXJjaC9wb3dlcnBjL2Jvb3QvTWFr
ZWZpbGU6JChvYmopL3RyZWVib290LWN1cnJpdHVjay5vOiBCT09UQ0ZMQUdTICs9IA0KLW1jcHU9
NDA1DQphcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZTokKG9iaikvdHJlZWJvb3QtYWtlYm9uby5v
OiBCT09UQ0ZMQUdTICs9IA0KLW1jcHU9NDA1DQoNCg0KPiAgIGVuZGlmDQo+ICAgDQo+ICAgQk9P
VENGTEFHUwkrPSAtaXN5c3RlbSAkKHNoZWxsICQoQk9PVENDKSAtcHJpbnQtZmlsZS1uYW1lPWlu
Y2x1ZGUp
