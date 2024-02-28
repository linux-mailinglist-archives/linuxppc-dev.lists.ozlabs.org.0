Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E086B02F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 14:23:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BRcUMevw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlFR93kRFz3vb4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 00:23:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BRcUMevw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlFQN0Vqsz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 00:22:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/1xEIkoOkvQNvJ5BPHcDRT9LhhvBmgJUjTCe1mbSXz7ZhcQVzx3uTb/l2Sb3rQrVHQTbb7P2OJLI0P82vr/LQYPzDh+Pll9rNws0RZp1Bd54aVkyYwG1Kj48xQnsh0sC7GXsmCYaPUc8QhFr3k8QiSs65oUyupOce444CxtMi1RCQnKOKf1MR/94APBqB6wmu2XJMJSFppPhw5BDDM4ao9Dn9QlOX+fJDm2GVmsJ2KTMuppVlVXC/wNWN7zB2A852npW5p9nJ+EndShuF460TWlS4sZlyKD3FLYi1LN1wlwUsX6gOYooBGC95XMvTETaKdtsG4qUC6Xh11v42450g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xORplKbOPrfNeT1SVHEU2CWl0SsQhlVqxo9WjNT5Fnc=;
 b=cEOnRSGkFZ5ldVk8H2EdBr5kZRbEZ1F8Wgh7rPKCk8Tfh86z5jMjUjS790wnn0NaFLNqUNeDhN6kn2q86FG4gwmqc8UMyBkFVKp9Z3Le0PGiZUYMMQy0e+gOmqoNJfCn1eoULVTl1PtZoS5DkZJI2979mNqNZ03iZAE3fZIgmQo56C2l0KrCWLzQqmDMGZfCbIm6Y4yH+fjw3D4XOssnGfQGoDZhKT8Z3apfz0vYw5/AKxGqoOQT8Wp8uuucgcui9c4sTm9/n1QphQqKskS0kv8u12GQSoOHuflIbTxS1SjIL4t40+U6hawQ3EkonduVWVIMkqS087pSlxM46bwtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xORplKbOPrfNeT1SVHEU2CWl0SsQhlVqxo9WjNT5Fnc=;
 b=BRcUMevwpV5TDpY6ud5hJWFd5mnCz5syqhqmyx5pcZNSAQBgyOk1Jyzw3O27/Vme3qyhIMkgJ440zfnqIJNHujpygzIYdyUWeFwRVnBrMPZzj1xQFTObOakLCSrTqs1ppuTvLg8z8SK1Y/jntLxqg8N8t0O5uJvbnOLE0OugAdiu2/4rbiMUuYAhx5HCzAsVbqY+eFOBOsMIN6IlXWakdm5xMo8ZN8a8BH6mM6BNZqYsHWug+HLHlb+E5BMxACEF0BB5U4JTS0MjUcLCMcLsY9nDScUgasPAmK1UKw29IX4iLmn4yaI5fKCBHMl/2KpkgAWN34HCO9j5mXBcySnFsw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1608.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.37; Wed, 28 Feb
 2024 13:22:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 13:22:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "keescook@chromium.org"
	<keescook@chromium.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Topic: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Index: AQHaaOd3T09DEeJabki6TgRFYbqm47EdxC4AgAC5pgCAAAKNAIAAJBAAgAEcAgA=
Date: Wed, 28 Feb 2024 13:22:09 +0000
Message-ID: <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
 <202402271004.7145FDB53F@keescook>
 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
In-Reply-To: <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1608:EE_
x-ms-office365-filtering-correlation-id: 6382b110-ba4b-4e9b-9a4b-08dc38604440
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  z3BSd3NBNBlhqvUWIOszcS/94G1BxIXiY6K6BrEOJ2b1eWi9yIXcm8PY5gG5SwhuNwcQb3JrW2e/As231TZTTif8hKkx2AeJmLfRHzILHfgnlyYl15KAzkT2QXIFP+gNwHxRAIBLN4Y6pJeXucVTOVmBHml+wRbSSjtD2GneFnG/5DT6RlwYwllmABdDq9MEy1V73Y+MbPF1r3ZfcLyNAXoYcdwsuirPMMM7pZF442cuIRus5XKzganNa45Z8vTwnJJVJZ8WWvY52v1O1SLJjr6X0aTxBpCR1gJdxjmdMRe0UDFum86TQG12mPAjpzXarY12Se2hg0vbzBwUEej1WsdPs2dcttaUMX7Oht+U7MG+GF/NISyZpT8wbWUORZD1/Ijqesy1/2StmmTDDnyLve61fTW99PHMcqZyiZGEK8JYXBZ4a67T7PsMgnvAWAoc0RfW4xTyBDwEoZ40bVL9I7YzXUM7G1v/cCC/6AceAvybmrfE/MnOI92ey2pOFsit3/XqIdCFPoEdw97ocqlzBxuSH/fD9J5XCImz2U4BrcN3iUZLarzjak7RnbrLTfLF5dmNMerF2FY/ey/ARbB2tw9lrr0qRfHzqaxwXcrGGkRraq8rmh4G2evHCQDFcuIKa/ZtZOeD6+BeLYmnf7lSvl7OsNqBw0treQsTAIuqnx4iJbe251le69h0K5nICJYAIjSVWHuJ0CAIMOdOEgZ6WsAmyGwBpM2tQlgC/HOX8aA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WE1yQWYvQnBzQ0ppNUVYcHYxUG9mcVlhcUxJbWNJUFljNkpJZHF5b2pqNzll?=
 =?utf-8?B?cjZXT0J1WTkrTTdzZ2hEd09ReHlheVY2YkM0djVpV25SMFNZK29UdzRaSTBB?=
 =?utf-8?B?N2NoTEJWaEFGTWVHZ3gwVE5JL1lSZWszV1pYeWkra2VNOVM4SGR5M0JMRElr?=
 =?utf-8?B?Nkx4ejZ6b3FjQ2haUUgwRHZNVGxQby9NTHhKZmVyS0dTOGNMQkxQZnpKTG0y?=
 =?utf-8?B?cEdTcVBLNUJRU2FGbzFwVDIvRGYrcDVtaFYwK0xYcTVVUnBOQmthd3hyNVpj?=
 =?utf-8?B?bThCVnFvNnFidGRLS0FjRXpjSEcrdnNpWWNia3VTM1drOEZYaUtqeTFGYy9L?=
 =?utf-8?B?anQ2Tmd4NnVHSU5naFcyQlpkWVhyNEdPY0tjTGx2SUV3cDhKREtpZDYySGpq?=
 =?utf-8?B?eS90RklablF0VXFpam5VajZCa3NrVDY4c1RSWDBRTGZQcld5UGloeFM5ZFBG?=
 =?utf-8?B?MHZiOVdXRFIwRHBLb3FIaVh1V0RjZGptd2VkTzQxOWdVbzlWcHBCTFY1bzRh?=
 =?utf-8?B?SXlyeTRxWVlBMCtURGRFUGo2SjY1Qm15aEpRVUhYS0krNmd4OVRIUlpQcmdJ?=
 =?utf-8?B?Tm43Y3B5V1hHTjVzYmhRbTJNclAzVGZtTmlUc3dKQk1WS1Z5RytxQkhncldx?=
 =?utf-8?B?TmZPYlJ6OFAvd0tJcytvRHZBQmlBRlhSUmw1d2NsTHN2MTRkOGh3L3JqR3Bj?=
 =?utf-8?B?SFVQUGwyN1Q2SzkrRDl0S3VMRDFGcFVLN2hDdkoxcDZUTnREVjhJa0F1RmRX?=
 =?utf-8?B?V1ZqWjB5ZnZzNk03ZTFCVURLK0taMUcrZzRUUEhaMlJzNERBNm1rMmYyRnlK?=
 =?utf-8?B?OW5udDZMa1V0Y0NmOFNTTXByczQ2UWQvbVBqaTRXanBRc1F4M2xQekR0Ukg2?=
 =?utf-8?B?YjdZU21pQzFXU0ptUUtwVTgwdG9md2duNjlyY3dPYVpKWUhra2R0VFpxMDNB?=
 =?utf-8?B?NG5PRnk0bnc0RWNmand3RWdoTXQ1dG5iSXlBZ2tKbjZvN1RtNWdhQStISlJ2?=
 =?utf-8?B?a0dtKzcxdk1OYnFibzFOTGVEalZ6VWlUdVRzTW0xOHp5SjZaUWtYaVJYcXF1?=
 =?utf-8?B?U21tbWdIVUxiYXltUC8xY2EwSE1PaHdaMXFWVTV4QmVEbmJMMkR0b1hYb1pw?=
 =?utf-8?B?U0VnUDRhWkM2VGNBbU1GOThOQ3ZBY3FxTTFYcWlsNUtsODdxT2pZYVhFanQz?=
 =?utf-8?B?ckw2OHpzSWxESWMzNUtsTHdFeFJ6WGE4QkxHUTZCNk9nTUxyQklBMXhNUFFk?=
 =?utf-8?B?NWV3M042cEZOMVhTa1JpbXorQVZ0ZTBka3NCSGFaSWhCUCtxb0xvalNvUXlX?=
 =?utf-8?B?Z25wSmpLOEZjSW1FL1p3VUJ1bkg5Um03WnhqODhQZVdxZ3NCeVJ5UHVHaHha?=
 =?utf-8?B?NkVJTGRzUDc0cXJOSGRYQVlNKzZRWWlMZS9MZjBIOXBBOXJtRUhIT1lJUE1D?=
 =?utf-8?B?dnByTVRmRlAxTDdTU0dJYXJrVFdiOXl5K25pZzI5cW1ld2t0eDQ1VFlpQWs3?=
 =?utf-8?B?RHpRazNsRUZYckJFTFJoWitub0lqMXFwYjh0SWsrWTRCRUVVdE54UWgxclFl?=
 =?utf-8?B?MVZtSW5ubzJERkpXRjFVaS9NSWxkNlduREJlaHk5dFE0dFl0WkRKeXF0N29M?=
 =?utf-8?B?U0hSbDFtVUJtSHREbXpnQlliM012VGpIYjNpUjdXNTY0MWhtYktnRVowU0lJ?=
 =?utf-8?B?YnNEUml0QnFXVGtOWkpUa2M0YWM5Y3JZcWZ1YkJ0Y1FScGk4YytJcHlyTGFS?=
 =?utf-8?B?UXMreS9JQzVhd0I1UU1PSWFSUkxESGNXd1YrTFNWbXF1V3JQcTJuZUJEM1g1?=
 =?utf-8?B?Z3hidUZXSHp5VUpiem9VTk9SQzV5RnF1aUNNdngxcjZIN0JIZXJSa2pvRnZH?=
 =?utf-8?B?bXY1b29XUGV5b3kwbE9mTzl4d25NdHFqa3ZrTHZRbzJuVERXd2VYV1hzVGsv?=
 =?utf-8?B?K25UcGlvQ01TN0NMT1ZKQVpKUnZZc2s0cFlHL1M4Qy92WVpxZkJGRFJreUo3?=
 =?utf-8?B?bnhvQ0ZHZWF5NWdoRG5BVHNONjhPcHRMdVZvZm9WeG56QnF6OHFka2xzR2JE?=
 =?utf-8?B?ZzRBN1k0Qm5leU1SMDIvcHU4ZXBETU1NVXdZSUwxeTJVNlpJam55ajFtdEhR?=
 =?utf-8?Q?NR2EAtGDaOvXisUcwp1b2pxIK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CE09D98B522F646942A0293C4C9477A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6382b110-ba4b-4e9b-9a4b-08dc38604440
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 13:22:09.2371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23RjXgQIHaUQf5MbEyPUqZRcT9nD+upAsE8aNF2q2aiPZIpIMdPaGuJMeuvo89m4Wbp39NFE7ZIhwP+/goXINkkUpiFD0bDNrdI9mbzq4lY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1608
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
Cc: "luto@kernel.org" <luto@kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug
 @rivosinc.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAyLzIwMjQgw6AgMjE6MjUsIEVkZ2Vjb21iZSwgUmljayBQIGEgw6ljcml0wqA6
DQo+IE9uIFR1ZSwgMjAyNC0wMi0yNyBhdCAxODoxNiArMDAwMCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+Pj4gV2h5IGRvaW5nIGEgZnVsbCBpbml0IG9mIHRoZSBzdHJ1Y3Qgd2hlbiBhbGwg
ZmllbGRzIGFyZSByZS0NCj4+Pj4gd3JpdHRlbiBhIGZldw0KPj4+PiBsaW5lcyBhZnRlciA/DQo+
Pj4NCj4+PiBJdCdzIGEgbmljZSBjaGFuZ2UgZm9yIHJvYnVzdG5lc3MgYW5kIG1ha2VzIGZ1dHVy
ZSBjaGFuZ2VzIGVhc2llci4NCj4+PiBJdCdzDQo+Pj4gbm90IGFjdHVhbGx5IHdhc3RlZnVsIHNp
bmNlIHRoZSBjb21waWxlciB3aWxsIHRocm93IGF3YXkgYWxsDQo+Pj4gcmVkdW5kYW50DQo+Pj4g
c3RvcmVzLg0KPj4NCj4+IFdlbGwsIEkgdGVuZCB0byBkaXNsaWtlIGRlZmF1bHQgaW5pdCBhdCBk
ZWNsYXJhdGlvbiBiZWNhdXNlIGl0IG9mdGVuDQo+PiBoaWRlcyBtaXNzZWQgcmVhbCBpbml0LiBX
aGVuIGEgZmllbGQgaXMgbm90IGluaXRpYWxpemVkIEdDQyBzaG91bGQNCj4+IGVtaXQNCj4+IGEg
V2FybmluZywgYXQgbGVhc3Qgd2hlbiBidWlsdCB3aXRoIFc9MiB3aGljaCBzZXRzDQo+PiAtV21p
c3NpbmctZmllbGQtaW5pdGlhbGl6ZXJzID8NCj4gDQo+IFNvcnJ5LCBJJ20gbm90IGZvbGxvd2lu
ZyB3aGVyZSB5b3UgYXJlIGdvaW5nIHdpdGggdGhpcy4gVGhlcmUgYXJlbid0DQo+IGFueSBzdHJ1
Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIHVzZXJzIHRoYXQgdXNlIGluaXRpYWxpemVycyB0b2Rh
eSwgc28NCj4gdGhhdCB3YXJuaW5nIHdvbid0IGFwcGx5IGluIHRoaXMgY2FzZS4gTWVhbndoaWxl
LCBkZXNpZ25hdGVkIHN0eWxlDQo+IHN0cnVjdCBpbml0aWFsaXphdGlvbiAod2hpY2ggd291bGQg
emVybyBuZXcgbWVtYmVycykgaXMgdmVyeSBjb21tb24sIGFzDQo+IHdlbGwgYXMgbm90IGdldCBh
bnl0aGluZyBjaGVja2VkIGJ5IHRoYXQgd2FybmluZy4gQW55dGhpbmcgd2l0aCB0aGlzDQo+IG1h
bnkgbWVtYmVycyBpcyBwcm9iYWJseSBnb2luZyB0byB1c2UgdGhlIGRlc2lnbmF0ZWQgc3R5bGUu
DQo+IA0KPiBJZiB3ZSBhcmUgb3B0aW1pemluZyB0byBhdm9pZCBidWdzLCB0aGUgd2F5IHRoaXMg
c3RydWN0IGlzIHVzZWQgdG9kYXkNCj4gaXMgbm90IGdyZWF0LiBJdCBpcyBlc3NlbnRpYWxseSBi
ZWluZyB1c2VkIGFzIGFuIGFyZ3VtZW50IHBhc3Nlci4NCj4gTm9ybWFsbHkgd2hlbiBhIGZ1bmN0
aW9uIHNpZ25hdHVyZSBjaGFuZ2VzLCBidXQgYSBjYWxsZXIgaXMgbWlzc2VkLCBvZg0KPiBjb3Vy
c2UgdGhlIGNvbXBpbGVyIHdpbGwgbm90aWNlIGxvdWRseS4gQnV0IG5vdCBoZXJlLiBTbyBJIHRo
aW5rDQo+IHByb2JhYmx5IHplcm8gaW5pdGlhbGl6aW5nIGl0IGlzIHNhZmVyIHRoYW4gYmVpbmcg
c2V0dXAgdG8gcGFzcw0KPiBnYXJiYWdlLg0KDQpObyB3b3JyeSwgaWYgZXZlcnlib2R5IHRoaW5r
cyB0aGF0IGluaXQgYXQgZGVjbGFyYXRpb24gaXMgd29ydGggaXQgaW4gDQp0aGF0IGNhc2UgaXQg
aXMgT0sgZm9yIG1lIGFuZCBJJ20gbm90IGdvaW5nIHRvIGFzayBmb3Igc29tZXRoaW5nIHNwZWNp
YWwgDQpvbiBwb3dlcnBjLCBteSBjb21tZW50IHdhcyBtb3JlIGdlbmVyYWwgYWxsdGhvdWdoIEkg
dXNlZCBwb3dlcnBjIGFzIGFuIA0KZXhlbXBsZS4NCg0KTXkgd29ycnkgd2l0aCBpbml0aWFsaXNh
dGlvbiBhdCBkZWNsYXJhdGlvbiBpcyBpdCBvZnRlbiBoaWRlcyBtaXNzaW5nIA0KYXNzaWdubWVu
dHMuIExldCdzIHRha2UgZm9sbG93aW5nIHNpbXBsZSBleGVtcGxlOg0KDQpjaGFyICpjb2xvdXIo
aW50IG51bSkNCnsNCgljaGFyICpuYW1lOw0KDQoJaWYgKG51bSA9PSAwKSB7DQoJCW5hbWUgPSAi
YmxhY2siOw0KCX0gZWxzZSBpZiAobnVtID09IDEpIHsNCgkJbmFtZSA9ICJ3aGl0ZSI7DQoJfSBl
bHNlIGlmIChudW0gPT0gMikgew0KCX0gZWxzZSB7DQoJCW5hbWUgPSAibm8gY29sb3VyIjsNCgl9
DQoNCglyZXR1cm4gbmFtZTsNCn0NCg0KDQpIZXJlLCBHQ0Mgd2FybnMgYWJvdXQgYSBtaXNzaW5n
IGluaXRpYWxpc2F0aW9uIG9mIHZhcmlhYmxlICduYW1lJy4NCg0KQnV0IGlmIEkgZGVjbGFyZSBp
dCBhcw0KDQoJY2hhciAqbmFtZSA9ICJubyBjb2xvdXIiOw0KDQpUaGVuIEdDQyB3b24ndCB3YXJu
IGFueW1vcmUgdGhhdCB3ZSBhcmUgbWlzc2luZyBhIHZhbHVlIGZvciB3aGVuIG51bSBpcyAyLg0K
DQpEdXJpbmcgbXkgbGlmZSBJIGhhdmUgc28gbWFueSB0aW1lcyBzcGVudCBodWdlIGFtb3VudCBv
ZiB0aW1lIA0KaW52ZXN0aWdhdGluZyBpc3N1ZXMgYW5kIGJ1Z3MgZHVlIHRvIG1pc3NpbmcgYXNz
aWdubWVudHMgdGhhdCB3ZXJlIGdvaW5nIA0KdW5kZXRlY3RlZCBkdWUgdG8gZGVmYXVsdCBpbml0
aWFsaXNhdGlvbiBhdCBkZWNsYXJhdGlvbi4NCg0KPiANCj4gSSdtIHRyeWluZyB0byBmaWd1cmUg
b3V0IHdoYXQgdG8gZG8gaGVyZS4gSWYgSSBjaGFuZ2VkIGl0IHNvIHRoYXQganVzdA0KPiBwb3dl
cnBjIHNldCB0aGUgbmV3IGZpZWxkIG1hbnVhbGx5LCB0aGVuIHRoZSBjb252ZW50aW9uIGFjcm9z
cyB0aGUNCj4ga2VybmVsIHdvdWxkIGJlIGZvciBldmVyeXRoaW5nIHRvIGJlIGRlZmF1bHQgemVy
bywgYW5kIGZ1dHVyZSBvdGhlciBuZXcNCj4gcGFyYW1ldGVycyBjb3VsZCBoYXZlIGEgZ3JlYXRl
ciBjaGFuY2Ugb2YgdHVybmluZyBpbnRvIGdhcmJhZ2Ugb24NCj4gcG93ZXJwYy4gU2luY2UgaXQg
Y291bGQgYmUgZWFzeSB0byBtaXNzIHRoYXQgcG93ZXJwYyB3YXMgc3BlY2lhbC4gV291bGQNCj4g
eW91IHByZWZlciBpdD8NCj4gDQo+IE9yIG1heWJlIEkgY291bGQgdHJ5IGEgbmV3IHZtX3VubWFw
cGVkX2FyZWEoKSB0aGF0IHRha2VzIHRoZSBleHRyYQ0KPiBhcmd1bWVudCBzZXBhcmF0ZWx5PyBU
aGUgb2xkIGNhbGxlcnMgY291bGQgY2FsbCB0aGUgb2xkIGZ1bmN0aW9uIGFuZA0KPiBub3QgbmVl
ZCBhbnkgYXJjaCB1cGRhdGVzLiBJdCBhbGwgc2VlbXMgc3RyYW5nZSB0aG91Z2gsIGJlY2F1c2UN
Cj4gYXV0b21hdGljIHplcm8gaW5pdGlhbGl6aW5nIHN0cnVjdCBtZW1iZXJzIGlzIHNvIGNvbW1v
biBpbiB0aGUga2VybmVsLg0KPiBCdXQgaXQgYWxzbyB3b3VsZG4ndCBhZGQgdGhlIGNsZWFudXAg
S2VlcyB3YXMgcG9pbnRpbmcgb3V0LiBIbW0uDQo+IA0KPiBBbnkgcHJlZmVyZW5jZT8gT3IgbWF5
YmUgYW0gSSBtaXNzaW5nIHlvdXIgcG9pbnQgYW5kIHRhbGtpbmcgbm9uc2Vuc2U/DQo+IA0KDQpT
byBteSBwcmVmZXJlbmNlIHdvdWxkIGdvIHRvIHRoZSBhZGRpdGlvbiBvZjoNCg0KCWluZm8ubmV3
X2ZpZWxkID0gMDsNCg0KQnV0IHRoYXQncyB2ZXJ5IG1pbm9yIGFuZCBpZiB5b3UgdGhpbmsgaXQg
aXMgZWFzaWVyIHRvIG1hbmFnZSBhbmQgDQptYWludGFpbiBieSBwZXJmb3JtaW5nIHt9IGluaXRp
YWxpc2F0aW9uIGF0IGRlY2xhcmF0aW9uLCBsZXRzIGdvIGZvciB0aGF0Lg0KDQpDaHJpc3RvcGhl
DQo=
