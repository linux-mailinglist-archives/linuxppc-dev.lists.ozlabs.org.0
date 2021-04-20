Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8D365A77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:48:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPlPb2GgTz2ypn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:48:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Npa9VTfD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.74; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=yibin.gong@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=Npa9VTfD; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150074.outbound.protection.outlook.com [40.107.15.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPlP31Hsjz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 23:47:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMHQhKtE8styA6P6FRmgqqk+JSGnq0LcYSx+KFnPIMuHiOzOCLi+qJqwL7YT9LW2AW3DcAhCwV8qaWAAHG17JZWrbprOFRWlSYfn+vta9PyjEgQZuZEVNIJ+NtS6oXDNGr8ULIj3whwHo+jvBJWU0BNBZMBAjGm7KFuw8rZeHI+wfNVuMLUU5l+zAWfRQExS3Q2Phmk7wqNP062WIGvInznrbE85FtMnmQZN7jmvEILS/O2jNfA3Bu75tOnlrde3DAtNbKMgZneFBzqKHfz+BatiQ7pL9Yq3McRpJ9et1UPIyndrwT7OnDbKrWeK78gLYVdGPGKvgbppB//lKRwn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ6KGnwETtXqo3Zj2BWjcR5g5uaFipNFt1YQNdoQloA=;
 b=Y7nn/t2XpuBmrGzYzpE9lws4wEM9Q8NWdTckYymvJaxGLAkIEJS5qdkpFEm/lUr0NocIY2IFTg6vyvsWzpEo8rSQGS4k1zBF1V+0DQZSwg1YuXKL0Y9dnT3uvyLmcwwNsaNbt7zerUNmCcij60Tx+lWfhk4L1l+d2dFNSwDJFpbeVLDOdzsZfNQh6tUeEiMwE2xm+2Vgp+Rs3eX/QM2+1vUQ2E1ApAbKR2fUhUd/hoH4UlA2JdbUZsgxBKGiFPY/HKTx/Nj+A7qSKYcbPamG3MEoJtAdKC5Gg8wI33APyl7JJEHoKxupYxJbcu1EV5FGGTuFGagwOncDB/oH3phrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ6KGnwETtXqo3Zj2BWjcR5g5uaFipNFt1YQNdoQloA=;
 b=Npa9VTfDJO9W8jZvLv0k0n2IZbn3zateHVoC5ziwLdENIeuYO44ZEdJUrqln1R9m4+X8rbjKx2C1rNNFusIot+Joi4WMrQNZ33jVHfHqrotjbPDjp4fs9gM0bPdbJEQ0gS1CJqJdzKk7C0ZGSz0Nq/Vn6XWN4AtoSHo6P+wPTO0=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (2603:10a6:803:119::15)
 by VI1PR0401MB2510.eurprd04.prod.outlook.com (2603:10a6:800:54::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 13:47:25 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::e8e2:7756:13bc:2cb3]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::e8e2:7756:13bc:2cb3%7]) with mapi id 15.20.3999.037; Tue, 20 Apr 2021
 13:47:25 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Shengjiu Wang
 <shengjiu.wang@gmail.com>
Subject: RE: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
Thread-Topic: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in
 probe
Thread-Index: AQHWLcMcvbp0uyGgYk605EKKtgH/8aivLYuAgAF2HACAABbKAIIDgX+QgAHvdICAAJqQwIAG4DOAgAHNh+A=
Date: Tue, 20 Apr 2021 13:47:25 +0000
Message-ID: <VE1PR04MB6638659EC8557D01861042B189489@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
 <VE1PR04MB6638EE85485768351755557B89499@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <97262466d537402ad4032098ef277d6d47734f1f.camel@pengutronix.de>
In-Reply-To: <97262466d537402ad4032098ef277d6d47734f1f.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.237.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 596efe60-671e-4020-1206-08d90402d4cb
x-ms-traffictypediagnostic: VI1PR0401MB2510:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0401MB2510CBE1A01B992C3B02C8B589489@VI1PR0401MB2510.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zSz57UANRbPIzNQ5dkH/pGIA7dGulVjEpoWd6I6r0r6/dYR0zvfAZRha4Wsoj/tKyOasofpOF9ZgGg/ilbqOjRdIAUfkEz+oTj1v96LC6tH8pfJwQQTUjxjuut7W4E3vgSj0e3JCpgjmcP060W7RzRAdWWWOzJnEoYFUr1RpO8DYi39jeLAA5jHvPwwZn/Kc8lLo+0OW/K35wsLNEEgiFMdJaiEO3mBVeUfZtw3BothccAFKzY5AAMZ9p4lAdS5TC6uI4nfCW9zxprdlIt4gg8iaMHcvCD8EnkRsNm/V1SgUdxrr2684Bdk4u96xKHuF+nQIXCq60Agib9VgDp9Hf7BAxwS8Yy1B086qOylfcmEUcTKFp2d9Hh8bb7A4rWpzYxYaN+/kJsUr77kw7yFo11FeF7Nj76JR8c8SEPoHt64TMqtyaYEUS5EHvwKOUnJbDYSjkjIIk5zAs2rwiyemJxudZcPFqeKX1qFiC5YwSqx5hfmkquoL4yD13uj/QX/5yqZBIDMbUqppQZ63SYcjOtnrZ4B/RXxcKUU4ikIsPCYKEH0nwKwX7J4kcB6CkmX/CIoCba8xaVwyM3pYUvVxbK6XTzydoDniVAc58E7lAExwhrHq2NGlt86AVjSYQDBrwM8mvdOOvM7dqCmq6kpv9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6638.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(26005)(7696005)(186003)(8936002)(122000001)(4326008)(9686003)(52536014)(2906002)(316002)(38100700002)(55016002)(5660300002)(53546011)(478600001)(54906003)(7416002)(71200400001)(66556008)(66446008)(66476007)(33656002)(64756008)(76116006)(66946007)(83380400001)(6506007)(86362001)(8676002)(110136005)(98474003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SUtiUnplR1lSNjNuNURuTUQ4ZTg4MlN1aDZCelpxSjcxMGhEVDRocmJSWkpX?=
 =?utf-8?B?QlZMcjZsS0U5Vmo3TmpxMEZnWXJwekhkdHVMTXBXRGFoSVdSQUJibVAwZ2l1?=
 =?utf-8?B?V0pJeC9GN2w2YjBYd204dkVOTnFJZ2JoM0ovR3JybWFNcTF2NVZGb2Q5a3E4?=
 =?utf-8?B?YzNiUGVxeG9UdFk5cDZtenAvdk0zdktYQU5CRkpzM1lUWkxwRXJBeHMzNko1?=
 =?utf-8?B?OFRrcGRGZ3dqblErc3BGZUdRMldYRzNnUmlQbWdwNkxMWTVKWmE4TndxTU41?=
 =?utf-8?B?QWhGL0Z4aXQ3Um92K0hvaDE2MHp2TjU5bW9DcXVRektkalZFcEkvclpHNGpE?=
 =?utf-8?B?RmtVZk5XQnpNb20wVnpmbXg1REF3cUpRZktsTGF0anJ5bjR1dWpXWGN3VmFj?=
 =?utf-8?B?NlJORWFWMWZOTzd4NXNpUUZtaU1icmExYjlxMWRBUjB3em13cXpxTm50d0Q3?=
 =?utf-8?B?QzBOajFOY053UWlrSWZsUks1RHhWOEV5YVhlcFVkbis0SG8wTzFENEVlNFda?=
 =?utf-8?B?eUVSdGtLcld3OXVjNVlodTZ1VWVuZGZtdldKaW9BVXdUQ1ZMa0FtM01MUVNW?=
 =?utf-8?B?SlpDd0tyNURLcWtzcDlQWVdETTBNZmxNdDQ2WkM1ZFRMNkoyTnFHeUZTUGhL?=
 =?utf-8?B?YXI3clZNai90eGNnbGtKdVVHYTV4anZrUDBDWXV5anR5QVdOdkNoSkQvdVFY?=
 =?utf-8?B?Y00xaUlpd09QVC9rSEdOVFFGbWNMWmZtWi9FeFpDN1I5UEwzdHBQS1pnaW5E?=
 =?utf-8?B?ZGhuOWt0THFtL3FhcVF3ZnBLSWVCbWpEcVdqdmp3dTJpOG9ib0d1Sk9xbFJp?=
 =?utf-8?B?N2xqeHlQRXhrR0NZT0RsdnhSYVRQcSttVVF3Ujg1NlZQSDZJU1FYc3BxYllX?=
 =?utf-8?B?MS9wZlczb09jN2VuVFB1L3czZzVKNkZBdUV4WHRvR2VYN3FJZVI5N2o2Z2pF?=
 =?utf-8?B?RWE5VXZHYU1CZXFRMWdOOUdDUHhVSllhMjlWVXczVUJ5SEY4MXpXL0RxQkti?=
 =?utf-8?B?azliM0ljd011dlBCeGJmT3NPOTRIVHdKQlFRemdWZzU4WUIweFpCWWVabFVa?=
 =?utf-8?B?SFE1R2NHYk5xYW8rVHhEeEc3TjE1cWwvQ0tQNXBVdHdZbzdBMzg5Q1NscTBL?=
 =?utf-8?B?bEtwVWJIb1FKMzlsbktyb3I2eDB1UytBbDJ5UnByekdCRTJodXJma3JMVVBJ?=
 =?utf-8?B?ZGtXUnE4SnZMejdsWTdhWGhDQklaODlBN2NmTndTYUhIZHBQZFNra3NaeThk?=
 =?utf-8?B?NVI2THJWMkVleXJSTEVjREZYT01FNHZLY1VwckNQRWtENVpCdFUwUEZqS1Fi?=
 =?utf-8?B?WkVod3g3a0IxQ1NwWDRHeTN4a2J5enZGbHNWbk9qNEl5RkV4bVVSNHRGT016?=
 =?utf-8?B?Y3dIaHUzNlQrYVpWNi93dmFtbnU4ZVI0RnJIOWFJRTN6SFJwUVBKZ2hLU2I1?=
 =?utf-8?B?clB5cEE3RVBKNTBUem4wNDM2YXRBaUF6MHpaOWxSZ0dNVkFiSmV0a0JFRS8w?=
 =?utf-8?B?TU04Zmx2RTkrVW1OcnRRY1ZZanAwY2JQYUtyQUVIaTEvZlFpUWp3YlN6eTFI?=
 =?utf-8?B?UTlLdkxlQ0l3RmNCZEI2SDllSUJmRXM1VHhrdVhNUTRXU3lnaUhBSElxTnRW?=
 =?utf-8?B?UGZaN2xjZmZ3b0Vxam1wOHRYNWk4VXBrekMwUHdiMG84R3lkNU1kbGFlNXNR?=
 =?utf-8?B?RFN0MFo2MitDbUtxeGpKWEZMYXhDRkU5cFo3a0QrYWg4K29wYkxQWHFRY3p3?=
 =?utf-8?Q?W1LcA1nr+VzolL9G3cn0oDvpLoQRfT2UhddjiIK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6638.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596efe60-671e-4020-1206-08d90402d4cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 13:47:25.4710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PEwvmWY8R2xaF4PYrOvC6F//OMSM3DqGCJ58WbFqDL4pnL4CXgQXwAaUU1XDS2TG169VKAhJuEWgat0d7YDo4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2510
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
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "perex@perex.cz" <perex@perex.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMjAyMS8wNC8xOSAxNzo0NiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4g
d3JvdGU6DQo+IEFtIE1vbnRhZywgZGVtIDE5LjA0LjIwMjEgdW0gMDc6MTcgKzAwMDAgc2Nocmll
YiBSb2JpbiBHb25nOg0KPiA+IEhpIEx1Y2FzLA0KPiA+DQo+ID4gT24gMjAyMS8wNC8xNCBMdWNh
cyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4gd3JvdGU6DQo+ID4gPiBIaSBSb2JpbiwN
Cj4gPiA+DQo+ID4gPiBBbSBNaXR0d29jaCwgZGVtIDE0LjA0LjIwMjEgdW0gMTQ6MzMgKzAwMDAg
c2NocmllYiBSb2JpbiBHb25nOg0KPiA+ID4gPiBPbiAyMDIwLzA1LzIwIDE3OjQzIEx1Y2FzIFN0
YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4gPiA+ID4gPiBBbSBNaXR0d29j
aCwgZGVuIDIwLjA1LjIwMjAsIDE2OjIwICswODAwIHNjaHJpZWIgU2hlbmdqaXUgV2FuZzoNCj4g
PiA+ID4gPiA+IEhpDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gVHVlLCBNYXkgMTksIDIw
MjAgYXQgNjowNCBQTSBMdWNhcyBTdGFjaA0KPiA+ID4gPiA+ID4gPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+DQo+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+IEFtIERpZW5zdGFnLCBkZW4g
MTkuMDUuMjAyMCwgMTc6NDEgKzA4MDAgc2NocmllYiBTaGVuZ2ppdSBXYW5nOg0KPiA+ID4gPiA+
ID4gPiA+IFRoZXJlIGFyZSB0d28gcmVxdWlyZW1lbnRzIHRoYXQgd2UgbmVlZCB0byBtb3ZlIHRo
ZQ0KPiA+ID4gPiA+ID4gPiA+IHJlcXVlc3Qgb2YgZG1hIGNoYW5uZWwgZnJvbSBwcm9iZSB0byBv
cGVuLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBIb3cgZG8geW91IGhhbmRsZSAtRVBS
T0JFX0RFRkVSIHJldHVybiBjb2RlIGZyb20gdGhlIGNoYW5uZWwNCj4gPiA+ID4gPiA+ID4gcmVx
dWVzdCBpZiB5b3UgZG9uJ3QgZG8gaXQgaW4gcHJvYmU/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gSSB1c2UgdGhlIGRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWwgb3IgZG1hX3JlcXVlc3RfY2hh
bm5lbA0KPiA+ID4gPiA+ID4gaW5zdGVhZCBvZiBkbWFlbmdpbmVfcGNtX3JlcXVlc3RfY2hhbl9v
Zi4gc28gdGhlcmUgc2hvdWxkIGJlDQo+ID4gPiA+ID4gPiBub3QgLUVQUk9CRV9ERUZFUiByZXR1
cm4gY29kZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgaXMgYSBwcmV0dHkgd2VhayBhcmd1
bWVudC4gVGhlIGRtYWVuZ2luZSBkZXZpY2UgbWlnaHQgcHJvYmUNCj4gPiA+ID4gPiBhZnRlciB5
b3UgdHJ5IHRvIGdldCB0aGUgY2hhbm5lbC4gVXNpbmcgYSBmdW5jdGlvbiB0byByZXF1ZXN0DQo+
ID4gPiA+ID4gdGhlIGNoYW5uZWwgdGhhdCBkb2Vzbid0IGFsbG93IHlvdSB0byBoYW5kbGUgcHJv
YmUgZGVmZXJyYWwgaXMNCj4gPiA+ID4gPiBJTUhPIGEgYnVnIGFuZCBzaG91bGQgYmUgZml4ZWQs
IGluc3RlYWQgb2YgYnVpbGRpbmcgZXZlbiBtb3JlDQo+ID4gPiA+ID4gYXNzdW1wdGlvbnMgb24g
dG9wDQo+ID4gPiBvZiBpdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IC0gV2hlbiBkbWEg
ZGV2aWNlIGJpbmRzIHdpdGggcG93ZXItZG9tYWlucywgdGhlIHBvd2VyIHdpbGwNCj4gPiA+ID4g
PiA+ID4gPiBiZSBlbmFibGVkIHdoZW4gd2UgcmVxdWVzdCBkbWEgY2hhbm5lbC4gSWYgdGhlIHJl
cXVlc3Qgb2YNCj4gPiA+ID4gPiA+ID4gPiBkbWEgY2hhbm5lbCBoYXBwZW4gb24gcHJvYmUsIHRo
ZW4gdGhlIHBvd2VyLWRvbWFpbnMgd2lsbA0KPiA+ID4gPiA+ID4gPiA+IGJlIGFsd2F5cyBlbmFi
bGVkIGFmdGVyIGtlcm5lbCBib290IHVwLCAgd2hpY2ggaXMgbm90IGdvb2QNCj4gPiA+ID4gPiA+
ID4gPiBmb3IgcG93ZXIgc2F2aW5nLCAgc28gd2UgbmVlZCB0byBtb3ZlIHRoZSByZXF1ZXN0IG9m
IGRtYQ0KPiA+ID4gPiA+ID4gPiA+IGNoYW5uZWwgdG8gLm9wZW4oKTsNCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gVGhpcyBpcyBjZXJ0YWlubHkgc29tZXRoaW5nIHdoaWNoIGNvdWxkIGJl
IGZpeGVkIGluIHRoZQ0KPiA+ID4gPiA+ID4gPiBkbWFlbmdpbmUgZHJpdmVyLg0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IERtYSBkcml2ZXIgYWx3YXlzIGNhbGwgdGhlIHBtX3J1bnRpbWVfZ2V0
X3N5bmMgaW4NCj4gPiA+ID4gPiA+IGRldmljZV9hbGxvY19jaGFuX3Jlc291cmNlcywgdGhlIGRl
dmljZV9hbGxvY19jaGFuX3Jlc291cmNlcw0KPiA+ID4gPiA+ID4gaXMgY2FsbGVkIHdoZW4gY2hh
bm5lbCBpcyByZXF1ZXN0ZWQuIHNvIHBvd2VyIGlzIGVuYWJsZWQgb24NCj4gPiA+ID4gPiA+IGNo
YW5uZWwNCj4gPiA+IHJlcXVlc3QuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTbyB3aHkgY2FuJ3Qg
eW91IGZpeCB0aGUgZG1hZW5naW5lIGRyaXZlciB0byBkbyB0aGF0IFJQTSBjYWxsIGF0DQo+ID4g
PiA+ID4gYSBsYXRlciB0aW1lIHdoZW4gdGhlIGNoYW5uZWwgaXMgYWN0dWFsbHkgZ29pbmcgdG8g
YmUgdXNlZD8gVGhpcw0KPiA+ID4gPiA+IHdpbGwgYWxsb3cgZnVydGhlciBwb3dlciBzYXZpbmdz
IHdpdGggb3RoZXIgc2xhdmUgZGV2aWNlcyB0aGFuIHRoZSBhdWRpbw0KPiBQQ00uDQo+ID4gPiA+
IEhpIEx1Y2FzLA0KPiA+ID4gPiDCoMKgVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIEkgaGF2
ZSB0cmllZCB0byBpbXBsZW1lbnQgcnVudGltZQ0KPiA+ID4gPiBhdXRvc3VzcGVuZCBpbiBmc2wt
ZWRtYSBkcml2ZXIgb24gaS5teDhxbS9xeHAgd2l0aCBkZWxheSB0aW1lICgyDQo+ID4gPiA+IHNl
YykgZm9yIHRoaXMgZmVhdHVyZSBhcyBiZWxvdyAob3IgeW91IGNhbiByZWZlciB0bw0KPiA+ID4g
PiBkcml2ZXJzL2RtYS9xY29tL2hpZG1hLmMpLCBhbmQgcG1fcnVudGltZV9nZXRfc3luYy8NCj4g
PiA+ID4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQgaW4gYWxsIGRtYWVuZ2luZSBkcml2ZXIg
aW50ZXJmYWNlIGxpa2UNCj4gPiA+ID4gZGV2aWNlX2FsbG9jX2NoYW5fcmVzb3VyY2VzL2Rldmlj
ZV9wcmVwX3NsYXZlX3NnL2RldmljZV9wcmVwX2RtYV9jDQo+ID4gPiA+IHljbGkNCj4gPiA+ID4g
Yy8NCj4gPiA+ID4gZGV2aWNlX3R4X3N0YXR1cy4uLg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBtX3J1bnRpbWVfdXNlX2F1dG9zdXNw
ZW5kKGZzbF9jaGFuLT5kZXYpOw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KGZzbF9jaGFuLT4NCj4gZGV2LA0K
PiA+ID4gMjAwMCk7DQo+ID4gPiA+DQo+ID4gPiA+IFRoYXQgY291bGQgcmVzb2x2ZSB0aGlzIGF1
ZGlvIGNhc2Ugc2luY2UgdGhlIGF1dG9zdXNwZW5kIGNvdWxkDQo+ID4gPiA+IHN1c3BlbmQgcnVu
dGltZSBhZnRlcg0KPiA+ID4gPiAyIHNlY29uZHMgaWYgdGhlcmUgaXMgbm8gZnVydGhlciBkbWEg
dHJhbnNmZXIgYnV0IG9ubHkgY2hhbm5lbA0KPiA+ID4gcmVxdWVzdChkZXZpY2VfYWxsb2NfY2hh
bl9yZXNvdXJjZXMpLg0KPiA+ID4gPiBCdXQgdW5mb3J0dW5hdGVseSwgaXQgY2F1c2UgYW5vdGhl
ciBpc3N1ZS4gQXMgeW91IGtub3csIG9uIG91cg0KPiA+ID4gPiBpLm14OHFtL3F4cCwgcG93ZXIg
ZG9tYWluIGRvbmUgYnkgc2Nmdw0KPiA+ID4gPiAoZHJpdmVycy9maXJtd2FyZS9pbXgvc2N1LXBk
LmMpDQo+ID4gPiBvdmVyIG1haWxib3g6DQo+ID4gPiA+IMKgaW14X3NjX3BkX3Bvd2VyKCktPmlt
eF9zY3VfY2FsbF9ycGMoKS0+DQo+ID4gPiA+IGlteF9zY3VfaXBjX3dyaXRlKCktPm1ib3hfc2Vu
ZF9tZXNzYWdlKCkNCj4gPiA+ID4gd2hpY2ggbWVhbnMgaGF2ZSB0byAnd2FpdHMgZm9yIGNvbXBs
ZXRpb24nLCBtZWFud2hpbGUsIHNvbWUgZHJpdmVyDQo+ID4gPiA+IGxpa2UgdHR5IHdpbGwgY2Fs
bCBkbWFlbmdpbmUgaW50ZXJmYWNlcyBpbiBub24tYXRvbWljIGNhc2UgYXMNCj4gPiA+ID4gYmVs
b3csDQo+ID4gPiA+DQo+ID4gPiA+IHN0YXRpYyBpbnQgdWFydF93cml0ZShzdHJ1Y3QgdHR5X3N0
cnVjdCAqdHR5LCBjb25zdCB1bnNpZ25lZCBjaGFyDQo+ID4gPiA+ICpidWYsIGludCBjb3VudCkg
ew0KPiA+ID4gPiDCoMKgwqAuLi4uLi4uDQo+ID4gPiA+IAkgICAgcG9ydCA9IHVhcnRfcG9ydF9s
b2NrKHN0YXRlLCBmbGFncyk7DQo+ID4gPiA+IMKgwqDCoC4uLi4uLg0KPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgX191YXJ0X3N0YXJ0KHR0eSk7ICAvL2NhbGwNCj4gc3RhcnRfdHgoKS0+ZG1hZW5n
aW5lX3ByZXBfc2xhdmVfc2cuLi4NCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHVhcnRfcG9ydF91
bmxvY2socG9ydCwgZmxhZ3MpOw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsN
Cj4gPiA+ID4gfQ0KPiA+ID4gPg0KPiA+ID4gPiBUaHVzIGRtYSBydW50aW1lIHJlc3VtZSBtYXkg
aGFwcGVuIGluIHRoYXQgdGltaW5nIHdpbmRvdyBhbmQgY2F1c2UNCj4gPiA+IGtlcm5lbCBhbGFy
bS4NCj4gPiA+ID4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhlcmUgYXJlIHNpbWlsYXIgbGltaXRh
dGlvbnMgb24gb3RoZXIgZHJpdmVyDQo+ID4gPiA+IHN1YnN5c3RlbS4gQnV0IGZvciBtZSwgSXQg
bG9va3MgbGlrZSB0aGUgb25seSB3YXkgdG8gcmVzb2x2ZSB0aGUNCj4gPiA+ID4gY29udHJhZGlj
dGlvbiBiZXR3ZWVuIHR0eSBhbmQgc2N1LXBkIChoYXJkd2FyZSBsaW1pdGF0aW9uIG9uDQo+ID4g
PiA+IGkubXg4cW0vcXhwKSBpcyB0byBnaXZlIHVwIGF1dG9zdXNwZW5kIGFuZCBrZWVwDQo+ID4g
PiA+IHBtX3J1bnRpbWVfZ2V0X3N5bmMNCj4gPiA+IG9ubHkgaW4gZGV2aWNlX2FsbG9jX2NoYW5f
cmVzb3VyY2VzIGJlY2F1c2UgcmVxdWVzdCBjaGFubmVsIGlzIGENCj4gPiA+IHNhZmUgbm9uLWF0
b21pYyBwaGFzZS4NCj4gPiA+ID4gRG8geW91IGhhdmUgYW55IGlkZWE/IFRoYW5rcyBpbiBhZHZh
bmNlLg0KPiA+ID4NCj4gPiA+IElmIHlvdSBsb29rIGNsb3NlbHkgYXQgdGhlIGRyaXZlciB5b3Ug
dXNlZCBhcyBhbiBleGFtcGxlIChoaWRtYS5jKQ0KPiA+ID4gaXQgbG9va3MgbGlrZSB0aGVyZSBp
cyBhbHJlYWR5IHNvbWV0aGluZyBpbiB0aGVyZSwgd2hpY2ggbG9va3MgdmVyeQ0KPiA+ID4gbXVj
aCBsaWtlIHdoYXQgeW91IG5lZWQNCj4gPiA+IGhlcmU6DQo+ID4gPg0KPiA+ID4gSW4gaGlkbWFf
aXNzdWVfcGVuZGluZygpIHRoZSBkcml2ZXIgdHJpZXMgdG8gZ2V0IHRoZSBkZXZpY2UgdG8gcnVu
dGltZQ0KPiByZXN1bWUuDQo+ID4gPiBJZiB0aGlzIGRvZXNuJ3Qgd29yaywgbWF5YmUgZHVlIHRv
IHRoZSBwb3dlciBkb21haW4gY29kZSBub3QgYmVpbmcNCj4gPiA+IGFibGUgdG8gYmUgY2FsbGVk
IGluIGF0b21pYyBjb250ZXh0LCB0aGUgYWN0dWFsIHdvcmsgb2Ygd2FraW5nIHVwDQo+ID4gPiB0
aGUgZG1hIGhhcmR3YXJlIGFuZCBpc3N1aW5nIHRoZSBkZXNjcmlwdG9yIGlzIHNodW50ZWQgdG8g
YSB0YXNrbGV0Lg0KPiA+ID4NCj4gPiA+IElmIEknbSByZWFkaW5nIHRoaXMgcmlnaHQsIHRoaXMg
aXMgZXhhY3RseSB3aGF0IHlvdSBuZWVkIGhlcmUgdG8gYmUNCj4gPiA+IGFibGUgdG8gY2FsbCB0
aGUgZG1hZW5naW5lIGNvZGUgZnJvbSBhdG9taWMgY29udGV4dDogdHJ5IHRoZSBycG0gZ2V0DQo+
ID4gPiBhbmQgaXNzdWUgaW1tZWRpYXRlbHkgd2hlbiBwb3NzaWJsZSwgb3RoZXJ3aXNlIHNodW50
IHRoZSB3b3JrIHRvIGENCj4gPiA+IG5vbi0gYXRvbWljIGNvbnRleHQgd2hlcmUgeW91IGNhbiBk
ZWFsIHdpdGggdGhlIHJlcXVpcmVtZW50cyBvZiBzY3UtcGQuDQo+ID4gWWVzLCBJIGNhbiBzY2hl
ZHVsZV93b3JrIHRvIHdvcmtlciB0byBydW50aW1lIHJlc3VtZSBlZG1hIGNoYW5uZWwgYnkNCj4g
Y2FsbGluZyBzY3UtcGQuDQo+ID4gQnV0IHRoYXQgbWVhbnMgYWxsIGRtYWVuZ2luZSBpbnRlcmZh
Y2VzIHNob3VsZCBiZSB0YWtlbiBjYXJlLCBub3Qgb25seQ0KPiA+IGlzc3VlX3BlbmRpbmcoKSBi
dXQgYWxzbw0KPiA+IGRtYWVuZ2luZV90ZXJtaW5hdGVfYWxsKCkvZG1hZW5naW5lX3BhdXNlKCkv
ZG1hZW5naW5lX3Jlc3VtZSgpLw0KPiA+IGRtYWVuZ2luZV90eF9zdGF0dXMoKS4gTm90IHN1cmUg
d2h5IGhpZG1hIG9ubHkgdGFrZSBjYXJlDQo+ID4gaXNzdWVfcGVuZGluZy4gTWF5YmUgdGhlaXIg
dXNlciBjYXNlIGlzIGp1c3QgZm9yIG1lbWNweS9tZW1zZXQgc28gdGhhdA0KPiA+IG5vIGZ1cnRo
ZXIgY29tcGxpY2F0ZSBjYXNlIGFzIEFMU0Egb3IgVFRZLg0KPiA+IEJlc2lkZXMsIGZvciBhdXRv
c3VzcGVuZCBpbiBjeWNsaWMsIHdlIGhhdmUgdG8gYWRkIHBtX3J1bnRpbWVfZ2V0X3N5bmMNCj4g
PiBpbnRvIGludGVycnVwdCBoYW5kbGVyIGFzIHFjb20vYmFtX2RtYS5jLiBidXQgaG93IGNvdWxk
IHJlc29sdmUgdGhlDQo+ID4gc2N1LXBkJ3Mgbm9uLWF0bW9pYyBsaW1pdGF0aW9uIGluIGludGVy
cnVwdCBoYW5kbGVyPw0KPiANCj4gU3VyZSwgdGhpcyBhbGwgbmVlZHMgc29tZSBjYXJlZnVsIGFu
YWx5c2lzIG9uIGhvdyB0aG9zZSBmdW5jdGlvbnMgYXJlIGNhbGxlZA0KPiBhbmQgd2hhdCB0byBk
byBhYm91dCBhdG9taWMgY2FsbGVycywgYnV0IGl0IHNob3VsZCBiZSBkb2FibGUuIEkgZG9uJ3Qg
c2VlIGFueQ0KPiBmdW5kYW1lbnRhbCBpc3N1ZXMgaGVyZS4NCj4gDQo+IEkgZG9uJ3Qgc2VlIHdo
eSB5b3Ugd291bGQgZXZlciBuZWVkIHRvIHdha2UgdGhlIGhhcmR3YXJlIGluIGFuIGludGVycnVw
dA0KPiBoYW5kbGVyLiBTdXJlbHkgdGhlIGhhcmR3YXJlIGlzIGFscmVhZHkgYXdha2UsIGFzIGl0
IHdvdWxkbid0IHNpZ25hbCBhbg0KPiBpbnRlcnJ1cHQgb3RoZXJ3aXNlLiBBbmQgZm9yIHRoZSBp
c3N1ZSB3aXRoIHNjdS1wZCB5b3Ugb25seSBjYXJlIGFib3V0IHRoZQ0KPiBzdGF0ZSB0cmFuc2l0
aW9uIG9mIHN1c3BlbmRlZC0+cnVubmluZy4gSWYgdGhlIGhhcmR3YXJlIGlzIGFscmVhZHkNCj4g
cnVubmluZy9hd2FrZSwgdGhlIHJ1bnRpbWUgcG0gc3RhdGUgaGFuZGxpbmcgaXMgbm90aGluZyBt
b3JlIHRoYW4gYnVtcGluZw0KPiBhIHJlZmNvdW50LCB3aGljaCBpcyBhdG9taWMgc2FmZS4gUHV0
dGluZyB0aGUgSFcgaW4gc3VzcGVuZCBpcyBhbHJlYWR5IGhhbmRsZWQNCj4gYXN5bmNocm9ub3Vz
bHkgaW4gYSB3b3JrZXIsIHNvIHRoaXMgaXMgYWxzbyBhdG9taWMgc2FmZS4NCkJ1dCB3aXRoIGF1
dG9zdXNwZW5kIHVzZWQsIGluIGNvcm5lciBjYXNlLCBtYXkgcnVudGltZSBzdXNwZW5kZWQgYmVm
b3JlIGZhbGxpbmcgDQpJbnRvIGVkbWEgaW50ZXJydXB0IGhhbmRsZXIgaWYgdGltZW91dCBoYXBw
ZW4gd2l0aCB0aGUgZGVsYXkgdmFsdWUgb2YNCnBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2Rl
bGF5KCkuIFRodXMsIGNhbid0IHRvdWNoIGFueSBlZG1hIGludGVycnVwdA0Kc3RhdHVzIHJlZ2lz
dGVyIHVubGVzcyBydW50aW1lIHJlc3VtZSBlZG1hIGluIGludGVycnVwdCBoYW5kbGVyIHdoaWxl
IHJ1bnRpbWUNCnJlc3VtZSBmdW5jdGlvbiBiYXNlZCBvbiBzY3UtcGQncyBwb3dlciBkb21haW4g
bWF5IGJsb2NrIG9yIHNsZWVwLg0KSSBoYXZlIGEgc2ltcGxlIHdvcmthcm91bmQgdGhhdCBkaXNh
YmxlIHJ1bnRpbWUgc3VzcGVuZCBpbiBpc3N1ZV9wZW5kaW5nIHdvcmtlcg0KYnkgY2FsbGluZyBw
bV9ydW50aW1lX2ZvcmJpZCgpIGFuZCB0aGVuIGVuYWJsZSBydW50aW1lIGF1dG8gc3VzcGVuZCBp
biANCmRtYWVuZ2luZV90ZXJtaW5hdGVfYWxsIHNvIHRoYXQgd2UgY291bGQgZWFzaWx5IHJlZ2Fy
ZCB0aGF0IGVkbWEgY2hhbm5lbCBpcyBhbHdheXMNCmluIHJ1bnRpbWUgcmVzdW1lIGJldHdlZW4g
aXNzdWVfcGVuZGluZyBhbmQgY2hhbm5lbCB0ZXJtaW5hdGVkIGFuZCBpZ25vcmUgdGhlIGFib3Zl
DQppbnRlcnJ1cHQgaGFuZGxlci9zY3UtcGQgbGltaXRhdGlvbi4NCg0KDQoNCg==
