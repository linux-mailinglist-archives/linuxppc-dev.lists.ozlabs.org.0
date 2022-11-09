Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55776223E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 07:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6ZXg3lWnz3dv7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 17:18:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=w9LDW/iS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.59; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=w9LDW/iS;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90059.outbound.protection.outlook.com [40.107.9.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6ZVk1Lc1z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 17:16:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIVYBYXmKBlwX7EF83uI4OppBMHJ31q/iZd/nG6ilBeUmXrHRQ8TfhC5YXHSAl2CxmCiLE6MK5Kbf0OiJFLqLMl41O45Xhb4s8ft7Ghni9KImDExl9hZu1Pik8HYvGqUt79FGK9OXOBIvZzgJ9UtnVw0zaq8B4X2I41RVW2zFYoRGP+MMQ0NwbMPrTKAczFpCESOtMCUiqwqR29vxbKwIA4QRs/VazZ/hDc36gn9AFgP8C/DUjGqreiBjIWAo8/hsaO3fNoic8sUESR7yT4pSUXIXVYKLjRX1Osd5Zi3UfjpLF7qo1Za0k3hLIB+XFIYuQ1nhaA1N0xBGoPw+PD8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRsR53P8KPWspanXm0CTPIU8aZSMvgbL4U/PUBQ/AaI=;
 b=LtVX64/Z3Cxo/WLA1yc2p3jIE9xDB0M/maIUULHTPVrlfZxhg00OBBhYYOSfL0dsb4prwP5+q7oKRJ3YWsX8Zf1I2WpMkZ5j8GhjUvEBRAvi7TATdpjIbWDRY7c3t0mqvzYcFtLAWkNBrdhV66NQQoQoUlVLJillIIXX+gnJyUbGxjAnUT3Rx0UuZOucQ3FOg0FjjKK9ZQyJoole7CNIicAHtCakhbHgwm1kWYtuCTex5DGV4IiK4QHjpNsC6KQMINea7CYLQb7YJ0N9EXx/fCgwWOW7FP5+bVrNuarK1K4KOnuTlyla41o6edJEWEAofYVZRQmkh2os6dlvqW1rTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRsR53P8KPWspanXm0CTPIU8aZSMvgbL4U/PUBQ/AaI=;
 b=w9LDW/iSRM99Zgdu22lvkYM80/YdlfAncxwufgnRNQ2UMDDnKFt/je7EMyC3vvBk2WfXkPN1CfEkg6NOgxUwK8A/58oiDk+pjd82l7gD4hiCGVlgwwAvZqA7UELKaXgkPPTh/EeYmX873shEnw4a3V+VBumAPYBbostuU7scEmwmVVWR8sjqr1+jW1xqmn+8UfkDR7Sl2wSfr7DvP0PmX1o9+DN8u41bQ97cXcW04QMowTOjuKWzmS8926KZel30BGCXWjhmcpga9dOsW3185m59uO/dv/biNYpRMPru2TtQfiXk9dkG1dvAd1qa17X6xs6BQSoYbzwilAjYVT2Ikw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1865.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 06:16:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 06:16:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 4/9] powerpc/mm: Remove empty hash__ functions
Thread-Topic: [PATCH v10 4/9] powerpc/mm: Remove empty hash__ functions
Thread-Index: AQHY8/b5YK8ydh61P0eKR36co0ByzK42HbsA
Date: Wed, 9 Nov 2022 06:16:40 +0000
Message-ID: <a01d3527-1795-f3b2-fb3d-7e4ed92a652d@csgroup.eu>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
 <20221109045112.187069-5-bgray@linux.ibm.com>
In-Reply-To: <20221109045112.187069-5-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1865:EE_
x-ms-office365-filtering-correlation-id: 2607da37-272e-42fd-ae97-08dac219f769
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  68ioSMd1p/zxRZb2G75k/LEn4+O36hCAsP2VIo/lQMvmGrQRna+YIW5nvTG4JkN7eYhLtdJO+gyiJkGw9y9QDD67+X6CJYrjc75R+bfKnd/qslZ7YRydjI8g4IsbZhoUt2SPsXPYBLrpYQ6i3rpxMFo82APJfhMi/vcdAAQVl2n2d1YPnrkj5nUr710MlJauawaAVvoP0zSnrHCCyRg7UilxJySdd7YvHXCxg9EYX+yVz0xQLSfijzSQCqFg0bAPyx4oDB6olBplEaDOBCfx4p5Agzql0mDBd0cQGtyRELI+2JS50u1f1i6b6PSN3Ghb+LGM+708Cqzx4Il67WlqGjJ/l0SLiZSHq72EDWP3Gv7XF5CaPJIQFt4+FBTKN+wLVA5Y+M4Q7TiB6ap6RjfgFiiFfwOdU8PoDefBpP6aLBHkPcr+G4sYodieB/oKCiRdlx1GsuSdcEMOX3T00U8ALPujz5QEHl40KdvE1SVvZiU4P6AqEEpWIdqdrFs0mFs56odRmfx1cnIsJwo4WjY09GtBzyIZr8zMGWwRWTD0ofA1RedaGLH/la6UAv6t8UjSBB63FbugM/8W/7bbEwArz0vaYpjjbXUlO7C7vqi0mZhzOCyll6twzWDiHWXGRFGX5jDpKL8MTblC4RX3vhiJU0fEpNe94iR53MNbkoKUw2zskynAiTAE8d6DYfw0qcF9Eyanahu8CcDZh25WZFmB7JH3bB7Ijx2V2Y3GIUwUXKXBnR75ufBncyINUZrnAqkq0gEVgXWQlSi4yTBnGEavZAr5JgnMAZQxjUDXga4i/hxIF+VlJZB+a2hNuLj+GQHgpgrgcuTdEdo8Vv8p5LTUGg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(91956017)(8676002)(86362001)(66946007)(4326008)(66446008)(64756008)(66476007)(76116006)(31696002)(316002)(66556008)(6506007)(6486002)(478600001)(2616005)(186003)(26005)(36756003)(54906003)(110136005)(38100700002)(6512007)(38070700005)(83380400001)(122000001)(8936002)(71200400001)(5660300002)(44832011)(31686004)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eTEvOHdYcS9lRjVFSHBhN3BXWDNVRGNDREdtSkdHUFdnM3VYNmU2blVOUlN0?=
 =?utf-8?B?YzRyUmwzNVc2eHBMYmNqckh4L1ZxZ1VIWk8xcnpFOTRXUVMzWGFHb09kdEVy?=
 =?utf-8?B?UkFleE9tMGdpV05iSndXbDI1SlhlSUh1MzVzNU9hTmtsRzhCZUdYU1ZrdTgx?=
 =?utf-8?B?UEdqZFdTbU9JM0lwYW85UTlSTlRtM0YzVEZFcHM0SHZEUDdyZXF2QU1wY0Mz?=
 =?utf-8?B?c09NVTNCTzIyakhNaVUyQUxQY2lZUTlvNjIwdENRZkVDQVdSd2gxNk5NRkN4?=
 =?utf-8?B?dmFxUnpFdUhqTVBZRjk3eFNkM1JIOEx2R1JkWjl1ZHRJL2pmcENFWURJeXJl?=
 =?utf-8?B?RDUvRHplYzBNY2JjVUxYbmxreUFBTXJ2aU1aWHF4MXBRNzg1cVdodlVVMUJs?=
 =?utf-8?B?a0QrTkkzcUFNYisvZnI4a2dtNDZFZVdIM0FNeXRhNXlhN3YvczkycUR5VGI0?=
 =?utf-8?B?TFd6N0xYWjBURnY4MHNkU0RxRkh2SUI4bXdZRExsaTgzS1Y3YWd2bkcvSGQ3?=
 =?utf-8?B?LzlSbXRZTFlTejY0WXJZRXJiN1RUdUNMRkJQdDBlTC9mUEYrcGtEWDZPT3FZ?=
 =?utf-8?B?NGxwekl6eFRVTHh0NHVRWWxYcThlaVpaamZYeUJReS9KSmNKNkc5SlNiR2h6?=
 =?utf-8?B?azQ1K1o4RkkvNVlzby94L2JwZXdYRWcrcXZnN1VOU0dNMFhOeExTVjhham9k?=
 =?utf-8?B?OFdNSkZMLzA0N0U2TGdJY0JnQXFtRXNvYVNRNmZPWHVSNWtkWWJCUjNUaEtx?=
 =?utf-8?B?dVRGa1BBb09QOXVLaGpSRVpsV2hrdFFCeW1iekFRU3VJeW80YjVLTkFvUUZZ?=
 =?utf-8?B?ZzR4cnFqR2t4ZlZsWFZoZDVYdU1RZnhncHVSaExUeWN3ZkV1cGEvVmZjeDIz?=
 =?utf-8?B?U0g2cFpmSVVlN2JqYVlQcVJsZVUzL251OHJ1U2pwQjYvYVVENnkzaGxIbWZ4?=
 =?utf-8?B?SlJ4WUxUSDZBYm5qbkNwb2FpTCtwMWRuV21yTnU3TzFzaFBnM1Vqa05MbVRE?=
 =?utf-8?B?ZzhBYTk3ZWQxNjBQTis4TDVHd3p2dkc4Qm5sQWlPbS85c2ozQVpQU0o5S0dH?=
 =?utf-8?B?V3BxdXFtU20vckEzSTRUeGMxRGd0S1dHUENocUQvUXVoV2FLQi93ek1VNDdR?=
 =?utf-8?B?SjNQd29RdGtRTFFpT0YvSHhncnpyOHlpTEZrTkxqUXpxbUlLSytzbkRiRUFw?=
 =?utf-8?B?aElQWU5CZWZqREJpNXkvSVZhTSt6QWhMUVhxNkZjVmFkUVpSS2VEUlZSTlc5?=
 =?utf-8?B?YUUyaTJtM29Jc3MrVC96VlREeVhUaG9TeGQwWXBhOEJaWHpkN3FvL2JsaVBJ?=
 =?utf-8?B?UGdDN0FuT3dac1hMLzYyWTJGQXdOYkVjZVhhTHZKaXJqdlB4cXJ6OGttNlRj?=
 =?utf-8?B?NWZVTS9GQjRYcXhtS0F3SmpQVGJVYWxKaXZRZVgvWWhFZlR3MERHMnVYL1FB?=
 =?utf-8?B?bVcrdVNxRjUwWk8yUzRSa1N4K3VuVmJoSktJV2ZrSHM2SlpUb3FGVHNzYkVr?=
 =?utf-8?B?S0p1MHFHUm5lY2xJejBVa2NqdzY0SDI0Q2YzM2ppRERvL3k2RkhpeldNcHVC?=
 =?utf-8?B?bkVaY1B5TFR3MmR2TitsR1lRczlmeWwxRDRZZnFvZzhZZ3NrUHRweFBlaGFn?=
 =?utf-8?B?Z01jNW1GMlpuWTJiL2c2VlBWaFhVdGhuNWxkVmdIUnlReE8vR3g3NmxITWZ4?=
 =?utf-8?B?MU1IUmFVMWgxMmwva2JnQ2RUWkR4SnF5MmJjUlFiUzc1S2w0UkRjZXBRU3o2?=
 =?utf-8?B?eGJBeUhyZ1lPU09LT3I0TjZvWDFZNVF0OU90UkFWQ0JoL1pOK2dINmpUN3lB?=
 =?utf-8?B?MkpRY0VUSUZYZVIyVHFmckRqRGFpSy83SlBCK2E5SjQ0NlBpUzVmSEJteEJv?=
 =?utf-8?B?L3dJb0NqWG5Pdk95c2hORmNGcDZRcUdYdmlSTjBpUDVOSUlGUHlpbzBJdTFz?=
 =?utf-8?B?OW1JeEMxQVZWcGd3RG9rdTl2Q3VXWEhjUFl0YTNCaXVNNm5idkIwblFpV1Nk?=
 =?utf-8?B?cW9ieklucDAzUHNFYzB1NWxUTkg3VEtOVHAzQXZ5dVdXOFBGa3c2YWVlL1A1?=
 =?utf-8?B?dzl3T2dDTGlZYloxZXkvbnVkZ3ZTUy9RMEdYb0xNTEkxSEFXNTA4YzR0SGJ2?=
 =?utf-8?B?RWVvZ1pMREFud3VOUzFGTFJyYW1kb0dWLzUwaHdYMitDb1VNZjRxcmVUSmUx?=
 =?utf-8?Q?Fu/7i8RmLL6TuUhBH/p0jwU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7A1030EDCB8F742A2F701684B2D476E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2607da37-272e-42fd-ae97-08dac219f769
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 06:16:40.6903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRhQsXAHc1Z4Q8zwn+4YFVvsxcw9hLSNXa6uxbWHQNJYkNi/xUFFkFO9f5BpnuU4lclJyIAHoEvHsdWXjsA2spX8uwMxU8s2wlu96HNgKwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1865
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzExLzIwMjIgw6AgMDU6NTEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIGVtcHR5IGhhc2hfXyogZnVuY3Rpb25zIGFyZSB1bm5lY2Vzc2FyeS4gVGhlIGVtcHR5IGRl
ZmluaXRpb25zIHdlcmUNCj4gaW50cm9kdWNlZCB3aGVuIDY0LWJpdCBIYXNoIHN1cHBvcnQgd2Fz
IGFkZGVkLCBhcyB0aGUgZnVuY3Rpb25zIHdlcmUNCj4gc3RpbGwgdXNlZCBpbiBnZW5lcmljIGNv
ZGUuIFRoZXNlIGVtcHR5IGRlZmluaXRpb25zIHdlcmUgcHJlZml4ZWQgd2l0aA0KPiBoYXNoX18g
d2hlbiBSYWRpeCBzdXBwb3J0IHdhcyBhZGRlZCwgYW5kIG5ldyB3cmFwcGVycyB3aXRoIHRoZSBv
cmlnaW5hbA0KPiBuYW1lcyB3ZXJlIGFkZGVkIHRoYXQgc2VsZWN0ZWQgdGhlIFJhZGl4IG9yIEhh
c2ggdmVyc2lvbiBiYXNlZCBvbg0KPiByYWRpeF9lbmFibGVkKCkuDQo+IA0KPiBCdXQgdGhlIGhh
c2hfXyBwcmVmaXhlZCBmdW5jdGlvbnMgd2VyZSBub3QgcGFydCBvZiBhIHB1YmxpYyBpbnRlcmZh
Y2UsDQo+IHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gaW5jbHVkZSB0aGVtIGZvciBjb21wYXRpYmls
aXR5IHdpdGggYW55dGhpbmcuDQo+IEdlbmVyaWMgY29kZSB3aWxsIHVzZSB0aGUgbm9uLXByZWZp
eGVkIHdyYXBwZXJzLCBhbmQgSGFzaCBzcGVjaWZpYyBjb2RlDQo+IHdpbGwga25vdyB0aGF0IHRo
ZXJlIGlzIG5vIHBvaW50IGluIGNhbGxpbmcgdGhlbSAob3IgZXZlbiB3b3JzZSwgY2FsbA0KPiB0
aGVtIGFuZCBleHBlY3QgdGhlbSB0byBkbyBzb21ldGhpbmcpLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4g
djEwOgkqIE5ldyBpbiB2MTAgZm9yIGNvbnNpc3RlbmN5IHdpdGggbmV3IGZ1bmN0aW9ucw0KPiAt
LS0NCj4gICAuLi4vaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaCAgICAgfCAy
OCAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2sz
cy82NC90bGJmbHVzaC5oIHwgMjcgKysrKysrLS0tLS0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2gtaGFzaC5oIGIvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC1oYXNoLmgNCj4gaW5kZXgg
M2M4OWU2MjVlNjIwLi4zOGQzMWMyNDg5ZDMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2gtaGFzaC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2gtaGFzaC5oDQo+IEBAIC01OCwxMyArNTgs
NiBAQCB2b2lkIGZsdXNoX2hhc2hfcGFnZSh1bnNpZ25lZCBsb25nIHZwbiwgcmVhbF9wdGVfdCBw
dGUsIGludCBwc2l6ZSwgaW50IHNzaXplLA0KPiAgIHZvaWQgZmx1c2hfaGFzaF9yYW5nZSh1bnNp
Z25lZCBsb25nIG51bWJlciwgaW50IGxvY2FsKTsNCj4gICB2b2lkIGZsdXNoX2hhc2hfaHVnZXBh
Z2UodW5zaWduZWQgbG9uZyB2c2lkLCB1bnNpZ25lZCBsb25nIGFkZHIsIHBtZF90ICpwbWRwLA0K
PiAgIAkJCSB1bnNpZ25lZCBpbnQgcHNpemUsIGludCBzc2l6ZSwgdW5zaWduZWQgbG9uZyBmbGFn
cyk7DQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaGFzaF9fbG9jYWxfZmx1c2hfdGxiX21tKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tKQ0KPiAtew0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQg
aGFzaF9fZmx1c2hfdGxiX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQ0KPiAtew0KPiAtfQ0KPiAg
IA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBoYXNoX19sb2NhbF9mbHVzaF9hbGxfbW0oc3RydWN0
IG1tX3N0cnVjdCAqbW0pDQo+ICAgew0KPiBAQCAtODgsMjcgKzgxLDYgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGhhc2hfX2ZsdXNoX2FsbF9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gICAJV0FS
Tl9PTl9PTkNFKDEpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBoYXNoX19s
b2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gLQkJCQkJ
ICB1bnNpZ25lZCBsb25nIHZtYWRkcikNCj4gLXsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIGlubGlu
ZSB2b2lkIGhhc2hfX2ZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0K
PiAtCQkJCSAgICB1bnNpZ25lZCBsb25nIHZtYWRkcikNCj4gLXsNCj4gLX0NCj4gLQ0KPiAtc3Rh
dGljIGlubGluZSB2b2lkIGhhc2hfX2ZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwNCj4gLQkJCQkgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcg
ZW5kKQ0KPiAtew0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaGFzaF9fZmx1c2hf
dGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LA0KPiAtCQkJCQkgICAgdW5zaWdu
ZWQgbG9uZyBlbmQpDQo+IC17DQo+IC19DQo+IC0NCj4gLQ0KPiAgIHN0cnVjdCBtbXVfZ2F0aGVy
Ow0KPiAgIHZvaWQgaGFzaF9fdGxiX2ZsdXNoKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIpOw0KPiAg
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJm
bHVzaC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oDQo+
IGluZGV4IDY3NjU1Y2Q2MDU0NS4uMjI1NGE0MGYwNTY0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLmgNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oDQo+IEBAIC00Nyw4ICs0Nyw3IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLA0KPiAgIAkJCQkgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQg
bG9uZyBlbmQpDQo+ICAgew0KPiAgIAlpZiAocmFkaXhfZW5hYmxlZCgpKQ0KPiAtCQlyZXR1cm4g
cmFkaXhfX2ZsdXNoX3BtZF90bGJfcmFuZ2Uodm1hLCBzdGFydCwgZW5kKTsNCj4gLQlyZXR1cm4g
aGFzaF9fZmx1c2hfdGxiX3JhbmdlKHZtYSwgc3RhcnQsIGVuZCk7DQo+ICsJCXJhZGl4X19mbHVz
aF9wbWRfdGxiX3JhbmdlKHZtYSwgc3RhcnQsIGVuZCk7DQo+ICAgfQ0KPiAgIA0KPiAgICNkZWZp
bmUgX19IQVZFX0FSQ0hfRkxVU0hfSFVHRVRMQl9UTEJfUkFOR0UNCj4gQEAgLTU3LDM5ICs1Niwz
NCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfaHVnZXRsYl90bGJfcmFuZ2Uoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgCQkJCQkgICB1bnNpZ25lZCBsb25nIGVuZCkNCj4gICB7
DQo+ICAgCWlmIChyYWRpeF9lbmFibGVkKCkpDQo+IC0JCXJldHVybiByYWRpeF9fZmx1c2hfaHVn
ZXRsYl90bGJfcmFuZ2Uodm1hLCBzdGFydCwgZW5kKTsNCj4gLQlyZXR1cm4gaGFzaF9fZmx1c2hf
dGxiX3JhbmdlKHZtYSwgc3RhcnQsIGVuZCk7DQo+ICsJCXJhZGl4X19mbHVzaF9odWdldGxiX3Rs
Yl9yYW5nZSh2bWEsIHN0YXJ0LCBlbmQpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW5saW5l
IHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIAkJ
CQkgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkNCj4gICB7DQo+ICAg
CWlmIChyYWRpeF9lbmFibGVkKCkpDQo+IC0JCXJldHVybiByYWRpeF9fZmx1c2hfdGxiX3Jhbmdl
KHZtYSwgc3RhcnQsIGVuZCk7DQo+IC0JcmV0dXJuIGhhc2hfX2ZsdXNoX3RsYl9yYW5nZSh2bWEs
IHN0YXJ0LCBlbmQpOw0KPiArCQlyYWRpeF9fZmx1c2hfdGxiX3JhbmdlKHZtYSwgc3RhcnQsIGVu
ZCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF90bGJfa2VybmVs
X3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsDQo+ICAgCQkJCQkgIHVuc2lnbmVkIGxvbmcgZW5k
KQ0KPiAgIHsNCj4gICAJaWYgKHJhZGl4X2VuYWJsZWQoKSkNCj4gLQkJcmV0dXJuIHJhZGl4X19m
bHVzaF90bGJfa2VybmVsX3JhbmdlKHN0YXJ0LCBlbmQpOw0KPiAtCXJldHVybiBoYXNoX19mbHVz
aF90bGJfa2VybmVsX3JhbmdlKHN0YXJ0LCBlbmQpOw0KPiArCQlyYWRpeF9fZmx1c2hfdGxiX2tl
cm5lbF9yYW5nZShzdGFydCwgZW5kKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGlubGluZSB2
b2lkIGxvY2FsX2ZsdXNoX3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gICB7DQo+ICAg
CWlmIChyYWRpeF9lbmFibGVkKCkpDQo+IC0JCXJldHVybiByYWRpeF9fbG9jYWxfZmx1c2hfdGxi
X21tKG1tKTsNCj4gLQlyZXR1cm4gaGFzaF9fbG9jYWxfZmx1c2hfdGxiX21tKG1tKTsNCj4gKwkJ
cmFkaXhfX2xvY2FsX2ZsdXNoX3RsYl9tbShtbSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCBsb2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwNCj4gICAJCQkJCXVuc2lnbmVkIGxvbmcgdm1hZGRyKQ0KPiAgIHsNCj4gICAJaWYgKHJhZGl4
X2VuYWJsZWQoKSkNCj4gLQkJcmV0dXJuIHJhZGl4X19sb2NhbF9mbHVzaF90bGJfcGFnZSh2bWEs
IHZtYWRkcik7DQo+IC0JcmV0dXJuIGhhc2hfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlKHZtYSwgdm1h
ZGRyKTsNCj4gKwkJcmFkaXhfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlKHZtYSwgdm1hZGRyKTsNCj4g
ICB9DQo+ICAgDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX2FsbF9tbShzdHJ1
Y3QgbW1fc3RydWN0ICptbSkNCj4gQEAgLTEwMiwyNCArOTYsMjEgQEAgc3RhdGljIGlubGluZSB2
b2lkIGxvY2FsX2ZsdXNoX2FsbF9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gICBzdGF0aWMg
aW5saW5lIHZvaWQgdGxiX2ZsdXNoKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIpDQo+ICAgew0KPiAg
IAlpZiAocmFkaXhfZW5hYmxlZCgpKQ0KPiAtCQlyZXR1cm4gcmFkaXhfX3RsYl9mbHVzaCh0bGIp
Ow0KPiAtCXJldHVybiBoYXNoX190bGJfZmx1c2godGxiKTsNCj4gKwkJcmFkaXhfX3RsYl9mbHVz
aCh0bGIpOw0KPiAgIH0NCj4gICANCj4gICAjaWZkZWYgQ09ORklHX1NNUA0KPiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCBmbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pDQo+ICAgew0KPiAg
IAlpZiAocmFkaXhfZW5hYmxlZCgpKQ0KPiAtCQlyZXR1cm4gcmFkaXhfX2ZsdXNoX3RsYl9tbSht
bSk7DQo+IC0JcmV0dXJuIGhhc2hfX2ZsdXNoX3RsYl9tbShtbSk7DQo+ICsJCXJhZGl4X19mbHVz
aF90bGJfbW0obW0pOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hf
dGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgCQkJCSAgdW5zaWduZWQg
bG9uZyB2bWFkZHIpDQo+ICAgew0KPiAgIAlpZiAocmFkaXhfZW5hYmxlZCgpKQ0KPiAtCQlyZXR1
cm4gcmFkaXhfX2ZsdXNoX3RsYl9wYWdlKHZtYSwgdm1hZGRyKTsNCj4gLQlyZXR1cm4gaGFzaF9f
Zmx1c2hfdGxiX3BhZ2Uodm1hLCB2bWFkZHIpOw0KPiArCQlyYWRpeF9fZmx1c2hfdGxiX3BhZ2Uo
dm1hLCB2bWFkZHIpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hf
YWxsX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQ==
