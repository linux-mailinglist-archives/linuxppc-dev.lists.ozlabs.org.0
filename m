Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEB4539EAC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 09:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCh6Z2G5Gz3bwp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 17:46:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60b; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCh626mHYz305D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 17:46:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huUEgoUDUPp+zw/R5WHj3wGRWL2fccB6QZzeD6Kp5EUXI85hoI4qTTo5bVNzEkxTYZS2jhOXIEm+A/H4vsaf6Q6RqGp4fVi6V3H8G5h/8rhw7MxI9DOXAek27vn1DI/iVTwmpGeW1q4Ny/VdksP3Mx7bI31M6SwWdJZONUGZdedQk2oZuyUYvjitAT2ZQYdxcWCrAI2m8hZg/FPxhRv9Rm1+SZVqNOJwOPsJ4bG/8jmU3SoRknDYI5jFAbr2bDETZqtlPcOhdJMvKmicU+KHEHGdFGLPuozlc2bIVM3xFGUlJvuK41ff3joWYfy03GPDuCgrncbl9jxLtgiaUzd61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nETiYgYfv6TsdE41CihnbhZwbNtJPa4WlofCzH4YHnY=;
 b=fnSu+SMJiStuEWJUSpZo89y8MzO3X5HDXM/AUxmyC5HsrzHhEkV/HeQemoHN7gWAxoDUha0sJa2zauZiiCJBfaSOz4dkRtKf17+jdWfskt7rj2O7hTZKm+rNq3dFnoYD5w0D1pBZqQje7I/bKKliiKZ1dxCdq97jIevAcQzn1Fuf1iB1iCgK3Yurd7RBgN8by7fX/+TiRjsaH/Mn0MisgRzslwzyUxYXUJ+IY3r8IZtifSLwcH0m9N6cKz89ThGRC7SZyxmSSW7nLCRzlYqTG5ml19C2fwje8BhgC0DL1tl7518eh0T1ELOROguzyp9xpVh7BA64T0Mtlz5PrGUV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1557.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 07:45:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 07:45:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
Thread-Topic: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
Thread-Index: AQHYdXtpaW8/+lAeO0S/NXN9LWGx5606LDYA
Date: Wed, 1 Jun 2022 07:45:40 +0000
Message-ID: <983c169f-0188-b032-0554-468362837505@csgroup.eu>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
In-Reply-To: <20220601054850.250287-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8afc1f9b-e5aa-4225-ee72-08da43a2b9f2
x-ms-traffictypediagnostic: MRZP264MB1557:EE_
x-microsoft-antispam-prvs:  <MRZP264MB15574023E38C9F94CC425F08EDDF9@MRZP264MB1557.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pprqgFWx509jdkbfmzE3lsn3n1S6NLLnREdWfclBOifPw8iO+xetP6Biesm+WlR3gEjoZRWIAT0gvoEd8DFu3ETgAiIWOqdOQfpXn6Q3oqr9DFDVwnNeXav2cbpO6G38F7OQujoLELWDv+yrtJK2cDH6rpNSRKhU7DoUGPVt5muNf1hdAJnQwENsQPtUQOa0wFRFzLDtpzVxBoT2NdjDiPhREin5JWlwvWmhfR6GV+n0jpNZOHWt/90eUK14pflJmEyGL9/a6xtjm5GhCW+N7CWGhLflTykT93eA7mTS9Lfnf/0u/wQmETFMQCvI9mZR9CHUvibQ1+eo7vauFdPtCkqB3JvABkf4k7hJrNtxr/NcIu8PaKUOffpyZDNzJT9xMviUrcEWt5nvBZ8oC2MxFY1lAYjs7RSdhXvDy5kz5xZI40rYNpgNIk+vWR/ZTSZVxDIzFrx7RA65lyx7nTAHqfOXU/AI5H5SOUnPhZy4KhLBoBV3184y4WzM11u25XOTHhMcR9NjtbV93dLz54ibSbAg57wMBra/Vt4WtGZ0L5g0fYp2Qtea1D8Y7B5wndIYUje9OmwMvY5BFFqPKQzTV0VVSd4gmHy8PqOgavt6JujTO1+9NrwBudiw6hurXCSLyaE/hRNG0zBF4oZgbDhoiBX2gj2sJDD4AfwceeyImZx1jRcqI5Xrau22hUkFbV6hlGz6obBryVf9ArjCtXVV6oqwsDDwV423JhBJX7nFcOCfhjSF4y1KNRVUmq9MqTf/C84Sho6bzgq7Ra9NUSTNVQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(91956017)(36756003)(31686004)(4326008)(64756008)(8676002)(38100700002)(316002)(110136005)(31696002)(122000001)(66556008)(86362001)(66946007)(66476007)(66446008)(38070700005)(26005)(508600001)(66574015)(186003)(2616005)(6506007)(5660300002)(71200400001)(2906002)(6486002)(44832011)(8936002)(966005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c0FRMk9DV3hlZkFwSEVSRHlWTU50U0JPWEtDZFR1YUJpb1dVUGxtSVZrcE5G?=
 =?utf-8?B?TmRFQStNRzY5ZTY4bHoxSXdzVE9JS3pVMUdoeWtZVG5TeDhWZytRTlpHc1I0?=
 =?utf-8?B?QndBTkRmYUVrWE5scXUveXVwcWlXRDc3UGs0d1hMVVhzZkEvRllhSVI3Y0Rt?=
 =?utf-8?B?UWgrYVZWOS9oNWwzT3c4T0NadXg2Q0NUbk5INWdINnl3WU5mRHhvS3FqMFV5?=
 =?utf-8?B?eTdXaUtiRVowb1RlOWF5djQ4eTNOeXFqUFN6WCtlVUgyaGJSZ0RJL1FYc1N3?=
 =?utf-8?B?eVlhdkZVeEtLekhXY0VrUzE0VDlla1lCNlUxbFZycTEwb2tSU1pXSGVPVzdj?=
 =?utf-8?B?UkpJdjdxc1U4bDNDN0dzT3ZudXM3dVZ5MHZsTlptN01SOW5tcGxUTnF4Wllj?=
 =?utf-8?B?QnFkQXZMQlk0WHR0MU1XUms2Lzc3SEhteTdqdnFIYklDcnREeis5Y0pqT1Bl?=
 =?utf-8?B?dE5odkswbi9kcWFiOGVTTnJ3eXlWZkovSHV0dDZlb3Y2VkhqdUNWVmdqbFB1?=
 =?utf-8?B?UmtrUEtKVkkzSzByTHY1WTZZYkJkczNaYkpYQUt1TkRiY1M5elZWNVlQUktN?=
 =?utf-8?B?T05DdUJKY1JTbmJtRG80LzJzZFVOYTJtREN2cTlqUGpsSU91UXptcGg4SXJ5?=
 =?utf-8?B?RDlSL01MbVdGeHFtbk13YWU2R0w1alk5NWYwVTdGNUVVTHloVE0ya0pLQUlL?=
 =?utf-8?B?Q2dSdUMrQ1V5WXkxbHBnTUZzeUJlU1pwdVFETzJkMmEvVDFIRmJXcWRFeUJ5?=
 =?utf-8?B?R3BLcU9taHUrdXhoRGZHVkZZT2lWMjRhVDNScEhjVHpDWVRNcnZJQjBrWW1E?=
 =?utf-8?B?MnU2WmVJRGtYSzRFVCtVS0RkcW15TGphYy94UVhzVEJpUkpOMVQ1RFQvakJW?=
 =?utf-8?B?SXM2ZGU4b016MmF2bmx0cUhiRTVkU1FYR2pTbVV0RHhMZFpDdG9lRG5ITEZO?=
 =?utf-8?B?MjZ6L2dSYTluTS82TzR3R0ZodFRybkVybW5MZ1p4eEVFMTVnVkhxYUZHVmlv?=
 =?utf-8?B?OTRnbHJabkk4eW5RSE1SMDFoZkdaNUtrUlc1YWpRa1hrNDllbEVlVmRMQ2g5?=
 =?utf-8?B?SWo0WURZV0hINlFkQ1BDWjhsbjRjcFFtWm1nY1hxdHlqSjEwVERXaGs1MkEy?=
 =?utf-8?B?VXVZL2lhamt2aGwzRVNOMjVBdFpPOWI1cjA0UnZGd3M2b2VvMys2eG0zNHhK?=
 =?utf-8?B?aE9yaEp4TzdaWkJtY0tOb3dsZHl1bjdKY1RsZ3YvT1RYbTJBb0phTHB2TnhO?=
 =?utf-8?B?UHM4U2prVTJ3Z0xGWTJYVG9UR00ySGtwVWhWdXE2cTI4ZXZ6d2FhYXVDbUNj?=
 =?utf-8?B?MUlpSWdwN25HNlV0U1l3UG5tUCtoell1Z3NOTHYyVmtkMlNjWVZ1T1dWN1dI?=
 =?utf-8?B?T2crUHRyQlh4TFZtbjY3b1R4N21xRUlsWUpveFZ4R291bEtyMGxaWTJvQmoy?=
 =?utf-8?B?ME1Id0Fnd3pidmpjSDZsc1A4V3BjRXhTTnZyRkNjWHZhMVpxRzFKZWd1cm1Y?=
 =?utf-8?B?ZGlORHNkc3BaQm1TZ2cyclBxYWQyeHMwdEJCeXN3OVVUM0psalkyazNoZjZ3?=
 =?utf-8?B?Ly9RUjRXL0ZPVFFtdHN2NjVucGhqbnFRYzRkSzNNR2hYQzM2YXE5b25HcFZH?=
 =?utf-8?B?NTN6KzV1eVdpYm55bVBmTk1LdjJ4RWhxczdhMzV4VmZEZGxOZmFFQXZrVEdV?=
 =?utf-8?B?YndOSUordVBzL2JlYmxyMG5xeVc4VDZqTHhKeVVmY2RHaXo4YVR6T0RlcXBC?=
 =?utf-8?B?M0Y1dC9HY2hVL1M0eWlOWm16TEtRN3hmK0EzQVorVmpNUHRuSWxZWDROZW1B?=
 =?utf-8?B?UkRMeVNvOEtZRHZHWGtSb1FnZENjc2lKUkMxaTFmZlBrWG4zSFZCWTVKS0Zv?=
 =?utf-8?B?eHMxbkVUUG02Rkp4NG5VRjZ3Q3djTGtXVFZvL1AyT1IxUkFxakpJVVVMakh0?=
 =?utf-8?B?WGpRK1VQdE1vd1JCVXZPakJBLzByUUxCVEZZYzZoK21UQnJXWS8zNjNlRmFW?=
 =?utf-8?B?T3lBZW5tb3F3bU0rZkNXb0tvRGt0UDArNGFpRXFpNzVhNzJtb3docEZjVEVa?=
 =?utf-8?B?aVpuQU43VnAwdVBrdUoxajNGaFJKWFg2a1NsbkdZMTFqZXlmQlFpeGFCejBP?=
 =?utf-8?B?QnpjME8vNElOdjN1elVOcG54T21oR3hFcGFGMzVINHE1ZW5vUUdmUnFaNkR1?=
 =?utf-8?B?cnZPbDdsOWsrbDlYYUpDM0xCb3hOOVBxU0dLMVZTU2JjVDM1bXFwNDU5UzBr?=
 =?utf-8?B?RWlwNDdVL0xqZm5paDQyVG9CUUwzbEVzODdVaXJFNkFQMkhjVVpObE1hRWd4?=
 =?utf-8?B?cUlsVDFJWDFtelVXNlJsNzJkN3FNb0hjQmw0YXNKNVpFbGx0M3dmWnphenkz?=
 =?utf-8?Q?8siRKScLYE6W/5C/qjnO0r85oCttlB8cZlzmh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65B59D2A62272F43A6C321DA09B422D8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afc1f9b-e5aa-4225-ee72-08da43a2b9f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 07:45:40.9347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2QScZnxyP6cvHpCtfWxZIdvyWtKZ1164XvjXQkU0xk/xjTzRD4Syaj/ZkJcMuVUJJ0ydNu8qMlL/T5lhsVoZK9SxRrP6MgCVtdsHk+l8M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1557
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA2LzIwMjIgw6AgMDc6NDgsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBb
WW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHJtY2x1cmVAbGludXguaWJtLmNvbS4gTGVh
cm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5k
ZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBNYWNyb3MgZm9yIHJlc3RvcmluZyBzYXZpbmcgcmVn
aXN0ZXJzIHRvIGFuZCBmcm9tIHRoZSBzdGFjayBleGlzdC4NCj4gUHJvdmlkZSBhIG1hY3JvIGZv
ciBzaW1wbHkgemVyb2luZyBhIHJhbmdlIG9mIGdwcnMsIG9yIGFuIGluZGl2aWR1YWwNCj4gZ3By
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5j
b20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGNfYXNtLmggfCAxNyAr
KysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGNfYXNtLmgNCj4gaW5kZXggNGRlYTJkOTYzNzM4Li4z
ZmIzN2E5NzY3ZjcgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGNf
YXNtLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaA0KPiBAQCAt
MzMsNiArMzMsMTkgQEANCj4gICAgICAgICAgLmVuZHINCj4gICAuZW5kbQ0KPiANCj4gKy8qDQo+
ICsgKiBTaW1wbGlmaWNhdGlvbiBvZiBPUF9SRUdTLCBmb3IgYW4gYXJiaXRyYXJ5IHJpZ2h0IGhh
bmQgb3BlcmFuZC4NCj4gKyAqDQo+ICsgKiAgIG9wICByZWcsIHJocw0KDQpZb3UgY2FsbCBpdCAi
QklOT1AiIGJ1dCBpdCBpcyByYXJlIHRvIGhhdmUgYSBiaW5hcnkgb3BlcmF0aW9uIHdpdGggb25s
eSANCnR3byBvcGVyYW5kcy4gQW5vdGhlciBuYW1lIGNvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGUg
Pw0KT3Iga2VlcCBpdCBhcyBCSU5PUCBpZiB5b3Ugc2VlIGFub3RoZXIgZnV0dXJlIHVzZSA/IElu
IHRoYXQgY2FzZSBoYXZlIA0KdGhlIDMgb3BlcmFuZHMsIHRoZW4gJ2xpIHIsIDAnIGlzIHNhbWUg
YXMgJ2FkZGkgciwgMCwgMCcNCg0KPiArICovDQo+ICsubWFjcm8gQklOT1BfUkVHUyBvcCwgcmhz
LCBzdGFydCwgZW5kDQo+ICsgICAgICAgLkxyZWc9XHN0YXJ0DQo+ICsgICAgICAgLnJlcHQgKFxl
bmQgLSBcc3RhcnQgKyAxKQ0KPiArICAgICAgIFxvcCAuTHJlZywgXHJocw0KPiArICAgICAgIC5M
cmVnPS5McmVnKzENCj4gKyAgICAgICAuZW5kcg0KPiArLmVuZG0NCj4gKw0KPiAgIC8qDQo+ICAg
ICogTWFjcm9zIGZvciBzdG9yaW5nIHJlZ2lzdGVycyBpbnRvIGFuZCBsb2FkaW5nIHJlZ2lzdGVy
cyBmcm9tDQo+ICAgICogZXhjZXB0aW9uIGZyYW1lcy4NCj4gQEAgLTQ5LDYgKzYyLDEwIEBADQo+
ICAgI2RlZmluZSBSRVNUX05WR1BSUyhiYXNlKSAgICAgICAgICAgICAgUkVTVF9HUFJTKDEzLCAz
MSwgYmFzZSkNCj4gICAjZW5kaWYNCj4gDQo+ICsjZGVmaW5lIFpFUk9fR1BSUyhzdGFydCwgZW5k
KSAgICAgICAgICBCSU5PUF9SRUdTIGxpLCAwLCBzdGFydCwgZW5kDQo+ICsjZGVmaW5lIFpFUk9f
TlZHUFJTKCkgICAgICAgICAgICAgICAgICBaRVJPX0dQUlMoMTQsIDMxKQ0KPiArI2RlZmluZSBa
RVJPX0dQUihuKSAgICAgICAgICAgICAgICAgICAgWkVST19HUFJTKG4sIG4pDQoNCk1heWJlIGl0
IHdvdWxkIGJlIG1vcmUgZXhwbGljaXQgdG8gdXNlIFpFUk9JWkVfDQoNCj4gKw0KPiAgICNkZWZp
bmUgU0FWRV9HUFIobiwgYmFzZSkgICAgICAgICAgICAgIFNBVkVfR1BSUyhuLCBuLCBiYXNlKQ0K
PiAgICNkZWZpbmUgUkVTVF9HUFIobiwgYmFzZSkgICAgICAgICAgICAgIFJFU1RfR1BSUyhuLCBu
LCBiYXNlKQ0KPiANCj4gLS0NCj4gMi4zNC4xDQo+IA==
