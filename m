Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD279791A01
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 16:50:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lmHElhHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfWkw4Ydtz3c3h
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 00:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lmHElhHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60b; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfWjx6Bz6z3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 00:49:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcumOJ90PBl7hgji/Au39V+Jsvn75kNRIHPLfwHLjb7F2CXjes00EpnpfkTS6HkqXgLmUCwJl/Rhf3rTe1B1xjPSUL2Cobx+c25viurxMy/8BpK5ezqtgheTNo3nz6Eq39qqm3gvp7pPoUzIu+t9MQ0+NIp4l6StKc3ixdX6lyolOWCQ5qoryQADY6k6Z4PprXc0HgGKvyeOIe+thwVWdMBKboxaRQHii6UVzAdDqrbow33XRxr101CIjpdxH6IJGXMhx87S6+tb3k8IwSbBGy27FCWXmoulcc7au7angzf2rLCZ3erV+8w4BlNqisICQXYmGDNAjPzaNiBhuqTHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUhbM/X1iKlBm9W+9z1/sQPGCAyZObeNDcMbQFJVg9c=;
 b=dmVn7MPsxv2g1SZb0n1z709tnqX8fmV2N/nGjjMyGVLbH+8HVSsWoHfB3MyZz7HM3N3Jb2FjSKSMOPcUP47VSwZaf8Q0pkdF90/q3d4P/9yMB8MhLTgvYzqY+xKYR60pvs73psB+Tya/l2NtqsM4DQ2jNO2S1fblD3gW2JZ1pRS682JbC9Ebv9GhB8J/HlQCyNY3K1ub7jJbWLGZTrv/4muxF0aUAs1PLUrc42rSZxhMrAx4Hn91QomVkRjf3TWOFnq93Nsvj8Eot+w8CplJS1j6UKNNdb/0kMH4Wt9Qcc3P9JHmcXZrZacR4O/OCFrqEQKz533sjFJCjeCCM2S5Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUhbM/X1iKlBm9W+9z1/sQPGCAyZObeNDcMbQFJVg9c=;
 b=lmHElhHAOS9X3p1iF5c7JJTzXmaxeMoWktGPcIBxu46oaEMNFYFoHjA7VXTFNwLYZJA9t+q6GvwfO459rTEoWYkDand+T+421QkZRRo6ZO8gqwJW9mj2e5nXMwe+QbAlSxgjoU+Oxe9XmQvQDQkQdqJLSQPnRkYf8UQh447tUAcDR9pTh2hCIYr0VG/71AZtdsVptva6urzH+Te2pHxMmCx8YW0fq5ke4ywxVgLrZKKNpPWfC/Y7jJSlVjA5fAQbdtJYX+H+FXaxzQ05K1w0azdV7SN6O/VQYpQ+6MrfcGOZzLHm/67q7QXwpTAiBtMMG2pR2Gn9ZCqFgfYzwMKyZQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1673.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 14:48:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:48:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyAgAKmeoCAAMKDAIAFewAAgAUftACAASA2gIAAlqsAgAQFCICAASjBgA==
Date: Mon, 4 Sep 2023 14:48:43 +0000
Message-ID: <438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea> <87jztkvfid.fsf@mail.lhotse>
 <20230828011758.3b7b9daf@yea>
 <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
 <20230901004417.631dc019@yea>
 <b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
 <20230903230635.5751b620@yea>
In-Reply-To: <20230903230635.5751b620@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1673:EE_
x-ms-office365-filtering-correlation-id: 68af3b17-89dd-4a1b-a5ea-08dbad560949
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2DzEcInIg040ZZ7RN5A6YkhPXG5wOFueNYP6HSBNaApDciAZN4IQ6f4O5OKnYpWAoamvf15z6qmsSIohwuHTVwSyQLpeEj/M2mdr+ZgNygR3PeFHt8783deaNMbgksGEY4A4ju7FfdXc1IojgtmIwh/Xvk6dwwx5O4ZJX18CLqUT45SnLCB2y7UAua+RzRfAw0w88A9h4JLIi0KpVKCdb4yVmGyHa13BgmL6KCwhfdIU1Vv4vn0q9AG0klQTLL8Xi7zmzJCr39cAYUtIvR16kNV6zsfdr8qXJGUd1r9baCpgBuf268tDsV7aBxAgqqSiQxVzSXl8t/g1K/CGH0r5ZIXGp/dH66APCswbyBPJmVPOppALkq9RCWAqKGL/6VR7XBeYFA1oJotWINpSvRC9xXrLzH8l2fY6o1hG9KA4xYDfdikXihxpp7d2goymdpKVU0hmh5c4xPINyVcxhNUnS6CebtMx4d08t0Wxu/budFpNT6e5w9E2wQD9bRv3l/3t6b++cmM+Na1X38zUTtLiFn9Wc4rJvpmlk547ZnIPO5jS/HxYCDKVZGwCxOVyXe51TuIbFXV7D/LnqS+QwCmkCkAWO7s09kQ4ToeifkbuXusyg/nDvkiTn+gGjZDSZTm0G6/OIo8abVT7Reyi86zeTZr2gLf0lnjQ3xVtfUOO9Y32ovJ2DlGLmtELxNsRGpxd
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39850400004)(366004)(451199024)(186009)(1800799009)(8676002)(31686004)(26005)(44832011)(71200400001)(8936002)(4326008)(2616005)(83380400001)(5660300002)(6486002)(6506007)(41300700001)(478600001)(54906003)(76116006)(64756008)(66446008)(66476007)(66946007)(66556008)(31696002)(6512007)(38100700002)(6916009)(316002)(38070700005)(86362001)(91956017)(122000001)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b09XYmdKRmEzM1psZkFIQkRBajlYaG0rczFkRFY2STVGUWtyWGtiNlpNWnNx?=
 =?utf-8?B?eldmWDBQdFdja3Fud3FBTHk4U21SUGMxODJPSnA4UnErRzVZWDgzcXJOTUpp?=
 =?utf-8?B?WmFyN3hJTUhpT2hPOGhxZFBseGI0SEIrWGZPU1BXN3lvZXJ1SmMrZXoxM1Zr?=
 =?utf-8?B?dTJQd09CRVhUZHhRaGl4MzY4QzJqV3psM1pWY0VXQTllN0J6WVE1VzZUTVo1?=
 =?utf-8?B?TmFIcU5Kd3N2KzdoZkEvQTZ1dGNlTnJpRzVmK0htSElyd0NFMTRpd3JnWGlM?=
 =?utf-8?B?eVo5Y3ZWZm1FaUdOODdmZ29wTUc2bzcwY1ZvSEtYdzZjWlBDM1RmV0hjMmRs?=
 =?utf-8?B?bzFYSC9YdG1URG5DNFhvbTVmUFBkZlc4OFB1cTNVYWFycWxpakk4Rk4wT211?=
 =?utf-8?B?SDRqeHFRYW0ySlczZ1VHMDZNTHN4ajhyRGZHdWUvTE45MkIwZ1FMV2VlVHVo?=
 =?utf-8?B?WWlKb3pPWHJIWEVIeFdpb29wNWNkSzZnSWhETHE3UlVtTkUxa2lEenJLTk1x?=
 =?utf-8?B?MXRVVHM4NExmbVBITXpPdG1ObUhpSUtkcTAxdGs0aXM5dmxTN3g0QkJpejVm?=
 =?utf-8?B?UGROYTV6T3RKRGVwT3ZiUGFVVzcwbGJ2Qy9uUDV3VXVyV3NpdjUvbDJaWit0?=
 =?utf-8?B?dVN6YWh3Z1M3bWIxTlpDU3ZlVURPRDNYWWNyOUZSa1MzUkxqOXVWTXRrQ3ov?=
 =?utf-8?B?WWd1OExlMHFDWlpXbVRlSUdROEhZcXFocXRmUVEwYm5IcDUyN0c4VWJvM25Y?=
 =?utf-8?B?OGZ1Q0VDV1hSRVpwWUdCZ0U5eGYwbnNlTVFBSm1MOFl4c29Vd05qSE15ZHBv?=
 =?utf-8?B?OVBsV055S0F5T0Fnc0xHZ01hNkY0QUxjOEZXaGkzVFZ5SGhyZ0prUWhKSHFE?=
 =?utf-8?B?Z1o0aTlqeHNjbmRPK25UUkt2UDlhNlU4b3A3S3cyVlpMTGFCR1BoMDREOFNZ?=
 =?utf-8?B?bGRTZkJpUXlhWTg2RnJSdVpiQTFmaHo5dlNreGlBOXVaTjdMZlovbUFmOHh1?=
 =?utf-8?B?ZHJydkY0V0JNMktqQXFkbWhrQUJCd1lqZFRFTzZxSW9ud1M2ZWUvcTgwMG91?=
 =?utf-8?B?a3cxWEdNclhReGV4bFRVYkFEbUwwc3ZvanZNOVJraXgxWnRGL0tWdGpuRTU4?=
 =?utf-8?B?STNEQzhtZittT1E5RnFSZFduZXo5THpWTGdReFpMbzlUSzdsK2RyNThCc25S?=
 =?utf-8?B?THh6a1RPNDM5ejFtQWU2aUVEckllR1lPQnY5bTg3RmJyTzY3SHZHSGJZcVZ5?=
 =?utf-8?B?c1BOZ3FoNTBFdFN1TlloVjBXUkMxMnFsNDdaWHY4cGFKZGdzS08yZzJuQURr?=
 =?utf-8?B?OXVseHVhS1lUUGJWMFczZjNVMTRkbEZPSXBSdlJ6RG1URkpzSkFER1pxZVp2?=
 =?utf-8?B?ZHU0Ymdld2NEcTRsZUxaRmJSL0tMUThUNmdFMnpRTFFSTDZGNmFvM1EzMWJ3?=
 =?utf-8?B?SkpJZHd3NUxhUUpOWTQ2eG1ILzJmQVU1dkpDSEhXV0o5MlNJdlFXVjBRU0FM?=
 =?utf-8?B?Mk5kVytFNUp1VDRsNG8zVG5McW1yb3FlMEk3dnNuZENVWmh3TkxmUXFRT2hB?=
 =?utf-8?B?U0VzQm9Mb2U0QTV4akVUakdzVFVKcFlHc21qUG5KVUxTVHJDNGRiSjVXSmJC?=
 =?utf-8?B?WkwydlVneU1Wb0dnbmJNSk9HQXVXRnRoSWNUejFKbERRTGh6TC9ZRXVUaDFj?=
 =?utf-8?B?WUlOcE1MbXp4c1Y0UFdlU1RWR0hLZXhoUEdldVRUeFJQNFYxL25HYXBVamI1?=
 =?utf-8?B?TzZvYnZReXNpWGxHSHJSazR1NTVhbjMxdDN6UXVoTlJGWjYySmNQd1hvcWxL?=
 =?utf-8?B?bVR6NW1ud3VSeXc0MThMM2x3ZzFaQ3cwbWxFTTNXQjNERDkrb0pNZHo5bHIy?=
 =?utf-8?B?UzN4UFZwdysxSWZPZmdSRTNFam9SQW55TytXOVhqUThCYThjRU1tT0ErcENh?=
 =?utf-8?B?Y3N6dUVxTkdKdlRIRnFaWFY2cDk2UHFqOUgxNWU5MGZzUCtkK0tPL3p0UTNR?=
 =?utf-8?B?TkIxc2daTUN4QXM4cmhHSWFmNkJNV2U1SzZrSFlBRXY2akluUDdDMEZxeDg2?=
 =?utf-8?B?ajVqWDdQQTNSb3NmSGFydGovZjZsV3h2TmVmNmdDS05RTnVabjJwTkVLRjFL?=
 =?utf-8?Q?tPme/Id7YI5NHwOi08RTXALiO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A256404CB26F9B44AD6FB88F5A911413@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68af3b17-89dd-4a1b-a5ea-08dbad560949
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 14:48:43.7503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2MpN9dlFnUXq3xtBPF3TnZXniql0YYwARncwwJghsQF+7oLD05KWJ1kXEqpxP2E5w9VjSqfYNqILuRbKWGpW19ueqyiL0ZZaeZ+WQzIdVSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1673
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA5LzIwMjMgw6AgMjM6MDYsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgMSBTZXAgMjAyMyAwNzo0MzozNCArMDAwMA0KPiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPiANCj4+Pj4gQ2FuIHlvdSB0cnkg
d2hhdCBoYXBwZW5zIHdoZW4geW91IHJlbW92ZSB0aGUgY2FsbCB0byBrYXNhbl9pbml0KCkgYXQg
dGhlDQo+Pj4+IHN0YXJ0IG9mIHNldHVwX2FyY2goKSBpbiBhcmNoL3Bvd2VycGMva2VybmVsL3Nl
dHVwLWNvbW1vbi5jDQo+Pj4NCj4+PiBPaywgc28gSSBsZWZ0IHRoZSBvdGhlciBwYXRjaGVzIGlu
IHBsYWNlICsgYnRleHRfbWFwKCkgaW5zdGVhZCBvZiBidGV4dF91bm1hcCgpIGF0IHRoZSBlbmQg
b2YgTU1VX2luaXQoKSArIE1pY2hhZWxzIHBhdGNoIGFuZCBhZGRpdGlvbmFsbHkgY29tbWVudGVk
LW91dCBrYXNhbl9pbml0KCkgYXMgc3RhdGVkIGFib3ZlLiBUaGUgb3V0Y29tZSBpcyByYXRoZXIg
aW50ZXJlc3RpbmchIE5vdyBJIGRldGVybWluaXN0aWNhbGx5IGdldCB0aGlzIG91dHB1dCBhdCBi
b290IE9GIGNvbnNvbGUsIHJlZ2FyZGxlc3Mgd2hldGVyIGl0J3MgYSBjb2xkIGJvb3Qgb3Igd2Fy
bSBib290Og0KPj4NCj4+IEFoLCBteSBiYWQuIFlvdSBhbHNvIG5lZWQgdG8gcmVtb3ZlIHRoZSBj
YWxsIHRvIGthc2FuX2xhdGVfaW5pdCgpIGluDQo+PiBtZW1faW5pdCgpIGluIGFyY2gvcG93ZXJw
Yy9tbS9tZW0uYw0KPiANCj4gTm90IHRyYWdpYy4gTWVhbndoaWxlIEkgY29tbWVudGVkLW91dCBr
YXNhbl9sYXRlX2luaXQoKSBhbmQgdXBkYXRlZCB0byBrZXJuZWwgdjYuNS4xLg0KPiANCj4gZG1l
c2cgZGlkIG5vdCBjaGFuZ2UgaG93ZXZlciwgZ2V0dGluZyB0aGUgc2FtZSAiQlVHOiBLQVNBTjog
c3RhY2stb3V0LW9mLWJvdW5kcyBpbiBfX2tlcm5lbF9wb2lzb25fcGFnZXMrMHg2Yy8weGQwIiBh
cyBsYXN0IHRpbWUgb25seSBvbiB2Ni41LjEuDQo+IA0KDQoNCk9rLCBzbyBsZXRzIGNvbWUgYmFj
ayB0byBub3JtYWwgc2l0dWF0aW9uLiBDYW4geW91IGFkZCBiYWNrIGthc2FuX2luaXQoKSANCmFu
ZCBrYXNhbl9sYXRlX2luaXQoKSwgd2hpbGUga2VlcGluZyB0aGUgYnRleHQgY2hhbmdlcyBhbmQg
TWljaGFlbCdzIHBhdGNoLg0KDQpUaGVuIHNlZSB3aGF0IHJlc3VsdCB5b3UgZ2V0IHdpdGggQ09O
RklHX0tBU0FOIGJ1dCB3aXRob3V0IA0KQ09ORklHX0tBU0FOX1ZNQUxMT0MNCg0KSXQgd291bGQg
aGVscCBuYXJyb3cgdGhlIHByb2JsZW0gYXJlYSBiZWNhdXNlIGthc2FuX2luaXQoKSBkb2VzIHNl
dmVyYWwgDQp0aGluZ3MgYmFzZWQgb24gQ09ORklHX0tBU0FOX1ZNQUxMT0MuDQoNClRoYW5rcw0K
Q2hyaXN0b3BoZQ0K
