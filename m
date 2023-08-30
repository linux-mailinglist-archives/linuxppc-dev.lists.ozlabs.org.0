Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82678D602
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 15:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbPYD5MkKz3c89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 23:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbPXg5lnlz2yVw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 23:00:17 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-72-ghgLKwR4MNqb2ZVtsa0Jyw-1; Wed, 30 Aug 2023 14:00:08 +0100
X-MC-Unique: ghgLKwR4MNqb2ZVtsa0Jyw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 30 Aug
 2023 14:00:06 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 30 Aug 2023 14:00:06 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Masahiro Yamada' <masahiroy@kernel.org>, Nicolas Schier
	<nicolas@fjasle.eu>
Subject: RE: [PATCH] kbuild: single-quote the format string of printf
Thread-Topic: [PATCH] kbuild: single-quote the format string of printf
Thread-Index: AQHZ2zYMiPMplwqfeUe66jkcyc3HB7ACzGyA
Date: Wed, 30 Aug 2023 13:00:06 +0000
Message-ID: <231e031b803041e0ba248d1efbc98dfd@AcuMS.aculab.com>
References: <20230829113531.4004730-1-masahiroy@kernel.org>
 <ZO3d7DrfKfsDXqa5@bergen.fjasle.eu>
 <CAK7LNATvUo7gKFG9NjtJarTBM508ntf2v6yo5tXsmDoMcUrJVA@mail.gmail.com>
In-Reply-To: <CAK7LNATvUo7gKFG9NjtJarTBM508ntf2v6yo5tXsmDoMcUrJVA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Li4uDQo+IEFsbCBvZiAiXFxuIiwgIlxuIiwgJ1xuJyBhcmUgdGhlIHNhbWUuDQoNCmFuZCBcXG4g
KHdpdGhvdXQgYW55IHF1b3RlIGNoYXJhY3RlcnMgYXQgYWxsKS4NCg0KUGVyc29uYWxseSBJJ2Qg
dXNlICdmb3JtYXQnIGZvciBwcmludGYuDQpUbyBtYWtlIGl0IG9idmlvdXMgdGhhdCBub3RoaW5n
IGlzIHRvIGJlIGV4cGFuZGVkLg0KQnV0IGl0IGlzbid0IHJlYWxseSB3b3J0aCBjaGFuZ2luZyBl
eGlzdGluZyAnc3R1ZmYnLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2Vz
aWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVL
DQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

