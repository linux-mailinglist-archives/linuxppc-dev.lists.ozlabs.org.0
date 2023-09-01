Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25F79018D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 19:41:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=E6/vhSdp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RclhN4DPSz3c86
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 03:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=E6/vhSdp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RclgT2S3kz3bxH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 03:40:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHQnnySgmEIKN/qXEfoM7hPQEX8IPccxwO9qY6Z2hwy1GSEzAsE0q1j6iOgcToTN/GvTHshJt1MTUlshhqegYAG6b/ttez0K3CCjEVGduTqovVp0MTPpx+rYsz3rnMaderxH/lMfh4VYN3YCnO/5aM7xw5xy/2j5XgjLS9BNoPcCb+RB8+/9sziETe0PotTkS0YNlPb8eNo5nQKzcIxO9jbLhSMCMJSwIFO+2todBJJ1Zn94MeucSy4Mr49OvYI6NShrUIDVT4niqjGh4oc0dFHIDlpkUxsvEgDkIurTYgZQOWIBrayLwPNG8UOaA9i0rUQrT3EL6u65c+MF0Yn8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDaoS/EAtxYXPitkSJet9nNcxxDslPkI5qYFlD1ECSk=;
 b=agns/+asLRWPLpnmXG+Ut1z51C6s9gj6aX6GLv+tpnDDRz0WoZ7VIkZJtICMV3upfCgIrbPJmTg5D1ULE2K0xY6MBwJWX645hJTXi2PWHIWQFhm8gtw5eAcf7DCqF4ZHS9RDeZ6V5KKJiPq3l2FUIARIZLMxkz0kLjuac4IQSmopgo1dJjWlLJ4iDFgLOg+pcfwnRnaf+c6DzVD7Xp+nOZERIOytckQLOfaX6hh2lawHXlpOvXyY2NohJwUl8CYpYotm/BU/na+eBxJiET/Tc1lTv31ZzY5SNQD2LSIXHRP+JgVVtp+/hffMoMZop2bn2V3J6eo64aprhwp1qSwiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDaoS/EAtxYXPitkSJet9nNcxxDslPkI5qYFlD1ECSk=;
 b=E6/vhSdpoRn9Ro7T50AVgYYsv5iJcM58j9UrRECzdSGcVsGqL5UEQkflNJMidvB33oSNQqlfBC3WzwrB8KwPIwU6zePW9SwpuaVUTb8R10JqWOC7GNNursucuwYT97IP84ESxpM12ZdTV6MSjzIOpyyJhGFHX7/Rnk3RtohnoBNcew3yaGPay1hafM/ERQ5BN7saIThSFKF+RPwbRX8jbwlTnug7OYnQ9mjTIFcU0bRnw3tO2OS77gbWDSUHfNIF7EbFb1EkNh906xMEwI4j8LZEaI6Sa7audACdqBe9uxtEazrKsemm4JYoe4Ah3oRAoUv1acJtzPFzfY7n0gHK1g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2463.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 17:40:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 17:40:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "mirimmad@outlook.com" <mirimmad@outlook.com>
Subject: Re: [PATCH] powerpc/powernv: use appropiate error code
Thread-Topic: [PATCH] powerpc/powernv: use appropiate error code
Thread-Index: AQHZ3PiH8XnMX/4C4EClLtCpI6xQl7AGPNwA
Date: Fri, 1 Sep 2023 17:40:31 +0000
Message-ID: <fdb8d83d-84ce-76d6-db9a-bb232492170c@csgroup.eu>
References:  <CY5PR12MB64550ACC0B90FDD120D21E47C6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
In-Reply-To:  <CY5PR12MB64550ACC0B90FDD120D21E47C6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2463:EE_
x-ms-office365-filtering-correlation-id: 1afbcb7e-b3d9-419d-69f1-08dbab128a3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  scgqevn82Lj58qlpeuUWJ2tc/kCQhSQ93L+WcT/rtgtoHfsTJ+ca1/aKdaUM+qRR5MD8aGIvhbPvNWld1O3VWWPZnCRVuklDvUQI90sbrD4aSrTEGIPZ46jP7Gkwmv0F4QtMrxT3c3BtDvmTokhlcJyMJg/66ToZ5cnRvzg8SZ1BtRriwV1q91GXCfUDCRinfZAnU/utqai5zfz9VT4X/vNwY4gfzK+X1CmZocG038Ejds5AIK1PRCiahPhrZ/apRSC6+SRWbMcrkOmM0RjtiB/zLMUczIhjFKpJzGcYFg4edfZu0K1ipZsCU2wG4hmjK+7vGf5NpvxKC82zDoCAfSKHjxVE+0PsUTVLWSTyzRCsNhEy4JA2Ul97Sfvkl9C7jQ5xWJY+8rjkHBUh5WiUvQoD/PqBMvXhG0Kvjbs6EqJpkTlMu02DW45vyj1RawrdRaKQA/YkyFa9613mpat/EiUBlN2rORQr/c9wzcsMPnEEJa0VwSNEb80wVP6mtvifnNZ/Lv5oIZvGYRderAP6xH20lCu3F8La5rlWvkubWeNhuGJat5vJCANxMVEph+Smm117k2Q6kcLfV4IDSnpZz5zcxDypn6CPkT3nFxWwNNOO0xtRCRGuVhFz4q1rYoQEAicSxlkyTx84vcPHOsyY08W8JKktHJS1TXyuzQWduhyfxXpub/WnzJLyEKS4GmKS
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(366004)(376002)(346002)(1800799009)(186009)(451199024)(2906002)(6916009)(316002)(44832011)(41300700001)(5660300002)(8676002)(4326008)(8936002)(36756003)(31696002)(86362001)(31686004)(71200400001)(122000001)(966005)(478600001)(66574015)(45080400002)(2616005)(83380400001)(26005)(6506007)(6486002)(6512007)(76116006)(66946007)(38070700005)(38100700002)(66556008)(91956017)(66446008)(66476007)(64756008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YVdoL0JQZlhsU2lISlFiL0VxQWxXVnBYNVBtR21HNHVUWUk2NWs2TGJ2eHA1?=
 =?utf-8?B?OEdjb3A5SWI1aEpsZUt0S1NHWWhPbWFxOGkxN0IvU0xjV1M5dlY2QUhxTksx?=
 =?utf-8?B?SjRFTTdKbC9jRkNBbzZlWXZBc2FuZnhmVVdWZ0VYaE1BN3p4WEJFaTBZU1J3?=
 =?utf-8?B?M0hUVXR4cGxpV1BtZ3ZxZGtUK3JYZjlRcUNGTmorU0FzRUdQQnBrdElDSXdv?=
 =?utf-8?B?M213N1V3Y1NYMmRQT1B5czEvY1hqMzVkN0gybkJNODlRNDc2MS9YdFplSEgv?=
 =?utf-8?B?cjh5d1JwL2gwT24rTFo5ZHJueXlkZUJGL05ueFgxa0VkelZubTZkWHk4aXhE?=
 =?utf-8?B?SVExQ3FmTHN4OHJWc1RTVmZYVDNla2o3dVZnTzdYTnhaRFJFVXE4ZElxRzFn?=
 =?utf-8?B?OXZSd3NWM0JrOEZWT2N4emRrczZQSDR1b2t2WXJuSGNKTENMQ2x2d3Y2ZjAw?=
 =?utf-8?B?ZzVFcUVxcWFwOXNoZVZUVHhJNEQ0UW1Ebi9rdVBneE5GanpSbnIyQ1hqZ2l4?=
 =?utf-8?B?ZWROSlJKSkgrQURrWGlUYXlya3JCd0JLK2JNcFV2WTFkS2gzZnZ0L0dWaU15?=
 =?utf-8?B?b3VVcjZEaTZwM0EyQWIxQVBtVFozQ0RHRFR4QWpyYjgyaGxGWjExZkpWZjlC?=
 =?utf-8?B?NkZSTWtwM081Rlh3TFhtRmdJeXIvTW9IQzgrL3l2dTFOUThqYTBWSnQvdlhX?=
 =?utf-8?B?UE5DQjJXcWtEVVluNUcwZEJoREF3WS9WdmlSQVVzcXZTY25qVEpSOStuclBr?=
 =?utf-8?B?QW5QclFTYmpzbFROOFVqU1kvK20rOXlITjBOTDVaZXVuczBLNThXcHd2Ym5R?=
 =?utf-8?B?Zy9wMUJTb2QxVEhTQ2pPc1Z4d0wxSUtoM2dSTXhtVndPTlcyazdjRW93ZEov?=
 =?utf-8?B?Q2RFeWNwMHVSMWIxK0ErYmZsWGJ6T3ZaYVdmZjBPempaSzZDL2RDUXpJSWFa?=
 =?utf-8?B?YWcybWEvUThLN1ZQRHRoaFF2dU5Uai80d1RTNnVodno2Y1VMNFFNSkNlbWNQ?=
 =?utf-8?B?K2VvRjh4cmE1TjBmejdNNVRMb1FRVk1xcDVNVHJlQjFTNGJFOFNBZUIvU2Zt?=
 =?utf-8?B?SFRON1ZBM0M5VWhyRnZHVFExdzhmeTI3YXR1ZkI4M0l5UmtWQWxBaGpDUTkz?=
 =?utf-8?B?TmgrRC80bjVZZjE4QjBkZ1FnT21IRkd4MlZIZ3FNdTUzUnNIV2EzUTAxWSta?=
 =?utf-8?B?ZStrOCtGVm1QRXBkc3k2OENjREw5Zmp0cWVoZlAvZU1PcDFNYWFWd1FxZFZO?=
 =?utf-8?B?U3JxMHRFTlBOU09pTkFuNUJzb2xTY0lmazU4dU9oV00vSVFQZldPT2ZLcjBS?=
 =?utf-8?B?REpIR2Y4MlhBVHdCOUVsbnlPSHF4MU9yZFN3UFJRajJmRXNzVnAzaFk3UmdM?=
 =?utf-8?B?akpVVlkzRUFRa0hEdjJYZUM5RmlvMGU4NHdrSlovcE5SZUJOZzU5eHhoWEVl?=
 =?utf-8?B?d3VsMnh3S3BYeWgxTTcvTFhTaDN0eEZGSTFIN0ZJTVc0cnhwT3ZOandEWXlX?=
 =?utf-8?B?bXpGS212YkYxR3Q0dFdZWDEzd2VONS9KNERCZkpWb0IxQVpYbmhzdDBaSStO?=
 =?utf-8?B?K3pWdDR5S2pzOVVTWWNVUEJ1cGZjSjE5SVBhQmtVUFZJZzFHSURESFAxQmUw?=
 =?utf-8?B?NUhuWUZrMU5ZUFVzUWxOaVRESys1VGo3NnJ0UGkzV0V1OVBWZUZ0SXpzbzlG?=
 =?utf-8?B?aDVNT1pSdmRTVmVnTjc1cWE1VHRBYU9vSXVKcTlKc2FsczJGWHo4RmtZM1dV?=
 =?utf-8?B?THhIU0tIWWc4STBlSUp3d0pzZm9nN2lOaWRxMGlQQmxObzhucnMwQkFnSmNE?=
 =?utf-8?B?Y0luNENoUU5Pekl2MkVqT3Z6djZVWjVKWjJ1OTRoOTQ1TlU1TVZDQ3I1bGJB?=
 =?utf-8?B?dDRMOXRyR0tMZUlGSTNMRHR6K1hmTDloeXFScm0xTFZha0JmQjRUc3lNMmZp?=
 =?utf-8?B?blBleTdSUzBBZ0E4ZjAzM0QxSGwxSjMyUklXd0c0Q0wvb0ZQcVZhZVJkTGRF?=
 =?utf-8?B?NDJUQXIxaGlCbUdjSHVtNTVtOUllZldnbkRSK045ano2N2UxcTFTd0srYm80?=
 =?utf-8?B?SHNuWGdTZzZObkViTWxybmtyUnFvOS9kRXFWRkhYM21ObU9WdTEyczcyRmtw?=
 =?utf-8?Q?TF8gk330jwJ7/Z4hm5Nx8sQ6B?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93014B6270F5A342B56D922C59C74731@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afbcb7e-b3d9-419d-69f1-08dbab128a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 17:40:31.9364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TEwt0BX29OuZiLNVvcXjLFDtcpUeZ8DkN3WwZ3j5fQLkYI4SBLnYoNpMTKC//lNUO/nKm2XFgPRrrofhg/C1ouEMkeV26bvNGmPH8cJ7O8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2463
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjMgw6AgMTk6MTksIG1pcmltbWFkQG91dGxvb2suY29tIGEgw6ljcml0
wqA6DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG1pcmlt
bWFkQG91dGxvb2suY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDD
oCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4g
RnJvbTogSW1tYWQgTWlyIDxtaXJpbW1hZDE3QGdtYWlsLmNvbT4NCj4gDQo+IC0xIGlzIG5vdCBh
IHZhbGlkIGVycm9yIGNvZGUuIFRoaXMgcGF0Y2ggcmVwbGFjZXMgaXQgd2l0aCAtRVBFUk0uDQoN
CkNhbiB5b3UgZXhwbGFpbiBob3cgaXQgd2lsbCB3b3JrID8NCkluIHNjb21fZGVidWdfaW5pdCgp
IHJjIGlzIGJ1aWx0IGJ5IG9yaW5nIHRoZSB2YWx1ZSByZXR1cm5lZCBieSANCnNjb21fZGVidWdf
aW5pdF9vbmUoKS4NCldoYXQgd2lsbCBiZSB0aGUgcmVzdWx0IHdoZW4gb3Jpbmcgc29tZSB2YWxp
ZCB2YWx1ZXMgd2l0aCAtRVBFUk0gPw0KSXQgd2FzIHdvcmtpbmcgd2VsbCB3aXRoIC0xIGJlY2F1
c2Ugd2hlbiB5b3Ugb3IgLTEgd2l0aCBhbnl0aGluZyB5b3UgZ2V0IA0KLTEgYXMgcmVzdWx0LiBC
dXQgd2l0aCB5b3VyIGNoYW5nZSBJIGRvbid0IHRoaW5rIGl0IHdpbGwgd29yay4NCg0KQ2hyaXN0
b3BoZQ0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBJbW1hZCBNaXIgPG1pcmltbWFkMTdAZ21haWwu
Y29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC14c2Nv
bS5jIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2Vy
bnYvb3BhbC14c2NvbS5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L29wYWwteHNj
b20uYw0KPiBpbmRleCAyNjJjZDZmYWMuLmNlNGIwODlkZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L29wYWwteHNjb20uYw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC14c2NvbS5jDQo+IEBAIC0xNzEsNyArMTcxLDcgQEAg
c3RhdGljIGludCBzY29tX2RlYnVnX2luaXRfb25lKHN0cnVjdCBkZW50cnkgKnJvb3QsIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqZG4sDQo+ICAgICAgICAgIGlmIChJU19FUlIoZGlyKSkgew0KPiAgICAg
ICAgICAgICAgICAgIGtmcmVlKGVudC0+cGF0aC5kYXRhKTsNCj4gICAgICAgICAgICAgICAgICBr
ZnJlZShlbnQpOw0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIC0xOw0KPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FUEVSTTsNCj4gICAgICAgICAgfQ0KPiANCj4gICAgICAgICAgZGVidWdmc19j
cmVhdGVfYmxvYigiZGV2c3BlYyIsIDA0MDAsIGRpciwgJmVudC0+cGF0aCk7DQo+IEBAIC0xOTEs
NyArMTkxLDcgQEAgc3RhdGljIGludCBzY29tX2RlYnVnX2luaXQodm9pZCkNCj4gDQo+ICAgICAg
ICAgIHJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoInNjb20iLCBhcmNoX2RlYnVnZnNfZGlyKTsN
Cj4gICAgICAgICAgaWYgKElTX0VSUihyb290KSkNCj4gLSAgICAgICAgICAgICAgIHJldHVybiAt
MTsNCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRVBFUk07DQo+IA0KPiAgICAgICAgICByYyA9
IDA7DQo+ICAgICAgICAgIGZvcl9lYWNoX25vZGVfd2l0aF9wcm9wZXJ0eShkbiwgInNjb20tY29u
dHJvbGxlciIpIHsNCj4gLS0NCj4gMi40MC4wDQo+IA0K
