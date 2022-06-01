Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A4539F90
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 10:34:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCj9b4FjJz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 18:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::602; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCj950kmpz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 18:33:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWDdO5GHHChJPphNxc4A5hjgWsLJOfqE2lZPW4KYA3iW5mRJSJTatsHjevwbpmeFAEXrxzJMBadBKsUseqnJrsUD2mTVKxItct/wZo5mJZ9EP4+KoU47EDaht6WdPlN2rDTP8+aKUwg9sh+FQ79jZc84XitHLWLp2O/jrMUsd3EIK46ACyx8ORP6aywelS/kv6pYeGF26gO24rjqRv+5axY6v+S6Aji6shdlA+pjGUeZfPT8mrbkSDuHOpZ96DXQU9nm2GQZrQ5H4JzR/eB6lGbndcHDOr0FGzIQwGcHxuvbMTK8ufOKxKsng4nn99no0lsftN5FfweW3yEGzss1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDKhzDgrloxDO7VPEm6WzGlsvVYGTL8MuQmWh6H78oc=;
 b=VvKGSmQHzAI+vwB3evdXoo45wdmiSWZGQrT7/zrTBfZfzgagwf4I63vw07u/IFY08lfscM+nCLE4vNLubG/SkqKiwfPL6KAVGVUYF+XfKxiV3NW5SvlNcYFT7UXdrnaZXVSdLO5HYXYB1vyUr6bTpgV4lCClvxmND2dUN6zVdumxkp3MBOV6QLJ/YjSWb+hHA9t/rt+QjCle3jjDewIxSM/8iP7B9XFO42R/0V4Zartz/7XW3+oYErJyRxfVHY0C5Qmx9c8CQWyXIhKIe6r/afl14XvJ7BMrDIIwmeHGBOxJFMAyD6/j+P89XFxoKOWnyY3rUsEsCvvhOUIUcLbqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3091.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 08:33:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 08:33:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 3/6] powerpc: Make syscalls save and restore gprs
Thread-Topic: [PATCH 3/6] powerpc: Make syscalls save and restore gprs
Thread-Index: AQHYdXuXOTQ6cYTzX0CDGUdcqVTlCa06OYwA
Date: Wed, 1 Jun 2022 08:33:25 +0000
Message-ID: <f8c51f1d-518d-d0ed-bad0-92a2132929bb@csgroup.eu>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601054850.250287-3-rmclure@linux.ibm.com>
In-Reply-To: <20220601054850.250287-3-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 331a154f-c848-4040-a957-08da43a96587
x-ms-traffictypediagnostic: MR1P264MB3091:EE_
x-microsoft-antispam-prvs:  <MR1P264MB30914BCC0529C11835960558EDDF9@MR1P264MB3091.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qFSz779Jbebuxbv2S4fqGN8ukv3Kdwym+HUHhh1C8YFj2Fzrhxwx5YJJgn2cpwmimG/XeHq3Z/92YF9hKsOkBlmVw87+5oGY4XFbb817IFNzM0fX2NSQBQ8wT+/9t55hL1UCMKWIMmGkG4Pc8hMpMqGDHXypx+dwpyHbkXl+5wdR6tfjk5IfUm7ZCEU7VtKymgjj/lOUpOYXnoEOwQh6xWQH0QorAd2tO8BspI4W3fM4pZppfb8PAM3Cf+jx+4gBUB4+nHHBC2eOvv/h3aL7S84IxIz+4TwN7DqdoTCUMutDC/NnIbeHI6Vqy4KtNexU/SZIRJUrqEgBta4fXC4EfPnUUcIxGySbS4azdfWGcANPWxzBYzpzW8PwI+++nayznDYUfkkqG//ejXdacSqc41GFjCa9jM7uEdkvPxheLDPp0JvnRcCT3IxeLQw66u8b2HZmUsHT1phnB/Y97fqCJ1AhBC9a6L9AbPCikksMuhEnENsFk2IIXFd/w4y7q4jk/Ad7BDkX+y30nAaBlMqyu2a4ibCLXWJF0Nk9mxPKF5nlz8dBMHC2eCeJLdLLfLuFGbuNqfU286ROHfWdfi9l4qRgEJXVJ/9Q89vLJdXLGFSCNR7xUuic9Oe9l127nM8nhLijY8o5vBw/838eTNN+RAhpOwPPh1GJofINsVLfn8wwcvj2vQu2pUGqbx3X5RUucPcYqFokYO6DqaKMJWrMmmnVEDxNyU30Ipa6gjrpcK5DBws73Xy8GC3nwZxtLBXgWX+30HvacyZ9zaZLbCsxwA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66946007)(66556008)(76116006)(4326008)(86362001)(64756008)(6512007)(66446008)(966005)(26005)(66476007)(6506007)(71200400001)(2616005)(91956017)(6486002)(316002)(110136005)(508600001)(38100700002)(31696002)(186003)(122000001)(66574015)(83380400001)(38070700005)(36756003)(44832011)(8936002)(31686004)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VVJydkQyMVBRcHp0QmMvVVBxUzFoVkxsMGE2MnRmS1BDK2JPYW55S2wvOU1l?=
 =?utf-8?B?bWk2alVLZkdydmw1REJWVEUydDJjckRNcVgyWTQ0djRWeXFUM0N5K2JHY2F6?=
 =?utf-8?B?NUhyVHNFNHIwOUxKdjk0a0dJYnpVOXhnTW5yZ2VUb01rL25mVGU0cldHTmZW?=
 =?utf-8?B?TEtOK1VPWmc3M1B2ZHJwc1c2Qi9HNENJVTRLd1ZGMDNsSVpmRFdvMCtGN1ZV?=
 =?utf-8?B?alM4YlZkc1lZYkFJS2xsZTgvbXh6OU8vc3IyNEtzOGl0N3UvWmpSOWZsMzBj?=
 =?utf-8?B?cHd2cmJHTVVmNzByQUMxZFNkQ29CMkNtM0V3ZmNTMlV2dVF3OUZkZmt1U2lI?=
 =?utf-8?B?STFMV21TQ3orcnNEZDk0YnhSVVNTMFhWWlovUGp6NVZBUllCZHMyYWd4dExN?=
 =?utf-8?B?QkhUNXIya2F6ZnlGcTVvS21nOEtRYjM5WFZGZytZS09oczEyUXpWTjRwTTAr?=
 =?utf-8?B?Rm9CVWJJMGw5amc2VW1HV1Mvb25lMDZ0VkNvMkJydGFmbTcxdnZpNlhCb3Ns?=
 =?utf-8?B?c29vTHpaRU5uV2lIdmJwS3pxNUZLQmo2ZS96MXc5b3JoZEJkRDJseXNCU2p4?=
 =?utf-8?B?aW5MN0NXc3ViMzAvc3JQam94eEtJTVpvYjdZSkY4K0RXcm96MS9pejR4SVJv?=
 =?utf-8?B?QWJqODFCSlVUTlZ6VEQ2bW55bFVWMmxhVXRRdUpSNXVWc2dYNXVIV3pJN1h0?=
 =?utf-8?B?Um8xaER3UHFHRy9OUXljZFF1OVgxZm5tZk1WRGJycUkzOFRueHkwVEhHMlNU?=
 =?utf-8?B?ODlKK294NkZrR1BYK0JUVlNrTnhKeTdWWnZ4V0JiMG9uZ3Y3aFQwYTR0Y2dl?=
 =?utf-8?B?Y3FqOEVqOFBTOTRuUnkrbEppR2JiejBDcFlKanBkS0xBKy9aNUUwMmlRWDA3?=
 =?utf-8?B?K1ppQXFKQmFYMjJvQ2NOa1YwNE1lRCtES3NKOFkzM1ZQUzJDZnluSzZ3V0Rs?=
 =?utf-8?B?SFk3Q2NFcHdWSit5dElFYkx6NzM2d0YwbDJLSUdSU0lIZDkxZm10S0VVaFoy?=
 =?utf-8?B?USttNVVRZzhWYkNuV2JrdzJEdFJaeTFTem4yQWl4aUxBNmVpMlFWdFlyQ2hP?=
 =?utf-8?B?d3QrYm5Hd1R4NlRPL1haVVpmQnRuQVRQVXdSeDR1ZE5CRFlOQ1oxdjBNUU5P?=
 =?utf-8?B?Wjl0SW9SbzgxQkZvNWlrZ2pRMmE1clF4UmhQa1I2aTljUU1McFJjZ1dHZHYz?=
 =?utf-8?B?NmNiczhjUDk0WW5kYnBncWdveHBqQ0NTT0t0V0pFVEdFNjBUTkN0T29vMGpZ?=
 =?utf-8?B?b3RKMU95aHVEQWtGQ29uNDlwM0puR1BYRU9kWXVZMThNZ3lUdzhWQ2IwWm9X?=
 =?utf-8?B?dkRjckltZUVlZmtJMUVDNUprSnhSTHpxUFE3VUMwTXc0NnN0SVVHUmo0RUVH?=
 =?utf-8?B?Z1U0NkFEc0QrMHRvcmV2MkRzMUltQWp6ZTdETjZkRzFRdmVxdG5BL2N6VHBN?=
 =?utf-8?B?N0lHR0tjVXZjaVNkSHhWc2xuS21mYUlSR3k0NjF5aklwUXVkbXVaYVFSbUJS?=
 =?utf-8?B?QTdJREdhb0c4cnp0dXZ4Rmg2UkhURGQ1YTdOQkg0RytQNDBVTGp1YmN0TU55?=
 =?utf-8?B?aUZyWDBmSGpsOTlBYVF6RzA2U1RGbmRTcTNtb1NFMjZIQXRZdFlvd29TNm5o?=
 =?utf-8?B?YjN4SW9qSytGM3VqN0RPK0pCSm1GWjlsQUFqOUpraXNKTFpsYTFybmpaOE1j?=
 =?utf-8?B?c2l6YTQvL0NWeTBINllpYXZQd2dyUW9Gd0dCSXJCODN1V1NXRFU3dTVPb2tZ?=
 =?utf-8?B?czdLSnk5eXJoS3BaakRBSFVidEZDR2VPbVpmTkJwVmRHK3R1NXY1WWtWWmE1?=
 =?utf-8?B?NXlxSkJzM3VuekZHUTNwMFJzVHh2ejdvZGc2VzVzOEtEWjV3a242LzZkZ0Zv?=
 =?utf-8?B?RCswVGE1NU9RU1hzYll3czhzZkdXanM2UTRRZXB2Q1JKTFpzWWU2cTNWQVlN?=
 =?utf-8?B?eko4NGgxeWxod2kzOVdyZnMwbmhwNEZHNXZjSnFxNmFCcFRYTHVBb0dYWDBC?=
 =?utf-8?B?WnJ1cXQrQndYbXhIRm1mZkdyZDlWWXZvcXBMWUxBc3J2ZXNpK3I1VkpKMkxB?=
 =?utf-8?B?aXBOTzdIMUVyTzgvbHNJaGQrVXhqWDZEVGdLdjJuN0JQYTJKWSttYlNIQ1Bn?=
 =?utf-8?B?MzBmOVVVSWkvVU5vT25QSE03SEJEdURSOTZKR2d3TjNnRkFJWGlMcFZPRVA5?=
 =?utf-8?B?d1Q3K2dlbXA1cTk5N0dvQXVyaHg0QXU5aGszMEhzUVI0bHhIQlZxQ3RKSzh4?=
 =?utf-8?B?TmptQ3NHSTdDbFZQeGZoQTQ2ZFc3QlRvcE5nZFpPdVF3T09xZHJ5TG5GNWsv?=
 =?utf-8?B?ODU2RzVicjRtRWVjQVREMU1Wa3FITXVVOHB5LzJWMTJ3NkliRW1JSnl2cjdU?=
 =?utf-8?Q?faSu0zzfvmScJUq8MtA0jjOUIOuwunl6mFDsQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6ABD6AA6F1884B4F8048CFC28FFE76BC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 331a154f-c848-4040-a957-08da43a96587
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 08:33:25.7645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zjt5n/029f9gzIOirfM/jKwTAC4u4GUy/8j2+h/HnlFmDbRQUFvxbDTxyfRqq7g/IkH219dgky7g3HgjVe5yErZgyMbUMSZfupo7qM2FZUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3091
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

DQoNCkxlIDAxLzA2LzIwMjIgw6AgMDc6NDgsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBsYSBwYXJ0IGRlIHJt
Y2x1cmVAbGludXguaWJtLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWxhIHBldXQgw6p0cmUg
aW1wb3J0YW50IMOgIGwnYWRyZXNzZSBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRl
bnRpZmljYXRpb24uXQ0KPiANCj4gQ2xlYXJzIHVzZXIgc3RhdGUgaW4gZ3BycyB0byByZWR1Y2Ug
dGhlIGluZmx1ZW5jZSBvZiB1c2VyIHJlZ2lzdGVycyBvbg0KPiBzcGVjdWxhdGlvbiB3aXRoaW4g
a2VybmVsIHN5c2NhbGwgaGFuZGxlcnMuDQo+IA0KPiBSZW1vdmUgY29uZGl0aW9uYWwgYnJhbmNo
ZXMgb24gcmVzdWx0IG9mIGBzeXNjYWxsX2V4aXRfcHJlcGFyZWAgdG8NCj4gcmVzdG9yZSBub24t
dm9sYXRpbGUgZ3BycywgYXMgdGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHdheXMgY2xlYXJlZCBhbmQN
Cj4gaGVuY2UgYWx3YXlzIG11c3QgYmUgcmVzdG9yZWQuDQoNCkRpZCB5b3UgbWVhc3VyZSB0aGUg
aW1wbGllZCBwZXJmb3JtYW5jZSBsb3NzID8gVGhhdCBtdXN0IGJlIGhlYXZ5Lg0KDQpJbiBwYXRj
aCAyIGl0IGlzIHNhaWQgdGhhdCBjbGVhcmluZyByZWdpc3RlcnMgaXMgb3B0aW9uYWwuIEkgY2Fu
J3Qgc2VlIA0KaXQgYXMgYW4gb3B0aW9uIGhlcmUuIFNvbWUgUFBDMzIgYXJlIG5vdCBpbXBhY3Rl
ZCBieSBzcGVjdWxhdGl2ZSANCnByb2JsZW1zLCBjb3VsZCB3ZSBhY3RpdmF0ZSB0aGF0IGJpZyBo
YW1tZXIgb25seSB3aGVuIHJlcXVpcmVkID8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4g
TWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9r
ZXJuZWwvaW50ZXJydXB0XzY0LlMgfCAxMiArKysrKysrKystLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvaW50ZXJydXB0XzY0LlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2lu
dGVycnVwdF82NC5TDQo+IGluZGV4IGIxMWMyYmQ4NDgyNy4uZTYwMWVkOTk5Nzk4IDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVwdF82NC5TDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvaW50ZXJydXB0XzY0LlMNCj4gQEAgLTEwOCw2ICsxMDgsOSBAQCBFTkRf
RlRSX1NFQ1RJT05fSUZTRVQoQ1BVX0ZUUl9IQVNfUFBSKQ0KPiAgICAgICAgICAgKiBidXQgdGhp
cyBpcyB0aGUgYmVzdCB3ZSBjYW4gZG8uDQo+ICAgICAgICAgICAqLw0KPiANCj4gKyAgICAgICBa
RVJPX0dQUlMoNSwgMTIpDQo+ICsgICAgICAgWkVST19OVkdQUlMoKQ0KPiArDQo+ICAgICAgICAg
IC8qIENhbGxpbmcgY29udmVudGlvbiBoYXMgcjMgPSBvcmlnIHIwLCByNCA9IHJlZ3MgKi8NCj4g
ICAgICAgICAgbXIgICAgICByMyxyMA0KPiAgICAgICAgICBibCAgICAgIHN5c3RlbV9jYWxsX2V4
Y2VwdGlvbg0KPiBAQCAtMTM4LDYgKzE0MSw3IEBAIEJFR0lOX0ZUUl9TRUNUSU9ODQo+ICAgICAg
ICAgIEhNVF9NRURJVU1fTE9XDQo+ICAgRU5EX0ZUUl9TRUNUSU9OX0lGU0VUKENQVV9GVFJfSEFT
X1BQUikNCj4gDQo+ICsgICAgICAgUkVTVF9OVkdQUlMocjEpDQo+ICAgICAgICAgIGNtcGRpICAg
cjMsMA0KPiAgICAgICAgICBibmUgICAgIC5Mc3lzY2FsbF92ZWN0b3JlZF9cbmFtZVwoKV9yZXN0
b3JlX3JlZ3MNCj4gDQo+IEBAIC0xODAsNyArMTg0LDYgQEAgRU5EX0ZUUl9TRUNUSU9OX0lGU0VU
KENQVV9GVFJfSEFTX1BQUikNCj4gICAgICAgICAgbGQgICAgICByNCxfTElOSyhyMSkNCj4gICAg
ICAgICAgbGQgICAgICByNSxfWEVSKHIxKQ0KPiANCj4gLSAgICAgICBSRVNUX05WR1BSUyhyMSkN
Cj4gICAgICAgICAgbGQgICAgICByMCxHUFIwKHIxKQ0KPiAgICAgICAgICBtdGNyICAgIHIyDQo+
ICAgICAgICAgIG10Y3RyICAgcjMNCj4gQEAgLTMwOCw2ICszMTEsOSBAQCBFTkRfQlRCX0ZMVVNI
X1NFQ1RJT04NCj4gICAgICAgICAgd3J0ZWVpICAxDQo+ICAgI2VuZGlmDQo+IA0KPiArICAgICAg
IFpFUk9fR1BSUyg1LCAxMikNCj4gKyAgICAgICBaRVJPX05WR1BSUygpDQo+ICsNCj4gICAgICAg
ICAgLyogQ2FsbGluZyBjb252ZW50aW9uIGhhcyByMyA9IG9yaWcgcjAsIHI0ID0gcmVncyAqLw0K
PiAgICAgICAgICBtciAgICAgIHIzLHIwDQo+ICAgICAgICAgIGJsICAgICAgc3lzdGVtX2NhbGxf
ZXhjZXB0aW9uDQo+IEBAIC0zNTAsNiArMzU2LDcgQEAgQkVHSU5fRlRSX1NFQ1RJT04NCj4gICAg
ICAgICAgc3RkY3guICByMCwwLHIxICAgICAgICAgICAgICAgICAvKiB0byBjbGVhciB0aGUgcmVz
ZXJ2YXRpb24gKi8NCj4gICBFTkRfRlRSX1NFQ1RJT05fSUZDTFIoQ1BVX0ZUUl9TVENYX0NIRUNL
U19BRERSRVNTKQ0KPiANCj4gKyAgICAgICBSRVNUX05WR1BSUyhyMSkNCj4gICAgICAgICAgY21w
ZGkgICByMywwDQo+ICAgICAgICAgIGJuZSAgICAgLkxzeXNjYWxsX3Jlc3RvcmVfcmVncw0KPiAg
ICAgICAgICAvKiBaZXJvIHZvbGF0aWxlIHJlZ3MgdGhhdCBtYXkgY29udGFpbiBzZW5zaXRpdmUg
a2VybmVsIGRhdGEgKi8NCj4gQEAgLTM3Nyw3ICszODQsNiBAQCBFTkRfRlRSX1NFQ1RJT05fSUZT
RVQoQ1BVX0ZUUl9IQVNfUFBSKQ0KPiAgIC5Mc3lzY2FsbF9yZXN0b3JlX3JlZ3M6DQo+ICAgICAg
ICAgIGxkICAgICAgcjMsX0NUUihyMSkNCj4gICAgICAgICAgbGQgICAgICByNCxfWEVSKHIxKQ0K
PiAtICAgICAgIFJFU1RfTlZHUFJTKHIxKQ0KPiAgICAgICAgICBtdGN0ciAgIHIzDQo+ICAgICAg
ICAgIG10c3ByICAgU1BSTl9YRVIscjQNCj4gICAgICAgICAgUkVTVF9HUFIoMCwgcjEpDQo+IEBA
IC00NDUsNyArNDUxLDcgQEAgX0FTTV9OT0tQUk9CRV9TWU1CT0woaW50ZXJydXB0X3JldHVybl9c
c3JyXCgpX3VzZXIpDQo+ICAgICAgICAgIGJsICAgICAgaW50ZXJydXB0X2V4aXRfdXNlcl9wcmVw
YXJlDQo+ICAgICAgICAgIGNtcGRpICAgcjMsMA0KPiAgICAgICAgICBibmUtICAgIC5McmVzdG9y
ZV9udmdwcnNfXHNycg0KPiAtLkxyZXN0b3JlX252Z3Byc19cc3JyXCgpX2NvbnQ6DQo+ICsgICAg
ICAgLkxyZXN0b3JlX252Z3Byc19cc3JyXCgpX2NvbnQ6DQo+ICAgICAgICAgIHN0ZCAgICAgcjEs
UEFDQV9FWElUX1NBVkVfUjEocjEzKSAvKiBzYXZlIHIxIGZvciByZXN0YXJ0ICovDQo+ICAgI2lm
ZGVmIENPTkZJR19QUENfQk9PSzNTDQo+ICAgLkxpbnRlcnJ1cHRfcmV0dXJuX1xzcnJcKClfdXNl
cl9yc3Rfc3RhcnQ6DQo+IC0tDQo+IDIuMzQuMQ0KPiA=
