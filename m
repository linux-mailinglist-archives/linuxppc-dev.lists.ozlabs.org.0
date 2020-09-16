Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7FF26BD6A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 08:42:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrrBF32JTzDqNn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 16:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe05::620;
 helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=M8zAfyPd; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brr8K4FWZzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 16:40:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGp+49U9bFMra/7k4fkikyhyK2p0vk99ko6t+zrndlG5owGhYQbCqX5pAxgiymuNsGdscxgOODg4EqMaEiFbA4EOzg24Z1U/gZkZ8xh4KDIUrXoCD/c6wZ1HGKkNNYClc6FRHzX+3tFnUEUhB7Jy2Qo/mlrV+65TPp3plQGLsLVQ6mpJp6sSBCEOAqzBsVBiCqIK2nbGI04RDi3RmtraRiIXKJ87vqo4ftjX4Ov4kUK1HM67bHQzVyH08Gw1pMLwAPwwXdZXu7lLOV7TsLVoExcaZAL2WesCgv9GFccCbBJ1LhLR4ogPIuey6aEWzhlVPZ43G/vuCEupkJ6nfjWxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDC9bF/jOQsBiRcAlPmmQL7H2uM+CqyIRFMH+kRMvMI=;
 b=BvcVFV63xNIzzke1lMs8uGAHz874utGLSt6VRLWrd0i1wAKyfdiVUj/tMc/cduYvM9Flh/AuEZQROyHqwgFHGgrvE/PwLt4FLzMUMnYqyytXlVLlhiXb+5mD5lW+ih7jOmtxkyETbgbXQxwfZqdmGLB+3hPFxzfmrRPGBXPJUpmaUX6Uze3oPjXhBQj8RkoUzMGITXr+ImRpCdIZa8e1wAyYGr5QM+9/JisC9bl5fAsfQ/wRC/BtotgKopLzWMkhwSV/sqEJ4IulGNeTiHWM0xKyRO29v8nCBKZH1T54W0RYGZoZPXQ4G8jLsHvecjwhLYydJUBu3eRy/YLDtkjFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDC9bF/jOQsBiRcAlPmmQL7H2uM+CqyIRFMH+kRMvMI=;
 b=M8zAfyPdcRBa/wVPx0ygQxuxYs8a/4khTl/Z+UDRLgHcQBCqFxUEYnBbyWvh4b5Y6F2gGWJKZpJvMmIoHYqMu2+h6c1Vvsd8zYHDV7IXjtouaU3YUfHFK68GyJwjFCw3xKvhbDw5xe/+jYSLo8trzn2eLJJPSK5wVCpWYBU/gwk=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB5815.eurprd04.prod.outlook.com (2603:10a6:20b:b0::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 06:40:40 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 06:40:40 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Ard Biesheuvel <ard.biesheuvel@arm.com>, kuldip dwivedi
 <kuldip.dwivedi@puresoftware.com>, Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] soc: fsl: rcpm: Add ACPI support
Thread-Topic: [PATCH v1] soc: fsl: rcpm: Add ACPI support
Thread-Index: AQHWi1Bdrf69Hjks3kmx49279KDQI6lpiwOAgADt6GCAAFCjAIAABUwg
Date: Wed, 16 Sep 2020 06:40:39 +0000
Message-ID: <AM6PR04MB5413488247501D00A2CC95C6F1210@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200915110647.846-1-kuldip.dwivedi@puresoftware.com>
 <4e008f0a-69da-d5c2-4dfc-ef8695e17f47@arm.com>
 <AM6PR04MB5413903EAAEDB2EED2E254C6F1210@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <caf01871-1c3d-bdf8-867d-daf7138966a8@arm.com>
In-Reply-To: <caf01871-1c3d-bdf8-867d-daf7138966a8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 682477e7-72f4-41c9-505a-08d85a0b6d93
x-ms-traffictypediagnostic: AM6PR04MB5815:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5815B5155F84AB78796BA9F1F1210@AM6PR04MB5815.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8xFzXBbimUyB20T6kU3q7Z2lL9b1m0LaXKiJRehTLVilHcVG7G+xTgH6emF9bPKSZVrE7nplbn/ZZWWVA84kJVz59v99jyArDEbYZfYtxY3r+banp5df2XEI1Vmjr6fzgPgJcYwU0pict+YVrQiVi+GDm/G6j8Z0deW+YAohkvp7UBcoljbNaoU+lnthFotkfdX8dNlzuMv8YA6HsLgZp3en5iy+BMAT+bi6i/Oz1S0EiDH8bU0awnzpu/DN8WfkXzxJnOSjjvAcrtkUX56PVf4wIZ3zJa+4woFmHHs9k41P2KPi3aFtMo2x9HC2IiXLXfD1GaAa140CEz5hl8zlvieuNocpkKprzcfVJivAjEE3Iqnpt/IxSjKWtS7KCh5X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(66946007)(9686003)(8676002)(6506007)(5660300002)(86362001)(53546011)(66446008)(71200400001)(54906003)(7696005)(110136005)(33656002)(66476007)(76116006)(64756008)(66556008)(26005)(316002)(2906002)(52536014)(186003)(55016002)(8936002)(478600001)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: t6ytKXKv9HLEkSsNGnLtnKmjfxHVhRkNgBgjm4ZmYIwdtjymci4Fno/mcQJSMcwAvxKm/zIdEWVF01rn16FKVb9ZHeyK0iVIThLYBeN3FFnZlExB9YEFRtB4fQSG9m39PoNvr+QzHO5xaYDyn1YE/1JRyW2hlN3twyB7tqdyWJ3TIGGJihL9zd/phU+KjyQOYWiNQPAXhfIBZDmR9PwrrPEo8IPIo1LvHM7och5dl8220LP64TXseBMeq+qUMamvKlCxjCx4utesDZggKvlmz7VufDGkqCmPVdUWbw/TBpzEvrF0l1UycndEJPnfHqMfJa+fpdGIXlp8ZtBVV1QiQVzihZDMcF9e9Do8KB0VZkFFdlkD2BJ+B5lU6NXd7WoxaTjRqr7s+Hsjqq+EN2ZfvwBfQgeBT7P6GUOMe35LCVbrRJNGs+4mexqtVCm2e7VyVtVG1HbYL0tg9mqzRQTbdJDB0ZDJUHEYz1tSmm6YjeeUl7kQB0HIVDhS10HSDEbKuC1NuH1tZ5qZ38tFo8r0UI14G9aOAMYTOCshPp4ovPf37iBGnfFynDrrcawDdzLZYp1+k5+SqLCc4/fFamE4+xsTWOb4iUFSUnAQ23FCq9ChHe0Vr6x9Lf2T8oj2JfWDvJAOxE6t3guWxxh5N6RQmg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682477e7-72f4-41c9-505a-08d85a0b6d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 06:40:40.0547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+/t69wFctefpdX7l8Yds+wkDTIb769PaAMpRoIZ80YiQnb/4xDGtPr/RaDDZwz2xCy7SmYGxZDbhDEjPT8xDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5815
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
Cc: Biwen Li <biwen.li@nxp.com>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 Arokia Samy <arokia.samy@nxp.com>, Paul Yang <Paul.Yang@arm.com>,
 Varun Sethi <V.Sethi@nxp.com>, tanveer <tanveer.alam@puresoftware.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQXJkLA0KDQpPbiBXZWRuZXNkYXksIFNlcHRlbWJlciAxNiwgMjAyMCAyOjExIFBNLCBBcmQg
Qmllc2hldXZlbCB3cm90ZToNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MV0gc29jOiBmc2w6IHJj
cG06IEFkZCBBQ1BJIHN1cHBvcnQNCj4gDQo+IE9uIDkvMTYvMjAgMzozMiBBTSwgUmFuIFdhbmcg
d3JvdGU6DQo+ID4gSGkgQXJkLA0KPiA+DQo+ID4gT24gVHVlc2RheSwgU2VwdGVtYmVyIDE1LCAy
MDIwIDc6MTAgUE0sIEFyZCBCaWVzaGV1dmVsIHdyb3RlOg0KPiA+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHYxXSBzb2M6IGZzbDogcmNwbTogQWRkIEFDUEkgc3VwcG9ydA0KPiA+Pg0KPiA+PiBPbiA5
LzE1LzIwIDE6MDYgUE0sIGt1bGRpcCBkd2l2ZWRpIHdyb3RlOg0KPiA+Pj4gQWRkIEFDUEkgc3Vw
cG9ydCBpbiBmc2wgUkNQTSBkcml2ZXIuIFRoaXMgaXMgcmVxdWlyZWQgdG8gc3VwcG9ydA0KPiA+
Pj4gQUNQSQ0KPiA+Pj4gUzMgc3RhdGUuIFMzIGlzIHRoZSBBQ1BJIHNsZWVwIHN0YXRlIHRoYXQg
aXMga25vd24gYXMgInNsZWVwIiBvcg0KPiA+Pj4gInN1c3BlbmQgdG8gUkFNIi4NCj4gPj4+IEl0
IGVzc2VudGlhbGx5IHR1cm5zIG9mZiBtb3N0IHBvd2VyIG9mIHRoZSBzeXN0ZW0gYnV0IGtlZXBz
IG1lbW9yeQ0KPiA+Pj4gcG93ZXJlZC4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiB0YW52
ZWVyIDx0YW52ZWVyLmFsYW1AcHVyZXNvZnR3YXJlLmNvbT4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6
IGt1bGRpcCBkd2l2ZWRpIDxrdWxkaXAuZHdpdmVkaUBwdXJlc29mdHdhcmUuY29tPg0KPiA+Pg0K
PiA+PiBXaHkgZG9lcyB0aGUgT1MgbmVlZCB0byBwcm9ncmFtIHRoaXMgZGV2aWNlPyBDYW4ndCB0
aGlzIGJlIGRvbmUgYnkNCj4gPj4gZmlybXdhcmU/DQo+ID4NCj4gPiBUaGlzIGRldmljZSBpcyB1
c2UgdG8gdGVsbCBIVyB3aGljaCBJUCAoc3VjaCBhcyBVU0IsIFNESEMsIFNBVEEsIGV0YykNCj4g
PiBzaG91bGQgbm90IGJlIGNsb2NrIGdhdGVkIGR1cmluZyBzeXN0ZW0gZW50ZXIgbG93IHBvd2Vy
IHN0YXRlICh0bw0KPiA+IGFsbG93IHRoYXQgSVAgd29yayBhcyBhIHdha2V1cCBzb3VyY2UpLiBB
bmQgdXNlciBkb2VzIHRoaXMgY29uZmlndXJhdGlvbiBpbg0KPiBkZXZpY2UgdHJlZS4NCj4gDQo+
IFRoZSBwb2ludCBvZiBBQ1BJIGlzICpub3QqIHRvIGRlc2NyaWJlIGEgRFQgdG9wb2xvZ3kgdXNp
bmcgYSB0YWJsZSBmb3JtYXQgdGhhdA0KPiBpcyBub3Qgc3VpdGVkIGZvciBpdC4gVGhlIHBvaW50
IG9mIEFDUEkgaXMgdG8gZGVzY3JpYmUgYSBtYWNoaW5lIHRoYXQgaXMgbW9yZQ0KPiBhYnN0cmFj
dGVkIGZyb20gdGhlIGhhcmR3YXJlIHRoYW4gaXMgdHlwaWNhbGx5IHBvc3NpYmxlIHdpdGggRFQs
IHdoZXJlIHRoZQ0KPiBhYnN0cmFjdGlvbnMgYXJlIGltcGxlbWVudGVkIGJ5IEFNTCBjb2RlIHRo
YXQgaXMgcHJvdmlkZWQgYnkgdGhlIGZpcm13YXJlLA0KPiBidXQgZXhlY3V0ZWQgaW4gdGhlIGNv
bnRleHQgb2YgdGhlIE9TLg0KPiANCj4gU28gdGhlIGlkZWEgaXMgKm5vdCogZmluZGluZyB0aGUg
c2hvcnRlc3QgcG9zc2libGUgcGF0aCB0byBnZXQgeW91ciBleGlzdGluZyBEVA0KPiBkcml2ZXIg
Y29kZSBydW5uaW5nIG9uIGEgc3lzdGVtIHRoYXQgYm9vdHMgdmlhIEFDUEkuDQo+IEluc3RlYWQs
IHlvdSBzaG91bGQgY2FyZWZ1bGx5IHRoaW5rIGFib3V0IHRoZSBhYnN0cmFjdCBBQ1BJIG1hY2hp
bmUgdGhhdCB5b3UNCj4gd2lsbCBleHBvc2UgdG8gdGhlIE9TLCBhbmQgaGlkZSBldmVyeXRoaW5n
IGVsc2UgaW4gZmlybXdhcmUuDQo+IA0KPiBJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgaXQgc2Vl
bXMgbGlrZSB5b3VyIFVTQiwgU0RIQyBhbmQgU0FUQSBkZXZpY2Ugb2JqZWN0cw0KPiBtYXkgbmVl
ZCBwb3dlciBzdGF0ZSBkZXBlbmRlbnQgQU1MIG1ldGhvZHMgdGhhdCBwcm9ncmFtIHRoaXMgYmxv
Y2sNCj4gZGlyZWN0bHkuDQoNCkFjdHVhbGx5IHRoZSBzY2VuYXJpbyBpcyBhIGxpdHRsZSBiaXQg
Y29tcGxpY2F0ZWQgZm9yIFJDUE0gZnVuY3Rpb246IGl0IG5lZWQgdG8gcXVlcnkNCmtlcm5lbCB3
YWtldXAgc291cmNlIGZyYW1ld29yayAoc2VlIGZvcl9lYWNoX3dha2V1cF9zb3VyY2Uod3MpKSB0
byBmZXRjaCBhbGwNCnBvdGVudGlhbCBjYW5kaWRhdGVzIHRoZW4gZG8gdGhlIHByb2dyYW1taW5n
IGFjY29yZGluZ2x5LiBJZiB3ZSBpbXBsZW1lbnQNCnRoaXMgbG9naWMgaW4gQU1MIG1ldGhvZHMs
IEkgaGF2ZSBubyBpZGVhIGhvdyB0byBjb2xsZWN0IHRob3NlIGluZm9ybWF0aW9uIHN0b3JlZCBp
bg0Kd2FrZXVwIHNvdXJjZSBkYXRhIG9mIGtlcm5lbC4NCg0KUmVnYXJkcywNClJhbg0KDQo+IA0K
PiANCj4gPiBTbyBpbXBsZW1lbnQNCj4gPiB0aGlzIFJDUE0gZHJpdmVyIHRvIGRvIGl0IGluIGtl
cm5lbCByYXRoZXIgdGhhbiBmaXJtd2FyZS4NCj4gPg0KPiA+IFJlZ2FyZHMsDQo+ID4gUmFuDQo+
ID4NCj4gPj4+IC0tLQ0KPiA+Pj4NCj4gPj4+IE5vdGVzOg0KPiA+Pj4gICAgICAgMS4gQWRkIEFD
UEkgbWF0Y2ggdGFibGUNCj4gPj4+ICAgICAgIDIuIE5YUCB0ZWFtIG1lbWJlcnMgYXJlIGFkZGVk
IGZvciBjb25maXJtaW5nIEhJRCBjaGFuZ2VzDQo+ID4+PiAgICAgICAzLiBUaGVyZSBpcyBvbmx5
IG9uZSBub2RlIGluIEFDUEkgc28gbm8gbmVlZCB0byBjaGVjayBmb3INCj4gPj4+ICAgICAgICAg
IGN1cnJlbnQgZGV2aWNlIGV4cGxpY2l0bHkNCj4gPj4+ICAgICAgIDQuIFRoZXNlIGNoYW5nZXMg
YXJlIHRlc3RlZCBvbiBMWDIxNjBBIGFuZCBMUzEwNDZBIHBsYXRmb3Jtcw0KPiA+Pj4NCj4gPj4+
ICAgIGRyaXZlcnMvc29jL2ZzbC9yY3BtLmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0tDQo+
ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3JjcG0uYyBiL2RyaXZl
cnMvc29jL2ZzbC9yY3BtLmMgaW5kZXgNCj4gPj4+IGEwOTNkYmU2ZDJjYi4uZTc1YTQzNmZiMTU5
IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3JjcG0uYw0KPiA+Pj4gKysrIGIv
ZHJpdmVycy9zb2MvZnNsL3JjcG0uYw0KPiA+Pj4gQEAgLTIsMTAgKzIsMTIgQEANCj4gPj4+ICAg
IC8vDQo+ID4+PiAgICAvLyByY3BtLmMgLSBGcmVlc2NhbGUgUW9ySVEgUkNQTSBkcml2ZXINCj4g
Pj4+ICAgIC8vDQo+ID4+PiAtLy8gQ29weXJpZ2h0IDIwMTkgTlhQDQo+ID4+PiArLy8gQ29weXJp
Z2h0IDIwMTktMjAyMCBOWFANCj4gPj4+ICsvLyBDb3B5cmlnaHQgMjAyMCBQdXJlc29mdHdhcmUg
THRkLg0KPiA+Pj4gICAgLy8NCj4gPj4+ICAgIC8vIEF1dGhvcjogUmFuIFdhbmcgPHJhbi53YW5n
XzFAbnhwLmNvbT4NCj4gPj4+DQo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4NCj4gPj4+
ICAgICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+ID4+PiAgICAjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+DQo+ID4+PiAgICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+IEBAIC01
Nyw4ICs1OSwxMyBAQCBzdGF0aWMgaW50DQo+ID4+PiByY3BtX3BtX3ByZXBhcmUoc3RydWN0IGRl
dmljZSAqZGV2KQ0KPiA+Pj4gICAgCQkJCXJjcG0tPndha2V1cF9jZWxscyArIDEpOw0KPiA+Pj4N
Cj4gPj4+ICAgIAkJLyogIFdha2V1cCBzb3VyY2Ugc2hvdWxkIHJlZmVyIHRvIGN1cnJlbnQgcmNw
bSBkZXZpY2UgKi8NCj4gPj4+IC0JCWlmIChyZXQgfHwgKG5wLT5waGFuZGxlICE9IHZhbHVlWzBd
KSkNCj4gPj4+IC0JCQljb250aW51ZTsNCj4gPj4+ICsJCWlmIChpc19hY3BpX25vZGUoZGV2LT5m
d25vZGUpKSB7DQo+ID4+PiArCQkJaWYgKHJldCkNCj4gPj4+ICsJCQkJY29udGludWU7DQo+ID4+
PiArCQl9IGVsc2Ugew0KPiA+Pj4gKwkJCWlmIChyZXQgfHwgKG5wLT5waGFuZGxlICE9IHZhbHVl
WzBdKSkNCj4gPj4+ICsJCQkJY29udGludWU7DQo+ID4+PiArCQl9DQo+ID4+Pg0KPiA+Pj4gICAg
CQkvKiBQcm9wZXJ0eSAiI2ZzbCxyY3BtLXdha2V1cC1jZWxscyIgb2YgcmNwbSBub2RlIGRlZmlu
ZXMgdGhlDQo+ID4+PiAgICAJCSAqIG51bWJlciBvZiBJUFBERVhQQ1IgcmVnaXN0ZXIgY2VsbHMs
IGFuZCAiZnNsLHJjcG0td2FrZXVwIg0KPiA+Pj4gQEAgLTEzOSwxMCArMTQ2LDE5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4+PiByY3BtX29mX21hdGNoW10NCj4gPj4g
PSB7DQo+ID4+PiAgICB9Ow0KPiA+Pj4gICAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcmNwbV9v
Zl9tYXRjaCk7DQo+ID4+Pg0KPiA+Pj4gKyNpZmRlZiBDT05GSUdfQUNQSQ0KPiA+Pj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgcmNwbV9hY3BpX21hdGNoW10gPSB7DQo+ID4+
PiArCXsgIk5YUDAwMTUiLCB9LA0KPiA+Pj4gKwl7IH0NCj4gPj4+ICt9Ow0KPiA+Pj4gK01PRFVM
RV9ERVZJQ0VfVEFCTEUoYWNwaSwgcmNwbV9hY3BpX21hdGNoKTsgI2VuZGlmDQo+ID4+PiArDQo+
ID4+PiAgICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciByY3BtX2RyaXZlciA9IHsNCj4g
Pj4+ICAgIAkuZHJpdmVyID0gew0KPiA+Pj4gICAgCQkubmFtZSA9ICJyY3BtIiwNCj4gPj4+ICAg
IAkJLm9mX21hdGNoX3RhYmxlID0gcmNwbV9vZl9tYXRjaCwNCj4gPj4+ICsJCS5hY3BpX21hdGNo
X3RhYmxlID0gQUNQSV9QVFIocmNwbV9hY3BpX21hdGNoKSwNCj4gPj4+ICAgIAkJLnBtCT0gJnJj
cG1fcG1fb3BzLA0KPiA+Pj4gICAgCX0sDQo+ID4+PiAgICAJLnByb2JlID0gcmNwbV9wcm9iZSwN
Cj4gPj4+DQo+ID4NCg0K
