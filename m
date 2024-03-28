Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123188F75D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 06:41:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Y8Ibo2om;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4sqR1rbWz3vhF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 16:41:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Y8Ibo2om;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4spk50pKz3vXH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 16:41:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6mItfUSd1XOVTaP/DSJN+sZN+vaUZUZ2yhLG/yS/wxMgmmd2Lp9Vp89pOQ50fwgzOmB+Ec38LTfEJIa2kcO1vm/3hNdvDMkhOUswgELbSan+9a3g2uIKExuCpSI5XdQp4RZLsyU7Vkq5fHuxRJ9YgH2tAwdfhLPZswMRD/NfD4t+Jp8BPFCleWqOCbuDUBhqqdAZFO3PUxbcLka/RNlxV4W1g5bDuuP5/YRpuiBu5AMtCAUZ+iTAQiOqJdOZlas0l0WEgMToRR31oIvbrhdvdqq/WMsxnzgIqNk0jOobbdQvacqOymF/uKlDZjfxxZhWp58WGWaeqd6RS8F3SKy3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUaVnf9SUqkb3BRxD5FwQfT64L+Ul9OxOfG2Mlpby2g=;
 b=BEhE0CPCF9/YVfONxv90zFqaL5aYDZTL3kdP7XPNOKq1k2uiX536j2HSC1MSYFqrRUs17rlplive1vjjDhG10mLCEnQdWWYYPR7pAI/Nv61UPu3diAjQDRvJthP6d4z6LDKTwUhLqDN8BKgxKdYdNPxUFbukfiIpeFCP0im/Gqxzp0uVeBgIv3pxcvuPPtnlf69BpAmeDeKZSUj6e41IKWSST/04Q1Uv0ih0LRoTngaxNbps9cNuQJXstk7Uqg0kmQciPnd6n4XDLJ4OGDmg1YucnQuJtu/q2n9mK6Vi4DXePX0xwmSm2ZxeEdzkfxlYCHzYeJP+s86Fi/Gw2e4nGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUaVnf9SUqkb3BRxD5FwQfT64L+Ul9OxOfG2Mlpby2g=;
 b=Y8Ibo2omjxYEAa1DfglFYX9zosznZucXekKMzOSSwOnr76++e6pYWGtyb5IeU5Jcc7iyPB+OGlnjDtV0YOgEiwobqiWDukJLowo/JzdfcO0QqDm7Im+BlaE0m527E6JdnSNGTkb9xqSL+Id1nrjXev/6mzh7X51SCEFUw5qLZmWTAr/h8SsC5V7eIOk+sHsYklyUO/7TqX+VgUe5mxn2f2fStDRLJusvgKsAU3eHrAk2HjQeR2bS9raeH+XYRNCw0hSKJ1b/S8BhsyUy3lJVotfOy6NDnGA76zztRfYFS+uncoy2nCmKzbe45Omjbrgc/APAZWPwPR8fZYSlMsHThQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3373.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 05:40:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.038; Thu, 28 Mar 2024
 05:40:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v11 09/11] poweprc: mm: Implement *_user_accessible_page()
 for ptes
Thread-Topic: [PATCH v11 09/11] poweprc: mm: Implement
 *_user_accessible_page() for ptes
Thread-Index: AQHagMxx/V7ysfFio0G8sAlZxysQn7FMo2QA
Date: Thu, 28 Mar 2024 05:40:53 +0000
Message-ID: <3fcc8331-28ed-458f-b7f6-ba1f161eb09e@csgroup.eu>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
 <20240328045535.194800-12-rmclure@linux.ibm.com>
In-Reply-To: <20240328045535.194800-12-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3373:EE_
x-ms-office365-filtering-correlation-id: 3c0e6e3d-e2c5-4227-8603-08dc4ee9a229
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0H/B7LBBMCqSZzzWiCq0TQAVNcOKfvTHqmCkEf6XcYN5P8roQ4adjM8RNUFe8VXKnCBQYOF5T+U/ALw+zKdMXKyum/E3QRAf8ltpu/2iC5DEgnvM09BUzrsZa8ZxsMv+Fp/lPcV3/pa2+CpRZ9Segqub50pnlqzsV12cnJMijI/HdpO32a7h1+uKhFDP4vbI9nQRvAXDP8hWr9WELWuaySNQ3OtpfSYIGtztPIaWWeMa4xGMMuHOGQTHdbtTM88q5Ak9jTHhDq8ZN5NE2PcTeYLDaTtNh+tChVWgY+bwaYjrmJKnMOxSZo7klLd7dvQS/jHLgN3McTkXcv1Jp27UcWCzcXZl4MmobkKW+w2vNEBfrALsQVqJQ2McCJhJrfaVTPP1CqMN2r+R7torV/YzJneWiR3uR93E2tXFVjPAwwAhPQRWm5OMGWe/dq2Y6nY83KjQslOwmySei5pYsHmBj3LPQ8B6INnVWXcTQxd/ez8AV8Zei8mk/EZUe3nEfBJS8mBCxbESuTWx2PcaYrr27gJIwWl62emJPBRgyl1nW5fB0oNLuYbwF379FGMbVEeb5cyYaU+6ULNEm/X1PhDW7uu3XQL8GoFdayekTfbnmFCOlwwHlLhL1HPsKx+S1hkO87sQ8oq4buehoKfhhUzzEw+hj7gJc4oG62sPBaCGfQfc4ghcqq7PicZRzyhYU9wUmXtgcXvHdHxj49GJiPK/pA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QWU2UUc1cnVhb3VBR2lKR1Z1NTVuenVtcHpwSjVrd29BNU5GeGxTQVltVzlp?=
 =?utf-8?B?ZEdaZVZXblhLeExXbXI4TzVMRVBBQUgvZk04MHlseWZUTHgwMFQ0QVNmcHpH?=
 =?utf-8?B?Y2swWi9ib0x3bWRPM2NOVXIvTnFwQzMxSWN3WWVSQUdMREdxdnM0WjFDTitz?=
 =?utf-8?B?RkNVUDNiTjJ2d1g0dURiZXlRSVc5WmVlOUR4RHZiT0poaWx5YzVLK09lMVA1?=
 =?utf-8?B?K1hLVGhkU0xxMWM3ZDcwalZ4TTZUSXBCc3dwdWg1Q2ZQVmY1bkh5WDVBSUlL?=
 =?utf-8?B?ZDA3UFFxYjcrbHhiUk1QWWxRQ2htR0dEVFpPQ1dCRU40TW5KWDJ0MlFydjBP?=
 =?utf-8?B?aUgwMWtCVTJnQ1pOeGZST1F4UWR0eG5MMmc5TWxMUlI5TGcrY05ERDE3azR6?=
 =?utf-8?B?UTlRaDJHMkYreEdTT3V6U2hET1ZJcjh1bEJoSTdCb0NjTlozOG96SHhOWUFx?=
 =?utf-8?B?elpNUHQwREx6YklxajMyQVFIMWpCcVROY3FnMXVSOCtPNFpXTkEwMFBvaWg3?=
 =?utf-8?B?RW0zVDlUYmIxdjZzM2ptNytxdzBJNmlldXp1S3owb0p2bXZCOVFRRVZUY2xl?=
 =?utf-8?B?M29RV0M0Tm9wL1kvR05lUTdWV21YZGxWdnhEQngrMTR0NjQ2Zy9vMzF5S08y?=
 =?utf-8?B?TzZQSXI4YTZYd3ZsQ3ZwL3ZPd0JrZmFkQW5vY0I0OVZsb0ZYbVdSL0ZiRk94?=
 =?utf-8?B?VkpsMFl4MzNWQjhoQW54QWJUYXVKbE9Ba2swaG9tM01tbTZvWkkzY1dmV2F1?=
 =?utf-8?B?QjdpeVNNK3QzZWlQSExHQnh5YWZTcitkRXc0cE1reDNVK2hsTFg4MWRmQ0hY?=
 =?utf-8?B?TU9TanBpcFFYNGVRdCtienFNeXIzSWNkU1JsYjRib3kvZnpDTGVweGRZSkNh?=
 =?utf-8?B?RDg4TlVaZ3V0dElzcXE2dzI2QjFrOWpuT21Ua0l0aDNKMjNqMEJzTEtBUGFQ?=
 =?utf-8?B?cHlQdlpkWEVxRTlaek5LajdHdXZ1aWNDek4zZWpqcFN1K2RIaFRqS1crSkpX?=
 =?utf-8?B?UENucDYyQmZ2eVVqOSt0SHRCZDNPR24vZkF4d016djQyUXd3aUZhM3lISmVu?=
 =?utf-8?B?VVBCUy9KOUEzZTM5TzJTMUJCeGdVb2dEaDlZOXAwdUlyMTJqeFBPUG5BVC9t?=
 =?utf-8?B?WmNCM3VYcXEwZjlDR01hbDlTbE1CMy8ydHFvUktXeitVNzNTa3M2WjAveTRn?=
 =?utf-8?B?WTBPem5TTFVYVkJQdWR1eHBPRlp6QzZ5UTlZaDkwNWZMNVgrUFRiRkJJdjZD?=
 =?utf-8?B?cWRhRXRPSEFXVnVRUTRnbitoeXBuSklDMkJReGU4QzVjU2V5Qi9SS0l3VDdL?=
 =?utf-8?B?UTJSNjlKZ1NwWmZLNWFHR1dMM1ZqUzdBUGd3VFFCZTlqeUlIeDdlQzl6VkJ5?=
 =?utf-8?B?cndqL000RzRSeWJ0VXg5enczYnd6VXJsZkNueGNPOGY4UTNuME9PblFIOUxH?=
 =?utf-8?B?ZDZNb3FhaURQdFRva3U1M2xtdkdoUGovaFdxbURKcy9tYnVQTGw2eEVmOXpr?=
 =?utf-8?B?cFFmZHlnUWN6TlBUTGlVME04RWsvWXdjWjF1WXNDSnUwWDQyV2w4TzM0V25p?=
 =?utf-8?B?VWtxdVp4MWd4b0pNcGthanpYMGJuVksxcWY1WWJ3SzhoSHBJYStQTGhtam81?=
 =?utf-8?B?T0pHb2VHOFlEQXV3RllZTjh4ektUQy9PUVVPZ0JHTzZZb0g4RTVwbWJFWExy?=
 =?utf-8?B?MXRRY1d2WG1kWjA4L1BrR2I3UkRPTi9VaFhxTFZMU0xCRk45aW9rbUVKTFRW?=
 =?utf-8?B?Rm9OTVIveUMvWkQ3VVVNNmJsOXd5T0NYV3A5OUFJYVp0d1ErYXhpRmROM0xO?=
 =?utf-8?B?VnBBOVdvQ3lmWnh2eExlQ0FvYmg5eGRCaFFWT1dDV2FqWXA0Y0NYWWJWczdU?=
 =?utf-8?B?NnZXbDlaL3N5cWNwUUhXR3ZGR2tzQnNRMUIwYmlXWmpVc3lpZk15OFhQbGpD?=
 =?utf-8?B?ZkVrYjMrc2VxQm1nbG81aTllQmpKejhPSzg3bCtlYlZEQ2Vmdk9kYk4xV21Q?=
 =?utf-8?B?eTFsZFpMTWtVSzVHSUlDM2hpaHdjdmpCNkViYXNFSjd2STh1cjcrQmVuM2c4?=
 =?utf-8?B?UWpGbDdQV053enE3dmJTTVcrNDlwNy9rMUVUTWlBT25YZzhGTTIvNzFiV3VW?=
 =?utf-8?B?eERrUlZHNkJObHJsZk8zalpPdU9jRFFkUTh4SlN1U3A1YU9pdVIwWGltWkpz?=
 =?utf-8?B?Rm1IRjhkM0ZVWG5lNjJZRS9oTkNBdUU3QzlVdVVDSERMQ0VNMGw1SzlIUHlY?=
 =?utf-8?B?SUhFZkdESk9NNGp4TXRGRE5ubDlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFAD12EDEECBC040A1B51182B0B9DC33@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0e6e3d-e2c5-4227-8603-08dc4ee9a229
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 05:40:53.3913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trNrpoUZ40iNhJgu+rgBwQmyssBHTTzKhuQm2JaTfTNc3hmkecaBUJEOMb6rGBYmczk3a1d3081iSBIeHZ96FBHoUUg8VU3LCT/Ir4f4wHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3373
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

DQoNCkxlIDI4LzAzLzIwMjQgw6AgMDU6NTUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBQ
YWdlIHRhYmxlIGNoZWNraW5nIGRlcGVuZHMgb24gYXJjaGl0ZWN0dXJlcyBwcm92aWRpbmcgYW4N
Cj4gaW1wbGVtZW50YXRpb24gb2YgcHt0ZSxtZCx1ZH1fdXNlcl9hY2Nlc3NpYmxlX3BhZ2UuIFdp
dGgNCj4gcmVmYWN0b3Jpc2F0aW9ucyBtYWRlIG9uIHBvd2VycGMvbW0sIHRoZSBwdGVfYWNjZXNz
X3Blcm1pdHRlZCgpIGFuZA0KPiBzaW1pbGFyIG1ldGhvZHMgdmVyaWZ5IHdoZXRoZXIgYSB1c2Vy
bGFuZCBwYWdlIGlzIGFjY2Vzc2libGUgd2l0aCB0aGUNCj4gcmVxdWlyZWQgcGVybWlzc2lvbnMu
DQo+IA0KPiBTaW5jZSBwYWdlIHRhYmxlIGNoZWNraW5nIGlzIHRoZSBvbmx5IHVzZXIgb2YNCj4g
cHt0ZSxtZCx1ZH1fdXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKSwgaW1wbGVtZW50IHRoZXNlIGZvciBh
bGwgcGxhdGZvcm1zLA0KPiB1c2luZyBzb21lIG9mIHRoZSBzYW1lIHByZWxpbWluYXJ5IGNoZWNr
cyB0YWtlbiBieSBwdGVfYWNjZXNzX3Blcm1pdHRlZCgpDQo+IG9uIHRoYXQgcGxhdGZvcm0uDQo+
IA0KPiBTaW5jZSBDb21taXQgOGU5YmQ0MWU0Y2UxICgicG93ZXJwYy9ub2hhc2g6IFJlcGxhY2Ug
cHRlX3VzZXIoKSBieSBwdGVfcmVhZCgpIikNCj4gcHRlX3VzZXIoKSBpcyBubyBsb25nZXIgcmVx
dWlyZWQgdG8gYmUgcHJlc2VudCBvbiBhbGwgcGxhdGZvcm1zIGFzIGl0DQo+IG1heSBiZSBlcXVp
dmFsZW50IHRvIG9yIGltcGxpZWQgYnkgcHRlX3JlYWQoKS4gSGVuY2UgaW1wbGVtZW50YXRpb25z
IG9mDQo+IHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZSgpIGFyZSBzcGVjaWFsaXNlZC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5pYm0uY29tPg0KPiAt
LS0NCj4gdjk6IE5ldyBpbXBsZW1lbnRhdGlvbg0KPiB2MTA6IExldCBib29rM3MvNjQgdXNlIHB0
ZV91c2VyKCksIGJ1dCBvdGhlcndpc2UgZGVmYXVsdCBvdGhlciBwbGF0Zm9ybXMNCj4gdG8gdXNp
bmcgdGhlIGFkZHJlc3MgcHJvdmlkZWQgd2l0aCB0aGUgY2FsbCB0byBpbmZlciB3aGV0aGVyIGl0
IGlzIGENCj4gdXNlciBwYWdlIG9yIG5vdC4gcG1kL3B1ZCB2YXJpYW50cyB3aWxsIHdhcm4gb24g
YWxsIG90aGVyIHBsYXRmb3JtcywgYXMNCj4gdGhleSBzaG91bGQgbm90IGJlIHVzZWQgZm9yIHVz
ZXIgcGFnZSBtYXBwaW5ncw0KPiB2MTE6IENvbmRpdGlvbmFsbHkgZGVmaW5lIHB7bSx1fWRfdXNl
cl9hY2Nlc3NpYmxlX3BhZ2UoKSwgYXMgbm90IGFsbA0KPiBwbGF0Zm9ybXMgaGF2ZSBwe20sdX1k
X2xlYWYoKSwgcHttLHV9ZF9wdGUoKSBzdHVicy4NCg0KU2VlIG15IGNvbW1lbnQgdG8gdjEwIHBh
dGNoIDEwLg0KDQpwe20sdX1kX2xlYWYoKSBpcyBkZWZpbmVkIGZvciBhbGwgcGxhdGZvcm1zIChU
aGVyZSBpcyBhIGZhbGxiYWNrIA0KZGVmaW5pdGlvbiBpbiBpbmNsdWRlL2xpbnV4L3BndGFibGUu
aCkgc28gcHttLHV9ZF91c2VyX2FjY2Vzc2libGVfcGFnZSgpIA0KY2FuIGJlIGRlZmluZWQgZm9y
IGFsbCBwbGF0Zm9ybXMsIG5vIG5lZWQgZm9yIGEgY29uZGl0aW9uYWxseSBkZWZpbmUuDQoNCj4g
LS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmggfCAg
NSArKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5o
IHwgMTcgKysrKysrKysrKysrKysrKysNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9o
YXNoL3BndGFibGUuaCAgICB8ICA1ICsrKysrDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3BndGFibGUuaCAgICAgICAgICAgfCAgOCArKysrKysrKw0KPiAgIDQgZmlsZXMgY2hhbmdlZCwg
MzUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2sz
cy8zMi9wZ3RhYmxlLmgNCj4gaW5kZXggNTI5NzFlZTMwNzE3Li44M2Y3Yjk4ZWY0OWYgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oDQo+IEBA
IC00MzYsNiArNDM2LDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwdGVfYWNjZXNzX3Blcm1pdHRl
ZChwdGVfdCBwdGUsIGJvb2wgd3JpdGUpDQo+ICAgCXJldHVybiB0cnVlOw0KPiAgIH0NCj4gICAN
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHRlX3QgcHRl
LCB1bnNpZ25lZCBsb25nIGFkZHIpDQo+ICt7DQo+ICsJcmV0dXJuIHB0ZV9wcmVzZW50KHB0ZSkg
JiYgIWlzX2tlcm5lbF9hZGRyKGFkZHIpOw0KPiArfQ0KPiArDQo+ICAgLyogQ29udmVyc2lvbiBm
dW5jdGlvbnM6IGNvbnZlcnQgYSBwYWdlIGFuZCBwcm90ZWN0aW9uIHRvIGEgcGFnZSBlbnRyeSwN
Cj4gICAgKiBhbmQgYSBwYWdlIGVudHJ5IGFuZCBwYWdlIGRpcmVjdG9yeSB0byB0aGUgcGFnZSB0
aGV5IHJlZmVyIHRvLg0KPiAgICAqDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29r
M3MvNjQvcGd0YWJsZS5oDQo+IGluZGV4IGZhYzU2MTVlNmJjNS4uZDg2NDBkZGJjYWQxIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0K
PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBA
QCAtNTM4LDYgKzUzOCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHRlX2FjY2Vzc19wZXJtaXR0
ZWQocHRlX3QgcHRlLCBib29sIHdyaXRlKQ0KPiAgIAlyZXR1cm4gYXJjaF9wdGVfYWNjZXNzX3Bl
cm1pdHRlZChwdGVfdmFsKHB0ZSksIHdyaXRlLCAwKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
aW5saW5lIGJvb2wgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0ZV90IHB0ZSwgdW5zaWduZWQg
bG9uZyBhZGRyKQ0KPiArew0KPiArCXJldHVybiBwdGVfcHJlc2VudChwdGUpICYmIHB0ZV91c2Vy
KHB0ZSk7DQo+ICt9DQo+ICsNCj4gICAvKg0KPiAgICAqIENvbnZlcnNpb24gZnVuY3Rpb25zOiBj
b252ZXJ0IGEgcGFnZSBhbmQgcHJvdGVjdGlvbiB0byBhIHBhZ2UgZW50cnksDQo+ICAgICogYW5k
IGEgcGFnZSBlbnRyeSBhbmQgcGFnZSBkaXJlY3RvcnkgdG8gdGhlIHBhZ2UgdGhleSByZWZlciB0
by4NCj4gQEAgLTE0NDEsNSArMTQ0NiwxNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHVkX2xlYWYo
cHVkX3QgcHVkKQ0KPiAgIAlyZXR1cm4gISEocHVkX3JhdyhwdWQpICYgY3B1X3RvX2JlNjQoX1BB
R0VfUFRFKSk7DQo+ICAgfQ0KPiAgIA0KPiArI2RlZmluZSBwbWRfdXNlcl9hY2Nlc3NpYmxlX3Bh
Z2UgcG1kX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1kX3Vz
ZXJfYWNjZXNzaWJsZV9wYWdlKHBtZF90IHBtZCwgdW5zaWduZWQgbG9uZyBhZGRyKQ0KPiArew0K
PiArCXJldHVybiBwbWRfbGVhZihwbWQpICYmIHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwbWRf
cHRlKHBtZCksIGFkZHIpOw0KPiArfQ0KPiArDQo+ICsjZGVmaW5lIHB1ZF91c2VyX2FjY2Vzc2li
bGVfcGFnZSBwdWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBw
dWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHVkX3QgcHVkLCB1bnNpZ25lZCBsb25nIGFkZHIpDQo+
ICt7DQo+ICsJcmV0dXJuIHB1ZF9sZWFmKHB1ZCkgJiYgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdl
KHB1ZF9wdGUocHVkKSwgYWRkcik7DQo+ICt9DQo+ICsNCj4gICAjZW5kaWYgLyogX19BU1NFTUJM
WV9fICovDQo+ICAgI2VuZGlmIC8qIF9BU01fUE9XRVJQQ19CT09LM1NfNjRfUEdUQUJMRV9IXyAq
Lw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxl
LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaA0KPiBpbmRleCA0
MjdkYjE0MjkyYzkuLjQxM2QwMWE1MWU2ZiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL25vaGFzaC9wZ3RhYmxlLmgNCj4gQEAgLTIxMyw2ICsyMTMsMTEgQEAgc3RhdGljIGlubGlu
ZSBib29sIHB0ZV9hY2Nlc3NfcGVybWl0dGVkKHB0ZV90IHB0ZSwgYm9vbCB3cml0ZSkNCj4gICAJ
cmV0dXJuIHRydWU7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGlubGluZSBib29sIHB0ZV91c2Vy
X2FjY2Vzc2libGVfcGFnZShwdGVfdCBwdGUsIHVuc2lnbmVkIGxvbmcgYWRkcikNCj4gK3sNCj4g
KwlyZXR1cm4gcHRlX3ByZXNlbnQocHRlKSAmJiAhaXNfa2VybmVsX2FkZHIoYWRkcik7DQo+ICt9
DQo+ICsNCj4gICAvKiBDb252ZXJzaW9uIGZ1bmN0aW9uczogY29udmVydCBhIHBhZ2UgYW5kIHBy
b3RlY3Rpb24gdG8gYSBwYWdlIGVudHJ5LA0KPiAgICAqIGFuZCBhIHBhZ2UgZW50cnkgYW5kIHBh
Z2UgZGlyZWN0b3J5IHRvIHRoZSBwYWdlIHRoZXkgcmVmZXIgdG8uDQo+ICAgICoNCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IGVlOGM4MmMwNTI4Zi4uZjFjZWFlNzc4Y2Ix
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsr
KyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTIxOSw2ICsyMTks
MTQgQEAgc3RhdGljIGlubGluZSBpbnQgcHVkX3BmbihwdWRfdCBwdWQpDQo+ICAgfQ0KPiAgICNl
bmRpZg0KPiAgIA0KPiArI2lmbmRlZiBwbWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UNCj4gKyNkZWZp
bmUgcG1kX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHBtZCwgYWRkcikJZmFsc2UNCj4gKyNlbmRpZg0K
PiArDQo+ICsjaWZuZGVmIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZQ0KPiArI2RlZmluZSBwdWRf
dXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHVkLCBhZGRyKQlmYWxzZQ0KPiArI2VuZGlmDQo+ICsNCj4g
ICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovDQo+ICAgDQo+ICAgI2VuZGlmIC8qIF9BU01fUE9X
RVJQQ19QR1RBQkxFX0ggKi8NCg==
