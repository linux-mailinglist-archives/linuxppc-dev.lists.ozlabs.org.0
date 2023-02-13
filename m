Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB6695180
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 21:13:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFwXD31Y3z3c9L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:13:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=akNBnxam;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe16::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=akNBnxam;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFwWG2fHxz2ypJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 07:12:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+QXvaEuNntgi3s+xaI8NQ8ZSAJocfEQW+QhOhGxxV+JVJLlYIxAwmxvxCg7KXHTfZAk2M1YYmXrxKQaH9xOHGp/KVa/jMDkNpmFDyQmZ2DLuhYF3zycfaB5HKnyBop4hLwPjl6MpwNlRoS8CuFaXE7Tjjq9ssJduUudNLdFtswniLbedO4r1hgqRFJTupWv2Ohkd2zB1gYzWXna7WSwFa4wAnUsAZytHchTArMBBS7PMz3FEqpuOaEI8748/O/n47YlJDcKYqmCgY2OaUkujjj4We2Am7722Kv9qlNynP07Gg9Iom3in2MV+Mldz5vrRdN8sTlAidCdjy3WMIEPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d1/Aks+aIWck+SDA9SlBoVWcP5/eXd4uAnaJAlkZLE=;
 b=BPZNiuCCzF68qqytx3ab4T58Z5WGvnOy+LwVCU31gTu7Dv8Z5gKBKosbtH3D4UzLP82P7ai8AJd9T4YxOYCcI7Vo7WXkEhf6OwUlpEY/XyCxP+KADw8ss2z2Q4aMhKqM0nmnqO3MRJT3S71BknMuV3bllU3uEjd4sSRpGyq8PL8sH7Y2VXxkMw6y0bOST8DZFX/r9dOXw6t7eCxYkO7suOKWnITygcF3ekfBPNF80yFgEEi8MvAHtfySnoDW47D/xS5MsRoqhenuoz28TB7Fpdg140S2JpyOZdDLdpYToJUSKhySO9m54L+BscJXJiT+55hnczl8Gro20rhAFtb8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1d1/Aks+aIWck+SDA9SlBoVWcP5/eXd4uAnaJAlkZLE=;
 b=akNBnxamOtZdgUJMkekSsyaKW1NQBIuBh1zVUuAQXrbPW7UTY7IpUDDb3KdGYbXG/Ri6mUMa+QZSbapQfzmyQ0yfTG7c7K3GQLtbjabm/cikhTGI7tuW5aohg91YNI/6YrmSWojWb3vzxn30Bl6OkHb6tYA9ji+jqM5oMrNBSDBBE1ElVXNN6DBno2OcI22FlHyfDKn6TiSPfF/VCdjSa5jKWi5t5ORm0xs0O1o1PtX0M6760sYlOtyHv5bK1NBQt0atqBHMJ/0yBl+7V5HL0lUDU0QQCgKfW6uVnFZyWHH8X96epPWenBokBMY7sNhRGci5ffnDDIKSLPc/BMG+Hw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3380.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 20:12:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 20:12:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/machdep: warn when machine_is() used too early
Thread-Topic: [PATCH v2] powerpc/machdep: warn when machine_is() used too
 early
Thread-Index: AQHZP+eFdCSaFP2hpkqOQcxt3KQYeg==
Date: Mon, 13 Feb 2023 20:12:40 +0000
Message-ID: <3ee6023e-5ee8-e448-5f6c-4e44912e8400@csgroup.eu>
References:  <20230210-warn-on-machine-is-before-probe-machine-v2-1-b57f8243c51c@linux.ibm.com>
In-Reply-To:  <20230210-warn-on-machine-is-before-probe-machine-v2-1-b57f8243c51c@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3380:EE_
x-ms-office365-filtering-correlation-id: ff15134d-5464-4a34-b9d2-08db0dfea88f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KgOgyXdwEUcwDUdgH+SiynK3P2e3J/Q/sAvL7pfGqhCKP/0z8vDIHSC7dIGYf+yRNM+WxZ9NGpRAslLkCtg95gwIISzEdS9CEWM6QQvRqED4LWJHw4bviKVO9CIwsKmYI2Nvz9So5CmgLO8Nl9GN7xpezblBvI7wTiFjmQYe5VrSIh3TkiufNu1v1ex1YdniP5+2M39J8U0a5fdwwwz0dRQ3rE9tAoH9awVvGBvXtOgdabVLUhb7swtstb+rOF7NhxoGNI+ePLWzsq66YNUHOuX72r21addLGicEQs1Lgk9WjeThp1gHGUT8RBfcQ7kLWkdpxzZ5Hlq8E8+w+D1iVQZpXaiD+czS+5qLzAtingklNP0vO7ynHt4khEYsN9yLSB1/mBg/QsnM0nz2TMrTq1nD/RnS5YP3blS0R9edGg9GqeLMlNOkDHfYN4YSCah+oZW0kEe8R3uRSG9e4lS686qvwPinghZlxaX5Fzy2Ls3aPJ/wpulj++vEFXQQob3+UL2ntNQS0C+mJRyPiQf8T8o8gdQ043QwjAjXb+WFYU9qgxgRwrZiH9KE8umF9/y1h+F8dzFfv3d0Al1f2/gTuOOke9GZv3Smdg2GOcnnWB9pGkS04Ha0FR8bmNp4MaYkQZCD9QnzOvYRyilPvx596ve0qMAdya0hwXn6V/6EUZPpJQMh0roJsIVUPrK384Jxiod7G3BOn4MMM5TozXlRbP42kuNVAOZJhw4mzGqEhQKCCG2Vyr1XcNIdk3nM1+oLhc0ikB0nIBE5ZF8oOzkdJfHNUbSGFoHDX8tVZI0onUM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199018)(31686004)(36756003)(4326008)(41300700001)(110136005)(64756008)(316002)(91956017)(76116006)(66476007)(8676002)(66556008)(66946007)(66446008)(38070700005)(38100700002)(31696002)(86362001)(122000001)(71200400001)(26005)(6512007)(6506007)(186003)(5660300002)(2906002)(44832011)(8936002)(2616005)(966005)(478600001)(6486002)(66574015)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V1IyK0JhMm9XQWpxRzR4TnpGQXNJcHJmb2lQckxEM252WUphUkpPM3ByMzV3?=
 =?utf-8?B?cjMvOSt2QlpibjJTTDRMaDF2eXJPSkxRT2xZTmxvRG1WWmtLRHVZSCszM3kv?=
 =?utf-8?B?ek5QejdJSHBxK3VJSktFY1RmUkZoODV4ZzhONUJEMFFkSHU0RVBRdExyaWNo?=
 =?utf-8?B?dGwzejlFQnFYRnFRTGZIU1B1b04xc09LdTRQZXk3ZUtMbWIxem1JZkM0WWNi?=
 =?utf-8?B?WUJES1hKVjFhTHNPZVl6ODBaa1h2dmdJenlsWWI4QlNyMmdpYmQwcEpiM2w4?=
 =?utf-8?B?ckxBSXIxZHZpV3o0WTlVMzMrTnMzaGZEcVpxWWdGR1N6U3ZxQURuaklYNEdj?=
 =?utf-8?B?c1FCNkxlclg5bXF0TUE0VGc2R2t3T2g2ZG1ndGZoVmRzcElVMGlLeE91ZXo1?=
 =?utf-8?B?U2RDKzU0bkIwMHVqdng0NlZmYW9qUEU2a2h1dU1HYlRCMTZOK2xDang5SmF3?=
 =?utf-8?B?a21kN2dIL3FVY3lhUFcrQkxIOXFCdVdwRThqK1NlRmdzRVJ3UXVwQjl1eFI0?=
 =?utf-8?B?ZW1TbVF4WndWUGZXSHJ6S1hBZW1QOVFNVW50ekdKaUp0NUZyRERnTEZDdVBS?=
 =?utf-8?B?aEU5L1U4ZWY4ak5ySVE0R1Z1b1pBNkZWZVdGWWQwK01QUDc1dW43VkdQNGJ1?=
 =?utf-8?B?RXpNSXMxa3J1cnEzcUZ4WGc2YmV4VDJzZVJCb3lmRFJqcktDelhSS3lmWFFB?=
 =?utf-8?B?UjhQSkt1TDloU0EwT0NLcldWZkVXZGsrUW1qNUdqb0tHMTNPU3p1NGhZakZI?=
 =?utf-8?B?cDEzNmhJb3BzbVdleGloSjI2Tkd4MzB1bHdGaFVPc2NBWGErb3RkSUEyOVlH?=
 =?utf-8?B?bCtBbWxleTdWa0U4RXljZzFmaEwyM3JqdVFuTTI0UkMwMXhsL1JQOWEybVBn?=
 =?utf-8?B?NmJjL3BiOWxHWk5hN0kzanV0UWhDdkJ5WmFuTmxTQ3pONy9kRjYyeHZsN1I5?=
 =?utf-8?B?bHY3dFJVZDgrUlhBSVVVdWtBcGJXZ3l3MDg0ODB1NlFwRXQ4UFdVMCtaQklL?=
 =?utf-8?B?bmtiOGYrdEtLV2V5ZlAyTlpYSVFDSUI4VUZFY2E0Q29zQlJBTVJBbWh5U2JR?=
 =?utf-8?B?b0g5bmhNL1J4bENka1JYVzZaN2ZmRldMT1VTU0xkdGlGUjhKS3Y5ZlBxQlhp?=
 =?utf-8?B?OExPRmFqbVRDamFpSS9WU1JPVThGbTJaZkJhRkRpb01xd0hhNDkyOVZvNElD?=
 =?utf-8?B?NGkvUDgrUTh2RVZmU296azdJZ3VGUnlPWnpOeUZrWjJVZll2b296QUNJQnh3?=
 =?utf-8?B?c0FJQzNMdy9ZUWxOZlpkZ21TakJsMnZwRjBzZGlzelRkWlY0REFqV0RPWmoz?=
 =?utf-8?B?ZU1OdDVPNGthQlY3UTJleEgzVVcvS2h4clkvYnN5eHlYeklQa2pQTEgvN3BW?=
 =?utf-8?B?ODVMSUpTWmE1amE5a0hRT245NGpJSGpBbjFtMEhJUzRXSm9mZ2k1MzMyY1gr?=
 =?utf-8?B?YkRLRkhGdGNsaTJnOVFsRFBuc0pUSUMrUnVTaS80V1ErV1ZSRVVGWE1pa3J3?=
 =?utf-8?B?cUNMTVNEWDFDYlJqWnBJa051UDVUOW1pd0pYaENxY05Idmd6N0lDK1NNeWhm?=
 =?utf-8?B?ZzRyQnpuRExBMERQVVY5SW9Jb2dCWVVMaGtIMGdHS0pUMlFJZDFXSEVhOUsr?=
 =?utf-8?B?aEVnWkNISWg1R2dWakhVQ0IyNzB6and0RHlaeFZCTWR2YTFBNEI2emJMNGhX?=
 =?utf-8?B?VU1hNWY5SmJNOGdRSWJGakxlNXlLNVhJc3Q1OUd5dVZRbUlkUkwzSTNRK285?=
 =?utf-8?B?MzYxSUl6UmFmbklXM0pPeHhWeURzOERUb3JVVnpzZkt3bHR0eUVWS2hqdnha?=
 =?utf-8?B?a3BrUUV3R3U5Tk9naXNSaGViMUVWNWFTR0pQRk43Q0dCWW5ieHBEblpaNFUr?=
 =?utf-8?B?RzIzY29sTGoydnJ0V05kWmw4bDc0UGZ3S1IyVWhocGZkVUxNc3BweTF2bHJB?=
 =?utf-8?B?YVU1Y0drQzdNb0xPY05jUkszcXY0UHlSalVsS3RSc3RRUmRxc1FuTmhScWp0?=
 =?utf-8?B?aVA1YktwamphekVSZTVEZFo5UEozY0FrUFJKakQyTzN4djd4NnRvSjJnR0pQ?=
 =?utf-8?B?d0g0SndKOGZvT05nSUhFZlZlNjZmNzNSUThnUFpsOUx6RzJWOGFyMHJORzRX?=
 =?utf-8?B?MEVSRnFYUlZkejRZdzJEYWZqeHVlUHE0blNHWmJaWHdxK1ZIVytpTTlYRWF3?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E84E860E84CA914DA1787E2F4C93693D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ff15134d-5464-4a34-b9d2-08db0dfea88f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 20:12:40.3746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQyRX8iCK4X4mNhe1/r+ABksTmKIhtzya/sGDI02IDpDV5UMi445ijrMevOH4iFZe8H4BEZbwsCp9ZIMGv95KDFFaZYSEaLA9UiUETjuIYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3380
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

DQoNCkxlIDEzLzAyLzIwMjMgw6AgMjA6MjMsIE5hdGhhbiBMeW5jaCB2aWEgQjQgU3VibWlzc2lv
biBFbmRwb2ludCBhIMOpY3JpdMKgOg0KPiBGcm9tOiBOYXRoYW4gTHluY2ggPG5hdGhhbmxAbGlu
dXguaWJtLmNvbT4NCj4gDQo+IG1hY2hpbmVfaXMoKSBjYW4ndCBwcm92aWRlIGNvcnJlY3QgcmVz
dWx0cyBiZWZvcmUgcHJvYmVfbWFjaGluZSgpIGhhcw0KPiBydW4uIFdhcm4gd2hlbiBpdCdzIHVz
ZWQgdG9vIGVhcmx5IGluIGJvb3QsIHBsYWNpbmcgdGhlIFdBUk5fT04oKSBpbiBhDQo+IGhlbHBl
ciBmdW5jdGlvbiBzbyB0aGUgcmVwb3J0ZWQgZmlsZTpsaW5lIGluZGljYXRlcyBleGFjdGx5IHdo
YXQgd2VudA0KPiB3cm9uZy4NCj4gDQo+IGNoZWNrcGF0Y2ggY29tcGxhaW5zIGFib3V0IF9fYXR0
cmlidXRlX18oKHdlYWspKSBpbiB0aGUgcGF0Y2gsIHNvDQo+IGNoYW5nZSB0aGF0IHRvIF9fd2Vh
aywgYW5kIGFsaWduIHRoZSBsaW5lIGNvbnRpbnVhdGlvbnMgYXMgd2VsbC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE5hdGhhbiBMeW5jaCA8bmF0aGFubEBsaW51eC5pYm0uY29tPg0KDQpSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+
IC0tLQ0KPiBQcm9tcHRlZCBieSBteSBhdHRlbXB0cyB0byBkbyBzb21lIHBzZXJpZXMtc3BlY2lm
aWMgc2V0dXAgZHVyaW5nDQo+IHJ0YXNfaW5pdGlhbGl6ZSgpIGFuZCBiZWluZyBwdXp6bGVkIGZv
ciBhIHdoaWxlIHRoYXQgaXQgd2Fzbid0DQo+IHdvcmtpbmcuDQo+IA0KPiBDaGFuZ2VzIGluIHYy
Og0KPiAtIFVzZSBXQVJOX09OKCksIG5vdCBXQVJOKCkuDQo+IC0gSW50cm9kdWNlIF9fbWFjaGlu
ZV9pcygpIGhlbHBlciBmdW5jdGlvbiBzbyB0aGUgbGluZSByZXBvcnRlZCBpcw0KPiAgICBhY2N1
cmF0ZS4NCj4gLSBVcGRhdGUgX19hdHRyaWJ1dGVfXygod2VhaykpIHRvIF9fd2VhayBmb3IgY2hl
Y2twYXRjaCdzIHNha2UuDQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDIzMDIxMC13YXJuLW9uLW1hY2hpbmUtaXMtYmVmb3JlLXByb2JlLW1hY2hpbmUtdjEtMS1m
MGNiYTU3MTI1ZmJAbGludXguaWJtLmNvbQ0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vbWFjaGRlcC5oIHwgMTYgKysrKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9tYWNoZGVwLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vbWFjaGRlcC5oDQo+IGluZGV4IDM3OGI4ZDU4MzZhNy4uNDU5NzM2ZDVlNTExIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbWFjaGRlcC5oDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9tYWNoZGVwLmgNCj4gQEAgLTMsNiArMyw3IEBADQo+ICAgI2Rl
ZmluZSBfQVNNX1BPV0VSUENfTUFDSERFUF9IDQo+ICAgI2lmZGVmIF9fS0VSTkVMX18NCj4gICAN
Cj4gKyNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9zZXFf
ZmlsZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4
L2RtYS1tYXBwaW5nLmg+DQo+IEBAIC0yMjAsMTEgKzIyMSwxNiBAQCBleHRlcm4gc3RydWN0IG1h
Y2hkZXBfY2FsbHMgKm1hY2hpbmVfaWQ7DQo+ICAgCUVYUE9SVF9TWU1CT0wobWFjaF8jI25hbWUp
OwkJCQlcDQo+ICAgCXN0cnVjdCBtYWNoZGVwX2NhbGxzIG1hY2hfIyNuYW1lIF9fbWFjaGluZV9k
ZXNjID0NCj4gICANCj4gLSNkZWZpbmUgbWFjaGluZV9pcyhuYW1lKSBcDQo+IC0JKHsgXA0KPiAt
CQlleHRlcm4gc3RydWN0IG1hY2hkZXBfY2FsbHMgbWFjaF8jI25hbWUgXA0KPiAtCQkJX19hdHRy
aWJ1dGVfXygod2VhaykpOwkJIFwNCj4gLQkJbWFjaGluZV9pZCA9PSAmbWFjaF8jI25hbWU7IFwN
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBfX21hY2hpbmVfaXMoY29uc3Qgc3RydWN0IG1hY2hkZXBf
Y2FsbHMgKm1kKQ0KPiArew0KPiArCVdBUk5fT04oIW1hY2hpbmVfaWQpOyAvLyBjb21wbGFpbiBp
ZiB1c2VkIGJlZm9yZSBwcm9iZV9tYWNoaW5lKCkNCj4gKwlyZXR1cm4gbWFjaGluZV9pZCA9PSBt
ZDsNCj4gK30NCj4gKw0KPiArI2RlZmluZSBtYWNoaW5lX2lzKG5hbWUpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCg0KTWlzYWxpZ25lZCBiYWNrLXNsYXNoID8NCg0K
PiArCSh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXA0KPiArCQlleHRlcm4gc3RydWN0IG1hY2hkZXBfY2FsbHMgbWFjaF8jI25hbWUgX193ZWFr
OyBcDQo+ICsJCV9fbWFjaGluZV9pcygmbWFjaF8jI25hbWUpOyAgICAgICAgICAgICAgICAgICAg
IFwNCj4gICAJfSkNCj4gICANCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbG9nX2Vycm9yKGNoYXIg
KmJ1ZiwgdW5zaWduZWQgaW50IGVycl90eXBlLCBpbnQgZmF0YWwpDQo+IA0KPiAtLS0NCj4gYmFz
ZS1jb21taXQ6IDBiZmI5NzIwM2Y1ZjMwMDc3NzYyNGEyYWQ2ZjhmODRhZWEzZTg2NTgNCj4gY2hh
bmdlLWlkOiAyMDIzMDIxMC13YXJuLW9uLW1hY2hpbmUtaXMtYmVmb3JlLXByb2JlLW1hY2hpbmUt
Mzc1MTViMWY0M2JiDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo=
