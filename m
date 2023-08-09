Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F77762F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 16:48:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kHBPVucC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLXxH6bfgz3c3c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 00:48:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kHBPVucC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLXwM22CCz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 00:47:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTFoK58rkCx0Fg4ExwoHuqtLj1np9XG66MkahJuBt7qcsIJgIPWAWOWd7/vx9vH+rALqGArSdIaBbsDWcr8UCMAOk3BdECw+21YVtZ4JNL7/H8pbE/tfFW5zTUlTRl/DFL90okcohyOsq2ziHXP6dsgAUPvrKv2fEfnIs2g4+OcRbyS738b48LHTjuyvo4I2JT/pGw33RuizBA+GY+94B+dSrNc2nS1k8Iakh+285RH9w/PydJZxB6ljjHCWYHv8iBrU4jEPPUd2c7z0N2XQjVfwjyYVEApEZT6vnBB+h/VYNXl1A87Mpb4zpWTYvJnAM9QayCya2cFQ6/fMGRowxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ej41Eg0BNnG3/tSXO1swpCnyLR05JKXNH1E9/4TQTk=;
 b=ipODgWPCaJeabbMayfO+yvvFJrviLAtXrPoAKSlslXBHuLOhBx5j+5QRPPvpnJk/pgHiyYlVfi7Cv039hTxFhPsgAuEMJDmCyieNK1pXXYFX0n76fyobJz8iWrGkzlhvJhxLTr4oUTH2YHJADDOjkWFrgcDGuxlv2OdqEPeyvwgsuZW1tVe/MJNPqykQyYROfMWxN3OJ+5Ry+cSsmmZkZk/j1C/MwZsGrK48fnW9Hah0Kr4tgRYdn0i+okbfUJ3VxkIS6J7QbYgPgpDeH6yTkGs7nXLCCvsqOB2fFVxyi0a4zk1lglJz95SCd01TT8YegPTT2bUQbSDeLlbdubmAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ej41Eg0BNnG3/tSXO1swpCnyLR05JKXNH1E9/4TQTk=;
 b=kHBPVucC8YswOZR3dsKEZvPWB3X2zFaXZ9O1rJaNotJDAlH5/q4mHLmqzHW/OyOpUH/wKHwKipb0RxblVDhAP7znzIsprAzo7+GwLyH6/79QSyXoJbSxwBW/o8Ru90t9KDnn1gVqN2XEuOM1xCPr6lo2Qsvu3N7r6pouDumHHU8l08GYGxj0rYDb9aUbj/K7n1Wuy+3kLkd/n6j2c2I8xj1y55tmzRCC641TEShDGw9A3gH/vwEeZQz93y0hTUA4hl0/HREJv/lMvxSD7Qq1uKtSG3wkMrlsj33Tn2NISsBEPxsMmKhuk4slZx13BoN3VdR6L0zqudR//yHJgzdEHQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3339.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:145::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 14:47:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 14:47:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
	<qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
	<rdunlap@infradead.org>
Subject: Re: [PATCH v3 05/28] soc: fsl: cpm1: qmc: Remove inline function
 specifiers
Thread-Topic: [PATCH v3 05/28] soc: fsl: cpm1: qmc: Remove inline function
 specifiers
Thread-Index: AQHZysVbd5zx4sLOREKEPFRUXfowEq/iC0MA
Date: Wed, 9 Aug 2023 14:47:22 +0000
Message-ID: <c95cb60e-187f-528f-41e8-4f5989e15198@csgroup.eu>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
 <20230809132757.2470544-6-herve.codina@bootlin.com>
In-Reply-To: <20230809132757.2470544-6-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3339:EE_
x-ms-office365-filtering-correlation-id: d62e7601-5ae7-43b2-666b-08db98e78a3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IWn4MYQs1jVsgYaRjY5halBNb4CWBL/avGiJKbOGCBsG9sVCTvdKFHZV8UP5Y+NwmQs+hbWaW03VnNcnMQ7PM7sW2Io65aq44h/w+0m0MLy1ILFYtdk9o1fTTBI/Em1TIjPEmGlx6haBrm0LPIDFEzEaHMyRgnFUjJHQJj+AGWaXPG0uxd/0HuoDrULB3ehZY4+j3PEiEAOUvVzN8kc6DnXidZuEI3MEPEaj6W1DLu4z3EgqIFrRJEZm3KO0Vta2k7XAxrdREfeRSmwO7H7WfJdz/7Dv+uOuD9bHBnHzORmeximalxlCdQzt0M/OUy/K6hVRc5sz3MmV68aMW4GPsTpb9D8xTh0Zo1Lhsn2KFHQdhXS1RBO1RLZWSvZoGU+otp3KDPZMWlJtaU8Bqunkaw5zXe594vvq3ZfoXWr01JZal5LayBKebKoGT0pGdoks5CGWyrdJHOba2Ml/xaNe71F3ySTagFaxauJCXTxzE2ncg6AMUk+sX/NEZ+zP3O5P99qS11FEzqoIR+gPMVeivO1/0Z0ebwYj5X9xBex/drxkeDRsc+cNpryYEFSOxJPDlWeBejj3w8Pwg1Dg0oRhI/b6+PGsCycEiCDH51cEYdVKDDwiCACXUmneWJwRz4vuouSCSsF448EvLMktBu+O82OA1gMgRQhkiXuL+l2FMWd0T3k61yCISj9UXIIf4WdTJriK1FhYfnMOpX0tym1K8w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(136003)(396003)(376002)(366004)(186006)(1800799006)(451199021)(41300700001)(6486002)(36756003)(38100700002)(122000001)(71200400001)(921005)(38070700005)(478600001)(54906003)(110136005)(4326008)(86362001)(31696002)(66556008)(64756008)(76116006)(66446008)(66476007)(66946007)(91956017)(2906002)(316002)(6512007)(83380400001)(31686004)(5660300002)(44832011)(2616005)(8936002)(26005)(8676002)(6506007)(7416002)(7406005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WEx0TUx4RzI0T3MybXZQUlVZSGJNMkpzNkRHa0twQmZ2ZENlNzRJajhhNlI2?=
 =?utf-8?B?N3N2VmpJdytwZFJJcmdxT2FGM3EydU43M0dmS290UDhxeHh3M3VXMitpZnJL?=
 =?utf-8?B?RHpQTklndlp3akJFZC9TaGtKZTEweHc4K0s0c0ZWMFFjZnVqNzdsZ3Y4eVUz?=
 =?utf-8?B?VnRTK0xQc3poa0sxL0dUa3Jpc0VmTzRSQUVxRysvNlIwQ0REQXpVbFhDOFdG?=
 =?utf-8?B?NXVjSzJzWnE0cW03QzVFdTB6aS9hRm1PR1FXaC9KckVTNWlEbloyRERGdDNj?=
 =?utf-8?B?d0NrdzFDSXFSaTNUNUhtQUZKazNObDF2SVVHbFg0UFdjUlhFR0prTkZsK28y?=
 =?utf-8?B?SndnS0NUMWo2VDNpdG9vaEtXdjgzM3g2b0xZTGF5VFhuSTJ0RE9RTVp0Rm5Y?=
 =?utf-8?B?NldOZE85WGIzelRjOWQ1cFBBOFVXY25vQ3E3Z1FOQkQveDhWNzJtM1h1M3F4?=
 =?utf-8?B?cnhrNUhEMXNreFhwM25JU09yTVlRRG5hbTlyMG5GQlJ2cWlNYnhoWDhBeDVz?=
 =?utf-8?B?MnZDdHNlNG40SzRkNVdoc3cwZ2toeHlCeTUvWkJFTHVpNzhNejZZZC9nSFd4?=
 =?utf-8?B?UXJSaCtodGpSM0FWbkVRdU5ZTkhKV3FyRmFEc0FPenprOVFxQU1FTWw5enlk?=
 =?utf-8?B?T3pIVWxhRWZGOFo5R1p1QzdlZzd5TS9XMFZZUXBZVkhIQkdPYXVacERtNEJV?=
 =?utf-8?B?aEdBaGlXcXdBSlYxY0x3M1d6ZExFcUlhSWZ2eVpoUjNMRGlLOElzNlhmWGlz?=
 =?utf-8?B?OVJqWlVHaWJMSktiSzVoY0FWOHpjcmQ3cFd1bGhvWjNGK1o2a3hMcXhFUm11?=
 =?utf-8?B?WGptU1JwcnlMNUl4N2M2NEVnSFpVOUJ0V1kza0tEeUlyVXp0aHVFYUNpc3JY?=
 =?utf-8?B?ZXlwQWxhVUFUbGtGZzNVeEh5UjFNN0xyYU1vUGFrRHNVT2MxamVNWmtIZDdi?=
 =?utf-8?B?K1BLZjBlSWJDb0V2Tk5XVkN4RmNPZUc2RXhRNDIrMERrTzBVL2JjamVsTGlw?=
 =?utf-8?B?L1pzMXlHbWtYRHRINUlFeWs2NDM0WUh6REFZMGxhcGhnRFpERG1sOUU2YTBO?=
 =?utf-8?B?SlZuYjZDMTRhbTd2ZlJxWnJkK1RpUTlqT3RpaFJCdUZ5NmpiNjB1ZGhmTU5q?=
 =?utf-8?B?K0t3V3ZibTR1WitzT0tOZDRFQnZxZnQ1R1VWUGRENHlMc3ZJbGRpWGhiczFE?=
 =?utf-8?B?TWJpeXhPOWUvdXo3V2JaY2FlL3RxeHYxTlNuMHpkZ2hXNUQrYmo5eG5VT1I4?=
 =?utf-8?B?TlZaQk9teDRYWDR6QzNrKzdtTGpYUjZuUTgvWWczNXRwS2ltZGJ6S01Eb1pH?=
 =?utf-8?B?M0luNVZLUWpjbVdKRUZuWGpuN09RQkx0aFZDUlo5cUxoZ1pWeUthZ3V2SUpB?=
 =?utf-8?B?MllsOE5pQTBHR1FaOW9NOXBJWE9raDNPbVlSbktFcmVzUEtSNWUvT0hwNGlU?=
 =?utf-8?B?UlVhWVdKSWVZa3Fmb1ZsNWVBbEd3N3luSy9FQWtnWHhTclAzckRHUVB2ZlNS?=
 =?utf-8?B?RzY1cThvdDdlNzhyY0VpZTBrWm12ajZSSURYaUpHK0hzVENTRE03ckYrZVFz?=
 =?utf-8?B?aFJJYnNzK09nSlIzUWhBRHY1RnY5bnkvd0MzZTVGV05XbCtsWkVsMkZkdlhi?=
 =?utf-8?B?M0ZidHRBM01pUlVaVFJBUTE4NXJIUllXaEpCUE11c0hySnpUaTJtKytlYk03?=
 =?utf-8?B?a2xqUkFSQzZ3ZlZ4TDh4dUZYLy9NOENrazNJR2FscUVZc3NrRjY5Q1RxWWNV?=
 =?utf-8?B?am92UkxHQ24zRGNaSVg2cVU0SHVraTZIek1KeGYwa2JkcTBsY1U4MTlDWE9a?=
 =?utf-8?B?dU00alNMQ2R2bldXc2RjTVFuQXQ5THNHRGpQRzhtTGJzck04NWt5WnlxMmV1?=
 =?utf-8?B?VUZ0cHpqbWU3eHIwUUJROWlRbDUyRitnZG1RZllpeko2SWFyQU5HeVh4VXFl?=
 =?utf-8?B?dGd6NnRQUGc4KzZXc1Z4THgrcW1aU0YwTzNJOEs1VFM2VGN2ckNLbE8xNzlk?=
 =?utf-8?B?ZkkvSE1jUk9ZWFRmM2xHdUxwYmRMTjJ3Ym9TTldqQ1RINXlIWnhFOEtiaHVu?=
 =?utf-8?B?clNmOHhjYlNKUGNBMlRzcmYzcnNKR0NUMnpscUVjR1RNNy9wTnkvV0dPV0ZD?=
 =?utf-8?B?NWcwZFJ3bDk5QmtadG1mZC84VG9URERRZEVseDgwYzZWc2k4ckVSZjB3ZTF1?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <991A0B2F7BF8E746A724B048DAC10BAA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d62e7601-5ae7-43b2-666b-08db98e78a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 14:47:22.6442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJcmgMYlAdWLlzDr720H9fN5yHnkF+Ai5pQ7uwnLVMYqxBpd1GM1KymkeLMdqdElcIcUTbVm6M7UuPgiqg2lIoRyCc8kOV7gdY1AIaFDNqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3339
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA4LzIwMjMgw6AgMTU6MjcsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgaW5saW5lIGZ1bmN0aW9uIHNwZWNpZmllciBpcyBwcmVzZW50IG9uIHNvbWUgZnVuY3Rpb25z
IGJ1dCBpdCBpcw0KPiBiZXR0ZXIgdG8gbGV0IHRoZSBjb21waWxlciBkZWNpZGUgaW5saW5pbmcg
b3Igbm90IHRoZXNlIGZ1bmN0aW9ucy4NCg0KQW5kIGFueXdheSB0aGUgY29tcGlsZXIgY2FuIGRl
Y2lkZSB0byBub3QgaW5saW5lIGEgZnVuY3Rpb24gbWFya2VkIA0KaW5saW5lIHNpbmNlIGNvbW1p
dCBhYzdjM2U0ZmY0MDEgKCJjb21waWxlcjogZW5hYmxlIA0KQ09ORklHX09QVElNSVpFX0lOTElO
SU5HIGZvcmNpYmx5IikgZm9sbG93ZWQgYnkgY29tbWl0IDg4OWIzYzEyNDVkZSANCigiY29tcGls
ZXI6IHJlbW92ZSBDT05GSUdfT1BUSU1JWkVfSU5MSU5JTkcgZW50aXJlbHkiKS4NCg0KU28gdW5s
ZXNzIHlvdSBtYXJrIGl0IF9fYWx3YXlzX2lubGluZSB5b3UgaGF2ZSBubyBndWFycmFudHkgdGhh
dCB0aGUgDQpjb21waWxlciBkb2VzIHdoYXQgeW91IHRlbGwgaXQgdG8gZG8uDQoNCj4gDQo+IFJl
bW92ZSBpbmxpbmUgc3BlY2lmaWVycy4NCj4gDQo+IEZpeGVzOiAzMTc4ZDU4ZTBiOTcgKCJzb2M6
IGZzbDogY3BtMTogQWRkIHN1cHBvcnQgZm9yIFFNQyIpDQo+IFNpZ25lZC1vZmYtYnk6IEhlcnZl
IENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KPiBTdWdnZXN0ZWQtYnk6IEFuZHJl
dyBMdW5uIDxhbmRyZXdAbHVubi5jaD4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3NvYy9m
c2wvcWUvcW1jLmMgfCAxNCArKysrKysrLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
b2MvZnNsL3FlL3FtYy5jIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jDQo+IGluZGV4IDJkMmE5
ZDg4YmE2Yy4uNDU5ZTBiYmQ3MjNkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3NvYy9mc2wvcWUv
cW1jLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jDQo+IEBAIC0yMTgsMzcgKzIx
OCwzNyBAQCBzdHJ1Y3QgcW1jIHsNCj4gICAJc3RydWN0IHFtY19jaGFuICpjaGFuc1s2NF07DQo+
ICAgfTsNCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBxbWNfd3JpdGUxNih2b2lkIF9faW9t
ZW0gKmFkZHIsIHUxNiB2YWwpDQo+ICtzdGF0aWMgdm9pZCBxbWNfd3JpdGUxNih2b2lkIF9faW9t
ZW0gKmFkZHIsIHUxNiB2YWwpDQo+ICAgew0KPiAgIAlpb3dyaXRlMTZiZSh2YWwsIGFkZHIpOw0K
PiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgdTE2IHFtY19yZWFkMTYodm9pZCBfX2lvbWVt
ICphZGRyKQ0KPiArc3RhdGljIHUxNiBxbWNfcmVhZDE2KHZvaWQgX19pb21lbSAqYWRkcikNCj4g
ICB7DQo+ICAgCXJldHVybiBpb3JlYWQxNmJlKGFkZHIpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRp
YyBpbmxpbmUgdm9pZCBxbWNfc2V0Yml0czE2KHZvaWQgX19pb21lbSAqYWRkciwgdTE2IHNldCkN
Cj4gK3N0YXRpYyB2b2lkIHFtY19zZXRiaXRzMTYodm9pZCBfX2lvbWVtICphZGRyLCB1MTYgc2V0
KQ0KPiAgIHsNCj4gICAJcW1jX3dyaXRlMTYoYWRkciwgcW1jX3JlYWQxNihhZGRyKSB8IHNldCk7
DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSB2b2lkIHFtY19jbHJiaXRzMTYodm9pZCBf
X2lvbWVtICphZGRyLCB1MTYgY2xyKQ0KPiArc3RhdGljIHZvaWQgcW1jX2NscmJpdHMxNih2b2lk
IF9faW9tZW0gKmFkZHIsIHUxNiBjbHIpDQo+ICAgew0KPiAgIAlxbWNfd3JpdGUxNihhZGRyLCBx
bWNfcmVhZDE2KGFkZHIpICYgfmNscik7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSB2
b2lkIHFtY193cml0ZTMyKHZvaWQgX19pb21lbSAqYWRkciwgdTMyIHZhbCkNCj4gK3N0YXRpYyB2
b2lkIHFtY193cml0ZTMyKHZvaWQgX19pb21lbSAqYWRkciwgdTMyIHZhbCkNCj4gICB7DQo+ICAg
CWlvd3JpdGUzMmJlKHZhbCwgYWRkcik7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSB1
MzIgcW1jX3JlYWQzMih2b2lkIF9faW9tZW0gKmFkZHIpDQo+ICtzdGF0aWMgdTMyIHFtY19yZWFk
MzIodm9pZCBfX2lvbWVtICphZGRyKQ0KPiAgIHsNCj4gICAJcmV0dXJuIGlvcmVhZDMyYmUoYWRk
cik7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSB2b2lkIHFtY19zZXRiaXRzMzIodm9p
ZCBfX2lvbWVtICphZGRyLCB1MzIgc2V0KQ0KPiArc3RhdGljIHZvaWQgcW1jX3NldGJpdHMzMih2
b2lkIF9faW9tZW0gKmFkZHIsIHUzMiBzZXQpDQo+ICAgew0KPiAgIAlxbWNfd3JpdGUzMihhZGRy
LCBxbWNfcmVhZDMyKGFkZHIpIHwgc2V0KTsNCj4gICB9DQo=
