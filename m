Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E2868D80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 11:26:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MtVGZet7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkYYW6ZFTz3vXK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 21:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MtVGZet7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkYXl0pSPz3btn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 21:25:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpuKEDEepbJlCaibUjsBLCPUMSG7WR3szAbZHZ57sFCIjrDSHKbqSROV2sby1f/Kov721Do8Pli0BsKj/TRWLgcYjJ/CiNG98RK2pG23s0LKgVlPe75DCYyXaxvwlgHiXCznhf2E5sMbvshBwiQWyB9ngsMTffH8NTb0GE9RmClF6wL0Co39/vLvorTeV/4sPaKEA0MpuZLbIi/izefO8Zr6zsiQZEN2Fe87eSEJkG4XnLPZeM4mZCs5GJQA6qqcJcaL4YEJRacYB4gsEaEK/iOffEm8Q/bjKCrGHW9EeFWlJehdMgX3ALewzbVvVw/vtbzosrZhHbAkKayH9r4ITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llPfUX1sEsVzTSGp1KQox1QIA+kXWV3YL09odyLB60k=;
 b=U5z+ADiUWDr+pK5YKur8Y3DEeseRdDgKAzdRkFGHg+qCJH1c5rkrIe2ivadwux3ggeNspBRRzg3TylqSqTNZLH3JQdECztdNpeQbYoXw6QktwMcS3dg4TYwdNPE/WIK/DtgfKZsmtouEqjqH0i2jxUzv85ZDKqYZRshsu2AnXn9NnQGEyJ7iw9u1ZlgIGWREKR/XQmIBP6QhvyN0Y08MZ2swUlPw0kDV/uul+hjlYYWT89HMGsfHLUPqec90I1kj/BEEG12yp6PaWKng4ArWhNL33Daf47+y8CPUNAJjqB1NgYuDnipg640TnF+ph5hTXdMQmy+uxMNHPIv/894PKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llPfUX1sEsVzTSGp1KQox1QIA+kXWV3YL09odyLB60k=;
 b=MtVGZet7T6wOO+bPv7yJM6U05Yo7YhF1cPMQMtD6BdZakoSxIyvw1AWPV0kV73UbibdtPg3YEVg2qoAxa8Km/EQmd6X1ZnjxFPkrC3aNhJYcFFyvhVygmaUpYA5ql0tsXiqAZR+Qk1MD5NSiW0GW7DVDnRkmOksaAT0BWz7nR/eHj0v2mMjvhHarm2UvKkXmuzKxJia4o9yO7RjsgwBKFIC5eicRPIFRVla8rK0dTNC0talbc72I0uasp2wfSRxpCrawqtglif3SFrP1pVPHNPIa11VF8VAKCUcUScTZmyqbWJTuJA4joiluGQlBYee6ROQw+Gg6U7EjFFULTA903w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3589.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:120::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 10:25:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 10:25:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Thread-Topic: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Thread-Index: AQHaaVmCK95ONeBdo0m9TjsdjqM3v7Ed+80A
Date: Tue, 27 Feb 2024 10:25:15 +0000
Message-ID: <6fab09e0-1f21-4ada-b5ae-472bf71a1225@csgroup.eu>
References: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
In-Reply-To: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3589:EE_
x-ms-office365-filtering-correlation-id: 7d67a7eb-16df-4b67-f88b-08dc377e6373
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +Z0p61R7KPKeqDQLOy15GZnvaC78TSYamEi3lKTBHC4MKhm9aHs0OvT90CNwDcdl91kra2e1ez5lspYtFJ5Y6S2pV/zREdgq3O9okU+55jmRLsqxAgu+V9w1B+MaeIDhpZxm49zrDj/ALOvdQVcqIrx7tKCpXGMEGLnJchjBfAq/bL6HYGfkHKEf0ve6tUX1zpbju1iwozWEEPxVSwFQHH5z9bW5WjBXcOq+HSWQEV1Us2gCEAU+UbTIFi9d0hNhDZyQpwF+CHnKF8bohGYPHibxYfEttc1a05Z5IFbrZKx2SAfniA8+6D3KUwlRxpUJQhw70pPyMQV+4L4hKzfDvZt2ovZrfNPNe++HW6rc/im7o8yAlsmgHpdsrIZ/zOfbLi+hHOtQOFYPntMuvsbtJBNE5PD78vqf0d384iptuIevu7lqwQqcTpSOhDVi0I4e+WoYCD1QOifGkQrYsWASS28Xskmfj3+j/4dTXbi0n8sQ4iAbrojqJfdiy03nNzXJVYD90yiQ8WGZRrlh9mFjODNFPas5XJIwx2y5Irt3ff4XfV7ug+nYcUMX3gYfX4mqkCo1nksCofuMQM+pK6ZwWQ2INqbyYinUXUD6JAmEW8BSVxXfX/EjIWeiPme11UX9aa3zVfbNZSlOPJPcAzPz7RDCLrfrdiAQMN47CDkCM+9KwcpNn/qcUkbsKOM40gWPJ3iGs9fUtbHXVzOn6fY6pbXS9FfHmpkwcMpCanrXG/8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VHluSWI1WjdZK3BQRHpKQkUrMWVubXBkRWRqOGVwOU5ldTlIWDdPSHdBUjNF?=
 =?utf-8?B?ajRYS3YyZGljY3NZMVBBTDhDbGphajllU0RzR1kzbXAwbWp6Y21QcVZDaEpX?=
 =?utf-8?B?TTB5cHFER2JpTWpOQWVzTmNhb2hweC9oeUQzamJlVkFvdkQ3Q01CQU1vQWJU?=
 =?utf-8?B?QWR4UXZuYzUrYTFaZ2VtTXRZbnJEUHJwQklBTWF4NkI1a2JWK3JtNVhLVDlW?=
 =?utf-8?B?NEhJMVB4bllRNENNdGw5RndzeGYrWlppeHdibzM4aTdGanF0Y2IxWGxZSmJt?=
 =?utf-8?B?UzZRalNqVWpkTjhoNXErYVNUTXM5MjJSQlJnT3NZVFNFTktXckhFQzZXL2J6?=
 =?utf-8?B?cnRLQ3BvaUt4dllLbjlOQkdCUU9FU0lLU0tSOWQwSWU3ZFZhU0dGMllzRXF3?=
 =?utf-8?B?SWw4bHBJZ25pL1h2ZG1UUW1iYmxWY1BkaXllckUyMkJ6R0F4K1crY2F2WTFj?=
 =?utf-8?B?TmhPMEM4dFZTMUw4L2ZmS3ZkSHBGRVR0YlBWSjNNeDErbVhTRW9pY2RHQWJB?=
 =?utf-8?B?dFJsZUZ3VzEyb0V4b3FHeWpreDZQb0gxQ2cxcVF3QmRCUXgrRERDWjBzSFVZ?=
 =?utf-8?B?N290ZFYrSDkraFZQbnZ2cVUrTHJVNElxZm43ZEpSaUxTQlFPMnMwR24rdnAw?=
 =?utf-8?B?d0dJVkFqQnZLK09UR1d4aXQ2V0RrOWxybWUyT3JJSWVvMFhmQUJuMmRKVGZU?=
 =?utf-8?B?U2I3cndGZkQza1lxODVjd2RlVVEzd0NudWZPRXBzQVJBU25NZ04wOUU2NmJN?=
 =?utf-8?B?aTBZekNkVnVGS0o5WGF4U1pabEs5Y2plZm5uVHB4R3VmMVdLL0dXOHZjNWc3?=
 =?utf-8?B?LzN3d1RmZ3pYTE1mcnVXUlhLYkMxZ1NEdXl6NzNkYUR0OXFISGdoT2h5U1R6?=
 =?utf-8?B?TXhZKy9KczZFYmlsV1VXOTRsQW9rOHZ0K0Rqd1pEYUdsajFZNUpQUTdIb2Vj?=
 =?utf-8?B?MVFHZlZjZ1p3dENkbDZkWE5aY0VnNmFmelR1eC9kZXdnUnE4RDg2dXdmYnlR?=
 =?utf-8?B?bk9pQ2Z3YlhWZHV1c2taT2U3a2ZPRENWRDZzL1VTbVNybE9SVVBHSVNUQmZG?=
 =?utf-8?B?TmQyWTIrOXIxeHZpWjEvSnZYMjE4TlprYml4U3ptUmJTLzFQU0xIMEltQ1d6?=
 =?utf-8?B?bEZoUk1FNGZLclhDM2l1OFNRQXYyT2JhMUxYUzRoRUNDQXVUWUc4eTlXZ2xs?=
 =?utf-8?B?ZEEvUmlsOVMrdFhmUlB4Q3ZQaSt3ZjQrcjRTaVFXTlhTQVJUckdQMzVZaUls?=
 =?utf-8?B?cE1tSTZuMmZXVFBXNFczcnhHbG9hZkRjaHZjNEhmUGJoZkRQS3dSamtFS2RZ?=
 =?utf-8?B?dnFyYXRCNE9XRWdTWEppUEs5WHpualhYQ3FxL1hlemowZjZhVnVsOVhsaGgx?=
 =?utf-8?B?N2JWcHFJUW44RkpOcUlGZm0zMXNxR3ZnQ3I0aEtMY045cUlycEcwRkdxYlpn?=
 =?utf-8?B?VjE5QmVDcHhyZjhTdDNlUWEwYlk5Zk1Dd0IzVVNKVjhsUnRPMVFtV2RLSnBY?=
 =?utf-8?B?ZUFGQllIZTBxeWpSdEhnQjBaR01vb1hBeXF6SDFrM1daN213RmtqREVEME1D?=
 =?utf-8?B?SGhnSmlVVEsxdVpKb1N5cXMrd2VUVFIzeE5MZzhYQ25XcXhqcVJMT0V1R0FG?=
 =?utf-8?B?WW9CV1BuZ1N6MjNSdXdLWTZwdzcremcrWjVWMVczOFg2WVJxNXhhc2VlUFlp?=
 =?utf-8?B?d0hocUh3M3VrOS9ZU01tZGNjSytGSm51Z3BKZUFXTmx1TmtqUFc5dEdQSk5l?=
 =?utf-8?B?OERIK2Y5cS9CRUVRRFNnWE5ZS1VvbkEzQXZpazdidDE3ZzN3aUtMdUJLSkRr?=
 =?utf-8?B?dWdVQngvRE1rOWMvMjJpOTRHVHpiQ0VyWi9HcHQzOEs5OGZkVmFnSjhEbWJH?=
 =?utf-8?B?em1uMVlMeHp6YWJhNlM3ZmNETUEyaUJQZUxuWVdTRnBTdWIxbFY5cUhaSzNH?=
 =?utf-8?B?M05vNkhtUzZSazZpYjVsRDVucy9DSm12QzBBdXpRS3A5VFB2NThrVlJXOXlD?=
 =?utf-8?B?N2N6UjZWRDVzMlRJSm1OeExZUU5UajJGYzZKVUZMRjRvNE9DYVJWa1laVXlJ?=
 =?utf-8?B?VlRWQ3lXZlRudU9yQVNxRlNCRkJZRmxWQ21BV2dnZmU3TnE5QU1sQmduNTZW?=
 =?utf-8?B?dHlTOWVJMjFLZ3Fsa1dydHF5Q2xKMklJMFg1MHAzMlpnbDNTYmN2eWYvcXlo?=
 =?utf-8?B?RTZJNndPbmRpaExyR3ZlZG9Jd0RNZFdvSUdTcWVOSGV3M2pFSW9UN0ZpV2NU?=
 =?utf-8?B?L1FZTVlHbncrNHRYa3VkNFNrM09nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB875CA5547D484DA12679931AC60FFF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d67a7eb-16df-4b67-f88b-08dc377e6373
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 10:25:15.3116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TC9269ZlstxmCmKjP5SkArHi+PqCRiXeUJdPZyuLfAJUzijAy8MnNYmKzNp9DNfeVGqXjVCDxlwYAkfh2Cmm/OTxieYIgxJXCkFZbLzlkBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3589
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
Cc: Nicholas Piggin <npiggin@gmail.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Mark Brown <broonie@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAyLzIwMjQgw6AgMDk6NDYsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IEhlbGxvLA0KPiANCj4gcmVjZW50bHkgdGhlIHNwaS1wcGM0eHguYyBkcml2ZXIgc3VmZmVy
ZWQgZnJvbSBidWlsZCBlcnJvcnMgYW5kIHdhcm5pbmdzDQo+IHRoYXQgd2VyZSB1bmRldGVjdGVk
IGZvciBsb25nZXIgdGhhbiBJIGV4cGVjdGVkLiBJIHRoaW5rIGl0IHdvdWxkIGJlDQo+IHZlcnkg
YmVuZWZpY2lhbCBpZiB0aGlzIGRyaXZlciB3YXMgZW5hYmxlZCBpbiAoYXQgbGVhc3QpIGEgcG93
ZXJwYw0KPiBhbGxtb2Rjb25maWcgYnVpbGQuDQo+IA0KPiBUaGUgY2hhbGxlbmdlIHRvIGRvIHNv
IGlzIHRoYXQgc3BpLXBwYzR4eC5jIHVzZXMgZGNyaV9jbHJzZXQoKSB3aGljaCBpcw0KPiBvbmx5
IGRlZmluZWQgZm9yIDR4eCAoYXMgdGhlc2Ugc2VsZWN0IFBQQ19EQ1JfTkFUSVZFKS4NCj4gDQo+
IEkgd29uZGVyIGlmIGRjcmlfY2xyc2V0KCkgY291bGQgYmUgZGVmaW5lZCBmb3IgdGhlIFBQQ19E
Q1JfTU1JTyBjYXNlLA0KPiB0b28uIEkgdHJpZWQgYW5kIGZhaWxlZC4gVGhlIGJlc3QgSSBjYW1l
IHVwIHdpdGhvdXQgZXh0ZW5zaXZlIGRvYw0KPiByZWFkaW5nIGlzOg0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9kY3ItbmF0aXZlLmggYi9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vZGNyLW5hdGl2ZS5oDQo+IGluZGV4IGE5MjA1OTk2NDU3OS4uMTU5YWI3YWJm
ZTQ2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZGNyLW5hdGl2ZS5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9kY3ItbmF0aXZlLmgNCj4gQEAgLTEx
NSwxNSArMTE1LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2RjcmlfY2xyc2V0KGludCBiYXNl
X2FkZHIsIGludCBiYXNlX2RhdGEsIGludCByZWcsDQo+ICAgCXVuc2lnbmVkIGludCB2YWw7DQo+
ICAgDQo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZkY3JfaW5kX2xvY2ssIGZsYWdzKTsNCj4gLQlp
ZiAoY3B1X2hhc19mZWF0dXJlKENQVV9GVFJfSU5ERVhFRF9EQ1IpKSB7DQo+IC0JCW10ZGNyeChi
YXNlX2FkZHIsIHJlZyk7DQo+IC0JCXZhbCA9IChtZmRjcngoYmFzZV9kYXRhKSAmIH5jbHIpIHwg
c2V0Ow0KPiAtCQltdGRjcngoYmFzZV9kYXRhLCB2YWwpOw0KPiAtCX0gZWxzZSB7DQo+IC0JCV9f
bXRkY3IoYmFzZV9hZGRyLCByZWcpOw0KPiAtCQl2YWwgPSAoX19tZmRjcihiYXNlX2RhdGEpICYg
fmNscikgfCBzZXQ7DQo+IC0JCV9fbXRkY3IoYmFzZV9kYXRhLCB2YWwpOw0KPiAtCX0NCj4gKw0K
PiArCW10ZGNyKGJhc2VfYWRkciwgcmVnKTsNCj4gKwl2YWwgPSAobWZkY3IoYmFzZV9kYXRhKSAm
IH5jbHIpIHwgc2V0Ow0KPiArCW10ZGNyKGJhc2VfZGF0YSwgdmFsKTsNCj4gKw0KPiAgIAlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZkY3JfaW5kX2xvY2ssIGZsYWdzKTsNCj4gICB9DQo+ICAgDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9LY29uZmlnIGIvZHJpdmVycy9zcGkvS2NvbmZpZw0K
PiBpbmRleCBiYzcwMjFkYTJmZTkuLjlhMGE1ZThjNzBjOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9zcGkvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL3NwaS9LY29uZmlnDQo+IEBAIC04MTAsNyAr
ODEwLDggQEAgY29uZmlnIFNQSV9QTDAyMg0KPiAgIA0KPiAgIGNvbmZpZyBTUElfUFBDNHh4DQo+
ICAgCXRyaXN0YXRlICJQUEM0eHggU1BJIENvbnRyb2xsZXIiDQo+IC0JZGVwZW5kcyBvbiBQUEMz
MiAmJiA0eHgNCj4gKwlkZXBlbmRzIG9uIDR4eCB8fCBDT01QSUxFX1RFU1QNCj4gKwlkZXBlbmRz
IG9uIFBQQzMyIHx8IFBQQzY0DQo+ICAgCXNlbGVjdCBTUElfQklUQkFORw0KPiAgIAloZWxwDQo+
ICAgCSAgVGhpcyBzZWxlY3RzIGEgZHJpdmVyIGZvciB0aGUgUFBDNHh4IFNQSSBDb250cm9sbGVy
Lg0KPiANCj4gV2hpbGUgdGhpcyBpcyBhIHN0ZXAgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiAoSSB0
aGluaykgaXQncyBub3QgZW5vdWdoIHRvDQo+IG1ha2UgdGhlIGRyaXZlciBidWlsZCAoYnV0IG1h
eWJlIG1ha2UgaXQgZWFzaWVyIHRvIGRlZmluZQ0KPiBkY3JpX2NscnNldCgpPykNCj4gDQo+IENv
dWxkIHNvbWVvbmUgd2l0aCBtb3JlIHBvd2VycGMga25vd2xlZGdlIGp1bXAgaW4gYW5kIGhlbHAg
KGZvciB0aGUNCj4gYmVuZWZpdCBvZiBiZXR0ZXIgY29tcGlsZSBjb3ZlcmFnZSBvZiB0aGUgc3Bp
IGRyaXZlciBhbmQgc28gbGVzcw0KPiBicmVha2FnZSk/IChJZiB5b3UgZG8gc28gYmFzZWQgb24g
bXkgY2hhbmdlcyBhYm92ZSwgeW91IGRvbid0IG5lZWQgdG8NCj4gY3JlZGl0IG1lIGZvciBteSBl
ZmZvcnQsIGNsYWltIGl0IGFzIHlvdXIncy4gSSdtIGhhcHB5IGVub3VnaCBpZiB0aGUNCj4gc2l0
dWF0aW9uIGltcHJvdmVzLikNCg0KV2hhdCBhYm91dCB0aGlzID8NCg0KZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9kY3ItbW1pby5oIA0KYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vZGNyLW1taW8uaA0KaW5kZXggZmM2ZDkzZWY0YTEzLi4zOGI1MTVhZmJmZmMgMTAwNjQ0
DQotLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZGNyLW1taW8uaA0KKysrIGIvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Rjci1tbWlvLmgNCkBAIC0zOCw2ICszOCwxMSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgZGNyX3dyaXRlX21taW8oZGNyX2hvc3RfbW1pb190IGhvc3QsDQogIAlvdXRf
YmUzMihob3N0LnRva2VuICsgKChob3N0LmJhc2UgKyBkY3JfbikgKiBob3N0LnN0cmlkZSksIHZh
bHVlKTsNCiAgfQ0KDQorc3RhdGljIGlubGluZSB2b2lkIF9fZGNyaV9jbHJzZXQoaW50IGJhc2Vf
YWRkciwgaW50IGJhc2VfZGF0YSwgaW50IHJlZywNCisJCQkJIHVuc2lnbmVkIGNsciwgdW5zaWdu
ZWQgc2V0KQ0KK3sNCit9DQorDQogICNlbmRpZiAvKiBfX0tFUk5FTF9fICovDQogICNlbmRpZiAv
KiBfQVNNX1BPV0VSUENfRENSX01NSU9fSCAqLw0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2Rjci1uYXRpdmUuaCANCmIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rj
ci1uYXRpdmUuaA0KaW5kZXggYTkyMDU5OTY0NTc5Li4yZjYyMjFiZjU0MDYgMTAwNjQ0DQotLS0g
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZGNyLW5hdGl2ZS5oDQorKysgYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vZGNyLW5hdGl2ZS5oDQpAQCAtMTM1LDEwICsxMzUsNiBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgX19kY3JpX2NscnNldChpbnQgYmFzZV9hZGRyLCBpbnQgDQpiYXNlX2RhdGEs
IGludCByZWcsDQogIAkJCQkJIERDUk5fICMjIGJhc2UgIyMgX0NPTkZJR19EQVRBLAlcDQogIAkJ
CQkJIHJlZywgZGF0YSkNCg0KLSNkZWZpbmUgZGNyaV9jbHJzZXQoYmFzZSwgcmVnLCBjbHIsIHNl
dCkJX19kY3JpX2NscnNldChEQ1JOXyAjIyBiYXNlICMjIA0KX0NPTkZJR19BRERSLAlcDQotCQkJ
CQkJCSAgICAgIERDUk5fICMjIGJhc2UgIyMgX0NPTkZJR19EQVRBLAlcDQotCQkJCQkJCSAgICAg
IHJlZywgY2xyLCBzZXQpDQotDQogICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8NCiAgI2VuZGlm
IC8qIF9fS0VSTkVMX18gKi8NCiAgI2VuZGlmIC8qIF9BU01fUE9XRVJQQ19EQ1JfTkFUSVZFX0gg
Ki8NCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZGNyLmggYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vZGNyLmgNCmluZGV4IDY0MDMwZTNhMWYzMC4uMTVjMTIzYWUzOGEx
IDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rjci5oDQorKysgYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vZGNyLmgNCkBAIC0xOCw2ICsxOCw5IEBADQogICNpbmNsdWRl
IDxhc20vZGNyLW1taW8uaD4NCiAgI2VuZGlmDQoNCisjZGVmaW5lIGRjcmlfY2xyc2V0KGJhc2Us
IHJlZywgY2xyLCBzZXQpCV9fZGNyaV9jbHJzZXQoRENSTl8gIyMgYmFzZSAjIyANCl9DT05GSUdf
QUREUiwJXA0KKwkJCQkJCQkgICAgICBEQ1JOXyAjIyBiYXNlICMjIF9DT05GSUdfREFUQSwJXA0K
KwkJCQkJCQkgICAgICByZWcsIGNsciwgc2V0KQ0KDQogIC8qIEluZGlyZWN0aW9uIGxheWVyIGZv
ciBwcm92aWRpbmcgYm90aCBOQVRJVkUgYW5kIE1NSU8gc3VwcG9ydC4gKi8NCg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3BpL0tjb25maWcgYi9kcml2ZXJzL3NwaS9LY29uZmlnDQppbmRleCBkZGFl
MGZkZTc5OGUuLjdiMDAzYzVkZDYxMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc3BpL0tjb25maWcN
CisrKyBiL2RyaXZlcnMvc3BpL0tjb25maWcNCkBAIC04MTAsNyArODEwLDcgQEAgY29uZmlnIFNQ
SV9QTDAyMg0KDQogIGNvbmZpZyBTUElfUFBDNHh4DQogIAl0cmlzdGF0ZSAiUFBDNHh4IFNQSSBD
b250cm9sbGVyIg0KLQlkZXBlbmRzIG9uIFBQQzMyICYmIDR4eA0KKwlkZXBlbmRzIG9uIFBQQyAm
JiAoNHh4IHx8IENPTVBJTEVfVEVTVCkNCiAgCXNlbGVjdCBTUElfQklUQkFORw0KICAJaGVscA0K
ICAJICBUaGlzIHNlbGVjdHMgYSBkcml2ZXIgZm9yIHRoZSBQUEM0eHggU1BJIENvbnRyb2xsZXIu
DQo=
