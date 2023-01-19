Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DFF673DEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 16:49:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyRsH3F12z3fGc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 02:49:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyRrj2mSlz3fDc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 02:49:23 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-16-nL5EHvjbPXi_4VgMazjDCw-1; Thu, 19 Jan 2023 15:49:17 +0000
X-MC-Unique: nL5EHvjbPXi_4VgMazjDCw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Jan
 2023 15:49:15 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Thu, 19 Jan 2023 15:49:15 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Athira Rajeev' <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>
Subject: RE: [PATCH V3] tools/perf/tests: Fix string substitutions in build id
 test
Thread-Topic: [PATCH V3] tools/perf/tests: Fix string substitutions in build
 id test
Thread-Index: AQHZLBIrp7uRxIXInkOHsORdTF5RZK6l4s+w
Date: Thu, 19 Jan 2023 15:49:15 +0000
Message-ID: <1a2f988593a4403db2a043ff42886ced@AcuMS.aculab.com>
References: <20230119142719.32628-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230119142719.32628-1-atrajeev@linux.vnet.ibm.com>
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
Cc: "irogers@google.com" <irogers@google.com>, "ak@linux.intel.com" <ak@linux.intel.com>, "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "james.clark@arm.com" <james.clark@arm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.ibm.com" <disgoel@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXRoaXJhIFJhamVldg0KPiBTZW50OiAxOSBKYW51YXJ5IDIwMjMgMTQ6MjcNCi4uLg0K
PiBUaGUgdGVzdCBzY3JpcHQgInRlc3RzL3NoZWxsL2J1aWxkaWQuc2giIHVzZXMgc29tZSBvZiB0
aGUNCj4gc3RyaW5nIHN1YnN0aXR1dGlvbiB3YXlzIHdoaWNoIGFyZSBzdXBwb3J0ZWQgaW4gYmFz
aCwgYnV0IG5vdCBpbg0KPiAic2giIG9yIG90aGVyIHNoZWxscy4gQWJvdmUgZXJyb3Igb24gbGlu
ZSBudW1iZXIgNjkgdGhhdCByZXBvcnRzDQo+ICJCYWQgc3Vic3RpdHV0aW9uIiBpczoNCg0KTG9v
a3MgYmV0dGVyIC0gYXNzdW1pbmcgaXQgd29ya3MgOi0pDQoNCglEYXZpZA0KDQotDQpSZWdpc3Rl
cmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtl
eW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

