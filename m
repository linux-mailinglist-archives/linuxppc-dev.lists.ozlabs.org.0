Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2F79CEF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 12:57:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=RkkuMbxW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlLBZ72wlz3c9S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 20:57:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=RkkuMbxW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlL9g6D79z3072
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 20:56:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RM0hoaUuWkRtcw0sUzhhkuDtkC4xCJJYwf9vkY345h8NZf7qTn8SVhRrxsh/7F6iN0UsB72f5uoipCszgabl4SgIFb/ydOVgzncjFDKCOM9toxNAT/+sLteNs09sKasoetfw+efu7iOtLMMxO2YmVXMYKT61bhqrPscLMdnbk2AjMqcp+S/dt2UMSYuJYxUZ8a2iTWpO7rw5f0ijFeL5RHCWIlCewOqgYF2agOnQytLXtai3Qs6CW1NBxPTbr7mrqheSwld2pwqjGP0P0OBkWQ3s+AkgvMyaN+5BvDxL+xjvQ0h5sbdR2jsjkTe3TwO7km5sh0K3DA4zROa5mWeJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTRG70Mr+ApUPLxskYyycg4dLds0sbPYjxM8ackewkc=;
 b=RPv5Hi1kbxfBQ6TILwqm95hrcTBCXQzWSoeoU2UFSO/EAx11DPy+kL8K6irMAaFu2hfXClOvtg2FPTJyZ3jf4kaff1u7ejrL3DaP/VGuPXzkmv70ySDUqt7aqdjbRzDWoHcxPheOk5FQVzNkrvNhCRYewW0S6tJKaQ0DLQn2CvoGpPck63uDanLDDluObhzO56b2OdXmnKcZItn6VZoc4EzVW7K6EBcSasMtMfNvHCWb4cYt0KdmySUomuz03bR6xcGgdTBMD859IUf/2Ip3VczjVVrCJuejbwCi5/ysuPYAFi77nkkp1GyPSm261mf3+WL0I4or9z6M/lUkQZqldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTRG70Mr+ApUPLxskYyycg4dLds0sbPYjxM8ackewkc=;
 b=RkkuMbxWQ3oYFwpl3ZYmxdD8/d+2yZw0wDJR/Pz0HVfumlP31tqVtXWwhfWCIXtylB21TJ5hd7XTStT7XLsvs8RtVtk5mmYfcz9obvwPxmgufDPnPCCv7cTIN8nx4GF2CHchMR++F5LWYEsSRTzvRlG5/P/ykBtiyLGG5Fs5H6yejRnjk4dsPLoOlK2816OcLqmWdZpguK3O+Vq3t/lTsuLBC4eGuFyf9nynGD3GX2uvLqlYgVZhPbMg4Yagt19qGZ05J7/HJYpUE0xKHrsqckMoOKpY0u/p2YTWkYAvW1RvRqecTqxJ37pyPdrSs0oqOdQSKmIPoKSZJmixE1rwgQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2273.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 10:56:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 10:56:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: WARN: Interrupts were enabled early [bisected cfeb6ae8bcb9
 ("maple_tree: disable mas_wr_append() when other readers are possible")]
Thread-Topic: WARN: Interrupts were enabled early [bisected cfeb6ae8bcb9
 ("maple_tree: disable mas_wr_append() when other readers are possible")]
Thread-Index: AQHZ5We4ALEPBRjj9E2YFxQ2agYoYg==
Date: Tue, 12 Sep 2023 10:56:01 +0000
Message-ID: <a981d84d-e2aa-a4dd-ad11-d7ac1a814e5e@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2273:EE_
x-ms-office365-filtering-correlation-id: a8c703c5-bace-481a-75d5-08dbb37eda8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9GrUMIZJbyt7pQuvne+hner0hT3Jx9+Nc7Jima3KSRYSqcrIPgKQNDkY43YOFqjkbw1O5/oRCXD5S1Sg8K1bfpPoShyVLuoXsJkzOj5IPaTQ7iE39lBvTWhM8UTUhV7gkht35fIrTSXrzVHRFRLd4r47YUgMLj26dhbVNxMTcgR4tyHWt7PwkN6Qno1S8KezSzPVDIyK93EH8caANiEo2owtfcE1aY78c7lqcW5BkVbaRC+vjJF7+UI3ZUsm6g1WChps3nqaGtLSRpGy1Rb2CLsLg1OElLYR+EwBsgCmR/vzdHb1C7uV3RQuWfXu36FTZkJTa8o5IKhHiMuue1EVodzAGad7anwuQ14lPJdQe24aURdsJt6hNCWXXb6SGReqvuz7PUN2Z7WafB73yTGjJ+vxq3vuyYzetY9AQfkWh5WLib1o1njpaXyeaQ22q3frKCVOueM7scxum8kaOREs5Cc/ztBMBhXM4rVkLjE6bsaKXwb5nAF0JUzpLxJYYmJuuEDmuX+IZlqJYq+4F5W1h9022HSbHDBLpL6cg65Aq7VKGyBDMFOYAMV9plHMwrBHTZa0GC+B5+buQGe2hJ7UcZUcMjwsXe4Rsg9aq4hhp6zseZXQFt9ZGmAlU+WTdbmYnqtrOAPW7fnbAtNCGL/oifRCRLZKNCLlwo0HpANmZcGLBxq8aycrGc/DbJDz4Jht
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(1800799009)(186009)(451199024)(316002)(41300700001)(71200400001)(66446008)(76116006)(64756008)(91956017)(66556008)(66946007)(110136005)(38070700005)(38100700002)(66476007)(122000001)(478600001)(36756003)(45080400002)(54906003)(2906002)(31696002)(86362001)(5660300002)(44832011)(26005)(8676002)(4326008)(8936002)(2616005)(83380400001)(31686004)(6512007)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dzV3K1Ryd1JGSXVtMEtkUlFNbEdaL1RITmY1SEdocHRzMWlIMkNwMFk0dVFw?=
 =?utf-8?B?dS9nYzIvOUpLbzN4dlAvd1VyL2ZHNFFaNkxqc0tTSHhHYlphSHBvK3d4cTdW?=
 =?utf-8?B?YmRIYVg4dDE1SUU3eTY4cmZvVDlQc1hWMEZYMzVKTU1Vcys5TE9tZVgrL3lx?=
 =?utf-8?B?d1pwV05DVlRqYWFZbFFZdGRCZGZ2bi9wbS80R3M4VFRZTzZ5dXdzQm9CSEFo?=
 =?utf-8?B?bXJXZGs4U0syMjlUZlMza3R4c0lyVFljM3hIakJOU0h6Y213YWg1di9lRWIw?=
 =?utf-8?B?RGlOckloT1h4S1Q2VjBVVzVWdWQ0dFB6QUduK3IrdE5BVG9IQ2JZZXovLzlG?=
 =?utf-8?B?eHE1TXNIWU1uSEY2bXhQMEpzUFNuUjM5MGxZZ2xkUmo2ZXlla01iUXR2UFdW?=
 =?utf-8?B?djRQZkc2Q3FuVUh0VHlBOCtyUTU2WUVvVmV6d1pBUUZJc2o0Kzc5SVpvdEkv?=
 =?utf-8?B?ZjRsWWdIMEEvTnJValZ1ZWtlc01RZnZIUFJyUWsxMkdpdnVjTzFxZ2RtWVRz?=
 =?utf-8?B?a0NuYXp0aXE1WFFja0UzdlZuUkV2aDFjU0JLUEpLUDUzS1FzdE90cENObjY0?=
 =?utf-8?B?LzlwdFRBZllvNUxHNU1CSnA2Q1U4aWM2WTk4N1Jja1RpZDJJL0hNbmVuaVJ2?=
 =?utf-8?B?U2VLYW0wNTZLMG9LL09yK2lKdUkrR2dHRHoxZWhtdTAyaE5iZ3p2d3lXbzBo?=
 =?utf-8?B?N1FITFlKRXlmQkFpeUpxZ21VNG9ZdUR3Nitkbi9JdmkzRkJoMXlTa1psQSs5?=
 =?utf-8?B?Q1RiRzQ4a0dYMmd2aXc0M0dWaE4zejFaRVpkS0Zjell6VmtCY3ZYQWthVlVl?=
 =?utf-8?B?ZWRaYWlzQUFJSFJ4WnFtUlkxT1dONW12UHdyeHNjUkhLZEdPbnlXSHlBa2J0?=
 =?utf-8?B?b0pTUEZ6RkdJWW9CcFZGa2dhWVEzRElQZnIwWGxGOVlrbEh6UEtaZmNDRHpV?=
 =?utf-8?B?eTM5aXdoOXpvYVlWWGdsTW5Tc01McmFFR0NMNlhWeUNDbjZvS2lEbXhZRlJz?=
 =?utf-8?B?M3BXRXEyVzg1U0VVV3U3U3J6aVFTTEZZd2hTVjVqTW56cFdLNzdLUEdZRlBa?=
 =?utf-8?B?SjBORjRhUjVQZVpZZURjWWN6ejB5dDB3S05qekNpNU52UHhpeTk0RVR5UStK?=
 =?utf-8?B?QzB0M3RzYkE3MkNWL01uR2JjSlMwMS93TnM4MDJlUTNNVDJBMHVwUFlBTWpJ?=
 =?utf-8?B?cmNPaUpoMkNJVlBHKzdidldWR29jdElsWi9TTDBvM0FkVkpXdWlOWnNGcEV5?=
 =?utf-8?B?aEw0TkcyMnI3MUIvbFZzd3VXUERvNElGWmRIKzBsaUlwbjFMMlQyTVJ2NVFF?=
 =?utf-8?B?VG9KeEJCdXdLWGVpM1ZFUENuRkhTOEpuUHBxV3lJSG53aWpxaHU0c1ZORkdT?=
 =?utf-8?B?dy9BQnFNd0xSbzJkT0g4NVVRaEJOVWFmbjk5KzNtTzJDWEx2UnVGZSsxSVQv?=
 =?utf-8?B?cVRGTmo5SGgvRjRLSHA0aVJNZmFXdnl0RUFSS3lBdHhGQTNTTjhmdi9SZ21n?=
 =?utf-8?B?OEY5ZTN6ajlwVHVLT3VnWEtuT3RPV1NTcDJKREx3YysrY0JJcXFxRzhYTnJ4?=
 =?utf-8?B?ZFBkNHUxUkYyK0ZockJnaEJhcHUxWUgrTXpuajFwK2VGWHdSN2Ntd0ZFNkZ6?=
 =?utf-8?B?M0Y3eDAremo5OVpmcFhRT3hYSlNOL0d3bVlFTWtKRUQwMU4vWGpvVmxaQVZ3?=
 =?utf-8?B?OWZPNzNSVE8rZDIxb0hHb3F0U0svUTF6Nm9HMGRTN1AyVHJ3OWJmSmNxeC8r?=
 =?utf-8?B?NzdPQ0FQUFQyeDkxY2VWRXhBRVdOcUhsZnQvcUo4aWFKNUpnQVBOK200WUJM?=
 =?utf-8?B?MWpMN0pvZ05yMVh6SFFKd3pNbTJBeVlGUUFqTHVqcVo0bm4zWXRoMm85MlJa?=
 =?utf-8?B?dnhPdmZ1MXhnaHMrYkhudEcwd1BWRkRhYjZNT3RiUzNBcWtTUzd2UWZOTDVF?=
 =?utf-8?B?YWxvWUg4VTZGWXIxanIrMGY3d2tCMGs5bUhjYXFIejJoN3k1LzlqRU1Hakl6?=
 =?utf-8?B?SGNobEtXZlRiakpXM2dyTFI1Y0tKb1BHcjFCUlJQL1NvYXJXNFhTR0dwVTFv?=
 =?utf-8?B?Nm9HcmF3dHhnVnZWTVhiMmt0VThvaVdzS0llOGd6S3ZrblRsZzg1cUVpRUtP?=
 =?utf-8?Q?Cm71UkR55QQ2TEDQYETyf0QyM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4913BE6BD70C248B8A646216DFE90D5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c703c5-bace-481a-75d5-08dbb37eda8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 10:56:01.7011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4RcH7v6uqCroHPjvc/3XN8GHqJGcx8Tash7rH+I7DvoCo7CrayZlXPT6cv1kyPJeXfjd0YDoperUaRrbkaf/t2ixNv4KaR7pYUhMKSMIKRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2273
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCldpdGggcG1hYzMyX2RlZmNvbmZpZyBvbiBRRU1VIEkgZ2V0IHRoZSBmb2xsb3dpbmcg
V0FSTiB3aXRoIDYuNi1yYzENCg0KQmlzZWN0ZWQgdG8gY2ZlYjZhZThiY2I5ICgibWFwbGVfdHJl
ZTogZGlzYWJsZSBtYXNfd3JfYXBwZW5kKCkgd2hlbiANCm90aGVyIHJlYWRlcnMgYXJlIHBvc3Np
YmxlIikNCg0KSSBoYXZlIGFic29sdXRlbHkgbm8gaWRlYSB3aGF0IGl0IGNhbiBiZSwgZG8geW91
ID8NCg0KLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQpJbnRlcnJ1cHRzIHdl
cmUgZW5hYmxlZCBlYXJseQ0KV0FSTklORzogQ1BVOiAwIFBJRDogMCBhdCBpbml0L21haW4uYzo5
OTIgc3RhcnRfa2VybmVsKzB4NGQ4LzB4NWMwDQpNb2R1bGVzIGxpbmtlZCBpbjoNCkNQVTogMCBQ
SUQ6IDAgQ29tbTogc3dhcHBlciBOb3QgdGFpbnRlZCA2LjYuMC1yYzEgIzQ4MA0KSGFyZHdhcmUg
bmFtZTogUG93ZXJNYWMzLDEgNzQwMCAweGMwMjA5IFBvd2VyTWFjDQpOSVA6ICBjMGE2MDUyYyBM
UjogYzBhNjA1MmMgQ1RSOiAwMDAwMDAwMA0KUkVHUzogYzBjNGRlZTAgVFJBUDogMDcwMCAgIE5v
dCB0YWludGVkICAoNi42LjAtcmMxKQ0KTVNSOiAgMDAwMjkwMzIgPEVFLE1FLElSLERSLFJJPiAg
Q1I6IDI0MDAwMjgyICBYRVI6IDIwMDAwMDAwDQoNCkdQUjAwOiBjMGE2MDUyYyBjMGM0ZGZhMCBj
MGI5MjU4MCAwMDAwMDAxZCBjMGI5ZDEyOCAwMDAwMDAwMSBjMGI5ZDE0OCANCjNmZmZmZGZmDQpH
UFIwODogYzBiYTgwZjAgMDAwMDAwMDAgMDAwMDAwMDAgM2ZmZmZlMDAgNDQwMDAyODIgMDAwMDAw
MDAgMDAwMDAwMDAgDQowMTk5YWJmOA0KR1BSMTY6IDAxOTliMGEwIDdmZGU3ZmE0IDdmYzVhYzBj
IDAwMDAwMGJiIDQxMDAwMDAwIDAxYzY5MGM4IGMwYjkyMDE0IA0KYzA5YjRiY2MNCkdQUjI0OiBj
MGM1NTIyMCBjMGFjMDAwMCAwMDAwMDAwMCBlZmZmOTEwOSBlZmZmOTEwMCAwMDAwMDAwYSBjMGM2
ZDAwMCANCmMwYjkyMGEwDQpOSVAgW2MwYTYwNTJjXSBzdGFydF9rZXJuZWwrMHg0ZDgvMHg1YzAN
CkxSIFtjMGE2MDUyY10gc3RhcnRfa2VybmVsKzB4NGQ4LzB4NWMwDQpDYWxsIFRyYWNlOg0KW2Mw
YzRkZmEwXSBbYzBhNjA1MmNdIHN0YXJ0X2tlcm5lbCsweDRkOC8weDVjMCAodW5yZWxpYWJsZSkN
CltjMGM0ZGZmMF0gWzAwMDAzNTQwXSAweDM1NDANCkNvZGU6IDQ4MDAzN2IxIDQ4MDIzYzA1IDRi
YWI4OGNkIDkwNjIwMjYwIDQ4MDEzOWU5IDRiNjU3Y2NkIDdkMjAwMGE2IA0KNzEyOTgwMDAgNDFh
MjAwMTQgM2M2MGMwOWEgMzg2M2I3ODggNGI1ZTljY2QgPDBmZTAwMDAwPiAzOTIwMDAwMCANCjk5
MzgwMDA4IDdkMjAwMGE2DQotLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCg0K
Q2hyaXN0b3BoZQ0K
