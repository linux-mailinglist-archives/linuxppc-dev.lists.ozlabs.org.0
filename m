Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18B83A7573
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:55:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vbp3fQTz308D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:55:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Gh1/j2qh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.68; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=Gh1/j2qh; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vbB1TgYz2yWp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:54:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkaD01B31aJdApm0MTjPhVZR3ydgbT9F+hzqWYkKvv/QwpGLvwoHJy03DDoMKjooTSNM6eDfDcfmMChaN0mICkr9VtmCK4XYfkFFZ2i1OvzJ96XPlcg0Wz1d9WFipt24s+NpGSz87vjzQYxFs3a4AdmmS7kSGrzO3HsQTFWb0fEKo4qNtW4+RBP2wOL7BuADGf/36llQXKly3JTcs2/HgN6AUhuAmhnrRPhS6Q8N+BIj3lQk/fZkiLBVcKeRyZslax6O7EYuNk4/pR3YuHuSoFsevu8nB3tvwBUd/8bF5o0Yg51+ftCBfnUmmmiAVl6aT1fOzQuQ07NSa5bSCUk+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjeOIdQgJTVZ763sYZu286nieJjHnhbQuSePIv+eO+o=;
 b=K7MtJfECxOuxVa0eQT8MzBIU/SUV5Xgg/H6M52xVAFB2I1s4w1FkA4akj2V1GDuF5O/BBMmjgvDp8Lg93xyE0j/1Jz/kJ+Lm8NW7R9/MBfrA0mvY95/WY2SxPUOuJ7QijO0WL2k2S9Bq0N19nTpazR6bnqE9LT5cS6+34GbB5w5+WDGE5Co0Uzv9xnLBd/6d1T7xNQw95I5iD+CuhY1W6IQ9z+zGhHWBpew+fYsX4r7WS3gGhu24NBtYecOdq5+jhtLsAWc+uSrBDsMmVq6Mv3YECSXhg0FThb2twP2IgqBbegA0FIYL4clnj8hBRZwU0374u1BQ7eW76Mr+w3FwpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjeOIdQgJTVZ763sYZu286nieJjHnhbQuSePIv+eO+o=;
 b=Gh1/j2qhJqY1FvLnUMBrOTDbevTiE1naGdddnH3QTAG73IqW4AtDhLGixt/sFgjQb53ivIf3LBnBRva48Ewe++pHvZjv+eXAVmLJ7dEyJ+uCCVMxZlRSbikwFfiZX52+KnsnX2317B4FDz2GFNVxYDkKqZP2efgoum2SQmpVuok=
Received: from VI1PR04MB4478.eurprd04.prod.outlook.com (2603:10a6:803:67::30)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Tue, 15 Jun
 2021 03:54:37 +0000
Received: from VI1PR04MB4478.eurprd04.prod.outlook.com
 ([fe80::f1f8:ff94:2b66:8429]) by VI1PR04MB4478.eurprd04.prod.outlook.com
 ([fe80::f1f8:ff94:2b66:8429%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 03:54:36 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH] usb: gadget: fsl: properly remove remnant of MXC support
Thread-Topic: [PATCH] usb: gadget: fsl: properly remove remnant of MXC support
Thread-Index: AQHXXyJaPtbrvsFOdEq86ntFi4l5gqsUU8MAgAAhrQA=
Date: Tue, 15 Jun 2021 03:54:36 +0000
Message-ID: <VI1PR04MB44782C719DCEA2FF0DB03DBF8F309@VI1PR04MB4478.eurprd04.prod.outlook.com>
References: <20210612003128.372238-1-leoyang.li@nxp.com>
 <CACPK8XfUiiBM=KQiqSJ5uSUpOHLTp_wxhNyEw-gYkTBsZjbZVg@mail.gmail.com>
In-Reply-To: <CACPK8XfUiiBM=KQiqSJ5uSUpOHLTp_wxhNyEw-gYkTBsZjbZVg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.83.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbfae566-083c-4f00-81fb-08d92fb14b4a
x-ms-traffictypediagnostic: VE1PR04MB7246:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB724663252FE6FBC5D256E6AF8F309@VE1PR04MB7246.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G8mLqLa71ivDpT+PaKgqrddhKKnN9IcvSC+y0En3On9j6uHvdkn28yT+XqR5LV9I5+vDeAQ6HoIn9FJWmyGQiveTWy2O3d0wZIJ9sNNMRlFydOjoAl8mbbCa2ikRgzve05M5EMwI/nq76ujmjhuEQUE6rRnxBw2X2skW08MH/vKiNK0Kxm1VoKXxHj3PLZxkcFsMMHf6PQD2ZibXpC6nt4cE2JGYgJNAvCjh1BnKHI2fyfgGbi+odSDkQsYtt+Jg6HuNFvMxiqwx4NIdo/CwZtX/dIkiZ9AAFYPrnJTjY8MsbRP9yZlhW8CnYqVLnvzdei3nZb7SZHiZzD8Fq2X8I+0u43N4pRH0sMdBHz0hiz8q0TWr09344u99J8VlALMI/0OYFEC+2cSIbuvgbVnKYVxAmCz1L1FpGvCO0kKSBRP/qHpqyZLNY71Y/l8bSJWOMXR0DRyMA0BMtJgT8SAvwlTgFnKhZSXeC7gwsN/1K2s/IkhRJ0t9Oa3xIMz9OAw8d7A8OQPmdXZXuSZN58+uE/ULpNu2cWpnzZTdCCWpSMGCuDM0PtXYclHURHmYfOpqY1yahLXwevOUyOB72u8/Ci9LOs9isdUk5JSpbBpqWB8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4478.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(5660300002)(83380400001)(4744005)(55016002)(66946007)(76116006)(86362001)(9686003)(6916009)(4326008)(33656002)(66476007)(52536014)(71200400001)(6506007)(53546011)(8936002)(122000001)(38100700002)(2906002)(66556008)(64756008)(186003)(8676002)(478600001)(7696005)(54906003)(316002)(66446008)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1VTd01GcE9SN1Q3NTZmUkh0cEtrb0ZuZm5XQ3IzMXp4UlV3YWJaN3dMaUpQ?=
 =?utf-8?B?Y0VIemJKNnpqWWN3TFdHdWh4MWZpbG9XeDI0Sm12ZDVEQ3hHNVRrOG9IVFcy?=
 =?utf-8?B?MmZSbDlpd0E2WGdNN3dudmpaUFVUeFg5OGFCbjV3UTFFQzNBaCtVY0pCSFdu?=
 =?utf-8?B?aG9hajFpWjhkOEpVMVZucXlsbVBpbGJGZU1GdmZhcGQ0ZGJ6QTJkT2FvaXNp?=
 =?utf-8?B?UkVJWXlLYVVickxEK1JrSXB1TjVmMkNNdHVNSkZXVE1WTEltMlpFQnVXYVJH?=
 =?utf-8?B?dkQxZXVkWXdWRFZnT1dZZEY0V3JLTkJFdDVTNXZvZzhNSEtOYkJLeG1EWGxa?=
 =?utf-8?B?N0praDFFenJvUzBrUVd0Qjl3MzArVWUxOTFQKzZ2Q01PYnZndU9uR1NyV2lj?=
 =?utf-8?B?dE9COVVsOVhzSmo1MHVqRm5rKzFSZU9pc0pibmRhSTBWcHRTeVdUNXhXbGdv?=
 =?utf-8?B?RDIxM040dGltQmlRODBFS05FcEJoUUQxcnBXNGh3S3BCMzIycW44c2VkazVO?=
 =?utf-8?B?Z2tyN0N0L0ZIb01IT2Vxd2VZMHZRUjJHU0RRVFNGQVkrenZOTlA4QkF5Q2tW?=
 =?utf-8?B?TDZpZ1NLVDdQZmhoT2o0dmNWOHRSenBWQ1haMWhWTFoyQ1Z5SXlyUk5LcDdw?=
 =?utf-8?B?RWExOFk2c3dBY3JmRVFzMklSam5mUUtBTWl0UE0rSXlsZytOT0c2aXZxenZj?=
 =?utf-8?B?Y3M4WS9MK2NoMVZDRVNjL3JkL0hUdy9vQUo4TEY5WW5NblVPSzF3T2I1T3Zs?=
 =?utf-8?B?djc5NHl4Vi85RXl3dm1ud2hENnVEQXRCNkFScitsS0ZPc3ByN0Z5dnYwR2FH?=
 =?utf-8?B?V2Z0eEkxTWEzRjZGVW41QW1xRjRtUnVhVFMzZDJ6WDNCdkFDMDJTZjgvY0hq?=
 =?utf-8?B?QkhCUGpHNDhOZjRaS2p3alEzdWdpazRWazhaUkdZY0V3VkdxdkJtTU5JY05S?=
 =?utf-8?B?cmYycEl2YzJMYnVlRzZmQUNaZ1g1SVYzcEdTcnRkQkdqT2J6NmdqYm0wNysy?=
 =?utf-8?B?NC9WNW5YQndzcGNYV0hzUHhzS2ROU1hMemppdUIzeEJsT0M3LzhBejVXNVZE?=
 =?utf-8?B?dDhkK3ZDWnJtRTRZZjBDSGtBTGJ5M2ZMUGM2TmZOcGhDQW9YL0ROVnJGZ0Fz?=
 =?utf-8?B?cW5BRm9VZ1lKTlNRNUVlb2w0WXJpMHJYUWlXb04rdmNGSkNmNlcvbWFoWmY3?=
 =?utf-8?B?S0x1NjEvOFpjUURUVVczZEVJVEwrQUpRdWZGVzNKaWdLQlNzK2lNWkhDT0xO?=
 =?utf-8?B?SGp0R2k3RHd4Q09lalNPZzNLS3NrMHE1K0RyaXBmdUdsUVZKQnFZUk1DWE4z?=
 =?utf-8?B?L05KNkJ2cXdoVElQWDhPdlJMVGs5VnpyTjNBV0s0aWZGbHpHZ2hLbk5STDVv?=
 =?utf-8?B?Vkp4OWNVeXNsOHU1bWx5SHF1V096b28xKzJ0MjZVNlpzZXBBa290ZXZJcG96?=
 =?utf-8?B?UzhDemVOUHBjTWN4M3FSek5Vek1rNDkxWWMvZEszU2VqcE1iOU1VcHZqRFYv?=
 =?utf-8?B?WS9qamZWN1FjMkk0bGMvNVJ3bkVFU0wwM2pUYVBTNURSdXlCL3NSbW8rL3c3?=
 =?utf-8?B?YkE4VkNXbGtnczJEVS9vSzM0R3E3Ri95WUVERFRwU2RyQW43VTB3RFZ3Q3g0?=
 =?utf-8?B?ZnhYQWxiOVVxdzZyODUvcDZ2L2svMTVwREw4cmg1QjZsL0lGb0FMVkgrSnN5?=
 =?utf-8?B?Qk9PWm9KK21xMmZkcHVjWU9RYVR3S1U1L3VuN0tUdWF3TkJZdXVjZGhMVlpn?=
 =?utf-8?Q?UBaFL5ZHhAeyYlaQqvgPmlGhipWUg5ei1tAp0nJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4478.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfae566-083c-4f00-81fb-08d92fb14b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 03:54:36.6787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJEHROcZ+7JL/Q90KTH8/lWekX7QwdV9cDhDPts9j/ptrpJ2sVHjWkUJa7g78CIYD08VHXOaZyNPy4Kk2LJVhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246
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
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ran Wang <ran.wang_1@nxp.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lbCBTdGFubGV5IDxq
b2VsQGptcy5pZC5hdT4NCj4gU2VudDogTW9uZGF5LCBKdW5lIDE0LCAyMDIxIDg6NTIgUE0NCj4g
VG86IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPg0KPiBDYzogRmVsaXBlIEJhbGJpIDxiYWxi
aUBrZXJuZWwub3JnPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz47IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLWRldg0KPiA8bGlu
dXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz47IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+OyBSYW4gV2FuZw0KPiA8cmFuLndhbmdfMUBueHAuY29tPjsgRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB1c2I6IGdhZGdldDog
ZnNsOiBwcm9wZXJseSByZW1vdmUgcmVtbmFudCBvZiBNWEMNCj4gc3VwcG9ydA0KPiANCj4gT24g
U2F0LCAxMiBKdW4gMjAyMSBhdCAwMDozMSwgTGkgWWFuZyA8bGVveWFuZy5saUBueHAuY29tPiB3
cm90ZToNCj4gPg0KPiA+IENvbW1pdCBhMzkwYmVmN2RiMWYgKCJ1c2I6IGdhZGdldDogZnNsX214
Y191ZGM6IFJlbW92ZSB0aGUgZHJpdmVyIikNCj4gPiBkaWRuJ3QgcmVtb3ZlIGFsbCB0aGUgTVhD
IHJlbGF0ZWQgc3R1ZmYgd2hpY2ggY2FuIGNhdXNlIGJ1aWxkIHByb2JsZW0NCj4gPiBmb3IgTFMx
MDIxIHdoZW4gZW5hYmxlZCBhZ2FpbiBpbiBLY29uZmlnLiAgVGhpcyBwYXRjaCByZW1vdmUgYWxs
IHRoZQ0KPiA+IHJlbW5hbnRzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGkgWWFuZyA8bGVv
eWFuZy5saUBueHAuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBq
bXMuaWQuYXU+DQo+IA0KPiBXaWxsIHlvdSByZS1zdWJtaXQgdGhlIGtjb25maWcgY2hhbmdlIG9u
Y2UgdGhpcyBpcyBtZXJnZWQ/DQoNCkkgdGhpbmsgdGhhdCB3ZSBjYW4gcmUtdXNlIHlvdXIgcHJl
dmlvdXMgcGF0Y2guDQoNCkhpIEdyZWcsDQoNCkNhbiB5b3UgYXBwbHkgdGhlIHJldmVydGVkIEtj
b25maWcgcGF0Y2ggYWdhaW4/ICBPciBkbyB5b3UgcHJlZmVyIHVzIHRvIHJlLXN1Ym1pdCBpdCBh
Z2Fpbj8NCg0KUmVnYXJkcywNCkxlbw0K
