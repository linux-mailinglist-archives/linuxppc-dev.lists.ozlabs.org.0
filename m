Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0D67E8A36
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 11:35:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=aTubTQ29;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SSBsP2nLnz3cbw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 21:35:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=aTubTQ29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SSBrW4hmtz2yGW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 21:34:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyYyp7gILTylkrzLbI4hjloihJKU5k3vD8p+45f3dCJphcRdVZ350x4xxGMsJkiYKpAQCOKusY76rV3miFK/fQBsD2RFf7IUNf4F16jGgod9TOw4bphgOOGBHfNXBQ5YQlE8sAgzCryCcjdiKq2Rg/fxee0DYmfQ/0vaEzVd/JNgXlGy2zOPE+bjLtpArIjcVsIHeprqxIpm4AcLrc4mcXb3YcfNVrw/oMScSdIszUcM3Z0Wb0QL0fIN/LJhL3VckHRNmt8mbSd8hA/Af4dnCAvlrbh89Fr9OsQ4qldx0mm8qMS5vP9bIne/YjLjfOcas32avdhzsHKO2T3WAi0G7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nxr4YPf+tIzTHgsxdpzBU0oXYluT6bjubWz9jRV0K5M=;
 b=kZKQeE+PbN70MuNxW/H4382BD7DPBv3d0HbAwywy4KHPetdPfvI2Kz48hcFdqC+/wyC8sNlXm7o4+4oPJJJ5YEASzsBpAqkzAnpVyid8Nn2OcH/6IPRccD3zEZbtg2vsolSSQBbfwvRATLZB8lYyfak374/jhP2/XB9TRABcI4G79LPdvLcqZrFycgRXllyKsPXuuSkNZRZKdpYDgYiRDBBr+briOTcbOjY8VEy9TCV/Jh+Y8BtK9NLBrOqyXtETNcFg7PhgCW/c6JjH9lSfYBbn3CIvunhtCPFlEE4wyQm+rb6Mm3n3BTN4y06EdeA8brFP0vy77TSzjzXuuIMTjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nxr4YPf+tIzTHgsxdpzBU0oXYluT6bjubWz9jRV0K5M=;
 b=aTubTQ2909G3MEmighC+X8zW8cMOFozgRvGQ5LCPcbqrzzOFL6X8HeMWACVRvRWARgOI8ZPX9HAUGFGjlDtTAzYwBpsJrqGXC52LlNSAgg/iVPE1GjdKRqqRKblSHjk6fKJSksDZQ7dz9XX4CvekwHyOUkMrzxleU4Is2opF84oXZjmVSviyOwiCkyy4Tr+NiX4r16SC0JGazlK2LprNeuJAGBYXOVcZX7lXGW8ZJZihwVCsaK/M2CkI0XPn/0ZGdUxIqBAh+BB4sU7r9r/hX/sjM+Lubt6LnKrDsYcMxnK/zYhMcmYMckKJ6v//14vCIuqHX3Q/YZi2vSU9t9XoCQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.12; Sat, 11 Nov
 2023 10:33:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7002.012; Sat, 11 Nov 2023
 10:33:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Matthew Wilcox
	<willy@infradead.org>, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu()
 in set_ptes
Thread-Topic: [PATCH v2] powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu()
 in set_ptes
Thread-Index: AQHaBoeNn2NFVL3n1ECmrgP4sU5dBLBdeakAgAl71ACADhKPAA==
Date: Sat, 11 Nov 2023 10:33:50 +0000
Message-ID: <e381f776-8284-3720-53dd-7ee08878f56e@csgroup.eu>
References: <20231024143604.16749-1-aneesh.kumar@linux.ibm.com>
 <ZTuV5GJ52IZE7mxu@casper.infradead.org> <87bkccgz9b.fsf@mail.lhotse>
In-Reply-To: <87bkccgz9b.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2179:EE_
x-ms-office365-filtering-correlation-id: f7ef7db5-f77a-48c5-db11-08dbe2a1b20a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /kprtVooIXqgPyK9N+wJjIfUMYm0+Ra6BjEn78vy7qdH4JsQORxaNEk+pwdRSlrPuLfjOTY1oUv0ghtAgzHMtmc9usKzFPTPEe6Uk9Vkiplb4D0IVOa/MTMTlMnZLbnDOju/gOfjtFdM4ST0TYSCkB8kby+yP0IYre2LTbdHIpeuDQegQckSUxlcxcMVM4tC4gZkd4+8M3/MNFbgPFHsmvJnRhVE74/mORVe4ui7NIoqEKJtbjyVwOJB/vhqMke/D2PoiGkgq/BXr/7fWlPXr08JL98u6qyB4Yonl56o8RP8N0cq/23kHSCzmbvGcAUuP/anVG1oLY1o1Ty4SV5150RvJjRCnp+j4Kfg1pr5Q831DTO8Lq8mjkpw1zRypZL6rTEFBRTs4e4HqZzWz7CXWVXxF5ITns6rn4heSmZ7JtUpoig0/TzSvVp7xIGUfhb8HKDlzq77w8AUpRb3WshoS619yzzlFuYf9C1jbb7r6cqIDGYk784GyUUMpMMhHsWXMZlQPz2di+eprnR0RIIojDjl7o5h7kZh35lpUyaxr0POdlWwCrl5feQAzHXe/3577MHZJap6voqZ3rQwincZA91VJP1jpMvGCOJB5bWvkgZaHrHSFazTmevIw7FTt3cwNNhUSHR/LUwWwXcc3fXYUT+FlIQEazu6zvcftLyhzfU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(396003)(346002)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(8676002)(41300700001)(8936002)(4326008)(6512007)(31696002)(44832011)(86362001)(66556008)(478600001)(6486002)(110136005)(76116006)(66946007)(91956017)(38100700002)(122000001)(31686004)(66476007)(64756008)(26005)(66446008)(54906003)(316002)(5660300002)(2616005)(36756003)(71200400001)(6506007)(38070700009)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YXQyNk5qbENCWWxLZVI3UXRXNzJCakFLNi9kaVNwNTVHT3JhdFN5bDJhSEVx?=
 =?utf-8?B?VjFDMytkYmVvVzRITHBldVRva2Y5ZmtCY3V3eWNVZDZhanpwQ0tldXZXeVJv?=
 =?utf-8?B?WWVMclRsdGtRQjN4cWU1ZHNvaThVZURxejRvYk9yOTdKR0R2UDlQb2ZmZmYr?=
 =?utf-8?B?bVN2WnBRYnhuVU1BSUw1LytaVXhZbVpKaE9sc0dQWEZobXdTYkZuSXgyQ2Nq?=
 =?utf-8?B?bmlLc1ZTcFIxQ3ljWTcvN01pNWVtYUR3Y3dwRmxPN0JnRE92WU8xSE1LY0d2?=
 =?utf-8?B?MnZmUXBXZFBsMnVpUy9hOU9jamJmTkwwT3dxYzg1RkdFcHVOZnBWSXpxYzZX?=
 =?utf-8?B?MkJ1NFlwQXcxOEcyOE93ZW1zSFVJaU9UTUc2MWM0clZ3a01zWFROaW5XR1Q3?=
 =?utf-8?B?VmxBbzRhN0tZTjVOSVdrS2Q0ZEtSNS9PTG5LSUpXUnJvUlpEQms4Z2Q3NStE?=
 =?utf-8?B?aVVPS1FXcVBzZ2Rody9KT3VMR2JhbE9LVWJaWFFpMjhJbC9mZUJmK0w1b1dQ?=
 =?utf-8?B?OUZuYkZaY2tsdGtTKzRGeDUvMzQ4Sk95aDZwZXpoUEVVMzRuM3l5ck51MVlh?=
 =?utf-8?B?SWoxS1hVd25nekp1cXVFaHAvZUZrVktpZEpoOUNoWk8xU0ZzY3hwWmNURlRa?=
 =?utf-8?B?T2s1L1JZOSt2RGhsV1dIeHMxQUU5ZFE3V2VrUTRIZXdtTmZGOGg3aDRkKzJa?=
 =?utf-8?B?b1FlMDIrOVNmclB5YkpaYi9GVVhzUWpMMmdxcW92NnB4ZzJwTkswZWMrWDRr?=
 =?utf-8?B?bm82YzFVOE8wRWgrZXljbldPbjU4ZTR0UVd4bGdpdUwrNlJBMFY2UTdFcFZO?=
 =?utf-8?B?bXlPQUN4aldpS0pHcTNrdVBxcXl2UVRISWJ1UU9UdUg4UFpnckJlRFVBemMr?=
 =?utf-8?B?NWdZbjBtMGtKOWlGVFhidW4xNkcweXRGZGprNmovcFhSVkJqOFNtVkNFTWtl?=
 =?utf-8?B?VjNGNmRVcnFYZ1gxZ1RvNHRSVmdFSThNSjltNUFaS05sNGNiclFPY1g3b2pX?=
 =?utf-8?B?cStra1c3SWx4VzNRbzlwUzIweEpKcFA5dkZrdG9pZGNyM3g3TVlBTS9Id1Jw?=
 =?utf-8?B?b1FZS0tGbmV6b2xjRlo3Y00wdnhEcjNQNGxpMCsyUDV2OWZ6STh0TWJXdnFT?=
 =?utf-8?B?azlydHBjOG1QT1Z3NDJ6RXA1anh1UTA4NTcwTXA0VEdMWHNJUkN4NVFkL0dj?=
 =?utf-8?B?clhERXkyK2RNVG96VjRocGtiUzQzNURUSUhXUVp3NjIwZFVJZVlkZUJ4eVdP?=
 =?utf-8?B?MFNXT1lxaGo4RmNJKzVqcU5EWGsyKzhCSDAwdVdpRVdoMHo2UDZBMUNhS3hv?=
 =?utf-8?B?UlM1Z0dodjI3cFl3U3U0Y3dZSm5kbThXVkpwdy9CM0Z2RnZoM2d5Z0VONm5a?=
 =?utf-8?B?Y05CVWx5c1Yzc3h5ZjN6ZG9WdTErRWRjZXJTc3ZVL2FuUGpET1MvSWEwM3Rh?=
 =?utf-8?B?a1M4bUJaTSsxN01wRStwY1pUWXhOY3pNdHo1d2ZqVzcwNlpHTC9JcjcxN3N5?=
 =?utf-8?B?NUF0QzNUbXB0d0tPNHk0M1pvaXpTQXNSV2w4Z1ZMcG1qRUJ5dDFwNlpsczE5?=
 =?utf-8?B?dkRmcnRaRE52dWY3MVl2djZScldxbGRNSnNrOHJTZ1VrNWJzdmphaU1pbnBl?=
 =?utf-8?B?SkdCTHN5b2todG5RMTBGeDI4N1g3U3o2Z2kyOCtlWXh4ejB3NldqVTRMU0NB?=
 =?utf-8?B?SGFGcjlaQThNeE9SK0FyMW1rYUpOOEovTFRKNXU0bHNvVGpzdlY0Ulk0WHd1?=
 =?utf-8?B?OUE3T2htWWRtTkxsOGovSlFsYy9FYXVtcTdsTTBJbE1XSVFjT3lYdC90TSsw?=
 =?utf-8?B?dFhOMEpiNVJMZ1FIQW5vZFZVa0NoaE9LNGpjNWF4QUtPdFdodHczNVExOVNE?=
 =?utf-8?B?RXh5bDQ1ZHlaZFRjOFRXTUZSQW05T2hJTEhNbWRtQVVHc1Z0a2xHVTF1Qm5Q?=
 =?utf-8?B?VE0rNXMrNUY4T0pTSU1YNS9HUS94RWFmZWFTZWtpVVV2dW1Ja2lRQ056Z0cx?=
 =?utf-8?B?VlNVZDFMcTdaWGI3RytsWWJiRUtqRnpqQmFzOWxTOW8vZEhlcjZiL1dMNTZx?=
 =?utf-8?B?WE9GVzJCVVcvUzNNbldlUkVmbWZYaStwb0hlSmdqU1QwSDJxajZ0TTRhb3hZ?=
 =?utf-8?Q?R7Kx8iGp26x0b08HoCIeg9VbV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4199E9F4720A804AA80CF9A2FDEBDEB4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ef7db5-f77a-48c5-db11-08dbe2a1b20a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2023 10:33:50.7263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yxukq/GhlAutJ0MzzA1Wuk8MUzpSOG9hxt4We7TtOoAC1+jsyceyO8OFQ1kLcxmMWfHHEvrV8MBlvH2RoXff27QHpBPam2VzCzJUwwGBXRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2179
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzExLzIwMjMgw6AgMTI6MzksIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+IHdyaXRlczoNCj4+IE9uIFR1
ZSwgT2N0IDI0LCAyMDIzIGF0IDA4OjA2OjA0UE0gKzA1MzAsIEFuZWVzaCBLdW1hciBLLlYgd3Jv
dGU6DQo+Pj4gICAJCXB0ZXArKzsNCj4+PiAtCQlwdGUgPSBfX3B0ZShwdGVfdmFsKHB0ZSkgKyAo
MVVMIDw8IFBURV9SUE5fU0hJRlQpKTsNCj4+PiAgIAkJYWRkciArPSBQQUdFX1NJWkU7DQo+Pj4g
KwkJLyoNCj4+PiArCQkgKiBpbmNyZW1lbnQgdGhlIHBmbi4NCj4+PiArCQkgKi8NCj4+PiArCQlw
dGUgPSBwZm5fcHRlKHB0ZV9wZm4ocHRlKSArIDEsIHB0ZV9wZ3Byb3QoKHB0ZSkpKTsNCj4+DQo+
PiB3aGVuIGkgbG9va2VkIGF0IHRoaXMsIGl0IGdlbmVyYXRlZCBzaGl0IGNvZGUuICBkaWQgeW91
IGNoZWNrPw0KPiANCj4gSSBkaWRuJ3QgbG9vayAuLi4NCj4gDQo+IDxnb2VzIGFuZCBsb29rcz4N
Cj4gDQo+IEl0J3Mgbm90IHN1cGVyIGNsZWFyIGN1dC4gVGhlcmUncyBzb21lIGRpZmZlcmVuY2Ug
YmVjYXVzZSBwZm5fcHRlKCkNCj4gY29udGFpbnMgdHdvIGV4dHJhIFZNX0JVR19PTnMuDQo+IA0K
PiBCdXQgd2l0aCBERUJVR19WTSAqb2ZmKiB0aGUgdmVyc2lvbiB1c2luZyBwZm5fcHRlKCkgZ2Vu
ZXJhdGVzICpiZXR0ZXIqDQo+IGNvZGUsIG9yIGF0IGxlYXN0IGxlc3MgY29kZSwgfjE2MCBpbnN0
cnVjdGlvbnMgdnMgfjIwMC4NCj4gDQo+IEZvciBzb21lIHJlYXNvbiB0aGUgdmVyc2lvbiB1c2lu
ZyBQVEVfUlBOX1NISUZUIHNlZW1zIHRvIGJlIGJ5dGUNCj4gc3dhcHBpbmcgdGhlIHB0ZSBhbiBl
eHRyYSB0d28gdGltZXMsIGVhY2ggb2Ygd2hpY2ggZ2VuZXJhdGVzIH44DQo+IGluc3RydWN0aW9u
cy4gQnV0IEkgY2FuJ3Qgc2VlIHdoeS4NCj4gDQo+IEkgdHJpZWQgYSBmZXcgb3RoZXIgdGhpbmdz
IGFuZCBjb3VsZG4ndCBjb21lIHVwIHdpdGggYW55dGhpbmcgdGhhdA0KPiBnZW5lcmF0ZWQgYmV0
dGVyIGNvZGUuIEJ1dCBJJ2xsIGtlZXAgcG9raW5nIGF0IGl0IHRvbW9ycm93Lg0KDQpPbiBQUEMz
MiB0aGUgdmVyc2lvbiB1c2luZyBQVEVfUlBOX1NISUZUIGlzIGJldHRlciwgaGVyZSBpcyB3aGF0
IHRoZSANCm1haW4gbG9vcCBvZiBzZXRfcHRlcygpIGxvb2tzIGxpa2U6DQoNCiAgMjJjOgk1NSAy
OSBmMCBiZSAJc3J3aSAgICByOSxyOSwyDQogIDIzMDoJN2QgMjkgMDMgYTYgCW10Y3RyICAgcjkN
CiAgMjM0OgkzOSAzZiAxMCAwMCAJYWRkaSAgICByOSxyMzEsNDA5Ng0KICAyMzg6CTM5IDFmIDIw
IDAwIAlhZGRpICAgIHI4LHIzMSw4MTkyDQogIDIzYzoJMzkgNWYgMzAgMDAgCWFkZGkgICAgcjEw
LHIzMSwxMjI4OA0KICAyNDA6CTNiIGZmIDQwIDAwIAlhZGRpICAgIHIzMSxyMzEsMTYzODQNCiAg
MjQ0Ogk5MSAzZSAwMCAwNCAJc3R3ICAgICByOSw0KHIzMCkNCiAgMjQ4Ogk5MSAxZSAwMCAwOCAJ
c3R3ICAgICByOCw4KHIzMCkNCiAgMjRjOgk5MSA1ZSAwMCAwYyAJc3R3ICAgICByMTAsMTIocjMw
KQ0KICAyNTA6CTk3IGZlIDAwIDEwIAlzdHd1ICAgIHIzMSwxNihyMzApDQogIDI1NDoJNDIgMDAg
ZmYgZTAgCWJkbnogICAgMjM0IDxzZXRfcHRlcysweDc4Pg0KDQpXaXRoIHRoZSB2ZXJzaW9uIHVz
aW5nIHBmbl9wdGUoKSwgdGhlIG1haW4gbG9vcCBpczoNCg0KICAyMTg6CTU0IGU5IGY4IDdlIAlz
cndpICAgIHI5LHI3LDENCiAgMjFjOgk3ZCAyOSAwMyBhNiAJbXRjdHIgICByOQ0KICAyMjA6CTU3
IGU5IDAwIDI2IAljbHJyd2kgIHI5LHIzMSwxMg0KICAyMjQ6CTM5IDI5IDEwIDAwIAlhZGRpICAg
IHI5LHI5LDQwOTYNCiAgMjI4Ogk1NyBmZiAwNSAzZSAJY2xybHdpICByMzEscjMxLDIwDQogIDIy
YzoJN2QgMjkgZmIgNzggCW9yICAgICAgcjkscjkscjMxDQogIDIzMDoJNTUgM2YgMDAgMjYgCWNs
cnJ3aSAgcjMxLHI5LDEyDQogIDIzNDoJM2IgZmYgMTAgMDAgCWFkZGkgICAgcjMxLHIzMSw0MDk2
DQogIDIzODoJNTUgMjggMDUgM2UgCWNscmx3aSAgcjgscjksMjANCiAgMjNjOgk3ZiBmZiA0MyA3
OCAJb3IgICAgICByMzEscjMxLHI4DQogIDI0MDoJOTEgM2QgMDAgMDQgCXN0dyAgICAgcjksNChy
MjkpDQogIDI0NDoJOTMgZmQgMDAgMDggCXN0dyAgICAgcjMxLDgocjI5KQ0KICAyNDg6CTNiIGJk
IDAwIDA4IAlhZGRpICAgIHIyOSxyMjksOA0KICAyNGM6CTQyIDAwIGZmIGQ0IAliZG56ICAgIDIy
MCA8c2V0X3B0ZXMrMHg2ND4NCg0KTm90IG9ubHkgdGhlIGxvb3AgaXMgYmlnZ2VyLCBidXQgaXQg
aXMgYWxzbyBvbmx5IHVucm9sbGVkIGJ5IDIgd2hpbGUgDQpmaXJzdCBvbmUgaXMgdW5yb2xsZWQg
YnkgNCAocjcgYW5kIHI5IGNvbnRhaW4gdGhlIHNhbWUgdmFsdWUpLg0KDQpUaGVyZWZvcmUgYWxs
dGhvdWdoIHRoZSBQVEVfUlBOX1NISUZUIHZlcnNpb24gaXMgODcgaW5zdHJ1Y3Rpb25zIHdoaWxl
IA0KdGhlIG90aGVyIG9uZSBpcyBvbmx5IDgxIGluc3RydWN0aW9ucywgdGhlIGZvcm1lciBsb29r
cyBiZXR0ZXIuDQoNCkNocmlzdG9waGUNCg==
