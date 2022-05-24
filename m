Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC975325A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 10:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6p203tpjz3c7H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 18:55:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::619;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6p1R6PZFz2ywc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 18:55:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9IhcdawCrw2HR66L965LfyZQRz5EKvty6xLOvgcEhA+ITymskCNVQtzCS3XBmz3LrcviRfukGCS8yJh5S5zX6a7R2pkWB8iP3VBeoMa+TRmGYrklqY7LaFfLs0ZdF2q/ZZtOI4X0IjHSYJYVB+7cOREHwEiVplYfZ/V97Yeuso/XxZCdVMs1zkDLpvrfk4zvmqvyxGW31PWZK0HNKdoMVToz6JoMs9jKptL4e/0j6uzj7hFZMU/rMnZSNQHKvT8GMoiLFtDTOP+c5aA1mi7Ft72RrXeqPBk1QJGGNsmxZwn01iujaUbBLYQlZ+TC+29H0eAd9dWDwhEmuS6OEscmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqHNmK7LnXCpyr8clW+WaJrjDNMN3t02yofmJJ0Le24=;
 b=FcEswpvtwYMnZRkAAQw4XegXLWHbQrQdugap3PW6e0mjPjHkeOsBW+rn8dwA9Pi34KIP/g9rvntXiRDOTn5m+vIehJ777fC1CYmjlOi9bh0Z94aSNnDMyLeT+ijB9capjTVhCrNsiT4qdOGJG1ETVincztKi4o758NPbiS34b/f6MIa2aj5t9gSd/IWLIXVO74gqtBNFB9HuUMqtvmWoCVHC6Mw/Yfgvy/zZtTxPuDZ27afzcE7nbeCOIuEEKa5sSBZ3uqOjaBa7XAAuxMNKuNcb0iMS8YlLer+QYH4Fjp4oFXY5xBSPytmHgpZeJoe8AS2gGjJezQK9i+J5e18EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3655.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 08:54:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 08:54:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 1/4] objtool: Add --mnop as an option to --mcount
Thread-Topic: [RFC PATCH 1/4] objtool: Add --mnop as an option to --mcount
Thread-Index: AQHYbs5i62JTj/rxWkqEHmudNaUwOq0tui6A
Date: Tue, 24 May 2022 08:54:38 +0000
Message-ID: <26c7bfc8-3089-034a-70c0-8857d7cd3a99@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-2-sv@linux.ibm.com>
In-Reply-To: <20220523175548.922671-2-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75a436eb-d62a-4383-ec98-08da3d6308b2
x-ms-traffictypediagnostic: PAYP264MB3655:EE_
x-microsoft-antispam-prvs: <PAYP264MB36551ACA05A593D56314E75CEDD79@PAYP264MB3655.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s9qOg1nBa6xB9T6EDVIaxF811IoBVNfrZVZh1+NjIUr6fZ7vcksL4Ps2ZGWIqlxoY9hdgfXPB13z9VpxXdDfNWWifVDtoRN+PLx3BPkymH9uaOQkEcTDzch0jvx6+iFfTt+2FugxDnLndnr4JNPgsKQ/evXH92mJSorR3dJGgwgAxclA7Rb4AX8c+DFlJVLjVqItmVeIoEbPhOpNF7AY7lVeDFUNNfYMn8Jbr+vlLjLZT0Lg2gm2FoPef3zcE8Ehfv/knaqZpwDvzDwA5rXbAXlBg4aELLymB1EVXzlcnMB4hckNF80NzJM1j5JI1N+T8dApaxThxLPIyBV+prGcGbXYS7JqhC/r6Vnwgy3JgPNeqaFTLmdPJgN6rB5mUmK1qrlT8zaaRQrqc2wmil+i6v0UKj9EWXzVGAZGjxeq/rp5uiwymNwAvt9rr6fFEkAOOR/VeydJQzYRJli36Obw2Svfj7ZoyrLitpZdtH+qc/F7185D07TqT7kvi7oXN+S3hSU4GbVBpHJ/bx5Cj3dDFQzk4i7cEjKA+SRAI4f0mUOPwK+O8BMCLHjjMCL5lVVAYTK+hqW5ZzGetptXcW+wp67m7XuK2CoLsMWymZq3sXVQP9T5+mtxJBxnKRKa3EupxEcUv+/FCe4ARimDMuZrq4NGF5WLq3T2F/35P2E3SnDdTPim71S9ciJSlknl5frH47M3FgI6rJ87qqsB4Br7m44xmhFw+4DIuptzI8BbpD32K5Y4dlKu+TiS1vUvJcMZNC0xryQXoT3ONysrA5YxSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(2616005)(36756003)(5660300002)(6512007)(6506007)(2906002)(8936002)(7416002)(122000001)(31696002)(83380400001)(38070700005)(31686004)(38100700002)(86362001)(8676002)(44832011)(316002)(54906003)(110136005)(6486002)(71200400001)(91956017)(66446008)(76116006)(66946007)(4326008)(66556008)(66476007)(64756008)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFdGSU5FVVJQK1NsRFZwQXdiak5OSURIS2pvbzAwbGFqZStZTVc4WTAzWHdt?=
 =?utf-8?B?VTU4SVd3ZFJzQS96N2hUc0JpN0hLeTJYQThKOUttbVBFTENRVUN4K2R6aGt4?=
 =?utf-8?B?WUtUWG5KQWYwRDcxeExzVmxvRG5yK016QmE3bGVURTBWOHZvTUJPWXFtTlcr?=
 =?utf-8?B?dnBlcDA5WTc2SzFjTlNsaGsyTTB0T0U4cVp3VFJjRW0wT3JtRzlUdWU4OWlB?=
 =?utf-8?B?bFV2Ynk2NDFxYm9IODQvRmMxU1BmMmZIUjZwWFdNNWJ2THJMSUgrVFJWeHpu?=
 =?utf-8?B?ZE9KWWFNMi9TRzhHOGJTbzNROHZ2bGNZTlhWMEQxTzJIY2pscExDQ3hDeFd1?=
 =?utf-8?B?aDBMYmMrdUZJanUrZmpzL0NVTVorWmVqUjh0aHlrekVKTkNrZEo2V29JK3Fm?=
 =?utf-8?B?MngrclRHYlVQVjZjNlBMOTBhTitZYXE4TWtpZVJPaXJqdDFWaUozci84cER5?=
 =?utf-8?B?VWl5MlBLZTBwZW9pSzFnVzNuZWtyWkwySm1GVUl0MXdHd0pxR3RSdGdxc1d4?=
 =?utf-8?B?Um5uaFcvWXpuQmppU3M5VUtSN1JteEgwcWRWWUxOTVJsRW9leFRzNVRLVnZF?=
 =?utf-8?B?dHk3L1oybVpvQ0xSUWg1SGIvV1ZOcWxGalpkZDB4VzlXMCticzNDWVFNUmIx?=
 =?utf-8?B?aXNjeVkwRG0wVi9IRXozamViWGUyR1M4QlgzZVVPRVJNSi9HdkdkdVQxTTh3?=
 =?utf-8?B?VUNKdndTSDVGenVrSks5ck5hYVhaQ0o3L3RtVnpGR0oyZ0tvWExUelBuSkU2?=
 =?utf-8?B?NWZwd3BhL0V5aWNrcTM5TEJUV0k2c2hjY2IvcEw3TlIzUXlCem9uTW1GRmd2?=
 =?utf-8?B?ZkJ2TlA4SkVpRSswWjJyeXhvQmo4R1lQbHJTd0REWlhRelJ3Z1FjbmhzQWhv?=
 =?utf-8?B?bURlczRRRzViTDl1NjJvWHNoTzVIcnl3Z0hUTEQ3UTVYZGtYZHVCNVRTRFBI?=
 =?utf-8?B?QVk3ZzFjNStRM2VBUjB2R3dPb0pXU1A4blFXc0Y0VkZmZVpnTng1VDVlUm94?=
 =?utf-8?B?dzhjbDBuZ04wT25jVDBIY2k1VlRTZEhYaE1QYm95Z012NTBZaVAxZy9qRE8x?=
 =?utf-8?B?OFJqT1VHbFEzKzhnNWxjRDV2S3Z3WlVZVHZkT0FWR1ZuMkEwbGJSQXF2ME0z?=
 =?utf-8?B?YjREZ3dVazF6aXcyVjRsenZmdCsyOTVlVGFQZXFUQTNQU3ZRTXRJc05jNjZX?=
 =?utf-8?B?QnhoempvTUdwTlljQzJabmV2Uk1kRmNQSk1iaHFKYlRWdTNuSm96dng4NkFn?=
 =?utf-8?B?aVRkeW5rZStCWHBMdlpRTWNYajV3SlUxTklvVUNUWUVYTlhuQ2xrSDkxWXJa?=
 =?utf-8?B?WlQ5aThuaVdxanFaUThneXE3b1RVZVhlNGdnbmdPc3Y5SW9PcHlzNkxTSkVl?=
 =?utf-8?B?SGxmUk5XeWx6RGN1QVFvVCtWaWlXejFYL3dETmR2anhIbmZXQ3IyVzVRUnBK?=
 =?utf-8?B?MU9BSStLWXppakVpeFE4SDdkemZUNmVZbytKT1RiQll3dWk5cWNDTjZCUzYx?=
 =?utf-8?B?Ums2Uzh2WmtqaUttL0tPOEdCVjd3ZEZwQkxsSHZBZFBqb2NlY21Gd0dXaFpp?=
 =?utf-8?B?aTdoK2NtenJ5enhwdWhOdmVHVDRXQUs3dE5kc1pGMDV1MENBcWlNNHgwR2ly?=
 =?utf-8?B?aUNRbmMxRVl3QXBkdFJHTW14dnk1bE8zTDBjcEw2VHNKRmNWRTc2TUFOQ1RQ?=
 =?utf-8?B?TlJXdmtRcHcwWUhsTVpGbnpqa2hSRWVmN3ZGbG9tV0NzUHhYR0R5NjlWOFI5?=
 =?utf-8?B?bTY5Mk9LMWhoWS9INzZwUHZ3Q1phUzdENEY5OTh4bVA1T1NJa0x2bWdRMkVo?=
 =?utf-8?B?dXJEdG93ZGdQRGJHazA3MFliaHo4Z09nazFHeTVnWmZFSFl5aHpmQ3NrY09Z?=
 =?utf-8?B?bC9jVis5RCtuODRUbmN0aitlRGcySDVFL3phdXBZL0hFa3VxcTcvSGxPWjNW?=
 =?utf-8?B?S2tEQ1ZuZ1krZzBnTStocWpjdHZKZlppaUZKdCtCQkpuc1BDZHB3UW0zak1H?=
 =?utf-8?B?SmkzVGFOQ2NaVHpzUmlodVYzeTJLRWdpRzRtWlZZQnBZcG40TXNmWVJBUzRp?=
 =?utf-8?B?NWZFYkZOS0NtdHk3bVc0NXJJUmF2MnJvekE0MFliV3dyc1VtV2Jic0F3bUJJ?=
 =?utf-8?B?dHduWk1VY2EweWc5UXNRVGladWZ5clM2d2MxMFltTHNVeXhsQXBubHp5cS9q?=
 =?utf-8?B?TW51alVUdFF1cHlnaTR5VGdBK25tSDlZcWFGZFJ4cHhNMHhLVXFTUWk0WmN6?=
 =?utf-8?B?eVpkbTQ5NkdOY3dUOThIVXQxUldhUFRYcG41enpBZUFaM2gxVEo1Z0tXLzBW?=
 =?utf-8?B?SDZwK3VMcmc2aUI5T2cwb1BqQzVLWUtqZnYrZEErRDR1VGluc1lObDJRZGM2?=
 =?utf-8?Q?mkud7Gb+aj/MzezjneYfHEF5nV0ZF5XVtmKOD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC5D2D3D25255D49B8CA22AD8B78F414@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a436eb-d62a-4383-ec98-08da3d6308b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 08:54:38.2878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PvVeHKUCpMKuQDjbzlKBje4T4hC/IP+ZqiurbxZ1vSKjKbflD+hgZ9gY2zcBsN0xgCYh2cigzmhTgJ5ydByJAhBj5tifg/1kY4qU3HXBoh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3655
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA1LzIwMjIgw6AgMTk6NTUsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBBcmNoaXRlY3R1cmVzIGNhbiBzZWxlY3QgSEFWRV9OT1BfTUNPVU5UIGlmIHRoZXkgY2hv
b3NlDQo+IHRvIG5vcCBvdXQgbWNvdW50IGNhbGwgc2l0ZXMuIElmIHRoYXQgY29uZmlnIG9wdGlv
biBpcw0KPiBzZWxlY3RlZCwgdGhlbiAtLW1ub3AgaXMgcGFzc2VkIGFzIGFuIG9wdGlvbiB0byBv
Ymp0b29sLA0KPiBhbG9uZyB3aXRoIC0tbWNvdW50Lg0KPiANCg0KSXMgdGhlcmUgYSByZWFzb24g
bm90IHRvIG5vcCBvdXQgbWNvdW50IGNhbGwgc2l0ZXMgb24gcG93ZXJwYyBhcyB3ZWxsID8NCg0K
PiBBbHNvLCBtYWtlIHN1cmUgdGhhdCAtLW1ub3AgY2FuIGJlIHBhc3NlZCBhcyBhbiBvcHRpb24N
Cj4gdG8gb2JqdG9vbCBvbmx5IHdoZW4gLS1tY291bnQgaXMgcGFzc2VkLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4g
ICBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKystDQo+ICAg
YXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIHNjcmlw
dHMvTWFrZWZpbGUuYnVpbGQgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICB0b29scy9vYmp0
b29sL2J1aWx0aW4tY2hlY2suYyAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKw0KPiAgIHRv
b2xzL29ianRvb2wvY2hlY2suYyAgICAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKystLS0t
LS0tLS0NCj4gICB0b29scy9vYmp0b29sL2luY2x1ZGUvb2JqdG9vbC9idWlsdGluLmggfCAgMSAr
DQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlDQo+IGluZGV4IDI1MDcwNzY0
NzM1OS4uYWNhZjg4ZTNjNjk0IDEwMDY0NA0KPiAtLS0gYS9NYWtlZmlsZQ0KPiArKysgYi9NYWtl
ZmlsZQ0KPiBAQCAtODUxLDcgKzg1MSw5IEBAIGlmZGVmIENPTkZJR19GVFJBQ0VfTUNPVU5UX1VT
RV9DQw0KPiAgICAgZW5kaWYNCj4gICBlbmRpZg0KPiAgIGlmZGVmIENPTkZJR19GVFJBQ0VfTUNP
VU5UX1VTRV9PQkpUT09MDQo+IC0gIENDX0ZMQUdTX1VTSU5HCSs9IC1EQ0NfVVNJTkdfTk9QX01D
T1VOVA0KPiArICBpZmRlZiBDT05GSUdfSEFWRV9OT1BfTUNPVU5UDQo+ICsgICAgQ0NfRkxBR1Nf
VVNJTkcJKz0gLURDQ19VU0lOR19OT1BfTUNPVU5UDQo+ICsgIGVuZGlmDQo+ICAgZW5kaWYNCj4g
ICBpZmRlZiBDT05GSUdfRlRSQUNFX01DT1VOVF9VU0VfUkVDT1JETUNPVU5UDQo+ICAgICBpZmRl
ZiBDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2Nv
bmZpZyBiL2FyY2gveDg2L0tjb25maWcNCj4gaW5kZXggMTg0N2Q2ZTk3NGExLi40YTQxYmZiNjQ0
ZjAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L0tjb25maWcNCj4gKysrIGIvYXJjaC94ODYvS2Nv
bmZpZw0KPiBAQCAtMTg5LDYgKzE4OSw3IEBAIGNvbmZpZyBYODYNCj4gICAJc2VsZWN0IEhBVkVf
Q09OVEVYVF9UUkFDS0lOR19PRkZTVEFDSwlpZiBIQVZFX0NPTlRFWFRfVFJBQ0tJTkcNCj4gICAJ
c2VsZWN0IEhBVkVfQ19SRUNPUkRNQ09VTlQNCj4gICAJc2VsZWN0IEhBVkVfT0JKVE9PTF9NQ09V
TlQJCWlmIEhBVkVfT0JKVE9PTA0KPiArCXNlbGVjdCBIQVZFX05PUF9NQ09VTlQJCQlpZiBIQVZF
X09CSlRPT0xfTUNPVU5UDQo+ICAgCXNlbGVjdCBIQVZFX0JVSUxEVElNRV9NQ09VTlRfU09SVA0K
PiAgIAlzZWxlY3QgSEFWRV9ERUJVR19LTUVNTEVBSw0KPiAgIAlzZWxlY3QgSEFWRV9ETUFfQ09O
VElHVU9VUw0KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmlsZS5idWlsZCBiL3NjcmlwdHMv
TWFrZWZpbGUuYnVpbGQNCj4gaW5kZXggYWM4MTY3MjI3YmMwLi4yZTBjM2Y5YzE0NTkgMTAwNjQ0
DQo+IC0tLSBhL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQNCj4gKysrIGIvc2NyaXB0cy9NYWtlZmls
ZS5idWlsZA0KPiBAQCAtMjMxLDYgKzIzMSw3IEBAIG9ianRvb2xfYXJncyA9CQkJCQkJCQlcDQo+
ICAgCSQoaWYgJChDT05GSUdfSEFWRV9OT0lOU1RSX0hBQ0spLCAtLWhhY2tzPW5vaW5zdHIpCQlc
DQo+ICAgCSQoaWYgJChDT05GSUdfWDg2X0tFUk5FTF9JQlQpLCAtLWlidCkJCQkJXA0KPiAgIAkk
KGlmICQoQ09ORklHX0ZUUkFDRV9NQ09VTlRfVVNFX09CSlRPT0wpLCAtLW1jb3VudCkJCVwNCj4g
KwkkKGlmICQoQ09ORklHX0hBVkVfTk9QX01DT1VOVCksIC0tbW5vcCkJCQkJXA0KPiAgIAkkKGlm
ICQoQ09ORklHX1VOV0lOREVSX09SQyksIC0tb3JjKQkJCQlcDQo+ICAgCSQoaWYgJChDT05GSUdf
UkVUUE9MSU5FKSwgLS1yZXRwb2xpbmUpCQkJCVwNCj4gICAJJChpZiAkKENPTkZJR19TTFMpLCAt
LXNscykJCQkJCVwNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvYnVpbHRpbi1jaGVjay5j
IGIvdG9vbHMvb2JqdG9vbC9idWlsdGluLWNoZWNrLmMNCj4gaW5kZXggZjRjM2E1MDkxNzM3Li5i
MDVlMjEwOGMwYzMgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29ianRvb2wvYnVpbHRpbi1jaGVjay5j
DQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvYnVpbHRpbi1jaGVjay5jDQo+IEBAIC04MCw2ICs4MCw3
IEBAIGNvbnN0IHN0cnVjdCBvcHRpb24gY2hlY2tfb3B0aW9uc1tdID0gew0KPiAgIAlPUFRfQk9P
TEVBTigwLCAiZHJ5LXJ1biIsICZvcHRzLmRyeXJ1biwgImRvbid0IHdyaXRlIG1vZGlmaWNhdGlv
bnMiKSwNCj4gICAJT1BUX0JPT0xFQU4oMCwgImxpbmsiLCAmb3B0cy5saW5rLCAib2JqZWN0IGlz
IGEgbGlua2VkIG9iamVjdCIpLA0KPiAgIAlPUFRfQk9PTEVBTigwLCAibW9kdWxlIiwgJm9wdHMu
bW9kdWxlLCAib2JqZWN0IGlzIHBhcnQgb2YgYSBrZXJuZWwgbW9kdWxlIiksDQo+ICsJT1BUX0JP
T0xFQU4oMCwgIm1ub3AiLCAmb3B0cy5tbm9wLCAibm9wIG91dCBtY291bnQgY2FsbCBzaXRlcyIp
LA0KPiAgIAlPUFRfQk9PTEVBTigwLCAibm8tdW5yZWFjaGFibGUiLCAmb3B0cy5ub191bnJlYWNo
YWJsZSwgInNraXAgJ3VucmVhY2hhYmxlIGluc3RydWN0aW9uJyB3YXJuaW5ncyIpLA0KPiAgIAlP
UFRfQk9PTEVBTigwLCAic2VjLWFkZHJlc3MiLCAmb3B0cy5zZWNfYWRkcmVzcywgInByaW50IHNl
Y3Rpb24gYWRkcmVzc2VzIGluIHdhcm5pbmdzIiksDQo+ICAgCU9QVF9CT09MRUFOKDAsICJzdGF0
cyIsICZvcHRzLnN0YXRzLCAicHJpbnQgc3RhdGlzdGljcyIpLA0KPiBAQCAtMTQyLDYgKzE0Mywx
NiBAQCBzdGF0aWMgYm9vbCBvcHRzX3ZhbGlkKHZvaWQpDQo+ICAgCXJldHVybiBmYWxzZTsNCj4g
ICB9DQo+ICAgDQo+ICtzdGF0aWMgYm9vbCBtbm9wX29wdHNfdmFsaWQodm9pZCkNCj4gK3sNCj4g
KwlpZiAob3B0cy5tbm9wICYmICFvcHRzLm1jb3VudCkgew0KPiArCQlFUlJPUigiLS1tbm9wIHJl
cXVpcmVzIC0tbWNvdW50Iik7DQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwly
ZXR1cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBib29sIGxpbmtfb3B0c192YWxpZChz
dHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlKQ0KPiAgIHsNCj4gICAJaWYgKG9wdHMubGluaykNCj4g
QEAgLTE4NSw2ICsxOTYsOSBAQCBpbnQgb2JqdG9vbF9ydW4oaW50IGFyZ2MsIGNvbnN0IGNoYXIg
Kiphcmd2KQ0KPiAgIAlpZiAoIWZpbGUpDQo+ICAgCQlyZXR1cm4gMTsNCj4gICANCj4gKwlpZiAo
IW1ub3Bfb3B0c192YWxpZCgpKQ0KPiArCQlyZXR1cm4gMTsNCj4gKw0KPiAgIAlpZiAoIWxpbmtf
b3B0c192YWxpZChmaWxlKSkNCj4gICAJCXJldHVybiAxOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvb2JqdG9vbC9jaGVjay5jIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+IGluZGV4IDE5
MGIyZjZlMzYwYS4uMDU2MzAyZDU4ZTIzIDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2No
ZWNrLmMNCj4gKysrIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+IEBAIC0xMTc1LDE3ICsxMTc1
LDE4IEBAIHN0YXRpYyB2b2lkIGFubm90YXRlX2NhbGxfc2l0ZShzdHJ1Y3Qgb2JqdG9vbF9maWxl
ICpmaWxlLA0KPiAgIAlpZiAob3B0cy5tY291bnQgJiYgc3ltLT5mZW50cnkpIHsNCj4gICAJCWlm
IChzaWJsaW5nKQ0KPiAgIAkJCVdBUk5fRlVOQygiVGFpbCBjYWxsIHRvIF9fZmVudHJ5X18gIT8h
PyIsIGluc24tPnNlYywgaW5zbi0+b2Zmc2V0KTsNCj4gKwkJaWYgKG9wdHMubW5vcCkgew0KPiAr
CQkJaWYgKHJlbG9jKSB7DQo+ICsJCQkJcmVsb2MtPnR5cGUgPSBSX05PTkU7DQo+ICsJCQkJZWxm
X3dyaXRlX3JlbG9jKGZpbGUtPmVsZiwgcmVsb2MpOw0KPiArCQkJfQ0KPiAgIA0KPiAtCQlpZiAo
cmVsb2MpIHsNCj4gLQkJCXJlbG9jLT50eXBlID0gUl9OT05FOw0KPiAtCQkJZWxmX3dyaXRlX3Jl
bG9jKGZpbGUtPmVsZiwgcmVsb2MpOw0KPiAtCQl9DQo+IC0NCj4gLQkJZWxmX3dyaXRlX2luc24o
ZmlsZS0+ZWxmLCBpbnNuLT5zZWMsDQo+IC0JCQkgICAgICAgaW5zbi0+b2Zmc2V0LCBpbnNuLT5s
ZW4sDQo+IC0JCQkgICAgICAgYXJjaF9ub3BfaW5zbihpbnNuLT5sZW4pKTsNCj4gKwkJCWVsZl93
cml0ZV9pbnNuKGZpbGUtPmVsZiwgaW5zbi0+c2VjLA0KPiArCQkJCSAgICAgICBpbnNuLT5vZmZz
ZXQsIGluc24tPmxlbiwNCj4gKwkJCQkgICAgICAgYXJjaF9ub3BfaW5zbihpbnNuLT5sZW4pKTsN
Cj4gICANCj4gLQkJaW5zbi0+dHlwZSA9IElOU05fTk9QOw0KPiArCQkJaW5zbi0+dHlwZSA9IElO
U05fTk9QOw0KPiArCQl9DQo+ICAgDQo+ICAgCQlsaXN0X2FkZF90YWlsKCZpbnNuLT5jYWxsX25v
ZGUsICZmaWxlLT5tY291bnRfbG9jX2xpc3QpOw0KPiAgIAkJcmV0dXJuOw0KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRvb2wvYnVpbHRpbi5oIGIvdG9vbHMvb2JqdG9v
bC9pbmNsdWRlL29ianRvb2wvYnVpbHRpbi5oDQo+IGluZGV4IDI4MGVhMThiN2YyYi4uNzFlZDMx
NTJhMThlIDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2luY2x1ZGUvb2JqdG9vbC9idWls
dGluLmgNCj4gKysrIGIvdG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRvb2wvYnVpbHRpbi5oDQo+
IEBAIC0yOSw2ICsyOSw3IEBAIHN0cnVjdCBvcHRzIHsNCj4gICAJYm9vbCBiYWNrdXA7DQo+ICAg
CWJvb2wgZHJ5cnVuOw0KPiAgIAlib29sIGxpbms7DQo+ICsJYm9vbCBtbm9wOw0KPiAgIAlib29s
IG1vZHVsZTsNCj4gICAJYm9vbCBub191bnJlYWNoYWJsZTsNCj4gICAJYm9vbCBzZWNfYWRkcmVz
czs=
