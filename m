Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A7388923
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 10:09:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQWc6tjJz3bTX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 18:09:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=izHlRYDM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.220.45;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=izHlRYDM; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQV14Y4rz303q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 18:08:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZhDbDd0guWtlfsHSCzob+2uWOmvkcqspxDUL2Q+qv2zvn9W1UgCE1F75G5v6z5PD84CwX3L0GqTS3wnM4twLbnokHz0DS6ttdfMaY5c33ujOCEko3KBsdS+11Mas8YNLIDLNCQmPfWmqGAKxQAQgH1vhIfUQ/w0Ol4ijBezGWwzO2JmN5oZ1wAGdWHkounD8pwMW1HPltwlz3R5G7T4eRFARZB3ypNvUTuRZFcXGEmROUACkI4QIU2gOhXmK4K3u9DAVjojwo14xXvmvhHzH4EUbxqG/pS3a/D9FUgQt33XsYoMI9MPnz4qR8KStbWpRH849LRjvF+dcdn0Ke1CuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsBLCtp1cyQGyoYtIG/jl4wOGM75hsGSsJjHeVkK2dc=;
 b=TRJJ/n9o8ieLo1Juv+hjP1DZmu9EzReC9VGbYTnSB+KC14m0pUiN2IbIeoVGWMa4gzCTW1uUKofox+3CGmckWZrnd+ZcsbXLj09T8Zpx6jUkAnf6lpEAmTQiU5O8kBiDlhp04T/r/Hq5S4JZJVf5uRhDYgL5dOpuSCmkkb7iJCKDNEfsf/sePsxjchrL0bF9qXZTFXpP60WV4mg9Gc0p6IL99XmBmE7LYU/JMM7UaUTJY8dtcLJtrco/yB2+0qc7w+othc5jaxj6mSM08F1M3uVV8k6OWvSHXW9By9lr586DYSlyC8zCyWq9VmXPlVlaMmtmszWch/2djNHrfrA/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsBLCtp1cyQGyoYtIG/jl4wOGM75hsGSsJjHeVkK2dc=;
 b=izHlRYDMEpmAii40GyNsag9V3s2on9Iyz0OzuXtoWhLWoUp7afGV/7oKYbAUdkVa057+VbkdHearKrnPScOCzICMHJYRSbwkaD9kGT2iIYS/yc/An7soEh97Wjk0cKkEy9htV2PLVsyuVSG9Av+j9N775eoVvWx2YXT/vv2mThM=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB4808.namprd10.prod.outlook.com (2603:10b6:510:35::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 08:08:03 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 08:08:03 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "ldv@altlinux.org" <ldv@altlinux.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Thread-Topic: Linux powerpc new system call instruction and ABI
Thread-Index: AQHXTDxnjXzNFE+v10y5IiWAVxRCH6rqahwAgAAGHYCAAAN7AA==
Date: Wed, 19 May 2021 08:08:03 +0000
Message-ID: <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
In-Reply-To: <1621410291.c7si38sa9q.astroid@bobo.none>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0 
authentication-results: altlinux.org; dkim=none (message not signed)
 header.d=none;altlinux.org; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 808dedf1-783a-4660-d441-08d91a9d3a22
x-ms-traffictypediagnostic: PH0PR10MB4808:
x-microsoft-antispam-prvs: <PH0PR10MB480809D2D0D5DC3C4C4C6C91F42B9@PH0PR10MB4808.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LN6FMX2jXtsSbz3+GzOr1JVc91s9asosLgno8G+yrq1uAedcl5uApgSHXkJlC80TRB5qgzEoLaTkllibetXKKDm8z0jK706eiiDR9LIkBr8FFIgayS8eSNZ+x1k+4O2AniYRdWl4eGGS3rHU+zBtjYRzLa6hawiOOPG0rMw4Y6T9c2ObVRqYc3/3fNs1QCTJS24FHc+5Hs5z960u1a6ObNofaVw0oKxrZlU7W/4qlVELIfWhjRJ9+bX1mW5p8OP8BpV6XCEgzXTR3276yVGltPYXE2h56tzy+/xTrhEn1HmUegsy1x2jaqDiuMI6Bk27KEkpeLg3hkbVKarDWqp5RVZ9a5aPv3to+f4y9Y/Fu0y8M9HCoXXpBrGr0NmzXllv9kD4cWR09L6+A9xwEsh5VjOf6jaPYKL9ZMu7UJczz1mcCMgygrSVtwl5Mp4vzHWIaJR7kgj/jyQzdZe4grEkkelBmQBlnmsgvbLWgSd+1YmMOylheFO+PXchZ0VzbJLD0qajmQZwywVEH7A08PmwRIaTbeud/BNqzogWzu8CB8jbX+iTrqJrVnx3Y5pWohNWVI+XnTulrcS29bxgTjmKnv+WCYAu7w7YA4BZROFiv+M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(4326008)(66446008)(86362001)(6512007)(6506007)(122000001)(66946007)(110136005)(36756003)(76116006)(66476007)(8676002)(2906002)(5660300002)(186003)(91956017)(71200400001)(478600001)(6486002)(26005)(38100700002)(83380400001)(66556008)(2616005)(316002)(54906003)(64756008)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eE1EMUIvZEhMb1VtQXF1a3FPVXQ1RXU4T29DRlJIc0J6V1BzQm54dU81VnN3?=
 =?utf-8?B?RzZ0aFFYOEVTQ3VSMjBLdERCMzVUcTdpYk5oZTR6cnZZcDlRbmhNVklmbnQr?=
 =?utf-8?B?RERSTWJXSDNiZUppd3IwNEVrZkp0SERXQXU3aHp5QTc2T051Vmltbi9YR1dP?=
 =?utf-8?B?SVQ2aE5FZjh4M2wrb3dXTlVJNHFRNk90REtwNE9vVys3MG9QcWdQVHRzQlc5?=
 =?utf-8?B?OUNKRi9LWGI4TnRsdTU5aUFTNnozSXgvMTJkNGxUUHVwYk45SlFIeEh6SkpY?=
 =?utf-8?B?T1ZwOVpHbWI3QlY1NUt2UWxaVW15OEhwWmNnazZwRnlkR1RLcjYvd2FWSU5U?=
 =?utf-8?B?RlZWc1lpRjYvLzc5VzRnSEVuT3pYN21OY3dQdUJsUW9wWXVMWkk1K1I5TldF?=
 =?utf-8?B?UXBLME9ESG9CMldiRWxheVpRNDFxRFd5bTEwR1NpMndYNUFjUXdyUGkzbElL?=
 =?utf-8?B?Y3FGT1dHalJKUCtPdnNhdEo2OUZmbUpXTzBPTW0rdnlZUzZERkRxMUl5M3pL?=
 =?utf-8?B?WEdlM2ZHMjJLSExFcnF3eFJCYXlINlJVeWdSQkp4UnNjWVFzcitxUG5Scjll?=
 =?utf-8?B?NUpvQldqUUoyaW5qcWRrNDhCMmY4bkZTbnhUZ01KTnh3Unh1SHB3aHVDUXd5?=
 =?utf-8?B?SW16S2xxU2twWTNvZW43YkkvTVdjNG4yNWprWjN4eE00Y2xmb2szWDZvQ0kz?=
 =?utf-8?B?M2d6czNFVGJGcm5JMHUrdGNSUTREcDRPeDVEdUtCR05BcHVDZnVvcmtnaTZ0?=
 =?utf-8?B?cU1oVno3Z2U0bEJ3M3hyRXMxc0tFejRRbUlJYmlXblE5cDRyK3pPMmtUM0d4?=
 =?utf-8?B?U2NCN0pDT3J1eWVGeGV4Z0daZGloTUM3WHBrd2w0azlVcnJZeDZiUGpkUTdN?=
 =?utf-8?B?cXVINFRUWEpEZUoyVnZmbis3WE55aDdiOENvaUNXdVhXUE5YY2hTb1FLZ3NY?=
 =?utf-8?B?YkVYalhwejlLYVN1dUM5bDJoMWFNK3hRbiswYnkvbWZ1dnVZREZDZWJMQjJo?=
 =?utf-8?B?c1B2eEwwdncrcGo3WUlSSllrVHYzSnhhc05TUkNuTTdQYXZJaTlNa1g3ZTBB?=
 =?utf-8?B?OThiRXBVVStEMm8yUUhML08vTjd3Z1Frc1FwR0ZpT0IxUVNudVZTdS91YTJr?=
 =?utf-8?B?MytKUmFEemJ5OWM4VzU4ZndNVTI4WVRGZ09YbkFUTzZhUGlnSkxvM0RFNzJV?=
 =?utf-8?B?T1FsbG1XNmhtNE1XVnpCNzNKM3pvaHVkcFI3MGVvblo1Y2lQU2ZlNXRham94?=
 =?utf-8?B?UUh3STR1czBJNEIyUzVlZ2U2ekkzRXlPYzByZzRyeTBKMUhCeHZXUFF5eTFW?=
 =?utf-8?B?WGYvbDJFUzdEOG5pWUtldXNDOXc4c2VxSDB1UTB2S0hiTG5FWURBOFdIaE1U?=
 =?utf-8?B?dEJXZ3Q2NjNoMEZ3aURGSEFTTUllMU9CeDhVN1JCWi8xSk9OT3JuaWlIRnZS?=
 =?utf-8?B?c1owb2hpb2Y5OHlYUksyTGI3aFRucUp1a2pQNUZTNXM2b3Z1REVGWDBpZ0hW?=
 =?utf-8?B?WmdMV1crZzUvTEFqeU1RTG9hKzZHU3czVXVkK1BFbFpHTTE2TzI0RlpPOVM0?=
 =?utf-8?B?dUJFbEFDUENzRWIxMlE5WGVRYmZ5L1pwbVg3cytLVTRpMGdmZkRuMnBheVVu?=
 =?utf-8?B?K1psTFV6Zml3S0N0V3ZBcktOWllOT2lLeW5MdjJ4ci95ajhDMWF6REcyUnRl?=
 =?utf-8?B?RWhSVTdlYlpHZTliZTN4UWJ3MDdmODV1TCs4RkdaaXR1MjhIS04vdS9QWm9P?=
 =?utf-8?Q?9VI24e/sxjBXlEhWhMHS5QQL1OIYBwqeftri5RX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C8E2A7FD1D2F543B2785ACCCD2F1AB4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808dedf1-783a-4660-d441-08d91a9d3a22
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 08:08:03.5392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6BnEYhkK08Ki4Ok72V4IcOqPGPOWYRWyyh/DUl4rONe9KlZoBOTY8CMJyxPT2bs5oBBhIHwQy2DMykaDy/3eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4808
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
Cc: "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTA1LTE5IGF0IDE3OjU1ICsxMDAwLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6
DQo+IEV4Y2VycHRzIGZyb20gSm9ha2ltIFRqZXJubHVuZCdzIG1lc3NhZ2Ugb2YgTWF5IDE5LCAy
MDIxIDU6MzMgcG06DQo+ID4gT24gV2VkLCAyMDIxLTA1LTE5IGF0IDAyOjEzICswMzAwLCBEbWl0
cnkgVi4gTGV2aW4gd3JvdGU6DQo+ID4gPiBIaSwNCj4gPiA+IA0KPiA+ID4gT24gVGh1LCBKdW4g
MTEsIDIwMjAgYXQgMDY6MTI6MDFQTSArMTAwMCwgTmljaG9sYXMgUGlnZ2luIHdyb3RlOg0KPiA+
ID4gWy4uLl0NCj4gPiA+ID4gLSBFcnJvciBoYW5kbGluZzogVGhlIGNvbnNlbnN1cyBhbW9uZyBr
ZXJuZWwsIGdsaWJjLCBhbmQgbXVzbCBpcyB0byBtb3ZlIHRvDQo+ID4gPiA+IMKgwqB1c2luZyBu
ZWdhdGl2ZSByZXR1cm4gdmFsdWVzIGluIHIzIHJhdGhlciB0aGFuIENSMFtTT109MSB0byBpbmRp
Y2F0ZSBlcnJvciwNCj4gPiA+ID4gwqDCoHdoaWNoIG1hdGNoZXMgbW9zdCBvdGhlciBhcmNoaXRl
Y3R1cmVzLCBhbmQgaXMgY2xvc2VyIHRvIGEgZnVuY3Rpb24gY2FsbC4NCj4gPiANCj4gPiBXaGF0
IGFib3V0IHN5c2NhbGxzIGxpa2UgdGltZXMoMikgd2hpY2ggY2FuIHJldHVybiAtMSB3aXRob3V0
IGl0IGJlaW5nIGFuIGVycm9yPw0KPiANCj4gVGhleSBkbyBiZWNvbWUgZXJyb3JzIC8gaW5kaXN0
aW5ndWlzaGFibGUgYW5kIGhhdmUgdG8gYmUgZGVhbHQgd2l0aCBieSANCj4gbGliYyBvciB1c2Vy
c3BhY2UuIFdoaWNoIGRvZXMgZm9sbG93IHdoYXQgbW9zdCBhcmNoaXRlY3R1cmVzIGRvIChhbGwg
DQo+IGV4Y2VwdCBpYTY0LCBtaXBzLCBzcGFyYywgYW5kIHBvd2VycGMgYWN0dWFsbHkpLg0KPiAN
Cj4gSW50ZXJlc3RpbmcgcXVlc3Rpb24gdGhvdWdoLCBpdCBzaG91bGQgaGF2ZSBiZWVuIG5vdGVk
Lg0KPiANCj4gVGhhbmtzLA0KPiBOaWNrDQoNCkkgYWx3YXlzIGZpZ3VyZWQgdGhlIHBwYyB3YXkg
d2FzIHN1cGVyaW9yLiBJdCBiZWdzIHRoZSBxdWVzdGlvbiBpZiBub3QgdGhlIG90aGVyIGFyY2hz
IHNob3VsZA0KY2hhbmdlIGluc3RlYWQ/DQoNCiBKb2NrZQ0K
