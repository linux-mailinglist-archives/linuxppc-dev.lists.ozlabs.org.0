Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3BE665CE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 14:48:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsTY15wW8z3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 00:48:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TaCosDvG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.49; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TaCosDvG;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2049.outbound.protection.outlook.com [40.107.12.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsTX06xyJz3bZl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 00:47:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1LOWYK1CTByGfmeJ0FX1/HM7YmcJa6CcAp0In6EGfWhZzEOQsatkIVBqcm31uklW9b6UJX7hi2H6+yDD02xGWIJvbmQrC7XIo/8Yie15TKhhQMM8ZcjoRiJkFIWEKhG82EMiC9m2F3+Wbgxeqw1mim8YfxX8Kfl5IjCMe1Fwf3uPHDrYa5K4jFniv44LM+vDHCkewlLE+kVI4/79yRlRNmyVyanR9PaUPLd3rqjj1f/7xXgKq5t1BhWVN8zutZvpFfSwRPWtTc+8/C81/jI/b+YUbH3Tc9UUeTA91MsyQ4qEwo8sO60rcwehMwEDdX2LPFB79kbY5wlTGvwgd7E3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj5DMhjvSis9lZHNBNHhADRU0Iyy9cNBvIa6/brojPc=;
 b=L93/VJq+JvKkyce4K083pngc9v1CPCLCI8GN8cWllXYtl9lc2jFIyWlQvXM+bEstzZ2BsaTLVwP/Alu3zcQR9NPluC+Nb/zWhKGnvrU5iI2e15gj5y7j+S6S1U8AGoAoPFLZ2UnxpO4I0rEm95+bYJXU2k+IjVw1iwKdnrA129a9E6e7PiKGh5UJ9V4vYlFsTHWl3k0jlkrdqcSZhwdG2FLfSmB/8UYgGiKN7ydkcO8CVM689bl1BziJqkZQF+zSf4SoA7nLa93Y39OIBGloN2X/A73R9JhLFceq6yOu+MYpB5uWOl2pUtTLjAK8AAtO3NJmdZseyqWHCk+a1xmZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj5DMhjvSis9lZHNBNHhADRU0Iyy9cNBvIa6/brojPc=;
 b=TaCosDvG/vtneHYOJ7rLsWS7e8EPZNBx2idxwxCAT/KXdDg7s9kw4dm4js/EJUYyjHrObroZJvAlucH4QnmAYXvZftpCg/OzPQIiK3JsHd0xIljpnVCXs67TDx4MrZNquxavjpXfON0Hq4fwluKsfQEoAmxsyPOR1Qb6XzxKuhkmuPt3uyyV7by8InmIrrax105YUFG3c2JG/7vFUCNOBd0xCDEpZnKB8vlbrqxNn1LG++beO7jQGlBnK25+XHzpO96VtJhscaGaIYcyg8xiCKR+fHuGGi2QUJdPgjSwU3JOZJ87vMwmhIVC5QJMOmADKMXRzKUvjYnOq5oyyYmf6Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2232.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:47:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 13:47:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2 02/10] soc: fsl: qe: Add support for TSA
Thread-Topic: [PATCH v2 02/10] soc: fsl: qe: Add support for TSA
Thread-Index: AQHZIe0/rHHawuyaT0OnpKhqNXssCq6ZQpsA
Date: Wed, 11 Jan 2023 13:47:23 +0000
Message-ID: <7a36f02b-1ba1-b509-4aa0-c5c37a3cb3ef@csgroup.eu>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-3-herve.codina@bootlin.com>
In-Reply-To: <20230106163746.439717-3-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2232:EE_
x-ms-office365-filtering-correlation-id: caee2e2f-c44b-4d8d-390d-08daf3da5df8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PjMW7fi7GjDuaoOQ2d1TNEqMxLtQCIIRGiZLJ4b+0NC+WMBCYaSCE1y+WPO2DcTz/NR6y6u8J0XNbRX8UWQPjWugWyh9BOAhv9oU5cCvceGNVpGh5BPyzXDUqy8Cuf+tO9APgDP9KetksI9HQUH2+nWEkrhKgjzcCT1k2U7NbHJ+U0Dyw9u5M8zcwT7W0V8WMHcaMS1Jut3g7i8ta8OPL9FzrhrNJoVQCytPxrVgZvOt/s8GsUkVXk80OO7uAhK6G8sTLNYuWQ9iJsoiGiDi1vtCRGqdE7irpkSthc4QIVkgibt2GjY/btta8xK5bNNELFT/gKmg2Zajm5b/F2FQwD1H3RKgCmck5ViiD598guV205GkxP3RVy6d8LKkL6dVISiYGYS6p3wLWnbNMWV3R4dJtvmzfHFekATNSp0kBKNHzEaQaihNjCfxBwqXPl8fagnyboLdJUyNhIrq05/J22DSs180WfQY8+U+1IxLIrPplxpVYWSxABrHK7gytTfmzs9+YbFISVxlS+c0KOuLY9j8GY/BqK4WeewxVRGJjgyqYwM3OAp5rRhdO/MeF5uF9PNQkEBQmVsaZjVsOhcTpeZAIyoQ34lx9BcFIq+0bZWM8B1H1FcS7SYVsy3W7TCa5eSrRBVjV+h85vXTYYbfg9pfYKi63TprS7X/aq+5MYTu9Dkiux+TDeM+uuHQEqArPfwU2VvMocM6QI3SmJRKXHzst4rSURIBUAZ0vJ4QTu22h1B+6XU/n8zAA1P/jERVFC3ydCwuN343tQeYqtwJXFM40kWyNZwVWhgQuHDpKRI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(451199015)(8676002)(44832011)(186003)(4744005)(26005)(316002)(71200400001)(5660300002)(6512007)(478600001)(6486002)(86362001)(2616005)(7416002)(41300700001)(31696002)(76116006)(110136005)(54906003)(91956017)(66556008)(66476007)(64756008)(4326008)(66946007)(66446008)(8936002)(36756003)(38070700005)(31686004)(6506007)(122000001)(38100700002)(921005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NlUrWkNya25wRW4reGphc1pZU3k1M25VWWlhYzU5bTNqWTc4RERhODZWeUps?=
 =?utf-8?B?WmZUMkY4dHByZmQ5T0FxdWdLVzF5Vy9md2NzZ3UyM1FvcFVQeUFmNWxjWG56?=
 =?utf-8?B?dkdUWjRzMzZaSXV2WE9XaWp2OTRoMDJyWVRhM3poemdZTUFWVVBHL0RCcTlN?=
 =?utf-8?B?aXVrR1ZaNGtXNnczOHFFN0t3dkFJWVI4WGtoVkl2S2EwN2J1SW9KaHUxaUpo?=
 =?utf-8?B?azQ3eEFYV0lXWkNnc3BMQW5QdVR5MUNhU3MreFNnQTRQR0JYVjJiTHRDM2V5?=
 =?utf-8?B?ZmpRaGNHb3UvOGpiZ2MrVWxMbExFYTRhSFU4UkNnSzVCQ0NYV25tVkoyTWFJ?=
 =?utf-8?B?SVB2WWdXWXBTTlo4ZUsvN0JDaTVpZlU3THR6R2c4UlpFdjRSRUx1b2tNdWdX?=
 =?utf-8?B?QTN0Q3h3dEI4SUZJOWlsNlBEQnZQSG5QU0VvWDZyb1d1Rlp1Vmhpc1dESWNN?=
 =?utf-8?B?ckhtd01UMklMOHBHZmdXUG52NEpFV2RyR0ExRDI1SjVBVklycC80V0drZVlV?=
 =?utf-8?B?THh1djFRZnNkYUlBQis2bVJKR0ZjR0t6eVlUMUp1YXBlakluZE1nT0hhanlC?=
 =?utf-8?B?WDUxTEQrSlcvbHgvVmROYXAwdWx0bnM5MDljQWg4eXBkRlozQWIzQXhkM1N3?=
 =?utf-8?B?cUUyRnhWS2wwSjlKZ0FvWXRRMnpEK1RvUkd2SXQxQTcwQmJMUHFrVWc2blg4?=
 =?utf-8?B?SVVucVRyWE1PUjVSdUU2emhJalloVTZXQlFURzJScHk3TWxHTm52a0ZSbVpZ?=
 =?utf-8?B?WmZla0hteStoSVZ4aVpvaGZMSHZwWWdzVUx0NFc2WWV6WThuL3lZZnU5NktO?=
 =?utf-8?B?WTk1S01tL1dwV3lNRnVTL3BSNi85QXdVMXBrYjRCa2ZTcGpuemVHY291RTBV?=
 =?utf-8?B?SFRGRWkzSFRGYitSNXFYeDZUNXlIQ2NpdmRVOVdiSkt0SHlyQm5qUWs0cEQ0?=
 =?utf-8?B?ZTBGQ1BlRVRtSDJtSHErVllUWitnSExrc1pSb3lKUUF4UVU3SVNGY3NXVXIv?=
 =?utf-8?B?M3Y4NXZzVlFLS0kzOVgwQkVnL3RDUnE4TUtOdE42UDhTSm5POFFsRFE2ZEpP?=
 =?utf-8?B?NGF3dDh5YUhhMXdmem9HM2doNDRJeG1CUnp0QUZOMWhHcFFNOWFTWVh1NFNX?=
 =?utf-8?B?L2hTMC9jb3p2STNCU2swdzhIcTVIeXNRNkpaaCtnNmhialdYaFI1MjFlNDN0?=
 =?utf-8?B?VWV2R1lDYUFERmlOSGlqOWFOSDVXckQ3UUNIMEtMZytDS1JVam5Da1JOMHMw?=
 =?utf-8?B?cll2MGVzdUF3YUk0L2FxdXRJbVNITVJXS1YvVHJIeTBnNC84Rm1IcHFCWjJ1?=
 =?utf-8?B?cXZEZ3NWK0plOHc5U0tpSlpOWjJSYlNaZmFvS3l4ZThFRVgvMUc0VmxES1Nm?=
 =?utf-8?B?L25zRUJMOWNWbEF1ZzA5bWw0bWdPbUM3eFZ5TjJHMXo5QnlmWGkvd0V2UHFv?=
 =?utf-8?B?M0h2N0R4VjdxQ0d4S1ZnUHptRDRiaUR0eDkyUzJTTE1rMmxpTWNLeVpKV3hm?=
 =?utf-8?B?WXB1NTBLUitscUovQjdTbVRoMW0ydm9tN2RxMy9qYjhRSXFKaU0yeHdHaXFn?=
 =?utf-8?B?eEp2TlI3K0MrdlRrSUswaTZSVjlUa3pZM3NqYlBmOUoyRXNnakVsSTZPM2pQ?=
 =?utf-8?B?QzJCUmV3U1k0UzVDVkhkeTJNQ3l0T0ZhMXg1MHovOG10SmpGZjJNRzFkYjRs?=
 =?utf-8?B?c1JmcFMrcWY2SFdpdFRLcHNRYTkvUFZUd1NGVXd2TEhSOFVGQTlCNTgxanJi?=
 =?utf-8?B?bVEvT0xkM25tc3R1bkdOTktIQUNSWWxFNzVQbTN4ZTdyOXdnL21YbDhGSndH?=
 =?utf-8?B?eERPcWg3ZitPTXdXazVyU2hzdTRFN1M2Yms0ZXhPMmhxc3cyTkpuUFg0ZmJZ?=
 =?utf-8?B?UjdldVhqNHBRb2szdi9qVW1jN3R2ZStrZzFWNEc4cmd1ajFad0pYb2FoeElJ?=
 =?utf-8?B?TEluUUpHNmk4UUhJTVFUM1JoN0p1QUQzTWtyREI5M2xUZ012Zmk4bWYxTVpj?=
 =?utf-8?B?Mk02MzFHTndUR29hTmNIUWZKUUluWjdDTFdkdkJwM2w3OFFuZEJmdFlVWWxq?=
 =?utf-8?B?VUd2Zk1GOXZFQW8rYTdIMWZFTm1XUTdoRGY0eXhGNXMrK1FjODBWVWNXaStM?=
 =?utf-8?B?bGNqOFhwWCtSWWJxR0xwTkJBbnFYakljNGUzTDE4T2RXeVVXL3VkdXgxd2R3?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B714BB26E9D49488DC018F143189012@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: caee2e2f-c44b-4d8d-390d-08daf3da5df8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 13:47:23.1158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q01HyBx3ewsDf7oW+99M+OMGucF7UCgzRilJr9rTStSJTGLoFsZx+yLk6vVEE2vDzUA7ZxuErEvhCB77Y82CGLw7/uB+Ovwa6lo1Thn23+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2232
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzAxLzIwMjMgw6AgMTc6MzcsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgVFNBIChUaW1lIFNsb3QgQXNzaWduZXIpIGlzIGF2YWlsYWJsZSBpbiBzb21lDQo+IFBvd2Vy
UVVJQ0MgU29DIHN1Y2ggYXMgdGhlIE1QQzg4NSBvciBNUEM4NjYuDQo+IA0KPiBJdHMgcHVycG9z
ZSBpcyB0byByb3V0ZSBzb21lIFRETSB0aW1lLXNsb3RzIHRvIG90aGVyDQo+IGludGVybmFsIHNl
cmlhbCBjb250cm9sbGVycy4NCg0KSXMgdGhlIHN1YmplY3QgY29ycmVjdCA/IEFzIGZhciBhcyBJ
IHVuZGVyc3RhbmQgdGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgDQpmb3IgdGhlIFRTQSBvbiB0aGUg
Q1BNIChleGFjdGx5IG9uIENQTTEpLCBub3Qgb24gdGhlIFFFLg0KDQpCeSB0aGUgd2F5LCB0aGVy
ZSBhcmUgYWxyZWFkeSBzb21lIGVtYnJ5byBmb3IgaGFuZGxpbmcgVFNBIG9uIFFFIGluIA0KZHJp
dmVycy9zb2MvZnNsL3FlL3FlLXRkbS5jDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENv
ZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpDaHJpc3RvcGhlDQo=
