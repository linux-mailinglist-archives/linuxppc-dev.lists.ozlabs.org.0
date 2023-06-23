Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1F73B00C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:28:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=C+HYWH6e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnQkN5ZfVz3bqQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 15:28:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=C+HYWH6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnQjS2pK0z3bT2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 15:27:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1CXsBevHO/Jb33gKYFHFlGX+umcYlAIcEZohpYzc92pVI5LjJFqrfpdxRfX3wm0K+P6bxCTIsDGDq0fqiCQ8gU1n+Ld6FWpYFC44kJts9dQFrMmG37lryC6d4LJ+iuBEAyXFwC07FRHr/YSpGHX+CNb5odfMX+Dl1GE+Q4KakorUoc9CQgikU5qo3Q+yWdZsvhnXEkrvoHdfL4JK1+tJppvwWFHw/3bx6vWYD6bSAOiEnKbh84sYVBUqJl38O3QmYEAPfRpOTsDWuMc4DFN5pZFMnH5cG7EbCx2lPM9p4Ho6/YVJYjLtFsmUpT+z4ZZ5v8Q7o+miYe7cVhUB3oEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLMQ/CZ6ZD8+ayBE68ce0VXhC2o9FzT3GhWw0nH+xfI=;
 b=DErhL0QDJDlvNygh99TSVjG1wLy/Qgr1hHsl6wtbT7agsSVsW1Z5w2n4xfC86zm/JAz0An/b+jjhPhOl4Gv87elbEvnbSnptKs+Efp1ufRX/PEp1I2XTNBr9dtfRUy37fItbcSh4SH7w7Jb4XisO+JA5GSEQXoI1KYt66X4jEtqyvchlLNPIWRMoiraRHnNEHBjpoarvf2b9sDuMAmHiYcuVRVKwTFEmFyh+AruI/5ZXGahFwChxOghSQWB6ZpprED1K6Y0OqHgp0mf+lOSZEemvmryDVvAkj7aS4x8tX89TqN8iLo9mcZBpOnz36nKqv9Ra7SwJ3xlRnG9fOzkBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLMQ/CZ6ZD8+ayBE68ce0VXhC2o9FzT3GhWw0nH+xfI=;
 b=C+HYWH6ettlMNB834o2/12oQmZ7PPxxfUqdwK28nZDKjt/KXcL96g2GKtol9r6M8svboAH71rm48vlLkDM2stZOkOvcsahxWFFuSsE4kEz7JkjBZzLpijpKHchBjliWysD8vsWR4dOGGjut5RRYn9YHA6mEiis13HqQQQppIHfKtpYKH0c4ewkaChfHrwwxa20Y803ONu9aaACz/7YP5bzzZaRgvSN9CMcU+5o9MIwQ3UhTXKDB4I/+m/bHK8extGs16GtBo6kT3yqUdkdCJB0OuXl21VZZVA2i2YBZE/RCrlOC8EAmqYxuSbBmFcrkPTb5YbfQo6dS5jQZmz9sXPA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2317.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 05:27:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 05:27:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 08/17] powerpc/ftrace: Refactor ftrace_modify_code()
Thread-Topic: [PATCH 08/17] powerpc/ftrace: Refactor ftrace_modify_code()
Thread-Index: AQHZopUpRRchuAMgXUq44jFqKO/ATa+X4YUA
Date: Fri, 23 Jun 2023 05:27:04 +0000
Message-ID: <b7637054-7a15-54b5-c175-275d9e008642@csgroup.eu>
References: <cover.1687166935.git.naveen@kernel.org>
 <a8daa49712b44ff539e6c22a2ea649a540386798.1687166935.git.naveen@kernel.org>
In-Reply-To:  <a8daa49712b44ff539e6c22a2ea649a540386798.1687166935.git.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2317:EE_
x-ms-office365-filtering-correlation-id: f60abad7-80e9-43a8-e0b4-08db73aa7ade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  1tEwNDkj2/u0g3n6SQqVCWJjMxVg7CgyBnZoFOZHTq3ZO1aP5aFinBNBUgnGxbsyqgEpA7po3OcAMBLCWFxseI+VN096V/I2QU6DlYk3hgREgQN3E901AszrsoRs9zTSEwgAUuFVsky87FeG/zcK16GrK100BUpuaraLT3lxU9MHpcs6EEeiKmQBCLuO/LgziqG6ZG2bmh4pvvsM9BxX0Y9gfbL89cLDcowddlmAV0LB+9xhWVQ24UgN05FOI/m0R4Ip1z7Nbd6wn6qurmwOj3/IjRdNs1/+ArpxANmTW/AupdMUnry28GMctIsfVsB54HXL6CiUNRkJSYPVPFEo2E+WvAg2bYMpyWFZ1mpHWSllfptwaOLrvjG6G7Xr9OYuUwMxr13mCUQ5kICzM2eXHbt0hXJpklneEZl4xjZu7FBfmTcSt01iJ8CNkT1qNQcAik13EOYfQApt3/A8kLzK0sLJgzBvZS/IVfs3ovLHoZcpWk474VUa9y2CADcP5MBWWbfncq8EffY29oh+t9iXterUEBPNBmWGw3jLg9JXOP8H7UAChvuTlD4yfdyTFy7weeNxTn93EkR7il14ieNwtDl+4SDngPqoSlruGFFqCzai6RXD5vHW28he96mlCe5WuAMpdc9Lalxq24eZSAKIC6p+bvdjXJbyQ7iV2Bw+jMJtPJckTkR1er4CnW+SxvZ+
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39850400004)(451199021)(31686004)(478600001)(71200400001)(110136005)(4326008)(91956017)(76116006)(2616005)(86362001)(83380400001)(66574015)(38070700005)(31696002)(36756003)(2906002)(66946007)(186003)(26005)(6506007)(6512007)(6486002)(41300700001)(122000001)(38100700002)(66476007)(66556008)(64756008)(8936002)(66446008)(8676002)(5660300002)(44832011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V2xKaUJBWlIxUStjYXBEdGVDUHpBc01Nc2JIQkdqNmhsT3QrK3hPODlBZ2U4?=
 =?utf-8?B?eUhUck02MmozNkphRVFNUlVZOHlqN2tpVnZYRDlMMjJsVG9hblJRK2toRnB0?=
 =?utf-8?B?M3RCZVdkSU9PbnNFblU4TTBOVC9PTE9ZcTE3Vkc4ZjdORGdTSXAvSkdLWkhz?=
 =?utf-8?B?dnpNRUNJYlZOQ0dETVQ2NU84YmVkTU5iS291Q2FHWWQyVkxoV0tzZGZVa3BR?=
 =?utf-8?B?ZHpYdUtZa3kzckN1cEJVYnU1eGRjL3JmSUJ5OWZVM2JORVpTSTQxSUtoRXZz?=
 =?utf-8?B?b3lzZkhQbEJkVFVKQnd5dnZwV3lRaTJoc2U3cHBRYkgzSlRPUmgvRjRKajVx?=
 =?utf-8?B?YU1FRmNhbzdTWVIzV0daWXJhSG9vMXBIN0tVWXZkbi9RSFFpTTgvNVNxb1pS?=
 =?utf-8?B?U2craGJqVHVvU1VOMUltN2lRcyttbTRWZlliblVGc0RLVGFqcDR6MnZBQlBv?=
 =?utf-8?B?LzREZDVNMDJ3ZjUwSlZtZlR0V2RCRnV3T1VEN0cvMjNqaFhHeXZJbVFPTk5Y?=
 =?utf-8?B?WVVYYTU2RDB2MldqMS9OTUtSeWVpdXBzUkw3Ny9mN3A4aDBBTVUrbEJZSi9r?=
 =?utf-8?B?RGpBTU9PVjFXZ0wyUk4yOGl4VzJIZDVrM2M2bzIycVlhVTVJK1ZpMzhYZ0ts?=
 =?utf-8?B?QUFWZVhVaktpVnE4RklId0FJc2xxcmZsb1BzbTRJdWgvM2FuUk91RTNzb1dO?=
 =?utf-8?B?RjRjKzRsbWM0aXlOSTF3c0N4c1pjSCtJdTUzK3N6U3lia1pKWmRLRW92WXZt?=
 =?utf-8?B?OTh5TGZmQWhWRzZPT25RcG5neDJVU0RQSGdVZFFVUlBQTGJhYXY2ODFIdm9Q?=
 =?utf-8?B?dnkxQXEvdWxabzBPbUxoM3JzaGJPM2R1UHIxcGtRQVh0V1hNdkhhVTVaKzJl?=
 =?utf-8?B?T2p1ZFo3VHFGNnlXdjhUbTBIMHVYeFgyQ2U4RVVqWDdiNFA1bVQ4ekdCQnQ1?=
 =?utf-8?B?a2czUVNVVW5tcUQ1c3pDZWs1NzRFRG5Sd1VLZTVaT0EwQTEwNTUrUGpWeFIy?=
 =?utf-8?B?NVpsTEZwT3NKaWlyMUNIdzlXamRxRE5sOXl3ZEtSd0wxeWJvd1g5OVRXY3pv?=
 =?utf-8?B?QmdxUTBRRUc0WWRNamlHeVhoc3hXUnFzdkNXY1VsZ3hGdU8rRDlZWnRlcG5s?=
 =?utf-8?B?bTQ5ejVnL2FneXlJS2FqMFoxMzI5VkpXcEV4KzA4Ry9WdmtweEl1NkZlWjhB?=
 =?utf-8?B?aEJGVnZxbEE2aE4xc25IOTBURkhqVWErMVFGQ3d2S0ViazcxdW1aYndmUXQr?=
 =?utf-8?B?ODVuL3FHdnJVWDQ4dis4ajJvenhzdDFrZjlINmI3MXBHR2dhSzJWSDVvVEdO?=
 =?utf-8?B?SFhTTW5kM2pHOERQbjgrTFZ0akRqR3BZcFo0MVBXTG9jTVVNdGdBcHV2Tkwx?=
 =?utf-8?B?NGxRMjNJRUFNbEtVM25KTkVaVHBQb0NBU3REY2RnNmFZTlZHZTBITExoTHdE?=
 =?utf-8?B?T1FZVkMyV0xPRFd4dDFHUitDOXYyZjlWaHRlWlFaWlAyK0I3SWFvMUQ5Q3pv?=
 =?utf-8?B?dkJ4eGdFeFBVYlZMUXlZYXkvNnVxQkk4a0dsTWF2UGxnaStXc2ZYUU1hdWpX?=
 =?utf-8?B?V3ptaVh0ejdyTG1hK3NWck9lK0sxTWx3eFM2d1ZNZ2xRZ1JmUmJxaG9IMjhB?=
 =?utf-8?B?R29GV3FWSklEVXVDYi82WXRXV2YrM002djRtR2lGeE12MFNNSDBmcks0YmZq?=
 =?utf-8?B?bFBwK25WRmNDaFpSaVFZZmVnVjRieGFadXFhcHhBcWZFTkR3QXhMU0FMdHB6?=
 =?utf-8?B?VUtjZHBFVXFvaVk2Rm9wWURQZUFGOUVNQzRpTVFlWDNHMEtuSVJEZ1RNMjhN?=
 =?utf-8?B?U2owNkEzaENXTVA2MU5GRitYNkprSUN4Z3dqMmszMGFnSnlWZ0RpU0hxOG1Y?=
 =?utf-8?B?NjJRdFZpM2E3R3JyVVhjTnljS1hmcVlWT3U0Ylc4R3NteUZYb0d1ODRxZzdC?=
 =?utf-8?B?b3ZjR1B6R21XR1U0Q3lQb3lqOGU4OUVFYmtkZ21ia0RUR3QxNStWbCtmNGZo?=
 =?utf-8?B?cUN5RFkxaVpwVHI2QTNCdCtNRDQvcnBXLzc2SFJvZ1BCM1c0VTh2UFZ5cEM5?=
 =?utf-8?B?TU9OaDdOS3kvTHIxaU12U1p2UVVIdWR4ay9jbk5rcnBlQ2ZVQWR6Y2E3NW9N?=
 =?utf-8?B?Z25zSEJSMDhwNHExU0pvcUlHQlh4aGhlaTFEWDJxM2t3Rm5jVmx2Z2hNdWJN?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6393F2E7344EA6498828449C87F333A6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f60abad7-80e9-43a8-e0b4-08db73aa7ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 05:27:04.5542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1G+Ka0ciqFYRAHI2oj1G8XmbU+7JDzUHJwthUP4nPS0PyYjiLaNivb2yYkxkmLl2Xliwf6dDjMp6Pj1Bx/nPSp9U4pp5iR/hEKxtQJcftb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2317
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjMgw6AgMTE6NDcsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBT
cGxpdCB1cCBmdHJhY2VfbW9kaWZ5X2NvZGUoKSBpbnRvIGEgZmV3IGhlbHBlcnMgZm9yIGZ1dHVy
ZSB1c2UuIEFsc28NCj4gdXBkYXRlIGVycm9yIG1lc3NhZ2VzIGFjY29yZGluZ2x5Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTmF2ZWVuIE4gUmFvIDxuYXZlZW5Aa2VybmVsLm9yZz4NCg0KUmV2aWV3
ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jIHwgNTEgKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvdHJhY2UvZnRyYWNlLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5j
DQo+IGluZGV4IDkxM2M3YWE2M2QzZmEzLi5lZjRlNDljMmMzNzc4MSAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+IEBAIC01MCwzMiArNTAsMzkgQEAgZnRyYWNlX2NhbGxf
cmVwbGFjZSh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIGFkZHIsIGludCBsaW5rKQ0K
PiAgIAlyZXR1cm4gb3A7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSBpbnQNCj4gLWZ0
cmFjZV9tb2RpZnlfY29kZSh1bnNpZ25lZCBsb25nIGlwLCBwcGNfaW5zdF90IG9sZCwgcHBjX2lu
c3RfdCBuZXcpDQo+ICtzdGF0aWMgaW5saW5lIGludCBmdHJhY2VfcmVhZF9pbnN0KHVuc2lnbmVk
IGxvbmcgaXAsIHBwY19pbnN0X3QgKm9wKQ0KPiAgIHsNCj4gLQlwcGNfaW5zdF90IHJlcGxhY2Vk
Ow0KPiAtDQo+IC0JLyoNCj4gLQkgKiBOb3RlOg0KPiAtCSAqIFdlIGFyZSBwYXJhbm9pZCBhYm91
dCBtb2RpZnlpbmcgdGV4dCwgYXMgaWYgYSBidWcgd2FzIHRvIGhhcHBlbiwgaXQNCj4gLQkgKiBj
b3VsZCBjYXVzZSB1cyB0byByZWFkIG9yIHdyaXRlIHRvIHNvbWVwbGFjZSB0aGF0IGNvdWxkIGNh
dXNlIGhhcm0uDQo+IC0JICogQ2FyZWZ1bGx5IHJlYWQgYW5kIG1vZGlmeSB0aGUgY29kZSB3aXRo
IHByb2JlX2tlcm5lbF8qKCksIGFuZCBtYWtlDQo+IC0JICogc3VyZSB3aGF0IHdlIHJlYWQgaXMg
d2hhdCB3ZSBleHBlY3RlZCBpdCB0byBiZSBiZWZvcmUgbW9kaWZ5aW5nIGl0Lg0KPiAtCSAqLw0K
PiAtDQo+IC0JLyogcmVhZCB0aGUgdGV4dCB3ZSB3YW50IHRvIG1vZGlmeSAqLw0KPiAtCWlmIChj
b3B5X2luc3RfZnJvbV9rZXJuZWxfbm9mYXVsdCgmcmVwbGFjZWQsICh2b2lkICopaXApKQ0KPiAr
CWlmIChjb3B5X2luc3RfZnJvbV9rZXJuZWxfbm9mYXVsdChvcCwgKHZvaWQgKilpcCkpIHsNCj4g
KwkJcHJfZXJyKCIweCVseDogZmV0Y2hpbmcgaW5zdHJ1Y3Rpb24gZmFpbGVkXG4iLCBpcCk7DQo+
ICAgCQlyZXR1cm4gLUVGQVVMVDsNCj4gLQ0KPiAtCS8qIE1ha2Ugc3VyZSBpdCBpcyB3aGF0IHdl
IGV4cGVjdCBpdCB0byBiZSAqLw0KPiAtCWlmICghcHBjX2luc3RfZXF1YWwocmVwbGFjZWQsIG9s
ZCkpIHsNCj4gLQkJcHJfZXJyKCIlcDogcmVwbGFjZWQgKCUwOGx4KSAhPSBvbGQgKCUwOGx4KSIs
ICh2b2lkICopaXAsDQo+IC0JCSAgICAgICBwcGNfaW5zdF9hc191bG9uZyhyZXBsYWNlZCksIHBw
Y19pbnN0X2FzX3Vsb25nKG9sZCkpOw0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gICAJfQ0KPiAg
IA0KPiAtCS8qIHJlcGxhY2UgdGhlIHRleHQgd2l0aCB0aGUgbmV3IHRleHQgKi8NCj4gLQlyZXR1
cm4gcGF0Y2hfaW5zdHJ1Y3Rpb24oKHUzMiAqKWlwLCBuZXcpOw0KPiArCXJldHVybiAwOw0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGludCBmdHJhY2VfdmFsaWRhdGVfaW5zdCh1bnNpZ25l
ZCBsb25nIGlwLCBwcGNfaW5zdF90IGluc3QpDQo+ICt7DQo+ICsJcHBjX2luc3RfdCBvcDsNCj4g
KwlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0ID0gZnRyYWNlX3JlYWRfaW5zdChpcCwgJm9wKTsNCj4g
KwlpZiAoIXJldCAmJiAhcHBjX2luc3RfZXF1YWwob3AsIGluc3QpKSB7DQo+ICsJCXByX2Vycigi
MHglbHg6IGV4cGVjdGVkICglMDhseCkgIT0gZm91bmQgKCUwOGx4KVxuIiwNCj4gKwkJICAgICAg
IGlwLCBwcGNfaW5zdF9hc191bG9uZyhpbnN0KSwgcHBjX2luc3RfYXNfdWxvbmcob3ApKTsNCj4g
KwkJcmV0ID0gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgaW5saW5lIGludCBmdHJhY2VfbW9kaWZ5X2NvZGUodW5zaWduZWQgbG9uZyBp
cCwgcHBjX2luc3RfdCBvbGQsIHBwY19pbnN0X3QgbmV3KQ0KPiArew0KPiArCWludCByZXQgPSBm
dHJhY2VfdmFsaWRhdGVfaW5zdChpcCwgb2xkKTsNCj4gKw0KPiArCWlmICghcmV0KQ0KPiArCQly
ZXQgPSBwYXRjaF9pbnN0cnVjdGlvbigodTMyICopaXAsIG5ldyk7DQo+ICsNCj4gKwlyZXR1cm4g
cmV0Ow0KPiAgIH0NCj4gICANCj4gICAvKg0K
