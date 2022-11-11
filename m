Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B951A62594E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 12:26:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7xHX4lKxz3cfX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 22:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CsUVbAlx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.50; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CsUVbAlx;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120050.outbound.protection.outlook.com [40.107.12.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7xGX301wz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 22:25:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDGcVxXYdrYBiRny0bhPM1p718Z6vKAkH7387I/XRRRgKKIWEur8mP+BVhE9olfx0giceZdqORapIoPKedxO202PT9++NRZamMV4QxE+qvAP/Ew0IUJtdSw0BABF83y2hhPSMWUsnsxkka83w7E6l6coWdcZWLvpzIFHckiLVrw2OgaCezGyj3oZAwEWqmQ8tjFZHS0VQu7b/E4d0VX7IGJH5da1fAkKlc+JBJjB6iC49A5EnlXOlRE07c+0WddUMvprM4dmksreia8lyQnuslaSciVfLn9Z0qRGxoEoN5n6sJtz0A/vBhzUPrLmFlxIaxKW2InUdYCsrW3Ni/dEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWxtB+Eg15ZbzesMlyL5mZsphvOtwAmFLDzzzw/5qvs=;
 b=SrkeW8kQHMMuqRq8s8JAZ8x44voic++zUapHIPeXI/NtibJndo1MKlrg6vKffF+Cm6KEI1sZ/IVzLP0hR+H4Y/Vkz+pvpS5ibdt7VLlTgDST+fGduFKBidTJJgdIbSvPyMuRuNBI9PEF0DY3skmB+rF2ReIEFNbyhE2Kb6Klk3H6GMB+RMq0z9CvVSwEwvIVzcwzMph63nZfdZBlKAxCRLD9hw9CHjmxhDyUYYdZqS1MdJSngRrtuq8TQq9o6torAbbGm9ncI42pEoiA2VBvZagd3einjcfGovjc0DdwUwd29eID2MEvThEcfIaJxI94EdGaufFm1EYLhTBRaosKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWxtB+Eg15ZbzesMlyL5mZsphvOtwAmFLDzzzw/5qvs=;
 b=CsUVbAlxygoHiJMkzHBYh6czJTDFt0BhG9WqA/PFSE/q+xmqk3kM/eWy5Z3Pd2T6Do0qNmKnsOAs1Xp49gq1c/Fix15UV9ha5T+rBFUlIhmA1WL2oA4o24JM7816BRBlpARt6Ctj33Da4NDVtDDWqKqOMHh8l5X/gVB5zjVNHdL/ojJ9/SIzmd//k+6J+oD6tgnsIq9dGNJ2fsv65V6covKhXqC4J5d75/wxN0tiqaCJesgwzg1jXNvnZrIKzS/se3aUMnxl5g9E5jrKbqTDTou4ZIwP314WB5tKKq/SL2NwAVuR0QWg8aNQB+az4JkvA6xhqhBZjPuyYtsOktCknA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1551.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 11:25:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 11:25:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Topic: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Index: AQHY9TR92HLsIR9PiEOmF5X/4UnXLK45ljcA
Date: Fri, 11 Nov 2022 11:25:35 +0000
Message-ID: <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
In-Reply-To: <20221110184303.393179-1-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1551:EE_
x-ms-office365-filtering-correlation-id: ca1b18c9-1db5-44b9-2938-08dac3d773b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3WCw2Tsn4AOT6LcJ4xO4aEwkC3LZXvzBT8VdxUGO2QBXjeg1IOanx9JxOo4jdEKYrZl264tpc+I8vT7aJTEsF71dQlEGBFs5u1B17dZS6fX671jjxauubSPQbYpLmxywbaC+8j+dB1ejRy6KMZmQuCPR4fvUhy0ArsmFFkHGe3WAo2q8BxYW36t02FsuO+FaAHl5rKveoBavQGrD83+wWiMvu5w/2HAE9d6kQlteEx4NNnGQtfZKHrTn5H0N6GzFlE1SFNXhW8JkV9bKqDaZEctD0y9MTEqK9DV0TdXOFIgjs0CxPG1eTuoK3XB1ScpNGoeCfWbXb5jWI+HyVmgMjIB4BcnPP9oYEjWmrijkj914CoJ5209Lqq3t7py3uuaG5Qz+u9Ua1OFt58tV5KGkn1cJJ4gchfBCM701UzxCeaKgFkdxp+FhLix6DP16ZLo2g591yuhpIY+2oH/aOcgYRcPvhv6pTkod6x4XzFU55vuncr49lfzhFdH4PwByGOgLNZaeTKMyVOaXXFXsRUPFbdUreoGneSatrznywWkhfthMBJ4wjUPrk/gFcBlwgg12b8J4mT/7LVE2+rilTfPzzpvpt0DsXh38Jk5sPLG9X8jWtg+PjDeruUQjCfKueCYYlM3YYhQcqJFl91hlFx/BdTTj9C1Ejqn7tVbhFnqcRnwh3idj5yzsTmof0pGTtjNdv5HtmNljGJLnjnW1Rz+jIcIDYTvbuZXNQoBoupvv0FBrj5DAH7nP4TyZCpPZ/6i26i44tiR/EKMCp1hyirizfqToeYYT7EJa/P0xXS71l2AHrBhbns3O8L9miKQq4E4GAEpM92jeDLHySYVNYH0iBBe3YEiOcplaMvk0QDf2eY8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39850400004)(346002)(376002)(366004)(451199015)(36756003)(86362001)(38070700005)(31696002)(6506007)(66556008)(6512007)(186003)(2906002)(5660300002)(44832011)(26005)(2616005)(83380400001)(122000001)(38100700002)(8676002)(66476007)(66946007)(76116006)(64756008)(66446008)(316002)(91956017)(31686004)(71200400001)(966005)(41300700001)(6486002)(8936002)(54906003)(478600001)(4326008)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SzQ3SnFhd2pyaUJmYnRQSjNNYm5Vck9WeXhtVXh1SDJLcmI1YWs0cC8zbGZs?=
 =?utf-8?B?S2tPelY2LzhiRVBOODQwSEkyNjA4YVpiRFIrM3gwYTBDbHJsVEY4QS9ZT2Nr?=
 =?utf-8?B?cXRlSTl4MlVxSi9LdFlkODFRM3lkNENrUUVweS8wUmVzWFhvT2JRN2R3SVlV?=
 =?utf-8?B?czVNa1pwd2ExMXNLTkVFWnl5TzVjeXNFSGdta09HbXJuYXJGdnB0SHZTcE9r?=
 =?utf-8?B?NnlzUlJIYk5mMVNHOVVlV3UxbkpaM2xPYWR0QjhpVnRHK3ZGc1p0UnVMSnpm?=
 =?utf-8?B?aS9jUXlJQm4zUXNFUXo0M3JFTkdRM3ZzMnlzUTgxR2ZDSzdlRWs4TmRkM2Fr?=
 =?utf-8?B?WGFLMjNiOHkydlNuY0YreFlMOW1KN3pwcnFOMDB2c2o5YXRVeEZOa2s5N3NE?=
 =?utf-8?B?ZVMvTGdyQS9FTDZEZU5Hak5QVVczOFk4Y3U2MGpHcWN0M3AycEJXUm95aThv?=
 =?utf-8?B?YWh0UXovSFR5Y0prMzZjcXdVMVl2U0RFcm85TmVPZ1REZy90cmp1ZnlSaXhJ?=
 =?utf-8?B?UHI0dXJzckVzQ0VMU2pscy9wWWQ1TFc4VU1abXV4dkU2NXF4SE40NVRVcDJs?=
 =?utf-8?B?UDZCNWl4YjM1TmU3ZnY0MG5aRU9EaytHaEdUbFdyQjFLSXQ3dWhjQmFhaFU0?=
 =?utf-8?B?R3M2bmpDVjVZcGJsdzVFQ2tkSmQ4b0MrSDRBWlZscUpoWjE0UHU5Y1djOUVG?=
 =?utf-8?B?N1ozVzZQZmY2OGVydmVPZDZDVlJSd3Y0K3ZQcDNhTW1sNFJIZnJucjdmZTFU?=
 =?utf-8?B?a0VKNjJreWFWeFFUdVBIUGcvTU5UVzVscFRtd1o0aUR1eXJDWWdrS0ZUTHQv?=
 =?utf-8?B?a2xHRzJ2ZkRtMU5acmd4RmhFbEExRWdIQ2cvcC9VdVNIK05uakZZR1NOTHJk?=
 =?utf-8?B?cXFuLzRXb0Y3NWZMUnVlNS9MWWd1dk44NzRDZkVadkpwcmRFL1NVaUM5elRM?=
 =?utf-8?B?TUI2ZFhaZUwzc25xZUZwR2lHWC9ZMWxtRlAya2syWGNaYU5aYkZHUDI3RlZJ?=
 =?utf-8?B?SW4vMVE0bDViVkFYMzRXMXY3a3FHSmc4d1AyRU9IWTVQZXVrdU9TR1JzRmw0?=
 =?utf-8?B?NGhVTW1KRGYwRmRYbEcvN0FQWCtPWU5FeHFpZzdaUEEzNlo0aHJEUVFFd3BW?=
 =?utf-8?B?Z2RlcUVMQ1BSbWJUNy9jMi9naUtmdkJZU2hlN29HNm1EM1pXYWViS2x0UWlQ?=
 =?utf-8?B?Z3g3NFhkbkZPblVqVEkvM3h3RzYrZjQ3SzhoZlVFakt5SWhlU1l4ZWVwRFhS?=
 =?utf-8?B?WE5rQ3FqRWtpc3VVQXhiUzFLKzNDZnB6N0Q4UmM5c05md0pIak10RWZLZ1Uy?=
 =?utf-8?B?MG1QRmlJUGlwVitMQW9YK3JNSFM2TzY2NXpTaTBJeXJwWk1USmR2VHp1eVBZ?=
 =?utf-8?B?UTMrY09rZUtBd28zQ1pnRVFEYUZOUGtBVmVkaGN3SGwvSHh4eVRCNVE0Tmp3?=
 =?utf-8?B?WTlVaVN3MHgxbExpOS9vU1FjQ3dpQ3J0MUlrVXJHeHlaNkdEeXYvcmFuL3c0?=
 =?utf-8?B?WmthbG9VMC84L2c1R1JNVkY1SFV5SG8rNFByQ0ZsRjB0d00rMTdWeXRWRGlT?=
 =?utf-8?B?QnRnMVFiNCtrSmVZTExDY2E2QnM2eGZoa1BqUjRoNExWeFBLU09IV3A5bksy?=
 =?utf-8?B?V21PMjhEeTdhdkhFZzBqYlR2UHhRNDJiUEVVUjQ3QVNLMXV2MkVzL1krd0tt?=
 =?utf-8?B?RUtybTRxc1UvZWdWdkdnWGJ3ZWtlZDdiQUJKa2labzRsMGhBN3ZqTE1ZdDl4?=
 =?utf-8?B?eE9wVXdBa0ZPMTdUMnFtR3ovSisyMzZHY2JKOWdMU1ZDcWUxNXE2cGhJZ2Fs?=
 =?utf-8?B?TVpzOEIvQW4yTHI4aTJJa3hKL2ZWU0tZZnpFeEZHUSt2NmhPNEhkd1puNVlz?=
 =?utf-8?B?NTlqakZQSHNXakpaK3BEdk1EMlJlZDhxUVpreU9saUlnYjNEVjRPc2pyMG9m?=
 =?utf-8?B?R0IySHVtajRHb3FhOEZ5MXFDc3hWQXNpejJuN0NYYVA0L2MvdEQyQ2FZb2I5?=
 =?utf-8?B?Sks2UlJzb1dPMTFiMXM1TFY1YnBZT3lJZXVpUnhYd2hLYkp4ZFM3R25kNFFh?=
 =?utf-8?B?V2E2cWhTamt3YjhEbHcxa1ZmQnZUdHZxVWZoNWhsYy95ZDhHcFlWcXY4MUNE?=
 =?utf-8?B?UW4rNDNSSFVCUjdKcXpYdkRTaDhCU056aWozQVpLSXVzRGJMMHgxMFRBMm91?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <107E7772B164DA43B081C87EB2BBDB9D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1b18c9-1db5-44b9-2938-08dac3d773b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 11:25:35.2893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKR3Wc+p1HFEn9BUFH3VRloa4IbgWIzMPq+mpOxfIiedvlfG91CsplhjwpTBKYHecW89sIZYwy95ZVtyJqOzoIE0lYy2mnFw2FtL5I9AkJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1551
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TGUgMTAvMTEvMjAyMiDDoCAxOTo0MywgSGFyaSBCYXRoaW5pIGEgw6ljcml0wqA6DQo+IE1vc3Qg
QlBGIHByb2dyYW1zIGFyZSBzbWFsbCwgYnV0IHRoZXkgY29uc3VtZSBhIHBhZ2UgZWFjaC4gRm9y
IHN5c3RlbXMNCj4gd2l0aCBidXN5IHRyYWZmaWMgYW5kIG1hbnkgQlBGIHByb2dyYW1zLCB0aGlz
IG1heSBhbHNvIGFkZCBzaWduaWZpY2FudA0KPiBwcmVzc3VyZSBvbiBpbnN0cnVjdGlvbiBUTEIu
IEhpZ2ggaVRMQiBwcmVzc3VyZSB1c3VhbGx5IHNsb3dzIGRvd24gdGhlDQo+IHdob2xlIHN5c3Rl
bSBjYXVzaW5nIHZpc2libGUgcGVyZm9ybWFuY2UgZGVncmFkYXRpb24gZm9yIHByb2R1Y3Rpb24N
Cj4gd29ya2xvYWRzLg0KPiANCj4gYnBmX3Byb2dfcGFjaywgYSBjdXN0b21pemVkIGFsbG9jYXRv
ciB0aGF0IHBhY2tzIG11bHRpcGxlIGJwZiBwcm9ncmFtcw0KPiBpbnRvIHByZWFsbG9jYXRlZCBt
ZW1vcnkgY2h1bmtzLCB3YXMgcHJvcG9zZWQgWzFdIHRvIGFkZHJlc3MgaXQuIFRoaXMNCj4gc2Vy
aWVzIGV4dGVuZHMgdGhpcyBzdXBwb3J0IG9uIHBvd2VycGMuDQo+IA0KPiBQYXRjaGVzIDEgJiAy
IGFkZCB0aGUgYXJjaCBzcGVjaWZpYyBmdW5jdGlvbnMgbmVlZGVkIHRvIHN1cHBvcnQgdGhpcw0K
PiBmZWF0dXJlLiBQYXRjaCAzIGVuYWJsZXMgdGhlIHN1cHBvcnQgZm9yIHBvd2VycGMuIFRoZSBs
YXN0IHBhdGNoDQo+IGVuc3VyZXMgY2xlYW51cCBpcyBoYW5kbGVkIHJhY2VmdWxseS4NCj4gDQo+
IFRlc3RlZCB0aGUgY2hhbmdlcyBzdWNjZXNzZnVsbHkgb24gYSBQb3dlclZNLiBwYXRjaF9pbnN0
cnVjdGlvbigpLA0KPiBuZWVkZWQgZm9yIGJwZl9hcmNoX3RleHRfY29weSgpLCBpcyBmYWlsaW5n
IGZvciBwcGMzMi4gRGVidWdnaW5nIGl0Lg0KPiBQb3N0aW5nIHRoZSBwYXRjaGVzIGluIHRoZSBt
ZWFud2hpbGUgZm9yIGZlZWRiYWNrIG9uIHRoZXNlIGNoYW5nZXMuDQoNCkkgZGlkIGEgcXVpY2sg
dGVzdCBvbiBwcGMzMiwgSSBkb24ndCBnZXQgc3VjaCBhIHByb2JsZW0sIG9ubHkgc29tZXRoaW5n
IA0Kd3JvbmcgaW4gdGhlIGR1bXAgcHJpbnQgYXMgdHJhcHMgaW50cnVjdGlvbnMgb25seSBhcmUg
ZHVtcGVkLCBidXQgDQp0Y3BkdW1wIHdvcmtzIGFzIGV4cGVjdGVkOg0KDQpbICAgNTUuNjkyOTk4
XSBicGZfaml0X2VuYWJsZSA9IDIgd2FzIHNldCEgTkVWRVIgdXNlIHRoaXMgaW4gcHJvZHVjdGlv
biwgDQpvbmx5IGZvciBKSVQgZGVidWdnaW5nIQ0KWyAgIDY2LjI3OTI1OV0gZGV2aWNlIGV0aDAg
ZW50ZXJlZCBwcm9taXNjdW91cyBtb2RlDQpbICAgNjcuMjE0NzU2XSBQYXNzIDE6IHNocmluayA9
IDAsIHNlZW4gPSAweDFmOTgwMDAwDQpbICAgNjcuMjE0ODgwXSBQYXNzIDI6IHNocmluayA9IDAs
IHNlZW4gPSAweDFmOTgwMDAwDQpbICAgNjcuMjE0OTY2XSBmbGVuPTUgcHJvZ2xlbj02MCBwYXNz
PTMgaW1hZ2U9YmU3YTgwMzggZnJvbT10Y3BkdW1wIHBpZD00NTkNClsgICA2Ny4yMjUyNjFdIEpJ
VCBjb2RlOiAwMDAwMDAwMDogN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggDQo3
ZiBlMCAwMCAwOA0KWyAgIDY3LjIzMzkwNF0gSklUIGNvZGU6IDAwMDAwMDEwOiA3ZiBlMCAwMCAw
OCA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4DQpbICAgNjcuMjQyNTc5XSBK
SVQgY29kZTogMDAwMDAwMjA6IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IA0K
N2YgZTAgMDAgMDgNClsgICA2Ny4yNDk2OTRdIEpJVCBjb2RlOiAwMDAwMDAzMDogN2YgZTAgMDAg
MDggN2YgZTAgMDAgMDggN2YgZTAgMDAgMDgNClsgICA2Ny4yNTkyNTVdIFBhc3MgMTogc2hyaW5r
ID0gMCwgc2VlbiA9IDB4M2ZmODAxZmUNClsgICA2Ny4yNTk0MjFdIFBhc3MgMjogc2hyaW5rID0g
MCwgc2VlbiA9IDB4M2ZmODAxZmUNClsgICA2Ny4yNTk1MTRdIGZsZW49NDAgcHJvZ2xlbj01MDQg
cGFzcz0zIGltYWdlPWJlN2E4MGEwIGZyb209dGNwZHVtcCANCnBpZD00NTkNClsgICA2Ny4yNjk0
NjddIEpJVCBjb2RlOiAwMDAwMDAwMDogN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggN2YgZTAgMDAg
MDggDQo3ZiBlMCAwMCAwOA0KWyAgIDY3LjI3ODAwMV0gSklUIGNvZGU6IDAwMDAwMDEwOiA3ZiBl
MCAwMCAwOCA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4DQpbICAgNjcuMjg2
NTE5XSBKSVQgY29kZTogMDAwMDAwMjA6IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdmIGUwIDAw
IDA4IA0KN2YgZTAgMDAgMDgNClsgICA2Ny4yOTUwNDFdIEpJVCBjb2RlOiAwMDAwMDAzMDogN2Yg
ZTAgMDAgMDggN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggDQo3ZiBlMCAwMCAwOA0KWyAgIDY3LjMw
MzU5Nl0gSklUIGNvZGU6IDAwMDAwMDQwOiA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCA3ZiBlMCAw
MCAwOCANCjdmIGUwIDAwIDA4DQpbICAgNjcuMzEyMTY0XSBKSVQgY29kZTogMDAwMDAwNTA6IDdm
IGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IA0KN2YgZTAgMDAgMDgNClsgICA2Ny4z
MTkyMzFdIEpJVCBjb2RlOiAwMDAwMDA2MDogN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggN2YgZTAg
MDAgMDggDQo3ZiBlMCAwMCAwOA0KWyAgIDY3LjMyODgyMl0gSklUIGNvZGU6IDAwMDAwMDcwOiA3
ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4DQpbICAgNjcu
MzM3MzgyXSBKSVQgY29kZTogMDAwMDAwODA6IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdmIGUw
IDAwIDA4IA0KN2YgZTAgMDAgMDgNClsgICA2Ny4zNDU5MDFdIEpJVCBjb2RlOiAwMDAwMDA5MDog
N2YgZTAgMDAgMDggN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggDQo3ZiBlMCAwMCAwOA0KWyAgIDY3
LjM1NDQyM10gSklUIGNvZGU6IDAwMDAwMGEwOiA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCA3ZiBl
MCAwMCAwOCANCjdmIGUwIDAwIDA4DQpbICAgNjcuMzYyOTQxXSBKSVQgY29kZTogMDAwMDAwYjA6
IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IA0KN2YgZTAgMDAgMDgNClsgICA2
Ny4zNzE0NjJdIEpJVCBjb2RlOiAwMDAwMDBjMDogN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggN2Yg
ZTAgMDAgMDggDQo3ZiBlMCAwMCAwOA0KWyAgIDY3LjM3ODUyNl0gSklUIGNvZGU6IDAwMDAwMGQw
OiA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4DQpbICAg
NjcuMzg4MTIwXSBKSVQgY29kZTogMDAwMDAwZTA6IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdm
IGUwIDAwIDA4IA0KN2YgZTAgMDAgMDgNClsgICA2Ny4zOTY2ODBdIEpJVCBjb2RlOiAwMDAwMDBm
MDogN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggDQo3ZiBlMCAwMCAwOA0KWyAg
IDY3LjQwNTE5OV0gSklUIGNvZGU6IDAwMDAwMTAwOiA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCA3
ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4DQpbICAgNjcuNDEzNzU2XSBKSVQgY29kZTogMDAwMDAx
MTA6IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IA0KN2YgZTAgMDAgMDgNClsg
ICA2Ny40MjIzMjRdIEpJVCBjb2RlOiAwMDAwMDEyMDogN2YgZTAgMDAgMDggN2YgZTAgMDAgMDgg
N2YgZTAgMDAgMDggDQo3ZiBlMCAwMCAwOA0KWyAgIDY3LjQyOTM4OV0gSklUIGNvZGU6IDAwMDAw
MTMwOiA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4DQpb
ICAgNjcuNDM4OTgyXSBKSVQgY29kZTogMDAwMDAxNDA6IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4
IDdmIGUwIDAwIDA4IA0KN2YgZTAgMDAgMDgNClsgICA2Ny40NDc1NDFdIEpJVCBjb2RlOiAwMDAw
MDE1MDogN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggDQo3ZiBlMCAwMCAwOA0K
WyAgIDY3LjQ1NjA1OV0gSklUIGNvZGU6IDAwMDAwMTYwOiA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAw
OCA3ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4DQpbICAgNjcuNDY0NTc4XSBKSVQgY29kZTogMDAw
MDAxNzA6IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IA0KN2YgZTAgMDAgMDgN
ClsgICA2Ny40NzMyMDFdIEpJVCBjb2RlOiAwMDAwMDE4MDogN2YgZTAgMDAgMDggN2YgZTAgMDAg
MDggN2YgZTAgMDAgMDggDQo3ZiBlMCAwMCAwOA0KWyAgIDY3LjQ4MTcwNV0gSklUIGNvZGU6IDAw
MDAwMTkwOiA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4
DQpbICAgNjcuNDg4NzcwXSBKSVQgY29kZTogMDAwMDAxYTA6IDdmIGUwIDAwIDA4IDdmIGUwIDAw
IDA4IDdmIGUwIDAwIDA4IA0KN2YgZTAgMDAgMDgNClsgICA2Ny40OTgzNTldIEpJVCBjb2RlOiAw
MDAwMDFiMDogN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggN2YgZTAgMDAgMDggDQo3ZiBlMCAwMCAw
OA0KWyAgIDY3LjUwNjkyMV0gSklUIGNvZGU6IDAwMDAwMWMwOiA3ZiBlMCAwMCAwOCA3ZiBlMCAw
MCAwOCA3ZiBlMCAwMCAwOCANCjdmIGUwIDAwIDA4DQpbICAgNjcuNTE1NDM5XSBKSVQgY29kZTog
MDAwMDAxZDA6IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IDdmIGUwIDAwIDA4IA0KN2YgZTAgMDAg
MDgNClsgICA2Ny41MjM5OThdIEpJVCBjb2RlOiAwMDAwMDFlMDogN2YgZTAgMDAgMDggN2YgZTAg
MDAgMDggN2YgZTAgMDAgMDggDQo3ZiBlMCAwMCAwOA0KWyAgIDY3LjUzMjU2NV0gSklUIGNvZGU6
IDAwMDAwMWYwOiA3ZiBlMCAwMCAwOCA3ZiBlMCAwMCAwOA0KWyAgIDgyLjYyMDg5OF0gZGV2aWNl
IGV0aDAgbGVmdCBwcm9taXNjdW91cyBtb2RlDQoNCg0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2JwZi8yMDIyMDIwNDE4NTc0Mi4yNzEwMzAtMS1zb25nQGtlcm5lbC5vcmcvDQo+
IA0KPiBIYXJpIEJhdGhpbmkgKDMpOg0KPiAgICBwb3dlcnBjL2JwZjogaW1wbGVtZW50IGJwZl9h
cmNoX3RleHRfY29weQ0KPiAgICBwb3dlcnBjL2JwZjogaW1wbGVtZW50IGJwZl9hcmNoX3RleHRf
aW52YWxpZGF0ZSBmb3IgYnBmX3Byb2dfcGFjaw0KPiAgICBwb3dlcnBjL2JwZjogdXNlIGJwZl9q
aXRfYmluYXJ5X3BhY2tfW2FsbG9jfGZpbmFsaXplfGZyZWVdDQo+IA0KPiAgIGFyY2gvcG93ZXJw
Yy9uZXQvYnBmX2ppdC5oICAgICAgICB8ICAxOCArLS0NCj4gICBhcmNoL3Bvd2VycGMvbmV0L2Jw
Zl9qaXRfY29tcC5jICAgfCAxOTQgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jIHwgIDI2ICsrLS0NCj4gICBhcmNoL3Bv
d2VycGMvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAgMzIgKystLS0NCj4gICA0IGZpbGVzIGNoYW5n
ZWQsIDE5OCBpbnNlcnRpb25zKCspLCA3MiBkZWxldGlvbnMoLSkNCj4gDQoNCg==
