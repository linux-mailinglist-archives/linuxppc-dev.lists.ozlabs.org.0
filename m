Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21F6C78DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 08:28:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjYjQ0v7Pz3fCh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 18:28:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jPVFRXOO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::612; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jPVFRXOO;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjYhP2p56z3cj9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 18:27:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G22j4orrz0JPDI8M6fV2KnbZBlFHoAQaEJzkszEPijQYUv0F2kGIG4JbS30thcRSGEtR9IeGU14ki5RDNiIgrnl7v/RZPzr8fUHLyjIoHzc0pmYdawrT7Dy8l52p1vdkw6+4jvj1sLaYPxbFahnzruFgCW2eaIxkHtaeG85KF0zS7LtpBb6hxip2H7yrNsoy/i3HrQApuuFqchzzxB7woFAv2lErcf32IbG5PhuGz/JfDac39Dd5OvMS/or9Tee45KtX/4KXJgeQ4dBbMdxa1ZMqCAgZBAR8NwUT4yQSuUa0gDdAnyI9Jspg53ejOgEM+Zv7hFegrjxsliq/awJs4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/O8F3atwJmousIIz4YC9oKJGVxMmhiKuVb6GRkCHn4=;
 b=cVfv+wua/GEJxHOylHx9gWBOBEaLdclW2+j9HSBD7VE/bvjHhm0G9tg0LTYMt7gY21RoqWwMTfOkJXJCHOhYYfj9OVwTNXB16hqvUn3Hu1yaVdF3vyVJTQUsonicavqgTM2DHchtsMSGFu9K8L4ZR/3HMFvEtATJyGX1gMG3uB8xSc+/fjpc6GTlw2mAOG01/2SoNcFQXqNDLMr4h1YrFSwk9L0AlzrVUmgXNep0CiM/c0ZVp/qiO0JDbGjPEKBZg0JEk6RFZf5nSGaA539zNHb7A9PB8KI8dA1ZwJZf5KN+1CBqVH+0AWcnbxmBGBoZiOuRBj4llpTctBE9WIWAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/O8F3atwJmousIIz4YC9oKJGVxMmhiKuVb6GRkCHn4=;
 b=jPVFRXOOYsqzCt9ZGMKwHLGvUxlhGY/pX20bwYNmnVXSv4bdOOErIV90gBd/HkL1/p0FsI32Gh5S4eYsQXtLzlk2PLiKNLi16njC7QhUiImJaDB+2TnGgo2nZAOiHLiMLwmUEpM4nyQM9v6ppQwtOY831/e9TtqOq7lRYt4W/XldUrV/UoV+f974ookd3z4ETW80jh4VMI8xnYqwxiNqadiqY0Tx8L3tV/gtS4FERALUI4znRoKJtUE4hcLp2YVvULCj9KetEU4jaJpfEw49W1AGj9r+9O+M+/f0DO9NTmRqGQo919zfVGb3WhMpVQDmdKhGawJHD7WjVATiN/PQ6w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 07:27:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%4]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 07:27:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jens Axboe <axboe@kernel.dk>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Memory coherency issue with IO thread offloading?
Thread-Topic: Memory coherency issue with IO thread offloading?
Thread-Index: AQHZXbjXYRaeWkUCc06z5W6h+rEC8a8JiLYA
Date: Fri, 24 Mar 2023 07:27:25 +0000
Message-ID: <272cda99-3b1a-95cd-ce03-bc3d17d572ec@csgroup.eu>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
In-Reply-To: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3006:EE_
x-ms-office365-filtering-correlation-id: b9341510-cb94-4121-8b45-08db2c39377b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5zUAfBFDJ/TCCPPM7UmHIrX+2Cu8qO+Jnki5UfZBV6A66hYn2/gVzNVuFZnXPA8IjkSRuj0EPZ2ezrxUAQ+0hSDSU5OtglGneswrIrqYyNvH+EyeCW6TVzR8AqGP7xyWgSFpJd5PnLthehoe231YoA3FcEuitpoqTKdMW7E6f9T5kaUGVxj46/CppuTayl/38jPKOpgwPsHifceFP003KhMMcKRJSIMaRcNf7JAy9QDSK5oHW1AShbn3HIx5QmB5iJwgX4gbTBplfHzGsjQyVIsuFj1h2yG/knd0n96n/DO5fOpX/lfXqRyXDYVmgY5A/bhgPZGmkAvZZfXCx4S5yz84LTV7dg6Yt9rBpv6zNRyDYJ4kgg7/UYIXZwK8PRgLc24N0qGo6pF0pdzb0u/Gz0+WBbadToI3SUH1XWnn1uAMZsVSkcdU5YPoeTVO28iSBmOoJR2RbCaxDXsX9iyN8pE9B+1e9IExm6aGQ+YIhW1GqJYsVCjjKJ+/VYWWjzPKQiImWGD6rSXAeiDiw28c+l2qWXjIoExmHqFVlvloueaxtxuVCehKMdDRhylQECdbbdoHK+G5maJFu0eNP3eUC6x35oIcRrUtMT46l4K84rWLgGRW7iiX1nMBqqQzdz3KAuH278ebEn+/x7C361isfVxMm39G1rNKaMtoXAFGLpWWPfk7Jb6VI4qA21u/zvvd
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(451199018)(478600001)(66446008)(8676002)(66556008)(66476007)(64756008)(4326008)(76116006)(66946007)(91956017)(41300700001)(5660300002)(122000001)(8936002)(6506007)(26005)(110136005)(44832011)(6512007)(2616005)(186003)(316002)(6486002)(83380400001)(71200400001)(66574015)(31696002)(86362001)(36756003)(38100700002)(38070700005)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UGdoS3FZT0RPeVNFZ1poKzNRaVlOWDRZeEFiekxQdFlRL3pOR3Q5U3JUdDUw?=
 =?utf-8?B?aGVMb28yYVhsaWNDYy9peS8vVmk5cUJPcUFTRnJFOXp3Q28yR0JvNThUWTZn?=
 =?utf-8?B?SXdzVlpMLzJPYVc4QnNUeHY4TVZ1Ym00V2pBMWZhdEZNMWpDUTE2T2dTcXpY?=
 =?utf-8?B?VFgwcFVyZVBUV0tYTENZYnNWcUFWUFdyc0QrWTdPczVHSVRYU3V1YWtraWQ4?=
 =?utf-8?B?M2lxMkRlQmlmOXliTHk5cWNZUmQ4TElkeGtoamRYVVdwRHMvcTZwYm1qVFp1?=
 =?utf-8?B?bTRwa2lNdjlNMlFZU3c5dW1DdVRrWXVvbzJwU002RGE5bnU2UkRnRnJvSlhs?=
 =?utf-8?B?SFMzeW1VeVFEcFlrRlp5THBTbTh3VTVuNTFDK2Q4KzBYdWMzaGp5Vm5seDg2?=
 =?utf-8?B?bm0zaFIzeGN3cFJOTDJTV1lIb0dVUVlCbUYrWERySUxDYTFSMksyTjdPcFB6?=
 =?utf-8?B?a2FJZnRLQWdKNHRXMEF1azlTeDVvbllrYUoyVys4ZlBMbFo3RkNSc1pHWTdL?=
 =?utf-8?B?cCszeW5oK2FpN2pLeS9PUXljQ2FzbldXTFlteVpaejBpTHFpRGlmRFBBc0k5?=
 =?utf-8?B?SFZPWlR3MytJZ2ZsUVdid2lRaVlkZHRSbnV3Ym5IKzZYc2s2VEtZanBJSUNE?=
 =?utf-8?B?ckswY3RsVVhnVmpLK0FNYStFck8va21ieXpKOVBWRVpSWXQzOWRvWmxYSGtt?=
 =?utf-8?B?ZWN2aVNlNmlUSXB0L0xSbjM3SDZhYjl6Z2pzR2lDYVdvQkRPOHNncTBGNHZu?=
 =?utf-8?B?Z2xoZDIxdXJsTWN3N3l0SVA4VEtQVHBreGhENk8xUU9JOXpKTXRhVTJBdDBj?=
 =?utf-8?B?cVlmRjhxWUJ0cExQdkxNYStRSjE5KzhlTVRqQTR5aU42cWlKOVQ0ZUJZeFNs?=
 =?utf-8?B?enExL0RqTlVCU2VzVHdwdmVIQnozczFJM01XRDFtNnAxUlBhZlIwaENueUlL?=
 =?utf-8?B?MElQRE90OHhLOVFPcUdzWE5ONGlORlBSMnRuS1VnMnJzN2pZZEVaTVBlOW8x?=
 =?utf-8?B?NmVqd2c2dzN5SlY5SW1IM3lSMW40Mks4c3dJVmoxTVlCR1lLQWtqRXh2SkxY?=
 =?utf-8?B?b1Z3MkE0L2ZCQjhWNmdCZU51NTd1QUt0amRlYTYrM2JROVpkOFR2bXFBZndz?=
 =?utf-8?B?czQ4MlVDNVR0SHZFWi8yVEJZd3VQbVh3UzJ4SVJaQUFEMUtSRVdwbmRpOWF5?=
 =?utf-8?B?YUFOYjBPaC9vSnhFczE3Tk5KakZpYVVNa1N2M05vTnNYalJMSHE5REMwbE5N?=
 =?utf-8?B?NkdzWThjaytkNEJISHVLMVkxUU5JZDYraDJpU1k0eWpjQ1djWks0RStBU215?=
 =?utf-8?B?TnlKKy9hcnZkYmdwN0V1OFgxN2dHVFE3QUEzUzk3Z2JaaXlYY1JwVm52WDM0?=
 =?utf-8?B?c2R6U2V5MDVMaTBpQUJHMUVIL20yWHBpRlVYaUZLRjZlUktkV3RTcjJ6Wm1p?=
 =?utf-8?B?dmIwNno5ZDVNQkM2dEZHWERWZ09tKzdib1p6TS84YTNHOWExUlJaS20yN08r?=
 =?utf-8?B?ekxnOGk2bEgyM2FrMHgyQ2U5cFFzMUJXZWdYK05hMXB1N1FweHZaZWlrcVdV?=
 =?utf-8?B?dUl3cFYvRFZiUFFkYmF6YXZnY042amZDM1NoYXVCZ1hVanlpSi85UStxSE51?=
 =?utf-8?B?NnlON0c4Q21GKzlWcHBwYldoNUlPTDdQd3dRREZZVjBBeEZXS1ErUWU5UHNS?=
 =?utf-8?B?ZFNCQzk2WGtwUmQ5dXJZZVNDLytXcDE1ZnVnYnNUSFNLaEJaTXlRMndkRE9r?=
 =?utf-8?B?dVBTc1lJVktYdHFmbStZc0ZqU25JR1Z6dW5WY0U3UXo5V1dUTnNPNFR1T3pR?=
 =?utf-8?B?NzNJY2UzSFdIanRiMjBPS2MzenJvNWtVRHdxRTNPU09IMUI2b0h5TlVZeUIv?=
 =?utf-8?B?ZGtzV1Fvemg5bTRCRnFBVWEveE1yMXM4YzZXUGpQSW5KSnJtZGtyK0VKTW5z?=
 =?utf-8?B?cnhudDZYcERzdjZhY2pPeFpQSm9HVGdpVm9IVStkLzhLSUZmVzkrNHdEZy91?=
 =?utf-8?B?UEtwUlRVbjh1OFVjOTk1RFMreUpyU1Naek02STVRNXBHYmkxNTREQ0lVU0w5?=
 =?utf-8?B?MnB3Y1REQnpoODRQZGZ6a0o5VGE2c0dLejBNdURLTkl4UU9BL2RTZ3JVTTBt?=
 =?utf-8?B?eTB5WE1xUllWSU9TeGFpWE8yV2swOXdkdCt0ekNvSThFcGthNmw1aTJuQThZ?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <763834B77431C24398DA2CA68FDA91F7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9341510-cb94-4121-8b45-08db2c39377b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 07:27:25.8021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSKhk6C1iz8wi8thyk/Uy1XfYCSIoxxiZVJvM3z4pwC61hY+dLi+hdckWO59BUPokjtBMjWhqIh42rXr4c9RzvUCcppB1VfNB8PshSNv9KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3006
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDIzLzAzLzIwMjMgw6AgMTk6NTQsIEplbnMgQXhib2UgYSDDqWNyaXTCoDoNCj4g
SGksDQo+IA0KPiBJIGdvdCBhIHJlcG9ydCBzZW50IHRvIG1lIGZyb20gbWFyaWFkYiwgaW4gd2hl
cmUgNS4xMC4xNTggd29ya3MgZmluZSBhbmQNCj4gNS4xMC4xNjIgaXMgYnJva2VuLiBBbmQgaW4g
ZmFjdCwgY3VycmVudCA2LjMtcmMgYWxzbyBmYWlscyB0aGUgdGVzdA0KPiBjYXNlLiBCZXdhcmUg
dGhhdCB0aGlzIGVtYWlsIGlzIGxvbmcsIGFzIEknbSB0cnlpbmcgdG8gaW5jbHVkZQ0KPiBldmVy
eXRoaW5nIHRoYXQgbWF5IGJlIHJlbGV2YW50Li4uDQoNCldoaWNoIHZhcmlhbnQgb2YgcG93ZXJw
YyA/IDMyIG9yIDY0IGJpdHMgPyBCb29rM1Mgb3IgQm9va0UgPw0KDQpDaHJpc3RvcGhlDQoNCg0K
PiANCj4gVGhlIHRlc3QgY2FzZSBpbiBxdWVzdGlvbiBpcyBwcmV0dHkgc2ltcGxlLiBPbiBkZWJp
YW4gdGVzdGluZywgZG86DQo+IA0KPiAkIHN1ZG8gYXB0LWdldCBpbnN0YWxsIG1hcmlhZGItdGVz
dA0KPiAkIGNkIC91c3Ivc2hhcmUvbXlzcWwvbXlzcWwtdGVzdA0KPiAkIC4vbXRyIC0tbXlzcWxk
PS0taW5ub2RiLWZsdXNoLW1ldGhvZD1mc3luYyAtLW15c3FsZD0tLWlubm9kYi11c2UtbmF0aXZl
LWFpbz0xIC0tdmFyZGlyPS9kZXYvc2htL215c3FsICAtLWZvcmNlIGVuY3J5cHRpb24uaW5ub2Ri
X2VuY3J5cHRpb24saW5ub2RiLHVuZG8wIC0tcmVwZWF0PTIwMA0KPiANCj4gYW5kIGlmIGl0IGZh
aWxzLCB5b3UnbGwgc2VlIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gZW5jcnlwdGlvbi5pbm5vZGJf
ZW5jcnlwdGlvbiAnaW5ub2RiLHVuZG8wJyBbIDYgcGFzcyBdICAgMzEyMA0KPiBlbmNyeXB0aW9u
Lmlubm9kYl9lbmNyeXB0aW9uICdpbm5vZGIsdW5kbzAnIFsgNyBwYXNzIF0gICAzMTIzDQo+IGVu
Y3J5cHRpb24uaW5ub2RiX2VuY3J5cHRpb24gJ2lubm9kYix1bmRvMCcgWyA4IHBhc3MgXSAgIDMw
NDINCj4gZW5jcnlwdGlvbi5pbm5vZGJfZW5jcnlwdGlvbiAnaW5ub2RiLHVuZG8wJyBbIDkgZmFp
bCBdDQo+ICAgICAgICAgIFRlc3QgZW5kZWQgYXQgMjAyMy0wMy0yMyAxNjo1NToxNw0KPiANCj4g
Q1VSUkVOVF9URVNUOiBlbmNyeXB0aW9uLmlubm9kYl9lbmNyeXB0aW9uDQo+IG15c3FsdGVzdDog
QXQgbGluZSAxMTogcXVlcnkgJ1NFVCBAc3RhcnRfZ2xvYmFsX3ZhbHVlID0gQEBnbG9iYWwuaW5u
b2RiX2VuY3J5cHRpb25fdGhyZWFkcycgZmFpbGVkOiBFUl9VTktOT1dOX1NZU1RFTV9WQVJJQUJM
RSAoMTE5Myk6IFVua25vd24gc3lzdGVtIHZhcmlhYmxlICdpbm5vZGJfZW5jcnlwdGlvbl90aHJl
YWRzJw0KPiANCj4gVGhlIHJlc3VsdCBmcm9tIHF1ZXJpZXMganVzdCBiZWZvcmUgdGhlIGZhaWx1
cmUgd2FzOg0KPiBTRVQgQHN0YXJ0X2dsb2JhbF92YWx1ZSA9IEBAZ2xvYmFsLmlubm9kYl9lbmNy
eXB0aW9uX3RocmVhZHM7DQo+IA0KPiAgIC0gc2F2aW5nICcvZGV2L3NobS9teXNxbC9sb2cvZW5j
cnlwdGlvbi5pbm5vZGJfZW5jcnlwdGlvbi1pbm5vZGIsdW5kbzAvJyB0byAnL2Rldi9zaG0vbXlz
cWwvbG9nL2VuY3J5cHRpb24uaW5ub2RiX2VuY3J5cHRpb24taW5ub2RiLHVuZG8wLycNCj4gKioq
V2FybmluZ3MgZ2VuZXJhdGVkIGluIGVycm9yIGxvZ3MgZHVyaW5nIHNodXRkb3duIGFmdGVyIHJ1
bm5pbmcgdGVzdHM6IGVuY3J5cHRpb24uaW5ub2RiX2VuY3J5cHRpb24NCj4gDQo+IDIwMjMtMDMt
MjMgMTY6NTU6MTcgMCBbV2FybmluZ10gUGx1Z2luICdleGFtcGxlX2tleV9tYW5hZ2VtZW50JyBp
cyBvZiBtYXR1cml0eSBsZXZlbCBleHBlcmltZW50YWwgd2hpbGUgdGhlIHNlcnZlciBpcyBzdGFi
bGUNCj4gMjAyMy0wMy0yMyAxNjo1NToxNyAwIFtFUlJPUl0gSW5ub0RCOiBEYXRhYmFzZSBwYWdl
IGNvcnJ1cHRpb24gb24gZGlzayBvciBhIGZhaWxlZCByZWFkIG9mIGZpbGUgJy4vaWJkYXRhMScg
cGFnZSBbcGFnZSBpZDogc3BhY2U9MCwgcGFnZSBudW1iZXI9MjIxXS4gWW91IG1heSBoYXZlIHRv
IHJlY292ZXIgZnJvbSBhIGJhY2t1cC4NCj4gDQo+IHdoZXJlIGRhdGEgcmVhZCB3YXMgbm90IGFz
IGV4cGVjdGVkLg0KPiANCj4gTm93LCB0aGVyZSBhcmUgYSBudW1iZXIgb2YgaW9fdXJpbmcgY2hh
bmdlcyBiZXR3ZWVuIC4xNTggYW5kIC4xNjIsIGFzIGl0DQo+IGluY2x1ZGVzIHRoZSBiYWNrcG9y
dCB0aGF0IGJyb3VnaHQgNS4xMC1zdGFibGUgaW50byBsaW5lIHdpdGggd2hhdA0KPiA1LjE1LXN0
YWJsZSBpbmNsdWRlcy4gSSdsbCBzcGFyZSB5b3UgYWxsIHRoZSBkaWdnaW5nIEkgZGlkIHRvIHZl
dCB0aG9zZQ0KPiBjaGFuZ2VzLCBidXQgdGhlIGtleSB0aGluZyBpcyB0aGF0IGl0IFNUSUxMIGhh
cHBlbnMgb24gNi4zLWdpdCBvbg0KPiBwb3dlcnBjLg0KPiANCj4gQWZ0ZXIgcnVsaW5nIG91dCBt
YW55IHRoaW5ncywgb25lIGtleSBkaWZmZXJlbmNlIGJldHdlZW4gMTU4IGFuZCAxNjIgaXMNCj4g
dGhhdCB0aGUgZm9ybWVyIG9mZmxvYWRlZCByZXF1ZXN0cyB0aGF0IGNvdWxkIG5vdCBiZSBkb25l
IG5vbmJsb2NraW5nIHRvDQo+IGEga3RocmVhZCwgYW5kIDE2MiBhbmQgbmV3ZXIgb2ZmbG9hZHMg
dG8gYW4gSU8gdGhyZWFkLiBBbiBJTyB0aHJlYWQgaXMNCj4ganVzdCBhIG5vcm1hbCB0aHJlYWQg
Y3JlYXRlZCBmcm9tIHRoZSBhcHBsaWNhdGlvbiBzdWJtaXR0aW5nIElPLCB0aGUNCj4gb25seSBk
aWZmZXJlbmNlIGlzIHRoYXQgaXQgbmV2ZXIgZXhpdHMgdG8gdXNlcnNwYWNlLiBBbiBJTyB0aHJl
YWQgaGFzDQo+IHRoZSBzYW1lIG1tL2ZpbGVzL3lvdS1uYW1lLWl0IGZyb20gdGhlIG9yaWdpbmFs
IHRhc2suIEl0IHJlYWxseSBpcyB0aGUNCj4gc2FtZSBhcyBhIHVzZXJzcGFjZSB0aHJlYWQgY3Jl
YXRlZCBieSB0aGUgYXBwbGljYXRpb24gVGhlIHN3aXRjaCB0byBJTw0KPiB0aHJlYWRzIHdhcyBk
b25lIGV4YWN0bHkgYmVjYXVzZSBvZiB0aGF0LCByYXRoZXIgdGhhbiByZWx5IG9uIGEgZnJhZ2ls
ZQ0KPiBzY2hlbWUgb2YgaGF2aW5nIHRoZSBrdGhyZWFkIHdvcmtlciBhc3N1bWUgYWxsIHNvcnRz
IG9mIGlkZW50aWZ5IGZyb20NCj4gdGhlIG9yaWdpbmFsIHRhc2suIHN1cnByaXNlcyBpZiB0aGlu
Z3Mgd2VyZSBtaXNzZWQuIFRoaXMgaXMgd2hhdCBjYXVzZWQNCj4gbW9zdCBvZiB0aGUgaW9fdXJp
bmcgc2VjdXJpdHkgaXNzdWVzIGluIHRoZSBwYXN0Lg0KPiANCj4gVGhlIElPIHRoYXQgbWFyaWFk
YiBkb2VzIGluIHRoaXMgdGVzdCBpcyBwcmV0dHkgc2ltcGxlIC0gYSBidW5jaCBvZg0KPiBsYXJn
aXNoIGJ1ZmZlcmVkIHdyaXRlcyB3aXRoIElPUklOR19PUF9XUklURVYsIGFuZCBzb21lIHNtYWxs
aXNoICgxNkspDQo+IGJ1ZmZlcmVkIHJlYWRzIHdpdGggSU9SSU5HX09QX1JFQURWLg0KPiANCj4g
VG9kYXkgSSBmaW5hbGx5IGdhdmUgdXAgYW5kIHJhbiBhIGJhc2ljIGV4cGVyaW1lbnQsIHdoaWNo
IHNpbXBseQ0KPiBvZmZsb2FkcyB0aGUgd3JpdGVzIHRvIGEga3RocmVhZC4gU2luY2UgcG93ZXJw
YyBoYXMgYW4gaW50ZXJlc3RpbmcNCj4gbWVtb3J5IGNvaGVyZW5jeSBtb2RlbCwgbXkgc3VzcGlj
aW9uIHdhcyB0aGF0IHRoZSB3b3JrIGludm9sdmVkIHdpdGgNCj4gc3dpdGNoaW5nIE1NcyBmb3Ig
dGhlIGt0aHJlYWQgY291bGQganVzdCBiZSB0aGUgbWFpbiBkaWZmZXJlbmNlIGhlcmUuDQo+IFRo
ZSBwYXRjaCBpcyByZWFsbHkgZHVtYiBhbmQgc2ltcGxlIC0gcmF0aGVyIHRoYW4gcXVldWUgdGhl
IHdyaXRlIHRvIGFuDQo+IElPIHRocmVhZCwgaXQganVzdCBvZmZsb2FkcyBpdCB0byBhIGt0aHJl
YWQgdGhhdCB0aGVuIGRvZXMNCj4ga3RocmVhZF91c2VfbW0oKSwgcGVyZm9ybSB3cml0ZSB3aXRo
IHRoZSBzYW1lIHdyaXRlIGhhbmRsZXIsDQo+IGt0aHJlYWRfdW51c2VfbW0oKS4gQU5EIFRISVMg
V09SS1MhIFVzdWFsbHkgdGhlIGFib3ZlIG10ciB0ZXN0IHdvdWxkDQo+IGZhaWwgaW4gMi4uMjAg
bG9vcHMsIEkndmUgbm93IGRvbmUgMjAwIGFuZCA1MDAgbG9vcHMgYW5kIGl0J3MgZmluZS4NCj4g
DQo+IFdoaWNoIHRoZW4gbGVhZHMgbWUgdG8gdGhlIHF1ZXN0aW9uLCB3aGF0IGFib3V0IHRoZSBJ
TyB0aHJlYWQgb2ZmbG9hZA0KPiBtYWtlcyB0aGlzIGZhaWwgb24gcG93ZXJwYyAoYW5kIG5vIG90
aGVyIGFyY2ggSSd2ZSB0ZXN0ZWQgb24sIGluY2x1ZGluZw0KPiB4ODYveDg2LTY0L2FhcmNoNjQv
aHBwYTY0KT8gVGhlIG9mZmxvYWQgc2hvdWxkIGJlIGVxdWl2YWxlbnQgdG8gaGF2aW5nIGENCj4g
dGhyZWFkIGluIHVzZXJzcGFjZSBpbiB0aGUgYXBwbGljYXRpb24sIGFuZCBoYXZpbmcgdGhhdCB0
aHJlYWQganVzdA0KPiBwZXJmb3JtIHRoZSB3cml0ZXMuIElzIHRoZXJlIHNvbWUgbWFnaWMgaW52
b2x2ZWQgd2l0aCB0aGUga3RocmVhZCBtbQ0KPiB1c2UvdW51c2UgdGhhdCBtYWtlcyB0aGlzIHN1
ZmZpY2llbnRseSBjb25zaXN0ZW50IG9uIHBvd2VycGM/IEkndmUgdHJpZWQNCj4gYW55IG1peCBv
ZiBpc3luYygpL21iIGFuZCBtYWtpbmcgdGhlIGZsdXNoX2RjYWNoZV9wYWdlKCkgdW5jb25kaXRp
b25hbGx5DQo+IGRvbmUgaW4gdGhlIGZpbGVtYXAgcmVhZC93cml0ZSBoZWxwZXJzLCBhbmQgaXQg
c3RpbGwgZmFsbHMgZmxhdCBvbiBpdHMNCj4gZmFjZSB3aXRoIHRoZSBvZmZsb2FkIHRvIGFuIElP
IHRocmVhZC4NCj4gDQo+IEkgbXVzdCBjbGVhcmx5IGJlIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUs
IHdoaWNoIGlzIHdoeSBJJ20gZW1haWxpbmcgdGhlDQo+IHBvd2VycGMgR29kcyBmb3IgaGVscCA6
LSkNCj4gDQo=
