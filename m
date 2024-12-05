Return-Path: <linuxppc-dev+bounces-3838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A39E604D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 23:01:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y47dY04Fnz2yLV;
	Fri,  6 Dec 2024 09:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=99.78.197.218
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733436096;
	cv=none; b=fcpw9FMMgG21AvPlva4YcmNRY4tvh8zSrOZMJJ9dy7PAG0h4LZXR5QeDU8bDYGkTG8OKuIA0vbVfdpbS6NkgTHojNgzzg0TOtKZ7K54BProdLY3DekIxtX3UBHpJXWmeY8weGEQi8NTu7WgaOp+wjwcfC4b3cj9wapXd6uUptvqDAObiqtGCLadQSnME7pIA1YVgE7rOwQlBDK7NYPWEQrNq0O5ASrg4/LEiWerI4AJlKwSXsgFcLTXApyFO8la3GWQNkXSfHvoJtrmk1D1f9OsusUxvEdBM3tJni3b/KlelKX4e34lae3hrTz3paoCL/wVFndY1Ylu3R9l7yDB8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733436096; c=relaxed/relaxed;
	bh=WBRYGqFsKhLsWzBwDgwyb14a6KLVl2Ln8e4DJZjIZ5Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i16mfn1Kb2EZNT8G52GxWRc+54Klk4H/losziLnMI2LSMrDv2/wXC5DGsRqsRBO7PjxbQOUWX6p8p+D8nMQuxXdAPIGztSFpPCJwR0PlC43vVoYZokA/5aI6c/fWgBamkCFd/66LcVl86OjOOwL6Me+/ARTYvQVRq0sN7EG2hIFNiP/Sjj0eVQaHOid2YBlUYKqrbLYgZ1hqOeB1c5wFiCnwzQGyF5E6agdUCHppdU3MN0MHoUl3wCWcrYPMb0RQ2UcDMQ26W20z44spSF0/PJWuEFjCroG3tTGE5tlp3TaS0umN/lWqEgxh2b3Cdv0JNyMJzwvHS7c1xJtv680xJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=iyn/6n92; dkim-atps=neutral; spf=pass (client-ip=99.78.197.218; helo=smtp-fw-80007.amazon.com; envelope-from=prvs=062e112ff=benh@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=iyn/6n92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=99.78.197.218; helo=smtp-fw-80007.amazon.com; envelope-from=prvs=062e112ff=benh@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y47dW50M4z2xGr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 09:01:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733436097; x=1764972097;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WBRYGqFsKhLsWzBwDgwyb14a6KLVl2Ln8e4DJZjIZ5Q=;
  b=iyn/6n92+4BYNWFGmJ83Gy9trRsRlH2bUHe98+S3ByklP6h1+2Ga0kYx
   dzfD2SFP/e3n06EdX5SrNRSjU+PaksfaMDztsHfC9MDbo3D7dWA/2+EJ/
   l5nTeF4hTqfDvmeLWGgV4vukdafCIiLUtEHY86M/06Q3qxabN9X0VhFmM
   k=;
X-IronPort-AV: E=Sophos;i="6.12,211,1728950400"; 
   d="scan'208";a="358487152"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 22:01:31 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.38.20:23930]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.181:2525] with esmtp (Farcaster)
 id 4718b645-8202-4053-9c23-2ce41d312435; Thu, 5 Dec 2024 22:01:30 +0000 (UTC)
X-Farcaster-Flow-ID: 4718b645-8202-4053-9c23-2ce41d312435
Received: from EX19D021UWA001.ant.amazon.com (10.13.139.24) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 5 Dec 2024 22:01:30 +0000
Received: from EX19D021UWA002.ant.amazon.com (10.13.139.48) by
 EX19D021UWA001.ant.amazon.com (10.13.139.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 5 Dec 2024 22:01:30 +0000
Received: from EX19D021UWA002.ant.amazon.com ([fe80::1695:13a9:9f52:f30a]) by
 EX19D021UWA002.ant.amazon.com ([fe80::1695:13a9:9f52:f30a%5]) with mapi id
 15.02.1258.034; Thu, 5 Dec 2024 22:01:30 +0000
From: "Herrenschmidt, Benjamin" <benh@amazon.com>
To: "robh@kernel.org" <robh@kernel.org>, "segher@kernel.crashing.org"
	<segher@kernel.crashing.org>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "saravanak@google.com"
	<saravanak@google.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor@kernel.org" <conor@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
Thread-Topic: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
Thread-Index: AQHbR2E8vFBrvXcqyUSquwoaq++LVw==
Date: Thu, 5 Dec 2024 22:01:29 +0000
Message-ID: <54b34ac1296dd6711bda5239069d5e3b436bbc8f.camel@amazon.com>
References: <20241106171028.3830266-1-robh@kernel.org>
	 <87jzdfcm3l.fsf@mpe.ellerman.id.au> <87plmi7jjz.fsf@mpe.ellerman.id.au>
	 <20241127214232.GQ29862@gate.crashing.org>
	 <CAL_JsqKhp8bW66koP8JPSkXmrCjA+oQh6NZte_uphiLTC_=7Rw@mail.gmail.com>
	 <20241202220434.GU29862@gate.crashing.org>
	 <CAL_JsqL5FHPNQWGdBEz9UpD7cq3We-czPV8OmwD=0w5Eu10=kA@mail.gmail.com>
In-Reply-To: <CAL_JsqL5FHPNQWGdBEz9UpD7cq3We-czPV8OmwD=0w5Eu10=kA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.43.143.184]
Content-Type: text/plain; charset="utf-8"
Content-ID: <640BBA7AD62B3A4D81EFA0FB69EC2557@amazon.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-10.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

T24gTW9uLCAyMDI0LTEyLTAyIGF0IDE2OjU1IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
wqDCoMKgwqDCoMKgwqAgLyogTG9vayBmb3IgdGhpcyAjYWRkcmVzcy1jZWxscy4gV2UgaGF2ZSB0
byBpbXBsZW1lbnQgdGhlIG9sZCBsaW51eA0KPiDCoMKgwqDCoMKgwqDCoMKgICogdHJpY2sgb2Yg
bG9va2luZyBmb3IgdGhlIHBhcmVudCBoZXJlIGFzIHNvbWUgZGV2aWNlLXRyZWVzIHJlbHkgb24g
aXQNCj4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiANCj4gTWF5YmUgdGhhdCdzIGZyb20gc29tZSBz
eXN0ZW0gbG9uZyBkcm9wcGVkIGFuZCB3ZSBkb24ndCBuZWVkIGl0DQo+IGFueW1vcmUuIEkgaGF2
ZSBubyBpZGVhLiBUaGF0J3Mgd2hhdCBJJ20gdHJ5aW5nIHRvIGZpbmQgb3V0IHdpdGggdGhpcw0K
PiBwYXRjaC4NCj4gDQo+IFdlIGFsc28gZG9uJ3QgcmVhbGx5IGhhdmUgYSB3YXkgdG8gZGlzdGlu
Z3Vpc2ggT0YgZnJvbSBGRFQgKHdoZXJlIHdlJ2QNCj4gbmVlZCB0bykuIEl0IGlzIHNvbWV3aGF0
IGp1c3QgYnkgYXJjaCwgYnV0IFBQQyBhbHdheXMgcGFzc2VzIGFuIEZEVCB0bw0KPiB0aGUga2Vy
bmVsIGZvciBib3RoIEZEVCBhbmQgT0Ygc3lzdGVtcy4NCg0KSSBwcm9iYWJseSB3cm90ZSB0aGF0
IDotKQ0KDQpUaGUgbGl0dGxlIEkgY2FuIHJlbWVtYmVyLCBJIHRoaW5rIGlzIHRoZXJlIGFyZSBt
YW55IGNhc2VzIG9mIG9sZCBEVHMNCihlc3AuIG9sZCBBcHBsZSBvbmVzKSBtaXNzaW5nIHRoZSAi
ZW1wdHkiIHJhbmdlcyBwcm9wZXJ0eSBpbiBzb21lIG5vZGVzDQp0byBpbmRpY2F0ZSB0aGF0IHRo
ZSBwYXJlbnQgYW5kIGNoaWxkIGFkZHJlc3Mgc3BhY2VzIGFyZSBpZGVudGljYWwuDQoNCkkgaG9u
ZXN0bHkgZG9uJ3QgcmVtZW1iZXIgdGhlIHNwZWNpZmljcywgYnV0IHRoaXMgaXMgc29tZXRoaW5n
IEkgZGlkDQpoaXQgYSBmZXcgdGltZXMgaW4gdGhlIHBhc3QuDQoNCkNoZWVycywNCkJlbi4gDQo=

