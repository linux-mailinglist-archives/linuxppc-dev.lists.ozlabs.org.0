Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1644C5E33
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Feb 2022 19:39:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6C395SV3z3bdL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 05:39:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6C2f54yKz30LR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 05:38:50 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K6C2f4PSjz4xcZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 05:38:50 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K6C2f47w1z4xcd; Mon, 28 Feb 2022 05:38:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::604;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K6C2f2LW6z4xcZ
 for <linuxppc-dev@ozlabs.org>; Mon, 28 Feb 2022 05:38:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgtXv86Jw0pI2+chtBoeIVYnnt29PxQ/l5s+wONFe+rZODC5kg3z4tHXV2fE0H1W5zXBMvjB/Z+bUrz9udUiIm37poKRrfhzP6Zy9WHEtl5o6ClCcHLcJssC3G9XBDu3B/D49nk4VRf6t270LNG/tw+WcoiosH2idiJ1WMkGTjjJP8GA7Gl9Q94RjoWN3ABSuFNGl3AYpzAGBDHZED4237axltHVqiQby2IQ/2zPTkytohhPWSfXBvc+7800EaLdRw90qr62Ei0El2q7mWN8gH4qM7yxMqLBNftHMd0G17/61k+s5I663RQFBJigxAnJYNSHxGszKALbTjPBHJY6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNnv3G/oUNJMK0JeIkhTTEkpqqr3vOHY1aM8eXzSrVk=;
 b=N0qsGQaQn2xufnlNcRIRUucfIkjkCZLEKSb0ZPXRQiZ+jSZ0qjLl4az8NeajI/U5BLJARCT4mS/RBYCNNoMuaKcQU+2qLLdPf8BnyEW+2SHLqLQWGcV+tQyvXYV+NwIluKciqUPnkt71lGkYRoCCCS6hobg0A/j9CB7cS+BcSe8E3jfviSksitKg/RC52hN9vsNmKVP4+GBkmJHnLTQeCgMtksbO5QhouAe25co0+TZvGFWtMYcr0DWVu7DxnVb8RzA8AC8fFUUJ2RK6+yPOxhqS/Y3p7o3V9jED5CTKGq1twOpN562C8xA2xf6syLjU4fEToaf49laR5lBZizNh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Sun, 27 Feb
 2022 18:38:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.026; Sun, 27 Feb 2022
 18:38:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH] powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
Thread-Topic: [PATCH] powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
Thread-Index: AQHYKjICtcwW5fJ9DE2rof2xv5uoBaynvhWA
Date: Sun, 27 Feb 2022 18:38:40 +0000
Message-ID: <04d111d4-1764-e164-a995-9de591e9554d@csgroup.eu>
References: <164578465828.74956.6065296024817333750.stgit@jupiter>
In-Reply-To: <164578465828.74956.6065296024817333750.stgit@jupiter>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7eef2ebc-f0c0-47b8-7cbd-08d9fa206023
x-ms-traffictypediagnostic: PR1P264MB2048:EE_
x-microsoft-antispam-prvs: <PR1P264MB2048EA667E3FE78FFD1BA55FED009@PR1P264MB2048.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8djS3MtrFvU41FEwiKTKXxR1dskHmkHV8vnjyfBmIbCcJWIp7+e4+Tchl2jwz4+Q5TvhS6lL4VPkXeUipoxQBMdAwpfL3sLPtuVtluvr/HIrTvvG2QrHsRjQcS8qb7oMoqb0SWrNILKDMqqjrVqbhzDXvyYfpQMZcEQ0RGQ5MIVb+vM0EP78YZhOarfTp6slWB7eKR23wOW2luaI7q5eP/ENi9hCydPYD8UiiRF4G4KPzR7ybuHFudaa+BZaBgt0hno/BcCJDHmYf1olfdPPmM6CZTZXo15VfOIG4yhQw3G6hOsUIyVb0NJ6WpKu2O5Uk2AtbuRo1YGGdZxD8SFwXUNdhvYxpX/XNsLAAm1QZc0et8gguITRIFsJ0aJoWNhsP4bBKLeaCnJNTdGNCgXwqAXooWXcDkFbBeiuQDQUkYYVgUiUM+i54dVuMvedPCQiD7ESHLUeVXartypY1ITdPzf8Bezj0qpYN2Hbu6r4VfnlzfOqRJtHQk8/clCKbmkfBKfTfzaGD7gftTyipFU2zPkf6yxFZDnEJ8b0ncEwAxwR3ej3cEoieKB5X2y8601tH6/+4Wg/ic8QKQq5+f2cR7zDBbAVtjSctfC9XJnQFbwSJITBdcYxjhQVWupnpwNiJ0nVDvIoBKE4UihVfR0Yj3oEF72T1usmq7sh/+UurV7aJcJ5n0fBn68SO6/GtR5nG52a2hSP5GqbbnwGQ9/LYJBXCRcpH96yNZoSTJ+TbPM2cun440b0JlSscxuH/cJQrpxKAN80JqLM+o36gemP/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(66556008)(5660300002)(91956017)(4326008)(44832011)(8936002)(66446008)(66946007)(66476007)(31696002)(8676002)(86362001)(76116006)(6512007)(6506007)(54906003)(36756003)(6486002)(508600001)(110136005)(122000001)(2906002)(316002)(71200400001)(26005)(31686004)(2616005)(186003)(38070700005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG5qcDJPbUI0aWNTQWJSWVE5a015ZXIyWjJZb0N2SUNvMEViTmRML2lOWjJC?=
 =?utf-8?B?ckFoaTU2cGNQcjBLUnk2NmpJWXNzYzI3NThHLzFSbkhiWDJ4VkUrVWwrdzYz?=
 =?utf-8?B?L3ZJVWt0bDNra2t3VDVSKzBXZjVtOXZMYnZhemF1TU5EVkltNTcvNVF5Umhw?=
 =?utf-8?B?SjlTWEFyd2ZEZjNqQjA5Rzc2WkZqSHl6VTdlWTA0K01DaTRLenlUWTNqMjUv?=
 =?utf-8?B?dWpjbzdJZEQ4Z2o0UDhaeXZ3U3l1bWdwTUoya2g3S2FCbXFSZWpuR2M0b2Fz?=
 =?utf-8?B?QTdqN01YTmJtODBwcDJBeWxiRXFMMkg1QkhKWG5ibU5WY0d3ZUFGd21POTlO?=
 =?utf-8?B?QkFGTGVzN09uZGVMd3R0d0NiSjhab2JLeG5vOXRZZEJrWTQwNHBTRGFENTZK?=
 =?utf-8?B?Y1lHQzM2TmQxVUZQVm53TVBYUUJ2d2VMek9HL2R2T1Mvb2xEdFhwQVFzYjNJ?=
 =?utf-8?B?bDllZ2FTdVArVW1nSTBadHFtZ1FnZE9aWkNxdndWV0FsNmNUNHhoYlF1WkMw?=
 =?utf-8?B?Mk5Pdmh4di9WaUdHYmxVZlQ5ZnRnbThuaDV2OU80blJMUkFJZHZKZG5hTEtK?=
 =?utf-8?B?MFVKT3VTWHl5TjFPR2R1ZEYrOGdQcWFaVnV6dmh4U0dTbjZISEtWbU5jR1Vt?=
 =?utf-8?B?eXBybmRsV1d3TkRHOHpwUmNHMkVjNE1McDNmRkJPRkhBNndaL0lFS1hXd3do?=
 =?utf-8?B?aHlFN2pSZm9HakoyeGhBZXRzTWhVMG9SMDRVZGtaNUdIK2d5RUJ2eFFJYnpp?=
 =?utf-8?B?RWllQ3JUVkVvYytIalNSSUY1bmUxNmdFd0hEOXVJRktFTTljYUhwMEVTRmhP?=
 =?utf-8?B?UWJ5VXVudW9UcCtlRm5vaWZhMjFRLzBnNVpsWEtqckQyWHpySG8ra3UxZUor?=
 =?utf-8?B?TnlXQW5RWjJIMjBuMy9jV0FCSzBjUU41VHY2bW1CaVp0cmw4Qzcxa21jdlBP?=
 =?utf-8?B?dmowM3NndzMrR0t4cnhiY0xaMGNHN2hUNkIyOWV1ZlUvMDA2T1VHTDdsclNM?=
 =?utf-8?B?UFpMMWtLZ0NXMDFkcld1SUpzWWd2Zlg4anJhTHU0cnUwK1FtajRQaEtNbGRs?=
 =?utf-8?B?UGZubVUyNFByUnI4UUxLMWNyaXpCSFJiQmtrRnBOSzVCQXZqR01JMk1vcFpW?=
 =?utf-8?B?d2I5cjlmSHIyRm50YjNTdDNQbUdCd081NllhQ0o0RndkZVlFdWk4MEJmOHU0?=
 =?utf-8?B?SFlISkpZeXRkamU4OXZFbDFOdTN3YS9EK05BQ0h5d2dZK1NBaEtINDR1djBM?=
 =?utf-8?B?MnBWZFEveUxRcUhKSVB1RUtCTFFLWDduZW5udS8yUGZrQXdrNGpZOEpKVTZ1?=
 =?utf-8?B?Q0EydDh1NFhVc3ZEOTVCREhLNlE4WlBkTVplSTBKUW5zYm42Q25hY1B1UDRQ?=
 =?utf-8?B?RnVtenkxdXdWV1pCbVZXdUQ0RG42OFJSTnNFdi91NUxHL21iYWUrN0pLMEJk?=
 =?utf-8?B?Tk5GU0JGRFRjaFhlUEx6bU56WmZCMVFabCs5TktpVXk4M3BzNG9GSEtNRzk5?=
 =?utf-8?B?K0xlUDNBMllBL0M4SXdYQzhtMmwxSmRSaTBpZDdSeUExYmJLdHcrSC9UYXgz?=
 =?utf-8?B?TTAzd1ptSTYveTRIRE1qaVIvKzdRT3Ivai9SNldTT1dpY0VHN1J4WGgvR2VT?=
 =?utf-8?B?R2FLM2RLRnk3TjU5QVJtblAxTDB1bUFoWmpkVlNPVGN5dmVrNkdISFE5SUo1?=
 =?utf-8?B?akxQWk43Wm5NQWdpc3hxZmlzT0M4VkFad1NydiszOEw0Yy9UVS9UOW96RHVs?=
 =?utf-8?B?dVNVWmVwK29kbjNNSUJHazg4eEY3UFNRdGhaTU9MeW1lOXp5TUdiektTa05n?=
 =?utf-8?B?WWlvM1RVclJDOWwrR0tQTzlUUmhhWWdFSVRIOUNDRUVVK2JQR1Jid1JlSGhw?=
 =?utf-8?B?UjQvUkM0c0Fxenlici9IcjVvM3hzNUtxb1l3c3NKeUE3NnRjUWluRUZEdzl4?=
 =?utf-8?B?ZFdzQU03UjVSYUl2ZVU1aU84THdtdVMvb01pZDJlRzBKQmttbGw2VGttU0RR?=
 =?utf-8?B?VGFpRS9oTnF3d2p5UjRRSGlmUW5xSWtlZG9vMndQbzg1ZFYyTi9IR3BxcGZo?=
 =?utf-8?B?NXk3bnY1cFFwVS82dkVXTmVISjljTE1FazRyREpHQkRBRllvWXl1U3N4TU5P?=
 =?utf-8?B?bHFWazhEaTFMUHV1NEJ4YlFoY3pOSXBsRjhRWFRaU1lrNmRRRlJCNUhqMzZt?=
 =?utf-8?B?R1AvR2cwRWNGZU85d2xmU0J1MVRUSmxPb2RCUHZGTUdyZlJDb0NiN0hlUHJv?=
 =?utf-8?Q?a7XqH3+dkUgKP7WWMEUH67prTNHNu942S/idafH2oE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <560EA3D560A66F4593403103858E7A7D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eef2ebc-f0c0-47b8-7cbd-08d9fa206023
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2022 18:38:40.8159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Wjpq+GIEiDy2jHLVaM8TBzXUCv0hnYXDO7RPormmcYlEPiiZ+xlIEEQH4Q6C/QAB/iezCHes3eUQtNJCPu5AipHNMJoVm+QhGh6tjwhvaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2048
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAyLzIwMjIgw6AgMTE6MjQsIE1haGVzaCBTYWxnYW9ua2FyIGEgw6ljcml0wqA6
DQo+IG5taV9lbnRlcigpL25taV9leGl0KCkgdG91Y2hlcyBwZXIgY3B1IHZhcmlhYmxlcyB3aGlj
aCBjYW4gbGVhZCB0byBrZXJuZWwNCj4gY3Jhc2ggd2hlbiBpbnZva2VkIGR1cmluZyByZWFsIG1v
ZGUgaW50ZXJydXB0IGhhbmRsaW5nIChlLmcuIGVhcmx5IEhNSS9NQ0UNCj4gaW50ZXJydXB0IGhh
bmRsZXIpIGlmIHBlcmNwdSBhbGxvY2F0aW9uIGNvbWVzIGZyb20gdm1hbGxvYyBhcmVhLg0KPiAN
Cj4gRWFybHkgSE1JL01DRSBoYW5kbGVycyBhcmUgY2FsbGVkIHRocm91Z2ggREVGSU5FX0lOVEVS
UlVQVF9IQU5ETEVSX05NSSgpDQo+IHdyYXBwZXIgd2hpY2ggaW52b2tlcyBubWlfZW50ZXIvbm1p
X2V4aXQgY2FsbHMuIFdlIGRvbid0IHNlZSBhbnkgaXNzdWUgd2hlbg0KPiBwZXJjcHUgYWxsb2Nh
dGlvbiBpcyBmcm9tIHRoZSBlbWJlZGRlZCBmaXJzdCBjaHVuay4gSG93ZXZlciB3aXRoDQo+IENP
TkZJR19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSyBlbmFibGVkIHRoZXJlIGFyZSBjaGFu
Y2VzIHdoZXJlIHBlcmNwdQ0KPiBhbGxvY2F0aW9uIGNhbiBjb21lIGZyb20gdGhlIHZtYWxsb2Mg
YXJlYS4NCj4gDQo+IFdpdGgga2VybmVsIGNvbW1hbmQgbGluZSAicGVyY3B1X2FsbG9jPXBhZ2Ui
IHdlIGNhbiBmb3JjZSBwZXJjcHUgYWxsb2NhdGlvbg0KPiB0byBjb21lIGZyb20gdm1hbGxvYyBh
cmVhIGFuZCBjYW4gc2VlIGtlcm5lbCBjcmFzaCBpbiBtYWNoaW5lX2NoZWNrX2Vhcmx5Og0KPiAN
Cj4gWyAgICAxLjIxNTcxNF0gTklQIFtjMDAwMDAwMDAwZTQ5ZWI0XSByY3Vfbm1pX2VudGVyKzB4
MjQvMHgxMTANCj4gWyAgICAxLjIxNTcxN10gTFIgW2MwMDAwMDAwMDAwNDYxYTBdIG1hY2hpbmVf
Y2hlY2tfZWFybHkrMHhmMC8weDJjMA0KPiBbICAgIDEuMjE1NzE5XSAtLS0gaW50ZXJydXB0OiAy
MDANCj4gWyAgICAxLjIxNTcyMF0gW2MwMDAwMDBmZmZkNzMxODBdIFswMDAwMDAwMDAwMDAwMDAw
XSAweDAgKHVucmVsaWFibGUpDQo+IFsgICAgMS4yMTU3MjJdIFtjMDAwMDAwZmZmZDczMWIwXSBb
MDAwMDAwMDAwMDAwMDAwMF0gMHgwDQo+IFsgICAgMS4yMTU3MjRdIFtjMDAwMDAwZmZmZDczMjEw
XSBbYzAwMDAwMDAwMDAwODM2NF0gbWFjaGluZV9jaGVja19lYXJseV9jb21tb24rMHgxMzQvMHgx
ZjgNCj4gDQo+IEZpeCB0aGlzIGJ5IGF2b2lkaW5nIHVzZSBvZiBubWlfZW50ZXIoKS9ubWlfZXhp
dCgpIGluIHJlYWwgbW9kZSBpZiBwZXJjcHUNCj4gZmlyc3QgY2h1bmsgaXMgbm90IGVtYmVkZGVk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFoZXNoIFNhbGdhb25rYXIgPG1haGVzaEBsaW51eC5p
Ym0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0Lmgg
fCAgIDE1ICsrKysrKysrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZXJj
cHUuaCAgICB8ICAgIDIgKysNCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3NldHVwXzY0LmMgICAg
ICAgfCAgICAzICsrKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KDQoN
CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvbGludXgvYXJjaC9wb3dlcnBjL2tlcm5lbC9pcnEuYzo1
NzowOg0KL2xpbnV4L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaDogSW4gZnVu
Y3Rpb24gDQonaW50ZXJydXB0X25taV9lbnRlcl9wcmVwYXJlJzoNCi9saW51eC9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vaW50ZXJydXB0Lmg6MzM3OjEwOTogZXJyb3I6IA0KJ19fcGVyY3B1X2Vt
YmVkX2ZpcnN0X2NodW5rJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikN
Ci9saW51eC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0Lmg6MzM3OjEwOTogbm90
ZTogZWFjaCANCnVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9y
IGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9saW51
eC9hcmNoL3Bvd2VycGMva2VybmVsL2lycS5jOjU3OjA6DQovbGludXgvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2ludGVycnVwdC5oOiBJbiBmdW5jdGlvbiANCidpbnRlcnJ1cHRfbm1pX2V4aXRf
cHJlcGFyZSc6DQovbGludXgvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oOjM1
MzoxMDk6IGVycm9yOiANCidfX3BlcmNwdV9lbWJlZF9maXJzdF9jaHVuaycgdW5kZWNsYXJlZCAo
Zmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2xpbnV4
L2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxLmM6NTc6MDoNCi9saW51eC9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vaW50ZXJydXB0Lmg6MzY2OjE6IGVycm9yOiBsYWJlbCBhdCBlbmQgDQpvZiBjb21w
b3VuZCBzdGF0ZW1lbnQNCiAgc2tpcF9ubWlfZXhpdDoNCiAgXg0KL2xpbnV4L3NjcmlwdHMvTWFr
ZWZpbGUuYnVpbGQ6Mjg4OiByZWNpcGUgZm9yIHRhcmdldCANCidhcmNoL3Bvd2VycGMva2VybmVs
L2lycS5vJyBmYWlsZWQNCm1ha2VbM106ICoqKiBbYXJjaC9wb3dlcnBjL2tlcm5lbC9pcnEub10g
RXJyb3IgMQ==
