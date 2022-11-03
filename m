Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E85356177EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:48:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2wqH64Pjz3cLg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:48:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eGxVryem;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.80; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eGxVryem;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90080.outbound.protection.outlook.com [40.107.9.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2wpK6xd4z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:47:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/WAkQ7x1Mlsl+u2CzxVryHNu4WmNwfUiXGlG7liCP5W0pwKvfsEIgdudwG83oZuqBhyEPE0WQWgEwF+MqN/6BB969fU7YS2eSfu+fbbOcNVX/vj5zfbalQdU+QJr06GmZXxEYLSHv4XE9tSXxWlICoArSh6bWh9cqN0AVabSBTTht/jGUeK4O3Qy/Pub0RAmrnK74QUNpxLhinHf/laZI6wNtn5Q8a1dtC47S0L6GaCVD7HmsemLpQvWA8qRjRYoub2jnA9WLzFAHzPJPrZ9Wo1p1NJdHKx9Ib4ol7Fhw5vS+rif7eqiKd17QbdHiyy8Vx15Ta3Rnaj6rwt87AyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O/dmYjrBavt2xsz8SR9ZFbrELplqxtffZbLYEg3tq0=;
 b=C4UOJZgE772PI2ppPRnF6Eht3Xhigd12pAWvenuSieoiv+6q6JxxnEbTTvO/bFOOLAOb6dXCY75pw9ZZZukv5FheNqIVmDsvW5MA6K19dmGY0iwTXVVThRuBNrCiystq1dUis6zmfvcv7kkVNqRiQQ3aE2b4ktdPdDdHts6knlxpKVDMybsV+Y6AvC5bcn8tkipXzEmUl3jti9izoTJakf47IBy4lVQOX+098BJWD0wyXuAuC5w6phN8pSmGHfp4W/djhN+6nzV1LEJr3HgMSPgAjH91PjOG7qhd8mcG7h9HqBNGYfEUvxkCpklW/TYAD4rb6ZoXp1fS3FjRMhYt6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O/dmYjrBavt2xsz8SR9ZFbrELplqxtffZbLYEg3tq0=;
 b=eGxVryemoxGsHm0pCmCI+Dt3fTE6xoTAiHFjkFmGQNDa1r5Q/yjSIjsbW3jA2lw61UOlX4jnGwuUnsZMOBsu1bYmi6e0sPBMCmxZnQcEMxTXvGCW6Z7BWqEP4djmGMUchXrNbTjOhFCIuihc4ZoIXsvD7rDU0lDlC5HO9K9wwpEUI7ZUZPTC4qVmUZeTxhvlHJ32GxOLrsZFji0w8ClxSio8Fd8zoR3zpfkT1SXEmOW5Rx0Pb3wSeN3sJVfyOiHslJW0zzExvd/6WVCz9MkiUqgCSaPunnqCttPrTVliz5d/CK/0hya6vH4vX+OKBRuk5sBVuX6GkXPod6RKWLiWww==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2402.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:33::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 07:47:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 07:47:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Russell Currey <ruscur@russell.cc>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/8xx: Fix warning in hw_breakpoint_handler()
Thread-Topic: [PATCH] powerpc/8xx: Fix warning in hw_breakpoint_handler()
Thread-Index: AQHY518xjl9UiSl1QUOqxVvd3AGj0K4s4jyA
Date: Thu, 3 Nov 2022 07:47:18 +0000
Message-ID: <e47db841-24a4-ad03-2f96-36c1eeda51fc@csgroup.eu>
References: <20221024041346.103608-1-ruscur@russell.cc>
In-Reply-To: <20221024041346.103608-1-ruscur@russell.cc>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2402:EE_
x-ms-office365-filtering-correlation-id: 310526aa-e105-40fe-52b9-08dabd6fa22b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eoPal7RO9OkD2NQ7As5vUGUm10JntM7aCRzQ0PcTUIZiFRlKZfQ5xWDlKqeAVtcB2MaiYL6IpOXRSvD6mmZwHwF66VAcLG573CvTZhAJFi//M9bBNXsx5FiJ229do9wnNh4CrwlngGiqrM6NCdr5Pf3TlK90KBQh7cAzwMhtayDOSVUPqasEDZd5CgOMH2F1tQIWMOko2WzWZuc44Y8jwcTeMgl9ipVlGTX5seNJKnluX/tl3DktFkCnuayFT446YQeJyZQTifV7it48OWVpQB2J9i3KPFqfS/Nr0Q0zAarh5Sy2I6axKTE1LXePovgPjIsBv8nzXjP/137J+CpQbcYTxLklJuhm+gm1tR28QcZhDkK5cmSYMdUu2P7lm+CXakx47DH6qBGKp1BW7OwZwSqEDDcYspywJjaauHE0WXIWf4lqDcecTiX3+aF6qztVvUugH1qzdcaGQFXdd/x0+c7AZTrKUafA8G738TYd21LiyMv2CufB8NCBV/ALEY25fkwCLG62inPVIt9x+C2S4NjiwD0/KMScVynWXXBpdtRVfm+W41/CXH5w53UwqZCrsZVc4F5jyG0REY1vy6yv45GJFp1RYylgKWjabB9WBrXYLA3Kwy+2fvRGEaaJis40jBhMEdQ6oSKix83W2cXlrvLqRIvup7txeCeWoB2A0yn1Of2dGnkFASbBWsanlwqNbm+u0LwCeeIpsmicJhMQdJ9zFvCqJ82wjxyzQ55z7cxbE1C29qAo/cmWq6MQFMhAAdIGDUYXGO0LowbIaiQbI5NSmxMhY7gjocXviNe7uWfflyVGcPt7CbhFrj2ZoT4ihajxqGlX0szHkvlQTn/OMw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199015)(6486002)(83380400001)(478600001)(38070700005)(66574015)(110136005)(8936002)(41300700001)(2906002)(31696002)(38100700002)(6506007)(36756003)(86362001)(6512007)(26005)(122000001)(5660300002)(316002)(31686004)(71200400001)(8676002)(44832011)(4326008)(4744005)(66556008)(186003)(2616005)(91956017)(76116006)(64756008)(66446008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VEk1UlRhTUNQbllybG05TDZxNFVGVHhwUjBYRVZjMGFNTEU4L0paRXlWTmk5?=
 =?utf-8?B?UHhYRHQ4Q2E2VmdSTE40RzQxN2thV2pycDdvbytVcWpmTnNFanpkL24zaU9l?=
 =?utf-8?B?R2hmV0JQOUIyZWdGQTN3V0ZLZzF4TDVjMkkxaGhVWGszVGl0TXNKcS9QbkZ5?=
 =?utf-8?B?Z0NxN3U2ZFlOZTBpN0Erb1hSK3RvOGl3YnRLaVYrYjIyMGN6ejVZamlsYm5N?=
 =?utf-8?B?TmRVRzQxMmRlYi9Gd0JSOGJiVzRJYUV0a1pJbHltTUY1M2JZTHJ5b0VtQkFR?=
 =?utf-8?B?UUQ3QzRTZ0NJd09UY05ydjlZMFhUcEppcFJNbGxoZ2h1VmovSjFiNVh6WER1?=
 =?utf-8?B?RDI3QW5vSGYzTUF6V2dvaldDbDFzVWJHbk9LUkJCMTQrUE82aFgzd3ZYYnNG?=
 =?utf-8?B?TVhOY2NUSi8yMG9PRmlYejVvblpuNFNwZlFKT1FCMjBiOHRIZEZXTEZyN3NJ?=
 =?utf-8?B?U1hDaHZxUTNZRVIvWHhDT0JHbzBIbGRybDdjWUg4VGd6NXhTaGJKa05kK1Qr?=
 =?utf-8?B?RjZvODVWS3BJK1VUQUVYbjV3SXkyVktZR0J5MVBHTG1tUzQxNm1wZVEyd3g2?=
 =?utf-8?B?WS9kc2hSWlZBRzdGaVQ4dWNqZGZYbjhVMkEvMkhpSHNQTXJFdmd4TGlvaW9S?=
 =?utf-8?B?NDRjaW9ZNTYzb2xTT3I1NmFjd1VDcTJDWDNrZjRua25vYnc3TlZVdDEvcDNs?=
 =?utf-8?B?QldRUE9IVFpmeU1uZlNZd20vZGdCRmdhUFVzYnFDaFdsV3lxdncydDJRUFlh?=
 =?utf-8?B?eVZGcXF0VUhmLysya3FvbVRzRktaai95SFFzd0hpcGNSdmdxeXJqZkVSQWFs?=
 =?utf-8?B?OW1EVkpIZW4vZU4yRDBIUzIyemhUdmU4WGJtWk1pZ0czTFJhdmdMMSt6azZn?=
 =?utf-8?B?MWE5V3lDWStWV0ZNVDFrMzJ4U1ZqQUVsK3pGM3dLWnFwVlhjaWkvQzYzTWJJ?=
 =?utf-8?B?Mm9SeTVBT3VCakdDQnZrQmQ5dFlLUTk2bDY1TDJGN2JPdTFSWEdFd3hyazYw?=
 =?utf-8?B?dzhFditaRytWRGpWcWxOUVFuTmhsRUFuRjRZK1RQQTUzNW5ab3VaR2NDdklX?=
 =?utf-8?B?YkNJOVYzc3BLaGZsZEp4aVhpaGJYSk00cmJMcE9CSTB2T3dFRWhhbm9SaHFq?=
 =?utf-8?B?NDV5ZlBPNWxDaGN0bEVFZkZQWkJGcmlMN05aZDFGOHJoY3BKUEV4eDNudmps?=
 =?utf-8?B?TkFFSEFPK3FvZjZPZGRjMEZXNytPNndjVXdEbTkyMzIvTTltaS93WXI3K056?=
 =?utf-8?B?OVJEM1hlaFQzc1NBSGhJbEJQYUNLa1o3QWk4NGU2RHNWSlJld0d1WW94V0hy?=
 =?utf-8?B?aktlSVFKYWx4OWR1QzVyL3JIMHl2TDByRDJ5R2lncVpEQmZtZU10a2RRTklv?=
 =?utf-8?B?M0pJSXM5MEpsRnB4aU5zSFo4UENJYU5uV0VJUXZNL0VXYU1IT3J0MTVBeXdI?=
 =?utf-8?B?blZMVHJVdnI3bTl0alFwenlHME4vSmJ6WWtsZVhhcFltNkJVSWNXTTB6RjNC?=
 =?utf-8?B?U2NZR1RuMllyRC9CRjJaUU1meDNKZnR6RWx4Rm9rN3lPeFlndFFCLzZtOTZT?=
 =?utf-8?B?WDhWMmF1T2laSlpMT2lXTWZ4T1JjdnRobjlGdlhwc1hKQk1PNkhKcm9DQW5Y?=
 =?utf-8?B?bitpckRFdWFxVGE3S2dHMmJ6bVMxQXhiQjhDRzJnMDBzelVMWVZrcWkxU25J?=
 =?utf-8?B?RnJEdXFPa3lQTmx2TDV1cVhMWFFLcjE4aTh6WklnUFVhRzhQUEF0TDdzc0Y0?=
 =?utf-8?B?RkZrYldIYkJ1SzhnbVRVd25BdGpSWkdoUWtsRVJiMDYzZ3gzNkIwOC9rL0V5?=
 =?utf-8?B?b3BMRzZ6VEN4OTVwM2lhdkgyV3lTby9FT0JFZUViV1BGbmxDYmZMbWZYS3Uv?=
 =?utf-8?B?NFhUTmx0SXJGdFdWWWdBNmN2aTFYK0J0VEFWMisrY3VKOW51VTVzNXBTcWlD?=
 =?utf-8?B?TjlNQ05WSDBGTXhvL0c4ckVhZjRsU1hyT0hLak5Eak8vV09mTzNUbmdOZmlz?=
 =?utf-8?B?aFhqeHA2a1RMOFU3ZTAwTlZMMWxhd2NBOEM1bmZmSVVrcnlERFhFa2NYcFNK?=
 =?utf-8?B?YmlpQXg1L3Y3QTR6eCs4V1l6SEJkdTRGby9CR0JlY0QwbEc1WWJaVW8rQlBR?=
 =?utf-8?B?V0FVTlo4ZmpSUi9xVjgxSkhQelhkcnpqaHhSdjlJNkh5UU9uVUo4NVJuWkVE?=
 =?utf-8?Q?uhb9rbsKyFcQSugFFmfLg/Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43BD7F0E372DD84DBCD8CBC21AA3CC22@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 310526aa-e105-40fe-52b9-08dabd6fa22b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 07:47:18.5958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkbn853OcF7y8x/KG+w2ioxGRLGE0dkDtKBry7Kfab9VYY26quXZczqc6zf9/lJDnHyomeoWdT6a1rCAcf46p062SNBUZXoOf05/cAKwdws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2402
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
Cc: "ravi.bangoria@linux.ibm.com" <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzEwLzIwMjIgw6AgMDY6MTMsIFJ1c3NlbGwgQ3VycmV5IGEgw6ljcml0wqA6DQo+
IEluIGh3X2JyZWFrcG9pbnRfaGFuZGxlcigpLCBlYSBpcyBzZXQgYnkgd3BfZ2V0X2luc3RyX2Rl
dGFpbCgpIGV4Y2VwdA0KPiBmb3IgOHh4LCBsZWFkaW5nIHRoZSB2YXJpYWJsZSB0byBiZSBwYXNz
ZWQgdW5pbml0aWFsaXNlZCB0bw0KPiB3cF9jaGVja19jb25zdHJhaW50cygpLiAgVGhpcyBpcyBz
YWZlIGFzIHdwX2NoZWNrX2NvbnN0cmFpbnRzKCkgcmV0dXJucw0KPiBlYXJseSB3aXRob3V0IHVz
aW5nIGVhLCBzbyBqdXN0IHNldCBpdCB0byBtYWtlIHRoZSBjb21waWxlciBoYXBweS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgQ3VycmV5IDxydXNjdXJAcnVzc2VsbC5jYz4NCg0KUmV2
aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4N
Cg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2h3X2JyZWFrcG9pbnQuYyB8IDIgKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2h3X2JyZWFrcG9pbnQuYyBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvaHdfYnJlYWtwb2ludC5jDQo+IGluZGV4IDhkYjFhMTVkN2FjYi4uZTFi
NGU3MGM4ZmQwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2h3X2JyZWFrcG9p
bnQuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL2h3X2JyZWFrcG9pbnQuYw0KPiBAQCAt
NjQ2LDcgKzY0Niw3IEBAIGludCBod19icmVha3BvaW50X2hhbmRsZXIoc3RydWN0IGRpZV9hcmdz
ICphcmdzKQ0KPiAgIAlwcGNfaW5zdF90IGluc3RyID0gcHBjX2luc3QoMCk7DQo+ICAgCWludCB0
eXBlID0gMDsNCj4gICAJaW50IHNpemUgPSAwOw0KPiAtCXVuc2lnbmVkIGxvbmcgZWE7DQo+ICsJ
dW5zaWduZWQgbG9uZyBlYSA9IDA7DQo+ICAgDQo+ICAgCS8qIERpc2FibGUgYnJlYWtwb2ludHMg
ZHVyaW5nIGV4Y2VwdGlvbiBoYW5kbGluZyAqLw0KPiAgIAlod19icmVha3BvaW50X2Rpc2FibGUo
KTs=
