Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C6773904
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:20:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lCbybCsb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKmNL16pcz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:20:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lCbybCsb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::630; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKmJK15qTz3dVj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:17:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So3h4Cbm1t3xR8OVeMaOcRuENQ15ov21BdSlS0XnZCvafwYCv7q0zZLMKr7URauqDSBVLlJ5zeH5kaOy6AGH0fnC/8Xb4LKA4+0fST9Mpqfl7Tz0Bx7njKX42UTh5rIcFpEr8JJQd3D4SJMuoVgkjW62sTKu4IhY9IioIvxFJczWoBD//aeNHl0zH66z4lH2MkJ8cYFrXJLvVQrQTcRVWki1H8gHD3tP9GhDBvBoAyl4mlPgc864iPiRvmwbXiep5qgF02tIN3OGS1SOzNqV2Exw8UAcO8UHUnhveoS5200bol6UVioWCQI7KZlYiMvyFkV+u97EERveUs20rhwZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATg+SZLlfBEpiTAS0IMVsxiLhcLARH5H5wo5nfSJ/Io=;
 b=EM+vJKA4g7Ca+xesIrdh62pQcjP94F2k59C+XCD5A7qL7QUuZLWAW4DgSMfc6IqpMS76n4SQVPbHq45RCELTfxGyEBvJS3nFwJNMQ981Xoukpw6U1zOHLfRxCxIxBQtpN4GJ11wJFO2GH4/766/0zoEDdMJmrK9vKiN98RrQfYgf73QTigrphBbdgRin8jZY4jW6bLNfzDW/iZhhf3ueMFKUFtcmWVR8uaOTsob8GFmp7tmfzH8SaLwAuKuDNbGOBEW0UfdfeKfEobzGZ616dpmzeR6UGRqgn9MJRSMDnzGToacUBeh7U38uuvyFalbZc0zLr0Wk5U/7eVRIspM85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATg+SZLlfBEpiTAS0IMVsxiLhcLARH5H5wo5nfSJ/Io=;
 b=lCbybCsbnxi3kDQTbzTLt0Ha6AowWSzTbkf+C0eCdiGgf0xZDSaqKPdfGmzUigpUNq/aWs01VINwra6SSAoD7TT0nvio+eM6+VB4plfJDRDq475wv30cJo84r+SF6adclAVhQLefKH54Ztla2uttqzw6Pr2YcgQ2f78Lcn+xaDU0/OZoAAde7WAyowixFRLFpUkvbTJlTlIN1ZBlCIWYRAa9KVcpfKVNKbgWpUUd3lJNDmcvAYVgDG7aCPrmk0BSqAhvDlVauxMTMdCWe/WQ/p2nATjP8MRbtrkCjIBucX5/So+y/SjZtT1gaNOtjHkMAPyuuYTLHj7pbOS8rEzg2Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2415.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:17:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:17:01 +0000
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
Subject: Re: [PATCH v2 25/28] MAINTAINERS: Add the Lantiq PEF2256 driver entry
Thread-Topic: [PATCH v2 25/28] MAINTAINERS: Add the Lantiq PEF2256 driver
 entry
Thread-Index: AQHZv9Ju/UNBTldwcEK857iq3KR/uq/gIcSA
Date: Tue, 8 Aug 2023 08:17:01 +0000
Message-ID: <5aea6971-1ada-aa16-91b3-843fe258b6d6@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-26-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-26-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2415:EE_
x-ms-office365-filtering-correlation-id: b21c0e04-0ff2-47f1-0831-08db97e7d7be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  S3Vv5IRTSsrnI09zcAurFZ9hz3t9tSUudfODp1OH0bwyONkvviFG5SvjEfNtd3T1YvovY+0KiWopynff7Nd23Qx4evDBV3pzw8meD2hmLpErf5mAP8KxcLZmQKBOtKy7Q5W2ArsCQS46GaEMrpZWOJo1nu2a9RDxzeBXjs7yz809tmsa8AByeIcipHMgYuBuvytYTrikqGiZ6f8/VWZ0/KJCWF/t8C62t1yEFET5/2Nt4OoKXUjsZbEGWBgMi6dVjpUHnBAIlSu4pa9aCxDrfuEXRQFqedRxEflLbiKe1QtyJzWUliSeENXYe/+Rtl36SpXAo9US8i+TPW5h2JVVbYnTs5FPASuPd6/+F3OARa84WzfAZnx7D8FSpBf5gC2WBRY2L+Fm3BLbh8FkVaf1MwQj2cxnWqiMPWS87Cug0ptdE4XfXHe3w+P3gGY+4KmFTzp04MN9vVFirauyvgSHGYOA3NCZj7PGdhlf8aSs2KCcu42MFfEgrwvspuwMiNs3GTqXawaOhSR9u3tskDeVMCo8c9+pebNE2Ku8hOrPOPRzUt6C/CZgYTAO9HlzGjrbqvU0kdZDs7VT71JfkxNTltuZq6TIdBMb6ZPDXm+A3NnYlrC6I+uRxwfmCXgG7Hk3GeBp3nC4ZTWLWMT3JNHXQdzillZ0Pm0hYY79t3/Lk3mt2wEGl1Zmm9nVo3IfiNa2zPD2fVNOA4kk0ODP4Uds+n/ZTKdF2R4P/QKeV9HWfc4VhIX3qbFjqMqzzsHGAcXUdP6rJZNJwW2Ux7ZOLIlmYw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(39850400004)(366004)(376002)(186006)(1800799003)(90021799007)(90011799007)(451199021)(2616005)(26005)(6506007)(6512007)(71200400001)(6486002)(31686004)(122000001)(921005)(478600001)(110136005)(54906003)(38100700002)(36756003)(66476007)(66556008)(66946007)(91956017)(66446008)(76116006)(64756008)(4326008)(316002)(41300700001)(8936002)(8676002)(5660300002)(38070700005)(7406005)(44832011)(7416002)(4744005)(2906002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YXYrOG1mb1ZwN0pOWkVHZ29ZcUlOZ25ZWGZibzNUcElxbGMxNXo2MFVKYytj?=
 =?utf-8?B?U0xNMk91MFNjV3R6aHducCtVY1o0aTRySFFMQ3FWa1ZoNlQwSzVaMVpmbXEy?=
 =?utf-8?B?OS9lVUVmWEtUSXZWZk05L09mZGIra3NJam1FTG1CdlczY1NObU5ISk1yem9G?=
 =?utf-8?B?WlFZS2VjNEo5cWpLS09sNFJsU2szcmZydUtid1lCRXlncGcxbkN4SElPM3Z3?=
 =?utf-8?B?Q1h4SGxjNk9Kb1lFUnlkTEU0VHFUQ2lpWHlzQWszeHBxVG1aU0tGQjZLTmg3?=
 =?utf-8?B?V0JvU3grUm9XemkzMGdBcmVxK1BVbEREd2RJZnFQSHFtTW5PQTdtd3RXVklC?=
 =?utf-8?B?RGxiVjFxYlNwRzg1NGFoVDM0VXIyNXZuSnc5L3V3QUtVdi9qWjF5MDZTZVpN?=
 =?utf-8?B?c21tdmJ1L21jZGlEZDk4Vm93aXNiclViaGMzZ3RaVHNPdkNZT0FjaW1ub3Fr?=
 =?utf-8?B?dHBTaklDNm1FZ2FhMFlTR2xBdGhyeFRsR1ZKMzNBbTh3U0U1alE4Nzk3cVpK?=
 =?utf-8?B?bFk3YTB4bmN2K3VWaDliYUd3NTFQemdYajhOS3BNQTZGQUI2RWc0eWtpWmpG?=
 =?utf-8?B?OTV1dkdwSDhOUzBjbFlacnJpZTlHTm1yNVY1c2RTdGluaStvZy9odmV6bnpl?=
 =?utf-8?B?OGUzbHdSTFRjYkpaYVF3eFpRbXlhcFdsQ0FvMDc5c2V2cnBVV2o2a1cxR2Fl?=
 =?utf-8?B?MTh3NXlwaXdldWwzSU16VjhRYUwxcUdnS0lMZFVaVjh3TUVMc1ptcDJPWVVm?=
 =?utf-8?B?Z3lQc3RjQ1R3anErRjZXK3Awb01QbmRqdjBoTU1QREQ2cGQ2TzRmM1lLQTU0?=
 =?utf-8?B?Z1NhWk1hNGZ1c2MzV05KNGdsR0VXOWJWVi90c1VyWjlrUjMraWhQRUJGT2kw?=
 =?utf-8?B?U2k4d0x3Q1F2NTRoS3R4V0Z6UFB3Ny91NHh3Wis1YzB4VFA3SE1IaUM5N0l3?=
 =?utf-8?B?cUMzY2t6dTNlSkZPalpJV1JVbytqVVd6QTdBV0VGSTlQNmpaRjRpUGRRMEhO?=
 =?utf-8?B?dUVxT0FBdkpLczkyQjBlSVRDQWgxVXlSSGlJTXlUdVFiMkZUaU5NMHlxM3Jr?=
 =?utf-8?B?VXpNWndNQmQ4a1I3Y3hJVWZ5MlBqQ0YwTWtSWUhMVTNGUzF3eHVmbkdoNHNn?=
 =?utf-8?B?c3c1OW5IKzRMcXJIb25LR0YvSXNFWmxQVW1Jcm1nVjJ6SHl0WldrUjRGTkRC?=
 =?utf-8?B?TGZVbFFKQWNCakN6N2kzdlR3N3R6bEd3RTcxbCt0RFduL2p1UTlXd1ZHN29n?=
 =?utf-8?B?akpCdHFlUkl6YzhuUUJUUlovaFIzUmJDMGw3TjJnMFA1ZEVLTGs5NlVHaVhV?=
 =?utf-8?B?Tlc5VG1jSERIVHZWcmF4d2dWeWFuYlBSMjBWOXgyY05BSzF1bUNaWVBlNWw5?=
 =?utf-8?B?cmUwd0JEaDBEQ3hHbDlKL2JOdjBWRlcwdGtkeERtZ3dyOVg2SE01MXRqUmJp?=
 =?utf-8?B?YzZTaTZBVWI0TktSTEMwaFB4dnUrZDI2aVRpK1E0WXpXVXBMUkowSmNxMXds?=
 =?utf-8?B?aHQvTE9mZUJNL3hUSTM4cTU4Y3VYbVNFR0p3aDlLd2t1UERzSGFhZStvUlhE?=
 =?utf-8?B?TDErQ1VseWwxS2RBYU9ucDl6TkRaQ09PaGtoWXd6TlQrTFh6R3lHWFpvZUdx?=
 =?utf-8?B?ckdCYks3YWF4eXpJUkx5cXBCc0ZuY3ROdHNkRGFvZzZxMEMwVnE2Sll5ZW4y?=
 =?utf-8?B?NGR4VWdGT0haNGdIbUdaTHNzdnJBM2tNMEh3ZFFiSXFLWkI4ZEpGYlFmem56?=
 =?utf-8?B?NTZLYit0UlFnRXVjRzhnZTh4aXZzZlFZOFRkYnFJY3F4TFFDNzVndVRxL3Fh?=
 =?utf-8?B?K2l6QmJlZlpYU2RkbktxRWRQcUR1MmdkTnNiemZZTUpGMHRBMGoyMjZFcUsx?=
 =?utf-8?B?TnJTL3p0OHR2MGl0QW4xcE5ja3Q2YzFYU2w5anczOTdpb0Z3UDNwSkpIN3pp?=
 =?utf-8?B?Rkd1c2hJdVBKRUVRRmljYXdqRFM5Njg1Uk05dHZWYTA5MTZkQWlUNXdKUFho?=
 =?utf-8?B?N2lRenhWdmRWdEhSQjlPY3BNaVJOZk1hbFNkWExVYXloL3J6NlkvQzVvTElm?=
 =?utf-8?B?TmpxejBYTVpWRm0ycDNGY0w3aWN4Sm5pZjlGRlJIMFNjajgyOWkwbWphYTNo?=
 =?utf-8?Q?36MWc/GSci/Tgo0GD9F8eIISY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFD78C4DC505954A9FE35BB820042761@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b21c0e04-0ff2-47f1-0831-08db97e7d7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:17:01.5661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXNXglXVkTk4SGwfrbxXeNsUBfnF/vHDhFrg/9FxGjiP4p+7fvNx3Jb1nierCJXvlOIMz7D5RxBMvKFNGGAQpPVEcBDpHCHveXovw0EN+Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2415
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBB
ZnRlciBjb250cmlidXRpbmcgdGhlIGRyaXZlciwgYWRkIG15c2VsZiBhcyB0aGUgbWFpbnRhaW5l
ciBmb3IgdGhlDQo+IExhbnRpcSBQRUYyMjU2IGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0K
PiAgIE1BSU5UQUlORVJTIHwgOSArKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0K
PiBpbmRleCAxNDA0MWQ5MGY5YzguLjA3YTdkOWZjYTNjNCAxMDA2NDQNCj4gLS0tIGEvTUFJTlRB
SU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTExNzc2LDYgKzExNzc2LDE1IEBAIFM6
CU1haW50YWluZWQNCj4gICBGOglhcmNoL21pcHMvbGFudGlxDQo+ICAgRjoJZHJpdmVycy9zb2Mv
bGFudGlxDQo+ICAgDQo+ICtMQU5USVEgUEVGMjI1NiBEUklWRVINCj4gK006CUhlcnZlIENvZGlu
YSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KPiArUzoJTWFpbnRhaW5lZA0KPiArRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9sYW50aXEscGVmMjI1Ni55YW1sDQo+
ICtGOglkcml2ZXJzL25ldC93YW4vZnJhbWVyL3BlZjIyNTYvDQo+ICtGOglkcml2ZXJzL3BpbmN0
cmwvcGluY3RybC1wZWYyMjU2LXJlZ3MuaA0KPiArRjoJZHJpdmVycy9waW5jdHJsL3BpbmN0cmwt
cGVmMjI1Ni5jDQo+ICtGOglpbmNsdWRlL2xpbnV4L2ZyYW1lci9wZWYyMjU2LmgNCj4gKw0KPiAg
IExBU0kgNTNjNzAwIGRyaXZlciBmb3IgUEFSSVNDDQo+ICAgTToJIkphbWVzIEUuSi4gQm90dG9t
bGV5IiA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT4NCj4gICBMOglsaW51
eC1zY3NpQHZnZXIua2VybmVsLm9yZw0K
