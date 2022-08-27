Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669835A393F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 19:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFP7f2YKbz3blS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 03:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VcT/6fjt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.54; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VcT/6fjt;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90054.outbound.protection.outlook.com [40.107.9.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFP6w3fYrz3bXG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Aug 2022 03:37:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJeba/2yX1d4cb3x5/tL6qAZfbZA9utvyNwKP387pUHNozL+UXG1fMFTyoVSPveiczrJIBq/G6FVR6qlUZZI80HowQKIpQ+mn88zgWbb1RMpfCTzWFaZfQPlKTgqgEQLXM+1K+/5I1KGrgug9NUyLfLQEQGocE0Yl/AN4xDmLKse2YKp5A8v4e1xuw+rEqIic73EZdWG9R3i5t4KSZC4Xydvq7E9vSZy+uDDHpRkVmaIvolPG8JVLrptcjoddjQpcDmbsMmsZ5qbrhoJ6dNcGt/CC9HtphcpjtsZa6iF6aVRvTow3BISyolWoxeZSrsiek2bDsdzP0JzQ8va0KQhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=els1Y5HU3a+hsBMow5A3i/1gV+XbF4Mom4wOKWJfM+c=;
 b=MjXPi4ZTWwjE/UNGbC5ymCPMOkTXlYGX/zkA5ikjsKkTaKr0FMXvg5w29GFQOByQ3xkwfAfoc0CYu/vWNX7AWUD89saE55dAipQJeoByhC+IA0Ht351/In0vffotNvsaz9eh7xx9BW/2rylYxuO6CQDvw75WKSucoQyL/s3sBxrPpeIZSgD/IzHa7M26lpSwbB5txjHPv9vKzMNHsc+QYF5+V56c73JKe9u1jHTomdaaxb1+kIcFfN15qTWXkEF+wwghSRwY3H6qhwJFBg4fSc/U44wqAmH84B9aybv6rnRoRxoM7KtNL6uozn8XIoX7UDCdeSCzBDn0USSvOqMYPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=els1Y5HU3a+hsBMow5A3i/1gV+XbF4Mom4wOKWJfM+c=;
 b=VcT/6fjtoEYa8B/3EVPsccQBTMPQRVLYdWUDax2NgQRqOUfOqsmDajtNX6PV7bqtvPC07S/XBJN5hZWK+SW5ys0MwyjJohuEGsz2zvo0lD78y2u8kkiCw/BqIBcBv+h5t2gwfApzjuudf4JxUzXZOr7t7/6VWENXfZF9dQVrVIzWEgD8QjZCry/k30UuYh32E1u5tFRI7tRKskCBSVoUjGkZZHZYyPCdJ3bXFtdxLi+8A4FjPIZuHw3OT7FYjY8VHFUaJMTMXw/6vlso774P3BAen6KjrEW4iP6e/qhFT9QUqUYgrFwGsjpx2JqfC+W3QMS520SyyzKxtzTZhaTD0g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB4174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 17:37:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 17:37:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Masahiro Yamada <masahiroy@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: clean up binutils version check
Thread-Topic: [PATCH] powerpc: clean up binutils version check
Thread-Index: AQHYujPqAzxj8VR8DU6MKGII5vSUGa3DAv4A
Date: Sat, 27 Aug 2022 17:37:39 +0000
Message-ID: <58a90319-668f-7c87-4168-e0df10644aa7@csgroup.eu>
References: <20220827164056.3365356-1-masahiroy@kernel.org>
In-Reply-To: <20220827164056.3365356-1-masahiroy@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea027258-899c-4a93-3c6d-08da8852d685
x-ms-traffictypediagnostic: PAYP264MB4174:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Mvhd60/3ODi8lSspLVZyOPV6sWYayXnbF4scIKf2K+Q9ntP27Bdu0OyuEyi1FDa1EHTsu1Gnhow8zyFX/v2TuF6pI3Tat4tMiI5ln0O6HS1M9blURkQu1HR2fUgbCCO4j9EGg3KmPQlSkOuT8FH1O6mo6lHTLExMDt9aLkVaDY3L60CY9jAUJoyWpmR+tgXp1rIPJpQRcLf6iDQMES1JqITSPQ+mx1drWQFfs7Gy9DvyOuWnfUZmp2GXXB+ttF4PMOcdJ9lMetgLvEr9TRYzTKQimY9WAQAtu2qv8NnxwPstRSzuDSMk6/ywZrHrDeN8PrR0n6YfyqQsHAMDD8w2nImG0sr+LzQqF4ph8EG1n2dw23Kv9OhPGeowNe/aWc/Kg8gFe+2G0WgrcAwsliW7Xhxbq2hS99d+vQ6yfL7HmWyQNIHWHkSRG5CzzLXdh99GNMvfDz2Ly55IsXfX0LMifV63WGMcZRknci9pp4IfEYi3kx1kvSpEyGD1aD8CNwQQd1cpWvNeXwnJO+kHbpbWTwr2b2eExCttOgEJ2u/8jSZqDAY14/imARFSZ4Jnn+XALgw2f5TQwcSZ3fM7aVE6Plgi3O8bHZtfcDa3VO6785bg0g8IELHdkbIuqJMV4p8YFhPkJEykOKzsYlGTxX/1M5ffmC+G9yXIUYwHvBB9kl7FjL2qYCHt1MoBr9xYcSAVQHi3TAPYOT01C8CZLMjft3X8oa549j/qiBfy+mHK5koYORbB47dxmTUfGVrQqJqhFIqkimnSMKx5nunJRhn8jErU/8gdPmJvAG7XDzjg9eJtVh82SV1jmvXVwSOZ2elkRuGnupfYLA69ahNfzNjO+w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(366004)(376002)(346002)(136003)(396003)(6512007)(8676002)(4326008)(6486002)(26005)(66946007)(66556008)(91956017)(64756008)(478600001)(7416002)(5660300002)(66476007)(8936002)(66446008)(76116006)(41300700001)(83380400001)(2906002)(6506007)(44832011)(54906003)(110136005)(86362001)(31686004)(31696002)(186003)(38070700005)(66574015)(36756003)(316002)(2616005)(71200400001)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cGVTVEFqcFpWMlJ4M0xFa2Eybk5pRklEYzZ0dEx2ZXBzU2N2d0M0Q2ZsUHdE?=
 =?utf-8?B?U01ySmt5NTVUSW8zaWFwRDRXdjBxaWM5akY0RnF0Qk5IdSswN0hJUE1Ld1Qr?=
 =?utf-8?B?WHJlSmRnZXkvcXJZVUQrdWlya1grd2V6am1MQUtsdkFnb3ZHSlR0RWsrKzlW?=
 =?utf-8?B?Y1F6bnlubnFqL1RWTUxsSElEcWpzUmlEd1VUQmk4emtKbU1QY3hpZjRWVDNZ?=
 =?utf-8?B?OHpxU2ltRTdnNFg4K2NwM1o4aW05YWVYMjdwcFcxb0ZmaGdZUUdnMlEwQ2Vs?=
 =?utf-8?B?QTl1dzArd3lUZ1ZQS2VsdXhrSHFQYUQ5aHF0dEZJbk5VdWxzcU9kNnh1Yndr?=
 =?utf-8?B?cXNyZXFudUl1L01acVo1QlhsUTVsYmhPZi9rTmZHSE0xTmtISUpOaElSTkhF?=
 =?utf-8?B?OU1PVE5uUmhCK1lPTmtKMEdrWWhXZURlc0R2dytFWEpsOTZjWHFtWGdlb0hn?=
 =?utf-8?B?ZVo5aTV2QTlINlJJTkYyQ2UwMjZDYUlrRmlKVHBqamE3RFJUSlA2MytzRVpX?=
 =?utf-8?B?MHQ4RXdSNnpBTmJuOTZiWmtQakhaUWgzZW5MUGdVaVdJZUtrOFpDcVI2cUdK?=
 =?utf-8?B?THFvUzllbWNWM1cwUkhsbHJVRUF0dlE0VXlWeENralpqcUxjdVVOZ3Q5NGFy?=
 =?utf-8?B?a1h4ZmRZMXBSaCtnMSs0NWlhS0I2TG9PMG9VRjMrWEkxaEUrRWcvT2hpc0Zn?=
 =?utf-8?B?QmhIVDRsZlZ0OC84OHZEalNDaVlMNmZvTnhSRnk1bkRSUnoxUHl3L2xtVElm?=
 =?utf-8?B?VGJKRVFMd2dqdHY2S1RQNjZBb2pFLzhmQmtIM1h5SElRblhiM3Juem84NUdP?=
 =?utf-8?B?Z0xtems5NHYyUHhkQjZXRUwySm9ua0VzS1lnRjhIZ0JEUHVKTzZvQXlqV2ho?=
 =?utf-8?B?S1F5NnQ0UkNPeDNPOVFWZ1hqZ0d4eTZkYnpsNHNTby96MFJrdE9UdHVWdVZS?=
 =?utf-8?B?TkZpd2RaQUNTcFJNekRSOWo4VG5seVFUNkNIYTIvRVI3a241aGZCbW56WGg0?=
 =?utf-8?B?c2lvR1hnRzZHSGhzbUhLNWMxUEl3UUU2Q2lPaE1TS0VsLzJJWWVkaTVzTE1l?=
 =?utf-8?B?M0lmTElOSmx6dWNXbEloM3cza0NCN1hCbFI3OFlUaS9HYlRMVHk2MkxQM1Ro?=
 =?utf-8?B?akFZaHhraTJKcWdoS1VuekxLUjE3cjVxNjlKOG9RTzVPRUJDa2txaGx0Vzlu?=
 =?utf-8?B?VU92ZHMrVnpVb3JxeUV6a0Y1bzh1dGJrcG81VVpzUUZ4UEl0K3ZZM1pOVlNQ?=
 =?utf-8?B?ZFBZbzJBSkpjdEczRHVvdlIwcjY1aVppY2UyajVXQUtRenhmTmRYeTh2MDhR?=
 =?utf-8?B?U3IwSFlaMllCVkJ5T1d5Nk5ZTWR6dWROZVhtT3gzUlQxUUs0dUJpS0VoNkFK?=
 =?utf-8?B?V0xYNmNFYmQ5L0V4RDV6ZWh0eVlBcjd4ZjRjeVAwN21ZUlUyY2krUmMwV3VV?=
 =?utf-8?B?eUcyTi9HdGNGYUVHNk5wTEo2Njhpck0xUVFJT0liUEdJeW10bXc5TWtNNzZr?=
 =?utf-8?B?eEplNGNXdUpRVFI1cWxKZk5hVjNvKzlvZWFoaU9qam1XbEt6dXVqUmQrRml4?=
 =?utf-8?B?TzArR0F1bkUrSURTc1cyLy8veEd6eGROQ1ZLMTBsMEprbnJQdjl6clhXMk40?=
 =?utf-8?B?TVJQU0h0MTVuVUwyaTYyRmZla1lYclBldElHQjJmMmpHNUhPOUx1UlhpMll0?=
 =?utf-8?B?aUx0cUd3cHAyOGNKYngrQ01pYmpHZmRlYytrVkZ3WlE2RzNiSXd3MUlZcEVZ?=
 =?utf-8?B?Z2hyOVZ3N0UvTmlIMnpHSzFhYlVObVVZQkhVd3FIZDZybUZMa045SS9FaDRv?=
 =?utf-8?B?ZXIwY29Jc3QyUDRkWTRtVFNuZEhFRHFsMkdtSGxEdE1SQTR5bzdUNHhlcnN0?=
 =?utf-8?B?Um02dmozUXhlb3RNVGNVWU4xL3pCeU1YNnArU3RKbTNCRVpHaUlZMU9NMGpt?=
 =?utf-8?B?S3MxOThuRGNYQmhjY2NVOGZLcFI2ZUF6OGdIenVFS3hKWG42MDJHTi9nK2FD?=
 =?utf-8?B?dG1JbEltY2x0NnlGMERrNFAzNUdNUnQ1TGVBVWFvUUJ6eDFzN2tqNU1jRmVM?=
 =?utf-8?B?K05WTktlTnYreE51M1o1VGFnYkdTL3dpRS9SbDdjSVhxOFNldFV1aGNlYUZS?=
 =?utf-8?B?bk1ReHFjVVdSTHY3Y1RQUVUzOTc0RFA2cWVGQlRVUXVKNVRZaUVqd2hVbmJV?=
 =?utf-8?Q?X4XujO1xl50JuNbxNUCl6lY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07BF4E1A2250554FBF54CDF37B333B5A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea027258-899c-4a93-3c6d-08da8852d685
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 17:37:39.3630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRGuzRpktK/LZ90+kJbtiQDMa737I0KVLXK0VRE9GjqD4fWohOyAjTXWUhYcPZTw7l49sqbp6OA+EMs+vBj8MaEUvW9RGkjA7mauLLDwm7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB4174
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA4LzIwMjIgw6AgMTg6NDAsIE1hc2FoaXJvIFlhbWFkYSBhIMOpY3JpdMKgOg0K
PiBUaGUgY2hlY2tiaW4gaW4gYXJjaC9wb3dlcnBjL01ha2VmaWxlIGVycm9ycyBvdXQgaWYgbGQg
PD0gMi4yNC4NCj4gU28sIHRoZSByZXF1aXJlbWVudCBvbiBQUEMgaXMgYmludXRpbHMgPj0gMi4y
NS4gSXQgaXMgY2xlYW5lciB0bw0KPiBzcGVjaWZ5IGl0IGluIHNjcmlwdHMvbWluLXRvb2wtdmVy
c2lvbi5zaC4gSWYgYmludXRpbHMgPCAyLjI1IGlzDQo+IHVzZWQsIHRoZSB0b29sY2hhaW4gY2hl
Y2sgd2lsbCBmYWlsIGluIHRoZSBLY29uZmlnIHN0YWdlIGdvaW5nDQo+IGZvcndhcmQuDQo+IA0K
PiBTaW5jZSBiaW51dGlscyA+PSAyLjI1IGlzIGFscmVhZHkgcmVxdWlyZWQsIGFub3RoZXIgdmVy
c2lvbiB0ZXN0DQo+IGZvciAtLXNhdmUtcmVzdG9yZS1mdW5jcyBvbiBQUEM2NCBpcyBhbHdheXMg
bWV0Lg0KPiANCj4gUFBDIGlzIHRoZSBsYXN0IHVzZXIgb2YgbGQtaWZ2ZXJzaW9uLiBXaXRoIGFs
bCB0aGUgY2FsbGVycyByZW1vdmVkLA0KPiB0aGUgbWFjcm8gZGVmaW5pdGlvbiBpbiBzY3JpcHRz
L01ha2VmaWxlLmNvbXBpbGVyIGNhbiBnbyBhd2F5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFz
YWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4NCj4gLS0tDQo+IA0KPiAgIGFyY2gv
cG93ZXJwYy9NYWtlZmlsZSAgICAgICB8IDIxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9saWIvTWFrZWZpbGUgICB8ICA4IC0tLS0tLS0tDQo+ICAgc2NyaXB0cy9NYWtl
ZmlsZS5jb21waWxlciAgIHwgIDQgLS0tLQ0KPiAgIHNjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5z
aCB8ICA4ICsrKysrKystDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDM0
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9NYWtlZmlsZSBi
L2FyY2gvcG93ZXJwYy9NYWtlZmlsZQ0KPiBpbmRleCAwMjc0MmZhY2Y4OTUuLmZiNjA3NzU4ZWVj
YSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL01ha2VmaWxlDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9NYWtlZmlsZQ0KPiBAQCAtNDYsMTMgKzQ2LDcgQEAgVVRTX01BQ0hJTkUgOj0gJChzdWJz
dCAkKHNwYWNlKSwsJChtYWNoaW5lLXkpKQ0KPiAgIGlmZGVmIENPTkZJR19QUEMzMg0KPiAgIEtC
VUlMRF9MREZMQUdTX01PRFVMRSArPSBhcmNoL3Bvd2VycGMvbGliL2NydHNhdnJlcy5vDQo+ICAg
ZWxzZQ0KPiAtaWZlcSAoJChjYWxsIGxkLWlmdmVyc2lvbiwgLWdlLCAyMjUwMCwgeSkseSkNCj4g
LSMgSGF2ZSB0aGUgbGlua2VyIHByb3ZpZGUgc2ZwciBpZiBwb3NzaWJsZS4NCj4gLSMgVGhlcmUg
aXMgYSBjb3JyZXNwb25kaW5nIHRlc3QgaW4gYXJjaC9wb3dlcnBjL2xpYi9NYWtlZmlsZQ0KPiAg
IEtCVUlMRF9MREZMQUdTX01PRFVMRSArPSAtLXNhdmUtcmVzdG9yZS1mdW5jcw0KPiAtZWxzZQ0K
PiAtS0JVSUxEX0xERkxBR1NfTU9EVUxFICs9IGFyY2gvcG93ZXJwYy9saWIvY3J0c2F2cmVzLm8N
Cj4gLWVuZGlmDQo+ICAgZW5kaWYNCj4gICANCj4gICBpZmRlZiBDT05GSUdfQ1BVX0xJVFRMRV9F
TkRJQU4NCj4gQEAgLTM5NSw4ICszODksNiBAQCB2ZHNvX3ByZXBhcmU6IHByZXBhcmUwDQo+ICAg
CQkkKGJ1aWxkKT1hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28gaW5jbHVkZS9nZW5lcmF0ZWQvdmRz
bzY0LW9mZnNldHMuaCkNCj4gICBlbmRpZg0KPiAgIA0KPiAtYXJjaHByZXBhcmU6IGNoZWNrYmlu
DQo+IC0NCj4gICBhcmNoaGVhZGVyczoNCj4gICAJJChRKSQoTUFLRSkgJChidWlsZCk9YXJjaC9w
b3dlcnBjL2tlcm5lbC9zeXNjYWxscyBhbGwNCj4gICANCj4gQEAgLTQxMSwxNiArNDAzLDMgQEAg
ZWxzZQ0KPiAgIAkkKGV2YWwgS0JVSUxEX0NGTEFHUyArPSAtbXN0YWNrLXByb3RlY3Rvci1ndWFy
ZC1vZmZzZXQ9JChzaGVsbCBhd2sgJ3tpZiAoJCQyID09ICJUQVNLX0NBTkFSWSIpIHByaW50ICQk
Mzt9JyBpbmNsdWRlL2dlbmVyYXRlZC9hc20tb2Zmc2V0cy5oKSkNCj4gICBlbmRpZg0KPiAgIGVu
ZGlmDQo+IC0NCj4gLVBIT05ZICs9IGNoZWNrYmluDQo+IC0jIENoZWNrIHRvb2xjaGFpbiB2ZXJz
aW9uczoNCj4gLSMgLSBnY2MtNC42IGlzIHRoZSBtaW5pbXVtIGtlcm5lbC13aWRlIHZlcnNpb24g
c28gbm90aGluZyByZXF1aXJlZC4NCj4gLWNoZWNrYmluOg0KPiAtCUBpZiB0ZXN0ICJ4JHtDT05G
SUdfTERfSVNfTExEfSIgIT0gInh5IiAtYSBcDQo+IC0JCSJ4JChjYWxsIGxkLWlmdmVyc2lvbiwg
LWxlLCAyMjQwMCwgeSkiID0gInh5IiA7IHRoZW4gXA0KPiAtCQllY2hvIC1uICcqKiogYmludXRp
bHMgMi4yNCBtaXNjb21waWxlcyB3ZWFrIHN5bWJvbHMgJyA7IFwNCj4gLQkJZWNobyAnaW4gc29t
ZSBjaXJjdW1zdGFuY2VzLicgOyBcDQo+IC0JCWVjaG8gICAgJyoqKiBiaW51dGlscyAyLjIzIGRv
IG5vdCBkZWZpbmUgdGhlIFRPQyBzeW1ib2wgJyA7IFwNCj4gLQkJZWNobyAtbiAnKioqIFBsZWFz
ZSB1c2UgYSBkaWZmZXJlbnQgYmludXRpbHMgdmVyc2lvbi4nIDsgXA0KPiAtCQlmYWxzZSA7IFwN
Cj4gLQlmaQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2xpYi9NYWtlZmlsZSBiL2FyY2gv
cG93ZXJwYy9saWIvTWFrZWZpbGUNCj4gaW5kZXggODU2MGM5MTIxODZkLi41ZWIzOTcxY2NiOWMg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9saWIvTWFrZWZpbGUNCj4gKysrIGIvYXJjaC9w
b3dlcnBjL2xpYi9NYWtlZmlsZQ0KPiBAQCAtMzgsMTQgKzM4LDYgQEAgb2JqLSQoQ09ORklHX1BQ
QzMyKQkrPSBkaXY2NC5vIGNvcHlfMzIubyBjcnRzYXZyZXMubw0KPiAgIA0KPiAgIG9iai0kKENP
TkZJR19GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT04pCSs9IGVycm9yLWluamVjdC5vDQo+ICAgDQo+
IC0jIFNlZSBjb3JyZXNwb25kaW5nIHRlc3QgaW4gYXJjaC9wb3dlcnBjL01ha2VmaWxlDQo+IC0j
IDY0LWJpdCBsaW5rZXIgY3JlYXRlcyAuc2ZwciBvbiBkZW1hbmQgZm9yIGZpbmFsIGxpbmsgKHZt
bGludXgpLA0KPiAtIyBzbyBpdCBpcyBvbmx5IG5lZWRlZCBmb3IgbW9kdWxlcywgYW5kIG9ubHkg
Zm9yIG9sZGVyIGxpbmtlcnMgd2hpY2gNCj4gLSMgZG8gbm90IHN1cHBvcnQgLS1zYXZlLXJlc3Rv
cmUtZnVuY3MNCj4gLWlmZXEgKCQoY2FsbCBsZC1pZnZlcnNpb24sIC1sdCwgMjI1MDAsIHkpLHkp
DQo+IC1leHRyYS0kKENPTkZJR19QUEM2NCkJKz0gY3J0c2F2cmVzLm8NCj4gLWVuZGlmDQo+IC0N
Cj4gICBvYmotJChDT05GSUdfUFBDX0JPT0szU182NCkgKz0gY29weXVzZXJfcG93ZXI3Lm8gY29w
eXBhZ2VfcG93ZXI3Lm8gXA0KPiAgIAkJCSAgICAgICBtZW1jcHlfcG93ZXI3Lm8gcmVzdGFydF90
YWJsZS5vDQo+ICAgDQo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLmNvbXBpbGVyIGIv
c2NyaXB0cy9NYWtlZmlsZS5jb21waWxlcg0KPiBpbmRleCA5NGQwZDQwY2RkYjMuLjYzZTdkNzlk
ZDg3NyAxMDA2NDQNCj4gLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5jb21waWxlcg0KPiArKysgYi9z
Y3JpcHRzL01ha2VmaWxlLmNvbXBpbGVyDQo+IEBAIC02OCw3ICs2OCwzIEBAIGNjLWlmdmVyc2lv
biA9ICQoc2hlbGwgWyAkKENPTkZJR19HQ0NfVkVSU0lPTikwICQoMSkgJCgyKTAwMCBdICYmIGVj
aG8gJCgzKSB8fCBlDQo+ICAgIyBsZC1vcHRpb24NCj4gICAjIFVzYWdlOiBLQlVJTERfTERGTEFH
UyArPSAkKGNhbGwgbGQtb3B0aW9uLCAtWCwgLVkpDQo+ICAgbGQtb3B0aW9uID0gJChjYWxsIHRy
eS1ydW4sICQoTEQpICQoS0JVSUxEX0xERkxBR1MpICQoMSkgLXYsJCgxKSwkKDIpLCQoMykpDQo+
IC0NCj4gLSMgbGQtaWZ2ZXJzaW9uDQo+IC0jIFVzYWdlOiAgJChjYWxsIGxkLWlmdmVyc2lvbiwg
LWdlLCAyMjI1MiwgeSkNCj4gLWxkLWlmdmVyc2lvbiA9ICQoc2hlbGwgWyAkKENPTkZJR19MRF9W
RVJTSU9OKTAgJCgxKSAkKDIpMCBdICYmIGVjaG8gJCgzKSB8fCBlY2hvICQoNCkpDQo+IGRpZmYg
LS1naXQgYS9zY3JpcHRzL21pbi10b29sLXZlcnNpb24uc2ggYi9zY3JpcHRzL21pbi10b29sLXZl
cnNpb24uc2gNCj4gaW5kZXggMjUwOTI1YWFiMTAxLi43ZGY5ZjIxNTBlYTEgMTAwNzU1DQo+IC0t
LSBhL3NjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5zaA0KPiArKysgYi9zY3JpcHRzL21pbi10b29s
LXZlcnNpb24uc2gNCj4gQEAgLTE0LDcgKzE0LDEzIEBAIGZpDQo+ICAgDQo+ICAgY2FzZSAiJDEi
IGluDQo+ICAgYmludXRpbHMpDQo+IC0JZWNobyAyLjIzLjANCj4gKwlpZiBbICIkU1JDQVJDSCIg
PSBwb3dlcnBjIF07IHRoZW4NCg0KSXNuJ3QgdGhpcyBsaW1pdGF0aW9uIG9ubHkgZm9yIHBwYzY0
bGUgPw0KDQpSZWZlciBjb21taXQgNjBlMDY1ZjcwYmRiICgicG93ZXJwYzogUmVqZWN0IGJpbnV0
aWxzIDIuMjQgd2hlbiBidWlsZGluZyANCmxpdHRsZSBlbmRpYW4iKQ0KDQo+ICsJCSMgYmludXRp
bHMgMi4yNCBtaXNjb21waWxlcyB3ZWFrIHN5bWJvbHMgaW4gc29tZSBjaXJjdW1zdGFuY2VzDQo+
ICsJCSMgYmludXRpbHMgMi4yMyBkbyBub3QgZGVmaW5lIHRoZSBUT0Mgc3ltYm9sDQo+ICsJCWVj
aG8gMi4yNS4wDQo+ICsJZWxzZQ0KPiArCQllY2hvIDIuMjMuMA0KPiArCWZpDQo+ICAgCTs7DQo+
ICAgZ2NjKQ0KPiAgIAllY2hvIDUuMS4w
