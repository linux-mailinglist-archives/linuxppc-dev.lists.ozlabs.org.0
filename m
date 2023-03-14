Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7106B8DC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 09:48:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbRyM4mc0z3cMS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 19:48:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jK/3X/iU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jK/3X/iU;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbRxN4HJtz3cDt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 19:47:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeiO8eNcg6rDMEn7W2slU/eSARPX9I14tUZMuAZsC4iPTqxWrYL5xMo83o70RzYgrRhE5uLz5z7M2Y1LgLr6g7rEzheRDNdjxuHIImt2vLSzeFFSNHJY5U3HP//dymDTvI+yZ2QUfmiIT447EAGynzXMZ3vuuyejVLzME5NPfju7+qMfMnlyj0Wcyw+JydkYsxDgD4AVyU8pgu36SVB+eE8CVYI8nKOP/1ycGJQgJISPnAgowccwIpTcIsw3hoeTRsWIra1iVPKcndyruijgPNdqJgl3DK99GG3XvEL9F9GBqcPkN+OU3iEgqwy2RNd18cBCzVqT+wGXPWCwr299/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Csh0QRzHOg6CFD96lbFdnn/IOVlRmp/TUwOffkhhxvM=;
 b=M5MuQdBa/Dt8hs5/Yv6erH8Zw6UIBjpDSmRGzbcZrZQQd/VVvA0Gujd+kWTbIVjYy2Y+5g3B1ZqwRn3+D6lQ1qY5HXvqlGOYfHF+drvqrdh3KVkfgMJWvuitsU0H0b11WJ5iZsTcGgr3bUqdFU4ukTcJAQ9vZ+Q4ew7XOE/ViIAIAsxJjgik/V9ZOXXhmsRTrNyMfvU6u7/qLHBX6ZfJ4mb2NMPFuXVMKy+XP704hI6zMUl7HPesDosQY32WwFuypds0rRZ0KrQSk5Q0dPE6B55XO+cmxJhjwzEkmWRvRLmmhz3/azr+3r+gMj01rRJRU0ItNVDMQBUX5QV6AY/XNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Csh0QRzHOg6CFD96lbFdnn/IOVlRmp/TUwOffkhhxvM=;
 b=jK/3X/iUovI+4YE6WJoPu0lfRqmUarvV0y14I0twkmapn9Kpjc1s5tCly6og9nuHvnAGSDo/Y0/xDVUUuFr0BlXtwtH6pNiuS1BBpaQKqdav0XiB1WhxZXaY82JNnKi6wGbNz/I4KqVvn484g1LpAJ46E4ldiMGZjCJ7rAE7XPMUQtyqsjGh6ZG4fE87/KeK9P3m66ryeZ+P3AI1IUKG5VUGMOr8eCJILrkNXCXwrulm5E9jf5Lgfhm1nUpuOLFzo7t2jwJ+jrVu0V6AayyjsSqxFcnMPIPJT6JGbkZH+XjVUAXjZrrUPXcl3Esye26QgFHfnNuG7XPXgMc8g1z4JA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3288.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:128::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:47:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%8]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 08:47:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "ye.xingchen@zte.com.cn" <ye.xingchen@zte.com.cn>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: p10-aes-gcm - remove duplicate include header
Thread-Topic: [PATCH] crypto: p10-aes-gcm - remove duplicate include header
Thread-Index: AQHZVk9zLKsp9sPFaUm1Ia6lj5s8WK759pkA
Date: Tue, 14 Mar 2023 08:47:30 +0000
Message-ID: <dbbd6ff3-5e17-9b63-9027-359e37ace668@csgroup.eu>
References: <202303141631511535639@zte.com.cn>
In-Reply-To: <202303141631511535639@zte.com.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3288:EE_
x-ms-office365-filtering-correlation-id: 7bbb4f4b-0652-4f0c-d28c-08db2468bf6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +bHiPigDH0cEW1/9aJ1YWRnKgG+Opxga8LPHgrYakZZV+DL6dwnaq0zmln2IrtbUWC7DT1xu1Mdca15BDUq8ZkCLtfkIUckmCS55/8JQVnY2rFRow1y1EZR8syV10lh2Ry3pcxDTvvhwdNQfhUCApP6oisP69Y0pphvscMNuIpDBixgV8A/YYyifQcFH/+oQmsAwXo15nAaLW24MAqIOTmkOJBxFZ4kipL/o/WRffHu39v0BmL0Wece9LZlyJ+YtaqIiuB8RqqxihJ3VsDAAYMgNiaBaFUdy4qzbZ3/PxaMIQXGoCeE2SvBCsBw6LCscxhXffso5ZWtehvI2p9kW24WaUnq7tTscQ6l+cQ+onEGlW1y423slT/VdZVWtA/kxMLHuwCEbsUcWr+4e4ulk/lc0nCfj+zIFtd37rtIvNdyxz38ST8XL5YaEVytq7VXXVXq2zIprQOoufVwuL0DRkZOyV6DVYnVdYZ5Zk17qCow3E1CWblVEFRw5MrwWti8CM50gBEIlfA3dJQX+qDuhC8RGoPxu1JUab3H9RI5eSJRkGegc7LzkcWMQ3OrdBmms/qRglTxNeW+9F8rrtH5VIas7HMpFfQApr7qF0ujbDd9oqa89YL33fSqAOoRnCUTK7sCuLkUnLn3BWqIW6BNVGv9vYaO3HNOuL/s9lQUmNW/vRS/HX0JXi1mx0uHOhKkSovCyRGl+Aj2/eO1a9AVysP+xM88y3Ifd3sNOlEDQmQ2P9efy5hqvlwUv3iBecgAM
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39850400004)(396003)(366004)(376002)(136003)(451199018)(66574015)(86362001)(31696002)(478600001)(5660300002)(8676002)(71200400001)(2616005)(966005)(36756003)(6486002)(186003)(2906002)(26005)(6512007)(6506007)(4744005)(44832011)(41300700001)(91956017)(122000001)(4326008)(31686004)(64756008)(66946007)(66556008)(66446008)(66476007)(38100700002)(76116006)(83380400001)(8936002)(110136005)(38070700005)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ODdsMHBqNUtMNjFUMVhTRWpFeWhSY3FqaHBCbjZEdUFsRjJNMEhGQUora1hR?=
 =?utf-8?B?U1c2VWs0SFB3WTBEZUczOWF4OTgyalJraWh6SU9ZcDQ2SmlueVZlc2VHYzRq?=
 =?utf-8?B?OW1DWXU4YnFrNXg2V1F5ZW1pV3FsZDZkTXRuUFFiUUQ2MlJZYUZrU2ZMUVI5?=
 =?utf-8?B?d0J5VkI4L20wblhvVU02L1FOazFXbGFENWZVTWkvQ1lNbk11bW5KOVE2VlpU?=
 =?utf-8?B?UnczRXRia1o4MlU4SGIwVnNCRFNIUnFHWms4NlRUODM2cmgwN1VZNElpUXVh?=
 =?utf-8?B?aGFTR1h5WlZ6cEZDbXlGbjdzYVZWYTNUcU5adlpVbk5rK0diejh4M2pKWTU1?=
 =?utf-8?B?NTJXZzM5Tmluem5ib1FUVGxQczd4TUdrM0lmaXVla1RodTJMYUZZZXJzamo2?=
 =?utf-8?B?OUtZY1BCYnoyelAyd0YyalVOZXJtSm9pc1d3cjhJL1cvdVhxaUdpaS9qendC?=
 =?utf-8?B?K1dqcm5HdlN0Q3hoQzdmL2JIWlBRWU5sNFRoaFFTaHIyTlRIOCtMUGtYRTNZ?=
 =?utf-8?B?dEZqYWNBWW15OGFYclBWSGhjMFhKd1dhdTVmTlA5dDdzT3B0OU9rL2ZNTXFr?=
 =?utf-8?B?TnhCbVFMb2dNMkNteWQyM2xnUFg4RW8rVTYyeHZiT0Y3UlN0WDhiQjk3RzU1?=
 =?utf-8?B?VkVDbkZYcUJWRHhjNWFjVG1yNS9CNGFSd2I5Q28vUi92NWhvekZtcGRvSk5U?=
 =?utf-8?B?MEpTNFRoUHlLRlcvM1hjTXFTNVlPS24yRFlGR2FyT3VVdkR1azkyZlRNVnRT?=
 =?utf-8?B?cDBpcU0rM3RYeGhuaGw5bmdLODBXaG1sdlVlaWhxZ1Qra252SXZvVUlsUEdT?=
 =?utf-8?B?bHBiTzc5cFY1dGpDT2s1V0Q2SytUV1RlWDVqV0dXT1NwRnBLVXRBcEIySDhF?=
 =?utf-8?B?akQxQWZWVzRQSXlLZnRxNkhUUGEycTJEaUtuVVNXZWRxVEsyeXRGV1BUeFdW?=
 =?utf-8?B?SlN4ZHZYQUsrMzk2eWRiY2xVdlNnRml3WEVGcWYrelZIdnhnWmJaSUJyWSs4?=
 =?utf-8?B?cU9MUVJMNzBtUjJ3NktBU1VkT2tpZW8zRUdHWkpMNmJyTkVjVFJDVEVKY1dI?=
 =?utf-8?B?ZXdWdE1zVVI1S21IUGFxczdnMmdTeStuOS95U0VYNHoxY2JVTmJFOWh5dmg5?=
 =?utf-8?B?aFFtT3dUUzVld0hqcFlubFZBdy9yVXd2L2NocmxETmRiVHNIbnFUQ2RsaEVP?=
 =?utf-8?B?Z2ZSU01qcGFzcU9hOXJYN2VUb1VaQUt0L1A4NVhFQ2VCeWxDSTZzSzlrWkFl?=
 =?utf-8?B?VnhnazNNSHd6ZlZkb0l3aFZvQ1lGb0FTL01LUjZ6OU9iTExnVGNRYVRBTzRp?=
 =?utf-8?B?akdESVdCdmVlVXRuckFCUEtnMWFXRlF0dUt6eURSVGdJYTF1NStYRE1KcVpz?=
 =?utf-8?B?clZqbXY4bHZuaGRIZTRNNHZFN3ZnL3RnVlQxQ2h4SkpPbWZBQVhSenRIaTVz?=
 =?utf-8?B?THpSeE9NOHZCeHM3Wk5aZmVKbGpvWERyeVJPTGM5SCsxLzgraytabDVZTGNk?=
 =?utf-8?B?MENDM2x0YUpubjNRVG1NZm5VOVJGU29oYm5OclF3a2o2SnFmT1pkUkgyRUFu?=
 =?utf-8?B?UWZ4eXdRT2VXVTAyOTg5ZDV4WnFJZVBGMXYwOS95N1I2b3VxZjlrdHVNQUg0?=
 =?utf-8?B?bm9PSDRQRUpFTmsvWlhPOHd2NkczUWxtYXpsRUpDTkVRWUhVSVhoczR6Q2hz?=
 =?utf-8?B?bmpaVmxsS25YOWlQTksrdDZTbmtLem9QNVpXUUZsVjgrU1NDcUpjQThFNlNy?=
 =?utf-8?B?SkgvRndKaXk0N1d5Tm5YREI4YTRIUm03aXhJMEFFUFN4SjhQVVRkUUVCN1lz?=
 =?utf-8?B?WVJCQjBJVSt4T05rejNCeVU3TXRmSmRzelBMQitkYWFiREV4L2xvS2R4eXhH?=
 =?utf-8?B?a2lGc0dCWjU3T3dTWkY2SGMydVpVUXAxSFJ3TEtlYS9YMlhuM1U1WFVkcEdl?=
 =?utf-8?B?NEduMTRzZ2Y5bjd3ODcvVlRPUFNsd3ZuNHlYZDBmaGswbm1td3hJWUxYd1dW?=
 =?utf-8?B?R0J5enRuWHFiL0g4Z2xJdnMvaEFyTXdBRTlyM2dwMVdwUTJoUmJaL2U2QkRx?=
 =?utf-8?B?SW1TVGVwY2g0QllmWWszR3ZONWtlaDZVMEd4NXgvcEs1OTQ0bkNPR0lQWHY4?=
 =?utf-8?B?VlhSZWtYc3RwWEtuWG1kWXVBUkNRM1hVTExaYXNaTTFrZk1LeTlIMnhGaG1T?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A392DD75D7F501419E9925DEA9176DB6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbb4f4b-0652-4f0c-d28c-08db2468bf6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 08:47:30.9810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jdv2eBjXJDbaEk3BL4mCyPm8JunoE+gwRvgRzwaliABxAl2HTetU7xt8tgZsYdv9gWVUCmANabo6XD697iwOylcSOBg03ba2sgtx00jjws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3288
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDE0LzAzLzIwMjMgw6AgMDk6MzEsIHllLnhpbmdjaGVuQHp0ZS5jb20uY24gYSDD
qWNyaXTCoDoNCj4gRnJvbTogWWUgWGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+DQo+
IA0KPiBjcnlwdG8vYWxnYXBpLmggaXMgaW5jbHVkZWQgbW9yZSB0aGFuIG9uY2UuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBZZSBYaW5nY2hlbiA8eWUueGluZ2NoZW5AenRlLmNvbS5jbj4NCg0KWW91
IGFscmVhZHkgc2VudCB0aGlzIHBhdGNoLCBzZWUgDQpodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjMwMTE3MTYwMTA4MDMxMjI1MkB6dGUu
Y29tLmNuLw0KDQpBbnkgcmVhc29uIGZvciByZXNlbmRpbmcgPw0KDQpDaHJpc3RvcGhlDQoNCg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvY3J5cHRvL2Flcy1nY20tcDEwLWdsdWUuYyB8IDEgLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL2NyeXB0by9hZXMtZ2NtLXAxMC1nbHVlLmMgYi9hcmNoL3Bvd2VycGMvY3J5cHRv
L2Flcy1nY20tcDEwLWdsdWUuYw0KPiBpbmRleCBjOTVmNWI3Y2M0NTYuLjE1MzNjOGNkZDI2ZiAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2NyeXB0by9hZXMtZ2NtLXAxMC1nbHVlLmMNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL2NyeXB0by9hZXMtZ2NtLXAxMC1nbHVlLmMNCj4gQEAgLTgsNyAr
OCw2IEBADQo+ICAgI2luY2x1ZGUgPGFzbS91bmFsaWduZWQuaD4NCj4gICAjaW5jbHVkZSA8YXNt
L3NpbWQuaD4NCj4gICAjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPg0KPiAtI2luY2x1ZGUgPGNy
eXB0by9hbGdhcGkuaD4NCj4gICAjaW5jbHVkZSA8Y3J5cHRvL2Flcy5oPg0KPiAgICNpbmNsdWRl
IDxjcnlwdG8vYWxnYXBpLmg+DQo+ICAgI2luY2x1ZGUgPGNyeXB0by9iMTI4b3BzLmg+DQo=
