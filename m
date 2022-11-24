Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2E63729B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 07:59:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHplD69Sbz3f39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 17:59:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=e3Y6QkOM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::600; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=e3Y6QkOM;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHpkC42TXz3045
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 17:58:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwLPRJa4ZdMT2In+ENoCte5Oh+RoP+gbpH19f6aK0PngD71UMpAXBLmJ89Nv9UzmP0RF7LKwbx4u1RaUj+idkW7cL4d1/FtBpDSK8xR50ZaBGVeLBhHp+V0jnW0YPCneXtfig0IOGPet16x/NfLloic+0D1Q+XOglv+qjgsqGUC009fOseTZjJHlM1fP6f1CuRDF0SwRt7MOHdKKvmlSyxUH3gzgkuty+Ka/ugB8exIHfBijfGOhtUq8tOssqo0Y9razwoAIa9PxV7/045Fk4z+trSNRmz9qILfPVevUrByYajeV8xi467ppe7W6O/71lJKruXfll/Q2fycvwfTi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zelnHwKHJJjJHX6CnsXes+cdT/I2qhUrgNII4QQHHno=;
 b=aCOxftpRnPujUtwYuCU2MV8EhsPWcxtQYpHfc01QR9fN1q/TLHdsnFA0yFMzmZtB6cXp5vxZ4unbC9ypoqqGS1zK9v/+3nzu9qugWPk7ucGfGiDR5Fky+2ubm6FynlMAgLLOQRlGzkn0rwW2n+I4PeJJrojzIUz6agEo+FNSq9uCRCL5XlD/WDMWgfDip12GxUjAXnYaQCshpaPXGGotrJIPLAMGFIlMUb7VN6RhmvMgp24Xk7e/Msye7WfBJ6RibTD/wyqbN18eJ1bqFHcQO9kjaLFg24Z6H9A6ehozKrjslMdgD7gNEZpuDfSXGwIgBKq+FBXX9ECeuHQsbd+DqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zelnHwKHJJjJHX6CnsXes+cdT/I2qhUrgNII4QQHHno=;
 b=e3Y6QkOMG/ncLZObkYVnPrSV+EeDcEYiO/hTOxv4/Eggc7AMhA2+2l8Tph0S5PGJQD/Pt66HnRFjJgHW6qXALQPWxGCUui+ZmmTxSd0PWzIeJaExr7yicbFimhbyYY5trVO/XzejbHeeyO/gywopuoDnWEGECM5VW+gfqUt+yTYX+wE7LC7sMLqGVQ0v1nOqCKyjw865qOiVb+EsllJod6UDxccYhc4VuDyg1ZhlMcPjmpTJEgOMEPOBV1ri7TNz4CJ2aFyOAbxjdQKKQhrSNU7VusS3CA40IzGcvaXHF7f9XRtHFcJVg9FejWGb5Zjy1rrURAInsACNYNpYGHJEPA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2292.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 06:58:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 06:58:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the tip tree with the powerpc-objtool
 tree
Thread-Topic: linux-next: manual merge of the tip tree with the
 powerpc-objtool tree
Thread-Index: AQHY/6Q7i6nFGIO6fU+hi3lcvLWXYK5NpPoA
Date: Thu, 24 Nov 2022 06:58:18 +0000
Message-ID: <de806b36-2b5c-3040-22c2-129bc9b5ddd4@csgroup.eu>
References: <20221124122931.266df8c7@canb.auug.org.au>
In-Reply-To: <20221124122931.266df8c7@canb.auug.org.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2292:EE_
x-ms-office365-filtering-correlation-id: 760f1830-76ee-49b6-a623-08dacde94486
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lRsTpmAXtpJFz88rTsA8YrduCrkKOMxIChdZOjwLA1Uzu9iTOVF5z/csw/AnNI4GWFyCOP0WtEC0eeRYha5JhA8r3noLyNicJ0zFpFYZtqXRQ9s6ycRgcRlz/hy/qqluWPvgNRRWqJKLrrcbNaIEHn0vM8BUPv2EsLSxiy5UcNM8S04YjzHw0WCSz7g7mQxQBR8OyQx4AW33ftQwNJVayT1ugj+FstaJrBE5Z/7rTYyJZfmbtFV1Eiz81fLW7P+HwXZt5LiqSN0Wgphl2sm+u0+fX6pxycNPpWWUoSBGYnoc2hDgBlFvf/FEgCTM+SJfd+DphdFCYCgz4Cbk9qV+ajrJ9crrFv76kYsY19yjQwL5P+fJxdS5OAjf+njfmpvpqIc3Iy6BE5s+9KW7/p1ZdBJfyumjzYMCK9wg25q0H66N/wv17mLV8WPQq0xpJKplq0vQHCrEg/HUoHQ8ciPdC8SpszXioq0/6sMIlInVPJMQ9b3ZMX9LaYStP1CKQT6lGgpoGIRJ2GLo5vcIdsOLc5Yz5P+MHIMvhhl47UUo6RCzR3R39OkHe1h+cXeVp8YmD4RiRnJaV1NVqze/fz+pmP2MEBYzCj+JqAXWDFgodnjCPzoYkoKnPLeYLkwnJtnISwWKQBFmAJKifhHzr+a5CK/mbYD+M23tmfhRTauw7xfvzOHVkFED10qMJxLdbOTiQGMliVYXw8soEunsrmrCQ/agZ5mVxeIVOJnMBBO9uGbpoVf0wWs2nrx7ny6xpyy5FFYjJdx1k8yHGGBzU0OezQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199015)(91956017)(6486002)(76116006)(64756008)(66446008)(66476007)(66946007)(38100700002)(66556008)(478600001)(5660300002)(4326008)(8676002)(31696002)(110136005)(54906003)(2906002)(44832011)(6506007)(86362001)(38070700005)(2616005)(26005)(71200400001)(316002)(4744005)(36756003)(6512007)(8936002)(31686004)(41300700001)(186003)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NnB5UmNSOVlTc0lMN0xxUGlxVGNpTEU5V0tVWXdKY0FJdVNIMFNtTlVHY3dD?=
 =?utf-8?B?NVdQYktlY3pPUmRaQmVpa25oZFlJUlFyMG45cDhyM2loQ2R1djVaeXhwY0Iz?=
 =?utf-8?B?dmpOTnZxa01PMk9KdU5ISzhOWHg1UzBXeHRXS0dpa3dJQzZyM1NNY1pheUE1?=
 =?utf-8?B?eGk1UlJaR2Y3Y2NrUXVZeWRaY2lKR0o1N0U5czArN1NMN0o2N0JQUnVJaWlq?=
 =?utf-8?B?VXlvZHlwczFRSVYyQzZvVENwVG82UVE2L1h5VURYd2Y0ckdCR05KNDF5V1lU?=
 =?utf-8?B?Um5zc0cvL2poU0xBR0YzTlFiSUxJTEl0YVZ6L0xjbkpQVWVxTmtudmFYZFY4?=
 =?utf-8?B?dmphWGN1aDF6TysyQ2o5RjZMS2cveE5NczhHM0lETHBubzdMK1RlOTJiVFBR?=
 =?utf-8?B?VmI2VUtWOUIvWUtSYmlGcm04cnlEQ2ZQL0FwUEdyWjk5bXNIWi8waHhpSmJv?=
 =?utf-8?B?L0JWb3ZyVW55ZzVRSUV4d3B1b1J4WXYzWmdSNTlsWTNCZnRmeTVRVHFOS1J0?=
 =?utf-8?B?MitzK1RBcG5BeXZ4Q29NRmlKSlE3VjFCTzVFeWF1dFlJWEkzWkErY2l4dVhp?=
 =?utf-8?B?VEhQOGU5eERyUitsU3l6OHNsRFppQjRJa0JIVHY1S0NQMWpoc0NsWXU0Y3dh?=
 =?utf-8?B?T3RvbWxMQUFtTWFQQTRpWmMvUDVSeksrNktRN01takh0SmxDdW5iVEdVVVZI?=
 =?utf-8?B?UkhpT2ZtUWJPRk1hRHFGZmdqM0MyL0xLejN2bVMyVUFMVzdtRHNjVHg2RVJB?=
 =?utf-8?B?c2ZXdWJjZGF2c0h4eDZhbzBxdHRwN0xDMXdmSzNjTjJiNDk4R3JyU1ArSnhZ?=
 =?utf-8?B?cFZrRkVoZm1JbEF2bkY2dnhMN0czenpzNVc3TFZnRUF6Sy9Ec1JSand2cGN5?=
 =?utf-8?B?eUtKeXRyeCsvK1VrcCtGUzd5Z2FEanQzMElLNVE4bHU0WGZYVjJuU2V3dkwz?=
 =?utf-8?B?cURGNzJzT3ZBRzF3b2ZTa2pRUFFRSEdWbGxYTnQ3dSs0U1luQitzLzhoZVZJ?=
 =?utf-8?B?NlpFWDhVMnhiMUhrb2Zjamx3L203YmltRURzZmNFUmw0Y3lXMjFJeHRZN2Zj?=
 =?utf-8?B?cUV6RGJkSnFES0RJNForbUlUR2dRSUdwUmlKbTc2WTJISis2YnBoVng0cTNn?=
 =?utf-8?B?NjVPM2svNUtFRVFQR0lIcE15dUMyQkRVaUw2d3V5NHNaS3dQd3QwQjlZZnNX?=
 =?utf-8?B?TXVpWXdna24yTTBHeWhkRk1JK2xOQTNIYXVFMTJyQld5UWplckVLbVNIYm5K?=
 =?utf-8?B?eXcvd3hGcE9lSjFpZTBjUVlJY0VYWEdJenkrSCtIVVZ6cmJkbkVEc0Z0NUNY?=
 =?utf-8?B?OEZJMndYNlZyaWdRY0dCYW55ZFRubkErYzJ4bmZuWU02L01DZDYrS0tmZVJO?=
 =?utf-8?B?Ly92Vk8yMkJGT3VpaDVJbDMva1dnTlREV2RBRGJZYzR5aHQ3eU9yRVV5QVhM?=
 =?utf-8?B?ODliKy9CTDVkSDV1dGR2TERmZlp5WURaSFRWMXIwWjJySGlrcUtKc1l1Um5D?=
 =?utf-8?B?eTZjdVhKOFVqNWpVNHF1RUp3V1pYVTZnRkZUSEgxTTh4RytGT3FrRHVCbC8w?=
 =?utf-8?B?S0lYVklMSmlsbERqNFI2TEYzd3VlcEl6VUFxNm5ESTJHYWVINXM5L2xZbGJ5?=
 =?utf-8?B?OG9VQ0FlVkhCR3VYQ0pnU1pQbmlEcHlSeXBJVXNIeWRhOUhocnNKTGNUcW5N?=
 =?utf-8?B?MkhSWXFiT0Qzc0Rlb1BGaGdGSDE5OHN3Z2Y5RzB2OFhuMVBoNEhrUjFjKzNL?=
 =?utf-8?B?UGpKdlFWdFNRT0RGY0xobDEyQTFoUlpmQ0hBaUd4bjZDUFI3b1NaNSs3NHZR?=
 =?utf-8?B?aWtUSlczeEl4Wm1aOCtIczZndXJwbDM5eWdydG9hOU1LRTZqMUpRc3RRTEtL?=
 =?utf-8?B?Wnl6ei9Jek0xcFk2alpDZkJxanF0b3FuQWtUbEtmZTRTaXNIcUhxd3NSUDIr?=
 =?utf-8?B?eThZQWIvMjlITjVaL3hhaEcrQUlMZjBZdVhSbUJFTlhKREJIQnY2NWFGTFFa?=
 =?utf-8?B?dkhUUjN5OFVsK2pnZTA3ZkhPZ09Zb01lazVSSmJDVklpL1pIM1k4QmlZR3ZL?=
 =?utf-8?B?UFFTaTE2Y3pnUDJNcmJsUHhSUWxOMXh0NUVzb3RhOGZxQXRlWDVGZkpvbzRv?=
 =?utf-8?Q?Ceq1xfLrXHBfL68MiYlElgg43?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D39474602F3C840A302E114915B1B8F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 760f1830-76ee-49b6-a623-08dacde94486
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 06:58:18.6783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SWDhcPyhImamvx3vTyrisfoEhJGjjU2J+rjspwBiTJfAay4D4xAk/bWdxo/hnHRbIp/PcTgSNcwVwFwXtgldrvl7DGkfRnGiWl4IFMdPLDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2292
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzExLzIwMjIgw6AgMDI6MjksIFN0ZXBoZW4gUm90aHdlbGwgYSDDqWNyaXTCoDoN
Cj4gSGkgYWxsLA0KPiANCj4gVG9kYXkncyBsaW51eC1uZXh0IG1lcmdlIG9mIHRoZSB0aXAgdHJl
ZSBnb3QgYSBjb25mbGljdCBpbjoNCj4gDQo+ICAgIHRvb2xzL29ianRvb2wvY2hlY2suYw0KPiAN
Cj4gYmV0d2VlbiBjb21taXQ6DQo+IA0KPiAgICBlZmIxMWZkYjNlMWEgKCJvYmp0b29sOiBGaXgg
U0VHRkFVTFQiKQ0KPiANCj4gZnJvbSB0aGUgcG93ZXJwYy1vYmp0b29sIHRyZWUgYW5kIGNvbW1p
dDoNCj4gDQo+ICAgIGRiY2RiZGZkZjEzNyAoIm9ianRvb2w6IFJld29yayBpbnN0cnVjdGlvbiAt
PiBzeW1ib2wgbWFwcGluZyIpDQo+IA0KPiBmcm9tIHRoZSB0aXAgdHJlZS4NCj4gDQo+IEkgZml4
ZWQgaXQgdXAgKHNlZSBiZWxvdykgYW5kIGNhbiBjYXJyeSB0aGUgZml4IGFzIG5lY2Vzc2FyeS4g
VGhpcw0KPiBpcyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4LW5leHQgaXMgY29uY2VybmVkLCBi
dXQgYW55IG5vbiB0cml2aWFsDQo+IGNvbmZsaWN0cyBzaG91bGQgYmUgbWVudGlvbmVkIHRvIHlv
dXIgdXBzdHJlYW0gbWFpbnRhaW5lciB3aGVuIHlvdXIgdHJlZQ0KPiBpcyBzdWJtaXR0ZWQgZm9y
IG1lcmdpbmcuICBZb3UgbWF5IGFsc28gd2FudCB0byBjb25zaWRlciBjb29wZXJhdGluZw0KPiB3
aXRoIHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb25mbGljdGluZyB0cmVlIHRvIG1pbmltaXNlIGFu
eSBwYXJ0aWN1bGFybHkNCj4gY29tcGxleCBjb25mbGljdHMuDQo+IA0KDQpNYXliZSBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gcGVyZm9ybSB0aGUgY2hlY2sgb2YgaW5zbiBpbnNpZGUgdGhlIG5ldyAN
Cmluc25fZnVuYygpIHRoZW4gPw0KDQpDaHJpc3RvcGhlDQo=
