Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1596737D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 13:05:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyLtS4SPMz3fGc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 23:05:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
X-Greylist: delayed 122 seconds by postgrey-1.36 at boromir; Thu, 19 Jan 2023 23:05:04 AEDT
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyLsr3gC1z3c6F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 23:05:04 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-287-xAOJsk7xO263fOVjhcvUfw-1; Thu, 19 Jan 2023 12:02:54 +0000
X-MC-Unique: xAOJsk7xO263fOVjhcvUfw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Jan
 2023 12:02:53 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Thu, 19 Jan 2023 12:02:53 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Athira Rajeev' <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>
Subject: RE: [PATCH V2] tools/perf/tests: Fix string substitutions in build id
 test
Thread-Topic: [PATCH V2] tools/perf/tests: Fix string substitutions in build
 id test
Thread-Index: AQHZK/ml5s18h1FtXky26yQzQ7zuR66lntwQ
Date: Thu, 19 Jan 2023 12:02:53 +0000
Message-ID: <17bd5aca40164637bfbd47da34811a13@AcuMS.aculab.com>
References: <20230119113054.31742-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230119113054.31742-1-atrajeev@linux.vnet.ibm.com>
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
Cc: "irogers@google.com" <irogers@google.com>, "ak@linux.intel.com" <ak@linux.intel.com>, "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "james.clark@arm.com" <james.clark@arm.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.ibm.com" <disgoel@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXRoaXJhIFJhamVldg0KPiBTZW50OiAxOSBKYW51YXJ5IDIwMjMgMTE6MzENCi4uLg0K
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi90ZXN0cy9zaGVsbC9idWlsZGlkLnNoIGIvdG9vbHMv
cGVyZi90ZXN0cy9zaGVsbC9idWlsZGlkLnNoDQo+IGluZGV4IGFhZjg1MTEwOGNhMy4uNDNlNDNl
MTMxYmU3IDEwMDc1NQ0KPiAtLS0gYS90b29scy9wZXJmL3Rlc3RzL3NoZWxsL2J1aWxkaWQuc2gN
Cj4gKysrIGIvdG9vbHMvcGVyZi90ZXN0cy9zaGVsbC9idWlsZGlkLnNoDQo+IEBAIC02Niw3ICs2
Niw3IEBAIGNoZWNrKCkNCj4gIAllc2FjDQo+ICAJZWNobyAiYnVpbGQgaWQ6ICR7aWR9Ig0KPiAN
Cj4gLQlsaW5rPSR7YnVpbGRfaWRfZGlyfS8uYnVpbGQtaWQvJHtpZDowOjJ9LyR7aWQ6Mn0NCj4g
KwlsaW5rPSR7YnVpbGRfaWRfZGlyfS8uYnVpbGQtaWQvJChlY2hvICR7aWR9fGN1dCAtYyAxLTIp
LyQoZWNobyAke2lkfXxjdXQgLWMgMy0pDQo+ICAJZWNobyAibGluazogJHtsaW5rfSINCg0KVGhh
dCBpcyBob3JyaWQsIHdoeSBub3QganVzdCB1c2UgdmFsaWQgc2hlbGwgc3Vic3RpdHV0aW9ucywg
ZWc6DQoJaWRfZmlsZT0ke2lkIz8/fQ0KCWlkX2Rpcj0ke2lkJSRpZF9maWxlfQ0KCWxpbms9JGJ1
aWxkX2lkX2Rpci8uYnVpbGQtaWQvJGlkX2Rpci8kaWRfZmlsZQ0KDQouLi4NCj4gLQljaGVjayAk
e0A6IC0xfQ0KPiArCWNoZWNrICRsYXN0DQoNClNpbmNlIHRoaXMgaXMgdGhlIGVuZCBvZiB0aGUg
c2hlbGwgZnVuY3Rpb24geW91IGNhbiBhdm9pZCB0aGUgZXZhbA0KYnkgZG9pbmc6DQoJc2hpZnQg
JCgoJCMgLSAxKSkNCgljaGVjayAkMQ0Kb3IgbWF5YmU6DQoJYXJncz0iJCoiDQoJY2hlY2sgJHth
cmdzIyMqIH0NCg0KVGhvc2Ugc2hvdWxkIGJlIG9rIGluIGFsbCBwb3NpeCBzaGVsbHMuDQoNCglE
YXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91
bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5
NzM4NiAoV2FsZXMpDQo=

