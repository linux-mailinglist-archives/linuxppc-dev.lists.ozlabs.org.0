Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A359564F29
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 09:56:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lbymw1Rw9z3bPP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:56:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=hQvjYlci;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.49; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=hQvjYlci;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90049.outbound.protection.outlook.com [40.107.9.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lbym64jV3z3bPP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 17:55:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=di/TyjrkOHPlEU8e7P0T3UuqAMbSSpVdWvp0cx3GjAl+7ycNBBuwN7tbv9gUC1MHvrh0CFEPnW+R4ogmR8eEA3L2xbdNyncpVsQdT3EAnMkaL+wtuubdF8T/UkCiqJy+/3cgidA61rdIO8kLi8b7Txa8o9Zo/qng9AP3XuLweHeSgSsk589ZIfd+KUipdRO1djnhtnxRxZv+aaRbczPHp8BwIoMmyVhl27bNc57B3fQIyYOaT3gEtyFNzCre3rGvjnKLERUSPFY/fwgWVIaPdLQRt20efiveiMFs4tZFc2R+OqJdil5UbKtml2uAnHMd2rti/WQERUWkWuOAFMjhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UawTqXV9mzPhWN2VlWsMbv9taIEh6mZvjODHGZ5nnHQ=;
 b=LX9mG3Q+jfvJQ7YkIhR0HnKRzH/hK7xMc3gxNQsLU8YouwfSHALqtdqSRIa9g+snynE1madEw93X8UQDoxbAc+KsOEeT7l3or8wzrAsU1DiRtuWpbB6Mm2EMlmpRcmFOntdE9uK/1RTWpGj34e5OreqIyAPByYys6CTJX9BXqQnH9z4ewfp8EuVDxtcWypG6eM7i9n4zqP1zfOkPHE9K5+etnPEM35OZWucOwdcouPB6DiYJE2yf5C1DBnbCX0OOR3DAiAV7gKaxkZIEbHn0Ym7QpcvjEi1/iGF+ocM+f+CABpTa5rJXnpnGoO7sFWUgbeuscUmzlaX6HdzBSIW8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UawTqXV9mzPhWN2VlWsMbv9taIEh6mZvjODHGZ5nnHQ=;
 b=hQvjYlcig1INzdrI42H3gpsgLmUK1aM/irOGjiXbjr7LZb7Ur30nCdiWoUTG2ZmNOXUUFzeB4Flh15x2dlEOsrcC1mOknuvIb/5vG+DPnEA48MjvZuNuj284oXG0kjrPWBvgLoaTFuGkxGENuxah67MdxHhlONQYPtAcsWqPzEY4PdtzLIIzr+1i+Vri9eyAoxoi4m0EuG3hH2ID4DhSDl9mHOldguytdJsuBlAPNEhHv4QXzSdnN7Y8xlZasIgRPojz6e6qZ3G25sCP697pT67zZPO27YYZ5HNPf81vNPpiXaGtcECszAErQiBKs9hr9cycQwqhLVOwABhKT6+CUQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3534.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:259::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 07:55:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 07:55:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/mm: Use is_vmalloc_addr to validate addr
Thread-Topic: [PATCH v2] powerpc/mm: Use is_vmalloc_addr to validate addr
Thread-Index: AQHYj3DK8TYLIxu0rEqrHZAfN+PIEK1tzC+AgAAI+wCAAALOAA==
Date: Mon, 4 Jul 2022 07:55:28 +0000
Message-ID: <d42e1e82-ffc3-7cf8-7de0-52a24f3f2d83@csgroup.eu>
References: <20220704063909.295546-1-aneesh.kumar@linux.ibm.com>
 <2daa07c5-db5f-a6c9-82a7-7b6f1524135b@csgroup.eu>
 <91684e3f-c60c-e70f-4c04-fab40c2214b7@linux.ibm.com>
In-Reply-To: <91684e3f-c60c-e70f-4c04-fab40c2214b7@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 229b0524-34f0-44ab-28b8-08da5d928fa7
x-ms-traffictypediagnostic: PR0P264MB3534:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Vnr1l6mJHhqld3PVxxELmZz5IQoeXpQp8VpDipN2hMVT4nhMtMRH3h5aM0XXYItELFzdBP4RZ4X+O3JnR7tT4TKoe5hvEOU1NOyk9GkoeXE7ow6bloX3i6WYTuat+lIUdmWjSiGaMoVaatTxqB06TtMe2e3RP9HtkKpZ6w2iguTraciOnQPO5e9VFODEL4wSQj+LMJ6r53vWAnVNSVy/6UJqP+EWL7EE2V+5ydg0vyeou3CfVQ+Ebr/tE05LQdaS9xUXstKyrsbP7aPndj1Zu5SNa+ujGqLFj98axo2vcqLFZk5u34Lt5LpJtartNdOBXaPo/zYuHwu2GONamSwUbOEDb30u47T+9xVqpYOhTahFqajpocu4bfsYqVP1LEGIwq7Zr/AKNXRZ5JdYwY06Xq27X8Gc7pAAUzeOCgC8WdXSALFKfE38az2Py6sQh7bnrQEnQiROUs8drqlQN+y9xjQcyZTs06NQE9Otk0fq17XfXxSOj2SUe4ngVVwBTZGPZHoZ1/wSIR/Uyp4IoO6V4Eus5aAGf1Iaq/HezOx8EHQj91a4kyNWjcndPGtgJGAXyOIUMHDVBLT5Yu6Ex8YX4XXQx6BcKQslVCHO28mnhNVlFFJphhru4Nraz+XoFvnzl6CS/h4NFzTZJtt+grRAbM9Vsb+CcZ2jO83yx0jeNlfWRWhpeDRtBieTomUgZipL2FmuNXIR9rY2wUBJNQGw7u13AIlYWgC0WxE2duPta/rmC0IL8ofRhN0kfj3yxfBa6xK9Mmxv/XbbW1co5lp6JKjPeDUWgL7xcR27B/NBidfYYhKSHENLBEGRYMMbIj//+C0wpqcp1DjmmUhn3n8Wl/FrZVWZB3rmRLBUYJbI7dmPN6igp62iHaPjEaftcxow8dZkiZwlfT+ZVdjqmtPpVzI6+ZZLOt9/DrD8sg9nxr4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(366004)(396003)(376002)(136003)(41300700001)(38070700005)(186003)(122000001)(2906002)(53546011)(66574015)(44832011)(6512007)(15650500001)(26005)(71200400001)(2616005)(8936002)(478600001)(5660300002)(6506007)(31686004)(91956017)(31696002)(38100700002)(86362001)(966005)(36756003)(4326008)(110136005)(8676002)(316002)(83380400001)(6486002)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aEliYnRXN3lhYjY2R0RhOHpIRVhJdHFoK0tsbG9MVmZYbkJoNWtxWjlPeU5H?=
 =?utf-8?B?MlZzSGp0TzZVaWliZHlEYll4VUtzYStqUHp1ZHd5OHFqU2VWVVdEMGR1Mndr?=
 =?utf-8?B?V3VDNFJtYXljc2JqMGVFSUJkMTN5ZTMwemtmNVJkOFNGemIvckh1QXpyZ3FB?=
 =?utf-8?B?eUZRVXQwd2hXQlRGVkRsbE42VjFhZTFYNUVnc0ltVzkwV1RKOWJlVUtuZ05z?=
 =?utf-8?B?dGtCWitGNEhPTGgxYUM4UEtrM2hxbm04N0FsT2NiR2ZkTTUyL3NuTGtTWlIr?=
 =?utf-8?B?LzU0RHdOSVRLVzF1RVpXYmU0SG9BSzJGUjI2ZWZoOEZiZDh0aVd1UmNyRmdQ?=
 =?utf-8?B?Q3Y2TGlzMWhzQUlyNDB3Smc3am1sN0EyNkdYVXJZSkZWODVGcnR6Z25tbnVU?=
 =?utf-8?B?R0VSQVkxVGVwRXNQT2VuZGxMc0tQMUt4VXZoeG5rZ1dPeGo3aW1wc0duSnlZ?=
 =?utf-8?B?VFJOazIvY2x6ekUrU2ZuWG5sR3Z6OG1vZG9MdEovNG9lRzVjZnltaDJKa0N1?=
 =?utf-8?B?c0tzMHFQZXNyaU1IT2E5byt3MXhRb0l3MU12UjlaZU1sd0x4NjN1OHRZSG5Y?=
 =?utf-8?B?c2ZFWktSdlB3ZmlydDNxVkx5d2k0a0h3RHVrZ0EvWGdHbzFnYjNzRGhnR3lP?=
 =?utf-8?B?RUpvNHpaWDllWnVvMlFIdlVScWZkUm1XZFdpYWUxQjgrS3NJVXBCaXZubW0y?=
 =?utf-8?B?em9qblk3aUNhRE9GRGNVc05FM0hLK2NLTE5UY2FzQitjek1mcW9MN3I0NG93?=
 =?utf-8?B?TjJZUGRNZWFKeCt1VkUxcFdWdzkrRmhuUkFsZTNyNVBrcTMyR1ZaZm96UG9o?=
 =?utf-8?B?dnlrZG1FcWNURkJITUY1WFlaTGdQekZTME9RdERsYlZvTjNXTkJ5Yk9mcDZN?=
 =?utf-8?B?OFowZTVFS1RWL2orVTZDa3QyTklRbnVVRUNHb1ErVDlaZGJaNm9jWjF1Mm5u?=
 =?utf-8?B?ZXh4NjA1MjBqTWtTbWlVeDYzZlBjeU1DZEs0YmtObVduT01iREtqQnoxa1Vj?=
 =?utf-8?B?MUJCaXBRTUg2S29ZQlhpQ1BiMldKSlVMMWhPZjJPekZEa1N1YUxNUmx0U0FO?=
 =?utf-8?B?NmVzN0drbUxIYUhkdTFQVW5xUmtlbGRGdis5T3AvRitPN0VqMm8zWnNaWDRK?=
 =?utf-8?B?ZENnTnlvM1FROXV3UkpiWGFIenRvRG9JUXo1blFDMzZ0MWt2U3VrSDlYcnRZ?=
 =?utf-8?B?U3NhNUdPdGdjbitxRW5tdkZWQmwycms3SG45Y2xGMVVsODZiRWorTUtTR1Zk?=
 =?utf-8?B?cnRiNXN3RVlWZFhxYU1INGlyY1RpY0Vvc2NhODRacndmd2pPUmdPR045ZDJ5?=
 =?utf-8?B?V2pENlg4Nkd2SmcvR1JweW90THh4a3NBT0xLcnBGbFhvMkhjRjhRbExtL2Ja?=
 =?utf-8?B?ZjMrTDZLQ2NSNnJoNDFmWjFYUkhuVWFOU3k5ZldKbVBpQ2RpQlYyRzFDMUx1?=
 =?utf-8?B?MWNQNFNaTURsOWZUdU9GNUZnSXIvb3dZMGs3RVY5N2drRlJubWxjZ3JnbXI3?=
 =?utf-8?B?YkJpUzBIVkdGcFFmSHhUN1hNZ3pVVFdZTzdDV1BNRElDdm1YYmYwUDlNMTRS?=
 =?utf-8?B?N3FndFk1aEpBc0lFY2dKbXBQbnpybEJsMXdoU05xOEIvU2wrcWFFa2ZGZkhB?=
 =?utf-8?B?dWlyOHducm1KM0pod0dxMGNoZWtaMDMxbzc5eUJEbFFHTkk1MFpWLzArZEJz?=
 =?utf-8?B?ekkxbGpHYjdMcDcxaEtEUG9zdmJMNWVadkY0cVk3Wi9Ya01LRUI1dnNqTG9k?=
 =?utf-8?B?WDFlSlNQY0VPUnVFSVk4VVZuZkhpVTJIL0FPYXpmUEs3RDBpaml3cUd1NmJv?=
 =?utf-8?B?RGdMdE1yVWZDMkZMbjUzNVE3Y0w1dnVwODBTc09hU0tMUERxZUF3aTRhZ2xX?=
 =?utf-8?B?Tk52VkZjcVhxQ0o2UWEzNGRNaDMzWEg5MGo5UkVBbWxOTFpXQVFzU24zQ2Zx?=
 =?utf-8?B?K3NXc1NoTW85NVlQaUFZaVdyZUJnaTNHMGFCV0NLTElYZHliZHBmNUhtTmh5?=
 =?utf-8?B?bmR1bjhYM0IzMkFmV1NlblhGbzRXSlptVWRldm51aUFObnd5UEhyeFp5bE8v?=
 =?utf-8?B?OVJHNmU3RTh5OWllSysrN0Q3eDlCNnNNTEhsNkVGTDBKSmxCdVhFNnhWZEdL?=
 =?utf-8?B?Ym1YZW56SEZYc1NqQ2pMVTkyeGw3QzUyaUgwUW9FL1ZGVDJ3TXlNREJSSUVM?=
 =?utf-8?Q?wfLYB6LXaf0vokXoq5bVQCk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5602C0DDC96FEF42BA4EF674C7214B4F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 229b0524-34f0-44ab-28b8-08da5d928fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 07:55:28.2895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YRAL1QMVYgBUGgDZfVdIWZ9cfKfyAJHDizAWrdc/iJegfIgVErtS50OmlmdVrcVs+HRIgiOj1qtqKa3hWwpEMa8vtS2axar0Evxs0b4bV7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3534
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA3LzIwMjIgw6AgMDk6NDUsIEFuZWVzaCBLdW1hciBLIFYgYSDDqWNyaXTCoDoN
Cj4gT24gNy80LzIyIDEyOjQzIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+DQo+
PiBMZSAwNC8wNy8yMDIyIMOgIDA4OjM5LCBBbmVlc2ggS3VtYXIgSy5WIGEgw6ljcml0wqA6DQo+
Pj4gSW5zdGVhZCBvZiBoaWdoX21lbW9yeSB1c2UgaXNfdm1hbGxvY19hZGRyIHRvIHZhbGlkYXRl
IHRoYXQgdGhlIGFkZHJlc3MgaXMNCj4+PiBub3QgaW4gdGhlIHZtYWxsb2MgcmFuZ2UuDQo+Pg0K
Pj4NCj4+IERvIHdlIHJlYWxseSBuZWVkIGV2ZW4gbW9yZSBleHRyYSBjaGVja3MsIGFuZCBhIGZ1
bmN0aW9uIHRoYXQgaXMgbm90DQo+PiBpbmxpbmVkIGFueW1vcmUgPw0KPj4NCj4+IHZpcnRfYWRk
cl92YWxpZCgpIHVzZWQgdG8gYmUgcHJldHR5IHNpbXBsZS4gU29tZSBleHRyYSB0ZXN0cyB3ZXJl
IGFkZGVkDQo+PiBieSBjb21taXQgZmZhMGI2NGUzYmU1ICgicG93ZXJwYzogRml4IHZpcnRfYWRk
cl92YWxpZCgpIGZvciA2NC1iaXQNCj4+IEJvb2szRSAmIDMyLWJpdCIpIGluIG9yZGVyIHRvIHdv
cmsgYXJvdW5kIHNvbWUgY29ybmVyIGNhc2VzLCBhbmQgdGhlDQo+PiBjb21taXQgbWVzc2FnZSBz
YXkgdGhleSBhcmUgdGVtcG9yYXJ5Lg0KPj4NCj4+IHZpcnRfYWRkcl92YWxpZCgpIGlzIHRoZXJl
IHRvIGNoZWNrIHRoYXQgYW4gYWRkcmVzcyBpcyBhIHZhbGlkIGxpbmVhcg0KPj4gbWFwcGluZywg
bm90IHRoYXQgYW4gYWRkcmVzcyBJUyBOT1QgYSB2bWFsbG9jIGFkZHJlc3MuIFdoYXQgd2lsbCBo
YXBwZW4NCj4+IHdpdGggeW91ciBjaGVjayBpZiB5b3UgcGFzcyBhbiBhZGRyZXNzIHRoYXQgaXMg
ZnJvbSBhbiBpb3JlbWFwIGRvbmUNCj4+IHByaW9yIHRvIHRoZSBzdGFydCBvZiB0aGUgdm1hbGxv
YyBzeXN0ZW0gPw0KPj4NCj4gDQo+IEkgd2FzIGV4cGVjdGluZyB0aGUgaW8gcmFuZ2UgdG8gYmUg
aGFuZGxlZCBieSBwZm5fdmFsaWQoKS4gSVMgdGhlcmUgYSBtZW1vcnkgbGF5b3V0DQo+IGFzY2lp
IGRpYWdyYW0gb2YgYm9vazNlLzY0IGxpa2UgYXNtL2Jvb2szcy82NC9yYWRpeC5oOjUxID8gTXkg
Z29hbCB3aXRoIHRoZQ0KPiBjaGFuZ2Ugd2FzIHRvIG1ha2UgaXQgbW9yZSBleHBsaWNpdCB3aGF0
IGlzIGl0IGJlaW5nIHZhbGlkYXRlZC4NCg0KDQpZZXMgeW91IGFyZSByaWdodCBpdCBzaG91bGQg
YmUgaGFuZGxlZCBieSBwZm5fdmFsaWQoKSwganVzdCBsaWtlIHRoZSANCmVudGlyZSBWTUFMTE9D
IHJhbmdlIGluZGVlZC4gQnV0IG9uIFBQQzMyIGEgdmFsaWQgcGZuIG1pZ2h0IGhpdCBhYm92ZSAN
CnZtYWxsb2Mgc3BhY2UgYXMgd2VsbC4NCg0KWW91IGNhbiBmaW5kIHRoZSBuZXcgbGF5b3V0IGhl
cmUgOiANCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Bv
d2VycGMvbGludXguZ2l0L2NvbW1pdC8/aWQ9YzdiOWVkN2MzNGE5ZjVkYmY4MjIyZDYzZTNlMzEz
Y2VmOWYzMTUwYg0KDQpUaGUgb25seSBwcm9ibGVtIHdlIGhhdmUgd2l0aCBwZm5fdmFsaWQoKSBp
cyBmb3IgUFBDMzIgYmVjYXVzZSANCnBmbl92YWxpZCgpIGFsc28gaW5jbHVkZSBoaWdobWVtIG1l
bW9yeS4gVGhhdCdzIHRoZSByZWFzb24gd2h5IHdlIG5lZWQgDQp0byBjaGVjayB0aGF0IHRoZSBh
ZGRyZXNzIGlzIGJlbG93IGhpZ2hfbWVtb3J5IGluIGFkZGl0aW9uLg0KDQpGb3IgZXZlcnl0aGlu
ZyBlbHNlLCBwZm5fdmFsaWQoKSBzaG91bGQgYmUgZW5vdWdoLg0KDQpGb3IgUFBDNjQsIHdlIG1h
eSB3YW50IHRvIGFkZCBhIHZlcmlmaWNhdGlvbiB0aGF0IHdlIGFyZSBpbiB0aGUgMHhjLi4uLiAN
CnJhbmdlLCBiZWNhdXNlIG9mIHRoZSB3YXkgX19wYS9fX3ZhIHdvcmsuIE9uIFBQQzMyIHRoYXQn
cyBub3QgbmVlZGVkLg0KDQoNCj4gDQo+PiBXSXRoIHRoZSBzZXJpZXMgSSBzZW5kIGxhc3Qgd2Vl
ayB0byBhZGQgS0FTQU4gdG8gYm9vazNlLzY0LCB3ZSBub3cgaGF2ZQ0KPj4gVk1BTExPQyBhYm92
ZSBQQUdFX09GRlNFVCBvbiBhbGwgcGxhdGZvcm1zIHNvIHdlIHNob3VsZCBiZSBhYmxlIHRvIGNv
bWUNCj4+IGJhY2sgdG8gdGhlIG9yaWdpbmFsIHZpcnRfYWRkcl92YWxpZCgpLCBiYXNlZCBleGNs
dXNpdmVseSBvbiBwZm5fdmFsaWQoKQ0KPj4gZm9yIFBQQzY0LCBhbmQgcGZuX3ZhbGlkKCkgJiYg
aGlnaF9tZW1vcnkgZm9yIFBQQzMyIChPciBtYXliZSBvbmx5IGZvcg0KPj4gUFBDMzIgaGF2aW5n
IEhJR0hNRU0pDQo+Pg0KPj4NCj4+IENocmlzdG9waGUNCj4+DQo+Pg0KPj4+DQo+Pj4gQ2M6IEtl
ZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4NCj4+PiBDYzogQ2hyaXN0b3Bo
ZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4+IFNpZ25lZC1vZmYtYnk6
IEFuZWVzaCBLdW1hciBLLlYgPGFuZWVzaC5rdW1hckBsaW51eC5pYm0uY29tPg0KPj4+IC0NCj4+
PiAtLS0NCj4+PiAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oIHwgMTAgKysrKy0t
LS0tLQ0KPj4+ICAgIGFyY2gvcG93ZXJwYy9tbS9tZW0uYyAgICAgICAgICAgfCAxMSArKysrKysr
KysrKw0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFn
ZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaA0KPj4+IGluZGV4IGU1Zjc1Yzcw
ZWRhOC4uOTc3ODM1NTcwZGIzIDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wYWdlLmgNCj4+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oDQo+
Pj4gQEAgLTEzMSwxMiArMTMxLDEwIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwZm5fdmFsaWQodW5z
aWduZWQgbG9uZyBwZm4pDQo+Pj4gICAgI2RlZmluZSB2aXJ0X3RvX3BmbihrYWRkcikJKF9fcGEo
a2FkZHIpID4+IFBBR0VfU0hJRlQpDQo+Pj4gICAgI2RlZmluZSB2aXJ0X3RvX3BhZ2Uoa2FkZHIp
CXBmbl90b19wYWdlKHZpcnRfdG9fcGZuKGthZGRyKSkNCj4+PiAgICAjZGVmaW5lIHBmbl90b19r
YWRkcihwZm4pCV9fdmEoKHBmbikgPDwgUEFHRV9TSElGVCkNCj4+PiAtDQo+Pj4gLSNkZWZpbmUg
dmlydF9hZGRyX3ZhbGlkKHZhZGRyKQkoewkJCQkJXA0KPj4+IC0JdW5zaWduZWQgbG9uZyBfYWRk
ciA9ICh1bnNpZ25lZCBsb25nKXZhZGRyOwkJCVwNCj4+PiAtCV9hZGRyID49IFBBR0VfT0ZGU0VU
ICYmIF9hZGRyIDwgKHVuc2lnbmVkIGxvbmcpaGlnaF9tZW1vcnkgJiYJXA0KPj4+IC0JcGZuX3Zh
bGlkKHZpcnRfdG9fcGZuKF9hZGRyKSk7CQkJCQlcDQo+Pj4gLX0pDQo+Pj4gKyNpZm5kZWYgX19B
U1NFTUJMWV9fDQo+Pj4gK2V4dGVybiBib29sIF9fdmlydF9hZGRyX3ZhbGlkKHVuc2lnbmVkIGxv
bmcga2FkZHIpOw0KPj4+ICsjZW5kaWYNCj4+PiArI2RlZmluZSB2aXJ0X2FkZHJfdmFsaWQoa2Fk
ZHIpCV9fdmlydF9hZGRyX3ZhbGlkKCh1bnNpZ25lZCBsb25nKSAoa2FkZHIpKQ0KPj4+ICAgIA0K
Pj4+ICAgIC8qDQo+Pj4gICAgICogT24gQm9vay1FIHBhcnRzIHdlIG5lZWQgX192YSB0byBwYXJz
ZSB0aGUgZGV2aWNlIHRyZWUgYW5kIHdlIGNhbid0DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9tbS9tZW0uYyBiL2FyY2gvcG93ZXJwYy9tbS9tZW0uYw0KPj4+IGluZGV4IDdiMGQyODZi
ZjliYS4uNjIyZjhiYWM4MDhiIDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9tZW0u
Yw0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9tZW0uYw0KPj4+IEBAIC00MDYsMyArNDA2LDE0
IEBAIGludCBkZXZtZW1faXNfYWxsb3dlZCh1bnNpZ25lZCBsb25nIHBmbikNCj4+PiAgICAgKiB0
aGUgRUhFQSBkcml2ZXIuIERyb3AgdGhpcyB3aGVuIGRyaXZlcnMvbmV0L2V0aGVybmV0L2libS9l
aGVhIGlzIHJlbW92ZWQuDQo+Pj4gICAgICovDQo+Pj4gICAgRVhQT1JUX1NZTUJPTF9HUEwod2Fs
a19zeXN0ZW1fcmFtX3JhbmdlKTsNCj4+PiArDQo+Pj4gK2Jvb2wgX192aXJ0X2FkZHJfdmFsaWQo
dW5zaWduZWQgbG9uZyBrYWRkcikNCj4+PiArew0KPj4+ICsJaWYgKGthZGRyIDwgUEFHRV9PRkZT
RVQpDQo+Pj4gKwkJcmV0dXJuIGZhbHNlOw0KPj4+ICsJaWYgKGlzX3ZtYWxsb2NfYWRkcigodm9p
ZCAqKSBrYWRkcikpDQo+Pj4gKwkJcmV0dXJuIGZhbHNlOw0KPj4+ICsJcmV0dXJuIHBmbl92YWxp
ZCh2aXJ0X3RvX3BmbihrYWRkcikpOw0KPj4+ICt9DQo+Pj4gK0VYUE9SVF9TWU1CT0woX192aXJ0
X2FkZHJfdmFsaWQpOw0KPj4+ICsNCj4g
