Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E177F4C8A6C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:15:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7F6J0lDxz3bxh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 22:15:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7F5l1xdYz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 22:15:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkPSHLRCQBVjYzN6akFnvIk0jm9zP+kMUeGpvHibwFk6nGpElthHegCDlNXk5YG2Lu1sEZ2IKrbYn8JEfMcLZ/2UrKM8wBgmOw84OUxN90How7Q2Wn/rYLX6tW6hH6RCZz4cGloXvX4xYMz7h4cA7PqahfHiJsJv4H+4MkRD47NpP0joFt6cwBWkkEuJ3xzH7TFs0waTi4Rz7pK1MfdmY0WC4iCtWEYVZnzQgaarXUKzZScAMEbnf6i4M4IeVx38sNrh4dqPGeYIKy5QdLSOld0cgtv0Io2DHiA1qjSzliVvmgQOENsFYW7U7RFpgwoUgR5uB9LXQOTJajbTRXMfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvaaQ3TX8bZT7hRBqcyEnTBb3MiuJQvFelMcIaOiQOk=;
 b=ZjMO6N9blLNRb71XOwccoNRhoVeTm4HKHL5a13lUPlue+FaQIutNU/2qyJgvZR3x6pQ3rGgimGct3JLquY0BI5oZ/d0fGUnlbD41IS5cCO79wk+PUf0Wq+N+WyOWaBAHP6zNJBVx9utZe0RmIwpP6z5qVWaOP6V9BHOKBlOfS+3Mo60F2lB0em9RoiHLy5KfwbvXd8W1IRyvKC0xhzeeoLux1aKuehU/UcCAEvk+NrF2eXPjh9m8JIK5Pc7xXCHXTvBwah8oke6R57ueb+0hQCy9yCLgMtXMp5qfOOYUkEoCFSeRg288w/X3NfUYx+pGGPTNgKcfPfyLJobYNS1QcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRZP264MB2102.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22; Tue, 1 Mar 2022 11:14:46 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b4e1:6a58:710c:54f3]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b4e1:6a58:710c:54f3%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 11:14:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Laight <David.Laight@ACULAB.COM>, 'Segher Boessenkool'
 <segher@kernel.crashing.org>
Subject: Re: [PATCH] net: Remove branch in csum_shift()
Thread-Topic: [PATCH] net: Remove branch in csum_shift()
Thread-Index: AQHYHyQnvQLG+pah+0i2HX/tfT/o2ayQx3QAgABu/ICAAI7sAIAYqEqAgAAHcgCAAAe8gA==
Date: Tue, 1 Mar 2022 11:14:46 +0000
Message-ID: <c616f9a6-c9db-d3a7-1b23-f827732566bb@csgroup.eu>
References: <efeeb0b9979b0377cd313311ad29cf0ac060ae4b.1644569106.git.christophe.leroy@csgroup.eu>
 <7f16910a8f63475dae012ef5135f41d1@AcuMS.aculab.com>
 <20220213091619.GY614@gate.crashing.org>
 <476aa649389345db92f86e9103a848be@AcuMS.aculab.com>
 <de560db6-d29a-8565-857b-b42ae35f80f8@csgroup.eu>
 <9cdb4a5243d342efb562bc61d0c1bfcb@AcuMS.aculab.com>
In-Reply-To: <9cdb4a5243d342efb562bc61d0c1bfcb@AcuMS.aculab.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f575e7b-9b95-49a3-94ef-08d9fb74b1a5
x-ms-traffictypediagnostic: MRZP264MB2102:EE_
x-microsoft-antispam-prvs: <MRZP264MB21020F0A4417FB9DD837A148ED029@MRZP264MB2102.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VS/TiHNiqL+5isd1OnrAVn1WFuoF1FdFXbvHJZtfnj09yI1Uvok7Q4oeI8e/rmkICy84JUmjv8Z8d2wcL1fj4BiE3khz2ibadDJlvMZknKxegmK0GbmhexEgpcdl2xs/xMuk81x7/W9PMaD92mxcEGr0Fo6SF0kM/hZLwp010oIHCPQv8rjxIG3qYHbjSsdqi3Ao8dHr6SAytS5Z9QyjuSGybfd+v9L6l96y2kqiFtyyuhSEswPw8n/NrLmnkk5hntDgYIaqSJ4lgflKoaVAczVK1sz48X9egU8fIoEQP0AMPhEbDp96jK+o5/FicWu2oBhgpv4sY6/KA3kMoCIkaZkFsKXWg+3SPhY1Nim/fMG8NKP6PfrN3aZ/r35nlD5JVhR6I9JhxYM6drQ+To5fDDY2loiJ7neZAGzXLhzfD/cI2SzfkHtyL20rRQ/HHr2i3yTXq1IVKuAPZQGULpWtnMLqF0GYRFQaiUY6UqueRGFvw814wIaOJfGzQzWk7lIFGLaTfLD4qysw99y2gh0OF4Tv89DtoGMxzqKthzX4WcLMLeSoAQ4rtLeSob8SJXRWwOWH3nM6M3fDVdR8yqlS+ht/kPJJUFQ6UfDxNSHYDqQEvBkMjkoy5LpGzzHHCRNkAHHreCTGpylBoF3RrM/zpY2/DJrMRiAb4gZUatyaHUmDhaDNCIMPIZ8dKttAVYW1js+sbK1bNSle2xfvxA2vJluYLoqbU0wNk9KHy+BOt9e7mRmIgBRWDkTUhEfftT7bQyzsABih+qhT3ACV/QN1vw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(26005)(186003)(508600001)(76116006)(31686004)(110136005)(5660300002)(36756003)(316002)(91956017)(71200400001)(6486002)(66476007)(66556008)(66446008)(64756008)(66946007)(2906002)(38070700005)(6512007)(2616005)(6506007)(8936002)(31696002)(122000001)(38100700002)(54906003)(44832011)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTAxVUJUeWpnbmdZOHFlMTNzQ2JOQmdTYU9mc25yYm5uVStVaTNKZWJWTXZi?=
 =?utf-8?B?SmV3WXhhcnF2eG9TdkpxOHlZR3daVktwejF3bjg0cTZMMEZ3dGVhc0NLKzNW?=
 =?utf-8?B?MnNVdWVwWk1mRGNEd2JQaUNsMHB6QVRMR3RiUHltNWRJczdJVk5zS3Fzbksr?=
 =?utf-8?B?WGxucXRnM1Y2Q2U5eFJHWlhlS24xcmUvVVBHaktPUzZ2TUI4bzVkZk5GTHFH?=
 =?utf-8?B?dFpTbnJmdU0wNnk1eS90OE5QZExrbWJ2WGtJcjVyQ1owV3drZFZYa2c2OCtv?=
 =?utf-8?B?RExmWVgyU1RPMDQ4bERQeDZ1cmt1MWY4RFp0YkZ6TGRtaXRMV0ZIQWRaMFRG?=
 =?utf-8?B?S3JLTlVGQVg0UUZTV3FzQjlvM3JTYXF2aUdpQ09Lc0RjNGtxQlptMEJIT0FF?=
 =?utf-8?B?cDZwekFJdjVhVSs5T2hYYkFIU1c4Ti9PQ3lqeFpsNzIvU1puR25tNXNqY2p0?=
 =?utf-8?B?UmczZkt1V0QyM1dvWHBmckJsNGZWeHkvbEwyZ081UTJ5SmhVQkNlL2RDMncx?=
 =?utf-8?B?Z1A5KytPT2lDZHAxK3draHJaY0RBT1l3QncwakhXbEVuNGtjbTFNanJBL0FT?=
 =?utf-8?B?QnNlQ0dvcE9jaTZXUUFRdGg3Z1Z1VGpKUys5MkwvWWVNSWpodkN6Q3QrdTh5?=
 =?utf-8?B?dkoyZHlTWlo5WjNacFoyeWJCb21wS1REL2lpbVFERThFSzNFRHIxYlFrN0JV?=
 =?utf-8?B?UGtkWUhYNStEMXZrVFBQWWtkb0hXRy9EQnFBTGhGTWQ1Q1N1Rm1YRkJUOHR0?=
 =?utf-8?B?RDU4Sm5Hd2JrYjcvNjdoK2RqcU9zcEdLMmw0M1JsbmpvNjRpR0JJclA3UWt1?=
 =?utf-8?B?RG1ZaEE3NnV5VmxxVWpWV1B5Szk1bU94aGJKRDJ0N0xJZUxpWnRIVGd6RVV1?=
 =?utf-8?B?ZFVpVlhUV0dua1dXV3lOcmFPSXMvUHRMMTJoMSt3MW1uZWFIRFcrdUF1eTl6?=
 =?utf-8?B?NTlFUjVlRHNZV0IvR0FxNGtlYUU3MUczbFJFaDlWbHhsRDBvMTI2YXRSbUR2?=
 =?utf-8?B?d1JBL0x6NlA5dGowYkNMZ0x4TEdPMHVMbHFqdHBrZ1FEY3AvTUVSa0Y2SUt1?=
 =?utf-8?B?c3pFaWRWcVN6NFd5eG4xRFNmUCsyOVFsblErZ0NZa1F1N0ZMM2tHdW9kVUpx?=
 =?utf-8?B?ek9GRDNVaFJXVnRWbUk0QmFWNHNoeXc0UXhnL1EvcjdRVG1LdFVPbEluRUJm?=
 =?utf-8?B?V2wxUFUrSmI3MkVKMWwyUHNySG1nbFJueTA4dDFzVDVWekhaQmMvSXpRWk5N?=
 =?utf-8?B?M3F3VS9LZEtUUzJNNzBMNVNZUEFtZkdmZXRpUlhtZVhCRjlpMmxUdkhjczdP?=
 =?utf-8?B?dmtWQ2ZWdG5pcFhLRkRXczZUZy9tNVZsdW5XQ0VSRkh0MlNQZXpOb0UvLzZk?=
 =?utf-8?B?Y0RPV1kxVWkrQXViV3BIMHN2SnpkV3dxMmduQllXWjYyQ1Z3NzY1dmVJdU1M?=
 =?utf-8?B?NUxKcEdnTjBjZCtmenZ3RG9QWXFPVUNXSUxra1hVcGRmVHd0c2ZOdEo4eHVR?=
 =?utf-8?B?YzlCU0ZlR3d3SE1WTFJOblUvZGNkU1pTdWtSdTBWRlRIbDlUUDluQlpNZG9F?=
 =?utf-8?B?QzhXTGtVdGswaEROUitkSXRyWE9ObllBaFluOVZpeEs5MHN3TU0rbHZRNStN?=
 =?utf-8?B?RFI2Wkd6RDFmK2pwaDRlVUY1dGZ4RGlmRGhEYi9tZzNBNVVTNE5zRURMbDQy?=
 =?utf-8?B?aTNIZi9BRDhGbitlMEg0bmVBcWpROVhUYlhjbGdCcmM2TCthN25mMkorODRF?=
 =?utf-8?B?WXVtM0JXbDRQZzRvd2MzK05KTTQ3bTNwYU9rS25KVGdIUkNTUkFZbmtjQ1RP?=
 =?utf-8?B?OFBDT3BEYy8rTXdvR3R2cVpjQTY4RFo4ZHQ5RWJZN1AwZE52aW1EWFFTdlpP?=
 =?utf-8?B?WTJXN2d1a205azVRMlhqV2VvN1JORTRKOGNGMU9hVFJ3ekJ1QjdzSDRXdjFq?=
 =?utf-8?B?VVE5VW4xZ2UrbitLRUdFa2loaEJOZks2eldSbzJZSGVlakRWaTV4SjhJNU93?=
 =?utf-8?B?NEdraFc4NzVhMzlrUWd3YXZlaFl4TWFtOXY2NVlKT2F3VTBtYXhoVllEVHFI?=
 =?utf-8?B?QVIvS0RWSUwyVjV1WDJDMTdCbWhJSFNsSGhRSmQwU0NIT0ZwT3Y3Mmx3WjM3?=
 =?utf-8?B?NVptVFMxQ3pxR2E2Qm5qMjYvWXRycU94S25jMTE5TW9qRzRIbkdHYWJFTTNF?=
 =?utf-8?B?UFkvR25KOFFWTnF5ZGNBS0kxU2U5RWRwcUZmZnQrUzJRTnNQNTVVWW10N0Nx?=
 =?utf-8?Q?s48SWXz7Y4MRTPIjYcHPx1IFspaPi/w/B20ZVjtkfc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D145591F33C0245878EB788EE2A678D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f575e7b-9b95-49a3-94ef-08d9fb74b1a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 11:14:46.4051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1pO63QYQVNDCXH3KqPJlQHlWeXssrZiknaqZLiF1fYkl8crxUyfuzbWoG6yH7g22lAbcTSpFz3tXHep5/jxzJxiMGf/xAZT/FILkKXpv5X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2102
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzAzLzIwMjIgw6AgMTE6NDcsIERhdmlkIExhaWdodCBhIMOpY3JpdMKgOg0KPiBG
cm9tOiBDaHJpc3RvcGhlIExlcm95DQo+PiBTZW50OiAwMSBNYXJjaCAyMDIyIDEwOjIwDQo+Pg0K
Pj4gTGUgMTMvMDIvMjAyMiDDoCAxODo0NywgRGF2aWQgTGFpZ2h0IGEgw6ljcml0wqA6DQo+Pj4g
RnJvbTogU2VnaGVyIEJvZXNzZW5rb29sDQo+Pj4+IFNlbnQ6IDEzIEZlYnJ1YXJ5IDIwMjIgMDk6
MTYNCj4+PiAuLi4uDQo+Pj4+DQo+Pj4+PiBXaGF0IGhhcHBlbnMgb24geDg2LTY0Pw0KPj4+Pj4N
Cj4+Pj4+IFRyeWluZyB0byBkbyB0aGUgc2FtZSBpbiB0aGUgeDg2IGlwY3N1bSBjb2RlIHRlbmRl
ZCB0byBtYWtlIHRoZSBjb2RlIHdvcnNlLg0KPj4+Pj4gKEFsdGhvdWdoIHRoYXQgdGVzdCBpcyBm
b3IgYW4gb2RkIGxlbmd0aCBmcmFnbWVudCBhbmQgY2FuIGp1c3QgYmUgcmVtb3ZlZC4pDQo+Pj4+
DQo+Pj4+IEluIGFuIGlkZWFsIHdvcmxkIHRoZSBjb21waWxlciBjb3VsZCBjaG9vc2UgdGhlIG9w
dGltYWwgY29kZSBzZXF1ZW5jZXMNCj4+Pj4gZXZlcnl3aGVyZS4gIEJ1dCB0aGF0IHdvbid0IGV2
ZXIgaGFwcGVuLCB0aGUgc2VhcmNoIHNwYWNlIGlzIHdheSB0b28NCj4+Pj4gYmlnLiAgU28gY29t
cGlsZXJzIGp1c3QgdXNlIGhldXJpc3RpY3MsIG5vdCBleGhhdXN0aXZlIHNlYXJjaCBsaWtlDQo+
Pj4+IHN1cGVyb3B0IGRvZXMuICBUaGVyZSBpcyBhIG1pZGRsZSB3YXkgb2YgY291cnNlLCBzb21l
dGhpbmcgd2l0aCBkaXJlY3RlZA0KPj4+PiBzZWFyY2hlcywgYW5kIG1heWJlIGluIGEgZmV3IGRl
Y2FkZXMgc3lzdGVtcyB3aWxsIGJlIGZhc3QgZW5vdWdoLiAgVW50aWwNCj4+Pj4gdGhlbiB3ZSB3
aWxsIHZlcnkgb2Z0ZW4gc2VlIGNvZGUgdGhhdCBpcyAxMCUgc2xvd2VyIGFuZCAzMCUgYmlnZ2Vy
IHRoYW4NCj4+Pj4gbmVjZXNzYXJ5LiAgQSBzaW5nbGUgaW5zbiBtb3JlIHRoYW4gbmVlZGVkIGlz
bid0IHNvIGJhZCA6LSkNCj4+Pg0KPj4+IEJ1dCBpdCBjYW4gYmUgYSBsb3QgbW9yZSB0aGFuIHRo
YXQuDQo+Pj4NCj4+Pj4gTWFraW5nIHRoaW5ncyBicmFuY2gtZnJlZSBpcyB2ZXJ5IG11Y2ggd29y
dGggaXQgaGVyZSB0aG91Z2ghDQo+Pj4NCj4+PiBJIHRyaWVkIHRvIGZpbmQgb3V0IHdoZXJlICdo
ZXJlJyBpcy4NCj4+Pg0KPj4+IEkgY2FuJ3QgZ2V0IGdvZGJvbHQgdG8gZ2VuZXJhdGUgYW55dGhp
bmcgbGlrZSB0aGF0IG9iamVjdCBjb2RlDQo+Pj4gZm9yIGEgY2FsbCB0byBjc3VtX3NoaWZ0KCku
DQo+Pj4NCj4+PiBJIGNhbid0IGFjdHVhbGx5IGdldCBpdCB0byBpc3N1ZSBhIHJvdGF0ZSAoeDg2
IG9mIHBwYykuDQo+Pj4NCj4+PiBJIHRoaW5rIGl0IGlzIG9ubHkgYSBzaW5nbGUgaW5zdHJ1Y3Rp
b24gYmVjYXVzZSB0aGUgY29tcGlsZXINCj4+PiBoYXMgc2F2ZWQgJ29mZnNldCAmIDEnIG11Y2gg
ZWFybGllciBpbnN0ZWFkIG9mIGRvaW5nIHRlc3RpbmcNCj4+PiAnb2Zmc2V0ICYgMScganVzdCBw
cmlvciB0byB0aGUgY29uZGl0aW9uYWwuDQo+Pj4gSXQgY2VydGFpbmx5IGhhcyBhIG5hc3R5IGhh
Yml0IG9mIGRvaW5nIHRoYXQgcGVzc2ltaXNhdGlvbi4NCj4+Pg0KPj4+IFNvIHdoaWxlIGl0IGhl
bHBzIGEgc3BlY2lmaWMgY2FsbCBzaXRlIGl0IG1heSBiZSBtdWNoDQo+Pj4gd29yc2UgaW4gZ2Vu
ZXJhbC4NCj4+Pg0KPj4NCj4+IFRoZSBtYWluIHVzZXIgb2YgY3N1bV9zaGlmdCgpIGlzIGNzdW1f
YW5kX2NvcHlfdG9faXRlcigpLg0KPj4NCj4+IFlvdSBjbGVhcmx5IHNlZSB0aGUgZGlmZmVyZW5j
ZSBpbiBvbmUgb2YgdGhlIGluc3RhbmNlcyBiZWxvdyBleHRyYWN0ZWQNCj4+IGZyb20gb3V0cHV0
IG9mIG9iamR1bXAgLVMgbGliL2lvdl9pdGVyLm86DQo+Pg0KPj4NCj4+IFdpdGhvdXQgdGhlIHBh
dGNoOg0KPj4NCj4+IAlzdW0gPSBjc3VtX3NoaWZ0KGNzc3RhdGUtPmNzdW0sIGNzc3RhdGUtPm9m
Zik7DQo+PiAgICAgICAyMWE4Ogk5MiBlMSAwMCA0YyAJc3R3ICAgICByMjMsNzYocjEpDQo+PiAg
ICAgICAyMWFjOgk3YyA3NyAxYiA3OCAJbXIgICAgICByMjMscjMNCj4+ICAgICAgIDIxYjA6CTkz
IDAxIDAwIDUwIAlzdHcgICAgIHIyNCw4MChyMSkNCj4+ICAgICAgIDIxYjQ6CTdjIGI4IDJiIDc4
IAltciAgICAgIHIyNCxyNQ0KPj4gICAgICAgMjFiODoJOTMgNjEgMDAgNWMgCXN0dyAgICAgcjI3
LDkyKHIxKQ0KPj4gICAgICAgMjFiYzoJN2MgZGIgMzMgNzggCW1yICAgICAgcjI3LHI2DQo+PiAg
ICAgICAyMWMwOgk5MyA4MSAwMCA2MCAJc3R3ICAgICByMjgsOTYocjEpDQo+PiAgICAgICAyMWM0
Ogk4MSAwNSAwMCAwNCAJbHd6ICAgICByOCw0KHI1KQ0KPj4gICAgICAgMjFjODoJODMgODUgMDAg
MDAgCWx3eiAgICAgcjI4LDAocjUpDQo+PiB9DQo+Pg0KPj4gc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBfX3dzdW0gY3N1bV9zaGlmdChfX3dzdW0gc3VtLCBpbnQgb2Zmc2V0KQ0KPj4gew0KPj4gCS8q
IHJvdGF0ZSBzdW0gdG8gYWxpZ24gaXQgd2l0aCBhIDE2YiBib3VuZGFyeSAqLw0KPj4gCWlmIChv
ZmZzZXQgJiAxKQ0KPj4gICAgICAgMjFjYzoJNzEgMDkgMDAgMDEgCWFuZGkuICAgcjkscjgsMQkJ
PD09IHRlc3Qgb2RkaXR5DQo+PiAgICAgICAyMWQwOgk0MSBhMiAwMCAwOCAJYmVxICAgICAyMWQ4
CQk8PT0gYnJhbmNoDQo+PiAgICAqIEB3b3JkOiB2YWx1ZSB0byByb3RhdGUNCj4+ICAgICogQHNo
aWZ0OiBiaXRzIHRvIHJvbGwNCj4+ICAgICovDQo+PiBzdGF0aWMgaW5saW5lIF9fdTMyIHJvcjMy
KF9fdTMyIHdvcmQsIHVuc2lnbmVkIGludCBzaGlmdCkNCj4+IHsNCj4+IAlyZXR1cm4gKHdvcmQg
Pj4gKHNoaWZ0ICYgMzEpKSB8ICh3b3JkIDw8ICgoLXNoaWZ0KSAmIDMxKSk7DQo+PiAgICAgICAy
MWQ0Ogk1NyA5YyBjMCAzZSAJcm90bHdpICByMjgscjI4LDI0CTw9PSByb3RhdGUNCj4+ICAgICAg
IDIxZDg6CTJiIDhhIDAwIDAzIAljbXBsd2kgIGNyNyxyMTAsMw0KPj4gICAgICAgMjFkYzoJNDEg
OWUgMDEgZWMgCWJlcSAgICAgY3I3LDIzYzggPGNzdW1fYW5kX2NvcHlfdG9faXRlcisweDIzND4N
Cj4+DQo+Pg0KPj4NCj4+DQo+PiBXaXRoIHRoZSBwYXRjaDoNCj4+DQo+PiAJc3VtID0gY3N1bV9z
aGlmdChjc3N0YXRlLT5jc3VtLCBjc3N0YXRlLT5vZmYpOw0KPj4gICAgICAgMjFhODoJOTIgYzEg
MDAgNDggCXN0dyAgICAgcjIyLDcyKHIxKQ0KPj4gCWlmICh1bmxpa2VseShpb3ZfaXRlcl9pc19w
aXBlKGkpKSkNCj4+ICAgICAgIDIxYWM6CTI4IDA4IDAwIDAzIAljbXBsd2kgIHI4LDMNCj4+ICAg
ICAgIDIxYjA6CTkyIGUxIDAwIDRjIAlzdHcgICAgIHIyMyw3NihyMSkNCj4+ICAgICAgIDIxYjQ6
CTdjIDc2IDFiIDc4IAltciAgICAgIHIyMixyMw0KPj4gICAgICAgMjFiODoJOTMgNDEgMDAgNTgg
CXN0dyAgICAgcjI2LDg4KHIxKQ0KPj4gICAgICAgMjFiYzoJN2MgYjcgMmIgNzggCW1yICAgICAg
cjIzLHI1DQo+PiAgICAgICAyMWMwOgk5MyA4MSAwMCA2MCAJc3R3ICAgICByMjgsOTYocjEpDQo+
PiAgICAgICAyMWM0Ogk3YyBkYSAzMyA3OCAJbXIgICAgICByMjYscjYNCj4+IAlzdW0gPSBjc3Vt
X3NoaWZ0KGNzc3RhdGUtPmNzdW0sIGNzc3RhdGUtPm9mZik7DQo+PiAgICAgICAyMWM4Ogk4MCBl
NSAwMCAwNCAJbHd6ICAgICByNyw0KHI1KQ0KPj4gICAgKiBAd29yZDogdmFsdWUgdG8gcm90YXRl
DQo+PiAgICAqIEBzaGlmdDogYml0cyB0byByb2xsDQo+PiAgICAqLw0KPj4gc3RhdGljIGlubGlu
ZSBfX3UzMiByb2wzMihfX3UzMiB3b3JkLCB1bnNpZ25lZCBpbnQgc2hpZnQpDQo+PiB7DQo+PiAJ
cmV0dXJuICh3b3JkIDw8IChzaGlmdCAmIDMxKSkgfCAod29yZCA+PiAoKC1zaGlmdCkgJiAzMSkp
Ow0KPj4gICAgICAgMjFjYzoJODEgMjUgMDAgMDAgCWx3eiAgICAgcjksMChyNSkNCj4+IH0NCj4+
DQo+PiBzdGF0aWMgX19hbHdheXNfaW5saW5lIF9fd3N1bSBjc3VtX3NoaWZ0KF9fd3N1bSBzdW0s
IGludCBvZmZzZXQpDQo+PiB7DQo+PiAJLyogcm90YXRlIHN1bSB0byBhbGlnbiBpdCB3aXRoIGEg
MTZiIGJvdW5kYXJ5ICovDQo+PiAJcmV0dXJuIChfX2ZvcmNlIF9fd3N1bSlyb2wzMigoX19mb3Jj
ZSB1MzIpc3VtLCAob2Zmc2V0ICYgMSkgPDwgMyk7DQo+PiAgICAgICAyMWQwOgk1NCBlYSAxZiAz
OCAJcmx3aW5tICByMTAscjcsMywyOCwyOA0KPiANCj4gUmlnaHQsIHRoaXMgYWxsIGRlcGVuZHMg
b24gdGhlIHJsd2lubSBpbnN0cnVjdGlvbi4NCj4gSSBoYWQgdG8gbG9vayBpdCB1cCwgdGhhdCBv
bmUgc2hpZnRzIHI3IChjb3VudCkgbGVmdCAzIGJpdHMNCj4gYW5kIHRoZW4gbWFza3MgaXQgd2l0
aCBhbGwgdGhlIGJpdHMgZnJvbSAyOCB0byAyOCAoaW4gc29tZSBjb3VudGluZyBzY2hlbWUpLg0K
DQpZZXMgaXQgZG9lcyAob2Zmc2V0IDw8IDMpICYgOCB3aGljaCBpcyBleGFjdGx5IHRoZSBzYW1l
IGFzIChvZmZzZXQgJiAxKSA8PCAzDQoNCg0KPiANCj4gVHJ5IHRoZSBzYW1lIGNvZGUgb24geDg2
Lg0KPiBUaGUgbWFzayBhbmQgc2hpZnQgaGF2ZSB0byBiZSBzZXBhcmF0ZSBpbnN0cnVjdGlvbnMg
YW5kIGl0IHByb2JhYmx5DQo+IG5lZWRzIGEgcmVnaXN0ZXIgbW92ZSAod2hpY2ggbWlnaHQgYmUg
YSByZW5hbWUgYW5kIGZyZWUpLg0KDQpJIHNlZQ0KDQo+IFdoZXJlYXMgdGhlIGN1cnJlbnQgY29k
ZSBnZW5lcmF0ZXMgYSBjb25kaXRpb25hbCBtb3ZlLg0KPiAoQXQgbGVhc3QsIHRoZSBvbmx5IHJv
dGF0ZXMgaW4gdGhhdCBmdW5jdGlvbiBhcmUgZm9sbG93ZWQgYnkgYSBjbW92bmUuKQ0KDQpwcGMz
MiBkb2Vzbid0IGhhdmUgdGhhdC4NCnBwYzY0IGhhdmUgaXNlbCwgYnV0IGdjYyBkb2Vzbid0IHNl
ZW0gdG8gdXNlIGl0IGVpdGhlciBoZXJlLg0KDQo+IA0KPiBTbyB4ODYgaXMgYWxtb3N0IGNlcnRh
aW5seSBiZXR0ZXIgd2l0aCB0aGUgY3VycmVudCBjb2RlLg0KPiBObyBpZGVhIGFib3V0IGFybSBv
ciBhbnl0aGluZyBlbHNlIHBlb3BsZSBtaWdodCBjYXJlIGFib3V0Lg0KDQoNCkxvb2tzIGxpa2Ug
QVJNIGFsc28gZG9lcyBiZXR0ZXIgY29kZSB3aXRoIHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9u
IGFzIA0KaXQgc2VlbXMgdG8gaGF2ZSBzb21lIGxvb2tpbmcgbGlrZSBjb25kaXRpb25hbCBpbnN0
cnVjdGlvbnMgJ3Jvcm5lJyBhbmQgDQonc3RybmUnLg0KDQpzdGF0aWMgX19hbHdheXNfaW5saW5l
IF9fd3N1bSBjc3VtX3NoaWZ0KF9fd3N1bSBzdW0sIGludCBvZmZzZXQpDQp7DQoJLyogcm90YXRl
IHN1bSB0byBhbGlnbiBpdCB3aXRoIGEgMTZiIGJvdW5kYXJ5ICovDQoJaWYgKG9mZnNldCAmIDEp
DQogICAgIDFkMjg6CWUyMTAyMDAxIAlhbmRzCXIyLCByMCwgIzENCiAgICAgMWQyYzoJZTU4ZDMw
MDQgCXN0cglyMywgW3NwLCAjNF0NCiAgKiBAd29yZDogdmFsdWUgdG8gcm90YXRlDQogICogQHNo
aWZ0OiBiaXRzIHRvIHJvbGwNCiAgKi8NCnN0YXRpYyBpbmxpbmUgX191MzIgcm9yMzIoX191MzIg
d29yZCwgdW5zaWduZWQgaW50IHNoaWZ0KQ0Kew0KCXJldHVybiAod29yZCA+PiAoc2hpZnQgJiAz
MSkpIHwgKHdvcmQgPDwgKCgtc2hpZnQpICYgMzEpKTsNCiAgICAgMWQzMDoJMTFhMDM0NjMgCXJv
cm5lCXIzLCByMywgIzgNCiAgICAgMWQzNDoJMTU4ZDMwMDQgCXN0cm5lCXIzLCBbc3AsICM0XQ0K
CWlmICh1bmxpa2VseShpb3ZfaXRlcl9pc19waXBlKGkpKSkNCg0KDQpXaGVyZWFzIHdpdGggbXkg
cGF0Y2ggd2UgZ2V0DQoNCg0Kc3RhdGljIGlubGluZSBfX3UzMiByb2wzMihfX3UzMiB3b3JkLCB1
bnNpZ25lZCBpbnQgc2hpZnQpDQp7DQoJcmV0dXJuICh3b3JkIDw8IChzaGlmdCAmIDMxKSkgfCAo
d29yZCA+PiAoKC1zaGlmdCkgJiAzMSkpOw0KICAgICAxOTg0OgllODkzMDAwNiAJbGRtCXIzLCB7
cjEsIHIyfQ0KfQ0KDQpzdGF0aWMgX19hbHdheXNfaW5saW5lIF9fd3N1bSBjc3VtX3NoaWZ0KF9f
d3N1bSBzdW0sIGludCBvZmZzZXQpDQp7DQoJLyogcm90YXRlIHN1bSB0byBhbGlnbiBpdCB3aXRo
IGEgMTZiIGJvdW5kYXJ5ICovDQoJcmV0dXJuIChfX2ZvcmNlIF9fd3N1bSlyb2wzMigoX19mb3Jj
ZSB1MzIpc3VtLCAob2Zmc2V0ICYgMSkgPDwgMyk7DQogICAgIDE5ODg6CWUxYTAzMTgyIAlsc2wJ
cjMsIHIyLCAjMw0KICAgICAxOThjOgllMjAzMzAwOCAJYW5kCXIzLCByMywgIzgNCiAgICAgMTk5
MDoJZTI2MzMwMjAgCXJzYglyMywgcjMsICMzMg0KICAgICAxOTk0OgllMWEwMTM3MSAJcm9yCXIx
LCByMSwgcjMNCiAgICAgMTk5ODoJZTU4ZDEwMDggCXN0cglyMSwgW3NwLCAjOF0NCg0KDQoNCldl
IGdldCBzbGlnaHRseSBiZXR0ZXIgd2l0aCBhIHJvcjMyIGluc3RlYWQgb2Ygcm9sMzI6DQoNCg0K
CXJldHVybiAod29yZCA+PiAoc2hpZnQgJiAzMSkpIHwgKHdvcmQgPDwgKCgtc2hpZnQpICYgMzEp
KTsNCiAgICAgMTk4NDoJZTg5MzAwMDYgCWxkbQlyMywge3IxLCByMn0NCn0NCg0Kc3RhdGljIF9f
YWx3YXlzX2lubGluZSBfX3dzdW0gY3N1bV9zaGlmdChfX3dzdW0gc3VtLCBpbnQgb2Zmc2V0KQ0K
ew0KCS8qIHJvdGF0ZSBzdW0gdG8gYWxpZ24gaXQgd2l0aCBhIDE2YiBib3VuZGFyeSAqLw0KCXJl
dHVybiAoX19mb3JjZSBfX3dzdW0pcm9yMzIoKF9fZm9yY2UgdTMyKXN1bSwgKG9mZnNldCAmIDEp
IDw8IDMpOw0KICAgICAxOTg4OgllMWEwMzE4MiAJbHNsCXIzLCByMiwgIzMNCiAgICAgMTk4YzoJ
ZTIwMzMwMDggCWFuZAlyMywgcjMsICM4DQogICAgIDE5OTA6CWUxYTAxMzcxIAlyb3IJcjEsIHIx
LCByMw0KICAgICAxOTk0OgllNThkMTAwOCAJc3RyCXIxLCBbc3AsICM4XQ0KDQoNCg0KPiANCj4g
QWxsIHRoZSB3b3JsZCBpc24ndCBwcGMuDQoNCk9rLCBzbyB0aGUgc29sdXRpb24gd291bGQgYmUg
dG8gaGF2ZSBhbiBhcmNoIHNwZWNpZmljIHZlcnNpb24gb2YgDQpjc3VtX3NoaWZ0KCkgaW4gdGhl
IHNhbWUgcHJpbmNpcGxlIGFzIGNzdW1fYWRkKCkuDQoNCkNocmlzdG9waGU=
