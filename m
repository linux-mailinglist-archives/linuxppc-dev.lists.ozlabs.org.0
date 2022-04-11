Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD604FB701
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 11:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcNQ46bY8z3bYT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 19:11:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60e;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcNPX4h7wz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 19:10:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdxfRP1cnXZgz9g4pg7sZ/lF5EXoLlST38df1l7oQC+EGU+Npw7Mja+wwTuptC91Rc1cw+0jfKVycQphsXj4tepTyWdRYi+TZyK5CSv+2ngRoKtIzjtGw4I4Uk/brdL6qPCOZ6Vr3WsoBcXoBcTrV3/ARS+2V3C8AK8waS+xkJUVYkFsIJdmfbG42Qycg8dkYwfYpyJDGcjsiwc6DqelY6ACb0ORiruGmBvTKMQtYqoULMoKKjMozqUkl+Ac86f6RQSeAh2FM+MmcH+I3uCFh75pVxQ9iruMmGW0iflFeeuSVfQ9wQtAAy0QbkDA0rwxjO/60sv65TUFz9xZbMADDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meil7Uk1I7CUU+aLbcjWpyx47UtOhvTgQIhlosQudHE=;
 b=Hd8IeAJwMDUsdRh6BWXGqjykatZTW3Gafowt1e8ue6n6aL+CLq0VZQ8tqZGcLXHz01xk/usMZppAf8XJIVEPtE2o9NmhZVfoO23XvrMkJwxmMURzkBvfFhW5J+fI62FRuxjYccPXQxLCxzD0gaBbP76t2sthNcYXfr/UzCBqkqDE+AoL0FCLLl+oGYTccNTQ+72HaAHQAJEh5M7tGIBWt0Pqp/8m0DjFZgAsoO6wG90Inrf0/X+ysC/mD8NKcDrqGsLz1UbWAtZmZu9IvhCyhlv/FOuCuFBUQ4jZ3HiQHUlM8EsGErs0eUMBWgOp4LY///Oy5AOnaCpkDIIcT39GMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2157.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:10:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:10:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ariel Marcovitch <arielmarcovitch@gmail.com>, Mike Rapoport
 <rppt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: False positive kmemleak report for dtb properties names on powerpc
Thread-Topic: False positive kmemleak report for dtb properties names on
 powerpc
Thread-Index: AQHYJQBAs1VakGBInE2OFojEUMhXp6zNay8AgAAdBQCAGl6LAIAC1zqA
Date: Mon, 11 Apr 2022 09:10:29 +0000
Message-ID: <a9d13878-7820-d41c-9357-135094c8357f@csgroup.eu>
References: <9dd08bb5-f39e-53d8-f88d-bec598a08c93@gmail.com>
 <YjtXXlnbEp64eL0T@arm.com> <Yjtvtkn+CishCef6@kernel.org>
 <2603cae9-3b75-cd13-1d41-2f1bed6ca32e@gmail.com>
In-Reply-To: <2603cae9-3b75-cd13-1d41-2f1bed6ca32e@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6df1a805-cdb1-4afd-a0ca-08da1b9b1fe2
x-ms-traffictypediagnostic: PR1P264MB2157:EE_
x-microsoft-antispam-prvs: <PR1P264MB2157A71FC7E7BCC7DF711356EDEA9@PR1P264MB2157.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gHUOo0eTE1PdouBJNUVEO32OKzIVtxDo40dkiaxNGjHeGAKSTT/WcRZIEEJ/VYxBzS0U9v6Tt5EH0WCaEqR7ikBjh34pai19SKpBVhGdQLKoyzoHdtjWBTUSfgjv6HL7IM0+107BZARk6BVo2+u+JXGwsenfF9h0Tu7rJik0bRmtZfpNfedvWo7DtzJT4LOrM66I7296frq+qQS8kihQCuoT4ShlK/RU1rFarLob8j5m27+ga1t5FK2sMF52VhxoknBW4u7226jUvppEu7VEqZDXFRamKwNt6ZqY1XCyBgD0BjQlZZubP3vaK3vpngqISW09Lrw1mVg/NYfhWZTExqZ1yMxR/uZ/OAWOXfylUFr2EU5tvnMcW8cIEwYWM5w4hbQAh0N4A7d47V1Xp2bNeemOO92Lh9iSd89ZOkpqrEXvwfo4WPLOYS9uzAhHabecY6J3joVHrG58P+M+6vBh5KdBIj4VwZl8J6xrI7+TeCHTR9V1Sa7ppGAgoJAV4sHz7iU9OOVck/E5VZ+L27NNWpkIusiKohgYJS59KB/vqs6wr1rldhLFDICrgixMelVv0BRNcsQ1d1oa6eU/tTak8N5eMWZG4wMVCKtfoAA/snSNNX9yLlycHbTqWKPg6O4KgL5oahnJ9Dfu/aK3cJK9afM7qMFCaR8GZXW/POZuamY9hW7vumlNx0SajxYOmaoqekFo1ke9xO6fh9lvwlQnmsUbgBwgiwpgjeNmGsodpXb+InerPzc1bchSVKPSxXpFPgylbf+WL9ZX5bkP/DEf2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(66946007)(8676002)(31696002)(5660300002)(66476007)(66446008)(66556008)(76116006)(4326008)(8936002)(7416002)(122000001)(44832011)(38070700005)(316002)(86362001)(64756008)(6512007)(53546011)(6506007)(83380400001)(186003)(66574015)(71200400001)(6486002)(38100700002)(2616005)(91956017)(26005)(54906003)(110136005)(508600001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGlsRzg2SGFkU2tzTXRnRzk4cnV5M2RJOTA4MlFPYWs5cGRqZnVaUEtjTVp1?=
 =?utf-8?B?RkxOSlRtdUpDQ0FGRW0xbzgrcTB6MzhzY2pzQWh6UFRZdnFEeXFuakdSTUZC?=
 =?utf-8?B?MGRITk4wSzFUZVZObkJpVjkvUmNEaGZPVDJWbWNKcytrdU1MSzZCNDRsVStn?=
 =?utf-8?B?dWsxelIzQXZoNHBtREZ6UFdEbTZqZHR2SEpGRk91WElZbXZIdTBhWngvdWdk?=
 =?utf-8?B?OE1xSjdmRTc4VFVNeW9TY3BKRzZrbTkyYXBsRjNGWHRtTVZ5dE5xcVh6c1ha?=
 =?utf-8?B?TzJNY2hNdzRhZ1pSSTA5d0pUWFdxN2lOUWVlbzB5NzZVd0hQR2tnbTduMU5y?=
 =?utf-8?B?ajBIdFJaOE5DV3hqZTFKNzIxMXJIOXlzR3ZlNVNDMlUrR2h1YlFtalVyNnJZ?=
 =?utf-8?B?czlrazA3STVGWldBS281Uy9oQnB6ZHNqNWUwbzJGYzJWZjlqYi82dlpGMCtx?=
 =?utf-8?B?dlk1K0VWVUR1b2YzN2hiTjk5aTRPUmxvdlRYRFdTcmlWOGx1QjV3TVpmbEE1?=
 =?utf-8?B?T2dUeUhta1Q4L05TSjZQS1huMGdISlJSMVhNSWZYeUl0cmpYSWtwS1pQWlVZ?=
 =?utf-8?B?RGhicWxZc2VKRTFxcmlZOG5mME9tM3ZwMEh2VEhaZUoySHVVV2VNbFY5c3Zr?=
 =?utf-8?B?eWs0OHNrdkt0NjNpUmpBWnRzM0E1K0diTEZyTkNLaTNRSDN3U29Eb2NvU29F?=
 =?utf-8?B?NDFtbHJFMWV4Zk02VkwyQk51OG9Ya0ZvZ3RILzFrTzQ2Z2haTGl4RjhOTmpQ?=
 =?utf-8?B?Ym1wOUJhZ3FLWEY3dWNUeDNiSmVGbHZ6aEoxYnR3cHdramtyYXhqemtxWDhq?=
 =?utf-8?B?L3dyVmxueFd4UkV3NHpacnNRZFhzYzZmb1RDRm1IQTJhV0UvTjFIQ0RoakJx?=
 =?utf-8?B?MUhHSnZJdmE3ZWdhWkVpQkN3M2lIMEN0TG9Ga1Q2WEE0c1YvVjZrQWU2SS9Z?=
 =?utf-8?B?VkpueE5ia09XK2tKL2x3M2ZLZ0lWK2lNdVJ6Z1dNVHpJclhQV2xZVmpWUG1Z?=
 =?utf-8?B?dEYwa2FERC9QTmdwblEycEtia2N5S3l1R0xRaWpHWEFhZ3NoRDh5Z1BiWUgy?=
 =?utf-8?B?VURmVUFURitQVmk0S2JKaXVCZ2xPTCtmZ0JYNEFZSkg4cEpUSkEwa1lQQ2ov?=
 =?utf-8?B?MFdWc2hzeWlGUkVIdzhnVWVLYlNudVNLQzY3UXZHTUQvTXQ3TlVOTkJmQWNu?=
 =?utf-8?B?cVNPekdNcHVibW8vQ3RtRUpDQ0xYNUg5a2I2d0VRQ05PZ2lTa3pZMTFqWTlx?=
 =?utf-8?B?LzR3QVUreHZqbUVCemt1WTBRa0xXR2ZQV0JNSmkzZ0dVUjVMbzdGZVlDRWVs?=
 =?utf-8?B?cXA5eGNLWUp5ZmVHdzVlMDhhc0FtaDBOSkQvK1dteUpRck9PclhXdmdVVGxO?=
 =?utf-8?B?RkIzQ1lQdzREZFZSYkNUeS9uZUZ5SCtnb1c3aWxDTmN0NE1TeXlXaFBUVEJL?=
 =?utf-8?B?Y0R5aVg1MlNlWlQ4L1hweDExTldiM0NEaW14alNrZ25aL2hIYXNFZzZjZ1Ev?=
 =?utf-8?B?STk0VDFweHdDeFFpcmdFRElWMUhJTDB6WUs3cEEyRWZxZmlJWEtWMzFoM0hS?=
 =?utf-8?B?WS9CdTZJeHUycXBpdWYwT0I0dm5KOHpueVZHYXlWK1BveDZOYk83ZVlwOGpD?=
 =?utf-8?B?VXRuQzdjQmVFRDB2MWt5VzNYUHVHbWJXMVN5WjNGZ1BoNEhkV1g2ODQvZk9i?=
 =?utf-8?B?Mkh0MUZHb1NtOFdHNFN1enVDZXM5cDdjNzNub3VZakpESWU1MGsvbU1Ra0th?=
 =?utf-8?B?aXhGR2pQR0xmbkduQlhvYmk0cHlpR3ZGWE1XSWNmL3pYUXdkb0lQVmFUQ2xl?=
 =?utf-8?B?MU9OVUZnVDRPT1I3UThFMVdjL0NPbTNmdkVwOXZvTk03UDJXYkYzMGFvK2Y2?=
 =?utf-8?B?dm9uVjBoeEdqekJEcEN6STFseEQ0NHZySFZIVVhyamJzRWdxbVNxQVlDQmVW?=
 =?utf-8?B?ZEk1YzBPK1E0bGJBWEM3TGtUcXk5Zk50TjlHOXBaKzAyQ3cvVHFSVWpmb0FZ?=
 =?utf-8?B?NklTMGhZOFdlV3BVeWd1UElQeHhqNi9OdGNULzZCc3h1d1J6QjN4aTJrSVZD?=
 =?utf-8?B?ZndFMVJxRWloeDZCN0VraGE1UmRFWXpOaHhvYmpQMFNIdmo4cjdwWVYwdkVI?=
 =?utf-8?B?NmpPdk9QSVBVTkthbXR4UVVvbzBzckZNcnpsd0w2eEFKeTZXU1FBYW5FZER3?=
 =?utf-8?B?SFBmWUxmOE42a1JWNU1YTWJuVXE3dW8yTWNiWnN5VXZucW45RTZRc1ZsaDdP?=
 =?utf-8?B?U3hheXZISHE3VjdFOHVVODZOaHJRUzRaWGVQWDlCb2kyWEp6NmxvbUZFQTU0?=
 =?utf-8?B?Q3hqUkFvaDRFN1JwYU1acFJQaFBhYmFBTTNUb0hHNUxXS1J3WHhrSC9YTCtE?=
 =?utf-8?Q?DszUe46WdZn6NIbryJl1XGhdUEhCHkLm8De6a?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A55CCC05AD793347B220156F55287078@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df1a805-cdb1-4afd-a0ca-08da1b9b1fe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 09:10:29.4704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XCD2ZQxScrxLNjmrpudjN3lq3SXJ3bDTpvoDn2cdAsMdH4BJWsbBeM5TyvZxyi42P2dxELuwUQj1c2A0tz9hky5riHWBh5cOGD6MnfbrhFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2157
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQXJpZWwNCg0KTGUgMDkvMDQvMjAyMiDDoCAxNTo0NywgQXJpZWwgTWFyY292aXRjaCBhIMOp
Y3JpdMKgOg0KPiBIaSBDaHJpc3RvcGhlLCBkaWQgeW91IGdldCB0aGUgY2hhbmNlIHRvIGxvb2sg
YXQgdGhpcz8NCg0KSSB0ZXN0ZWQgc29tZXRoaW5nIHRoaXMgbW9ybmluZywgaXQgd29ya3MgZm9y
IG1lLCBzZWUgYmVsb3cNCg0KPiANCj4gT24gMjMvMDMvMjAyMiAyMTowNiwgTWlrZSBSYXBvcG9y
dCB3cm90ZToNCj4+IEhpIENhdGFsaW4sDQo+Pg0KPj4gT24gV2VkLCBNYXIgMjMsIDIwMjIgYXQg
MDU6MjI6MzhQTSArMDAwMCwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOg0KPj4+IEhpIEFyaWVsLA0K
Pj4+DQo+Pj4gT24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgMDk6NDU6NTFQTSArMDIwMCwgQXJpZWwg
TWFyY292aXRjaCB3cm90ZToNCj4+Pj4gSSB3YXMgcnVubmluZyBhIHBvd2VycGMgMzJiaXQga2Vy
bmVsIChidWlsdCB1c2luZw0KPj4+PiBxZW11X3BwY19tcGM4NTQ0ZHNfZGVmY29uZmlnDQo+Pj4+
IGJ1aWxkcm9vdCBjb25maWcsIHdpdGggZW5hYmxpbmcgREVCVUdGUytLTUVNTEVBSytISUdITUVN
IGluIHRoZSBrZXJuZWwNCj4+Pj4gY29uZmlnKQ0KDQouLi4NCg0KPj4+PiBJIGRvbid0IHN1cHBv
c2UgSSBjYW4ganVzdCBzaHVmZmxlIHRoZSBjYWxscyBpbiBzZXR1cF9hcmNoKCkgYXJvdW5kLCAN
Cj4+Pj4gc28gSQ0KPj4+PiB3YW50ZWQgdG8gaGVhciB5b3VyIG9waW5pb25zIGZpcnN0DQo+Pj4g
SSB0aGluayBpdCdzIGJldHRlciBpZiB3ZSBjaGFuZ2UgdGhlIGxvZ2ljIHRoYW4gc2h1ZmZsaW5n
IHRoZSBjYWxscy4NCj4+PiBJSVVDIE1FTUJMT0NLX0FMTE9DX0FDQ0VTU0lCTEUgbWVhbnMgdGhh
dCBfX3ZhKCkgd29ya3Mgb24gdGhlIHBoeXMNCj4+PiBhZGRyZXNzIHJldHVybiBieSBtZW1ibG9j
aywgc28gc29tZXRoaW5nIGxpa2UgYmVsb3cgKHVudGVzdGVkKToNCj4+IE1FTUJMT0NLX0FMTE9D
X0FDQ0VTU0lCTEUgbWVhbnMgImFueXdoZXJlIiwgc2VlIGNvbW1pdCBlNjMwNzVhM2M5MzcNCj4+
ICgibWVtYmxvY2s6IEludHJvZHVjZSBkZWZhdWx0IGFsbG9jYXRpb24gbGltaXQgYW5kIHVzZSBp
dCB0byByZXBsYWNlDQo+PiBleHBsaWNpdCBvbmVzIiksIHNvIGl0IHdvbid0IGhlbHAgdG8gZGV0
ZWN0IGhpZ2ggbWVtb3J5Lg0KPj4NCj4+IElmIEkgcmVtZW1iZXIgY29ycmVjdGx5LCBwcGMgaW5p
dGlhbGl6ZXMgbWVtYmxvY2sgKnZlcnkqIGVhcmx5LCBzbyANCj4+IHNldHRpbmcNCj4+IG1heF9s
b3dfcGZuIGFsb25nIHdpdGggbG93bWVtX2VuZF9hZGRyIGluDQo+PiBhcmNoL3Bvd2VycGMvbW0v
aW5pdF8zMjo6TU1VX2luaXQoKSBtYWtlcyBzZW5zZSB0byBtZS4NCj4+DQo+PiBNYXliZSBwcGMg
Zm9sa3MgaGF2ZSBvdGhlciBpZGVhcy4uLg0KPj4gSSd2ZSBhZGRlZCBDaHJpc3RvcGhlIHdobyB3
b3JrcyBvbiBwcGMzMiB0aGVzZSBkYXlzLg0KDQpJIHRoaW5rIG1lbWJsb2NrIGlzIGFscmVhZHkg
YXZhaWxhYmxlIGF0IHRoZSBlbmQgb2YgTU1VX2luaXQoKSBvbiBQUEMzMiANCmFuZCBhdCB0aGUg
ZW5kIG9mIGVhcmx5X3NldHVwKCkgb24gUFBDNjQuIEl0IG1lYW5zIGl0IGlzIHJlYWR5IHdoZW4g
d2UgDQplbnRlciBzZXR1cF9hcmNoKCkuDQoNCkkgdGVzdGVkIHRoZSBjaGFuZ2UgYmVsb3csIGl0
IHdvcmtzIGZvciBtZSwgSSBkb24ndCBnZXQgYW55IGttZW1sZWFrIA0KcmVwb3J0IGFueW1vcmUu
DQoNCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3NldHVwLWNvbW1vbi5jIA0KYi9h
cmNoL3Bvd2VycGMva2VybmVsL3NldHVwLWNvbW1vbi5jDQppbmRleCA1MThhZTVhYTk0MTAuLjlm
NGU1MGIxNzZjOSAxMDA2NDQNCi0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9u
LmMNCisrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmMNCkBAIC04NDAsNiAr
ODQwLDkgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQ0KICAJLyog
U2V0IGEgaGFsZi1yZWFzb25hYmxlIGRlZmF1bHQgc28gdWRlbGF5IGRvZXMgc29tZXRoaW5nIHNl
bnNpYmxlICovDQogIAlsb29wc19wZXJfamlmZnkgPSA1MDAwMDAwMDAgLyBIWjsNCg0KKwkvKiBQ
YXJzZSBtZW1vcnkgdG9wb2xvZ3kgKi8NCisJbWVtX3RvcG9sb2d5X3NldHVwKCk7DQorDQogIAkv
KiBVbmZsYXR0ZW4gdGhlIGRldmljZS10cmVlIHBhc3NlZCBieSBwcm9tX2luaXQgb3Iga2V4ZWMg
Ki8NCiAgCXVuZmxhdHRlbl9kZXZpY2VfdHJlZSgpOw0KDQpAQCAtODgyLDkgKzg4NSw2IEBAIHZv
aWQgX19pbml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCkNCiAgCS8qIENoZWNrIHRoZSBT
TVQgcmVsYXRlZCBjb21tYW5kIGxpbmUgYXJndW1lbnRzIChwcGM2NCkuICovDQogIAljaGVja19z
bXRfZW5hYmxlZCgpOw0KDQotCS8qIFBhcnNlIG1lbW9yeSB0b3BvbG9neSAqLw0KLQltZW1fdG9w
b2xvZ3lfc2V0dXAoKTsNCi0NCiAgCS8qDQogIAkgKiBSZWxlYXNlIHNlY29uZGFyeSBjcHVzIG91
dCBvZiB0aGVpciBzcGlubG9vcHMgYXQgMHg2MCBub3cgdGhhdA0KICAJICogd2UgY2FuIG1hcCBw
aHlzaWNhbCAtPiBsb2dpY2FsIENQVSBpZHMuDQotLS0NCg0KDQpDaHJpc3RvcGhl
