Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BEC877BA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 09:24:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BYX4XobY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtVF60P6Gz3d2g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 19:24:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BYX4XobY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::600; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtVDP1Jpkz3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 19:24:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0eNKsrJ8GwUEMqBAcCSzIfpEVjjk5jY+E/zPAp6DGuXq8LCylkFupo2R0XGyjcbio6o50ROWdv8S2x3pPnQ6I56B9do0numhGQjnQNIUxVXlgK3GVXL5TXHUSkUFw2MpnR/5uxiw2NOx6IXGSzjp2ZS64gsVR4woT4RA/VQnpbRMArTyuCMZhyhSakj+2vVpA4/zQHM1lT2M5UmUMDGzVPKPjaOFzUYBE0Gge6PRQAiA9LEK/KcNz/6lE55+xHVWIhmOE47TPomwpN55gLirsGV6jqo+xnKwdd3foePZAuY7K4VXsCWHqEo/x/69ks8uqUbWQmEPCyihBtnW7SxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIlDBxCVJ5lrNVPcrAs5DO1S5H3vHOXCmX0OHB2/BEM=;
 b=aXh7BuYgQBwHZTWKaCKDsAcL8xj9OjOwH8Z9MSHa27yJL7ounIPvRTV7Lv8JzDyiGlMYTNOZPL6jF1ppouH4TjJ1+QJHJ2+RzJQ0i5sfE4wNZOYJThggdnOVkeskz8fqvQNzMncpTJ7xB89h839s7b8F9/EAVW8ILjOzLWp5SkFIPIh1NVdp2h0YQpMeBedJI3SqvPfFIP/wbdboIjqB5ttyAPOy06bUl01BDvro7KdIa4utVaLiRaRqkm3B6I3oOggtvc6BhcERq9gRbCNStdR5Jbjsl2mOOfbx7W7A+hTDOaULWcDxRumk30KvtjdUfr7W2SRUDH9xiadW/P1EFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIlDBxCVJ5lrNVPcrAs5DO1S5H3vHOXCmX0OHB2/BEM=;
 b=BYX4XobYh7KD0sI650kO+RzCg5Y5l+1pmm7emOW/d7kteeIbERPm/vsPKif4VuvViJAUKH9R4xnr9u+u+RqETDUH+haJyVeMj854qrMUdpM66gRr472+WmGHNWScTF9CtXKmLTK3AfGW/Hhz8n9rrBpN30sqAZ159GIHepWf4do=
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 08:23:40 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 08:23:40 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "shengjiu.wang@gmail.com"
	<shengjiu.wang@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "nicoleotsuka@gmail.com"
	<nicoleotsuka@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
	<linux-imx@nxp.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: Re: [PATCH v2 4/4] ASoC: fsl: imx-rpmsg: Update to correct DT
 node
Thread-Topic: Re: [PATCH v2 4/4] ASoC: fsl: imx-rpmsg: Update to correct DT
 node
Thread-Index: AQHac41sWjTGldO2EU6E2PSL3ywzpw==
Date: Mon, 11 Mar 2024 08:23:40 +0000
Message-ID:  <DB9PR04MB94989E409BBEA8918598ECF1E3242@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: <20240307074437.1472593-1-chancel.liu@nxp.com>
 <20240307074437.1472593-5-chancel.liu@nxp.com>
 <3509c637-23f0-4e7e-847f-bf3f4f3bf8a0@kernel.org>
 <DB9PR04MB9498D38D392816018B8FE8CEE3242@DB9PR04MB9498.eurprd04.prod.outlook.com>
 <c2c9a841-9ed1-4925-b6cd-16cdef36f279@kernel.org>
In-Reply-To: <c2c9a841-9ed1-4925-b6cd-16cdef36f279@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|GVXPR04MB9759:EE_
x-ms-office365-filtering-correlation-id: 85246679-d043-4c76-9634-08dc41a48e9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IoO+Ls4iizIuMIm7THOHWKzO07Om7Emq/H5nlTEh0Ytyo8xXheVfbObLQKmbkdEWU6HSkh3gq0YdXpLWqL/7aSBpWUX3ogHEWOReboT5ped5bEoWkEaAA2dqsjYC31L9yxxDAsBnWSMmcPmb1ZsKQDNqHGSN6xqWYx/jslg9q7JztSYFUHxg3WI6JFOln9hVCtfbwZF/MNVhbXGHKzXJa/9RzcFfZ8BB3QHOQz/fDebeJcSKZGscLk8qY0ysKvhWs7VsYztC1nK3W3ZuKdheUhpWHvm7wnoC/Z3z0/jwX/BnP+9hNTbyizN2ttietef8XOAwyt7Hm1JwvvE1tCgXRJNOW3yfwyREr7uKmvKPl2Ksl5RgVhcCrp0gsB/1ZMMTvJvR3LxGS5qJVJerxPbPf4jOUJIt75szb0lPF2PwAMoREBgSp9FdbVspLR3YaoRaU4UBI4dxIhdFpFeowoRwtfPmgPDDua1/QhUV0JRuIE8NbgSCmsVrq3cvE+1OQAjLzMNikhWGtJXSkhRyX85W01JnY/TBaEpUlo+3d1wAdnfDoTPvKpuBhLi3KFtum0FRcVT4KSompdoo7SM6JPVz5iVT2HXoPduaOKr5AEp+t5d1UDkemGc8mWl0M2QKpWi8tmTYo5TtMRBwE7wdCtWmdq7ZCJ+whx3j6erpHJljNWgzOWGpvVHZFwkq4KBWGORdFvB1jJAhqRtQGAnBf7z5cveiAvxe7zBvXnx43k9uK2U=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(921011)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Nk9oemRDcGpKenhRZ1BIL1lIWG9LQ1FwK2JpU0hkeHpCR1Y2T2VjWU9FdjB4?=
 =?utf-8?B?eHRjYkVway9XUjBNS1BOVVBURXAwc0w0N0x3V0lLRlJNVXJaRXBnUlVOcU13?=
 =?utf-8?B?bEE0UW5wZ1dmWXhyK21tOHNrc040eENZQ0hUcTFTOUY2MUNOUk45OCs3cDh0?=
 =?utf-8?B?OVFiaFNvKzloa2N3N1RyeXB1OFBVTkM5Sjh4YnZRVi92aE5RV1ZWOTR4bXg5?=
 =?utf-8?B?S0VNSmh4OXltNUFQYkZIYmUrcnRRV2pLUEVFbzZOdjh0bUxpWHY1WjRQVjRq?=
 =?utf-8?B?TDRxblRJOTFWN1pwcjRJcGhhZlF4MkRLVVp5aWQ2QlBLVWlQQ1BVRlNnVVhU?=
 =?utf-8?B?a3ZLWkE1T293THBGRUZJYjdmYUc5TUFWeDRoeU1YNUtKM0pNbzZYNnBzckVI?=
 =?utf-8?B?bWlIY0lQbFJaejU1eWxIZlcyVjVreGhycHR6RVhSQmVOR3hmN09xbkVBMWdV?=
 =?utf-8?B?VzZjdUdVQXplSjZPc2taS1RVTUwwamFIdGVIeEVyRUhuZ2podTBjQlRKMXZH?=
 =?utf-8?B?bFlJQmxqSk83TWlTd24wb0NIMDBsTDdFWW9BcWlBZ3IrVk9FYXo3MHJzaHlF?=
 =?utf-8?B?K1R1bFArK0dmaDdnckEwUElBdCtneU9IWWc0MXNtTUtveld1Z0U4dlpxVnVW?=
 =?utf-8?B?NngwOFJXM0NXa1ZBd3dKZkRyOXU0M2RKcWN3bGF0RDlMaFJXWlFqUi92ZnhE?=
 =?utf-8?B?cHZnQVhCTjJSaXpvTkxEK0VOR09ZR3ZvODlrYUtIbGdRbmljMEphbjFhVTlQ?=
 =?utf-8?B?WFF3YVphWVYzcFNmL2JIbFFubXF5a2JERkJUU1hybGcrYnRvUytnZ0hvNEk1?=
 =?utf-8?B?T3JxNnN2K3ZCZlpIaFFXV1lnRmFjQjVTWW5NSWR2TU5ZWTcraVlaSE1VTE5a?=
 =?utf-8?B?SFBnKzNwZmZhMy9pY0RGS1I5djdldGlYVzYxQ2trYWVoYStQZHB3S08zOUw5?=
 =?utf-8?B?eWpwT0hjRHMxSDh6ck9MR2NXUjZsd1V6Z3I1RGdlMEprZ3diYjVIa3V2Ujgw?=
 =?utf-8?B?ZU8xYjFVWVRNRGVXMG1QckdmZlBlbFMyUGVjdWZYV1F4U1lyN3h2YWxQRWds?=
 =?utf-8?B?RGgyZWVFNXcrTjVUQ0J4M0FDMjd0VU9kV1VCUWtVK0ttM2NyY1lldmQrQ1V3?=
 =?utf-8?B?dTJ2NU9DQUVtY0x4eUhsSHVPYm92ZVZjNmcwL3VOUmNVS05jbTNBTjRuMDFw?=
 =?utf-8?B?V0NValZDc0huQXg5ZjZXTlpOVHNUbWZFVlFVR0FTNzM0Qzd3RGJIUkU1bkR5?=
 =?utf-8?B?WjlTS0tXbW9idWp1d1l0RUxCa2I4dlhkdU0wVlNRV29uYjltRFlWL2x3YWFo?=
 =?utf-8?B?RFc0Q1AxUGRWekpXMFpWemhaVzdUekM0d2lwK0F2USs2VUxmUm5uWjByT0VV?=
 =?utf-8?B?bGJQdFNPaVkrc1B0ejlZN3lmbEFxNTBNVi9rbWJUOEpmUEN4Y1N4OGFVaTBI?=
 =?utf-8?B?QlltZ1pPbXdoUjFWK3VRUnl6UFQ5Y0hrY1pTbWIxTDljZy90WHMzY0xmcDNN?=
 =?utf-8?B?UW9sbUVJeEN1b3QwK251M2RIY1gxZ2lXd0pqejdVUVBkVWI2RFAyWmxWcUxP?=
 =?utf-8?B?N2dZeHJ3Qm5xc25NbURKVml2Ykc1aFVHdUtheVA3TW1YZURtMi8rZUJPek9w?=
 =?utf-8?B?Mituci9UN216NHhTWFFwcnlwTk1POEJjVDNmdVE2L0xqUzlsSENxQ2UrUjFU?=
 =?utf-8?B?aWlBbWhmUnNJSjUrQ2QxVUVKU2MyNk9EMzRXZlU3Z0d3UmxqS3MvTlYxNSta?=
 =?utf-8?B?NUxxaWpubC9iWXRTQ3ZPV2RDMmJiOHN5WEw1YUUvTEo0T1E0cW03dGxqQzFI?=
 =?utf-8?B?YXUwOVJGR09NMC9VNWh2ZU51WjVueVBKNjJHSzYzSlZIbzdieHFwSlFHYjlp?=
 =?utf-8?B?RzZ4eVZYNTZPSy9vcGxSb05ScGpaMWhQUzJ1RUVES0o5N29WeG5CbXJKUDZZ?=
 =?utf-8?B?VWdJVUxIeVBIQjBadW5XOC9DSkxybFY5cTZrbmw3ZkhGUE1jc29JOTV1ZXhr?=
 =?utf-8?B?bnZmdk9ieWlZbTlEdC9kNXhqRXZsZDRocUFPcEdoN2RwYzNKSWdNV2VGUDl1?=
 =?utf-8?B?dDdYcUhpRWcwK2RFSzVNVjJiSVNHWlRaRkxIL2twRXg2ZlNOa09menNjRHBF?=
 =?utf-8?Q?iElo+ptgW6GxkUXSQUe6Fq4Vi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85246679-d043-4c76-9634-08dc41a48e9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 08:23:40.2283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+KwKDn/lYjOEUV9RZDFDJTz3ZHOIIY3rY3uQRIzzRAk8w1Kx7HYBXAByzrt7H2ZdvBUYezJpk2wYKGhAKscZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBPbiAxMS8wMy8yMDI0IDA4OjMzLCBDaGFuY2VsIExpdSB3cm90ZToNCj4gPj4+IEBAIC0xMjcs
NiArMTI2LDIyIEBAIHN0YXRpYyBpbnQgaW14X3JwbXNnX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9y
bV9kZXZpY2UNCj4gPj4gKnBkZXYpDQo+ID4+PiAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4g
Pj4+ICAgICAgIH0NCj4gPj4+DQo+ID4+PiArICAgICBpZiAoIXN0cmNtcChwZGV2LT5kZXYucGxh
dGZvcm1fZGF0YSwgInJwbXNnLW1pY2ZpbC1jaGFubmVsIikpDQo+ID4+PiArICAgICAgICAgICAg
IG5wID0gb2ZfZmluZF9ub2RlX2J5X25hbWUoTlVMTCwgInJwbXNnX21pY2ZpbCIpOw0KPiA+Pj4g
KyAgICAgZWxzZQ0KPiA+Pj4gKyAgICAgICAgICAgICBucCA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1l
KE5VTEwsICJycG1zZ19hdWRpbyIpOw0KPiA+Pg0KPiA+PiBXaHkgZG8geW91IGNyZWF0ZSBBQkkg
b24gbm9kZSBuYW1lcz8gV2hlcmUgaXMgaXQgZG9jdW1lbnRlZD8gV2h5DQo+IGNhbid0DQo+ID4+
IHlvdSB1c2UgcGhhbmRsZXM/DQo+ID4+DQo+ID4+IEJlc3QgcmVnYXJkcywNCj4gPj4gS3J6eXN6
dG9mDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgcmVtaW5kZXIuIFRydWx5IEkgc2hvdWxkbid0
IHVzZSB1bmRvY3VtZW50ZWQgYmluZGluZ3MuIEkNCj4gd2lsbA0KPiA+IHVzZSDigJxmc2wscnBt
c2ctY2hhbm5lbC1uYW1l4oCdIHRvIHJlZmluZSBwYXRjaCBzZXQuIFBsZWFzZSBoZWxwIHJldmll
dyBuZXh0DQo+ID4gdmVyc2lvbi4NCj4gDQo+IEluc3RlYWQgb2YgaGFyZC1jb2Rpbmcgbm9kZSBu
YW1lcyBpbiB0aGUgZHJpdmVyIHlvdSB3YW50IHRvIHB1dCBpdCBpbg0KPiAiZnNsLHJwbXNnLWNo
YW5uZWwtbmFtZSIgcHJvcGVydHk/IEkgZG9uJ3QgZm9sbG93LiBJIHJlY29tbWVuZGVkIGluc3Rl
YWQNCj4gdXNpbmcgcGhhbmRsZXMsIGNhcmUgdG8gYWRkcmVzcyB0aGF0Pw0KDQppbXgtcnBtc2cg
aXMgQVNvQyBtYWNoaW5lIGRyaXZlciBhbmQgZnNsX3JwbXNnIGlzIEFTb0MgQ1BVIERBSSBkcml2
ZXIuIEluDQppbXgtcnBtc2csIGRyaXZlciBuZWVkcyB0byBnZXQgQ1BVIERBSSBEVCBub2RlIGZv
ciBoYXJkd2FyZSBjb25maWd1cmF0aW9uLiBTbw0KaW14LXJwbXNnIG5lZWRzIHNvbWUgImluZm9y
bWF0aW9uIiB0byBmaW5kIHRoZSBjb3JyZWN0IERUIG5vZGUuIEFzIHlvdQ0KcmVjb21tZW5kZWQs
IGl0J3Mgbm90IHdpc2UgdG8gdXNlIGhhcmQtY29kaW5nIG5vZGUgbmFtZS4gQWxzbyB0aGUgZGV2
aWNlIG9mDQppbXgtcnBtc2cgaXMgY3JlYXRlZCBieSBpbXgtYXVkaW8tcnBtc2cgc28gaXQgY2Fu
J3QgZGlyZWN0bHkgZ2V0IHBoYW5kbGUgb2YgQ1BVDQpEQUkgbm9kZS4NCg0KU29ycnkgZm9yIHVu
Y2xlYXIgc3RhdGVtZW50LiAiZnNsLHJwbXNnLWNoYW5uZWwtbmFtZSIgaXMgdGhlIHByb3BlcnR5
IG9mIHJwbXNnDQpjaGFubmVsIG5hbWUuIEVhY2ggcnBtc2cgc291bmQgY2FyZCBzaXRzIG9uIG9u
ZSBycG1zZyBjaGFubmVsLiBTbyBJIGRlY2lkZSB0bw0KdXNlIHJwbXNnIGNoYW5uZWwgbmFtZSB0
byBjb25uZWN0IGFsbCBwYXJ0cyBvZiB0aGlzIHNvdW5kIGNhcmQuIElmIHRoZSBDUFUgREFJDQpp
cyByZWdpc3RlcmQgd2l0aCBycG1zZyBjaGFubmVsIG5hbWUgdGhlbiBpbXgtcnBtc2cgY2FuIGVh
c2lseSBnZXQgdGhlIERUIG5vZGUNCmJ5IHRoaXMgbmFtZS4NCg0KUmVnYXJkcywgDQpDaGFuY2Vs
IExpdQ0K
