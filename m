Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAEC66D6E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 08:28:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx0qG05wKz3bXv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 18:28:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DvDASth3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.75; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DvDASth3;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2075.outbound.protection.outlook.com [40.107.12.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx0pF2fnDz3bWj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 18:27:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxFAxatzmMAseyMgZ4MmjaLUkQB2W4ROk48ck4P4qcypWYV6JVpb3gdX2SJbQpPSYgwKrx2i5ZvpsM0n32yCA/R1iSRcP8DTvXw3+LvZTUzrzAx8upJJYXA1VHI4xjjxI6fgU8P+v0qh2RD5GdNCofKdD/IkGFLLiavDY6NMza2qkJHyArmZ9K18afKRmxg1QEQBEX2HFNUEZpqDXWaJOLvU0I4OupYBaRnllPNDj+xUEASBOIrGzXoY7EwUZD6y8yUTHybkUusZk5XLU9V2NfDphEv5Mt80z9IevlGobcV8jifEwp33+rDpzZwoTTBZgd9u94Zt6/GJcqkx7mPS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD+Le03Ki0Zwn2LS2hENs+FV/UOcbqPXnMKLsuKxfm4=;
 b=iYm0JYN2as+POi+5rGyULC/G/TBcGRager12x7S8j70yjvwSmb6CPjhPaQbMwdRhbDKc+Uocx1+1k4fHuF4asEHLLlJJyH5xVyMi/msSvsjJaBFrfRnqKzZLIk9L+QOiXoxiy5s0MS6wJCz8OXhYylycGoxHKx/gATzxybhWtzAJvxQDeZbtnHjumUu/vUh1EZVPWUNb97ZKWSsZJWhUOfz6+qIGTIYhTVbLVZ31d+VfB326uFas6aSaXnDr8nNH269/12Q+vMJVMXKR14fd1w/XAvvHsXv+5jCLcmZypaunezrIGMba8Xtd7qddQ3ZLDpLKz6hkD/LLyetVerGCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD+Le03Ki0Zwn2LS2hENs+FV/UOcbqPXnMKLsuKxfm4=;
 b=DvDASth3/x4GlJfyiI8QjVoVBiz0Qc7Z0qeV5/eHdouQYxAHDX9DwK/ah42XZVRscP/88X1DRkMyhw6kNstnQ9KELH3BlLMUEoPcYLM4V+DiomxzaIu0OR/YUOtndT4F5qtf/E8i9mFRZ0dl+uUjP4rhapTLv9xjfQK3NcwZHQIjone3OpKHNw53icRMfnHhZcuxpF9edI5xxwigNjBA3UgxKQBACsNyn9K7mNEo5rj+ICtlDlzoB+SsLLmqtSmuabZofoUhCDOQaXJM8N0EDtM4NIzuHf20uLQXLRPqIo1+TSRBQPkOIKPy6SQ6a0JizD0p/DgwJTYOS9uzvus1mw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2935.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 07:26:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%9]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 07:26:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
Thread-Topic: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
Thread-Index: AQHZH5xSiGvUukY/6EynXZxGkihbMq6WY+mAgAgZf4CAAcAdAIABT8OAgAC9o4A=
Date: Tue, 17 Jan 2023 07:26:54 +0000
Message-ID: <75194fe4-8276-4749-ab41-f8ddf02a0200@csgroup.eu>
References: <cover.1672767868.git.geoff@infradead.org>
 <2df879d982809c05b0dfade57942fe03dbe9e7de.1672767868.git.geoff@infradead.org>
 <25cc9a51-2311-d7d3-3451-08725e6384cd@csgroup.eu>
 <284aed88-dc26-d74a-cf7a-f5875ba058eb@infradead.org>
 <87mt6j9wcf.fsf@mpe.ellerman.id.au>
 <a449698b-93f5-0742-77fe-5699544eab5c@infradead.org>
In-Reply-To: <a449698b-93f5-0742-77fe-5699544eab5c@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2935:EE_
x-ms-office365-filtering-correlation-id: 5e1f5814-c143-4dba-c99f-08daf85c354c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KiYuU/OhV/NarWPsjXXnwUoti48IddERBY6c+lCeQSHZwh0RrWApZUk7BPNXIoOFijGkcLnbAmDL/crFT5SOBmCiyJDztyrVju1c7qFirSzP6++Lp3b4dOby/ksD1UA4oqkWJv5G/TESJP4ylYOvc8JQ9Zlnp5mLvKlxDJ1auBil/B3eSwAmUWo890iNroQ2IrnvSYoH7tAu2c28QOFoKZlUtkSK2Pds4KbZLnBTGTJTQLz3FG7NqmJtGnRISC/WhjnIl8SZwcrkB+gp1h1TJXsqtYBLgf1g7PGS+bgAMALlaj7gb37SKKiahfhUr/O4eHTLZr3FQo5c5Aw2BCpo844UrmVEQL5D0zsmrs9AkNvSp664m+m9nUTFLlHtW+G/tdmthpnMBT+gnXjKYIRxls3PgqBc4hAutYmBvtyGt/rApqYmrGVlWb2kQ4u7KnpfLcBLwheyb05sYMAWFbf5aDdiQ3HdUB2mXT70pYpsC3yTggrTcLvc2k9Fr5x0NB/YkwAJgq4L0sd5zM9Io/iGJ1pO8h4aYAi6BbhD3h1k2bVHiXxeFgMV5KMHqKW5HSWkYDoN1SPI0fC8dh9wrzYQuNyLpuATtyasmDyQo9PsZdjUfUKJdTUNvc+aN9lriTqOS1IeEK5jvUslITKYYKLOaLxjuEGrcKmM8WO/Ueg5TI3/r0SEuvLYg1QZFlEBCqG3RkcSuilj5CUZaVcRDsbMrvBKXc92w2uz+qHrLG5N49mV3cSLkI3wryNEs8moMY9AHGQeQTLYhPwEqnIAhikWzw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(451199015)(6506007)(36756003)(2906002)(53546011)(4326008)(15650500001)(76116006)(5660300002)(8676002)(83380400001)(8936002)(122000001)(44832011)(31686004)(66899015)(64756008)(38100700002)(6512007)(66446008)(66574015)(38070700005)(41300700001)(478600001)(6486002)(91956017)(66556008)(66476007)(26005)(66946007)(31696002)(71200400001)(186003)(86362001)(2616005)(316002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R2VPZHRJMXYzUzEyMTlzenJHRGNxUkNkblJUYmpYUFhheTRBYkVuY3kyNkFN?=
 =?utf-8?B?b2l2RjBBUCtCMjRRYXhPbW5UeTdJK1FCRDZTeWE1c1VPUkJZYUFkTDgzR2FD?=
 =?utf-8?B?c2kwRDM0Sk9wZm5QZm52ODdEek1PM2VLTkowR2E4OU1QNktRR2g1S0dpMDN1?=
 =?utf-8?B?QjNkYUxsendsM1NaZGFVUW9lMFFnUk1xMEdoeEVGTWFkQXhqblhMeWRhbnlE?=
 =?utf-8?B?Nnd0VkRadXdod2JJUUtRVFVEeWU4MXl2VWd4ZmlGbXVZOGJhOWpiU3c1aits?=
 =?utf-8?B?alJyMVFueXNjZUNEcTU1cmJWSHR1aDlzTlhqWkZCR2tHaEZLZUpEei9PUnNl?=
 =?utf-8?B?b3ZYdjgzb2MvYWtEMlQvM3dmbVNzN3BHUHFDWWZocmRqWllZK0llQStIV2RX?=
 =?utf-8?B?cGxVSTc4TFBpMWZKN1ZCZzcveWpYRzkxdzBTUExNOHY0a0l1bElKMldGOThW?=
 =?utf-8?B?Y243bmNpazlHOUlSRk54bHVRdElpdkQ5Q2hGbkNTeTdjbGRNajlaOTUzbURQ?=
 =?utf-8?B?VE5IejJOMjJadTR5OEtKU29MVzIzKzY5c21penpBZ0FPOGlyemd0TS9rZWJO?=
 =?utf-8?B?MUpsRExiWFNqenYyRjZTRVpGZmRLMXdnSUpQWUlHTS9tWlBzblhpZWYrOHdK?=
 =?utf-8?B?d1ZWU0VIeFhIRVNlS2lKREZ1Qmp1K0FqQnFFYXR4MmN0bStNeWdjMGk2K2Vj?=
 =?utf-8?B?d3NiN2xGVndTRE9KUDZ4R1YwSVY5cjZ5aCtnRjFhcGZmYnpPZWFlcWJsbkVS?=
 =?utf-8?B?alpPMm1BVHRad1JzMVR4TWNEekxLUWNtTG5iS1U0ZVJqWi9QRnB3YVJFV2Z5?=
 =?utf-8?B?anhBd1RyOE5tU3kxVFRXL0RVVDRTSHVrUlA2V2pmRUpZd282MmJzL1ZJMkht?=
 =?utf-8?B?OGZmSlpOdVE5L0duNFpENFVmVU9zZ3Z5RDBFYm02a09aNjhCRFkvb2pwbTFl?=
 =?utf-8?B?WFpUZmNvNXpqcEFjWS9SMWliZDJwTzJWNWpWSG9KS0dqMHZ1NThpK3NqSWxC?=
 =?utf-8?B?MmdVR2k4bU9jZzhMYzFBYWFoSGpyOGgrM0JYdWVsREJVcGdYMzk3SVkrOWU0?=
 =?utf-8?B?eDlEYTM1MFBtdWNVSTlLSTU1OURJbDJJT3pTZ3doenBXamxQM01LV1ZYaXRn?=
 =?utf-8?B?eml6alhueGdNMEhlUjZ0bHFlT1F0d0hWRzBFbGhxMWhnL3k5b0NpcWFqUGFm?=
 =?utf-8?B?Qi91ZzAxTUxpeUJheTZITzlxb1pZUzNRZ1ZLeUV2aDJKVElCWkxONk92NklU?=
 =?utf-8?B?azZpeVcvOTA0b2dWNzU3UTVZWkNIMlBlc3Q0NFEyTE9xa0Vycm4rTmFoUEZY?=
 =?utf-8?B?NHdIc3dJQncrUVVTM3VPWjkveVhBRXN4Mnp1R1R2aHJmOEI1azUvMzJVd1RX?=
 =?utf-8?B?UzNFbW9MRnBKNGl0QTdIbUhJcFVZSUI1WnlFVUhUbU1SWVdOeFNwUFo3UlU1?=
 =?utf-8?B?YzliN0RVMXpwVzVUWGM0eWFUdEVCTVBpdWFzM3ZSRHVReEFiT2hyRHMvNnZ3?=
 =?utf-8?B?bm9ReVRFeE42TkFJa1RDQkVFZDRHeGRia0RudmVLaThaQ0RHRTQ3bkdDblYv?=
 =?utf-8?B?d0VHWmhrOXpkTmpFdUwxT3BiZWd3a3hnYlV3UVZ0TWlsNVlvUDdUaWp6WmlG?=
 =?utf-8?B?U1hCVmgweGhhN2Jubk5vbWp1ejdhajV1Znl4c2xUeEpPdUgzMkdqdkY0VE94?=
 =?utf-8?B?bmhxSUVSUTBvOSt3OG1UQzhGaFpURGtJTjlEM0VybHU5cFF1NTlsQWc1QXJn?=
 =?utf-8?B?eXcxNmt0dTFBM2dsM0hESTlZcjFJZGIrazMzalpjb1ovSWtRS2xWOHpEL1dD?=
 =?utf-8?B?VUJjUUlLY09NUmFEVlJGZnJieUs2RUQvbkt0aUZ6SzgwOUVNVzM2QVpVWUU1?=
 =?utf-8?B?alpwQ24xQmhJdC8wNGU5SGdUalg3NnI5T3NQdWRjKytsaFpOMXBVeGo0NlU4?=
 =?utf-8?B?UG1LTHFOOU9ENWwzSXNqWGwySzFEM0xRdnVWbUdoVTg5alY0aGdnNVE4RHVu?=
 =?utf-8?B?YnQzK1VlRjUzdEVPVTh2RnYvRVd4Y09iYyt1Y0ZKWUVKVFNHUzgvMFd6Qkpx?=
 =?utf-8?B?ekNmNFJsU1VCb1FuNGRsTk1iallTTU93MVpNalllelFhYnM1azJqZEhQVE5N?=
 =?utf-8?B?bGZXM2MwcTNFRlBYcE43RGRIdmxUblIxc2M4VzJ4TkhOLzZaOVVGQ3BiUVFE?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBE0E27D3153844381FF10A3ABD37267@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1f5814-c143-4dba-c99f-08daf85c354c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 07:26:54.1095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPYTSR3QCtRmlD/lFRcgLqgYEMxRoLg2+P2xpJWdmljvlFIkFlXU0OjhsteG29OZ2ql557caUTn98EsJ//dsXNyO98gk04qW5WyEs11duH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2935
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzAxLzIwMjMgw6AgMjE6MDgsIEdlb2ZmIExldmFuZCBhIMOpY3JpdMKgOg0KPiBI
aSwNCj4gDQo+IE9uIDEvMTUvMjMgMTY6MDYsIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6DQo+PiBH
ZW9mZiBMZXZhbmQgPGdlb2ZmQGluZnJhZGVhZC5vcmc+IHdyaXRlczoNCj4+PiBPbiAxLzkvMjMg
MDk6NDEsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4+DQo+Pj4+DQo+Pj4+IExlIDAzLzAx
LzIwMjMgw6AgMTg6NTEsIEdlb2ZmIExldmFuZCBhIMOpY3JpdCA6DQo+Pj4+PiBDb21taXQgZmRh
Y2FlOGE4NDAyNDQ3NGFmZmYyMzRiZGQxZGJlMTlhZDU5N2ExMCAocG93ZXJwYzogQWN0aXZhdGUN
Cj4+Pj4+IENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCBieSBkZWZhdWx0KSBjYXVzZXMgcHMzX2hw
dGVfdXBkYXRlYm9sdGVkcHAoKQ0KPj4+Pj4gdG8gYmUgY2FsbGVkLiAgQ2hhbmdlIHRoZSBwYW5p
YyBzdGF0bWVudCBpbiBwczNfaHB0ZV91cGRhdGVib2x0ZWRwcCgpDQo+Pj4+PiB0byBhIHByX2lu
Zm8gc3RhdGVtZW50IHNvIHRoYXQgYm9vdHVwIGNhbiBjb250aW51ZS4NCj4+Pj4NCj4+Pj4gQnV0
IGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGl0IG1lYW5zIHRoYXQgQ09ORklHX1NUUklDVF9L
RVJORUxfUldYDQo+Pj4+IHdvbid0IHdvcmsgdGhlbi4NCj4+Pj4NCj4+Pj4gU28sIHNob3VsZG4n
dCB3ZSBrZWVwIHRoZSBwYW5pYyBhbmQgZm9yYmlkIENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCBv
biBQUzMgPw0KPj4+DQo+Pj4gbW11X2hhc2hfb3BzLnVwZGF0ZWJvbHRlZHBwIHJldHVybnMgdm9p
ZCwgc28gSSBjYW4ndCByZXR1cm4gYW4gZXJyb3IgY29kZSB0bw0KPj4+IGluZGljYXRlIHRoZSBm
ZWF0dXJlIGlzIG5vdCBzdXBwb3J0ZWQuDQo+Pg0KPj4gV2UgY291bGQgY2hhbmdlIHRoYXQgaW4g
dGhlIG1lZGl1bSB0ZXJtLg0KPj4NCj4+PiBJIGNvdWxkIGRvIHNvbWV0aGluZyBsaWtlIHRoaXMg
aW4gYXJjaC9wb3dlcnBjL0tjb25maWc6DQo+Pj4NCj4+PiAtICAgICAgIHNlbGVjdCBBUkNIX0hB
U19TVFJJQ1RfS0VSTkVMX1JXWCAgICAgICBpZiAoUFBDX0JPT0szUyB8fCBQUENfOHh4IHx8IDQw
eCkgJiYgIUhJQkVSTkFUSU9ODQo+Pj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfU1RSSUNUX0tF
Uk5FTF9SV1ggICAgICAgaWYgKFBQQ19CT09LM1MgfHwgUFBDXzh4eCB8fCA0MHgpICYmICFQUENf
UFMzICYmICFISUJFUk5BVElPTg0KPj4+DQo+Pj4gQnV0IHRoZW4gdGhlIHBwYzY0X2RlZmNvbmZp
ZyB3b3VsZCBiZSBidWlsdCB3aXRob3V0IFNUUklDVF9LRVJORUxfUldYLg0KPj4NCj4+IFllYWgg
dGhhdCB3b3VsZCBiZSBhIHBpdHkuDQo+Pg0KPj4gV2UgY291bGQgZG8gdGhlIGFib3ZlIGFuZCBk
aXNhYmxlIFBTMyBpbiBwcGM2NF9kZWZjb25maWcsIGFsbG93aW5nDQo+PiBwcGM2NF9kZWZjb25m
aWcgdG8gc3RpbGwgaGF2ZSBTVFJJQ1RfS0VSTkVMX1JXWC4NCj4gDQo+IEkgcmVhbGx5IHdhbnQg
dG8ga2VlcCBQUzMgaW5jbHVkZWQgaW4gcHBjNjRfZGVmY29uZmlnLiAgTm90IHRoYXQgSSBleHBl
Y3QNCj4gYW55b25lIHRvIGJvb3QgYSBwcGM2NF9kZWZjb25maWcga2VybmVsIG9uIFBTMywgYnV0
IHRoYXQgaXMgb25lIG9mIHRoZQ0KPiAnc3RhbmRhcmQnIGNvbmZpZ3MgdGhhdCBpcyBidWlsdCBi
eSBzb21lIGF1dG9tYXRlZCBidWlsZGVycywgYW5kIGdlbmVyYWxseSBieQ0KPiBhbnlvbmUgZG9p
bmcgY2hhbmdlcyB0byB0aGUgcG93ZXJwYyBhcmNoLCBhbmQgSSB3YW50IHRvIGtlZXAgZ2V0dGlu
ZyB0aG9zZQ0KPiBidWlsZCB0ZXN0cyBmb3IgUFMzLg0KPiANCj4+IEkgYXNzdW1lIGFjdHVhbCBQ
UzMgdXNlcnMgd291bGQgdXNlIGEgcHMzX2RlZmNvbmZpZyBhbnl3YXkgcmlnaHQ/DQo+IA0KPiBZ
ZWFoLCBhIGRlcml2YXRpdmUgb2YgaXQuICBUaGV5IGFyZSBtb3N0IGxpa2VseSBhcmUgdXNpbmcg
J0phaWxicmVhaycgZmlybXdhcmUNCj4gdGhhdCBhbGxvd3MgdGhlbSB0byBydW4gTGludXggaW4g
dGhlIGdhbWVvcyBwYXJ0aXRpb24uDQo+IA0KPj4gUmVsYXRlZGx5IGFyZSB0aGVyZSBhbnkgYWN0
dWFsIFBTMyB1c2VycyBsZWZ0PyA7KQ0KPiANCj4gSXQgc2VlbXMgdGhlcmUgYXJlIG1vcmUgdXNl
cnMgbm93IHRoYW4gYSBmZXcgeWVhcnMgYWdvLiAgSSB0aGluayB0aGV5IGJ1eSBQUzVzDQo+IHRv
IHBsYXkgdGhlIGxhdGVzdCBnYW1lcywgYW5kIHVzZSB0aGVpciBvbGQgY29uc29sZSB0byBtZXNz
IGFyb3VuZCB3aXRoIExpbnV4Lg0KPiBJIGdlbmVyYWxseSBnZXQgYSBwcml2YXRlIGlucXVpcnkg
ZXZlcnkgMyBvciA0IHdlZWtzLiAgVXN1YWxseSBhc2tpbmcgaG93IHRvDQo+IHVwZGF0ZSB0aGVp
ciBrZXJuZWwsIG9yIGhvdyB0byBpbnN0YWxsIGEgbW9kZXJuIGRpc3Ryby4NCj4gDQo+Pj4gV2hh
dCBvdGhlciAnY2xlYW4nIHdheSBpcyB0aGVyZT8NCj4+DQo+PiBJZiB3ZSB3YW50IHRvIGhhdmUg
YSBtdWx0aS1wbGF0Zm9ybSBrZXJuZWwgaW1hZ2UgdGhhdCBjYW4gYm9vdCBvbiBQUzMNCj4+IGFu
ZCBvdGhlciBwbGF0Zm9ybXMsIGFuZCBoYXZlIHN0cmljdCBrZXJuZWwgUldYLCB0aGVuIHdlIG5l
ZWQgc29tZQ0KPj4gcnVudGltZSBsb2dpYyB0byBkZWFsIHdpdGggdGhhdC4NCj4+DQo+PiBJJ2Qg
cmF0aGVyIG5vdCBkbyB0aGF0IHRob3VnaCwgYmVjYXVzZSBpdCBhZGRzIGNvbXBsZXhpdHkgdG8g
ZGVhbCB3aXRoIGENCj4+IHByZXR0eSBvYnNjdXJlIGNvcm5lciBjYXNlLCBhbmQgSSBzdXNwZWN0
IG5vIG9uZSByZWFsbHkgYm9vdHMgYQ0KPj4gcHBjNjRfZGVmY29uZmlnIG9uIGFjdHVhbCBQUzMg
aGFyZHdhcmUgdGhlc2UgZGF5cy4NCj4+DQo+PiBTbyBteSBwcmVmZXJlbmNlIGlzIHdlIGRpc2Fi
bGUgUFMzIGluIHBwYzY0X2RlZmNvbmZpZywgYW5kIG1ha2UgUFMzDQo+PiBpbmNvbXBhdGlibGUg
d2l0aCBTVFJJQ1RfS0VSTkVMX1JXWC4NCj4gDQo+IEFzIG1lbnRpb25lZCwgSSdkIHJlYWxseSBs
aWtlIHRvIGtlZXAgUFMzIGluY2x1ZGVkIGluIHBwYzY0X2RlZmNvbmZpZy4gIE15DQo+IG9yaWdp
bmFsIHBhdGNoIHRoYXQgYmFzaWNhbGx5IGp1c3QgaWdub3JlcyB0aGUgY2FsbCB0bw0KPiBtbXVf
aGFzaF9vcHMudXBkYXRlYm9sdGVkcHAgYWxsb3dzIHRoYXQsIGFuZCBJIGhhdmVuJ3QgZXhwZXJp
ZW5jZWQgYW55IHByb2JsZW1zDQo+IHdpdGggaXQgeWV0Lg0KDQpXaGVuIHlvdSBzYXkgeW91IGhh
dmUgbm90IGV4cGVyaWVuY2VkIGFueSBwcm9ibGVtcyB3aXRoIGl0LCBkbyB5b3UgbWVhbiANCnRo
YXQgU1RSSUNUX1JXWCB3b3JrcyBmb3IgeW91ID8gV2hlbiB5b3Ugc2VsZWN0IENPTkZJR19ERUJV
R19ST0RBVEFfVEVTVCANCml0IHRlbGxzIHlvdSB0aGF0IGl0IHdvcmtzID8gT3RoZXJ3aXNlIGl0
IGxvb2tzIGluY29ycmVjdCB0byBlbmFibGUgDQpzb21ldGhpbmcgdGhhdCBkb2Vzbid0IHdvcmsu
DQoNCj4gDQo+IE15IHByZWZlcmVuY2Ugd291bGQgYmUgdG8ga2VlcCBQUzMgaW4gcHBjNjRfZGVm
Y29uZmlnLCBhbmQgZWl0aGVyIGFwcGx5IG15DQo+IG9yaWdpbmFsIHBhdGNoLCBvciBJIGtlZXAg
dGhhdCBwYXRjaCBpbiBteSBwczMtbGludXggcmVwbyBvbiBrZXJuZWwub3JnLiBUaGVuLA0KPiBp
ZiB3ZSBlbmQgdXAgYWRkaW5nIHJ1bnRpbWUgc3VwcG9ydCBmb3IgUldYIEkgdGhlbiBmaXh1cCBQ
UzMgdG8gdXNlIHRoYXQuDQo+IA0KDQpJbiB0aGF0IGNhc2UgSSBzZWUgdHdvIHNvbHV0aW9uczoN
CjEvIEltcGxlbWVudCB1cGRhdGVib2x0ZWRwcCBmb3IgUFMzLg0KMi8gSW1wbGVtZW50IGFyY2hf
cGFyc2VfZGVidWdfcm9kYXRhKCkgdG8gYWx3YXlzIHNldCByb2RhdGFfZW5hYmxlZCA9IA0KZmFs
c2Ugb24gUFMzLCBhbmQgdXBkYXRlIGZyZWVfaW5pdG1lbSgpIHRvIG9ubHkgY2FsbCBtYXJrX2lu
aXRtZW1fbngoKSANCndoZW4gc3RyaWN0X2tlcm5lbF9yd3hfZW5hYmxlZCgpIHJldHVybnMgdHJ1
ZS4NCg0KQ2hyaXN0b3BoZQ0K
