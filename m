Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3817F5874
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 07:40:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nfWuviEq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbT585Snkz3vpf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 17:40:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nfWuviEq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbT4J25wTz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 17:39:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IogbFmDTkQQJQ/jiv2Tq3K7gDvuwzxwqI6X2nVA0ql+3hH6bPawUVsIM1j4D4Ui6HUhQUAKs9nSo5Vf/mNPYiHXHjZgAAK1Y1zbqzjqyRubjcYY7t/jNDudhj00a4f6pt97HJ3FBPkV+bzA99+vTLR3rHzapdielWfnFzq5w9hpyrDMFxtj/I0+NfYxNnaFWadx64fNWAyFT1473UIEM/qPnwLDJ32pgblJFdjVNhc/M33fESk2kK7zqMQcPRGvAscSME659xa3d1TbA7Lk1XHlJgr4DMjjAiYLQUj29Gbgf3X7wERuTGopj/XGpin+8bsPdcCx3yEBzwzoH3ZGV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UutUUN8AzAyI3z3nKT6yEjmdSvlk5zAyXrsBDLdlwdM=;
 b=dgi9oXWcIcNsl7PvfzDx1ZORI7oTLl1c1MqJ9IzWzNtWqjpSgEunw+yjYkxYrZKTt24noG1WXtGRFOkPMBQsnUaIe2OlArJ9rL6RNrzBwRcLN8WyQ+8z7stNPsZNYJsKYWGmW78BjfBlH43arLXvfUMlDlbq45sMDnSgObjtjLxmCg1JY4sKu08sy4OccbiJ8HqtVEhZSZHjFKyL0Zv8wxQaHvYWvbjly1KACIwHjoM8YnzP1L7hS24MlWoAWj1hO5eZ+lPmDKamShHbBb8N3nEVYs5laoeEmFzFs3+dTslnUBsTis0j0+608m5+EIPikFMQPhKW25Usr/e+vJotCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UutUUN8AzAyI3z3nKT6yEjmdSvlk5zAyXrsBDLdlwdM=;
 b=nfWuviEqe4iTXgZBf8A5L1npGhCcOigiIoTqPpOaMnSEx+IgssmI32owW03YieU+slqfBBIXVrXSRtifxnDljW/7Iu+WVdLQ7Imvdw9QccVeGg9aSYBqzixrKiXoGb4RuWms2eye68880yIiKYaG/6Sgc4TUbWxqYMeevPJOJg31SMh4TLgdakgLOkwrFiP0jb5/UELdk6CsgVEKtfJf/BybRAFRolooryAuMPOzP2ffphpbqlz9uyYkQbHYigU3nxRpD/x9U6+zDulrCo9ZSe2fnXBCfY614lgHuNfE5OadpzUe0BOE6Tk/CLNC5vDhnAWiUEEp26K/N0GMx/sZyA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1542.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.12; Thu, 23 Nov 2023 06:39:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 06:39:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>, Rob
 Herring <robh@kernel.org>, Daniel Gimpelevich
	<daniel@gimpelevich.san-francisco.ca.us>, Andrew Morton
	<akpm@linux-foundation.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>, Sean Anderson
	<sean.anderson@seco.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Rob Herring
	<robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 7/8] of: replace command line handling
Thread-Topic: [PATCH 7/8] of: replace command line handling
Thread-Index: AQHaE3ahtJVZ4EJB/0ejXwsHWvYB8LCHiKgA
Date: Thu, 23 Nov 2023 06:39:23 +0000
Message-ID: <4fa98c8f-076f-4503-b46d-515b8c56bb6d@csgroup.eu>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-8-danielwa@cisco.com>
In-Reply-To: <20231110013817.2378507-8-danielwa@cisco.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1542:EE_
x-ms-office365-filtering-correlation-id: 1d70d028-ede6-48d1-8145-08dbebeeee48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lDcVI4i+1OTQ2J9yZa1Ckp/gm8g3WicB0h/Ml9xi4gQA3rDDRASM3vuw+QWwGUtq3uISJh/RSkukNLp+5qwG+dj+7g8/9MY6Rkr2eE8PejmSETOZZ0w2ZcMdjCARSlURMGDagxQxSO91+hxcOSntX3Yr//Z1zaGIhYmfDuka6I2OoTRYgCCJ7fYSQjCDmrFZBdGH02HRP9E35Zl+2z0erFcVqq8oRAsdCudupiLmApjBTO91TYCINFr07MIWdn0bgV+7eyre+7nu7XHIPT9xfLVE/mkZFP8Psf8pQe2Zn138a3k4f0vQfVeiE6pFwzBmrNtN3NUQDUzwAxCjbrix6VoefWGseUomArIYOn9rGR9AyGqZ+TCotDM6pVThZSBZtR6GNqogNbMYobFoavsiF19PWIk/lbgzmocHyBjMmH49v0ws348XM+YM/HpIWFQQGt+5DZSl4tiDW6hr3HX0CiG9cIJxiM0Odv7Hk/wLIoW5QJBrllufxvwJrq326XatzyGbYdtJmAMVDDVqo6ghOQV9vwj0ldM2viV0LdderAxmO7JD0Y/mWaqQ2mZ2fsZMqon/YCEbcRoihw1v6PHxEVBJdWgDrobxaS811KEWTpB3EUgZgrzuynIs2RCczwJHuA3aCQzmsd+4eKmCQBPYsrnN4752XZVQFSnIYX06t6j2S3wdfHlZmhF2UzgbfqlkcopKfEFvxeULlaHHVvmpfMsMJH6wJjUKGnimsphopgvVsbMh0jeDvXN2CblYrSZo
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(921008)(38070700009)(66946007)(66556008)(76116006)(66476007)(66446008)(64756008)(54906003)(91956017)(110136005)(38100700002)(36756003)(122000001)(31696002)(86362001)(83380400001)(66574015)(26005)(6506007)(6512007)(2616005)(6486002)(2906002)(7416002)(316002)(478600001)(8676002)(5660300002)(4326008)(44832011)(71200400001)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aERhdlVhaXNVMXdKNFR5bUxYbS9hZFFiSFZzd2dCN2FOeHpMUDdLSlBCSzFi?=
 =?utf-8?B?VWs0OE5zM3ZFNFQybUFza2NQMmF3MUN6NnNaVXhzdnVFYXR3TlI4cWRTQnpN?=
 =?utf-8?B?TTFJTk5GZlFGbWdQcUdPMmdOQS9VenN0TjcwWUtaVU55TFV6OGtTZ3N0THlm?=
 =?utf-8?B?aFk4enBpeWRGOFdhbDJYc01ManJrdmFaMXUzWEZTOVlTNExYVDU0LzEwWWRL?=
 =?utf-8?B?aEU0cG5YbjlOSEVBL2p6SFl2c0xBTzZwZWtsQUtNM1RMNXk0TCtyd3BJVGY0?=
 =?utf-8?B?TVlCYmQwTWw0Zm95LzJEVzI0cGtETDN6aUhFWXNybjZkYW11N1VFUGtBcU55?=
 =?utf-8?B?aU03Z0UxYU5qMmhGdXQ2YmlZV2hmMENSc2hod1dUa2drMStBSUtxZmh6U1RY?=
 =?utf-8?B?K0dIZGtRZ2Jhb1BpcTY3SVFMSHRKRlNNZGIwaEFQRU9CQlZpbHUxMm9WOE5V?=
 =?utf-8?B?c2o0MzR4N2YwSnpCWVNUUXZKQVZCaTM0UkNweGovUGNzMTJsYy80SDQzVXB1?=
 =?utf-8?B?dUxOK0ViNVlyT1l2VmZPVGhuRmtQWEMxd0JyNjF4cVdXN3p3Yzlnb0VWZ1JH?=
 =?utf-8?B?RE14UEs0QXRPZEVqV3BkZEN0RmxGcGZYVTFJdW9FdDBxaXJlLzg0ZWxmekFY?=
 =?utf-8?B?QlhobXBTclVSV0xCYWcrWi80ZEk4V0J3TjRyQ3JlZ0xTYUs4WUo3K2ozUWVx?=
 =?utf-8?B?aHZWSGkrWmVTSkdDUDNENG16d2xBdjFxMGh3L1JxbGpiTlpwTzE4RmhqQnFC?=
 =?utf-8?B?NWM5d1pGZC92U2pBZFRLMERIWjdJZnRmU3ZHTGVqMVlzMytwOHdLNUwyZXdO?=
 =?utf-8?B?Mms5THRxZGM4SUR1d1pwcSt2SjZuSHVuWVk5VTdWZW0rSkZwTGloVVIrR2Fo?=
 =?utf-8?B?b3ViV21SbzFzOXpaem1BNVdFTk9NcHVNNE1KTVhtai9rdDhNeGZJMDgvUmRC?=
 =?utf-8?B?dXpJRGcwaHhSSDcvU0pEc2E0V3JmV0JxTXJ6cTFGQS9TK2xHbnRHWWZVQjVv?=
 =?utf-8?B?d2ZHQUZDZENhUG4zaU5QNXpMOVl3ZGo2TXpqN0svTnFTSkQzdlpWbzBXckov?=
 =?utf-8?B?OTRDbFgyUHNVYjRlMGJUbmtXOVR5L2l0bGZKb2Q0cGI5VHVzRm5wUkd5cFlt?=
 =?utf-8?B?R0J6eWRwZUZXOEhmLzFjb3NDOTNiREtBendzeE56ejgrNDhQVkJ5M1ZUeWpk?=
 =?utf-8?B?WEhOWC9HUHV2ZUZJbzNpa2xQcUNWS1RNSjB5eWlTNHh4Z2hvTldadGQzQlZp?=
 =?utf-8?B?Wm13RWxyU2JpTklWTEJDczQrSUt2SWYrMkZ1Z3BUYTAxOGN1bHB5blBETk81?=
 =?utf-8?B?VWpYeThmdWVXeU5SYlJIRUYyUEp4c2pSaWN6Rk5RMVQ0c1dNa1A0akZwL1Ar?=
 =?utf-8?B?cHM0MG1yQjF2ajFqQ1haOWVQMURqZ29mQzk0dGI2WjBUZEZYU2JzTVlweDU1?=
 =?utf-8?B?dVMrbWQzemNQVjJyQ1BsczZSemRLQVdqVlJxeVF3VFJVd2locGJWSC9CaWtT?=
 =?utf-8?B?WlM2dkRMRWR2SHlxUWxJQjdZN2x4UGZwcmhsRXlqbWJpODhoZUtUU2UwSllN?=
 =?utf-8?B?M3FkZnRpUHNBYVlNNmlKY0t4SThwSUVnOVNUbmk4VWFXQWJXUWg5Q3J3RWQv?=
 =?utf-8?B?Z21rMUVWNG1zWUpORlhzNHJQQVhLZ2NpYmZENkMyM3ZXeXp5U0FjbVVsZUtV?=
 =?utf-8?B?dUtNM05wb05RQTdtQWIxNGFFWWNuNkcyaThldm1BM1RjdkYxYllvYWJ1a0x2?=
 =?utf-8?B?Rnl1dmpnSTFDM3JtYitWRXErZUVvR1VWMGw2OWhkQXZzK3RKZkM2K0hySWI1?=
 =?utf-8?B?elNialJ4OU5VeDRHMHZDdU53YnBGanJGNkh2U1h0N3FRUzZSbFVlaXhUTnVD?=
 =?utf-8?B?QTNHZlpRU1V6cktGUkFPM1JROWhYcTllRFUyTGRySW0vT2ZINjBiWUtVL3Vz?=
 =?utf-8?B?eGI0bzA3MUh5OEtPa0M1aFVGVDh5ZGo1UWhuL29Oc3dlSU8vbnhhZzBZNG9u?=
 =?utf-8?B?OVFNdTkxd3hBaDgwbzlicXZsMm01djBwMUxGeXJFUjNSbU1wNmJBZ3VVRGV2?=
 =?utf-8?B?WDI1Z3FJUXRUL05leUxjSWJxcVpVQSsrQ3AwVW0vMkhmbE1OcWdOYTg0M3FM?=
 =?utf-8?Q?ZQ8nSrpMwjxCaSgMcp0lEl5X4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8A140911D8BBE489C8452051E720E28@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d70d028-ede6-48d1-8145-08dbebeeee48
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 06:39:23.5265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3kOhXNvUg1imBzlJd6vz7GKcgOgnJkPPxFEHy8A4TgKny5i+DqXFIvRu5MFMrzluSHUSpiPPh0nn8j17VTN3bQcCYKLOIO8sUATvJFIcof8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1542
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzExLzIwMjMgw6AgMDI6MzgsIERhbmllbCBXYWxrZXIgYSDDqWNyaXTCoDoNCj4g
Um9iIEhlcnJpbmcgaGFzIGNvbXBsYWluZWQgYWJvdXQgdGhpcyBzZWN0aW9uIG9mIGNvZGUuIEkg
cmVtb3ZlZCB0aGUNCg0KVGhpcyBraW5kIG9mIGNvbnNpZGVyYXRpb25zIHNob3VsZG4ndCBhcHBl
YXIgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBpdCANCm1heSBhcHBlYXIgYWZ0ZXIgdGhlIC0tLSBz
byB0aGF0IGl0IGdldHMgZHJvcHBlZCB3aGVuIGFwcGx5aW5nLg0KDQo+IGNvbW1hbmQgbGluZSBo
YW5kbGluZyBjb2RlIHRvIHRoZSBjbWRsaW5lLmggaGVhZGVyLiBUaGlzIGhvcGVmdWxseSBtYWtl
cw0KPiBpdCBlYXNpZXIgZm9yIFJvYiB0byBtYWludGFpbiBpdCAoYXQgbGVhc3QgaGUgZG9lc24n
dCBoYXZlIHRvIGxvb2sgYXQgaXQNCj4gZGlyZWN0bHkgYW55bW9yZSkuIEkgd291bGQgbGlrZSB0
byBhZGQgYSBLY29uZmlnIG9wdGlvbiBjYWxsZWQNCj4gT0ZfREVQUkVDQVRFRF9DTURMSU5FIHdo
aWNoIGFuIGFyY2hpdGVjdHVyZSB3b3VsZCBzZXQgaWYgaXQgdXNlcyB0aGlzIGNvZGUuDQoNCk5v
dCBzdXJlIHRvIHVuZGVyc3RhbmQgd2hhdCB5b3Ugd2FudCB0byBkbyBhbmQgd2h5IHRoYXQgaXMg
bmVlZGVkLiBXaHkgDQpjYW4ndCB0aGF0IHdvcmsgZm9yIGV2ZXJ5b25lID8gQXZvaWQgdW5uZWNl
c3Nhcnkgb3B0aW9ucy4NCg0KPiBUaGlzIHdvdWxkIGFsbG93IGEgcGxhdGZvcm0gdG8gdXNlIHRo
ZSBjbWRsaW5lLmggYW5kIHRoZSBhZGRlZCBmdW5jdGlvbg0KPiBkaXJlY3RseSBhbmQgcmVtb3Zl
IHRoZSBLY29uZmlnIG9wdGlvbi4gVGhpcyBjaGFuZ2Ugd291bGQgYmUgaW4gYSBzdWJzZXF1ZW50
DQo+IHBhdGNoLg0KDQp3b3VsZCBvciB3aWxsID8gTm90IHN1cmUgaXQgaXMgd29ydGggbWVudGlv
bmluZyBpZiBpdCB3b24ndC4NCg0KPiANCj4gVGhpcyBjb2RlIHdhcyBib290IHRlc3RlZCBvbiBw
b3dlcnBjIDMyYml0LCBwb3dlcnBjIDY0Yml0IHdpdGhvdXQNCj4gYW55IGdlbmVyaWMgY29tbWFu
ZCBsaW5lIGNvbnZlcnNpb24uDQo+IA0KPiBDYzogeGUtbGludXgtZXh0ZXJuYWxAY2lzY28uY29t
DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBXYWxrZXIgPGRhbmllbHdhQGNpc2NvLmNvbT4NCj4g
LS0tDQo+ICAgZHJpdmVycy9vZi9mZHQuYyAgICAgICAgfCAyMiArKystLS0tLS0tLS0tLS0tLS0t
LS0tDQo+ICAgaW5jbHVkZS9saW51eC9jbWRsaW5lLmggfCAzMSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL2ZkdC5jIGIvZHJpdmVy
cy9vZi9mZHQuYw0KPiBpbmRleCBiZjUwMmJhOGRhOTUuLjFmYzFiMTdkMDRkYyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9vZi9mZHQuYw0KPiArKysgYi9kcml2ZXJzL29mL2ZkdC5jDQo+IEBAIC0y
Niw2ICsyNiw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L3NlcmlhbF9jb3JlLmg+DQo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3N5c2ZzLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3JhbmRvbS5oPg0KPiAr
I2luY2x1ZGUgPGxpbnV4L2NtZGxpbmUuaD4NCj4gICANCj4gICAjaW5jbHVkZSA8YXNtL3NldHVw
Lmg+ICAvKiBmb3IgQ09NTUFORF9MSU5FX1NJWkUgKi8NCj4gICAjaW5jbHVkZSA8YXNtL3BhZ2Uu
aD4NCj4gQEAgLTExODMsMjcgKzExODQsMTAgQEAgaW50IF9faW5pdCBlYXJseV9pbml0X2R0X3Nj
YW5fY2hvc2VuKGNoYXIgKmNtZGxpbmUpDQo+ICAgDQo+ICAgCS8qIFJldHJpZXZlIGNvbW1hbmQg
bGluZSAqLw0KPiAgIAlwID0gb2ZfZ2V0X2ZsYXRfZHRfcHJvcChub2RlLCAiYm9vdGFyZ3MiLCAm
bCk7DQo+IC0JaWYgKHAgIT0gTlVMTCAmJiBsID4gMCkNCj4gLQkJc3Ryc2NweShjbWRsaW5lLCBw
LCBtaW4obCwgQ09NTUFORF9MSU5FX1NJWkUpKTsNCj4gICANCj4gICBoYW5kbGVfY21kbGluZToN
Cj4gLQkvKg0KPiAtCSAqIENPTkZJR19DTURMSU5FIGlzIG1lYW50IHRvIGJlIGEgZGVmYXVsdCBp
biBjYXNlIG5vdGhpbmcgZWxzZQ0KPiAtCSAqIG1hbmFnZWQgdG8gc2V0IHRoZSBjb21tYW5kIGxp
bmUsIHVubGVzcyBDT05GSUdfQ01ETElORV9GT1JDRQ0KPiAtCSAqIGlzIHNldCBpbiB3aGljaCBj
YXNlIHdlIG92ZXJyaWRlIHdoYXRldmVyIHdhcyBmb3VuZCBlYXJsaWVyLg0KPiAtCSAqLw0KPiAt
I2lmZGVmIENPTkZJR19DTURMSU5FDQo+IC0jaWYgZGVmaW5lZChDT05GSUdfQ01ETElORV9FWFRF
TkQpDQo+IC0Jc3RybGNhdChjbWRsaW5lLCAiICIsIENPTU1BTkRfTElORV9TSVpFKTsNCj4gLQlz
dHJsY2F0KGNtZGxpbmUsIENPTkZJR19DTURMSU5FLCBDT01NQU5EX0xJTkVfU0laRSk7DQo+IC0j
ZWxpZiBkZWZpbmVkKENPTkZJR19DTURMSU5FX0ZPUkNFKQ0KPiAtCXN0cnNjcHkoY21kbGluZSwg
Q09ORklHX0NNRExJTkUsIENPTU1BTkRfTElORV9TSVpFKTsNCj4gLSNlbHNlDQo+IC0JLyogTm8g
YXJndW1lbnRzIGZyb20gYm9vdCBsb2FkZXIsIHVzZSBrZXJuZWwncyAgY21kbCovDQo+IC0JaWYg
KCEoKGNoYXIgKiljbWRsaW5lKVswXSkNCj4gLQkJc3Ryc2NweShjbWRsaW5lLCBDT05GSUdfQ01E
TElORSwgQ09NTUFORF9MSU5FX1NJWkUpOw0KPiAtI2VuZGlmDQo+IC0jZW5kaWYgLyogQ09ORklH
X0NNRExJTkUgKi8NCj4gKw0KPiArCW9mX2RlcHJlY2F0ZWRfY21kbGluZV91cGRhdGUoY21kbGlu
ZSwgcCwgbCk7DQo+ICAgDQo+ICAgCXByX2RlYnVnKCJDb21tYW5kIGxpbmUgaXM6ICVzXG4iLCAo
Y2hhciAqKWNtZGxpbmUpOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jbWRs
aW5lLmggYi9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaA0KPiBpbmRleCBhOTQ3NThhMGYyNTcuLmM3
NzJhZmI3MzQwZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgNCj4gKysr
IGIvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgNCj4gQEAgLTEwMyw0ICsxMDMsMzUgQEAgX19jbWRs
aW5lX2FkZF9idWlsdGluKA0KPiAgIA0KPiAgICNkZWZpbmUgY21kbGluZV9nZXRfc3RhdGljX2J1
aWx0aW4oZGVzdCkgXA0KPiAgIAkoQ01ETElORV9TVEFUSUNfUFJFUEVORCBDTURMSU5FX1NUQVRJ
Q19BUFBFTkQpDQo+ICsNCj4gKyNpZm5kZWYgQ09ORklHX0dFTkVSSUNfQ01ETElORQ0KPiArc3Rh
dGljIGlubGluZSBib29sIG9mX2RlcHJlY2F0ZWRfY21kbGluZV91cGRhdGUoY2hhciAqY21kbGlu
ZSwgY29uc3QgY2hhciAqZHRfYm9vdGFyZ3MsIGludCBsZW5ndGgpDQoNCkFkZCBhIGNvbW1lbnQg
ZXhwbGFpbmluZyB3aHkgaXQgaXMgZGVwcmVjYXRlZC4NCg0KPiArew0KPiArCWlmIChkdF9ib290
YXJncyAhPSBOVUxMICYmIGxlbmd0aCA+IDApDQo+ICsJCXN0cmxjcHkoY21kbGluZSwgZHRfYm9v
dGFyZ3MsIG1pbihsZW5ndGgsIENPTU1BTkRfTElORV9TSVpFKSk7DQo+ICsJLyoNCj4gKwkgKiBD
T05GSUdfQ01ETElORSBpcyBtZWFudCB0byBiZSBhIGRlZmF1bHQgaW4gY2FzZSBub3RoaW5nIGVs
c2UNCj4gKwkgKiBtYW5hZ2VkIHRvIHNldCB0aGUgY29tbWFuZCBsaW5lLCB1bmxlc3MgQ09ORklH
X0NNRExJTkVfRk9SQ0UNCj4gKwkgKiBpcyBzZXQgaW4gd2hpY2ggY2FzZSB3ZSBvdmVycmlkZSB3
aGF0ZXZlciB3YXMgZm91bmQgZWFybGllci4NCj4gKwkgKi8NCj4gKw0KPiArI2lmZGVmIENPTkZJ
R19DTURMSU5FDQo+ICsjaWYgZGVmaW5lZChDT05GSUdfQ01ETElORV9FWFRFTkQpDQo+ICsJc3Ry
bGNhdChjbWRsaW5lLCAiICIsIENPTU1BTkRfTElORV9TSVpFKTsNCj4gKwlzdHJsY2F0KGNtZGxp
bmUsIENPTkZJR19DTURMSU5FLCBDT01NQU5EX0xJTkVfU0laRSk7DQo+ICsjZWxpZiBkZWZpbmVk
KENPTkZJR19DTURMSU5FX0ZPUkNFKQ0KPiArCXN0cnNjcHkoY21kbGluZSwgQ09ORklHX0NNRExJ
TkUsIENPTU1BTkRfTElORV9TSVpFKTsNCj4gKyNlbHNlDQo+ICsJLyogTm8gYXJndW1lbnRzIGZy
b20gYm9vdCBsb2FkZXIsIHVzZSBrZXJuZWwncyAgY21kbCovDQo+ICsJaWYgKCEoKGNoYXIgKilj
bWRsaW5lKVswXSkNCj4gKwkJc3Ryc2NweShjbWRsaW5lLCBDT05GSUdfQ01ETElORSwgQ09NTUFO
RF9MSU5FX1NJWkUpOw0KPiAgICNlbmRpZg0KPiArI2VuZGlmIC8qIENPTkZJR19DTURMSU5FICov
DQo+ICsJcmV0dXJuIHRydWU7DQo+ICt9DQo+ICsjZWxzZQ0KPiArc3RhdGljIGlubGluZSBib29s
IG9mX2RlcHJlY2F0ZWRfY21kbGluZV91cGRhdGUoY2hhciAqY21kbGluZSwgY29uc3QgY2hhciAq
ZHRfYm9vdGFyZ3MsIGludCBsZW5ndGgpIHsgcmV0dXJuIGZhbHNlOyB9DQo+ICsjZW5kaWYgLyog
Q09ORklHX0dFTkVSSUNfQ01ETElORSAqLw0KPiArDQo+ICsNCj4gKyNlbmRpZiAvKiBfTElOVVhf
Q01ETElORV9IICovDQo=
