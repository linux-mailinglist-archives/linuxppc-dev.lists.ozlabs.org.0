Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B44F5171F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 16:51:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsQym3vq3z3bqW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 00:51:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::609;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsQyD6MNqz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 00:51:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4tfUA1eh1/YQwLoadfrIWDv8dypSwqSpAo3REJALFtjHIjEDh7j2A9F/2wj4E/Z2rQAFrSQ30j8lgplSRU2xU+Q/7NrO5dllI+v4D4e7jFm7ljtUfn0WmtkifCyP9C+S4CdPoaDFoP332sLH5t2wq7rkDHkLITIQCBd/tLVkbQB+FoMJB+Db3iYdcWb4P2G1k9MTTInLYzSpXVlsS6hl/JIAWMXYf+FVcTLjO/4pumFqyLCKDNCjxgnEB9XZb4VlKupxCFkuDefi495l2fHx+jj7ir4tNg+2IP/bZeFVR7EC65Njc04LMZrw+2ynKuSIbX7EBJrRxzgLLAlWc9RzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPAyR8u6p+8+gi//33RMIUjcWeAWHl4MVM6YE5+oapY=;
 b=FCHQDt+0gXB7t6OMbvvjkxLGj2lmTffk7glzlop2lQhlIOEf1lhNlzzuP8cmsCiPiidRcAeVjvOz2StjoY5b98oMj4q0JzMEMHDnERpKeONsfa8bXMmiHDMY+bMvI7KVw1hihk/KEYFzGqfQTnniVdG7SqICND6HtNqMNnVz0Wa5Cv9MRTKuMagI3CUoOJv4BF5vUps1Cy479iFI2A1K9EAWvm80J8KaMcQcE8ZS2pl3cRZBJq4iaKU4bKkVWGgl11ZxEl/Y/jgRZPPiwcGSMiTfyNYnEgy+hux4Grasuf17fKVWm7SS4gRuv0gkEANiPzH/iruzaSZC0ZC9RYHm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3242.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 14:50:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 14:50:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Steven J. Hill" <sjhill@realitydiluted.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Any technical information for Wind River 7457 board?
Thread-Topic: Any technical information for Wind River 7457 board?
Thread-Index: AQHYWyo8njo1qI2d6UmNEtsbzTaaea0LsaiA
Date: Mon, 2 May 2022 14:50:41 +0000
Message-ID: <704da7c7-ca42-97c4-cb23-8218eec9841a@csgroup.eu>
References: <6620211e-c475-3b78-42fb-7ca8a2125590@realitydiluted.com>
In-Reply-To: <6620211e-c475-3b78-42fb-7ca8a2125590@realitydiluted.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7ba9a63-f82e-46b7-3407-08da2c4b212c
x-ms-traffictypediagnostic: MRZP264MB3242:EE_
x-microsoft-antispam-prvs: <MRZP264MB32423E11D0B1AAB046613F6AEDC19@MRZP264MB3242.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ycuYvUvoZb//zha8VfNcSgaA8s+4zyHFZOblE7RY7vOF0hfvCS6wDpCN1d4DbNCmoRCXjXhA1HOxrFqOktbmwI5ejIu3TcaouHQOtk5yX0/fx+Kll8XA3Xs1lCJtSLl8x7jYn9DHpA4YYTo/XObb2jG4Zr5oCcZN+PBYdvNgNhoUQw8g0Ozb0zbd63ldDJuaobZVdJ8G2p+0hBugFFjMs/eT7oDHcsUaSzxr8ynHerxMcXGT6HWw2B1TooF5CgB9Ijfv5H3RJxogPoqExUWV8TCl7AOXjaNum+RjM1E2bYHglP4MDBhNoiTo/dYYP0fJen25kCs69dNoEKvs1EG4x79rQ4T9R3KocbJXdqrWSjP3/uyYDZWPKZ5FwrWgmi6OLEeHNZ9HSZGfuPoCC6+9/yjfcxX4ecp56PMTp8oJHWs2Q3em+o39PS8IHncr6wRpRCTAoKDA1dYpKjmj8qBsRlFRMoP21UM2yj7VSCTdEUDGRUNrW9SQAyYE0ZYyJnEO/icW55bNXY8gKPDaUUcow2gWlBbIw8GWf/fOzewWFDp4KsZSMGy4pADLkJ2Ol2D8xvxnFDwQYz+CjBuP9WggQN0NPVQVTfQs+u//TG8nahKARytiBGvwhy27JCraklq9UMVTgT1sXFPJ/0AuBchQEaSc+kkD+1tmr/hkJpoMYA1FxAUu6UcqEE/acMsraklQc/hsPLWnLfBj5yx2l9q0DFBkyabxKD38laCSy4J8guAvEwa4Lw9TI1YD7dt/jlBDXTF6tbDiA1BND8nrXR0ftA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(76116006)(8676002)(66556008)(66476007)(66446008)(64756008)(66946007)(31686004)(110136005)(2616005)(186003)(316002)(2906002)(31696002)(86362001)(26005)(6512007)(6506007)(71200400001)(36756003)(5660300002)(44832011)(4744005)(38070700005)(38100700002)(508600001)(6486002)(8936002)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjU1MUJ4RFVJRGNBd0EwdG0wNnRKK2FhRlJlYUlESzN4T0RXVitHVUd5UUxn?=
 =?utf-8?B?QVN1SXhKeFMzMDhOSFFvTGxsaEc3YlE5Mm1JanB6THpFWTlKeWczZmZlTzZx?=
 =?utf-8?B?cUF4NXZqZDBRRXQ4SlhxaVh0Z3h2RlN5UmhQakJyOVhZT3l0dG9LVkE0V2hP?=
 =?utf-8?B?L3EyejUvSHg5RzBmbHJ5VUlnQlVSN0xtSDVYOVFRbzV5STBVTlhIMDdpZHZY?=
 =?utf-8?B?dkVHOFpXa1BkQS9ReGZLTmZtL0IyODZwbkw2dVhWZS8vUW5pUXRmemNjbkJC?=
 =?utf-8?B?TFFETG8yMWxIcUk1TEg0dFBIRlNoVmQ3TGtmSU1scTd4QlVmR0Z4dmphVzdL?=
 =?utf-8?B?RXZwVWZ3YWVVT2RqZ3F5b1FkbE92SFJLZnN6UWo5MFJlR2ZJZUFaN2RrTjhO?=
 =?utf-8?B?VldRbmdaenpEOTZ3VXMvVmFNcktIeFRtWlFrTytWS0N1N1NIYWlZWm5zSno3?=
 =?utf-8?B?dkI2YVhlMlNtcVo5bmJaV0w3bDZOSUtteVNscG5rNDU0Z2hhV29hWjRzeDdl?=
 =?utf-8?B?Sm5KWllrNFFHMHZIMlZKMDhjL1QzVXBXb2liYmhsMVdTSmdoNnhvcVl3TFZx?=
 =?utf-8?B?dndpcG5Ca09oMnNUTEQ1RCt2TXhNNnZUNzRXQjJockVjM3gyU2JCRllkR3Fv?=
 =?utf-8?B?TjhiVkRKbE0xeGN1WW92VnlzQmFLaHNkNWl4K1pZbGV5b0QvcS9KZjY5K2Nu?=
 =?utf-8?B?bWFiSFl4S2lxbHg0V2NnYkxFV2NoSUhBclJkaDNnREpvL1pXTXJXZVpKWlJw?=
 =?utf-8?B?UmZNNVJmL2ZVSUNZUnlrZjZnYXk2U1B3OHZHc21QNnpuN1pVY0FhbzRjTE1U?=
 =?utf-8?B?Qkw1Q1FzZmFnVDRhcGZDWkxZZnRjK0tkVnp6U0Q0cXJrMlAxelM3OFhmMWFz?=
 =?utf-8?B?SWVhWExwU051TW0vWnI5TGtwS285ZzREU05qWkpCSTd5VlBTS1JiVDcyaWdK?=
 =?utf-8?B?SUl6UW04L2JlakcrdGlTMko3T29qRDVlSUY4R3grNHZpZHlrbTFDSnN0NVNu?=
 =?utf-8?B?N2w2Y1NCV3lBM2FZNkZiZ1ZucWVpSWxpWjZReStNUTRqZXBoNXBiTjhlMDZB?=
 =?utf-8?B?bDlabHBGd3NzN2hhSVkxS0NKUGxFSHdhdFVycU5yZ0paWlE4QTRYdHlybCt2?=
 =?utf-8?B?WU40NEdtaXIvS0NUdnFqTXdIR1dSSFk5alIvdWpnbFJNR2pDbVFaSlp1Rzhz?=
 =?utf-8?B?TEFDWkVkUUFjUVJidGJ5Uko0M0ZWYzQ0QTVCUjZ5aXF3bEMzMjFqSTJPdFdn?=
 =?utf-8?B?WXhja3NjUVZLZVVGdkgzL2F3WlMzN0RyU2JpUENTSVZEa1pkUDBjZ1VhVWJz?=
 =?utf-8?B?WkM0RHRLbnl6QkdkaFZEL20xbG9zZjBvMGlUL051Y2NqUGFOSzBDK2FpR2lD?=
 =?utf-8?B?Y0ZEUmJCREpMaEFNWHpNRjhDaW5zWWRsKzMzNmFuSHlFQzNuUlRWM3lLaHN3?=
 =?utf-8?B?dGJYZ2VBSkNxclp0YnNBZ2N3OGJiUXRra0FVZjB6N3FmYjFyWHRVVEhmOHBY?=
 =?utf-8?B?RmVTR1phMGtTRVRDR0E5S0hJYWlqQ0E0WlV3NmhqVncrUXlXZnJRVGtMdTJu?=
 =?utf-8?B?QldZYXpvcU9ESGRkTnZadkM0OHpSeHRvN0RFaUtJZncwa0ZnRmdRVkVUQ2ow?=
 =?utf-8?B?L0cyaVJXMjZGK2gySGpPUU51YUhmc3RUL09nbW5Fbk9tSFBjQUZGelJEa1hw?=
 =?utf-8?B?WjhkZzZxbWRKb2FQeTJDNUxqVWY5UjN4ODVYUER3RGllRnJHREIyV1podHF6?=
 =?utf-8?B?QUVLMWowSGh5cGRlL2VOd0RLZGFBVlJQL2huQndVT2VEZlBoeHBRSFF4NGYy?=
 =?utf-8?B?dUo5NlkzajZkeWhEMGpCTHlacHZ2R1ZQODlvNUpOY1hxdm8veG1hd3FJTFd5?=
 =?utf-8?B?RndMU3dWV015THZqaTRYQk5kVjlPK3FDUHFHOTRGZHBUVmdLMEtnbjhuQ3Fx?=
 =?utf-8?B?TzU0OENmMkhrL0JXSzJXU080MlIwTUkwdE9LMFprOFQ0c3QySHFpaG1VWXdR?=
 =?utf-8?B?NEdsdGk2T2kyWml1YUxTbmxHVWs1bWcrZ0xOQnRBWXZ5NGI5dzFVU1FQd0hQ?=
 =?utf-8?B?U2ZJVmRwZTVGTVBKOFJzR2R1NURtb3ROQmdJOEYrYk1NOWVNMnhMTmIwMXpk?=
 =?utf-8?B?MEh3b3NHREZXRllXekErMFY1eDJNNUc2emNTanhlcjMyQnlPaGVhY3VtMHdX?=
 =?utf-8?B?SmgyT1M4bUMyd3gyRER1S0k3N2s1QUVLcEgxTFJwZE9NZ1FrWnNmcTZBRWxE?=
 =?utf-8?B?RkdCemdCK001Y0hRVUFVNndLbVdPdERDelp0N3hSZGJZeUpaNUlwK0N0VThG?=
 =?utf-8?B?RkNpb01wZHhPWm1POUZXOGkyMlVmQU5IWlN3YXEwRzhqcVA1MlZNN3NPUGQy?=
 =?utf-8?Q?19ouH6N31nwczRYaryWwX4SPM306f/InxHpLc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2D7C41A1A8E5441A7A8D8BB195B1025@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ba9a63-f82e-46b7-3407-08da2c4b212c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 14:50:41.6436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1NC1l+zwpL7LvlaKnurwoZJaB2TXE+ZuZsXq0dUDuWCDoKkrz1G5qKeIyY6yQaeEA0K2bQvTLlupCW9WctHn8FF7JSaHewwSJjdLQbsi40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3242
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

DQoNCkxlIDI4LzA0LzIwMjIgw6AgMTk6MzMsIFN0ZXZlbiBKLiBIaWxsIGEgw6ljcml0wqA6DQo+
IEJlbG93IGlzIHRoZSBzZXJpYWwgb3V0cHV0IGF0IHBvd2VyIG9uLiBEb2VzIGFueW9uZSBoYXZl
IGFueSBpbmZvcm1hdGlvbiANCj4gYXQgYWxsPyBJIGtub3cgdGhlIHByb2Nlc3NvciBpcyBhIHNp
bmdsZSA3NDU3IHdpdGggTWFydmVsbC9HYWxpbGVvIA0KPiBHVDY0MjYwQSBob3N0IGJyaWRnZS4g
SSB0aGluayB0aGUgYm9hcmQgd2FzIG1hZGUgYnkgTW90b3JvbGEgb3IgTlhQLiBJdCANCj4gaGFz
IGJlZW4gZGlmZmljdWx0IHRvIHRyYWNrIGFueXRoaW5nIHdpdGhvdXQgV2luZCBSaXZlciBzdXBw
b3J0Lg0KPiANCj4gLVN0ZXZlDQo+IA0KPiANCj4gDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVnhXb3JrcyA2NTMgU3lzdGVtIEJvb3QN
Cj4gDQo+IA0KPiBDb3B5cmlnaHQgMTk4NC0yMDA2wqAgV2luZCBSaXZlciBTeXN0ZW1zLCBJbmMu
DQo+IA0KPiANCj4gDQo+IA0KPiANCj4gQ1BVOiB3clNiYzc0NTcgUG93ZXIgUEMNCj4gVmVyc2lv
bjogMS44DQo+IEJTUCB2ZXJzaW9uOiAxLjMvOQ0KPiBDcmVhdGlvbiBkYXRlOiBKdW7CoCA5IDIw
MDYsIDExOjM4OjE0DQoNCg0KRGlkIHlvdSB0cnkgdG8gZ29vZ2xlIGl0ID8NCg0KQ2hyaXN0b3Bo
ZQ==
