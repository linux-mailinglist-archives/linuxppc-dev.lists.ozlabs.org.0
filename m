Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D03E8A6202
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 06:07:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=VUswTp5A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJVqy1MfKz3vYt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:07:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=VUswTp5A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alliedtelesis.co.nz (client-ip=2001:df5:b000:5::4; helo=gate2.alliedtelesis.co.nz; envelope-from=chris.packham@alliedtelesis.co.nz; receiver=lists.ozlabs.org)
X-Greylist: delayed 462 seconds by postgrey-1.37 at boromir; Tue, 16 Apr 2024 14:07:03 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJVqC5bP1z3d2W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 14:07:03 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 99C3F2C04F5;
	Tue, 16 Apr 2024 15:59:13 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1713239953;
	bh=FgRQ8y+a+3342fuSHaW0GvB9Eat6gnfWUekNdzkskAo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VUswTp5ANw2uSZip3lUPe6I6gbL58AwpI5hKJuTzpeZMFA5wD1qYhDOpISvq8qVeG
	 JFludmEeo2v6yCqkeymC0sOq1bj7W9LH8PO8M1JgNa7PLcgnm+XeKvFr0WJDRSYLac
	 KNQ7Cq72YXoR8vdFaiiOd1Bly+FC4i+eabjo7tZ7AS+XUMwwlhUquaYLwBrRmTsKIR
	 e/mIQIaKDSA6QsWVd1r8I/44PTtOVI9Ei1C959Jb3XGrVjtDraiH2+qxIwn33uClHy
	 wqg/iuO7mJVOqGOKBNkD/DhNgZVKIjB/LUvPoMb4PztAIDY/Zzt07//ihDvcfMTUR+
	 jZhNM7gq/ivgQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B661df7910000>; Tue, 16 Apr 2024 15:59:13 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Apr 2024 15:59:13 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.009; Tue, 16 Apr 2024 15:59:13 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>, Abhinav Jain
	<jain.abhinav177@gmail.com>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Thread-Topic: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Thread-Index: AQHaj0/GzDJ4DPHHek+eKx0F5hnQY7FpBlkAgAB2vgA=
Date: Tue, 16 Apr 2024 03:59:13 +0000
Message-ID: <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
 <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
In-Reply-To: <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <711434C7B851E04E8BA12FB3CEA63A67@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dY4j3mXe c=1 sm=1 tr=0 ts=661df791 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=SQiHmE0Aj67H6G5b:21 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=raytVjVEu-sA:10 a=O23guemLEh43BbyxQAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
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
Cc: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia
 Lawall <julia.lawall@inria.fr>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiAxNi8wNC8yNCAwODo1NCwgQW5kaSBTaHl0aSB3cm90ZToNCj4gSGkgQWJoaW5hdiwNCj4N
Cj4+ICAgCS8qIEVuYWJsZSBJMkMgaW50ZXJydXB0cyBmb3IgbXBjNTEyMSAqLw0KPj4gLQlub2Rl
X2N0cmwgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLA0KPj4gLQkJCQkJICAg
ICJmc2wsbXBjNTEyMS1pMmMtY3RybCIpOw0KPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGVf
Y3RybCBfX2ZyZWUoZGV2aWNlX25vZGUpID0NCj4gSG93IGhhdmUgeW91IHRlc3RlZCB0aGlzPw0K
DQpJJ20gbm90IHN1cmUgSSBrbm93IGFueW9uZSB0aGF0IHN0aWxsIGhhcyBhIG1wYzUxMjEuIE1h
eWJlIHNvbWVvbmUgb24gDQpsaW51eHBwYy1kZXY/DQoNCkkgZGlkIHRyeSB0byB0YWtlIHRoZSBw
YXRjaCBmb3IgYSBzcGluIG9uIG15IFQyMDgxUkRCIGJ1dCBJJ20gaGF2aW5nIA0Kc29tZSB1c2Vy
bGFuZCBpc3N1ZXMgb24gaXQgZm9yIHNvbWUgcmVhc29uICh1bnJlbGF0ZWQgdG8gdGhpcyBjaGFu
Z2UpLiANClRoZSBrZXJuZWwgYm9vdCBkb2VzIGRpc2NvdmVyIGEgZmV3IHBlcmlwaGVyYWxzIGhh
bmdpbmcgb2YgdGhlIEkyQyANCmludGVyZmFjZSBidXQgSSdtIG5vdCBpbiBhIHBvc2l0aW9uIHRv
IG9mZmVyIHVwIGEgVGVzdGVkLWJ5IGFuZCBJJ3ZlIHJ1biANCm91dCBvZiB0aW1lIHRvIGRlYnVn
IHdoeSBteSBib2FyZCBpcyB1bmhhcHB5Lg0KDQo=
