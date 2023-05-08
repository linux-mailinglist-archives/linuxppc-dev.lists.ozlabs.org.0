Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF296FBA32
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 23:47:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFZdB3lR2z3fKH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 07:47:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Kwl5tOsF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::61f; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Kwl5tOsF;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFZcH0zGWz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 07:46:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVEvUn3GAMxItSQhdfk3NCk+TNskRYvhJlLUGHUpdN6CWsx1Ugy0Jygr0r3Zj4UNknb+IOtvVUrAtX56jXzAvYCxJaJbYig2Z9U3Xfvo7C2CSqRlWD3jZlIduP0aqHPcWUKIWBxnaHP98VyN2Np4DWMVvOD5EqJ+kNpa7bo69wGbF98MGkyXq9jOVuJh/3u9o+tQaV6kCUCJwc3gGkZxrvJQCGQ6KSjvA519KaYe66laUn2jMNkJQ0cqV7CjUY13bI4R55wtWqxUx3iAQOBNEMQ7kcQdXQFv/rdFvINJsYBlpTymevWTQ1d/NZdUNG0RMLiAIMABAr+M24LVYX7w+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FHUT6Enjqbt018itD9DESGccKkKpI22E1iOEr9S44w=;
 b=fqcUojvHYUV9W4U3h4yAkeQ43DlVBxeyl22NgyJYOKb5a2y6BG3KmcGGfCDJJC+bQIZqbfAYROcz7U1d86FxBhH5L2DRn6W6JtLEl+kx/MLltn+v6IWEbvzZ+RtPi4FoDC5NNJlT6mKxV0RqZNZ8XjdIdMJBFec//gFM4uDbEMKUHY0NxUlp2aHUvIcftgf6B0WpZKcETuaifib7uWyFUrwLIj7Gu1qDZxiDFfl/VMgr5NOXZJ8l+pQCYGbgsceCHZVRh3m/d1xihGGVEBoLSZBK7GOmMG2Yp0elwAw/6KZkDwDM+iKAIo/v3UNxsVixlMxMIIqvrx9Q+brLnnQpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FHUT6Enjqbt018itD9DESGccKkKpI22E1iOEr9S44w=;
 b=Kwl5tOsF9kPIjMntFhsEJEQHwuSB9N3I1iT+8vpHCxrHerUqKo+jW7xjIMvWGLmXK8G/f+wC2rvhJ+mPLGrckLnmKrVnF8oZdGuKb8R/axkDX61SrIReHCXDgRWKzbVQxLS0KTWhSG8ul64pupc0/FAj5tU8F0r3VbFj2U49ZM8=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM0PR04MB7074.eurprd04.prod.outlook.com (2603:10a6:208:196::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 21:46:00 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::bcdd:75c9:176c:39ed]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::bcdd:75c9:176c:39ed%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:46:00 +0000
From: Frank Li <frank.li@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint linkup
 notifier support
Thread-Topic: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint
 linkup notifier support
Thread-Index: AQHZfDv8xjmOGp+sGECsmQvElFijLa9M6KiAgAOBOzCAAIZwAIAAA3BA
Date: Mon, 8 May 2023 21:45:59 +0000
Message-ID:  <AM6PR04MB4838C21F4C2F0689B13B05A988719@AM6PR04MB4838.eurprd04.prod.outlook.com>
References:  <AM6PR04MB4838D92748AD426DA1661C0C88719@AM6PR04MB4838.eurprd04.prod.outlook.com>
 <20230508213106.GA1192065@bhelgaas>
In-Reply-To: <20230508213106.GA1192065@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4838:EE_|AM0PR04MB7074:EE_
x-ms-office365-filtering-correlation-id: fff1abe0-23df-4bea-f367-08db500d9ccf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Z251enCRIcqbwoVyMQ29HtEH5vZ6H4D1t3NCX6+3OokUyn4mKwQZ28CP6ryYXo+vqbC3IZDIZBGOzrq1y5DY96aynhD24vcGrZ8JyzIelawfsinwbc+Doxk54LrRF3AXt7VVZEHUQqOlg7qWvbYJiTpN/YE/uonywgYknCP1IbgaGuKHXLlb664uGnoBtO44p799qrjqjPkWdDvTNuQXHmkpxNRf6Fy3QvbUO+8EiHRol/ODSNAllJD0R0BDmGJj20RpHVbBiXRs7nhzR1li89w9grXcYas62ixErYnRTLcVFF7HsRkSC1uJ+5wGfOVkhgsTLKW83OsGcy5ZVMV+EpvIUR+BXY+aQZb90+2x7qHGyD95/SEUvb5gY0rHkWvpSaTstrLsuPjrEXA3xSxzXlXOcaY10JQIOdMuY6H1MY66DGhG6t+mJxGRCEtqH8QL1xNoXuybzQFvky2s/7JwHqBNZDeoRVmK6Hlae8OTe0tA8R/S8zN5wrUcJENtx7wjyjJ/FRrZ6LurlOudYKqKsE5UVJ8W5PLuvqVxIB87+DDnIViezcTnGTj5fLSnWZKFRAexivOqCzu97GwHWDV6doXhesyLGeRg1mrVcna+VOmt7RNhYlvIkPwryBav8b9a
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(2906002)(38100700002)(26005)(9686003)(6506007)(55236004)(33656002)(186003)(55016003)(122000001)(316002)(41300700001)(6916009)(4326008)(64756008)(76116006)(66556008)(66946007)(66446008)(7696005)(66476007)(71200400001)(38070700005)(54906003)(86362001)(478600001)(52536014)(5660300002)(8676002)(7416002)(44832011)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UGw2SEl2TVlZODJKNjBPNWtQOElwc3JWL25Gb1FzMlhxY0QzOVB3eDhDbXg3?=
 =?utf-8?B?bzJEa0MzRTVWSVk1M29iVmJFUHZPTU1pS1pDdUxrb1o1Qm5ZdzZVbEZjallr?=
 =?utf-8?B?VWk3Y1lBd25PRDhCMjJnMThSRFhVNDFIL1QwY0ZpSzBqSFovL2RxMnJVNGND?=
 =?utf-8?B?UVRFckZtV0IvbnNheFpRRDJHeUJiT3E1aStYdlE0RzdoMXFZNkhBUXRJVE1p?=
 =?utf-8?B?eWNsTVpvQ1BwbWNLQ0tlWlMreWp2cVpLSUdFOG5HM3c1elpIWjhwRjBGVW1O?=
 =?utf-8?B?T3dqM2FIdE80eWlKa3JiTnkrUWdUbm5uZnY0MTFVcWdHZWkwNHhzVDN6UkFE?=
 =?utf-8?B?cCtDeHIzWGV6czhwMDIyemtLV2hXaG81K2FkRkNZcTBBdWp3dTIveDI1ZmVs?=
 =?utf-8?B?OTRjSEgxQXVxL3RIcFdodlh1YjJFN1ErbGkwdTZLU2RlVmlKZFcyemZIaUtZ?=
 =?utf-8?B?RWQ3SW9pNFREdlhDUTdEZkN0UFA1dlBlaktWWi9ROHVmdHp0b0VMdWFZV2Rs?=
 =?utf-8?B?RXlwaFVsOWpFZUpuNEJieVVwbk0vcUtWenVObVFPRW1DTG0vSFF2ai9JU3pP?=
 =?utf-8?B?RVVjaHpaR09tUmRVTjFJMk1CZEdPN1BiYmRrYWhXMHU1WHF2ZXRaZlR0SzNV?=
 =?utf-8?B?N0FuNGZDakMrNDdlL0l6bXc4ZTdEZ3ltQjlqWTh1ZkdOeDhjZ2xIQiszSllX?=
 =?utf-8?B?dDFvU0NqYWFZVjZFVzVGRDc5NVlnMVFhcFJaNUNaNXlkQTk5Y1d2bTU3amxs?=
 =?utf-8?B?Z0JOSGlGTEFYWEUwU3BrTnYxSS83cSt3NlNQalBRbVpCSmpNZ1pyaGhhVUJk?=
 =?utf-8?B?UVZ6eHdkODU2aGZ3dmlVN1RsRnNWVEhUbHJ2K2wrcUVoWm1ySE1Id3pnZ3pH?=
 =?utf-8?B?TUNoZExwNVZsSnVvUUhDUWFIUFo0SERLWmZidVNEcjA5RGNHcGthRzdnbysr?=
 =?utf-8?B?K3F0YkFYWk9IQ1B2ZXJUQ0k2Z2lZRzNFWUVpazhnalVaYnhpMFhKTjU5OFpu?=
 =?utf-8?B?aEUza1BscnBPRGpwb01FYzZ0RmcvQmNXNDk1bkN4YVRlYUt5R1J6d3IvQ1FG?=
 =?utf-8?B?d2Q0OStCTW85NWNRYURoV1B2KzBWQVJIMHhYRHJOTlYrMGZER1hxUEtreTd1?=
 =?utf-8?B?cEtZM0lQYXMzdUZPQ0hRUHhZSEdXVDVnL1lOMUZXSWVsMExiNVhxOEo0L3BX?=
 =?utf-8?B?d2J1bmJJaXY3Y1JnWmltdUFBQ3RBcHlpblZSd0ZINDFXMXJnWDdIdDl4RXZB?=
 =?utf-8?B?TWtXUFNmSTFVeGljTGRZMi90UlRoWjR5dGZRVHZYbVBsYjE0S3A2S29UYjZu?=
 =?utf-8?B?aUhCSnBaMWFnRm1qNXA4TjdlTzBwd0tucUVwVWs0WUVUSDhFWm5lUmxnZGVj?=
 =?utf-8?B?Y093VEdRNWhKY2VUU1ZLL2xqbkFXc1JsUUZWMjJpeHpXWVBid2w2ekl0ekpU?=
 =?utf-8?B?bTh2OEFUSGdBZlA3ejZrSUJTZjRkVGlqWXpXNThLTkJTTXZCSE5jMktDdW56?=
 =?utf-8?B?c0kzT0JJYlpjS1hsZE9WYXdJaEtYeEg5MUhBV2w0dG9vVXJickZmbnV0NUpJ?=
 =?utf-8?B?ZkxraEZCMTdFNmhzeitUT3h5bnUvZXpIVEtZRDB5cXI5WUR0d2xWNjF3eUJO?=
 =?utf-8?B?OXlKbzlvWExVUnBZRFMxOWFvOEpDS0RnOVJuRWErcG4yNWRYM0RvRzBUTnIw?=
 =?utf-8?B?TjRDZDV4MUZWdUE1R2M5Mk92OCt2Y2MzOWhyM3VOV0VKcHVDcWt3c2puMVhh?=
 =?utf-8?B?N2tBUjlUbUFQY3JrMEFiTHkyY1NQWGExYjNnVTdTN09EWVUvcVNLVGtQMkRM?=
 =?utf-8?B?TDNYYS9GOUp6aU8zbkpmWmV1bDRoNFQ2US82emFWUUg3Qk02WWw0YnM2bEpC?=
 =?utf-8?B?ZDBMVXIrTWU3L0l3dnFVM290Z3hGUjljZGR2MFo1ZkVRYXVYaDFlcTYxMzV4?=
 =?utf-8?B?cmtkd2lWYjZ3MlJoOGZXMEpXT1pkRDJOZGV2aE0yTThGSHo4S3Z2cTFKZnZV?=
 =?utf-8?B?TDNwbXhKZ3A4YSthSEhKaVJ4K1RZV0RlalhObVBxNU1Ma1F6ZlBIbm9FeE0v?=
 =?utf-8?B?T0NGYlFvRUVIL1gvNVQxT1JoS0NXWi9zd2R1YUw4RzR4Z1lUSVk5T25INExM?=
 =?utf-8?Q?EXkg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff1abe0-23df-4bea-f367-08db500d9ccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 21:45:59.8724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Ml/CGorJusCAjJnaBYiAZ3a0IFTcDpwZiLh3vp9m6Qed5X2zr8fhixi5J/DViY2tOT0UdxKK/gausjdrWIAsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7074
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
Cc: =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Roy Zang <roy.zang@nxp.com>, "open list:PCI DRIVER FOR FREESCALE
 LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Rob Herring <robh@kernel.org>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiA+ID4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2MiAxLzFdIFBDSTogbGF5ZXJzY2FwZTog
QWRkIHRoZSBlbmRwb2ludA0KPiBsaW5rdXANCj4gPiA+IG5vdGlmaWVyIHN1cHBvcnQNCj4gDQo+
IEFsbCB0aGVzZSBxdW90ZWQgaGVhZGVycyBhcmUgcmVkdW5kYW50IGNsdXR0ZXIgc2luY2Ugd2Un
dmUgYWxyZWFkeQ0KPiBzZWVuIHRoZW0gd2hlbiBNYW5pdmFubmFuIHNlbnQgaGlzIGNvbW1lbnRz
LiAgSXQgd291bGQgYmUgbmljZSBpZiB5b3VyDQo+IG1haWxlciBjb3VsZCBiZSBjb25maWd1cmVk
IHRvIG9taXQgdGhlbS4NCg0KT3VyIGVtYWlsIGNsaWVudCBxdWl0ZSBzdHVwaWQuIA0KDQo+IA0K
PiA+ID4gPiArc3RhdGljIGludCBsc19wY2llX2VwX2ludGVycnVwdF9pbml0KHN0cnVjdCBsc19w
Y2llX2VwICpwY2llLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsgICAg
IHUzMiB2YWw7DQo+ID4gPiA+ICsgICAgIGludCByZXQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAg
ICAgcGNpZS0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwgInBtZSIpOw0KPiA+
ID4gPiArICAgICBpZiAocGNpZS0+aXJxIDwgMCkgew0KPiA+ID4gPiArICAgICAgICAgICAgIGRl
dl9lcnIoJnBkZXYtPmRldiwgIkNhbid0IGdldCAncG1lJyBJUlFcbiIpOw0KPiA+ID4NCj4gPiA+
IFBNRQ0KPiA+DQo+ID4gSGVyZSBzaG91bGQgYmUgZHRzIHByb3BlcnR5IGBwbWVgLCBzdXBwb3Nl
IHNob3VsZCBtYXRjaA0KPiA+IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKHBkZXYsICJwbWUiKTsN
Cj4gDQo+IFlvdSBjYW4gYWxzbyBlZGl0IG91dCBhbGwgdGhlIG90aGVyIGNvbnRleHQgYW5kIHF1
ZXN0aW9ucyBpZiB5b3UncmUNCj4gbm90IHJlc3BvbmRpbmcgdG8gdGhlbS4NCj4gDQo+IFRoZXJl
IHdlcmUgYSBsb3Qgb2Ygb3RoZXIgY29tbWVudHMgdGhhdCB3ZXJlIHVzZWZ1bCBidXQgYXJlIG5v
dA0KPiByZWxldmFudCB0byB0aGlzIHJlcGx5Lg0KDQpPa2F5LCBJIGZvdW5kIEkgbWVzcyB1cCBw
YXRjaCB2ZXJzaW9uIG51bWJlci4NCiANCj4gDQo+IEJqb3JuDQo=
