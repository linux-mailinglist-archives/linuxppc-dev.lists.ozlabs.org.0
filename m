Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE3891533
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:31:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=avkIUS9a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5YX85YqSz3vfS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 19:31:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=avkIUS9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5YWR2St7z3cKN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 19:30:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMXBqE5ne9cv0xiUiF0J0gERTl+kim6fM6ar68YOt0pOe6F/MpD/FPhLjIggay1Y2kH7z9W6A00JtE6gg23TAKpa3EY+sLhaOxKphKeJq790IBLF6IJMezl0F/rjfj7W6w0SJZj0TdhFQ3pCIbk9e2uClNoIAoTDPpDPg2bQLb/GtEvknppnK2prW+s+ZNkK203TPESdmLfu4B1a7ilocX+3V8zztzMh32Jp9nS4wmOXoMSKkOoXzJwKZSEU/C41GiTzb+IDTstlSdUMSfdMCXI7JKHA/gNxbO+U5kPVuA6EMmUFABHLBQ4YbCt7SG80cvhrYPkBeZX82LVRkccoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFbutNqjk3KRMdN+dcBc7RtXO0p/5lhaUnzeiDwCtVM=;
 b=Vbt5sp2Ltm1MZaMt0YVviFEL1l/FfdS11lrRYEtfG+g6Nq4hfXVqrrO6H7Zx4ecMrdrhZLmp3bo1XkiSsfEzROZXUqTlA6WPeX59DWVfv5q1FM419AHt1dJlyGW+adgZmFMoBpiLODYkEAPNkeWr1vaGBQJ+OIM6DtThTCfdqhQu8hbI58vKXZcwfCUuM9miNymSVFEROBXJbCC3SEMBBIfgNQ0D5YTnJNX4wL4Ctu5cJ2p3hTkdbqozvKUQgGXjYoiACLBtm2UJW/tOtCh9gv+RaA9wmqBc+R+Inyl6chPuz6JBNWaW9hgfckYFI8WMH1GoR8pKUIHcgCYpuFRFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFbutNqjk3KRMdN+dcBc7RtXO0p/5lhaUnzeiDwCtVM=;
 b=avkIUS9aoZd/3ao/R9qg0PIoQMu1YUC3u6D8kO9QRNv4NyD2zCNzOYgSgu8Ta/dw5UPDek5mnPxXkOO2HN2WPBy15ae+ERSPieJGsMXY6Lj1xybAT0WjsyBH67Hla2jJdIzl/rFO2uLNZvsQghyc1rXhg6dFJg+MTodgGdgDhp3DKFqYoPtUHQd9XwAs7nFzJG8ZVahiFqFFp04IMvzZPStawUBD0Dc212eomblIK196fHhsS2aT8rDSNqkukWDAeQLBiyDiGE2qkAu9jt1ZqiyjWpfgJa9EMOhiE+XIhViicf3ESxFIl+gVpFW6YqRVcBaImq2tBSFHD4RsBv/sHg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1870.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Fri, 29 Mar
 2024 08:29:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 08:29:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v11 00/11] Support page table check PowerPC
Thread-Topic: [PATCH v11 00/11] Support page table check PowerPC
Thread-Index: AQHagMxYDPDvnI1/CkO3HAPKAXtN1bFMt4IAgAAR7gCAAZuCgA==
Date: Fri, 29 Mar 2024 08:29:59 +0000
Message-ID: <02ab19a2-cd5d-4205-8be5-d642f277c75d@csgroup.eu>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
 <5009c511-ec85-4d05-a106-8fca9189dd5d@csgroup.eu>
 <eb906bc3-b372-449b-a351-eb739ffa7418@csgroup.eu>
In-Reply-To: <eb906bc3-b372-449b-a351-eb739ffa7418@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1870:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ODdKmH3zCp+INKyE/8cPI9ifot7mMbOitoskdC066mzfQTIp7C5SjunI6oa51b1he1FA5hcskAf26m41/padMqQZIxjtBhPnIzxNLJfYNmEs/JltBRIPg5dEIxkbOAFC6FyyhruzFE/gytsfwvznlwoFvxgbE0AbTHfHUCk+n1KrgNphr29g8Ise5gc26AF16Y9Xpc3wnzYdPysmxXCM1ZakonzWCYhj025enMIo4E0NqMlnF16JYjrW36MGH4i026NoMlTMoXsaqkEYEAZt4GTSTNndSfgAhkd828/v5K/UPyOe4NyesBMdnNnkimTOzKMxETdyXbHkzwNiewo86bZAA2lqEMJPZYCzYMH46coDGtNyBNaJcLbYPlQ/s2kJro+1ElLvG7klqKq9h93dFJvAEYcb9MLRfRp1jdkYt7W5Zno2qgQKVXP+OyX8PybyharMWxR1MnU+1byVtxixebiIKCzJOPl/1DJFKWWG1Js1eb43zMInfYeHp3kC1MP2TtfRWxyyBKa548Eizcq0D2HmSFaS3gAKSV8+uDoexT/Y2RjHW0bDQQZZ+veRfnw40p4hnP1hDsRPV68j8FiT2yQk3SMVdv2Rz310rhK0k/0IEiUk6DA2q8u9L70fH+Sjg7COCD98Tpd3MEHIHDSHoOB5qrsVqe7D0+JwJpRYl4w=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NktlT2RpdGgyVjlhSmVHSXlxcmRuRERjak55anlJWTZ5Y3RNRm13ZkR3dFNx?=
 =?utf-8?B?S2NzazROeWFBNHpGMVJ3T0g3SEl0VWFpVDdxNmNWczdHZXJUUWtGczQyd21l?=
 =?utf-8?B?VVRVSTl1Z3I1QWkxTk9XbjR3M2d6ZzQrVjlDcm1Nazc4MUY0VkdiM083MUN1?=
 =?utf-8?B?elBWbjlBUnFWaC9acGRDTTJsdHJ1dUo0RGZYWXIrRVV5a3l5OWVLU3pCcTh5?=
 =?utf-8?B?T3hYTTlIczB1M1VHMjhFQjlPVElrU3gwSW40dkVNYXhzR0ZKZEVTaWxXaXZY?=
 =?utf-8?B?VG15T1JDcGtQZWNaS25DUGJMZ3JWeGsvemFjcVR5ZkJzblAveVFpN0NoY1g5?=
 =?utf-8?B?bVRFaXprYno2RkpVbWVyTmlZOXNTbVRxMnRUMlFiMXIxeC9xaEJrbjEzYVZK?=
 =?utf-8?B?RVJoTnRGNTExUk10Njd3MjBma2RtcHpjdEMyeEI4WWJ0eis3VDhoYjYzSkVq?=
 =?utf-8?B?T2w0KzEzc3dHaVd4cjVwZ2E4WlRDZDVrS0E3WW5Ec2x3cXo2M3hEMzZhajgw?=
 =?utf-8?B?bU52UHVYbWZ6eHZKVU5hZ3ZBME5GTjRjcDNFTG5vRVZkZlJFeEVFUjhRbFhj?=
 =?utf-8?B?NUNFdENZOGhBU1RpY2ZsYk5vK29TMElzdXdPYkxNZkdrd1FxeDJPb00xMG5T?=
 =?utf-8?B?TjU5N1Jveit5MzlvZGF0dCt5M3g2cndwbkpjZHlxc2VjM2RNU2ZYdXQ1a053?=
 =?utf-8?B?ekFhVFFMK0wrdkNVSHRCTXJZb1Zja2RjT2tydUxFMkxJc3ZVYjkrTkpIVHNS?=
 =?utf-8?B?akhZVFFiZGdNV1dHSCs3aGxxa3VsZE02TXlpbkpDV2k5Mks1MkxrWkRydDFC?=
 =?utf-8?B?c2tMMG9PMFEyTUZ2ZU9oT0NSTlJ4Rk5pUFM4bzRMVXNyOFBOSEF0cE5obFhF?=
 =?utf-8?B?MGlUL2hnMVhxQWdJT1V6NkFvWFJUcEpnTWtPZ09jM0tyQVBVeGNieTNwRXBS?=
 =?utf-8?B?cklPc0dBRC80QnZQT2toT3pscVdEVDNXblJKWEYrMHZXYWdaWG5mVDNxRnlS?=
 =?utf-8?B?TDlxTUZieDNxZVdFemI2cHR4bUN1SE9sQmpVeUZHbmk3RFNBeEdSWGRGNVBL?=
 =?utf-8?B?VEpwaFM4dVVQbTJ5TWI3NWh3Q0xYeWkrTEw3U0h5NDc1RDcvVWRMVVpSazdH?=
 =?utf-8?B?bnRXbURPTFZzbUs0RFRIL09hZGg5aHJVVmt1aHpkYU94SUVqaHRPZkJSNVFy?=
 =?utf-8?B?NHg3TWVyRnU5YnBZYnZhc2RoL1F3QzBrUm00cVNqclJ5K0ljN0JncE5hbGYv?=
 =?utf-8?B?MlZEUEhQVUpVMmErWGRHNkRBMUdpYmd4dy9kUmNqM2xObVFHS0tKSTVVT2l6?=
 =?utf-8?B?dmdXcjQrWDVjMm83L1ZiK0k5U09SUVNLRWZxa3BNOFpBYWl1RGJiV0N2RTJP?=
 =?utf-8?B?cWd4Zmk3aFpvM0hvd1BjVGx4VU9Fc0lCQnVYcis2WlJpZTVWemZrbC9XdHBD?=
 =?utf-8?B?MHc2YmlQYUU2am0xZkdVMko0WVZLNVFXMzJONEE5YjYxR2VnUEw0bHF4a0ZK?=
 =?utf-8?B?U0J2NWIzM05GWGQ5V1cvNFRlMXRMZEVFamtkY1NUQ1Y3UmszSDU4cGVaSDZZ?=
 =?utf-8?B?Y1VocEVpMVhyOHRrdUJ4TDJNSXZleFhsV3ZBVjEra2doNkxFdG1jak1Ma0V6?=
 =?utf-8?B?eStVLzl6ZEFaYUlyNlpyV2U0SkNDRWttdFRxS3RTR0dka2Q2QVhwS2lTdm9D?=
 =?utf-8?B?NkxwMVhFWDQrWGczakNNQTZFZ01WOTBOcFNQemFlYmJQdXdzVTZLeGxkdm5M?=
 =?utf-8?B?M29GdlhWTFo5elkyWnI1QSt5UEptcHVTL3hQblJSMC9LaDFWTjdQSlZxZUNv?=
 =?utf-8?B?aThpYTU0dUs5MDJTUS82eDQ0a0dPUmtlVWlPUEtaZ2VCbDVueDhyS3pyc2t6?=
 =?utf-8?B?MzNJZnNoSm1NWnFoYWdLM2NFRE5tVXRGWlE5THFGVXZFVS9ia3FuRGFuUnpI?=
 =?utf-8?B?VlJUUXFRTjdmSTQzSjJmLzBqSmluUHRPNGFTSlR6N0luUjdOV2hWcFAzREhQ?=
 =?utf-8?B?ZmtOZTY2TlBHZkJLVDBuVUpBZVNkVVFDMjdzQ1lMRlkrWVJpTkNzZFl0YXBL?=
 =?utf-8?B?SXk5TWY3UkV0SDlBZjIrQUdFWHY4QUExRlJoZ3hPWjhUbis5WTV0d2N6ZUM2?=
 =?utf-8?B?UjVxWG5tUzRxLzhHbGxqSWl3dEJPL1B3Mm4wZGV6Q2FMSi9ncWpWa2tJbmo5?=
 =?utf-8?Q?L3QQsMf/WTho36z7mx5926U0pdKWDy3pcr5IY/28YYr0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CB0A8E65A250240B171522881A8F36D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da7a6cf9-d035-48c9-c74a-08dc4fca6c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 08:29:59.4537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9sZN56EBQJLUCg/1jGpfE9y3g7ovie7XmvVu50A/5mtQX9xMnyR2JJjCk9fKysII8dtrBl10jY8abiN9eJwi2ljSc6osCTrRRGo95eDOEQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1870
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAzLzIwMjQgw6AgMDg6NTcsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAyOC8wMy8yMDI0IMOgIDA3OjUyLCBDaHJpc3RvcGhlIExlcm95IGEgw6lj
cml0wqA6DQo+Pg0KPj4NCj4+IExlIDI4LzAzLzIwMjQgw6AgMDU6NTUsIFJvaGFuIE1jTHVyZSBh
IMOpY3JpdMKgOg0KPj4+IFN1cHBvcnQgcGFnZSB0YWJsZSBjaGVjayBvbiBhbGwgUG93ZXJQQyBw
bGF0Zm9ybXMuIFRoaXMgd29ya3MgYnkNCj4+PiBzZXJpYWxpc2luZyBhc3NpZ25tZW50cywgcmVh
c3NpZ25tZW50cyBhbmQgY2xlYXJzIG9mIHBhZ2UgdGFibGUNCj4+PiBlbnRyaWVzIGF0IGVhY2gg
bGV2ZWwgaW4gb3JkZXIgdG8gZW5zdXJlIHRoYXQgYW5vbnltb3VzIG1hcHBpbmdzDQo+Pj4gaGF2
ZSBhdCBtb3N0IG9uZSB3cml0YWJsZSBjb25zdW1lciwgYW5kIGxpa2V3aXNlIHRoYXQgZmlsZS1i
YWNrZWQNCj4+PiBtYXBwaW5ncyBhcmUgbm90IHNpbXVsdGFuZW91c2x5IGFsc28gYW5vbnltb3Vz
IG1hcHBpbmdzLg0KPj4+DQo+Pj4gSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGlzIGluZnJhc3RydWN0
dXJlLCBhIG51bWJlciBvZiBzdHVicyBtdXN0IGJlDQo+Pj4gZGVmaW5lZCBmb3IgYWxsIHBvd2Vy
cGMgcGxhdGZvcm1zLiBBZGRpdGlvbmFsbHksIHNlcGVyYXRlIHNldF9wdGVfYXQoKQ0KPj4+IGFu
ZCBzZXRfcHRlX2F0X3VuY2hlY2tlZCgpLCB0byBhbGxvdyBmb3IgaW50ZXJuYWwsIHVuaW5zdHJ1
bWVudGVkIA0KPj4+IG1hcHBpbmdzLg0KPj4NCj4+IEkgZ2F2ZSBpdCBhIHRyeSBvbiBRRU1VIGU1
MDAgKDY0IGJpdHMpLCBhbmQgZ2V0IHRoZSBmb2xsb3dpbmcgT29wcy4gDQo+PiBXaGF0IGRvIEkg
aGF2ZSB0byBsb29rIGZvciA/DQo+Pg0KPj4gRnJlZWluZyB1bnVzZWQga2VybmVsIGltYWdlIChp
bml0bWVtKSBtZW1vcnk6IDI1ODhLDQo+PiBUaGlzIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBoYXZl
IGtlcm5lbCBtZW1vcnkgcHJvdGVjdGlvbi4NCj4+IFJ1biAvaW5pdCBhcyBpbml0IHByb2Nlc3MN
Cj4+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPj4ga2VybmVsIEJVRyBh
dCBtbS9wYWdlX3RhYmxlX2NoZWNrLmM6MTE5IQ0KPj4gT29wczogRXhjZXB0aW9uIGluIGtlcm5l
bCBtb2RlLCBzaWc6IDUgWyMxXQ0KPj4gQkUgUEFHRV9TSVpFPTRLIFNNUCBOUl9DUFVTPTMyIFFF
TVUgZTUwMA0KPiANCj4gU2FtZSBwcm9ibGVtIG9uIG15IDh4eCBib2FyZDoNCj4gDQo+IFvCoMKg
wqAgNy4zNTgxNDZdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSAoaW5pdG1lbSkgbWVtb3J5
OiA0NDhLDQo+IFvCoMKgwqAgNy4zNjM5NTddIFJ1biAvaW5pdCBhcyBpbml0IHByb2Nlc3MNCj4g
W8KgwqDCoCA3LjM3MDk1NV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+
IFvCoMKgwqAgNy4zNzU0MTFdIGtlcm5lbCBCVUcgYXQgbW0vcGFnZV90YWJsZV9jaGVjay5jOjEx
OSENCj4gW8KgwqDCoCA3LjM4MDM5M10gT29wczogRXhjZXB0aW9uIGluIGtlcm5lbCBtb2RlLCBz
aWc6IDUgWyMxXQ0KPiBbwqDCoMKgIDcuMzg1NjIxXSBCRSBQQUdFX1NJWkU9MTZLIFBSRUVNUFQg
Q01QQzg4NQ0KDQpCb3RoIHByb2JsZW1zIGFyZSBmaXhlZCBieSBmb2xsb3dpbmcgY2hhbmdlOg0K
DQpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxlLmgg
DQpiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQppbmRleCA0MTNk
MDFhNTFlNmYuLjViOTMyNjMyYTVkNyAxMDA2NDQNCi0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ub2hhc2gvcGd0YWJsZS5oDQorKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9o
YXNoL3BndGFibGUuaA0KQEAgLTI5LDYgKzI5LDggQEAgc3RhdGljIGlubGluZSBwdGVfYmFzaWNf
dCBwdGVfdXBkYXRlKHN0cnVjdCBtbV9zdHJ1Y3QgDQoqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwg
cA0KDQogICNpZm5kZWYgX19BU1NFTUJMWV9fDQoNCisjaW5jbHVkZSA8bGludXgvcGFnZV90YWJs
ZV9jaGVjay5oPg0KKw0KICBleHRlcm4gaW50IGljYWNoZV80NHhfbmVlZF9mbHVzaDsNCg0KICAv
Kg0KQEAgLTkyLDcgKzk0LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwdGVwX3NldF93cnByb3Rl
Y3Qoc3RydWN0IA0KbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLA0KICBzdGF0aWMg
aW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5z
aWduZWQgDQpsb25nIGFkZHIsDQogIAkJCQkgICAgICAgcHRlX3QgKnB0ZXApDQogIHsNCi0JcmV0
dXJuIF9fcHRlKHB0ZV91cGRhdGUobW0sIGFkZHIsIHB0ZXAsIH4wVUwsIDAsIDApKTsNCisJcHRl
X3Qgb2xkX3B0ZSA9IF9fcHRlKHB0ZV91cGRhdGUobW0sIGFkZHIsIHB0ZXAsIH4wVUwsIDAsIDAp
KTsNCisNCisJcGFnZV90YWJsZV9jaGVja19wdGVfY2xlYXIobW0sIGFkZHIsIG9sZF9wdGUpOw0K
Kw0KKwlyZXR1cm4gb2xkX3B0ZTsNCiAgfQ0KICAjZGVmaW5lIF9fSEFWRV9BUkNIX1BURVBfR0VU
X0FORF9DTEVBUg0KDQoNCg==
