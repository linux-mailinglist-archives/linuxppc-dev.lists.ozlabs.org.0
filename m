Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB59467822
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 14:23:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5D6g09hKz3c59
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 00:23:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61a;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5D684pS0z2ymP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 00:23:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDDmwjjHpY90AcPXIjk1fDAp24wR+80wEld3vHVFU33SObIqp1Z7HQce2hSRJsk98q1b9jyMiIp1dBewjuZD3GYe4JARdf6tPn3OSkzpsKKwv0spdOEA5DiVulm1ZeM4RXqbjMtRQlRzbzH34RkKzD5METY7xj7Oxr8m39Onc4Pb6ODIjL05HxI2qH6eZ5yZ0rHu8oz5PYgVW50J73+PeS4PvFCtrCfI4b+HgcBNDI++qJPXUqKouCi34B2NxiWHwnWsmgjHxg2kPJBpboNGubafwn3JBwhOnBiKh6QO/IbDk+rbN17LVB+O5XcDNCIffVycKRyI2bmMbBC6+HhIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hWM/DMAxV8Ts5HgKdm88J8cqQ0g4QLVxLYZR9l5GY8=;
 b=Z6ckrSjmhzS1EiCFfFa9XmzgN7WPIw5uIgEZH+OlkcbGSJuKVU9sPMoIYV9Kz7epwCZm3q+DyUqN+Rk8MhGIwmFf/D+Vv7sZFqTUlCElZRZO3uaGGbz9C3VK1bhX3Hdf+WsEcUVKFwySeh6FmuOu+yQHm2PsxEtnXrBIroGZGOACGMYxOBJxOpzhF8Vj4ELo9C8MX1MYvT+AOzyWxDBQXlnyXBZZNndwcsJZYxRd4AZQES15dpCLU2D7peEmCAwi4VytUNeGc/IRGwmzV1GVVEtNvpNqt5C1qZH2Xeo1FqNrazMt6urs3cvJlC9Empu42u37OjQuK9r/cXYS+/XzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0726.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:17::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 12:49:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 12:49:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "mbizon@freebox.fr" <mbizon@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIA
Date: Fri, 3 Dec 2021 12:49:06 +0000
Message-ID: <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
In-Reply-To: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5abda525-ca47-4d5e-a432-08d9b65b4b03
x-ms-traffictypediagnostic: MRXP264MB0726:
x-microsoft-antispam-prvs: <MRXP264MB0726168FAD4EAFD17C29226EED6A9@MRXP264MB0726.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KbMAocnmdX5t42T2ZFWBPEvEnIzQAc4UWWPZLITBRfWZ/eeIyd1/ZbO+d5hstZerDPlp+ttLktR8UneWbaUNb4Wl+KOWg7c2WSBDAr7jybljFYqj2jBuDotp+rVwlZ+soAkX69ScX/JgK83DYmpoFClBPIBT9DmtpPjBGwJvOQf3vk9RZZl9WrKFak6A8anQC3eVYFg9/HfxZtmEqlp0gv8t+VhVWo4TZRnL/cKN49iUVQgLDZa01FbOfTQHoQBADCYKHECzBrw420ywUgmcloouhbLPXO50svAdRgmD1hxXaGcGIr3V6BuYkn6xc7VCFs/EvuI1vhMPgvH04J1r8bW9gV4Sio+DN+Bi+TXL1vz1s1W2Hzk03jD6bky49NAsqv1Fvgsf64f0GtGs5lgHWhT2Xf06QU419rrbw+7PQn5k2S8QcKiAFDhKPyFYtoS6WlWodVAktfV4ZhwdQvcgiE2X9PKnMnzbiV+s9LkfMQ2V0AUPH3q6+yMgRehDNv6PL0ezrTTulZcYH+lW6JaUghheUmJOlXBXoCFbjdP3TsqRDQQhZDaq9VoxSupn9LhvwD0IDUDZXHcPAYbdf+yEkmE9poQd2nIGJ3DsmiUKHZtdZJLak6xnEXyJI+J5T94pQbjV69CgNU8kuTFe+RORJnCoUvVWX6YG25DIqsOFf8ZDea9R6Bo2OojZ3pvQji+KsGZEcr4xofDJQk7HZ1OHKt6gTaVZmDtH+NiEuy2VcIoMI8RS2YH4P2LdrpNq2mlVoJQunx4ge6z14TvM95l0YQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(6506007)(316002)(83380400001)(91956017)(64756008)(66946007)(71200400001)(8936002)(2616005)(31686004)(36756003)(66446008)(38070700005)(38100700002)(44832011)(6512007)(86362001)(6486002)(508600001)(26005)(186003)(5660300002)(66556008)(8676002)(76116006)(122000001)(110136005)(31696002)(66574015)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkRBV21Ib1Vha1J4VnhYY3lFQklWdE4vN2VlYlJDandsNmdNSTdXUWowcm1C?=
 =?utf-8?B?SmVnVzBFNTZOS01tK0pncXlSY1NycnlOeG5FQUpIYmFPeHdlc0NWRC9uMXVp?=
 =?utf-8?B?Y1JMN2RuYSt0WllOREtFTExXWTBCRzZObWo5ZkE1bGhHaFJVcjZBQlFLL2JL?=
 =?utf-8?B?RGZQZjVDaVBUZjBpVHkyYjJYbjhMMjB5eVFwSkFpOWRESDByUUlveFVIamFY?=
 =?utf-8?B?TldOdlpqaUx1aUJCWkQ4dEluMEtkd1BYOWhOM2tzNmpFR2tOcUNDcDFONXp2?=
 =?utf-8?B?WVM5M2huNVJ2aGhoZWZBUWJPaFNIamxvNmxzOEt0VE1ZMmlJa1dQdGZTYjcr?=
 =?utf-8?B?QitQWTJxM2k2RzFCT0dNb2ZGMEx0L0NzWnk2dmlSalJxTjU2QkxjYkc0NElv?=
 =?utf-8?B?UUVZVTVYTUF5eFVjSmxxb2FBL0FMN0lGSW1wbDhJMmI5MzM1aCt0L0UxSk00?=
 =?utf-8?B?QmxHK216c0RIa3lnbXBmTXdxaXBFM29UWldIRDQ0bDBYcWlwUzVNY1JjYUY4?=
 =?utf-8?B?UXk2NElVZFUyQmhmMkpsaDVsOG5LUWVzRi82UDhldzBpbmpuZmJHc0tJQ01z?=
 =?utf-8?B?YnhSbmZEMkpXdzU3NWpya3pObS9uYU42dkJlOXE1Y3dDWVp3Z1lJSWZVZGo3?=
 =?utf-8?B?WnpiUGFQMlYxbTM0MEFiZDM3U01pWGt3bmxsYWNOd1ByZWFFdEhWV3YvNWFN?=
 =?utf-8?B?SXpvMGxBWGRxempDSWUvbFdiTjBzOTdKMXpCbVE5dVhUcTlMRG9uaHFqYldH?=
 =?utf-8?B?Z2dPZFZOVWxObWJvdHJJdEFvb2w4MWFoaUY1TlM2d0pvRThaWlBoU2dYTG1a?=
 =?utf-8?B?ZDlJYWlqMlRwdG9qS3VWTmRrd0w0R1NpeG1CT0p3QXhBeExIYjBabERiL2dY?=
 =?utf-8?B?NGlTbGNvaWVTd0wrTzZ2c1VULzhvc3AzNCtPKzRXNENSMktmUE5JL3JkUWhE?=
 =?utf-8?B?ZjBkeWJUZ256ODMvZHdXNk9EcXlzYWZRWVRZMldzb0hRWDhFSWJSSWpZUk8w?=
 =?utf-8?B?cnZiV244MVprWkFad2ZhODV1OWF4UTBvbmZ2NitBNGk0dUNod3ZpNXgwdmt6?=
 =?utf-8?B?aXVmTDNFQ3FGei90R1ZhbTBLMDQ5bjBhcE0ydE5kc2MzVW83Z1BEL3I3Z3NO?=
 =?utf-8?B?eGtBWElwM0VyOUpBWFU3WnRkL1ZIOW42QVI2TUF3ZExwYmdPZ3JkM3Rhald2?=
 =?utf-8?B?cVk3MlZ0QUJRbE9OS2k5b3NvblQyUlpKc09sMUZtbWUwVGZ5NHhGRHYvS0xi?=
 =?utf-8?B?NCtUTXNXZGFrdVQ3cmVCMEJEVWhRN3VWZWJDaTMxMWJ0WUpNRXRzRnFFS3py?=
 =?utf-8?B?RDRRNWIvZWtqdWFXTmhVQUk4Z3hRV3djMk82ZTFFSUJ0T0RJZG5yUmczSXRj?=
 =?utf-8?B?VG5rSG5QUVV0VUtIUGFKLzlyVnNRYytRcjZpSFRIVklLNTkzTE5ML1laQnpW?=
 =?utf-8?B?S2x5WDJQdUxtT2VQaDR6b2ptcjhPMDJyZ093aEo4Q2M5d3I4ellHUHdsMjZR?=
 =?utf-8?B?TjA2MHpXNjAwVWpBdFFuc0NXZXpwYUQvZmZjc0l2bEdUcTYxZXR5blk3Q2hK?=
 =?utf-8?B?b0VLcUhjaXE3a0x6dU1ZYVY2eTVPZVllaitBUUVVUk4vMGlxdGh4SGErRThF?=
 =?utf-8?B?L2FvM1dHUHdhSlpNa0hKNlN2RENGOU9wUVhLWWJhZll1SERaYnVrYTQ4WGJy?=
 =?utf-8?B?VVpFMzFwTGpsc21SUVhsOG5BeXQ5amdxZVdmaEZoSXgxTkx5cHFCYXFKckJP?=
 =?utf-8?B?eGg4WlhVQkhxb3JQaEZubWhxM3o2Q0dGamdJYnpzYkViV1pYUVM2TXprTUJQ?=
 =?utf-8?B?RENQSFJ1Y3QvVXNYVzhWU3RlOTM4TE04c0ZlVCtUVVl1cGRxOGljWDdCQnF4?=
 =?utf-8?B?OUl0WHVQSU92R2wrblpZdnpZWjB3RlpZc3VVRGd2RmxwbzBkUmlJVEpKaWpG?=
 =?utf-8?B?cDBuRlhTcjlTajVhVGlwRVRPODVNcThJZytEUWs5dVRSVFg3WHBoN1BUTnp5?=
 =?utf-8?B?QTQyRVVWODRESTNhSnFVQm9XWUJWRGtjT3JLdllIbjJtSnhRUXdYcnVPSmVx?=
 =?utf-8?B?QklMVzhNMXhYVlMyMTBXeVlpNEVINGV2WFd1MHZaNU1pUmNXMXZaSmVoRHMr?=
 =?utf-8?B?aXVPc3BWSUZ2QytSUy9EaWtYcXBKc2FQL2FMMzV6Z29QSnkxdGhlSFljdGVr?=
 =?utf-8?B?ZnhrNWw2ZC9wMysrTGExUDIyUUpyWE1POGdtSDlXK0tKSlJVVEt3amllT3g1?=
 =?utf-8?Q?hIdXC/+x5m0vw3LdKmmDjlandPI21DQ//8JgJ8aaIo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A51B847BA38FF54287AE5876FEAFEAF0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abda525-ca47-4d5e-a432-08d9b65b4b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 12:49:06.5090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5YKeiSoQON21l5RzDZeKNyloJzYu1CJdE8U4yCtr251vVdw3Belz4kKCYPLWpy/oViask16mTAGzi+NrejYe7LaXs2tKLlEq1CiMVVdQkb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0726
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

SGkgTWF4aW1lLA0KDQoNCkxlIDAzLzEyLzIwMjEgw6AgMDE6NDQsIE1heGltZSBCaXpvbiBhIMOp
Y3JpdMKgOg0KPiANCj4gSGVsbG8gQ2hyaXN0b3BoZSwNCj4gDQo+IEkgaGF2ZSBhIG1wYzgzNDcg
Ym9hcmQgYm9vdGluZyA1LjE1IGZpbmUsIGJ1dCBpdCBkb2VzIG5vdCBib290IHdpdGgNCj4gQ09O
RklHX0RFQlVHX1BBR0VBTExPQz15IChhbmQgZW5hYmxlZCkgb3IgIm5vYmF0cyIuDQo+IA0KPiBU
aG9zZSB0d28gb3B0aW9ucyB3b3JrZWQgZmluZSBvbiBteSBwcmV2aW91cyBrZXJuZWwgKDUuNCkN
Cj4gDQo+IA0KPiBOb3RoaW5nIGlzIG91dHB1dCBvbiBzZXJpYWwgY29uc29sZSB3aGVuIEkgc2V0
IHRob3NlIG9wdGlvbnMsIHNvIEkgaGFkDQo+IHRvIGhhY2sgYSBiaXQ6DQo+IA0KPiAxKSB0byBl
YXNlIGRlYnVnZ2luZywgSSB1c2VkIG1lbT0yNTZNLCBzbyBvbmx5IGEgZmV3IEJBVHMgYXJlIHVz
ZWQNCj4gDQo+IDIpIEkgaGlqYWNrZWQgQkFUIDcgYW5kIHRoZSB2bSBzcGFjZSBhdCBiMDAweHh4
eCAobW9kdWxlcywgdW51c2VkIGZvcg0KPiBtZSkgdG8gc2V0IGEgY29uc3RhbnQgbWFwcGluZyBz
byBteSB1YXJ0IGFsd2F5cyB3b3JrcyAocGF0Y2ggYXR0YWNoZWQNCj4gaW4gY2FzZSkNCj4gDQo+
IA0KPiBJIGdvdCB0aGlzOg0KPiANCj4gbW11X21hcGluX3JhbTogYmFzZToweDAgdG9wOjB4MTAw
MDAwMDAgYm9yZGVyOjB4NjAwMDAwDQo+IG1tdV9tYXBpbl9yYW06IHVwZGF0ZWQgYmFzZToweDAg
dG9wOjB4NjAwMDAwDQo+IHNldGJhdCBpbmRleD0wIHZpcnQ9MHhjMDAwMDAwMCBwaHlzPTB4MCBz
aXplPTB4NDAwMDAwDQo+IHNldGJhdCBpbmRleD0xIHZpcnQ9MHhjMDQwMDAwMCBwaHlzPTB4NDAw
MDAwIHNpemU9MHgyMDAwMDANCj4gWyAgICAwLjAwMDAwMF0ga2VybmVsIHRyaWVkIHRvIGV4ZWN1
dGUgZXhlYy1wcm90ZWN0ZWQgcGFnZSAoYzA2MDA5NDQpIC0gZXhwbG9pdCBhdHRlbXB0PyAodWlk
OiAwKQ0KPiBbICAgIDAuMDAwMDAwXSBCVUc6IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIGluc3Ry
dWN0aW9uIGZldGNoDQo+IFsgICAgMC4wMDAwMDBdIEZhdWx0aW5nIGluc3RydWN0aW9uIGFkZHJl
c3M6IDB4YzA2MDA5NDQNCj4gWyAgICAwLjAwMDAwMF0gVGhyZWFkIG92ZXJyYW4gc3RhY2ssIG9y
IHN0YWNrIGNvcnJ1cHRlZA0KPiBbICAgIDAuMDAwMDAwXSBPb3BzOiBLZXJuZWwgYWNjZXNzIG9m
IGJhZCBhcmVhLCBzaWc6IDExIFsjMV0NCj4gWyAgICAwLjAwMDAwMF0gQkUgUEFHRV9TSVpFPTRL
IERFQlVHX1BBR0VBTExPQw0KPiBbICAgIDAuMDAwMDAwXSBDUFU6IDAgUElEOiAwIENvbW06IHN3
YXBwZXIgTm90IHRhaW50ZWQgNS4xNS4wKyAjMjM3DQo+IFsgICAgMC4wMDAwMDBdIE5JUDogIGMw
NjAwOTQ0IExSOiAwMDAwMzM5MCBDVFI6IDAwMDAwMDAwDQo+IFsgICAgMC4wMDAwMDBdIFJFR1M6
IGMwN2JiZjQwIFRSQVA6IDA0MDAgICBOb3QgdGFpbnRlZCAgKDUuMTUuMCspDQo+IFsgICAgMC4w
MDAwMDBdIE1TUjogIDIwMDAxMDMyIDxNRSxJUixEUixSST4gIENSOiA0ODIyMjQ0NCAgWEVSOiAy
MDAwMDAwMA0KPiBbICAgIDAuMDAwMDAwXQ0KPiBbICAgIDAuMDAwMDAwXSBHUFIwMDogYzAwMDMz
NjQgYzA3YmJmZjAgYzA3MDc1ODAgYzA2MDA5NDQgMDAwMDEwMzIgMDAwMDAwMDAgYzA3N2RjOGMg
MDAwMDAwMDANCj4gWyAgICAwLjAwMDAwMF0gR1BSMDg6IGMwN2QwMDAwIDAwMDAwMDAxIGMwN2Qw
MDAwIGZmZmZmZmZmIDg4MjIyNDQ0IDAwMDAwMDAwIDNmZjljNWYwIDNmZmZkNzljDQo+IFsgICAg
MC4wMDAwMDBdIEdQUjE2OiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAw
MDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMA0KPiBbICAgIDAuMDAwMDAwXSBHUFIyNDog
MDAwMDAwMDAgMDAwMDAwMDAgNDAwMDAwMDAgM2ZmOWM1ZDggMDNmZmIwMDAgMDAwMDAwMDAgM2Zm
ZmU0ZDQgMDNmZmIwMDANCj4gWyAgICAwLjAwMDAwMF0gTklQIFtjMDYwMDk0NF0gc3RhcnRfa2Vy
bmVsKzB4MC8weDYwMA0KPiBbICAgIDAuMDAwMDAwXSBMUiBbMDAwMDMzOTBdIDB4MzM5MA0KPiBb
ICAgIDAuMDAwMDAwXSBDYWxsIFRyYWNlOg0KPiBbICAgIDAuMDAwMDAwXSBbYzA3YmJmZjBdIFtj
MDAwMzM2NF0gc3RhcnRfaGVyZSsweDRjLzB4OTAgKHVucmVsaWFibGUpDQo+IFsgICAgMC4wMDAw
MDBdIEluc3RydWN0aW9uIGR1bXA6DQo+IFsgICAgMC4wMDAwMDBdIDgzZTEwMDBjIDdjMDgwM2E2
IDM4MjEwMDEwIDRlODAwMDIwIDRlODAwMDIwIDRiYTA1YmI4IDRlODAwMDIwIDRlODAwMDIwDQo+
IFsgICAgMC4wMDAwMDBdIDRlODAwMDIwIDRlODAwMDIwIDRlODAwMDIwIDRlODAwMDIwIDw5NDIx
ZmZjMD4gM2M2MGMwNzAgN2MwODAyYTYgMzg2Mzc1ODANCj4gWyAgICAwLjAwMDAwMF0gcmFuZG9t
OiBnZXRfcmFuZG9tX2J5dGVzIGNhbGxlZCBmcm9tIG9vcHNfZXhpdCsweDQ0LzB4ODQgd2l0aCBj
cm5nX2luaXQ9MA0KPiBbICAgIDAuMDAwMDAwXSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAw
MDAwIF0tLS0NCj4gWyAgICAwLjAwMDAwMF0NCj4gWyAgICAwLjAwMDAwMF0gS2VybmVsIHBhbmlj
IC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbg0KPiBbICAgIDAuMDAwMDAwXSBSZWJvb3Rp
bmcgaW4gMzAgc2Vjb25kcy4uDQo+IA0KPiANCj4gDQo+IEl0IGdldHMgYSBwYWdlIGZhdWx0IHdo
ZW4ganVtcGluZyBvbiBzdGFydF9rZXJuZWwoKSwgaXQgc2VlbXMgdGhlDQo+IGluaXQudGV4dCBz
ZWN0aW9uIGlzIG5vdCBtYXBwZWQsIGF0IGxlYXN0IG5vdCBpbiBleGVjdXRlLg0KPiANCj4gZGVi
dWdfcGFnZWFsbG9jX2VuYWJsZWQgY2hhbmdlcyBiZWhhdmlvdXIgb2YgbW11X21hcGluX3JhbSgp
LCBpdCB3aWxsDQo+IG1hcCBvbmx5IHVwIHRvIF9faW5pdF9iZWdpbiB3aXRoIEJBVHMsIGFuZCB1
c2UgcGFnZSBtYXBwaW5ncyBmb3IgdGhlDQo+IHJlbWluZGVyLg0KPiANCj4gbXkgZGVidWcgcHJp
bnRzIGNvbmZpcm0gdGhhdCBpdCBzZWVtcyB0byBkbyBhIGNvcnJlY3Qgam9iIGF0IGl0LCBJJ3Zl
DQo+IGFsc28gdmVyaWZpZWQgdGhhdCBfX21hcGluX3JhbV9jaHVuaygpIHdhcyBpbmRlZWQgbWFw
cGluZyB0aGUgd2hpbGUNCj4gaW5pdC50ZXh0IGFyZWEgd2l0aCBwcm90PVBBR0VfS0VSTkVMX1RF
WFQNCj4gDQo+IGJ1dCBpdCdzIGFzIGlmIHRob3NlIHBhZ2UgbWFwcGluZ3MgaGFkIG5vIGVmZmVj
dCBhdCBhbGwsIGFuZCBJIGFtIG5vdA0KPiBmYW1pbGlhciB3aXRoIFBQQyBNTVUgdG8gZGlnIGZ1
cnRoZXINCj4gDQo+IFNpbXBseSBjaGFuZ2luZyBtbXVfbWFwaW5fcmFtKCkgdG8gbm90IHRvIGVu
dGVyIHRoZSAiaWYNCj4gZGVidWdfcGFnZWFsbG9jX2VuYWJsZWRfb3Jfa2ZlbmNlKCkiIG1ha2Vz
IHRoZSBrZXJuZWwgYm9vdCBmaW5lLg0KPiANCj4gSWYgeW91IGhhdmUgYW55IGd1aWRhbmNlIHRo
YXQgd291bGQgYmUgYXBwcmVjaWF0ZWQNCj4gDQoNClRoYW5rcyBmb3IgdGhlIHJlcG9ydC4NCg0K
VGhpcyBwcm9ibGVtIGRvZXNuJ3QgaGFwcGVuIG9uIHBvd2VybWFjIG9uIFFFTVUuDQpJIHdhcyBh
YmxlIHRvIHJlcHJvZHVjZSB0aGlzIHByb2JsZW0gb24gYW4gbXBjODMyMSBib2FyZC4NCg0KSXQg
aGFwcGVucyB3aGVuIENPTkZJR19NT0RVTEVTIGlzIG5vdCBkZWZpbmVkLCBpbiB0aGF0IGNhc2Ug
dGhlIA0KSW5zdHJ1Y3Rpb24gVExCIG1pc3MgZXhjZXB0aW9uIGhhbmRsZXIgZG9lc24ndCBleHBl
Y3Qgc3VjaCBleGNlcHRpb24gYXQgDQphbGwgYmVjYXVzZSBhbGwga2VybmVsIHRleHQgaXMgZXhw
ZWN0ZWQgdG8gYmUgbWFwcGVkIHdpdGggSUJBVHMuIA0KSG93ZXZlciwgZHVlIHRvIERFQlVHUEFH
RV9BTExPQywgb25seSBtYWluIHRleHQgaXMgbWFwcGVkIHdpdGggQkFUcywgbm90IA0KaW5pdHRl
eHQuIFRoYXQncyBhIG1pc3Rha2UuIGluaXR0ZXh0IHNob3VsZCBzdGlsbCBiZSBtYXBwZWQgd2l0
aCBCQVRzLg0KDQpXaGVuIENPTkZJR19NT0RVTEVTIGlzIHNldCBpdCB3b3Jrcy4NCg0KT25lIHdh
eSB0byBmaXggaXQgaXMgdG8gZHJvcCB0aGlzIENPTkZJR19NT0RVTEVTICNpZmRlZnMgaW4gaW5z
dHJ1Y3Rpb24gDQpUTEIgbWlzcyBoYW5kbGVyIChJbiBrZXJuZWwvaGVhZF9ib29rM3NfMzIuUyks
IGJ1dCB0aGF0IHdvdWxkIGtpbGwgDQpwZXJmb3JtYW5jZSBmb3IganVzdCB0aGUgc2FrZSBpbml0
Lg0KDQpBbm90aGVyIHdheSB0byBmaXggaXQgaXMgdG8gc2V0IGFuIElCQVQgY292ZXJyaW5nIHVw
IHRvIF9laW5pdHRleHQuIFRoaXMgDQpJQkFUIHNob3VsZCBiZSByZW1vdmVkIGJ5IG1hcmtfaW5p
dG1lbV9ueCgpIGF0IHRoZSBlbmQgb2YgaW5pdCAuLi4gYnV0IA0KLi4uIGl0IGxvb2tzIGxpa2Ug
d2UgaGF2ZSBhIHByb2JsZW0gdGhlcmUgYXMgd2VsbDogYXMgd2UgaGF2ZSBub3QgbWFwcGVkIA0K
X3Npbml0dGV4dCBieSBEQkFUcywgbW11X21hcmtfaW5pdG1lbV9ueCgpIGlzIG5vdCBjYWxsZWQu
DQpBbHNvLCBhcyB3ZSBhcmUgc2V0dGluZyBhbiBJQkFULCB3ZSBzaG91ZG4ndCBzZXQgdGhlIHBh
Z2VzIGV4ZWN1dGFibGUsIA0KYXQgbGVhc3QgWCBiaXQgc2hvdWxkIGJlIGNsZWFyZWQuIEJ1dCB0
aGUgd2F5IGl0IGlzIGRvbmUsIGlmIHdlIGNhbGwgDQptYXJrX2luaXRtZW1fbngoKSB0aGVuIG1h
cmtfaW5pdG1lbV9ueCgpIHdvdWxkIGNhbGwgc2V0X21lbW9yeV9hdHRyKCkgdG8gDQpjbGVhciBY
IGJpdCBmcm9tIHRoZSBwYWdlcy4gQXQgdGhlIGVuZCBpdCdzIG5vdCBhIHByb2JsZW0gYmVjYXVz
ZSB0aGUgDQprZXJuZWwgc2VnbWVudHMgYXJlIG1hcmtlZCBOWCwgYnV0IGl0J3Mgbm90IGNsZWFu
Lg0KDQpTbyBhdCB0aGUgZW5kIGl0IHNlZW1zIHRvIGJlIGEgbWVzcyBhcm91bmQgREVCVUdQQUdF
X0FMTE9DIGFuZCANClNUUklDVF9LRVJORUxfUldYLiBBbGwgdGhpcyBiZWluZyBhbXBsaWZpZWQg
YnkgdGhvc2UgJ25vYmF0cycgYW5kIA0KJ25vbHRsYnMnIG9wdGlvbnMgdGhhdCBhcmUgcG9pbnRs
ZXNzIGZyb20gYSBmdW5jdGlvbm5hbCBwb2ludCBvZiB2aWV3Lg0KDQpJIG5lZWQgdG8gdGhpbmsg
YSBiaXQgbW9yZSBhYm91dCBpdCB0byBmaW5kIHRoZSBjbGVhbmVzdCBzb2x1dGlvbiB0aGF0IA0K
d29ya3MgZm9yIGFsbCBwbGF0Zm9ybXMuDQoNCkNocmlzdG9waGU=
