Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269A25F6EB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 11:55:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlNvC0WMwzDqRY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 19:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.94.47;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=RZI+7kQU; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlNs14rzzzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 19:53:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSBebtNFzyUqr9Xq/0AnUq8NfXboitbTI6c29FBA1+9ag+Se8p74oYYkffbXjOQtbd6m+Kkpdclf+PIUAp40g1U0uihtPxDqWTjZhBUZKfUjLliDO0Rn1CoaCZwXShdwcUXNyz6AO5NehM2Y4ePecx9lgqKqrxHIs+n9JRt8AW7ZKyiGI94hK7FzXzYk9EzZSUvHpcQ/2gCEkg8upZaqC6okCa65XviQm5CtdfpW1cE5/QxK6G8T58bmrWMhi3JkJ5De2zjR82SPr9/HA9pkr9xXQakj/vR1sFbFmly6BI4cYoBoXWG+187dtEeHKxWxaQfCcIR1KxIYPOpZ1tgV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp5akt9lhanK4Vh7ttcp37znZvaHQb8ExJZRlK6xp0E=;
 b=hOtsbBrbuEt80WxsSxNYGTIkRxw8ysGlaC+QRABFwU9W7+Ezt5kEtwVoWN022XDjzVk+nZd+VptA7yo18aJN6RIzParSvTad+iCMzPvz9hfMAtgh+1gFsr9ejA9V2WN18eB4kL9Pkk2VwPCopxfBOv5GzIzRL/4NWHZrEM4mFQRWJ9C6TLkvEzCMHlAKsXon99+gAddomNt7K6yIglt8qLkov21lKKcK65tp7TLGLoA7+2iajNlltZKrNaylYFYRYGks1Il95EQmjDc7RShDUhmFkixQe3gXPYPTPSyWY+9k1iSx6OmQWZtynKC+Mpb5iqhQCFDL0tCYIX152nqJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp5akt9lhanK4Vh7ttcp37znZvaHQb8ExJZRlK6xp0E=;
 b=RZI+7kQUZDnRPpMM1wg5CQaouQNBE7dpJrmzAZ4qGA11BB0n/acPA77SrBdTwUDNzj5kYipLKNyn/eGzJkyD1azJ+RBL3KAY+5538hdKeao/xgTBX8phpnMrQQDELhKlxE/y77Q4kyI2vLw21Da3MZjuENDDul67TpTCFlbEiLI=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1317.namprd10.prod.outlook.com
 (2603:10b6:903:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Mon, 7 Sep
 2020 09:53:26 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d%7]) with mapi id 15.20.3326.026; Mon, 7 Sep 2020
 09:53:26 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "broonie@kernel.org"
 <broonie@kernel.org>, "paulus@samba.org" <paulus@samba.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "Chris.Packham@alliedtelesis.co.nz"
 <Chris.Packham@alliedtelesis.co.nz>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAIAAfdcAgAD5u4CAB+sMAIAAYfwAgAEDTwCAAPtVgIAAOXwAgABIbACAAAjQgIABm7wAgAD5+gCABBXPAIAAjqOAgAALRACAAAUXgIAA9CsAgADXoQCAAFDQAIAETfoAgAVdPQA=
Date: Mon, 7 Sep 2020 09:53:26 +0000
Message-ID: <23d13439e4cc1872c29db2f93e715a61f4843943.camel@infinera.com>
References: <1598940515.6e06nwgi0c.astroid@bobo.none>
 <6054f0ec-d994-105b-6399-6cdb65ddd1b6@alliedtelesis.co.nz>
In-Reply-To: <6054f0ec-d994-105b-6399-6cdb65ddd1b6@alliedtelesis.co.nz>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.92 
authentication-results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a749b102-05df-4266-d2a0-08d85313ddd9
x-ms-traffictypediagnostic: CY4PR10MB1317:
x-microsoft-antispam-prvs: <CY4PR10MB1317289BDFFADB6486D481E1F4280@CY4PR10MB1317.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zfM82pAj6mBt6XpymncTRFDq4gdbLuElbcX+dEkNcOKYHNOs1uKK24lo33FW9fFm4vdgiNyqeNlWtTlkNVGC+TCOhTbELHYlu4HeacwWkk60eT9IDhjMl7E9DVsbTkjJLKtSXlPdOWXnlp6utn5SZYp3yRwt/0djJPbuY0UODyebuJU19RRiyBoypZuO8nxIm4rdQgVrNDXB02wB/jHSby0KHdQLefGKVMOoVw9Y4/3u0Li3kFYju+kOWfeYyociFNhij+7te+Y9DBYGpRx+SKMUIDPTrbqg3H5kI5+sGFX/UXRE6VJGvZGaIeayustnmc0019+AepwZNg++RoGIFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(26005)(186003)(30864003)(478600001)(86362001)(5660300002)(8676002)(2616005)(6512007)(66556008)(66946007)(53546011)(6486002)(91956017)(110136005)(76116006)(66446008)(66476007)(64756008)(54906003)(6506007)(316002)(71200400001)(4326008)(8936002)(83380400001)(7416002)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: FNvW117oowJPTfDo/Q60cOU/FAGtCws79btF8jSgSdLmKCTWK/on9JuJDe8X/RKXz8tQHibIaxxgmW1Eab/r2su1KKbLUoxud/KeqjpCx9PMWUrfpQTXBDi7JrxvK9HvMZsvHJPa5fQ2YfkTXcbOyeci5xx7QYChF1m+emElmOVyvk5NJP3cG4VkJCAagqR9LCsEhF0R8WcGVDE+DihbJESEzHuFsK/AenBSYzZkRY3qBv2RmaLFNCHnvQFnZ5X9Mc+TMHf4wOpGgZpTWKOe1R1npQroRZ3FgO13XuuiobzT5YjXnerqEa9o2bcGHRMN1tTrHCmXecHUEP0DxMS3ghmQClXgoxzSG7Q+0yCiTTn2yCu7wkyGnPg7kTg8cypn8uMvkymNoB66bUiNCBjJ7e0E0ZixbHnlXNSFolGWYNrE+d4ITe2+q9pTEp/Rw55/ds1ocjlEB1XVuLdfCiMVSII3hzvgrXH9IyxT+ZAdj5w0zQSzN6KKNtjCta75fM3Wi2KosiaZ1RNCAspi2K2gRMHFyfrGb0qx20xu7pwS6PGzeYzgTHjnNUF+3vsGANjgU4y+dMJPChE56FSeIBrXTaoSGQ1moIdUTwGZ/Zjn9ZF1xa8I/VVP0rh7yMxcfMILzonmmhcURrffmKcNGYwbww==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <74B5F6DFA44DA646ABCA96099235D2F5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a749b102-05df-4266-d2a0-08d85313ddd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 09:53:26.2370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZiAmzFn8Yd/8kNIyBTr7+ur5KdSsBhyUN5sdwd0SVEEyF9jeKdmLK3GlbURtKovBKq8JAwW/JW35Ch+wgltEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1317
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIwLTA5LTAzIGF0IDIzOjU4ICswMDAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdh
bml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiBPbiAxLzA5LzIwIDY6MTQgcG0sIE5pY2hvbGFzIFBpZ2dpbiB3cm90ZToNCj4gPiBF
eGNlcnB0cyBmcm9tIENocmlzIFBhY2toYW0ncyBtZXNzYWdlIG9mIFNlcHRlbWJlciAxLCAyMDIw
IDExOjI1IGFtOg0KPiA+ID4gT24gMS8wOS8yMCAxMjozMyBhbSwgSGVpbmVyIEthbGx3ZWl0IHdy
b3RlOg0KPiA+ID4gPiBPbiAzMC4wOC4yMDIwIDIzOjU5LCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
PiA+ID4gPiA+IE9uIDMxLzA4LzIwIDk6NDEgYW0sIEhlaW5lciBLYWxsd2VpdCB3cm90ZToNCj4g
PiA+ID4gPiA+IE9uIDMwLjA4LjIwMjAgMjM6MDAsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+ID4g
PiA+ID4gPiA+IE9uIDMxLzA4LzIwIDEyOjMwIGFtLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6DQo+
ID4gPiA+ID4gPiA+ID4gRXhjZXJwdHMgZnJvbSBDaHJpcyBQYWNraGFtJ3MgbWVzc2FnZSBvZiBB
dWd1c3QgMjgsIDIwMjAgODowNyBhbToNCj4gPiA+ID4gPiA+ID4gPHNuaXA+DQo+ID4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBJJ3ZlIGFsc28gbm93IHNlZW4gdGhlIFJY
IEZJRk8gbm90IGVtcHR5IGVycm9yIG9uIHRoZSBUMjA4MFJEQg0KPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAwLnNw
aTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElF
X0RPTiBpc24ndCBzZXQhDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTEx
MDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBi
dXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBmc2xfZXNw
aSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCByeC90eCBmaWZvJ3MgYXJlbid0IGVt
cHR5IQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBT
UElFX1JYQ05UID0gMSwgU1BJRV9UWENOVCA9IDMyDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBXaXRoIG15IGN1cnJlbnQgd29ya2Fyb3VuZCBv
ZiBlbXB0eWluZyB0aGUgUlggRklGTy4gSXQgc2VlbXMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gc3Vydml2YWJsZS4gSW50ZXJlc3RpbmdseSBpdCBvbmx5IGV2ZXIgc2VlbXMgdG8gYmUgMSBl
eHRyYSBieXRlIGluIHRoZQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBSWCBGSUZPIGFuZCBp
dCBzZWVtcyB0byBiZSBhZnRlciBlaXRoZXIgYSBSRUFEX1NSIG9yIGEgUkVBRF9GU1IuDQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBmc2xfZXNw
aSBmZmUxMTAwMDAuc3BpOiB0eCA3MA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBmc2xfZXNw
aSBmZmUxMTAwMDAuc3BpOiByeCAwMw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBmc2xfZXNw
aSBmZmUxMTAwMDAuc3BpOiBFeHRyYSBSWCAwMA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBm
c2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBz
ZXQhDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRy
YW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFNQSUVfUlhDTlQgPSAxLCBTUElF
X1RYQ05UID0gMzINCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAw
LnNwaTogdHggMDUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAw
LnNwaTogcnggMDANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAw
LnNwaTogRXh0cmEgUlggMDMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gZnNsX2VzcGkgZmZl
MTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25l
IGJ1dCByeC90eCBmaWZvJ3MgYXJlbid0IGVtcHR5IQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBTUElFX1JYQ05UID0gMSwgU1BJRV9UWENOVCA9IDMy
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHR4IDA1
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHJ4IDAw
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IEV4dHJh
IFJYIDAzDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiDCoMKgwqDCoMKgRnJvbSBhbGwgdGhlIE1pY3JvbiBTUEktTk9SIGRhdGFzaGVldHMgSSd2
ZSBnb3QgYWNjZXNzIHRvIGl0IGlzDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHBvc3NpYmxl
IHRvIGNvbnRpbnVhbGx5IHJlYWQgdGhlIFNSL0ZTUi4gQnV0IEkndmUgbm8gaWRlYSB3aHkgaXQN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gaGFwcGVucyBzb21lIHRpbWVzIGFuZCBub3Qgb3Ro
ZXJzLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gU28gSSB0aGluayBJJ3ZlIGdvdCBhIHJlcHJv
ZHVjdGlvbiBhbmQgSSB0aGluayBJJ3ZlIGJpc2VjdGVkIHRoZSBwcm9ibGVtDQo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiB0byBjb21taXQgMzI4MmEzZGEyNWJkICgicG93ZXJwYy82NDogSW1wbGVt
ZW50IHNvZnQgaW50ZXJydXB0IHJlcGxheSBpbg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gQyIp
LiBNeSBkYXkgaXMganVzdCBmaW5pc2hpbmcgbm93IHNvIEkgaGF2ZW4ndCBhcHBsaWVkIHRvbyBt
dWNoIHNjcnV0aW55DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiB0byB0aGlzIHJlc3VsdC4gR2l2
ZW4gdGhlIHZhcmlvdXMgcmFiYml0IGhvbGVzIEkndmUgYmVlbiBkb3duIG9uIHRoaXMNCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IGlzc3VlIGFscmVhZHkgSSdkIHRha2UgdGhpcyBpbmZvcm1hdGlv
biB3aXRoIGEgZ29vZCBkZWdyZWUgb2Ygc2tlcHRpY2lzbS4NCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IE9LLCBzbyBhbiBlYXN5IHRlc3Qgc2hvdWxkIGJl
IHRvIHJlLXRlc3Qgd2l0aCBhIDUuNCBrZXJuZWwuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gSXQg
ZG9lc24ndCBoYXZlIHlldCB0aGUgY2hhbmdlIHlvdSdyZSByZWZlcnJpbmcgdG8sIGFuZCB0aGUg
ZnNsLWVzcGkgZHJpdmVyDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gaXMgYmFzaWNhbGx5IHRoZSBz
YW1lIGFzIGluIDUuNyAoanVzdCB0d28gc21hbGwgY2hhbmdlcyBpbiA1LjcpLg0KPiA+ID4gPiA+
ID4gPiA+ID4gPiBUaGVyZSdzIDZjYzBjMTZkODJmODggYW5kIG1heWJlIGFsc28gb3RoZXIgaW50
ZXJydXB0IHJlbGF0ZWQgcGF0Y2hlcw0KPiA+ID4gPiA+ID4gPiA+ID4gPiBhcm91bmQgdGhpcyB0
aW1lIHRoYXQgY291bGQgYWZmZWN0IGJvb2sgRSwgc28gaXQncyBnb29kIGlmIHRoYXQgZXhhY3QN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gcGF0Y2ggaXMgY29uZmlybWVkLg0KPiA+ID4gPiA+ID4gPiA+
ID4gTXkgY29uZmlybWF0aW9uIGlzIGJhc2ljYWxseSB0aGF0IEkgY2FuIGluZHVjZSB0aGUgaXNz
dWUgaW4gYSA1LjQga2VybmVsDQo+ID4gPiA+ID4gPiA+ID4gPiBieSBjaGVycnktcGlja2luZyAz
MjgyYTNkYTI1YmQuIEknbSBhbHNvIGFibGUgdG8gImZpeCIgdGhlIGlzc3VlIGluDQo+ID4gPiA+
ID4gPiA+ID4gPiA1LjktcmMyIGJ5IHJldmVydGluZyB0aGF0IG9uZSBjb21taXQuDQo+ID4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IEkgYm90aCBjYXNlcyBpdCdzIG5vdCBleGFj
dGx5IGEgY2xlYW4gY2hlcnJ5LXBpY2svcmV2ZXJ0IHNvIEkgYWxzbw0KPiA+ID4gPiA+ID4gPiA+
ID4gY29uZmlybWVkIHRoZSBiaXNlY3Rpb24gcmVzdWx0IGJ5IGJ1aWxkaW5nIGF0IDMyODJhM2Rh
MjViZCAod2hpY2ggc2Vlcw0KPiA+ID4gPiA+ID4gPiA+ID4gdGhlIGlzc3VlKSBhbmQgdGhlIGNv
bW1pdCBqdXN0IGJlZm9yZSAod2hpY2ggZG9lcyBub3QpLg0KPiA+ID4gPiA+ID4gPiA+IFRoYW5r
cyBmb3IgdGVzdGluZywgdGhhdCBjb25maXJtcyBpdCB3ZWxsLg0KPiA+ID4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gPiA+IFtzbmlwIHBhdGNoXQ0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gPiA+ID4gSSBzdGlsbCBzYXcgdGhlIGlzc3VlIHdpdGggdGhpcyBjaGFuZ2UgYXBwbGllZC4g
UFBDX0lSUV9TT0ZUX01BU0tfREVCVUcNCj4gPiA+ID4gPiA+ID4gPiA+IGRpZG4ndCByZXBvcnQg
YW55dGhpbmcgKGVpdGhlciB3aXRoIG9yIHdpdGhvdXQgdGhlIGNoYW5nZSBhYm92ZSkuDQo+ID4g
PiA+ID4gPiA+ID4gT2theSwgaXQgd2FzIGEgYml0IG9mIGEgc2hvdCBpbiB0aGUgZGFyay4gSSBz
dGlsbCBjYW4ndCBzZWUgd2hhdA0KPiA+ID4gPiA+ID4gPiA+IGVsc2UgaGFzIGNoYW5nZWQuDQo+
ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gV2hhdCB3b3VsZCBjYXVzZSB0aGlzLCBh
IGxvc3QgaW50ZXJydXB0PyBBIHNwdXJpb3VzIGludGVycnVwdD8gT3INCj4gPiA+ID4gPiA+ID4g
PiBoaWdoZXIgaW50ZXJydXB0IGxhdGVuY3k/DQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+ID4gSSBkb24ndCB0aGluayB0aGUgcGF0Y2ggc2hvdWxkIGNhdXNlIHNpZ25pZmljYW50bHkg
d29yc2UgbGF0ZW5jeSwNCj4gPiA+ID4gPiA+ID4gPiAoaXQncyBzdXBwb3NlZCB0byBiZSBhIGJp
dCBiZXR0ZXIgaWYgYW55dGhpbmcgYmVjYXVzZSBpdCBkb2Vzbid0IHNldA0KPiA+ID4gPiA+ID4g
PiA+IHVwIHRoZSBmdWxsIGludGVycnVwdCBmcmFtZSkuIEJ1dCBpdCdzIHBvc3NpYmxlLg0KPiA+
ID4gPiA+ID4gPiBNeSB3b3JraW5nIHRoZW9yeSBpcyB0aGF0IHRoZSBTUElfRE9OIGluZGljYXRp
b24gaXMgYWxsIGFib3V0IHRoZSBUWA0KPiA+ID4gPiA+ID4gPiBkaXJlY3Rpb24gYW4gbm93IHRo
YXQgdGhlIGludGVycnVwdHMgYXJlIGZhc3RlciB3ZSdyZSBoaXR0aW5nIGFuIGVycm9yDQo+ID4g
PiA+ID4gPiA+IGJlY2F1c2UgdGhlcmUgaXMgc3RpbGwgUlggYWN0aXZpdHkgZ29pbmcgb24uIEhl
aW5lciBkaXNhZ3JlZXMgd2l0aCBteQ0KPiA+ID4gPiA+ID4gPiBpbnRlcnByZXRhdGlvbiBvZiB0
aGUgU1BJX0RPTiBpbmRpY2F0aW9uIGFuZCB0aGUgZmFjdCB0aGF0IGl0IGRvZXNuJ3QNCj4gPiA+
ID4gPiA+ID4gaGFwcGVuIGV2ZXJ5IHRpbWUgZG9lcyB0aHJvdyBkb3VidCBvbiBpdC4NCj4gPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJdCdzIHJpZ2h0IHRoYXQgdGhlIGVTUEkgc3BlYyBjYW4g
YmUgaW50ZXJwcmV0ZWQgdGhhdCBTUElfRE9OIHJlZmVycyB0bw0KPiA+ID4gPiA+ID4gVFggb25s
eS4gSG93ZXZlciB0aGlzIHdvdWxkbid0IHJlYWxseSBtYWtlIHNlbnNlLCBiZWNhdXNlIGFsc28g
Zm9yIFJYDQo+ID4gPiA+ID4gPiB3ZSBwcm9ncmFtIHRoZSBmcmFtZSBsZW5ndGgsIGFuZCB0aGVy
ZWZvcmUgd2FudCB0byBiZSBub3RpZmllZCBvbmNlIHRoZQ0KPiA+ID4gPiA+ID4gZnVsbCBmcmFt
ZSB3YXMgcmVjZWl2ZWQuIEFsc28gcHJhY3RpY2FsIGV4cGVyaWVuY2Ugc2hvd3MgdGhhdCBTUElf
RE9ODQo+ID4gPiA+ID4gPiBpcyBzZXQgYWxzbyBhZnRlciBSWC1vbmx5IHRyYW5zZmVycy4NCj4g
PiA+ID4gPiA+IFR5cGljYWwgU1BJIE5PUiB1c2UgY2FzZSBpcyB0aGF0IHlvdSB3cml0ZSByZWFk
IGNvbW1hbmQgKyBzdGFydCBhZGRyZXNzLA0KPiA+ID4gPiA+ID4gZm9sbG93ZWQgYnkgYSBsb25n
ZXIgcmVhZC4gSWYgdGhlIFRYLW9ubHkgaW50ZXJwcmV0YXRpb24gd291bGQgYmUgcmlnaHQsDQo+
ID4gPiA+ID4gPiB3ZSdkIGFsd2F5cyBlbmQgdXAgd2l0aCBTUElfRE9OIG5vdCBiZWluZyBzZXQu
DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gSSBjYW4ndCByZWFsbHkgZXhwbGFpbiB0aGUg
ZXh0cmEgUlggYnl0ZSBpbiB0aGUgZmlmby4gV2Uga25vdyBob3cgbWFueQ0KPiA+ID4gPiA+ID4g
PiBieXRlcyB0byBleHBlY3QgYW5kIHdlIHB1bGwgdGhhdCBtYW55IGZyb20gdGhlIGZpZm8gc28g
aXQncyBub3QgYXMgaWYNCj4gPiA+ID4gPiA+ID4gd2UncmUgbWlzc2luZyBhbiBpbnRlcnJ1cHQg
Y2F1c2luZyB1cyB0byBza2lwIHRoZSBsYXN0IGJ5dGUuIEkndmUgYmVlbg0KPiA+ID4gPiA+ID4g
PiBsb29raW5nIGZvciBzb21lIGtpbmQgb2Ygb2ZmLWJ5LW9uZSBjYWxjdWxhdGlvbiBidXQgYWdh
aW4gaWYgaXQgd2VyZQ0KPiA+ID4gPiA+ID4gPiBzb21ldGhpbmcgbGlrZSB0aGF0IGl0J2QgaGFw
cGVuIGFsbCB0aGUgdGltZS4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBNYXliZSBpdCBo
ZWxwcyB0byBrbm93IHdoYXQgdmFsdWUgdGhpcyBleHRyYSBieXRlIGluIHRoZSBGSUZPIGhhcy4g
SXMgaXQ6DQo+ID4gPiA+ID4gPiAtIGEgZHVwbGljYXRlIG9mIHRoZSBsYXN0IHJlYWQgYnl0ZQ0K
PiA+ID4gPiA+ID4gLSBvciB0aGUgbmV4dCBieXRlIChhdCA8ZW5kIGFkZHJlc3M+ICsgMSkNCj4g
PiA+ID4gPiA+IC0gb3IgYSBmaXhlZCB2YWx1ZSwgZS5nLiBhbHdheXMgMHgwMCBvciAweGZmDQo+
ID4gPiA+ID4gVGhlIHZhbHVlcyB3ZXJlIHVwIHRocmVhZCBhIGJpdCBidXQgSSdsbCByZXBlYXQg
dGhlbSBoZXJlDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTog
dHggNzANCj4gPiA+ID4gPiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiByeCAwMw0KPiA+ID4gPiA+
IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IEV4dHJhIFJYIDAwDQo+ID4gPiA+ID4gZnNsX2VzcGkg
ZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPiA+
ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZp
Zm8ncyBhcmVuJ3QgZW1wdHkhDQo+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJ
RV9SWENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAw
MC5zcGk6IHR4IDA1DQo+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogcnggMDANCj4g
PiA+ID4gPiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBFeHRyYSBSWCAwMw0KPiA+ID4gPiA+IGZz
bF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNl
dCENCj4gPiA+ID4gPiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBy
eC90eCBmaWZvJ3MgYXJlbid0IGVtcHR5IQ0KPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAwMC5z
cGk6IFNQSUVfUlhDTlQgPSAxLCBTUElFX1RYQ05UID0gMzINCj4gPiA+ID4gPiBmc2xfZXNwaSBm
ZmUxMTAwMDAuc3BpOiB0eCAwNQ0KPiA+ID4gPiA+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHJ4
IDAwDQo+ID4gPiA+ID4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogRXh0cmEgUlggMDMNCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGUgcnggMDAgRXh0cmEgUlggMDMgaXMgYSBi
aXQgY29uY2VybmluZy4gSSd2ZSBvbmx5IGV2ZXIgc2VlbiB0aGVtIHdpdGgNCj4gPiA+ID4gPiBl
aXRoZXIgYSBSRUFEX1NSIG9yIGEgUkVBRF9GU1IuIE5ldmVyIGEgZGF0YSByZWFkLg0KPiA+ID4g
PiA+IA0KPiA+ID4gPiBKdXN0IHJlbWVtYmVyZWQgc29tZXRoaW5nIGFib3V0IFNQSUVfRE9OOg0K
PiA+ID4gPiBUcmFuc2ZlcnMgYXJlIGFsd2F5cyBmdWxsIGR1cGxleCwgdGhlcmVmb3JlIGluIGNh
c2Ugb2YgYSByZWFkIHRoZSBjaGlwDQo+ID4gPiA+IHNlbmRzIGR1bW15IHplcm8ncy4gSGF2aW5n
IHNhaWQgdGhhdCBpbiBjYXNlIG9mIGEgcmVhZCBTUElFX0RPTiBtZWFucw0KPiA+ID4gPiB0aGF0
IHRoZSBsYXN0IGR1bW15IHplcm8gd2FzIHNoaWZ0ZWQgb3V0Lg0KPiA+ID4gPiANCj4gPiA+ID4g
UkVBRF9TUiBhbmQgUkVBRF9GU1IgYXJlIHRoZSBzaG9ydGVzdCB0cmFuc2ZlcnMsIDEgYnl0ZSBv
dXQgYW5kIDEgYnl0ZSBpbi4NCj4gPiA+ID4gU28gdGhlIGlzc3VlIG1heSBoYXZlIGEgZGVwZW5k
ZW5jeSBvbiB0aGUgbGVuZ3RoIG9mIHRoZSB0cmFuc2Zlci4NCj4gPiA+ID4gSG93ZXZlciBJIHNl
ZSBubyBnb29kIGV4cGxhbmF0aW9uIHNvIGZhci4gWW91IGNhbiB0cnkgYWRkaW5nIGEgZGVsYXkg
b2YNCj4gPiA+ID4gYSBmZXcgbWlyb3NlY29uZHMgYmV0d2VlbiB0aGUgZm9sbG93aW5nIHRvIGNv
bW1hbmRzIGluIGZzbF9lc3BpX2J1ZnMoKS4NCj4gPiA+ID4gDQo+ID4gPiA+IMKgwqDCoMKgZnNs
X2VzcGlfd3JpdGVfcmVnKGVzcGksIEVTUElfU1BJTSwgbWFzayk7DQo+ID4gPiA+IA0KPiA+ID4g
PiDCoMKgwqDCoC8qIFByZXZlbnQgZmlsbGluZyB0aGUgZmlmbyBmcm9tIGdldHRpbmcgaW50ZXJy
dXB0ZWQgKi8NCj4gPiA+ID4gwqDCoMKgwqBzcGluX2xvY2tfaXJxKCZlc3BpLT5sb2NrKTsNCj4g
PiA+ID4gDQo+ID4gPiA+IE1heWJlIGVuYWJsaW5nIGludGVycnVwdHMgYW5kIHNlZWluZyB0aGUg
U1BJRV9ET04gaW50ZXJydXB0IGFyZSB0b28gY2xvc2UuDQo+ID4gPiBJIHRoaW5rIHRoaXMgbWln
aHQgYmUgaGVhZGluZyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uLiBQbGF5aW5nIGFib3V0IHdpdGgN
Cj4gPiA+IGEgZGVsYXkgZG9lcyBzZWVtIHRvIG1ha2UgdGhlIHR3byBzeW1wdG9tcyBsZXNzIGxp
a2VseS4gQWx0aG91Z2ggSSBoYXZlDQo+ID4gPiB0byBzZXQgaXQgcXVpdGUgaGlnaCAoaS5lLiBt
c2xlZXAoMTAwKSkgdG8gY29tcGxldGVseSBhdm9pZCBhbnkNCj4gPiA+IHBvc3NpYmlsaXR5IG9m
IHNlZWluZyBlaXRoZXIgbWVzc2FnZS4NCj4gPiBUaGUgcGF0Y2ggbWlnaHQgcmVwbGF5IHRoZSBp
bnRlcnJ1cHQgYSBsaXR0bGUgYml0IGZhc3RlciwgYnV0IGl0IHdvdWxkDQo+ID4gYmUgYSBmZXcg
bWljcm9zZWNvbmRzIGF0IG1vc3QgSSB0aGluayAoanVzdCBmcm9tIGltcHJvdmVkIGNvZGUpLg0K
PiA+IA0KPiA+IFdvdWxkIHlvdSBiZSBhYmxlIHRvIGZ0cmFjZSB0aGUgaW50ZXJydXB0IGhhbmRs
ZXIgZnVuY3Rpb24gYW5kIHNlZSBpZiB5b3UNCj4gPiBjYW4gc2VlIGEgZGlmZmVyZW5jZSBpbiBu
dW1iZXIgb3IgdGltaW5nIG9mIGludGVycnVwdHM/IEknbSBhdCBhIGJpdCBvZg0KPiA+IGEgbG9z
cy4NCj4gDQo+IEkgdHJpZWQgZnRyYWNlIGJ1dCBJIHJlYWxseSB3YXNuJ3Qgc3VyZSB3aGF0IEkg
d2FzIGxvb2tpbmcgZm9yLg0KPiBDYXB0dXJpbmcgYSAiYmFkIiBjYXNlIHdhcyBwcmV0dHkgdHJp
Y2t5LiBCdXQgSSB0aGluayBJJ3ZlIGlkZW50aWZpZWQgYQ0KPiBmaXggKEknbGwgc2VuZCBpdCBh
cyBhIHByb3BlciBwYXRjaCBzaG9ydGx5KS4gVGhlIGdpc3QgaXMNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NwaS9zcGktZnNsLWVzcGkuYyBiL2RyaXZlcnMvc3BpL3NwaS1mc2wtZXNwaS5j
DQo+IGluZGV4IDdlN2M5MmNhZmRiYi4uY2IxMjBiNjhjMGUyIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3NwaS9zcGktZnNsLWVzcGkuYw0KPiArKysgYi9kcml2ZXJzL3NwaS9zcGktZnNsLWVzcGku
Yw0KPiBAQCAtNTc0LDEzICs1NzQsMTQgQEAgc3RhdGljIHZvaWQgZnNsX2VzcGlfY3B1X2lycShz
dHJ1Y3QgZnNsX2VzcGkNCj4gKmVzcGksIHUzMiBldmVudHMpDQo+IMKgwqBzdGF0aWMgaXJxcmV0
dXJuX3QgZnNsX2VzcGlfaXJxKHMzMiBpcnEsIHZvaWQgKmNvbnRleHRfZGF0YSkNCj4gwqDCoHsN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGZzbF9lc3BpICplc3BpID0gY29udGV4dF9kYXRh
Ow0KPiAtICAgICAgIHUzMiBldmVudHM7DQo+ICsgICAgICAgdTMyIGV2ZW50cywgbWFzazsNCj4g
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9jaygmZXNwaS0+bG9jayk7DQo+IA0KPiDCoMKg
wqDCoMKgwqDCoMKgwqAvKiBHZXQgaW50ZXJydXB0IGV2ZW50cyh0eC9yeCkgKi8NCj4gwqDCoMKg
wqDCoMKgwqDCoMKgZXZlbnRzID0gZnNsX2VzcGlfcmVhZF9yZWcoZXNwaSwgRVNQSV9TUElFKTsN
Cj4gLSAgICAgICBpZiAoIWV2ZW50cykgew0KPiArICAgICAgIG1hc2sgPSBmc2xfZXNwaV9yZWFk
X3JlZyhlc3BpLCBFU1BJX1NQSU0pOw0KPiArICAgICAgIGlmICghKGV2ZW50cyAmIG1hc2spKSB7
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX3VubG9jaygmZXNwaS0+
bG9jayk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gSVJRX05P
TkU7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gDQo+IFRoZSBTUElFIHJlZ2lzdGVyIGNvbnRh
aW5zIHRoZSBUWENOVCBzbyBldmVudHMgaXMgcHJldHR5IG11Y2ggYWx3YXlzDQo+IGdvaW5nIHRv
IGhhdmUgc29tZXRoaW5nIHNldC4gQnkgY2hlY2tpbmcgZXZlbnRzIGFnYWluc3Qgd2hhdCB3ZSd2
ZQ0KPiBhY3R1YWxseSByZXF1ZXN0ZWQgaW50ZXJydXB0cyBmb3Igd2UgZG9uJ3Qgc2VlIGFueSBz
cHVyaW91cyBldmVudHMuDQo+IA0KPiBJJ3ZlIHRlc3RlZCB0aGlzIG9uIHRoZSBUMjA4MFJEQiBh
bmQgb24gb3VyIGN1c3RvbSBoYXJkd2FyZSBhbmQgaXQgc2VlbXMNCj4gdG8gcmVzb2x2ZSB0aGUg
cHJvYmxlbS4NCj4gDQoNCkkgbG9va2VkIGF0IHRoZSBmc2xfZXNwaV9pcnEoKSB0b28gYW5kIG5v
dGljZWQgdGhhdCBjbGVhcmluZyBvZiB0aGUgSVJRIGV2ZW50cw0KYXJlIGFmdGVyIHByb2Nlc3Np
bmcgVFgvUlguIFRoYXQgbG9va3MgYSBiaXQgb2RkIHRvIG1lLg0KDQogIEpvY2tlDQo=
