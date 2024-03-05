Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769E87198E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 10:27:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EOzqqZs4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpqvq5bzxz3dVj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 20:27:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EOzqqZs4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpqv51pzyz3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 20:26:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMmQfV4/daU93HiaXH7eWRTJd9wPpmvKcHc5L3p9zWfqs0AJFO1Ra+KNbMR8dDNMcE8aFSV+BeLwfgzLwcGSMAZ3SQ6no7O35cRWW4ueRgMafTkdb4uTD7MrldFfrM+OUYK8hr3/E1B13U5XJZF7IjdiAvZsxiaxYhVdbDunyIgJ4/kVBSwOUpaDlBeUJlB1H4s7tKT6zSu2TZLJ5KN4+g9huriNA+UfwUBDiRD8bZ7o/+vatpLoIYKsbAlnuA/Ij+kJoTRlqbXRuCwkuQfFZzhkqNfPKIYpGx/Ox5+YqWrWIgbBI8xWe3d0lCpLU2TKDf9U63YIdwQoa32m0liq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK0Hh9fNZe7KkArhM+Q4hZDuVhu/mBHxJ3jQV82aHqQ=;
 b=ni7kGkSYkvWNrzYPMCr7QI0GJFQX1E1z/5yLoRRmPxdQVPc64xzVai3fr9ZuGQzRQcq6DTstaN4Yswe+EEvLiMr7wFk/uFLKC6wC10tlhOMGGwuLKRcMXB5P5p7S3aaQFWpafCQyxrp8lLZ6xaKNBG+7tjTMmANhTb+z6WlwvHtIoFUvljfO62gMwlA8FFjZq8X9LXm5wylVB90oOB6AJtnQsx3pDslKbKl5cBIYCmVA9PR+mSYQGL5RuTep760eGE201PY8eKFp4K+sArJW3V1WRgmdkUolBQNdHjB2JUudBzrEiJOgvM6yHoO+rQRmzqBEOt+FvaUm5276FBYe1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK0Hh9fNZe7KkArhM+Q4hZDuVhu/mBHxJ3jQV82aHqQ=;
 b=EOzqqZs4LbN2iFjYN2atyUcFVYgXG30NJPvH93pRjC8jghmkQe0d91q/3l0twdqVXcCtM6MrqGD8sYakTOByZcdB4FndcYmwpfHpd3gCtBsiwzrk4KlDpHNxjxAu8Ng+lOoQLwupocIwhe9d4EJronpsQx4yTdqf0bXuVTD2qcwou3LKP/EzOcKMbbKooa58wK8Mo4r7OA4HG6+GcBAZuWYtvFGwtZvcYm/2pd6a3M9/leKPSFWZ7lmRKw9rS+WQseZWWjXyzG2NUhTvc2D6uWN2qhW3jGaiWK1IMeE3FmXKyXIZ5Yzji1zP88QZcqBSQbYwvAo7CsNxGTZroHzWeA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2717.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 09:25:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 09:25:54 +0000
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
Thread-Index: AQHabtzNJ1qHAIS860mENCksCunHF7Eo4IQA
Date: Tue, 5 Mar 2024 09:25:54 +0000
Message-ID: <15e13364-8b43-402c-836b-436499906b74@csgroup.eu>
References: <20240305090910.26742-1-tzimmermann@suse.de>
 <20240305090910.26742-4-tzimmermann@suse.de>
In-Reply-To: <20240305090910.26742-4-tzimmermann@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2717:EE_
x-ms-office365-filtering-correlation-id: 7d0afa33-a05a-4228-a94d-08dc3cf64216
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  W+Vpx24V+UV11m9I1dxB7LGtR4ufF3FwqbEcxA1I+ECsWdVOlgSjSffktvWDMwzsWHnqwNtn1FVGav1E91GlyLFbVw0Qx1wMONCa6gzyY3EREB6igsnvEtUZerMnR9Hm5y3Yjeqt7zXVkUY/OS++reOflBTtaVXl+dkfN1VIdJSQkoT4F8IO2KXG8ak6WkiGVQFZSF5vlbzOtFJ0hUUezWjyX86ZEs6JLSKZiuno5PWqGGQaKrR0HHSltMRr9N02vnH7Ah1YRsvK5jv+L7ZSb3ww/G0vbHt6dVL0Sf0761zQ2BcRjxvDWU4rIc19T18/Vxh5301o+tBnbhWnqjJiVJsRAxeGZFHA+LJWSlFsr/dJLYJ7KrYjtgvH1unAHT5S/mSauzA7UdWjbMc+arK5q9U9NVPRyPBUaA/2LEr6TGFz0aYza+YzHBsBR9TDJRHRsXVK7Wib38Rs+o7z+bu9FRaERwQZQ5UKkiQiG3BXVLw1J/w70Pjr/A73hc/cuGrOkDDALZ73hdBqiMsNjvEKxNt7M+6qemzG8+6tna2hGwy2mmb1VfdFTSp76Lc4c/1XKtt4tXI9uCUF/t9nDI3x114OTTxyHfLB0ykLBFpbFRJVGaD3XCRMEvSMw5p5xI7aqgYDpmXHa4BKmnB+R0xZS7i0qYOfBeb/g27VzVVDICeTKFkaZ7HKCEF/reTBN4gCRJnY0gFCXDY2e2qwhoV03Vnp/YDqxz2na3VS2VeownM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WlZFdURoYmJzY0M4R1lwc2Y2TFowRWhnaFBXZ2U5WEQxeklTS28rNEZIeXQ4?=
 =?utf-8?B?ajZiRStmWVlXazJldjFjeWg1T3NZZEtGeDRHZUs0Q29tQlBrQmdmNHdDNDc5?=
 =?utf-8?B?QUQzb0d3YzY0Yi9OV004V29nR0R6WnJBeklES21QNGJzdU42UTgzazlySnRN?=
 =?utf-8?B?Mmd4M1Q5dnMxZnVOcDRrbW54OVE2aEI4Tzc4QzdIeEdCQzROTjJOWXk1L29C?=
 =?utf-8?B?aWZFYXlQUEJ4UHBkVFZ6YmF1azZGVkM1Sk5zaEJESHRFemFyeWRYNUx6RDNQ?=
 =?utf-8?B?dlNVUVI0dFdSRXdDMVo2bWdhSFJmY203STRTTVNmaDVFdlhVcGxZV2MyTlBh?=
 =?utf-8?B?OHBBcGlPNDZxdkJ1SUVlNUxScUYySDRzd1FwanBuR3FDQm0rSDRBTHlJU2xM?=
 =?utf-8?B?ZmlEQUxOZUU1VUdxL2ZIZEdGdHpyY216ampZRFFEcEQ3TnovblhYMEN5R3RN?=
 =?utf-8?B?M1NqV0RTbzQ2bGdNYi9pMWltSy9ZdFlWdEVsRFZzc0VuLy9hS20wNSszR3V1?=
 =?utf-8?B?TWY2ZmpKREc4dUpRMm9CTU1HMFZhSExoQ3JoeW55NU81eS9UVSt0ekx0bWdU?=
 =?utf-8?B?RlhkbnRobG9ZMGlFZlcwVUoybExBY1RFN0ZRL2xjellhRUIxSjR0MEV5YmtT?=
 =?utf-8?B?REwwSE9Sd3RaVDlWRUdjeWlleU1mMGRic0gzVVkxTVhzTUcvYzcyc3g0TFM4?=
 =?utf-8?B?Y1dPOHNqTnBYeWQ1T2h5NjVLRnFpZ1AwSjNNNDdrTlVBWnJKVEVzcXBBcXRI?=
 =?utf-8?B?dUZPWm1BVVVCaXYwS3JWQldKTWpWS0RJZjQ3c1NhYVgyRTV1RS80TTFWYXBq?=
 =?utf-8?B?Ri83aURpNE1CZ25ONlpBVHFIV3l4WExBS1ptK0dDUEVHSHJSZVdSVTN0ZERI?=
 =?utf-8?B?dFhYWTJmcWZTNllWTmRFTlhHRHhJa3BWMXk3NVJKeDc5WE1PNk5ueHBsRHN6?=
 =?utf-8?B?ZWIyTEJINE9zcUZxdnFsM3RsanNpTEQ0eHRucnl0UTVUODBudnVCZHMySXRS?=
 =?utf-8?B?T1o5VGJJcWZST21RU1ZVL1JGMm9TUEZLS3AvcWJobElHajZyWHNDQ1hEQnl4?=
 =?utf-8?B?a3hWT0I3eGFzNDJxeG1nZkdzNEZXbTIzdHg3eGZqVElMRENuYzVOeXQxZVpK?=
 =?utf-8?B?NDlkRVZMMytod25GSW9sNnA5MGc2RFdKcnVYUitleGlPSTJOZjNmcnU3em85?=
 =?utf-8?B?akI2Z1lSRG05NHBVM0cyZW1vaFZ6MTB3NDE0VEhvMjZGejZxeWpFN3BTZE5r?=
 =?utf-8?B?UXpla0ZWVXNKQ3lxSVdVaTNNa0JxYWNXQStkVWhPUEtINFdwTjI4eXhBeXNE?=
 =?utf-8?B?WWtEVkZ2SzJYSml4OFp3STB2ZmRrbmt2N2JDWkNZeEZIS0M2WlY3YUg1WWhS?=
 =?utf-8?B?SVBleWZ4K0dRNDNMSjRDTWtyd2graXh4SFVjQUJ4akpNZDZzaCtCcHFjN1lK?=
 =?utf-8?B?R1dYSFpybHg4bzZINStVUHdUdEUxZU5nYk5RallYM2RaTHdPRGRza2ZOeHBI?=
 =?utf-8?B?R0NLVUpGUU42ODI3cFd1ZlUyWFhVTnlWTC9KYXpVb3RkcSszQmFYRFNuYSs0?=
 =?utf-8?B?aHlUU2NFZmFuZ1diUTRNM0hmWXM4SFJkRStHZFJNcURqSS9sR3NMZzNmTmhv?=
 =?utf-8?B?NGhkTnVKdDZxYTYxcmNadlJYRVl2SFVFKzVaZGQ1Nm9EanJJT01xQnZMMjlP?=
 =?utf-8?B?bUlEei9nSHEwdVN6bGJ6VFN5VEl4WWdleFVMWEZoMFBndXlzV2ZkNnBXQkI2?=
 =?utf-8?B?U3pmTVByaWRwbFluUU1TalZoc3ZBMDY3SFlFRXNMN1hnWmhldkNDb3I1SWtU?=
 =?utf-8?B?aWk0N1d6VG9rQXBKbVdaVVFWWDdQRmtsdnQzVHNyL2k0WGY5VVFSY2hDdk4y?=
 =?utf-8?B?R2poUGt5Ty9RS3BYcVVQeDdqUGluaFBESjVEanhIZFQ4MWdQaGozY3BTS0xO?=
 =?utf-8?B?TVRwRnBrVUFaaXRIYWoybmlMUG1PT2VHY2szM2dmT2J5S2dqcTVFekNua1Fy?=
 =?utf-8?B?RkZVV0dDQ25xLy9iYlNhc0xoTGFJU1QwUGw0VllTcXB3ZGM4Y3RSTWFqbXlX?=
 =?utf-8?B?UW5YWjBrM1pYeG1xK3Q4SVl1aG0ydW14UVhaS0JtcC8rVmVNRSszNlkxaHht?=
 =?utf-8?Q?sGMzBrOxz7+grFmzGBRqpUXM2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8B2A581A21CCC4A8F962F0FD2D2587D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0afa33-a05a-4228-a94d-08dc3cf64216
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 09:25:54.7737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sBSNERxEQbmreZl5M+l+2jArI5MZYS03073sqXnASbFJXysfUrn0Ih157tjf1QSZ3ooWLJjmqx2WfQE0pnvQKnhdPO7TyrfK3KczfSUPC6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2717
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

DQoNCkxlIDA1LzAzLzIwMjQgw6AgMTA6MDEsIFRob21hcyBaaW1tZXJtYW5uIGEgw6ljcml0wqA6
DQo+IFJlcGxhY2UgPGxpbnV4L2ZiLmg+IHdpdGggYSBmb3J3YXJkIGRlY2xhcmF0aW9uIGluIDxh
c20vYmFja2xpZ2h0Lmg+IHRvDQo+IHJlc29sdmVzIGFuIHVubmVjZXNzYXJ5IGRlcGVuZGVuY3ku
IFJlbW92ZSBwbWFjX2JhY2tsaWdodF9jdXJ2ZV9sb29rdXAoKQ0KPiBhbmQgc3RydWN0IGZiX2lu
Zm8gZnJvbSBzb3VyY2UgYW5kIGhlYWRlciBmaWxlcy4gVGhlIGZ1bmN0aW9uIGFuZCB0aGUNCj4g
ZnJhbWVidWZmZXIgc3RydWN0IGlzIHVudXNlZC4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KDQpX
aGVuIHlvdSByZW1vdmUgcG1hY19iYWNrbGlnaHRfY3VydmVfbG9va3VwKCkgcHJvdG90eXBlIHlv
dSdsbCB0aGVuIGdldCANCmEgd2FybmluZy9lcnJvciBhYm91dCBtaXNzaW5nIHByb3RvdHlwZSB3
aGVuIGJ1aWxkaW5nIA0KYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9iYWNrbGlnaHQu
Yw0KDQpUaGUgZm9uY3Rpb24gaXMgbm90IHVzZWQgb3V0c2lkZSBvZiB0aGF0IGZpbGUgc28gaXQg
c2hvdWxkIGJlIHN0YXRpYy4gDQpBbmQgdGhlbiBpdCBpcyBub3QgdXNlZCBpbiB0aGF0IGZpbGUg
ZWl0aGVyIHNvIGl0IHNob3VsZCBiZSByZW1vdmVkIA0KY29tcGxldGVseS4gSW5kZWVkIGxhc3Qg
dXNlIG9mIHRoYXQgZnVuY3Rpb24gd2FzIHJlbW92ZWQgYnkgY29tbWl0IA0KZDU2NWRkM2IwODI0
ICgiW1BBVENIXSBwb3dlcnBjOiBNb3JlIHZpYS1wbXUgYmFja2xpZ2h0IGZpeGVzIikgc28gdGhl
IA0KZnVuY3Rpb24gY2FuIHNhZmVseSBiZSByZW1vdmVkLg0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYmFja2xpZ2h0LmggICAgICAgIHwg
IDUgKystLQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvYmFja2xpZ2h0LmMg
fCAyNiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2JhY2tsaWdodC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2JhY2ts
aWdodC5oDQo+IGluZGV4IDFiNWVhYjYyZWQwNDcuLjA2MWE5MTBkNzQ5MjkgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9iYWNrbGlnaHQuaA0KPiArKysgYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYmFja2xpZ2h0LmgNCj4gQEAgLTEwLDE1ICsxMCwxNCBAQA0KPiAg
ICNkZWZpbmUgX19BU01fUE9XRVJQQ19CQUNLTElHSFRfSA0KPiAgICNpZmRlZiBfX0tFUk5FTF9f
DQo+ICAgDQo+IC0jaW5jbHVkZSA8bGludXgvZmIuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvbXV0
ZXguaD4NCj4gICANCj4gK3N0cnVjdCBiYWNrbGlnaHRfZGV2aWNlOw0KPiArDQo+ICAgLyogRm9y
IGxvY2tpbmcgaW5zdHJ1Y3Rpb25zLCBzZWUgdGhlIGltcGxlbWVudGF0aW9uIGZpbGUgKi8NCj4g
ICBleHRlcm4gc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKnBtYWNfYmFja2xpZ2h0Ow0KPiAgIGV4
dGVybiBzdHJ1Y3QgbXV0ZXggcG1hY19iYWNrbGlnaHRfbXV0ZXg7DQo+ICAgDQo+IC1leHRlcm4g
aW50IHBtYWNfYmFja2xpZ2h0X2N1cnZlX2xvb2t1cChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgaW50
IHZhbHVlKTsNCj4gLQ0KPiAgIGV4dGVybiBpbnQgcG1hY19oYXNfYmFja2xpZ2h0X3R5cGUoY29u
c3QgY2hhciAqdHlwZSk7DQo+ICAgDQo+ICAgZXh0ZXJuIHZvaWQgcG1hY19iYWNrbGlnaHRfa2V5
KGludCBkaXJlY3Rpb24pOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9w
b3dlcm1hYy9iYWNrbGlnaHQuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvYmFj
a2xpZ2h0LmMNCj4gaW5kZXggYWViNzlhOGIzZTEwOS4uMTJiYzAxMzUzYmQzYyAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9iYWNrbGlnaHQuYw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL2JhY2tsaWdodC5jDQo+IEBAIC05LDcg
KzksNiBAQA0KPiAgICAqLw0KPiAgIA0KPiAgICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4g
LSNpbmNsdWRlIDxsaW51eC9mYi5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4N
Cj4gICAjaW5jbHVkZSA8bGludXgvYWRiLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3BtdS5oPg0K
PiBAQCAtNzIsMzEgKzcxLDYgQEAgaW50IHBtYWNfaGFzX2JhY2tsaWdodF90eXBlKGNvbnN0IGNo
YXIgKnR5cGUpDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gLWludCBwbWFjX2JhY2ts
aWdodF9jdXJ2ZV9sb29rdXAoc3RydWN0IGZiX2luZm8gKmluZm8sIGludCB2YWx1ZSkNCj4gLXsN
Cj4gLQlpbnQgbGV2ZWwgPSAoRkJfQkFDS0xJR0hUX0xFVkVMUyAtIDEpOw0KPiAtDQo+IC0JaWYg
KGluZm8gJiYgaW5mby0+YmxfZGV2KSB7DQo+IC0JCWludCBpLCBtYXggPSAwOw0KPiAtDQo+IC0J
CS8qIExvb2sgZm9yIGJpZ2dlc3QgdmFsdWUgKi8NCj4gLQkJZm9yIChpID0gMDsgaSA8IEZCX0JB
Q0tMSUdIVF9MRVZFTFM7IGkrKykNCj4gLQkJCW1heCA9IG1heCgoaW50KWluZm8tPmJsX2N1cnZl
W2ldLCBtYXgpOw0KPiAtDQo+IC0JCS8qIExvb2sgZm9yIG5lYXJlc3QgdmFsdWUgKi8NCj4gLQkJ
Zm9yIChpID0gMDsgaSA8IEZCX0JBQ0tMSUdIVF9MRVZFTFM7IGkrKykgew0KPiAtCQkJaW50IGRp
ZmYgPSBhYnMoaW5mby0+YmxfY3VydmVbaV0gLSB2YWx1ZSk7DQo+IC0JCQlpZiAoZGlmZiA8IG1h
eCkgew0KPiAtCQkJCW1heCA9IGRpZmY7DQo+IC0JCQkJbGV2ZWwgPSBpOw0KPiAtCQkJfQ0KPiAt
CQl9DQo+IC0NCj4gLQl9DQo+IC0NCj4gLQlyZXR1cm4gbGV2ZWw7DQo+IC19DQo+IC0NCj4gICBz
dGF0aWMgdm9pZCBwbWFjX2JhY2tsaWdodF9rZXlfd29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAq
d29yaykNCj4gICB7DQo+ICAgCWlmIChhdG9taWNfcmVhZCgma2VybmVsX2JhY2tsaWdodF9kaXNh
YmxlZCkpDQo=
