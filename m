Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 147655AB503
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 17:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK1sw05FWz3bbP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 01:24:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oeF2/0Bj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.58; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oeF2/0Bj;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120058.outbound.protection.outlook.com [40.107.12.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK1s33Tc8z2xvr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 01:23:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWs9j9pSKNgEQJcnKpCFr29LTA6NLe5JjPWnupk4YGtwcjSG1OVeQMK/BvrsVmOc16EzpATKT9Z8vDwfZmLVYsFuXe+iK/TFN7PmwE5199FASUV7xOif45cHap9eeJYDafgmzYbzkEcDY2Pkc6AagFL5GIazOn0tRDCCJevkKM+BogvsISqztJE+525mOKXxtjmyq6ruUNMSh6exHewunCIDDFO4R84qV3f0rxBeK8pUJz7OrF5FzwzreChBQV+X2gH2EHRI5e3xiOMFobtzjx5OGSEMvvP6qhY7iwqsoSt9qwC2wcIPbYpgJAtqCwFqKhcwTqYT2VLf6XbzzmbomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdYjzPUTFLXCqiA2avJ6a6TVEkFwr0iAR0/DEKi7H2M=;
 b=EgWX5HRBgyrk0DQGP55PT+LNUIggUCcMCZzw/xhXuKRyt46k7Evy/l8CXCcj4+YmtDK7Bwnj2rAh79EB8Bxxf59hsm8lW0/paqIbPCqG3lW+Hea4s2RCo8LiONXgVQVOyr0jtZe1vFvszBYXsJ8cGvqDkAVjEeinysvLIfCBeluJHDhK9gFp4JzlX3tu7ri9S4wHqkxzGN67SKlpE2y9KZFKDJp4aFC5cpbx1RC1gxevOpZe18WUuN61kOiqO6jIpxTWHBfqbfO5//jlpHuC6bpESBUWwNa7sq0N0eYeZng10U6uG2G7QsH0L9Urh/jxgRxA9YjjXkWDZKCwncpWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdYjzPUTFLXCqiA2avJ6a6TVEkFwr0iAR0/DEKi7H2M=;
 b=oeF2/0Bj4+PIhu/7d8lUsI5nmkLIoV5KmQdkqHS0YzREmlgH8gNe9ppx48W8xc0X3JL9l/cXEOWMFG6GBWWnyZuCSR7gACXr3kGpp0Tz9TLHmyIY0/bw68Q26JLCYoPjOEG4hATK+mWZXCdg2UMqCiBWMk2MKOzfdLdWwEge+sVGPmEYrkH5DO47rcmHZKmXwaPJ9fMMdJvy0TziDDG/kKPDvNH0tdvyjukWnRGUECDhC1O3+pCbni528hR8+frczKT/kyTPh1vcKz18N8mF9LaRIYp6VL5kPtpsl6jwzrlifehHGWtcOe3qLM6iUw5M4luTopPvx3ssSRgezpbLJA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3120.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 15:23:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 15:23:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/vdso: link with -z noexecstack
Thread-Topic: [PATCH] powerpc/vdso: link with -z noexecstack
Thread-Index: AQHYvqGmdAYH/7yRakGyF8s0gZgqza3MQNSAgAABvYA=
Date: Fri, 2 Sep 2022 15:23:14 +0000
Message-ID: <fb0c360d-315c-d678-46ae-110cee52cab7@csgroup.eu>
References:  <24daf2ae379597b8d5dff41e4f7cebdca9db2d9d.1662105421.git.christophe.leroy@csgroup.eu>
 <20220902151659.GN25951@gate.crashing.org>
In-Reply-To: <20220902151659.GN25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c29b28a-04b0-430d-7742-08da8cf70e1d
x-ms-traffictypediagnostic: PAZP264MB3120:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6dznc58xJft2d3zgNaDFvGjaILLRRbw0XcwFNU/TmlRQJ13Q0aTxZY+zLZyupKBgwgqztBYHCy2rrDQ89JKiyJN1YNqsHnW80kaXkLJ7fUe+l3rI6bY2e164w1ptIlKc3ypMF86VYSkzB53sevZ6cCITs3O6d51SS+DEc5OaKd9SujUGyCBhrPrU9IIhjad1lPyJwppNk6At7sQj8t74xAs8jcbm97p3aaCVFEwQvXBX6vw6VKb44UrcQFr8lpZhh7KcZtWCqYc1lZeUHT/vuSJBb5c9i96T+jHgMonhqSE4RTp2V6cFJ8JqsYp9/O5fWxN/8FEzMxTydByOooSNXZWu+bP08LfLQCVu6hv4YQKNphH5UM6BzIPbHsa/uCqLfLwOtjRQWJ824IAJCN0/2iqTUV0c2xz371mqd7Ell6hDq+a+2zzB/ST8n+novKBrkM0DJlYOLrgAZBGPePRGQOrnEbmGMisPdu90mtMR1fN6yWfGbfOWysnz1AypeorCB2hoxyhXLVYI4aGbzEPWwH6+gvdvIr1rBty3s7s/rLzNR3podiCbuOUr5oj/ZIJiGOvEM4Kc1+gZEHVZVn8NYlr0L+vwTrWz1zF0urfn49Kn7teNtQHFTEDyAD53H0fpnFNcTNSkI5uExCQDRx6HONkKicYtWoaYPC0VP0fNac0VegU0UuHzaN9/Iw3TG6I0/uxHNN/bDpBG5Z0bzQnZlN0Rx0B5CPszl/KOm3eFKmCbJjE4AfbwVY1trosQrsZWduLgtgVPanO8dhakuC0oJFVI94XR0xf1dJ3X7YPqjqyJwinwXBO8qmlIUoqsfj5Cdu6yyxeeMoOe9/GfEK0LBQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(376002)(136003)(366004)(346002)(4744005)(44832011)(86362001)(5660300002)(41300700001)(8936002)(38100700002)(8676002)(4326008)(186003)(83380400001)(38070700005)(2616005)(6512007)(26005)(6506007)(31696002)(2906002)(316002)(478600001)(122000001)(36756003)(71200400001)(54906003)(6916009)(31686004)(6486002)(66446008)(91956017)(66946007)(76116006)(64756008)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZE8vNERRdm9ncm9XR0t2TlI3dC9odGJxelBqcThjdCs2K1RENlVubkt4QUNQ?=
 =?utf-8?B?Mnl3ZmpOeVJjeDl1aW9oVzIvLzRmd3pjb2xQblRCTGdGbGRWTGdwNUJxdlBF?=
 =?utf-8?B?SnJ5NkpJWHBib0dGQUx1c3Q3NENteDh4U0VqMStjaDRDY3pZR2kzTkpVNkRQ?=
 =?utf-8?B?M0NQQ05rMm8yeGk1UmZuMHZjMzN0UzB6c0o3amFzU3RPS09GVEZKbU5yMzlT?=
 =?utf-8?B?dHFaclMrR1ZibllVUEhOU3VFMGtDM0V4ZTJGRnRiSnF5VVRTVXgrSVZCREtl?=
 =?utf-8?B?OGZTQTZINmtPYzZPa0s2REFSQXkwak04ek50aHFKems1Z3NQUFFFQTFOeGFD?=
 =?utf-8?B?Wmt1SVdRNEsxVW1CSmdyWkg3NDZDRGtKNm43c2YzN04yclFQQ0hRSlk2ZVRR?=
 =?utf-8?B?WDlLZmFlK25tWC9uOWhmOWU3M1NMazRBZ3ZHckJhLzloZjZNYlFpcHcyVE9P?=
 =?utf-8?B?NnRZcmZvVzQ5RTludVpacGMxYlpNMDZBYWpzeGhDamhybjJiUjg4cDRsaHhF?=
 =?utf-8?B?Z2FRTXMzYlROV2dXaFM1NENTS21RK0VtS2VxRXl1emNsN25NRm1mTzJ2VzVZ?=
 =?utf-8?B?RUg3K0UvTXlwczd0OVBocHRwT0VDZWozRmU3TEcxRFJERGxXcFRHbXoxOFd4?=
 =?utf-8?B?bm5kTEV5ZFJqTjVEK21kTU80cUl6S1d5RSt6MlJnQW5HNUo2M2dRYTZBT08y?=
 =?utf-8?B?NGZ3eGs4Q3RUaUUyRUcxcjUyUGZidjREaHpUbjJITDVYZmx2SEVEUXplamFp?=
 =?utf-8?B?MFMyb2JyK1JqTm1ZM3pBREpvNXdaekhpTTh6dGt2TE5TL2xVenZXcEZQSStS?=
 =?utf-8?B?dEhNMXdtZHd0d0RVaGxKL2U2SWFFaUJpcE1sUWVFK2JJNlZ0N2QvN1RPOEY2?=
 =?utf-8?B?MGZyZ3FLQjRTQ085UGM5NlNCSGU1WkpzbE1JZkFmUDBuYndjbHFPdjJTWkla?=
 =?utf-8?B?cGdNQ2ttWDRrK29iU1hIMFlIUUlZMkRRZFR2Tnk2T2NWUTk2bGRYLzgxVXBh?=
 =?utf-8?B?SEVKc1pUYkhjZlM2aWlTa2gxRWxKK1ZFdDdUQ0NZN0YvUFFHNXlYQmd6aGRS?=
 =?utf-8?B?N2l6UUE4ZUk5Rjc4dHRhd20ycDhZWHZMM0VSOTFFOGJQNElHY2pQTmVudHNh?=
 =?utf-8?B?YVlOS1ovRFdYaDVGcWpMTWNGUHVwRXFZTmRvOEhrSVJsZ0JOUlNsZXlqVWc3?=
 =?utf-8?B?amlqcHpnZ0JSamtqallFSUNyRmRFTWlHUjR2V3ZFUStLNTBOd2VVMjFpY291?=
 =?utf-8?B?QVlQRkdTeVhBZnlRMU1zbWdtRUNlWlNGdERRdUc2S1huSUkwYzQyVXFQRjBL?=
 =?utf-8?B?UUJNbkVROThzRm5sSWN6dVEwWVBPRnZkU2I0ZFprWlVXU0JKdk1nYUllTG9E?=
 =?utf-8?B?TnpBd0xGcmkwQ1MyRzJBSmEyR3plVDIwdmRMdUs3ZWczL3BFdUU2WEVsSzlD?=
 =?utf-8?B?VGdhVnFNUWNuMExzSllyS2lRSGl6SHNCM3ZyalkxN1Y2MzdHTWwveW92b21R?=
 =?utf-8?B?bkwrcjFGWHBPSHFiWndkdEsrRmtUd2k5QStuS0RlOGFFTDFqbTkwblY0MjdR?=
 =?utf-8?B?TFBwYzBhN3hwaGZnM1RRVWh2OW5qc0c0RFNqcklzZHNhd3JYK3lVaWtsR0ww?=
 =?utf-8?B?WEgzTDZYTlpNT2tzNHc5eXN0emM4SHphOUtUa2VXQmNadzFRTkF6aUVWRUk1?=
 =?utf-8?B?WlpxVFE5bUdOQWFxRDl3UzJYVTkwNThTMG5QTlhzbEFuUHJVOURSdzVZM243?=
 =?utf-8?B?eXYzbFluQUk5eXpUL2Z5eGtwVUJQOTBKc3BTenM3MGFTYkQyZ1g4bmhNb0Fy?=
 =?utf-8?B?THg0Y2VQTlNSRWpRRDhKcGdSamJHVDlYdktFVG5CVWNIM2NVbUI5UTRVMHNV?=
 =?utf-8?B?V2hETXFmc1lWclJiTlVyVnhqZVd4R1Z6dHcxTGl3Sm1lemNEVDAvMFE1SVNu?=
 =?utf-8?B?VWVPVitsT2tIUURhM1pYTkM2Q0pSYXc1Nk12dXpKMi9JSmwxWm16Z0hmZFZx?=
 =?utf-8?B?bEdNOFBMV3NtSG5mdlZsYTNjb2hOYmZLWDRtZVZ3UjlCaU9id0hBZmR3dUtk?=
 =?utf-8?B?TTdKbVREUHJhVm5RQVF1WUowL3BIYndxcFFOVjhHZVFlSFVaWnM1NWNPN3Vw?=
 =?utf-8?B?NG12MkE0QkdKL3R5TWlqbHNhaFZhV3ZLbFE1cHM0NkNDK0dLWUpkOFNRbHYy?=
 =?utf-8?Q?Q3AWTBmPFmgk0X0nA0eqdNo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C00DEC06EAC0E445B6D944CB8F9301DB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c29b28a-04b0-430d-7742-08da8cf70e1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 15:23:14.7501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkZY+3Kyzo1qiYgay2pFFk8Ik/tCOTmRxK6MAGlEpABFALLupKZmXI/jfaEtIHz3d8ggXE96aLUl3f8nZ+MsDt2R2l5QfcCXnZ5zAcS413g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3120
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzA5LzIwMjIgw6AgMTc6MTYsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBIaSENCj4gDQo+IE9uIEZyaSwgU2VwIDAyLCAyMDIyIGF0IDA5OjU3OjA5QU0gKzAyMDAs
IENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL01h
a2VmaWxlDQo+PiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlDQo+PiBAQCAtMTI4
LDcgKzEyOCw4IEBAIGV4dHJhLXkJCQkJKz0gdm1saW51eC5sZHMNCj4+ICAgDQo+PiAgIG9iai0k
KENPTkZJR19SRUxPQ0FUQUJMRSkJKz0gcmVsb2NfJChCSVRTKS5vDQo+PiAgIA0KPj4gLW9iai0k
KENPTkZJR19QUEMzMikJCSs9IGVudHJ5XzMyLm8gc2V0dXBfMzIubyBlYXJseV8zMi5vIHN0YXRp
Y19jYWxsLm8NCj4+ICtvYmotJChDT05GSUdfUFBDMzIpCQkrPSBlbnRyeV8zMi5vIHNldHVwXzMy
Lm8gZWFybHlfMzIubw0KPj4gK29iai0kKENPTkZJR19IQVZFX1NUQVRJQ19DQUxMKQkrPSBzdGF0
aWNfY2FsbC5vDQo+IA0KPiBEaWQgeW91IHdhbnQgdG8gY29tbWl0IHRoaXMgcGFydD8gIFRoZSBj
b21taXQgbWVzc2FnZSBkb2Vzbid0IG1lbnRpb24gaXQuDQo+IA0KPiANCg0KT29wcy4gTm8gSSBk
aWRuJ3QsIHRoYW5rcyBmb3Igc2VlaW5nIGl0Lg==
