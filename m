Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C95BC2B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 08:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWDq84VbYz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:12:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xbfmJBXL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.52; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xbfmJBXL;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120052.outbound.protection.outlook.com [40.107.12.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWDpN13dHz2xrr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 16:11:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BW8wM47Bd07MTRIoo+o0L5HPXPriEJK0X/+iDxbF04w+faWEk79q9uQjq3KTYaZFb8axBvKK6ykooQm0CMEmDRvxyI/+FAggP8MwYHe9mY6F7o652PgaWMkLuZt1PHKNV17c87vtZluxRAD1nF1Qd2L4tXrsdhqr4ApKO+A+4YcKOeCzIK7qicpxKewTM07E2LUSHi3P3MZpLLMedj65mqSaRzRWYBtu2/xY4n21MNrt+ZFKpMwWpKbKNuot8aQ03m285WsRTgjNiBiKfTVstB+aVDu5A6qZEcGMm/sflDfkRdotiaCS7CkM/npmzQFiL3m3ew5bhfou3z6Ah196yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCei1hyvCtnu0nd5zRnmQR0EHXKU5adrrvgW4Udkh/Y=;
 b=GnTrBRtuKUsZKn00bFzppPpgbSuVS5Gny93JlM/OJky1AJcfu9tL5eROcqULmmsXw6y9glZzguSDqAlKr2beNFQI/VEv8jISbTSXK8127FKKEs3GzpFdS5SGFYZ8x6FtsLnE6mrN/xXQCc0Dr6nMAvP2Nf6eIgJwgkIZsfoTBR9HbOy0KLHCuMfbk1KWUaV6bLvTnWBe+yJpky959mv9mywik0kcp0JQt5kaXqQXczbfl7AEWsykbU3KkKk94wgrgiqYeIvIcuD3ln+LKrY13JxShztV5EeNqiGc6kzV4qABeniK98mO5mqnWzy91ZYAYl54LrALGS5ZXH6J2lhpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCei1hyvCtnu0nd5zRnmQR0EHXKU5adrrvgW4Udkh/Y=;
 b=xbfmJBXLcU56SOF/6DHwP1WEW3W8JnhXmSTxxFHP4tVubS12JixJY7xsCmJXgkKcD0cNt1agV4fXPWxdGZ+qeWZJQLAPKIXFiytPbQ2KeCqRbuG3mHpGAFj19LRs1PZT5U2bNAtJwt872TpZkua4cixAMt1Fo/9S8IYXxcmO53Yu9thmq4s13EysxFczFx2Cw2+PSwIT4TImzbNlN68bUHuiXnLpLqJxMlSNB9UviQz2r1g3ysotW+vTUb/YDdrO+0n8zjqEda40Ahnc0hmGfNsCrto3wOVPuEC7StrxqW0JcHNR9jqPZGL/TqIL+JV1nQUIARPwSR1i1Gyku3Hh6w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1543.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Mon, 19 Sep
 2022 06:11:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 06:11:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 3/6] powerpc/module: Optimise nearby branches in ELF V2
 ABI stub
Thread-Topic: [PATCH 3/6] powerpc/module: Optimise nearby branches in ELF V2
 ABI stub
Thread-Index: AQHYyZT3od4RLfRpJEa0uK4TuYPp363mShyA
Date: Mon, 19 Sep 2022 06:11:20 +0000
Message-ID: <51635182-426b-4409-a7a6-699e5a8d6358@csgroup.eu>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
 <20220916062330.430468-4-bgray@linux.ibm.com>
In-Reply-To: <20220916062330.430468-4-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1543:EE_
x-ms-office365-filtering-correlation-id: e09337b2-b9b7-44e9-11db-08da9a05c565
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +EkdhGtK9JXCQBqV4Xu2VFYUsc8fiX8abkf4iOPzIA/Yzb95SgFP4Wdehrhfk09jUb0b6o0d0QCRmg7fcCEHgd5SfuxODYx3Z9hc7faeHg9LrKaKVwzxjAoZgdUMsrkhezoE3olh+oApLZPVZnC81iVhrsxIf11sKNk3mgVYSMIhpHXTQgz2lZiJYH5LHitcCLlrANAdhn/v133HEkqPyttFbpt4dRZ9Yyq94p6xCsp/Q+olti/EES9/+7S26gD1J025xXOhyLdrz0dX47aQp1Sqc6TOFIuQtxcrh97sygtcBkMFrLu+x5Azh8UUqKNSL5agQ8Rh33Cc6GUk1Qm6r3kyUk8maKnABEtURPwmhNnBp/YYIiBl2wd2eEX8fxuBvdGE7chOI05XtrcQ6qlaNjT22nNOtdC5GwucJgRgaXQis2HZCP++h1rotYqclAtJQtx7p9knbf5AP6xjyrfT7VnTnbYDYNxIKZygTX/4eJA6TmD6xoGVu0ywbmLGpREeCWXRM4eS76lreyyQ8RHlldi5ZlWJGT4viEW9r+jRSeJvlDe9+raKBhuuYfxunpklMaCB9JkHqJTKs1QJ6CcP5ERetk6ob2wG2nM7I4G9VfSMAj2UNKtxx8lekgtmvwAWLdxBWkXOYnss4cL97EOtNLukECuL1stARin3pzj6jMzrL7qh7lLjQvjHN0KjabqkAEiHF6IVvde9VCBHl0eawsz6qo2/0tr8wckZrK2s3dy7ujnu84+K73dxmxAkVgBIyN8UEe7HHkgLtUSK+usYD7x9xKdQ5fU9A/Ne5tkv/lfOFFEM9HQJh8S7uYRg7ECIxhHp8IZk/LU6yR4V4YOvTg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39850400004)(366004)(451199015)(31686004)(6512007)(38100700002)(26005)(122000001)(6506007)(91956017)(8676002)(76116006)(4326008)(64756008)(2906002)(2616005)(54906003)(44832011)(41300700001)(38070700005)(5660300002)(86362001)(31696002)(186003)(71200400001)(7416002)(66446008)(36756003)(8936002)(478600001)(110136005)(316002)(66946007)(66556008)(66476007)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TFljMC9zWnFJOUZMSGJ2cWFEanZvTkxnVEh2RTcrbHJwRHlNZkhuTWVxK2dF?=
 =?utf-8?B?dWhEeUllZjRhR0xCSGZrcW95UzlCZEtIajF4YlNwTDVYK1lOekpYa0NPTXZl?=
 =?utf-8?B?RFpzMnJUTWJBUXhyYjg3NitUTlZ3M2pWdlBBRFpqQjdnUDZrMW5VVTMwbXJH?=
 =?utf-8?B?Ull3NjhlNFEvbXk2QVlWVFpXNFdJTm1qbXJHbUt6dUFQd21NcEpDRFdPc3JW?=
 =?utf-8?B?Zm10ckhqOHloYWdtc2c0WWxEWmw1MitybUlTRTFCZWhpeXhrSGNQdWNtVFB2?=
 =?utf-8?B?TGR1aCs4aHhFSXdYcDBNNnVOd1RDaWpiU05wUHIrb3Nxb1htYURLQ1NieUhW?=
 =?utf-8?B?OFJqRUN6SGc0RmE0d3M4N1lWdmxQM2dLNlFuTlEzWUtOdlp3TCtlNXo0YUxU?=
 =?utf-8?B?WnBPZ3h4ck5Jb2hEME9NU2h0WHJlSDNxeEVQUFhGNkNoaHpNL2dDeFdvQVFk?=
 =?utf-8?B?a2ZYNEp1anlNL09MT2g2dmluRDdrMk5TVllBb0d4ZEpjN1BQM0lHbHBkTG9w?=
 =?utf-8?B?TWxadEdibDlTb0VJa1ZnRUlmU2x1QkV1M0pDdy9qTWhoazl6WEZIcFVNQnVk?=
 =?utf-8?B?UHhmamUrSWhNVVRKaDdTYXN1eWVTOHQwKzAxb2xwdUdlbGlXSVlhQ3pobHZC?=
 =?utf-8?B?RVFXWHVzYktZbW1CZnlHbXJtdkxTOWxvbUdJT25wUGFXeWMvdjBmdTZERkgv?=
 =?utf-8?B?dWorVE1FNmw2ZjBMNUNIeitmMzR3TzVlY29GVEpZWWNHR3NsTFpyekR2U0NR?=
 =?utf-8?B?NmlDN0ZmL1VVTDFEbTRnbjlqdWx1WU9hTko2V1A5T25mb1VKMVpnRWU5QjYx?=
 =?utf-8?B?THBxWUYzTUE1MElLdWpzbFVNczd6QmVLYmZWdExpdHBrcWw3c3JVZG1EQWFa?=
 =?utf-8?B?c0o0dGt2QWoxWG9QMkRva3Y4YnNVZyt0bGhGM28wem9KVEdLWFV5YnVGcDM0?=
 =?utf-8?B?dkdSUXRQVnRuYmFzd29GWDRsTy80UTlySjV5TWVLenp5QWNRUkJpUXErVCs4?=
 =?utf-8?B?UG5LOUxpMlFEMGMzcEluV1NUa29wVExGendWQlVGL2ZFZDNNTUhMN3RNV05k?=
 =?utf-8?B?ZDEyMDBVUWt2Y2RnVHdEZktRa1VOTWxtUnFqb3N3c25WVnkvbVVTNVRBbmFp?=
 =?utf-8?B?cEJEYmdLeHV2eEV3aUFReFJDNTZ5aGd0NlNJemZKTUh2bnpwaEFaSjFrSW9C?=
 =?utf-8?B?ak1XMXhNWUs2RUYyRUo1amg2bDk5M0Mxa3NzaisrQmJoQVVKNzBveDlnSkNn?=
 =?utf-8?B?NS9Zc3pZQy9rRGU1T0hXQ09JRHdxNmZmWTA2dWV4NVJDaUx1RS9zV0l5UExo?=
 =?utf-8?B?YmdsREJNUlVBTjVsRm5zWmRvaEhjdjNRaWQydTFvdGhyNlluTHBNU1VaR3Fj?=
 =?utf-8?B?VmhPZk9tdEVPZ1dUVkFLVDhpYm1NMG5kOEhGZU5nam1wOGJaem05UDBtaklW?=
 =?utf-8?B?cmN6Zit4VGY3eWJQendTMmxINTkrRUpQSHNRT0NXbXJ3czZqQzdzaFpiNmpC?=
 =?utf-8?B?VHU3c1owenc4QVlpMGVPSlFnVmpiNnRnZ1l4RFp2SE9mOHdvTkZ5ZVFKNXlL?=
 =?utf-8?B?dFlMWmtrcUh5TjAwdS9iNVVHalI2NjVzbzVnMzZRNmlZbUdmNG94SE51SHRW?=
 =?utf-8?B?cE9LcnNwZmxmWUtOV1ZKTXI5OWYyS2V6VEJlRjFVd1Y2M011amlzSGNwemha?=
 =?utf-8?B?R0RiZFZka28yc0VUWDQrQW5TRkRqTFoyTmRXSHNGb0krVmNELy9henJhdm5m?=
 =?utf-8?B?N285N0dtMERhYW1mM2s0Szd6REdzSGVWRTVXTVM2R2wvdGp3c3hGTS9pYUdE?=
 =?utf-8?B?YUM2TVJzamVobnRxVEpseVNRNmZVcWNtZzBOU1RIVzhBLzh2R3JrLzZGcllW?=
 =?utf-8?B?ZVhpNFNYZGQrc0k0cVpuM2lqeXl4dDlQSVFrc20xMHdLYWVXVHNGS3dqMmxH?=
 =?utf-8?B?YWIyMmZMUit6RnI5bTZzcjRHOEovQmYwRXRWRXRNMWVUOE5VV20weXR5OXR1?=
 =?utf-8?B?eThHK0swbDF0SHpXR1JZZWNKWmFpUm5PNGFEM1cwZ0pYYVdHemQ4OFNsT0ZL?=
 =?utf-8?B?TlRUOWFsRTU1M3hhT0VSVTFJTUExSXF2MTRFUU1jU2c4VXJ5ZmI4UnNhSkU1?=
 =?utf-8?B?RmtZSTZBUE5aakphQ0ZFR044YW9sQVAySkJLV3BJbmdGVzRORUZ6c2s4KzNR?=
 =?utf-8?Q?BzsumoejUcGzcd1yMI8UQEk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C13FCED4851244482B9BA95A7E0D94F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e09337b2-b9b7-44e9-11db-08da9a05c565
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 06:11:20.3283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyErCal3yBZYHp1e3uhHlquX2aaJTNvqxizuAlpdWqNc/dcTpplgRaSQ9GN6BpJ+W2GzLophS1j6nWOMvtb0p8GCtCKtRyHcypO4G2jghnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1543
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA5LzIwMjIgw6AgMDg6MjMsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
SW5zZXJ0cyBhIGRpcmVjdCBicmFuY2ggdG8gdGhlIHN0dWIgdGFyZ2V0IHdoZW4gcG9zc2libGUs
IHJlcGxhY2luZyB0aGUNCj4gbXRjdHIvYnRjdHIgc2VxdWVuY2UuDQo+IA0KPiBUaGUgbG9hZCBp
bnRvIHIxMiBjb3VsZCBwb3RlbnRpYWxseSBiZSBza2lwcGVkIHRvbywgYnV0IHRoYXQgY2hhbmdl
DQo+IHdvdWxkIG5lZWQgdG8gcmVmYWN0b3IgdGhlIGFyZ3VtZW50cyB0byBpbmRpY2F0ZSB0aGF0
IHRoZSBhZGRyZXNzDQo+IGRvZXMgbm90IGhhdmUgYSBzZXBhcmF0ZSBsb2NhbCBlbnRyeSBwb2lu
dC4NCj4gDQo+IFRoaXMgaGVscHMgdGhlIHN0YXRpYyBjYWxsIGltcGxlbWVudGF0aW9uLCB3aGVy
ZSBtb2R1bGVzIGNhbGxpbmcgdGhlaXINCj4gb3duIHRyYW1wb2xpbmVzIGFyZSBjYWxsZWQgdGhy
b3VnaCB0aGlzIHN0dWIgYW5kIHRoZSB0cmFtcG9saW5lIGlzDQo+IGVhc2lseSB3aXRoaW4gcmFu
Z2Ugb2YgYSBkaXJlY3QgYnJhbmNoLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3Jh
eSA8YmdyYXlAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9t
b2R1bGVfNjQuYyB8IDEzICsrKysrKysrKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMva2VybmVsL21vZHVsZV82NC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGVfNjQuYw0K
PiBpbmRleCAzNjU2NDc2MDk3YzIuLjAzYWIyOGQ4NjAwOCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9tb2R1bGVfNjQuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL21v
ZHVsZV82NC5jDQo+IEBAIC00MzIsOCArNDMyLDE3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGNyZWF0
ZV9zdHViKGNvbnN0IEVsZjY0X1NoZHIgKnNlY2hkcnMsDQo+ICAgCQlyZXR1cm4gY3JlYXRlX2Z0
cmFjZV9zdHViKGVudHJ5LCBhZGRyLCBtZSk7DQo+ICAgDQo+ICAgCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKHBwYzY0X3N0dWJfaW5zbnMpOyBpKyspIHsNCj4gLQkJaWYgKHBhdGNoX2luc3Ry
dWN0aW9uKCZlbnRyeS0+anVtcFtpXSwNCj4gLQkJCQkgICAgICBwcGNfaW5zdChwcGM2NF9zdHVi
X2luc25zW2ldKSkpDQo+ICsJCXBwY19pbnN0X3QgaW5zdCA9IHBwY19pbnN0KHBwYzY0X3N0dWJf
aW5zbnNbaV0pOw0KPiArDQo+ICsJCS8vIFJlcGxhY2UgdGhlIGluZGlyZWN0IGJyYW5jaCB3aXRo
IGEgZGlyZWN0IGJyYW5jaCB3aGVyZSBwb3NzaWJsZQ0KPiArCQlpZiAoSVNfRU5BQkxFRChDT05G
SUdfUFBDNjRfRUxGX0FCSV9WMikgJiYgaSA9PSA0KSB7DQo+ICsJCQlwcGNfaW5zdF90IGRpcmVj
dDsNCg0KQWRkIGJsYW5rIGxpbmUgaGVyZS4NCg0KPiArCQkJaWYgKGNyZWF0ZV9icmFuY2goJmRp
cmVjdCwgKHZvaWQqKSBlbnRyeSArIChpICogNCksIGFkZHIsIDApID09IDApIHsNCg0KTm8gYnJh
Y2VzIGZvciBzaW5nbGUgbGluZXMgaWYgc3RhdGVtZW50Lg0KDQo+ICsJCQkJaW5zdCA9IGRpcmVj
dDsNCj4gKwkJCX0NCj4gKwkJfQ0KPiArDQo+ICsJCWlmIChwYXRjaF9pbnN0cnVjdGlvbigmZW50
cnktPmp1bXBbaV0sIGluc3QpKQ0KPiAgIAkJCXJldHVybiAwOw0KPiAgIAl9DQo+ICAg
