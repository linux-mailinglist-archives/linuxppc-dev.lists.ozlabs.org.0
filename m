Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407B14D1B40
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 16:01:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCdn50JRGz3bk2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 02:00:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::631;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCdmd0Yhgz2xF9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 02:00:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euJTB8mzMhf8rwlipDBiokqAh6yc7yVJ5exOxkwaQDmUi4Rdy3xt1XFB9T3zn4MqLy7K4SNJifVBdpR9UNAsIMUeV1WCVIIqWBLr3tqBm2oqnR4fPJX0wPClXixc25pirHa7lbO7u4ajNbRVC+6n60cr4YbpONfnKTOa0yy7b2683g4OYArHgGkiXjoT+W6U3teTwAkrV6FSgFiXteD8RU4+1pMRuxvaqXl5NgoG1rlyoTdZinK0WXiIHvASfpVBS+ZK00sFmICMxFAqNkdlEucp90S+Hu9rrYuWzTdX2t5RjHklMI9aABCgizg9qHlii+MOU1K7oFopDOKLMApbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfEyOGpHhIL6TIUDeDuopWhFEVMhEcaQ7r4VdRhEFc0=;
 b=ZIs81xsiQRIbL2e2b65D00SyecJ0SZQd1ORVmEAiDsKrXYtc/6x4GmE4G4JmjVV+ZmDt/I4KWsxyqxOg8Mq7mKo2xervE18v3n0jEM/Y47Pm3dwaXf34U+Oo82e012s8hcdX7MlQyzY+j0XEaqh2kp/MRNJq1sIuxkZvM884rcdpyaqkTXek9fVHLbw+v9UsvluLfB41/qtWDI9XUnIZdLtngsYJS73pfXgA2WwRurHtmnR0GEwBwTCaUSirtSyfhW75KCF2hvBP753JfPPJYYoCf+g5C+nunJ0NpmjT48BbW6rS7+2njM13LGQHhKLtiKvIIiNuTcg16wlOVAnwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1672.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 15:00:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 15:00:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hangyu Hua <hbh25y@gmail.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "peng.hao2@zte.com.cn" <peng.hao2@zte.com.cn>,
 "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Subject: Re: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
Thread-Topic: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
Thread-Index: AQHYKINXBJ1zcwXxM0+BDeqd/qE4OayzN/cAgAJxbgA=
Date: Tue, 8 Mar 2022 15:00:11 +0000
Message-ID: <7f569012-bd1c-b03b-21c6-051dfa50f231@csgroup.eu>
References: <20220223070223.26845-1-hbh25y@gmail.com>
 <146301ab-e217-6984-1dd4-0d782328d7f0@gmail.com>
In-Reply-To: <146301ab-e217-6984-1dd4-0d782328d7f0@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0db6cb9b-cbe1-43f0-27ec-08da0114584b
x-ms-traffictypediagnostic: MRZP264MB1672:EE_
x-microsoft-antispam-prvs: <MRZP264MB16727FCAA985E9394E8975BAED099@MRZP264MB1672.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 284ypTrVHZK+8RH2auQyP4yBM3O3MCMv2kEzYDhORUIWqGvMLmftHfMuBclL6ootrABWh4V7cgPcCoDlbtrrt0B456VLdITxT080DWRc+fFInhPDoRgNwknu7QzA5k3GgA+VHvdyJPYY7ZMuXzzanULCDZayDuxM2aS0EOIp2s+NzXFQDQSRy6Z1OUKzXfk6RsC+jei5PXm0ineJXbfFPnts6x5DiiKcMW29xbffeXjfShh/+Y17z6HOI/2tNIsHgqB6jB65zhRFi+1/iU0MAGxuXhiErBKgloW6NEDME+vUIxsgVvNZyXSAm9mxm8EkCOQ0W1IxzPQqGnyjqZY3e7MvYseJ4Atg16ZB7dXu6I6zrfqdjv9ORVDq2BAWNuvgqCDEbMhkIED6Ib9F9JtPJRrKvGTThKNyY2V+QFS+B7Ub2Qx5fE/g5+iyVxijz98lAlL2moWWTbTLiP6BUZhcyvS3D74SuQmKTP1VPsKZ0KIT0kLPGBqXPnKluqNSSreM6Ey2UAtGLU5lTxhJKmPnKtXkTkCOhPfsliFNUFDscoH0pDEAO2J429TpDiCoKvCwq9e5G2nhrf2WVAOAk6f+G6CT2yM0h4a5eGuS/FHAJkgUquu+oC4fJe7u0xdFJqvYvN4kTgVXfWbNR1swl+ldiabNzruZJfbe0j90eG89J1GxMwWjt1JLqXW4YDHRdG/wksLjclfMT3gGeJLfVjkaTXw7+H2NocNWBYytYNisiH7PjmlJcg1REbeacSesuZRkLknXBYVteb08qASX0KFCWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(26005)(316002)(122000001)(38100700002)(71200400001)(4744005)(6512007)(6506007)(53546011)(36756003)(2616005)(54906003)(186003)(508600001)(6486002)(86362001)(44832011)(31686004)(66556008)(5660300002)(66476007)(66446008)(64756008)(38070700005)(4326008)(66946007)(8676002)(2906002)(76116006)(91956017)(31696002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anFNNWxEWlljWVBTTGZMT0JPd05Eci83N2lWZExwTjRyejkvQjNIUS92ZkdF?=
 =?utf-8?B?U0hTTzdtckk0NEFrbnBpemVSbUovN2w1aXVEbDJXcHF0Sld4VmthWDAyOFNR?=
 =?utf-8?B?c2VkOVVlaFVQazdhTlFwTkpZTzFkelE5UnduZUwyNmxEWnZybTA5anQ0ODNL?=
 =?utf-8?B?biszd3lRaUlPeTZqVUN0S1NxRHNXZ1FMUVVrUm9ZVHordEc1YkRiV1g2KzQ4?=
 =?utf-8?B?TTBETzNiYXRFRWptc09zVFB5VllRRktxRHd2N3puY2Y3SEY2TDRlZmRaT1I4?=
 =?utf-8?B?TFBUa2g2bVIzSGphRDZxTDlWR0FBZk1mOVViaU9oZGRIZGh4YVRtMHpLT29K?=
 =?utf-8?B?S01Yby9BVEtTejV5QWlGOFZDWENscGJSRUdFNGlieXhRaGYyZjJUaFgrUy9N?=
 =?utf-8?B?QlNmVFFSWU90VjBmT1VFUGVEaklZRzdHS2pBUjNQQk84RDZCY0RZNExzRTBX?=
 =?utf-8?B?ZzlINU9MTUVkY3NMcm9NSVd2L0NqLzRlbW43TWhwaldYYWdnakFVNXNZUUhv?=
 =?utf-8?B?MmdFbVVNWWtFMzEwUkhkcmhSUjMwbGgzWTZrNUhUS2JuOHdXaFVBdlNSRjhw?=
 =?utf-8?B?VjMvVUlKTmhwaDFHalhPeTE3YUxMbkw0NU1sejVidUU4NUxoQ0FORjVuWTVQ?=
 =?utf-8?B?UkFpZlVoQy9sMXloWUdoYXprZ3d3anUyNk8xVGdaSWRpc2s5T0dnZHNoVEY2?=
 =?utf-8?B?cTRSUE5xY2Vhc0tPTHAxbUZ3Ukhwa3NmdDYzLzk3THFOcjJsc0x3OTI3eDhh?=
 =?utf-8?B?UWRLdDJ6aTJ5TU9TSmhUZ3JIdDgwbEN2ZkNOdTRlRE9wV0sxTWYxV0toakRH?=
 =?utf-8?B?cjVHL0JzUW1PYUZ5SnltMk0xcXFvbzRNYlBqWWJSdkdTdkRCVW93NGlaL0w2?=
 =?utf-8?B?SW9zdktLd2ltSEMyZ0VYdFJmNG03WmxKUURkenh1YkFzbHZOZnZmMGFFclFD?=
 =?utf-8?B?dFZVbzFCNGU5OC84RVI0dzZRWEhwZmNwOUtoZGhDVjJ2TlVDbFl2YTI1NVdo?=
 =?utf-8?B?OTg2elZ0emNxamtEa25IVTBkblZvL3Z0ZlVnSnhwQWtUaGd5SVR6eW01T3VZ?=
 =?utf-8?B?bm5QVEY2MWx3NEJTTnBNRUNjRmE0ZjUrVk9sM01lYXIyTHZUN2F3bC9TMnlL?=
 =?utf-8?B?TXUvS1ZQWi9vOE55RUhESEI0QS9PVG13NDRiSk05Qzl0bjhSUG5Vai9BTGFj?=
 =?utf-8?B?blZ3TS9WZlcwbVFOVk9udXhxdkNyMWJieUpaTDlYSjFtVUxueW5uWFJmcmYy?=
 =?utf-8?B?QnZ5bTh5S0RLaWVoVUlXYm1rRGNIc2ZTTTB2R25JdHdQKzIxa0VPL3A1Y05U?=
 =?utf-8?B?U3Q1Ry9VNUQ5b1plVERncnFVQXk5ZjJBU3dGc0tkdElIUWI4a3hrSjRaUHNZ?=
 =?utf-8?B?Y0JSZUF3bzlNTm5YNHpWOVdtMUN0SkUyRlNIQmFDRWFSdDhoeVJ5eWUwSERv?=
 =?utf-8?B?VHhraDVzcmRreGRxM2RoOXJLMWZXM3JKNG14VlEvRHlKVTcvVGNDWmsxNXRt?=
 =?utf-8?B?ay9BRk5JSStrdEUyemJYbVVWM0hESVFqK2dlOHphSXNsMmFDTktib21TUjNa?=
 =?utf-8?B?bEVSQnNxcTM1MGNiMGV1WmU2T0ZibWY4dWlhYXdRdlZUQWFiQWJrSWFERVh6?=
 =?utf-8?B?NksyVUd6SERpd2wzalkzYWVQeldMRzVtVURzQjQ2NzR6ZG5iWXc0YlN3cVp5?=
 =?utf-8?B?REhVOGtwbUxMMXFadEZhejM2eHI4cnU2NjFUeCs5czAxNDNhdkpIa09KOHYy?=
 =?utf-8?B?UE1BQzRzQ01kNUt2Wi9vWFVvR0E3Y3ZLeUp5OHU4dWJHdGF6OVNBN0pCaUI2?=
 =?utf-8?B?eXdOUkd5anpURzlWU3dLSDh2Y3RXbElJL0dCbk5yVjFlZ1VqTHJtQjZaaTgy?=
 =?utf-8?B?bFZ0bWd1anNBVWY4QWkwbDF2Z1d4RFBHaWR5WnpocWllUDNFdEZFbGpkU0hI?=
 =?utf-8?B?Zmo4OC9IdEpoWEh6eU8rdEJHSkRnUC9qMWhYbVFpUk0remtSSSt0MGlxaVNn?=
 =?utf-8?B?ZS95Yk5KcE85b2htcmlaSzlLR290MXNQZllVOTlQZ0t0ODJXd1c3dnZRMnp3?=
 =?utf-8?B?Mmd5ZnVEcFlXaXhHdTFIdWJ4UzBydEZpaXMzc3hleXpqL2w1TDRIeFF1RjdX?=
 =?utf-8?B?TmdzWnJkRnhReGl4UmYrbDFGYWVlcCtlZ3dIZkJnTWxXZGZXYVduUXFOREc3?=
 =?utf-8?B?SXNiZjBFVlhPNjl6aDFqOTdxcjVqdFVNSWJNY2g1QlY1a2NSdmppd0hpdEhJ?=
 =?utf-8?Q?OE1elaI+miF9qEVfyq6BrKiwKvS9oMHlwzEotXAwtk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBC703CDAC45E94AA413F6783FFA250D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db6cb9b-cbe1-43f0-27ec-08da0114584b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 15:00:11.8015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLDWvgo2d06TogSpZ7Mv/VDmSZ6BmZKOiKfnl8jJ6/s56N5enWdpCSyt5YSnr/P7b4IYI2mYo0SJlxP4JdSFKoc3XIWMB7sEnFLBUL1Qcoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1672
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzAzLzIwMjIgw6AgMDI6NDEsIEhhbmd5dSBIdWEgYSDDqWNyaXTCoDoNCj4gUGlu
Zz8NCj4gDQo+IE9uIDIwMjIvMi8yMyAxNTowMiwgSGFuZ3l1IEh1YSB3cm90ZToNCj4+IG1wYzh4
eF9waWNfaW5pdCgpIHNob3VsZCByZXR1cm4gLUVOT01FTSBpbnN0ZWFkIG9mIDAgd2hlbg0KPj4g
aXJxX2RvbWFpbl9hZGRfbGluZWFyKCkgcmV0dXJuIE5VTEwuIFRoaXMgY2F1c2UgbXBjOHh4X3Bp
Y3NfaW5pdCB0byANCj4+IGNvbnRpbnVlDQo+PiBleGVjdXRpbmcgZXZlbiBpZiBtcGM4eHhfcGlj
X2hvc3QgaXMgTlVMTC4NCj4+DQo+PiBGaXhlczogY2M3NjQwNGZlYWVkICgicG93ZXJwYy84eHg6
IEZpeCBwb3NzaWJsZSBkZXZpY2Ugbm9kZSByZWZlcmVuY2UgDQo+PiBsZWFrIikNCj4+IFNpZ25l
ZC1vZmYtYnk6IEhhbmd5dSBIdWEgPGhiaDI1eUBnbWFpbC5jb20+DQoNClJldmlld2VkLWJ5OiBD
aHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4+IC0tLQ0K
Pj4gwqAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84eHgvcGljLmMgfCAxICsNCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zLzh4eC9waWMuYyANCj4+IGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84eHgv
cGljLmMNCj4+IGluZGV4IGYyYmE4MzcyNDlkNi4uMDRhNmFiZjE0YzI5IDEwMDY0NA0KPj4gLS0t
IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84eHgvcGljLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvOHh4L3BpYy5jDQo+PiBAQCAtMTUzLDYgKzE1Myw3IEBAIGludCBfX2luaXQg
bXBjOHh4X3BpY19pbml0KHZvaWQpDQo+PiDCoMKgwqDCoMKgIGlmIChtcGM4eHhfcGljX2hvc3Qg
PT0gTlVMTCkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByaW50ayhLRVJOX0VSUiAiTVBDOHh4
IFBJQzogZmFpbGVkIHRvIGFsbG9jYXRlIGlycSBob3N0IVxuIik7DQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0ID0gLUVOT01FTTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+IMKg
wqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCByZXQgPSAwOw==
