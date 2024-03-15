Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80587C8D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 07:37:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QFB5pJMx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twvgz2phDz3dXP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 17:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QFB5pJMx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwvgC6P8Hz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 17:37:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN0JAj7jldrcSCuaispNi0bT6PEAoIFxjBj/EVvI5LLwHNf9hZ587DC2a3hRYtSmqRCE7BadCf0oGeVFKw8PPvthO+Y14iELrLVRkaPaoYjOobhs11h/qKHG3DspGpTz7Pn8HXf71fwaDx0hQyRiTvusNTKd9mo+1rVn8WQoPJeGKqpOMFXdDjMcvTcnbmPqm9kE/jI8k6dYBjP53rh+EJgIkPJF+Xi7awLCLu7NIO6G4CNR4ZtZOvstupK0F44VA+gZL/tpvtBk99NKICizyu/6NX1aAr0VerRDP8vqMNV7Ez1fmj7PsZT8ivWNX1VGO3SGritipBUa5BY80XYmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8WRg9+8BoE89k0XtPDs4qSWvubUUOv/e/iIUIN8rm8=;
 b=BGSBh4WOm9loNPMGNFoft0Sp35MVEvnC8yl0mSdAvDmGW9LAoUOlT2BBBWpad3f6ILE6HmI6G8afE9bw7tuR86jvj2CkMFhJGWMBIBWi/ruCtFZHbgkNvOW8H7MpozkogcO+D/CL6uvUuKGtttV7RhXdGQ4bAvGiF4rzSUB1wdK+gwXM2Az+j7u+RCmWC+pVjfLCy5EYa5vTrYLDj7FtUIcD4vrbe3H+ktYKTjZd3/bfg3IEESjte+lV4SDHueOhNtg4Fey5Ve0gP0nXxqd2Gu9v2pS5ppOv7t/wF8pTVEMSZ8NzBV2063mFHk3unyh8XuNGjePjE0PGpQYtBhCVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8WRg9+8BoE89k0XtPDs4qSWvubUUOv/e/iIUIN8rm8=;
 b=QFB5pJMxmBVeXAvlYw6eYPxTK1I7u0pxcYv/kTMpW11GOgN30EOVeK8ZRl2mtdL4YxW4N0XdZjLzSi/E5leayAWo2gZ2pyAg29TD1I/DUod/qlKwe7kNx9dpeVAfmLSIebcgOj67lIP7x5y/adF+gxJk4lQxxCf1ikg9UdXbsuxPtbwwK24xMcgQ5bia3/WQdDsqksN1JoFMsE5s7jAO0pRRxEnuhm3kTjwyJoRv4fQNVmTf+S6SmoGU0fHcUZvWIG+k1UAJQ/SnjMu74CNgj+CJsNKLCJ2NXjA6frTwWPkfUlp9yydas554fTzicJWCijTEB2piT+DvePlqlBgL1w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2735.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 06:36:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 06:36:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 2/3] powerpc/code-patching: Use dedicated memory
 routines for patching
Thread-Topic: [PATCH v1 2/3] powerpc/code-patching: Use dedicated memory
 routines for patching
Thread-Index: AQHadoTK+EGvgOc9ckiiXKQCFaPOJ7E4WT4A
Date: Fri, 15 Mar 2024 06:36:43 +0000
Message-ID: <27cc5332-7431-450e-8433-9ac6c6a864a2@csgroup.eu>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
 <20240315025736.404867-2-bgray@linux.ibm.com>
In-Reply-To: <20240315025736.404867-2-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2735:EE_
x-ms-office365-filtering-correlation-id: c4c7c7be-07b5-49ba-35a7-08dc44ba47ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yjmf14j5LfuXmmdUsAHr6UAP5A7ZwNrJi+wbJhJp2DhdvwTiYPjmzgt6V7XQz2rz1CM5Yd0HdOji2j+CBbwAQYL+wUyHgvxpwXfqRxwx5MKtoMsGd0RZbcFSka1K8DixLAB1/SrxN59IXjUEe1RyMtSpNaqnBU8Hmgyz3eIx4LCBePkPLBTCvT384XMGaiylnUtjs1R84Wl7eYfYqqLQKgK7Gr0ReyH39B1g9uYIZdC/p1Td8hProL7oNEVl1dz9Lv/jFiEDIgYU/X6h3IQ2kyS767z5ks6yimU+WAcbFsLgCVpKO4sfbkahKEoPlzstuL/lw2Ynis7IH20SUJrarlUgCYCtcpn9ZINbWqUosl11OTJqi+XFoz3VyRVYeLKAdyFRK8vKHPt7var1zQAK9Wnj3avchVox2+zWefXy/6UHo9pnQaJzSlwHmQNfCeM+lsG/HeaDLquNy+7YiCQiSi2wiw0h7Ka4lGSzA3EfqCZlbdlrtrS4elwgQ40QZOkMqqxcN9fhGpEeCCiG6MPnnrzaCK1Lndp1SCZWSkWdCCrAtBLTJj+V08K0PsvPKKctZTTIVo9ThfAEOBflBxXA/yJdeFD8pPV7UHoUEYMWyXTVBO5ZWcv1tF1zKcUAmW0VdUi1bfsWAe1QLfswf6bq0YJ0SlMQFEK1WMr0TxzCqWvfx34cyqJZH80y+FITAxn5Xu+EHJircEaQGFb82zVA1pOu294fKitiSXC99otuQTc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M21Ha3I4Zkg5Zm5vcDltOThHMUczS0QyN1QvTmRGYjRqSEhKSTRBNEgxamdB?=
 =?utf-8?B?c1dpZDBHYVRJQW80MjhpRXB1YllGc0RXaXlrMWYvUlBlSjJkajgrZ1RLemg0?=
 =?utf-8?B?Y2lDUXZ3T3FkYU92VnVXUjNrRncrVUdGOWhNU2Q0Q3hIaFRvVm1KaUo4b0ZU?=
 =?utf-8?B?WnhjRUtaSkZzVmVKS3BXSWdaRFdVSFUwNTcrQ0NmV0FvdjRLRTVtM3RVV0Na?=
 =?utf-8?B?K085c1BTby9tQTFuQjEra1UwaFIyaGZwdGk4MXpOY0ZNWTlXcm5vQlB4cktz?=
 =?utf-8?B?KzhxTUs4aHhNTkRUZ1pKRC9NVUQ1L1NJY1JLL0ZqcXJPNlhyZjBVN3pCVFBW?=
 =?utf-8?B?aU9hRE9LOHFJRVN4dG9RU0NVbU8vTy9yYjZTNUs3eWJGWjd3TGYwT1pSRGpk?=
 =?utf-8?B?cjZSOTdBdEZkaTU5eDM4dHNEdXhzS2RnM3N1ZVluaFZFeXV1Zmc4MHhEa0pS?=
 =?utf-8?B?bEk1K2dSSGErN0F6Y1J6azA4UXB2ajlSRDRpeEIxRlA5ZXQ5Wm9Lb09XSXJu?=
 =?utf-8?B?ZWZrWTVGRXFDcXNYMmJWOWRWKzZSN3VycEgyd3I5dEZkeGdoSDFzZHpmSnBJ?=
 =?utf-8?B?RHNqSXdhendGRk1QZXRDUmhEVHcyN25xaXZ2ZzU5aC9ESVhiLzlnQzN2aEZU?=
 =?utf-8?B?UC8wQThMa1NTb0R0MllrRHdxSklsWTRLTFZoTGV6azZYcTVjZmQxNXBPS2R0?=
 =?utf-8?B?RkljK1JVVGRETGZyTDNSNndUaXJ3UTQzcmdiNDF0WGlXandWWksvL2pWTEVr?=
 =?utf-8?B?UXJ3WEpHTTdjeTR6cmxNQUhiUzVsYmJweVN1N1JnTnVkcUkwV3l4MXBSdUov?=
 =?utf-8?B?YlVIYVEzMFZUb0ZscGVzRDZNRkpuZ1FKaXJJQXB3VmRENFpOeUd1SERmOFRY?=
 =?utf-8?B?TjJQb3cxOGs4WUYxMlMwVnNyL2JMTUlQaVBBSHNqZUVkQlZuMTFJVzZJMTRD?=
 =?utf-8?B?dko4ZzhNcHNTYTdSME1NVlcrL3gyM2Zrb2NSVDVpc1V0Mm84ayt3dVRUZzBa?=
 =?utf-8?B?Q3gvYmdyeTM3RmJURGJXRWlJMVhQekM4enZTKzZmSk5tL1NKSFZ6V1MzYm9D?=
 =?utf-8?B?am5mMDE4bWlMTGRwWFRTQk1uN21FRWNuRmxOTmY2cEU4OE9DZE11UmlvelJ5?=
 =?utf-8?B?R2R2eVJtbEJtQkRacDhyVW4wYjhGeTVsVU56UDVGZzArcVp1MFVJWGRmbXFU?=
 =?utf-8?B?SEJDcGRBM0wvTFdoeU4yZXpRc0I5YU1jSmZwVkVnMDlUNm1LTkQzU1pSMC9x?=
 =?utf-8?B?R21UbXk5ZTJVbUwvZXd0VnNMTmFCNTd5OEp5SFR3Z29JRStFSXRWMWhJOTNa?=
 =?utf-8?B?RGJpVjVqQkM3MnhrMFpUbWN3VWtYVG0vMDJOaFpVbHZQYWQxQ0hobHZOUGZv?=
 =?utf-8?B?b2toVEIwN2N3Qy9mNU9leUx1UGNuc1JObUM2R1Yxc0dHZ2JjQnppTTVveUU0?=
 =?utf-8?B?VW56dGxnc2hDRVNyN1IrYWZGSXpzRU5hUnJDMWw5WkNRQUMvOHh1OWpBaFJG?=
 =?utf-8?B?QWZVRFpBMzNwYmw4NHdKT3BrMjZkejhWdGNXOTA3VWJTNkkxL1h5MGk0ZXU4?=
 =?utf-8?B?aCsrajFLZGsvZDNVSTVxTEpXTzBZS1ZqNVdIV1JqdFpZZklaR1p2bStzbDdo?=
 =?utf-8?B?a1RzTGxNU2UzVUhzVlZ5K2piRENnODFYTEhLcEFVVlV3TGN5Zm9NMXFYWi8x?=
 =?utf-8?B?NG5BM2ZVQ2hUdnUzSUQrQ2JaN1NNK3lUQTlWUE9oSG5OenFTbTAxdmRvUEw4?=
 =?utf-8?B?MXV3Y0R2Sk5TUlBaV3c1d05RbHhkaU00OUJ5NTJ3SGk4NEtFbTRZRDdkMjcw?=
 =?utf-8?B?N0tnblRSd3JaRFIxby8vSkMwRWNGUHJwNUhkTm92RFNJMEVnekpDVlNnaFRJ?=
 =?utf-8?B?SGx6UlNEbk9iN21vUHY4MjB2L0M3NDU1U29hM2tHR1h6ZTdmTnMxTWtXcUtT?=
 =?utf-8?B?VGFaMzRCT3NFOHMyWXYwdklZbWFzT2FqQklGQWVNRHFNYWVCTnU2T05vSWR0?=
 =?utf-8?B?SjBZWmpKRVNSUDBFNTJZUFNidGU3ZitWT2xicmQ2TVZDeG1KNHk1NndiS0lv?=
 =?utf-8?B?cjJ3azA3OVFXS2U1blEvRllMQ3hxMDJLV281cHp0ckZnLzZCU0E5d3BYTTRs?=
 =?utf-8?B?UnhIY2hMSVU3OWFubmN2SHJlakx3cmV6YmxSaTdzTFVyRk9jQkMvaUF2alc5?=
 =?utf-8?B?STdGdy94cysyZ0RXQ1liR1N4VnZEa1Nkbkkwck1lcDFRNU5RbU1xc3gyTkpU?=
 =?utf-8?B?MWRQQmJqZWFBVUQ5VS9BOEVpOTNRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2076387F7F222044939B2AD9D40ADAD2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c7c7be-07b5-49ba-35a7-08dc44ba47ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 06:36:43.8590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DIbTXlD2Ix/JhX5J3RH+8Il1E8aCQvI2CoMYfUunKcBwUjxxFYMZc+KONlt3yzqhmeigN6tSa8qSq9uDmGoskzk/KnB4FE9O6PPi4WOkWY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2735
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAzLzIwMjQgw6AgMDM6NTcsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIHBhdGNoaW5nIHBhZ2Ugc2V0IHVwIGFzIGEgd3JpdGFibGUgYWxpYXMgbWF5IGJlIGluIHF1
YWRyYW50IDENCj4gKHVzZXJzcGFjZSkgaWYgdGhlIHRlbXBvcmFyeSBtbSBwYXRoIGlzIHVzZWQu
IFRoaXMgY2F1c2VzIHNhbml0aXNlcg0KPiBmYWlsdXJlcyBpZiBzby4gU2FuaXRpc2VyIGZhaWx1
cmVzIGFsc28gb2NjdXIgb24gdGhlIG5vbi1tbSBwYXRoDQo+IGJlY2F1c2UgdGhlIHBsYWluIG1l
bXNldCBmYW1pbHkgaXMgaW5zdHJ1bWVudGVkLCBhbmQgS0FTQU4gdHJlYXRzIHRoZQ0KPiBwYXRj
aGluZyB3aW5kb3cgYXMgcG9pc29uZWQuDQo+IA0KPiBJbnRyb2R1Y2UgbG9jYWxseSBkZWZpbmVk
IHBhdGNoXyogdmFyaWFudHMgb2YgbWVtc2V0IHRoYXQgcGVyZm9ybSBhbg0KPiB1bmluc3RydW1l
bnRlZCBsb3dlciBsZXZlbCBzZXQsIGFzIHdlbGwgYXMgZGV0ZWN0aW5nIHdyaXRlIGVycm9ycyBs
aWtlDQo+IHRoZSBvcmlnaW5hbCBzaW5nbGUgcGF0Y2ggdmFyaWFudCBkb2VzLg0KPiANCj4gY29w
eV90b191c2VyKCkgaXMgbm90IGNvcnJlY3QgaGVyZSwgYXMgdGhlIFBURSBtYWtlcyBpdCBhIHBy
b3BlciBrZXJuZWwNCj4gcGFnZSAodGhlIEVFQSBpcyBwcml2aWxlZ2VkIGFjY2VzcyBvbmx5LCBS
VykuIEl0IGp1c3QgaGFwcGVucyB0byBiZSBpbg0KPiBxdWFkcmFudCAxIGJlY2F1c2UgdGhhdCdz
IHRoZSBoYXJkd2FyZSdzIG1lY2hhbmlzbSBmb3IgdXNpbmcgdGhlIGN1cnJlbnQNCj4gUElEIHZz
IFBJRCAwIGluIHRyYW5zbGF0aW9ucy4gSW1wb3J0YW50bHksIGl0J3MgaW5jb3JyZWN0IHRvIGFs
bG93IHVzZXINCj4gcGFnZSBhY2Nlc3Nlcy4NCj4gDQo+IE5vdyB0aGF0IHRoZSBwYXRjaGluZyBt
ZW1zZXRzIGFyZSB1c2VkLCB3ZSBhbHNvIHByb3BhZ2F0ZSBhIGZhaWx1cmUgdXANCj4gdG8gdGhl
IGNhbGxlciBhcyB0aGUgc2luZ2xlIHBhdGNoIHZhcmlhbnQgZG9lcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+IA0KPiAtLS0NCj4g
DQo+IFRoZSBwYXRjaF9tZW1jcHkoKSBjYW4gYmUgb3B0aW1pc2VkIHRvIDQgYnl0ZXMgYXQgYSB0
aW1lIGFzc3VtaW5nIHRoZQ0KPiBzYW1lIHJlcXVpcmVtZW50cyBhcyByZWd1bGFyIGluc3RydWN0
aW9uIHBhdGNoaW5nIGFyZSBiZWluZyBmb2xsb3dlZA0KPiBmb3IgdGhlICdjb3B5IHNlcXVlbmNl
IG9mIGluc3RydWN0aW9ucycgbW9kZSAoaS5lLiwgdGhleSBhY3R1YWxseSBhcmUNCj4gaW5zdHJ1
Y3Rpb25zIGZvbGxvd2luZyBpbnN0cnVjdGlvbiBhbGlnbm1lbnQgcnVsZXMpLg0KDQpXaHkgbm90
IHVzZSBjb3B5X3RvX2tlcm5lbF9ub2ZhdWx0KCkgPw0KDQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jIGIv
YXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gaW5kZXggYzZhYjQ2MTU2Y2RhLi5j
NjYzMzc1OWI1MDkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGlu
Zy5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+IEBAIC0zNzIs
OSArMzcyLDQzIEBAIGludCBwYXRjaF9pbnN0cnVjdGlvbih1MzIgKmFkZHIsIHBwY19pbnN0X3Qg
aW5zdHIpDQo+ICAgfQ0KPiAgIE5PS1BST0JFX1NZTUJPTChwYXRjaF9pbnN0cnVjdGlvbik7DQo+
ICAgDQo+ICtzdGF0aWMgaW50IHBhdGNoX21lbXNldDY0KHU2NCAqYWRkciwgdTY0IHZhbCwgc2l6
ZV90IGNvdW50KQ0KPiArew0KPiArCWZvciAodTY0ICplbmQgPSBhZGRyICsgY291bnQ7IGFkZHIg
PCBlbmQ7IGFkZHIrKykNCj4gKwkJX19wdXRfa2VybmVsX25vZmF1bHQoYWRkciwgJnZhbCwgdTY0
LCBmYWlsZWQpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICsNCj4gK2ZhaWxlZDoNCj4gKwlyZXR1
cm4gLUVQRVJNOw0KDQpJcyBpdCBjb3JyZWN0ID8gU2hvdWxkbid0IGl0IGJlIC1FRkFVTFQgPw0K
DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgcGF0Y2hfbWVtc2V0MzIodTMyICphZGRyLCB1MzIg
dmFsLCBzaXplX3QgY291bnQpDQo+ICt7DQo+ICsJZm9yICh1MzIgKmVuZCA9IGFkZHIgKyBjb3Vu
dDsgYWRkciA8IGVuZDsgYWRkcisrKQ0KPiArCQlfX3B1dF9rZXJuZWxfbm9mYXVsdChhZGRyLCAm
dmFsLCB1MzIsIGZhaWxlZCk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gKw0KPiArZmFpbGVkOg0K
PiArCXJldHVybiAtRVBFUk07DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgcGF0Y2hfbWVtY3B5
KHZvaWQgKmRzdCwgdm9pZCAqc3JjLCBzaXplX3QgbGVuKQ0KPiArew0KPiArCWZvciAodm9pZCAq
ZW5kID0gc3JjICsgbGVuOyBzcmMgPCBlbmQ7IGRzdCsrLCBzcmMrKykNCj4gKwkJX19wdXRfa2Vy
bmVsX25vZmF1bHQoZHN0LCBzcmMsIHU4LCBmYWlsZWQpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+
ICsNCj4gK2ZhaWxlZDoNCj4gKwlyZXR1cm4gLUVQRVJNOw0KPiArfQ0KPiArDQo+ICAgc3RhdGlj
IGludCBfX3BhdGNoX2luc3RydWN0aW9ucyh1MzIgKnBhdGNoX2FkZHIsIHUzMiAqY29kZSwgc2l6
ZV90IGxlbiwgYm9vbCByZXBlYXRfaW5zdHIpDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBsb25nIHN0
YXJ0ID0gKHVuc2lnbmVkIGxvbmcpcGF0Y2hfYWRkcjsNCj4gKwlpbnQgZXJyOw0KPiAgIA0KPiAg
IAkvKiBSZXBlYXQgaW5zdHJ1Y3Rpb24gKi8NCj4gICAJaWYgKHJlcGVhdF9pbnN0cikgew0KPiBA
QCAtMzgzLDE5ICs0MTcsMTkgQEAgc3RhdGljIGludCBfX3BhdGNoX2luc3RydWN0aW9ucyh1MzIg
KnBhdGNoX2FkZHIsIHUzMiAqY29kZSwgc2l6ZV90IGxlbiwgYm9vbCByZXANCj4gICAJCWlmIChw
cGNfaW5zdF9wcmVmaXhlZChpbnN0cikpIHsNCj4gICAJCQl1NjQgdmFsID0gcHBjX2luc3RfYXNf
dWxvbmcoaW5zdHIpOw0KPiAgIA0KPiAtCQkJbWVtc2V0NjQoKHU2NCAqKXBhdGNoX2FkZHIsIHZh
bCwgbGVuIC8gOCk7DQo+ICsJCQllcnIgPSBwYXRjaF9tZW1zZXQ2NCgodTY0ICopcGF0Y2hfYWRk
ciwgdmFsLCBsZW4gLyA4KTsNCj4gICAJCX0gZWxzZSB7DQo+ICAgCQkJdTMyIHZhbCA9IHBwY19p
bnN0X3ZhbChpbnN0cik7DQo+ICAgDQo+IC0JCQltZW1zZXQzMihwYXRjaF9hZGRyLCB2YWwsIGxl
biAvIDQpOw0KPiArCQkJZXJyID0gcGF0Y2hfbWVtc2V0MzIocGF0Y2hfYWRkciwgdmFsLCBsZW4g
LyA0KTsNCj4gICAJCX0NCj4gICAJfSBlbHNlIHsNCj4gLQkJbWVtY3B5KHBhdGNoX2FkZHIsIGNv
ZGUsIGxlbik7DQo+ICsJCWVyciA9IHBhdGNoX21lbWNweShwYXRjaF9hZGRyLCBjb2RlLCBsZW4p
Ow0KDQpVc2UgY29weV90b19rZXJuZWxfbm9mYXVsdCgpIGluc3RlYWQgb2Ygb3BlbiBjb2Rpbmcg
YSBuZXcgbGVzcyBvcHRpbWlzZWQgDQp2ZXJzaW9uIG9mIGl0Lg0KDQo+ICAgCX0NCj4gICANCj4g
ICAJc21wX3dtYigpOwkvKiBzbXAgd3JpdGUgYmFycmllciAqLw0KPiAgIAlmbHVzaF9pY2FjaGVf
cmFuZ2Uoc3RhcnQsIHN0YXJ0ICsgbGVuKTsNCj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gZXJy
Ow0KPiAgIH0NCj4gICANCj4gICAvKg0K
