Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6788AF55
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 20:06:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eo87Rqc+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3Mpr2fCBz3vbJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 06:06:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eo87Rqc+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3Mp510Bwz3d3g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 06:05:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzHEz5SYaop2cekCWioy7KlrG9exph7jqGavJ381Pl4y2CH4ZeslWBvYSeqdoZ2BK0EIX/IT6+OpyKBhAwi2SVRtDzw3JguvOcsI5+oF4yAQWhh5vcg/mK83Cq8LndpDgrxhwndybdamrdI4bXV64FUlkLBKyzH09/Zv3Hz0nSCIWFhyZ9FXeRInAJQbfX4NENmR0cwNh4Mp8bJ0g1sYTkBAqdcQg7OR7a+cXByE66/c6FbzTZTYzpy0AdifWdY8s6GhsIEfd1jojQCfGy9/Lhh37I3WLswIkIh7PHa7kARGlha4JyMkaMOO5zb6UxAZXgronO/ewaQmCQen8TIpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCdHHJiaLIgYb+qyQ9n3YhHSHmXIlckYRLN0GvvdjnI=;
 b=InkDPo3CaiWhHGp8oh2tL6JWQEYZgp3LB+lYh9yXPqOn3buRzoqkZBlnBHbQHM6MDdRUN+DyAGNMnGJbAPefuDiGWLueC6+rmqc6l27mcAgSinU2VkqRSVBW6QsMN8u0r/nur3cZjOoYyTRAU2fmteZgJaNjOcD0E7zeqBJeLf0fS063bKlOxCYQK2Ijg8ou+h4bifaxBAYFAvTVigrQKjn+z1aWbncra/coUE9nPEz3BC6fcO01Xa12PyPGSl53o6H6GQDkMn1w7j+HaAcgIyqbTAbsq8O/2R8LzP+bJtdTJ5EZGTau138hrPG76xgA8E8sDusgUMei3+VWya/0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCdHHJiaLIgYb+qyQ9n3YhHSHmXIlckYRLN0GvvdjnI=;
 b=eo87Rqc+jT0EC9uiVe0/krmuoqGA4bQmktY9BJBk6zRZorVodO5aggyaYenjU5N91dGW2hvB1xxUKUfMaZ8KxeeGMUZLI0kRv0tIQ/id2Ubu1gAULOakFcSi4OI3HIX+CFSxFZNEIut633M/sHwxle9bdzMzk5738togjgCU4Cza249/wLIRNFC14mURbgfK1bd8U3apADQN+xWH0vIADlQ0kZdx65yvO3xGXL8lgxmbP7If4v9fo1vFnkG48qDl4lYeqqL0dW666lsmTIVQZraN1rBVnHxMrry1vwqy2KT0y2vOwUeBYR8eLZu0sj+5/4m+lnSdFumH5LGDR+tHiA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 19:05:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 19:05:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Thread-Topic: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Thread-Index: AQHafsSUDf1gEqeQdEWjl7G6IxKzM7FIoteAgAAuSYA=
Date: Mon, 25 Mar 2024 19:05:01 +0000
Message-ID: <6e16e042-0143-4a52-b4b7-09cf0022bc3e@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <54d78f1b7e7f1c671e40b7c0c637380bcb834326.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325161919.GD6245@nvidia.com>
In-Reply-To: <20240325161919.GD6245@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3145:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  grjPOTsotkKiRe67MmrFnGWXxF9DpN1PWKZU3vD57EDNRl3cDF6sY4F2BSu16yigMiKUAlk+kqSXoxappmzvyltuk6CNOllNkHUm6KTyV+WIWqZG3BZXBxUClPa12lijM/9qXyNHe6SY41N5H1p+QH5iJKShTaT4+/zLVItDuUEx5EO0EnW2WPfNZoK5uJ/yiaMzXubyQG3IFvJr3ABAKSQINXb15CVnh8mCKqTcutOCS553sgxTMRDvAtaRXFvIclXbxwHRBmrqyneec3MKBQWwwX+IgJ83lo+xl3uWfYbqbsw5rCwtIAXbdG1ELg4/zfhx8vEOtONUOe/oBi7mUwThgu16DEfAfhBzC+wNY+JhQV14ZTexlJc/YQwAjxypsbm+mOfnOPzmovXxteUruglYQwjlgAskUBIraEL+OFGcQnHpLaG34kxNZXn4vUmAYKFenSp92UK2Hd2NfeUxiQSito0x+BNC5lPtDAExFEJnpgDOMsRlSj9ke7k64NXFRzBJ6TrjuBBe+G1/iW0lKexC61M8TWzG53bPteBpqLepIuNY6llOEe4c8uXDQEGEoNfAezSJe5a6YNtpJaSK9seJ3/6ILrFlkfrpd/JNuYM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N25XQ2kwN1FBbnEzSDl5WXZlUHdkckVkSW1ZeStNeDVnTko3Y0FvQ3UvTnFZ?=
 =?utf-8?B?NzJGb0xtd2JnODdqTDlDSmZaUy9qZ04rNThaT2x3RWZzTXFud0JPTWVtbjNR?=
 =?utf-8?B?TTgwTGg3UnZqN0pLemJCaEtVMU43Mm1EaGs4MWh4akNxT0R3K1ZKSWhTNjk5?=
 =?utf-8?B?ZGNTZ0x4NUIwYWozVzR3OU5McHpQa3Mwelg5bkNRczBXVW9xcHg5Sjk0cUhi?=
 =?utf-8?B?cVMwYUdYNExPOFBZNXRZZW81UklNclkyR0VoQXhNOHB5cDhGU1VSN2V3aVp3?=
 =?utf-8?B?eUhrMWllWjJNTExGajVLMFpTSnY4eUJqVkhvRlBZaE4rVjJlcVd6OGZaTzRm?=
 =?utf-8?B?ZXZSWDR3U1dVa2JTRGY4a3hXUFQ5QW1kT0dDMmVJcmdTRklCS1lVa3VkczdB?=
 =?utf-8?B?RWZ6dk1ISGR4REl6ak5IaU9wUW1FbW9OdnFjTW1KMll1ZVg3enhZaGVaSE5C?=
 =?utf-8?B?WUorVDNnaTRDdXhyNFVJUTZxSWh0OS95K0hlSGlLR2d5NHNYQ3FWN3dERUVa?=
 =?utf-8?B?Z3NDYWRxU2ZxbmVQWC80a09BTUxRcUF1TjlRY0F6eStYZGRjaXFZODV0YXQ4?=
 =?utf-8?B?MS9wT2lzdFBoME5WTDJvTjNpNGF1SjViZzdTQ0xmaEk4OHdHeDlObGNFaHZn?=
 =?utf-8?B?ZWc1WjlPczI5MUJCKy9PRUd0Zm9TNmZ1a0hnc3ZqaHQ1OWgvRW9Kb2RnU0h3?=
 =?utf-8?B?bWlzeEhPTUNYNmViTW1taExmRGUzU2lQYlplYTFqcWZPbUlCRGNXOU9yNFd2?=
 =?utf-8?B?TDZOTjZRNSs2SG5BdUdqNC8zRXZxWHJIOEJUTVJMRjVWa09DOWtFU2VIOUVj?=
 =?utf-8?B?bWlaQkcrcklUSG5hZkYwbWhIMXN4TkRVOWpBQ0JpNk5OejlNcVZMejd1QzFJ?=
 =?utf-8?B?d3VJUUFkbHAvNUpUTVV0dFlLaGhjdHJqKzVkSUFWZm5NWkhqdG1tT0tkYm9V?=
 =?utf-8?B?RStvSVR2eGhadm1CVGRwMVFPeVh1d0Y0M09iR1UwVVRRYXdCZi85OGxkUFNL?=
 =?utf-8?B?cEpxdm5DMlNDU285d3FJa1hHUytIN3dxclJpMm93K3dDdWJsQWhMZlRLU3hy?=
 =?utf-8?B?WEI2dEZpNEFuZHZFTnlWUC9QV0paTW1DTVNzc0d2cnFmbVZEZWo5cUpaTWdS?=
 =?utf-8?B?Y2pTUU1UM1hITEJ0bzAvNGFKQW92cmxsV0lnZStyVmhCOStkRU1HaFNzc2JP?=
 =?utf-8?B?WXZjVWFuYWNDVlhSa28vK3pmdU1oK2IxYVFYbEdOTytvczJJMnNIUzBnOGc1?=
 =?utf-8?B?YmhqZWlaTC9oai82cUlQRzl0Z2tRcmxBUVY5K0djNWFuZEZrblRUL21rRzhm?=
 =?utf-8?B?UHBDcjNVQTZ4bDJMcU42VmMraVBZa2MxMDBJOE5zT05DeEgxWllqR2NWUVAx?=
 =?utf-8?B?QUVHR2RWQ1BDQ0E1Ulk0S2gyVDE1d1Fyb0RRVnl5eHRmdVI3a0RIY2JFTkxB?=
 =?utf-8?B?Z3NlVmVqT05MM0RlcUFHcW4rM3d4TElBTkxkeVV0TWp6MXBmL1I3cnVvRnJw?=
 =?utf-8?B?MGJhM0pFTEFKckxpWFNHbGg3S0V2dUQ1UEh0amNZbk82S2piSndBZzdtNUdX?=
 =?utf-8?B?L1pmZHYvd2FDQ1pqbkw5Y3FPMHowbkYwUG1LZlpPL2tlbnhHUDhWKzNEaFZh?=
 =?utf-8?B?RkNMQWZVdW1nM3E2Wm9Vb29Hb0FEMTZnbGsvbDYvSVFuTW1mdDdONlFhWXVv?=
 =?utf-8?B?d3llWjVwcjEzMklLZWZ4ZXNtSktKTkF1L2JyWHRyOUg4WW5MWFp5SjRCZmll?=
 =?utf-8?B?UGxZcVB3NVBxMlUwU1pVMUJId01LUHRzd2xEd0VTTHZTWUpOdDNxZ1lydXNO?=
 =?utf-8?B?YkUwU2ZjeTFycC9OUFlURnhyRFllL241Y1RJWTM0MTVmbHpmWFNzbEgrQkR5?=
 =?utf-8?B?VURheDRFdUdZZWswQ1M4NGVsdnBxRk1tQW5waGZadFZhdXA1TnlESEhvWklu?=
 =?utf-8?B?TkRNK3pJQ0M5V0ZvUHNtaGdKRzluekFUbDYxUW55R0RSMlBpQ1llTGQyVVBp?=
 =?utf-8?B?QzNvNUZReW9sWndUelNyT0pqQUkxemFkeDVKR2p5U3FRbHBEcTROcy9VME5r?=
 =?utf-8?B?SXROcVl2cWFlWFZNd3pLWm1USWt5WUwzVXN6SkZ0R29iMVJ1bDU3VHlEM1dV?=
 =?utf-8?B?SDVXcVRGQmpwY2hGS01NeWJrWEIxQTlmdU11L2pVMkhGb2tBTmUvdEFQbEpp?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB7D97B10D41404F830B8E0EBB8C2D96@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7859eb-3e17-4143-2f52-08dc4cfe7916
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 19:05:01.6130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXXFd1Ll0yB5rJkEryn9LAgAzv5HSPrPG5T1Lg4l/7wpEwOcRWlqcVFDIVafGoBQuwrXJCfe+9FjKWw6CCEGVhxl0STU0upuIGaiQMO45UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3145
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAzLzIwMjQgw6AgMTc6MTksIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwMzo1NTo1NFBNICswMTAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4gVW5saWtlIG1hbnkgYXJjaGl0ZWN0dXJlcywgcG93ZXJwYyA4eHggaGFy
ZHdhcmUgdGFibGV3YWxrIHJlcXVpcmVzDQo+PiBhIHR3byBsZXZlbCBwcm9jZXNzIGZvciBhbGwg
cGFnZSBzaXplcywgYWxsdGhvdWdoIHNlY29uZCBsZXZlbCBvbmx5DQo+PiBoYXMgb25lIGVudHJ5
IHdoZW4gcGFnZXNpemUgaXMgOE0uDQo+Pg0KPj4gVG8gZml0IHdpdGggTGludXggcGFnZSB0YWJs
ZSB0b3BvbG9neSBhbmQgd2l0aG91dCByZXF1aXJpbmcgc3BlY2lhbA0KPj4gcGFnZSBkaXJlY3Rv
cnkgbGF5b3V0IGxpa2UgaHVnZXBkLCB0aGUgcGFnZSBlbnRyeSB3aWxsIGJlIHJlcGxpY2F0ZWQN
Cj4+IDEwMjQgdGltZXMgaW4gdGhlIHN0YW5kYXJkIHBhZ2UgdGFibGUuIEhvd2V2ZXIgZm9yIGxh
cmdlIHBhZ2VzIGl0IGlzDQo+PiBuZWNlc3NhcnkgdG8gc2V0IGJpdHMgaW4gdGhlIGxldmVsLTEg
KFBNRCkgZW50cnkuIEF0IHRoZSB0aW1lIGJlaW5nLA0KPj4gZm9yIDUxMmsgcGFnZXMgdGhlIGZs
YWcgaXMga2VwdCBpbiB0aGUgUFRFIGFuZCBpbnNlcnRlZCBpbiB0aGUgUE1EDQo+PiBlbnRyeSBh
dCBUTEIgbWlzcyBleGNlcHRpb24sIHRoYXQgaXMgbmVjZXNzYXJ5IGJlY2F1c2Ugd2UgY2FuIGhh
dmUNCj4+IHBhZ2VzIG9mIGRpZmZlcmVudCBzaXplcyBpbiBhIHBhZ2UgdGFibGUuIEhvd2V2ZXIg
dGhlIDEyIFBURSBiaXRzIGFyZQ0KPj4gZnVsbHkgdXNlZCBhbmQgdGhlcmUgaXMgbm8gcm9vbSBm
b3IgYW4gYWRkaXRpb25hbCBiaXQgZm9yIHBhZ2Ugc2l6ZS4NCj4+DQo+PiBGb3IgOE0gcGFnZXMs
IHRoZXJlIHdpbGwgYmUgb25seSBvbmUgcGFnZSBwZXIgUE1EIGVudHJ5LCBpdCBpcw0KPj4gdGhl
cmVmb3JlIHBvc3NpYmxlIHRvIGZsYWcgdGhlIHBhZ2VzaXplIGluIHRoZSBQTUQgZW50cnksIHdp
dGggdGhlDQo+PiBhZHZhbnRhZ2UgdGhhdCB0aGUgaW5mb3JtYXRpb24gd2lsbCBhbHJlYWR5IGJl
IGF0IHRoZSByaWdodCBwbGFjZSBmb3INCj4+IHRoZSBoYXJkd2FyZS4NCj4+DQo+PiBUbyBkbyBz
bywgYWRkIGEgbmV3IGhlbHBlciBjYWxsZWQgcG1kX3BvcHVsYXRlX3NpemUoKSB3aGljaCB0YWtl
cyB0aGUNCj4+IHBhZ2Ugc2l6ZSBhcyBhbiBhZGRpdGlvbmFsIGFyZ3VtZW50LCBhbmQgbW9kaWZ5
IF9fcHRlX2FsbG9jKCkgdG8gYWxzbw0KPj4gdGFrZSB0aGF0IGFyZ3VtZW50LiBwdGVfYWxsb2Mo
KSBpcyBsZWZ0IHVubW9kaWZpZWQgaW4gb3JkZXIgdG8NCj4+IHJlZHVjZSBjaHVybiBvbiBjYWxs
ZXJzLCBhbmQgYSBwdGVfYWxsb2Nfc2l6ZSgpIGlzIGFkZGVkIGZvciB1c2UgYnkNCj4+IHB0ZV9h
bGxvY19odWdlKCkuDQo+Pg0KPj4gV2hlbiBhbiBhcmNoaXRlY3R1cmUgZG9lc24ndCBwcm92aWRl
IHBtZF9wb3B1bGF0ZV9zaXplKCksDQo+PiBwbWRfcG9wdWxhdGUoKSBpcyB1c2VkIGFzIGEgZmFs
bGJhY2suDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIHRvIGRvY3VtZW50
IHdoYXQgdGhlIHNlbWFudGljIGlzDQo+IHN1cHBvc2VkIHRvIGJlIGZvciBzej8NCj4gDQo+IEp1
c3QgYSBnZW5lcmFsIHJlbWFyaywgcHJvYmFibHkgbm90aGluZyBmb3IgdGhpcywgYnV0IHdpdGgg
dGhlc2UgbmV3DQo+IGFyZ3VtZW50cyB0aGUgaGlzdG9yaWNhbCBuYW1pbmcgc2VlbXMgcHJldHR5
IHRvcnR1cmVkIGZvcg0KPiBwdGVfYWxsb2Nfc2l6ZSgpLi4gU29tZXRoaW5nIGxpa2UgcG1kX3Bv
cHVsYXRlX2xlYWYoc2l6ZSkgYXMgYSBuYW1pbmcNCj4gc2NoZW1lIHdvdWxkIG1ha2UgdGhpcyBt
b3JlIGludHVpdGl2ZS4gSWUgcG1kX3BvcHVsYXRlX2xlYWYoKSBnaXZlcw0KPiB5b3UgYSBQTUQg
ZW50cnkgd2hlcmUgdGhlIGVudHJ5IHBvaW50cyB0byBhIGxlYWYgcGFnZSB0YWJsZSBhYmxlIHRv
DQo+IHN0b3JlIGZvbGlvcyBvZiBhdCBsZWFzdCBzaXplLg0KPiANCj4gQW55aG93LCBJIHRob3Vn
aHQgdGhlIGVkaXRzIHRvIHRoZSBtbSBoZWxwZXJzIHdlcmUgZmluZSwgY2VydGFpbmx5DQo+IG11
Y2ggbmljZXIgdGhhbiBodWdlcGQuIERvIHlvdSBzZWUgYSBwYXRoIHRvIHJlbW92ZSBodWdlcGQg
ZW50aXJlbHkNCj4gZnJvbSBoZXJlPw0KDQpOb3QgbG9va2VkIGludG8gZGV0YWlscyB5ZXQsIGJ1
dCBJIGd1ZXNzIHNvLg0KDQpCeSB0aGUgd2F5IHRoZXJlIGlzIGEgd2lraSBkZWRpY2F0ZWQgdG8g
aHVnZSBwYWdlcyBvbiBwb3dlcnBjLCB5b3UgY2FuIA0KaGF2ZSBhIGxvb2sgYXQgaXQgaGVyZSA6
IA0KaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL3dpa2kvd2lraS9IdWdlLXBhZ2VzICwgbWF5
YmUgeW91J2xsIGZpbmQgDQpnb29kIGlkZWFzIHRoZXJlIHRvIGhlbHAgbWUuDQoNCkNocmlzdG9w
aGUNCg==
