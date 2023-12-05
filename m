Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA38A805190
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 12:08:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FyrjvOKK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkySG155xz3cTh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 22:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FyrjvOKK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkyRQ5YmTz2xQJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 22:07:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eydTrpMpvnJhzpC4kGceQYmAT7WZ1uE/Iw5BzEzznbgvVjcq9SS5FtKhPklLsP9zuQ2J+pQLDSFrkHKo0oiOdd6YRgQ2B8BaeiCWtndglhU2oOmssUvs2jpdoVb31V5qNfk2OtFsONDOYLt1aAHggS6NdJuTxxmnkkrpxCRFJ8w3bobEvRBP7V15ZS1WKiLqewW1uCZHuWWl28mMTLnOurDfOvkAG/gqrbEaChoqDW4iPw3eChR3SDogM73My+0jp4oPjjh9sgg6EYxjGynOEjbzDOtapIyu9oHWWwBoAgUwuhq+OSET2SnrffIzkRfZqT5NFLWmCcSEW/Kr0PFj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RYaauLOsfdFLItQ2A0/vdwS8vTJg/vB8BR/d2LTsfE=;
 b=CF+Eoz9icDsQ64t78CDxGcoxH2v3Euh95Y191thtO1Y9lLSt/y7vlnOSpB0HkbEtM0gRImt3rlK8UTh1LEnX2KugncIVTSdNSK0wBi5PdiiawMtautl5120ZNHHb8iMwE3feOsuDp8A5+STS9mtsnJZkYfo36CIVsMNfgGn/YDnUWrJZxDa+lbKM+VF4yIn35IHvp/5x/NPxp7FO/5uhtQC2eMZQMI2rdXuO74LyUKX7dZJPo3zNkn1d1bxJyLe44EC4mX/fdkNPSwNztJYGxH9HCWQh+YSEzjbKi69ufc5FF9W9vmpXfpa8nsR5Xc6Xlagy9nxZCD219FrN73Ip2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RYaauLOsfdFLItQ2A0/vdwS8vTJg/vB8BR/d2LTsfE=;
 b=FyrjvOKKIXsfgUFPh8JTbZvnm/+/CLRZGj9oUpr9ODrQ0aQlDFuuuIjsCofxHj6pAK0pmkb7rQmNNaVfheT1eT0WHrM+0zPKJGEsGhAylFcu55bZmPsnprMVm+fIl3BRDsEpj5/mjjQb1+WxdTdxP687DaYDCRq3XzAvucrFrNC/RiHhtmsMEBgOaORYtyeiBL9bZJN6LUuOGjvndPkreFoojlYwk/u3TZOneNNnU3Qg6X6cxetw7l5PV49oL7cIQ6Mz6umXV4KqNTjgs1VtptTeYrkR8OqlgNptl75Ifu2spiFxuTFE2sEfBvngpDlbsNzOA+fuNasTcDx7fG74xQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1998.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.24; Tue, 5 Dec
 2023 11:06:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Tue, 5 Dec 2023
 11:06:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/irq: Allow softirq to hardirq stack transition
Thread-Topic: [PATCH] powerpc/irq: Allow softirq to hardirq stack transition
Thread-Index: AQHaI4v/GaSM9UOZTUyS6175YVG11bCajzcA
Date: Tue, 5 Dec 2023 11:06:54 +0000
Message-ID: <5fde4779-04f5-4fd6-a8ac-9cb2cbf7409a@csgroup.eu>
References: <20231130125045.3080961-1-mpe@ellerman.id.au>
In-Reply-To: <20231130125045.3080961-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1998:EE_
x-ms-office365-filtering-correlation-id: 95a0ab78-798e-4696-4f8a-08dbf5824a9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  n8jyym/pCjfBWFjtUiJfaLRbg1B4xAVBR+mogo0oRcu1kjztkmNuFaDKbujp1CL02CjvcADvDAz69UzkGRV0BJzgPfxBdiownI4ax9p4oXqk+MLSj8YUpu/F3kB/nMfF77MM7Wm4z8kq90SEQtwYhHhb5W99bFqNmQeMgNR3ElKdrm+9iLAoXT782ZESxO77PvTbuRU6qjYRarzJ3I0OwtjIjCD5L+2zWEBVDe7IqgKKwlScrF65swOzcjsbLyTXEyBaf0+HEdcsUaraxwcPC3N2Fj6bWTe8Sw1OBlgQHlcUwK9ToK4Io3LvgWfcUlwjFCgWJBZpjawW/xh+Fis3x0kY2pxp005I8SPP9ibmkYAp51ArSZ4Q/DUQlpYK5j2whePTAFxtc95XXvp3dUd3SAUBqemFlGO2vgaik7Nk6P3WMA5ZTZ/eD7Jxde7yFU7VIsF8rPF1mo5K6uEPMxs82rvAhcm4aWzd2X66JHKET0166UItTtYMbWeUp7HRaoAx0RyN2DyzumXOP+oAXKTWRMqGFLbT5evpgsbN0AZ4+YdwwxN3Y1z2P/oUzjm2v/AKeEUrVMXG+c27nzslR9wKAL4bjHF4SoQghyReZWW6vR4ZfFHbHnNc7mxrBfwBDqAaqWoBLkj2vrG8ElL14oNjg4yK+LsujRNHSX6ajfGqzs/A1SMRx5TciLbYbTuImWQx
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(44832011)(2906002)(31696002)(110136005)(316002)(91956017)(66446008)(66556008)(64756008)(66476007)(38070700009)(76116006)(86362001)(66946007)(8676002)(41300700001)(36756003)(4326008)(8936002)(31686004)(5660300002)(38100700002)(122000001)(6486002)(83380400001)(478600001)(26005)(71200400001)(2616005)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VE1ZOERyQUZmMVRWWnVXaHNmaTVaU05lQzhjNVpYcndHTm9iQ1FYMHJnMDJZ?=
 =?utf-8?B?ZVFZNHJnNHJnc2pMN21oQWdXTndCdjF6Q0R4Z2lXcml0M3ZPemlVVEozNitL?=
 =?utf-8?B?T1V5UVltNUpKeWh5ZlZ3Y3V0bGdLL0dzWkYvZHp1anFwWExPL3RqN0NwU1F6?=
 =?utf-8?B?N0FCcFE1YnJYeXFiRjJtR1dGZngrZG56SzFxVllZWG9YZ1BmdzltWEZtUE9E?=
 =?utf-8?B?eGpZVEY1OVUyWlBqV1U3bXFaV1hoQnRrT2hWNGNHZGIzdDhYSnV6SlJHUWtD?=
 =?utf-8?B?VGsyeG1qbWtLTWh2YVZiTXFkSVNna0Uzb3lkVUMvMTMvUkxjdjIxN0N6blNI?=
 =?utf-8?B?QmVwcEJvakxkL0hmTkRla2lqemRZcHkxYjFLS3dzMHdUSFc4VjJXUGlkOHBZ?=
 =?utf-8?B?TVpsQ0pPU1FCcEZLN0krd2x1R243V3h2ZlhkdVQvNWFtcGp4UUVCYUxCRkVy?=
 =?utf-8?B?aEpJaVEvTnRBeExLK1lIdCtPRWNGMm90cEJVU0xFeWxTaUtpbFVZU2gwSjk4?=
 =?utf-8?B?WFIvRTlmczhOTmdWS2hFMjBGNXZkNnAzbURHUmVHc05FS05IbGtiNmJxcVZH?=
 =?utf-8?B?MTNrRFI2VDduSUVuOWJmdkYwc1JRS1hxN1VqZlk5UVh1eS9zSnNxSHVBY1Zj?=
 =?utf-8?B?RXBkRHpMNFgyaEJlVzdLa20yTUQxaENvSytCc3RublFTc0pSMmhEMVhYNkNa?=
 =?utf-8?B?US92UDg0d2JBZW4vcDFrSmR6ay94aE9sOUVDRXg3d1JzY1lVQ3pZNWgxb3Jt?=
 =?utf-8?B?c05GTWJmMDBhUHppWDQ0QUFCVU8xdVRBeUNwRitZNkVaRmp5Z1FHb2xNZzBE?=
 =?utf-8?B?aGpkVFBWM0Jud0RGNEJyOE56ZHFTWEdnWlFTSXJySnFhMXpKTHhwYXVjWkRB?=
 =?utf-8?B?cTNVOHZ1UUpacmFlNGVvS284TXdBYUJXT0FGcjNJT0QybFVvOEJCNzNhaDR6?=
 =?utf-8?B?TE9jZm9Zd3hkeUZzQm15WmZLTjFVcWZVVmsyNVdRak1SS0kwZDZPRUxsQlFu?=
 =?utf-8?B?dnBRSG43TU9WWXpPR09qZ2VqajhFZzRNV0dDQXdJOVR6SUFMWms5UE1vd2o5?=
 =?utf-8?B?bXlUZGRXTW9WSVNrb3RXUlNDUURLMDJwNXowcVgxeUY2djFPTjFCcDliUFln?=
 =?utf-8?B?ZUU5ODlkd3hxdjY3dVY2RU9JT0R0THlHQ21mUmUzbDRBM1AydzhTR0g3MHZE?=
 =?utf-8?B?R2VtRXFNRmtjWDVSLzBrc2RoUVFMZFFnNVV6Ni9sU0FweHh3L08wbjF2Sjdx?=
 =?utf-8?B?ekV2NHM0QW9ocllvWStrOE0zaXR1L0g1N255SmFDMGFZUUdtRHZXN2FNTmZD?=
 =?utf-8?B?RXo4bnRGdVl6ZlBDTWVZZy9YbjYvb3ZoWHM4dWRNUUpwRUI3N1d2MDd6cWpT?=
 =?utf-8?B?b09nNUVhRHFmSGZYVElnSUp2cGRRU3ZmV0NmQVEybnY2eitNY0FlcXg5SmY0?=
 =?utf-8?B?dXRuNXd1WklIMDFZRGpmZlR6VFEzUEdvWTFkR0VUSUZ3enczOUIwK0pPMHRX?=
 =?utf-8?B?cWp4bnQ4UExyNzNOdU8yd0g5ZTlYT0Zva2hwcFB5cTVuTW9OWDc5akZVV0Fq?=
 =?utf-8?B?VzA4T0JqWE1JNjFoSlRaTnJPTVYyVlhFaER6NGc1ZlZiemVYK3dGZ3NaaXNR?=
 =?utf-8?B?WUJSd0hZTG0wTkF1L2tnOWh3Z0x0R3J3NkIzTUxjQVJlL2orbEQyZ2E4VFRG?=
 =?utf-8?B?SFRDRlAvKzBrYlhGYVFNVStMbFpHRHhGd3Blc2x6c1F3Ukt5dGdheXMwQi9D?=
 =?utf-8?B?aVZzcWdmWEFqSkJsMm5xYTBlVktiR1FSSnYxOTR6SWRwa294S0JjYldDSVc1?=
 =?utf-8?B?aUZseUprTkI1V00xVnZPUkpwdkFaM3NSWGlZRUFHSXdGQlpEcm9RYWRZMlZi?=
 =?utf-8?B?U0RmU2ExTlY1Q0hhSk5JNnJZeGF3WUZ0OVhPOG51bmNrK1kxbW9lN1ZnQU94?=
 =?utf-8?B?akJXWnpiNm8xUUFHWkdXWWdYQ0RHZTZNSENKbWJ5MmtzZXE0aWVUMUJGRGZ3?=
 =?utf-8?B?TkdpVGc3TlJwb01lWVVJR0I3TVczMmZFUDJvb2N0N3prVDNoQkZVQXR4aURJ?=
 =?utf-8?B?amE0SUlyakdxZm56VnR4ai9pbGsyRDhrQldHS1RaTjJsbjIxc1JNd2dZRzYv?=
 =?utf-8?Q?rtfyn4SgbC1QxgEqQW6nRvVrq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C60718750F82EB449D20A0762FFEB03C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a0ab78-798e-4696-4f8a-08dbf5824a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 11:06:54.9133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zJnkYNtx3Yj1mZqWirVslqh3Trz2P1Hcidf1WaepHJmzTwZcv9/xCSl6jEWCD6R34ZkWGuZkyhlHzFr1NqChIwk5qlYDAx12ln29+YqsFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1998
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzExLzIwMjMgw6AgMTM6NTAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQWxsb3cgYSB0cmFuc2l0aW9uIGZyb20gdGhlIHNvZnRpcnEgc3RhY2sgdG8gdGhlIGhhcmRp
cnEgc3RhY2sgd2hlbg0KPiBoYW5kbGluZyBhIGhhcmRpcnEuIERvaW5nIHNvIG1lYW5zIGEgaGFy
ZGlycSByZWNlaXZlZCB3aGlsZSBkZWVwIGluDQo+IHNvZnRpcnEgcHJvY2Vzc2luZyBpcyBsZXNz
IGxpa2VseSB0byBjYXVzZSBhIHN0YWNrIG92ZXJmbG93IG9mIHRoZQ0KPiBzb2Z0aXJxIHN0YWNr
Lg0KPiANCj4gUHJldmlvdXNseSBpdCB3YXNuJ3Qgc2FmZSB0byBkbyBzbyBiZWNhdXNlIGlycV9l
eGl0KCkgKHdoaWNoIGluaXRpYXRlcw0KPiBzb2Z0aXJxIHByb2Nlc3NpbmcpIHdhcyBjYWxsZWQg
b24gdGhlIGhhcmRpcnEgc3RhY2suDQo+IA0KPiBUaGF0IHdhcyBjaGFuZ2VkIGluIGNvbW1pdCAx
YjFiNmE2ZjRjYzAgKCJwb3dlcnBjOiBoYW5kbGUgaXJxX2VudGVyLw0KPiBpcnFfZXhpdCBpbiBp
bnRlcnJ1cHQgaGFuZGxlciB3cmFwcGVycyIpIGFuZCAxMzQ2ZDAwZTFiZGYgKCJwb3dlcnBjOg0K
PiBEb24ndCBzZWxlY3QgSEFWRV9JUlFfRVhJVF9PTl9JUlFfU1RBQ0siKS4NCj4gDQo+IFRoZSBh
bGxvd2VkIHRyYW5zaXRpb25zIGFyZSBub3c6DQo+ICAgLSBwcm9jZXNzIHN0YWNrIC0+IGhhcmRp
cnEgc3RhY2sNCj4gICAtIHByb2Nlc3Mgc3RhY2sgLT4gc29mdGlycSBzdGFjaw0KPiAgIC0gcHJv
Y2VzcyBzdGFjayAtPiBzb2Z0aXJxIHN0YWNrIC0+IGhhcmRpcnEgc3RhY2sNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCg0KDQpSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0K
DQoNCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2lycS5jIHwgNSArKy0tLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9pcnEuYyBiL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvaXJxLmMNCj4gaW5kZXggNmY3ZDRlZGFhMGJjLi43NTA0Y2VlYzVjNTggMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC9pcnEuYw0KPiBAQCAtMjg0LDE1ICsyODQsMTQgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2
b2lkIGNhbGxfZG9faXJxKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB2b2lkICpzcCkNCj4gICB2b2lk
IF9fZG9fSVJRKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiAgIHsNCj4gICAJc3RydWN0IHB0X3Jl
Z3MgKm9sZF9yZWdzID0gc2V0X2lycV9yZWdzKHJlZ3MpOw0KPiAtCXZvaWQgKmN1cnNwLCAqaXJx
c3AsICpzaXJxc3A7DQo+ICsJdm9pZCAqY3Vyc3AsICppcnFzcDsNCj4gICANCj4gICAJLyogU3dp
dGNoIHRvIHRoZSBpcnEgc3RhY2sgdG8gaGFuZGxlIHRoaXMgKi8NCj4gICAJY3Vyc3AgPSAodm9p
ZCAqKShjdXJyZW50X3N0YWNrX3BvaW50ZXIgJiB+KFRIUkVBRF9TSVpFIC0gMSkpOw0KPiAgIAlp
cnFzcCA9IGhhcmRpcnFfY3R4W3Jhd19zbXBfcHJvY2Vzc29yX2lkKCldOw0KPiAtCXNpcnFzcCA9
IHNvZnRpcnFfY3R4W3Jhd19zbXBfcHJvY2Vzc29yX2lkKCldOw0KPiAgIA0KPiAgIAkvKiBBbHJl
YWR5IHRoZXJlID8gSWYgbm90IHN3aXRjaCBzdGFjayBhbmQgY2FsbCAqLw0KPiAtCWlmICh1bmxp
a2VseShjdXJzcCA9PSBpcnFzcCB8fCBjdXJzcCA9PSBzaXJxc3ApKQ0KPiArCWlmICh1bmxpa2Vs
eShjdXJzcCA9PSBpcnFzcCkpDQo+ICAgCQlfX2RvX2lycShyZWdzLCBjdXJyZW50X3N0YWNrX3Bv
aW50ZXIpOw0KPiAgIAllbHNlDQo+ICAgCQljYWxsX2RvX2lycShyZWdzLCBpcnFzcCk7DQo=
