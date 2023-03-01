Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426F6A6E52
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 15:24:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRc2C6r0Kz3cFt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 01:24:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Jm0m9J2u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::624; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Jm0m9J2u;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRc1F1bMSz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 01:23:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sfj5oe0RLHRvhLln07+YrvQJ0mQT3IEl+0INpYH/5aEQw00q/0GTUob8d0bHoy8ioC/GdbM3OcFi+KcypD7UBQkOv9T+8ITPhV6z+JdCJKnAnNwGPjnY/3Z8aRgf7OV/Rv+RjksjIwAvTMXffs82crwypKRL52yIzki6ACqJWLmKwjwi88aHtbdi3I7SO4je+GwLZ5wo8t2LKNFbqJE8PlTYrMOEFg2QB1KBQdNIEsM6nmpR+xNir0Io/gCLHvM+3bkH3uXlDTjMvnhUSSZVCKQcSKfIMLf7aSIXHTV9e6s1baX0nuXuDD/DJBNigrDAs4FuURjkFoCRv+FAmzqjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/Ql0/p3gBFk2D5Ks01FM5F5Z5PytTa2ub+ncbfZSbw=;
 b=Csp8D8azu9GWprmmzb37BVi7W2xlDmnXwvmjG8bKvR/eGLW3em88/e0FpwutJzHYeztj267Ys8PlrVq5ob6tF6J9EUQHIIjiBU+lqZMAVqAiAqUaxo+Ewu4JPu6wJ//ZiIN82UIeOnyXiTjdXQilEnAapECCEesz+gEByreDAC5ksyx72ZoR69C2bdbe057wSB3Pa6GD8kaKvweCly9DjPi9FQDl5QLOTIN3qmxnmT1zYz2i656CzQwVS4l+8ClkTWPiblobNxMEYrMsrkejaNAKTV57SICxxH2q1xpqit1bZy+B+HIK+6lOu+cL68hKSu2yzMBDLAfJK3UPVbFTkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/Ql0/p3gBFk2D5Ks01FM5F5Z5PytTa2ub+ncbfZSbw=;
 b=Jm0m9J2ukbODY5HrPJy3VMorNNLnvPhDvp78hC5foUSXuKe9+iOuRuenXb2XQhBrLEC/I2WupO1bFuq8MYFT6HVlnuCyCJdTKAFon35zO4v9bFCKd0himlliRKKpYPmcvyiF+d10FlKzT3NlXjaaIbcs6nBJsx7rP9Z3mfiw5Z2eh9H/Ify4ys008OyLbMgxq8h4VBo6dhdivZLg9dQ+Sv6bnAL78Wck56BvNvKxvtE2ljBTW/Cjr91IaFwFFxgmPTRa8htbXI50UYcuQnQq0f0mgIvWiU3ZMSPFw3x29pDK9JuSdR1KjicSTuFuIFJNZL2X3GczBomcGmvFMRdMXA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3405.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 14:23:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%6]) with mapi id 15.20.6156.017; Wed, 1 Mar 2023
 14:23:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, Joakim Tjernlund
	<Joakim.Tjernlund@infinera.com>, Leo Li <leoyang.li@nxp.com>, Paul Gortmaker
	<paul.gortmaker@windriver.com>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Topic: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Index:  AQHZRSlRQroQjo8Bc0a1UitSGMqXAa7eoBaAgAFIPICAA2b4AIAA3ieAgACCsgCAAVhcAA==
Date: Wed, 1 Mar 2023 14:23:36 +0000
Message-ID: <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
In-Reply-To: <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3405:EE_
x-ms-office365-filtering-correlation-id: 5beda7fc-7734-478e-82e3-08db1a608be4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4SkdB4utx1JBrWgJeGcgc4gYduaW3upglOy0h8V1AAh7PKCwUGmLyf8IfkDHVp8VkfA5hys+b2tsVjxoFFC8ylnb1SEDSx860Ff911A49+gqMZEykaoD+5WnNLsHy1TDCLHpsyoYCB2e64ivOe6gUp+eGQLspKt4C/PH4+OThC+JlxP/oJTqMwJjam8Axlb+CW4f0xR80/2NGL8DHR5h4DelbHWQgGfiGPV9AYmJxiuz0KB5tCfhbT6w0y74AMJPTmeny41tBT8Eg5e1vQ2rKM1Xwbn5lxCiDQ35Vhlk5O/2Sm8we/7IdQGzDyQSrYKIhYbW/oNWFZyzOLumzDF54SquqtpP5a+u583+i7W7rOi5uqXt2c+hgY+qG/5kvF8sSPUCu3QX9f++B9Ex/xkczfdQgL5oB8VyYnJnMy0hbtBWKCBWsKYUVnIuezWZkkcJQVQmXx6WROcL6JvXar+lzMl/z/DtkX95pTb0NGqRTbLhey9BJLUh6egfU1rsZdSL912/o1zNqJ8WSx+QgFnhGWOs21ebn7XeFP6EG5W0OFmX9Tr0ulxOa2Lgk2UodiMXwKgSO7k9Tjh7crWj33dG7UEq/4wDEvw5HlpvYNG1CZJymrs3pcy8i11+rBkC2do5nxR8QIdflmLMqm2m9H4CK2pzZdimHrFvjTi1uGw/dsfePB9+wnIqC7TaRx2P55MA6XnAZ9h5IYFsvuBBI4mX34FnOVck4QmFRAu0o+qWT+8vz21Iy/OizpBPLQjPo5+Dr6xDdc+ClRNozKPYhZ/jGA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(451199018)(31686004)(71200400001)(66446008)(86362001)(44832011)(5660300002)(31696002)(66556008)(8936002)(64756008)(8676002)(41300700001)(4326008)(66476007)(2906002)(66946007)(36756003)(38100700002)(6486002)(122000001)(91956017)(316002)(38070700005)(478600001)(54906003)(76116006)(66574015)(83380400001)(110136005)(26005)(186003)(2616005)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ejlXS0hBK0hMeFpITDRiUFJ4UUVDTXgybitpei8rK05OckpoR08xTWpJcXpJ?=
 =?utf-8?B?NXU3dzdtYnRSc1JGOEZsZ0J6QU5lSDh1N0tpYkY0VytSK3RPemZzMXdtWEZD?=
 =?utf-8?B?V3MwZmFzVW5yTHlISFIvY1VWMWhJMU0wMzg2eGd4SmlQY20xS0l0NXB0SWpr?=
 =?utf-8?B?YnFUOFdXVjNYNzk1eTg0QmNYMWMyRElpbkNiUHFMS0xpZ3hGeVBrb2k1amlr?=
 =?utf-8?B?NGk4Q2pCeU5DUHc0T3pOR1hQSXRrZHptMUNIQUgrZUhtbnVxUk40d1pyREVq?=
 =?utf-8?B?c0NBZXZGMWZmTUxBNWNYbVROc3cyRXFSZkh0bU45eHBGOE1RUHdjT0VoREFx?=
 =?utf-8?B?VVlhOUY5Y1dLczMrbG9ZT1pyaUtmVGVqM09GS214cU5LYWorZzZhWmFxRDZB?=
 =?utf-8?B?SlBSOVhjVWlYTm1WWlhWQTl1OTBWUXE5eFBXbEdST3QxYXFKMDdtNkJZdHFG?=
 =?utf-8?B?NUxGeHU5WDZHdkQ4b05HL09QM2o3MDUvNXhnb2VwY2VEcmZOYjV0bi81NlJC?=
 =?utf-8?B?R0hBTERITDJMUzFEM0JURHlwRUdNN1A1VE1ETnZ6Sml5OG9UR1lacTZPRktk?=
 =?utf-8?B?bzZ2b2FXSUVqeE5qM3hDV0NSbXJaRDFVVEhFZDBSZ2N1Zm84MTdJdnhia2oz?=
 =?utf-8?B?K3RFWjhMaXBZdHpXWG9mcFpuYldjc0tzN1BONlF2TjV3YXVBSTV5dk05NHVz?=
 =?utf-8?B?QzYwdnRRTUtNS09WZm92UXUxeUIzTmN3dlRsTkorOFo3WmIvOTNIcmh6OVQ5?=
 =?utf-8?B?R0RERUdFUms1ckliZ1ZaS0VtL2tLVUZQRHVUazE5ZlZxN290dnIrMWdBKzBV?=
 =?utf-8?B?dWdCVXRxS0lBK1hCZkdUUFhscktlZWYrcjBBZ3drNFd1dmJrMzNPVVZDME1t?=
 =?utf-8?B?aEZIV3hHaytiaG1nbjFZemJFNFpKU0lxMWdDS2RqVFhGVzVZaHBEaEdBQy9Y?=
 =?utf-8?B?QTNFNE9XZWk0S29FS2oxelhFdGs4Mk9oeXVRaXJUdERpNDB6MkdoTjZpWlBs?=
 =?utf-8?B?cUFkYTRJVEd6SGthcnpObWZmUk0ycjF3KzNkOUZ3eGZ3M2RXT0UrMXZVT3ND?=
 =?utf-8?B?WlR1VWd5bXczS05XaFo2VCtHdnIxbnhrWm8vR0ZqSDdwbzlnczRIdTZ2WTY1?=
 =?utf-8?B?emNMancvY2EwSzA1WG9xODhremprWThwak8rM0N3T1hoRkpPdUEzQTJuZ0FE?=
 =?utf-8?B?VVpWQmMzbFVVdDB2RXZKSHNDajNKRHZUbUo0QzRtdy9OTkNyZitEakN3K3J5?=
 =?utf-8?B?d1B6MTQyODBjQnBvOXdqT1dXTG9yL0Nob1l2clZZRmJwbHh2dWFHMUV0djJs?=
 =?utf-8?B?b0dybDl0UjZNWkpOTDBEQjkrZldPWUlSeWtLUHFZbkM3bG9jdkFrRHA0bDBr?=
 =?utf-8?B?WnMyNm5JTTh6OUpndjlnbFRWbWwzb2RPSkEzcWtmMG56SkZJZ3VyeDFQZ0Fo?=
 =?utf-8?B?em83SGNvQ2VQOTg0b1ZwRzRRK0F3dmx5T25namlPcEo4bVBFOWlpZ3VvM29U?=
 =?utf-8?B?N1hxY3lQTUxtaFZKZ2hjT2ZrMFMxeXZrKzhFckJOVGJMb3kxektYMStyUmtP?=
 =?utf-8?B?aGFFeFlSWjg3QnowY2VhRlpzTzVVOU9VaEwzMStzUHN3QkpmTWgvMHdDNUdM?=
 =?utf-8?B?NytORnVCRzhPMkNRNHpudUdVL2xreUlUQUlzTjRGT1VpR2o1ZG1oa05xcnBX?=
 =?utf-8?B?SUp5UVFESXk4UXRPNE4rRVIweCszUUcydFhYSURLdHFzL2VsR3NlUnlhZldW?=
 =?utf-8?B?Z1N5NTdwWFNJZUtDbXdROHZBalBscFlPTUwwVzZzc1BKYmZ3YUZyeVlXVENE?=
 =?utf-8?B?NS9KZElaVDlTUFlyOVFmWkRNK1lDb3BjaTI5UDBVNTEzTkorV2FrRkVDMHVh?=
 =?utf-8?B?MmY5RTZpamhaTDk4cDY5QmRpL3hHN1RLbkNyUU9iL2d6VDNMTkN2aHdBSUJK?=
 =?utf-8?B?NVBmcC9pVitNU1ZaNzVVMzhGem9PUEVDODZtUnl3Q0dWdFJ2VTlYM2xNZlQ0?=
 =?utf-8?B?dVRtYUhnRkY5NWtZQUxHcG9qU0FuNzFSZjNNSW81TFlndHF1ZGYwTWVrQ3Uy?=
 =?utf-8?B?MUJpcWdQemdXdFRCd2pRMk16a3kwZUlIOHhKdUFvVjVYWWtRY0JWbC9LdUdJ?=
 =?utf-8?B?TTVORlhaSldwNnhyaXFERlp4M0llRHh4NXJMVTVnZkhSbFU3WHBRcE94NjNq?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80247F968BA6B8418AC8EF2993B8332E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5beda7fc-7734-478e-82e3-08db1a608be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 14:23:36.8623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QrdC+yPq1q04WVYlwJSyUVKBOOUb00oMS6SoBsDNNJVpnOi6RxwJBgqatyYN108194rp5Wfm7WpNaQxJTZnsWIKnM9kYWhXeolr1XBbwZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3405
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
Cc: Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAyLzIwMjMgw6AgMTg6NTEsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gVHVlLCBGZWIgMjgsIDIwMjMsIGF0IDExOjAzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0K
Pj4gT24gTW9uLCAyMDIzLTAyLTI3IGF0IDE0OjQ4IC0wNjAwLCBMaSBZYW5nIHdyb3RlOg0KPj4+
Pj4+DQo+Pj4+Pj4gSGVyZSwgd2UgcmVtb3ZlIHRoZSBNUEM4NTQ4RS1NRFNbMV0sIHRoZSBNUEM4
MzYwRS1NRFNbMl0sIHRoZQ0KPj4+Pj4+IE1QQzgzN3hFLU1EU1szXSwgYW5kIHRoZSBNUEM4MzJ4
LU1EU1s0XSBib2FyZCBzdXBwb3J0IGZyb20gdGhlIGtlcm5lbC4NCj4+Pj4+Pg0KPj4+Pj4+IFRo
ZXJlIHdpbGwgc3RpbGwgZXhpc3Qgc2V2ZXJhbCBlMzAwIEZyZWVzY2FsZSBSZWZlcmVuY2UgRGVz
aWduIFN5c3RlbSAoUkRTKQ0KPj4+Pj4+IGJvYXJkc1s1XSBhbmQgbWluaS1JVFggYm9hcmRzWzZd
IHdpdGggc3VwcG9ydCBpbiB0aGUga2VybmVsLiAgV2hpbGUgdGhlc2UNCj4+Pj4+PiB3ZXJlIG1v
cmUgb2YgYSBDT1RTICJyZWFkeSB0byBkZXBsb3kiIGRlc2lnbiBtb3JlIHN1aXRlZCB0byBob2Ji
eWlzdHMsIGl0DQo+Pj4+Pj4gcHJvYmFibHkgbWFrZXMgc2Vuc2UgdG8gY29uc2lkZXIgcmVtb3Zp
bmcgdGhlc2UgYXMgd2VsbCwgYmFzZWQgb24gYWdlLg0KPj4+Pj4NCj4+Pj4+IFRoZXNlIGJvYXJk
cyBhcmUgbWFzcyBtYXJrZXQgYm9hcmRzIHRoYXQgc29sZCBpbiBsYXJnZXIgYW1vdW50IGFuZCBh
cmUgbXVjaCBtb3JlIGxpa2VseSB0byBzdGlsbCBiZSB1c2VkLiAgV2Ugd291bGQgc3VnZ2VzdCB3
ZSBrZWVwIHRoZW0gZm9yIG5vdy4NCj4+DQo+PiBBZ3JlZWQsIHRoZSBSRFMgZGVzaWduIGlzIHN0
aWxsIHVzZWQgaGVyZS4NCj4gDQo+IENhbiB5b3UgZWxhYm9yYXRlIHdoYXQgdGhlIHR5cGljYWwg
a2VybmVsIHVwZ3JhZGUgc2NoZWR1bGUgZm9yDQo+IHRoZXNlIGJvYXJkcz8NCj4gDQo+IE5vdGUg
dGhhdCBmb3IgdGhlIGRlYmF0ZSBhYm91dCBkcm9wcGluZyB0aGUgbWFjaGluZXMgZnJvbSBmdXR1
cmUNCj4ga2VybmVscywgaXQgZG9lcyBub3QgcmVhbGx5IG1hdHRlciBob3cgbWFueSByZW1haW5p
bmcgdXNlcnMgdGhlcmUNCj4gYXJlIG9yIGhvdyBtYW55IGJvYXJkcyBnZXQgc29sZC4gVGhlIG9u
bHkgcXVlc3Rpb24gaXMgd2hldGhlcg0KPiBzb21lb25lIGlzIHN0aWxsIHBsYW5uaW5nIHRvIHBy
b3ZpZGUgdXBncmFkZXMgdG8ga2VybmVscyBsYXRlcg0KPiB0aGFuIGxpbnV4LTYuMyBpbiB0aGUg
ZnV0dXJlLg0KPiANCj4gSXQgc291bmRzIGxpa2UgdGhlcmUgYXJlIGNvbW1lcmNpYWwgcmVxdWly
ZW1lbnRzIGZvciB2YWxpZGF0aW5nDQo+IGFuZCBkaXN0cmlidXRpbmcga2VybmVsIHVwZ3JhZGVz
IChpbiBhZGRpdGlvbiB0byBob2JieWlzdCB1c2VzKSwgc28NCj4gSSB3b3VsZCBleHBlY3QgdGhh
dCB3aG9ldmVyIGlzIHBheWluZyBmb3IgdGhlIHVwZ3JhZGVzIGhhcyBhIGNsZWFyDQo+IHBsYW4g
Zm9yIGhvdyBtdWNoIGxvbmdlciB0aGV5IGFyZSBnb2luZyB0byBkbyB0aGF0LCBvciBhdCBsZWFz
dA0KPiBhIHNvbWUgaWRlYSBvZiBob3cgbWFueSBvZiB0aGUgcHJldmlvdXMgTFRTIGtlcm5lbHMg
KDUuMTAsIDUuMTUsDQo+IDYuMSkgZW5kZWQgdXAgYWN0dWFsbHkgZ2V0dGluZyBzaGlwcGVkIHRv
IHVzZXJzLg0KPiANCj4gSXQgbWF5IGJlIHdvcnRoIHBvaW50aW5nIG91dCB0aGF0IHRoZSBvZmZp
Y2lhbCB3ZWJwYWdlIGZvcg0KPiB0aGUgTVBDODMxM0VSREIgYm9hcmQgaW4gdGhlIGV4YW1wbGUg
b25seSBsaXN0cyBhIGhpbGFyaW91c2x5DQo+IG91dGRhdGVkIEJTUCBrZXJuZWwgYmFzZWQgb24g
YSBwYXRjaGVkIGxpbnV4LTIuNi4yMyByZWxlYXNlLA0KPiBzbyBtYXliZSB0aGUgbWFya2V0aW5n
IHRlYW0gY2FuIGNoYW5nZSB0aGF0IHRvIHBvaW50IHRvIHRoZQ0KPiBsYXRlc3QgdmFsaWRhdGVk
IExUUyBrZXJuZWwgaW5zdGVhZC4NCg0KTGV0IG1lIHByZXNlbnQgdGhpbmdzIGluIGEgc2xpZ2h0
bHkgZGlmZmVyZW50IHdheS4NCg0KTXkgY29tcGFueSBoYXMgZGVzaWduZWQgYW5kIG1hbnVmYWN0
dXJlZCBhbmQgc29sZCBjb21tdW5pY2F0aW9uIHN5c3RlbXMgDQplbWJlZGRpbmcgdGhyZWUgdHlw
ZXMgb2YgYm9hcmRzOg0KLSBGaXJzdCBnZW5lcmF0aW9uLCB3aXRoIE1QQyA4NjYsIGRlc2lnbmVk
IGFyb3VuZCAyMDAyLg0KLSBTZWNvbmQgZ2VuZXJhdGlvbiwgd2l0aCBNUEMgODg1LCBkZXNpZ25l
ZCBhcm91bmQgMjAxMC4NCi0gVGhpcmQgZ2VuZXJhdGlvbiwgd2l0aCBNUEMgODMyMSwgZGVzaWdu
ZWQgYXJvdW5kIDIwMTQuDQoNCldoZW4gTlhQIGFubm91bmNlZCBlbmQgb2YgbGlmZSBvZiBNUEMg
ODY2IGFuZCA4ODUsIHdlIGJvdWdodCBlbm91Z2ggQ1BVcyANCnRvIGJlIGFibGUgdG8gcHJvZHVj
ZSBib2FyZHMgZm9yIHRoZSAxMCBmb2xsb3dpbmcgeWVhcnMgc28gd2Ugc3RpbGwgDQpwcm9kdWNl
IHNvbWUuDQoNCk1QQyA4MzIxIGlzIHN0aWxsIGluIHByb2R1Y3Rpb24uDQoNCkFsbCB0aG9zZSBi
b2FyZHMgYXJlIHVzZWQgaW4gY3JpdGljYWwgc3lzdGVtcyB3aGVyZSB3ZSBoYXZlIGEgY3VzdG9t
ZXIgDQpyZXF1aXJlbWVudCB0byBrZWVwIGFsbCBzb2Z0d2FyZSBpbmNsdWRpbmcgVS1ib290IGFu
ZCBMaW51eCBrZXJuZWwgdXAgdG8gDQpkYXRlLCBmb3IgSVQgc2VjdXJpdHkgcmVhc29uIG1haW5s
eS4NCg0KVW50aWwgbm93LCB0aGUgYm9hcmRzIHdlcmUgZGVsaXZlcmVkIHdpdGgga2VybmVsIDQu
MTQsIHdpdGggaXMgZHVlIHRvIA0KRU9MIGVhcmx5IG5leHQgeWVhci4NCkF0IHRoZSBtb21lbnQg
d2UgYXJlIHdvcmtpbmcgb24gdXBncmFkaW5nIHRvIG1haW5saW5lIGtlcm5lbCB3aXRoIHRoZSAN
CnRhcmdldCBiZWluZyB0byBiZSBhYmxlIHRvIHVwZ3JhZGUgb3VyIGN1c3RvbWVycyB0byBuZXh0
IExUUyBrZXJuZWwgYXQgDQp0aGUgYmVnaW5pbmcgb2YgMjAyNC4NCg0KTm90ZSB0aGF0IGJlY2F1
c2Ugb3VyIGtlcm5lbCBjb2RlIGlzIHByZWhpc3RvcmljLCBpdCBpcyBub3QgbWVyZ2VhYmxlIHRv
IA0KbWFpbmxpbmUuIE5vdCBiZWNhdXNlIG9mIGxpY2VuY2UgaXNzdWVzIGJ1dCBiZWNhdXNlIHRo
ZSBjb2RlIGlzIGp1c3Qgbm90IA0KZm9sbG93aW5nIGF0IGFsbCBsaW51eCBzdGFuZGFyZC4gU28g
b3VyIGJvYXJkcyBhcmUgbm90IGluIG1haW5saW5lLiBUd28gDQpvZiB0aGVtIGFyZSBpbiBVLWJv
b3QgYW5kIHRoZSB0aGlyZCBvbmUgc2hvdWxkIHNvb24gYmUgYXMgd2VsbC4NCg0KU28sIHRvIGNv
bWUgYmFjayBhYm91dCB0aGUgUkRCIGJvYXJkcywgd2UgaGF2ZSBhIGNvdXBsZSBvZiBNUEMgODg1
IEFEUyANCmFuZCBhIGNvdXBsZSBvZiBNUEMgODMyMSBSREIuIFRoZXkgYXJlIHJlZmVyZW5jZSBi
b2FyZHMgYW5kIHdlIGFsd2F5cyANCmNoZWNrIHRoYXQgYSBnaXZlbiBrZXJuZWwgdmVyc2lvbiBw
cm9wZXJseSBydW5zIG9uIHRoZW0gYmVmb3JlIHN0YXJ0aW5nIA0KdG8gcG9ydCBpdCB0byBvdXIg
aGFyZHdhcmUuDQoNCkhvcGUgaXQgY2xhcmlmaWVzIGhvdyB0aG9zZSByZWZlcmVuY2UgYm9hcmRz
IGFyZSB1c2VkLg0KDQpDaHJpc3RvcGhlDQo=
