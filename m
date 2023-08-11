Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC067788A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 09:55:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WQ9/xxxG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMbgC4Vmbz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 17:55:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WQ9/xxxG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMbfJ4Jtwz3c3f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 17:54:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJmPlirpwoK9cXPcjyHtGjA0Cgt8zx/CuIcxN8HUctx5Nq5jh86Daj4C1TmsuDHHWehtFiE73hnxzCI6TBuKHiyZ6sIWpR2wk2Ku+qLJhtTatx89sbrNkoXJe2VVDt1pxa7Etnwn8jhJORXUC47WX/DOOBaQPKGjGHVIWctAKYjzLXnD3oRTe99sGCRGjHZIHq2pcAvlq6UlaCKgOHYEC2zHlRLbWkUvkIU87n8L42EJBUDobsvIM2MMiZdMNST5SMw4DwkVcA29TzMcNOh09EBCrHjHf0eSTEd6OXUvGQFHVILJRgypgQGrQmqoR8QHQFeMbOnj+C+283O2kaMz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faDjWoxaNYpZe8CiyL74RAcsMlLuVqa1/9CYk3zSm6s=;
 b=N9fsgXHbBMLdLlNbEOF5ItvUvB3GLATq2xalCMlBWRr/4VXTANhyMKmIYvkE+tTR2eKRVyk1SQuhO0INowJVTT7zs6VbAg3OKAwm2JNkBqtuOWBD7QbzePn3Wsaf+8Ei99l9QzaKJaWxQVL6MdVO4cByGpkszI/pPmwqgIRsLPlv3DS+lWKdCRn2MwbZoZCz/rpl7dqSsIZsAjUa7CWEQSXLZXKNRXggmAzwUTFFyBA15IdVaeT9wh2mFKqRs64ACwAtstFh23W6PHnyKmTSLVVPOKCwyjBd3cROhPqQAum0NyFEmZKJlP6m0rJ7Mrd5G8My0GHhtVUut2IZI7KmDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faDjWoxaNYpZe8CiyL74RAcsMlLuVqa1/9CYk3zSm6s=;
 b=WQ9/xxxGeDwDTt1uciD/r7S9ZReZlM5d++mupsezittjUD840PDDJ9Hk1iQtlcM8VH343ExflwnfiTze5n6SREybbaWxWY5iW6nZl5xn3/BU2ZAF3cUjhihPoAlWGZkXckYij/hclYTAIP6bbIHLf6U7v62ZMxKgi+6Fd8QCeMKXXx21LxWv0jfIrFldu9u/NJwpvmX7YHTtcZrJqExnuhWd7LedD+RJixhuRNy28ecFp8AexOFy3Y0bwCFjfh7dkLTVz0RGoDUwQ3/x1sjpZ9DCxLlwfWu7nFT0XRzCLvWMdBrsP55fDdpNBxHWUTn0Wz5EXyJ6ZD0FejUZVu2a3w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3371.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:145::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.19; Fri, 11 Aug
 2023 07:53:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 07:53:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jakub Kicinski <kuba@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 00/28] Add support for QMC HDLC, framer infrastruture
 and PEF2256 framer
Thread-Topic: [PATCH v3 00/28] Add support for QMC HDLC, framer infrastruture
 and PEF2256 framer
Thread-Index: AQHZysVV/hkwPsMhiECgp2kpNT03nq/jrocAgAEN3YA=
Date: Fri, 11 Aug 2023 07:53:52 +0000
Message-ID: <05463697-0870-1652-1c47-8f4e0eb10ab7@csgroup.eu>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
 <20230810084758.2adbfeb8@kernel.org>
In-Reply-To: <20230810084758.2adbfeb8@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3371:EE_
x-ms-office365-filtering-correlation-id: a93e9736-3365-42e2-a7ba-08db9a401af1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Q7N+q/CWyUcH/Oyz0rmnjjoN2EtT8TRf2Ifiyq+UrdX9f2ai6kak/7PrASnRqaTq1AyTnFEpno98X9t72fAMziMz4+hTpiUMRncpqD9wcZK6pkV0Gts9RuXj96a8JY84DxBbGtC2ZmAYM0c/GCEL7OVxTtF5nrKAcjJpbvj1UABCz7BwAVUH24dvoavzDFGSvUfJ9tEjfi4S8F+bxzP/cjQ4/LKj/Edzq2qMTiu9d1OfLMYvexZ4g5JcB7Byme5Tloz5RPvbuw/x3yi1A9Y6IHIH6iavoiyta7SKbQvLrlEyfOWMcBmECja9cl2tMiFrm9nzZgalC1/QrzB5uz9NYDQ2H6KYgVcEnIYeA+LBm7fAiOsG+gizyefuqixFvOCK/0CLkYx6lJ796r+vaN0gB1TbispDjVfPb+VF2xWP9C7fvTyEOpVTgiFwPrO/4dzC40UA7QB2dZD+yNshS17wvwPLYGvS/JNi1dLRiiUxscIFMQyjHjDJLShKBAwLwh7lscVUW0Wzux5hM0maXqH4gfLUTNwM+RwfzTZNMCuzkv8e/IQy+kaMgvU2uF6GV/QAS7fLgdC0GDzTz01VIXVJ5acAPIvf3kNua/H7Ang1dBsOQ11G3m+BGQcgh+4UXwXV/915tDyp2Nb7AaKp7XwPw+FOC0hj55QoBSrbD6wgNxePDbR6jYYiY8Xo0lx9ZBWz
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39850400004)(451199021)(1800799006)(186006)(7406005)(31686004)(4744005)(2906002)(44832011)(7416002)(8676002)(8936002)(5660300002)(41300700001)(316002)(66556008)(66946007)(66476007)(66446008)(64756008)(4326008)(76116006)(91956017)(110136005)(6486002)(478600001)(36756003)(71200400001)(6512007)(26005)(2616005)(54906003)(6506007)(122000001)(38100700002)(86362001)(31696002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SnZObk1Ma2cvOTJvV1h0Znl3R1hkTVNLUm1CcDlLbC90b3J4eE9oVEE3UlMw?=
 =?utf-8?B?WVVBWTM2S2w0anZmMEZIa2IvN3ByUWZ2UGFQV0hMQWhud2VFWkZnLzlibWlQ?=
 =?utf-8?B?Y1orTmtROHFWZ0NVcHFaMkRlaG5ReDRPaXB5RHZpelpOZUJuc1dYb2hUVDV1?=
 =?utf-8?B?cEEyYkJuUG4wTkdyNzZDQlJlSS9zdEd5amZhZk81QnNsQjVQc1hMSjdHdS81?=
 =?utf-8?B?c3RQVVNnWDVTTVZrL0NQME9nQUZsVGpaVFhYMkFzeEhROUYwUFlwMldvVlhE?=
 =?utf-8?B?V2c0SW5YZWtPbmpIWFB5cDRLT2YyRnJWa2tQa0x1eDMvVVFxeGVTa1JnS1Ni?=
 =?utf-8?B?SkFUWHJnZ2tWWmRhOEtab01tMXQwTi9ZV1N5Mkx3NGFQaXdqTjUwRzJYSGRj?=
 =?utf-8?B?VEVKMGRlWncrR3Z2MElFR3hIb3VpUGdJR3A3K2svN2dJTk5xanRucGdqblhW?=
 =?utf-8?B?ajY1Y1loNFdLVm9mNnFjRkl6Z0lZSHRmeHdPMzE3ckY0SGdxakIxUG1lSU1T?=
 =?utf-8?B?eG5wMW00RVRVbmZKb0QybzJEK3hCTVBxRlVHc3VtbFd0Tnk0UFhlQTVzc0xO?=
 =?utf-8?B?eDNSTkg1NXF6aVduSzVDYmF1a2F1RzVTcXJrNVdGRUFYQVovSHI5ekhaTXN1?=
 =?utf-8?B?QXE3VE1hOFFtODAxTkl5SVBFVk1yWkxHVzdjNWVjaGVhbFd1Rm5IZlI4VEkr?=
 =?utf-8?B?VE55NUljVjM1bmg2Nmh6S3NBOW5WbnBRcHdTYllaWVQ2TnAzQlFwU2lub0c1?=
 =?utf-8?B?eUlRdXBjOVNISXdDdzdBejBEUlhoc0JMVzFadXJJN1NGOEZkVXRsak5la2xV?=
 =?utf-8?B?Qkt6QWFKVHRhakxHOFhuaHBMR1NzQkkyRzYwZFJpUVhzTmhlWERFWkVQaDdL?=
 =?utf-8?B?a3U3eFZWRHBXV0o5b3lITVEwRW90VXlIeTVqWlV4cDRKU0dYSFhuY2J0Znc5?=
 =?utf-8?B?TjZvK3ZkeEdNQ2pySGVpbjhFVElkWlhsZlJHVU9BNlg2bnZkOG9rc3EzeFRo?=
 =?utf-8?B?aCs5MVNyVkpCdDA3ZnFpNDNpckNsSWJ2QmhJKytaaVlPL0FNNkJVVXVhWlJy?=
 =?utf-8?B?aVRJTnlrbTM2NFpkV3BrMmtyU0xWS3N2SFBUcGlwQUVUbWw3eEVoOFdEb05Y?=
 =?utf-8?B?cEw3bncxejNuVTljeE4wWnVYandWbjIycUZnbDBkMmJ4TjNtYVpWSUFjdVFX?=
 =?utf-8?B?bjVPS0NOWHhUeWgzZ3V1ZWQzUldKYjNibStYNkM4elBRTFU4YzJqZURvQVpv?=
 =?utf-8?B?MVVYQnk0bkJsWWdvdzZzSCtmRjlhWGVFSTBOZUl4dFpsaUJDTFBvMGs5YTB2?=
 =?utf-8?B?L09zbWdGUnFCQ3FFeXgxd2poNEc2eDBWbUlVMlRMdlZrOXcyWkp6R0UxU090?=
 =?utf-8?B?V3BDQkc3QXArUStMNXh2a0V1MzV4cWloYzVDdHZhVEZNQVNsdGczMXA0bUR2?=
 =?utf-8?B?Zk5uTmdOekUzbHhqL2tQNjNnZWsweHo4a0tISHovcEUvZmZDSDFDbTVVZ2sv?=
 =?utf-8?B?Vk1BcGQ2NXVpZzFFcVk2dDhMMGJOWG5JK2tGMGdrUWFId1lQVWg5QVE5OUJi?=
 =?utf-8?B?bXlkcCthK2RkZ0doUE1tS2FiazhzQVNHNVd4R0wrRm1IcjFmZXBBay9ONVkw?=
 =?utf-8?B?NlE1SGhiUjhBL082WSt6VlRnNVhMTDJBcFhhS01aS3cxeTluRnhZUHNpQlNv?=
 =?utf-8?B?R3dBREY2UkYyeldIS0pPcThMNDl5bFRrMmNoTXkxR1BDRkN0azJKZW1ocjY1?=
 =?utf-8?B?NFpsVStJc295Z1RJOEREZlRhQlgrNWxQR1prSkF4NTMxcUhScEkyeVJialZ6?=
 =?utf-8?B?K3g4RmYrZWwvWFIrZmIzMURoV1o0cHBzbS81NXhRMnVoZm91ZWpYZE9vODEz?=
 =?utf-8?B?L01MNmR5NS9QNFUrR1RGSzVidzRFMU5uV2xvMjhjUlFyd3FSUENLWXFUZ2V3?=
 =?utf-8?B?aitJbVN1VG41NVVFUTM2UjYxYWZUbVQwb2FJb2pqZ3Z0Wnh0Rkw3b05IZHU4?=
 =?utf-8?B?MVluUDY4UGhkWXc0NlY4bTBwcnB3RG9TYmxibFl1eHp3SVpEdm1xaHgwVndX?=
 =?utf-8?B?THBaS2FCa2lUdHg4amlhZmdabDExQk01N0xVZGVtZnk5ZngyOFV2cU9PeHdE?=
 =?utf-8?B?ZngvUVh0UmlYT2pFeTFJRElNTnh2WS9uVjl0UGpPckswejlROWdkL01qZEow?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C256BB6D02BA5479E2299F49313DFC4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a93e9736-3365-42e2-a7ba-08db9a401af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 07:53:52.3411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZI28Y/sA9VlvSh2T6u+8/WpvJFynzSReOYZMIQMQ8GRnn/5geXfq26M/msEGZLZzmez+qdhOPNCT45cPkvpAKBGbioJfXF/O3b5PkEVAVhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3371
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
Cc: Andrew Lunn <andrew@lunn.ch>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Randy Dunlap <rdunlap@infradead
 .org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA4LzIwMjMgw6AgMTc6NDcsIEpha3ViIEtpY2luc2tpIGEgw6ljcml0wqA6DQo+
IE9uIFdlZCwgIDkgQXVnIDIwMjMgMTU6Mjc6MjcgKzAyMDAgSGVydmUgQ29kaW5hIHdyb3RlOg0K
Pj4gVGhlIHNlcmllcyBjb250YWlucyB0aGUgZnVsbCBzdG9yeSBhbmQgZGV0YWlsZWQgbW9kaWZp
Y2F0aW9ucy4NCj4+IElmIG5lZWRlZCwgdGhlIHNlcmllcyBjYW4gYmUgc3BsaXQgYW5kL29yIGNv
bW1taXRzIGNhbiBiZSBzcXVhc2hlZC4NCj4+IExldCBtZSBrbm93Lg0KPiANCj4gQXJlIHRoZXJl
IGFueSBkZXBlbmRlbmNpZXMgaW4gb25lIG9mIHRoZSAtbmV4dCB0cmVlcz8NCj4gQXMgaXQgdGhl
IHNlcmllcyBkb2Vzbid0IHNlZW0gdG8gYnVpbGQgb24gdG9wIG9mIG5ldC1uZXh0DQo+IHdpdGgg
YWxsbW9kY29uZmlnLg0KDQpBcyBmYXIgYXMgSSBrbm93IHRoZXJlIGFyZSBub3QgZGVwZW5kZW5j
aWVzLCB0aGlzIHNlcmllcyB3YXMgdGVzdHMgb24gDQp0b3Agb2YgNi41LXJjMi4NCg0KSG93ZXZl
ciBpdCBsb29rcyBsaWtlIGl0IGhhcyBuZXZlciBiZWVuIGJ1aWx0IHdpdGggQ09ORklHX01PRFVM
RVMgDQplbmFibGVkLiBBcyBIZXJ2w6kgaXMgQUZLIGF0IHRoZSBtb21lbnQsIEknbGwgc2VlIGlm
IEkgY2FuIGdpdmUgaXQgYSBmaXguDQoNCkNocmlzdG9waGUNCg==
