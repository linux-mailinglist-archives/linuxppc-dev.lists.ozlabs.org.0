Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32F502701
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 10:45:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfqfB0ZSCz3bpb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 18:45:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::625;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::625])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfqdj1t13z2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 18:44:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWweWPiH/1t9ynt24x9uzgMU6uAXjiw8VaY9an8WGHtJ3khgIBVdzR8I6D5ixQYrxaOI/5+oACl8VWLYZXo42MHdT9CcZQdLulY7ZjFDzjw7tpME1yv95AXtTNNznsevarHmANDgkaBf5q4LZw7dIv3cW6jez10IZaUNqZhhj6vwx9sO8QP3oF4+FYSI6fVOKazYYEQH+12cjS72JH3VqbG/uNNbVLya8hy+Up6VASsqyYBMwA36eWTzWCgDjknx7HU5esN99/QSilo5dXOgO2ExOEqoy292JLl/wY20u0gdmL7PqCWq3IhgnHZGTpbVdlK1JjORKDN2uUyrAZarlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8kFsgUu4cVjAG4rv5AGwSTR+QiMymW9FOHbUo6wYD8=;
 b=m5EPmC2cc9BCXjEn9/6/qCO6M/cuazwo2dDuTRwOgH5Psd919qahk8PjPudsqdw3hMjma1st83Ide4OuXUQtRLjJw0OUOQOGJOO2lKaU/DzE1C53r1yo41q0fex1o+LR2hYE6IMD7TyvG6JvgOUDsge8/5MtxY2EsS3/UB1HFOsM8fP9YNjWLt2D+T2DiOOX/D5z3Xk3K09HlfyeitPHhv75kE2wMvK7UjZsfOc0e7O47fPHaEaXrLYqUhDl1/xzdqAlM8QsvGcPL7dEax1PBM5Xxn5XQ4tGNiQnSglflD9alo6YXY3Fy12lWW2jmmyqyJrBYifktn9PMRWGnkQTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3979.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19; Fri, 15 Apr
 2022 08:44:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%8]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 08:44:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH] char: tpm: Prepare cleanup of powerpc's asm/prom.h
Thread-Topic: [PATCH] char: tpm: Prepare cleanup of powerpc's asm/prom.h
Thread-Index: AQHYRnyPmVmA6k9gx0GBUBIR5LWLY6zd/KOAgBLAcwA=
Date: Fri, 15 Apr 2022 08:44:35 +0000
Message-ID: <c30543a2-b1dc-4e83-489e-0f8cad34a3ae@csgroup.eu>
References: <7a522d9029737d7a1fb513529659321ed62d50d9.1648895070.git.christophe.leroy@csgroup.eu>
 <cfd3a718e147b39620dfa7c779a7ae1af2f6b575.1648895074.git.christophe.leroy@csgroup.eu>
 <Ykl1ibvVxJUBrhfK@kernel.org>
In-Reply-To: <Ykl1ibvVxJUBrhfK@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ce7019b-18d8-4802-197b-08da1ebc2b37
x-ms-traffictypediagnostic: PR0P264MB3979:EE_
x-microsoft-antispam-prvs: <PR0P264MB39795CEF8DF0FF08E718BD40EDEE9@PR0P264MB3979.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 86hEiCekvxnxR/42Pg76hxqFQOZ27pS1t++Z30nxFOIh7HNbrnB8d7/iI31Adhxsbl/p7S9lnMXPQYR6toY7oPfIYRlBuz8B5UQGjdUCgGFqLXZjrKLRZb+k58M0+FmQxvP48ep4/aDP1obCzcQGLYgEK2COMEb1qzDG7k0viHer07TDUyj3kY61NCJayHOk7YxXxIsxjQzAyjQd+nXWcKCPYO9iPGzgqIMSMQpd36uEe4lmUb3w3dZc77Q5xnVAF+49ALEYuUIdtQRvynlQue2j03O2tThirGUnLSO1yiOMMSzGd6g//qawzIRzj8bN22OfL7udkRwCMaHn4cP8yLfuviZ5XycNdK6k+K0fCkfShj1fxXYvdIAr4stzgTUZMf7t3H9N3ApU4EOrdFaJPq/AR8MZhpopddUZ0WVhYP0v0w+tfaVm0FbrmOuaSQZLKNCCD59GfDFZ75wvgj31N+aQIkhPXpmDq+Ondqa5waXgvfQvO5IenQLKCR4ePJyOAcwWV3fc7K/YUckNvZDH4kxGkgqFpWz6y5EMR4vsV7BY0XsYjVsk2T/HBIEHnSkUoCm1Cdd5oPpJAs7wZVo5ThpY4GvxC4dXkJnh9458PIOYuZrY87SWOWJmZEiBcyTkSCx0O5WNs/0+wYGZ8XBGLm2zDpe0Q0bCvl+DtCowLcM+wnyWrcvcSObpi8FQK896EAJ3mWAOtvO2McN/lN3JMKaYESn+1LQbfcQlR4KUWiuh+ZGRJjg3ngIkyuqqcxU3I3IsRbZQ9Do5wt17EF4cwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(36756003)(38070700005)(38100700002)(31696002)(91956017)(6512007)(8676002)(8936002)(64756008)(66574015)(7416002)(44832011)(76116006)(122000001)(86362001)(54906003)(26005)(186003)(66556008)(83380400001)(66446008)(6916009)(66946007)(31686004)(66476007)(5660300002)(2906002)(2616005)(6486002)(508600001)(6506007)(4326008)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejZEN1pyM1JGMk5DVXNJUHdVbDBmY2QzZTU3dnVpQUlET2wzSElhL0dhZ09D?=
 =?utf-8?B?cCsrTllDM3ZhdmVsOUg5bG5TaFdzenMxSDBXOXlXYncxQVpDbUx0OHd2bnZI?=
 =?utf-8?B?VFlTaTVMeFFWRzNKNDhNc1pwcVRJekFQU3FPVEpCMUoxckkrY3Q3QTRzaU84?=
 =?utf-8?B?RE9vcndtRGErdzI3WjZNYldLVytPWVhOS2Q4U3lndzFBUU9BU1lCVFd3Sjdr?=
 =?utf-8?B?R1ZGUFUxRFQ1TllJUkRadU8wTloxeUtGTlhGaEJMc05ERTNBbGMxTDV1NUh6?=
 =?utf-8?B?dFhnUkpITC9jTHd3akpKQWxjeFpQVDMzU3VGUm1rR2I2SFpYdU4vMHBNdEly?=
 =?utf-8?B?L2hWYW54alVnVlFacHNHYmdiTm9jZ2tCWWp4OFFZdVJSb3o1d01IREpLaHl2?=
 =?utf-8?B?ZkVTYXVreHhsblJSVEFudHl1dFdMMGJHWCt2L2sweTdDd3RMd3FBTy9jalZV?=
 =?utf-8?B?cEk5MUFEOFZjZE42aTdvYVdSMXVJQlFjcVRrQkdWR2ZyU0NCbURXYUw1V01F?=
 =?utf-8?B?TnlVL1J0TDRwRHBkTmJHQ2sxRU90Wk83cTZMSXM2Skc5SkZxZ1NkbEZYNHJk?=
 =?utf-8?B?Vm45RDVrWVRjeWsvWVN0UnpadDJkL0FqT0lQQTVTYnN2YkpxOENvTDVaVTE0?=
 =?utf-8?B?dmZRSHRuYWt1aytnZnc2RDRKV01pTHNGbjJ3K0hsbUFWdS9Lc21FT21GY296?=
 =?utf-8?B?bFhLVngvTm5lMTVTcWZuN2k1UlRxQUdSLzJpdlZrWDdUU29tcFYrWjArVlU0?=
 =?utf-8?B?Tkl6QUM5ZW9CMzNyYzhhclNyKzVpdGFRNHpKdzNHM0V2MnAydW1LU3N1UWlI?=
 =?utf-8?B?R1NmNzd5dXF5cXlFYy92cU9KMEhLbkFKSXRiY2pPbGo2aWRMbDMvVExDbVZZ?=
 =?utf-8?B?Yi8wdWVHQU5NaHE5bjlOWXVMK3N0VUpHdnlxTElVcnAyV25NVUtOdnBnWFhM?=
 =?utf-8?B?R0xMbW95S1c5cHVQM0pKdGY2WEdnVy81RTZVL01Cd1BEUUdLWGhyZXI2OXRp?=
 =?utf-8?B?d3hXM1diZGl3VU8veXFFRFp1Tm53MHdHZjZZdGdodU9vU1d1cGk1Ri8yRi8v?=
 =?utf-8?B?MlJ0T0pYZ1hIWmFUc2lBN0QzNzl0RnRTcEMvY3FmVXBzaWNyL0c2THM5SkNY?=
 =?utf-8?B?ZDZPaWUxbnhLSUh2ZkRLM3RJZXRDU1lBektMb2JVTTlzTEZHbjJFQlU5Y1Vw?=
 =?utf-8?B?V2JUS0dDNEJvcGxndVBBR1paTTI4RTJ4VjVvYUJyQ0JxbHB0cFdudVBEMVFy?=
 =?utf-8?B?dGVKWVBxMWhCWHhuWVFsMkV3ZlZBWmZEZG96TFNJeUZUZTlueFYzS1Z1R3NC?=
 =?utf-8?B?ZXAyNkdBSnRBRmd0ZHBKZEpjcFdrekM1cWJLbER4L1J5amNZVm81N0JUVXRp?=
 =?utf-8?B?VjF0K0NISFFETzNLSWtKeVZCVXAxc2t1SFRIdWpGdlhNc254Q3ErRE55WUhC?=
 =?utf-8?B?Z1FlQUFZSDNER1dNQVdMQ0N5K3BPOUJNTHc4MEtkc3NGa24ybHh5bVNVRWUv?=
 =?utf-8?B?NjhNWnVKSlhVYTVHTmVyeW44dXJIZlU4bUlvRVFjWlBscGd1T1NBR1Vmb1ZZ?=
 =?utf-8?B?MUQwaFdxZHgyNTM1NGo4MHdVeldpOFhnTjZmZStldnFCNjJscFdGUWt2b05K?=
 =?utf-8?B?TTFHbEMvdDV6ckxmanR4Q0dLU1ZGNmpZWlY4RStzcTlHQnFybWtoSHNTQXkz?=
 =?utf-8?B?cER1cVlQbmo3ejlZalJ6NUpIa01oejhSajlRQU1YL2pmQXN2VkY4UUlCc1hi?=
 =?utf-8?B?TDNTREhZYk1FTVBkTjQvWXV3Qi9aVGpiMTNYVjlUOTA5aFBOTVRyaHhFMjZ3?=
 =?utf-8?B?Y1daVC9OcW5YbjlJN0xzV2h2Y3llcW9lM3hnamF4RC9kMGQ1dlVQemp2cDVj?=
 =?utf-8?B?WnBzTVVuclA3V2dibU4xRmFXK3lTZkZFUHhsSmF3a2tUZkFDZTEwY3ZWUVk3?=
 =?utf-8?B?UkU0UnYrOUp3OEdWSHBuZzJNdWZCWWJvZkt4TTJMWXppdTFLV0NJaUN5T1Ax?=
 =?utf-8?B?ci9zL2M1MmgydDRLUkNvcmRYWnpCV0duRW45aUJCUmd3VXJsWnpBZU5TejJw?=
 =?utf-8?B?T3VyakZnYjhsWDRxTmtBUHVjK25ibkQ4bTgrd2pnajAvWGJpelBRaTVNRGhn?=
 =?utf-8?B?R2dzWVBKZEhVSE0zdmdLMzQ0bGFFYWpNSU5FRjhabmNpcGFCZmxTVUFybS8y?=
 =?utf-8?B?WVVHUVRtRUozK1Q5TFNqanhVaEFROE5veUQrQ05QRlRSMGRydWlJaXQ5VWdS?=
 =?utf-8?B?UUlyVlZPTzQrL3BVUU1YeVNncGRtOEVmTVBFajJNaFg4NWNGcTBiS0xQVlNt?=
 =?utf-8?B?ZzFQTU5kQXR6WU53TjZTSytvUzh1V2JGYlY4QXZsMy9EZUJwZzZSNVB5NmNZ?=
 =?utf-8?Q?R4wiBo85UjzqfCRFPUmWQIPdWL9fcZEcWmEvO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D99C53A966635049839AF7201DDAB849@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce7019b-18d8-4802-197b-08da1ebc2b37
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 08:44:35.2969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LlY2wrqHISgYiHoVjZuvXQnsbVt31GYPPlzTTK69ZynIG5WFJZP18pzjgBIXPw0DgMsJv4VVpDZhF1UBD933WVsq/zAqUpMZyiDq0Dl4KZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3979
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA0LzIwMjIgw6AgMTI6MjMsIEphcmtrbyBTYWtraW5lbiBhIMOpY3JpdMKgOg0K
PiBPbiBTYXQsIEFwciAwMiwgMjAyMiBhdCAxMjoyOToxOVBNICswMjAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4gcG93ZXJwYydzIGFzbS9wcm9tLmggYnJpbmdzIHNvbWUgaGVhZGVycyB0
aGF0IGl0IGRvZXNuJ3QNCj4+IG5lZWQgaXRzZWxmLg0KPj4NCj4+IEluIG9yZGVyIHRvIGNsZWFu
IGl0IHVwLCBmaXJzdCBhZGQgbWlzc2luZyBoZWFkZXJzIGluDQo+PiB1c2VycyBvZiBhc20vcHJv
bS5oDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pg0KPiANCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMuIEl0IGNoYW5n
ZXMgbm90aGluZyBhcyBmYXIgYXMga2VybmVsIGlzIGNvbmNlcm5lZC4NCg0KDQpJIHNlbnQgdjIg
d2l0aCBhIG1vcmUgZGV0YWlsZWQgZGVzY3JpcHRpb24uDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0K
DQoNCj4gDQo+PiAtLS0NCj4+ICAgZHJpdmVycy9jaGFyL3RwbS90cG1fYXRtZWwuaCAgIHwgMiAt
LQ0KPj4gICBkcml2ZXJzL2NoYXIvdHBtL3RwbV9pYm12dHBtLmMgfCAxIC0NCj4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2No
YXIvdHBtL3RwbV9hdG1lbC5oIGIvZHJpdmVycy9jaGFyL3RwbS90cG1fYXRtZWwuaA0KPj4gaW5k
ZXggYmEzN2U3N2U4YWYzLi45NTlmN2NjZTgzMDEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2No
YXIvdHBtL3RwbV9hdG1lbC5oDQo+PiArKysgYi9kcml2ZXJzL2NoYXIvdHBtL3RwbV9hdG1lbC5o
DQo+PiBAQCAtMjYsOCArMjYsNiBAQCBzdHJ1Y3QgdHBtX2F0bWVsX3ByaXYgew0KPj4gICANCj4+
ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPj4gICANCj4+IC0jaW5jbHVkZSA8YXNtL3Byb20uaD4N
Cj4+IC0NCj4+ICAgI2RlZmluZSBhdG1lbF9nZXRiKHByaXYsIG9mZnNldCkgcmVhZGIocHJpdi0+
aW9iYXNlICsgb2Zmc2V0KQ0KPj4gICAjZGVmaW5lIGF0bWVsX3B1dGIodmFsLCBwcml2LCBvZmZz
ZXQpIHdyaXRlYih2YWwsIHByaXYtPmlvYmFzZSArIG9mZnNldCkNCj4+ICAgI2RlZmluZSBhdG1l
bF9yZXF1ZXN0X3JlZ2lvbiByZXF1ZXN0X21lbV9yZWdpb24NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2NoYXIvdHBtL3RwbV9pYm12dHBtLmMgYi9kcml2ZXJzL2NoYXIvdHBtL3RwbV9pYm12dHBt
LmMNCj4+IGluZGV4IDNhZjRjMDdhOTM0Mi4uMTE4MGNjZTcwNjdhIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9jaGFyL3RwbS90cG1faWJtdnRwbS5jDQo+PiArKysgYi9kcml2ZXJzL2NoYXIvdHBt
L3RwbV9pYm12dHBtLmMNCj4+IEBAIC0yMCw3ICsyMCw2IEBADQo+PiAgICNpbmNsdWRlIDxsaW51
eC9zcGlubG9jay5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+PiAgICNp
bmNsdWRlIDxsaW51eC93YWl0Lmg+DQo+PiAtI2luY2x1ZGUgPGFzbS9wcm9tLmg+DQo+PiAgIA0K
Pj4gICAjaW5jbHVkZSAidHBtLmgiDQo+PiAgICNpbmNsdWRlICJ0cG1faWJtdnRwbS5oIg0KPj4g
LS0gDQo+PiAyLjM1LjENCj4+DQo+IA0KPiBCUiwgSmFya2tv
