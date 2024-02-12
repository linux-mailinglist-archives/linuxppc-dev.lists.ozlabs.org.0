Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C7850EA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 09:08:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IXhrg14U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYHCd608Vz3w35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IXhrg14U;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYH941YFhz3vdP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 19:06:32 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TYH9418X8z4wp0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 19:06:32 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TYH9414Sxz4wyY; Mon, 12 Feb 2024 19:06:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IXhrg14U;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TYH9335bjz4wp0
	for <linuxppc-dev@ozlabs.org>; Mon, 12 Feb 2024 19:06:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvb1A1ySfySjaO4WA8/srWwRYfxqebYui9a6cZ+4s+ZSIO4C04YdKXCyxZGVm/r9XGCi48uxtVgSEB7WHunHVm3JHVpOks6wSLcvMwgCCzZHXHZEQUF0T2Kn0vqkMCj6+o6dnJXyjaPU+/o3T7AztlIix6m00cQ+ajTdkGt/3+HtCTqJUuwU9YvHRsc68N+bOamcninxfl5KxmIiP4sCwJNanXESwmLqhGHnbVkznRWIJMovfkMK7JHf50GD7Fp0tpdatuxbWOBsuodC+33m2J2LqXFMGa3HBGENYrouKfZaeRrox06/xTXEJsAMnGPiYEi8FMz8lZVAg5D59/ACHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGlXdnR3dEiutFqQlE1DyTChs728LJM0pfVUIxerSDs=;
 b=CkfYyZAwQTDYkHBwf0pl6quyXuN+TZCtu86pid+PuBfeDKCKn0pLSaXT6QXvz2Q+1secIkNIQdemwTvk+YKQQd6NUj6XCWXwHchjuKeVKDPficbxSsEwKUB4NzEOahf8GLlUFdgMoyDQLJMgjKbxMlvUHmc4TEzWHJd0LKMfHGWiY5aOFd7Ygy5UqmcFfhxqqAqgIBLzzhoZu0nVu6yaGDTJYsscx1HxPD3UmTXVgWBgt1z6xKqLeg8iKQ8YbIw/U+po5kkWCO0shfTLT4qFFZDOoVPUzxPgWD4zseaepbUrR6cmMT9CuFyqooidfLoHAkZuGFBdAoZHjWkn1Lpe0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGlXdnR3dEiutFqQlE1DyTChs728LJM0pfVUIxerSDs=;
 b=IXhrg14UNLiibYCvF1pthIVDkfhqpUmNZC+BLW+3Oz1St/1xEJSLAs3UismpbbLbh/OICiK1DoFzz1+F/VqEiQgfixiIrhA5ftXiBDgsxZkiN+0UoTtNZQAVpbhN1Am5Hl3xsSQbqmlGkbPJdbXdrWCfX8uIK4xhKjTwGeYNBVqFv7WCzusoKkTjnF8RTM28+vbkU3/Hv9iG9YtMKxnStePWFTsFXKDDHdmpJVDLUNg0Muw+xFQ8yglSopnCUyk85cbU6jf1VRfv87Se9HzOehk4GWqjQyE7OfgJZTMylQ6u4QHURaOApd59npr1bt6v0OyoC6Dvs4dKYv0oITQLYw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Mon, 12 Feb
 2024 08:06:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%6]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 08:06:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, = linuxppc-dev
	<linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Thread-Topic: [PATCH v2] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Thread-Index: AQHaV/VXlho4QI61ZEiGf1MBFF1hCrEGZNSA
Date: Mon, 12 Feb 2024 08:06:25 +0000
Message-ID: <6d1460a3-7a2f-4e43-a3da-d5dfd4e26bf7@csgroup.eu>
References: <20240205053647.1763446-1-mahesh@linux.ibm.com>
In-Reply-To: <20240205053647.1763446-1-mahesh@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3047:EE_
x-ms-office365-filtering-correlation-id: 50394759-ef18-4cc0-106f-08dc2ba18240
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  vSlrq9TJQnWdwawdN3+aKLESE5J61JvxADeb7tMGCufcetK/v5ZIwMDY6cKBfsgeYZlVuLU52pkwwZzW3Slj7TSkP19l91OMpoURLRpfVp1bse9zO5OVl9SVsCig731E0+PxiBrf00nF6ohi9DhXL074m1y2TDCirWko3txLVSoXM0zRVC2C0/mBytKgEy3/1aa4RnZY+WB+dHdpWQP80qF5GrKYpP7CBVutX28rP0xczzQP5YE3sCppuj/WLZf/aqEqeUdgUyGYc1smcDbazWbbTnf6+Qus7ZxvBjOoBC9WDDvAfsyFrMRvndFB84xFs9JAuu2jk3LNjIQuoxgtkySFU8k6jBgFsQDHFSxkJYci+r06xoqq1HpDRGZ/aRpkbsbc3Ssgox+HoS+1IPMh/5ACUMZJGQAmSdrZAiojvMpWWNdCLA/oj4sJt5z32SkWIxhtdYTjyuA9b3v6DElg8PxMydKgrB0BhCzt53xVZ8uYC2OErHUGAmf/APbA8Uge9rnaYkTj0PasE1SDAhEpjCUkQP/OT9XYtcXy1b0AL6NDo4v4AfP0KL1ZK0QtXdijyVvlFAAMGMYT4LNibREqsRBXW8dwJ58PCNJeBD5V/50=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(396003)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(31686004)(44832011)(41300700001)(2616005)(478600001)(66476007)(66446008)(6512007)(5660300002)(76116006)(6486002)(966005)(71200400001)(8936002)(8676002)(64756008)(4326008)(66574015)(66946007)(66556008)(91956017)(6506007)(26005)(38070700009)(36756003)(122000001)(54906003)(110136005)(316002)(38100700002)(86362001)(31696002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ODY1SEhoWW0xZWJwMDdPUmVnQ2RsdHl0U3hkZUxySWdqenBDQXZnQTh2blFQ?=
 =?utf-8?B?akNieDA2TGgrWnBZdnltNFAwS1JrZUViK2VVdjR6YXFhbGo0U3JvTmUwV1A0?=
 =?utf-8?B?VktRdlR1M3I4aklJZm1KU1owRlhLUXFXOFNQSURQWWpwVFoxNGYyWEQ1dFJq?=
 =?utf-8?B?YlhVK3dKTDdHUURpVFdJTFc5MHJTR05RTU5aRDlKeE5DM213UWxmTEtCMUtR?=
 =?utf-8?B?NFBKYnBGNkc3Mit2d1ZSMWZyekV5M09HV3VQWHZZdXlXWEVCVnRwb1pOeUFN?=
 =?utf-8?B?YmJjSVhxNDFMbjUrS1B2bElSZk1iNXJuS1BFcytOelJsd1FRb3hhZzJmWUZ0?=
 =?utf-8?B?SkJKdkNBUzZOL21CcE9BamNvc0RzY0trUDBVYzNEVUoxQkhKR3hKcTlnRWdQ?=
 =?utf-8?B?NHdxUUszWGt6M2ZWSndybjVrWWVUM2QwdW9KZ2FEM0lMUFRhMGd5dktYUEFD?=
 =?utf-8?B?eWtlWncwMHpSU2wyS3k4dGNLQzlGSGp0cDFPSURGT290aThGRTVKdXZCVysv?=
 =?utf-8?B?VDllaFZHd08rK3d0UFM1M3B0TVVwb2ovV3FUcGt0bFV3ZEdVWDFoUGJOdU0w?=
 =?utf-8?B?UXZIUUY3SUZRZG9IbUJBVjNVV2l2WndjK0JGbkNlQVYrY05aOVllbWExWE1m?=
 =?utf-8?B?VkxId3VNWWF1bXVjQy9yaDJHcFZwRmVXcHBxQnhxc0JsZ1I4MlVvOXl3ZnZw?=
 =?utf-8?B?bWViVEZoWFJVZ2FyZTBXTlRlcDYwN0tjb0JodVJZbWRCcTVHcG1pOXlKU1kx?=
 =?utf-8?B?ZEM4aE51UUFhUGtodkh2Mys0dzJqMnJaL3Zwcm5rR3ErbHpPcHhlSXI2YlFt?=
 =?utf-8?B?bm00RTR0eFFMTmZPb2xoUnFEY3M0Zk9ya0w4VFVyRmVMcnQ0SmxyYW9IOE5s?=
 =?utf-8?B?bU5Pa3grY2Jsa0MxRXMzUWppWXNGMmlyTE1BemMyaVMzOVdPTS9hQnR5MWRo?=
 =?utf-8?B?MHNLNFFIWVBzOVc3WGtYaHF6dEw5NFdqT254amNFV3FoaHNqUUluaGt2OVRB?=
 =?utf-8?B?MFE5L0NZaTk0azN1Y0l6RGxwSTRHUUJZL09kMk15TWQzYW9YdGEyaEFXMkY1?=
 =?utf-8?B?bGNMM21CczY4VTZlUEI3ekhqVXpNSlpWTVhqdDRiMmM4RG1GbmIwdUJsZFU2?=
 =?utf-8?B?cGxYQ1l6c1hQcVVBN2ZkNkZrWXBpNlcvMm9ESjQ4Nk5LODJoOGJjQTRYNnd3?=
 =?utf-8?B?RXFCZzg0bG1KSlFpWHdZQWVWZlFjNUw4N1RTL0V6ZWI3elVXZVRodk4weTV5?=
 =?utf-8?B?S3VnYjROUUJzZ2dyQm9pY2FZc1hXVkFRVVcxazYvWXZzNXlJbGJQTS9TQU41?=
 =?utf-8?B?d3dzMzVBVklxeUVKRm12ZDk3ZkhCRDBtMmY5SEhnQnVlOVhxVFVPZTl6cHR3?=
 =?utf-8?B?YVJqd2R0cG02dTkraitWTkpmWHNhVVFPakkwb040WjNXNTdWQkxCcnl6MVdo?=
 =?utf-8?B?SzNXdkFySUJjUFJuajFoSC9FeHNEckFRbkZTSDdpcndtWCtEdk16bDZwQksy?=
 =?utf-8?B?a1hYaVB4NGN2VGV3T0NiYktNbW1nUC9TZDZxSVF6VlZUZUU2ZWhZUVhqc2lI?=
 =?utf-8?B?SDBHamZjdXVhbk9Sc3AvNkNHZUlrdCt4R3hrYXRiYUNvNTRQN0RUK3hoK0xq?=
 =?utf-8?B?ZDM1Y2k1SEFvSGZYQ21ZYU1IVFhFYktOZW15Tm5oVWFwVFJkdW1hYVR6QlA5?=
 =?utf-8?B?bWFtdFkwWCt0VEVORjRoVUpyVFlHZUEyeXJrSGNvMXFaYWgrR1JNdXJDM3Av?=
 =?utf-8?B?eEdZR3M5V2E5YmdSMlZtSDVBYm0xNHVBVUdVVWNJVytiNHBZRDQrTlVLcnlk?=
 =?utf-8?B?SXlCVWo0c2lGdS9IWmMyUDB6TmZDQ2VIUFhqQnlMaUxZRTlqNElhZHRVUnhk?=
 =?utf-8?B?enRSdnhSeGFKY3JSS0xpQ3Z6anNPWlowTys1VUpoNDVrdUluWkZtbW1FcVlw?=
 =?utf-8?B?Vk1LbGFaTWxDWFBKN2ZCb1ZmTFlkaFRlenZUbjVVN0xIazcxRmtTNUdIb2th?=
 =?utf-8?B?WnlIbWhYV01hdktkUG8xUzd1ZmJYQ0JTSUpiOS9Xa0M2UU1tb1lIajdZcEFs?=
 =?utf-8?B?VTNVVDJFWUZ5eGJYdm9vWGh5OGRrelJsOEJpaGlZL1ZjSjdrKzR3bXBVblNw?=
 =?utf-8?Q?0aHyBT3jv2rvGjtRg2RsrSPnU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD223BBE8D3FB64A8E966219BDE19416@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 50394759-ef18-4cc0-106f-08dc2ba18240
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 08:06:25.4446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdagKhFRIX5hCShxx6qqhmhdmZddFmGqSCTIZ+JIHoNemNq0tukHBN/KYe3qrk+yvkzRxC1Y95BWjfLdLTfexkT/wdZ6ArgwUnUVJB/PkF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3047
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
Cc: "= Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, = Ganesh Goudar <ganeshgr@linux.ibm.com>, = Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzAyLzIwMjQgw6AgMDY6MzYsIE1haGVzaCBTYWxnYW9ua2FyIGEgw6ljcml0wqA6
DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG1haGVzaEBs
aW51eC5pYm0uY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gbm1p
X2VudGVyKCkvbm1pX2V4aXQoKSB0b3VjaGVzIHBlciBjcHUgdmFyaWFibGVzIHdoaWNoIGNhbiBs
ZWFkIHRvIGtlcm5lbA0KPiBjcmFzaCB3aGVuIGludm9rZWQgZHVyaW5nIHJlYWwgbW9kZSBpbnRl
cnJ1cHQgaGFuZGxpbmcgKGUuZy4gZWFybHkgSE1JL01DRQ0KPiBpbnRlcnJ1cHQgaGFuZGxlcikg
aWYgcGVyY3B1IGFsbG9jYXRpb24gY29tZXMgZnJvbSB2bWFsbG9jIGFyZWEuDQo+IA0KPiBFYXJs
eSBITUkvTUNFIGhhbmRsZXJzIGFyZSBjYWxsZWQgdGhyb3VnaCBERUZJTkVfSU5URVJSVVBUX0hB
TkRMRVJfTk1JKCkNCj4gd3JhcHBlciB3aGljaCBpbnZva2VzIG5taV9lbnRlci9ubWlfZXhpdCBj
YWxscy4gV2UgZG9uJ3Qgc2VlIGFueSBpc3N1ZSB3aGVuDQo+IHBlcmNwdSBhbGxvY2F0aW9uIGlz
IGZyb20gdGhlIGVtYmVkZGVkIGZpcnN0IGNodW5rLiBIb3dldmVyIHdpdGgNCj4gQ09ORklHX05F
RURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LIGVuYWJsZWQgdGhlcmUgYXJlIGNoYW5jZXMgd2hl
cmUgcGVyY3B1DQo+IGFsbG9jYXRpb24gY2FuIGNvbWUgZnJvbSB0aGUgdm1hbGxvYyBhcmVhLg0K
PiANCj4gV2l0aCBrZXJuZWwgY29tbWFuZCBsaW5lICJwZXJjcHVfYWxsb2M9cGFnZSIgd2UgY2Fu
IGZvcmNlIHBlcmNwdSBhbGxvY2F0aW9uDQo+IHRvIGNvbWUgZnJvbSB2bWFsbG9jIGFyZWEgYW5k
IGNhbiBzZWUga2VybmVsIGNyYXNoIGluIG1hY2hpbmVfY2hlY2tfZWFybHk6DQo+IA0KPiBbICAg
IDEuMjE1NzE0XSBOSVAgW2MwMDAwMDAwMDBlNDllYjRdIHJjdV9ubWlfZW50ZXIrMHgyNC8weDEx
MA0KPiBbICAgIDEuMjE1NzE3XSBMUiBbYzAwMDAwMDAwMDA0NjFhMF0gbWFjaGluZV9jaGVja19l
YXJseSsweGYwLzB4MmMwDQo+IFsgICAgMS4yMTU3MTldIC0tLSBpbnRlcnJ1cHQ6IDIwMA0KPiBb
ICAgIDEuMjE1NzIwXSBbYzAwMDAwMGZmZmQ3MzE4MF0gWzAwMDAwMDAwMDAwMDAwMDBdIDB4MCAo
dW5yZWxpYWJsZSkNCj4gWyAgICAxLjIxNTcyMl0gW2MwMDAwMDBmZmZkNzMxYjBdIFswMDAwMDAw
MDAwMDAwMDAwXSAweDANCj4gWyAgICAxLjIxNTcyNF0gW2MwMDAwMDBmZmZkNzMyMTBdIFtjMDAw
MDAwMDAwMDA4MzY0XSBtYWNoaW5lX2NoZWNrX2Vhcmx5X2NvbW1vbisweDEzNC8weDFmOA0KPiAN
Cj4gRml4IHRoaXMgYnkgYXZvaWRpbmcgdXNlIG9mIG5taV9lbnRlcigpL25taV9leGl0KCkgaW4g
cmVhbCBtb2RlIGlmIHBlcmNwdQ0KPiBmaXJzdCBjaHVuayBpcyBub3QgZW1iZWRkZWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBNYWhlc2ggU2FsZ2FvbmthciA8bWFoZXNoQGxpbnV4LmlibS5jb20+
DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIFJlYmFzZSB0byB1cHN0cmVhbSBtYXN0ZXIN
Cj4gLSBVc2UganVtcF9sYWJlbHMsIGlmIENPTkZJR19KVU1QX0xBQkVMIGlzIGVuYWJsZWQsIHRv
IGF2b2lkIHJlZG9pbmcgdGhlDQo+ICAgIHRlc3QgYXQgZWFjaCBpbnRlcnJ1cHQgZW50cnkuDQo+
IC0gdjEgaXMgYXQgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzE2NDU3ODQ2
NTgyOC43NDk1Ni42MDY1Mjk2MDI0ODE3MzMzNzUwLnN0Z2l0QGp1cGl0ZXIvDQo+IC0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaCB8IDE0ICsrKysrKysrKysrKysr
DQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BlcmNwdS5oICAgIHwgMTEgKysrKysrKysr
KysNCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3NldHVwXzY0LmMgICAgICAgfCAxMiArKysrKysr
KysrKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0LmggYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vaW50ZXJydXB0LmgNCj4gaW5kZXggYTQxOTZhYjFkMDE2Ny4uM2I0ZTE3
YzIzZDlhOSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVw
dC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaA0KPiBAQCAt
MzM2LDYgKzMzNiwxNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X25taV9lbnRlcl9w
cmVwYXJlKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBzdHJ1Y3QgaW50ZQ0KPiAgICAgICAgICBpZiAo
SVNfRU5BQkxFRChDT05GSUdfS0FTQU4pKQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybjsNCj4g
DQo+ICsgICAgICAgLyoNCj4gKyAgICAgICAgKiBMaWtld2lzZSwgZG8gbm90IHVzZSBpdCBpbiBy
ZWFsIG1vZGUgaWYgcGVyY3B1IGZpcnN0IGNodW5rIGlzIG5vdA0KPiArICAgICAgICAqIGVtYmVk
ZGVkLiBXaXRoIENPTkZJR19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSyBlbmFibGVkIHRo
ZXJlDQo+ICsgICAgICAgICogYXJlIGNoYW5jZXMgd2hlcmUgcGVyY3B1IGFsbG9jYXRpb24gY2Fu
IGNvbWUgZnJvbSB2bWFsbG9jIGFyZWEuDQo+ICsgICAgICAgICovDQo+ICsjaWZkZWYgQ09ORklH
X1BQQzY0DQoNCkluc3RlYWQgb2YgYWRkaW5nIHRoaXMgI2lmZGVmIGluIG1pZGRsZSBvZiBjb2Rl
LCBjb3VsZCB5b3UgZGVmaW5lIA0KaXNfZW1iZWRfZmlyc3RfY2h1bmsgYXMgYWx3YXlzICd0cnVl
JyB3aGVuIENPTkZJR19QUEM2NCBpcyBub3QgZGVmaW5lZCA/DQoNCj4gKyAgICAgICBpZiAoSVNf
RU5BQkxFRChDT05GSUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTkspICYmICFpc19lbWJl
ZF9maXJzdF9jaHVuaykNCj4gKyAgICAgICAgICAgICAgIHJldHVybjsNCj4gKyNlbmRpZg0KPiAr
DQo+ICAgICAgICAgIC8qIE90aGVyd2lzZSwgaXQgc2hvdWxkIGJlIHNhZmUgdG8gY2FsbCBpdCAq
Lw0KPiAgICAgICAgICBubWlfZW50ZXIoKTsNCj4gICB9DQo+IEBAIC0zNTEsNiArMzYxLDEwIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlcnJ1cHRfbm1pX2V4aXRfcHJlcGFyZShzdHJ1Y3QgcHRf
cmVncyAqcmVncywgc3RydWN0IGludGVyDQo+ICAgICAgICAgICAgICAgICAgLy8gbm8gbm1pX2V4
aXQgZm9yIGEgcHNlcmllcyBoYXNoIGd1ZXN0IHRha2luZyBhIHJlYWwgbW9kZSBleGNlcHRpb24N
Cj4gICAgICAgICAgfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19LQVNBTikpIHsNCj4gICAg
ICAgICAgICAgICAgICAvLyBubyBubWlfZXhpdCBmb3IgS0FTQU4gaW4gcmVhbCBtb2RlDQo+ICsj
aWZkZWYgQ09ORklHX1BQQzY0DQoNClNhbWUNCg0KPiArICAgICAgIH0gZWxzZSBpZiAoSVNfRU5B
QkxFRChDT05GSUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTkspICYmICFpc19lbWJlZF9m
aXJzdF9jaHVuaykgew0KPiArICAgICAgICAgICAgICAgLy8gbm8gbm1pX2V4aXQgaWYgcGVyY3B1
IGZpcnN0IGNodW5rIGlzIG5vdCBlbWJlZGRlZA0KPiArI2VuZGlmDQo+ICAgICAgICAgIH0gZWxz
ZSB7DQo+ICAgICAgICAgICAgICAgICAgbm1pX2V4aXQoKTsNCj4gICAgICAgICAgfQ0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BlcmNwdS5oIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3BlcmNwdS5oDQo+IGluZGV4IDhlNWI3ZDBiODUxYzYuLjZiNGRjZTRlNzhk
NWYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZXJjcHUuaA0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGVyY3B1LmgNCj4gQEAgLTEyLDYgKzEyLDE3
IEBADQo+IA0KPiAgICNkZWZpbmUgX19teV9jcHVfb2Zmc2V0IGxvY2FsX3BhY2EtPmRhdGFfb2Zm
c2V0DQo+IA0KPiArI2lmZGVmIENPTkZJR19KVU1QX0xBQkVMDQo+ICtERUNMQVJFX1NUQVRJQ19L
RVlfRkFMU0UoX19wZXJjcHVfZW1iZWRfZmlyc3RfY2h1bmspOw0KPiArDQo+ICsjZGVmaW5lIGlz
X2VtYmVkX2ZpcnN0X2NodW5rICAgXA0KPiArICAgICAgICAgICAgICAgKHN0YXRpY19rZXlfZW5h
YmxlZCgmX19wZXJjcHVfZW1iZWRfZmlyc3RfY2h1bmsua2V5KSkNCj4gKw0KPiArI2Vsc2UgLyog
IUNPTkZJR19KVU1QX0xBQkVMICovDQo+ICtleHRlcm4gYm9vbCBfX3BlcmNwdV9lbWJlZF9maXJz
dF9jaHVuazsNCj4gKyNkZWZpbmUgaXNfZW1iZWRfZmlyc3RfY2h1bmsgICBfX3BlcmNwdV9lbWJl
ZF9maXJzdF9jaHVuaw0KPiArDQo+ICsjZW5kaWYgLyogQ09ORklHX0pVTVBfTEFCRUwgKi8NCj4g
ICAjZW5kaWYgLyogQ09ORklHX1NNUCAqLw0KPiAgICNlbmRpZiAvKiBfX3Bvd2VycGM2NF9fICov
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cF82NC5jIGIvYXJj
aC9wb3dlcnBjL2tlcm5lbC9zZXR1cF82NC5jDQo+IGluZGV4IDJmMTlkNWU5NDQ4NTIuLjY3NGI2
ZTFiZWJlOWEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXBfNjQuYw0K
PiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NldHVwXzY0LmMNCj4gQEAgLTgzNCw2ICs4MzQs
MTEgQEAgc3RhdGljIF9faW5pdCBpbnQgcGNwdV9jcHVfdG9fbm9kZShpbnQgY3B1KQ0KPiANCj4g
ICB1bnNpZ25lZCBsb25nIF9fcGVyX2NwdV9vZmZzZXRbTlJfQ1BVU10gX19yZWFkX21vc3RseTsN
Cj4gICBFWFBPUlRfU1lNQk9MKF9fcGVyX2NwdV9vZmZzZXQpOw0KPiArI2lmZGVmIENPTkZJR19K
VU1QX0xBQkVMDQoNCldoeSB0aGlzIGlmZGVmID8gRXZlbiB3aGVuIENPTkZJR19KVU1QX0xBQkVM
IGlzIG5vdCBzZWxlY3RlZCBhbGwgdGhpcyANCnNob3VsZCBqdXN0IHdvcmsgZmluZS4NCg0KPiAr
REVGSU5FX1NUQVRJQ19LRVlfRkFMU0UoX19wZXJjcHVfZW1iZWRfZmlyc3RfY2h1bmspOw0KPiAr
I2Vsc2UNCj4gK2Jvb2wgX19wZXJjcHVfZW1iZWRfZmlyc3RfY2h1bms7DQo+ICsjZW5kaWYNCj4g
DQo+ICAgdm9pZCBfX2luaXQgc2V0dXBfcGVyX2NwdV9hcmVhcyh2b2lkKQ0KPiAgIHsNCj4gQEAg
LTg2OSw2ICs4NzQsMTMgQEAgdm9pZCBfX2luaXQgc2V0dXBfcGVyX2NwdV9hcmVhcyh2b2lkKQ0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiUEVSQ1BVOiAlcyBhbGxvY2F0b3Ig
ZmFpbGVkICglZCksICINCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZhbGxp
bmcgYmFjayB0byBwYWdlIHNpemVcbiIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBjcHVfZmNfbmFtZXNbcGNwdV9jaG9zZW5fZmNdLCByYyk7DQo+ICsgICAgICAgICAgICAg
ICBlbHNlIHsNCj4gKyNpZmRlZiBDT05GSUdfSlVNUF9MQUJFTA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0aWNfa2V5X2VuYWJsZSgmX19wZXJjcHVfZW1iZWRfZmlyc3RfY2h1bmsua2V5
KTsNCj4gKyNlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fcGVyY3B1X2VtYmVkX2Zp
cnN0X2NodW5rID0gdHJ1ZTsNCj4gKyNlbmRpZg0KPiArICAgICAgICAgICAgICAgfQ0KPiAgICAg
ICAgICB9DQo+IA0KPiAgICAgICAgICBpZiAocmMgPCAwKQ0KPiAtLQ0KPiAyLjQzLjANCj4gDQo=
