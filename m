Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1B85F24A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 09:00:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=LxI6vt+l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgQYm4tw6z3dXN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 19:00:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=LxI6vt+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgQXx0x2hz2ykx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 19:00:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpG3wyKkltfZmNbShsJdVh1BSKEDS8EjpTuv7qgrGZ/F8zKKbwJMp+M8dxfv3XYh1TqEcQNLGyKwXOVaLeLcXwP9b4rA1EW+5sQxUPhGwtHZcYD3A8KEWtftVLGLGNrp3XznvypNdNalaLzFfWivB5qdvSYXvlvSM6wEZu5135y1O/OatQ4+rkn7R5LzcMe85AxRgUGASfcC06U1keucboWlwEPprjUwjcNDdTGAu3hc73+FMSCfm1s6EiBDh8rjqjCX47RiMeLaU/zHQziwBbCpH1ieeX157GXa8X+KjlaQIT+sJXOXakBSg9Ij/RnHDPm6DeFiR9prwj8qd4W2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg5fqCzyGLZ7gwArDuFmzR5F6o/mNY3hSkMJVmwgR8E=;
 b=YjaYG5Q4KcNUFfTkB57oIGXcYMw/psLvSsBYvBQATjppnGBtNHriCA1xe5s8v0qvoXF2HcZdmqTrKgrXGfP8OWXM3cWoVeYS1pSwGhDA8VCCyNFM3OOlo3mmz4B9kxUMVbSyomfsrSEZvhqVLz93BX3LqRIpKo/7pGAz3u0U8muU8yTrZkdt43YTnZm4YemWWvgWY3JrCbI2rvkSox0wCEbn6DSVlIRJGIe1rlApA9EiP/6JcZLSBkXtAUyd6xrsnkUfwC4Ho/cnvjE/eDiz/ZOIQb2fd3BsQR1JIf7QC83TMMsU6sm1CPyFcfHldjyiX7SBtRA9UZo1Knj4jtg9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lg5fqCzyGLZ7gwArDuFmzR5F6o/mNY3hSkMJVmwgR8E=;
 b=LxI6vt+lKqFNOizz6860v1LHdFYhVDzUIF1WHhMtK0GUROCKkGrOUEJGx2lXLsjTZdJ2bs0OS9ZK/TMsMEdWXav+0/rmwET7Boz7zvt6kS6wEr3YUllQPI5Exjl0zOK5Eunxg2lMcy0cG52cVErlmnEblGg7e+LHEDvaRb1Dq7qwly3LQKLuSYPBK/72voXGxaUg12mCy3VDfgmXwlqcjXYNMY4RMxvS2EtEpy8gRyUd2gLQrGClyKWV/DvjOFcSe7e6YgZQpJXOlmTY5rLByqpkTzQO0Mp7hmxhnyMDhQ/bsmiV3vVlhd8HKZb5qzXKZy5X/Vl1+yX4ZBpHGkuxdw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 07:59:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e%6]) with mapi id 15.20.7316.023; Thu, 22 Feb 2024
 07:59:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: Refactor __kernel_map_pages()
Thread-Topic: [PATCH 1/2] powerpc: Refactor __kernel_map_pages()
Thread-Index: AQHaYMFgMRjqhl+jVkK+Dr/ZCgbD2bEV34yAgAApFYA=
Date: Thu, 22 Feb 2024 07:59:34 +0000
Message-ID: <4e610204-492d-4e3f-9ae6-7b8084b523f9@csgroup.eu>
References:  <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
 <8734tlawsw.fsf@mail.lhotse>
In-Reply-To: <8734tlawsw.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2008:EE_
x-ms-office365-filtering-correlation-id: 2db6156f-0078-4cbb-520a-08dc337c3572
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rHjKVoB5wcEntgA3E/Q51ONp6Kp1mPyiDIcVq5GQa3PRVguV1HKXYUycfPCT4Dp+v+PpgCUaWTnIyI5f2+0shbL2owa46ar7/NzW+8gP2I5y5z0UGjQL7oqgluO79jrLDy2zJJuPK+fuZk+dw+8eFMoUkzeXkJlXecSIUiglGSmtzZpqiO3RxxT9fzE6R0bUlsxwG4HyXMdRWPF+vjOn41YbOI0Ao/WgvCVuKcNmI3VJYxCZiTZks8ULiW/FDMnvBlp5Z1mY+E5Tu31GhLOejQ/rBN5uzxj8OxVZj1zyd3h0wGiwyUBvybW9pZpb9PUCCd//1UOrWdJzZh3tuNw9piGrxB/A0jMmrkWbhBwUP+1tGrjtMVl0byxPkfEAM3PBaJdbye1AvP5gzgAaY5gVyy7Pok97pG51GMxSSSLbMzGsK9hsMbLf3p/qTgAWSwcJ1Um42k8A3wCcjb7+vqSRQ14kJ+ZBD0txSYVG5AsxA/BRQ1P2PjNHUg2vMI7hmVR9v5R/EijEXvyxxKLpT2sD1G1G3oLm9Ol+yKvCqUuP2nGpYImDFozLHo8PLLSGMuc3atWxQhnh7aQdy/gMc6o3kSsbTlqaJZ8s0GrOW3h9Caetg9v3Opjw/fa8HaxWosXk
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WFlYekRBQ1drbFhwYW1tTEFmS0pLK1VtTThSRkljQTh2NUFJKzhEeTZMMzI2?=
 =?utf-8?B?U2VXOEdIeDZ1bEU0R1I0Y1JVQ2ZQTGtMZXpLK2FUSithSzVnWVYyaWNUQXVk?=
 =?utf-8?B?QVdBWEljMG9qVXY5eXlmNC9kK0xCTHU5NUt4b1dON0FaTENkM3c0NjFRRktZ?=
 =?utf-8?B?U3VvZkhidTY4cHg5QTBEaUJBZ2VEeUx2YUhtMTdjcUJld25YcGpWQXlURzVM?=
 =?utf-8?B?UTNycFUwZnkvaU53RFh3QWlNY3VLY04yNVo3ajJGWjhQNU5YVjZ0TkNDeHNy?=
 =?utf-8?B?Q3RISHBCMXFoTGZwU0pQRzJGTjlOSUZiY2pHT0tmcnpIaXIyaWIvNkN0Ykc2?=
 =?utf-8?B?WTRnVVZ6eTRFOTl4ZHpBZlJabFRtODNWOE4wSDl0ckREVWNRbTVjWW9ZUDBw?=
 =?utf-8?B?VDRPUlcwNXJDU2FoMDdXeFI2aDQwOERIT3BQUTFKdTNWYXFTQzgyU2tXdG5D?=
 =?utf-8?B?WExvaXZLSlZLK3hqanVMNmQwdktLRkVTbEpVSW5wRnlvRmN3MUw5cjRMTUxV?=
 =?utf-8?B?dE12WEhlcDNlNGUrc3Q2SC9FUjJTbkZ3SWpiUTlIVW91S3AvRmFkTUN0eXAw?=
 =?utf-8?B?bit5ZTJidnlZSHk2U2tpWjFxUzNQd1duQzJrazlsUVRCdTk1M3BUcDI0Z0g3?=
 =?utf-8?B?YXBFT2RVT3ZCVmZVVWJZRXBxN1JIOG45bWptazJNWTQxdDZCKzYrMzljVEMx?=
 =?utf-8?B?aU9SalFpcjhpWkwxT0NPM1lrZ0tHTGFSWTBhMG1YdEp5MzBqMHJtSjh5UmZB?=
 =?utf-8?B?SlRFZlZSbkJQYjcwTGpnUkVlTDI0OWd2VDhlRGpBNU1PT1VrR2QrRmI5SSto?=
 =?utf-8?B?d2tvRzQ0RWEyemw5SDRvaDNRKythK09STEprUktLSWpGZmFadUtWWTU1MStz?=
 =?utf-8?B?RTJyRGdIbVlHbGQyeXp0eEZYb2ZvaFo3S1dmZTBYTWNOQTdNR2ZobFNtZUN1?=
 =?utf-8?B?UVFMWlZhRlpMMHhhL0RZc0xRMllOQ2xzT3lIeTZGQ2FUQ0U2OHJwWGZTMGFl?=
 =?utf-8?B?dHlsYzNyVHRLVUJXNU1OYU5HQnVaRE5MbytBemdtS1ZWWHI4V2FFeVZnRkE4?=
 =?utf-8?B?UkszRjNRU1QvUC9CT21iZ1JSSVNHWURQbEJRaEF2dmVVQ1NFR0UwVlozMm1F?=
 =?utf-8?B?RXJsRkpYY1QrM1JJL2RTZzNSQ2ZvandBVUhnaDViQ1B3cjdiVCs4R0x6Q0pH?=
 =?utf-8?B?eVMrQ3BjL285dlFFY2ljVVE1ekd3Z25ib082ekV3TkxBRHFnV0NzUU5FVEtm?=
 =?utf-8?B?ZjVJODVteVZMU3NwZ1VKK0N4cmVLazltdkFOTmY5Rk4yV2lITUlaMmVUNWFD?=
 =?utf-8?B?Z3JLWkkyVGdnMGRpOUlXOW1FL3F6cElBKzVKTEEwMmc4R1hva1d3M3FVWGxY?=
 =?utf-8?B?SnhCc2kvbitIZFVORFNCUWFQVXR1Y2ZmL01WdEVuYjFma2wwUWl1NWpZWXJT?=
 =?utf-8?B?eFlZVnk4eXFxWGQzZlZNRnhacTFvdWJPclNWMHMvN2N1L1VhckR1TWlVUnF6?=
 =?utf-8?B?RitFRlJKSDlaNlBjbU1YUW5wNW9uc05POUNaQlVKU1pDMWYzZWppRnVURmM1?=
 =?utf-8?B?eDBuNzJ5YWR5eXBCeW9leDYyWWVhTlZPblFWUVBMK0tpanozdVRYSmcvdDdn?=
 =?utf-8?B?RGhtdlE1RVZWQ1U2Nkc1NmZPbk0xVlF3SmxHNE05UGFKZGwxcGNMdWgzNU1O?=
 =?utf-8?B?bEhmWndRbmthYW1UL1RibFFCbnVGOWtGZzZTbDRUaW5heElnNjBiQ3RVenI0?=
 =?utf-8?B?ZGw3VElQVHA2bHdpV3M5aks3cWFlTmFxbE5VWnJ5cktPemdtUDhzUUJmK0lR?=
 =?utf-8?B?TnJ0YTU0d3JHTjlhenVUa3lROWRPdU9kWkkyZ1Y1V3I0aUwyNFo4NEM5WVhl?=
 =?utf-8?B?bmllM25JZVRYdXFYaFYremdwMnU5NWRQTjRtUVZhTVl2S3VXaGx2K2h3TGZS?=
 =?utf-8?B?d1VpNXpXTlNOSGVQRUhlendQNmZVaWljM05vaDU2OVhwZUJnZjA4V1hhbEUx?=
 =?utf-8?B?b0VHNllBZ0tSWGxrdzJaazEwM3dSZUJTSUF3UTZjYVp4cGNLNHBMUC9oejA4?=
 =?utf-8?B?RWJyYUp6SGlJbWprTlBHYUdkNml2dUEwMCs3cGlOU3ZOb05GWVZaTTlVbG1v?=
 =?utf-8?B?Mi8xUWFBT0lYOG5RTUhvV1pOeTdQZEcva3MxNFBiaS8rKzNlS2dLaWk3Q2lI?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <878E2673DC88424D9ECF341B5C5A1033@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db6156f-0078-4cbb-520a-08dc337c3572
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 07:59:34.4774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waMf8c7hwDNTm9sITnwNCSw18/+R3vK4aR1xRHDLb70jDBsJv4ewJn67eTvg7Xf7tj7o5NhMfFtrQVfN9aF8sjFoQgq2bBkhZgTa2eVxq+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2008
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjQgw6AgMDY6MzIsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBfX2tlcm5lbF9tYXBfcGFnZXMoKSBpcyBhbG1vc3QgaWRlbnRpY2FsIGZvciBQUEMzMiBh
bmQgUkFESVguDQo+Pg0KPj4gUmVmYWN0b3IgaXQuDQo+Pg0KPj4gT24gUFBDMzIgaXQgaXMgbm90
IG5lZWRlZCBmb3IgS0ZFTkNFLCBidXQgdG8ga2VlcCBpdCBzaW1wbGUNCj4+IGp1c3QgbWFrZSBp
dCBzaW1pbGFyIHRvIFBQQzY0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCB8IDEwIC0tLS0tLS0tLS0NCj4+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9yYWRpeC5oICAgfCAgMiAtLQ0KPj4g
ICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jICAgICB8IDE0IC0tLS0t
LS0tLS0tLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9tbS9wYWdlYXR0ci5jICAgICAgICAgICAgICAg
ICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKw0KPj4gICBhcmNoL3Bvd2VycGMvbW0vcGd0YWJs
ZV8zMi5jICAgICAgICAgICAgICAgICB8IDE1IC0tLS0tLS0tLS0tLS0tLQ0KPj4gICA1IGZpbGVz
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vcGFnZWF0dHIuYyBiL2FyY2gvcG93ZXJwYy9tbS9wYWdl
YXR0ci5jDQo+PiBpbmRleCA0MjFkYjdjNGYyYTQuLjE2YjhkMjBkNmNhOCAxMDA2NDQNCj4+IC0t
LSBhL2FyY2gvcG93ZXJwYy9tbS9wYWdlYXR0ci5jDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0v
cGFnZWF0dHIuYw0KPj4gQEAgLTEwMSwzICsxMDEsMjIgQEAgaW50IGNoYW5nZV9tZW1vcnlfYXR0
cih1bnNpZ25lZCBsb25nIGFkZHIsIGludCBudW1wYWdlcywgbG9uZyBhY3Rpb24pDQo+PiAgIAly
ZXR1cm4gYXBwbHlfdG9fZXhpc3RpbmdfcGFnZV9yYW5nZSgmaW5pdF9tbSwgc3RhcnQsIHNpemUs
DQo+PiAgIAkJCQkJICAgIGNoYW5nZV9wYWdlX2F0dHIsICh2b2lkICopYWN0aW9uKTsNCj4+ICAg
fQ0KPj4gKw0KPj4gKyNpZiBkZWZpbmVkKENPTkZJR19ERUJVR19QQUdFQUxMT0MpIHx8IGRlZmlu
ZWQoQ09ORklHX0tGRU5DRSkNCj4+ICsjaWZkZWYgQ09ORklHX0FSQ0hfU1VQUE9SVFNfREVCVUdf
UEFHRUFMTE9DDQo+PiArdm9pZCBfX2tlcm5lbF9tYXBfcGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2Us
IGludCBudW1wYWdlcywgaW50IGVuYWJsZSkNCj4+ICt7DQo+PiArCXVuc2lnbmVkIGxvbmcgYWRk
ciA9ICh1bnNpZ25lZCBsb25nKXBhZ2VfYWRkcmVzcyhwYWdlKTsNCj4+ICsNCj4+ICsJaWYgKFBh
Z2VIaWdoTWVtKHBhZ2UpKQ0KPj4gKwkJcmV0dXJuOw0KPj4gKw0KPj4gKwlpZiAoSVNfRU5BQkxF
RChDT05GSUdfUFBDX0JPT0szU182NCkgJiYgIXJhZGl4X2VuYWJsZWQoKSkNCj4+ICsJCWhhc2hf
X2tlcm5lbF9tYXBfcGFnZXMocGFnZSwgbnVtcGFnZXMsIGVuYWJsZSk7DQo+PiArCWVsc2UgaWYg
KGVuYWJsZSkNCj4+ICsJCXNldF9tZW1vcnlfcChhZGRyLCBudW1wYWdlcyk7DQo+PiArCWVsc2UN
Cj4+ICsJCXNldF9tZW1vcnlfbnAoYWRkciwgbnVtcGFnZXMpOw0KPj4gK30NCj4gDQo+IFRoaXMg
ZG9lc24ndCBidWlsZCBvbiAzMi1iaXQsIGVnLiBwcGMzMl9hbGxtb2Rjb25maWc6DQo+IA0KPiAu
Li9hcmNoL3Bvd2VycGMvbW0vcGFnZWF0dHIuYzogSW4gZnVuY3Rpb24gJ19fa2VybmVsX21hcF9w
YWdlcyc6DQo+IC4uL2FyY2gvcG93ZXJwYy9tbS9wYWdlYXR0ci5jOjExNjoyMzogZXJyb3I6IGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdoYXNoX19rZXJuZWxfbWFwX3BhZ2VzJyBb
LVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4gICAgMTE2IHwgICAgICAg
ICAgICAgICAgIGVyciA9IGhhc2hfX2tlcm5lbF9tYXBfcGFnZXMocGFnZSwgbnVtcGFnZXMsIGVu
YWJsZSk7DQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+DQo+IA0KPiBJIGNvdWxkbid0IHNlZSBhIG5pY2Ugd2F5IHRvIGdldCBhcm91bmQgaXQs
IHNvIGVuZGVkIHVwIHdpdGg6DQo+IA0KPiB2b2lkIF9fa2VybmVsX21hcF9wYWdlcyhzdHJ1Y3Qg
cGFnZSAqcGFnZSwgaW50IG51bXBhZ2VzLCBpbnQgZW5hYmxlKQ0KPiB7DQo+IAlpbnQgZXJyOw0K
PiAJdW5zaWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcGFnZV9hZGRyZXNzKHBhZ2Up
Ow0KPiANCj4gCWlmIChQYWdlSGlnaE1lbShwYWdlKSkNCj4gCQlyZXR1cm47DQo+IA0KPiAjaWZk
ZWYgQ09ORklHX1BQQ19CT09LM1NfNjQNCj4gCWlmICghcmFkaXhfZW5hYmxlZCgpKQ0KPiAJCWVy
ciA9IGhhc2hfX2tlcm5lbF9tYXBfcGFnZXMocGFnZSwgbnVtcGFnZXMsIGVuYWJsZSk7DQo+IAll
bHNlDQo+ICNlbmRpZg0KPiAJaWYgKGVuYWJsZSkNCj4gCQllcnIgPSBzZXRfbWVtb3J5X3AoYWRk
ciwgbnVtcGFnZXMpOw0KPiAJZWxzZQ0KPiAJCWVyciA9IHNldF9tZW1vcnlfbnAoYWRkciwgbnVt
cGFnZXMpOw0KPiANCg0KDQpJIG1pc3NlZCBzb21ldGhpbmcgaXQgc2VlbXMuIE5vdCBnb29kIHRv
IGxlYXZlIHNvbWV0aGluZyB1bnRlcm1pbmF0ZWQgDQp3aGVuIHlvdSBsZWF2ZSBmb3IgdmFjYXRp
b24gYW5kIHRoaW5rIGl0IHdhcyBmaW5pc2hlZCB3aGVuIHlvdSBjb21lIGJhY2suDQoNClRoZSBi
ZXN0IHNvbHV0aW9uIEkgc2VlIGlzIHRvIG1vdmUgaGFzaF9fa2VybmVsX21hcF9wYWdlcygpIHBy
b3RvdHlwZSANCnNvbWV3aGVyZSBlbHNlLg0KDQokIGdpdCBncmVwIC1lIGhhc2hfXyAtZSByYWRp
eF9fIC0tIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS8qLmgNCmFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9idWcuaDp2b2lkIGhhc2hfX2RvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKik7DQph
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbW11Lmg6ZXh0ZXJuIHZvaWQgcmFkaXhfX21tdV9jbGVh
bnVwX2FsbCh2b2lkKTsNCmFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oOmV4
dGVybiB2b2lkIA0KcmFkaXhfX3N3aXRjaF9tbXVfY29udGV4dChzdHJ1Y3QgbW1fc3RydWN0ICpw
cmV2LA0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0Lmg6ICAgICAgICAgcmV0
dXJuIA0KcmFkaXhfX3N3aXRjaF9tbXVfY29udGV4dChwcmV2LCBuZXh0KTsNCmFyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oOmV4dGVybiBpbnQgDQpoYXNoX19hbGxvY19jb250
ZXh0X2lkKHZvaWQpOw0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0Lmg6dm9p
ZCBfX2luaXQgDQpoYXNoX19yZXNlcnZlX2NvbnRleHRfaWQoaW50IGlkKTsNCmFyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oOiBjb250ZXh0X2lkID0gDQpoYXNoX19hbGxvY19j
b250ZXh0X2lkKCk7DQphcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaDogICog
cmFkaXhfX2ZsdXNoX2FsbF9tbSgpIHRvIA0KZGV0ZXJtaW5lIHRoZSBzY29wZSAobG9jYWwvZ2xv
YmFsKQ0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0Lmg6ICAgICAgICAgcmFk
aXhfX2ZsdXNoX2FsbF9tbShtbSk7DQoNCg0KTWF5YmUgYXNtL21tdS5oID8NCg0KT3IgbW0vbW11
X2RlY2wuaCA/DQoNCkNocmlzdG9waGUNCg==
