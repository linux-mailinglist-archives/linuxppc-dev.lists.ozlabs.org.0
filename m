Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5DB47C6D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 19:44:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJQN256ffz30Hj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 05:44:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::603;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJQMV1R7Pz2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 05:43:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEuJfnI2Kfv6jk/e9HWg+yu8bPjy4aOqPZges2qAPgvku8DPDklSVgxS53EV/ugHSm1SXHGRhOVHgfvcZdZb+aef2pyO0V9GfxpTq3mVxQ3dlJiUDeUNEnf6qw/rhTiZvxkJQIPNwRnT2IkWt2h4Ie4wXKM7Mnf7ZXvJvrbd7pjqsSkhdzr0Fu7m8kn4jUkLMSpUoCvvv6qi8bwOBZJwZU+d/H8L30E2PeNgGuTnYQf2Ns+tnxsfxNpCvz3qx4IzzSovC5Hc2wIzmsawrJ45tN81XEA3sEzBuvtQsJjdvlyF0UFgj9gFhWoA57VHMIODSFxtzOy2AkORjl0S/Pekdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF15h5PQROPa9k6r8k1V5SeA3gBxo032ZwvN5HdZRoM=;
 b=MDZ8BVZEn3uhEn2sPAgeDlu0SoptpExIydPx/APgH6QvoNPko1t6tiOuzfaPGPnPubCGPyEBkbiEBE62Quc5hpwFypRwPBm9NlHvYnbjsYINa61btKbNY9Nb8Nx6IEczUCRgkA9o8M6g35RNKhKEBbSWAuiOh84DXqNoHgQIK0aB4robIp4I29KlITRgeG19tc8c8GkzOBz7/gr5uW0VnS92zhxNdVWSA3sqgqqwJ5z55W4QKq0vtsOatwbsrTIhMXfQGp4k1a0UE7I+QuP52Trh6XDKuwOXzPejk3gC8ZZI6r45WlyxBURvvC3xiOWJyCwz5SSQygui73UVaLs1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 18:43:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 18:43:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "guoren@kernel.org" <guoren@kernel.org>, "will@kernel.org"
 <will@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "juri.lelli@redhat.com"
 <juri.lelli@redhat.com>
Subject: Re: [PATCH 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
Thread-Topic: [PATCH 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
Thread-Index: AQHX9ozJVfpym6S03k+Oh//r03h+haw9SBuA
Date: Tue, 21 Dec 2021 18:43:11 +0000
Message-ID: <c084037b-1f30-53be-bf6b-06e3401b20e8@csgroup.eu>
References: <20211221170057.2637763-1-guoren@kernel.org>
 <20211221170057.2637763-5-guoren@kernel.org>
In-Reply-To: <20211221170057.2637763-5-guoren@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0112f56d-6aaa-447a-f1c7-08d9c4b1bd8d
x-ms-traffictypediagnostic: MRXP264MB0279:EE_
x-microsoft-antispam-prvs: <MRXP264MB027909C790C9F24AAC7AECE5ED7C9@MRXP264MB0279.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:418;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nFRBa9aRgJqfRcJAcEZNSajvhurnooUpsFy5jQhMfpVdKM0Xs920ocMzvT1lLZwseIOBQDzD/Wy4VgsoL2MiQyajoO/kkVMvW2mIWrPC5GObG6fHXARBpC0skTqzHiUaQz16ojoqerNVdEDwmLcynBbg6MLR2i4KGUlBm7Wn6ATWtbQtzMjMKa9vl3l8llSfGqq91qEYg9DWxohOsWbK2f/j8Sf5FWjZYLhTxBdMNCPL2qhcYS2snYQ/O7W37/RVAYL7e1cuUzgYSV+TRuyk6RgDx2jDQa8IoF/NzE8pCHj+1SVEPFK7xdHg+xGT6UO8fQTBqIxCxbACtjsvgxjW89zWcQaXsb6UUVH5nWScXtFNRgbHP0hbEQVBX1uwwNxdZYVIBGUTAxsyAtV0d3KAg6twR2gaVfWtJwbHraC/ZiPcANnm15X0QKqMqeNA9tlzKjjh6nh9JkqputIL2SFUDzqqKmgXEcnlPcDAH79ySGeHLWLpdv5qr2+6X9xzggGPE9hi02sbqbt9W3l4+HmJQ3XX3X4PXZkmlYHmwOUx5cikV8RW8KHjVkxen9N1J11eWC7Nu836HBMZiIcIAYqjwNISyg78av8yJtwvhuVYCmi7PxkkVdep13mEn8DeXCqTYcWRKkzNGphaRgSMWHByUooVRD9nM3p4IYFAB6ZofyUMFdJ5ps4Z6DOCEFJs7WSNqZEo2tT9ww076mHleuT5E0XErl7A0YFCSwwaWhhabixqv7SwievMK7/V2fvW6lQ3VqAnzqsxd5xQMayhck9Kew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(54906003)(6506007)(110136005)(38100700002)(122000001)(36756003)(7416002)(508600001)(5660300002)(86362001)(2906002)(38070700005)(4326008)(76116006)(44832011)(31686004)(316002)(6512007)(8676002)(66446008)(64756008)(66946007)(83380400001)(71200400001)(6486002)(8936002)(2616005)(66556008)(91956017)(66574015)(186003)(66476007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3NPNkxIZUo2cWdBSWNDYUljcEtoK0RLZkJ6bTFya2dpYzlBaUoydlJwUTM0?=
 =?utf-8?B?Q3dXWHZHbzE5dHpMRXBjQzhLUjRxeFBUcTAwK3lLYSt0NVVzVG9LTkZkYzMz?=
 =?utf-8?B?RTJ3TTRzZ3VLME5WU3NzVVMxYVRaaXNSUGRYbVVtTFhWTmxqVGVGWFNmY25v?=
 =?utf-8?B?K1Q1dnY0cGt6YjNnODFDMWRiRUhja24vTEFjL1V4b3lpbnVRakxCcjRNWmxM?=
 =?utf-8?B?aE5kQWZTNHBnbEU3bjVrZ05ONHFVc2NQbCtIYU5PUld6TVcxaUVWT0I0R0xP?=
 =?utf-8?B?VXp5MCtZVUlSdjVqRkI1cmhERlVUZEEzdWxGUUhyK3k3U0k4TWUwSXh5NlhE?=
 =?utf-8?B?aXNVR2dMcm9EQU9ScUlORDZjMnFoV3BtdlJUempZV3g1TUZyVTNnR0JNRlox?=
 =?utf-8?B?bkl6M2Q3RkhCV2hBSzN0SHFnWWRRekluOVNqR1ZpYUhMUmxEd1pzd2J6T3dD?=
 =?utf-8?B?UnpnbjA0by96aU13REZRK2Vwc09TTlo0SGpRQzhwMTYvUTRsS2ltMS9aczBR?=
 =?utf-8?B?OHBXdTI2Wi83RFJmbDBJaFVqdXZxUTAzcGNzeVpjK0E2SHJjY3Z3Y092djJS?=
 =?utf-8?B?aTArMTM2OHNoTE9ZQTV2bXpaNHVoaEo3QlRNdnJXUzYvRzRPSVB3Sit1dHMr?=
 =?utf-8?B?WG5XVlNjZWNjRUQ3cHE4Q3I2Q1N2M1B0c2pWNC9QZVFaRnBQaHJHWmxXeUY3?=
 =?utf-8?B?dU95WTh5Z2JrVlRtaGY2Z3Qza2wxZHJ2ZXIwSGs2NkFKeW9kTkNTUnZMcTNu?=
 =?utf-8?B?VlgvQzlZNW81ZzYxZFN0S2wwdGJXb3lDYVk5bi8vK0dvMFgyVEx1RFQ0aVZM?=
 =?utf-8?B?aDNXcDdobkl0YjlFdDl3QlJEQW5rUWpOdmg3L2NjZW5IU0YwUHZPa0NuaVBW?=
 =?utf-8?B?dmpnT2FVM0RKYTB3KzJGSktTWnUybURwcmtJMUJKcWlDZTFIZjVJSzhnT2NX?=
 =?utf-8?B?b080K0xycHU1VUs3TzlyaURHK1Bxbk5wYVVIeDdmdjJ3YUc4N2dXeGIza3Zz?=
 =?utf-8?B?YkRXY3hoQ3pzM1hPUXdSNkNVRjlNUjRiN0Z2ci9iSHl5TjB4aFovcEZPdnhX?=
 =?utf-8?B?cVFQeEZPMUEzRnhxUWx4L3FmU0szT3piaWpIMk5RRFRPSFdxRUZuSWZHZys0?=
 =?utf-8?B?Rjg2MUU4M0tScFFSNEMvazM1QnBLb3orOGJKNzNHQUloZEdRRmVyNXIrYVhH?=
 =?utf-8?B?QldLNXRqVHd2aExtaUwwVGdJL1pQN2w5L1V6T2l0Q1d6VmtHMU1uWWhlcUJN?=
 =?utf-8?B?OUtnWXV5b1R1WlpEaFpod1ovN2dTNklodlo2TU9QWjVEdGIyYldDQmdvYzBR?=
 =?utf-8?B?T01VRkhxV29ZcTRHVWJIMFBMald4d0MzeWNCMVlGME9hbXVJN1BNQVZrYUFZ?=
 =?utf-8?B?NkhrQjc0KzV4aVpZbG5lZ1V6Wjd0aXR2S1JBZHJhc2k0YmdJYUJ2ZEdNMmd2?=
 =?utf-8?B?R1ErT2t6ZHJZMDhMYnB3M05rZTh3L0pXeHFJNVdxZWNqS3JVZGUxZWkveXRn?=
 =?utf-8?B?WldtSlVNTys4YWtXejh5QkFHU0JPTFpESXByTGhhaXEySm1IRjlyS0tNOGYr?=
 =?utf-8?B?aFFsMDgvVmY2Z0c3RjVnMlpZSEVkeEkrY1NTQVpUekRQbXNjSG8vRDZUN1ZF?=
 =?utf-8?B?blhGcmFZdlppdDdkVE0vdEFFeUdUZDdsTUJhZlFEa3hHdWh2WmF5TmRqWUk4?=
 =?utf-8?B?V0NhVVF3N0RpblQveThpSG9wTHdkK0c2bnBkamlJU2pmT0JMa2xSU2ZmbnVY?=
 =?utf-8?B?dUNvbnBzUDU3Z2trSXZtSitsSTdFT2R1UVk2NGNtYUtjQ2dkL2F2YnlaOGhQ?=
 =?utf-8?B?dnVzSDJTQi9tVXF4VVRSM1ZINGtUQjFDa3F0ZmFUSkozYmNjZ0xwQmVpOTIv?=
 =?utf-8?B?QjI0UmVFLzgxaDI3S2RGTCtEQTZBcmlSYk5GNHVMR3g3Ynh0cVc3NWZETnhY?=
 =?utf-8?B?ZkhsZUlTcVltejUzTWFNb0xENVdtQ0RWMXJxNlJoNVZuMTNvMDdsd2owYlJB?=
 =?utf-8?B?U29HNWU4a2pxY0hhWkVLS2Y3cUVlMFBud0REUnRPL21jRUZCVWJ0anVNT051?=
 =?utf-8?B?Q1VPaXNjenFqQVI1UU9zakQzY2J3Y2E3eFUrZHZ3YnFLYjh2ZXRZWXd6d29F?=
 =?utf-8?B?aGwxeDdaZG5YMVR6bDZxU3c1WitMR2RaajVyZXlSNUx3VFVhWmpNWFUxZWcw?=
 =?utf-8?B?dGJwS0FLa05iYlY2cldFdG5YdE1EZU8zZDRPYnZvMndGZ0xVTVFySVM2SlRD?=
 =?utf-8?Q?79mfkFpqHZGmZ2cCM0fY39yXd+Z7Cu4V93naUVKShk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C69A474A403D44B9F1F8376BDBEAF8B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0112f56d-6aaa-447a-f1c7-08d9c4b1bd8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 18:43:11.7463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZqVmfyhq88vSuU9i1j+Hf9nXYmFgXhV0RNx0J9zxUlx77eumllRawNDoTJaA3gOhysNTfTKt6TDTMyl0MqCPIDZH7diM9okcLYqhtyuNjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0279
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "sparclinux@vger.kernel.or" <sparclinux@vger.kernel.or>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzEyLzIwMjEgw6AgMTg6MDAsIGd1b3JlbkBrZXJuZWwub3JnIGEgw6ljcml0wqA6
DQo+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4NCj4gDQo+IFRoaXMg
bWFjcm8gaXNuJ3QgdXNlZCBpbiBMaW51eCBzY2hlZCwgbm93LiBEZWxldGUgaW4NCj4gaW5jbHVk
ZS9saW51eC9zY2hlZC5oIGFuZCBhcmNoJ3MgaW5jbHVkZS9hc20uDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS90YXNrX3NpemVfNjQuaCB8IDYgKystLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGFza19zaXplXzY0LmggYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vdGFza19zaXplXzY0LmgNCj4gaW5kZXggYzk5MzQ4MjIzN2VkLi43ZTJl
Y2E0ZmFjNGQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS90YXNrX3Np
emVfNjQuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGFza19zaXplXzY0LmgN
Cj4gQEAgLTQ0LDEyICs0NCwxMCBAQA0KPiAgICAqLw0KPiAgICNkZWZpbmUgVEFTS19TSVpFX1VT
RVIzMiAoMHgwMDAwMDAwMTAwMDAwMDAwVUwgLSAoMSAqIFBBR0VfU0laRSkpDQo+ICAgDQo+IC0j
ZGVmaW5lIFRBU0tfU0laRV9PRih0c2spCQkJCQkJXA0KPiAtCSh0ZXN0X3Rza190aHJlYWRfZmxh
Zyh0c2ssIFRJRl8zMkJJVCkgPyBUQVNLX1NJWkVfVVNFUjMyIDoJXA0KPiArI2RlZmluZSBUQVNL
X1NJWkUJCQkJCQkJXA0KPiArCSh0ZXN0X3Rza190aHJlYWRfZmxhZyhjdXJyZW50LCBUSUZfMzJC
SVQpID8gVEFTS19TSVpFX1VTRVIzMiA6CVwNCj4gICAJCQkJCQlUQVNLX1NJWkVfVVNFUjY0KQ0K
DQpJIHRoaW5rIHlvdSBzaG91bGQgdXNlIHRlc3RfdGhyZWFkX2ZsYWcoKSBpbnN0ZWFkLg0KDQpP
ciBldmVuIGJldHRlcjogdXNlIGlzXzMyYml0X3Rhc2soKSBhbmQgYnJpbmcgYmFjayB0aGlzIG1h
Y3JvIGFzIGEgDQpzaW5nbGUgbGluZSwgc29tZXRoaW5nIGxpa2U6DQoNCiNkZWZpbmUgVEFTS19T
SVpFIChpc18zMmJpdF90YXNrKCkgPyBUQVNLX1NJWkVfVVNFUjMyIDogVEFTS19TSVpFX1VTRVI2
NCkNCg0KPiAgIA0KPiAtI2RlZmluZSBUQVNLX1NJWkUgVEFTS19TSVpFX09GKGN1cnJlbnQpDQo+
IC0NCj4gICAjZGVmaW5lIFRBU0tfVU5NQVBQRURfQkFTRV9VU0VSMzIgKFBBR0VfQUxJR04oVEFT
S19TSVpFX1VTRVIzMiAvIDQpKQ0KPiAgICNkZWZpbmUgVEFTS19VTk1BUFBFRF9CQVNFX1VTRVI2
NCAoUEFHRV9BTElHTihERUZBVUxUX01BUF9XSU5ET1dfVVNFUjY0IC8gNCkpDQo+ICAgDQo+IA==
