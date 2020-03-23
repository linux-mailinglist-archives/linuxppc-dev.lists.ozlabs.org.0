Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5A218F8E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:47:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mJfX23VMzDrF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 02:47:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mJby3C3tzDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:45:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=CPXXHosH; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mJbx38T5z9Bry
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:45:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mJbx23N2z9sRN; Tue, 24 Mar 2020 02:45:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.94.84;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=CPXXHosH; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mJbw6GsZz9sR4
 for <linuxppc-dev@ozlabs.org>; Tue, 24 Mar 2020 02:44:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCIfWe7a3047peyhmRLDvnO4ymRr5d9Jz0gZfHkRHGW2tHFlR5nnDEo0r1l/tUgwwKGRCafiV0dO0Zs36vfUpJGfGGfPm9Fm78/E3pGYcmBg5aKT+HqHvhWGxSbVOaMstI4SbbJmU9GXhZ60NBU3pv8cwHF1GMXYaYjct118s78y8nbm752Hkp3wWc4kilrlETovJ9GHO7gCEnite0IWNXvBx3Ul6S35v60w7JxnauQ3WiDIgKgH6GVkaZhi86MdCkqYUdw/qB+n8QYyGhLe26m2AiVXP9urECYssVEU9Xa3dieA1z77vIMK34CPahjF4Rtm5AfDqCAijK5l6KYczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z+iwVHL8jsR6iwdMKNaTCeIK3W4T4Rn8bV1x4LNCPw=;
 b=LuIXfw0O368UABg1OrtRjesKKlsENmqZFX7HgTJPzwIDSmRoprtBK+LLTJlXu/pFefB3HmBxgAnF5woODJUffVnnWoyATf7kT6LsuUmwjeEKrCUeifMhn3+it//Luw0uGYilGQzD9o17yFOcOH2g9bg8MK+NL2LXrha/ITFXRzNpG4UAGe3BIpo7ZBu36t1Gn24pYSpHzh/RrmwGkj17JQxaS1tiTHWkIrkNgVnseym8K5uF4iiRFgQV7u3H/kiNjVBewC1Rek6JPENrl4x60JiEszy0hsuAnALgKtXQOIh9jeiuf3mAE4oz1cVQ0w87kFYFzP5YdtOxIwcRCqU5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z+iwVHL8jsR6iwdMKNaTCeIK3W4T4Rn8bV1x4LNCPw=;
 b=CPXXHosHEeF4euX6I2WVuJX1UttUxZbVR1JI29rF9AW2KOuEk0tnG1AR/9G4xhhAMZl5mK6pr3Ysp2dp1gbtuOUbmoSiB6UuF68BxbH7PMpQBdIIrtJ10dNGQg5SxavdmYeOvoZBUJP2eE0p9duUCbRLaOgOzCQ0NsW9yEiCyBc=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3361.namprd10.prod.outlook.com (2603:10b6:408:d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19; Mon, 23 Mar
 2020 15:44:55 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47%5]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 15:44:55 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: Re: hardcoded SIGSEGV in __die() ?
Thread-Topic: hardcoded SIGSEGV in __die() ?
Thread-Index: AQHWAR3N4DoCknJ4G0WRUpvoA7Tp+6hWQKiAgAAAbwCAAAadgIAABlwAgAADsgA=
Date: Mon, 23 Mar 2020 15:44:55 +0000
Message-ID: <6b3484a7bf0f760570fbe7c8b22c36a244c19ff6.camel@infinera.com>
References: <73da05c0f54692a36471a2539dbd9b30594b687a.camel@infinera.com>
 <b20d978b-268b-773a-a43e-7ff4c741f2df@c-s.fr>
 <c14de482-6784-f1ac-f675-d771e55ac688@c-s.fr>
 <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
 <43a21b20-4214-1043-0919-1bd8078d14a6@c-s.fr>
In-Reply-To: <43a21b20-4214-1043-0919-1bd8078d14a6@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.35.92 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0748997a-d0eb-4f1a-e658-08d7cf412267
x-ms-traffictypediagnostic: BN8PR10MB3361:
x-microsoft-antispam-prvs: <BN8PR10MB33610472104570D7CBC9B1A2F4F00@BN8PR10MB3361.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(81156014)(66446008)(6506007)(110136005)(316002)(6512007)(45080400002)(478600001)(966005)(5660300002)(66946007)(66476007)(66556008)(91956017)(76116006)(86362001)(81166006)(8936002)(2616005)(64756008)(6486002)(8676002)(71200400001)(2906002)(186003)(36756003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3361;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pEj+FWa+EkyyHC1QcqKruo9F9sqmhBUhHzcFeiAEPb5ON92PIP8gMkhuH2z7uF3hTl9RZ6Ykq2yJDWUkDbim73iz5pgxU4r8M688G5dNljYmvAq1YniMZ4mMMTz1Z1j70nvsGwgPauTXALAcGDo4JV+/6yfMWAvmc111sjYD1mJzlNxjCI5yStphYdQIsXkSoWHwJxoYPpxRJ2syThmNfiO7tLg6Z0qDpodHPg+LeL3m73RcRVtPHjcU17neogTq6YMBn9VEvBrjoz/HnkH8xiFGkDm/VLEX9xYOkuBoLg72AB3J/jJcLZj14pkTx4bAValz8euEvH03FrDgw/Cot0iHx3tautgK6DPtvWDFr3BVh5Zvh9+DcLzwLB47cxdXmqyQggibc5JIcCEFBtnoESeiOvf0UPKG3KW0OU44F7kCtixwQ4gR2oZuUNsiDH8r/yAILqArGHtc/a6rUo2vtai13Nq8TN0SIDBfCTZHe6oL2F72CpWJgkY0sCfe6ux70x1e2kjqStkcbl2ySR56ng==
x-ms-exchange-antispam-messagedata: +WiI6sYuFamquHYhlg0yPnO2qTcgsRZ+5JRNXDMikmtg3M4JPV1F3TQgp0PATPORUtSjSa0phQPiXsBgxb3lwwuAOKe/zzaBUj07dF0/9jzhXA7fQYG5naYutA3qo8OdOjHve3W8nEdUh6bmYeeE3Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A7387637D95484096E606C27B259BCA@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0748997a-d0eb-4f1a-e658-08d7cf412267
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 15:44:55.1463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4JmqMTjCj0voVQF5pifSNOi/Ma9np6LjYfKlBaGhYrNPurUx+lVYE8igR/liTuuvDuKBM2juz8jaCTJE45NHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3361
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIwLTAzLTIzIGF0IDE2OjMxICswMTAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiANCj4gTGUgMjMvMDMvMjAyMCDDoCAxNjowOCwgSm9ha2ltIFRqZXJubHVuZCBhIMOpY3Jp
dCA6DQo+ID4gT24gTW9uLCAyMDIwLTAzLTIzIGF0IDE1OjQ1ICswMTAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPiA+ID4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0
c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250
ZW50IGlzIHNhZmUuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gTGUgMjMvMDMvMjAyMCDDoCAxNTo0
MywgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdCA6DQo+ID4gPiA+IExlIDIzLzAzLzIwMjAgw6Ag
MTU6MTcsIEpvYWtpbSBUamVybmx1bmQgYSDDqWNyaXQgOg0KPiA+ID4gPiA+IEluIF9fZGllKCks
IHNlZSBiZWxvdywgdGhlcmUgaXMgdGhpcyBjYWxsIHRvIG5vdGlmeV9zZW5kKCkgd2l0aA0KPiA+
ID4gPiA+IFNJR1NFR1YgaGFyZGNvZGVkLCB0aGlzIHNlZW1zIG9kZA0KPiA+ID4gPiA+IHRvIG1l
IGFzIHRoZSB2YXJpYWJsZSAiZXJyIiBob2xkcyB0aGUgdHJ1ZSBzaWduYWwoaW4gbXkgY2FzZSBT
SUdCVVMpDQo+ID4gPiA+ID4gU2hvdWxkIG5vdCBTSUdTRUdWIGJlIHJlcGxhY2VkIHdpdGggdGhl
IHRydWUgc2lnbmFsIG5vLj8NCj4gPiA+ID4gDQo+ID4gPiA+IEFzIGZhciBhcyBJIGNhbiBzZWUs
IGNvbWVzIGZyb20NCj4gPiA+ID4gaHR0cHM6Ly9uYW0wMy5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZwdWIlMkZzY20l
MkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnRvcnZhbGRzJTJGbGludXguZ2l0JTJGY29tbWl0JTJG
JTNGaWQlM0Q2NmZjYjEwNTkmYW1wO2RhdGE9MDIlN0MwMSU3Q0pvYWtpbS5UamVybmx1bmQlNDBp
bmZpbmVyYS5jb20lN0NlZmU2ZDM3YTg1ZTE0OTQ2NThlYzA4ZDdjZjNmNTEzZiU3QzI4NTY0M2Rl
NWY1YjRiMDNhMTUzMGFlMmRjOGFhZjc3JTdDMSU3QzAlN0M2MzcyMDU3NDMyMDY3NzA1OTkmYW1w
O3NkYXRhPWs4JTJCczdpZmlDeXVOelh1T2h5a2pYVUV0V3pENjJxM0hHSUlpYXZxRTYlMkZBJTNE
JmFtcDtyZXNlcnZlZD0wDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBBbmQNCj4gPiA+IGh0dHBz
Oi8vbmFtMDMuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRmdpdC5rZXJuZWwub3JnJTJGcHViJTJGc2NtJTJGbGludXglMkZrZXJuZWwlMkZnaXQlMkZ0
b3J2YWxkcyUyRmxpbnV4LmdpdCUyRmNvbW1pdCUyRiUzRmlkJTNEYWU4NzIyMWQzY2U0OWQ5ZGUx
ZTQzNzU2ZGE4MzRmZDBiZjA1YTJhZCZhbXA7ZGF0YT0wMiU3QzAxJTdDSm9ha2ltLlRqZXJubHVu
ZCU0MGluZmluZXJhLmNvbSU3Q2VmZTZkMzdhODVlMTQ5NDY1OGVjMDhkN2NmM2Y1MTNmJTdDMjg1
NjQzZGU1ZjViNGIwM2ExNTMwYWUyZGM4YWFmNzclN0MxJTdDMCU3QzYzNzIwNTc0MzIwNjc3MDU5
OSZhbXA7c2RhdGE9b0NVJTJGTWVscldET0NqbUdPZlZ1TnAydE0lMkJ3USUyQlJEMjVqelJXb0di
SEFldyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ID4gc2hvd3MgaXQgaXMgKHdhcz8pIHNpbWlsYXIg
b24geDg2Lg0KPiA+ID4gDQo+ID4gDQo+ID4gSSB0cmllZCB0byBmb2xsb3cgdGhhdCBjaGFpbiB0
aGlua2luZyBpdCB3b3VsZCBlbmQgdXAgc2VuZGluZyBhIHNpZ25hbCB0byB1c2VyIHNwYWNlIGJ1
dCBJIGNhbm5vdCBzZWUNCj4gPiB0aGF0IGhhcHBlbnMuIFNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8g
ZGVidWdnaW5nLg0KPiA+IA0KPiA+IEluIHNob3J0LCBJIGNhbm5vdCBzZWUgYW55IHNpZ25hbCBi
ZWluZyBkZWxpdmVyZWQgdG8gdXNlciBzcGFjZS4gSWYgc28gdGhhdCB3b3VsZCBleHBsYWluIHdo
eQ0KPiA+IG91ciB1c2VyIHNwYWNlIHByb2Nlc3MgbmV2ZXIgZGllcy4NCj4gPiBJcyB0aGVyZSBh
IHNpZ25hbCBoaWRkZW4gaW4gbWFjaGluZV9jaGVjayBoYW5kbGVyIGZvciBTSUdCVVMgSSBjYW5u
b3Qgc2VlPw0KPiA+IA0KPiANCj4gSXNuJ3QgaXQgZG9uZSBpbiBkb19leGl0KCksIGNhbGxlZCBm
cm9tIG9vcHNfZW5kKCkgPw0KDQpobW0sIHNvIGl0IHNlZW1zLiBUaGUgb2RkIHRoaW5nIHRob3Vn
aCBpcyB0aGF0IGRvX2V4aXQgdGFrZXMgYW4gZXhpdCBjb2RlLCBub3Qgc2lnbmFsIG51bWJlci4N
CkFsc28sIGZlZWxzIGEgYml0IG9kZCB0byBmb3JjZSBhbiBleGl0KHRoYXQgd2UgaGF2ZW4ndCBz
ZWVuIGhhcHBlbmluZykgcmF0aGVyIHRoYW4ganVzdCBhIHNpZ25hbC4NCg0KICAgICBKb2NrZQ0K
