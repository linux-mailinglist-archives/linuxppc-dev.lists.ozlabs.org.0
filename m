Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5B7FD4AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 11:49:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DUCcZ0yO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgGKK4lbbz3d9q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 21:49:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DUCcZ0yO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60a; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgGJS6hsGz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 21:48:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr5Am9Y6EkVGTzyWzIc6eCjZl+k9c5/H8Fee284KFVkrruWvPWEUDYGQcX+GB9XEOebMITk5Je6QyinU3kuijBaSKPG9iukYRw8fv/6Yy4rBq623D70v928tqKkKBGYCzp82rdPHc94QW3Dc2rWqihXpPt4HCPUkcxuTft7knc0ZSU38JU/i/P3jE3PI2fS8uWh5migKUaGh0hOmdIbdmKN2p1DqnIazwXhdFifBwT3wEGyCrdj/+MgTwMs2wXpsfFlUsSfHtBzhcCh4znbreKDFYT1509zEhh94eq3wesW9y6Y+LQcS6m3e7Qw9HFDAeJpMRplkW/LDWYNTOBIN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHlZ7PCbHdQD4NjcrqJzwIMSzL20rcTVvcv/4I5IP/c=;
 b=eKn4COOLyYMaAixZRR0sVbuorBTHQvAE2TBSoL20cXGyF7scrM2zw7XPNFT6UeKMhjyjiiFJ4lvlWin2N6zHk3O7mhKAXZ4w4PrcIzrxTjbDpdaoobYMjeYb1bHY1/gSSZ4BS1vM56BUwX0qtxDyZyVTGueDQwaqyShCrfezkQh0nhygjbBsjgqMZOZe3a/5XtkqueU0iaTkj+RRc031haLKU7iE9hmuh1Vqvy7+wlY82X3F3dyKlTrSa59qaRVFIy490bBNkkytk0GBzx0qsuQt4ygA9y0u4l4eBl4ytxjc7DyOwDH3gjKs1Q82nQF5gEx1obQW69qFo9FKCQe0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHlZ7PCbHdQD4NjcrqJzwIMSzL20rcTVvcv/4I5IP/c=;
 b=DUCcZ0yOhxyoaqAQK7XWJr6HeIhnkL1kEh6bNzJwAXSUb9KvlEHxJl+gM5KqRVrLuqqlYIZkJV2xH1mHUHSshOiycR6zhIChweA7RCJpA7x7tprxGZHMUL9UCz7wnn0uJM6SRpU+wOqJ4pnZQDcrTI1cq+DndrbttjHs1oD8pKj7oTtjohuX3/8DjDNqyyTELiZ79bWh+ff1dgFuoCbKietfylETrQWYlRnXC58CrHBqKCkC2Lc0gGE0GHJ49+9mXUzBgMKxsoM00XGQodxAbHP79YLf74u/9oXrF9rs0WMohk7H/lELtoeBIV6sLBthOl3pdhatAJoLVl3WIDiwoQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1987.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 10:47:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 10:47:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Salvatore Bonaccorso <carnil@debian.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec register
 save
Thread-Topic: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
Thread-Index: AQHaGupjEz2QFYOVpUWXsmdwgaYEkrCRKHMAgAAEvIA=
Date: Wed, 29 Nov 2023 10:47:56 +0000
Message-ID: <41ede5ee-5d5f-4392-8ac7-8291f2f1517c@csgroup.eu>
References:  <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
 <42b9fdd7-2939-4ffc-8e18-4996948b19f7@kernel.dk>
 <ZWcS4uBOUefxZAQY@eldamar.lan>
In-Reply-To: <ZWcS4uBOUefxZAQY@eldamar.lan>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1987:EE_
x-ms-office365-filtering-correlation-id: 796a73ad-00ae-4ff3-7867-08dbf0c8a5c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  vNGzVUEpZiyBRMx0nd3eXJ4fy6Y7c53Qcjar7OZhcezVbWdI1YkbxNoEa14Hz+w1vGyamicW35zqEmW55Bdj+r/DO2COF95G9tDUKRc0hknb+apm27qgwSEuO6VLmqvX3mA/MAbJ4U9k812J2BYqctLxCWMXxB9Kqvw8+21o+aTPwKxRtiiLr8tl0ItEfr+WV41asJwGai66r75rzPDF1KrsADOr4niqHTd0nulBhPocMnaR9e0HsUsB5Ca3fT20OeDE+bwd8yQobHuR0PCt7cW0UMFtA3bZf4xDxz1uIWdLkhfNScDs+p7oy7hTBQ6dxOS0OPYE9qIkN9OsWLFzLQMaaMLSyBDl0aR8CsiSAyqkPu+JLzm8Lcn4NSq47F90EwE8zZ1HZgxfZLr+qpLXg1rOufndcwrdYyiZ4HvBXmEFR7DOa697ez8sYWZO8Mrg7UXFM7VUB2DQn36Q/qagdJT5gFufF5/QJBc2rl7PsgUM54ZClhCeB/QKCpqCyrTARbhgYN19WSHGL2ezBOeE46U1nXRLw9OaC2OAj7u4w9uOvc1Rtce/Me+6L3t5ezU1GcLVBL4XOxjEeoqhgBglqw/Kdgo3wJfKzVvbmlXQQOVNibtHq9dMCZpMmiTiYI7YNhVAjvU+9vfHvczEZh2xSTNjPC17x36AkJzdD13SkXHcLUIgOxK+fo0HGxzdWaLov17iUGXGXpPssRjtzE4auNOUAyYv5uBB9fWHLzwOdEc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6506007)(38070700009)(53546011)(6512007)(71200400001)(26005)(83380400001)(66574015)(2616005)(66556008)(66476007)(44832011)(66446008)(4326008)(54906003)(110136005)(316002)(64756008)(91956017)(76116006)(66946007)(122000001)(38100700002)(5660300002)(8676002)(86362001)(31696002)(31686004)(8936002)(36756003)(478600001)(966005)(2906002)(6486002)(41300700001)(213603006)(45980500001)(43740500002)(44473003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cXBjSFJvT01GdzF1ajRib0VONHdSRWwxWEExYlBpdjVSUEtJbGd4VHFmS09w?=
 =?utf-8?B?K21wejJPd0lXZ0ZRQ3J6TWNkb0g3OG4vOEFNQlBLbUk1UHYzL0pVdUNtZUYz?=
 =?utf-8?B?S3NvZE5SU01UUTU2Y3paZUFUZC9YZFdjSGR2bThoTjRDZVBNS0ZmKys0S09T?=
 =?utf-8?B?dkwwYUxSY0pRRDNZaTQ0RzNRSG4wTk1SOE1oNHJZQ0FIck5CZ05WM1V2UWxY?=
 =?utf-8?B?M2YyY3hkRXNyUDg2Y0JuYUVrZlNOVk9ES0NJS2w5Z2dtWnBkUVRNOFliSDlN?=
 =?utf-8?B?b2JseEwxL0t4UC9BL1pGdklFSHVxdnFJK2phbytxUkJUL2xFZmpIWTgxY1Y2?=
 =?utf-8?B?VDB6R2xwSTVqWU5BVGR5c1dqNDgzZE5zcGlxNWNCUnFDNUhYUi9FZnhqckRQ?=
 =?utf-8?B?K3VNZkt4QXZMVlFRNkdwSTNLS0hiVzVwODlIblZ0MmpTeG9HQXRDN0szU1Yz?=
 =?utf-8?B?L1RWNEtsQmlZcnZOY2x6YkxSaWx5OHErQURwcnFrRmg2SjJVMXhhYzEwMFZE?=
 =?utf-8?B?WjlIbWd2UFFWL21rSUNrOWRPMys0bXFPdDB2VnN2a1hDc21BTWt1d1JOR2h5?=
 =?utf-8?B?QkhGejVucTE3dEFKd1dqbVl1aWljTGJCYjNVV3Eyeldia3NIdHpiSFNrOG1V?=
 =?utf-8?B?cmFTSjhEazRudE9mUVJLalBnd2FnemNYU1F4c3hsanZGNTV0eGJmdFVzZE5Q?=
 =?utf-8?B?dUtIOWhjVlZ0ZHBaeWdrUE1DZFBCSGZtWVVlejZFOFhxVHpXY1BKNE9qWXRN?=
 =?utf-8?B?N0ZCblUzakQ0TmcyNjMwYkpkY0ZrRVVsYVZGS05Kd1A5ZFp5WEdEYkNCVDgv?=
 =?utf-8?B?WFZ4Skh2d2FHUXhkV0FFMGpaQ2huZ0ltYXBtY2RxVldOd0E5ZFBYd2pWL0hL?=
 =?utf-8?B?SmdwTFJrTkVXanBtT2YxUlVyYjAzeFpTQlZ3LzlmVGFTRDl1TjFVTngzWVpY?=
 =?utf-8?B?THBmNUJHa1VVdEZWa3RpZ3c4anNaaW5iVzJES3dmT1VGMmJNdXZ2bGNXZkdI?=
 =?utf-8?B?YkE1bFZzbENGenBIMTBWTWFUNzJVeG1RMFBhYkdrY0xFWWlaU0E3SzJkNHNS?=
 =?utf-8?B?TWM3WjBOaHhEaDgveTh3Rmo0Ynd1ak51ZEhHdzFWaTFCQi9qeGVFR1EvL1Rq?=
 =?utf-8?B?WjZjWlhpUCsyTlJVeHVpbjVaWmt0bmk5YllEQ29KdjVuS09jYlQ0eGdka3JL?=
 =?utf-8?B?YlBlaEpwY0dBcXM1NDZDSTh1OGtHNllIbVh0K3FIYVA3dmFzUXZ5bHgrbXR5?=
 =?utf-8?B?WVhRN0ZNV2pZdnU5MHBEdlJiZ25lcWIzbmNSYUVOL2RweGZjRTRTV0xLZTA3?=
 =?utf-8?B?cklGZ2RFaTJTVzJzRmx3NHREc2t4eDUrRmZsODVDQWFkUG9ERkRFb2dNMlRz?=
 =?utf-8?B?SUpuNlpIbmphS2N0TTZlWVN6UkZ6TnFzMGFwOC94NHp3VVA4dm1EUHplbldQ?=
 =?utf-8?B?cFdkcWxiUEdVWHdEOWNIZjgraE96Qm1ZYm1vY2RTaGFHU0ozQzFrY3JqS1Vj?=
 =?utf-8?B?NHZ5R3NNR1laaWZvRHNoNUowNWJ2cTU1aE44OThlMHZ1cHZQVlQxeG55RXBX?=
 =?utf-8?B?dWtNZDBsa3RGMzVQS1pZSC9tak5BNXRQOG12NUFZdi9LMm1pa1R6VzhVL29R?=
 =?utf-8?B?SUp5Q1NEdyt1WGJ5azZHMDBUNTN4dUUzV1E2STJKelhLT2VDUXRlOTh2U2U3?=
 =?utf-8?B?YUE1Nm1mOWdTdUNhSDZWaU1oSkF3a1JkWG9XZHdOQXBWVFdXOFYxbzBuZmtn?=
 =?utf-8?B?NjJzS2FmRllyRjlyNmNGRjdGUEdyUnBmWVdUdmppdnUyZnRxckMwV0FFK2Vt?=
 =?utf-8?B?a0FmZmhmZlFWekRiZVRuc1R4c1dlMjMxMXQ2dHc2T1BZeXlEdUl5d1JuNXNj?=
 =?utf-8?B?RkJMbmRpZk5sSzB3OU9XTWN4SFdHMnVXL0Nzc1FDL3QzMTh6S2s5dU1ja2hP?=
 =?utf-8?B?UFluSXhrQUtGRHdWbDUwMHVkYWFCME9wRVlvQ3lUT3ZMa0FUV3NxbVU5QWhh?=
 =?utf-8?B?bTdienZUamxkMUdVc2djTnhhS3BkSEtZcGhydFhXM2EvazdrMis2cG9aNlJ3?=
 =?utf-8?B?QTByUmlPbXZJU3gvbmY4Mks4QXRXaGpBQ0xpenJWVHg1YUlmRVZhei8vK0NY?=
 =?utf-8?Q?tqha/n8FctrfYUtTe26onYwK+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A90ADE48434D5E4FB4C6DED9186847FA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 796a73ad-00ae-4ff3-7867-08dbf0c8a5c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 10:47:56.7729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2MAs8SHoNdJEr2qN1ydPkgn0Z3QTZb9G1EkgSYv6DSJTMd58fCbr9SfXtohDBFbL0GGzRqjOWsR0YY/muRmLVDMFiZT/KqxhA3PxzCCpqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1987
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
Cc: regressions <regressions@lists.linux.dev>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Timothy Pearson <tpearson@raptorengineering.com>, npiggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzExLzIwMjMgw6AgMTE6MzAsIFNhbHZhdG9yZSBCb25hY2NvcnNvIGEgw6ljcml0
wqA6DQo+IEhpLA0KPiANCj4gT24gU3VuLCBOb3YgMTksIDIwMjMgYXQgMDY6MTQ6NTBBTSAtMDcw
MCwgSmVucyBBeGJvZSB3cm90ZToNCj4+IE9uIDExLzE4LzIzIDQ6NDUgUE0sIFRpbW90aHkgUGVh
cnNvbiB3cm90ZToNCj4+PiBEdXJpbmcgZmxvYXRpbmcgcG9pbnQgYW5kIHZlY3RvciBzYXZlIHRv
IHRocmVhZCBkYXRhIGZyMC92czAgYXJlIGNsb2JiZXJlZA0KPj4+IGJ5IHRoZSBGUFNDUi9WU0NS
IHN0b3JlIHJvdXRpbmUuICBUaGlzIGxlYWRzIHRvIHVzZXJzcGFjZSByZWdpc3RlciBjb3JydXB0
aW9uDQo+Pj4gYW5kIGFwcGxpY2F0aW9uIGRhdGEgY29ycnVwdGlvbiAvIGNyYXNoIHVuZGVyIHRo
ZSBmb2xsb3dpbmcgcmFyZSBjb25kaXRpb246DQo+Pj4NCj4+PiAgICogQSB1c2Vyc3BhY2UgdGhy
ZWFkIGlzIGV4ZWN1dGluZyB3aXRoIFZTWC9GUCBtb2RlIGVuYWJsZWQNCj4+PiAgICogVGhlIHVz
ZXJzcGFjZSB0aHJlYWQgaXMgbWFraW5nIGFjdGl2ZSB1c2Ugb2YgZnIwIGFuZC9vciB2czANCj4+
PiAgICogQW4gSVBJIGlzIHRha2VuIGluIGtlcm5lbCBtb2RlLCBmb3JjaW5nIHRoZSB1c2Vyc3Bh
Y2UgdGhyZWFkIHRvIHJlc2NoZWR1bGUNCj4+PiAgICogVGhlIHVzZXJzcGFjZSB0aHJlYWQgaXMg
aW50ZXJydXB0ZWQgYnkgdGhlIElQSSBiZWZvcmUgYWNjZXNzaW5nIGRhdGEgaXQNCj4+PiAgICAg
cHJldmlvdXNseSBzdG9yZWQgaW4gZnIwL3ZzMA0KPj4+ICAgKiBUaGUgdGhyZWFkIGJlaW5nIHN3
aXRjaGVkIGluIGJ5IHRoZSBJUEkgaGFzIGEgcGVuZGluZyBzaWduYWwNCj4+Pg0KPj4+IElmIHRo
ZXNlIGV4YWN0IGNyaXRlcmlhIGFyZSBtZXQsIHRoZW4gdGhlIGZvbGxvd2luZyBzZXF1ZW5jZSBo
YXBwZW5zOg0KPj4+DQo+Pj4gICAqIFRoZSBleGlzdGluZyB0aHJlYWQgRlAgc3RvcmFnZSBpcyBz
dGlsbCB2YWxpZCBiZWZvcmUgdGhlIElQSSwgZHVlIHRvIGENCj4+PiAgICAgcHJpb3IgY2FsbCB0
byBzYXZlX2ZwdSgpIG9yIHN0b3JlX2ZwX3N0YXRlKCkuICBOb3RlIHRoYXQgdGhlIGN1cnJlbnQN
Cj4+PiAgICAgZnIwL3ZzMCByZWdpc3RlcnMgaGF2ZSBiZWVuIGNsb2JiZXJlZCwgc28gdGhlIEZQ
L1ZTWCBzdGF0ZSBpbiByZWdpc3RlcnMNCj4+PiAgICAgaXMgbm93IGludmFsaWQgcGVuZGluZyBh
IGNhbGwgdG8gcmVzdG9yZV9mcCgpL3Jlc3RvcmVfYWx0aXZlYygpLg0KPj4+ICAgKiBJUEkgLS0g
RlAvVlNYIHJlZ2lzdGVyIHN0YXRlIHJlbWFpbnMgaW52YWxpZA0KPj4+ICAgKiBpbnRlcnJ1cHRf
ZXhpdF91c2VyX3ByZXBhcmVfbWFpbigpIGNhbGxzIGRvX25vdGlmeV9yZXN1bWUoKSwNCj4+PiAg
ICAgZHVlIHRvIHRoZSBwZW5kaW5nIHNpZ25hbA0KPj4+ICAgKiBkb19ub3RpZnlfcmVzdW1lKCkg
ZXZlbnR1YWxseSBjYWxscyBzYXZlX2ZwdSgpIHZpYSBnaXZldXBfZnB1KCksIHdoaWNoDQo+Pj4g
ICAgIG1lcnJpbHkgcmVhZHMgYW5kIHNhdmVzIHRoZSBpbnZhbGlkIEZQL1ZTWCBzdGF0ZSB0byB0
aHJlYWQgbG9jYWwgc3RvcmFnZS4NCj4+PiAgICogaW50ZXJydXB0X2V4aXRfdXNlcl9wcmVwYXJl
X21haW4oKSBjYWxscyByZXN0b3JlX21hdGgoKSwgd3JpdGluZyB0aGUgaW52YWxpZA0KPj4+ICAg
ICBGUC9WU1ggc3RhdGUgYmFjayB0byByZWdpc3RlcnMuDQo+Pj4gICAqIEV4ZWN1dGlvbiBpcyBy
ZWxlYXNlZCB0byB1c2Vyc3BhY2UsIGFuZCB0aGUgYXBwbGljYXRpb24gY3Jhc2hlcyBvciBjb3Jy
dXB0cw0KPj4+ICAgICBkYXRhLg0KPj4NCj4+IFdoYXQgYW4gZXBpYyBidWcgaHVudCEgSGF0cyBv
ZmYgdG8geW91IGZvciBzZWVpbmcgaXQgdGhyb3VnaCBhbmQgZ2V0dGluZw0KPj4gdG8gdGhlIGJv
dHRvbSBvZiBpdC4gUGFydGljdWxhcmx5IGRpZmZpY3VsdCBhcyB0aGUgY29tbWl0IHRoYXQgbWFk
ZSBpdA0KPj4gZWFzaWVyIHRvIHRyaWdnZXIgd2FzIGluIG5vIHdheSByZWxhdGVkIHRvIHdoZXJl
IHRoZSBhY3R1YWwgYnVnIHdhcy4NCj4+DQo+PiBJIHJhbiB0aGlzIG9uIHRoZSB2bSBJIGhhdmUg
YWNjZXNzIHRvLCBhbmQgaXQgc3Vydml2ZWQgMng1MDAgaXRlcmF0aW9ucy4NCj4+IEhhcHB5IHRv
IGNhbGwgdGhhdCBnb29kOg0KPj4NCj4+IFRlc3RlZC1ieTogSmVucyBBeGJvZSA8YXhib2VAa2Vy
bmVsLmRrPg0KPiANCj4gVGhhbmtzIHRvIGFsbCBpbnZvbHZlZCENCj4gDQo+IElzIHRoaXMgZ29p
bmcgdG8gbGFuZCBzb29uIGluIG1haW5saW5lIHNvIGl0IGNhbiBiZSBwaWNrZWQgYXMgd2VsbCBm
b3INCj4gdGhlIGFmZmVjdGVkIHN0YWJsZSB0cmVlcz8NCj4gDQoNClRoaXMgdmVyc2lvbiBvZiB0
aGUgcGF0Y2ggaGFzIGJlZW4gc3VwZXJzZWRlZC4NCg0KQXMgc2FpZCBieSBNaWNoYWVsIGluIHRo
ZSByZWxhdmFudCB0aHJlYWQsIHRoZSBwbGFuIGlzIHRvIGhhdmUgdmVyc2lvbiAyIA0Kb2YgdGhp
cyBwYXRjaCBpbiA2LjctcmM0LCBzZWUgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzE5MjE1Mzk2OTYuNDg1MzQ5ODguMTcwMDQwNzA4Mjkz
My5KYXZhTWFpbC56aW1icmFAcmFwdG9yZW5naW5lZXJpbmdpbmMuY29tLw0KDQpDaHJpc3RvcGhl
DQo=
