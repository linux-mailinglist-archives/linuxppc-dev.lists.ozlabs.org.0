Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E47054C16E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:05:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNFC30Xk0z3c7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 16:05:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VF/0LGMV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VF/0LGMV;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNFBG4TJyz304S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 16:04:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYFVirjP/ABpS/Dw3dmCrCctn6pxjj2bjRwQWKDkm9KtmZLpfJv4Q565qUI1Vg/4QEKWHyc3wK8W+SOdGBCcZuDao4By9J9wBywM8MS5Yark7jdrwfqPJB40HNYjxzZBSUYl1dRIOu/Gp1n6n/gdfef68cA/2MpNlgE8n+WeT319s1AhskXstM5pqTdzRRImgxq/fqmtmYsXxUZ/ZSszw8nXXlLcHbXR0iHAsDvMoZG4n6JjEphD2WULDZ9V17DG0gVv+MW+4KJpcS+z+nB4vrGtr9am1H+Jl9oq6zUPJgA2E2hHXXARJoSNeDByXf3DDJjOw4ltr5KPpsFFz0JwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+qqCCxDuBCWNW/rfKFAIfrhjK/6MLUQssp3gxIJ3IY=;
 b=FIpqRPYc80MwkD2bImooFtqaFdH01N0Mz4G8myZT5RWcJtwu3SdNXF2b/oxtY5LMuihl0W9dsroYKmOOUKor8Ggac3jwPk4ipOdm/rSnGm9leSubhuJca3DQyY4oTqBkkxhTpnZX+tHjXnxOqyBWyOnQyzSviQSeVw/GhLN1ArG8fofAe2cw6I3zOSGN+hCgr4GVS23mBuTsm1rzbgCWqLolEx68Jrsu+l49BvrxW9WLsS/dz4XDYk/l7YElmkCoTKcVJqwtPoSZP0Ax8X0wcW6cn1baMOm7vmfCdo+VJ0PD0lh9PRHgFP2oVtA8hCu2y0xG+6w4xYBF2xVnK6ideQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+qqCCxDuBCWNW/rfKFAIfrhjK/6MLUQssp3gxIJ3IY=;
 b=VF/0LGMVQjWEMUDxVKPi6q339snCvJOgqhch6GfA/TUnzFu0UXIRRKsaDioS26J5QvRhgxe2IJB5B3JhQuRxAXzW7B0dLoUDdwP2vEe8TkJLosLlwnfRyVDvXFcQnWgAm5/0I0iL7O9+IjHW4d3LWuO2Crm6jIXXOVrIMm28RXuEV7kuVl5L3Iye2DOjH6uOqmQlEyk7UV9JvlUr2Hu3zLrSQglQyks8qahe9z5TuUqpFbpwGdKKo3Sq+QVN4zhpHFxI/AmVKTUUnaOPAnATDaOuW08sfdy3Y5AkQXHfmL1cjTs9HW7v0eHcuZejylgsmWkyH1NIoJ1I+7DhbGGqcQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 06:04:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 06:04:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Wenhu Wang <wenhu.wang@hotmail.com>, Greg KH <gregkh@linuxfoundation.org>
Subject:  =?utf-8?B?UmU6IOWbnuWkjTogW1BBVENIIDIvMl0gdWlvOnBvd2VycGM6bXBjODV4eDog?=
 =?utf-8?Q?l2-cache-sram_uio_driver_implementation?=
Thread-Topic:  =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8yXSB1aW86cG93ZXJwYzptcGM4NXh4OiBsMi1j?=
 =?utf-8?Q?ache-sram_uio_driver_implementation?=
Thread-Index: AQHYe+v2lxuFI4e/SkKc+NMp8W40uq1HDpsAgAdkMYCAAZDEgA==
Date: Wed, 15 Jun 2022 06:04:01 +0000
Message-ID: <304d0f87-a7d9-2db1-020d-f864cab52a23@csgroup.eu>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
In-Reply-To:  <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fbc15b3-473c-4616-5004-08da4e94d825
x-ms-traffictypediagnostic: MRZP264MB3065:EE_
x-microsoft-antispam-prvs:  <MRZP264MB306511407E335C313FA402DEEDAD9@MRZP264MB3065.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NcFswE/QO7sxMjiTDVjBhjsMvqkofFIP0Q3R+z6pY/mpG1a4/rjNxhoa/ad00xcHKqzTfl+Ai0BQFoFCiQEQRIUQGkX7JYYqh+Gr8S1ApUO1iuw5sIOIxgTosylshU8M2HXm2NGVpj48xaK/i4Fsg4t7MBYWuueZX+DuddQRDiFm3xOyIushoRqe0ibK5qZz/M1K7PRyyXis28uddzov4coGeDgleYimSQq7DAz7jkYc/zjn/u90wSUazYSQMtgOAzozFFM1MCbFWU0ShbzkCT1lJGD5I1VovutVLAkJ4obQ/QQ/PIJz0sKYNZco3jCB/vl4rbxz9hZfKStO2H7FNiHuRzZkiQ6QZWK8ywwnbrO9jk+UoffliqEXg81W9BXR++e7FGPVei2t47bW403oy9x1mqV+xiXUO/NmHL4MHIjXwnnUNJc6Z1bXOrmFaqREt/Yy6aXQnxmcRhnzFX7i88k2uABsEDer+GOBxapFkguIabs5L0FPq3dqZPuxc9lpW5ZAPrw8rKKs2GnsjAwGfbYZiIGxrNx1q9x3Q865y1NC6T7miMEqwiE9ATjZWoJzto8ZE2zswqfNGXohb8ugWmHgTc/ygpviONspOIDVA/B7DDmv5ErhYazy0DUjq9/TMqYMffrpnN9PjpoX70d5g2Jo2yHcmdFtTiZxXjWpMs6BNyOjUePrYoxL+pbUyyl/RaoymwqyogjDEME625DC+3YyLN6e/ZWEcDXRrM6lZnQyBxJ8vQJ25j7RK7RMlO4uRxUM7Qvt6fJI+rot3/6WHf7Uzj+fuqam70XN50TkEeBSSWfLxoJBO3F6LTtyxVLlzYE9sqOsuB6F7D51iXCiJsJtz7EwxXKotL14YDMOZj4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(64756008)(66446008)(91956017)(316002)(5660300002)(4326008)(66476007)(38100700002)(76116006)(83380400001)(4744005)(2906002)(54906003)(8936002)(36756003)(31686004)(110136005)(44832011)(66946007)(66556008)(966005)(224303003)(508600001)(6486002)(26005)(6512007)(86362001)(31696002)(186003)(2616005)(6506007)(122000001)(71200400001)(66574015)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZlZxdkdXeVhzc2ZPZVdxSlNrVFJmaTRwdDd1d0k1Q1dYU2FtRHliS0xrMklW?=
 =?utf-8?B?L1NzRVQ1NUxZbHAvRmZwR0wvWmtEUFNQeHQ5TWpEOUpzY3FNQXFSTlpySUVB?=
 =?utf-8?B?aHN1ZHpYZ01qK1p4WStNcytZTFgybTU5MDA5NWVZY3FBcDVCV2swT2I3MjBG?=
 =?utf-8?B?QWlSS3lzd0VpNkRZNkZGTkF0U1B1VEt4ODdwOVlGTEVnd1V3ZzN4ZEFNWTY1?=
 =?utf-8?B?dERoM1NVT2d1Mk1Ba1k1TGJNbThQNXZtQkRGM1J2MTkzM3J4WFM1amlGVFZl?=
 =?utf-8?B?QzJmcGM5Yk9XVTBBbU9SZW5OT2NpMGJOSENhaFU3TWpjZmhoQUZrT2swT1Jp?=
 =?utf-8?B?SWFtVjUvNWU0cytCSVh0emJnb3p6YVZMdDgxUHZ5K3F4M2xLU2Y0dUxNUC93?=
 =?utf-8?B?NnRlblA4SzF0VHRwM3lHRVgvdjFmQ3lkaFFsUll4aHp2NmtYSTJEK1o3NDA0?=
 =?utf-8?B?aFMveWxtSU9nYVk5cHFpSXkvYkpCSjhkakVSdGFnK3puQWR0T3JaV3d1WXc0?=
 =?utf-8?B?WlFCa050dGNNOG8vV1d3aVNEU0oyZU8wSG51YjlQRHA5SkgzRkpqcmNYb1VI?=
 =?utf-8?B?aEZhV0JUdHZBVEpXMFNUN2lKYTRpNHBWb0tsZzJmNmJybmF6eHpHMXovK2dm?=
 =?utf-8?B?eXFlSXQ0L041ckZQZndoSWM2OEdUUW1rNFNpWFY0cEwraDRQcjBUUExSYU1r?=
 =?utf-8?B?ZjdkdllJd2NXWlN1dWlYSzNrOCtUNExEeittMWU3bDJsSmNZb2V2UC9zc1FZ?=
 =?utf-8?B?WFNlSVcyNEhZZy9OaDdmeFQwU0kyczM5QmVTUnFMSzdydGhkT3VlQ1R3R05q?=
 =?utf-8?B?MFJHMUpaRisxVUdmSUpvZzg2VFJKdmFWakVXd2swWnlvY3A1OXo0ZFdDUmFG?=
 =?utf-8?B?eWJLT2oxRDFHNWkrTFY3V3Q1cUdJRldJSkRlYVNYREgvdzl6K2JlNEZlaDV5?=
 =?utf-8?B?SXdJSGZIaTZ5Qjkyd1dhakVkK0lhVlRjY0pkSVhYQVY5NjdRaVRBNVhla1Rv?=
 =?utf-8?B?NkFJbjBlMUZDS0pRd1ZYMklVcFg5b0ovdXltYkl3WlVnSW0rZ2NnUzhsYnBV?=
 =?utf-8?B?S0V1b2FtbVV5YzZQckxWMlYwalNJdU9OUUZYeXZVOHczb3J0Z2RwOFdKaDdp?=
 =?utf-8?B?c0RUcUt2em84R2RRVUF4d2RsekgyM3VDaEIydmQ5SG9NYzRsQ1RjUnBrckdG?=
 =?utf-8?B?R0NmSEVzRjhmZXlsbkN5aDhkUUhsZHNYRlpVT2RSZUd0RDcwL05oL3VsVmpN?=
 =?utf-8?B?cENneTJzS3kvQ0dxbFN2ZkcyeWlvTkRHVTlmU1JqK1hoTHBBVENuQ0JHc2VR?=
 =?utf-8?B?Y05xSzdJVmRyWlZsZzRqN2poKzYwcllOSUdsTGV2ZWxjanFPbjJFRmFzVVNP?=
 =?utf-8?B?dFVxVUM3TmU5VExzd2VRRHVxWkxFQ0RteC9CZks3SjFVMHZXWkVSMXdmWUZx?=
 =?utf-8?B?RjFodUZRcmp5TkpHRGErS0hhVjZhSDNKQnlsVzg5aFBaZ2NXVExudGVTcE9Y?=
 =?utf-8?B?NDFUSzJLZ0tvWnQvc1hmY0s0Q0tBMGNlQVdZYnNSbHFRV3RGOHE2SjBOc1Av?=
 =?utf-8?B?cGxxQmlsNkRFWXpCTWZrOElpRUNHZ0RsRm8yT2ltQ0ZUc3RaOVdsakZDZDNP?=
 =?utf-8?B?cUJGeGJpTkxnRGd3YnhqdGVlRG5PRG9Nem9rREhJR00wU1FYbEtFeGFSbjFW?=
 =?utf-8?B?VzlBMUlVQk8rNnlhdi9WeDFmaElVcURuNmtqVURwY1lOb3NiTTdDOWM1aFkx?=
 =?utf-8?B?S0g1ZVVSOExpNlBkOGMrc01VeFF5ZWJKU2FmV0tjSDB5dUl6M3U5d3hvMVQ2?=
 =?utf-8?B?MXVuOVpKS0ZYWEw0dzhTNkIzMjRCeDgrTUdkTzB1S0JnR0JMZmlEbGgzQmFG?=
 =?utf-8?B?blNNRDI2RDRPTE1YejlNNE5mY1h1dGcxUFI0a2g2ZXpuT2JOUm9JTzJ3RnNW?=
 =?utf-8?B?MFlKcUplUjBoaWpmVHBjOXZLd0xnUGNjSEVIbFp4QmYvSUJIb3NDbWNJanpv?=
 =?utf-8?B?SkdLdzExbC8xeWgrUlJzWnovNllEcFZCM0gweXNRUy9PM0VuT0ozSkNlUWlW?=
 =?utf-8?B?ai9MNWZBTzJ6K3dpbFg4RHRhWFdsaERBcnpvVEZTNFY4aW1OMk9VZjVVWEdX?=
 =?utf-8?B?a2x3VUpIeCtkWUxSTUhmWGRSZFRxTkYvS3l4Rnp3bVlPZWhaY0dheGcvL2VV?=
 =?utf-8?B?di9SOHAwQVJrL2VNc2xCbjZVTTFqRmhzdWFTSGJKY2V5WnZWSWxsZ1JEalU0?=
 =?utf-8?B?aHlScmpqamZyMVNBajRHZkhkbGk2eGxvU04xY3FwS29rMjRNcHpmcUVVTHZk?=
 =?utf-8?B?V3AxQ0hKVXVrSWRmQm01VWxtQmt3S0NSaHArOHJ6Z1ZGZUtISk9uUEFEQVdk?=
 =?utf-8?Q?0qGRuVZgEcGEeFD9ewSoTP7wB5FyGLlm/qNO8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71CAEDC62F3266429C9CAF4DF6135B4D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbc15b3-473c-4616-5004-08da4e94d825
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 06:04:01.4328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YPUU+VkoCuSaq7GHT3OT0OamF5ZJWQXsK2CwqP7rr3ZNsSmWvc7ccUBN+71jxdY1XZ0KMv2meQVeqG8HBEhzCMEl6OZEx9XDDajUelkRCvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3065
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA2LzIwMjIgw6AgMDg6MDksIFdlbmh1IFdhbmcgYSDDqWNyaXTCoDoNCj4+PiAr
DQo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgdWlvX2NhY2hl
X3NyYW1fdm1fb3BzID0gew0KPj4+ICsjaWZkZWYgQ09ORklHX0hBVkVfSU9SRU1BUF9QUk9UDQo+
Pg0KPj4gU2FtZSBoZXJlLg0KPj4NCj4gDQo+IEkgdHJpZWQgdG8gZWxpbWluYXRlIGl0IGluIG1h
aW5saW5lDQo+IFNlZTogW1BBVENIIHYyXSBtbTogZWxpbWluYXRlIGlmZGVmIG9mIEhBVkVfSU9S
RU1BUF9QUk9UIGluIC5jIGZpbGVzDQo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIyLzYvMTAv
Njk1DQo+IA0KPj4+ICsgICAgIC5hY2Nlc3MgPSBnZW5lcmljX2FjY2Vzc19waHlzLA0KPj4+ICsj
ZW5kaWYNCj4+PiArfTsNCg0KQW5vdGhlciBzb2x1dGlvbiBpcyB0byBkbzoNCg0KDQpzdGF0aWMg
Y29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHVpb19jYWNoZV9zcmFtX3ZtX29wcyA9
IHsNCgkuYWNjZXNzID0gSVNfRU5BQkxFRChDT05GSUdfSEFWRV9JT1JFTUFQX1BST1QpID8gZ2Vu
ZXJpY19hY2Nlc3NfcGh5cyA6IA0KTlVMTCwNCn07DQoNCg0KQ2hyaXN0b3BoZQ==
