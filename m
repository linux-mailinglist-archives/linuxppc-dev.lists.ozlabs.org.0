Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4C4BFC93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 16:29:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K333x0Mknz3cRp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 02:29:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::619;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K333N3Vl9z2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 02:28:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fb7MAWiLQ1gymcz1Q+h4T5/xlVeW4jfEfLBXg5pNtZx1bZF4gzLW8isKhSfkqhG+9tV0iFe8Fhzio23rxwyvQ4njU8JudpKwwYLryPE9FddLwZ3k1uTMfPLXE9rhXnvUuqE7iMJKtRUzG18jabLlpOuWAIsU51JCR6XFweGuxOPFk6S4gKvfVE3Tfg6BER4GT60K8Qsf2z8z0raVxeZkfcWL+ENewyvgjIRB6SGyMehHGxHtIMN08vDPMaq17/EYBPb/SeGAht5EM1FatMOiiupeuzOtX2jd/vdkc1tRM8E8TwruAD2NukFUu3FOdNjq8eh5DpY5dbDQr4ekhKkiRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nztWWEMSsRchS/0G9ch7E9xFZMCJPLZXavqmZaJkD90=;
 b=IKsMvAaMXYp9iOkzkM9gqdhKhJVS/Y89M+EF/RzHSza0TEGVoLTa3Emi3PP+xrIErSfQ3WzmasLZqlLtCN4gZGqz6wFYlALRHbSrGBEVQFkGB0lWHehVE49yDvTLVPlceSxfXp07OXKOq0NbsnWgIGl/Tijpjkx9DNHMJjGIaw3zOiWLB4c1MQkNbkYGyfkuitiZEF9eB/bdr8bwKwx4dRABVwVNRU0wpbAnQnlyRebSFSVcWfLwqSjtGEqM3ugPCLvxi25uXRem6zBy3SQuU5TSX1w6kM+eNFst8P4kWLmL7VU1HxMbvyXE8B6Wg2CoGyeudI0Uf7TsIkkIsMQbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4232.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:257::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 15:28:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 15:28:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "cgel.zte@gmail.com" <cgel.zte@gmail.com>, "oss@buserror.net"
 <oss@buserror.net>
Subject: Re: [PATCH] platforms/83xx: Use of_device_get_match_data()
Thread-Topic: [PATCH] platforms/83xx: Use of_device_get_match_data()
Thread-Index: AQHYJsdUSbBzncA20Uq1q5dqZ9MYcqyftAaA
Date: Tue, 22 Feb 2022 15:28:08 +0000
Message-ID: <428e2e84-522b-c61e-8701-97f2d482fd26@csgroup.eu>
References: <20220221020323.1925215-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220221020323.1925215-1-chi.minghao@zte.com.cn>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e050f26d-14a3-479d-6803-08d9f617edcb
x-ms-traffictypediagnostic: PR1P264MB4232:EE_
x-microsoft-antispam-prvs: <PR1P264MB42320CAEBA088993548111E3ED3B9@PR1P264MB4232.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: huim3Ek6fu6pKex2akDoE1Sah9IJ/Fn8x2OSL3TIUh+n9kYglfsQHE3EgksylBKfjTeJj4Im42guPkMkLU4Is0EoaPG7YgjJr0n5dwOKx20Ezf9w0018SN1lN+J5HByah7uD47SGCRU4+aVT/lb7iuX4+j75IF0ILTtJmqmI3zp1yLIc5IuFMTk3sC6JbsY1+ANn1cL4i4nInbrVdETV/o6gNWByMzODxGqKy94ojiHvPpGcFaJ9irkkN0EPABYRj0hHNEIp3Abb6MO6sncIFGO5gRfIUcIMx4IfqMphdDIrSV3Aqn5emj3hmVFHNL0Fr5FT4Kd3yObEgPx0Zg9/XizOKvnAiTW9n2vorWEy0VWpwynOzqnFeDU6my3wL9Ch/9dsLgOT4yV/V8QvulecCMLBi7cDTdp/w/sk6ec2zKvScLJXbHcmZCZPyWYRBrgR560V8uIiGyPC6bIiVeKjw2I7mf0BAw3qB9/8pvcFBQu9eTCYSaJJzeSgkNwOyd+EnORjBLLOXRd/++eeeUqf08JnQ57VTBZqlmsegJkC56Zk2C4d/YE8/gpTEOy3FbsRoC1MwIfPkYsl4kjsOrbme0Nu56P6i3T/pI4mA8IB8oMUdNaTfQnB2Nx9rm+LovZ6D043G1Sorx6aw5P1hjSC1QvEK4bL0/TgYwRWOS8CUqx97Pmoww7O7TTiiTAGSOHnAS8G6tdPv3JRXWKO9mf1GBjV/TKrPX5ujZtdnxcvQ5iOd3U7gtfY/rwJohPCrHiVGsxhN6SoHII30Ftca70clw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(91956017)(83380400001)(110136005)(54906003)(38070700005)(316002)(66574015)(66556008)(2616005)(5660300002)(31686004)(2906002)(66446008)(8676002)(66476007)(6506007)(36756003)(6512007)(6486002)(508600001)(38100700002)(8936002)(71200400001)(64756008)(44832011)(66946007)(86362001)(26005)(31696002)(4326008)(122000001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0RUNm5MYkNOTXkxVlBBeVZ0cUM2Z3BJbUJ2cXlLK2pqOGhrQ2dQMTQxRWF5?=
 =?utf-8?B?MEh1YlhFUDE1ZzYrU3ZPZ3B2bnpSaG9pcFQrS3V3UVpJNXBkWmN5U1NxN29L?=
 =?utf-8?B?bkl1YlVpMklSR3FzM0VZZGxXem8wK2MyTkpzZ0ErajNYaXN5WUJlc080N0pt?=
 =?utf-8?B?ZVBQWE5WUU96clVvMllORVo0bDdzeER0OU9RWm80T3JVbHg2c2JZTFI5VU1i?=
 =?utf-8?B?Vkx4a04rOGdnd055K0ZLSVhOQTJQMjVwWGhmQTNBMncrcURPblJ6MGwzZ0t6?=
 =?utf-8?B?R3U1QUFtMWk0Rk1MaDd5WjhZWDdTOHRYWFZvOWxGVXo1ZDBaRVJLTmZQcDNw?=
 =?utf-8?B?b1JERjBmKzRLb2VXWTdMcEYwMGsrWFg1bmZVenptTHBwUzd0dTZQdUo1dUFC?=
 =?utf-8?B?bU1xb29rbldiZ1MwZ2tTRTBIYktaMjZXYklCallMZi9VTmhueFRjdHg3TmRy?=
 =?utf-8?B?TitXVDhOd1pBNUJ5QXREdmQzWGhQa0diUTEyTkd2WEZRb2IyU1UvcHVoTE0y?=
 =?utf-8?B?ZkU1M21QSFJMaDU1ME5oUGR6Y1JPQmd5Tm55a2xTTEE2dWR2dVNXL3FKM1ZL?=
 =?utf-8?B?L2NOb3ZVTkdpSkZCUUYzWGdxd0d1Ui9NTTUxcHEwUTVPZWszM2x2VjVCVTJU?=
 =?utf-8?B?YkRTUSt1a3VVdytJRmgxN3dlOG8vWVNFUlg2cm8xOTlrRXF6bC9ULyt6bmpG?=
 =?utf-8?B?c1hibmYrV3djTUdMYUxIeVZiMDR0Tk9GRWtLOHJTemlVbkxVem03SzQ2VDlo?=
 =?utf-8?B?NC8vZzNyMnBRM3lZblAwdUFCWU1HOXRCa0tXdVlQeUtGME9wRkxOZDdUUXNG?=
 =?utf-8?B?TURvVisvY2ZUZWRoaml6bmlPNG52VlAzc09KaVpBVTJUeTR3N1N1QzUvQmVF?=
 =?utf-8?B?MVFKbFBWajZHNlpiT0dzYXBZNEEzc29HUlg2ZWdYUjdxSERUUE9CeXJuQmR4?=
 =?utf-8?B?VVBsM041ZjZxck80V2FxM29mVVJGdVF3UkNVUlVGTEFyNVZaU2FLUmlLM2ZU?=
 =?utf-8?B?c2Z5UWpsaEt3d0FMb25EUHdOYjRvdExmdTJPdVN6UlFodjRIZ1F3aTNENC9h?=
 =?utf-8?B?TGJsMjNnZlEwUVdaQ2pRSlZPVmVSdFZibXRLUHRtY1crOWZGZ1FiQ2M4K3Rt?=
 =?utf-8?B?cE4rdnl5R011K3VzZjlIeHFHWXNlRE11MUh1UURUKzN3OStRd3NjTkpBYlpy?=
 =?utf-8?B?WFk3WE9WWkVPUm5oUDNlR1dFSDNJeE4rS1B4U25yejNDNS8rOVRKQzJMRUth?=
 =?utf-8?B?elk4UmVhaXZFM1lMSEtZOHVGZjQwNFFNRHdzNldCN2tkOHlKcnZmeWhHeFZH?=
 =?utf-8?B?VmRBQTBZemR4RTRhNTVHWTFQMURrWkdRTUI3QjJHS3pkQ3B3KzkwNitsbm1I?=
 =?utf-8?B?RmdjS3lGUXhFVGp1dGttSGNvQTlhN2JTelJZL2paMktGODNVN0Fna05UMmdY?=
 =?utf-8?B?ZFVIVktMS1psVzBUa2FjMktySzRCN3A0UXRQQy81RXo3blQ1STllQ2xSdFBo?=
 =?utf-8?B?MWZPWnM2SVpVVmN0V2ZZK0pvZStSK0VGMmNSam5HK2ZYZFZGaTlIUFBBZEJW?=
 =?utf-8?B?aTRUUkJld2xPK0ZMZVlPcUdDQmdPOWNDRVVTSjkvR01ubkRqcENoVU1MdlVS?=
 =?utf-8?B?cS90bzJsRUdBc0pWVGNna3dCaStCeEVqZFZYUXp5NXhmaUo2NmpOenhFTURp?=
 =?utf-8?B?WmpPeGVGaW5VNGtXSEVxM1IrUWd6WUtMYkVrbHRjV0p0b0wyMnNmTzNnWEF6?=
 =?utf-8?B?enl4M3J4ZElxNEFpOG4yVUNBNjd1dGk4cHdNZlVVazR1M2xNMkFEY0htSDFY?=
 =?utf-8?B?Tk02bmQvTkV1RjhRNFpERjhkYWlxMTNXQU5QMVhrU3JMZnlHQ2hBRTJNUzFW?=
 =?utf-8?B?TzFTZW9SaEhrMVZ4N2dwc2I4YlVrTnZMNU5jd29iL1ZKaDR1RkhTUmhVMlZi?=
 =?utf-8?B?ZWNKMkRRcjVGNWVMUmsxN1B0N1dNQ1FvNm5ObFVQdlBuYWRhZTFZV0pMUkJl?=
 =?utf-8?B?SWxya2NhVkdaNk5VRDVLNER2NmdpTFRXZnp6N1BBQzd2ajBoQitPZXZIdmY2?=
 =?utf-8?B?dGxJMk13MVoyaEV4TmR0MGI0QXV1U09QNXczQitFRWw5MFJDSlJZczRYTDhD?=
 =?utf-8?B?SDFLQ0UyaXArazhwMzVOUThzMUxnMHJ3T3dBQkFzdG9ueGlpWGZLQVVQdkFB?=
 =?utf-8?B?WTZhOEVKNnBxQitsME5LOFlVSWRiMG1PUmZlR2MrNTQ5dUFrSjAvMW95Q282?=
 =?utf-8?Q?LnHIqyB85o8zbWT8kMtQDPhjSjXjdRKjMOF0kVLEWk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <445F09CD0007624B9075ADF43B4DBDAD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e050f26d-14a3-479d-6803-08d9f617edcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 15:28:08.3534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B140sqoeiceA7NRqMAzSma+9PEBJKnWokRRxntkHZ+v3ejj4k0D3VanUQTlpvzd6+m38LVailVB5ZegkfEJJ+Z0yvItsmW8jMxc3OxCIalU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4232
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
Cc: Zeal Robot <zealci@zte.com.cn>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UmVzZW5kaW5nIGFzIEkgYWNjaWRlbnRhbHkgc2VudCBteSByZXNwb25zZSB0byB0aGUgbGlzdCBv
bmx5Lg0KDQpMZSAyMS8wMi8yMDIyIMOgIDAzOjAzLCBjZ2VsLnp0ZUBnbWFpbC5jb20gYSDDqWNy
aXTCoDoNCj4gRnJvbTogTWluZ2hhbyBDaGkgKENHRUwgWlRFKSA8Y2hpLm1pbmdoYW9AenRlLmNv
bS5jbj4NCj4gDQo+IFVzZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSB0byBzaW1wbGlmeSB0
aGUgY29kZS4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBaZWFsIFJvYm90IDx6ZWFsY2lAenRlLmNvbS5j
bj4NCj4gU2lnbmVkLW9mZi1ieTogTWluZ2hhbyBDaGkgKENHRUwgWlRFKSA8Y2hpLm1pbmdoYW9A
enRlLmNvbS5jbj4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84M3h4L3N1c3Bl
bmQuYyB8IDcgKy0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzgz
eHgvc3VzcGVuZC5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84M3h4L3N1c3BlbmQuYw0KPiBp
bmRleCBiYjE0N2QzNGQ0YTYuLjlhZTkyNjhiNjgzYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy84M3h4L3N1c3BlbmQuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZv
cm1zLzgzeHgvc3VzcGVuZC5jDQo+IEBAIC0zMjIsMTcgKzMyMiwxMiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHBsYXRmb3JtX3N1c3BlbmRfb3BzIG1wYzgzeHhfc3VzcGVuZF9vcHMgPSB7DQo+ICAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcG1jX21hdGNoW107DQo+ICAgc3RhdGlj
IGludCBwbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpDQo+ICAgew0KPiAt
CWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoOw0KPiAgIAlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wID0gb2ZkZXYtPmRldi5vZl9ub2RlOw0KPiAgIAlzdHJ1Y3QgcmVzb3VyY2UgcmVzOw0K
PiAgIAljb25zdCBzdHJ1Y3QgcG1jX3R5cGUgKnR5cGU7DQo+ICAgCWludCByZXQgPSAwOw0KPiAg
IA0KPiAtCW1hdGNoID0gb2ZfbWF0Y2hfZGV2aWNlKHBtY19tYXRjaCwgJm9mZGV2LT5kZXYpOw0K
PiAtCWlmICghbWF0Y2gpDQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiAtDQo+IC0JdHlwZSA9IG1h
dGNoLT5kYXRhOw0KPiArCXR5cGUgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJm9mZGV2LT5k
ZXYpOw0KDQpXaGF0IGhhcHBlbnMgd2hlbiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSByZXR1
cm5zIE5VTEwgPw0KDQo+ICAgDQo+ICAgCWlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShucCkp
DQo+ICAgCQlyZXR1cm4gLUVOT0RFVjs=
