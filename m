Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5BC84486C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 21:08:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bGwIoBNN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQCm11KB8z3cW2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 07:08:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bGwIoBNN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQCl84q3Dz3bn6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 07:08:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QK9nZ3O0A3ZCJ9/87gzNpzWlx1akp8cx+YzUUWJq3dXvpi1+YnVMxwpbzg/Z+uOgb9q5hCy1FgnDXbdZePOH327wyuPFkEstD7qcVlN9GzySM0pzPpeWsFp5o3YXepgglYVCPJcsw3wFHjs9mVqKm9c+nTVTtyxo6nADPLVPcNpZ6iaQiLTW66FEqwytyOSv/4RFSU9/blmojx3CPRdqnX93GJFxFcZRvhJuAfA6UrnY1o4Kpo52NLtdTYPscW5CUQVBa4j3ZZ+7Fdpp1iDIm5AfGknsjt36q1FtwtB4uuwtDGPalK8FxO7WRsEJbrglA4zoNQYllTfVul4f7zEhWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy+/lcr0i+p1eQoXqgGekasE3+nwgVbJSadwHUkHIGA=;
 b=fjEdE/H8u4NvnfaY7qe4weU3IhF6ZZHGsPjpK0skVBt+ruHZbb4Yla2bbw1fjyAzp3YzyRQWEF/ybnksClVGGTqKV2vApf9fjDBjIA+RWTrykmQwLjInQ0enms/+snN9KFPn1Gid4vCt498IIeEcfX79rHXal/fyouPy5pW/HEMCVLToMEDKuZQ+bROhIrOLB6Q4i1BkvyOuwlrBan6d3AZkc4yA2YH8NFCCPT6exT+JOEXlq22e7p3DJIyLZmhJU7PXrM5xlR320lCuqGQMhvJLhjk8NLIDzZj5rxBCDu26c2zQ82XK/YqOwHGPvvEDbq6mJ2Zact1aBVBAeCTWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy+/lcr0i+p1eQoXqgGekasE3+nwgVbJSadwHUkHIGA=;
 b=bGwIoBNNS4b3Wg2lP8GzZuF47atHDI1yrsxqZFN0Jcn7HWQ77kkllaziHJWNoFu4i0vY0rlAW92bTmFDnngP0zTcuUUYPYr+yrIfbKriHB81tWWRcMeTCPxiQOZJxzxXglx2sd4l9U0MnasWyakPlXGK7QXGeScxY9uWccnovN2QeMpdQJwi2W/PITyvj7yCXd9XEEvGwdMZBKZ9o+oseo1WuV0hA2aa+nQqAPklOKMvKJwqfTokUTMvTj75Bbomz6rVKyr3V44sFU41U7/WHCtYftF9ukXbjS5J/przP0nkJnCLqcysUSWBQo5FAtpvdJ0ZL2LVuoQkyJm0O4pMXA==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRZP264MB1893.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.24; Wed, 31 Jan 2024 20:07:40 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::91e3:2737:5a73:cc27]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::91e3:2737:5a73:cc27%5]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 20:07:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Topic: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Index:  AQHaM+yXNPEoBBWgvUqc5dink/c7D7DxdmEAgADbxgCAAB3agIAAcSGAgAEwfgCAADexAIAAURwA
Date: Wed, 31 Jan 2024 20:07:40 +0000
Message-ID: <27eb37bb-f4eb-4cfb-ba3f-2317856f7b4b@csgroup.eu>
References:  <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
 <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
 <20240130091626.GA3684878@google.com>
 <9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
 <CGME20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd@eucas1p1.samsung.com>
 <30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
 <46627d92-976a-4126-b261-a4c6575e5a3e@csgroup.eu>
 <2febff4d-26ba-4809-a124-7add25ab3d35@samsung.com>
In-Reply-To: <2febff4d-26ba-4809-a124-7add25ab3d35@samsung.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|MRZP264MB1893:EE_
x-ms-office365-filtering-correlation-id: 73ea2481-6ead-4127-ba94-08dc22984723
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  X+Z224A0xErNQNGAriFmv4aY/PDgcmRReElU91J4xciAOvcV5L0g8sHyiOo2iC318UIbNKkJQpHXp0ZFs0OU/7En3lIJQPwlOxuI15Q0RnnB18GogBOvMLG7YdSCNhb9oT2zEWRu8AM0UnZH6BkGQpYQeOTqM7NqslVaX3DW86a2a0DGSKvSkpe8hYLSc0e9ulafMniOkKCDjpUPaA2UuBEtNlCMAkBQYwVrffuAjTqO0j16kbTxzZ4YuyyQotAhJhBgnscP7f4tVpvYsQZZhlrAGTtN8pXDsjMKPpiAc4ZCuFyYBc2dMKy/wndJxxZHV86Tt7LcGxSs7ObSLXMK/isfrNSY20B4HAirakji2rrCB5B2Ee0clOYklsfLaCuxrIClGrL62EH7zb8XnUrJTIfCDSAlTr5MA1w6MZSo6jPaSlosecoWR3U4BjgJ6UrC6jSnOm55ulWtIcAL08R7h/d1UmMma38vu0uwgqWOLce6cJtlWUvJymsr+1TwwSx68kgUGIR7+SA5ZRHNvaNNtRwpMev+BBmuVNsFG6WYwyRmIQ1e0bmomddGJou4xT4STksN5fOAZLbGcdmODUuHzemTXxPWIPDl3WpyobPXZIWuMEsucT2nAI0L8AVroQ6EajeAIOG2mFab+Nhr328qQIatPwn5iacqBxtCWwZ+jX7KJxqz7VAPfmXYOlvslKRFC9HKO0c/irOgcrIeSTLLdFmTwigGYD2O4JTEvbozcYs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(26005)(66574015)(2616005)(41300700001)(54906003)(966005)(36756003)(38070700009)(316002)(66446008)(66556008)(64756008)(478600001)(6512007)(6486002)(83380400001)(53546011)(6506007)(71200400001)(38100700002)(66476007)(122000001)(66946007)(8936002)(110136005)(2906002)(4326008)(5660300002)(44832011)(31696002)(7416002)(91956017)(76116006)(86362001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?REZCTnRVT0Naa0tMc0J2Q0wzTnFwQy9FRjFxQ0JuS29sYWh0SFBweFl4TzhQ?=
 =?utf-8?B?bVQ2MndYMWlsa3FsaU9UYXFJbkU4RlB1VzEvL21DRnhZZzYzRGozcHVIc3pY?=
 =?utf-8?B?NWhiRm5PbjlIV0ZSYTQyakRaOG8yMWdLQTZzQ2hPRXl4RXRDNHJVaGNkMmd1?=
 =?utf-8?B?cjZxcEpJTEhqNXkzWjlIUmV3ODRYS1hvYmRrK3ljY1FJcWxUclZwQWN4RjlD?=
 =?utf-8?B?aGh3UjU2YmJMT3RHRHlqcXJFZG1hZnhUcE9SQzJ6b0NtWWNJekt2MERkVEVv?=
 =?utf-8?B?eWs4TWFQaktmdG81dGt3bTYzUnlJT1ZMaFZwN0JBdU9QalpIRm9ZaWpoZnpW?=
 =?utf-8?B?VlRlUm0rSHZWNS9OWURkZ1gxMktZWFpFMnhEdEFCYTRvWGNCMy9kUTJLTVVl?=
 =?utf-8?B?ME9xOWxsVXpwT3dWdUNBaTk2b0svRXdlNUpUc0ViZVJuNFRtaDVRYml5R3dB?=
 =?utf-8?B?OGpVeGdVRWFydjYxMXJnSVZnUVBxb0lyOXdjU21wMnZ1WmtOQzB5Q0xPQ2Yy?=
 =?utf-8?B?aHBYUVFsT3VLeUZoaVZ3bkZuUGpabTVsWHB5MUZHdnZ6a0x3c1ZsYXYzVXNZ?=
 =?utf-8?B?UGt3ZG9vQW9BbWprTldBdkhKaFhRQktGMnVFVWJuWG84YkNGbGtod2dmV0E5?=
 =?utf-8?B?aUVTcEs3UXlpY1Rsc3JGQVVLYS85VVhBUGlsaVhJTm1nQmFFcnVyN09mVjRz?=
 =?utf-8?B?SVU2MGx4bVFRMTVSMldSVEtTTHV4WXdscDZwdHJIRmNqeGxFdHljaVdYZnI5?=
 =?utf-8?B?Z3ZUNEZ5NzFKbHdTQ21LaHhlYnBaNENreWl2cURBSGZCNE0vZDBGaEN5WkNR?=
 =?utf-8?B?bS9iTGFBTmxReEJVTWxiVmZtdUsrVDFMK2hUWVpxaEszTnI3SEFVYjFuV1B2?=
 =?utf-8?B?aWRUS1FJeHJBMHFHY0F0a1ZTQnFXelllWU1Oa05FWTQ1b0xjOVg3TkdlaUE0?=
 =?utf-8?B?cGFhalJ4VDg3NHZ3VzdBeE5wbnB1VkozSmRsSlh1TjVOSVFNY1BSZlgzTDBi?=
 =?utf-8?B?NmxBeHlLd3BvZ2VreWUvSHlOVmhKVzg1WTY0S1V6bVErWGZreHhJWmc3bTZN?=
 =?utf-8?B?anE1ZlRFckkrTktwdWhLYmw1b0V0TEVNMG84aE9leGFKRWI5TzZlb0p1Zk9K?=
 =?utf-8?B?RXA5b2FBZ2FXOU5zQ1BYSjEwdDBabENpUGxMWDd2QzJ3NnpvSTRibEJQcUZr?=
 =?utf-8?B?L2poVUswRWVMckN1cUxmdTFRTDQ2UnJQKzZ0TG93aGJzN0h4eERkN2tYNFc3?=
 =?utf-8?B?aVIweG1nS0FCK0dsSDNTcnIwTVQ4MUthQmFBaVRobFNFVU5SbFZGZWJRYmEx?=
 =?utf-8?B?TmVuRU5MbktFSWE4Y2g3dTZJWlhQejhQVlNqSDBCSTdORUFHL0JLT01rajIy?=
 =?utf-8?B?V3lheGVmcjVoaFNSTHA0MFR6UTk1QUZibHRsRVJJT1dJUG1aeC9YYmFYb1E2?=
 =?utf-8?B?RDZ3M3F5ZStEbUxNS2FWNFEvQko5WXVWR3o0cVcycFNYZi9DdXNZaXQxNXBZ?=
 =?utf-8?B?Rm5pbTFqUE55MkJ6WnI2U2N1TUt4QlZNZmNCRVBmMXJBbVdtVFRLcXNGQVFS?=
 =?utf-8?B?REZLZEVrblF5NDg2N2d4LzYwemtIN25GRGR2QkI3MlZ5M1BmaCtNVHFYMGdN?=
 =?utf-8?B?dkhRanhRU0pxd0o2b1hlM1NOL2NKbko3U3R3TmdsYTR3MTdtaHBwaTB2RWhC?=
 =?utf-8?B?OTkwaXBPU2RIWHBiT0VMNEsrT0dpY2hWbWFEdFlTckZUT0syWUFDRmpURTJO?=
 =?utf-8?B?bjVRamJUVzRvcENob09lSXVlOEt2TEFRcU5rYkRueFc5MElOUkkwV0ZNeXFX?=
 =?utf-8?B?Z09PQnhnMW9OYlovQVFrbHowTi8yUzVGR1BhdWlsYzlNMFdUSVpBOVRkYzN2?=
 =?utf-8?B?YjdFblZheGh2MlQvSFYySmdPK3IxN3NTL0pxSU1UL2pnM29mTXM4Qk5mMllR?=
 =?utf-8?B?VU1lNSt4bmdoMjVkdmN6T1FFbHp4c2JZNVYzVFZtWTVCcmZnSytXMmEzS254?=
 =?utf-8?B?dFlSZTVDZGpScUdBZHNvVmJiczNFdjVzZFluVDdPRDBiNGx4OUE0K3U0Zjk0?=
 =?utf-8?B?RFdqU0ljMXk1NHV2YnBEZDZJTzdzQmc5TjhRb3IvOGRsQWY4MzVGNXkwNS96?=
 =?utf-8?B?RWxSLzczUjBNUTZyNDNBZ0hvcUY3aSs4MjQxYnNwU2k2T3dTMnZXK2tVMm5H?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F61F691FBDAB24D9F738B7A6E8EF56D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ea2481-6ead-4127-ba94-08dc22984723
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 20:07:40.3301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVbRxqF/aXNMmxdTnK1PavynQ+6wW5oJS2VsBdp1mXLT7d+dzguC5pcDCzeBOqCu8wQG9k3cJmF1Ju2/wSWWH8n9anmKP4MvJbsVy1eE9bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1893
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
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzAxLzIwMjQgw6AgMTY6MTcsIE1hcmVrIFN6eXByb3dza2kgYSDDqWNyaXTCoDoN
Cj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgbS5zenlwcm93
c2tpQHNhbXN1bmcuY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDD
oCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4g
SGkgQ2hyaXN0b3BoZSwNCj4gDQo+IE9uIDMxLjAxLjIwMjQgMTI6NTgsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBMZSAzMC8wMS8yMDI0IMOgIDE4OjQ4LCBNYXJlayBTenlwcm93c2tpIGEg
w6ljcml0IDoNCj4+PiBbVm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBk
ZSBtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20uIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3Qg
aW1wb3J0YW50IMOgIGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlv
biBdDQo+Pj4NCj4+PiBPbiAzMC4wMS4yMDI0IDEyOjAzLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4+PiBMZSAzMC8wMS8yMDI0IMOgIDEwOjE2LCBDaGVuLVl1IFRzYWkgYSDDqWNyaXQgOg0K
Pj4+Pj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgd2Vuc3RA
Y2hyb21pdW0ub3JnLiBEP2NvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50ID8gaHR0
cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4+Pj4+DQo+Pj4+
PiBPbiBNb24sIEphbiAyOSwgMjAyNCBhdCAxMjowOTo1MFBNIC0wODAwLCBMdWlzIENoYW1iZXJs
YWluIHdyb3RlOg0KPj4+Pj4+IE9uIFRodSwgRGVjIDIxLCAyMDIzIGF0IDEwOjAyOjQ2QU0gKzAx
MDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4+Pj4+IERlY2xhcmluZyByb2RhdGFfZW5h
YmxlZCBhbmQgbWFya19yb2RhdGFfcm8oKSBhdCBhbGwgdGltZQ0KPj4+Pj4+PiBoZWxwcyByZW1v
dmluZyByZWxhdGVkICNpZmRlZmVyeSBpbiBDIGZpbGVzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+
DQo+Pj4+Pj4gVmVyeSBuaWNlIGNsZWFudXAsIHRoYW5rcyEsIGFwcGxpZWQgYW5kIHB1c2hlZA0K
Pj4+Pj4+DQo+Pj4+Pj4gICAgICAgIEx1aXMNCj4+Pj4+IE9uIG5leHQtMjAyNDAxMzAsIHdoaWNo
IGhhcyB5b3VyIG1vZHVsZXMtbmV4dCBicmFuY2gsIGFuZCB0aHVzIHRoaXMNCj4+Pj4+IHNlcmll
cyBhbmQgdGhlIG90aGVyICJtb2R1bGU6IFVzZSBzZXRfbWVtb3J5X3JveCgpIiBzZXJpZXMgYXBw
bGllZCwNCj4+Pj4+IG15IGtlcm5lbCBjcmFzaGVzIGluIHNvbWUgdmVyeSB3ZWlyZCB3YXkuIFJl
dmVydGluZyB5b3VyIGJyYW5jaA0KPj4+Pj4gbWFrZXMgdGhlIGNyYXNoIGdvIGF3YXkuDQo+Pj4+
Pg0KPj4+Pj4gSSB0aG91Z2h0IEknZCByZXBvcnQgaXQgcmlnaHQgYXdheS4gTWF5YmUgeW91IGZv
bGtzIHdvdWxkIGtub3cgd2hhdCdzDQo+Pj4+PiBoYXBwZW5pbmcgaGVyZT8gVGhpcyBpcyBvbiBh
cm02NC4NCj4+Pj4gVGhhdCdzIHN0cmFuZ2UsIGl0IHNlZW1zIHRvIGJ1ZyBpbiBtb2R1bGVfYnVn
X2ZpbmFsaXplKCkgd2hpY2ggaXMNCj4+Pj4gX2JlZm9yZV8gY2FsbHMgdG8gbW9kdWxlX2VuYWJs
ZV9ybygpIGFuZCBzdWNoLg0KPj4+Pg0KPj4+PiBDYW4geW91IHRyeSB0byByZXZlcnQgdGhlIDYg
cGF0Y2hlcyBvbmUgYnkgb25lIHRvIHNlZSB3aGljaCBvbmUNCj4+Pj4gaW50cm9kdWNlcyB0aGUg
cHJvYmxlbSA/DQo+Pj4+DQo+Pj4+IEluIHJlYWxpdHksIG9ubHkgcGF0Y2ggNjc3YmZiOWRiOGEz
IHJlYWxseSBjaGFuZ2UgdGhpbmdzLiBPdGhlciBvbmVzIGFyZQ0KPj4+PiBtb3JlIG9uIGxlc3Mg
b25seSBjbGVhbnVwLg0KPj4+IEkndmUgYWxzbyBydW4gaW50byB0aGlzIGlzc3VlIHdpdGggdG9k
YXkncyAoMjAyNDAxMzApIGxpbnV4LW5leHQgb24gbXkNCj4+PiB0ZXN0IGZhcm0uIFRoZSBpc3N1
ZSBpcyBub3QgZnVsbHkgcmVwcm9kdWNpYmxlLCBzbyBpdCB3YXMgYSBiaXQgaGFyZCB0bw0KPj4+
IGJpc2VjdCBpdCBhdXRvbWF0aWNhbGx5LiBJJ3ZlIHNwZW50IHNvbWUgdGltZSBvbiBtYW51YWwg
dGVzdGluZyBhbmQgaXQNCj4+PiBsb29rcyB0aGF0IHJldmVydGluZyB0aGUgZm9sbG93aW5nIDIg
Y29tbWl0cyBvbiB0b3Agb2YgbGludXgtbmV4dCBmaXhlcw0KPj4+IHRoZSBwcm9ibGVtOg0KPj4+
DQo+Pj4gNjU5Mjk4ODRmODY4ICgibW9kdWxlczogUmVtb3ZlICNpZmRlZiBDT05GSUdfU1RSSUNU
X01PRFVMRV9SV1ggYXJvdW5kDQo+Pj4gcm9kYXRhX2VuYWJsZWQiKQ0KPj4+IDY3N2JmYjlkYjhh
MyAoIm1vZHVsZTogRG9uJ3QgaWdub3JlIGVycm9ycyBmcm9tIHNldF9tZW1vcnlfWFgoKSIpDQo+
Pj4NCj4+PiBUaGlzIGluIGZhY3QgbWVhbnMgdGhhdCBjb21taXQgNjc3YmZiOWRiOGEzIGlzIHJl
c3BvbnNpYmxlIGZvciB0aGlzDQo+Pj4gcmVncmVzc2lvbiwgYXMgNjU5Mjk4ODRmODY4IGhhcyB0
byBiZSByZXZlcnRlZCBvbmx5IGJlY2F1c2UgdGhlIGxhdHRlcg0KPj4+IGRlcGVuZHMgb24gaXQu
IExldCBtZSBrbm93IHdoYXQgSSBjYW4gZG8gdG8gaGVscCBkZWJ1Z2dpbmcgdGhpcyBpc3N1ZS4N
Cj4+Pg0KPj4gVGhhbmtzIGZvciB0aGUgYmlzZWN0LiBJIHN1c3BlY3QgeW91IGhpdCBvbmUgb2Yg
dGhlIGVycm9ycyBhbmQgc29tZXRoaW5nDQo+PiBnb2VzIHdyb25nIGluIHRoZSBlcnJvciBwYXRo
Lg0KPj4NCj4+IFRvIGNvbmZpcm0gdGhpcyBhc3N1bXB0aW9uLCBjb3VsZCB5b3UgdHJ5IHdpdGgg
dGhlIGZvbGxvd2luZyBjaGFuZ2Ugb24NCj4+IHRvcCBvZiBldmVyeXRoaW5nID8NCj4gDQo+IA0K
PiBZZXMsIHRoaXMgaXMgdGhlIHByb2JsZW0uIEkndmUgYWRkZWQgcHJpbnRpbmcgYSBtb2QtPm5h
bWUgdG8gdGhlIGxvZy4NCj4gSGVyZSBpcyBhIGxvZyBmcm9tIGtlcm5lbCBidWlsZCBmcm9tIG5l
eHQtMjAyNDAxMzAgKHNvbWV0aW1lcyBpdCBldmVuDQo+IGJvb3RzIHRvIHNoZWxsKToNCj4gDQo+
ICMgZG1lc2cgfCBncmVwIG1vZHVsZV9zZXRfbWVtb3J5DQo+IFvCoMKgwqAgOC4wNjE1MjVdIG1v
ZHVsZV9zZXRfbWVtb3J5KDYsIDAwMDAwMDAwMDAwMDAwMDAsIDApIG5hbWUgaXB2Ng0KPiByZXR1
cm5lZCAtMjINCj4gW8KgwqDCoCA4LjA2NzU0M10gV0FSTklORzogQ1BVOiAzIFBJRDogMSBhdCBr
ZXJuZWwvbW9kdWxlL3N0cmljdF9yd3guYzoyMg0KPiBtb2R1bGVfc2V0X21lbW9yeSsweDljLzB4
YjgNCg0KV291bGQgYmUgZ29vZCBpZiB5b3UgY291bGQgc2hvdyB0aGUgYmFja3RyYWNlIHRvbyBz
byB0aGF0IHdlIGtub3cgd2hvIGlzIA0KdGhlIGNhbGxlci4gSSBndWVzcyB3aGF0IHlvdSBzaG93
IGhlcmUgaXMgd2hhdCB5b3UgZ2V0IG9uIHRoZSBzY3JlZW4gPyANClRoZSBiYWNrdHJhY2Ugc2hv
dWxkIGJlIGF2YWlsYWJsZSB0aHJvdWdodCAnZG1lc2cnLg0KDQpJIGd1ZXNzIHdlIHdpbGwgbm93
IHNlZWsgaGVscCBmcm9tIEFSTTY0IHBlb3BsZSB0byB1bmRlcnN0YW5kIHdoeSANCm1vZHVsZV9z
ZXRfbWVtb3J5X3NvbWV0aGluZygpIGZhaWxzIHdpdGggLUVJTlZBTCB3aGVuIGxvYWRpbmcgbW9k
dWxlcy4NCg0KDQo+IFvCoMKgwqAgOC4wOTc4MjFdIHBjIDogbW9kdWxlX3NldF9tZW1vcnkrMHg5
Yy8weGI4DQo+IFvCoMKgwqAgOC4xMDIwNjhdIGxyIDogbW9kdWxlX3NldF9tZW1vcnkrMHg5Yy8w
eGI4DQo+IFvCoMKgwqAgOC4xODMxMDFdwqAgbW9kdWxlX3NldF9tZW1vcnkrMHg5Yy8weGI4DQo+
IFvCoMKgwqAgOC40NzI4NjJdIG1vZHVsZV9zZXRfbWVtb3J5KDYsIDAwMDAwMDAwMDAwMDAwMDAs
IDApIG5hbWUgeF90YWJsZXMNCj4gcmV0dXJuZWQgLTIyDQo+IFvCoMKgwqAgOC40NzkyMTVdIFdB
Uk5JTkc6IENQVTogMiBQSUQ6IDEgYXQga2VybmVsL21vZHVsZS9zdHJpY3Rfcnd4LmM6MjINCj4g
bW9kdWxlX3NldF9tZW1vcnkrMHg5Yy8weGI4DQo+IFvCoMKgwqAgOC41MTA5NzhdIHBjIDogbW9k
dWxlX3NldF9tZW1vcnkrMHg5Yy8weGI4DQo+IFvCoMKgwqAgOC41MTUyMjVdIGxyIDogbW9kdWxl
X3NldF9tZW1vcnkrMHg5Yy8weGI4DQo+IFvCoMKgwqAgOC41OTYyNTldwqAgbW9kdWxlX3NldF9t
ZW1vcnkrMHg5Yy8weGI4DQo+IFvCoMKgIDEwLjUyOTg3OV0gbW9kdWxlX3NldF9tZW1vcnkoNiwg
MDAwMDAwMDAwMDAwMDAwMCwgMCkgbmFtZSBkbV9tb2QNCj4gcmV0dXJuZWQgLTIyDQo+IFvCoMKg
IDEwLjUzNjA4N10gV0FSTklORzogQ1BVOiAzIFBJRDogMTI3IGF0IGtlcm5lbC9tb2R1bGUvc3Ry
aWN0X3J3eC5jOjIyDQo+IG1vZHVsZV9zZXRfbWVtb3J5KzB4OWMvMHhiOA0KPiBbwqDCoCAxMC41
NjgyNTRdIHBjIDogbW9kdWxlX3NldF9tZW1vcnkrMHg5Yy8weGI4DQo+IFvCoMKgIDEwLjU3MjUw
MV0gbHIgOiBtb2R1bGVfc2V0X21lbW9yeSsweDljLzB4YjgNCj4gW8KgwqAgMTAuNjUzNTM1XcKg
IG1vZHVsZV9zZXRfbWVtb3J5KzB4OWMvMHhiOA0KPiBbwqDCoCAxMC44NTMxNzddIG1vZHVsZV9z
ZXRfbWVtb3J5KDYsIDAwMDAwMDAwMDAwMDAwMDAsIDApIG5hbWUgZnVzZQ0KPiByZXR1cm5lZCAt
MjINCj4gW8KgwqAgMTAuODU5MTk2XSBXQVJOSU5HOiBDUFU6IDUgUElEOiAxMzAgYXQga2VybmVs
L21vZHVsZS9zdHJpY3Rfcnd4LmM6MjINCj4gbW9kdWxlX3NldF9tZW1vcnkrMHg5Yy8weGI4DQo+
IFvCoMKgIDEwLjg5MTM4Ml0gcGMgOiBtb2R1bGVfc2V0X21lbW9yeSsweDljLzB4YjgNCj4gW8Kg
wqAgMTAuODk1NjI5XSBsciA6IG1vZHVsZV9zZXRfbWVtb3J5KzB4OWMvMHhiOA0KPiBbwqDCoCAx
MC45NzY2NjNdwqAgbW9kdWxlX3NldF9tZW1vcnkrMHg5Yy8weGI4DQo+IA0KPiANCj4gDQo+PiBk
aWZmIC0tZ2l0IGEva2VybmVsL21vZHVsZS9zdHJpY3Rfcnd4LmMgYi9rZXJuZWwvbW9kdWxlL3N0
cmljdF9yd3guYw0KPj4gaW5kZXggYTE0ZGY5NjU1ZGJlLi5mZGY4NDg0MTU0ZGQgMTAwNjQ0DQo+
PiAtLS0gYS9rZXJuZWwvbW9kdWxlL3N0cmljdF9yd3guYw0KPj4gKysrIGIva2VybmVsL21vZHVs
ZS9zdHJpY3Rfcnd4LmMNCj4+IEBAIC0xNSw5ICsxNSwxMiBAQCBzdGF0aWMgaW50IG1vZHVsZV9z
ZXRfbWVtb3J5KGNvbnN0IHN0cnVjdCBtb2R1bGUNCj4+ICptb2QsIGVudW0gbW9kX21lbV90eXBl
IHR5cGUsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCAoKnNldF9tZW1vcnkp
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIGludCBudW1fcGFnZXMpKQ0KPj4gICAgIHsNCj4+ICAgICAg
ICBjb25zdCBzdHJ1Y3QgbW9kdWxlX21lbW9yeSAqbW9kX21lbSA9ICZtb2QtPm1lbVt0eXBlXTsN
Cj4+ICsgICAgIGludCBlcnI7DQo+Pg0KPj4gICAgICAgIHNldF92bV9mbHVzaF9yZXNldF9wZXJt
cyhtb2RfbWVtLT5iYXNlKTsNCj4+IC0gICAgIHJldHVybiBzZXRfbWVtb3J5KCh1bnNpZ25lZCBs
b25nKW1vZF9tZW0tPmJhc2UsIG1vZF9tZW0tPnNpemUgPj4NCj4+IFBBR0VfU0hJRlQpOw0KPj4g
KyAgICAgZXJyID0gc2V0X21lbW9yeSgodW5zaWduZWQgbG9uZyltb2RfbWVtLT5iYXNlLCBtb2Rf
bWVtLT5zaXplID4+DQo+PiBQQUdFX1NISUZUKTsNCj4+ICsgICAgIFdBUk4oZXJyLCAibW9kdWxl
X3NldF9tZW1vcnkoJWQsICVweCwgJXgpIHJldHVybmVkICVkXG4iLCB0eXBlLA0KPj4gbW9kX21l
bS0+YmFzZSwgbW9kX21lbS0+c2l6ZSwgZXJyKTsNCj4+ICsgICAgIHJldHVybiBlcnI7DQo+PiAg
ICAgfQ0KPj4NCj4+ICAgICAvKg0KPj4NCj4+DQo+PiBUaGFua3MgZm9yIHlvdXIgaGVscA0KPj4g
Q2hyaXN0b3BoZQ0KPiANCj4gQmVzdCByZWdhcmRzDQo+IC0tDQo+IE1hcmVrIFN6eXByb3dza2ks
IFBoRA0KPiBTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kDQo+IA0K
