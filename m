Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F81697015
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 22:52:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGZg95synz3ch5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 08:52:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RsKirE2F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::60c; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RsKirE2F;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGZfC2jKpz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 08:51:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1wgHNTDSs5SGrZWfzmKNsvtVBFCWK848tV1DNoM55PEDpMxmvoIcQ60xg0iKYl+NmBP8MEjmPR0eCZKJ3HTGmu1FPtjZybuzP6BxxIa6dGt2vszk2AhYGKfw73+xVgXZGdVPvz854rto8Ozw3ukYEFXehakx684wCb3q+sJ+2lIpglXEOimFp1/HpZvQxZHrrOmbFmib2ipX0f5WFR+SIDbtEPGU4PFKsVgGfEGA41NGElJRhRFCA3JOVZUm0MlRD4IjPr6VnQNoBA4ddUSMBF9c/08Oqj2NPOUv7LZB+uD2VmQpf/STVRDqU9XeAh6mGQcFlznWWiNCINkIWCfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdtFYlX20IEK541Gw8+LiZ8Q//r+toSMtPAvioJzOJc=;
 b=DMMzDv8Sz3WJ9zz44cnI0oszL1MKTFy2ca1dtYrsX9K0q7tQX2F5dMqTjC3Q5JNm60yST9Zv0GxnybCCtJKNkzto87BFhFdWZNNrm+anG4/I9arnYct+NdskZ1SrWKHSRZ151sNGudLsM0RPpmPVj4P3xKNbvC30ESso10pgU2qVEntqnucJfG9PQikmnb3lORRFTybw7X35KAXl4F5x6o2o18OgXF7hubSCOmKPu/oGBhlg32e5nfQHt2YGvnBFj6e14ZuI8huc03EyZhj8VY50Gpm8OenWukTaGtHd8tTi4afzOYlhNvLd4xaGNu3Eokw7zZILt22EKUBP0DchJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdtFYlX20IEK541Gw8+LiZ8Q//r+toSMtPAvioJzOJc=;
 b=RsKirE2Fl4R4StZmEIt9zuRzZaNbiaVK/mU30sHexk+bBWH2h/fHiqYTDV8IBO4/sqs5eVZ7zQrl/rIz4klB70ydZRZucO+oO5OLf1FFGMpBTH0i5WkxQAkMlfUCNaTILMbfsA1Y/F34dUoUIlQxAGIz7Cb/qI0aznzcKc823h4=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 21:50:53 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.6086.023; Tue, 14 Feb 2023
 21:50:52 +0000
From: Frank Li <frank.li@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>, "M.H. Lian"
	<minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang
	<roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring
	<robh@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE
 LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, "open list:PCI DRIVER FOR
 FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, "moderated list:PCI DRIVER
 FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 1/1] PCI: layerscape: Set 64-bit DMA mask
Thread-Topic: [EXT] Re: [PATCH 1/1] PCI: layerscape: Set 64-bit DMA mask
Thread-Index: AQHZJr0yaCK3pFdB6EKPvZEvJoExp67O6h2AgABEYyA=
Date: Tue, 14 Feb 2023 21:50:51 +0000
Message-ID:  <HE1PR0401MB233186A0CDA481B775B9B92888A29@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20230112193621.1513505-1-Frank.Li@nxp.com>
 <45d1fdae-f6c0-ab19-f6a2-2499ead9289a@seco.com>
In-Reply-To: <45d1fdae-f6c0-ab19-f6a2-2499ead9289a@seco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|AS8PR04MB8644:EE_
x-ms-office365-filtering-correlation-id: 544d0d55-197f-4fcc-c247-08db0ed58a8b
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bpKY/Lj2cq9//+UBHoxVYGkLBCIS7+tVyp1zGroaGJyybjZUCTTMpL8HCNo9Lb5D/jzyDaSlGjrEK1icLyEAo0autc6GVuZoB46X0lvgH8NC//ubl4cztSBFqMU6zwuEmSTutG3lqosVwoOwg39oqD5co7PWnP65auwFxS+eKjAFbfYsi1X/cQR6/HWZz46GbiHcIRPkiB6gDWWpjUj93CXIys0SvixmevHp1wEvzWongNEBXc4Tbyd/jMkwyvskL9VsbiqGs2U3a9t1wPZ0K812kcGC+DKzVtVQOTMElxlpZLGbpEfIOapyuiQ5oLl6vkGVNZwQEkBzciZtEQolepfGXKlxr+ESYNt91yAed/8QF7/nWZ4nWQH9wnJtBHIXUFmZA06QzdEK9djb8fpSyeNjXhRBYGa3FS/t1pJRlr4pdh9WS4t8+FlfYDSS8pk1KKpXLdkUvBlEe+mmk8jgXCOf8XE7E6Nfqn/dS5t4hzuW/I8mMB4QiLMdvgJH0sV/wA8A+LDWTbCiiOT+CrMwZTGNEsL1cJL+gSegDGFHbocJfJCuUPg5LkYcpKGggru/3KzSa7QOs/NAfphL56mwcAN/eNdRLtqRp93foSO7cW8AzeUSGtxG1DvBGZDrbYpoLJ/IZtkL2jhx7HcHWe8iWs0IgR8i9LCfHzWbgid1i/rNxjBrqE8ZkybaYiGYh8qEVKYaRYnTA5cgLCe8oU/Ttg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199018)(71200400001)(4326008)(9686003)(5660300002)(7416002)(4744005)(41300700001)(2906002)(26005)(186003)(52536014)(55236004)(6506007)(55016003)(38100700002)(44832011)(38070700005)(8936002)(316002)(478600001)(66946007)(110136005)(86362001)(7696005)(8676002)(66446008)(66556008)(66476007)(64756008)(76116006)(83380400001)(33656002)(122000001)(921005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SVJ4a0I1SUFOT3VpTEpKWGthUUxXREREcVMrR0h3ZXZqcGdCNXlLSFVSbWFa?=
 =?utf-8?B?bXNnTEhZM3ppVFA0MjVkQjlaa0VUSHo3eEkyQnNuZytiL3QrYXNKejBCd2RU?=
 =?utf-8?B?UXU0UlY4VUVlTTU2TGx2M092YXFSNnJXeFlxc2ROVzdiZ1Mrbmo1dEd0MU9i?=
 =?utf-8?B?TzRncDlRVyt2djBhSXEyTzVQbk51dTJTUUVFS1lEbFdkYnFwbFM5WXBWS2FB?=
 =?utf-8?B?ZmVhZU5rU25LeWh0M2phbTRFZngwVXNIbGFGWnNIUVJWTy9vUlptaTcvLy9Z?=
 =?utf-8?B?ek9MYVR3RlZxNUJVN0NoZmpzQUZSWkJTQS9rTVBxOHlKMXpZREVqczM4TUJ1?=
 =?utf-8?B?QW9sQ0YvZUNZdUtoQklLakZXb0J2K3BaZXJRU3pFTExEOGxoaEx5VkxaUzVT?=
 =?utf-8?B?RGJGeFF5LzYwRDZ6L1lEczNNbmZTTGRIWnFGMmQ4V3U4dExqbm1WUUVrY2NL?=
 =?utf-8?B?bWRVK1l6bzA4elJiVXA1ckFYcXF2di8waHV5YkNRS0NuazJ1ME41T1A2YUM4?=
 =?utf-8?B?eWtJNFBocHp1SUxPZGZkNzR6MkwvSUc2R3lnQXViSE5QNENjdk9wYlFKdTk0?=
 =?utf-8?B?UU5jeUhFeWd4c0E0ZEc3aXBRZ2dOWncyN0NldGlCWFdJREl6VjJXc0U5eTlM?=
 =?utf-8?B?ckw5eitZTXhPejNzNXlEYVlpb0RWblBpUmM3ZEdlSEVGMEpvVFJVM1MvMWR6?=
 =?utf-8?B?ZHI2eDJiQitDN1RqQ3kxWlV0ODRCd2dzU2lmdS9OZUpXd3ZOVTBETU5lSTNX?=
 =?utf-8?B?cDRkR1BBT0hocUJLUWovQm1udWMyc2dMMkthNFpjcHljWGpqWm5JWlFXQmVu?=
 =?utf-8?B?OVdrd2VobituZUlpdmllSTNCc3g2UzhEai9kOGFzNGFjMnA2TDM5eW4wRVgv?=
 =?utf-8?B?UmJwUXVMcGJTNUxVcHM0RkFUdmdLTUFGQTJBNldCdnZ2R29FQ1gzK0oya3NO?=
 =?utf-8?B?bEVaVDlaRkVnVVhzWjk3Rk5zd0hzcjJ5ZDhQUTJuVFU2THFYZjQwd2MrVmVN?=
 =?utf-8?B?YjlnUVlMU3F4TmNzakVJZG1sRWZ0czd6M1FEaXNkYWxUaElBY0xQc1NTd2lT?=
 =?utf-8?B?ZFJpVXVzK1ZNN3dUMUpMdDEwcDNKYzR3YkRPMGZoQjRCTWFGWUQyQUl6N3Z0?=
 =?utf-8?B?VFZtOGIyWTVLNTF3Wm1KRlBDcEdsNHd5YU9McFdUb0pBR2phOG15OEFNZGMx?=
 =?utf-8?B?L1lTZ0Z6Mzl3bHFUdGdTRHFtbU50RFFrQkV1ODNIekJnR2p1ekhYMXhLSmJp?=
 =?utf-8?B?dHRjT0tOallKVGtyQ3lWS3ZiSmdGMzFqdS9ycFR0QjY2NDh3bThtOS80QURm?=
 =?utf-8?B?eVZRMDBRb2xwZ0loeXFaWnpUMnRWeDIveEhQaWxiUmJlUHdiQmhWWlRPSk1k?=
 =?utf-8?B?aWFya1dWT1pFbTYraXZITldqRHBMSFNkeHJnYWV4empkSGc1R0RoOHVpTzVl?=
 =?utf-8?B?N2RjaG8xV0g5bmR2SEJpaU93amE4ZjVSQXVMaVM5V2ZRM2F3UWMzNGcxNDB0?=
 =?utf-8?B?cU9UQk5GZFhsV1p3Z3I4cjdpQWNTSllSNWpPaVhnQUVYQStDdzNFd0w4bE0y?=
 =?utf-8?B?cjJHdjlrV21vSlllTFJ1bGJVNWIzRlF5dytCaHZlMG1ZWkZReXZFdHhvdFpH?=
 =?utf-8?B?MUhDdmEvQVREMVFCK2JiZ0dlVTBkZTA5QlFPbVd4TGdnbzhtQ3lRM1cxaE5R?=
 =?utf-8?B?bEE2Rmk1TVp6T1ZpMnRlU2xuNXpRejdDWkVLci82dTJaTjlzYU81Vk9zcmFV?=
 =?utf-8?B?MXpXb3ZPTU5VclVsQmRlR2tMOXA5R1NzZkYyRjRHN2JMYWx6MmJSZWFZRXVp?=
 =?utf-8?B?Ti9WSVNlWUV5Y2NnQTlYbDhwT2lOTnhWbGJOZ3JIR0lObnFVaTZDbnduWnBF?=
 =?utf-8?B?T0kzbjRkOXJ3amFtTDhNNkRSOTU1aG9LWTRTRlZUSVpwQ1FEYVNQdjFORExK?=
 =?utf-8?B?M25pc2lyWW1uYmZBd3pra2NXTkFhZFl1SDUzMmxtdTFQOHdGWjlzWHZha1RS?=
 =?utf-8?B?WlJuK2NzdmNmOWg2bm4vVGkwa01XNEdHeDJXUG1mZUVXQlJiMDJrUng0ZTNM?=
 =?utf-8?B?NnNPMVFwS3NVTnYrWkg5WTZ2WEE3ZU9LRjRqSTExV29JbUR5RXRrVi9KS1NQ?=
 =?utf-8?Q?Hp0g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544d0d55-197f-4fcc-c247-08db0ed58a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 21:50:51.7670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAWV3M1HauDVJWaxLWLZOxxxxyh/vN10NT7yhMH1xibAolbdHpjcT/MlVKp88hp02YStuxNLo1VdD8DQ8NP8Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8644
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiA+DQo+ID4gKyAgICAgLyogc2V0IDY0LWJpdCBETUEgbWFzayBhbmQgY29oZXJlbnQgRE1BIG1h
c2sgKi8NCj4gPiArICAgICBpZiAoZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChkZXYsIERNQV9C
SVRfTUFTSyg2NCkpKQ0KPiA+ICsgICAgICAgICAgICAgZGV2X3dhcm4oZGV2LCAiRmFpbGVkIHRv
IHNldCA2NC1iaXQgRE1BIG1hc2suXG4iKTsNCj4gDQo+IElzbid0IHRoaXMgbWFuZGF0b3J5PyBX
aHkgbm90IGRldl9lcnJfcHJvYmUgYW5kIHJldHVybiB0aGUgZXJyb3I/DQoNCkkgZG9uJ3QgdGhp
bmsgaXQgaXMgbWFuZGF0b3J5LiBJZiBmYWlsdXJlLCBkbWEgd2lsbCB1c2Ugc3dpb3RsYi4gDQpK
dXN0IGFuIGFkZGl0aW9uYWwgbWVtY3B5IGludm9sdmVkLiANCg0KRnJhbmsgTGkNCg0KPiANCj4g
LS1TZWFuDQo+IA0KPiA+ICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHBjaWUpOw0K
PiA+DQo+ID4gICAgICAgcmV0ID0gZHdfcGNpZV9lcF9pbml0KCZwY2ktPmVwKTsNCg0K
