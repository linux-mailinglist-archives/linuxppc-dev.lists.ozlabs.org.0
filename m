Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1526F3EFF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 10:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9Xyq3nsGz3brd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 18:18:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pLdinxn3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pLdinxn3;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Xxv51Q6z3blx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 18:17:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpRN8Wcvu7/uaE9v4jLSfNmgX8UVswo44GteSUgEa9D++EDtCc9RWJak1YEGvYWFj02mrYeBP6DiHD9R76nki6s2Pl1Jtmmd7OtTSsxI5MaCoM4L2tI+G/4uAUhbeDKV6mL1DnJqC4erwbdbmA3cKHIuv82j/ZhuTOewUvfDzpbdqTfViNuqr/L43Fs9yu0uSvqjE7ElyzuNDkBEftdIGUsY2WxiGVsOTD3Fm4lPGB35pFMZkY0J6zKOKnD6BtysgHlehrVCStF4Jbmh2lD7Uf5I3S+pFnPtHx41aZKl/YjaftpMGbMyW5vEIA8XEcBGV3esvKrElWUm46wXMrfDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5zvlrCRpDD4TusWuIQCa5r3CMR+rSkeRK6/EsDo9nA=;
 b=CPXIfw6XqT90wVJak8HCCzQFI7hNHofKTs7O6oMhQElRmI4qoRtBIBApqB7iPDtbb+bb+yzwQH4vYMGnYV+cKIALWRW3N4Z4MK+82vLmLUFqkUE0kZirNdGRPpbwMaW5+JdWlYr1KlwPW2eKMdAahub3B1L79uvOLEUNYEq3RR4niBmsrtojqsOaRidcAzSSC1zNn2PSjJjad1YcM2jJcb6W8yBMOUORMhnb9z3H65HDf+k0sh9IQive+MsmK91LW8p7c/sOkc6cHdt1DDgBX8vS60p1esfwPuQyo7Q/tYOWWCKZ1QMOiPgxn4snrZekRhVCX5jJaxPehNTsibMzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5zvlrCRpDD4TusWuIQCa5r3CMR+rSkeRK6/EsDo9nA=;
 b=pLdinxn3aLnCa1TV7zKFdDEoG9nyrLb6ckkUa0XLqZKXrwXwmg2DKiui73031fSbCIMz25U6DhwRP886X9JjvTE7DT3K/yaze2h3gV5vji3S7Sshxv1ljPTi/WNMaXpLfB39Tr0zNrSWc0pycQdh6L7kM5ciif1spN0R8hTGHFD4VTZjKL9oz4ajf64bocj+lNdDxzgx0wZuM541oA86ETxd1RYRkUfdLcLOduANZEcdo9fUWOTqQkxuaI67c2RAmsOVVMOvRoHMBlR6Sh/CId5c/GkApuVh+v47ycdqCH9IbHqJ8qRWE9YbxMDNuh1k3BDPjp+4NzZ285eXkRSNjw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 08:17:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25%5]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 08:17:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Thread-Topic: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Thread-Index: AQHZfJ3uhjZJMcrhjkuYS0m/PUGJea9Go8WA
Date: Tue, 2 May 2023 08:17:15 +0000
Message-ID: <3cf0fbfa-4da0-7e7a-bc3d-d0bd3cd897a3@csgroup.eu>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
In-Reply-To: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1650:EE_
x-ms-office365-filtering-correlation-id: 070ccac0-6c47-482d-a119-08db4ae5a3a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /3JVqqL+U7k94ekCJj/r54NHlm0A4ZePl2cFcw69Uix6ydJ5FaGOH342kogLukIMcD2Uo5EVvKMoNORSMDQN7eCEOf65SDiH1h+8QM9qaQqiac+F1DqlAR91IbRb3NdPV2Z34VMXJf70bIksUvbdJw1EDRnlfqfQXkr0+mOB08P36LW6wqVnx85f2UrsBkrgvrGOQcNShYLbQ84xD7pdLORvpTGVwRjMVyXUwvR7fV8NnWeYsGcM9NGTUgKeZiTN3nh8tWfdKALKIdBjJ+No3R8nFAhqQeczQwpcOR9e+rghtxruv28jifotLYO+9C4IW4G17p+BSk3Xz8l1FIgmxiuJBAVwX0y6e50kXKuyi/Dr4HpXo3vbILlwjH7W+GsX2cBLRV7CSYbqnqxoqHQehC6XZ170fthFwf0YE+sbl0YDfjsvePMkvI+8mAr8Cero/0DuN71hR5o0RRJAmYXtePHOBtlQzb8Qm6yozrsCM82Awo3ZbyohIE6z0PMV6SOeuvE3i6gYQ1oo2UfEA4gWP8cXrDg4hwOB9aFzgift/kqoIIQue2Jkfrb9xx2Ydoy8dSSAnKpCEFD+GFz8LYyDJfpKj4qtacdnl16vurvAPx11QcF6HENC5TURry/NN/MLwyw4gUC+gTl3FVVQRLmejnNlIkWho6KHKa+UXIpTtuw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39850400004)(376002)(346002)(396003)(451199021)(122000001)(71200400001)(6486002)(6506007)(38100700002)(38070700005)(26005)(186003)(2616005)(44832011)(6512007)(83380400001)(15650500001)(2906002)(4744005)(8676002)(8936002)(76116006)(36756003)(31696002)(478600001)(5660300002)(54906003)(110136005)(966005)(4326008)(64756008)(316002)(66446008)(66476007)(66556008)(41300700001)(86362001)(91956017)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Qk1Hei9LajlUZFltVGdJMTV2NUJ1OUN1YkJFTWVUWGo0STAxWlZ2bUR6b2lU?=
 =?utf-8?B?VXAwZHRsZXVLbklNT0NQZjVUQ1lZSE1Fam0vTFp1REFkK3FWOWg5MXFrSVBl?=
 =?utf-8?B?YW1iTjgvZC9xQ1RYamZmMzJaVHNkN3ZGY0F6WURaWWZRNUJrUXlkWUt1OVpK?=
 =?utf-8?B?clNEMmdhMFdBWFI1OUNJekY3Y0RRWmZlZEdmQW9aMjFLMUdNblUvRVRkQjMy?=
 =?utf-8?B?MU5GNkMvTzlMTkJaYnVPUkVWdHRiTGVrYWtHNjdBS1Z5M2pFUUhKL2pXZENz?=
 =?utf-8?B?cHZhTEo2TzRDNUNoRFBKN1ZyQlhlZEJqQk9qSUhDdU1YR25aeDgxNGZEYVNY?=
 =?utf-8?B?czhJSFRSWnNiYVJMdTlYRDlUUW9WK3dyVnJ3V2ZJVHBQT29zQ1Fjc21rK1pO?=
 =?utf-8?B?YW1WVWtWZ1JFcG4rSk5pY1FuY1ExMnVRV0lwVEcyQTR5WUdLcmVzcjl4ejE2?=
 =?utf-8?B?dm9kYjhOQVRiVFB6QmpHZHRGeVZ6VG1YSWVaSTlLaGl5c3lDNDhDaHhGbG54?=
 =?utf-8?B?TFFmeGZLd25FWjNOa1p4SVVUcXIyazRyb3c3Z3krQWZkUHpHYk9nSFhTdzdG?=
 =?utf-8?B?TXpsdmNKMVZ1R1ljdGtsZnN1c0NKQVFaYVRSTW9DU1lyd3pjYmVab3hGQm9E?=
 =?utf-8?B?RUFpSlp5STg0MnhaQlh6WFJpL2RkKzAyRUxaZU5aZS9JdERtcS9lRmp5TXRr?=
 =?utf-8?B?RnBKbldjbFdsMmFxZXdULytTVXpJdUF2TU1QcndXdkljbXZHa2NZUlVHOU9l?=
 =?utf-8?B?amhtTmV1YVFIdkxGUGtrcXZvYW5odFhCOGtydFF2eGo3NlhXaVJ4ODNBWDRG?=
 =?utf-8?B?Q1VaZWVjUkp0RDU3YTh1VUlZd0gvZmFVYnR6RFJic2MvSS9jUjFKZ2htV3hK?=
 =?utf-8?B?Vnp0OWw3MEdGUWVwNXYrcmE3aWozcjBDM2hLdWVUUEhMMTh6RVhVbWxDcTMw?=
 =?utf-8?B?Sys0ekxRZmVLb1dBd1E0ZVp6RitEUDRIMG5MTUZLcnRCSVlneSs1ZzllTTlF?=
 =?utf-8?B?dnBrMnR4QVJmZ0VKT3E3Mk4zZEl5TVdDejMzZENEenN6aExzTXNJK2Qzb3Zj?=
 =?utf-8?B?cWRsOVJwc1B4QXU5dEliaHRxREkwazJiZkRMbEwvOG9jcDc5S3RMRTk5V2lh?=
 =?utf-8?B?TzhOMEI3cVQ0cnFad3JxWkUwS0pkdkR2a1VHajcrZVgwSFBlRVg5NVRYUStu?=
 =?utf-8?B?MFY4T3ZwekZYWWlNUHJnQ0RlQVNpWmJ0cUMydVI4WnpycFkzRk92cFhITFlq?=
 =?utf-8?B?L05XcmZuZERIUWM3RHB5T0ZPaGRkVU4xNnI2YVB1UFpEQTBXT1Uvcys0VWU5?=
 =?utf-8?B?bkdCMmcyaEttcDNwL3BDSnlRZEsxOEE0SWhhTkVTYmF4RnlxaFJMbnM2aGlJ?=
 =?utf-8?B?N1dRcVFFeGNtenkyMTFseFp2MWlxVzZ4YWdqc0IzQXo1TmJiZVhUbjBGb2ly?=
 =?utf-8?B?b3RiV1FUdk9LY1l0TWNrcFI3d3cyV2FTRmFCNnZTVGUwbm16TG9VZVVwd3dn?=
 =?utf-8?B?RC9OYS9SYmF5U092N1ZJa00zcGxMNUpaYS9HVWhqYkF3SXg5OGxkbDFHdVJp?=
 =?utf-8?B?YjE3b1ZPZzVpWm5idnM0OWJIdGRac3RSVEhxK0dRcE1PeEVVN3BVV2w3M1p5?=
 =?utf-8?B?ZzhySDFNL2hKc081SFI2VWlmOXE5VmdhcHdXd0tSTklLaEtSNDFnR0Z4ci9U?=
 =?utf-8?B?dGd4N1EyaERGYUpiSGtiVGhhTStRb0N6bCtQd2hDVzBRcTZoWE56ck02aDFy?=
 =?utf-8?B?MkF1L0dMdDBCbFFSQzdNeG5GNTBCM2JVMXJUS2Q4LzdrOEFkWHUxdlBtMUtB?=
 =?utf-8?B?RzdtUVZwM2FXVkdhOTc5T2dMR0hCZWtwMkF1Q0k3djdRYzNsbThPZE90NG5j?=
 =?utf-8?B?dEMwbGQ5YkcrSVRqR3VKbnJHYlhLVllQejFKbkQ1dkprVUNhWTdVR1kybnZW?=
 =?utf-8?B?VlRUcGhqMFI4bTd3UkYyNGJIVmVmMForT3JFN1ZsZGxwcWdJbCt0Ymgyazdv?=
 =?utf-8?B?M21pYjZwYlo2RVZVemV4S3MyMjlFdHZNWFU5cHhXQkU0eVQrWjV5YXpORXdv?=
 =?utf-8?B?bnJia2RoMTVjdStzc3AyeTFrRWF4Nk82b3hwTVJBNnJWSm9oVnh5dnFHSmkx?=
 =?utf-8?Q?oyWliFg5khRmb3v0CzBIPiKxM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E8C6D589531514A8D2A3EBA34ABE853@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 070ccac0-6c47-482d-a119-08db4ae5a3a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 08:17:15.6486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvGjZN+ykADHMrNyaDRUtgiRCSV3W4TIdOfrFPapGArhvg/b5bFLCCpc4dL8EQo707fYgyRfXPMuByiKa7irtDfJVFeJkMqVfBO72pT/y5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1650
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGVsbG8sDQoNCkxlIDAyLzA1LzIwMjMgw6AgMDQ6MjIsIENocmlzdGlhbiBaaWdvdHpreSBhIMOp
Y3JpdMKgOg0KPiBIZWxsbywNCj4gDQo+IE91ciBQQVNFTUkgTmVtbyBib2FyZCBbMV0gZG9lc24n
dCBib290IHdpdGggdGhlIFBvd2VyUEMgdXBkYXRlcyA2LjQtMSBbMl0uDQo+IA0KPiBUaGUga2Vy
bmVsIGhhbmdzIHJpZ2h0IGFmdGVyIHRoZSBib290aW5nIExpbnV4IHZpYSBfX3N0YXJ0KCkgQCAN
Cj4gMHgwMDAwMDAwMDAwMDAwMDAwIC4uLg0KPiANCj4gSSB3YXMgYWJsZSB0byByZXZlcnQgdGhl
IFBvd2VyUEMgdXBkYXRlcyA2LjQtMSBbMl0gd2l0aCB0aGUgZm9sbG93aW5nIA0KPiBjb21tYW5k
OiBnaXQgcmV2ZXJ0IDcwY2MxYjUzMDdlOGVlMzA3NmZkZjJlY2JlYjg5ZWI5NzNhYTBmZjcgLW0g
MQ0KPiANCj4gQWZ0ZXIgYSByZS1jb21waWxpbmcsIHRoZSBrZXJuZWwgYm9vdHMgd2l0aG91dCBh
bnkgcHJvYmxlbXMgd2l0aG91dCB0aGUgDQo+IFBvd2VyUEMgdXBkYXRlcyA2LjQtMSBbMl0uDQoN
CllvdSBhcmUgcmV2ZXJ0aW5nIHRoZSBlbnRpcmUgcG93ZXJwYyBjaGFuZ2VzLCB0aGF0J3MgaGVs
cGxlc3MuDQoNCkNhbiB5b3UgZG8gYSBiaXNlY3QgPw0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0K
PiANCj4gQ291bGQgeW91IHBsZWFzZSBleHBsYWluIG1lLCB3aGF0IHlvdSBoYXZlIGRvbmUgaW4g
dGhlIGJvb3QgYXJlYT8NCj4gDQo+IFBsZWFzZSBmaW5kIGF0dGFjaGVkIHRoZSBrZXJuZWwgY29u
ZmlnLg0KPiANCj4gVGhhbmtzLA0KPiBDaHJpc3RpYW4NCj4gDQo+IA0KPiBbMV0gaHR0cHM6Ly9l
bi53aWtpcGVkaWEub3JnL3dpa2kvQW1pZ2FPbmVfWDEwMDANCj4gWzJdIA0KPiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
Y29tbWl0Lz9pZD03MGNjMWI1MzA3ZThlZTMwNzZmZGYyZWNiZWI4OWViOTczYWEwZmY3DQo=
