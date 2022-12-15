Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0357964D6C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 07:56:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXjhS6Mxjz3c9x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 17:56:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UmzVs56H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.41; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UmzVs56H;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2041.outbound.protection.outlook.com [40.107.9.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXjgV2vN1z3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 17:56:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVoKz7EQrNmSHBPOFX7Fm3OTf1EJl+Oq3/UYbB/zaEKHMhL4C86YUj8lQ/73dMZTVcy98vfHRllYNCQwcf8M65XZyH8S+GsTFZBhZzMSUXJq/VZSSMrGg9fS6zYZYULfCwDJVg2GwroEd00eWFY6RhR9mjXwyK4hKWg0BdFDpBZXPAi/eoGxi95aLW2TiAI5hCtAPd0vBFPeq8Y7RZvT033obcIwfDdNNq2cM8C0VVV8ehBjknsAqVbtv4vMAopcnlFwt7aEV+EYW0wZNqfag8hUI6mKGv9rjKBnzl9nxAA6oW5Du3R6XqEJuKOdHLyS2XJjWxHQ6f+GOoLF6wiOow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bN/7wNurCafUZVkyL0TOHJCjLVTZ2K8xW3oVhNiqc1I=;
 b=TGErrdh8sOw0CHyrihX/By0l47cjzCeBUXE5TtN0T3geklxQGzpoAjGjk2aTi5U2ei8lbCaVllDt86ToRYgRYB7sCVitEMUNep4ltEM1ANR1bAFAG3b6A2J5OBUkbeHPWEPRNRRfFcV75LzGunwePD3wvSQALgxLv/n5RDqFNfb0KOt+bzDsr00AFsQhPm28EGRtrMV+nt+OsrEOA0bh7fjTtMorZSBNBixE54vwZG0N+o8GkOmLQ4KwpGlsQJPte2YBBmbbPHiq9C6y+KsH7elEjtVSl8YM/mwZT1Tnh57nUkuDxEKdDHeCfRa+HF6x+wBWWY0poxUcn9Rcykt7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN/7wNurCafUZVkyL0TOHJCjLVTZ2K8xW3oVhNiqc1I=;
 b=UmzVs56HlY7eEyiy/+KNdbHHjB+pG8kSmkF+6t7HTZo9uC+1A2r/iX1JRsubxq6otKd6H1qY7VEAk5ILoDpMZdjbanjKvgobRSh3CwQYbRwQ7hI+gWWbsr9gw5Hk+exe0PxYfk3MG0Ky4liQyqQRW29wek4UZ+YnvP8KXGlB9RJ7sEzCi4QQWtDY6XGms6gLH/1GYrpFNG3DqmZKxKeDSNFsQzRYpXrF1N4wKrhO1JRWYXKdwaiWpDIWwDCVjewlUbqZbYCaX0cHr9kdpsu1o52uEndyjbiMbpL8yh5A05AIoXt+eIKkTl9UmgzwieqOo4kWCV1bJlXkxm7RbCvW2g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1746.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 06:55:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 06:55:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Thread-Topic: Mass-building defconfigs: many fail with assembler errors
Thread-Index: AQHZDnTLuXllxd0H9kO+fMt5FDvnvq5rLtkAgAJJpICAAQ1CAIAAAdmA
Date: Thu, 15 Dec 2022 06:55:45 +0000
Message-ID: <958dd327-aa24-a1e9-3572-bf7bbf28efda@csgroup.eu>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <87bko8j73z.fsf@mpe.ellerman.id.au>
 <20221214144525.pecvb4cmnvth6n62@lug-owl.de>
 <592bf160-80c2-ec5b-43bf-b8d91e57fc7b@csgroup.eu>
In-Reply-To: <592bf160-80c2-ec5b-43bf-b8d91e57fc7b@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1746:EE_
x-ms-office365-filtering-correlation-id: d4e98044-809f-43ac-0230-08dade6963e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7AqcnvkCuKsAA0/qo8XKcnXdzvPkbo2/NwbJbg8nqflMrz4jdLIHQG1Yjw7Z0MIqtQ857bgJxPmdAAshHiUptKNk09+niiQv0rZYUdWDV4K4CyhjYmHI/jJbV0aCZYLbjZLHAsiAv/gnAAhlgw03fhNRpqAzyY9AHJ6dMiTrFWQlaTQzeW41jFXIw8FsVzB0TXmSWlj/Ct+gQWVhrTcs1OjIkN6MuCraggYqH9rFWDjWQS90Tx+AyT8Fmic0fOLKCW1wLeiINdDU96o5dnHbIrxL1ayQoRV/0rH24u8lr6tUtLcxHwQutZyfBoPjkSuA/yEDZ5vsSlM6jPgG+leFmJ4w8+COsTaEiyUY+vqlOxLfMH1z4FPlV/ze2mWPVism5mHkMPzdErfB0LYjPGfjNrCODHRSVybs7oDLQrdxKpeQJtv/IKBvfpyDZHSaDtZOAeYCwiyvxXbPvrXGpSo+0yRDYeqA6M7CJSvX/Kxg8/dOAJAo5+idssoewEwFsMZl4A0ClQhiv8L8KzN67e6JEIlyy86i0RD3cQQgahuJ5spvH1gq2efmnIETqyrCw8wZ6unW59TygrJ6SoqsQhuUGuGfdrlp1wW/qPi+TPXZnL6sIIrJikMr9VjQ7OpT/plPvGkvDjto7VqZ2N8Oy/3C4Gs/E/2lYQESG2wXYNtpa4AKXq+fUE3Aus6aW5OJkUZpM/2fdDOLqeiHFOFzKg2c5lRTmXjI1HIjAXo+NtBWTeW1sLulfpH3DU2csomV2srAK0E3cHsl5A+eEAd+pwp4gBDDg8LApvor3ofJhurQMZXGDG6U6MudqaUMHzq5BLiVT0ezaHNFXZVIQqZV18cjgw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199015)(966005)(6486002)(478600001)(71200400001)(6506007)(2906002)(38070700005)(26005)(31696002)(6512007)(186003)(4001150100001)(86362001)(31686004)(110136005)(38100700002)(83380400001)(44832011)(316002)(66946007)(66476007)(76116006)(66556008)(66446008)(64756008)(2616005)(91956017)(8676002)(4326008)(36756003)(8936002)(122000001)(41300700001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZG1lVUJEOEV4ZXJnM3F5T0pjRm1ZVGpYRzNOUFJ2aURsZjRmeVV6Zm1jOGFT?=
 =?utf-8?B?YjlMYlRYSlhTUk1lQWVUajZPekJsNk5FcktlU0MxUS9OdEU4YjV1UTJXbzRZ?=
 =?utf-8?B?Qk4xbC8zL2VqS2NDZndCeURMTUdTalcvWXNQVW9aRXhYOTFaK2hLbFdXVDFZ?=
 =?utf-8?B?MXk2WVBBUy9Vd2FPQlNuK0JZRkpEYkJCR2ZoOVZDZ0t2c2pMenhhaEkzRHU1?=
 =?utf-8?B?V3FNVlNZVUtYRWR5ajErN3R6NUZ6Skx2VThaVDBUNm13RGdqaStZelVRcU9C?=
 =?utf-8?B?ZHJ4MTlpUDFFSTRqNXZha2VYVit5eXJ2SEZVc2s3a2JhVXhVME1BT0NvUUNW?=
 =?utf-8?B?RkY1WE9mL1RLTUx2WGpwWkk0bHBSdUF3V2FselZJYjNGZlRaUTNNTzJMWTZm?=
 =?utf-8?B?NG9kVFBVczYrYzVocDRORm50OUthbGVnVjhIMDE0RUtRZVVNcU5qUkh1YkFq?=
 =?utf-8?B?ZjZwQU1BUXYvNXlMVjJRUlpTSWxGWktOQysvNEZKaEFnV3NyczJkbkRWdTlo?=
 =?utf-8?B?NHJhYU0yRm1YU0kyNmgyRFZNTklqU21SNmhMY1hXQVVrSWFWTGlqelZhSHp6?=
 =?utf-8?B?RUJTQkp5THZyUG8vS1EwTTVDQU03TkFtd3ZSWGRMWjRHajBlM1lxOHZPdlc2?=
 =?utf-8?B?ejVyQzh6NDkzQ2wrTnZ0akpxRzVCVWl2V09RQitScm1lR2lsaUFRcnFBdUFN?=
 =?utf-8?B?eWxIcm5BNEhZZnZJcTkybXI0aGVRRHhHNEY2NEFYa1VRS3Qxd2dGcnZFcExx?=
 =?utf-8?B?aDhHWUxRUy9TazUrWlk5SjRrYlBtM1ZMNk1nTllmSWx2UExWSUQyTmsyU0Fi?=
 =?utf-8?B?SXdiYVZtSGdBYi9VSzNua3VmZ3hNZitvN2ZhbmVNS21qd0tKeURFNzI4dHJM?=
 =?utf-8?B?d2t6cWdLY3l1a1RzM3pDQnZuSlluZ1l3OStKeVA0ekJvNzA4SzRGa1ljM3A1?=
 =?utf-8?B?YkZQWUUyNzFKSHNscEFlNVZHRElNM25qSzRCMXA0TnBKWU02ZXpRTm5mdVp5?=
 =?utf-8?B?SmF4TVNyVmw2WUE1NFNNSlpuM1crTkg1a3FCNVYyWS9obzJSSXliUW9MNkhX?=
 =?utf-8?B?QXVqUzhjdHM2ZWxXMHhKTTZ1ZFVtNk5iQi9sZGM1VU5wWnRPd3NEb3NQc0gx?=
 =?utf-8?B?U3NJR3NKV1c1aHFCRU0ra2hPbTgxNTBCRFY3c2o5Nm5uVnd5WTZOYmFPRndj?=
 =?utf-8?B?ZnN2Um9QUXoxM2RZNFljdkh4dVIrSHYzWmVkaW1mZHpUSTdUVm9wOHJxVG5D?=
 =?utf-8?B?K2YwNDBabk5lSGwxY3RxMWdlOUpzNjJHVTg1TWpKRElwR2lwcjFNUTIwNHJR?=
 =?utf-8?B?a043Y0tlU2tCaEZqZEJCMHoxb2crbmRseHNYTGYzTHc5YmdqRGx2bmVyYis3?=
 =?utf-8?B?c0g1S0l6RmFNZkhJR3hJK3ZVVXZhMlc5THJ5MFdGcGxkWGJNSkxVazZWOEJ1?=
 =?utf-8?B?NEdnZS90SFNFbU9HSHM3TW92WlFkeU5NdEVOVHdiZnUvdWF5K0UyTUN4eDhC?=
 =?utf-8?B?NmsyejdvUHdpaHZYV0dBOGFUbUNYV3BURG1FK3JrbEg1ekN3Y1BPOC9FQlAr?=
 =?utf-8?B?L0JYQ0xIQ3BRTVpnTS9BcnhvSXRYek9LMUZaVHpVR2ZiRjQvcFJETzh1VW5G?=
 =?utf-8?B?SzFNdG9qOFk2RFFkZW4rVU5PbFJPTUU0VHhWLytZOG5lbmlTVkkwWERwcThH?=
 =?utf-8?B?VEwxZmE1Z0NrNnVUWHdhUVAxYklDa0hCYXdMVUk4MXFUQnMwNEpkOGgwWWZk?=
 =?utf-8?B?RnljYld5OHoyZXU5UTAwb0hxOGVjS0JJTmVkbks2aGlDbkRmQm84aEc0bGF0?=
 =?utf-8?B?RitMYmtMbmZpTUI1T0dkRXE3ajlyM1BMVk1uK0xPNjRVOGN5RFlkOWZIbjlW?=
 =?utf-8?B?NE9ZRGQvSEFPRCtPWXJ1MVh1b0VuV1BwRUJuTERTaTlKbEx4MDl3aXdzazlI?=
 =?utf-8?B?ZEtHdFFjTDRabUovZmpjbFVXa05hcDZiUlZURmx5bzFVTi9VWkFPQ2UvT09B?=
 =?utf-8?B?MUx6QTJ4Ry9Sc25XaDkrSlZPU3ZNUHc1ZG9FbWFrSG1qQ2s2UStyUGxaZFg3?=
 =?utf-8?B?bG5QRVlBZk1vb29xem9Yb2g3YnpyM0x3c3Y2NGY0MXN0Q3NncDZnNXVCZS8z?=
 =?utf-8?B?UkZiTFduQllFTjdnbnhzazVTeFdnN2RmVG00bmV2bkhqOWVXek0zTkNBTnhY?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DEB5F59F241A8479923DC49AA61DAF0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e98044-809f-43ac-0230-08dade6963e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 06:55:45.4566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kuJ2hWGc54Y3ycpFO0btMkeDsH5PN+AlSA6sFi/VNVuLpw5jcwNpMmtaks0OXs4StruLcbzhGCg2SfrORyRKxDPexdRX+Hb48i1PLHldiVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1746
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

DQoNCkxlIDE1LzEyLzIwMjIgw6AgMDc6NDksIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAxNC8xMi8yMDIyIMOgIDE1OjQ1LCBKYW4tQmVuZWRpY3QgR2xhdyBhIMOp
Y3JpdMKgOg0KPj4gT24gVHVlLCAyMDIyLTEyLTEzIDE0OjQ5OjIwICsxMTAwLCBNaWNoYWVsIEVs
bGVybWFuIA0KPj4gPG1wZUBlbGxlcm1hbi5pZC5hdT4gd3JvdGU6DQo+PiBbLi4uXQ0KPj4+IEJv
dGggdHJlZWJvb3QtYWtlYm9uby5jIGFuZCB0cmVlYm9vdC1jdXJyaXR1Y2suYyBhcmUgZm9yIDQ3
NiBzbyBzaG91bGQNCj4+PiBwcm9iYWJseSBiZSBidWlsdCB3aXRoIC1tY3B1PTQ3Ni4gZWc6DQo+
Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUgYi9hcmNoL3Bv
d2VycGMvYm9vdC9NYWtlZmlsZQ0KPj4+IGluZGV4IGQzMmQ5NWFlYTVkNi4uYWNiNmVkZGFjZThm
IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlDQo+Pj4gKysrIGIv
YXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUNCj4+PiBAQCAtODgsOCArODgsOCBAQCAkKG9iaikv
Y3Vib290LXRhaXNoYW4ubzogQk9PVENGTEFHUyArPSAtbWNwdT00NDANCj4+PiDCoCAkKG9iaikv
Y3Vib290LWthdG1haS5vOiBCT09UQ0ZMQUdTICs9IC1tY3B1PTQ0MA0KPj4+IMKgICQob2JqKS9j
dWJvb3QtYWNhZGlhLm86IEJPT1RDRkxBR1MgKz0gLW1jcHU9NDA1DQo+Pj4gwqAgJChvYmopL3Ry
ZWVib290LWlzczR4eC5vOiBCT09UQ0ZMQUdTICs9IC1tY3B1PTQwNQ0KPj4+IC0kKG9iaikvdHJl
ZWJvb3QtY3Vycml0dWNrLm86IEJPT1RDRkxBR1MgKz0gLW1jcHU9NDA1DQo+Pj4gLSQob2JqKS90
cmVlYm9vdC1ha2Vib25vLm86IEJPT1RDRkxBR1MgKz0gLW1jcHU9NDA1DQo+Pj4gKyQob2JqKS90
cmVlYm9vdC1jdXJyaXR1Y2subzogQk9PVENGTEFHUyArPSAtbWNwdT00NzYNCj4+PiArJChvYmop
L3RyZWVib290LWFrZWJvbm8ubzogQk9PVENGTEFHUyArPSAtbWNwdT00NzYNCj4+PiDCoCAjIFRo
ZSBwcmUtYm9vdCBkZWNvbXByZXNzb3JzIHB1bGwgaW4gYSBsb3Qgb2Yga2VybmVsIGhlYWRlcnMg
YW5kIA0KPj4+IG90aGVyIHNvdXJjZQ0KPj4+IMKgICMgZmlsZXMuIFRoaXMgY3JlYXRlcyBhIGJp
dCBvZiBhIGRlcGVuZGVuY3kgaGVhZGFjaGUgc2luY2Ugd2UgbmVlZCANCj4+PiB0byBjb3B5DQo+
Pg0KPj4gV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIGl0IHNlZW1zIHRoaXMgZml4ZXMgdGhlc2Ug
YXNtLXJlbGF0ZWQgYnVpbGRzOg0KPj4NCj4+IGxpbnV4LXBvd2VycGMtYmFtYm9vX2RlZmNvbmZp
Zw0KPj4gbGludXgtcG93ZXJwYy1jZWxsX2RlZmNvbmZpZw0KPj4gbGludXgtcG93ZXJwYy1lYm9u
eV9kZWZjb25maWcNCj4+IGxpbnV4LXBvd2VycGMta2F0bWFpX2RlZmNvbmZpZw0KPj4gbGludXgt
cG93ZXJwYy1wcGM0NHhfZGVmY29uZmlnDQo+PiBsaW51eC1wb3dlcnBjLXJhaW5pZXJfZGVmY29u
ZmlnDQo+PiBsaW51eC1wb3dlcnBjLXNhbTQ0MGVwX2RlZmNvbmZpZw0KPj4gbGludXgtcG93ZXJw
Yy1zZXF1b2lhX2RlZmNvbmZpZw0KPj4gbGludXgtcG93ZXJwYy10YWlzaGFuX2RlZmNvbmZpZw0K
Pj4NCj4+IC4uLndoaWxlIHRocmVlIHJlbWFpbiB1bnJlc29sdmVkOg0KPj4NCj4+IGxpbnV4LXBv
d2VycGMtYXNwODM0N19kZWZjb25maWcNCj4+IGxpbnV4LXBvd2VycGMtbXZtZTUxMDBfZGVmY29u
ZmlnDQo+PiBsaW51eC1wb3dlcnBjLXBwYzY0ZV9kZWZjb25maWcNCj4+DQo+IA0KPiBDYW4geW91
IHRyeSB3aXRoIGJlbG93IGNoYW5nZXMgKHlvdSBtYXkgaGF2ZSB0byBhcHBseSBtYW51YWxseSBh
cyBJJ20gDQo+IG5vdCBzdXJlIG15IG1haWwgY2xpZW50IHByZXNlcnZlcyB0ZXh0IGludGVncml0
eSk6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL01ha2VmaWxlIGIvYXJjaC9wb3dl
cnBjL01ha2VmaWxlDQo+IGluZGV4IGJmNWYwYTk5ODI3My4uMzI0NWVlYzk1NjI3IDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMvTWFrZWZpbGUNCj4gKysrIGIvYXJjaC9wb3dlcnBjL01ha2Vm
aWxlDQo+IEBAIC0yMDEsMTggKzIwMSwxNSBAQCBLQlVJTERfQ0ZMQUdTICs9IC1mbm8tYXN5bmNo
cm9ub3VzLXVud2luZC10YWJsZXMNCj4gIMKgIyBvZnRlbiBzbG93IHdoZW4gdGhleSBhcmUgaW1w
bGVtZW50ZWQgYXQgYWxsDQo+ICDCoEtCVUlMRF9DRkxBR1PCoMKgwqDCoMKgwqDCoCArPSAkKGNh
bGwgY2Mtb3B0aW9uLC1tbm8tc3RyaW5nKQ0KPiANCj4gLWNwdS1hcy0kKENPTkZJR180MHgpwqDC
oMKgwqDCoMKgwqAgKz0gLVdhLC1tNDA1DQo+IC1jcHUtYXMtJChDT05GSUdfNDR4KcKgwqDCoMKg
wqDCoMKgICs9IC1XYSwtbTQ0MA0KPiAgwqBjcHUtYXMtJChDT05GSUdfQUxUSVZFQynCoMKgwqAg
Kz0gJChjYWxsIGFzLW9wdGlvbiwtV2EkKGNvbW1hKS1tYWx0aXZlYykNCj4gLWNwdS1hcy0kKENP
TkZJR19QUENfRTUwMCnCoMKgwqDCoMKgwqDCoCArPSAtV2EsLW1lNTAwDQo+ICtjcHUtYXMtJChD
T05GSUdfVEFSR0VUX0NQVV9CT09MKcKgwqDCoCArPSAtV2EsLW0kKENPTkZJR19UQVJHRVRfQ1BV
KQ0KPiANCj4gIMKgIyBXaGVuIHVzaW5nICctbWFueSAtbXBvd2VyNCcgZ2FzIHdpbGwgZmlyc3Qg
dHJ5IGFuZCBmaW5kIGEgbWF0Y2hpbmcgDQo+IHBvd2VyNA0KPiAgwqAjIG1uZW1vbmljIGFuZCBm
YWlsaW5nIHRoYXQgaXQgd2lsbCBhbGxvdyBhbnkgdmFsaWQgbW5lbW9uaWMgdGhhdCBHQVMgDQo+
IGtub3dzDQo+ICDCoCMgYWJvdXQuIEdDQyB3aWxsIHBhc3MgLW1hbnkgdG8gR0FTIHdoZW4gYXNz
ZW1ibGluZywgY2xhbmcgZG9lcyBub3QuDQo+ICDCoCMgTExWTSBJQVMgZG9lc24ndCB1bmRlcnN0
YW5kIGVpdGhlciBmbGFnOiANCj4gaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9s
aW51eC9pc3N1ZXMvNjc1DQo+ICDCoCMgYnV0IExMVk0gSUFTIG9ubHkgc3VwcG9ydHMgSVNBID49
IDIuMDYgZm9yIEJvb2szUyA2NCBhbnl3YXkuLi4NCj4gLWNwdS1hcy0kKENPTkZJR19QUENfQk9P
SzNTXzY0KcKgwqDCoCArPSAkKGNhbGwgDQo+IGFzLW9wdGlvbiwtV2EkKGNvbW1hKS1tcG93ZXI0
KSAkKGNhbGwgYXMtb3B0aW9uLC1XYSQoY29tbWEpLW1hbnkpDQo+IC1jcHUtYXMtJChDT05GSUdf
UFBDX0U1MDBNQynCoMKgwqAgKz0gJChjYWxsIGFzLW9wdGlvbiwtV2EkKGNvbW1hKS1tZTUwMG1j
KQ0KPiArY3B1LWFzLSQoQ09ORklHX1BQQ19CT09LM1NfNjQpwqDCoMKgICs9ICQoY2FsbCBhcy1v
cHRpb24sLVdhJChjb21tYSktbWFueSkNCj4gDQo+ICDCoEtCVUlMRF9BRkxBR1MgKz0gJChjcHUt
YXMteSkNCj4gIMKgS0JVSUxEX0NGTEFHUyArPSAkKGNwdS1hcy15KQ0KPiANCg0KDQpGb3IgcHBj
NjRlX2RlZmNvbmZpZywgYWxzbyBtYWtlIHN1cmUgeW91IGhhdmUgdGhlIGZpeCB0aGF0IGlzIG9u
IHRvcCBvZiANCnBvd2VycGMvbmV4dC10ZXN0IGJyYW5jaCA6IA0KaHR0cHM6Ly9naXRodWIuY29t
L2xpbnV4cHBjL2xpbnV4L2NvbW1pdHMvbmV4dC10ZXN0DQoNCg==
