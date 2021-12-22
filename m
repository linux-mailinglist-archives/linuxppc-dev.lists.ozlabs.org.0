Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0C47CD9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 08:37:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJlXG63ffz3c8s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 18:37:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJlWl20xSz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 18:36:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5Ju3ibK8lLubzYLZRfegRpYPlyj0XoV2j/5tG6XQS/UxGGHhDXD8iqvYHkbSdKInl2zu11uuTcXlPxjtTmhkWt6kbTCMikvOqru72yQJ1VeYOqVUrHJSGXXkX3ahJGjC0/ICppiWONjHyQrISYpmpBU5QPHgoF4IJ72Jc9AD7aTFfJC7pochRPiprbNZBZGWLfxtF3+mltcmeLEDcyTQ9XzdmtedzJsmt8qbU/qDCwcrOIOz9yTWjmGcfWNUslXOd19XRfRWKLwGN+1UZqgJbs/pnY+F2bTK4M+JD9hGOe0sFYzZST1TRwShnujYKgVfidfyqP1ukaDBgCJ/QsNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT3pw61mL4UxaR9oLmEVrgnC7IdtyEE7rxeqs+vxH5w=;
 b=F6euvznkIrJgR3Srm4xXRTqs0Sq35yh/4ySX46mbZ8tZnBAMN8rgCFXOyH/IBEyRCDmYQ4P2dntJXRo1Fo/8eaObH7rNQkPbAHu6C442BBrQZGD1oRu7wnMP+8+2kSAiPNCspejEA+AWzop0TBs/TyzUElsH4QAWZmD13KojQDVbJ2DIBKyGWG+eMwD9p0XUH6h88m/SGBFUtPMhPDysT1eb5yfdAFSQIIcmGSAcoStQc9uV29F4Ff7pj7hdXVkKlCCmWCRltyH7qz04+/7gw4lp8TAdCVGQLKMyahEKRTM9Fx9Du8mfbKEX7nJoILBrxGsXjungQyPnkOoj2z1Jww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0724.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:12::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14; Wed, 22 Dec
 2021 07:36:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.018; Wed, 22 Dec 2021
 07:36:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 1/3] powerpc/vdso: augment VDSO32 functions to support 64
 bits build
Thread-Topic: [PATCH 1/3] powerpc/vdso: augment VDSO32 functions to support 64
 bits build
Thread-Index: AQHX9pMcQ+oQwylQX0avpFGvesWhUqw9VtoAgADJQ4A=
Date: Wed, 22 Dec 2021 07:36:29 +0000
Message-ID: <71edc2a9-2547-7443-e899-a1696bda22c1@csgroup.eu>
References: <09b25a22cd5179eba4580ae95414f18fc162bedf.1640108961.git.christophe.leroy@csgroup.eu>
 <20211221193608.GD614@gate.crashing.org>
In-Reply-To: <20211221193608.GD614@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1373f6b2-faf3-49e4-abb9-08d9c51dc4bb
x-ms-traffictypediagnostic: MR2P264MB0724:EE_
x-microsoft-antispam-prvs: <MR2P264MB072465086055A4E2E321AD92ED7D9@MR2P264MB0724.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WeBL+6jPYnVj4PySmsSt5Af52we61LDvg+Ppwwa0Bl1KYrTwuofJXkbHMTYGK2pAtkG83aXFvqDwG9Cmm6OwSfHqBlqBRBp/QEwAMEIcAIAkIZdVavyqV4I6NVijpXjcxpg0mtxUymnhF+9802FL8KQZlLiM0Nt/x1WQC0I0XmzUkMy9GTqVy7TF8mF8GM0CaWufN0Xn+Yx9uaGanjNlinH2qq4Ggop4py9XfbgXVdEtDyniTerudcyo4atkIxM+XVkDvht8PpdQGV3i0JRkWXFY/qNi8fkMqC8MGTrJpLfb0ET1nplPJrinSo/wmkBoX6KuKb4h8BxiZ4duLS2lfq9im/4AHJ2Kz4m3UDX8+T0yYHyvqLmKBnCDP8AdciBvhQxcNptgHT+WmC1zgx73/223+3prYN+BtVYzOo47uJLyZyQ69WMIuBJL94pFuOAMcoNRYbUpz2D415K7LJEKI9sBHSsN4JLd7Wxu74QR3HC9FPi7bYICFSOQMsCnjZCx+TiDzl2wSoO42WxvZmxXVr3asqKQOPOk5wtWG825g1BxAYsnOvPZAOAKEjmFjw8AMCp9aNjoc8MPVu7I1zH8d3qLOP/wpAcioWib6adNfFHkJ/LyMMeXsNG8QuqEmC6Cede7cl3L78XDteM/Z4edXy1aqYXn2iA8ZL4Y9y9ajN2/0+X3HVKWkdzEbMM8t7xT9IL8KpO2+eNQCZ15Ai/zTTd+Bo42VFYT6G2LgU3eiOFfZovKW1+a4VeBJ858nlCsVihLUKjf9CUOBaLhTbLeHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(26005)(66946007)(66556008)(66476007)(44832011)(71200400001)(64756008)(66446008)(38070700005)(2616005)(508600001)(6916009)(8936002)(38100700002)(31696002)(6506007)(122000001)(6486002)(31686004)(54906003)(316002)(2906002)(4326008)(6512007)(86362001)(186003)(91956017)(8676002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?US9HL21lb2JPeEFDQ0Zjcld6aDhvajU4bndWYytZSUozOWRRTHl2N3hCanN5?=
 =?utf-8?B?V1lkZzRJbkp2Znl0b2thYnJxcTg0M3FCQWFXQkw5WUxDbllHRDNSZm9wQ0Qy?=
 =?utf-8?B?QUVKUVlMcitpRmxyQTR1ZVBsT2hlWjB1K1N1TnowOGNKdEVtdzloNENaL0V0?=
 =?utf-8?B?YXpEZmxSakZnQjArWDg5SXVNYVYxeWtOenpRdkdWVUE3UGRhWFhvRys0L082?=
 =?utf-8?B?Q0F4d2plNmtoTysya3BlaDVHNnJsczBZSlZIZ1UxMWhWc0I2aWhlbUxSTWMr?=
 =?utf-8?B?YUFEOFpzVlNQZmttOUxvM3FuOGZXeTd0QStlYVhJZlFJeHFiSTkwRDN5RXUr?=
 =?utf-8?B?ZC9ZZDB1Zy9BTmhsSXUrRjRiRGZ6eHFjblRUa1gzVDdkK0xXZWszb0lWN1Zp?=
 =?utf-8?B?dDFHWjR3VkNMYXRSVXN6elRDZHFvQUJkY3NNNkRaNUVCeTB3OXcwNzFKQi9Z?=
 =?utf-8?B?SmsrTGUxVko3K3ROZ00rb3ZFamNsTmgrNWlSb1BLSXJvTlF0MjBxYk4rWVBi?=
 =?utf-8?B?WU5UNEY3RXZYanc3NnpkMUdYY3J6RlYvK051RlVlalNBTU00Q1ZEdG9LMGJS?=
 =?utf-8?B?MS8rNzdMcXI0OVpFUmluRFgwVEl2T3J0ZzV1UGpWeXJjWXVrbUlySUVYTjRv?=
 =?utf-8?B?TCt3dGJGN3U4bFNhaXNkU1JLQjg5czJaNnZqNERscmpjRi9welBac1ZQNm9i?=
 =?utf-8?B?V0UvYi9pQTVLMU5ZTTQ0VlNSYzMwa0Jqc1pRM3R1K01aSGlGY3lSSVIyMHFF?=
 =?utf-8?B?ckdOOGFwRGlFbEs0dkg0OWFtQ2YzYjYyRkd1STFia2NPbkV2Rmlnemo3bmRG?=
 =?utf-8?B?T2VCd0JES0toUE5CekkwdGdKa21lbzdXc3pTZmg1QStQbEwzbzNUY1hnam1R?=
 =?utf-8?B?VFcrV3padWREYzJoU1plaWpsY2RWaUpzVXZPeFgzM2NhMzBETUJITTBCQzYx?=
 =?utf-8?B?U1VJbG1HTjBxYm1JbnJLZkk5Q3p2cWV1WXBmdzR4V1pmRnlKYi9ES2dqaDV3?=
 =?utf-8?B?Z1JMc1VKN0VhWm83WW9jejRSSkR4R1pFTHRYTVRwSWZ1ZVBJM1JmbzhNejlD?=
 =?utf-8?B?RWxGekRtV2hhTDNXL0pJcE5WdG95ZElCVnpTWkRGcm4xSkpoMzZCeW5SaFVp?=
 =?utf-8?B?Nkd6T2hQTUZXcDd4NlZORklIMEhYNzErUmJiM2tyMHlRU2t3YlVUUU1LVDBN?=
 =?utf-8?B?VmNuTHZJdmx0QWdKWU9pK1hUSzlNSHRkd21PRHhhWDBFNEdQRk4rODRxWGFS?=
 =?utf-8?B?SVhmMWNqby9sTFB2Zlk5Ymw0Qno0NEtpK2tDSVlyTnBkY3paSkJzR2s5SndM?=
 =?utf-8?B?dUpQVTN4T2RuS1MrS1grNndFSUNGckRkU3R3V2puUFloeFZDMk1MYmIrRXp6?=
 =?utf-8?B?MUwzN0RSWDhEcDhxcllCNVJaMHJKdTdPMXdYYy9ZVmNWbVJrdzFkM09IaWZE?=
 =?utf-8?B?aG9lN0NjN1dJM0ozWERacHBNRTVOMU15TE5SWFIwUm9uK2lDMUprT2R4dU9U?=
 =?utf-8?B?cUd4V0tDajZDU2NGeExJbWVWVENFeklFS3NhcFh3U2tVbnNzNEJEZDc5eWtJ?=
 =?utf-8?B?OW5qaFJ6ejNJRUorcUlPcllRYisrSFB0eDdBWS8wVXcyYnh1Vm5CSE1ZVnUz?=
 =?utf-8?B?V2pCYjdianBvNHEvekJaZUxWeG9NZktPYW04SEU1Y0tjQTVLRytuY0lzTlNq?=
 =?utf-8?B?K01SYUFrWXNvY3NwZ0FoY3pmVUhkM01tMHVXUlNtUXNyYVZ0eHV0WVF4YTFm?=
 =?utf-8?B?eTZ2VFVuS1NGU2xJSDdpOWIydjU0QUhia2VXQld0eC9DQkpoOXJoZUNRZENn?=
 =?utf-8?B?ZHFrOGtqdkVxV1UvUlNxMHRITlBYNmdHSFdBVU9SYXdYdXpkTlBKRk8zNGNI?=
 =?utf-8?B?TkMrTW5qRVRWaXp3WjI1N0xMazRSRDBTVmV3U1k2YlcxUXFUU25UVXV1c01o?=
 =?utf-8?B?b2ZKRTRGQjBxdkJ4VTVROSs1NWl5UWtSeXkvWUFIdzhGUCt2eEtrckpUalBt?=
 =?utf-8?B?K2xlYWUwa2pUNmRqMHpoVnJBMWsyRlg0SG9xTkxRMTdQVDE4YzUydVJOdFFL?=
 =?utf-8?B?V1h0R0UwMERaaEVwQm11aXdVU0lIOUJ1MmphdDJ3NzhaNzlWclJLbmo2SHN2?=
 =?utf-8?B?UDA0dlRVSlVWbjh6bHIralQzK2h3MWo1VllobktpTmlJS2FCSTgzaEZKeWxW?=
 =?utf-8?B?M1pmRFZ4Q2JlZTNhQXBiM01PbkZSdE9rbW5FNzM2dHNEd29abEFyYXZTUFJR?=
 =?utf-8?Q?XDTr17FS/01ZO2DZTdHwfMSebY1UxMsP/+3Fw+dy08=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1612B7E388CD34E846FAFA094BC9386@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1373f6b2-faf3-49e4-abb9-08d9c51dc4bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 07:36:29.4524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54mKp6l+DfacP8lEwAyrX88yhfQ5MKS+HvFClnjPxdjuNimFsXlBdcrL4hYHpfJJ0eqRkQEIIPoqE/g4X9z883CufU75ZuyfththJfdfhvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0724
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
Cc: "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzEyLzIwMjEgw6AgMjA6MzYsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBPbiBUdWUsIERlYyAyMSwgMjAyMSBhdCAwNTo0OTozM1BNICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzbzMy
L2RhdGFwYWdlLlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28zMi9kYXRhcGFnZS5TDQo+PiBp
bmRleCA2NTI0NDQxNmFiOTQuLmRiOGUxNjdmMDE2NiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93
ZXJwYy9rZXJuZWwvdmRzbzMyL2RhdGFwYWdlLlMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvdmRzbzMyL2RhdGFwYWdlLlMNCj4+IEBAIC0zMCwxMSArMzAsMTUgQEAgVl9GVU5DVElPTl9C
RUdJTihfX2tlcm5lbF9nZXRfc3lzY2FsbF9tYXApDQo+PiAgIAltci4JcjQscjMNCj4+ICAgCWdl
dF9kYXRhcGFnZQlyMw0KPj4gICAJbXRscglyMTINCj4+ICsjaWZkZWYgX19wb3dlcnBjNjRfXw0K
Pj4gKwlhZGRpCXIzLHIzLENGR19TWVNDQUxMX01BUDY0DQo+PiArI2Vsc2UNCj4+ICAgCWFkZGkJ
cjMscjMsQ0ZHX1NZU0NBTExfTUFQMzINCj4+ICsjZW5kaWYNCj4+ICsJY3JjbHIJY3IwKjQrc28N
Cj4+ICAgCWJlcWxyDQo+PiAgIAlsaQlyMCxOUl9zeXNjYWxscw0KPj4gICAJc3R3CXIwLDAocjQp
DQo+PiAtCWNyY2xyCWNyMCo0K3NvDQo+PiAgIAlibHINCj4gDQo+IFRoaXMgbm93IGNsZWFycyBj
cjAuMyBpZiByMyBpcyB6ZXJvIG9uIGVudHJ5LiAgSXMgdGhhdCBvbiBwdXJwb3NlPw0KDQpBbGwg
Y3JjbHIgd2hlcmUgYWRkZWQgYnkgY29tbWl0IDVkNjZkYTNkNzFlNiAoIltQQVRDSF0gcG93ZXJw
YzogTWFrZSB0aGUgDQp2RFNPIGZ1bmN0aW9ucyBzZXQgZXJyb3IgY29kZSAoIzIpIikNCg0KSXQg
bG9va3MgbGlrZSBpdCB3YXMgcHJvcGVybHkgYWRkZWQgdG8gcHBjNjQncyB2ZXJzaW9uIG9mIA0K
X19rZXJuZWxfZ2V0X3N5c2NhbGxfbWFwKCkgYnV0IGZvciBwcGMzMiBDUi5TTyB3YXMgbGVmdCB1
bmRlZmluZWQgaW4gDQpjYXNlIG9mIGVhcmx5IGV4aXQgb2YgX19rZXJuZWxfZ2V0X3N5c2NhbGxf
bWFwKCkNCg0KU28geWVzLCBJIHRoaW5rIHRoZSBjaGFuZ2UgaXMgb24gcHVycG9zZS4NCg0KPiAN
Cj4gUmVzdCBsb29rcyBnb29kLg0KPiANCj4gUmV2aWV3ZWQtYnk6IFNlZ2hlciBCb2Vzc2Vua29v
bCA8c2VnaGVyQGtlcm5lbC5jcmFzaGluZy5vcmc+DQo+IA0KDQpUaGFua3MNCkNocmlzdG9waGU=
