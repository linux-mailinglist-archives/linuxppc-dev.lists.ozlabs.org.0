Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF44731EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 17:37:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCRxh49ZGz2yyf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 03:37:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCRx74ZRRz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 03:36:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqcUrlg6apwcknaDCz+j2PHdCnx77ougv1EwkH/gTAROAF+hWNkxqoCtWKP8Q1r6HSyL88+2MMrqVdeHbejqjLeKJH6p1+RsdvIFFEU114LeLW3D52lfq3lSiDdpKQnVgE8kjkmf7Ms8lwkteusgouA/9jZ1iR/lotiS28UQ7RtNQsaZF6hMpfK5uppwBEVrLLOm89rJNMCqFd2n4igxcsKy+K5gF+ay/NVHQD861VoH+nQjQmVB7uDRHcjKd+8Q0s2h3q+1eeulEkvibn/kfwX82SSat1S0sufTuUvxYOof0MmkCTg+vnQdpTgVJ3maKS7cb6HXC3hGbneJfqf9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsUNJKX2oToIKjaRQDNE6TKDUQdFlDWYzd8BcMPyloE=;
 b=TE3laN+JGkzWwcv9leTT16GXvYq02b/EVToqTfDqzavWNcdNZ6JiTz0Rlrq4wgIsg0WnjJYzx23jf8hEoL9eJfyAUbVo3Yo+Vh2p69FAq8zYCQK9HoE5dHv/bM93Cmk92wyfh9I/qQXrDimmKfdmlqiAe02gWUG+/6L3yfuzzHAKnBtWdo8UGbrT0pTgtQbZJyg5nMUzN4MeWBDgzgCBbFxaulJ41mHtWBqBo3TBr7Sr9IAHAGG0Rd7tsCyDYyoFcX/BewvT0dWvZYd9v9K4uNatc97AhNm2XlWx64gbkie2/KyTzNtabLQ41BGFFF0WxfVn0Oel/e6s7HUbcto93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0069.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:22::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 16:36:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 16:36:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joe Lawrence <joe.lawrence@redhat.com>, Russell Currey
 <ruscur@russell.cc>, "live-patching@vger.kernel.org"
 <live-patching@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Thread-Topic: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Thread-Index: AQHXzspJJmoyNvOd+UCDOrmbjdknXavuZfuAgABKxICAQZuGAIAAducAgAAeaoA=
Date: Mon, 13 Dec 2021 16:36:31 +0000
Message-ID: <61a5f29c-5123-5f0f-11aa-91cb0ac95a69@csgroup.eu>
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
 <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
 <bed88ff4-e5d3-4b78-4f28-29fc635c2f97@csgroup.eu>
 <919a79b8-feff-b0a4-b96a-73f376b7f6dc@redhat.com>
In-Reply-To: <919a79b8-feff-b0a4-b96a-73f376b7f6dc@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42eafe88-51a6-43e6-46f7-08d9be56b833
x-ms-traffictypediagnostic: MRXP264MB0069:EE_
x-microsoft-antispam-prvs: <MRXP264MB0069DD77888A9A52F6835D5BED749@MRXP264MB0069.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7yH/dY+/HkpkIdlhZ4hdt6JJidLWbAhOOspCtswPHY5UFJCDOrwwHzWrE1Ayo81SxNYUoVvf/r+kcIlxB1W8y0Kz8ws+kBUpoQQj0UVPO4RWOh7Tcs2/0Sf3U+KdKzbCKeWrU7ojjnwqOW7KGa/h/c+rNptcvw+przZtRH3oseywS3CCLfofRvzbGpTmQndlwsQBh2ufgMRnNdVcBxz4yUrudb02rwSTxLnLlHz43tquASl4S/lnp105otiWGoPHBcJbwmHXUL3JZaVo2Pxt0oHt0/s1Q03eeQeJKUOVRiFwJTxR1rp+3I9uvqB+MN4LhWYmjwW8WlNii+NSB5tK7v8FirCqfIGVSWbC59MiZLVqtQokjRQcbEx4FpMxh8j6FIWsVp2u4Y1DyOzVzkBy1f/6eXeFHMFFRvJLx1yfdYmJXJJjRMy88hjRdYcEHHxjYwIa/rpL4IEwBJYFqYRa0d1gJfoIz0VSEecKzF3LbLLh/e+oEzT/0RmNL2U8y/zbJYsgkFrkI5t51gJphDvF5fo5/NF4jgN5Br+1+Rq39MNqUkm8xw0Gd7v33M4wO5hXYS1qv0tEKfpO2JwFiroFwDrWO0PNeDG3C2bf/k3NnyYYJJy8mFM/v+61MRV/2lCVPLfbOTqzfvKhdBOYd5M4Sj6gAs3KBCzimtxBW3Ri3kMNgUbtVQ6hy0dyquwE7Ls5FL9xLISf+hmzJP7qda3Pz7xBjMJzJVtJljs6J0rgbTvJjc6qjMCNOYVAiFBe9aurvK9Txm13VaeC2EXjW56G3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(316002)(53546011)(38070700005)(31686004)(71200400001)(86362001)(26005)(31696002)(83380400001)(2616005)(6506007)(122000001)(8936002)(5660300002)(186003)(54906003)(110136005)(508600001)(8676002)(6512007)(38100700002)(36756003)(4326008)(2906002)(44832011)(6486002)(64756008)(91956017)(66556008)(66946007)(66446008)(66476007)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzNGbzJCa21kM2F6aXJuakJIdUxuUVBGMUV4dFBLUHo1ZmZ5cUZGbmRFRkNq?=
 =?utf-8?B?aVdGbUh6VFVmSzJidHllZjVmSFVEaC9ZcHptdnY2UExSL1ZxM2RtbGsraHhJ?=
 =?utf-8?B?RFlmODQxeHE3T0V6d1gwUnB6ZUZnWlNJN0tjYjl0eElMZndxWkIrQk40N0Rm?=
 =?utf-8?B?OFRIM0tzS09COUMxdWVDR09PU250VCt4SmhXaU1SN20ySVMwZUZnN3V6U1hy?=
 =?utf-8?B?SDFQNituekJTTEpBSFp1OS9mVStHK0N0RE85bTdMZU1YYWVUZHU2Ry8vdjdu?=
 =?utf-8?B?NkJwb3VvVWpEOE1JWnJucEMyWEFkTU1PbU5BWFl4M1VJUTRObzFIa3YvcTVw?=
 =?utf-8?B?MkdvbUp2aVdIT1VFQmNMdXoxMjN5elFmNHZ0cS81VmQrRDlnb3ZUTFIwRjZN?=
 =?utf-8?B?Mm42WTB6SUpkSDNuVis0V2E2ZmF5NitwdGFDRmJzS281eXdReXVZaWdCWm1H?=
 =?utf-8?B?WEZLZ2hReDE1Z2VQL3BmQ24yQVJHQW1lWTZ0R3creGIvSVNNdXBMRm9BQzFR?=
 =?utf-8?B?amNHVVY2UnJuc2lUazR5N1Q2dFFzdW0veDFYcEJvbG1QckthamZJZjZnNmto?=
 =?utf-8?B?VnBLZGxRWHB0ako4a2NQb2g2SERYWUJmTnV6NEx0TU9wSllHTm84RWtiVVFL?=
 =?utf-8?B?TXZOU0c2ZHBmV2RKMDdHYmRmTzQ3ZGRCenVNWDZ1RnpBWmtmeUhhZVBrSTdH?=
 =?utf-8?B?cmZpUXJSN3NLNFczTTNkRTAvTXVQcGVlYmZFREtBSFB1dk9yUVU5NVBIUTdP?=
 =?utf-8?B?cjNCbUFqeVB4QmZZNjluQ1ZiL2VIUEhTUE4yVUNRN0UxeDVEa3pxaDVwOHda?=
 =?utf-8?B?NW5jbFV0VVlHdUwzZFlQdUcxS2x3K1U2NVl5Wk43V2RXRlZYU2VrNHNDaitK?=
 =?utf-8?B?Wi9yZ1BvY04zM1YvcXIrVW1rRGUwZXFZazN4ZXdaVExGWWErTU5iRG9BK3Zh?=
 =?utf-8?B?NnI0ZE9NTTZUY1o2dE4xUFhENGdlYnplanZMOEFqN2RMZ3lDaEhaZ3BscmtW?=
 =?utf-8?B?U1BxNm0yT3ZCMkl6c01RajZHbURVUW01a1ExQWZEMnlTVnJOamVwc0ZVV2VO?=
 =?utf-8?B?M1VMMFl4eGViK3drdEt4YmhsekNDQTFtbnlCTEFaTWx4b09BUTRSbWgyNTdH?=
 =?utf-8?B?aEFJWXBEUUNUSUgrRjkrMnVlZEp4OGNCZyttaGhOa014bFF4MXM1QjhCUFhx?=
 =?utf-8?B?bm04UEZ2Z1d5MG0xbUxTMHNDd21sejc5YjhsdGFNQXY4WUM3SEZMaWtka0g5?=
 =?utf-8?B?SjhhL2VLdWZNYUU1VXlCb3NGZloyeVZHY2tLbkdITzRVci9pUmhMSkxMZVVS?=
 =?utf-8?B?RTZvUWZxNHFJcjVBUEt0MGhuZEZEUSsvMDNrY1Z6V2Vma0JKanlNTkc5dTRs?=
 =?utf-8?B?NHQvZGRYZDVoK205UlVvUllBY0RPbk1PMDk4S1lCejArMGN5UnlacCtWVjAw?=
 =?utf-8?B?Tmt5VTUvY1hrelJpYWh0M1dGRytkaUJUMlVXeTN2cFU3OWdWUkJzYThpZ2xD?=
 =?utf-8?B?b1VUc0x1b0tTbkJIM3JEeTYvMGx2aXBxRmJRVFUzcUtXU1I4aWlPdDJEdmJt?=
 =?utf-8?B?R094TEVYSDZQbW0rSGxxUGZxUUVFRUpKd2FjRVdKT0Z4SERhZldqV29jTmtE?=
 =?utf-8?B?dkVRU3FxRUlyOVVwNm1DajdyVmlMLzU0TVNuMGFzejJFNlFKdWpkejdsOWlj?=
 =?utf-8?B?eVRJbGZrMGtTY3ZzZWJ4TGpjK1lJbDJGZGpaRGg5eC9VYzlxU0VBWDhYaEtn?=
 =?utf-8?B?cnFPY2JETGNaanNoSEVjWUxZU2U0VS9ORFoweXEyaElNbjYwekxlQjU4Z3hT?=
 =?utf-8?B?RVBKS0Z2cnFQR3BBMy9teUNqUlQvS2x0anAzYjFXeVBrbWg1dUVnUGdQdk9N?=
 =?utf-8?B?UlQ0K0w5M2xvK1pvQVVBQmh3WnY1QkdSYlExeHd2cytjVUdSZm1zeExNSkxw?=
 =?utf-8?B?ZUxxaEl2Mmo5bU1GajRHTWIvUURTK3dad2lLZmVEQVRuN1p5RllBaGJzMVQ2?=
 =?utf-8?B?cFBsL0lxdGsvWnYzVkYvWFhIa0dxUEIya1BQMkg5ZGg5REl2RWtGbXR0VEll?=
 =?utf-8?B?WERHd3Axc1FnMUh0eVYyR2RBUkVQR0NjSGN4K2hTRjRmTnR3WDNsbWl2T2FS?=
 =?utf-8?B?NWZrdXR6dEVUVXpZMWMzaGtibjRSbHhTbmdhK2poaC9PT3pmbEY0K01DaUpO?=
 =?utf-8?B?WHQyaFR1N2FvL0p6eUVlQ2J3eTg1LzFrSHc0R2hVcW1xd1lKTDBrUVZucE50?=
 =?utf-8?Q?YPjyT02fBCC7+TRmuaw2pWfzLfq8Oz35jyA0AGXZnE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE56896B58F6694EAA8C49AAD7333D0D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 42eafe88-51a6-43e6-46f7-08d9be56b833
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 16:36:31.5513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OLApctbJ39uHF1Ysv+stQ2NO53HVnGHjMnWJjChbvHaSguuW50UrujUGbIA/4bFmCD87DiXaOjfqzZ3w32Z0cZ/ea5PZ9ecbpTEvv6dNZ7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0069
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzEyLzIwMjEgw6AgMTU6NDcsIEpvZSBMYXdyZW5jZSBhIMOpY3JpdMKgOg0KPiBP
biAxMi8xMy8yMSAyOjQyIEFNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+IEhlbGxv
IEpvZSwNCj4+DQo+PiBJJ20gaW1wbGVtZW50aW5nIExJVkVQQVRDSCBvbiBQUEMzMiBhbmQgSSB3
YW50ZWQgdG8gdGVzdCB3aXRoDQo+PiBTVFJJQ1RfTU9EVUxFX1JXWCBlbmFibGVkIHNvIEkgdG9v
ayB5b3VyIGJyYW5jaCBhcyBzdWdnZXN0ZWQsIGJ1dCBJJ20NCj4+IGdldHRpbmcgdGhlIGZvbGxv
d2luZyBlcnJvcnMgb24gYnVpbGQuIFdoYXQgc2hhbGwgSSBkbyA/DQo+Pg0KPj4gICAgIENBTEwg
ICAgc2NyaXB0cy9jaGVja3N5c2NhbGxzLnNoDQo+PiAgICAgQ0FMTCAgICBzY3JpcHRzL2F0b21p
Yy9jaGVjay1hdG9taWNzLnNoDQo+PiAgICAgQ0hLICAgICBpbmNsdWRlL2dlbmVyYXRlZC9jb21w
aWxlLmgNCj4+ICAgICBLTFAgICAgIGxpYi9saXZlcGF0Y2gvdGVzdF9rbHBfY29udmVydDEua28N
Cj4+IGtscC1jb252ZXJ0OiBzZWN0aW9uIC5yZWxhLmtscC5tb2R1bGVfcmVsb2NzLnRlc3Rfa2xw
X2NvbnZlcnRfbW9kIGxlbmd0aA0KPj4gYmV5b25kIG5yX2VudHJpZXMNCj4+DQo+PiBrbHAtY29u
dmVydDogVW5hYmxlIHRvIGxvYWQgdXNlci1wcm92aWRlZCBzeW1wb3MNCj4+IG1ha2VbMl06ICoq
KiBbc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbDo3OToNCj4+IGxpYi9saXZlcGF0Y2gvdGVzdF9r
bHBfY29udmVydDEua29dIEVycm9yIDI1NQ0KPj4gICAgIEtMUCAgICAgbGliL2xpdmVwYXRjaC90
ZXN0X2tscF9jb252ZXJ0Mi5rbw0KPj4ga2xwLWNvbnZlcnQ6IHNlY3Rpb24gLnJlbGEua2xwLm1v
ZHVsZV9yZWxvY3MudGVzdF9rbHBfY29udmVydF9tb2QgbGVuZ3RoDQo+PiBiZXlvbmQgbnJfZW50
cmllcw0KPj4NCj4+IGtscC1jb252ZXJ0OiBVbmFibGUgdG8gbG9hZCB1c2VyLXByb3ZpZGVkIHN5
bXBvcw0KPj4gbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLm1vZGZpbmFsOjc5Og0KPj4g
bGliL2xpdmVwYXRjaC90ZXN0X2tscF9jb252ZXJ0Mi5rb10gRXJyb3IgMjU1DQo+PiAgICAgS0xQ
ICAgICBsaWIvbGl2ZXBhdGNoL3Rlc3Rfa2xwX2NvbnZlcnRfc2VjdGlvbnMua28NCj4+IGtscC1j
b252ZXJ0OiBzZWN0aW9uIC5yZWxhLmtscC5tb2R1bGVfcmVsb2NzLnRlc3Rfa2xwX2NvbnZlcnRf
bW9kIGxlbmd0aA0KPj4gYmV5b25kIG5yX2VudHJpZXMNCj4+DQo+PiBrbHAtY29udmVydDogVW5h
YmxlIHRvIGxvYWQgdXNlci1wcm92aWRlZCBzeW1wb3MNCj4+IG1ha2VbMl06ICoqKiBbc2NyaXB0
cy9NYWtlZmlsZS5tb2RmaW5hbDo3OToNCj4+IGxpYi9saXZlcGF0Y2gvdGVzdF9rbHBfY29udmVy
dF9zZWN0aW9ucy5rb10gRXJyb3IgMjU1DQo+PiBtYWtlWzJdOiBUYXJnZXQgJ19fbW9kZmluYWwn
IG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+PiBtYWtlWzFdOiAqKiogW3NjcmlwdHMv
TWFrZWZpbGUubW9kcG9zdDoxNDU6IF9fbW9kcG9zdF0gRXJyb3IgMg0KPj4gbWFrZTogKioqIFtN
YWtlZmlsZToxNzcwOiBtb2R1bGVzXSBFcnJvciAyDQo+Pg0KPiANCj4gSGkgQ2hyaXN0b3BoZSwN
Cj4gDQo+IEludGVyZXN0aW5nIGZhaWx1cmUgbW9kZS4gIFRoYXQncyBrbHAtY29udmVydCBjb21w
bGFpbmluZyB0aGF0IGl0IGZvdW5kDQo+IG1vcmUgcmVsb2NhdGlvbnMgaW4gYSAua2xwLm1vZHVs
ZV9yZWxvY3MuPG9iam5hbWU+IHNlY3Rpb24gdGhhbg0KPiBleHBlY3RlZCwgaS5lLiBucl9lbnRy
aWVzID0gc2VjLT5zaXplIC8gc2l6ZW9mKHN0cnVjdCBrbHBfbW9kdWxlX3JlbG9jKS4NCj4gDQo+
IEEgZmV3IHBvc3NpYmlsaXRpZXM6IHRoZSBFTEYgc2VjLT5zaXplIHdhcyBpbmNvcnJlY3RseSBz
ZXQvcmVhZCBieQ0KPiBidWlsZC9saWJlbGYgKEkgZG91YnQgdGhhdCkuICBPciBtYXliZSB0aGUg
bGF5b3V0L3NpemUgb2Ygc3RydWN0DQo+IGtscF9tb2R1bGVfcmVsb2MgaXMgbm90IGNvbnNpc3Rl
bnQgYmV0d2VlbiBrZXJuZWwgYW5kIHVzZXJzcGFjZSAoSSdtDQo+IG1vcmUgc3VzcGljaW91cyBv
ZiB0aGlzKS4NCj4gDQo+IENhbiB5b3UgcG9zdCBhIGNvcHkgb2YgdGhlIGJ1aWxkJ3Mgc3ltYm9s
cy5rbHAgYW5kDQo+IGxpYi9saXZlcGF0Y2gvdGVzdF9rbHBfY29udmVydDEudG1wLmtvIHNvbWV3
aGVyZT8gIEkgc2hvdWxkIGJlIGFibGUgdG8NCj4gc3RhcnQgZGVidWcgd2l0aCB0aG9zZSBmaWxl
cy4NCj4gDQoNCkkgc2VudCB5b3UgYm90aCBmaWxlcyBvZmYgbGlzdC4NCg0KSXQgbG9va3MgbGlr
ZSBrbHAtY29udmVydCBkb2Vzbid0IHVzZSB0aGUgY29ycmVjdCBzaXplLiBJdCBmaW5kcyBhIA0K
c3RydWN0IG9mIHNpemUgMTIgaGVuY2UgMyBlbnRyaWVzIGZvciBhIHNlY3Rpb24gb2Ygc2l6ZSA0
MC4NCg0KT24gUFBDMzIgdGhlIHN0cnVjdCBoYXMgc2l6ZSA4ICh2b2lkICogaXMgNCBhbmQgaW50
IGlzIDQpLg0KDQpCdXQgSSdtIGNyb3NzLWJ1aWxkaW5nIGZyb20geDg2XzY0IHdoZXJlIHRoZSBz
dHJ1Y3QgaXMgOCArIDQgPSAxMi4NCg0KQ2FuIGl0IGJlIHRoZSByZWFzb24gPw0KDQpDaHJpc3Rv
cGhl
