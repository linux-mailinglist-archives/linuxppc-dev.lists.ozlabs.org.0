Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16020497902
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 07:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj0jR0Qqbz3cKM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 17:40:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj0hw0q5kz2xrr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 17:39:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JToslTuLwnAYl82i4xwRy5T0I6MbCqGQVVLOXGzI/zHCtj2jALpqSTNTl3+hv+u28Zrv7bKR2Qp0gwpiGCb1uk0YkxsTrxdF8jHJajXRsHsfVLPiTYruQNHqp7ZJJ9DfE3dPihiK5h1Uy8AhoaKF5/w9mkF0mtPla4fSLYzyBqRkj1PnvPy4TSzhCw6IE9sWX9SGpMhr4Sz7mgI1UyltYFXy0yppWNMW3e48HYOHPk0rrScuJoqXOvd5i+zZNmK5RGMhPAuGVJdBJ8oyD7g9AF3dY0/tHThWFJldR9AVYqakYdc/gLbuFMOuTLLP7Ezr/AXGdNPuqHXQ4GzIFiQE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Udt05qDTgHwIm3y1FWlMe34LEzTXAjyGnW4K5uscOh0=;
 b=nrQlDZzzAeUCsqnkOq32SZHAQJxhjcDJsyWhTcMBWlfbEqAsQrDe1doEKh2MsO0RokzKT+mmcYQNWHbhZK3jgrj2FRekzLjzDMznbxL0mueakgcz8J/XB2QXynP1TIoxpSN1c4/LU5wFoZNsJjTiPacPD1ZkSWgALlTFp4FhLDTW8BLKo/m7WN3RO5qQOq4mPPvSxbxydgts8TfFBsTg5gLOoLS29ONJu8YYFD1v2UXUaqat1gE+DFfbKfCChFR46i+3jO1hTqCoyuUCIUvR1vOYbYrrX5pp+swEzu8BdYwkWDRsIFMmE6LtwEb8HlS4AyDNgIruxvy0w0TIiwUxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3318.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 06:39:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 06:39:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
Thread-Topic: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
Thread-Index: AQHYEOeB4z6fursSD0u9V83cevLE86xxuICA
Date: Mon, 24 Jan 2022 06:39:38 +0000
Message-ID: <d3ab1142-5f62-6cbc-067c-6a34f4f28ef2@csgroup.eu>
References: <20220124055741.3686496-1-npiggin@gmail.com>
In-Reply-To: <20220124055741.3686496-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d6417b0-6d37-4e18-8fd7-08d9df044b1d
x-ms-traffictypediagnostic: PAYP264MB3318:EE_
x-microsoft-antispam-prvs: <PAYP264MB331818B6EFDDC01FDD189873ED5E9@PAYP264MB3318.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OBjwUYAnGSIedBkloa9Ygr2y0W0AJ0GOfWNzDnwRErG3CKiFPeWDi83xlo3KQJh5wUHjgtUnxxZ3+kEoaEatBR+e8llkJwbuvK3ymVPCW3IGiH8tm2YV025Lk4eJ9csjxIfoWB4Qj/RqYhHDFBQyFwZB7+IAM1rY25vgLKjUznT1nPprz/M5OefHdC7chV8ZlWWYachIfFuQjr5OvxMBGWUEjweLDrf5MTFi8KMkZcVR8SUikJCY9uHb3RE5e1S9dEd7zDmYU2u2YS+4sQXrbbGxaFSFXuVeSU9WP1b3MkmDTW0Klajv0Ywo+acFyzCKFAf92rt/HU1ZcHWAdvKZJ0H6dMt73AY9sn5ArBT1KwlsTWPjl6Ata6A4g+ux1bLE+WRWTQaHR90mxcssaaLTnLNGRwa92vFkki3ymxDr/Jv/jZPIFnzRtnd7VLIqRym/hYeNS2jCH/E9c4vGTzxX9OCHZTkUSlBxukScIQZZC5cv5VZf74VuyuvmktjgUhLMe9xp38If+vvG8wT7zqv7zfHjCPpe6DcPdT9CKndiYLkRk1seoYUFOK3UHFoOkNXQAjrhCefD8e6KzObaYC6cY/aOt0l4vo8MEMbukeoMUfnVQwWjZNzvooA8yaP5uiKj72fjpEO8eYNWFIkVuYei/MBEhIJPUTBMu6p28QX0VKgErVqnMhd3mLU4MPid+mJTty3P2S8HWZIaM0swQrTZ8PKV+vwUwZvVYg5G4VvO0uMZFeaFBNNPqOrT4WtviRF1ppEmxiCZaMOJmTDKhF12N5eYZysPPh+oGxB5y9j/RCN/cQegikXWgEvdI/9h2zMIfZWiAdVoSDMEqUntHgj9LQhFBEVPSmNW5Z49SifKw6U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(122000001)(31696002)(38100700002)(2906002)(966005)(186003)(36756003)(26005)(86362001)(76116006)(8936002)(6506007)(110136005)(6512007)(6486002)(4744005)(5660300002)(38070700005)(71200400001)(91956017)(66556008)(66476007)(2616005)(66946007)(66446008)(31686004)(316002)(8676002)(64756008)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3grbnk2Qkt1blFJeGdNc0Rkd3VJcW9BekhCVHozMFUxd25YSElnSDBoUE9D?=
 =?utf-8?B?VjUxRVp2MElXQVJ4cTFNNHU1UUowRTljdVdjdWFoT1A0SmcvUERSS1gzRzFR?=
 =?utf-8?B?eExOcWZyNC8zakFjbkh6c1RSZ3BMajZCaGRYM2ttTElLN3crVWxhRzhKdVhw?=
 =?utf-8?B?U1FoYy8vL3hyMnh3aEhqWWgzRTdnUmlXMTZIS2ZNRUswTXZDS1doV01tQUxO?=
 =?utf-8?B?aXZKeG1uRy9QeWpweXZzYlpINUZWRE04TytRZnNZNzIweEpzVzJmZDNjamFF?=
 =?utf-8?B?WXJhUFAwQmJGd3A3VEpOOU9DTytMVlRBS1NXZitzc3hSaHA0b3I0TzRrZlFh?=
 =?utf-8?B?Snhzd1JxRit4YzB3MnM5SGdzMk81emlmbjBHYlRMMUhyeS9Mbm9mcnZZQ0F6?=
 =?utf-8?B?cTk0RFhrS0lnODN0Ynlub0tWRklxejdOMDQvR1JUSE5xUjM4ZEcrZW9aV2w3?=
 =?utf-8?B?ZTYyeTI0blFTZWNFa00xNHZHVHdQR1JNTlovVGdRdzVTRmtlZS9selVBR3Rs?=
 =?utf-8?B?Umo3amtGbXhXNFZrSUtXTVh3QTYrS0pzRmd6ekJzZythS1dFd3lXU3habDlS?=
 =?utf-8?B?eTJNamtEelVORzVTQ1ZTbW9QanhoZXJIbFJjZmozRndZWWJCTjcvdDB2djFl?=
 =?utf-8?B?VWkxWlA4dEVCQS8yZ3Y4NUNsR0JwZlIzQVp3VzZzbVVKRGVjNzJLem9qS1dx?=
 =?utf-8?B?YWg4TE0yeWFucUs1cmVuS1V3VERscHlneDBoQ0l3aVBDeUxaRzFvd0lSTk1J?=
 =?utf-8?B?a0EzaDFoUm5SazZXT01qcXJkbFY1SlJsQldlNUxrZVdMSkhtT1ZkSW5Cd0cr?=
 =?utf-8?B?REF5TnlFekgwcHNNYSthTWJ5OXVIOXErNFdLY3FoaXRxVU15dEI2WVZwQkJG?=
 =?utf-8?B?dURtV2R1S2k1YTdrNnNjQU5YNkdJTlJaWHFmeW9OM2M0Q2I3RnlSZWMwakNs?=
 =?utf-8?B?QUZubmNnZllzbGVlODkrU1FDK2M0b1o1blJKdG5sTDNTbEdYTHQxV2RwZ0k1?=
 =?utf-8?B?c2d4M2RRR0diZS9PSUk0bFlTZ2VCQ0pENEgvbXgvdC9acjdYbHg4czM3SVBB?=
 =?utf-8?B?MkJsTy84d3plZ3U3WVhDeWVydG5NZFRSYVc3dDlzVDN2Qk1uTmtRZWpFNG1C?=
 =?utf-8?B?eW13bEZ4ZDF5NGlGUzFIeGUvemJwQ2taWk92VDh4MGpzSWFRaEhSRyt4eXVu?=
 =?utf-8?B?a3BWYyt1U3pveDhNOG5nbmVJcFJ4QXVjTmUreVVmRDJIbHc3Q0NRRWg1Qm4y?=
 =?utf-8?B?bldSWkpXNlk5UXBCeUpvbEZ5bllEZDRpeWs2TXZuRnMraFhhVmp3NjlqZlND?=
 =?utf-8?B?MGdKWXk3VUY2Ri9hOGlVRlNwMytJWThFcW5TVW9OYmtFck8wWGNWSzhHTnVT?=
 =?utf-8?B?RVY1NitycVIzWFBHWHpMa0hjYytRdnZ5L1JmOW43bWYwOWd0Q1U1bk55em1T?=
 =?utf-8?B?SmkxUFBQcEROTmp1OWVDWVJNQlNrWmtzRHlza0x5K3haNUtiMkM3UkhVMW01?=
 =?utf-8?B?VGg5WDJVbnFOMEpNSzZDSnN4dldFditIKzcxT3phYUo3UDdGMXlseHo1RVhX?=
 =?utf-8?B?amxkejM0eGNjRlBlcUlmbTE5RHFDWTh6VUxTdVJKeWRuQ2pKWkpsc2M4OGpZ?=
 =?utf-8?B?amNMS2R2eG5lSHV2dDl2NUFkelV6aUtYNDlNTXdWRlNsUGZVZ1lOV0todjdZ?=
 =?utf-8?B?VFF0WFpEYlR6Q0JjMXg1NmhCOWpXYmNCTFFwcXR1L2hnQWF3STFqTkY4Q0N1?=
 =?utf-8?B?YzNOOWVmRHdaNzBReEVZWnd3eFpyeklyeU91OUVtVXpjZWF0Y3gvckVydERE?=
 =?utf-8?B?MEN2WWwxZnF6eGdWQXUvTTdWcU15Sm5kZktxN1FvMnhSWVhVbVcxcTc3czR4?=
 =?utf-8?B?azd1Y3lrZFJHU010WnRWWVRUOHdpZjVWMXNvVjRVVm0vUVpXVkJFbStBTTRH?=
 =?utf-8?B?S05nc1RxZzVqNk4zOEU4allKdCsrVldkdmRIcEI2QURRRGcvM1FmVkpBMVp3?=
 =?utf-8?B?RFlveFlTVUw0NmMvZnY3RjZjOU5ycmw0aGFTZXdxbHBGM2VKTzlSTnNIY2w3?=
 =?utf-8?B?Zis0UnY5YmNrWDBuOEF0dW5MNjRKUlU4MFYxbm5wNC9zYlVEb2Z5OGxRVDcw?=
 =?utf-8?B?cjdNUVpWRTBaVjRybUV6c0pKbTdWNlgyeVhDU1ZXVWxJSmY5Ym9yeGFnQ0dr?=
 =?utf-8?B?a0RFVGpxZ21oYmREdTNNUUtZZUdiODhMY1JFK1QrQVRyclVBT3hLaTRKN3ls?=
 =?utf-8?Q?SwQVyul7tyg2gC02w2z8BPLup0dz16vw2vy7rHbzD8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DBB9B0623B29B44ADD46AC33319E905@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6417b0-6d37-4e18-8fd7-08d9df044b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 06:39:38.1790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xN1AtC03XeltIvKXQct+2OnrK8V80Fp8IB41Lt5HcZp1nKs1rH550EJVGiJDVOMvYBVYwLaL+2olXaDrm1VWZ+eeQdYGQ0uG1lHcoN7pJGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3318
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzAxLzIwMjIgw6AgMDY6NTcsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBBcyBkaXNjdXNzZWQgcHJldmlvdXNseQ0KPiANCj4gaHR0cHM6Ly9saXN0cy5vemxhYnMub3Jn
L3BpcGVybWFpbC9saW51eHBwYy1kZXYvMjAyMi1KYW51YXJ5LzIzODk0Ni5odG1sDQo+IA0KPiBJ
J20gd29uZGVyaW5nIHdoZXRoZXIgUFBDMzIgc2hvdWxkIGJlIHJldHVybmluZyAtMSBmb3Igc3lz
Y2FsbA0KPiBpbnN0cnVjdGlvbnMgdG9vIGhlcmU/IFRoYXQgY291bGQgYmUgZG9uZSBpbiBhbm90
aGVyIHBhdGNoIGFueXdheS4NCj4gDQoNClRoZSAnUHJvZ3JhbW1pbmcgRW52aXJvbm1lbnRzIE1h
bnVhbCBmb3IgMzItQml0IEltcGxlbWVudGF0aW9ucyBvZiB0aGUgDQpQb3dlclBD4oSiIEFyY2hp
dGVjdHVyZScgc2F5czoNCg0KVGhlIGZvbGxvd2luZyBhcmUgbm90IHRyYWNlZDoNCuKAoiByZmkg
aW5zdHJ1Y3Rpb24NCuKAoiBzYyBhbmQgdHJhcCBpbnN0cnVjdGlvbnMgdGhhdCB0cmFwDQrigKIg
T3RoZXIgaW5zdHJ1Y3Rpb25zIHRoYXQgY2F1c2UgaW50ZXJydXB0cyAob3RoZXIgdGhhbiB0cmFj
ZSBpbnRlcnJ1cHRzKQ0K4oCiIFRoZSBmaXJzdCBpbnN0cnVjdGlvbiBvZiBhbnkgaW50ZXJydXB0
IGhhbmRsZXINCuKAoiBJbnN0cnVjdGlvbnMgdGhhdCBhcmUgZW11bGF0ZWQgYnkgc29mdHdhcmUN
Cg0KDQpTbyBJIHRoaW5rIFBQQzMyIHNob3VsZCByZXR1cm4gLTEgYXMgd2VsbC4NCg0KQ2hyaXN0
b3BoZQ==
