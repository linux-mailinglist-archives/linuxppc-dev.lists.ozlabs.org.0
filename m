Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBAF6D5BFB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 11:34:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrMz02qrxz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 19:34:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=DLZMRRvB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe12::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=camelia.groza@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=DLZMRRvB;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrMy36h9Lz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 19:33:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqfM6EdOPA38hrgfaOD9vnrpn0BiQr9LEhBy09Hlk/w+VJgXga6Jve5Pq//vIfWgsBBYsW7w6lQwRkOS9Xle7JyoKTwfNWGjGy3kdzIUqOny+xzCXFUMtzYyPUPozeNCkm20eDtWh6iDQuU592ucXHdqDNypH/OCMqo4LLzaxoCbvC0ukN1aG9auRXgK1Q09C2O3rvYuPx4F4/VPXziIEJkmtrClhzX/YMAJ4W3Lw3e0H0xOH96nLgSmjD7oZIDdIS72cddWxmnjwCBLbedRbyEUYFvrr9eBOM7IX20dJkC01P5KvwVSNUIMKru4On+BqP5afttnmw4dUYNvmwwTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9NhzuI8Gihj5SL7/bRXudQvM6LsOawa13MoNYAAL+g=;
 b=D1KEm2usFv8EpuMEuWKQVQKLpDtjDfm3YqOPZEgXKK7AdqlS9qZFS+Vy9Fvct+3B0TjfhAhsv+smAtcSSAmaDrkzOI6mQi+Yo0dfUSRPgYuOClTXAaUplN9y1Gte+BSq9gpG4HahCOXOTbJcHuEXFVrlGkTzieC9BIv0L66DchAiM8rPHgHOtjPsBF48YjiEbdw/8q63SiZiHe2HSgdq1b4Ft4HOMA0mb463lssRhDTePp+0QI6lxaL+AA9dwiEWow9GApBT5PmK7chQlCTGHD75uNBBuZJ/9yZQ1XwUijRgPZg82sDEF/G6Pt+vPStoO4FrrSlYFiEk+vzjw+oDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9NhzuI8Gihj5SL7/bRXudQvM6LsOawa13MoNYAAL+g=;
 b=DLZMRRvB+EjCSZxppKLCIPlzlQhPZNEVeNrUltP6q3fcpUi218CSw7u+x1raNXwO1n4GWS4HLHAryCWd6J9wT0b/WOMHgo+BC1PE5qRuNBO+w+trH4MS1520/5gXIYk0DnKIPhqpzrrpptNTUVqzUNDt7E7NvudOb7/LqHnOcZs=
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 09:32:51 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::f3bf:4013:3fe8:d452]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::f3bf:4013:3fe8:d452%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:32:51 +0000
From: Camelia Alexandra Groza <camelia.groza@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>
Subject: RE: [PATCH v2 1/2] soc: fsl: qbman: Always disable interrupts when
 taking cgr_lock
Thread-Topic: [PATCH v2 1/2] soc: fsl: qbman: Always disable interrupts when
 taking cgr_lock
Thread-Index: AQHZY+OC+duTzEtVv0+mxRomu0gYya8ZoimAgAAWMACAAS/JcA==
Date: Tue, 4 Apr 2023 09:32:51 +0000
Message-ID:  <VI1PR04MB58074082181816E1AE71E87AF2939@VI1PR04MB5807.eurprd04.prod.outlook.com>
References: <20230331151413.1684105-1-sean.anderson@seco.com>
 <20230403140247.ugb23hqrha2kjup2@skbuf>
 <7bd6967a-7f0b-575f-d972-3bf98fab5a6a@seco.com>
In-Reply-To: <7bd6967a-7f0b-575f-d972-3bf98fab5a6a@seco.com>
Accept-Language: en-GB, ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5807:EE_|DU2PR04MB8629:EE_
x-ms-office365-filtering-correlation-id: b3303412-ce95-4891-569a-08db34ef8f78
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  s31iIFG1cPc5HI6EQID6f4GpZF9ltfk8012q1zo/8k1GDpFHkcVd7Qe+uJIUBczOvEde9xyDtfR2rqvHqcX8oLTu+fsoUTCgrrk9EowzIbueWa8garNO5DkUYZ/ph/U9UA8DeipDWlBcP+zivAzDy0EmVHUAJvbbvxp2X0R0dmc8O6irBKCOvQAIAfRpCoPxE05MBgkGlLVDHWATFCsbs3p7RiwC7EZVV9TVVBc5eqPLMGMeVHNS4cAu6UqDHPw3RNtPvI2mFsgJhcLvA6rWlkYwOjE8HSh/hPDpybmKIJtGtsRt0nvTNdGoPEIjExdHEsqhV3MDUY5yUuPrWjpEDn7Y037pgB4pEGf9BkpB/oe53mr3XhXA14+ONtIqTaUcI9UxbLiOHkUfQfOmNNgUPaFdK8jYyoOV+bIuW1rjiW4LJ3eO2dLlOqMZcOoj6YumbXFO7L7UuIq1u7rUXh8Zn4odGsjmZYNzm8GVYz/TzwEhmpG0x5RnqOSLJ3PKxwkwf5VF1v02TAfiLwJcjxJxSOCZfXti62cgwnpFPF8tWKmK35noiztTQcmoRThQp1tqVR3Pf2Bt9tTC9CBbFrWtgDq+Meg8z3eZSfAUnRcSlSPE8/Uw1Zz/kwkFgiMnlf88
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(66946007)(478600001)(110136005)(316002)(54906003)(6636002)(5660300002)(52536014)(8936002)(38070700005)(33656002)(2906002)(4326008)(86362001)(55016003)(8676002)(64756008)(76116006)(66446008)(66556008)(38100700002)(122000001)(41300700001)(26005)(6506007)(55236004)(53546011)(9686003)(83380400001)(66476007)(186003)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SWhwbTY2QlFoZWNGQXNJaS84Y25WeFAxTzQ4RXg5T2dCWEpuYlFvME9COHVa?=
 =?utf-8?B?WENBa2lOTy9RNXl1UVNZZUlGQzlPTVMrRmg0RHYrelBvQkhJUTMyRUlCOHMx?=
 =?utf-8?B?V0UzVUxyUjRkUy8zNWNST0d3VjdXUzc4U3ZWcjkvYXFoZTlHd3Bsd3lpUlk3?=
 =?utf-8?B?aFV6azRWQ0htVjBEdmRsVjBrSUlrOVdQRGgybGJSQnMwNEpCUlE3Zzloa0hv?=
 =?utf-8?B?RjdzMWp1ZjhuU3ZUQjJDZ01ZeVhMWUMyZFdoTDlTY1UvMGFwSXcyMUhpM3VL?=
 =?utf-8?B?VHBGT05YamQyNmdmdVFtZlBnR1dXTHNKQjA5c0tNMS96dWJVRUUrdGV2VnJV?=
 =?utf-8?B?NE1xWE9uSEw0VUtzc1Awc2lBaFhhT1h0amsxSkRmUzFWT2ZiUDJKMDVOZ3BP?=
 =?utf-8?B?VDVoMEpvcUIydXNwSEc0NHdDdUpFZlY0a3NZNEV4UGUvdkZDMkNQbVNWU0VY?=
 =?utf-8?B?WE9pbVhuUzc2dTBrbmxOMFBtVndnd1FvcEFDZmtPbmZLdzlGdURhSGhTN2VT?=
 =?utf-8?B?T3pWNlhia0x0TkNoNmRIUEg0VVBGOXNiSnpXS2VjeWxiU1pZSUxnK0FxdzlJ?=
 =?utf-8?B?MkZlRk5wb3NuZFRlR25DSXVob2tTZWxuQURlNzg5cm43Q205WTNETzErTnFP?=
 =?utf-8?B?RmVzQmVPSW53UlZJT0d0QTU1NXZrMmZRSzBZcDlyeHd2L0NTMTQ3L2QyRlJo?=
 =?utf-8?B?TjhHZmVhSFhpQzV0T3JCNHplMmpPTFU1TTlHcUIwVHZGU2N4YmNEbElmemVQ?=
 =?utf-8?B?bkZuZCtROTVNUzRWV3Jkd0cvMTV1bHdJMlBKeUhJdjZZZGpYWDYzNnNpSk9u?=
 =?utf-8?B?Vkk2UHZLNllUdWc0SkhNSlR4aWlxeXBnZTRvdG42MEZOOXRkWUw4TFZVTGR6?=
 =?utf-8?B?ZWo3RUFDUkFyZUJ1RFNoVnhjNXRXYzUyOEE2V3BOQ2xxWDN1NHZtS2pSRHNG?=
 =?utf-8?B?Y2lITElUemVxZEpraDVJLzFkdDJybU5FSGUvU0JmTXI3UHVaS0FTSDJlTUl3?=
 =?utf-8?B?VHozRVNEeS9WQi90OVdsSjNHK1Q4c3d6czRaZFdkUTZzaVJlSzN0aHJXOTYx?=
 =?utf-8?B?YnRMb3Fqbk0xNjd3cnoxTmNmUTRvaUErb0RUemZ1a0dVVGgxaWFVQm56cU9N?=
 =?utf-8?B?OHUyYzRoWHlnU3B5ZzRPWmg4T2s0MkxmclgvMkVXZ2pjNWZwQkl6eitpVWVw?=
 =?utf-8?B?UUNTblJtQXBHVktZa1p6RFlhZC9pZkF5ZXBQY1hmTmRVYWpFTFdXQkliWlFK?=
 =?utf-8?B?VHdudytYMnR5UFNBc3BSaXRSVE1BOTlJSDNiYW9NNEdMbDI4ODJPZlAwaGlF?=
 =?utf-8?B?eWVYUkNJUW9Ka1NtZXBPWWV5WVRHajI3eU5GQlQxZ293cTRkMGYzb3F6a3ZL?=
 =?utf-8?B?Zkh4bEtzSGNEODFUQ0hNOWlWaDM4SXJ0OVhSSWY2bnp0QkU3M0VpZUV6ejhD?=
 =?utf-8?B?c2QxeGhBalRMa3hXdmJEZXllUE9oZFh1YjcvYUhiQ2M5bXBnVjhRdmdLckts?=
 =?utf-8?B?RGRZeENheHFVcGNySExvTXpqUFpsY2piNGpVR005bzEyNi82S2FqR3VVeStu?=
 =?utf-8?B?OG50WlBOdnRaUUFNWUNkSzRsZXI3Q2ZZaXhiRjBIQUZYTlh3N2VvVEs1emRu?=
 =?utf-8?B?Q0FVV2dKUFBlY3ErVzViRllIWXR1dXQzWFFVZ1B5VlNRUFM5cHRycTRtR2lu?=
 =?utf-8?B?ZVV0V3pKaVViaXpITG5SQ2JMeU5xdzAxL2l1ekJZejF4OStMYWxDOHVlK09E?=
 =?utf-8?B?Y2RleTBCN3dFVzFHS3dKN1BqU0d4Q25ZS3ZybXV1MmdkTlFBS1U0TE5RQWdX?=
 =?utf-8?B?UnkwV2ljNkFHWVNvbUZkRnJWaU02QXp4Q3Q4SFFnemtGL3krVm5nVVV1QUYx?=
 =?utf-8?B?K1ljT3JYdXcxdDZWenA0SmsxbjdlVVRXSG5rQjV3aFNjSFZnNVlxVkhjdUc3?=
 =?utf-8?B?Zm1naHJJd0ljNkdVUXpIQVdzVTd6MVFHV0pFOUZHRjdnZWZaaVJyaUw1Q25l?=
 =?utf-8?B?d3p6aFRDUWVvc3lOa3Mvdy9SbEJlemhxZFJTeU1MMElIVW5BN0EvNFBVZEg1?=
 =?utf-8?B?cHpqQXVhdTJHVzhEeHFsOVpITWpUYm1LMTQyRis2MVlDVm1yTmNoSGpHclZE?=
 =?utf-8?Q?A6mxI4vSYjfmbje1zOktv97Gy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3303412-ce95-4891-569a-08db34ef8f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 09:32:51.1535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +TqWfXK46lHF9a87prtPwQrIyG5NLuMnI35rB1GsJrwAVNGVjwqxWM9M9OwKqODSfbMn95ElqEPKYtwjQC4Igg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8629
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
Cc: Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZWFuIEFuZGVyc29uIDxzZWFu
LmFuZGVyc29uQHNlY28uY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDMsIDIwMjMgMTg6MjIN
Cj4gVG86IFZsYWRpbWlyIE9sdGVhbiA8dmxhZGltaXIub2x0ZWFuQG54cC5jb20+DQo+IENjOiBM
ZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3Jn
OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBTY290dCBXb29kIDxv
c3NAYnVzZXJyb3IubmV0PjsgQ2FtZWxpYQ0KPiBBbGV4YW5kcmEgR3JvemEgPGNhbWVsaWEuZ3Jv
emFAbnhwLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IFJveSBQbGVkZ2Ug
PHJveS5wbGVkZ2VAbnhwLmNvbT47IERhdmlkIFMgLiBNaWxsZXINCj4gPGRhdmVtQGRhdmVtbG9m
dC5uZXQ+OyBDbGF1ZGl1IE1hbm9pbCA8Y2xhdWRpdS5tYW5vaWxAbnhwLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAxLzJdIHNvYzogZnNsOiBxYm1hbjogQWx3YXlzIGRpc2FibGUgaW50
ZXJydXB0cyB3aGVuDQo+IHRha2luZyBjZ3JfbG9jaw0KPiANCj4gT24gNC8zLzIzIDEwOjAyLCBW
bGFkaW1pciBPbHRlYW4gd3JvdGU6DQo+ID4gT24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTE6MTQ6
MTJBTSAtMDQwMCwgU2VhbiBBbmRlcnNvbiB3cm90ZToNCj4gPj4gc21wX2NhbGxfZnVuY3Rpb25f
c2luZ2xlIGRpc2FibGVzIElSUXMgd2hlbiBleGVjdXRpbmcgdGhlIGNhbGxiYWNrLiBUbw0KPiA+
PiBwcmV2ZW50IGRlYWRsb2Nrcywgd2UgbXVzdCBkaXNhYmxlIElSUXMgd2hlbiB0YWtpbmcgY2dy
X2xvY2sgZWxzZXdoZXJlLg0KPiA+PiBUaGlzIGlzIGFscmVhZHkgZG9uZSBieSBxbWFuX3VwZGF0
ZV9jZ3IgYW5kIHFtYW5fZGVsZXRlX2NncjsgZml4IHRoZQ0KPiA+PiBvdGhlciBsb2NrZXJzLg0K
PiA+Pg0KPiA+PiBGaXhlczogYzUzNWU5MjNiYjk3ICgic29jL2ZzbDogSW50cm9kdWNlIERQQUEg
MS54IFFNYW4gZGV2aWNlIGRyaXZlciIpDQo+ID4NCj4gPiBJZiB5b3UndmUgaWRlbnRpZmllZCBz
bXBfY2FsbF9mdW5jdGlvbl9zaW5nbGUoKSBhcyB0aGUgcHJvYmxlbSwgdGhlbiB0aGUNCj4gPiB0
cnVlIGlzc3VlIHNlZW1zIHRvIGxpZSBpbiBjb21taXQgOTZmNDEzZjQ3Njc3ICgic29jL2ZzbC9x
Ym1hbjogZml4DQo+ID4gaXNzdWUgaW4gcW1hbl9kZWxldGVfY2dyX3NhZmUoKSIpIGFuZCBub3Qg
aW4gdGhlIGluaXRpYWwgY29tbWl0LCBubz8NCj4gDQo+IFllcywgdGhhdCBzZWVtcyBiZXR0ZXIu
IEkgZGlkIGEgYmxhbWUgYW5kIHNhdyB0aGF0IHFtYW5fZGVsZXRlX2Nncl9zYWZlDQo+IGhhZCBi
ZWVuIGFyb3VuZCBzaW5jZSB0aGUgaW5pdGlhbCBkcml2ZXIsIGJ1dCBJIGRpZG4ndCByZWFsaXpl
IGl0IHdvcmtlZA0KPiBpbiBhIGRpZmZlcmVudCB3YXkgYmFjayB0aGVuLg0KPiANCj4gLS1TZWFu
DQo+IA0KPiA+IEFueXdheSwNCj4gPg0KPiA+IFRlc3RlZC1ieTogVmxhZGltaXIgT2x0ZWFuIDx2
bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4NCg0KQXBhcnQgZnJvbSBWbGFkaW1pcidzIGNvbW1lbnQ6
DQpSZXZpZXdlZC1ieTogQ2FtZWxpYSBHcm96YSA8Y2FtZWxpYS5ncm96YUBueHAuY29tPg0K
