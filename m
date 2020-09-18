Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8644926F22F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 04:58:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsz6f5TY9zDqLS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 12:58:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.83; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=eSzaT7yE; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsz372n72zDq9Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 12:55:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBq7HW5aORqTXdn3+PDLwK7bRb+6Dhy7vuhoilnyHAVcVo+Xs1DbvvMI5ufqlFfRgbhXGzFVOrxT/aSYByhho1paV0ex3Uo3C06Op52ikUsm+kIZzGHHrxQxXCrjPMDfkhia3r0QUM5fwcvqF6rgEZhEV1qChgDMm4gF2LcX4R1/t+oB4I5OFLK0JqERNzXZkFJkCwp2XrxfWm3ClPp8FQxaQznji2Q2LLwsJQJvRLF2XFQ/oDOUQ2C0PaDAjkNCSW+sfzn5TRQa1WXfs0kgSgCWniqZYbSLX6eQErnQCKi3vlZUjQMUg5Vg9EKVIS0F9tsCMccn5R3gjXcsvWf3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJjzJrJhoL192jnGfOpoXgRiEMbK5SjqwX/iuYkag2Q=;
 b=GFhjOtJkegBMkRQjsv3owOys6etQnfmai4cGDF9c5Q756y8lsAksFrIBYRTxRMtqZj2t3qaeYwoWMp5FqqoagiiT74hCUWB9STzKb2H2rH+5ZLY4BPbaHrgeXbyqhWS7LZuB5cXhL2PrFSD3I10NPDHe+hHMDjesbTdpAQM4tuNEK46Appxo+1ZKzaeZQxre9OE82HUjZAz/0d/G18bsQNFtE9udnMdjXSeTXLugNiGAatrCNZFAhUKbvUYRalXaF1BUjbdGtVO9Z9YPyujQzgIgipCYgwkf7Y87oaCAfFtIHWGIMl2EUyime5JlOr5a7IM4lJhcXQdNKdsqeWGwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJjzJrJhoL192jnGfOpoXgRiEMbK5SjqwX/iuYkag2Q=;
 b=eSzaT7yETZ/UkglRpNgwmP5166v0SL2TLxHIueYaaBXUOAR3Q9m22MiYiD1bNdA4GLYiSnFNjC7TTCIeENe1RFqile8oO9MvEfn3w12jwhbgRhGTzJAjtfacKmR4GTI6osrEdNCJU72XRanypsK+DZyEaRVvIhAdxyb7fufq+cU=
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0402MB3369.eurprd04.prod.outlook.com (2603:10a6:7:81::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 18 Sep
 2020 02:55:07 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::c872:d354:7cf7:deb9]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::c872:d354:7cf7:deb9%3]) with mapi id 15.20.3370.019; Fri, 18 Sep 2020
 02:55:07 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: RE: [PATCHv7 00/12]PCI: dwc: Add the multiple PF support for DWC and
 Layerscape
Thread-Topic: [PATCHv7 00/12]PCI: dwc: Add the multiple PF support for DWC and
 Layerscape
Thread-Index: AQHWb8Z1yUZdrG8wQ0ytslGog8Y0mKltPU+AgACwpPA=
Date: Fri, 18 Sep 2020 02:55:06 +0000
Message-ID: <HE1PR0402MB3371BBECB380694B02EDB35B843F0@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
 <20200917162017.GA6830@e121166-lin.cambridge.arm.com>
In-Reply-To: <20200917162017.GA6830@e121166-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 037f5fb6-0b11-44f3-6965-08d85b7e401c
x-ms-traffictypediagnostic: HE1PR0402MB3369:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0402MB336959E3F4BE1AD119E83E05843F0@HE1PR0402MB3369.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sm36AyrHDE/AyFE4v87euaYz16II/FWWAv0whF6Z2vL3WtkKFBxOJ8As6rUDUASU8HUbfmK+0b+pOLXhBZ/ShGrPjb6IRZYRV/XTb4DEP6irD9rvmMw3Jk4CsNkOk0A3BUk3pFWZOf6wxj9MciMHhu9uwMzGdo1qA5fZTFIrgSJ0u/gwj4e5ycbp3VxVKjyLE51mHgKsbs5M5PIotyn/wqGyotLPBjwAbfYYt9NdxzShGz+dOE9QZSJzgVJi3jdTNji/l4odngb7Nu+8IS0PyfLV97E83WMjgXQK4P8dBIZblmKwkE8/ID10eEFODqSgkvmBIntF4b0KLL/5uVwc/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB3371.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(6506007)(53546011)(26005)(86362001)(7696005)(9686003)(316002)(7416002)(8936002)(2906002)(8676002)(6916009)(55016002)(33656002)(54906003)(4326008)(478600001)(66446008)(66476007)(71200400001)(52536014)(64756008)(66946007)(76116006)(5660300002)(66556008)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 41x2nx+r4mnauO8WVM6VYLqV22zC/XM4NyiQNoG2UGpswWSI6Vv3RtnRGO/E3LtE6PNekyZk6RVqEDBll2KAjD0INe6JHWuEW6kC2e+hGBTKv7jBFw7md560EkEwj2zUQNfE8h7hc8GZs1xSMaapWJvDDX4z5sOxa+8KNZgkz59NEreTljtmPDhwuKJy3z33fzdphr4cK6N4KMHBjpFZb50WaQ22noZ/JfIByNl67ZjgQ9xfc2MdUAbr0K84MykGQuLj76VdWSaFgmTJWZrH1pGCxjgHFL1o/rIuVxBMfV31gFlLlWqETmQUqGYGTo6pC2MUHE8feQYUkLKcg3i4SmK/H6nDCqwbmcIdZGbPK4BSrFJBeKqf4lLfHC2MI8LLeDyx5l4zrz25LmPbZJ0y70hWXfeHMqd80sKqcMjXd1ehV2u52cuM1QDf4Dv2y7KK0SVnUAOQDCU+ZPQJ+/wITl5/c29XuwmgSxSpL8HPHmyFTOsEsKfVWgvGhpoerlRwpORC3Fu63Xu0tNvnUyGL7m9F5UhlSkJL+mk3y7N95Lxtc531lrqFg4qa4Ctoqn4Oh/ZZub/OIZwRiKysfthDtbxulon4KoGrAnOTz9v9zjuEmJ0AkM8QCzwPl38eYO3PUYqb8pDMB21/kqkGsSNKYw==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037f5fb6-0b11-44f3-6965-08d85b7e401c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 02:55:07.0177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4ryCdWGbxvPbc1V+pp4X+seuBxacAHCcYYNSrSyJMX15AP+ZhKIAmihdFErkOWhfruhfZTyJKOpUwz/v8ApYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3369
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "andrew.murray@arm.com" <andrew.murray@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "kishon@ti.com" <kishon@ti.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTG9yZW56bywNCg0KVGhhbmtzIGEgbG90IGZvciB5b3VyIGNvbW1lbnRzIQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExvcmVuem8gUGllcmFsaXNpIDxsb3Jlbnpv
LnBpZXJhbGlzaUBhcm0uY29tPg0KPiBTZW50OiAyMDIwxOo51MIxOMjVIDA6MjANCj4gVG86IFou
cS4gSG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5l
bC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4
cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7IGJoZWxnYWFzQGdv
b2dsZS5jb207DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAu
Y29tPjsga2lzaG9uQHRpLmNvbTsNCj4gZ3VzdGF2by5waW1lbnRlbEBzeW5vcHN5cy5jb207IFJv
eSBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsNCj4gamluZ29vaGFuMUBnbWFpbC5jb207IGFuZHJl
dy5tdXJyYXlAYXJtLmNvbTsgTWluZ2thaSBIdQ0KPiA8bWluZ2thaS5odUBueHAuY29tPjsgTS5o
LiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0h2NyAw
MC8xMl1QQ0k6IGR3YzogQWRkIHRoZSBtdWx0aXBsZSBQRiBzdXBwb3J0IGZvciBEV0MNCj4gYW5k
IExheWVyc2NhcGUNCj4gDQo+IE9uIFR1ZSwgQXVnIDExLCAyMDIwIGF0IDA1OjU0OjI5UE0gKzA4
MDAsIFpoaXFpYW5nIEhvdSB3cm90ZToNCj4gPiBGcm9tOiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5n
LkhvdUBueHAuY29tPg0KPiA+DQo+ID4gQWRkIHRoZSBQQ0llIEVQIG11bHRpcGxlIFBGIHN1cHBv
cnQgZm9yIERXQyBhbmQgTGF5ZXJzY2FwZSwgYW5kIHVzZSBhDQo+ID4gbGlzdCB0byBtYW5hZ2Ug
dGhlIFBGcyBvZiBlYWNoIFBDSWUgY29udHJvbGxlcjsgYWRkIHRoZSBkb29yYmVsbCBNU0lYDQo+
ID4gZnVuY3Rpb24gZm9yIERXQzsgYW5kIHJlZmFjdG9yIHRoZSBMYXllcnNjYXBlIEVQIGRyaXZl
ciBkdWUgdG8gc29tZQ0KPiA+IGRpZmZlcmVuY2UgaW4gTGF5ZXJjYXBlIHBsYXRmb3JtcyBQQ0ll
IGludGVncmF0aW9uLg0KPiA+DQo+ID4gSG91IFpoaXFpYW5nICgxKToNCj4gPiAgIG1pc2M6IHBj
aV9lbmRwb2ludF90ZXN0OiBBZGQgZHJpdmVyIGRhdGEgZm9yIExheWVyc2NhcGUgUENJZQ0KPiA+
ICAgICBjb250cm9sbGVycw0KPiA+DQo+ID4gWGlhb3dlaSBCYW8gKDExKToNCj4gPiAgIFBDSTog
ZGVzaWdud2FyZS1lcDogQWRkIG11bHRpcGxlIFBGcyBzdXBwb3J0IGZvciBEV0MNCj4gPiAgIFBD
STogZGVzaWdud2FyZS1lcDogQWRkIHRoZSBkb29yYmVsbCBtb2RlIG9mIE1TSS1YIGluIEVQIG1v
ZGUNCj4gPiAgIFBDSTogZGVzaWdud2FyZS1lcDogTW92ZSB0aGUgZnVuY3Rpb24gb2YgZ2V0dGlu
ZyBNU0kgY2FwYWJpbGl0eQ0KPiA+ICAgICBmb3J3YXJkDQo+ID4gICBQQ0k6IGRlc2lnbndhcmUt
ZXA6IE1vZGlmeSBNU0kgYW5kIE1TSVggQ0FQIHdheSBvZiBmaW5kaW5nDQo+ID4gICBkdC1iaW5k
aW5nczogcGNpOiBsYXllcnNjYXBlLXBjaTogQWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgbHMx
MDg4YQ0KPiA+ICAgICBhbmQgbHMyMDg4YQ0KPiA+ICAgUENJOiBsYXllcnNjYXBlOiBGaXggc29t
ZSBmb3JtYXQgaXNzdWUgb2YgdGhlIGNvZGUNCj4gPiAgIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5
IHRoZSB3YXkgb2YgZ2V0dGluZyBjYXBhYmlsaXR5IHdpdGggZGlmZmVyZW50DQo+ID4gICAgIFBF
WA0KPiA+ICAgUENJOiBsYXllcnNjYXBlOiBNb2RpZnkgdGhlIE1TSVggdG8gdGhlIGRvb3JiZWxs
IG1vZGUNCj4gPiAgIFBDSTogbGF5ZXJzY2FwZTogQWRkIEVQIG1vZGUgc3VwcG9ydCBmb3IgbHMx
MDg4YSBhbmQgbHMyMDg4YQ0KPiA+ICAgYXJtNjQ6IGR0czogbGF5ZXJzY2FwZTogQWRkIFBDSWUg
RVAgbm9kZSBmb3IgbHMxMDg4YQ0KPiA+ICAgbWlzYzogcGNpX2VuZHBvaW50X3Rlc3Q6IEFkZCBM
UzEwODhhIGluIHBjaV9kZXZpY2VfaWQgdGFibGUNCj4gPg0KPiA+ICAuLi4vYmluZGluZ3MvcGNp
L2xheWVyc2NhcGUtcGNpLnR4dCAgICAgICAgICAgfCAgIDIgKw0KPiA+ICAuLi4vYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwODhhLmR0c2kgfCAgMzEgKysrDQo+ID4gIGRyaXZlcnMv
bWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jICAgICAgICAgICAgICB8ICAgOCArLQ0KPiA+ICAuLi4v
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgICAgfCAxMDAgKysrKystLQ0K
PiA+ICAuLi4vcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jICAgfCAyNTgN
Cj4gKysrKysrKysrKysrKystLS0tDQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtZGVzaWdud2FyZS5jICB8ICA1OSArKy0tDQo+ID4gZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1kZXNpZ253YXJlLmggIHwgIDQ4ICsrKy0NCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCA0
MTAgaW5zZXJ0aW9ucygrKSwgOTYgZGVsZXRpb25zKC0pDQo+IA0KPiBTaWRlIG5vdGU6IEkgd2ls
bCBjaGFuZ2UgaXQgZm9yIHlvdSBidXQgcGxlYXNlIGtlZXAgU2lnbmVkLW9mZi1ieToNCj4gdGFn
cyB0b2dldGhlciBpbiB0aGUgbG9nIGluc3RlYWQgb2YgbWl4aW5nIHRoZW0gd2l0aCBvdGhlciB0
YWdzIHJhbmRvbWx5Lg0KPiANCj4gQ2FuIHlvdSByZWJhc2UgdGhpcyBzZXJpZXMgYWdhaW5zdCBt
eSBwY2kvZHdjIGJyYW5jaCBwbGVhc2UgYW5kIHNlbmQgYSB2OCA/DQo+IA0KPiBJIHdpbGwgYXBw
bHkgaXQgdGhlbi4NCg0KSSdsbCByZWJhc2UgdGhpcyBzZXJpZXMgYW5kIHB1dCB0aGUgU2lnbmVk
LW9mZi1ieSB0YWdzIHRvZ2V0aGVyIHRvZGF5Lg0KDQpSZWdhcmRzLA0KWmhpcWlhbmcNCg0KPiAN
Cj4gVGhhbmtzLA0KPiBMb3JlbnpvDQo=
