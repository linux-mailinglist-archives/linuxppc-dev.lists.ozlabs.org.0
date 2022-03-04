Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2424CD4DF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 14:11:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K97XL2RHQz30N1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 00:11:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K97Wq1nmGz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 00:10:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fy7JCX87QpoYh2A1ZFqcI18HSPTfeKUgTkjh9McJJf9v0a9NCuPVTs6Ssh2a6165JFYD5JwHWAGISZm8uze8PTYzjdTCyvAQR8Bm+6KxJa+JeaU2W2KMZL8wqpumk9JQtGIag2ZvR4Rc26kTqRqbwx0EVcb+QdsUArnVIHqPhivJPjmdc5NbryA/TAihcpuoFvoedZCqJR4c0YcLtP8LwbLvbWuiaqRVLSJxhuir8oajj9kMv7jlxw+e67nE+sBBKZokOV+z4VRO+x5VBanwbD+PK5qtn5IkvKgEWqh0ifMzsfsWb+Cj46Zr4zvVT+VPehFC90moNL7F97k596eorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eMXd85DonIbG7abTHyfRf6O2GWdMWVlAdwlRz1Rr6A=;
 b=HqGrVnE/SrHLBkjvAUbDuOslJptGmvbrpwkyI9tM2vmv9p6/ngPGCrDIheoWCCNW3lFt2VktAo/WKaVdTUHvqGvozbj8HZ/b7ou3YCfAqSzJm5YfC2rACWgg0Jt4E7yFFq0AypmgIqfjtCcu0ADbNmIDpXfjOnINBe5xakMODrqJVHZ7UuC+144QS/MM/yW4uMEKNj2/KbVSYX4G7oOTeArdRNv9hz8Rf9Dg09VT+J/03ZBwvpX+lpOZ+gDaT70jSYWIij68hNJvF052WWCCkeUbqLMwwqmyLrlY7ErGmyoKOPYpqpsp6IN1OSRPJkk17V+xqRKiUyvS+TWitjKpkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2796.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:19::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 13:10:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 13:10:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "cgel.zte@gmail.com" <cgel.zte@gmail.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/sysdev: Use of_device_get_match_data()
Thread-Topic: [PATCH] powerpc/sysdev: Use of_device_get_match_data()
Thread-Index: AQHYL2XgvZ423BGGSUm3vLhUo3FmQqyvM5mA
Date: Fri, 4 Mar 2022 13:10:19 +0000
Message-ID: <6481b730-e338-294d-3602-bb899654ed2b@csgroup.eu>
References: <20220304011830.2061591-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220304011830.2061591-1-chi.minghao@zte.com.cn>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fc611f5-43a3-4135-e31d-08d9fde0559e
x-ms-traffictypediagnostic: MRZP264MB2796:EE_
x-microsoft-antispam-prvs: <MRZP264MB2796DDD18B09BA184E854676ED059@MRZP264MB2796.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UL1xje+mENvJIK43ZuzG6/rVCB3X9MnTebrj0CYzbg4IPEIgWQ18eLaW+jaH6rkbF/9QFEJuUHq5m3zwF6I9RVUJ5S5VWQ6BmLeas8VAKwNIWywFehAYZuAlHhX4T4xgJoTEG3yhQu4Dw+fNqfBf9FKgXLciqDC3TO6TeF+BbagEa2wF/JbZBu1nQRBo6TOcxRI+UKwvW0MyU73WawcOZH49FoOJ/F0NozimDrlsuyeLcE31ixBizWX6mXcbu1etqxkemXgnGid9uJS9jYc+pzJWBubQObikEz0hxdASkZwveSDF5pOKru83NxVwjcZlQXiKRuJl4RnTOkspm0R6UtXrliDpr3PvEWHuWitajPliDflRt600f6lbXao6H6hLgPGnAZon7Y48qnhHzG00kPLmEAU7JZuK3yBLpF0V4QqpAian3BzTXGMwthyAF9ucwlbm+N13EG8jZ/wOELoRTwMfWd2XBkP+ZbHKmQYzh0L71lGdZzcohQ28UlBH+NBVcU9gnRycZwyaoc1i7Epqld1f187I0V8nWikoDiGiKCO74sD1tRZDQRe+jtXguEJNUynYVZGH1UHOBQn/SJy45I3VFkpHvFTiLr9EOiV8BYuXYv1cS4kiSsEN9u0Mru42xzMbz0axnpfKZPhN77WTOy/MeaH8qLc4OjQJMZc2Wu6PENTL4DHY5aBBCvqf8rrRhECjVIkn5KOSEKSr/cKMOAux8Bcxs1WDZQYvOeKyl+EJNin8iGh9pgo9pDjc857K5IA/AnkpSdXi/Uvm2QXwvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(38070700005)(8676002)(66946007)(5660300002)(66446008)(64756008)(66476007)(91956017)(7416002)(44832011)(66556008)(76116006)(8936002)(36756003)(31696002)(38100700002)(122000001)(86362001)(83380400001)(6506007)(26005)(186003)(2616005)(2906002)(6512007)(71200400001)(54906003)(316002)(508600001)(110136005)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K21rZkgxOVZoSE9jUlM3WDBTTE9XWjNET2dmYXhDTzYzRVRTcVdodW0reGdQ?=
 =?utf-8?B?RHVhMll4T3YxODVrS3NBakNRMEJNSXY4bFVFYkVpenFTdzA5UW9RcVlvZWlQ?=
 =?utf-8?B?SkduZHVoMFIxZmFHdG41M3JERTV6K1FYWXlMUVVSc2c3eHg3VmQreHpoZWhL?=
 =?utf-8?B?enBDUEpkN2t5NnNzVk1ub3B2Zjk3aDBxczVCZllUMlM4YnUrUW1WT09IWHRa?=
 =?utf-8?B?RUxRRTdTbzNwOXd4aXcxblM2S3FPY25ZQnBBOUpqYkVtMEdsd0IveVlpdlhI?=
 =?utf-8?B?ZFVjQVpNbVlRREhMaitUQmNRVi9Tc0NPVWRUTG5mTHB4VXNqekFaV1E2MlJi?=
 =?utf-8?B?N2t3U2w5UmFlUDArVXJqYnJ2K1FWYVRWUG1XVnZ4RXNvSXg3RmVrSjRmWDBB?=
 =?utf-8?B?eDRXWHhXY3IrQ1dOcnVnZHFjcGM0WjJTQTRuVm1hR3FvS1Z5VGJQeW5JL2pG?=
 =?utf-8?B?S1lieXdCZWN4cXZqTHVOOGY3Q3N0UjlXMVBLZDI4dkxWR2NaTXE4RUhLZ2I0?=
 =?utf-8?B?Q050cnhuU3dlcVEyYXJEWDBwVFJhQmhFV2FKQ24rOVZxdHNJZ1RwbktSSkcw?=
 =?utf-8?B?anN4RnhDQXJwanlCOXhwbk5nVXhqV0xwWGlNVTZGTHFRNStmZnBtY0lISWg3?=
 =?utf-8?B?Ym0rNzFydUcvMTd4R0syNE81TlNzVWxLdUd0a0l2aitSN2h1RGJwM2ZSTWhJ?=
 =?utf-8?B?S1B6Q0lubFN3djhIYnBnVUkrVVExeFRBRkp4TGZXQnZabFduUjVURm9rVkZm?=
 =?utf-8?B?alZoZEVHY3dKQU1sSHFPMHF0QzNnVk1vLzRvcmF5NENmZnVXbmJBU1JBNG4x?=
 =?utf-8?B?dHFrK2g0MW91a1U5WmVlLzVLcjkwQVY5cE5IK2VQakFTSC9zMjRvQ2p5ZmpO?=
 =?utf-8?B?eWVsbFJmYnNQaGFoVW1VY1BTdmJiUHBNRVdCak1wTEErL25VODcrZ2xtNXZM?=
 =?utf-8?B?Y2lPN0oxZzNJNkphLy9UZVpwejhDcG5GbG45SFZQZ0hwQTFQN0E4cHlMMFg5?=
 =?utf-8?B?emovWEhRekpXK3MzSFlKbGZmL3pHYms0Z3QrYUgrZFEySDA5ZFpueXhFWmhB?=
 =?utf-8?B?THhqQnVNOHM2UmFnR2tQSHBveGJ4RXpzcmxPMTlOZzJ1enIrVVYyV2tLTUpj?=
 =?utf-8?B?TDBpVkdvN1M1eCtJclkzMUFjOVA1NHkyWkxUUFV2MU1DZnNHRjhJM3pLWWlD?=
 =?utf-8?B?V3lxOSt2WUlOTHJEeEJyUUM4YmVWeHQrYzBrMEtNU3pIZG50ZTh4d0xFR2JD?=
 =?utf-8?B?RUp2NGhxOU03T2ZmTHBWc2xPZE1DZTlKZ21JTXpRajYvT1dXZzc3NHUyWmtl?=
 =?utf-8?B?Zm9JaDc0NTJ3cnhTdWJWQjY3UDB6VW5hWGthT1BuV0w4Z0pHb1h2dXQwOTZB?=
 =?utf-8?B?aWdwL0p0YjdTRk9UTlZWUEhqdHdzMHB2QVFyRXpITW9NSTQxUGRoY2ZKYUhP?=
 =?utf-8?B?OFROMlJMbVlpQTlXNThRemF4Z1YwUWZ1OC9tRithd3ZvQmRSdjFuSDBCcXJR?=
 =?utf-8?B?NkRQZk1ldzFVRDVLWTV0QVk2ODVFY0xRa3ZHQ0xSazNUV2Z1czByNWJ1bFlF?=
 =?utf-8?B?RWROa3h2M0xmY0pTMlpRR084TnUxbkxBeE1iSlY2WVZGY3NDbVNBWHhza2ZB?=
 =?utf-8?B?czczbFpTZ2dOdlZoaFhrY0ZkVkgxVXVXZ1VzVGNQOS9aY09HUXRhVVB3TDd1?=
 =?utf-8?B?akNVQ1pXeVIwdDFiT2VjM3NYTS9vY1hlM2swallMZHlZMlNSNk10eS9KUWpH?=
 =?utf-8?B?QkdDajZLMGg2QXI2VXM2enFVdm1sTUdjWHJ2KzV5a1RUZ2MzZWNsTUFLQTJR?=
 =?utf-8?B?NXdQZ2Vpb3ErVXF6a2JYeUNSSHZ1RFNKRytBd1pDK29JSVdBVjM4QkFZNUMw?=
 =?utf-8?B?TmxObnBRL2JPaHhPYVVxd1hHODhGNzBEK1NyM0N1VHNiczJLTGI5bXI4NUtY?=
 =?utf-8?B?TE9lZGorRTZWdlFhUDRXeUJiTW5iZE9xZ2MxTXQrVzhTT252NlZLNnFnUDY5?=
 =?utf-8?B?Rkc2bS9GZlRLTGZQRjh2NGNUeEd1MTUvdUIvNVNpWFFIZ1dYT09rNDlRVDBT?=
 =?utf-8?B?Ny9uWmNiL0ZIUU83dW1wWjRiSHY2MGluQVVSRVhmVlNiblNMelNGWGhWN0tM?=
 =?utf-8?B?Q3NOQk9ZUzFkclhqNUJRODh4aXBpQlBSc1BmU2VWK3R5OFFkM09aOStQR25W?=
 =?utf-8?B?L3RmNkl4NTdxd3F1aWhheTFpUmE2Y0tRMnM3eWhENDJ5ZzVKckRWWW14SC9O?=
 =?utf-8?Q?oDSyLFQkdy3UITzMdOvzru6/pFLjyMeLSaJILDHuUs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB3D792B673EEA48A09583FA274836CC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc611f5-43a3-4135-e31d-08d9fde0559e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 13:10:19.9988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgWVHyTzf3iFAI/15hcqisvsC1yr018lmfWSQ9xDYYH/2mIJZMDQC0AVTI3Br3YjQf91jzaIMZVlBBuhogHVQ84NQ4+dNQgQw7rh7VLz/VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2796
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
Cc: "maz@kernel.org" <maz@kernel.org>, Zeal Robot <zealci@zte.com.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghao Chi <chi.minghao@zte.com.cn>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "paulus@samba.org" <paulus@samba.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzAzLzIwMjIgw6AgMDI6MTgsIGNnZWwuenRlQGdtYWlsLmNvbSBhIMOpY3JpdMKg
Og0KPiBGcm9tOiBNaW5naGFvIENoaSAoQ0dFTCBaVEUpIDxjaGkubWluZ2hhb0B6dGUuY29tLmNu
Pg0KPiANCj4gVXNlIG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpIHRvIHNpbXBsaWZ5IHRoZSBj
b2RlLg0KPiANCj4gUmVwb3J0ZWQtYnk6IFplYWwgUm9ib3QgPHplYWxjaUB6dGUuY29tLmNuPg0K
PiBTaWduZWQtb2ZmLWJ5OiBNaW5naGFvIENoaSAoQ0dFTCBaVEUpIDxjaGkubWluZ2hhb0B6dGUu
Y29tLmNuPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9tc2kuYyB8IDYgKy0t
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX21zaS5jIGIvYXJjaC9w
b3dlcnBjL3N5c2Rldi9mc2xfbXNpLmMNCj4gaW5kZXggYjM0NzVhZTlmMjM2Li45ZDEzNWJiYjMw
YjcgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX21zaS5jDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX21zaS5jDQo+IEBAIC0zODcsNyArMzg3LDYgQEAgc3Rh
dGljIGludCBmc2xfbXNpX3NldHVwX2h3aXJxKHN0cnVjdCBmc2xfbXNpICptc2ksIHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKmRldiwNCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBmc2xfb2ZfbXNpX2lkc1tdOw0KPiAgIHN0YXRpYyBpbnQgZnNsX29mX21zaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+ICAgew0KPiAtCWNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgKm1hdGNoOw0KPiAgIAlzdHJ1Y3QgZnNsX21zaSAqbXNpOw0KPiAgIAlzdHJ1Y3QgcmVz
b3VyY2UgcmVzLCBtc2lpcjsNCj4gICAJaW50IGVyciwgaSwgaiwgaXJxX2luZGV4LCBjb3VudDsN
Cj4gQEAgLTM5NywxMCArMzk2LDcgQEAgc3RhdGljIGludCBmc2xfb2ZfbXNpX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKmRldikNCj4gICAJdTMyIG9mZnNldDsNCj4gICAJc3RydWN0IHBj
aV9jb250cm9sbGVyICpwaGI7DQo+ICAgDQo+IC0JbWF0Y2ggPSBvZl9tYXRjaF9kZXZpY2UoZnNs
X29mX21zaV9pZHMsICZkZXYtPmRldik7DQo+IC0JaWYgKCFtYXRjaCkNCj4gLQkJcmV0dXJuIC1F
SU5WQUw7DQo+IC0JZmVhdHVyZXMgPSBtYXRjaC0+ZGF0YTsNCj4gKwlmZWF0dXJlcyA9IG9mX2Rl
dmljZV9nZXRfbWF0Y2hfZGF0YSgmZGV2LT5kZXYpOw0KDQpXaGF0IGhhcHBlbnMgd2hlbiBmZWF0
dXJlcyBpcyBOVUxMID8NCg0KPiAgIA0KPiAgIAlwcmludGsoS0VSTl9ERUJVRyAiU2V0dGluZyB1
cCBGcmVlc2NhbGUgTVNJIHN1cHBvcnRcbiIpOw0KPiAgIA==
