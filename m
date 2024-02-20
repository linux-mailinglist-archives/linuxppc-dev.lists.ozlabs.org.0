Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD485B469
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 09:04:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EkyuDeeF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfBlB4RQJz3c1w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 19:04:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EkyuDeeF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfBkK62dmz3dSj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:03:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNMN7BbN03i7Rj74Rs6Iv3enNUB1q9pFHZKYiJaj0UQ2OifkBR354w6EFuO6yqOfvX+hngLBeQ/h+0qcTDEmEXiBLxt9YjX2c3cTgF4AgiB0w5Ol7YEOSKCFQiw17drkqSoHWbTf7tZ6l6SlHy2pNx6nF7kBSYpm/6ohmpmwXL+ArSIYJ1awV+Ukl62mdRr1v1TrKWsJmI1zLuSRyE7YqIS4cLLyJvJLInma2OLa+9pVRm51XbgDCbK5FnYsH02iMaMJyFDUk9JTb/MSdCa/ab9qPjcNw9e5CVRCfsYgq48TkpGaPpDMHZbPb7+aMR7rJ34FiiWboXnJVm/K3NsnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaQZ04a1EifVatR90jGrxczl16UvMkDVoz0RyZLIVsQ=;
 b=aEyeglg6st6bAkudQWITO9E4MjkxMY2p4XWPtkzECl3A1L9oe4sfw+t0RgGu7l4MUZSnAsCvSiqbppXpQmKwaiZ98pZz1KRp2NfqFt9a+EvzxOoT7iHVmyHWYR0nCLg14WDh0Dc1xnr/5JPJVGi5O7yig+RCbEQ6pfsLcMUwbUJjdt9OhdgiVpL6H6D/BvVYe6udQb4wdSMD3ytG4qcEjuXyEiTsXiP/cf/Sah8PDPtoDeQk9ecFqzKlrHyHGzpHjOEt9DDh4ppB7fl3Ci2l0QjCJCDwm9Q1BIpWUQ1wX+wg/4taDKm3bCYFL3Sy/V5WOVBu5XRtM9OghKfhka2MtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaQZ04a1EifVatR90jGrxczl16UvMkDVoz0RyZLIVsQ=;
 b=EkyuDeeFZC34n9t5ejqHygDzm7v5RjEtORnUNg90rqimY9o3l3i9xx+Vh3KZIAJvCy8kbBkY47pugz61TT2JgbpEgy7LPJ8b89JambN/6DSiqqiUjnc03mALiBzoO8IPDpDzWoXmKEz//aWIIWMuC7LGt/K19mYEGX+S9slQxFuj/jE/TQFeOhg1XGujZ+jtcUfpapdpbQIy096RKLY+UFnsgsIngn5Wk0uNLMnyViLL84TsfLgmpeXUkxCUjtRs2ntZAcLGkZognSE1r8VtK9dYg8hpdxQDjRKZ3lKAbp01gB9XTkwJL7jU9C6TV0nNnSwWLd0EXNpoDIQeyV0s+w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3849.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 08:03:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 08:03:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 4/4] Revert "powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2"
Thread-Topic: [PATCH 4/4] Revert "powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2"
Thread-Index: AQHaSsKcdqMEtnIduEybA/gPQ4Raf7ETEROA
Date: Tue, 20 Feb 2024 08:03:33 +0000
Message-ID: <b5b86610-5fde-4251-9728-14f5d093661b@csgroup.eu>
References: <cover.1705654669.git.geoff@infradead.org>
 <983836405df1b6001a2262972fb32d1aee97d6f5.1705654669.git.geoff@infradead.org>
In-Reply-To:  <983836405df1b6001a2262972fb32d1aee97d6f5.1705654669.git.geoff@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3849:EE_
x-ms-office365-filtering-correlation-id: 64b1ab38-1156-415d-143c-08dc31ea6f34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2qc4zL7EYldTqyOauQeV8wNdwm/o2hk7+WdXWLni8Ib+14SFHSYXK1snpr7bCIw3dcGPE787CKStDoQWasvS+R1REvDod1MfjgT4pnERqizeOg1Wyh2JPICHM01o14VIZdzzKsLmt5DIh+ZRwQ0h22vWwydYt2o20VjpGD8ZLi9SDSDdl/6UdQlbIbu0tCi6FnEl+Z8aiRiD8oyuQp27eeAnSMG09DKZbGDJR0poxAxvwFwWyKgux3RCSKAx0R0fYas0Ao28fJdBpAXmRKA9eKit5ugl+RN9IoiT6b/3NqIOY66fRxjq02L4FGwgpZoyP5ZeO2wv1ewtv7bYHvHAnIxNf4XMwHsPH30SBUM3APJLkiq7LnxZULVJlOzWQgKQh1U0Sn02cRyEmbBm7iBaPFyYvhfuyc9GfVUAANqVnDNJ5TFCiA9xICV5YLR6qtK/vD6fJbipDOoLxDnST63yAmivgq+a/B7MsGozDzuMdzBYctkQt4m59TqVeAg55qQD2yGT+n4lvGQo+yhe7cr8JFQ61dwmPt6eSzesMFWjzGbo9/tzfXNdf3aWoz/l78CiX/eGMaJNHGHGwN8ZpEx6oLoLyr/SzrfxrcER8Y6GXBM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q3FGRUZIaVhia2xhd2hNMFY3aC9DSnhkbVY2UytlSUUwVXBONDIvWlRCY3Ir?=
 =?utf-8?B?OEorSGhjTWlRai9CMG5GYno5Q1ZwTFpPbTN6QU9jT0lFTUZBWkZ3MmpCSFcv?=
 =?utf-8?B?bE5FL2lpOWlaU3U4MGV4UjF1V2N0akJITEUyT0tjdCtGTjE4dHI2OS9rdHow?=
 =?utf-8?B?VkRhWUMvZmZkQ3pEMkhRU3NmN2pQQ2NTRmJxR0JlTXY2MW1jenEwMnE5U2Rw?=
 =?utf-8?B?dTNHaU9DVDVSSGRTdTErZHVUUERLcFJJQkFQbzZZZkFDeGJsR0g0TzFsaFdQ?=
 =?utf-8?B?cnZodDRRMTFBaGIxc2ZKQkpkajRVekQ3OGtGN3lJSWxCU2g5Njdqd2JNUEt6?=
 =?utf-8?B?SEVnTURHUUdtV3VqeGZDWDNIcEdjUUlzVmMrOTRlc2cvdHdscjdlOHZDNnFB?=
 =?utf-8?B?Z0d0dDhUUnFpcmJMRlAzcHNVYmdac3VqNkE4bnlkNlNqYm8rQjIwTFlkdVhM?=
 =?utf-8?B?Q1NMU1o1N01oa1RxUlpzMmM0MGlRWThBT002SmVJQWkwRmVCTWpVaFRYUkdD?=
 =?utf-8?B?RGZNaGo3QjFOZkMvTC9yNnZ3SFdkRGF1NDFueE5UeVdUR3I3NHVOTUE0UE9v?=
 =?utf-8?B?Z2tOLzJnWHdPUXl5Rm5NSkVWTnZERW1iRFBNaEpNRXN4UUhpZmRXaHdabXkr?=
 =?utf-8?B?LzZQeWU4THcrdFlyVDFWNUhHQmJyOW1WMW9zSDU5eTFWU1F0ZVpPMVV5NXgw?=
 =?utf-8?B?UG1Rak42UXM2Y2prRG8yR0phd2NHYitHOE9rYkU2dHA2cm04R0F5cWFERU42?=
 =?utf-8?B?aU5NU2orRnI3ZUF0dzlNQkJSOGZTYWRVdG9kU3cvVlJsaHpqTnpkdjE5czUv?=
 =?utf-8?B?R05MVDI2M2JROXRnc1JuUTlYUlBQdDRsRUUwdTFOMDdzN0wwZDF5RVpwSFk4?=
 =?utf-8?B?Qk9DYWFSTEVoMkpoajZWUGEwWmF5Y29MK0RYbFpBa1NZVGJ2c3lxNlBrY0Nx?=
 =?utf-8?B?SGI0eWdRNW1uZ3lzaUhuWm5NUkNjUEJYMWVBN1A3R0MxOHQ3a2xQYm9HbThv?=
 =?utf-8?B?L1FHRk1RcStTeUlPdEtINDBwalRJKzhRMzZlNW1PbnRRTmxkVUNvbHRMYk9T?=
 =?utf-8?B?czlrTDUzSkVWbzBENVNzMVBwQ1J3QVl3eE1iVUNiZXpKT0Z6S0xoVDh5V0pZ?=
 =?utf-8?B?OTArc0FSTnFEc3lnSllKRnp4V3F4M2NiOGMrVlptYzJ3RkdLZjZlLzZPWVBh?=
 =?utf-8?B?MFFPdWEwRDNiNTJWQ0dWN0Z2ZXRVdWtaZFR4NlU4bEViMDBVZFFnR2NmVE5t?=
 =?utf-8?B?MFo3b09YVG1zc01QZFJERjBFTCtkSERRa1Q2eFhISnY4KytXLzk3WkNuN1BG?=
 =?utf-8?B?VHNwUGtodkZqaHVxNmVLVCtScVg4L0l1dnkzVlIwZDdjZkprSC9KWVgzNlBo?=
 =?utf-8?B?WThoN01xTlRRTVlSUFA5d1ZWNW94SE9OelZ2b29wU1QwMGcwTlpMN0hiRnlo?=
 =?utf-8?B?VkRaQm8rY0RRcHVvZ0ZIa05iZUJOa0drQ2o0a1VleGVUU0dmTnczbU5jeHVP?=
 =?utf-8?B?WFoweVllMTQzdWlVVDJTZnp5a2NsVXI2cGhHa3ZqMmRJdFZXOHRGenNVUmo0?=
 =?utf-8?B?Wm5vY0pESlZQYmJDaFpjUzZQalpnMFg3S3ppQjUyQ0tMTng4S3NDVjZLUGgv?=
 =?utf-8?B?dldEeG5KMmxDYnlpc3dCemxNY2FpUFgyd3piZ3hRYkI5bHRJZnluai9wdnU3?=
 =?utf-8?B?Y0FNVkxGQXVSQlNLS1JUTFdDcUJMeGRJS2JQanAvTUwvUDVBNzlLRW4rbHB6?=
 =?utf-8?B?cnZxL2xhcldpODZJaUx0UXdab3NLbVR0eDdmMXRpWk0zVUlhUDVwZWhOeEVk?=
 =?utf-8?B?emhaeE84b1V5SXptQWQvQjFQRHJUYWRXelRYNjRwMi8zMUd6eFlpUkVub2tW?=
 =?utf-8?B?VmNzZFZRY1pMbjEvZ3g0eUhnakFjWWJxcVQ0bHdHRFc1OXhsa0hzUW5iWS8v?=
 =?utf-8?B?ZWdUUUU5dDdUTHNmZTVQdGp0M1hyc2NTTHJ0VjQycW5rY1ZpUkI0NlYxOWx6?=
 =?utf-8?B?VzB6dmM5Ym1QUXUzRnY1bjFhVTlGSGJZdnZNUXU5ZWZqckduaFA5VXltOHRR?=
 =?utf-8?B?WEwrcjBPaVJBb0lkNjhYNmlGbmd4a3dPNU96RWhmUXNuekd1eFBBejVYcS9Z?=
 =?utf-8?Q?Yc5dEzysiPFHPn0ELpGa1tObg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6172C2A7959C564094411E560BD3D7F7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b1ab38-1156-415d-143c-08dc31ea6f34
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 08:03:33.7047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dDXERhxVgSzrAJl1YU9ufKSfpCzypyDjgZpGkJ6DIzuctlufdTZ6rtzTB22p8CSeDVwS6Mh7r1RWEl0LUUQcRApWDQAE58EwluI+dhM3YZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3849
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

DQoNCkxlIDE5LzAxLzIwMjQgw6AgMTE6MjcsIEdlb2ZmIExldmFuZCBhIMOpY3JpdMKgOg0KPiBQ
YXRjaGVzIHByb3ZpZGVkIGJ5IE5pY2hvbGFzIFBpZ2dpbiBlbmFibGUgUFMzDQo+IHN1cHBvcnQg
Zm9yIEVMRnYyLg0KDQpUaGUgc2FpZCBwYXRjaGVzIGFyZSANCmh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvY292ZXIvMjAyMzEyMjcwNzI0MDUuNjM3NTEt
MS1ucGlnZ2luQGdtYWlsLmNvbS8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2VvZmYgTGV2YW5k
IDxnZW9mZkBpbmZyYWRlYWQub3JnPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvY29uZmlncy9w
czNfZGVmY29uZmlnIHwgMSAtDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvY29uZmlncy9wczNfZGVmY29uZmlnIGIvYXJj
aC9wb3dlcnBjL2NvbmZpZ3MvcHMzX2RlZmNvbmZpZw0KPiBpbmRleCBhYThiYjAyMDhiY2MuLjJi
MTc1ZGRmODJmMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvcHMzX2RlZmNv
bmZpZw0KPiArKysgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9wczNfZGVmY29uZmlnDQo+IEBAIC0y
NCw3ICsyNCw2IEBAIENPTkZJR19QUzNfVlJBTT1tDQo+ICAgQ09ORklHX1BTM19MUE09bQ0KPiAg
ICMgQ09ORklHX1BQQ19PRl9CT09UX1RSQU1QT0xJTkUgaXMgbm90IHNldA0KPiAgIENPTkZJR19L
RVhFQz15DQo+IC0jIENPTkZJR19QUEM2NF9CSUdfRU5ESUFOX0VMRl9BQklfVjIgaXMgbm90IHNl
dA0KPiAgIENPTkZJR19QUENfNEtfUEFHRVM9eQ0KPiAgIENPTkZJR19TQ0hFRF9TTVQ9eQ0KPiAg
IENPTkZJR19QTT15DQo=
