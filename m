Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DF3859D68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 08:48:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lXSs+F2n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdZRF3KYqz3d42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 18:48:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lXSs+F2n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdZQS3dRFz3bWn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 18:47:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=An3jxC2XSkYvJxmd7vSQVh8nb7teKA8Gaxk9IalAmrB8LS3gkYDQxL7ec6+F9qxNvwvGD7MwnriWR1SxeXpGvLGnaCnWjbx7kHIULwZAIjANNTVovmgNDbUKEv3u4w/aRVdYNA728okuGJKmye2Sh/xuMlUeF9SpPgs4XChBVvR2vWRryrHiJb8oDaxrWAIzHOUu8e/sxKVn0fwl+i4Pr0YEm2FtI3BCPcKzbEvsEkyDWIFPZREYDTNhjY6UQBNi+83gDam01BbWDzTpuorF8H5d3WYJu1HXqPrXqiPzuKRlVK7nda04Fk6KkYMRLgJcOgQ/GEpsxHQyCfYxV6g4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8vNSGozdqeLYGbcg1SFpwXo+haNiCge5E5NLSHG5hQ=;
 b=KpMRzbueS/VORz5ApoCwDxuw+Em48TyZPSbOP3UC5INVFmtS3Jtr2otOtkIp7Hdb3a0gfGBT0OYwd9PkqfnCKbddXs3faGREgwNU/pEm/WBXnHE8UasnzsJgrAH8TcjwK6HU+wS086svlWKczdcA3BJwt4XxET5PVnGz+UzVU8Qzx6R6dw+8BQSuSifsh/E+ihI4zvc6NihxVQb3Y+LL5ZpYIJL0cVFk5N/JmcbSfsypJMZM5JHmSaQO3zzRBuEbbTzQLhZp197D4OKvCchB+2APK5BpEvpNuNO6zgGEvuILuNcVHzHoLH7scF+mRXwnxcFqvz5dXJpT3IJI4q7wcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8vNSGozdqeLYGbcg1SFpwXo+haNiCge5E5NLSHG5hQ=;
 b=lXSs+F2n0vpm3hb9TQP9/KUoHczTgYf1xRjR6v1qxZtLKEapzvhtseafaJe3LRkG34+jrG3AQ2A5ei/6T7hNtyU1g9LXlHsizWjpp1ClvKbpMYHupa0TmTRnwi1FuLM1PbvTOffPlR+r+cvTnFs+plKMFP6ClgxVvjlkaBrxefBnQvUt0LM7fiYRzEVIMBLIT5LiABnwYP9o3qg2BA/4OZQbdLQEA5x7uLWvV6kq6RtJgVew9jsK2O7QGhS/78OUDmcQQcUiU+Qruedr6GOHDNpl7vzOGJivWIQdlEGMDSK8wtpxJTQAS/O0vftIrQu12a2nH1/GnCjsdzps1TdewA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1638.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 07:47:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 07:47:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/code-patching: Disable KASAN in
 __patch_instructions()
Thread-Topic: [PATCH] powerpc/code-patching: Disable KASAN in
 __patch_instructions()
Thread-Index: AQHaXjZGsoEzlVCOb02F9EoPDzrV4bERU16A
Date: Mon, 19 Feb 2024 07:47:34 +0000
Message-ID: <671c06fb-c053-4fbe-b011-6f4b8e8dd618@csgroup.eu>
References: <20240213043638.168048-1-bgray@linux.ibm.com>
In-Reply-To: <20240213043638.168048-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1638:EE_
x-ms-office365-filtering-correlation-id: cefe5c5b-58c7-4058-8bb6-08dc311f08e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9v8iMMLCdpbWzKXWckhO22HXJancylLUtbqdhWHEVNDZZZus15X/SDsPn/e7CFaP27LFX2EFFPtPLLqZABi1j3Q36T7LsGOtW5bKRTkV8Z7SnkLwfEallyuLot429q7SWnARWlkwnj0XlP31fx3l/td6u07xgJ/sxaXU2jLxrOpNuj1KFfhXLY3eBFJZ776KDwlFMgk/8F98iMCJukEOUv+xRQoFH5tVJo5He2hyoAjhXy42Yv6zg4JcaaKeNpsPl/4aiutua2CcxuGkTIltaPRiNd8VYE+E6w/WQO4HhC/kXYSGdQLiIzWrHRbjy5AjFIbGYWWL6962sIAkwKWQe8gf04YX8E5kUac/53aEYWdSIFYUyl/ika3MkTwNBLJ5T5zad3TqkhbhjTge6gx+qk40EH2c/m1ZHkCEZH0rmQ2rsA4H6jDp/gi165VG2v83buf4T+3J5+Vghx+JrSQZiptObhK5vlsTPm9bcBXtNIh1y8qaUfvUx3jIcyoLHXUKtXrjsyQ91j7vTAfIOzvlDIcH2rIgjHqcyHrNnZSfOKw665OOXfDXy5m8rD2jQfhKLs3Am/y091vR8jPBZonEROgDZdyA+WY2gELalq3zJQs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(31696002)(86362001)(36756003)(122000001)(38100700002)(966005)(6486002)(6506007)(6512007)(478600001)(316002)(54906003)(110136005)(71200400001)(66574015)(83380400001)(41300700001)(2616005)(26005)(38070700009)(31686004)(2906002)(44832011)(4326008)(5660300002)(66476007)(66946007)(66446008)(64756008)(66556008)(91956017)(76116006)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RjJ1NmxmZ0VoaGpnRkZYYlA0ZGZlcnRvaExnUnhjL28xcUpjcWFEZ2JSN08r?=
 =?utf-8?B?WmhLdHdGR2VmeUQ4TDdzUGFlUS80Nmx1cTdUOG52b3NQOXhvZ2Fscm1UYVNY?=
 =?utf-8?B?eGgxNWtXT2FPa1VFMEJRZ2NudkhiYkpsaGNwZWliTEJWY09BKzRjdXpnWWhm?=
 =?utf-8?B?NWZtQ0VMTy9IU1lQZElHT00yRC9BU2pWbXNGbTJjUURUaXMxTC96NmFLTDJS?=
 =?utf-8?B?TllXV3g0bHNVTzJjbEhmV0llVEw3LzAxeWE3OXRrQ0NjMW51R1hwUFNUYUNY?=
 =?utf-8?B?RTZXelUrOCtLZ0Fla1JoYStxZkZDY1kzaFhySEJ0SzdXeVJzRmZ6WmVjTnJ4?=
 =?utf-8?B?OFdMWHhpdTFxaWJQYzdPWCtnL3JDWGd5VEFhcENabEdWT3RmN3FjN0Jjb2Rm?=
 =?utf-8?B?Rmw1NXVpY3hKak9HaFh0VEhsTU85dUZpY0Viampxb08xT0o3Ylg3SlFNK2J1?=
 =?utf-8?B?Z21Wc1c1cTdQVkpXL0V5TithT2FIYWFCMzdkYjk2cEd0YnRKeE8vaEg4WGpP?=
 =?utf-8?B?YUlHTDViN3JZVFBUUnJybEx3eHdnbTVRRlhyemJacXhaQ2NXNlBGL2tNWm1q?=
 =?utf-8?B?Sjc5cndMOEtINEZhU0lsUlRCc284TWozcnhPZGVONFpXU0c2S2ZpRVJJYnJV?=
 =?utf-8?B?ZWNwRllWMlVKTmJuYkx2UER3WTFiTHBoanFQV0FPU1o0K0FFTmQvSnVNYWVK?=
 =?utf-8?B?aGdlU2F1VE1JQVJtS0VzeVlJM1JsNCtkdnhvNjVWOXNrK3E2MkdhajVadm1D?=
 =?utf-8?B?dzNxWEtCTWp3WHR6OFJucnFtQzllNmZQMlZUNDY5WDF6TUxaa3ZqVDBXMEtn?=
 =?utf-8?B?ZVZ2ZHpZMldXZUlkODVCWEFLWFpOOG90MFZSZWd4TFZBUEZvS0lLMU9TY05l?=
 =?utf-8?B?NlpmNWtQQTNXTW90S3ZxN1AvV3RzeHNWdHhuMXRWQzlvTHBFVXNmNDRabVZW?=
 =?utf-8?B?S3NpeGE1WmlhbnBRUDhyT3JzTWVLRHdZY1F6Y0NlcU9mZzRSQkYwcGhGbktX?=
 =?utf-8?B?RUpDSHhwMGJIbGN6UWFxTGpXd2YzYlJmSGFvNHdsYStNbWRuS3pJSkIxL3Iw?=
 =?utf-8?B?RVZtUzRQV1VNMU1RbUFGRjZvN1V6ejVmc0NoL1ZPQ09DcnZ4ZE16Z1Eya1VG?=
 =?utf-8?B?RGtZV0VBN3F2aUlDWXc4azI0WkdvOUNTKzhqeFFTTWE0QUgzcHFqNVRjNEFH?=
 =?utf-8?B?eHRPL2EyTWtOK0hKVVRJdVJlanJiYzk2OXZPY21zVEdpUmRuSW1BaTVLeHEy?=
 =?utf-8?B?SUxFQ1c2dlBuQ0ExdGs3cCt0RUhsaHRnRWV6bGVreVZjTTBHbjVCaFBTd3pz?=
 =?utf-8?B?dEdRUHdkQWttcDlNZU83SDQrSjk3ajkwM2hreXA2NVpHWlFJakZrNSs4QTRt?=
 =?utf-8?B?dWFZalpyR3l0WUY3RWZKL1JLVHl5TXVhd3U5bXdOeVo3Zks2dUhBY3hkSmFy?=
 =?utf-8?B?R255S0lsMnJiTVBhUUxkMWRpa09yZjlTcUlCSmI0S2YzSjU4cDdPWTlYWHBu?=
 =?utf-8?B?WWZYRWIwZ0FiMEh5dnJoZk5KMU9xbk5PcHZKd0ZyaHJLcFEzS2dWYW5ITWVa?=
 =?utf-8?B?WUdudHpOQ3MvdGpJVlBia2hzT2hOSWtIMzIyWmxxNXZ1VXVWR204azVDMmw2?=
 =?utf-8?B?cnBHUjg3L01hTDBDUkl3L2hKQWZLMHlaamovTDdWRVJPSEJCMVY5eTRORS9F?=
 =?utf-8?B?aTZBNjhRNkFieDVyUlNEblcxT2xrbnc1cTNUTUZybWs3OFJNWWVSWDNRSXJN?=
 =?utf-8?B?bXdveHY0N3J1VkQvK2VYYU5leEVvRlkwZXg5KzVqZmlrMlFIWEZYTFZkOFBQ?=
 =?utf-8?B?R0l5TWRJVXhkNzFjeSt1M1JJMGU3NHRNeHdnQVE3N3hJQy9OOEwxQXdKNDJv?=
 =?utf-8?B?M24zUXQrZTBBeVRVMk45OUtXc24vZjNBeVU2QUdwMjZMTzBVK3pwSGxDZ3hF?=
 =?utf-8?B?b3NqeS9hbUVKT21wUTJka1FxQkx3M1dFZlU5T0RuajZmWnNZcEtWRXJyTnZu?=
 =?utf-8?B?SHhGT1VlV3FMUzgwdWNBSjBMMzJDRDI5UWVudTlSaEc3Y0pHUGcwTnpldEJm?=
 =?utf-8?B?ckdkcEEwdTVkbFNaaCs0Q0FXOUhoL2JXOGVsTHg0aXNFendMU2F6ak1jeHhi?=
 =?utf-8?Q?X5+DFvOEpONnBymMg/iqCxPu4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED3BC56CAC8B694F9C0C0D0399A28E54@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cefe5c5b-58c7-4058-8bb6-08dc311f08e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 07:47:34.2503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HOeUz2dXddnotUgWvrx1fklHGoj607z+Vmye6UUqRjztd93e1fC8ZkX1JC9IFH/3b626BE31GOubeloFYHbQeqUiSBsOMPg1LizSXQ/MY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1638
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
Cc: "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzAyLzIwMjQgw6AgMDU6MzYsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIG1lbXNldC9tZW1jcHkgZnVuY3Rpb25zIGFyZSBieSBkZWZhdWx0IGluc3RydW1lbnRlZCBi
eSBLQVNBTiwgd2hpY2gNCj4gY29tcGxhaW5zIGFib3V0IHVzZXIgbWVtb3J5IGFjY2VzcyB3aGVu
IHVzaW5nIGEgcG9raW5nIHBhZ2UgaW4NCj4gdXNlcnNwYWNlLg0KPiANCj4gVXNpbmcgYSB1c2Vy
c3BhY2UgYWRkcmVzcyBpcyBleHBlY3RlZCB0aG91Z2gsIHNvIGRvbid0IGluc3RydW1lbnQgd2l0
aA0KPiBLQVNBTiBmb3IgdGhpcyBmdW5jdGlvbi4NCg0KbWVtY3B5L21lbXNldCBzaG91bGQgbmV2
ZXIgYmUgdXNlZCB0byBhY2Nlc3MgdXNlciBtZW1vcnksIHdlIGhhdmUgDQpjb3B5X3RvX3VzZXIo
KSBhbmQgY2xlYXJfdXNlcigpIGZvciB0aGF0Lg0KDQpBIGZldyB3ZWVrcyBhZ2UgSSBzZW50IGEg
S0FTQU4gcmVwb3J0IEkgZ290IGZyb20gdGhlIHNhbWUgZnVuY3Rpb24uIEJ1dCANCkkgZ290IGl0
IG9uIFBQQzMyIHdoaWNoIGRvZXNuJ3QgdXNlIHVzZXJzcGFjZSBmb3IgdGhhdC4gU2VlIA0KaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMDBhMzBmLTIxNGEtNGIyMC1iMGI1LTM0OGU5ODdk
NmEwZUBjc2dyb3VwLmV1L1QvI3UNCg0KU28gSSBoYXZlIHRoZSBmZWVsaW5nIHRoYXQgeW91ciBw
YXRjaCBtYXkgYmUgaGlkZGluZyBhbm90aGVyIHByb2JsZW0uIA0KVGhlIFBQQzMyIHJlcG9ydCBm
b3Igc3VyZSB3aWxsIGJlIGhpZGRlbiBpZiB5b3VyIHBhdGNoIGdldHMgYXBwbGllZCwgDQphbGx0
aG91Z2ggeW91ciBleHBsYW5hdGlvbiBkb2Vzbid0IGZpdC4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0KPiAN
Cj4gLS0tDQo+IA0KPiBJIHRyaWVkIHRvIHJlcGxhY2UgdGhlIG1lbXNldE4gY2FsbHMgd2l0aCBf
X21lbXNldE4sIGJ1dCB3ZSBhcHBlYXIgdG8NCj4gZGlzYWJsZSB0aGUgbm9uLWluc3RydW1lbnRl
ZCB2YXJpYW50cyBvZiB0aGVzZSB3aGVuIEtBU0FOIGlzIGVuYWJsZWQuDQo+IENocmlzdG9waGUg
bWlnaHQgeW91IGtub3cgbW9yZSBoZXJlPw0KPiANCj4gVGhlIGNvc3Qgb2YganVzdCBzdXBwcmVz
c2luZyByZXBvcnRzIGZvciB0aGlzIHNlY3Rpb24gc2hvdWxkbid0IGJlIHRvbw0KPiByZWxldmFu
dDsgS0FTQU4gZGV0ZWN0cyB0aGUgYWNjZXNzLCBidXQgZXhpdHMgYmVmb3JlIGl0IHN0YXJ0cyBw
cmVwYXJpbmcNCj4gdGhlIHJlcG9ydCBpdHNlbGYuIFNvIGl0J3MganVzdCBsaWtlIGFueSBvdGhl
ciBLQVNBTiBpbnN0cnVtZW50ZWQNCj4gZnVuY3Rpb24gZm9yIHRoZSBtb3N0IHBhcnQuDQo+IC0t
LQ0KPiAgIGFyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jIHwgMyArKysNCj4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcu
Yw0KPiBpbmRleCBjNmFiNDYxNTZjZGEuLjI0OTg5NTk0NTc4YSAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2xpYi9j
b2RlLXBhdGNoaW5nLmMNCj4gQEAgLTMsNiArMyw3IEBADQo+ICAgICogIENvcHlyaWdodCAyMDA4
IE1pY2hhZWwgRWxsZXJtYW4sIElCTSBDb3Jwb3JhdGlvbi4NCj4gICAgKi8NCj4gICANCj4gKyNp
bmNsdWRlIDxsaW51eC9rYXNhbi5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9rcHJvYmVzLmg+DQo+
ICAgI2luY2x1ZGUgPGxpbnV4L21tdV9jb250ZXh0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3Jh
bmRvbS5oPg0KPiBAQCAtMzc3LDYgKzM3OCw3IEBAIHN0YXRpYyBpbnQgX19wYXRjaF9pbnN0cnVj
dGlvbnModTMyICpwYXRjaF9hZGRyLCB1MzIgKmNvZGUsIHNpemVfdCBsZW4sIGJvb2wgcmVwDQo+
ICAgCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSAodW5zaWduZWQgbG9uZylwYXRjaF9hZGRyOw0KPiAg
IA0KPiAgIAkvKiBSZXBlYXQgaW5zdHJ1Y3Rpb24gKi8NCj4gKwlrYXNhbl9kaXNhYmxlX2N1cnJl
bnQoKTsNCj4gICAJaWYgKHJlcGVhdF9pbnN0cikgew0KPiAgIAkJcHBjX2luc3RfdCBpbnN0ciA9
IHBwY19pbnN0X3JlYWQoY29kZSk7DQo+ICAgDQo+IEBAIC0zOTIsNiArMzk0LDcgQEAgc3RhdGlj
IGludCBfX3BhdGNoX2luc3RydWN0aW9ucyh1MzIgKnBhdGNoX2FkZHIsIHUzMiAqY29kZSwgc2l6
ZV90IGxlbiwgYm9vbCByZXANCj4gICAJfSBlbHNlIHsNCj4gICAJCW1lbWNweShwYXRjaF9hZGRy
LCBjb2RlLCBsZW4pOw0KPiAgIAl9DQo+ICsJa2FzYW5fZW5hYmxlX2N1cnJlbnQoKTsNCj4gICAN
Cj4gICAJc21wX3dtYigpOwkvKiBzbXAgd3JpdGUgYmFycmllciAqLw0KPiAgIAlmbHVzaF9pY2Fj
aGVfcmFuZ2Uoc3RhcnQsIHN0YXJ0ICsgbGVuKTsNCg==
