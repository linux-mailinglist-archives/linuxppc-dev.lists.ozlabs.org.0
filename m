Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AF763610
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 14:17:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=YKw3PljO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9tDw3265z3cJl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 22:17:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=YKw3PljO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:704b::719; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=machel@vivo.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20719.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9tD00Pqbz2yN0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 22:16:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POnt5mHlqor1BTkdcXLNgVWTSxz8G7FlFvLWUQJyunHrvJR3XmuKLPOqpBEprRuPqclr4ii7BGF4ztorBO5PTNofWYJtT9ebM/if4JMip6n5HrXM2NhLdU3aYBvkH5e12SL7EniAcfyThiXCzfKxXeIdnZFEgU+VBE2X3HQFr6RvjDo7yl2iBSc+pcxbTBcInfCE2eaoc1Smp16d5uT2WwobVVB0x/Y8DYfg9QOK6xsTJ/1VlV7fz+ub+X7ssv3i0tPajhfseg4ztMmcxzFcI7s11pLnk/qaaeqA70gUnpv3oOHkTaVK+ROV0Z3f/qkJPyQpqigLiU16OJaHKT3FlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaHezA6DgZDvq91FczRErIRPQfvMDQ4j6pOMKlaVJUw=;
 b=baCBl2+MFcJEYDeLiS2Puhy/s2BCbhd/oTs9jScf9HJC62hQ5dNNJm0yCfpazqbdR4gfOXbun/fYNd2UUogO319+jYXEw9GSNtpjD8IXwLGS+YNiTWQlc/GC3YgspwPR4TQIgXH1CTN2hpGFaM5WZfCSK8rSyP/zIcJ8A5tiIVWPyb366Xpe62YedUqEQkekO+ADDmmbJ9/eOIk+tlk2rTt31LahZJX5C710Ub8SywN9TQEtZn1VYDWg58Ikmfg4/SS8Ml6p9iXBMbzN5+f7B3mJQ/084NsxNxslgV3l0uDVXsTOsnKdpeoeze/6AKzbC5D6rn1iXorEXVf9biTGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaHezA6DgZDvq91FczRErIRPQfvMDQ4j6pOMKlaVJUw=;
 b=YKw3PljO6GDu+RsWLkZ26N/m04WyztA+dVR59T7m6MPnBohQKAWQv+GKnlxJ5em0otfUVVt09hYjgV7nazIxceSNHKJvYckVYDIPHN2Pp1qHpj8SzrNJm0MQmMv1cvuZsgPOnnkgpdXTxm+5ZTRwWVhDTfwPESbhL/9RU4qbXA95ekXokLMNeGDMY/Q2AjxnXUbVKLFMekuOThaNKydwB2PeuweC7XBuT/l0Jgv0vbYRddjtVMT3eCPPCfeS/oNbiCXUNGgwTDU9mKvqcho+XKAs4IxiVZUx04T+7P+N8AWHz2s278Y19bi3U48hkfQ64mQnm/18t0bsXxJNdLirYA==
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 SEZPR06MB6331.apcprd06.prod.outlook.com (2603:1096:101:12c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.33; Wed, 26 Jul 2023 12:15:53 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::535e:25af:a3bc:d600]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::535e:25af:a3bc:d600%4]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 12:15:52 +0000
From: =?utf-8?B?546L5piOLei9r+S7tuW6leWxguaKgOacr+mDqA==?= <machel@vivo.com>
To: =?utf-8?B?546L5piOLei9r+S7tuW6leWxguaKgOacr+mDqA==?= <machel@vivo.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Donnellan
	<ajd@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc:platforms:Fix an NULL vs IS_ERR() bug for
 debugfs_create_dir()
Thread-Topic: [PATCH v2] powerpc:platforms:Fix an NULL vs IS_ERR() bug for
 debugfs_create_dir()
Thread-Index: AQHZtGwetP9wGPYWaU2hVhcrlEssQK/MDP2A
Date: Wed, 26 Jul 2023 12:15:52 +0000
Message-ID: <bc623bc4-63b1-9c01-79ea-9b6152181935@vivo.com>
References: <20230712025250.6512-1-machel@vivo.com>
In-Reply-To: <20230712025250.6512-1-machel@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3743:EE_|SEZPR06MB6331:EE_
x-ms-office365-filtering-correlation-id: 76974228-a0d5-4c01-f27f-08db8dd20e35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  K0myGwxJq5q3XxUI2AeUYZW/e6PH//Ducto0yIt3H1gszZAnVCzbpYs7su2IKarnSgpE9IbwTMw2xdK8UB/4OHPlaXtenKQ4uAJYfNO7U4geWXTI9PAogkYR/b3w+gpHPLrvJCViSCCdqtNrceqR27I1XJ+mpyEyLJJ4gNYAl43Of3nQRph4VTRPNc7oF1UJIAoNHnj9kZR1rpaTCzEkcEW5741eWWmiTJiDIIj6Qq8+cfJko70TDMF2zwnakM8vA14lTg6jxAHgShJimH3Uu3pt7R61iLOwn/nVxFZO2c777bkpPi8q5xOeLnSc97rRxCAE73OzEqPapmBStvZbgUh8ZgKAnhce8GALFqPajdVGe3uhWCTUd1TK981gj6fHIA6OU7GyxNZadFW5XOY/BcBj/uigIx2MJ37Jl9mJ+JQ+HRxb/lqBTY2XR+Cu1D08GkY9MB1aYERUweNrI2M8roNyylBHU8cmCmNniRtaHu7iEsqFqdNE7mldAA+RxL189V/vpKmHPhZoucK3lXlgh6ua6VhGym65eXxWetOH+82Tg5ta913plKiwEG/8MjV/LCT4YSP6ITVtNlAsMy0+snxHup4yJieYHwiz2vtaX2mVBBCxyBbv+NjTHE3n48dhqT7G0/aZoJ9PllrIJJi90A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3743.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(107886003)(186003)(71200400001)(6506007)(26005)(2616005)(64756008)(83380400001)(76116006)(66476007)(66556008)(66446008)(4326008)(66946007)(316002)(5660300002)(8676002)(41300700001)(6486002)(6512007)(966005)(8936002)(2906002)(478600001)(110136005)(38100700002)(122000001)(38070700005)(31696002)(86362001)(85182001)(36756003)(31686004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V0FnVjBmVVNoOW1yZjVVS3hWYWpIY1VTQXV3WWdWdEx6cDNKclcyQkpWZk1i?=
 =?utf-8?B?RlJsbWhCOUFTbTJaOXhQQmFoakJzT1BpaHlKSmtCbkc5elpHaGJIeGJSMjJk?=
 =?utf-8?B?QzJOUmFmU2FvY0dBOGJ1bmZZbXlQVDJ4KzJ1RnVEZHY4aFJSZXJhRlNJNHZC?=
 =?utf-8?B?Uk1va2dmM01wd01OVnJVUzF6ZVFQa3hvTXo0R1hiNkNGYk9ZUk91VGdCRi9Q?=
 =?utf-8?B?am9OcFREcGZyRUQwbVIxQTIrOGU2ZHhsNjZkT2dUSnRvZG4xV0ZPbGkwNCth?=
 =?utf-8?B?aWpSNXRjU3lHNG03SWlSSTUya0pOYk9QR1pPaURQZlg0VUo3WEJyYTJZN0I3?=
 =?utf-8?B?TCtDZUo2S3AwalU3VHpWUElYdG1mNzREQysxZWZLOTFKYTBGWHZ6WnI5Z05i?=
 =?utf-8?B?a1NNcUpOQU9DRTM2V1JweHBXUmxhT1F3ZFA4V1FrSmNOVHQ3enhsOStJa2JW?=
 =?utf-8?B?dzJYTTJMUEM3TlNPYnpXRnVhUHFiQkx4SDhURnBRSy9yTFlSTDdaRXBTV3pV?=
 =?utf-8?B?VkNiaWhnZWY2bHAxRWozenZ5M21EbVdUeHd5dDhNLytUVGhIZG5ObXl2SFc5?=
 =?utf-8?B?bnNseGpsNXh6WUJESGQvN1ZaUnV0SHpuVXIyT3BnSHo2djZJRTBMMmdKSlUr?=
 =?utf-8?B?RGJ3Y1F4NjVSL3h3eTJKOUphY1o5Q3hFdHllNWdzeWNvcEZndUdTaWxUOUhV?=
 =?utf-8?B?bk9oanRDK2JtTXl5dStscU9iSkltTnA2VEtXUGxMYXV3b3E3dzBZdFFGb0M1?=
 =?utf-8?B?NmxDd3NYOGhoOTMyVWxIUVF0c2ltNXlVMENKZWFRZjhqZ0Qvd0ZGTzh2K2Ny?=
 =?utf-8?B?NnVzZzkyL1dnb05nOW9mZjFlOTNSejVlK0VKWit3MWtGZ2pvZTF1alpBNTZE?=
 =?utf-8?B?VHRVbnBKb0VwaTJGNUc0Wk9aOGowN0REOTh0WllBa2NHZkhNa01Ea2h4TjB5?=
 =?utf-8?B?VThUVUYzN1p6K25PWk96QWRQUE9lclQ2YjFSdHltNjJFMStiRHlad3NSYWIw?=
 =?utf-8?B?OUVhUHUxa1VMQVB0Y0VDTWdPY25CQ3VYQmEvYm9NZDFtMGJFUk85NEhzdXc2?=
 =?utf-8?B?TnhYcjZXVGpEcU5MRjdOUHlFTVQrcFBnTERvc0ZidHdVUWoveGs4TG5FRDU5?=
 =?utf-8?B?VnJrL3ZVOVZzTzFSdW9jRFdTU2QxeEV1eVI3Z1U2MTRESmRmTUltTnBPM0RT?=
 =?utf-8?B?R3U0TjBkWkliU3hvanJFVXh0L25OL0VSRFNQWnVHVmRlSkxKZEt0K0RpdUdN?=
 =?utf-8?B?eHhHaG94TUlSajZBTDhIWnFPZk5tMG13SE14aFNpWHl1RlVHSlVDSThTQXc2?=
 =?utf-8?B?ZWhncVJ4WXpFWUlGT0FKRWZMem4xcjNNbnMwUXhPY01VbGlFKzZaWndXdG9r?=
 =?utf-8?B?d242dHRwd1lwOFJUVm11TEt5Q0ZPM2hkN0dDVVlqRDlVcnBNZ3ZFOERNZDBQ?=
 =?utf-8?B?ME1RRERRcnFjU3NKTFE4NDRCUkN6S0JmQ2R0TS9KQlpSM3VOQjhLTEJQMEo5?=
 =?utf-8?B?NXpWR1RaU2V4dU5uTE9ackcvcnNJQklXZmhjYnZjd2dNU1dNWENJdEZBWlJ4?=
 =?utf-8?B?OTM3Nk9pSnNiZ0NMS1ZOSVZTVzNSaUxDck1PNzFFZkxTekZiakN6THdaOWY5?=
 =?utf-8?B?Z0ZpTGhQUkFxTDlVcUVFdEhrUGhNQ0x6N2J4WkFabEN0cE8veXNTTGVzTHJz?=
 =?utf-8?B?ZEoxcVU3L3dHNTFtSGJON3BUOUxXQVFPb1ljWkRHSFErN1BpL3RlcXppZW9t?=
 =?utf-8?B?c1dhUmY4cC9DUjZIcElCT0t4WDFkaGFCSVZWdlRwSUVJb05laXZZL1B3ZVRn?=
 =?utf-8?B?TzRlZ0xjemJyUWxCcnZBZ3ZNY1BvS1dIRUt0NHVaUkhmMHliclVaU09SSGhm?=
 =?utf-8?B?c0N5Rm5uZ3NadkdIR2hFZEVNWmNteEE5U0o0MExtME1XOGdhTHpubDhOWk1K?=
 =?utf-8?B?V3BaNUVsZ0xtSXlJdUpqWGRha1h5cGl6S21HdTgrcE9rWFJLUW9KMEh5cU8x?=
 =?utf-8?B?cEpuQTF6RHFpdjlaUmFyVHpJcXo3cHYzQW15dDhWV0xLYk5KM3BQMnllSzNY?=
 =?utf-8?B?ckF2NUhVdDZOQzVMaTNYTjdodHFZcnlJend0K1R1RldDUDBzc2ZoQ3p6QUxF?=
 =?utf-8?Q?/+08=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B5D3AAF81B02248946E2A48195B66B5@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76974228-a0d5-4c01-f27f-08db8dd20e35
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 12:15:52.4058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwYPpGE9Icl9c4fVGoZ7c6sJiN/lxkEddOzhE39+W4qEV4xv/C/AWxYOBACRuU2jNSmSk4Zkk2/MCgGd3/3TiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6331
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
Cc: "opensource.kernel" <opensource.kernel@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

5ZyoIDIwMjMvNy8xMiAxMDo1MiwgV2FuZyBNaW5nIOWGmemBkzoNCj4gVGhlIGRlYnVnZnNfY3Jl
YXRlX2RpcigpIGZ1bmN0aW9uIHJldHVybnMgZXJyb3IgcG9pbnRlcnMuDQo+IEl0IG5ldmVyIHJl
dHVybnMgTlVMTC4gTW9zdCBpbmNvcnJlY3QgZXJyb3IgY2hlY2tzIHdlcmUgZml4ZWQsDQo+IGJ1
dCB0aGUgb25lIGluIHNjb21fZGVidWdfaW5pdCgpIHdhcyBmb3Jnb3R0ZW4sIHRoZSBvdGhlciBv
bmUgaW4NCj4gc2NvbV9kZWJ1Z19pbml0X29uZSgpIHdhcyBhbHNvIGZvcmdvdHRlbi4NCj4NCj4g
Rml4IHRoZSByZW1haW5pbmcgZXJyb3IgY2hlY2suDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcg
TWluZyA8bWFjaGVsQHZpdm8uY29tPg0KPg0KPiBGaXhlczogYmZkMmYwZDQ5YWVmICgicG93ZXJw
Yy9wb3dlcm52OiBHZXQgcmlkIG9mIG9sZCBzY29tX2NvbnRyb2xsZXIgYWJzdHJhY3Rpb24iKQ0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC14c2NvbS5jIHwg
NCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFs
LXhzY29tLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC14c2NvbS5jDQo+
IGluZGV4IDZiNGVlZDJlZjRmYS4uMjYyY2Q2ZmFjOTA3IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC14c2NvbS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFsLXhzY29tLmMNCj4gQEAgLTE2OCw3ICsxNjgsNyBAQCBz
dGF0aWMgaW50IHNjb21fZGVidWdfaW5pdF9vbmUoc3RydWN0IGRlbnRyeSAqcm9vdCwgc3RydWN0
IGRldmljZV9ub2RlICpkbiwNCj4gICAJZW50LT5wYXRoLnNpemUgPSBzdHJsZW4oKGNoYXIgKill
bnQtPnBhdGguZGF0YSk7DQo+ICAgDQo+ICAgCWRpciA9IGRlYnVnZnNfY3JlYXRlX2RpcihlbnQt
Pm5hbWUsIHJvb3QpOw0KPiAtCWlmICghZGlyKSB7DQo+ICsJaWYgKElTX0VSUihkaXIpKSB7DQo+
ICAgCQlrZnJlZShlbnQtPnBhdGguZGF0YSk7DQo+ICAgCQlrZnJlZShlbnQpOw0KPiAgIAkJcmV0
dXJuIC0xOw0KPiBAQCAtMTkwLDcgKzE5MCw3IEBAIHN0YXRpYyBpbnQgc2NvbV9kZWJ1Z19pbml0
KHZvaWQpDQo+ICAgCQlyZXR1cm4gMDsNCj4gICANCj4gICAJcm9vdCA9IGRlYnVnZnNfY3JlYXRl
X2Rpcigic2NvbSIsIGFyY2hfZGVidWdmc19kaXIpOw0KPiAtCWlmICghcm9vdCkNCj4gKwlpZiAo
SVNfRVJSKHJvb3QpKQ0KPiAgIAkJcmV0dXJuIC0xOw0KPiAgIA0KPiAgIAlyYyA9IDA7DQoNCmhp
DQoNClRoaXMgcGF0Y2ggaGFzIG5vdCByZWNlaXZlZCBhbnkgcmVwbHkgc28gZmFyLCBwbGVhc2Ug
Y2hlY2sgaXQNCg0KcGluZzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNzEyMDI1
MjUwLjY1MTItMS1tYWNoZWxAdml2by5jb20vDQoNCg==
