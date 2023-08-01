Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32876AFE8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:51:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fswwR4kP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFVjy3j62z2ym1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 19:51:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fswwR4kP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFVj05Jcxz2xq6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 19:50:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiwXyeHF4Go6jksWXCCAZLn9/iouqXArtepb/G3KhgSpsYx+RC14H7gpT4A5NuqQWWC+V2ak/qg+v0uW18BxTW3suQhEeVsY2DSNBAqIgltyNMLWwu0atIy0cTCB6CsP98gwldjjdrsnfdnf1j09OZWpz6//fkw/4jSK1MrxbWuxLg8SQ5whQN4z5eb6oxGPBPI61LlFxTTizmKuxuFEoOa+zXoIHW2G4R4sNkTDd9SYzSfJHV61woRI+5UPHdxRHg97WzxygMPOuH8L7Nu3VhelRRQKH8xjnTeDnFGZELW5c6nL1agqgvnMPKSJcQfT541vN1fgUksPRSIGZ12Xng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xO3IeIoWzwoIl5f+qEgqLrPFx4mrqav2KyyKNA5BAaU=;
 b=JKDQ0UyOkrzD2EueuoaIfpm0KvbzjaU6ZYasA1ilMjZS46EtEZDVtPNLUuA0tRvLaaRI+DoGoaaeh9N+uG/hd4vYvrBEz64mNHsJbb18UKbWAIyvn2S7nSl0E3CmB6OVxPzwF98MSyIG1ZO3ozeA2gAhyHd2Xu0SAMymSOrMLihNDW1JFtcd5fgmjfiPNai8VqcxA++0A4M4qzyTjkcCZBp35g+N7lryacE4s0xssJYLQIgcsID6pYvOXnvupkIeyd/c2t8WxnzJKhxlfxlnHX1Z6phKi5bnuba29iZjBmTrx+uurv8egbD4EOBIN5lu2Z7Z9yrNek9ZMTD10bEFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xO3IeIoWzwoIl5f+qEgqLrPFx4mrqav2KyyKNA5BAaU=;
 b=fswwR4kPfoji6dvSaqYKQCmUJTz4uO5xdw4+H18M5RAHNur6jSdwJuy9QY4rBEcL8dhqDKq18ueF3ow86Nyt+fMoQdpqtb8hb+0DiTNfxS8JFyagZIsLbRmOlMwj1vQzrIQI5dGcqmT/tZb2D1/IF23GrUMACcnLacOksdPgTpfzTpISCvTFlNBphTmMK/nhNQOVH9UJX1e81X3YniEMEz9YW+/IdhIuui60GVabxAfe3JsCaFnEeW9F9CxkY8MIxt7ug1DWipL7phen5X7Esb5/A/9CAgjtuNYKI3CB0ciDayLjGDoEnWPSEVwMLZtFqq1VN/TezhKjwNVuhhE4Sw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3062.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 09:50:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 09:50:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/7] Rework perf and ptrace watchpoint tracking
Thread-Topic: [PATCH 0/7] Rework perf and ptrace watchpoint tracking
Thread-Index: AQHZxBYpmD3JgtFJYUSib5WGxxovg6/VMu8A
Date: Tue, 1 Aug 2023 09:50:06 +0000
Message-ID: <4a0d1740-bf19-0a96-1668-23d6188657cb@csgroup.eu>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
In-Reply-To: <20230801011744.153973-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3062:EE_
x-ms-office365-filtering-correlation-id: c0c53f7f-59d6-4694-3172-08db9274afc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  aU8TZ3EHg9XU8NW1kGyjNx3ISAylkDOSzrXFaWNNZAXKD3rJCtOqG0D9ww6ogLmfgAgcK8KQXnE2xnkN0rmVccfWA+Bc4xK250L8orzrIp8rIkJyjF7AtqPr/+WqgvNOc1E5TuWUOXK3lkTdGlSUyW067AgOLbKbdGY1SbbxdY885RiA6HscLPYu69qbG1JgvdzyxQoWTKR/jfz2VvSsbEWUeUP3QlwKxI/NFM7TL5NcdDm9GIJg5qqR9PFqcblOpp2Q48WebO0KeFpSCx+icm4XIE0hRtawQxvyvpLic0+TqWC5s48LvuljdBl+7tSRjNDd3DK6D/edcdjUqCTsPqYoOy2ibkM++JnjUoSwekvBsnBEfWuYX5aUnHRJgrSgBsWUOxracQllDlXmcEfQDN6YbTy0afVT1cPUMQC0HDePNm/l5/NBnTk/REwMltpPxLbibni3ZEHNvlWPqSNUtyXWTYOu6E5vOu0LXUFDnHsFBVEJU3cXDw3le7XpcIS8TathHMpRMBHWGDah22RpCFBIzvVBRJXB2iC79Mw6qSHCet5uu1GvxAMIbg3IJm2WlCkiwK6U3qH6XLro5JH5SQh1ixkQgHi7C2Uhrtbt/eA97uxK7jZNtPXnQR8A8boLnrINwcVAP57985haw3qeQWEHLQvn/63YX0m8g5iZ0X8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39850400004)(346002)(396003)(136003)(451199021)(38100700002)(6506007)(5660300002)(76116006)(66946007)(66476007)(71200400001)(66446008)(64756008)(110136005)(66556008)(6512007)(966005)(91956017)(122000001)(478600001)(2906002)(66574015)(2616005)(8936002)(8676002)(38070700005)(6486002)(41300700001)(36756003)(31686004)(31696002)(186003)(316002)(86362001)(44832011)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dHRrNjE0RGhWbW5Lem0xYmV4NW1HTUxrcXhxdzdFQTAwZTN1cno0d0ZsOGRC?=
 =?utf-8?B?dm5PM1BxWVpCVEdjS3VaSGdrQTBjOHZWZm5UaFpOeEtjRURqMW4vaU9SektG?=
 =?utf-8?B?R2RmeUE5Rkp0V1FESzVlc2w3Q2F5UHZ6VVpnbG1HU3l0YXJZTzE5bzFWYTVa?=
 =?utf-8?B?dTZZSGt6UmN6WlRCbE4xNFlkblNZVHNXNmN1TnJ3d21DdEpTWkVEaEJmWWlU?=
 =?utf-8?B?NjFEc1NCeU8yU2lyM0YwY3FjZFlBdzJJZlVjRUpEa0Q1VWV0dGlVNUJ5ZEhz?=
 =?utf-8?B?cHJtOFJ4ZmRkdFRqT3dNMGJYZ2lMV1hQUUY0dW5sNFl2ZTJ4Q2hobHYzVGEv?=
 =?utf-8?B?ZTZldi83dkt5UmlpQm1UeVpVcHJRWkpRYm5xdTU3U2UyUVpDb1lCbjNzZ24v?=
 =?utf-8?B?NVZMTDBoUFJyZ2prdHNld3FiMW13MWJCbm9sZXdpNFg3eEJRZGE3UnlqcDk3?=
 =?utf-8?B?MjVuV2RIYUtjQm13QUJxNTlQNGdzQlVBb3piWU9zKzFjUmJLVU40TUZRbStR?=
 =?utf-8?B?M3JhMWZ6WXpkUjBSdzJEKy9Qb3RiYXJmeTk4VGMzc21QV2E5dUpiTStCaWVX?=
 =?utf-8?B?UGw5MXNTNjdjSnhHVHlNOW1sTFVXeHUrSVFVUWdodjdUeGIwdlplM1NXU3pZ?=
 =?utf-8?B?V0hmRXAzc1ZiN0xUbFFxLzBoUXNIS1ZlZmlRS0JRNmo4RURJZkJ1NHJSbDVl?=
 =?utf-8?B?dnc4WnVMUEdQMjl5YzJHVlIzNlRaY3d3dlF0WXBDK1FJK09GUHdVa1VXQk4z?=
 =?utf-8?B?YXp6MTRnU1BCYllIMm1wL3VONHpxS0dCS21JdTR3SEVlcjM0Z2lHK3RLWUM5?=
 =?utf-8?B?QlJBNVA4ZlZVTU42UUhNMXNzeWNab2R5QnRKOTZ4ajU1N1FGWjdhWnRXRTZs?=
 =?utf-8?B?ZURDZk0wRjJRRmdMZUcxb1lDTjRuemRHN1ZPU1pOSVVVaHp6c1BlU04zc3dY?=
 =?utf-8?B?cFFTckMreXYrdlZrTmxYc3pHQlkxaUVyYXd0TDF5a0cwY0UrUktMN2tFOW1I?=
 =?utf-8?B?M3hjQTBqRnNjalFqUmNLL1BNVVplMXdCTm42QWs3QWJBS1U2bktFR3RFM25u?=
 =?utf-8?B?WFEyRmVEZElYSG1SbGd1MkF5MktodXE3WEl5aFBJMlpndUxmV0JJc2x5Wmlr?=
 =?utf-8?B?Z0U0TW1LeGNJVzVMVTFLdW1iSk5VRm1RZm5EM0NhSzdyMm5EVndjak5mRXU2?=
 =?utf-8?B?OHpKN2QyTHBrOGJrc1JRb283L2NmQVA5WjJ1Z2U0clk2UFNLVGErdEluYnJP?=
 =?utf-8?B?eEdGdkY4RHNnS2tTTDBsYW9JRWUzQzNqN0xqMlZnVTlhN1hTd0dEMmI1Y2Yw?=
 =?utf-8?B?WkNqM1JSNGswdCtNNUUwMUUrb2g3Q3lGSW1GVW1KVSswbHZKNnd5bGtacFpL?=
 =?utf-8?B?blhqOUtkS0RyL0lnUGFiZ2NkRzd1TDhHaGFSUmZVRW1pSlQ2cHlZRStNdXpi?=
 =?utf-8?B?V2FYRHh5N3lrSWFIaWpmcGp0QThmazZxcDNBamhKSllkRnF2L1YvMW11Zm1X?=
 =?utf-8?B?VE9lY05CZjNmV2lRVENQdzI2Z2dCeE9hSVMwa1pNeWc3dTRoMW9nWU1JV3FJ?=
 =?utf-8?B?OXZzL2hvWTdETS9PTytFOU5ISzhGK1lIdktpRkNJTzdGR1paTmsvRDcyTFZq?=
 =?utf-8?B?REZuKzhWUkM5dXZjclVuUHhUb25LRHFTU1AvNllrSytBWmsxY3JZRGRvVDJQ?=
 =?utf-8?B?ZFVtZVpWVnhrQ2ZwU3JaYVVaWnRRZDJKUm9ITTFrMzYwNFJXeis4RDBvSzFY?=
 =?utf-8?B?T2hsMWNnNUl1d2s2TkNpY3RCdmJmUnhGZDdNdHZOUW5BL3Q5V2FEUEpCNmFj?=
 =?utf-8?B?T2RSNjhrZnQxbjYyY0hyNDR3QTFjM2RkNnhsbVBhWmNicHhlSjF0Rjhrbllq?=
 =?utf-8?B?R3MzemJaVnd1SUI5cjZvYVA4N1JSVm1tMFFsOUU3UnRmYzloUVNQZzVobndQ?=
 =?utf-8?B?Slp4NmVCQmZoZkhrc3FDS1RKK3ZyZzgzejVaMkJYVGpVUys5NHIyeTdOM3Na?=
 =?utf-8?B?U2F2enBESUttMFNYYTVMQzA0T1VtdjExMjEvdFR6MkxMY3lxRUFuYmlyUXhM?=
 =?utf-8?B?bWkzQ1lTK2cvaURkbjA5dzRlQ0Vwa3NIbUduR2tXeHdnMDJDVWlyN1J0WHJx?=
 =?utf-8?B?WDdvbUFMUWYxMklPODVrQ1F6SDVzZGdqZGd2a0RxWWcrWDBQVWRQZDFML3VJ?=
 =?utf-8?B?T2hZT2w5S0loaGdGVzFvWDFrM3Y3VWtmbmFVL3ZBc1k4ZmE5SzNLbTRtQXh4?=
 =?utf-8?B?YWdwbGdlc1FlL21QWWlwejJ6TG93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39354ED9B801F14E90EAD916FBE4BB64@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c53f7f-59d6-4694-3172-08db9274afc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 09:50:06.5510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjZjFGIS+TJHT4LlAdihJEi5SEPb0ZJ5F03MNKdlIX2nKFCxGkeEYohwmodrwO7Bna8ZR+EYqycYRUIlvLR4m4P1j4zUSX4N5XnfY6yTfg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3062
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

DQoNCkxlIDAxLzA4LzIwMjMgw6AgMDM6MTcsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
U3l6a2FsbGVyIHRyaWdnZXJlZCBhIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiB0aGUNCj4g
YXJjaF91bnJlZ2lzdGVyX2h3X2JyZWFrcG9pbnQoKSBob29rLiBUaGlzIGlzIGR1ZSB0byBhY2Nl
c3NpbmcNCj4gdGhlIGJwLT5jdHgtPnRhc2sgZmllbGQgY2hhbmdpbmcgdG8gLTEgd2hpbGUgd2Ug
aXRlcmF0ZSB0aGUgYnJlYWtwb2ludHMuDQo+IA0KPiBUaGlzIHNlcmllcyByZWZhY3RvcnMgdGhl
IGJyZWFrcG9pbnQgdHJhY2tpbmcgbG9naWMgdG8gcmVtb3ZlIHRoZQ0KPiBkZXBlbmRlbmN5IG9u
IGJwLT5jdHggZW50aXJlbHkuIEl0IGFsc28gc2ltcGxpZmllcyBoYW5kbGluZyBvZiBwdHJhY2Ug
YW5kDQo+IHBlcmYgYnJlYWtwb2ludHMsIG1ha2luZyBpbnNlcnRpb24gbGVzcyByZXN0cmljdGl2
ZS4NCg0KSXMgdGhlcmUgYW55IGxpbmsgYmV0d2VlbiB0aGlzIHNlcmllcyBhbmQgdGhlIGZvbGxv
d2luZyBpc3N1ZTogDQpodHRwczovL2dpdGh1Yi5jb20vbGludXhwcGMvaXNzdWVzL2lzc3Vlcy8z
OA0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IElmIG1lcmdlZCwgaXQgYWxsb3dzIHNldmVyYWwgYXJj
aCBob29rcyB0aGF0IFBvd2VyUEMgd2FzIHRoZSBzb2xlIHVzZXIgb2YNCj4gdG8gYmUgcmVtb3Zl
ZC4NCj4gDQo+IEJlbmphbWluIEdyYXkgKDcpOg0KPiAgICBwb3dlcnBjL3dhdGNocG9pbnRzOiBF
eHBsYWluIHRocmVhZF9jaGFuZ2VfcGMoKSBtb3JlDQo+ICAgIHBvd2VycGMvd2F0Y2hwb2ludHM6
IERvbid0IHRyYWNrIGluZm8gcGVyc2lzdGVudGx5DQo+ICAgIHBvd2VycGMvd2F0Y2hwb2ludHM6
IFRyYWNrIHBlcmYgc2luZ2xlIHN0ZXAgZGlyZWN0bHkgb24gdGhlIGJyZWFrcG9pbnQNCj4gICAg
cG93ZXJwYy93YXRjaHBvaW50czogU2ltcGxpZnkgd2F0Y2hwb2ludCByZWluc2VydGlvbg0KPiAg
ICBwb3dlcnBjL3dhdGNocG9pbnRzOiBSZW1vdmUgcHRyYWNlL3BlcmYgZXhjbHVzaW9uIHRyYWNr
aW5nDQo+ICAgIHNlbGZ0ZXN0cy9wb3dlcnBjL3B0cmFjZTogVXBkYXRlIHB0cmFjZS1wZXJmIHdh
dGNocG9pbnQgc2VsZnRlc3QNCj4gICAgcGVyZi9od19icmVha3BvaW50OiBSZW1vdmUgYXJjaCBi
cmVha3BvaW50IGhvb2tzDQo+IA0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9od19icmVh
a3BvaW50LmggICAgICB8ICAgIDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcm9j
ZXNzb3IuaCAgICAgICAgICB8ICAgIDUgLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvaHdfYnJl
YWtwb2ludC5jICAgICAgICAgICB8ICAzODggKy0tLS0tDQo+ICAgaW5jbHVkZS9saW51eC9od19i
cmVha3BvaW50LmggICAgICAgICAgICAgICAgIHwgICAgMyAtDQo+ICAga2VybmVsL2V2ZW50cy9o
d19icmVha3BvaW50LmMgICAgICAgICAgICAgICAgIHwgICAyOCAtDQo+ICAgLi4uL3Rlc3Rpbmcv
c2VsZnRlc3RzL3Bvd2VycGMvcHRyYWNlL01ha2VmaWxlIHwgICAgMSArDQo+ICAgLi4uL3Bvd2Vy
cGMvcHRyYWNlL3B0cmFjZS1wZXJmLWFzbS5TICAgICAgICAgIHwgICAzMyArDQo+ICAgLi4uL3Bv
d2VycGMvcHRyYWNlL3B0cmFjZS1wZXJmLWh3YnJlYWsuYyAgICAgIHwgMTEwNCArKysrKysrLS0t
LS0tLS0tLQ0KPiAgIDggZmlsZXMgY2hhbmdlZCwgNTM3IGluc2VydGlvbnMoKyksIDEwMjYgZGVs
ZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Bvd2VycGMvcHRyYWNlL3B0cmFjZS1wZXJmLWFzbS5TDQo+ICAgcmV3cml0ZSB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9wb3dlcnBjL3B0cmFjZS9wdHJhY2UtcGVyZi1od2JyZWFrLmMgKDkzJSkN
Cj4gDQo=
