Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E78448E52F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 09:04:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZv3F1Wrxz30Q6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 19:04:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZv2k3pC8z2x9Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 19:04:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoSQn3pvFXWWU0e5510p6ehnNxaDe3MdR2/vmhVen1lC3zq3o0wPeTunIeFCH6xcla/ujHc/zYRUYq5MQwBty7PkweLl3VwtXo9JZVGukphxRo1RI1GikSHq4bF9QPz4Uio2R4AeNi87H8KOZff04iJ7TMFLtT1UHD7NexgLCwmWMiNizRy2s3RUAuo7LpOcFpwzynPrNFTPxc64HkZoqhvKbyEsY6FfqHrQwtrDBeJ9zJM4jiw0V3HrAK/IkdbOqTWFVnx+PjXmC27fVB0Kjz78iQtyDkgb1q88XL3j7Tw/SEtq9i2DnsbVW1wfx2/3P698LFYoL73UGFBe37aZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxBvhL/L6jsFNN+5XblDlL03RFdv003p3mAQf87yxvE=;
 b=CNH3/2Irqwl9nfNyD2Bn8lVB6DxJ9o4jG3SisNNuWJ0USPcFvlBHUjlyZwaYwxPZweORlX7+nkq89B3pQQZUn8ipTMMSr/b8s6ZQrOZF4pw62yfM5qAhaZldBVVmoMuYBXs20spveI9gjOfepHs79JdURu+h1CHwP83FhgSaWTxuYxdpXd5fMDmb60FNJCs05Y3/IaUuWIl3L/02QkmplZhGEH7B59kBA8nUQl61qqtEDUkCWkqn5sO2PkGTP6aYet2GO/V/RLiMnOFdzYBqC1z0DPcVi3tijzrv81K9oZsxWqlhlwaobDtuR6XIPAa+IImdhXcTAW7MRMgPJPhBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2455.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 08:03:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 08:03:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul
 Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/bpf: Always reallocate BPF_REG_5, BPF_REG_AX and
 TMP_REG when possible
Thread-Topic: [PATCH] powerpc/bpf: Always reallocate BPF_REG_5, BPF_REG_AX and
 TMP_REG when possible
Thread-Index: AQHYBh2+PoHCxCSIk0C7aiUG8hGF4axiLOEAgAABZQA=
Date: Fri, 14 Jan 2022 08:03:47 +0000
Message-ID: <f6a5027a-6f3b-ee50-3439-56b5948d860a@csgroup.eu>
References: <b04c246874b716911139c04bc004b3b14eed07ef.1641817763.git.christophe.leroy@csgroup.eu>
 <1642147004.dum5th9cvl.naveen@linux.ibm.com>
In-Reply-To: <1642147004.dum5th9cvl.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 210e1282-2d57-4afb-7cac-08d9d73464b8
x-ms-traffictypediagnostic: PR0P264MB2455:EE_
x-microsoft-antispam-prvs: <PR0P264MB2455DE3E323FE30C66122362ED549@PR0P264MB2455.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VgpaecC+e3niUTtEjeQw38H0mqN0UOHAjnq2detW38KfJBY105h1BWY341BaNJrat+nEeznchTLshcH/GvLihf0LDYI54MCrPuyzG0QR906WqoyTZhuwCoGNbjGehJX0GIYx7yNKn7/mo05bob3UBjVa2aQVg0Ag47Al1tPbdXT8cliq9x8EjA+PX2St2Ivhy+e/soLYZcMnRldegCGKKX+VDxDF2PAlOQ3q6L9qhs6x1GfkSjQy0vArTdNCxAwFXP0jEJcDIebMKJTQrgAWcDyYUmFoHl/OqEHNSUZZ40h34rirfe2phJFUJyNfKjhZlGvV56XP6HkNq+mfkFYAQN+Sphb3we8PiXOKBddUjCjYvG2+3BUrgGDPFfrRY1/ovzD5NQrfJ3gUHLaa+FxFygowlF2zFQlPKVc78+aNgsuitUoadbP/GuEtNm/teFCaEvy6ROfNMR5xzkEFrzQ7QO+ad7sP8jdDBKoFrXRejql4TxDc4PdFrAQFgQyiw0uExb7c07AOyX1dp1mjDfmyL7UbEVpYejyzEDE5qDIX7LBGHbIPq6bf276FTXyres2ct5t3INRt7Eed1+4OuWDKB++jmzMjT3VVmG4NaKiY9Q7wl4OtgnnzpHmfA0uxVu5dFJQTjs+x+6QnflpKvVyLtUqIq+9ATNb+lFtUsYNHbOU0jzDdTRyoVyh/r72K6nYv0Ji4cMwaK2pvLsrlS2q3VpACqMGm24q7tyW1k9e3rkHTyZifk1lBLyGJGsYiaCUIJho3PHddCTmZogHHD4K92Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(83380400001)(26005)(5660300002)(186003)(38100700002)(31696002)(316002)(66476007)(8676002)(36756003)(71200400001)(122000001)(31686004)(110136005)(86362001)(91956017)(66446008)(6512007)(66556008)(8936002)(38070700005)(4326008)(2616005)(44832011)(54906003)(2906002)(6486002)(64756008)(76116006)(508600001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkJJaEdzTzVsQU9TUitucG1JdzJHcGJ1NkQwR0dub0xXNEVMMnFvTC9ZMUJ4?=
 =?utf-8?B?Q3BqeXVQTndIcUphT1hJZFQwUmZtcmFUQmxKU2tCcWZkSEJUUVVhWTNHVkRT?=
 =?utf-8?B?Z2pUaTFiTVIyejhuclR6NjlIQi9oZnAzdFlSamNCbXFRK2tkTjI4SXU3NEQv?=
 =?utf-8?B?OS9oaEoydWZKL3Q4eEhoOXVIRUdsd0RZQ283am8xcWJYNk1tT002OFdxZmFO?=
 =?utf-8?B?Z3RxV3FsNUl4QVBMaE9ranJNUEYvbnQ2QmxyUURLeDZQQjNCTC9mNWFEaTR5?=
 =?utf-8?B?V0tuWFRwYlIrOXVoWkZRMkJTajhkeXduRDc1c1VVK01MZk5MYzgrNWh2NXNp?=
 =?utf-8?B?azBvc1hmQXVvY2JPaldSd0dCbS9GcmFLY1RsOWxJQ003TkFMNm9wR1NNMExH?=
 =?utf-8?B?Wks2a2ZocElXZTFQTlp4K3ZYVkpvSk5HaEhicVdabk5pTVV1ZlRvT05iZmMz?=
 =?utf-8?B?YTJRbXU4Mmw1bGt0Z3dhaThSdy9KeTI0K0F1YUtUWjFJdWNuQ0UvTTdrT01D?=
 =?utf-8?B?OW5pV2tBWjhSZjVaTFVJRU9POGpBV0UyL21hMmkzYm9Dd0FHbzJ3c1A1MWpJ?=
 =?utf-8?B?NE4vMitSL0RMODFkczFibXkweGMrdDllSkZVVXFCWGVTR1g3cWN3cWo3NVBp?=
 =?utf-8?B?d3dyeEt6b0lOMjM2cTBPQi9wVFljVFhodVF0V2tqdUU4OUJxV3gwY0Z3Skgv?=
 =?utf-8?B?dXdEWDFscGticW1vMkZlaFZtTVVRYUpzL0hDZVJDZWM4elp0dnF5M3JnMjJQ?=
 =?utf-8?B?SU55RnZ6Y2NwNXFOOGpOUjdMNGU3c0tKdjFveEtjOFNJdVAvMytrVHNLRmty?=
 =?utf-8?B?WkR6c2g1d2l1aGZLd1NmNmdZc0ZVMElQSzM4MVd6VVpmU3VIbFZDemxmMGlY?=
 =?utf-8?B?dlRKYmozVGlHMkFYRnhibHR4elRsMTMxZHVLZ1A2amM0TWsxUmpxVXdhcGM3?=
 =?utf-8?B?V0NzQytMd1FXUi9mNHZ2TDNIOXRIcEpGM1l5dHpDZ2dIeG5qT0VtMlpBWHhC?=
 =?utf-8?B?eVFCWTdHWUV0cEtyNnpvRkdPbzVhb0d1bWxHZUZuMDdvSldkK252d1dEVWkr?=
 =?utf-8?B?eVpUTHE1M01QRjJ4RmFDSndaNko3MUxXSi9JdTEvTkZ2dEtJQ0JkcUREa2JL?=
 =?utf-8?B?WnZoMys5MEJGdkpsUEt2K3c0WUpkRHE0aUFmN3BrTUhGVEkwNGRJV3c2VXEv?=
 =?utf-8?B?UHd3QWhlSGhVd3NMUENQSDk0cjFyS1ZJMCtEelVWbzdBTTV5a1J2aStGZ2RS?=
 =?utf-8?B?NndzRkxjWWU2WldzOHhOSGdReHJyTEJpcURvbmZ1UU82NCtLVE1Wb3ltNXha?=
 =?utf-8?B?VURTTDF6b1FyeURjeC9pY1lwOXVlVk1jSnR4MjNteDZEMUl5Z0hvNEpBUS9B?=
 =?utf-8?B?UlU4cFdFeGNwb1N5andvRmlZNU9RL3RNWU55YkRncENLdWk1cUFwbWtncTEy?=
 =?utf-8?B?YUxpRnlWU0VQL0dyZTUvbEgzcjM0ZDIwaTNmZlEzR0gzazlDbHFyNDYxWk1S?=
 =?utf-8?B?d2VveTBUT1NLY2drdWk0cFBIR3NhdjJCMWdrMGVjVUJzcFlRSnAzc0o1WXVn?=
 =?utf-8?B?VmsvUjZwR2pyV1hwV1JqT0srSXQyMnpCMk1LVWEwcVlHOGtuc1V5YmswL1NC?=
 =?utf-8?B?amJIRThId3V6aEo3c0V2TEZVWWJYVXZQRFdjNVhVZjBXNyt6aGRpSkRiZkJF?=
 =?utf-8?B?WmNHYzhpcXlrWUNyTXZEVlhnWWVsZjVwMDBMWklKZ3B1OEpHakUrWkZ0cEtl?=
 =?utf-8?B?OHdYUDI0ZXJ3bm9lUXpVMWE0ZE01TGRpMEJEQjRhNkgzZmRwQmNPejgraDAz?=
 =?utf-8?B?cmpad1hNTEZvOEw3UElxUEhDZForMmtJYjV3NUZRTXlBZjUvdndiWmYxUTdL?=
 =?utf-8?B?ZGRqUFVIc0Rod1BHdTJwem9leSt0eUpaWGVVd05mdXRQV25tazNlV0U3Z1h1?=
 =?utf-8?B?S3VUYzZ0T2E0U3NUNDd6eVhjaVRFcFlIYWJNWUZaNjlpaGNDeVhQNW9wT1A5?=
 =?utf-8?B?OEQzU1MvUXoxR3VqcHlUWVhjTFd4RWxOdEhLZEVmMzRDZkFyd0VvN1J2NHFm?=
 =?utf-8?B?L1d5b3VVTlZ3bWFZRmpYcXpiUXJhYjFCQVpNVDdJSTJlSlkrcHdsK0JBNW1D?=
 =?utf-8?B?VHpQRExUVm5hZFJnWDdZQmNXT2hwY2oyK3VnN3U0VFN3SVhjb2pVQ0UyZXBZ?=
 =?utf-8?B?TCtQaTFsaGRZZkt4SWpTYVRRZVFGRUxsVFd5RXVLSWZ6QnNJa1FlRndDZGU4?=
 =?utf-8?Q?7CuhV8LUE89TkdJ/GLf0Jam1vEreqaw8UM6eDz3VJM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AB5E76AA0F7C04FA10BFD3A0A043E37@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 210e1282-2d57-4afb-7cac-08d9d73464b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 08:03:47.6781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4BJ6PjT5u+UXZCsyrq5ZAzj3JjehpftivKz0FrnPhcYLTS5avt5csmGswllmsJzYSAgW8Jiu4S/OMEmGsbNICDWgQkSgocme5hNvNDOxzPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2455
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzAxLzIwMjIgw6AgMDg6NTgsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IEJQRl9SRUdfNSwgQlBGX1JFR19BWCBhbmQgVE1Q
X1JFRyBhcmUgbWFwcGVkIG9uIG5vbiB2b2xhdGlsZSByZWdpc3RlcnMNCj4+IGJlY2F1c2UgdGhl
cmUgYXJlIG5vdCBlbm91Z2ggdm9sYXRpbGUgcmVnaXN0ZXJzLCBidXQgdGhleSBkb24ndCBuZWVk
DQo+PiB0byBiZSBwcmVzZXJ2ZWQgb24gZnVuY3Rpb24gY2FsbHMuDQo+Pg0KPj4gU28gd2hlbiBz
b21lIHZvbGF0aWxlIHJlZ2lzdGVycyBiZWNvbWUgYXZhaWxhYmxlLCB0aG9zZSByZWdpc3RlcnMg
Y2FuDQo+PiBhbHdheXMgYmUgcmVhbGxvY2F0ZWQgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIFNFRU5f
RlVOQyBpcyBzZXQgb3Igbm90Lg0KPj4NCj4+IFN1Z2dlc3RlZC1ieTogTmF2ZWVuIE4uIFJhbyA8
bmF2ZWVuLm4ucmFvQGxpbnV4LmlibS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4+IMKgYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0LmjCoMKgwqDCoMKgwqDCoCB8wqAgMyAtLS0NCj4+IMKgYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jIHwgMTQgKysrKysrKysrKystLS0NCj4+IMKgMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXQuaCBiL2FyY2gvcG93ZXJwYy9uZXQv
YnBmX2ppdC5oDQo+PiBpbmRleCBiMjBhMmE4M2E2ZTcuLmI3NTUwN2ZjOGY2YiAxMDA2NDQNCj4+
IC0tLSBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdC5oDQo+PiArKysgYi9hcmNoL3Bvd2VycGMv
bmV0L2JwZl9qaXQuaA0KPj4gQEAgLTEyNyw5ICsxMjcsNiBAQA0KPj4gwqAjZGVmaW5lIFNFRU5f
RlVOQ8KgwqDCoCAweDIwMDAwMDAwIC8qIG1pZ2h0IGNhbGwgZXh0ZXJuYWwgaGVscGVycyAqLw0K
Pj4gwqAjZGVmaW5lIFNFRU5fVEFJTENBTEzCoMKgwqAgMHg0MDAwMDAwMCAvKiB1c2VzIHRhaWwg
Y2FsbHMgKi8NCj4+DQo+PiAtI2RlZmluZSBTRUVOX1ZSRUdfTUFTS8KgwqDCoCAweDFmZjgwMDAw
IC8qIFZvbGF0aWxlIHJlZ2lzdGVycyByMy1yMTIgKi8NCj4+IC0jZGVmaW5lIFNFRU5fTlZSRUdf
TUFTS8KgwqDCoCAweDAwMDNmZmZmIC8qIE5vbiB2b2xhdGlsZSByZWdpc3RlcnMgDQo+PiByMTQt
cjMxICovDQo+PiAtDQo+PiDCoCNpZmRlZiBDT05GSUdfUFBDNjQNCj4+IMKgZXh0ZXJuIGNvbnN0
IGludCBiMnBbTUFYX0JQRl9KSVRfUkVHICsgMl07DQo+PiDCoCNlbHNlDQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jIA0KPj4gYi9hcmNoL3Bvd2VycGMv
bmV0L2JwZl9qaXRfY29tcDMyLmMNCj4+IGluZGV4IGQzYTUyY2Q0MmY1My4uY2ZlYzQyYzhhNTEx
IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jDQo+PiAr
KysgYi9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcDMyLmMNCj4+IEBAIC03NywxNCArNzcs
MjIgQEAgc3RhdGljIGludCBicGZfaml0X3N0YWNrX29mZnNldG9mKHN0cnVjdCANCj4+IGNvZGVn
ZW5fY29udGV4dCAqY3R4LCBpbnQgcmVnKQ0KPj4gwqDCoMKgwqAgcmV0dXJuIEJQRl9QUENfU1RB
Q0tGUkFNRShjdHgpIC0gNDsNCj4+IMKgfQ0KPj4NCj4+ICsjZGVmaW5lIFNFRU5fVlJFR19NQVNL
wqDCoMKgwqDCoMKgwqAgMHgxZmY4MDAwMCAvKiBWb2xhdGlsZSByZWdpc3RlcnMgcjMtcjEyICov
DQo+PiArI2RlZmluZSBTRUVOX05WUkVHX0ZVTExfTUFTS8KgwqDCoCAweDAwMDNmZmZmIC8qIE5v
biB2b2xhdGlsZSByZWdpc3RlcnMgDQo+PiByMTQtcjMxICovDQo+PiArI2RlZmluZSBTRUVOX05W
UkVHX1RFTVBfTUFTS8KgwqDCoCAweDAwMDAxZTAxIC8qIEJQRl9SRUdfNSwgQlBGX1JFR19BWCwg
DQo+PiBUTVBfUkVHICovDQo+IA0KPiBDb3VsZCBoYXZlIGJlZW4gbmFtZWQgYmV0dGVyOiBTRUVO
X05WUkVHX0JQRl9WR0VSX01BU0ssIG9yIHN1Y2guDQoNClllcywgSSB3YXMgc3VmZmVyaW5nIGZy
b20gYSBsYWNrIG9mIGluc3BpcmF0aW9uLg0KDQpXaGF0IGRvZXMgQlBGX1ZHRVIgbWVhbiA/DQoN
Cg0KPiBBcGFydCBmcm9tIHRoYXQ6DQo+IFJldmlld2VkLWJ5OiBOYXZlZW4gTi4gUmFvIDxuYXZl
ZW4ubi5yYW9AbGludXgudm5ldC5pYm0uY29tPg0KPiANCg0KVGhhbmtz
