Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8885462B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 10:35:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=N7eSkTrV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZY3B0bWCz3cKN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 20:35:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=N7eSkTrV;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZY2Q09G9z30YS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 20:35:10 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TZY2P4stDz4wc9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 20:35:09 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TZY2P4p2Sz4wcH; Wed, 14 Feb 2024 20:35:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=N7eSkTrV;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TZY2P0WsHz4wc9
	for <linuxppc-dev@ozlabs.org>; Wed, 14 Feb 2024 20:35:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe+0q2IFSzoTxUG1oyDhoFuVNkMpQJQyGfFSTHgxw4dOnyADa/a0MpIY8w8Ere3rwjGC1EZNSehMTze9c4/RAbHzPTnPTmEjOtxVwDo3o7nJrK29srY9M+RHJnBZ/Rfk4FZiP1nXs096lJVz8fM570pPrMHaqjHq1/vM5DokFAzJ+BPw4g0Bn/wYKewv1i38A1amsTYXkRx8e6FFcNpe3HhoF9WH71L6sTsd4gRtmhKBOWiMzEOEm/EqrdyjDWKZ8Tg87AqWxx+5zzaZxV6wS2nuJsrrD8pI07OLJOkFw1gQHVzO/zdluWrEMilCFnjACC2uiKCo8wmRoGLDvMGlGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nJC0Ihm1v75C2R1nINha/jL/RxHDNFHHcrTlcOmHE8=;
 b=SISBfmOioBxLCKmLl6rMbZkrNv7XOuqZc+X46NYk3LzuONFBtnrw611LPRmn84qLCPmTFZhnxpu7za6lNqTIUJX5BiVslwfiDaHxX/Gm14WoI+6sKUuwe/Fia8bi+ZWcm6/9uFB8padpPUcC4lZkSKw9ad92pP6AuaYelhvbQgl7NuueAMMUrWDxTC2RzaJceg3QEw8EMOd/tiqcNsCcH8/hezdIrFGGCFEIF3Yt2u8RzF2Yl1FJx5jai265yC/NjfmRBnDhmejdOhQatzc6WFnDQo0OqUCL52dotNL7+7qSND9AE/1csPRGdEJr25uOePdUXiUoGOwOjnzMyBxMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nJC0Ihm1v75C2R1nINha/jL/RxHDNFHHcrTlcOmHE8=;
 b=N7eSkTrVjWivM9m9ycEq/MD/Zrl3G+QNz5ofnbkkWk2dBiOm9DaKBP7TvqPBuyr0mvjNATWtZf4nC1CiMRtrmzGh2++bIJOun+noKn6w2KauQk84pJwG4UJCobVpYBX4HSLMalNE9O9A6AU3acv6raZaN4swTTWs40x42b+EpJRIOckVArq6OgFY0OAN9v8pfugdI2ipdVfZq1yxUOSAmRshhER76SUfd4YuVjXT+Kx6/TMp9yWCSdQYRNIM6zwp3s492GR9cKyqGgn+cfz9VCXT/ZLHS+xFqJ310D202NB+unT210wdAm/LR3T7AXTBYFdjMIitybq0Ma52KpubIw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2470.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 09:35:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%6]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 09:35:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v3] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Thread-Topic: [PATCH v3] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Thread-Index: AQHaXya1zN7C8zxrMke1g713GseNCrEJk90A
Date: Wed, 14 Feb 2024 09:35:02 +0000
Message-ID: <dbf48d72-ebb6-4451-8841-cf873d792259@csgroup.eu>
References: <20240214091636.1520864-1-mahesh@linux.ibm.com>
In-Reply-To: <20240214091636.1520864-1-mahesh@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2470:EE_
x-ms-office365-filtering-correlation-id: 8b613127-f60e-4a78-7136-08dc2d403863
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  1pM3nqdnc0y92BKfh0+EGgf4uOAT1/BpOfWlR18SfRR6VeeSl+PSc/LPiFZMagMPXJpB+i6sqK/DLJ9FDBBZ5nVTW0VUXg/Al1Efklfvfh5UNDAGP0RdYKENcmtcT29whMpT6TEmfDwIcph1PkEf2fZL+FOv+kmSvSTIELTqkkrPNlKqnAboUmzP39fVL1PGz9HZbhAHqkz4+C3kIx4yxnc8wbPNtJvi9PUVum3IO+jDNZYgveBb3pYW8+kXgyjWQFN2j5GX/Fp7eoL3f/p1H0TQX1MEcPrH1A7OwBcKewZTbdOm7TNJjbSNFBNTp99xo0qX7yAwbbdgTw5PnAHpjcAtS0iqMH/nFYkvQhvWFnNf5VRkzZclDqA+aEIA0x5LBvN5FR6bB0gngQLqMJMxHUanqdl0rbs3At4LQHpYRmHxnwvwKf4XUKMMFZlCC7/z3z5h/DvvAAYhJvMDETDX1CJqSpTyHPOfVwInts8kg3Kyhlx0mLW33m/5u1134r8dHu+rVSeBy+Mnvq+NNiJaXyYXlzIgFtPsCgIoYm1SFqxfur0JE/XB+hCmtBdcCcwClW8sa88BQUQQ2PBd1rFEaUX+U2fSzty8NPHkn1tETUI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(376002)(396003)(366004)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(44832011)(5660300002)(8936002)(8676002)(4326008)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(2906002)(66574015)(38070700009)(26005)(122000001)(36756003)(38100700002)(31696002)(86362001)(71200400001)(110136005)(54906003)(316002)(2616005)(41300700001)(6512007)(6506007)(6486002)(478600001)(966005)(31686004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YTlLK1kvSzlTZWo0WkJGbWtYUzJ5UDlZaGc3V3IxOGFicGtjbnpSSVpqcFF0?=
 =?utf-8?B?QzlqMmk2V21WdHFBM241VWRqK1RCeXN3M0pxRXIxOTZsMFFCT3ROWU9yR25x?=
 =?utf-8?B?amJzcmZaS2UyUzBRdUhBSlJiM1B4dFE0a0lramFmMy9LQlRUcGp1bmpDRG1w?=
 =?utf-8?B?VFl2WEIySmIyUmgxUlFzd0NZbko1ZjBoQkNOeUE0ZHh4Y3pRelk3Z1c0cVNy?=
 =?utf-8?B?eDFRVVJrR1g5cEJrVkZEb0w2SlZ5NHJnYVZsZ1dnU3kxVnJQZ2dkVGtJN25K?=
 =?utf-8?B?alJuV0ZlWVk2Y3BHbFltUFNQSTBRTVlNS0NxRXplaklzeGhpeVgzWE1tTFBr?=
 =?utf-8?B?ZEpBT0hjQUwxUVZaUDRsS0lWZ3d6ckRZVC85ZVZ2Q3AwcFQ1b2xCN1g0VTNU?=
 =?utf-8?B?Tk9VMFovM1BWRGI5cGU5WVFNbmp1MnRPOVFsVGJ0b084SEhTZHZWNjRPTHp0?=
 =?utf-8?B?c01nQTlDRU9PMkI2aUJkYWdNcGsxUXZqc0JDMHBFUUQrdlNjckVUTUNVTSsx?=
 =?utf-8?B?L1M1Z2JKK1huQ3JkcXBITWdPRnBpTVZ5dHlCRmg1QlJSSFFFMnFKYmN5cmE0?=
 =?utf-8?B?RWFkZGtLR2M2T05NWTdhWkxmbWdZU2dyQnBXWnluQjBiam1odmFYSkZGOGg1?=
 =?utf-8?B?MVlETkpsTWNzd3BXM1I5NWVYbFIralNFRG9mNE1jYnNLaDNCdmNQRnNxQTd6?=
 =?utf-8?B?clMvNFNCeHVJMmJudmJ2ZmZWSnh2K2lmcFU4RzlPL1U1N2hpenZOWVBUc3dw?=
 =?utf-8?B?Q1kyVVBsQWt0Y2tJeWtMelF1L0JZd2lIeHlHaEV2NGk4SzdnR1V4aU5tbE5I?=
 =?utf-8?B?UFVQVmRxeHc4aEF5cmd2cFRyK0VwUUhmMU9USnVPTHo4QW5zT1NnZkc5ZDBP?=
 =?utf-8?B?NFRqWklxZktTN2NMdkx1WWVSOTNtYTMxYUlsdzNXZ3BFSk1pYkE4UlVzYkVX?=
 =?utf-8?B?VTJTSklvM1NOcDlzbEc3cGxuQTFEU0NEQWQrdlp1RUV5RU51ZjZqV0dwQncy?=
 =?utf-8?B?S25LcXp0aThMME9yUzNOZVFsZXJpNjJ0ZTdVZmxoWFE5eUZQeWVVQlJOZnJE?=
 =?utf-8?B?SnI2SWx6Ykw3cndJNGsycXFZRGtIVUQxd0E3RHlWbHd4VHpMN0FMeG5NOGVK?=
 =?utf-8?B?M2Z1NDd5WWVmbHpBSW50blVadVNBdVIrTml1aU52V0tiVjlqMEhCdG8yT2dH?=
 =?utf-8?B?YStWUVpYdUp4am9venVaZUV5RnNwWkpDSDNNeDBnK0hoak1QbHB2M0E5VjJN?=
 =?utf-8?B?RzZRWUZEdFlRNHdDN2l4TDdaUGxpNEVVVFpHRUo5Q1BuSU9JRFQ0ZmV1NWMw?=
 =?utf-8?B?bkpybElSQTZXRmhBajZXcUdycTZvckRXUVdCYktjQUdTVXdRVlliRDNUUGN6?=
 =?utf-8?B?TERtK1NiSnZDalZGdThQeEhISVloTGJuSUw0bXV3REFqL1VzbVVWSTFBc291?=
 =?utf-8?B?bk5SNHZxQzVtN1JWMkd0WlRYTndHdVZRQk5uTWdUZzh6NVI5QmM0QWozTG1V?=
 =?utf-8?B?SW1YTnF4VThxNUFpTHlJc2tFTTYvOG9NelBjb3ZRWWJScldGcTQvNk1CZGZI?=
 =?utf-8?B?WmNkaUd1YTRzZnJQQ2l5YTVjYklJSjlSb3d3Mld0dHpBVFU2ZTF2Q0RKYW1w?=
 =?utf-8?B?WTE4MVZwVm1ZYkZGNDMyMGJGSHh3ZkRCQ1NYcUVKaHJhdTNVaWNrb2lhY094?=
 =?utf-8?B?NE82bjZnNm1kUHYyUkdaTEtnQXZhejlCNTNKRkhmZlJaZHo0a3RiTVRQRjVM?=
 =?utf-8?B?YjBpVjEwRWc0U2s2bW9tQ3pxYi9aVndsckd5bklLN3l0b3dIbE4vdXRIeTNM?=
 =?utf-8?B?cHcyQlBrK2lxZ3orNHRTSGRvdXgrbVROWWRpSGxXOSs3dE01WnBIUy9JYzJV?=
 =?utf-8?B?eG5IUloyNDhpa0hoR0tJZzdDeHd3cFZ3ZkZneTFoQk4rQVN0Tzg2NnlZWjVp?=
 =?utf-8?B?aUpqazRVZ1BrK2FiTmRGWi9tUGJxSmh5RndmanI4SFBWakcwTFpLUi84c1Rw?=
 =?utf-8?B?clVsN3M5MVgraTk2L2tvUzRYT09laVl2dTlvSDQ5cmx0bGREdFhOekZiUzAx?=
 =?utf-8?B?a0FCaUtEOU55dnB3ZUU1ZWR6cmlvbCtNeWRSYzVSS21ObUpRM2ZJeFgvbWJj?=
 =?utf-8?Q?rjNRbjR1xhUXH4dR9HALxO43v?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A30C12F15214045ACFA2A94A039C2F9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b613127-f60e-4a78-7136-08dc2d403863
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 09:35:02.6368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35eIa+zT500hOTf0eM2QIuv5hf0v7zBbyCVRVwZJovVT+h7Zx116bcqE5gLUf2BN2pjz9wUX2Ik8t58D8+odLynXV+681h4FKBx/zyDoZMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2470
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzAyLzIwMjQgw6AgMTA6MTYsIE1haGVzaCBTYWxnYW9ua2FyIGEgw6ljcml0wqA6
DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG1haGVzaEBs
aW51eC5pYm0uY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gbm1p
X2VudGVyKCkvbm1pX2V4aXQoKSB0b3VjaGVzIHBlciBjcHUgdmFyaWFibGVzIHdoaWNoIGNhbiBs
ZWFkIHRvIGtlcm5lbA0KPiBjcmFzaCB3aGVuIGludm9rZWQgZHVyaW5nIHJlYWwgbW9kZSBpbnRl
cnJ1cHQgaGFuZGxpbmcgKGUuZy4gZWFybHkgSE1JL01DRQ0KPiBpbnRlcnJ1cHQgaGFuZGxlcikg
aWYgcGVyY3B1IGFsbG9jYXRpb24gY29tZXMgZnJvbSB2bWFsbG9jIGFyZWEuDQo+IA0KPiBFYXJs
eSBITUkvTUNFIGhhbmRsZXJzIGFyZSBjYWxsZWQgdGhyb3VnaCBERUZJTkVfSU5URVJSVVBUX0hB
TkRMRVJfTk1JKCkNCj4gd3JhcHBlciB3aGljaCBpbnZva2VzIG5taV9lbnRlci9ubWlfZXhpdCBj
YWxscy4gV2UgZG9uJ3Qgc2VlIGFueSBpc3N1ZSB3aGVuDQo+IHBlcmNwdSBhbGxvY2F0aW9uIGlz
IGZyb20gdGhlIGVtYmVkZGVkIGZpcnN0IGNodW5rLiBIb3dldmVyIHdpdGgNCj4gQ09ORklHX05F
RURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LIGVuYWJsZWQgdGhlcmUgYXJlIGNoYW5jZXMgd2hl
cmUgcGVyY3B1DQo+IGFsbG9jYXRpb24gY2FuIGNvbWUgZnJvbSB0aGUgdm1hbGxvYyBhcmVhLg0K
PiANCj4gV2l0aCBrZXJuZWwgY29tbWFuZCBsaW5lICJwZXJjcHVfYWxsb2M9cGFnZSIgd2UgY2Fu
IGZvcmNlIHBlcmNwdSBhbGxvY2F0aW9uDQo+IHRvIGNvbWUgZnJvbSB2bWFsbG9jIGFyZWEgYW5k
IGNhbiBzZWUga2VybmVsIGNyYXNoIGluIG1hY2hpbmVfY2hlY2tfZWFybHk6DQo+IA0KPiBbICAg
IDEuMjE1NzE0XSBOSVAgW2MwMDAwMDAwMDBlNDllYjRdIHJjdV9ubWlfZW50ZXIrMHgyNC8weDEx
MA0KPiBbICAgIDEuMjE1NzE3XSBMUiBbYzAwMDAwMDAwMDA0NjFhMF0gbWFjaGluZV9jaGVja19l
YXJseSsweGYwLzB4MmMwDQo+IFsgICAgMS4yMTU3MTldIC0tLSBpbnRlcnJ1cHQ6IDIwMA0KPiBb
ICAgIDEuMjE1NzIwXSBbYzAwMDAwMGZmZmQ3MzE4MF0gWzAwMDAwMDAwMDAwMDAwMDBdIDB4MCAo
dW5yZWxpYWJsZSkNCj4gWyAgICAxLjIxNTcyMl0gW2MwMDAwMDBmZmZkNzMxYjBdIFswMDAwMDAw
MDAwMDAwMDAwXSAweDANCj4gWyAgICAxLjIxNTcyNF0gW2MwMDAwMDBmZmZkNzMyMTBdIFtjMDAw
MDAwMDAwMDA4MzY0XSBtYWNoaW5lX2NoZWNrX2Vhcmx5X2NvbW1vbisweDEzNC8weDFmOA0KPiAN
Cj4gRml4IHRoaXMgYnkgYXZvaWRpbmcgdXNlIG9mIG5taV9lbnRlcigpL25taV9leGl0KCkgaW4g
cmVhbCBtb2RlIGlmIHBlcmNwdQ0KPiBmaXJzdCBjaHVuayBpcyBub3QgZW1iZWRkZWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBNYWhlc2ggU2FsZ2FvbmthciA8bWFoZXNoQGxpbnV4LmlibS5jb20+
DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIEFkZHJlc3MgY29tbWVudHMgZnJvbSBDaHJp
c3RvcGhlIExlcm95IHRvIGF2b2lkIHVzaW5nICNpZmRlZnMgaW4gdGhlDQo+ICAgIGNvZGUNCj4g
LSB2MiBhdCBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMjAyNDAyMDUwNTM2
NDcuMTc2MzQ0Ni0xLW1haGVzaEBsaW51eC5pYm0uY29tLw0KPiANCj4gQ2hhbmdlcyBpbiB2MjoN
Cj4gLSBSZWJhc2UgdG8gdXBzdHJlYW0gbWFzdGVyDQo+IC0gVXNlIGp1bXBfbGFiZWxzLCBpZiBD
T05GSUdfSlVNUF9MQUJFTCBpcyBlbmFibGVkLCB0byBhdm9pZCByZWRvaW5nIHRoZQ0KPiAgICBl
bWJlZCBmaXJzdCBjaHVuayB0ZXN0IGF0IGVhY2ggaW50ZXJydXB0IGVudHJ5Lg0KPiAtIHYxIGlz
IGF0IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4cHBjLWRldi8xNjQ1Nzg0NjU4MjguNzQ5
NTYuNjA2NTI5NjAyNDgxNzMzMzc1MC5zdGdpdEBqdXBpdGVyLw0KPiAtLS0NCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0LmggfCAxMCArKysrKysrKysrDQo+ICAgYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL3BlcmNwdS5oICAgIHwgMTAgKysrKysrKysrKw0KPiAgIGFyY2gv
cG93ZXJwYy9rZXJuZWwvc2V0dXBfNjQuYyAgICAgICB8ICA0ICsrKysNCj4gICAzIGZpbGVzIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vaW50ZXJydXB0LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJy
dXB0LmgNCj4gaW5kZXggYTQxOTZhYjFkMDE2Ny4uMGI5NjQ2NGZmMDMzOSAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaA0KPiBAQCAtMzM2LDYgKzMzNiwxNCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X25taV9lbnRlcl9wcmVwYXJlKHN0cnVjdCBwdF9yZWdz
ICpyZWdzLCBzdHJ1Y3QgaW50ZQ0KPiAgICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfS0FT
QU4pKQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybjsNCj4gDQo+ICsgICAgICAgLyoNCj4gKyAg
ICAgICAgKiBMaWtld2lzZSwgZG8gbm90IHVzZSBpdCBpbiByZWFsIG1vZGUgaWYgcGVyY3B1IGZp
cnN0IGNodW5rIGlzIG5vdA0KPiArICAgICAgICAqIGVtYmVkZGVkLiBXaXRoIENPTkZJR19ORUVE
X1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSyBlbmFibGVkIHRoZXJlDQo+ICsgICAgICAgICogYXJl
IGNoYW5jZXMgd2hlcmUgcGVyY3B1IGFsbG9jYXRpb24gY2FuIGNvbWUgZnJvbSB2bWFsbG9jIGFy
ZWEuDQo+ICsgICAgICAgICovDQo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX05FRURf
UEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LKSAmJiAhaXNfZW1iZWRfZmlyc3RfY2h1bmspDQo+ICsg
ICAgICAgICAgICAgICByZXR1cm47DQo+ICsNCj4gICAgICAgICAgLyogT3RoZXJ3aXNlLCBpdCBz
aG91bGQgYmUgc2FmZSB0byBjYWxsIGl0ICovDQo+ICAgICAgICAgIG5taV9lbnRlcigpOw0KPiAg
IH0NCj4gQEAgLTM1MSw2ICszNTksOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X25t
aV9leGl0X3ByZXBhcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnRlcg0KPiAgICAg
ICAgICAgICAgICAgIC8vIG5vIG5taV9leGl0IGZvciBhIHBzZXJpZXMgaGFzaCBndWVzdCB0YWtp
bmcgYSByZWFsIG1vZGUgZXhjZXB0aW9uDQo+ICAgICAgICAgIH0gZWxzZSBpZiAoSVNfRU5BQkxF
RChDT05GSUdfS0FTQU4pKSB7DQo+ICAgICAgICAgICAgICAgICAgLy8gbm8gbm1pX2V4aXQgZm9y
IEtBU0FOIGluIHJlYWwgbW9kZQ0KPiArICAgICAgIH0gZWxzZSBpZiAoSVNfRU5BQkxFRChDT05G
SUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTkspICYmICFpc19lbWJlZF9maXJzdF9jaHVu
aykgew0KPiArICAgICAgICAgICAgICAgLy8gbm8gbm1pX2V4aXQgaWYgcGVyY3B1IGZpcnN0IGNo
dW5rIGlzIG5vdCBlbWJlZGRlZA0KPiAgICAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAg
ICAgIG5taV9leGl0KCk7DQo+ICAgICAgICAgIH0NCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9wZXJjcHUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZXJjcHUu
aA0KPiBpbmRleCA4ZTViN2QwYjg1MWM2Li5kMWZkZjI1ODk3ZGMxIDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGVyY3B1LmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BlcmNwdS5oDQo+IEBAIC0xNSw2ICsxNSwxNiBAQA0KPiAgICNlbmRpZiAvKiBD
T05GSUdfU01QICovDQo+ICAgI2VuZGlmIC8qIF9fcG93ZXJwYzY0X18gKi8NCj4gDQo+ICsjaWZk
ZWYgQ09ORklHX1BQQzY0DQo+ICsjaW5jbHVkZSA8bGludXgvanVtcF9sYWJlbC5oPg0KPiArREVD
TEFSRV9TVEFUSUNfS0VZX0ZBTFNFKF9fcGVyY3B1X2VtYmVkX2ZpcnN0X2NodW5rKTsNCj4gKw0K
PiArI2RlZmluZSBpc19lbWJlZF9maXJzdF9jaHVuayAgIFwNCj4gKyAgICAgICAgICAgICAgIChz
dGF0aWNfa2V5X2VuYWJsZWQoJl9fcGVyY3B1X2VtYmVkX2ZpcnN0X2NodW5rLmtleSkpDQo+ICsj
ZWxzZQ0KPiArI2RlZmluZSBpc19lbWJlZF9maXJzdF9jaHVuayAgICh0cnVlKQ0KDQpQYXJlbnRo
ZXNpcyBhcm91ZCB0cnVlIGFyZSBub3QgbmVjZXNzYXJ5DQoNCj4gKyNlbmRpZiAvKiBDT05GSUdf
UFBDNjQgKi8NCj4gKw0KPiAgICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9wZXJjcHUuaD4NCj4gDQo+
ICAgI2luY2x1ZGUgPGFzbS9wYWNhLmg+DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2Vy
bmVsL3NldHVwXzY0LmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NldHVwXzY0LmMNCj4gaW5kZXgg
MmYxOWQ1ZTk0NDg1Mi4uY2JkM2I0YzgyMzE2YyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L2tlcm5lbC9zZXR1cF82NC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXBfNjQu
Yw0KPiBAQCAtODM0LDYgKzgzNCw3IEBAIHN0YXRpYyBfX2luaXQgaW50IHBjcHVfY3B1X3RvX25v
ZGUoaW50IGNwdSkNCj4gDQo+ICAgdW5zaWduZWQgbG9uZyBfX3Blcl9jcHVfb2Zmc2V0W05SX0NQ
VVNdIF9fcmVhZF9tb3N0bHk7DQo+ICAgRVhQT1JUX1NZTUJPTChfX3Blcl9jcHVfb2Zmc2V0KTsN
Cj4gK0RFRklORV9TVEFUSUNfS0VZX0ZBTFNFKF9fcGVyY3B1X2VtYmVkX2ZpcnN0X2NodW5rKTsN
Cj4gDQo+ICAgdm9pZCBfX2luaXQgc2V0dXBfcGVyX2NwdV9hcmVhcyh2b2lkKQ0KPiAgIHsNCj4g
QEAgLTg2OSw2ICs4NzAsOSBAQCB2b2lkIF9faW5pdCBzZXR1cF9wZXJfY3B1X2FyZWFzKHZvaWQp
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJQRVJDUFU6ICVzIGFsbG9jYXRv
ciBmYWlsZWQgKCVkKSwgIg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFs
bGluZyBiYWNrIHRvIHBhZ2Ugc2l6ZVxuIiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGNwdV9mY19uYW1lc1twY3B1X2Nob3Nlbl9mY10sIHJjKTsNCj4gKyAgICAgICAgICAg
ICAgIGVsc2Ugew0KPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0aWNfa2V5X2VuYWJsZSgm
X19wZXJjcHVfZW1iZWRfZmlyc3RfY2h1bmsua2V5KTsNCj4gKyAgICAgICAgICAgICAgIH0NCg0K
QnJhY2VzIGFyZSB1bm5lY2Vzc2FyeSBmb3Igc2luZ2xlIGxpbmUsIGluIGFkZGl0aW9uIGl0IGFk
ZHMgdW5iYWxhbmNlZCANCmJyYWNpbmcgYXMgdGhlIGZpcnN0IGxlZyBkb2Vzbid0IGhhdmUgYnJh
Y2VzLCBzZWUgDQpodHRwczovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNzL2NvZGluZy1zdHlsZS5o
dG1sI3BsYWNpbmctYnJhY2VzLWFuZC1zcGFjZXMNCg0KPiAgICAgICAgICB9DQo+IA0KPiAgICAg
ICAgICBpZiAocmMgPCAwKQ0KPiAtLQ0KPiAyLjQzLjANCj4gDQo=
