Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0B749620
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 09:15:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=YK9NemIg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxSTj71vSz3bbW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 17:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=YK9NemIg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::620; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxSSm6QjZz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 17:14:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nurSLC2m0Rf4dMZRknZlzLIpbfn7EZzVNnPTTYPB+Hh3HVuwEhjPMnQwlVpkt00Mo3YzTaKMLYZcPtoBekGx6kIczUGdetipwgs/6+HGJdS2wKysLMiFn0HwBuGTQxsexULEIjPvDPb/NsoO5DYUJXmgiOH8B+awfT8VS10ySk7Yj39M4yw8AjJ4ttvdQzXoihF1LKyC/ft38DUc8cx2NrLEQl15izQEYpMe61wjI94BA64C4m10A8Bhik6gWjVkZdnwijRAQCxahkJuDSGO+Z00De5k7vIrIl65xTUjnwerI7Wbv0SudBpICNYPjkszT7ap/WMda2Y1dcPMALKM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYvhj61j1wfATT+qIhTrEI9FNKSNmLN2vKNluxCUwM8=;
 b=RdA8Yc/EmXbvQByG3Tgacwmoz88HsDqxW5QDe7bHopPcsC4QLxqD2ZRafbhzxeAXvqihyDOKpI6iOPj4a4K81YzhZ6SoDCVfpFJeU0Yk5UJXVXSx1Z3ek+aQr//JvqJO7pYs/b99BB8CsyPewcZiBvWQDAyPR7cFYB2U5dP+9QholG/hepkCXgYRAABxci5aGzjutrHsTd8/xGv0iP+Ls//l3+DtUbNnm6RkoSECOohwKS+zlf708y0mF9JcEPL8Klrx4R/xSTiXeyVhPtB91OmhxXZT4cDu/kKZsIj8daAwy78G1fE/RvBPkRjYGp4msWt0TYRahcTUn2suZywyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYvhj61j1wfATT+qIhTrEI9FNKSNmLN2vKNluxCUwM8=;
 b=YK9NemIg1WxGz5TlXhsvmgx2C8mu2NYdkUEoKlW1+TmPc+eGt1ne2Xlsm7rsiYTj5ndcxOMJwUq6ZXjZU+L3Cl4Y2WjK9C+tAJz5Uowq4T3LO4TGd4qYS7Ft85hPj0+1wpxdGjPuWzn+9N/bqInzGcnsJLxZm4jGT3WXRbLnFb7NClDSGn2pRx7L1YuJDJt4+TgFIfawjM+g/9nST6xjNI33LeELCy9UUjtaRoNI3C4Wy876unKapoVPLojBD4/zFyHzXb1XndzxyDlBdl/8XhNO2VeIs2TcWMb5tugIJY/DvtDYv22eOik+T3m0dAkcGiHU9zD9T5T2liJ6IiyBEg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1776.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:13:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 07:13:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Yang Yingliang <yangyingliang@huawei.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/fsl_rio: add missing of_node_put() in
 fsl_rio_setup()
Thread-Topic: [PATCH v3] powerpc/fsl_rio: add missing of_node_put() in
 fsl_rio_setup()
Thread-Index: AQHZABIN8W1/h1tnLEi/PvuqCmN4vK+tsrYA
Date: Thu, 6 Jul 2023 07:13:57 +0000
Message-ID: <82d32c9a-74bb-46c3-d492-a5d489cfaa55@csgroup.eu>
References: <20221124143357.569310-1-yangyingliang@huawei.com>
In-Reply-To: <20221124143357.569310-1-yangyingliang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1776:EE_
x-ms-office365-filtering-correlation-id: f0a898c8-10d7-49b9-a3e1-08db7df090a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KtdcBkXlf39xBIw53XPdFNf+jeIHQkU8Y6E/YS845aHogrUuqVkrM5Vy6u/L8DDscGqGCif89WAhxTeXWDzltR68XXsmGTbeph7SOJZK1z/bpuymVZDYmgaCWST6PqxVoYjGMlL6zIH6q27Z3sNv2XNeUrZbB9UWQeMItd2iHkAD0JXg+4fK87FE8G/jnuLaQnyZjdXpRkIRJH49drqnZ1FrH37HBngnWEBFgnLHs8un4AB1K4+qJZjOFPhAOfEjyVOm1L3L1LaUZfIozJE/W6TFGW9hFRx3sZkFPNEgR7DxVEzzU8Lwpi+Ga42TZOTGdfvbdkbICvvxhorOOq9550MDlOIZdduofJTNGlbanzEJ2Eo+bEbYTrt1mu+hXxqHqNbDTAccarflXx7LZQCJRo1OrF58JEM1MUM8IPzSiWUGwOuLY+NHS2u91lCWo1sU1DnclXdKr00H3//NtR9m9fIqWKs0td6B3b4fyVxCBjqxpw21laIqUiyx2B89Zsgn3uFVVJnmPZQzZgEhzvUOmXWxN3kqFE57ig4EwM4id80NaqgSXKLE3ic7F4XMZbox0cfrNxXi4OWRYWwTsMC7xBwwoPVQzgNt+1rv2EMWRlCkVXouKxqhXDGEa1+fARhq/cle13vwLTgbECeYBbpdYD9diiQdNgoSG8p44pntuGg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(91956017)(38100700002)(66476007)(64756008)(66446008)(76116006)(66556008)(66946007)(2616005)(122000001)(186003)(86362001)(6486002)(36756003)(38070700005)(966005)(71200400001)(6512007)(6506007)(31696002)(26005)(478600001)(110136005)(8676002)(8936002)(44832011)(5660300002)(31686004)(2906002)(41300700001)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T3o2d3owSnJGYUFJU3lvc3VsbnFlamJCb2ZSK1p0QlphNk5jYXlxOFNTUVd0?=
 =?utf-8?B?R0ZQTGNTRGZlSHE5RWtxMVg2MmFXcWhXbklmOW9MMWkwTlpicHNZVGlhcUJk?=
 =?utf-8?B?dm1Ya1lGRzU4WmVzeXhPZGVYMmMwMWxtVmVvb1B6REJZUkJIWHdyWlk3ZDIx?=
 =?utf-8?B?bEgyK3pWQjArWFJSdStYcmpjUHBKaHZkL1g4RzZLR3pYeU1KZlozekhZTmxr?=
 =?utf-8?B?aHI4NGFPRnhubXUxcnhZQU81d2NMN3VHWm4xdE9YNFQ5WGw1b0JmdFlDZFdE?=
 =?utf-8?B?MzhwSmdwMTlQRTRTMkU1bytqYmUwR1BOd25xZmVoZmVsalI4RXF1SFUxb3hL?=
 =?utf-8?B?Vk8wc3VMRHFXK0xUVGJLS01PNUZkSGpGdGF5RzBycVdZUlVNeXlvRFp4WG4r?=
 =?utf-8?B?RWtYZGw5MGJLMmRBaDNFblNYY0NrTVA0UFd3dkJHZ25EVEwvcXU4KzN5elBT?=
 =?utf-8?B?eFBmTmV2Nk4zV3R4Q2RqVUpYS1VIa0hsTEVBNlJXVDViMU9BMlRZb3A5SDU2?=
 =?utf-8?B?RHhkRnZVaVFOMmdqREpick82N1pOR2tBNXlKTlBPbHRUemYyUElYNG50YytP?=
 =?utf-8?B?REZGeXMrK3kvT1hacG9VMmlPUStaWm15ZlJkWFdXV1hLZ045R1pRNjMzTlFI?=
 =?utf-8?B?bG9wQzVEajQrNHVtY3NWUCtRQ2JNZ2JCbXg4U2djbVNKcUdzd2UvQ2VGL2VI?=
 =?utf-8?B?NDFkYVdDY2dtU05IaUJ3MWlpWVdpVmxrZEhuTzRNYU5tLzh5RTZ4WFpUWkV5?=
 =?utf-8?B?Y1psTzRKR1BPWDdYSzJPL2dUU0N4VEtsUnN1MHVZWHh5cWVDaXdqMzNQUm4z?=
 =?utf-8?B?NnZiNEVGRWNOYTYvc3JFaU0velNSTmt0VVVXbjAxcFhSbkdLWHZXQ3pZN292?=
 =?utf-8?B?SEdTc1JqWXlpbkg4bjROR2xyVUNqbTk1K3N3ZHI3ei9VU1c2N3VaTUU2Q3ls?=
 =?utf-8?B?Z05mZWkyNHVmczNKWjI5ZVJUSU40SXpkUjcvZ2pzM1ZWOHdTTWxSYnh4Rzha?=
 =?utf-8?B?VUVxb29SOTdkVlZoY0dsTUQ5ZjVzdGpMbHNObHAraHVmUUFwVWlsM29IRFVX?=
 =?utf-8?B?VUNMUHdGZ3U4NmRSTjdaR1BiMUdDbFZEUE9STzA2Wk1mQnZ3Y0wxaktXNXVt?=
 =?utf-8?B?ejBCN0d3QTFlTWVjSVFDQ3ZQUFhSbHF2NGRVbUlydDMxL20xeG8zR3lKdHF0?=
 =?utf-8?B?VW0xRWI0d3d6ZjFQWHFkWFdlTXY1U1IrOSs2dC95R0Y2TUhYNlNSQWZoSm03?=
 =?utf-8?B?eVNsT0lyb0xDOUwvcXhkTThYU1ZLTW9UTVRUN0dOWTdpQnJmQnJzQnN2eHVI?=
 =?utf-8?B?UW9OdENHT0tUNXZpazZpQ1NqRHpaRS9saFBYYUNtTTBMS3JTYzExOUJOcU5H?=
 =?utf-8?B?NHFWWENmRXUwTFg3Kzk4R0o3WTFZQVEycnZxMTUzeHJ0Qnd6QkVnMk8wN1c1?=
 =?utf-8?B?bXNiMnZNZTlnZnpDWTUvY2YvZDJNNHVQbmszeC8vMG1sdXhVOW5UejdnNklp?=
 =?utf-8?B?eTY2M0I1aHdsUDU1R3BmbkF0QWxtR1EzUXQ1M0NzY0lYRGZycTc2NkdNUDhp?=
 =?utf-8?B?Vjk1dVNoQ2xCRDZxRFFMKzQrTDBURDVMSEFPTzdWTWp5VXBNdFd2TEVEUWVZ?=
 =?utf-8?B?YmpuQnE0Z2ZVOEtPRExQenNQZkZaa2prcXhoQUZGNTMxdXZxcmxuUzNlazdW?=
 =?utf-8?B?UlZjWXhnQXd0Q2hBMzhuczF0QkhaYUsrUjAvdmswb2svbGJuKytCRFd0TE9i?=
 =?utf-8?B?REk1NytVTWlYSEsxZjNaQklvYjF2bUk0anhva2NFMzI0U2x0ZEp4VGdBbWtV?=
 =?utf-8?B?aHRGK014VDMwQ1UwcDNRZjZrZWx2TmMxWUo2VkpOcTlXaEk1UVZzR0JsV1kw?=
 =?utf-8?B?MUZnNkZrTTZMbDZtVUo1eFZpb1N0cE53VHMzRk1VbkRSTDJxTzh4L2laWlFt?=
 =?utf-8?B?S0dja0JGMWt0T0tnblZyWDlpYjlxSUlSQS9qdWlLWDYwbHM1WkxTRW02aDhE?=
 =?utf-8?B?cWZEM09pbU9YZnBRTkxUR0M4SkpudUlpWEkwSXphWHpJZ05CTUNsWi83L0xi?=
 =?utf-8?B?MmNrSDIzSlM2UXU3OFBubUYvcGVTZzRtUEY0bXZpUllCMFNacG9xalVOK1Ra?=
 =?utf-8?B?eGdUMDdXdmNiQ2FxUDZxKzdzRHhZdHJHK09sRkR4QnZkcElmaDJJV3FoT3c4?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDD3C10143F69643AA24A5E62431EC4E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a898c8-10d7-49b9-a3e1-08db7df090a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 07:13:57.5417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9wuqt0v4b+keSOml9jESBOt9F/zIrOP5q7QARIlg2dmiX/AmesPfh1OcaVGkK4mof/DHXhA3+rEQ5RMFZX4TudIwVZfHqB05e8XAiSzuQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1776
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzExLzIwMjIgw6AgMTU6MzMsIFlhbmcgWWluZ2xpYW5nIGEgw6ljcml0wqA6DQo+
IFRoZSBvZiBub2RlIHJldHVybmVkIGJ5IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKCkgd2l0aCBy
ZWZjb3VudA0KPiBkZWNyZW1lbnRlZCwgb2Zfbm9kZV9wdXQoKSBuZWVkIGJlIGNhbGxlZCBhZnRl
ciB1c2luZyBpdCB0byBhdm9pZA0KPiByZWZjb3VudCBsZWFrLg0KDQpJcyB0aGF0IHBhdGNoIHN0
aWxsIHJlcXVpcmVkID8gSWYgeWVzLCBwbGVhc2UgcmViYXNlIGFuZCByZXNlbmQuDQoNClRoYW5r
cw0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBGaXhlczogYWJjM2FlYWUzYWFhICgiZnNsLXJpbzogQWRk
IHR3byBwb3J0cyBhbmQgcmFwaWRpbyBtZXNzYWdlIHVuaXRzIHN1cHBvcnQiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPg0KPiAtLS0N
Cj4gdjIgLT4gdjM6DQo+ICAgIGRyb3Agb2Zfbm9kZV9wdXQoKSBpbiBsb29wIGZvcl9lYWNoX2No
aWxkX29mX25vZGUoKSwgaXQncyBub3QgbmVlZGVkLg0KPiANCj4gdjEgLT4gdjI6DQo+ICAgIEFk
ZCBmaXggdGFnLg0KPiANCj4gdjEgcGF0Y2ggbGluazoNCj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDIyMDYxNTAzMjEzNy4xODc4MjE5LTEteWFuZ3lpbmdsaWFuZ0BodWF3ZWku
Y29tLw0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9yaW8uYyB8IDMgKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9zeXNkZXYvZnNsX3Jpby5jIGIvYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfcmlv
LmMNCj4gaW5kZXggYzhmMDQ0ZDYyZmUyLi4xYWQ5NjJkMzA2MGUgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9zeXNkZXYvZnNsX3Jpby5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9zeXNkZXYv
ZnNsX3Jpby5jDQo+IEBAIC01NTAsMTIgKzU1MCwxMyBAQCBpbnQgZnNsX3Jpb19zZXR1cChzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+ICAgCWlmICghZHRfcmFuZ2UpIHsNCj4gICAJCXBy
X2VycigiJXBPRjogdW5hYmxlIHRvIGZpbmQgJ3JlZycgcHJvcGVydHlcbiIsDQo+ICAgCQkJbnAp
Ow0KPiAgIAkJcmMgPSAtRU5PTUVNOw0KPiAgIAkJZ290byBlcnJfcHc7DQo+ICAgCX0NCj4gKwlv
Zl9ub2RlX3B1dChucCk7DQo+ICAgCXJhbmdlX3N0YXJ0ID0gb2ZfcmVhZF9udW1iZXIoZHRfcmFu
Z2UsIGF3KTsNCj4gICAJZGJlbGwtPmRiZWxsX3JlZ3MgPSAoc3RydWN0IHJpb19kYmVsbF9yZWdz
ICopKHJtdV9yZWdzX3dpbiArDQo+ICAgCQkJCSh1MzIpcmFuZ2Vfc3RhcnQpOw0KPiAgIA0KPiAg
IAkvKnNldCB1cCBwb3J0IHdyaXRlIG5vZGUqLw0KPiAgIAlucCA9IG9mX2ZpbmRfY29tcGF0aWJs
ZV9ub2RlKE5VTEwsIE5VTEwsICJmc2wsc3Jpby1wb3J0LXdyaXRlLXVuaXQiKTsNCj4gQEAgLTU3
OCwxMiArNTc5LDEzIEBAIGludCBmc2xfcmlvX3NldHVwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KmRldikNCj4gICAJaWYgKCFkdF9yYW5nZSkgew0KPiAgIAkJcHJfZXJyKCIlcE9GOiB1bmFibGUg
dG8gZmluZCAncmVnJyBwcm9wZXJ0eVxuIiwNCj4gICAJCQlucCk7DQo+ICAgCQlyYyA9IC1FTk9N
RU07DQo+ICAgCQlnb3RvIGVycjsNCj4gICAJfQ0KPiArCW9mX25vZGVfcHV0KG5wKTsNCj4gICAJ
cmFuZ2Vfc3RhcnQgPSBvZl9yZWFkX251bWJlcihkdF9yYW5nZSwgYXcpOw0KPiAgIAlwdy0+cHdf
cmVncyA9IChzdHJ1Y3QgcmlvX3B3X3JlZ3MgKikocm11X3JlZ3Nfd2luICsgKHUzMilyYW5nZV9z
dGFydCk7DQo+ICAgDQo+ICAgCS8qc2V0IHVwIHBvcnRzIG5vZGUqLw0KPiAgIAlmb3JfZWFjaF9j
aGlsZF9vZl9ub2RlKGRldi0+ZGV2Lm9mX25vZGUsIG5wKSB7DQo+ICAgCQlwb3J0X2luZGV4ID0g
b2ZfZ2V0X3Byb3BlcnR5KG5wLCAiY2VsbC1pbmRleCIsIE5VTEwpOw0KPiBAQCAtNzYwLDEyICs3
NjIsMTMgQEAgaW50IGZzbF9yaW9fc2V0dXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0K
PiAgIGVycl9wdzoNCj4gICAJa2ZyZWUoZGJlbGwpOw0KPiAgIAlkYmVsbCA9IE5VTEw7DQo+ICAg
ZXJyX2RiZWxsOg0KPiAgIAlpb3VubWFwKHJtdV9yZWdzX3dpbik7DQo+ICAgCXJtdV9yZWdzX3dp
biA9IE5VTEw7DQo+ICsJb2Zfbm9kZV9wdXQobnApOw0KPiAgIGVycl9ybXU6DQo+ICAgCWtmcmVl
KG9wcyk7DQo+ICAgZXJyX29wczoNCj4gICAJaW91bm1hcChyaW9fcmVnc193aW4pOw0KPiAgIAly
aW9fcmVnc193aW4gPSBOVUxMOw0KPiAgIGVycl9yaW9fcmVnczoNCg==
