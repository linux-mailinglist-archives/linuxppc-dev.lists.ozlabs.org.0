Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5CD8750EB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 14:52:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WYiTK6ih;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr9hd1zwwz3vXs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 00:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WYiTK6ih;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr9gr0TF8z3bYQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 00:51:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgxBjgsnO3sea7WuIT/vnTusv9ANsbHyzBky+aErjACmJgXmjStDxpKs/PvOmOp7DiVVKL5ef47ZPlEoBGuAEak4YLgCNRisy18Y5zYWK4BoBSPERzIA9C2Vka4ue9X2id1tzMFf5BUCwpCvfJNpKqK5ccBfb7ntibWAgosa05dnPb+m7dBKUFOpAJ2b72D2zQHARf5fDRj+TdtTkcqGTniTuzxysyGaeWPRQoSU2kD0pnCoZFzLvylkC9zfoK0mWUL4vAIKQQJE7Jnip4e46orndyUraMQ52Q1O7EIYYaHyzi9MEXiLpt1OcjuInG7T1ZiOSvAEij44HESgTtdiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5g5+lo65FSRUboO+Fi6YRvCDvmtfP2zPQ30ItwRS8U=;
 b=VtADUFi2UkvgOi98buoWQnVeUhbn6z/2TfTjN9h6RVwcOYy30s1sJeAuDZpuqluBl5pGLAhe/CF0J1TrtOrpNXchbDleJGjOHk0sEpKmTcLYL3j1S2eZxvJFVVtIj1Gmh0Nz8zzWtKxzUcInAU2WCTzKWZjCjwgi3S6lacwEqRH+ejRVRKlsThxfgVqJ8x55bOAGuSqTe/uD0Yf8FSbkr43Sy4pV6KLDbBvZoFR+iqC9OtVCtBqkaDi2Ba1ElfGcP8cNkop5dJaW3gMypSPP8n716mz/jjbjKiOMRI5LO0+VqClB5fxPm1ATKcteXdw1cQ/puKFcPW488iK0UKoL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5g5+lo65FSRUboO+Fi6YRvCDvmtfP2zPQ30ItwRS8U=;
 b=WYiTK6ihhC+xiCc3mnNGxjGnfSSPrmjXv0buUSVjdhgN4VEhBsx4FBUzbtUElDAk/mKwhY/tNxLmCWnkKwUdCqV9rX+2Ocva4hdj9pg1ZYQzMhQcvODpRILHRdDGJ8DmR9LpgUsADcf3KjDSjIT4MOSkJ+tbT2sCZ+PT4keadvWUqyVB4xaRVR0LJ7yS/GBlYHMzGhGYGjP+fZQh35eLGCyOKznjDJbetMQgP/qV8/9r9p2VWAxiwmzBTrgAEcSETZOYkWIL6gsmBqbt/F4jd+LOYBgLAPFZ+eH98yiXTixBfkhxc3sksbyyf+Fuvgj0ZxHhzW0gU51zAxQPxLDsaQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2723.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 13:50:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 13:50:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "longman@redhat.com"
	<longman@redhat.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, "kabel@kernel.org"
	<kabel@kernel.org>
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Thread-Topic: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Thread-Index: AQHacDjgK3b+WpnPIEGh5lKDyA2GCLEsTH+A
Date: Thu, 7 Mar 2024 13:50:54 +0000
Message-ID: <598887eb-b1b9-4bc1-adf3-4fd758ac2d9f@csgroup.eu>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
In-Reply-To: <20240307024034.1548605-3-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2723:EE_
x-ms-office365-filtering-correlation-id: d38d094e-40cd-41fe-7aaf-08dc3ead9ba0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  cvwzOYC+YxR58u3DUTWEzfezxU9s6uHOb0kY4BK0bYyxM5H6cmY4jmELrppFBFDTzeeaYhY1YWo8He3zT/OqMojaxD3ZL3iv2FyUWfc/aTNqqU4d/Oz9Ms4XwgVtwHMP/vfyJKMHRRMqu1UVCMlT4+R0NjM713TI/b9eG3PVi+8ps46UItTopetwjluATeKU3fEy7flr9dy/SiMOlGTLxBmqEge9x3SG5OaCPT9DQ0T+sEokmQ/MElgEFpl+Vp4ufwybDcNJuTUi/0p/TJT9GTVJIaiTsoW5OFajd6x36rzx2uYeupLR28DjfG7r3mwJKqRPeqv0/dpf7ksZYBnTYCBrE0xi7d6UHaWGvj09iWcaMt+9rXaWUvXL073iC9sAdKToHftn7neRZCENgd/skQr2KtwELOWS2Wyv1VL0YOfBLVinDB1i5aSelRAm/4giDQHHjkxGWe9Mnj6whgw9t4T0QFrMD+FrLErh1iBNt2FCaoEdq92IrW3JtsA7xZ85BC8YzGm9lTEEVPIXIs2KfhVIEUFH1CmOM0681QiIYyZ6B9jdBS1HxlknkO55m9IGwGiWthcMdKVqN3QxZ/9sqZENamdV/+BN8GuzVNp0NuBRVYtPHxXNGHoM46IGmjMvOREzw9XFDZudRoVeKiyrXb+kpjmLNYL0Kj58tWGtnl2suo1I0nl7v/s1xnRlOdQgaGEMVRAQcMJ23iNuhuAMIxwzUv2CqURhhNQcnVAAnjA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MzlHcHI3dy9vSDRYMHpJTHhTYTMrRFdlbjZhbUtBc2RTS05FWVc2TDVibG5K?=
 =?utf-8?B?SldOam4wemdKVm5GU1dZWXd0YjhQOTR2OUkrYi83YTFVRVcvMXRRNWpFU1ho?=
 =?utf-8?B?blRLbWE0c29Wb3hERGtOeGRrVW5td3pvc1JQKy8wQWlOaTZjL1Uremwxc2Qw?=
 =?utf-8?B?S3lQMml2L0NIZjJJckxIdkxsN0FSRUdSWEZ4ZFMzdjBiandKbjhGU0JmbmVU?=
 =?utf-8?B?dmFydGdVSlg4aW12R0hTcUlEZnpndUtPRUo0OUp5Vlh2TXJPcUZLRzFoanNV?=
 =?utf-8?B?UkU1TzEwenBXMWtTek96bkNhaWdLc0hMdXo2RVVrUkJ5QUNxaFZlQkVheVY0?=
 =?utf-8?B?TDhFRW5zc3ZGYmxydkJYNHBqWUFaQU9HUGdWcUtBRVpvNFNRbU1BSWFKeEky?=
 =?utf-8?B?WThRdWU4bklndmRPU3lWaTdHblVITHdneDkxZ1FOcWNVQmZJSmgwQTBhRTZL?=
 =?utf-8?B?VG1tUUNzTUFjS3FkZnVEK2VIMjZsM0U0QWlGdWFwSjl0RE1XcHFER3lTRzRt?=
 =?utf-8?B?UEFWaXRKOEV6b0dpQ01Kc21ySkZlL0dhazVHc044bEZIQnN5V2dWN2Z4Y2F1?=
 =?utf-8?B?cGlsbU5oMU9WZjBnbmJvNEpYYkc3akROSFYxQkxDQ3lTYk5nb09NS2NQZ0xx?=
 =?utf-8?B?YVlib1d4VFJPQUtNU0Y2WTRPQjdZYU5FbG9sRlJHdTk4WTBMMW1jems5Tkpy?=
 =?utf-8?B?Y3R2RUt6YjdOZXZ4UEhxcnpxbjd3ZEFMQ2hIZEdoMGlZMC9JTmp4YkxnbTBn?=
 =?utf-8?B?eHpxcE9Bam04SnBQUkN1RWNvZm9nbjJhV01JdGxlN3NjRXVDY0RaditSSTZE?=
 =?utf-8?B?dG5ydy9pSktPVGd3cTFOVE50S01STlIyZ1ZWcklsb2lONmRNbis4dzZ0bzN4?=
 =?utf-8?B?eE5hUUNWRHd3ZHBuRTdIL2RIMnBDLytzK2FHcHROY3R3dlpEakRnRHNTQktB?=
 =?utf-8?B?NzBlQVJIdmRESHhnM0NPcG1scC9FZUswOGsrcVk5d0R1djBhWm1rVDV3dFVq?=
 =?utf-8?B?THJ5SWlUbCsvV2V6VGRyMHVYVXpFeTFyTGdCblFzQmx3L2VSU3V0WGVHNEpG?=
 =?utf-8?B?aG1YY0NJY0RUNGhMZlZGZ2NZMWhvQTN0dGoxTitwajAydkNNclBpMktyWEh3?=
 =?utf-8?B?TEl5bmxYRmFFdHVCYVRES01ENngvcFV3aDF6VVFydy9qUnp2QkJIZ1p1RzdI?=
 =?utf-8?B?bjN0VzQ2bHNRK1hKK1ZkL1VQemZpSUU2NDRxdmpqNWk5Z2Rka0oxMHkzMFNv?=
 =?utf-8?B?TXFQN1lWUmE0YW9kdExDaXlDM0hNZnFuTzJkWFlia1pWVFlRcVM0M21QUkZ1?=
 =?utf-8?B?dmFQd2p6clRZL0ZPZXdpNHFpQzVzNXgyMlNxcStMUzhOL2txbUVLUmxYb0I0?=
 =?utf-8?B?OW1WNUpCOUgyeVZtNGswVkM4Z3dQc3VBSG1Td0ZwRm9aNUJJTWRPZ09QUWF4?=
 =?utf-8?B?WTdrc2Jua0NVSU9CdTNPWm80aWxZdzhYK25BV1hIVXVEanRmWDlBOEJDUGJw?=
 =?utf-8?B?L1U2Tko2Q0FJWTFhT2tpTENOK0xpOW5KcnV0blNUWjNVS2tSRmpKQmUzeDRk?=
 =?utf-8?B?eWNBUGtMclp3QytadCtSekJjS29UV3RMTlg4dlhxeUJmaThmcExlQ0dsOUxl?=
 =?utf-8?B?R3hsU3RBdnRDZHFkY2FaMWV4blhWNHdwTTV4T0ZMRER2dlpQdmlEZU1ETHJM?=
 =?utf-8?B?VktZWC9UcVBVc2tQNjNjMWlyWForcFJEMmxVQ0RuMlNIL1M2TkkxZ2dZdEVt?=
 =?utf-8?B?djd4NFRaTno0akhBSjk2T28rYnJ0S3d1UW1NRkRHVjlwVnR0ODZJRGFjTUll?=
 =?utf-8?B?b0xBN0l6REN6Vm45dGtSWGRsTDNMV3FBb2RTT0g4WjhNVjVVdHVIRW03a21r?=
 =?utf-8?B?bVBOd3pRd1FneGtGSmRFSWlXcWtyUU5xUHorRUxEQjZiNjJQeldqMVZHRzAv?=
 =?utf-8?B?Z0xRaDV4S3NxR2tKZ2lvSkZlSjh2K1BaMFA0MGN0WHlhajhNeTJyZGVaY0pm?=
 =?utf-8?B?aFNnQnN4bEoxWk5QazIxaTdjS1dGUlpmbzIyMlFvS0N6SmlFUHA3Q0dHQUE5?=
 =?utf-8?B?VE1oWWFUSnJjcWhVOEE3UVVrYmsvRnpTTUtEK0lFNWxxS2ZONnpMdHJQei8y?=
 =?utf-8?Q?IychVmx5goGXg1/2R54PmR1rx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BF88822406149429AB56F3812877337@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d38d094e-40cd-41fe-7aaf-08dc3ead9ba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 13:50:54.0710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6TYwStb8l7e6mM5/lEM11BTRqRju43iYR/29HXF/4FvBl7vLpJC9Z5R6RiAiFz9zM8KjK2Xq/NGS0PcNluUeLIfHEdeZ4x1ETAm+jT6JH5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2723
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzAzLzIwMjQgw6AgMDM6NDAsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBnbnN0YXJrQHNhbHV0
ZWRldmljZXMuY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVXNp
bmcgb2YgZGV2bSBBUEkgbGVhZHMgdG8gYSBjZXJ0YWluIG9yZGVyIG9mIHJlbGVhc2luZyByZXNv
dXJjZXMuDQo+IFNvIGFsbCBkZXBlbmRlbnQgcmVzb3VyY2VzIHdoaWNoIGFyZSBub3QgZGV2bS13
cmFwcGVkIHNob3VsZCBiZSBkZWxldGVkDQo+IHdpdGggcmVzcGVjdCB0byBkZXZtLXJlbGVhc2Ug
b3JkZXIuIE11dGV4IGlzIG9uZSBvZiBzdWNoIG9iamVjdHMgdGhhdA0KPiBvZnRlbiBpcyBib3Vu
ZCB0byBvdGhlciByZXNvdXJjZXMgYW5kIGhhcyBubyBvd24gZGV2bSB3cmFwcGluZy4NCj4gU2lu
Y2UgbXV0ZXhfZGVzdHJveSgpIGFjdHVhbGx5IGRvZXMgbm90aGluZyBpbiBub24tZGVidWcgYnVp
bGRzDQo+IGZyZXF1ZW50bHkgY2FsbGluZyBtdXRleF9kZXN0cm95KCkgaXMganVzdCBpZ25vcmVk
IHdoaWNoIGlzIHNhZmUgZm9yIG5vdw0KPiBidXQgd3JvbmcgZm9ybWFsbHkgYW5kIGNhbiBsZWFk
IHRvIGEgcHJvYmxlbSBpZiBtdXRleF9kZXN0cm95KCkgd2lsbCBiZQ0KPiBleHRlbmRlZCBzbyBp
bnRyb2R1Y2UgZGV2bV9tdXRleF9pbml0KCkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBT
dGFyayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiAtLS0NCj4gICBIZWxs
byBDaHJpc3RvcGhlLiBIb3BlIHlvdSBkb24ndCBtaW5kIEkgcHV0IHlvdSBTb0IgdGFnIGJlY2F1
c2UgeW91IGhlbHBlZCBhbG90DQo+ICAgdG8gbWFrZSB0aGlzIHBhdGNoIGhhcHBlbi4NCg0KVXAg
dG8geW91LCBJIHNlbnQgYSBSRkMgcGF0Y2ggYmFzZWQgb24geW91cnMgd2l0aCBteSBpZGVhcyBp
bmNsdWRlZCANCmJlY2F1c2UgYW4gZXhlbXBsZSBpcyBlYXNpZXIgdGhhbiBhIGxvdCBvZiB3b3Jk
cyBmb3IgdW5kZXJzdGFuZGluZywgYW5kIA0KbXkgc2NyaXB0cyBhdXRvbWF0aWNhbGx5IHNldHMg
dGhlIFNpZ25lZC1vZmYtYnk6IGJ1dCBmZWVsIGZyZWUgdG8gY2hhbmdlIA0KaXQgdG8gU3VnZ2Vz
dGVkLWJ5Og0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+ICAgaW5jbHVkZS9saW51eC9tdXRleC5oICAg
ICAgICB8IDEzICsrKysrKysrKysrKysNCj4gICBrZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5j
IHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXV0ZXguaCBiL2lu
Y2x1ZGUvbGludXgvbXV0ZXguaA0KPiBpbmRleCBmNzYxMWMwOTJkYjcuLjliY2Y3MmNiOTQxYSAx
MDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdXRleC5oDQo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvbXV0ZXguaA0KPiBAQCAtMjIsNiArMjIsOCBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9jbGVh
bnVwLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L211dGV4X3R5cGVzLmg+DQo+IA0KPiArc3RydWN0
IGRldmljZTsNCj4gKw0KPiAgICNpZmRlZiBDT05GSUdfREVCVUdfTE9DS19BTExPQw0KPiAgICMg
ZGVmaW5lIF9fREVQX01BUF9NVVRFWF9JTklUSUFMSVpFUihsb2NrbmFtZSkgICAgICAgICAgICAg
ICAgIFwNCj4gICAgICAgICAgICAgICAgICAsIC5kZXBfbWFwID0geyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+IEBAIC0xMTUsMTAgKzExNywyMSBAQCBkbyB7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiANCj4gICAj
aWZkZWYgQ09ORklHX0RFQlVHX01VVEVYRVMNCj4gDQo+ICtpbnQgZGV2bV9tdXRleF9pbml0KHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKTsNCj4gICB2b2lkIG11dGV4X2Rl
c3Ryb3koc3RydWN0IG11dGV4ICpsb2NrKTsNCj4gDQo+ICAgI2Vsc2UNCj4gDQo+ICtzdGF0aWMg
aW5saW5lIGludCBkZXZtX211dGV4X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXV0
ZXggKmxvY2spDQo+ICt7DQo+ICsgICAgICAgLyoNCj4gKyAgICAgICAgKiBzaW5jZSBtdXRleF9k
ZXN0cm95IGlzIG5vcCBhY3R1YWxseSB0aGVyZSdzIG5vIG5lZWQgdG8gcmVnaXN0ZXIgaXQNCj4g
KyAgICAgICAgKiBpbiBkZXZtIHN1YnN5c3RlbS4NCj4gKyAgICAgICAgKi8NCj4gKyAgICAgICBt
dXRleF9pbml0KGxvY2spOw0KPiArICAgICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+ICAgc3Rh
dGljIGlubGluZSB2b2lkIG11dGV4X2Rlc3Ryb3koc3RydWN0IG11dGV4ICpsb2NrKSB7fQ0KPiAN
Cj4gICAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMg
Yi9rZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jDQo+IGluZGV4IGJjOGFiYjg1NDlkMi4uYzll
ZmFiMWE4MDI2IDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jDQo+
ICsrKyBiL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMNCj4gQEAgLTE5LDYgKzE5LDcgQEAN
Cj4gICAjaW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvaW50
ZXJydXB0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnX2xvY2tzLmg+DQo+ICsjaW5jbHVk
ZSA8bGludXgvZGV2aWNlLmg+DQo+IA0KPiAgICNpbmNsdWRlICJtdXRleC5oIg0KPiANCj4gQEAg
LTEwNCwzICsxMDUsMjQgQEAgdm9pZCBtdXRleF9kZXN0cm95KHN0cnVjdCBtdXRleCAqbG9jaykN
Cj4gICB9DQo+IA0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKG11dGV4X2Rlc3Ryb3kpOw0KPiArDQo+
ICtzdGF0aWMgdm9pZCBkZXZtX211dGV4X3JlbGVhc2Uodm9pZCAqcmVzKQ0KPiArew0KPiArICAg
ICAgIG11dGV4X2Rlc3Ryb3kocmVzKTsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBkZXZtX211
dGV4X2luaXQgLSBSZXNvdXJjZS1tYW5hZ2VkIG11dGV4IGluaXRpYWxpemF0aW9uDQo+ICsgKiBA
ZGV2OiAgICAgICBEZXZpY2Ugd2hpY2ggbGlmZXRpbWUgbXV0ZXggaXMgYm91bmQgdG8NCj4gKyAq
IEBsb2NrOiAgICAgIFBvaW50ZXIgdG8gYSBtdXRleA0KPiArICoNCj4gKyAqIEluaXRpYWxpemUg
bXV0ZXggd2hpY2ggaXMgYXV0b21hdGljYWxseSBkZXN0cm95ZWQgd2hlbiB0aGUgZHJpdmVyIGlz
IGRldGFjaGVkLg0KPiArICoNCj4gKyAqIFJldHVybnM6IDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0
aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4NCj4gKyAqLw0KPiAraW50IGRldm1fbXV0ZXhfaW5p
dChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jaykNCj4gK3sNCj4gKyAgICAg
ICBtdXRleF9pbml0KGxvY2spOw0KPiArICAgICAgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoZGV2LCBkZXZtX211dGV4X3JlbGVhc2UsIGxvY2spOw0KPiArfQ0KPiArRVhQT1JUX1NZ
TUJPTF9HUEwoZGV2bV9tdXRleF9pbml0KTsNCj4gLS0NCj4gMi4yNS4xDQo+IA0K
