Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE6F59E82D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 18:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBwRD0XpYz2xGS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 02:58:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KeLRMda+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.85; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KeLRMda+;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120085.outbound.protection.outlook.com [40.107.12.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBwQV341tz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 02:57:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ9vHSV2YE1TEn4TXHtt+X0OSOcQDzKuPHcSXCkFhjeREiBXZ93vQzqZZpve4QCY6ye8VBgBqcFwt3vUz2QR6K9TppK6prSH8yS/mRbhRbNKGERucp+wJwDjmN4C10WRarQoSFxzWktn9QfFaQNkR/wBanl8hUuEACX3QAMYCFC4KDYwyCFdCzZavCF3BTcRQvWaImBRSDojCPD5TPE27SVeEsBuTuwrgaULa2A8YqwYRWnStO8zgOyX1tqx/t1Dy2ErGXXo33c6iPxQ2serBMW5zK13zoXsBk/eHsTEWvL3Cbir1czQ3YLe3fe3c5HshbyBDrdXhAUde438ZcjdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnpktySf6cVH0BE28uNKCdlIuXYfQEivHHGpDra4vZs=;
 b=g2PIOuojxIN9ZywsAPQNn/cjLS91O79gtYcLuWYMRO1/hgdypywOVwj3CMlfRb8CdfvllRaONwiXB9eS7iuF0qjd+Olohdxp5zKKk2NHz8yCPbdIFoJasjB74n4zF0QryvDEBDybU03VBHybrsq9gLqupLSr17+82SFHayNHemEdAMr406P9H3xSfpW8a7mMQgTNuuij1fyFvF7KgZHFll9XhTIC909hRGr8/vh+x3mI68jtGqtl8MQa66npBKw8wlRoETKV7O/057JZ1XQtkA5LlZG9apah+LzK4HPNQScqYC1zEdl3FjT/MHHsvZqgG5rl6loeKySd8SzMBvRV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnpktySf6cVH0BE28uNKCdlIuXYfQEivHHGpDra4vZs=;
 b=KeLRMda+mhMdi5jeorrZZjgfeKqyv08ly7VRFf9kpr4juAO5DPAyWD5q9OId9VUzDB17lqXRWbJ0XL4KRqAW8n13zVTFrza47PPuVdb5luFxhg6iJVZu803WhQs8f5OIc0dIWlqTuHfFGjLQGYftUpz7494KCCprT3E3sVm9OnnzklsuIyT/BAYmcWttyFG71BWv5EdpYu4c7B6XaSXoE7e6CcnZnWwWIiLiVkMsxWi7u9cvCJGdgEi89943AF860LuQQEF98agkwVYj6CDDrFHdKvzAnpyz4fhLqaIJhrHHLbWtZxJ/LKU5Eke6kJXtMCM2HQhP+e/yZMB0d8Sewg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2583.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 16:57:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 16:57:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/boot: Fix compilation of uImage for e500
 platforms
Thread-Topic: [PATCH] powerpc/boot: Fix compilation of uImage for e500
 platforms
Thread-Index: AQHYtIL+9RZJAQOZFE2OoF5Azhcmi628udqA
Date: Tue, 23 Aug 2022 16:57:34 +0000
Message-ID: <a70bd394-7f44-3129-801c-6dfd2d8a5a00@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
In-Reply-To: <20220820105200.30425-1-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fbfda7c-8104-43ae-84e6-08da85289388
x-ms-traffictypediagnostic: PR0P264MB2583:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  GbbOSSVHxK+esiJQg/RjKN2qhrKqy3Xzs6LHJnUCwHFyBrtfASNfGkh+cpk914QPF8+66QlJtOl+sCWAr0TDOS6rl9pGAEGmPMx/FhfY+DXeSiibwud/SQI0XFnxp1+p49afmYRZr6g+OuT2+h4J3V90GcaD9MJS1HhMZtEbZagm6Q8siIoHWvzGb5R/B1v+ZJi1EAXYrvrHd9Ih+/jsk832QbKKINgxlUEnpnYHsvADnffUv2jE4MiIJh9kvNtERdw6/uExQkKPCtJd29xXR/6q2uEl4d0989jSZBLgLTs8No04ngTqE2Fk02ANcIemSDgVWEzJWCcGLapxH6dt7zu265Z1elZt/1oLfrCMQy1bcmUL0v9u3sppoJ2hb6c+HN8WYWq7DzBEk5mcSu1sbJ5RcrS2oMA6hYXB6JLU33hVsicTrwbL4cL0z02CJHQYh4oRaqDzYlhrvTUKjj0XyU4b3ZwKXqfSqmAsrftz0Opa2ujtW5uP+UmVrCGb2S+d8fHCSmRtaGHbfgxFugqnJczIyzB39KwivnJWS15/y26TvJIoOwEXJT73VzExBXeVHyjVgceAGrEFuPI1yGDvFSx8KmWJL68SLKdtVUEM8+2hy4nvJscWC6hpwh8QRe4F1cSzLlyHcLDXs5gpC+B1nYokj4cLkvVfc/K4JbVexybyyrJkNIOu20XnjESkOIgl/EScRN4+fzG+ntkPqHQhypks38EqGEAFcUmr6DEE5lrlzwJ2boMbVw9qvXXKrR8sUcimKH23rhtIFKRN6f9343Gm4oe4sRUA16GRgLRoITTc3ECJ35EQI/XsfW+L70sc2z5LMjtnL/9O+u+FVD/8Xw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(376002)(136003)(396003)(366004)(5660300002)(8676002)(44832011)(8936002)(2906002)(316002)(4326008)(36756003)(6512007)(71200400001)(110136005)(6486002)(41300700001)(478600001)(54906003)(26005)(6506007)(38070700005)(38100700002)(2616005)(31696002)(86362001)(186003)(66574015)(122000001)(31686004)(64756008)(66946007)(66556008)(66446008)(66476007)(76116006)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OE5NMzZxWnprUUliRUR1cmxNL0NSdUxyZERkdEZuWkVmTDJycTBNQWpUMTRF?=
 =?utf-8?B?K0YvQWFqaUo4N0ZVRENjV1lreFdQM0dHQWkrbjRkNVFhb2J0RjJkcWVSblhO?=
 =?utf-8?B?bHQ4SDFzZ3FGcHg5NVgwTVkyc2IyTzc3UWQ4ZlJKWmJPTmtZWGxwMTNVVTE5?=
 =?utf-8?B?TVRMTWo2YjBSRVZCZFE1S1VId3VpRDMwdHo5aG1sVEJSbE9udDV3OUdHaEd6?=
 =?utf-8?B?TmkreTBMZjg1Z2hKczY2VUg2djFSd282VGYrT2lYd2RVVElNVG15TkNFQXpB?=
 =?utf-8?B?Y0lya1VUcWEzWE9hV3M0SmUrQmdvMVJna0dkWGowaFNKMk9oMlN1Z042V1lz?=
 =?utf-8?B?VEFvRnRaK08xVnUxSnVxNHRwaWhjUmN3Q1ZuYVhoZnFxL25jOFpMQjNZcTlE?=
 =?utf-8?B?MHhiTFptMm1rUnUxak9hUlhhbGZwM2lRNHROQW1RSEFaL3JsT3B1eWN6dFZF?=
 =?utf-8?B?VmFlbGhUdkg3YkJJeFJSRGdMQWhQMUxLanRzY0J1cEJwMFFodDVOZVdQUC9G?=
 =?utf-8?B?UFgwVG9mbGp2UXFlcUoyUGxhYTVuZ2pIK0pxVzhwNWUwQnA4U0hCY2JNdVB3?=
 =?utf-8?B?bjJMN0dMeHRmMTQ5R1llZHN3cXJ0RWlpQUNVZEZRdDRoNFFyYkR1L3QrcW1P?=
 =?utf-8?B?RVMyRSt3RnBwZ1JCaUNVMnViVkxHVXNETmE4RTNyOHRKR1JzK3FsT3VieHVC?=
 =?utf-8?B?NzVGYmtBR1VNSURnUUlkcnZsMU9haUhNQTJhY3VJa1pyNHRZcG9HOWJ6VW9G?=
 =?utf-8?B?clZKQjdoM2pML1Y0WE16ajIyL0VJWDFLUHdkamUvbjZKKzIvZXdDQnNmT1Bt?=
 =?utf-8?B?UTRRc08xRFhLNlN4NkhyUkE3NkQxQjd2MnZ6cEVDMGxXZlBGVmVSWnZSa2xS?=
 =?utf-8?B?T2h4SDBReExEOHZwZHNiNnlFdzBqTnlKcUw1SGh5cHRReXUwWTBtL2l3eEM4?=
 =?utf-8?B?VTN4d2FjcmhsMkxsUGsyK1lnaGZkbGNWTyt0cHBCeXNJcDNTMjVMN0hQc01X?=
 =?utf-8?B?SlZHdmZvdHVEek8xOW56cWJiVm56MzlXTkZkNTIxNXlkSGQyM0dDL29vZzZo?=
 =?utf-8?B?SUQ5YjlGS3hNM0VORFJJTEFzMUxXeDY2L3dHWE9KMjBjdjMrOFZzNmlZWkU5?=
 =?utf-8?B?R3gyTGV4eERiTkkwejJUK1kwZE9yVnNQWkNOUytTSVlQRWk5SitVYTZaeEpP?=
 =?utf-8?B?K3ZVSW8rZTZ3Nk1GM0VTL0l5dngyMlVQdFE5YVhCZGVWS2lJL0w0K21FRkMz?=
 =?utf-8?B?WXlRZDZPN3R0cTBldlBKOVVsd0dBR1hta01GR1B1T0tiaFdud2pzWGE4Snh0?=
 =?utf-8?B?SWtnWVRlVnZKL2h6eElQbFBIdXphNHRtN1VOck54ZjJiOWVQdXZ3MTU0ZUtk?=
 =?utf-8?B?NXFJWmZXL3JTOFFoNStBSUpMYVdpOU9jdmhidUtUaXU0TWkyTjBJUS94RDJI?=
 =?utf-8?B?NW1BRW9zNU5FWGZRd24xUytORzlLTkVJTVJlYUE1Y2hBZHZnZENtRjh2ckRk?=
 =?utf-8?B?ZGJEUzFlRU5CZG5CWHhYNVpaK1JwYU5XK3ZmRjYvREV0WmRacEF3MVU3eTR3?=
 =?utf-8?B?SlhhYXFDUUtsRklLQldnSzRKUlVOZXB6eDFEbk92Y3czbU4rWDJmU0VUbGJY?=
 =?utf-8?B?RzVGalZjbzJPY2laUkU1S01IRE1oM2YrMTFQTDVscDFCMkNFUVFzc1J1K25x?=
 =?utf-8?B?Q2xzVjNBcTd1dlZDYU5QM05YdFdGZmQyN3lCNHNoM1E0VjA4SWlPK094R0Nj?=
 =?utf-8?B?SUEvd3JWZDk2SjE5ZEszUXF4WFFHRUg4aXhDTVdCeHE3bmdQQ1BoSmhmcnl3?=
 =?utf-8?B?U0lvZUEzdVNocHk2alNMR0kveFU4ZUt4TkhleU9zakN2WDhmd2tvRERUMjJu?=
 =?utf-8?B?T0FPT20vWjFIdi9hbk1oTit4UGVucURDVWJ2bEdQYWpTOWpXZy9LdUlxeHQx?=
 =?utf-8?B?Q1FNZUFJVG04OEJUa3hwc3VlRk5URThBR3MycnNlRzRnREF4N0lMWk80ZEVj?=
 =?utf-8?B?UFhMY202dGFCRTE3OVZwSTBkYk5NSjFKWUhzWWZ6ZDVUSVhEdEJIQXdFdkVj?=
 =?utf-8?B?QnRaOG1WaHA2a1FGMkg2bWZCTEUweTkvbWxEdmRaNEprRHRiYzVDUGRHR1U0?=
 =?utf-8?B?Z1lFT3NPb05SRHRBZHgxU1lCaVVHWWtyU2l2ckg3VEFFV1l0SFh6QlU0TW5E?=
 =?utf-8?Q?xO/QnSI0oAbgw7MEnyQIQzE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4D27D737ECFFB4DBD6397381DD7DD36@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbfda7c-8104-43ae-84e6-08da85289388
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 16:57:34.6261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iC6s5SYLSxguxnE8vbYCJyP3aCifaxZAiW7274yZEvehHUkNsplCArgY9orDSn/lehBVLeaEv/if8E8ntF9lblu8g53OHKslLTGqEJjroBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2583
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

DQoNCkxlIDIwLzA4LzIwMjIgw6AgMTI6NTIsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IENv
bW1pdCA0MGE3NTU4NGU1MjYgKCJwb3dlcnBjL2Jvb3Q6IEJ1aWxkIHdyYXBwZXIgZm9yIGFuIGFw
cHJvcHJpYXRlIENQVSIpDQo+IGJyb2tlIGNvbXBpbGF0aW9uIG9mIHVJbWFnZSB0YXJnZXQgZm9y
IG1wYzg1eHggcGxhdGZvcm1zIGJ5IHBvd2VycGMgZTUwMA0KPiBTUEUgY2FwYWJsZSBjcm9zcyBj
b21waWxlcnMuIEFmdGVyIHRoYXQgY29tbWl0IGJ1aWxkIHByb2Nlc3MgdGhyb3dzIGVycm9yOg0K
PiANCj4gICAgICBCT09UQVMgIGFyY2gvcG93ZXJwYy9ib290L2NydDAubw0KPiAgICBwb3dlcnBj
LWxpbnV4LWdudXNwZS1nY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgYXJndW1lbnQgaW4gb3B0aW9u
IOKAmC1tY3B1PXBvd2VycGPigJkNCj4gICAgcG93ZXJwYy1saW51eC1nbnVzcGUtZ2NjOiBub3Rl
OiB2YWxpZCBhcmd1bWVudHMgdG8g4oCYLW1jcHU94oCZIGFyZTogODU0MCA4NTQ4IG5hdGl2ZQ0K
PiAgICBtYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlOjIzMTogYXJjaC9w
b3dlcnBjL2Jvb3QvY3J0MC5vXSBFcnJvciAxDQo+IA0KPiBGaXggdGhpcyBpc3N1ZSBieSBjaGVj
a2luZyBmb3IgQ09ORklHX1BQQ19FNTAwTUMgLyBDT05GSUdfRTUwMCBvcHRpb25zIGFuZA0KPiBh
cHBseWluZyBhcHByb3ByaWF0ZSAtbWNwdSBvcHRpb25zIGZvciBidWlsZGluZyB1SW1hZ2UgYm9v
dCBjb2RlLg0KDQpUaGlzIGlzIHZlcnkgc3BlY2lmaWMgdG8gZTUwMCwgY291bGQgeW91IGluc3Rl
YWQgZG8gc29tZXRoaW5nIHVzaW5nIA0KQ09ORklHX1RBUkdFVF9DUFUsIGp1c3QgbGlrZSBjb21t
aXQgNDQ2Y2RhMWIyMWQ5ICgicG93ZXJwYy8zMjogRG9uJ3QgDQphbHdheXMgcGFzcyAtbWNwdT1w
b3dlcnBjIHRvIHRoZSBjb21waWxlciIpDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQoNCj4gDQo+
IEZpeGVzOiA0MGE3NTU4NGU1MjYgKCJwb3dlcnBjL2Jvb3Q6IEJ1aWxkIHdyYXBwZXIgZm9yIGFu
IGFwcHJvcHJpYXRlIENQVSIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25l
ZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgIGFyY2gv
cG93ZXJwYy9ib290L01ha2VmaWxlIHwgNiArKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZp
bGUgYi9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZQ0KPiBpbmRleCBhOWNkMmVhNGE4NjEuLmQ3
Y2Y1ZDg3ZTRiYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUNCj4gQEAgLTQ0LDggKzQ0LDE0IEBAIGVs
c2UNCj4gICBCT09UQ0ZMQUdTCSs9IC1tNjQgLW1jcHU9cG93ZXJwYzY0DQo+ICAgZW5kaWYNCj4g
ICBlbHNlDQo+ICtpZmRlZiBDT05GSUdfUFBDX0U1MDBNQw0KPiArQk9PVENGTEFHUwkrPSAtbTMy
ICQoY2FsbCBjYy1vcHRpb24sLW1jcHU9ZTUwMG1jLC1tY3B1PXBvd2VycGMpDQo+ICtlbHNlIGlm
ZGVmIENPTkZJR19FNTAwDQo+ICtCT09UQ0ZMQUdTCSs9IC1tMzIgJChjYWxsIGNjLW9wdGlvbiwt
bWNwdT04NTQwIC1tc29mdC1mbG9hdCwtbWNwdT1wb3dlcnBjKQ0KPiArZWxzZQ0KPiAgIEJPT1RD
RkxBR1MJKz0gLW0zMiAtbWNwdT1wb3dlcnBjDQo+ICAgZW5kaWYNCj4gK2VuZGlmDQo+ICAgDQo+
ICAgQk9PVENGTEFHUwkrPSAtaXN5c3RlbSAkKHNoZWxsICQoQk9PVENDKSAtcHJpbnQtZmlsZS1u
YW1lPWluY2x1ZGUpDQo+ICAg
