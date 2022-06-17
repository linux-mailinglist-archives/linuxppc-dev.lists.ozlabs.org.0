Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A554F13E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 08:54:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPVBv2fYhz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 16:54:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=L3U8c7fJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=L3U8c7fJ;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPVB72HZvz3bnS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 16:53:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHxuQsl3zvkegBUE/ZYzeaQ174tYWEe6ZF5g79KzMc6Et7HQczgaliVEluKHqt9RnbyAruY0SvXy1TwtZsUUuDSG9M5jlhfOUO/Klj0C0pPKeOIYR8OsrHVyTW4uexR5QlOnhunJj25nTzxjJl7mpwL7+4I5v1rd8TeChJUf4P4yffH0Q25Hy2yABw3dyBb0ra7rpmMWA2+r9bWxmewoLIDrqe8wAVUhNMbFIFrrPErf/pyHKxX1DLpGpOfI9wFcjaWDt/HveC2Xk6s9nJ3GXN31mlbZRrXjMyDtThbiIxON54mjrofIOzd6hsFVxF57qqfM3jqPtqQw2vExRA5Rig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xkNGV+DWHHxsohWyffVVQZ1Bg2tTaSMtbrvdlR8xIA=;
 b=N4EqmhVNPO9Xwk4OlSmnlq43736RMqLvznvGVBTTBeznMt/nuFetjIh1OcxcfxhjgwKBvwic3/cNmoq0cAvSPksPPs6Qabfczwgu/Jycu+8vMj2ietg3Fi1RAIUkd8SjhxydMgMhV4Cc5PElWVWk8DL5pM0eBQ+WYV033Lsq/ZuTaK8eClh4kOnWt1fGuqRvtlnREjXrhMeceDdavWpGKdc8emkaWpawr9vtcpgFcL2jmB4jjgQ78tdl6BIzn9gX117HHQL2UzEkxHWdrASVDuPeJKAML+JyQckZtjZL1v5SfhTMFdFBRVGLI1eNmZuQHb9SoVE9eFxY5woUuSAyXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xkNGV+DWHHxsohWyffVVQZ1Bg2tTaSMtbrvdlR8xIA=;
 b=L3U8c7fJRdJPm3Zo0+U+44y2fF0WVBVMQfOhjbqECy0wHA/yao+jPKRp1RoS7LeTLXqHXq1SLP14nCOJJ/HuTmrkfpkW7W6w2LgBaqOp0qQFqVsIGpPkMLyRGWrNKA99lx7JRbbMOpW1hJcPR7/UjrClEujBvAv6CfH97hz81cMWWjcW4MTbPkMf6EGOda5m8l3XoNBcBcCJoNPgT8MNgn3ZFzsGAmY8A0vxEz76MQBeKp/TELFm7uO2PCL8Z9HV7gcy1JvNxZzxgj8XsUTXnOgmDwgs3kWXVCyOE3CxL1IFtOTehXJhOHn60OAnL1UVn3+Z/MJx01LvG+uTI6HEOA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2311.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 06:53:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 06:53:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Liang He <windhl@126.com>
Subject: Re: [PATCH v4] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
Thread-Topic: [PATCH v4] powerpc:85xx: Add missing of_node_put() in
 sgy_cst1000
Thread-Index: AQHYghbqBxHmWj5zmk2B/xk+JkyGug==
Date: Fri, 17 Jun 2022 06:53:13 +0000
Message-ID: <f79ebcc1-c060-f861-231d-85c377e2e885@csgroup.eu>
References: <20220617060827.4004795-1-windhl@126.com>
 <eb72976a-9ca3-b894-b2d5-8283a4cf486d@csgroup.eu>
 <16f9a971.44e5.1817068ee3c.Coremail.windhl@126.com>
In-Reply-To: <16f9a971.44e5.1817068ee3c.Coremail.windhl@126.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f31c159b-9d35-4415-a5ec-08da502e0cba
x-ms-traffictypediagnostic: PR0P264MB2311:EE_
x-microsoft-antispam-prvs:  <PR0P264MB2311EA6F30751278906D3E85EDAF9@PR0P264MB2311.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  feSG/DEKTzEVP5nXDvwI/JNnaP9zizR1R9P52cUFZD1l7cOBy2FQ413UUXtyHS5ZTLQQQ3xIl2BgeDaJ8Cr76+EP/VN8cpjhxtjwByTn/qDMPfTCQ6pYYh4AbX4Fe02vUO4wXuAT1uLg+UAFStRZqeOqZPtVlcytsgP36M/sJNdFMpkBc8tKREV8jbBabdgY0r5TZvTHIxTsuxMcEVbmTy4ja/37nfvYjf2ljtWlSLv7G/R2Qe37xfmfelVsUD8l8Zs8Ur0lTjCrUVEU2CYeUgMGwNxlJFU4B4Z5DAwSaZLg3Ifa/TGuxLZuwAQLauoPidP9pwNnRmfS2SiRrv72dqp5aADfQvEPVzkKCHotbaUDxIoR8uhg3peYfg5M2WEzh9/VK7A694e2x9Jdy7BKDHtDD2xxk8CTh4vMPkICdxzPugd1iMPzmqdNd86QRCXjIu5D6TptDIE6yf8ZfCWDqpXdutX0/CiHA9G/eG/GOGw5vR6OH6737MaFoQ/OMsuf4o7GyHNpEI/cQnUkCZz4g8ODrHYmj9I0Fl2NMY2YkhtqAS8XpdnrLUSf9HMkAfSfksDZEvYdOXSMoDEBOG8CT0b+OTuJWDSOtanVFrWrGuoX+Crn1zxr+ilTnsuf36lYNj2HBfvKc0WjKYoM6m2jQbsHQHp1tnuIyQS4ldaNaQhZVupZZZxkNgwMKKmz61QSC2kX3g0EllvueYIVemQkAMiPcTaXbxFthnD2FToQgapXopfnrxoyI+c5YCrGcHGeEl5WXpKKpOu557auFViai/4IZzkKXMi+7ABlWLk4xhNz9TX3j35imcWMAS4ew7+KTl/PGHolpVM+EqcOlLMBp+Ik7qXgpLy1X+k351YPTps=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(36756003)(8936002)(316002)(498600001)(8676002)(31686004)(64756008)(4326008)(66446008)(44832011)(71200400001)(76116006)(2906002)(83380400001)(6512007)(66476007)(66556008)(66946007)(2616005)(86362001)(54906003)(122000001)(6506007)(31696002)(26005)(966005)(5660300002)(38100700002)(6486002)(186003)(38070700005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UEZQL0diRWJOWUw2M0R4U083YVVqUnVtOFNUVjNlQ3VIdTVGOUMzaktqQWVl?=
 =?utf-8?B?RFFuY0dIalIyTTRZeDA0anpwMm1kTDRmWGZrYmpWb3ZtOXowK3ZjMHJPVTdY?=
 =?utf-8?B?NEw1S3czVkdEdHpkZDJTaGgzWEQ0UmhSU2owbGtBdWxuT1czeEtKcnFQaGdI?=
 =?utf-8?B?V0NOUnQvMW5vSzJqODdKVnZ2M3dpYlQ2WVBKNHBGWlp3UGZzNityU1VweWp4?=
 =?utf-8?B?Uys2eTN1T3R2bjVWMTJBNElQVkppdWhNNWtTb2pGZ3Rmb3k2VFFZNTFMYjVS?=
 =?utf-8?B?c1J0Q05VdE5wSDBpais0T3U5eU5FRk5XTTI1NDQ1T0lnMFZvemc4bDlHcWJD?=
 =?utf-8?B?RzdqV25pUkdHVVUrbjlXQ1c3eFJRV0toblllWkh6OHZTMEh3eElXZXdFNFFE?=
 =?utf-8?B?OWM5VENUN1ZHU2VZL2dzS044djFqNXhSL3lpaXFkbG9jcDNLRUpRdU5oZ2Ix?=
 =?utf-8?B?VGorMUVSdWIyY0ozaDVkMnk1dEdLb3hldzJpUmpqVXNHcHlUY3JYWk5BUGc1?=
 =?utf-8?B?MVBuTlIxNHVnRU9tak1iSERBc3FGUnJMUDFyRGgxMXVPNFgveDZaeGNQaDhH?=
 =?utf-8?B?NW5aQmxLZFZ0UC80NUZ3KzJNclpsYW5WM3ZRM2VycWlJcU1WOW9XbUZEczRr?=
 =?utf-8?B?K2NubzdZaFRlOUxScWREeHo1cnN1VlZXa2lhNlhod3JJZWd2YklSKzdIUWk1?=
 =?utf-8?B?SHJKaEN4em8yL3l5Z0NkUC9UYU04ZVpBcDQyYTBVa1BrSFp2Q0R6Zm96ZjFl?=
 =?utf-8?B?ZCtlOWdhUVE0WTNKUzhXMWoyT1VyZUR1OFg1NDljV0ZMN296d3BhUTJDMkNz?=
 =?utf-8?B?YUZDenk2Ym9teGlha3BGU2dhVXFqUmtwTVJINGhDcGZPWFRIT1lnZnhLMzcr?=
 =?utf-8?B?cnpQcDVLMmt1c3hkYTJxaVdQUDBmamhOM1kyWncwMzJ5K09ObXlsTzBmRnRv?=
 =?utf-8?B?TFoyWkxnMElzTXVEb095MFp1cVNxTTBTL3BjZDU0Y3R3RzNNUitUeWtVYlkv?=
 =?utf-8?B?UUtCZjRuZHczYmNyc1h1WWN3STNWczZHWFQ2VTIyTi9kSzAxNGRvU2RnVEFo?=
 =?utf-8?B?a2FDVUhEYkVmVEFuN3hibzdBaUh0R0MzeHRuUlpXSHRyem53VXBkcXVsVzhF?=
 =?utf-8?B?Nk5zZXBRWGpVN0ZaVStuSExEWUZOT0lYbjlyeEROdGZjaE9FUzE3UHcvNXor?=
 =?utf-8?B?b3BlYzhsWDB2L0V0dU43b3ArUjBEUzF0dXRQOEQyNldMSGRHaklxZDF2NzYz?=
 =?utf-8?B?dWp3ZHgrTEwreUhFaW5lWlNjYjkxcmNNcE9KeHNpcXNUcW5nZ21DN01iZnNY?=
 =?utf-8?B?aEZycTJQbXlYT1FQc1B1Ynl0cUkvNDJFdUFmRW1kK1N4K1lhUk0zNFlzcTFK?=
 =?utf-8?B?WXZ5V1l5dlU1aFlZWEw4NzZUUnN4NXVmUEN5cGVmZnpTcnZvak5zOE5FM25X?=
 =?utf-8?B?UTg1dEt3eUVUc01mMnVLblRQemh1M1g0UkJsc2gwSXA1bE11OW0zZEsySUNu?=
 =?utf-8?B?TGN5alJBU0Y2UnVZZTF3Z3h3Q2RmaTFsMitrMFN6SlJWYlRIcHJta3JwTlY0?=
 =?utf-8?B?ajB5TFNDL0RBWnhidzdPaytGS1F3VW9TeGlPOCttaXJCKzZhWjhaMFpteGtJ?=
 =?utf-8?B?bG5IUnZ5bW10QldPMjI5MjJDdnFiaVlWa2RaVlpxeWU4TDJjcHVHTkYwZStO?=
 =?utf-8?B?eEZmMzArNEh6aGdod2xYTWNKMkRxcUJlOUt3R1oyNjVhWXMzVExpdFJUZUdv?=
 =?utf-8?B?M1AzNHlnT0Z2MnN4YkV0bzNweDNUMUlTZ3JBQmpNeWtKZ1AvSDhuYXdUaWNq?=
 =?utf-8?B?WXNGQ2RtWkxnOXZYWDhPeTRzRlBsSTJDZm5HQVJvYmlNSStiNEtHUEdkSGpM?=
 =?utf-8?B?MEpHcXQzZzBMeVVjV3JEbVR3VjkreDdjN1BYTGFGMEM4anBPRHE2ZGFXbWwx?=
 =?utf-8?B?aXd4QkhobzVua1F1L1FjQjN2cVBRcVY4cWJSVmx4ZHBjZjF6UDhMeVdhQnY4?=
 =?utf-8?B?OUpERVJGK3pzVTBuazNJZnp5UDZtY2dLN0U4VWRGTVpnL3pEL3Z3eGNVRThT?=
 =?utf-8?B?QytUYkljcUFtdkc1SlFQZUxDWjRPeldVUUpVcFR6N2lkQmM3Z2tKUnlpdno5?=
 =?utf-8?B?OEEzZzQreVcvVno3b1Exa21EUTR4eU9TY0c4T2hvTms1V2Nobmk1K0o3TFB5?=
 =?utf-8?B?dE1CRWdmUmYzUkF6VmFVNDZZOWY3TkRQT0hyZTg2amsrMjhrMEY2YXRzaEJM?=
 =?utf-8?B?N1M2Q1JiaWxEbGlSVzVsOG1Pb0dNaTcwYUVsTFk1elhJUGFCZEN2WHdZSWlO?=
 =?utf-8?B?U2F4YW9ieTByd3JYVXYranNhV01HTTVpdUcwT3ZFM2dVbGpzUEloNWZuZisr?=
 =?utf-8?Q?CkfOFAcLM9nx80amkYhJe5GDqwAxnCHGdyUIv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4281C3A67FC4E247AECEBB153BA1B8F1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f31c159b-9d35-4415-a5ec-08da502e0cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 06:53:13.8310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LE7+2vIFLiAq+qTGhGCq/TCCeH5PUz4nQbvX5rzCeM9fgiNRFRl/f9NFf8R6jpzodKBGlX8xPXqryPTGjB4ZOTRrcPdUe/rZe0hbYaQe9+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2311
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oss@buserror.net" <oss@buserror.net>, "paulus@samba.org" <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzA2LzIwMjIgw6AgMDg6NDUsIExpYW5nIEhlIGEgw6ljcml0wqA6DQo+IA0KPiAN
Cj4gDQo+IEF0IDIwMjItMDYtMTcgMTQ6Mjg6NTYsICJDaHJpc3RvcGhlIExlcm95IiA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMTcvMDYvMjAyMiDD
oCAwODowOCwgTGlhbmcgSGUgYSDDqWNyaXTCoDoNCj4+PiBJbiBncGlvX2hhbHRfcHJvYmUoKSwg
b2ZfZmluZF9tYXRjaGluZ19ub2RlKCkgd2lsbCByZXR1cm4gYSBub2RlDQo+Pj4gcG9pbnRlciB3
aXRoIHJlZmNvdW50IGluY3JlbWVudGVkLiBXZSBzaG91bGQgdXNlIG9mX25vZGVfcHV0KCkgaW4N
Cj4+PiBmYWlsIHBhdGggb3Igd2hlbiBpdCBpcyBub3QgdXNlZCBhbnltb3JlLg0KPj4+DQo+Pj4g
U2lnbmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPg0KPj4+IC0tLQ0KPj4+ICAg
IGNoYW5nZWxvZzoNCj4+PiAgICB2NDogcmV1c2UgZXhpc3QgJ2VycicgYW5kIHVzZSBhIHNpbXBs
ZSBjb2RlIHN0eWxlLCBhZHZpc2VkIGJ5IENKDQo+Pj4gICAgdjM6IHVzZSBsb2NhbCAnY2hpbGRf
bm9kZScgYWR2aXNlZCBieSBNaWNoYWVsLg0KPj4+ICAgIHYyOiB1c2UgZ290by1sYWJlbCBwYXRj
aCBzdHlsZSBhZHZpc2VkIGJ5IENocmlzdG9waGUgTGVyb3kuDQo+Pj4gICAgdjE6IGFkZCBvZl9u
b2RlX3B1dCgpIGJlZm9yZSBlYWNoIGV4aXQuDQo+Pj4NCj4+PiAgICBhcmNoL3Bvd2VycGMvcGxh
dGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyB8IDM1ICsrKysrKysrKysrKysrLS0tLS0tLS0tDQo+
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0K
Pj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3Rz
MTAwMC5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3NneV9jdHMxMDAwLmMNCj4+PiBp
bmRleCA5OGFlNjQwNzUxOTMuLmU0NTg4OTQzZmU3ZSAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYw0KPj4+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAwMC5jDQo+Pj4gQEAgLTcxLDYgKzcxLDcgQEAgc3Rh
dGljIGludCBncGlvX2hhbHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+
PiAgICB7DQo+Pj4gICAgCWVudW0gb2ZfZ3Bpb19mbGFncyBmbGFnczsNCj4+PiAgICAJc3RydWN0
IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+Pj4gKwlzdHJ1Y3QgZGV2
aWNlX25vZGUgKmNoaWxkX25vZGU7DQo+Pj4gICAgCWludCBncGlvLCBlcnIsIGlycTsNCj4+PiAg
ICAJaW50IHRyaWdnZXI7DQo+Pj4gICAgDQo+Pj4gQEAgLTc4LDI2ICs3OSwyOSBAQCBzdGF0aWMg
aW50IGdwaW9faGFsdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4+ICAg
IAkJcmV0dXJuIC1FTk9ERVY7DQo+Pj4gICAgDQo+Pj4gICAgCS8qIElmIHRoZXJlJ3Mgbm8gbWF0
Y2hpbmcgY2hpbGQsIHRoaXMgaXNuJ3QgcmVhbGx5IGFuIGVycm9yICovDQo+Pj4gLQloYWx0X25v
ZGUgPSBvZl9maW5kX21hdGNoaW5nX25vZGUobm9kZSwgY2hpbGRfbWF0Y2gpOw0KPj4+IC0JaWYg
KCFoYWx0X25vZGUpDQo+Pj4gKwljaGlsZF9ub2RlID0gb2ZfZmluZF9tYXRjaGluZ19ub2RlKG5v
ZGUsIGNoaWxkX21hdGNoKTsNCj4+PiArCWlmICghY2hpbGRfbm9kZSkNCj4+PiAgICAJCXJldHVy
biAwOw0KPj4+ICAgIA0KPj4+ICAgIAkvKiBUZWNobmljYWxseSB3ZSBjb3VsZCBqdXN0IHJlYWQg
dGhlIGZpcnN0IG9uZSwgYnV0IHB1bmlzaA0KPj4+ICAgIAkgKiBEVCB3cml0ZXJzIGZvciBpbnZh
bGlkIGZvcm0uICovDQo+Pj4gLQlpZiAob2ZfZ3Bpb19jb3VudChoYWx0X25vZGUpICE9IDEpDQo+
Pj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+Pj4gKwlpZiAob2ZfZ3Bpb19jb3VudChjaGlsZF9ub2Rl
KSAhPSAxKSB7DQo+Pj4gKwkJZXJyID0gLUVJTlZBTDsNCj4+PiArCQlnb3RvIGVycl9wdXQ7DQo+
Pj4gKwl9DQo+Pj4gICAgDQo+Pj4gICAgCS8qIEdldCB0aGUgZ3BpbyBudW1iZXIgcmVsYXRpdmUg
dG8gdGhlIGR5bmFtaWMgYmFzZS4gKi8NCj4+PiAtCWdwaW8gPSBvZl9nZXRfZ3Bpb19mbGFncyho
YWx0X25vZGUsIDAsICZmbGFncyk7DQo+Pj4gLQlpZiAoIWdwaW9faXNfdmFsaWQoZ3BpbykpDQo+
Pj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+Pj4gKwlncGlvID0gb2ZfZ2V0X2dwaW9fZmxhZ3MoY2hp
bGRfbm9kZSwgMCwgJmZsYWdzKTsNCj4+PiArCWlmICghZ3Bpb19pc192YWxpZChncGlvKSkgew0K
Pj4+ICsJCWVyciA9IC1FSU5WQUw7DQo+Pj4gKwkJZ290b3QgZXJyX3B1dDsNCj4+DQo+PiBEaWQg
eW91IHRlc3QgdGhlIGJ1aWxkID8NCj4gDQo+IFNvcnJ5IGZvciB0aGlzIGZhdWx0Lg0KPiANCj4g
SW4gZmFjdCwgSSBhbSBzdGlsbCBmaW5kaW5nIGFuIGVmZmljaWVudCB3YXkgdG8gYnVpbGRpbmcg
ZGlmZmVyZW50IGFyY2ggc291cmNlIGNvZGUgYXMgSSBvbmx5IGhhdmUgeDg2LTY0Lg0KPiANCj4g
Tm93IEkgYW0gdHJ5IHVzaW5nIFFFTVUuDQo+IA0KPiBBbnl3YXksIHNvcnJ5IGZvciB0aGlzIGZh
dWx0Lg0KDQpZb3UgY2FuIGZpbmQgY3Jvc3MgY29tcGlsZXJzIGZvciBtb3N0IGFyY2hpdGVjdHVy
ZXMgZm9yIHg4Ni02NCBoZXJlIDogDQpodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1
Yi90b29scy9jcm9zc3Rvb2wvDQoNCkNocmlzdG9waGU=
