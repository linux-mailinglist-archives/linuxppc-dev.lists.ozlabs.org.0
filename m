Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF96223F5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 07:24:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6ZgS11vWz3cFc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 17:24:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fvnLdoZG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.84; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fvnLdoZG;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90084.outbound.protection.outlook.com [40.107.9.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6ZfV1snLz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 17:23:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADxlgcng2X+PPQJ/zhvhHBJDTPAhGN++VITqqJmCySdFlTXpBI3nNTD4L0tExAvEMgeLfzuHgmcYvibIfMAEU5qNEYOTZ7nFaMudt6t1X3U/Nx97O8AkSFmE9aLibV4BDqyEQRaOEHQs8x/xqZPKYzwWFetPSKi64IR9NdQtDmPxIQw7680zqA+ji+kjdfdjX/I0FMb8uMqsotYQ1rCFjSUn96wTrZ5DVjfBVJ9lrZJNCzs79t44zy6oAOn29zsl9yapZHXZD89inPHhQhpETDrh2GyVqO0VYIF2XXR6+2ZQMhxCuLU0R2gF7K01yv/ADyk/ph4Fq2Ml9M19+zU54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK0V+M8h3XUrDwfipLey5kGjOhhI6hLwcRTdT0bQPuI=;
 b=FGFq6uZeMM0Qg+WLsa8aLzrcJ8xQ80EOEkcCDrk/I7Pn3rdkz7SfI0rUiOQOnc1Do2MUTsw/nYvBjyVNUK44H6TL8Q8inVtWQjgqiMxO7r2RvraUbMyhS1kohHaU7oDNlQE6R7Azi+CDpMc9uYnESj/hMUdcZ//rqmmM/5SiR6OnPHrOoy9u4YfRqwtPNh6yBfUsT2AQKwM/ZZ2RNCcLZweYZKemifwUt5DhiEUmCf5iQxyCvf6qSlSLe6eStv9QCiUXDiC3jnbubnbDBT7t+x6Lx6xyIYHnM6RmEP8hh9C7gD91uWCRdox+Ubkiw5i6nSMSFutTtB46FPELm2AiCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK0V+M8h3XUrDwfipLey5kGjOhhI6hLwcRTdT0bQPuI=;
 b=fvnLdoZGwDMqB5hotIqmvOYOQBbOSyhtlU73zUZvKQpK+fd+D4p5OVqohm5aNIj+qcr0t0TgVAX9YDmGzUdRPATkTNWSKtByDqYyWHV/ZwuhwZSA7Y4ZXxI1q6fS7X8Dab13vEtuNCNavqyj7vDppSzUZ7e8IEfWWrLbimAefQnJ9LFiDKpQeAidNGZvlsR0MBUYLOi56XNI3vFy+I+1PM9mBKpiQgBaHuozCwZHx2m8PuYh/eWc4xEHa05aNNNsv4ToPE7bulTxAVOiAn82KM40xu2n6vik2HkrMxdofHrMvY+0ISZcqCgS3f8Of0qqVn04nWOtVbhU4EPXOa7jFQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1703.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Wed, 9 Nov 2022 06:23:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 06:23:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 9/9] powerpc/code-patching: Consolidate and cache
 per-cpu patching context
Thread-Topic: [PATCH v10 9/9] powerpc/code-patching: Consolidate and cache
 per-cpu patching context
Thread-Index: AQHY8/b50PYi2zXRhEKD4QB6oA7ocq42H4wA
Date: Wed, 9 Nov 2022 06:23:10 +0000
Message-ID: <f8c8dcd5-b337-0052-3a62-919202b40b7e@csgroup.eu>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
 <20221109045112.187069-10-bgray@linux.ibm.com>
In-Reply-To: <20221109045112.187069-10-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1703:EE_
x-ms-office365-filtering-correlation-id: edcb5081-93bb-43d8-494a-08dac21ae00d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CXgglSUCxNKDJBuQ77he4cV/7E3edGw0OHeepIcoRU3lFpE0kIsK4Q1ZU2NmU1yPQypcgDcr1b9ubvR6HnAeH1rRaqROrO2Gogeb2AT156dUEAGh3Bd/J9rFqljz69zq+Hb96kI3yVAKJCjXvaI+1bcGH2mN5G4VJfE9EWoCWv4UUGkzg0LCK7zRafzuTFdaw3IJt84ILYjusMECtvfks5f32+vBqqnT3NMuHTiBpGdhBe5HHE16eFCqwBbmwTGiGvZgEt+ntoArTJBkBCBotuQYcSMCJGx7Xgg59ld1ArMRBOCXWc0T56NdIAtA2B+ecqLlzMArk3RpF6OKVYMTkXNTyYM/9vUJpX1Or7q5kaNnUKObzAfrdvUo32rvauoisLRLEL2nDPJSvintW+GFNXr0h2Kfp86c7Rvsa4dU7Ie6XJQwz/D26/cK3WnAs0RKRn3onTzhJgrutxopLezyB9KVTD4PgQgCpN+umLs0jWCvvF4zAYXb/UvJiMsqgHau5/rFIS+upKjfud1Q8D5amE2Q67PHtOBAqCNBDJOPWfnm7XUOxSapEbWyr/XYDs9CaR2G0FKrsRBGlFkk/jCopxAm96+lifttMXGPWJrEaIu1JmdLQKrI2THN4o4TgMhkiJ1HZDKdrQjWUZW+hmASTMleus0waTSVxPPSTJCmEPkInJxnCxNIeTGIjEV7ZILnCe2y604Tk2yZZ3GpDespvF/8P1lovPsFpdEF5TLXaAXcbmRtjxq7TnoDO+H5hVbbfQK0hUgwWX0mON8FF3+3fnrDnecxyGDQDkLSBcw4JZEq8XsIHoWKF+hWUMNonj++
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(36756003)(186003)(83380400001)(122000001)(2616005)(31696002)(44832011)(8936002)(41300700001)(4326008)(2906002)(5660300002)(8676002)(86362001)(64756008)(26005)(478600001)(6512007)(31686004)(6486002)(316002)(54906003)(38100700002)(110136005)(71200400001)(6506007)(38070700005)(66946007)(66556008)(66476007)(76116006)(66446008)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Mzc0VEdpcUVmRXRKUmN6ZUlqWXFlaWlibHZ3SjNWckFXemUzcDBuS21saTJT?=
 =?utf-8?B?ZkFCZldlMjJpUG9seWM2UGlQbitxTGM2U2tmVnFYcDF6cGxsU0toWFUzWExC?=
 =?utf-8?B?RGRPVzFrL0NwRGhJSU1iR2tKY0lKMnJpaGs4UGdNVUo4S3VpZUJscFU1OHM1?=
 =?utf-8?B?QnhWM3dPSXgrRjVvQWZDL0RsbTBVSEVPRVRFUjJZVmkwTGM2NzRNSWVldTlE?=
 =?utf-8?B?ellxcjliTjYzekRTQWh5akJVa24wNlNNanUxR1Q4eDZlNlVCWnV6TUVUYUs3?=
 =?utf-8?B?SmhWN0p4ZXFVOTQyM0QyTU52V3Z5R1hVMEEvOHJpNFQrdFZERFpiMDU0a1o2?=
 =?utf-8?B?SHFWYU44eCswSnlYa2hWU1ZEaVVrRnBVMXN6eFIyMVRYQnJQTnlickFLSkZw?=
 =?utf-8?B?cTBqRWswUGdiamJiSERQeExidUdMTDRXeDhvNnY2U2dHd0VFWDBaUXFSSDNo?=
 =?utf-8?B?a3JudnRrWWRIYlplUHVvQ1JORjAvZnNPcFdFVlY4UVJiN1IrejM4dFRTd2Vy?=
 =?utf-8?B?azltZXFVUjhrTStkandxVHRMWUh1ZGJxWk45dXlXRGFWalY3UVlXakQwUGEx?=
 =?utf-8?B?NTRicHBDOVJid3pCVDIwRVQ4Z0hzMitJTGpYeGxVcEptRWxsWVRZV1B1Rng1?=
 =?utf-8?B?WFBHbU12UjZPTnJENXZ3MWlJT2xycFB6Q0FKYlVJblYwWmVLa1Y0Z2l3bndk?=
 =?utf-8?B?czMrT2Fkck9YTy9DaXo3UStYdFlhRlhzS1p3YXAwak9pS0YyTVV3ZHNIcS9v?=
 =?utf-8?B?bFlGQmVJQjV3d09NM1UvdnNJMmp0TmtDM3ZmN1c5ME0zTEoyRmFvMDlySStW?=
 =?utf-8?B?cE1ROUNVemhYTnpURFd0dSt6MllDTXpOdG50TFVjbzdYTEV1R2QveUhHL0VT?=
 =?utf-8?B?WkVtUWRPUXQ3U2VOa0RHbUVGbmpLK0szQUMvbmZqbExRNmtzRElXTzhENUdC?=
 =?utf-8?B?b2Rjd3pIZGtEK3FLVG1DdnRCemh3SkFvc29CdHFGNkorV0t5QnF2L012WnNR?=
 =?utf-8?B?ODd4YnpqR3FjODBEVTZrSkhmUE1mT2VnTkZiQUdLUUUzd0dmVkxma2FXOFZs?=
 =?utf-8?B?VnVDM09DNjNDdWxRa3JqbGExajg1NStqTkdhdW1CZE93d2FoUS9CU0YyYkdD?=
 =?utf-8?B?MUQvdVU5ZXRZelJjRGZmZTRFeE51YS9aeDNnQVFPUEdHRGp3WkdlVmkxbjkx?=
 =?utf-8?B?cjdvYklwczlmRlMyYzFRbEtERmJLSk04NnJUNldTT282Nlp0V2tmL3FYWjlV?=
 =?utf-8?B?Z1MxdEcxcjAwVkg3eExEbzdHeHpGbXptRk94TU5jMlpVek5qK0hrNFJhdkNR?=
 =?utf-8?B?MklEME5aTEZTUHlLRUxKTHlJSHlDVzBPZmRVWWE0TXNpOWpaSlZ4ajZBZHc0?=
 =?utf-8?B?RXF6cDRMUU51Tmg4ME9zUHQ4ZG8wQ0ZRZERTa2h3Ui9MY09NSThrakFmRVBN?=
 =?utf-8?B?QW5LWWFFWUdTOVEzZ0w0Q0t5L1hmcDNjcjdycDMzNDVUdVVQMDJRamMrbi9F?=
 =?utf-8?B?UzZrRk1rSW44RzdUTnM0SldlSHE2b0RtV3pjZzZwUGhaS2FRYmZxOUpaSDdK?=
 =?utf-8?B?dkh5RUd1djBIM0JzWjZsUzR5NmQ3M0FHSHIwa0krbkxJemdMcGFUMmRVR0xp?=
 =?utf-8?B?Y2FvbVYyRHRHSzA5SjVwZFJaR1dLL1RTTVdpQlRsUzd0ay9ja3BWYlliRjNi?=
 =?utf-8?B?Y09vamNSNXhLQW96VEliTHkyVVZrakVTMXF4NVZvZit3WjZRaFNDazJvSzVJ?=
 =?utf-8?B?U0Q2a1ZiMTBFcGlQazFtcnpzMDZnSEs0eDhxU0laZ01zMCtXMWc5ZGdocW1m?=
 =?utf-8?B?b05lQUpXMzAwNWRSaytVU3RacG9uRjU0UDV1MStFcU1XZWRRSUIzTGs0VStY?=
 =?utf-8?B?NE5lN3hUUUZpaXVkeHFPRVhPWHZFOHIyOHhyMU56d2tPWURVN2VNVEVTM0Rx?=
 =?utf-8?B?N0s4aElpbUhwOTNXclV0RXpLTVQ2UVYzc3Z4TWhYMWtKbVBjRXVtOFRVVG1p?=
 =?utf-8?B?Q0RQSXhFT3FQdFJDRklJMklPVWR2dlJUSlpSeHhIajM1emtOVVAwQXhKRWUv?=
 =?utf-8?B?bGh5bnpmUExXcGJPbWROcTNyZmFxZ1dYcnlQcFJwdHlkNzI0N1BWRmVPNVdh?=
 =?utf-8?B?cE9kRlcxWVg1TXJFVnhRVVlUVGR6RGM2U0lXaWhnKzFUMEJFUmpZb2RhRGRE?=
 =?utf-8?Q?3O1J7v0WpmFUshcpdhiHuNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E03FF211359E434A829078AD4ECC7A0D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: edcb5081-93bb-43d8-494a-08dac21ae00d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 06:23:10.9938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yOpgc+g4YIIz6NL566RlgNCpnFH+jbDAz56K7z/qI1dNygxeDSZDyFsLpgiMpswhz9DrR753XzhQ50L1KGyLRPI/5mhIAhognQgLSgVkk00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1703
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzExLzIwMjIgw6AgMDU6NTEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
V2l0aCB0aGUgdGVtcCBtbSBjb250ZXh0IHN1cHBvcnQsIHRoZXJlIGFyZSBDUFUgbG9jYWwgdmFy
aWFibGVzIHRvIGhvbGQNCj4gdGhlIHBhdGNoIGFkZHJlc3MgYW5kIHB0ZS4gVXNlIHRoZXNlIGlu
IHRoZSBub24tdGVtcCBtbSBwYXRoIGFzIHdlbGwNCj4gaW5zdGVhZCBvZiBhZGRpbmcgYSBsZXZl
bCBvZiBpbmRpcmVjdGlvbiB0aHJvdWdoIHRoZSB0ZXh0X3Bva2VfYXJlYQ0KPiB2bV9zdHJ1Y3Qg
YW5kIHBvaW50ZXIgY2hhc2luZyB0aGUgcHRlLg0KPiANCj4gQXMgYm90aCBwYXRocyB1c2UgdGhl
c2UgZmllbGRzIG5vdywgdGhlcmUgaXMgbm8gbmVlZCB0byBsZXQgdW5yZWZlcmVuY2VkDQo+IHZh
cmlhYmxlcyBiZSBkcm9wcGVkIGJ5IHRoZSBjb21waWxlciwgc28gaXQgaXMgY2xlYW5lciB0byBt
ZXJnZSB0aGVtIGludG8NCj4gYSBzaW5nbGUgY29udGV4dCBzdHJ1Y3QuIFRoaXMgaGFzIHRoZSBh
ZGRpdGlvbmFsIGJlbmVmaXQgb2YgcmVtb3ZpbmcgYQ0KPiByZWR1bmRhbnQgQ1BVIGxvY2FsIHBv
aW50ZXIsIGFzIG9ubHkgb25lIG9mIGNwdV9wYXRjaGluZ19tbSAvDQo+IHRleHRfcG9rZV9hcmVh
IGlzIGV2ZXIgdXNlZCwgd2hpbGUgcmVtYWluaW5nIHdlbGwtdHlwZWQuIEl0IGFsc28gZ3JvdXBz
DQo+IGVhY2ggQ1BVJ3MgZGF0YSBpbnRvIGEgc2luZ2xlIGNhY2hlbGluZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiB2
MTA6CSogTWVudGlvbiBjYWNoZSBiZW5lZml0cw0KPiB2OToJKiBDb25zb2xpZGF0ZSBwYXRjaGlu
ZyBjb250ZXh0IGludG8gc2luZ2xlIHN0cnVjdA0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvbGli
L2NvZGUtcGF0Y2hpbmcuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jIGIvYXJjaC9w
b3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gaW5kZXggNWIwMDIyOTk3Mjk2Li4yZTEwZGY0
NjRhMmIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+IEBAIC00OCwxMCArNDgs
MTYgQEAgaW50IHJhd19wYXRjaF9pbnN0cnVjdGlvbih1MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5z
dHIpDQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWA0KPiAgIA0KPiAt
c3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCB2bV9zdHJ1Y3QgKiwgdGV4dF9wb2tlX2FyZWEp
Ow0KPiAtc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBtbV9zdHJ1Y3QgKiwgY3B1X3BhdGNo
aW5nX21tKTsNCj4gLXN0YXRpYyBERUZJTkVfUEVSX0NQVSh1bnNpZ25lZCBsb25nLCBjcHVfcGF0
Y2hpbmdfYWRkcik7DQo+IC1zdGF0aWMgREVGSU5FX1BFUl9DUFUocHRlX3QgKiwgY3B1X3BhdGNo
aW5nX3B0ZSk7DQo+ICtzdHJ1Y3QgcGF0Y2hfY29udGV4dCB7DQo+ICsJdW5pb24gew0KPiArCQlz
dHJ1Y3Qgdm1fc3RydWN0ICp0ZXh0X3Bva2VfYXJlYTsNCg0KTm8gbmVlZCBvZiBhIHNvIGxvbmcg
bmFtZS4gWW91IGNhbiBjYWxsIGl0ICdhcmVhJw0KDQo+ICsJCXN0cnVjdCBtbV9zdHJ1Y3QgKm1t
Ow0KPiArCX07DQo+ICsJdW5zaWduZWQgbG9uZyBhZGRyOw0KPiArCXB0ZV90ICogcHRlOw0KPiAr
fTsNCj4gKw0KPiArc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBwYXRjaF9jb250ZXh0LCBj
cHVfcGF0Y2hpbmdfY29udGV4dCk7DQo+ICAgDQo+ICAgc3RhdGljIGludCBtYXBfcGF0Y2hfYXJl
YSh2b2lkICphZGRyLCB1bnNpZ25lZCBsb25nIHRleHRfcG9rZV9hZGRyKTsNCj4gICBzdGF0aWMg
dm9pZCB1bm1hcF9wYXRjaF9hcmVhKHVuc2lnbmVkIGxvbmcgYWRkcik7DQo+IEBAIC0xMTYsMTQg
KzEyMiwxOSBAQCBzdGF0aWMgaW50IHRleHRfYXJlYV9jcHVfdXAodW5zaWduZWQgaW50IGNwdSkN
Cj4gICANCj4gICAJdW5tYXBfcGF0Y2hfYXJlYShhZGRyKTsNCj4gICANCj4gLQl0aGlzX2NwdV93
cml0ZSh0ZXh0X3Bva2VfYXJlYSwgYXJlYSk7DQo+ICsJdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNo
aW5nX2NvbnRleHQudGV4dF9wb2tlX2FyZWEsIGFyZWEpOw0KPiArCXRoaXNfY3B1X3dyaXRlKGNw
dV9wYXRjaGluZ19jb250ZXh0LmFkZHIsIGFkZHIpOw0KPiArCXRoaXNfY3B1X3dyaXRlKGNwdV9w
YXRjaGluZ19jb250ZXh0LnB0ZSwgdmlydF90b19rcHRlKGFkZHIpKTsNCj4gICANCj4gICAJcmV0
dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgdGV4dF9hcmVhX2NwdV9kb3duKHVu
c2lnbmVkIGludCBjcHUpDQo+ICAgew0KPiAtCWZyZWVfdm1fYXJlYSh0aGlzX2NwdV9yZWFkKHRl
eHRfcG9rZV9hcmVhKSk7DQo+ICsJZnJlZV92bV9hcmVhKHRoaXNfY3B1X3JlYWQoY3B1X3BhdGNo
aW5nX2NvbnRleHQudGV4dF9wb2tlX2FyZWEpKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0
Y2hpbmdfY29udGV4dC50ZXh0X3Bva2VfYXJlYSwgTlVMTCk7DQo+ICsJdGhpc19jcHVfd3JpdGUo
Y3B1X3BhdGNoaW5nX2NvbnRleHQuYWRkciwgMCk7DQo+ICsJdGhpc19jcHVfd3JpdGUoY3B1X3Bh
dGNoaW5nX2NvbnRleHQucHRlLCBOVUxMKTsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0K
PiBAQCAtMTY3LDkgKzE3OCw5IEBAIHN0YXRpYyBpbnQgdGV4dF9hcmVhX2NwdV91cF9tbSh1bnNp
Z25lZCBpbnQgY3B1KQ0KPiAgIAkJZ290byBmYWlsX25vX3B0ZTsNCj4gICAJcHRlX3VubWFwX3Vu
bG9jayhwdGUsIHB0bCk7DQo+ICAgDQo+IC0JdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX21t
LCBtbSk7DQo+IC0JdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX2FkZHIsIGFkZHIpOw0KPiAt
CXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19wdGUsIHB0ZSk7DQo+ICsJdGhpc19jcHVfd3Jp
dGUoY3B1X3BhdGNoaW5nX2NvbnRleHQubW0sIG1tKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVf
cGF0Y2hpbmdfY29udGV4dC5hZGRyLCBhZGRyKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0
Y2hpbmdfY29udGV4dC5wdGUsIHB0ZSk7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiBA
QCAtMTgxLDEyICsxOTIsMTIgQEAgc3RhdGljIGludCB0ZXh0X2FyZWFfY3B1X3VwX21tKHVuc2ln
bmVkIGludCBjcHUpDQo+ICAgDQo+ICAgc3RhdGljIGludCB0ZXh0X2FyZWFfY3B1X2Rvd25fbW0o
dW5zaWduZWQgaW50IGNwdSkNCj4gICB7DQo+IC0JcHV0X3BhdGNoaW5nX21tKHRoaXNfY3B1X3Jl
YWQoY3B1X3BhdGNoaW5nX21tKSwNCj4gLQkJCXRoaXNfY3B1X3JlYWQoY3B1X3BhdGNoaW5nX2Fk
ZHIpKTsNCj4gKwlwdXRfcGF0Y2hpbmdfbW0odGhpc19jcHVfcmVhZChjcHVfcGF0Y2hpbmdfY29u
dGV4dC5tbSksDQo+ICsJCQl0aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGluZ19jb250ZXh0LmFkZHIp
KTsNCj4gICANCj4gLQl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdfbW0sIE5VTEwpOw0KPiAt
CXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19hZGRyLCAwKTsNCj4gLQl0aGlzX2NwdV93cml0
ZShjcHVfcGF0Y2hpbmdfcHRlLCBOVUxMKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hp
bmdfY29udGV4dC5tbSwgTlVMTCk7DQo+ICsJdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX2Nv
bnRleHQuYWRkciwgMCk7DQo+ICsJdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX2NvbnRleHQu
cHRlLCBOVUxMKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiBAQCAtMjc4LDkgKzI4
OSw5IEBAIHN0YXRpYyBpbnQgX19kb19wYXRjaF9pbnN0cnVjdGlvbl9tbSh1MzIgKmFkZHIsIHBw
Y19pbnN0X3QgaW5zdHIpDQo+ICAgCXN0cnVjdCBtbV9zdHJ1Y3QgKnBhdGNoaW5nX21tOw0KPiAg
IAlzdHJ1Y3QgbW1fc3RydWN0ICpvcmlnX21tOw0KPiAgIA0KPiAtCXBhdGNoaW5nX21tID0gX190
aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGluZ19tbSk7DQo+IC0JcHRlID0gX190aGlzX2NwdV9yZWFk
KGNwdV9wYXRjaGluZ19wdGUpOw0KPiAtCXRleHRfcG9rZV9hZGRyID0gX190aGlzX2NwdV9yZWFk
KGNwdV9wYXRjaGluZ19hZGRyKTsNCj4gKwlwYXRjaGluZ19tbSA9IF9fdGhpc19jcHVfcmVhZChj
cHVfcGF0Y2hpbmdfY29udGV4dC5tbSk7DQo+ICsJcHRlID0gX190aGlzX2NwdV9yZWFkKGNwdV9w
YXRjaGluZ19jb250ZXh0LnB0ZSk7DQo+ICsJdGV4dF9wb2tlX2FkZHIgPSBfX3RoaXNfY3B1X3Jl
YWQoY3B1X3BhdGNoaW5nX2NvbnRleHQuYWRkcik7DQo+ICAgCXBhdGNoX2FkZHIgPSAodTMyICop
KHRleHRfcG9rZV9hZGRyICsgb2Zmc2V0X2luX3BhZ2UoYWRkcikpOw0KPiAgIA0KPiAgIAlfX3Nl
dF9wdGVfYXQocGF0Y2hpbmdfbW0sIHRleHRfcG9rZV9hZGRyLCBwdGUsIHBmbl9wdGUocGZuLCBQ
QUdFX0tFUk5FTCksIDApOw0KPiBAQCAtMzIwLDEwICszMzEsMTAgQEAgc3RhdGljIGludCBfX2Rv
X3BhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4gICAJcHRl
X3QgKnB0ZTsNCj4gICAJdW5zaWduZWQgbG9uZyBwZm4gPSBnZXRfcGF0Y2hfcGZuKGFkZHIpOw0K
PiAgIA0KPiAtCXRleHRfcG9rZV9hZGRyID0gKHVuc2lnbmVkIGxvbmcpX190aGlzX2NwdV9yZWFk
KHRleHRfcG9rZV9hcmVhKS0+YWRkciAmIFBBR0VfTUFTSzsNCj4gKwl0ZXh0X3Bva2VfYWRkciA9
ICh1bnNpZ25lZCBsb25nKV9fdGhpc19jcHVfcmVhZChjcHVfcGF0Y2hpbmdfY29udGV4dC5hZGRy
KSAmIFBBR0VfTUFTSzsNCj4gICAJcGF0Y2hfYWRkciA9ICh1MzIgKikodGV4dF9wb2tlX2FkZHIg
KyBvZmZzZXRfaW5fcGFnZShhZGRyKSk7DQo+ICAgDQo+IC0JcHRlID0gdmlydF90b19rcHRlKHRl
eHRfcG9rZV9hZGRyKTsNCj4gKwlwdGUgPSBfX3RoaXNfY3B1X3JlYWQoY3B1X3BhdGNoaW5nX2Nv
bnRleHQucHRlKTsNCj4gICAJX19zZXRfcHRlX2F0KCZpbml0X21tLCB0ZXh0X3Bva2VfYWRkciwg
cHRlLCBwZm5fcHRlKHBmbiwgUEFHRV9LRVJORUwpLCAwKTsNCj4gICAJLyogU2VlIHB0ZXN5bmMg
Y29tbWVudCBpbiByYWRpeF9fc2V0X3B0ZV9hdCgpICovDQo+ICAgCWlmIChyYWRpeF9lbmFibGVk
KCkp
