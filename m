Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF41619F62
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 19:01:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3pNj3KmJz3dtr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 05:01:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LNcJ2zqK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.85; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LNcJ2zqK;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90085.outbound.protection.outlook.com [40.107.9.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3pMl1jV1z3bm6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 05:01:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BztolZ3UiIK1T+XDgQJ79eFuw7vn0aXDrb38TRV5j+eVCpAmaqwvc3XTDFKA0sZ5gyXoXQPmSQDfbF+4JvbCvP5TqptNEHERjMsGP/lbJf4VZXyr7ZKsbU2hlVFk0oCDYr36bG7Q2mniRoEioChhIc3cqEeLGoG7ihhyULlvI/R6J4bjAztZ/SjfS01fnUlmgighVXblpFmp4+mNgT0uvCkHpI9S5WuozQgJFtdR0yTP8MsanUZ0A0uD5AYtF9mu9FZuDmUmFgEDp4vVL1rTAxgDGw0wgrznduV1q/J9KY3f0WbFVXvuIbLPRSIvXMZ02f5HhClyMlAv9G7bHPaf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmWX89asRFhlho9HKGQo7kIjAzuy8h8CqJg3LzCT94M=;
 b=FeSE+iwsZyz2iFx+S7qN3GeYj/CVySo5b0uNm3XsxXIpZkQknP+57mm+HlswRp4Ej0wBEeWIdfFKuH81vT2LMIi1fgxqqkWzcuDKSPAS3l5MprWw8ATvkRgV/wI35wQbK+qcJM+cwTNY5ntaojIyttvVZkAzschVMefSDJ9wbkboM5e3vqPrmTbgkkx368VhKJfxt9Vql8FgLrVINavQTjQZ1ZnXlEqmLHYr63YFDpfIRiDLYhzxnVkawNu9QbLdYqVSdEsRHYxq8IjYtB64HlMdCkPP2rQ0XiphpY4ctuWlf4R7TuNQ0o5a+kiphvrouIfpeQI9YxCSZJWl6xONdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmWX89asRFhlho9HKGQo7kIjAzuy8h8CqJg3LzCT94M=;
 b=LNcJ2zqKdf7Ljh9O3LXWZh4xRY3Au6jI/4pD1zMZ/RUmERAQrkb/GcJuCGiZX2VBdmrMUNG23fg2sQnKXPCgJTls9bEciBXeSR8Bbpz0dgHcY7HOEnGQPHS3wdJAytEZ0pEd6POBuhm3n2+co5nKmGbvzWeEX+KGXCcUbn717tIEjA5Wzo1mCsdu/ZxstkRDhhmVMfnYvgjGsDfbwv9R9S6APQTjEnycvZQcIRXJSKJXg8g8vngKetBtbQt7xD7sWg1H9tC1i/tBbVVN/DD+MCOLNoIGtbTcgG6kt0ntr5OFw83kCrAsb4ofuU8DyETmEr7u1qgOK1crwXGhaEReJQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1949.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 18:00:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 18:00:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 3/6] powerpc/powernv: Keep MSR in register across OPAL
 entry/return path
Thread-Topic: [RFC PATCH 3/6] powerpc/powernv: Keep MSR in register across
 OPAL entry/return path
Thread-Index: AQHY8HLdviI9IY1NsU6o5/Z+qmRcQa4vDc0A
Date: Fri, 4 Nov 2022 18:00:47 +0000
Message-ID: <1ab4f306-2338-91c2-0329-caa750594977@csgroup.eu>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
 <20221104172737.391978-4-ajd@linux.ibm.com>
In-Reply-To: <20221104172737.391978-4-ajd@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1949:EE_
x-ms-office365-filtering-correlation-id: d21c38f3-e345-4a06-e0df-08dabe8e8077
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ngXWTRck/ySp8BrjNMTyr+h9JkzGu+xbzg+NIcMzcqQUyTA1+DcRP+lhlVVIfHDbU3CAKJkhQYEZ278rusjrvnoEQnFmGnXQ4bAkGSZmr863yXbJW7NVcmOEdtLlM2uY9aBZkCkULxR+LRVy73BXPWXvRZtmW6h1h2VaCrdzacqVDL+/cikc5NNDP0SrehrvVWj+kzp43TW0IR9NfLmvIBQnybs3CISy9vkFhfxLCK8MdlJlzprADiY3m78u4nMcZuYqh7ByGleAxRtxfSvo8YXdkuHLRTgwgxOxGlNyMTIFCoOlMZGcnJJ4UxHueVOaQ5NINKNCmtcJdd651XI48jephP/HbvLrhobtKpidXRFjQXxa9E2/QENMksxj/ghLVL28TKGqyHoXYnYIyZm8Yfm2sEOssIm0eAaLe7MxbRcDg2sCOaUlAk8VaEFt9KDsFsr+XOWSxOAWcFtPQGaL1bRkYv9UPBem8ZthMM4ka9bs7vAXZd2O+mVkm6E9pm1bzi3kytRYI60leFofKRMvoXPZenZX7VhWzO1/sN2cDsHZ/Wx5/SM2oy8gWK68u/TXN+r0pTYq1WEhVnnkW1ZtA/N8wa7bbGg/fqD+1YIfYua/xRtSJKL5fL11iR5HBX7N9MIdgXb1dqcjL15fmv5y0Py7xpIj19iOlZ/sbrmoVMzUpuu9dCbn5Uj3tSWZIKG2BYOCod1Aplf6L+b4qKwtRBiFNwyjK1y7QieUD7vaVhFxhYfTp1tH3ICyr28Cs8CLmCi5i82jvysX5oBrm2Hs/HQ95VWXfrK8KxSzSebYf6591GCjdjzwhLKYqCRbNUW9WLzvKaxQ2zwP4NA02JI41A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39850400004)(451199015)(5660300002)(316002)(66446008)(91956017)(2616005)(478600001)(66556008)(76116006)(31686004)(110136005)(54906003)(4326008)(71200400001)(41300700001)(8936002)(66476007)(6506007)(26005)(64756008)(6512007)(83380400001)(44832011)(186003)(66574015)(2906002)(6486002)(66946007)(36756003)(122000001)(38100700002)(31696002)(38070700005)(86362001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WlpJN1huSi9qZHFQK3kxdUFpbisxNWVab3hYTEdrVml6dWtUM054L0lTOTNE?=
 =?utf-8?B?bE5aQzdRVjdrQmJnUGovQk0raTBiSk5KRkZIZ2hLT1NHR0VJdnY3TUFFbmIx?=
 =?utf-8?B?cGxrYUVXaDFGbzZMeWlGUlhLSjVvV0UyRzJ0QVFXRkVNUkFLaEVUb2p1MEJl?=
 =?utf-8?B?ekZ3c1pFcEkvcWgyYVIrNmlVYnJMNmg0MmdXN2RpZ3BPb0JqL1l6ZlAwckxo?=
 =?utf-8?B?ZDRrRnRyeU4raXFKWmlKNHRpUVBySEs4UUhCUlQvM3d2UXpRRXduTEdRdldK?=
 =?utf-8?B?d2ZqbWJCUmlTQThhcXdiMEQ2WjZPbmNWOUY5U20rMlBpTkFtdU1PUTNtb1JS?=
 =?utf-8?B?MU13T3hnWTRtb1pydW5ZU29NZ1FYaURncml6VDE5T3VCUmV3M1lpTEVTb3Zj?=
 =?utf-8?B?Q3lZZzZRbkVmMVQzc2J6WUxWVG0xWVFaL2tjNkFlaHBvL0syejAyWDFiU0RS?=
 =?utf-8?B?VEY0U3VZZXpHVDUwb25BeGJPd0d0WEFSZk5JS1NDbmJBcnRrM0dZZFpBdG9F?=
 =?utf-8?B?Q2ZWeExxLytVTnNpQ3JvNlBIejVVaHZBKzM1K1V3U3BCcWhsUlFPYWY2eDJ1?=
 =?utf-8?B?NVppbkN5cWt1UVAvTjdaeG9NS1REMkpRc1BEcXBGSm4wclU2WEdaMlFBOWo2?=
 =?utf-8?B?bmVEVHA5Tk1mRHk5MmltaXpBM3FCaWF3R0toTlR2UHVJdGFDSWhGWFJKbDNw?=
 =?utf-8?B?M0s3NE16aVBkOVVVMXQyRFpJTTJVWmhFcU1GSTgwRzdQc1NydStWUVVHVExS?=
 =?utf-8?B?eG1MR0xIMHdlT282QnVVK1RNU21zS1FIUmwzSjNOUFFEa1owdTFrUVN2ZnpZ?=
 =?utf-8?B?SnhERXp4N0lBbkNVTmYxQkZ2UTNYV0pHRE9YSTdXZEdTQWJYemU5WXJaMnhk?=
 =?utf-8?B?T3lTQWlvOFVHYTF5Y3UxWnJlWmdnMkZsN3U4N1BOOC9NUzNGMFhvUldBZ3o5?=
 =?utf-8?B?YmovcS9Nd05tYzUwNmM5azdEUkNiVFg2OHNmSGVuQUcvaE9aeHJBVHE2YTky?=
 =?utf-8?B?d2dLNCthcjFiTWRWclVkVnJDWVFsZ1VocHFZQjFrckN6bjFkbzBUdElZOXlN?=
 =?utf-8?B?NVZwZlozckZsYjRHSDhuVDNqM1ZKTnBveWFPZWtGY1ZGMnQzTjh0MXd0WWRj?=
 =?utf-8?B?SHBwNXNPZG5XY1k1NXc0Mkx2Sktqa2lQcXZOelFobVFNbklNTVJIaGFvWU9j?=
 =?utf-8?B?TzRnbWpqTFF1U09kMkF0R0o3MEcvYWtyQjBYYUlwMmNWNWlDRVY1cVBxQUJ1?=
 =?utf-8?B?dmo1bVRaUmVxNDdvNzNoRWtZTlp3ZnVTS2tuZENEN01ibVF2YU52akNlTjJ3?=
 =?utf-8?B?ZlZKSTZMT1pOK1cyeFNISkpRZ1hIaUIxNDhtaURxZ0l3azdKSWNDbXA3dHk2?=
 =?utf-8?B?c3ZtQnh6NE1iRmpUT2M2aHBZTkN2K3dja0ZyN3VJZ3BKbkF6NUxzd1MyaVNX?=
 =?utf-8?B?Wjl5ZFZCQ1ZJSDN3cSt4L1BhMGVHM2JNaGxLK21EMjk2RnhqdWczNXJLREVP?=
 =?utf-8?B?NUtIS3BvMGhFeFFwb3lETnZDSHkyaGVwYVhHUEtaR3lZeWFLcVZDVllFN1Vm?=
 =?utf-8?B?WUpVdlg5QUZZc1VaaXdnTGFrQzQvQkJxek4zb3FWODBZbTBLYUxObUFaUGti?=
 =?utf-8?B?cDhVQlF3WWwwQWVSeTY4SkFVVkJFbHFVcnFJYzJGR0dDbzN5RE1RUm9NRlZP?=
 =?utf-8?B?SEcxQ2hCaS9EcDVnbU1YY1BrVmM5bzZaeEpXbDhRYnlodEJrMzN3UWNXRWhI?=
 =?utf-8?B?NnluUHdwL0JNYk9KTk40VGQyMVVJRGUwMWZVV09JajNNMkZXbmxUWUVjekdi?=
 =?utf-8?B?Z3RNNDJkUFovOW5jWEdwamIyV2k2NG1nN1h4eFp5WXhuNFNrMkcyYWx0Mkhx?=
 =?utf-8?B?Q1QvUU85Mi80U0l4emI4MVZudG82U0djbU90QWtFSzlKbWxDYWZGTFlacDlZ?=
 =?utf-8?B?MExNSjRCakpIWjJTQW1MQzZhZkNrWjFqQW52Um04MlhMSjU2bmVQaGFLVlVF?=
 =?utf-8?B?MmhNWEpnMnRRSnhWbExZYWJEenl5TCt1a0QyUXlKWmhWYnBianhwWmxoRUtU?=
 =?utf-8?B?SituSXlBc2t2SDBub1hrWlZGOHhkZk5VK1VGdDlqZlhyQ1NTS25hUjlvUGFn?=
 =?utf-8?B?YlFlLzVNb3BPU25UcmlTWVJDUHFFVFVSdU96V0dxRTVraEtVTXMwT2h5R1Nz?=
 =?utf-8?Q?oHjKcVDbpbm68AcrQ1cwgNY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF441DF6517A4447BABF19AAD900FA87@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d21c38f3-e345-4a06-e0df-08dabe8e8077
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 18:00:47.5683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLvj2ZMv88sJmUFspspfFS/FY1lhyFaTE85n8NRpB/hGR4a9bvTBifUyl2zj6vFpFQQBOOkXu3Zb6iGuITVfhUeEsFKn3/z7wyITXNofD/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1949
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
Cc: "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzExLzIwMjIgw6AgMTg6MjcsIEFuZHJldyBEb25uZWxsYW4gYSDDqWNyaXTCoDoN
Cj4gV2hlbiB3ZSBlbnRlciBhbmQgcmV0dXJuIGZyb20gYW4gT1BBTCBjYWxsLCB0aGVyZSdzIHRo
cmVlIHBpZWNlcyBvZiBzdGF0ZQ0KPiB3ZSBoYXZlIHRvIHNhdmUgYW5kIHJlc3RvcmU6IHRoZSBz
dGFjayBwb2ludGVyLCB0aGUgUEFDQSBwb2ludGVyLCBhbmQgdGhlDQo+IE1TUi4gSG93ZXZlciwg
dGhlcmUncyBvbmx5IHR3byByZWdpc3RlcnMgdGhhdCBPUEFMIGlzIGd1YXJhbnRlZWQgdG8NCj4g
cHJlc2VydmUgZm9yIHVzIChyMSBmb3IgdGhlIHN0YWNrIHBvaW50ZXIgYW5kIHIxMyBmb3IgdGhl
IFBBQ0EpLCBzbyB0aGUgTVNSDQo+IGdldHMgc2F2ZWQgb24gdGhlIHN0YWNrLg0KPiANCj4gVGhp
cyBiZWNvbWVzIHByb2JsZW1hdGljIHdoZW4gd2UgZW5hYmxlIFZNQVBfU1RBQ0ssIGFzIHdlIG5l
ZWQgdG8gcmUtZW5hYmxlDQo+IHRyYW5zbGF0aW9uIGluIG9yZGVyIHRvIGFjY2VzcyB0aGUgdmly
dHVhbGx5IG1hcHBlZCBzdGFjay4uLiBhbmQgdG8NCj4gcmUtZW5hYmxlIHRyYW5zbGF0aW9uLCB3
ZSBuZWVkIHRvIHJlc3RvcmUgdGhlIE1TUi4NCg0KRG8geW91IG5lZWQgdG8gcmVzdG9yZSBNU1Ig
cmVhbGx5ID8gQ2FuJ3QgeW91IGp1c3Qgc2V0IE1TUl9EUiB0byBhY2Nlc3MgDQp0aGUgc3RhY2sg
dGhlbiByZXN0b3JlIE1TUiA/IE9yIG1heWJlIHlvdSBkb24ndCB3YW50IHRvIGRvIGl0IGluIHR3
byANCnN0ZXBzIGZvciBwZXJmb3JtYW5jZSByZWFzb24gPw0KDQo+IA0KPiBLZWVwIHRoZSBNU1Ig
aW4gcjEzLCBhbmQgaW5zdGVhZCBzdG9yZSB0aGUgUEFDQSBwb2ludGVyIG9uIHRoZSBzdGFjayAt
IHdlDQo+IGNhbiByZXN0b3JlIHRoZSBNU1IgZmlyc3QsIHRoZW4gcmVzdG9yZSB0aGUgUEFDQSBp
bnRvIHIxMy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBEb25uZWxsYW4gPGFqZEBsaW51
eC5pYm0uY29tPg0KPiAtLS0NCj4gICAuLi4vcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFs
LXdyYXBwZXJzLlMgfCA0MyArKysrKysrKysrKy0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFsLXdyYXBwZXJzLlMgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC13cmFwcGVycy5TDQo+IGluZGV4IDBlZDk1Zjc1MzQx
Ni4uZDY5Mjg2OWVlMGNlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bv
d2VybnYvb3BhbC13cmFwcGVycy5TDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93
ZXJudi9vcGFsLXdyYXBwZXJzLlMNCj4gQEAgLTIzLDQwICsyMyw0OSBAQA0KPiAgIF9HTE9CQUxf
VE9DKF9fb3BhbF9jYWxsKQ0KPiAgIAltZmxyCXIwDQo+ICAgCXN0ZAlyMCxQUENfTFJfU1RLT0ZG
KHIxKQ0KPiAtCWxkCXIxMixTVEtfUEFSQU0oUjEyKShyMSkNCj4gLQlsaQlyMCxNU1JfSVJ8TVNS
X0RSfE1TUl9MRQ0KPiAtCWFuZGMJcjEyLHIxMixyMA0KPiAgIAlMT0FEX1JFR19BRERSKHIxMSwg
b3BhbF9yZXR1cm4pDQo+ICAgCW10bHIJcjExDQo+ICAgCUxPQURfUkVHX0FERFIocjExLCBvcGFs
KQ0KPiAgIAlsZAlyMiwwKHIxMSkNCj4gICAJbGQJcjExLDgocjExKQ0KPiAgIAltdHNwcglTUFJO
X0hTUlIwLHIxMQ0KPiAtCW10c3ByCVNQUk5fSFNSUjEscjEyDQo+ICsNCj4gICAJLyogc2V0IHRv
a2VuIHRvIHIwICovDQo+ICAgCWxkCXIwLFNUS19QQVJBTShSMTEpKHIxKQ0KPiArDQo+ICsJLyoN
Cj4gKwkgKiBXZSBuZWVkIHRvIGtlZXAgdGhlIE1TUiB2YWx1ZSBpbiBhIHJlZ2lzdGVyIHRoYXQg
aXMgcHJlc2VydmVkIGJ5DQo+ICsJICogT1BBTCwgc28gdGhhdCB3ZSBkb24ndCBuZWVkIHRvIGFj
Y2VzcyB0aGUgc3RhY2sgYmVmb3JlIHdlIHJlc3RvcmUNCj4gKwkgKiB0aGUgTVNSLCBhcyB0aGUg
c3RhY2sgbWF5IGJlIHZtYWxsb2NlZCBhbmQgdGh1cyByZXF1aXJlIE1NVS4NCj4gKwkgKg0KPiAr
CSAqIE1vdmUgdGhlIFBBQ0EgZnJvbSBSMTMgaW50byB0aGUgc3RhY2sgcmVkIHpvbmUsIGFuZCBw
dXQgTVNSIGluIFIxMy4NCj4gKwkgKi8NCj4gKwlzdGQJcjEzLC04KHIxKQ0KPiArCWxkCXIxMyxT
VEtfUEFSQU0oUjEyKShyMSkNCj4gKw0KPiArCS8qIFN3aXRjaCBvZmYgTU1VLCBMRSAqLw0KPiAr
CWxpCXIxMSxNU1JfSVJ8TVNSX0RSfE1TUl9MRQ0KPiArCWFuZGMJcjExLHIxMyxyMTENCj4gKw0K
PiArCW10c3ByCVNQUk5fSFNSUjEscjExDQo+ICAgCWhyZmlkDQo+ICAgb3BhbF9yZXR1cm46DQo+
ICAgCS8qDQo+ICAgCSAqIFJlc3RvcmUgTVNSIG9uIE9QQUwgcmV0dXJuLiBUaGUgTVNSIGlzIHNl
dCB0byBiaWctZW5kaWFuLg0KPiAgIAkgKi8NCj4gICAjaWZkZWYgX19CSUdfRU5ESUFOX18NCj4g
LQlsZAlyMTEsU1RLX1BBUkFNKFIxMikocjEpDQo+IC0JbXRtc3JkCXIxMQ0KPiArCW10bXNyZAly
MTMNCj4gICAjZWxzZQ0KPiAgIAkvKiBFbmRpYW4gY2FuIG9ubHkgYmUgc3dpdGNoZWQgd2l0aCBy
ZmksIG11c3QgYnl0ZSByZXZlcnNlIE1TUiBsb2FkICovDQo+IC0JLnNob3J0IDB4NDAzOQkgLyog
bGkgcjEwLFNUS19QQVJBTShSMTIpCQkqLw0KPiAtCS5ieXRlIChTVEtfUEFSQU0oUjEyKSA+PiA4
KSAmIDB4ZmYNCj4gLQkuYnl0ZSBTVEtfUEFSQU0oUjEyKSAmIDB4ZmYNCj4gLQ0KPiAtCS5sb25n
IDB4MjgwYzZhN2QgLyogbGRicnggcjExLHIxMCxyMQkJCSovDQo+IC0JLmxvbmcgMHgwNTAwOWY0
MiAvKiBiY2wgMjAsMzEsJCs0CQkJKi8NCj4gLQkubG9uZyAweGE2MDI0ODdkIC8qIG1mbHIgcjEw
CQkJCSovDQo+IC0JLmxvbmcgMHgxNDAwNGEzOSAvKiBhZGRpIHIxMCxyMTAsMjAJCQkqLw0KPiAt
CS5sb25nIDB4YTY0YjVhN2QgLyogbXRoc3JyMCByMTAJCQkJKi8NCj4gLQkubG9uZyAweGE2NGI3
YjdkIC8qIG10aHNycjEgcjExCQkJCSovDQo+IC0JLmxvbmcgMHgyNDAyMDA0YyAvKiBocmZpZAkJ
CQkqLw0KPiArCS5sb25nIDB4MDUwMDlmNDIgLyogYmNsIDIwLDMxLCQrNCAgIChMUiA8LSBuZXh0
IGluc24gYWRkcikJKi8NCj4gKwkubG9uZyAweGE2MDI0ODdkIC8qIG1mbHIgcjEwCQkJCQkqLw0K
PiArCS5sb25nIDB4MTQwMDRhMzkgLyogYWRkaSByMTAscjEwLDIwIChyMTAgPC0gYWRkciBhZnRl
ciAjZW5kaWYpCSovDQo+ICsJLmxvbmcgMHhhNjRiNWE3ZCAvKiBtdGhzcnIwIHIxMAkgICAgKG5l
dyBOSVApCQkJKi8NCj4gKwkubG9uZyAweGE2NGJiYjdkIC8qIG10aHNycjEgcjEzCSAgICAobmV3
IE1TUikJCQkqLw0KPiArCS5sb25nIDB4MjQwMjAwNGMgLyogaHJmaWQJCQkJCSovDQo+ICAgI2Vu
ZGlmDQo+ICsJLyogUmVzdG9yZSBQQUNBICovDQo+ICsJbGQJcjEzLC04KHIxKQ0KPiAgIAlMT0FE
X1BBQ0FfVE9DKCkNCj4gICAJbGQJcjAsUFBDX0xSX1NUS09GRihyMSkNCj4gICAJbXRscglyMA==
