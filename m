Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10146871A33
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 11:07:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=RUyAvZv5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TprpS60Sjz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 21:07:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=RUyAvZv5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tprnk6Ym5z2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 21:06:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKf5CnU0OAqjuZkCSJDMMZ6cIyFKnvxr4fjXcpWfCNi2Tr4vgSR9uK+j7EgiMaO8AKYh/KgMObYFad9GiBsLpn6chuKuPDa5H8WSq6bUaXuLJ45IQ6zKpIfE/tiZpSdifWeVWobu2p+bt1IO2S7Dh1QIK2i7PIPvSQBYJbk+Dwk2wz8hA4Amg2FkrbLd8PrDp+xJXhFya9oyL2V70JfT8Nl1JJIkvBy9D9AKuv5kKYrpGRO363hAwjyo4jNJ/b5axuP3aSzRWzwM5VV6a5BuJD+0pFEx4gSFkAsXh36dqycKqkc3FUvovECfLH3domm3XqyVaKt1voaSqYKoVZ23AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPaFjWUfEt5Yi11AER+BkH9bFDnQ0G/lP++5ZYSarq8=;
 b=YuQK0gwYNOCJUJLqyp7c0grRsl8SEZz+/0e+zy2ldoD7s0DqA1SKqAwmqFozrcHmYrPYmD5wCo3XgZpmojsE7eT0Lwj9VOJaDZCRcGg56psSFWI+A4YYRYdRtoME8r8opPshAdht0SFozg55BBAZ5pbIb/O3L6t6IKKulTDUEgWhFB6bA6c2OhDbtXCrmAvxg2kzdfXJTYzHaMOrlwR/dTljYn3+gBzZwc2+jVCe2hl9S4ASvOLcEpE2CPGZN9HDKvfho9nVtTk2jUHQ2EVQ0z+1MxNCnT3dgtiu9SUQ9jQGspQYkM7XFj5wb0WhUErmOL5YprTU6WClV6JbeieQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPaFjWUfEt5Yi11AER+BkH9bFDnQ0G/lP++5ZYSarq8=;
 b=RUyAvZv5THtpbqTAgjLJAUvk7mpH+vUdkGZqMhAUS0c5FgqEUGNj69P8LuaYHT5LFxJ8YwtTvjruUJ9/BfndBnQ5IxXsRIy/VDMxsa5Xj7ug08YZLeIpPJodx/UQAatQXtwZc1ZuQ1rM/S1b8e4L2uzb3VRpWf2W5dPOSmzSlbrGv4ZqPCaiRRuewjeoBGGBDnvM7Cm0b7SQ2dYiPXo42W3T5QRgeZs6hkxvgh+uY5YKvEAF81vXx5Lyrd2INUjXDeakeqbxrDWTXN9FcsNxdX3XzhYoXn3+cG9lTcRXQfDyxitkZ7fqEZkr29Wd90b83zcQT4ly6f+veEMdiwphDw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3214.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 10:06:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 10:06:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Thomas Zimmermann <tzimmermann@suse.de>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
	"naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>, "deller@gmx.de"
	<deller@gmx.de>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2 3/3] arch/powerpc: Remove <linux/fb.h> from backlight
 code
Thread-Topic: [PATCH v2 3/3] arch/powerpc: Remove <linux/fb.h> from backlight
 code
Thread-Index: AQHabtzNJ1qHAIS860mENCksCunHF7Eo4IQAgAAKw4CAAACUgA==
Date: Tue, 5 Mar 2024 10:06:29 +0000
Message-ID: <f10f4f22-0bec-4c0c-8b0f-3f68227dc9d0@csgroup.eu>
References: <20240305090910.26742-1-tzimmermann@suse.de>
 <20240305090910.26742-4-tzimmermann@suse.de>
 <15e13364-8b43-402c-836b-436499906b74@csgroup.eu>
 <f7503198-ab1b-463c-a8c8-9addbdcdab1b@suse.de>
In-Reply-To: <f7503198-ab1b-463c-a8c8-9addbdcdab1b@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3214:EE_
x-ms-office365-filtering-correlation-id: 9403af5b-17f7-475d-1adf-08dc3cfbed90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZBzOugCc3h/+PSXG2x68jW37BijsZJwsUd4S67FzXtXhErstK48ZIIo1cK6BEVY3odHWGT1f02AiLAYNC2CRfipF3AY9iMux2TrdiHyUk5s5/oFdvCayYm7tO9IkrGmpfHH2b8346lck9KxCKxHrOFU6+ra6XbxP89fkH1g9/E4xHG+X6s9tBg6Bs6TEe7cdGE+nWPJAm3Deu5lP6hvw9bK9R9raQjwMpCCnwgDPVV3TCjcZlhcgwwwFhVph51V2UEiPwcA0gLcQEYXPMQhUu0z5iNTJRIzgNw376SCLUkDm3Z/eAB2qC8QcU/ZUun/cmJpO3ptmqxwGfors5blVWJjdy/Qt8cTF0ieAUwVdT4auyAbLeUaBShK11ETfRepzeCUwlOmNu4Bi15B79wlxMImDUAlHKfIneu9mvAW6ULXH7cp9kGYV5vvRIkMQ27gC7B1iBTfTn76if8i/1SmEjuvQNabUWEZzA6ZB7ono0Ji5NlO/aiY/YxhGrF7FlxRnj72wZLbSNmEA18JYVlrfVjbYqv8qb/yoMpq6AWGmyM/huaWl1OHOJ/sYwGOwvTPit4BJOJXpVM2YS5D3ctT/gDDJBae89nsns29E6Y1dwPZT71B2tk0WS9J2NMKlZKAXTBqBzmr0OrixlXnO7VfP7jlYtZPh7tZetqBkuj+umqKImBJqdr/G70jrPNJPwMr350V5eDYvrCLVVpMP4jtj+6JlfFVis2nOR91H0rKK9Pw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Uy81QXVyZDcrNW5BOWJFNHE2ZzlKTUVaZURxUm5xSG52bUZMQnptMitQVWow?=
 =?utf-8?B?SDlJYUx0UGdZOHphNWw3WmxERFZTYys1cnFZVTIvRFJ1WWJmdmZEODdlWGF0?=
 =?utf-8?B?dmNNVHoyN0xqdS9xQWc3Uk42VEdrSElqZEIxd2ZoSXdYek9hSWRNWVdUWGpP?=
 =?utf-8?B?T3lxUEgxUXJ4UFgvWFJhWjFYRHk1YnRiM2lzZGpnYkh6UitHcUkvdlJoQXZx?=
 =?utf-8?B?VGExODVRZFU2emdsbytNK3E1dERIVTloenRaOVNYZlZqazk5c0xrUnJ2UFMv?=
 =?utf-8?B?S01lZW1ERkpKTU0zcXpxSnordzd4WXdYeGtQYXhOWDg1REhmTk1lYXIvTVlQ?=
 =?utf-8?B?QU9RRU93SWp4K3ZxWmp4ZDJHZGpRb2c0Y1M0Qml4d0FLeGptdXFPcUdmeVlj?=
 =?utf-8?B?WlcwVmZvQmF6dlpPbFdJeXlsdFE0SEhobmZ5YU1BcUNDRVNwSDlHYnBRVFhS?=
 =?utf-8?B?QlBub2F1eER2YUgxdUVQOU9ocjFnbllBend4bzR4S1Y5a1htNTU4aXpobE5v?=
 =?utf-8?B?aSttaDk2MDkycmtwWjEvYVFQRkxXRkxTUDhQSEtEWkJDY0NHM1FvOVJaM2xi?=
 =?utf-8?B?SDdmZjhnT1l3TWN2TFd0NjNDUVdsNDl0K0tTUkZwRWdzRVZpdmZZUlpRQldv?=
 =?utf-8?B?RDBYbHJ5N0dCbnVzTllsTGdtUkFVYlEyaWUzNWZwaXJmd0x0NWlvVGxOVHZL?=
 =?utf-8?B?di91cGpPNDd3bGdvYTFOb1pOWWZnbWMvdTliVkFCNmk2SzE5dkszd0g1WEh6?=
 =?utf-8?B?L2JCRWRTYkVOcFhiazlOWEtiVnpUcHRZbWo5Y3F0WXpyOG83WjIvQ3E2bDRX?=
 =?utf-8?B?dGYvRTRhSjRLMEFDa05kZDloakZrZFlUZm8xRlJRbm5KdktlN0d6VDNORHp3?=
 =?utf-8?B?WFh2M3M0ZE9BZ0dWeDZ5cmRIemVDVW42NEpIUEFVTHk2WVhMdi9WbW1ObnpU?=
 =?utf-8?B?VG9RRkNKSUdtUnAyelh1N24vMi9YQmN0Q0dQOWkrVGNoVTFEaHlwZTl1bEpk?=
 =?utf-8?B?Z1JxR2VsRkp2aXlId2dKN3dNc1lEN0pZWFZWVnNVaHpFdFpUZDRRN2pVMDk0?=
 =?utf-8?B?WHhIYzM0TFF4TGRXWG1PU1ptemRjRDBLcUx3V2FtUEdwU0pxczhlMTJCcERN?=
 =?utf-8?B?UFVOVVE0MmR6Z2ZXaFREcTJvUHFIR2tqc0lSbWYxZFpGRmhCcWRwcDQ2QStR?=
 =?utf-8?B?alZlQnR1Nm9mMTdTY01RbXZMREVLNW1sZVhoajJpcEhTa01lZDc4a3pnTW1r?=
 =?utf-8?B?bi9zcWFDU0ZoU1N6d2ZUSjFRQVRqa0Z4bk9DQkppa0dxaVVpTy9GRWVJMHor?=
 =?utf-8?B?MlJXUkFhdC9hUXVLNXk2Z00rcGQxOFpLRTA3MEtBSUFVTFlkWEhMUVB1dmhD?=
 =?utf-8?B?NXBCOG1NcG8wbkYvNjdvMG5vdGJUZHU0bldwb09tYk1Fb2c0eFFCdGRGN2N0?=
 =?utf-8?B?ZGkrNWl2eEZYY3hEWmJMK3hWaE5nK2FlMDFpZUdtN0ZrTnY4UGkwNExZZmV1?=
 =?utf-8?B?MVFVWkU5M21Nd0w4KzBKQUgxTUdNYllXK21zT0hZSmc4clpYQkVtbEdWL0FK?=
 =?utf-8?B?NG9xOS94dVNoMTdXbVRiVGFyMnB3R1lJekJNY2xDSzllaTQyemJnbjkwMmQ0?=
 =?utf-8?B?cHMyTklOcnpqM0pyZHFTZUxwMEVVU3NvY1dia280ZE14UGZKZjVzMjc5bnFm?=
 =?utf-8?B?U0lMMXpEaGs2aGRWeUVWKzRscGhvUHNhRGtFU2xJdXpBaFFyZVdWR2NHVi9i?=
 =?utf-8?B?SjRLT0IyZTJDR0g5UGlvd2NkUUYybm5UM1BONHVtbGtWWHVIemp0Qllva1Fp?=
 =?utf-8?B?VHFmMURHK3YyMll3Y2RwdEg2SjFoN2pyYkV5eStWRmlpUk9lYmpRWi83WWNI?=
 =?utf-8?B?a1oxR0JBT1ZOWDJqYjM5b0VKRTAzVGtzbXNxQ2NNNktPZ0xHM2M5RUVJQTBN?=
 =?utf-8?B?WS9OV25hd3Fva0UyMkV3Nkk0WGF0b0I4dDljaVpuOHJzc0wxM0NsenNJeGZN?=
 =?utf-8?B?NzlVUWdaaCtMbXZpSzlBNHFZYzlvcWc0MHNsd1I2K000SzNaUkdDaXZIdm91?=
 =?utf-8?B?T3QwVzZieklpZ2M2Rk9kdDhYWm1oL0NLZ0dSZ3p6SCtkRGhiM05ZK2hDRDVm?=
 =?utf-8?Q?M80yQzhZJzhiEgKNiFdGMr+Gy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <922BF6CD840EE54AA7789A20467120B5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9403af5b-17f7-475d-1adf-08dc3cfbed90
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 10:06:29.9499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W42yFz3BGip3xsmWb9GYKor5+QWa2RJvq83uggt1Fd19t4GbNPuiMpqrn8J8FDYftOS4qDYXqBDOF8hPTXaUJIV96xv7t9IEP9rxsXm4CdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3214
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzAzLzIwMjQgw6AgMTE6MDQsIFRob21hcyBaaW1tZXJtYW5uIGEgw6ljcml0wqA6
DQo+IEhpDQo+IA0KPiBBbSAwNS4wMy4yNCB1bSAxMDoyNSBzY2hyaWViIENocmlzdG9waGUgTGVy
b3k6DQo+Pg0KPj4gTGUgMDUvMDMvMjAyNCDDoCAxMDowMSwgVGhvbWFzIFppbW1lcm1hbm4gYSDD
qWNyaXTCoDoNCj4+PiBSZXBsYWNlIDxsaW51eC9mYi5oPiB3aXRoIGEgZm9yd2FyZCBkZWNsYXJh
dGlvbiBpbiA8YXNtL2JhY2tsaWdodC5oPiB0bw0KPj4+IHJlc29sdmVzIGFuIHVubmVjZXNzYXJ5
IGRlcGVuZGVuY3kuIFJlbW92ZSBwbWFjX2JhY2tsaWdodF9jdXJ2ZV9sb29rdXAoKQ0KPj4+IGFu
ZCBzdHJ1Y3QgZmJfaW5mbyBmcm9tIHNvdXJjZSBhbmQgaGVhZGVyIGZpbGVzLiBUaGUgZnVuY3Rp
b24gYW5kIHRoZQ0KPj4+IGZyYW1lYnVmZmVyIHN0cnVjdCBpcyB1bnVzZWQuIE5vIGZ1bmN0aW9u
YWwgY2hhbmdlcy4NCj4+IFdoZW4geW91IHJlbW92ZSBwbWFjX2JhY2tsaWdodF9jdXJ2ZV9sb29r
dXAoKSBwcm90b3R5cGUgeW91J2xsIHRoZW4gZ2V0DQo+PiBhIHdhcm5pbmcvZXJyb3IgYWJvdXQg
bWlzc2luZyBwcm90b3R5cGUgd2hlbiBidWlsZGluZw0KPj4gYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy9wb3dlcm1hYy9iYWNrbGlnaHQuYw0KPj4NCj4+IFRoZSBmb25jdGlvbiBpcyBub3QgdXNlZCBv
dXRzaWRlIG9mIHRoYXQgZmlsZSBzbyBpdCBzaG91bGQgYmUgc3RhdGljLg0KPj4gQW5kIHRoZW4g
aXQgaXMgbm90IHVzZWQgaW4gdGhhdCBmaWxlIGVpdGhlciBzbyBpdCBzaG91bGQgYmUgcmVtb3Zl
ZA0KPj4gY29tcGxldGVseS4gSW5kZWVkIGxhc3QgdXNlIG9mIHRoYXQgZnVuY3Rpb24gd2FzIHJl
bW92ZWQgYnkgY29tbWl0DQo+PiBkNTY1ZGQzYjA4MjQgKCJbUEFUQ0hdIHBvd2VycGM6IE1vcmUg
dmlhLXBtdSBiYWNrbGlnaHQgZml4ZXMiKSBzbyB0aGUNCj4+IGZ1bmN0aW9uIGNhbiBzYWZlbHkg
YmUgcmVtb3ZlZC4NCj4gDQo+IElzbid0IHRoYXQgd2hhdCBteSBwYXRjaCBpcyBkb2luZz8gSSBo
YXZlIG5vIGNhbGxlcnMgb2YgdGhlIGZ1bmN0aW9uIGluIA0KPiBteSB0cmVlIChkcm0tdGlwKSwg
c28gSSByZW1vdmVkIGl0IGVudGlyZWx5LiBTaG91bGQgSSBhZGQgYSBGaXhlcyB0YWcgDQo+IGFn
YWluc3QgY29tbWl0IGQ1NjVkZDNiMDgyND8gQmVzdCByZWdhcmRzIFRob21hcw0KDQpTb3JyeSBJ
IG92ZXJsb29rZWQgeW91ciBwYXRjaCBhbmQgZm9jdXNzZWQgb24gdGhlIHJlbW92YWwgb2YgdGhl
IA0KcHJvdG90eXBlIGFuZCBtaXNzZWQgdGhlIHJlbW92YWwgb2YgdGhlIGZ1bmN0aW9uLg0KDQpD
aHJpc3RvcGhlDQoNCj4+DQo+PiBDaHJpc3RvcGhlDQo+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+IC0tLQ0KPj4+IMKgwqAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2JhY2tsaWdodC5owqDCoMKgwqDCoMKgwqAgfMKgIDUg
KystLQ0KPj4+IMKgwqAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9iYWNrbGlnaHQu
YyB8IDI2IA0KPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+IMKgwqAgMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9iYWNrbGlnaHQuaCANCj4+PiBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9iYWNrbGlnaHQuaA0KPj4+IGluZGV4IDFiNWVhYjYyZWQwNDcuLjA2
MWE5MTBkNzQ5MjkgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jh
Y2tsaWdodC5oDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2JhY2tsaWdodC5o
DQo+Pj4gQEAgLTEwLDE1ICsxMCwxNCBAQA0KPj4+IMKgwqAgI2RlZmluZSBfX0FTTV9QT1dFUlBD
X0JBQ0tMSUdIVF9IDQo+Pj4gwqDCoCAjaWZkZWYgX19LRVJORUxfXw0KPj4+IC0jaW5jbHVkZSA8
bGludXgvZmIuaD4NCj4+PiDCoMKgICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KPj4+ICtzdHJ1
Y3QgYmFja2xpZ2h0X2RldmljZTsNCj4+PiArDQo+Pj4gwqDCoCAvKiBGb3IgbG9ja2luZyBpbnN0
cnVjdGlvbnMsIHNlZSB0aGUgaW1wbGVtZW50YXRpb24gZmlsZSAqLw0KPj4+IMKgwqAgZXh0ZXJu
IHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpwbWFjX2JhY2tsaWdodDsNCj4+PiDCoMKgIGV4dGVy
biBzdHJ1Y3QgbXV0ZXggcG1hY19iYWNrbGlnaHRfbXV0ZXg7DQo+Pj4gLWV4dGVybiBpbnQgcG1h
Y19iYWNrbGlnaHRfY3VydmVfbG9va3VwKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgDQo+Pj4g
dmFsdWUpOw0KPj4+IC0NCj4+PiDCoMKgIGV4dGVybiBpbnQgcG1hY19oYXNfYmFja2xpZ2h0X3R5
cGUoY29uc3QgY2hhciAqdHlwZSk7DQo+Pj4gwqDCoCBleHRlcm4gdm9pZCBwbWFjX2JhY2tsaWdo
dF9rZXkoaW50IGRpcmVjdGlvbik7DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvcG93ZXJtYWMvYmFja2xpZ2h0LmMgDQo+Pj4gYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1z
L3Bvd2VybWFjL2JhY2tsaWdodC5jDQo+Pj4gaW5kZXggYWViNzlhOGIzZTEwOS4uMTJiYzAxMzUz
YmQzYyAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL2Jh
Y2tsaWdodC5jDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9iYWNr
bGlnaHQuYw0KPj4+IEBAIC05LDcgKzksNiBAQA0KPj4+IMKgwqDCoCAqLw0KPj4+IMKgwqAgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPj4+IC0jaW5jbHVkZSA8bGludXgvZmIuaD4NCj4+PiDC
oMKgICNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4NCj4+PiDCoMKgICNpbmNsdWRlIDxsaW51
eC9hZGIuaD4NCj4+PiDCoMKgICNpbmNsdWRlIDxsaW51eC9wbXUuaD4NCj4+PiBAQCAtNzIsMzEg
KzcxLDYgQEAgaW50IHBtYWNfaGFzX2JhY2tsaWdodF90eXBlKGNvbnN0IGNoYXIgKnR5cGUpDQo+
Pj4gwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+IMKgwqAgfQ0KPj4+IC1pbnQgcG1hY19iYWNr
bGlnaHRfY3VydmVfbG9va3VwKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgdmFsdWUpDQo+Pj4g
LXsNCj4+PiAtwqDCoMKgIGludCBsZXZlbCA9IChGQl9CQUNLTElHSFRfTEVWRUxTIC0gMSk7DQo+
Pj4gLQ0KPj4+IC3CoMKgwqAgaWYgKGluZm8gJiYgaW5mby0+YmxfZGV2KSB7DQo+Pj4gLcKgwqDC
oMKgwqDCoMKgIGludCBpLCBtYXggPSAwOw0KPj4+IC0NCj4+PiAtwqDCoMKgwqDCoMKgwqAgLyog
TG9vayBmb3IgYmlnZ2VzdCB2YWx1ZSAqLw0KPj4+IC3CoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAw
OyBpIDwgRkJfQkFDS0xJR0hUX0xFVkVMUzsgaSsrKQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG1heCA9IG1heCgoaW50KWluZm8tPmJsX2N1cnZlW2ldLCBtYXgpOw0KPj4+IC0NCj4+PiAt
wqDCoMKgwqDCoMKgwqAgLyogTG9vayBmb3IgbmVhcmVzdCB2YWx1ZSAqLw0KPj4+IC3CoMKgwqDC
oMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgRkJfQkFDS0xJR0hUX0xFVkVMUzsgaSsrKSB7DQo+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IGRpZmYgPSBhYnMoaW5mby0+YmxfY3VydmVbaV0g
LSB2YWx1ZSk7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRpZmYgPCBtYXgpIHsN
Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1heCA9IGRpZmY7DQo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXZlbCA9IGk7DQo+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQ0KPj4+IC3CoMKgwqDCoMKgwqDCoCB9DQo+Pj4gLQ0KPj4+IC3CoMKgwqAg
fQ0KPj4+IC0NCj4+PiAtwqDCoMKgIHJldHVybiBsZXZlbDsNCj4+PiAtfQ0KPj4+IC0NCj4+PiDC
oMKgIHN0YXRpYyB2b2lkIHBtYWNfYmFja2xpZ2h0X2tleV93b3JrZXIoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQ0KPj4+IMKgwqAgew0KPj4+IMKgwqDCoMKgwqDCoCBpZiAoYXRvbWljX3JlYWQo
Jmtlcm5lbF9iYWNrbGlnaHRfZGlzYWJsZWQpKQ0KPiANCg==
