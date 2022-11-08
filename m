Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6062193B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 17:19:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6CwH4WZDz3dtr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 03:19:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=iEQsQtw4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.81; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=iEQsQtw4;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90081.outbound.protection.outlook.com [40.107.9.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6CvG6Cq9z3bl0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 03:18:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrTdt64CSfdSvXUDmREA3OmxyLbag2WppqCIEh/8GqN15Fd9RSON4JHwXPCnrQbY0b94iYPvfU7EMb+YCMnhSXg09XncQJCc3niBHyF8zJXH9tyyD+LbsZP+2hK0GS1HSS/nOnpV5zzjVKjEIYY826O40EEz4nlnPM+owuUq7Ro/Azuo53+oZm9hYrliwshYTtljYfhLh1ZvGS/nwcU6Zx2k3MwkDnnOHWLkNoMBp8mjM6eKObDRNQiYtdSgA1Af7RRTVKMCRjw0AMbl/bThp1K3ocafent3Gbh2iNLGWhWuNDWcTMSAvaSqyWYPytqVUNvKxeg1XO2Sy+9nCFzyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfWppBsCgVYZnfNr965xG5EMer5o4yEZMzH7EbTo+Ho=;
 b=Z0tJ+dzzmoZ+vM69oEdTQUm7PToRFvrgVzdwTJ7jIYfkkHz/rYgh9lNcUxUvNTpTv4JruxjRI5WW/hf6aMHG0vDty1wfC56bvAoKHqOqNxZuknfYa2KwdHl6yziiF0VXOD3Y7Y9JCRPyR0NIHAZdFi+RSgKSY6zp6cPUuehDeMigZZM3q+Y91k8dK8ZGGYpMMMPmdicMC0WIOjtsTOzvazat0VH6bI6r6PCY+pY3nycQFLayfxYaWDEdLJIbozPcUaV2jcQIUn/8l3gjsR4fv/D+FOWsjCWy6OSkcr7tRBvkZC/s+OqsKqe3O3iNlaNX9pNrQTBDio4Vp2cJy4UIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfWppBsCgVYZnfNr965xG5EMer5o4yEZMzH7EbTo+Ho=;
 b=iEQsQtw4vc+4vq9mBu8HMefdxCJdvenLgXS0NuioBmJIX/VfOmOhGndgdMYnNBSxh8K/8jv19rWS4WLOYwyACQXFckM0WTfHYzeHz2gjMjRFZUx1qr7OzHNh7Rz3AH3KJflhYOrTy11KTBOTaDvPwMgDjhazuG/gongIo2VRqPmrcBjhZWi3TOW8yk3Dkrd6HLUYj18WX6kGse4rNXMBAOQPoR4Uk8FiFCjwvKebwjQd1XMIZiy24x5X22CjsW1K8YKvonDffaeeGJwkLfrA8eVUH+zWOKfeZHO8jh6eBqCpbJQ2fNCrqQIsXUjLYyb+FhxOsDc4P2vPrscwemyqcQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2419.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 16:17:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 16:17:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 5/6] powerpc/powernv/idle: Convert stack pointer to
 physical address
Thread-Topic: [RFC PATCH 5/6] powerpc/powernv/idle: Convert stack pointer to
 physical address
Thread-Index: AQHY8HLeRa1bwtpQikminYFdfS1Vca41OmuA
Date: Tue, 8 Nov 2022 16:17:56 +0000
Message-ID: <e447bd53-3682-3808-f256-3463a5cfdec6@csgroup.eu>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
 <20221104172737.391978-6-ajd@linux.ibm.com>
In-Reply-To: <20221104172737.391978-6-ajd@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2419:EE_
x-ms-office365-filtering-correlation-id: e1e7a096-7cf4-45e7-74bd-08dac1a4cbdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4yJZZMsfLXqV3qaetvyX2ZNroKoE+eVQF0lnjFVw+qQplC6sDf13BMZqVkROoi1k2385Wb468ysymIcMsORMgQxbQuhP1wjKZ5BVPlkX+Fs1nB6VsP+2cwbFlws+2ukoeTpMGovCD4pkrJ2xvgXSG+hiZnR3qu+0y9UY4dgJJc15LHnvc4KgLSrrFemSf8Xv6SuPQ3PzTrLhNrObL5YZOaQgXSkCZFsPpT5LTqmDTjWbcpNb6d2lEzhPe7+KKCYzMC00b96zqG2Ph6ZB6nH2UN7ZLKew+5Mwn26jd06jdx/LyMV6OmRe2nI4at7MfuoAvrNDFWb7TuOLjRnnpWGjYpkPAGCIUIrvocFtsfi3Jxn/U1h9HSs4qw0vOl7paps2ZMT3EbcmqQLZFLLsg3fAaVbzjF45m1QLpMR/2thW5WCMFSE0vpRX3QRx0Tvl2Znih2Yoq29T1o+lNgAyNMPfUJwdrwrCwV0dKHFSLFPSuD7601eS0EM1wQ2t/wtQxokeHTzpVnHvy55t8CMck5f3HBqgErI0PH3+V13z6+Rbav95wFZ/7PGsmt40onhYikMLjdTrRlUaze5nQH3/QCtQKOVl20xqgrLpK6BNsohD9EKHDpb0GrBPnpzGHgkZ2mR/3kPbT/lLPhZ8lm73x3YEee7nwUwyIpGjDfa3KyHaJXViREb4uGPCUCN4Y0UCi/dGVgTxT7nNwpzI9ffdODVnCzCbJ5y3cgUAO3YUh8tC02D+uOP3Uc22ZLkvGE0hpJ2126+LeNZCbwBtA0e1C6hbTxudpNS7YnoY8Gw0lcaLopi28gjLeonaWQXTbgjl3q1io9/deXPb6BOiDb5kvRbF5Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199015)(478600001)(71200400001)(6486002)(8676002)(66446008)(64756008)(91956017)(66476007)(66946007)(4326008)(316002)(66556008)(76116006)(36756003)(54906003)(110136005)(122000001)(38100700002)(2616005)(186003)(6506007)(26005)(6512007)(86362001)(66574015)(38070700005)(31696002)(83380400001)(31686004)(44832011)(41300700001)(5660300002)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZUY1Ykg4R2xxMHhWZE9pMHowTWJxSDlzUjNXVGU0andPbHRwWkNUZE9UZHVo?=
 =?utf-8?B?UkEyWGY2YkFwc0pSQ2czUWNWVEZESW5RdG5SZTY5RzVUUU9FTU9vSndEejZW?=
 =?utf-8?B?UDBWMVk4QVAxY2tnMWlseldBazRmWlY2OWVPQkJTYUFwcjZUSlN1WEhhOXVa?=
 =?utf-8?B?dC8zcHgzcEpjNmxCUDlXT3IyYWpEQzVjazlMZ0tjUTYrV2NlMlljRE13R0g2?=
 =?utf-8?B?L3NGWXB6SFJBalhjdHh1VjgxOXhNWjByNzE4bjFOQnAvbzR3cFpCQkxNcVh1?=
 =?utf-8?B?U1BTMzJsSVVVdnlMeUlHNnNLUUF6czJzeVZ3SGNzdWRLZ0p1d1NJUFFERjVB?=
 =?utf-8?B?MzAzZHlyLzN2WjZjYWh0WC9KTVlhY1RBLzE3ekcyVkI0RW1JTExyUFpia0NF?=
 =?utf-8?B?aHNmZWhRYzF0WnJYRStVQzk5US9qTlc3N09zMGViMjBlUktXMzBhZHVoNm44?=
 =?utf-8?B?aTI0WUNGS2lqTG9iRStmNjg2Z01kdVZRcWxiT1c5Lzk2YWVSSXZPNWRtL1I2?=
 =?utf-8?B?clpucGhsQ2hQZk1uRnlrOGFIVGpqUk1ZcFpZU3htRmlyZTB6b3gycTFWdzRv?=
 =?utf-8?B?WDdWeWNTK3gxMmVkSEV0NEhBb3ZwaWlJbEVYeVpnYU8yd1I0WkV1d3ZhTEVF?=
 =?utf-8?B?c0t0a1hYSllzRFhiK2xEc28yTkpCUThoOForWU90VDNPc2tGbmNxWUFRYmJz?=
 =?utf-8?B?RXJhZGZ2UDJEY1lLcU9LRjJXZVZVZXRoanY3aGZYNVI2NzNQSHU0NWdUemNV?=
 =?utf-8?B?U0dHMDBpWG1zUkVFcVpZK0VMYkhWVzhxK01rbGhzSEJXdGIwNVlEU2FHaUdW?=
 =?utf-8?B?N3pIK3lEY1FsQUpQZ1N6Y0crVXF3d1M2QzJuUFdkNDBnaWNyWWQ2ckR3aHRF?=
 =?utf-8?B?TlpIMkwrTUVnWW1NMDNWNTcyUUpGQTlPZDh2UElMbldMTUJiZ3dZaXJJb1Vh?=
 =?utf-8?B?bkQwOHgzcFYweGxwQmpncHM0LzAvYXFlYkxNMGZpRXVsdEJxVmk0OU1LQVgy?=
 =?utf-8?B?NSsyaG14SU9ZNDJmUnVQdW9WNmtMNWViZTg3WStxQVlvT3lGbUFsTDdTdU1V?=
 =?utf-8?B?OUtVN1RxLzlYeDdUQWRVMEFSN1VZc1l6ckFnVCtVbFpadk5kZlVmd0lQendK?=
 =?utf-8?B?N0JVUWlPVUNPbC95TXlMdUdZNElTUFFGMEgxaUFRWnAxVGZXdHpnWDloME54?=
 =?utf-8?B?MWhScDNiMEtNT1dLYVVFNnZVNGRhRDVJajdIMFR3ZEhISk1GRGFLK1cwdndu?=
 =?utf-8?B?ZUx4OHR1dUxNRk4wMm9PS1poVFY2TWgySFpubHpabHNBaS9RWHg5dEU2ajNN?=
 =?utf-8?B?T2h0YzRxanhEUmtPOGFIN1FkV0NUZUJtOFZDUm0xOU1yTG1pK0NraWM4enlP?=
 =?utf-8?B?U0ZidnpKbTZjZGxFYkI0UHE0bGxpNGhDWkVVRXdyMWZrQS9XZ01Jd2lVMHBU?=
 =?utf-8?B?c2R3MHpOWFU3dzBMZGZPa01ZN08reXRWQWdoWVVxM0dwcUN2TmVpN0RVZjBC?=
 =?utf-8?B?aUFPYmhNQ1ptMXNuUldScEprNEVyNmNtTm9XaldzOGF3Q1NmRE5KRDNSWjRN?=
 =?utf-8?B?b1ZoQkdaY3BQMEtOUzhCVlJORUtUVmZYeG5zcTBNQUUrcmlGOFdCSW5xdG5r?=
 =?utf-8?B?NTUweVpxUWVlODUvUEpEWjhIc21Mb0VXNDB6SER4eHhtaEdZaFFCbkxkbitV?=
 =?utf-8?B?UDl6YWIrMzlRQWszSnFmbUQ1WlYwNnU2SE90blltanVPY1JHMUozRnp5R01P?=
 =?utf-8?B?V0Y1SklPRDZYaVIrcmIxTzVpb0RLNnBDRTYrSkxjRHpodFlRN3RjbkhOakUz?=
 =?utf-8?B?Rys0d2kxOEFOUDI2MExwYWFkUE9tVFl0UXE3eTBnblJFWEF0NjIzYndoOWdF?=
 =?utf-8?B?cm13RjlQS1IwdEJQMmRXbGprVVpaVHU2VG1YWTZSeW5hMTNJUU5TYmdJVWVX?=
 =?utf-8?B?U1lRL0dtN0hoRTREU3o4Y3BnS2daZW9ZZjRoWms1VEFMMStkU3JUVGRaZVh1?=
 =?utf-8?B?VTloeCtJa0YvZThJQ3dyeWU1RExOemlwcGxzTTI4SVdMdWx5YTdBQStVNlU1?=
 =?utf-8?B?RFdROGtCc2VhRmFkbTVkdmt3U29SeWQ1VmFnV0hKcThTa01TS0xvcmd1c1lz?=
 =?utf-8?B?SElTTWx5Z3h4ZThhWnhHZFhqY1dCcEFLZnRsSmJUR2FBNWRkeUNsWVJkd1dS?=
 =?utf-8?Q?vG53L71hUevDH5f80N6YL3Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6ABC2C3D1A04A489E0460EB658C0455@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e7a096-7cf4-45e7-74bd-08dac1a4cbdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 16:17:56.4741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Q5Lm3HgSxU1gCOplkKqg8F7Qpt8FScn2OEMvV1aH650dgAOf/wpXItNAAzTG2HzRdJvYNxYIG5vDBuZNOMdqV9Z2fMOg2TkXip+0OSe1ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2419
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
Cj4gV2hlbiB3ZSBnbyBpbnRvIGlkbGUsIHdlIG11c3QgZGlzYWJsZSB0aGUgTU1VLiBDdXJyZW50
bHksIHdlIGNhbiBzdGlsbA0KPiBhY2Nlc3MgdGhlIHN0YWNrIG9uY2UgdGhlIE1NVSBpcyBkaXNh
YmxlZCwgYmVjYXVzZSB0aGUgc3RhY2sgaXMgaW4gdGhlDQo+IGxpbmVhciBtYXAuDQo+IA0KPiBP
bmNlIHdlIGVuYWJsZSBDT05GSUdfVk1BUF9TVEFDSywgdGhlIG5vcm1hbCBzdGFjayBwb2ludGVy
IHdpbGwgYmUgaW4gdGhlDQo+IHZtYWxsb2MgYXJlYS4gVG8gY29wZSB3aXRoIHRoaXMsIG1hbnVh
bGx5IGNvbnZlcnQgdGhlIHN0YWNrIHBvaW50ZXIgdG8gYQ0KPiBwaHlzaWNhbCBhZGRyZXNzIHVz
aW5nIHN0YWNrX3BhKCkgYmVmb3JlIGdvaW5nIGludG8gaWRsZSwgYW5kIHJlc3RvcmUgdGhlDQo+
IG9yaWdpbmFsIHBvaW50ZXIgb24gdGhlIHdheSBiYWNrIG91dC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBEb25uZWxsYW4gPGFqZEBsaW51eC5pYm0uY29tPg0KPiANCj4gLS0tDQo+IA0K
PiBUaGlzIGN1cnJlbnRseSBkb2Vzbid0IGJvb3Qgb24gbXkgUE9XRVI5LiBJJ20gYWxzbyBnb2lu
ZyB0byBjbGVhbiB0aGlzIHVwDQo+IHRvIHVzZSB0aGUgaGVscGVycyBmcm9tIGVhcmxpZXIgaW4g
dGhpcyBzZXJpZXMuDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9p
ZGxlLmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvaWRsZS5jIGIvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy9wb3dlcm52L2lkbGUuYw0KPiBpbmRleCA4NDFjYjdmMzFmNGYuLjY0MzBmYjQ4ODk4MSAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L2lkbGUuYw0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvaWRsZS5jDQo+IEBAIC0yMiw2ICsy
Miw3IEBADQo+ICAgI2luY2x1ZGUgPGFzbS9zbXAuaD4NCj4gICAjaW5jbHVkZSA8YXNtL3J1bmxh
dGNoLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9kYmVsbC5oPg0KPiArI2luY2x1ZGUgPGFzbS9yZWcu
aD4NCj4gICANCj4gICAjaW5jbHVkZSAicG93ZXJudi5oIg0KPiAgICNpbmNsdWRlICJzdWJjb3Jl
LmgiDQo+IEBAIC01MDksNiArNTEwLDExIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHBvd2VyN19v
ZmZsaW5lKHZvaWQpDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBsb25nIHNycjE7DQo+ICAgDQo+ICsj
aWZkZWYgQ09ORklHX1ZNQVBfU1RBQ0sNCj4gKwl1bnNpZ25lZCBsb25nIGtzcF9lYSA9IGN1cnJl
bnRfc3RhY2tfcG9pbnRlcjsNCj4gKwljdXJyZW50X3N0YWNrX3BvaW50ZXIgPSAodW5zaWduZWQg
bG9uZylzdGFja19wYSgodm9pZCAqKWtzcF9lYSk7DQoNClNhbWUgYXMgb3RoZXIgcGF0Y2gsIEkg
dGhpbmsgeW91IGNhbid0IGp1c3QgY2hhbmdlIHN0YWNrIHBvaW50ZXIgb24gdGhlIA0KZmx5LCB5
b3UgaGF2ZSB0byBjaGFuZ2UgaXQgY2FyZWZ1bGx5IHZpYSBhc3NlbWJseSBhbmQgcGVyZm9ybSBh
IGZ1bmN0aW9uIA0KY2FsbCwganVzdCBsaWtlIGRvbmUgZm9yIGlycXMuDQoNCj4gKyNlbmRpZg0K
PiArDQo+ICAgCW10bXNyKE1TUl9JRExFKTsNCj4gICANCj4gICAjaWZkZWYgQ09ORklHX0tWTV9C
T09LM1NfSFZfUE9TU0lCTEUNCj4gQEAgLTU0Myw2ICs1NDksOSBAQCBzdGF0aWMgdW5zaWduZWQg
bG9uZyBwb3dlcjdfb2ZmbGluZSh2b2lkKQ0KPiAgIAkJc3JyMSA9IGlkbGVfa3ZtX3N0YXJ0X2d1
ZXN0KHNycjEpOw0KPiAgICNlbmRpZg0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19WTUFQX1NUQUNL
DQoNCllvdSBjb3VsZCBhdm9pZCBtYW55IG9mIHRoZSAjaWZkZWYgYW5kIHJlcGxhY2UgdGhlbSB3
aXRoIElTX0VOQUJMRUQoKQ0KDQo+ICsJY3VycmVudF9zdGFja19wb2ludGVyID0ga3NwX2VhOw0K
PiArI2VuZGlmDQo+ICAgCW10bXNyKE1TUl9LRVJORUwpOw0KPiAgIA0KPiAgIAlyZXR1cm4gc3Jy
MTsNCj4gQEAgLTU1MiwxNCArNTYxLDI0IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHBvd2VyN19v
ZmZsaW5lKHZvaWQpDQo+ICAgdm9pZCBwb3dlcjdfaWRsZV90eXBlKHVuc2lnbmVkIGxvbmcgdHlw
ZSkNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGxvbmcgc3JyMTsNCj4gKyNpZmRlZiBDT05GSUdfVk1B
UF9TVEFDSw0KPiArCXVuc2lnbmVkIGxvbmcga3NwX2VhOw0KPiArI2VuZGlmDQo+ICAgDQo+ICAg
CWlmICghcHJlcF9pcnFfZm9yX2lkbGVfaXJxc29mZigpKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIA0K
PiArI2lmZGVmIENPTkZJR19WTUFQX1NUQUNLDQo+ICsJa3NwX2VhID0gY3VycmVudF9zdGFja19w
b2ludGVyOw0KPiArCWN1cnJlbnRfc3RhY2tfcG9pbnRlciA9ICh1bnNpZ25lZCBsb25nKXN0YWNr
X3BhKCh2b2lkICopa3NwX2VhKTsNCj4gKyNlbmRpZg0KPiAgIAltdG1zcihNU1JfSURMRSk7DQo+
ICAgCV9fcHBjNjRfcnVubGF0Y2hfb2ZmKCk7DQo+ICAgCXNycjEgPSBwb3dlcjdfaWRsZV9pbnNu
KHR5cGUpOw0KPiAgIAlfX3BwYzY0X3J1bmxhdGNoX29uKCk7DQo+ICsjaWZkZWYgQ09ORklHX1ZN
QVBfU1RBQ0sNCj4gKwljdXJyZW50X3N0YWNrX3BvaW50ZXIgPSBrc3BfZWE7DQo+ICsjZW5kaWYN
Cj4gICAJbXRtc3IoTVNSX0tFUk5FTCk7DQo+ICAgDQo+ICAgCWZpbmlfaXJxX2Zvcl9pZGxlX2ly
cXNvZmYoKTsNCj4gQEAgLTYxNSw2ICs2MzQsOSBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBwb3dl
cjlfaWRsZV9zdG9wKHVuc2lnbmVkIGxvbmcgcHNzY3IpDQo+ICAgCXVuc2lnbmVkIGxvbmcgbW1j
cmEgPSAwOw0KPiAgIAlzdHJ1Y3QgcDlfc3BycyBzcHJzID0ge307IC8qIGF2b2lkIGZhbHNlIHVz
ZWQtdW5pbml0aWFsaXNlZCAqLw0KPiAgIAlib29sIHNwcnNfc2F2ZWQgPSBmYWxzZTsNCj4gKyNp
ZmRlZiBDT05GSUdfVk1BUF9TVEFDSw0KPiArCXVuc2lnbmVkIGxvbmcga3NwX2VhOw0KPiArI2Vu
ZGlmDQo+ICAgDQo+ICAgCWlmICghKHBzc2NyICYgKFBTU0NSX0VDfFBTU0NSX0VTTCkpKSB7DQo+
ICAgCQkvKiBFQz1FU0w9MCBjYXNlICovDQo+IEBAIC02MzMsNyArNjU1LDcgQEAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgcG93ZXI5X2lkbGVfc3RvcCh1bnNpZ25lZCBsb25nIHBzc2NyKQ0KPiAgIAkJ
ICovDQo+ICAgCQlCVUdfT04oKHNycjEgJiBTUlIxX1dBS0VTVEFURSkgIT0gU1JSMV9XU19OT0xP
U1MpOw0KPiAgIA0KPiAtCQlnb3RvIG91dDsNCj4gKwkJZ290byBvdXRfbm9sb3NzOw0KPiAgIAl9
DQo+ICAgDQo+ICAgCS8qIEVDPUVTTD0xIGNhc2UgKi8NCj4gQEAgLTY4OCw2ICs3MTAsMTAgQEAg
c3RhdGljIHVuc2lnbmVkIGxvbmcgcG93ZXI5X2lkbGVfc3RvcCh1bnNpZ25lZCBsb25nIHBzc2Ny
KQ0KPiAgIAlzcHJzLmlhbXIJPSBtZnNwcihTUFJOX0lBTVIpOw0KPiAgIAlzcHJzLnVhbW9yCT0g
bWZzcHIoU1BSTl9VQU1PUik7DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX1ZNQVBfU1RBQ0sNCj4g
Kwlrc3BfZWEgPSBjdXJyZW50X3N0YWNrX3BvaW50ZXI7DQo+ICsJY3VycmVudF9zdGFja19wb2lu
dGVyID0gKHVuc2lnbmVkIGxvbmcpc3RhY2tfcGEoKHZvaWQgKilrc3BfZWEpOw0KPiArI2VuZGlm
DQo+ICAgCXNycjEgPSBpc2EzMDBfaWRsZV9zdG9wX21heWxvc3MocHNzY3IpOwkJLyogZ28gaWRs
ZSAqLw0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfS1ZNX0JPT0szU19IVl9QT1NTSUJMRQ0KPiBA
QCAtNzk3LDYgKzgyMywxMCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBwb3dlcjlfaWRsZV9zdG9w
KHVuc2lnbmVkIGxvbmcgcHNzY3IpDQo+ICAgCQlfX3NsYl9yZXN0b3JlX2JvbHRlZF9yZWFsbW9k
ZSgpOw0KPiAgIA0KPiAgIG91dDoNCj4gKyNpZmRlZiBDT05GSUdfVk1BUF9TVEFDSw0KPiArCWN1
cnJlbnRfc3RhY2tfcG9pbnRlciA9IGtzcF9lYTsNCj4gKyNlbmRpZg0KPiArb3V0X25vbG9zczoN
Cj4gICAJbXRtc3IoTVNSX0tFUk5FTCk7DQo+ICAgDQo+ICAgCXJldHVybiBzcnIxOw0KPiBAQCAt
ODk4LDYgKzkyOCw5IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHBvd2VyMTBfaWRsZV9zdG9wKHVu
c2lnbmVkIGxvbmcgcHNzY3IpDQo+ICAgCXVuc2lnbmVkIGxvbmcgcGxzOw0KPiAgIC8vCXN0cnVj
dCBwMTBfc3BycyBzcHJzID0ge307IC8qIGF2b2lkIGZhbHNlIHVzZWQtdW5pbml0aWFsaXNlZCAq
Lw0KPiAgIAlib29sIHNwcnNfc2F2ZWQgPSBmYWxzZTsNCj4gKyNpZmRlZiBDT05GSUdfVk1BUF9T
VEFDSw0KPiArCXVuc2lnbmVkIGxvbmcga3NwX2VhOw0KPiArI2VuZGlmDQo+ICAgDQo+ICAgCWlm
ICghKHBzc2NyICYgKFBTU0NSX0VDfFBTU0NSX0VTTCkpKSB7DQo+ICAgCQkvKiBFQz1FU0w9MCBj
YXNlICovDQo+IEBAIC05MTYsNyArOTQ5LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgcG93ZXIx
MF9pZGxlX3N0b3AodW5zaWduZWQgbG9uZyBwc3NjcikNCj4gICAJCSAqLw0KPiAgIAkJQlVHX09O
KChzcnIxICYgU1JSMV9XQUtFU1RBVEUpICE9IFNSUjFfV1NfTk9MT1NTKTsNCj4gICANCj4gLQkJ
Z290byBvdXQ7DQo+ICsJCWdvdG8gb3V0X25vbG9zczsNCj4gICAJfQ0KPiAgIA0KPiAgIAkvKiBF
Qz1FU0w9MSBjYXNlICovDQo+IEBAIC05MjcsNyArOTYwLDExIEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIHBvd2VyMTBfaWRsZV9zdG9wKHVuc2lnbmVkIGxvbmcgcHNzY3IpDQo+ICAgDQo+ICAgCQlh
dG9taWNfc3RhcnRfdGhyZWFkX2lkbGUoKTsNCj4gICAJfQ0KPiAtDQo+ICsjaWZkZWYgQ09ORklH
X1ZNQVBfU1RBQ0sNCj4gKwlrc3BfZWEgPSBjdXJyZW50X3N0YWNrX3BvaW50ZXI7DQo+ICsJY3Vy
cmVudF9zdGFja19wb2ludGVyID0gKHVuc2lnbmVkIGxvbmcpc3RhY2tfcGEoKHZvaWQgKilrc3Bf
ZWEpOw0KPiArI2VuZGlmIC8qIENPTkZJR19WTUFQX1NUQUNLICovDQo+ICsJbXRtc3IoTVNSX0lE
TEUpOw0KPiAgIAlzcnIxID0gaXNhMzAwX2lkbGVfc3RvcF9tYXlsb3NzKHBzc2NyKTsJCS8qIGdv
IGlkbGUgKi8NCj4gICANCj4gICAJcHNzY3IgPSBtZnNwcihTUFJOX1BTU0NSKTsNCj4gQEAgLTk4
Miw2ICsxMDE5LDEwIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHBvd2VyMTBfaWRsZV9zdG9wKHVu
c2lnbmVkIGxvbmcgcHNzY3IpDQo+ICAgCQlfX3NsYl9yZXN0b3JlX2JvbHRlZF9yZWFsbW9kZSgp
Ow0KPiAgIA0KPiAgIG91dDoNCj4gKyNpZmRlZiBDT05GSUdfVk1BUF9TVEFDSw0KPiArCWN1cnJl
bnRfc3RhY2tfcG9pbnRlciA9IGtzcF9lYTsNCj4gKyNlbmRpZiAvKiBDT05GSUdfVk1BUF9TVEFD
SyAqLw0KPiArb3V0X25vbG9zczoNCj4gICAJbXRtc3IoTVNSX0tFUk5FTCk7DQo+ICAgDQo+ICAg
CXJldHVybiBzcnIxOw==
