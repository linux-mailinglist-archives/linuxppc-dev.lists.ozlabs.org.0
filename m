Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD269314BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 14:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WN29g3pjSz3dLn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 22:50:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 356 seconds by postgrey-1.37 at boromir; Mon, 15 Jul 2024 22:50:06 AEST
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WN29B6W3Wz3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 22:50:05 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-4-SUXMSojjO4CMOodAlWhuTQ-1; Mon, 15 Jul 2024 13:42:55 +0100
X-MC-Unique: SUXMSojjO4CMOodAlWhuTQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 15 Jul
 2024 13:42:08 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 15 Jul 2024 13:42:08 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nicholas Piggin' <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH v4 12/17] powerpc64/ftrace: Move ftrace sequence out
 of line
Thread-Topic: [RFC PATCH v4 12/17] powerpc64/ftrace: Move ftrace sequence out
 of line
Thread-Index: AQHa1pCD4cP620l/NEOwGIoX3oyFIrH3uX7Q
Date: Mon, 15 Jul 2024 12:42:08 +0000
Message-ID: <e7e31eaa04234dddaac660a38adedee4@AcuMS.aculab.com>
References: <cover.1720942106.git.naveen@kernel.org>
 <9cf2cdddba74ec167ae1af5ec189bba8f704fb51.1720942106.git.naveen@kernel.org>
 <D2PYW90LRVAY.3PCE9P3NE2NEB@gmail.com>
In-Reply-To: <D2PYW90LRVAY.3PCE9P3NE2NEB@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii
 Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogTmljaG9sYXMgUGlnZ2luDQo+IFNlbnQ6IDE1IEp1bHkgMjAyNCAwOToyNQ0KPiANCj4g
T24gU3VuIEp1bCAxNCwgMjAyNCBhdCA2OjI3IFBNIEFFU1QsIE5hdmVlbiBOIFJhbyB3cm90ZToN
Cj4gPiBGdW5jdGlvbiBwcm9maWxlIHNlcXVlbmNlIG9uIHBvd2VycGMgaW5jbHVkZXMgdHdvIGlu
c3RydWN0aW9ucyBhdCB0aGUNCj4gPiBiZWdpbm5pbmcgb2YgZWFjaCBmdW5jdGlvbjoNCj4gPiAJ
bWZscglyMA0KPiA+IAlibAlmdHJhY2VfY2FsbGVyDQo+ID4NCj4gPiBUaGUgY2FsbCB0byBmdHJh
Y2VfY2FsbGVyKCkgZ2V0cyBub3AnZWQgb3V0IGR1cmluZyBrZXJuZWwgYm9vdCBhbmQgaXMNCj4g
PiBwYXRjaGVkIGluIHdoZW4gZnRyYWNlIGlzIGVuYWJsZWQuDQo+ID4NCj4gPiBHaXZlbiB0aGUg
c2VxdWVuY2UsIHdlIGNhbm5vdCByZXR1cm4gZnJvbSBmdHJhY2VfY2FsbGVyIHdpdGggJ2Jscicg
YXMgd2UNCj4gPiBuZWVkIHRvIGtlZXAgTFIgYW5kIHIwIGludGFjdC4gVGhpcyByZXN1bHRzIGlu
IGxpbmsgc3RhY2sgKHJldHVybg0KPiA+IGFkZHJlc3MgcHJlZGljdG9yKSBpbWJhbGFuY2Ugd2hl
biBmdHJhY2UgaXMgZW5hYmxlZC4gVG8gYWRkcmVzcyB0aGF0LCB3ZQ0KPiA+IHdvdWxkIGxpa2Ug
dG8gdXNlIGEgdGhyZWUgaW5zdHJ1Y3Rpb24gc2VxdWVuY2U6DQo+ID4gCW1mbHIJcjANCj4gPiAJ
YmwJZnRyYWNlX2NhbGxlcg0KPiA+IAltdGxyCXIwDQo+ID4NCj4gPiBGdXJ0aGVyIG1vcmUsIHRv
IHN1cHBvcnQgRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxMX09QUywgd2UgbmVlZCB0bw0KPiA+IHJl
c2VydmUgdHdvIGluc3RydWN0aW9uIHNsb3RzIGJlZm9yZSB0aGUgZnVuY3Rpb24uIFRoaXMgcmVz
dWx0cyBpbiBhDQo+ID4gdG90YWwgb2YgZml2ZSBpbnN0cnVjdGlvbiBzbG90cyB0byBiZSByZXNl
cnZlZCBmb3IgZnRyYWNlIHVzZSBvbiBlYWNoDQo+ID4gZnVuY3Rpb24gdGhhdCBpcyB0cmFjZWQu
DQo+ID4NCj4gPiBNb3ZlIHRoZSBmdW5jdGlvbiBwcm9maWxlIHNlcXVlbmNlIG91dC1vZi1saW5l
IHRvIG1pbmltaXplIGl0cyBpbXBhY3QuDQo+ID4gVG8gZG8gdGhpcywgd2UgcmVzZXJ2ZSBhIHNp
bmdsZSBub3AgYXQgZnVuY3Rpb24gZW50cnkgdXNpbmcNCj4gPiAtZnBhdGNoYWJsZS1mdW5jdGlv
bi1lbnRyeT0xIGFuZCBhZGQgYSBwYXNzIG9uIHZtbGludXgubyB0byBkZXRlcm1pbmUNCj4gPiB0
aGUgdG90YWwgbnVtYmVyIG9mIGZ1bmN0aW9ucyB0aGF0IGNhbiBiZSB0cmFjZWQuIFRoaXMgaXMg
dGhlbiB1c2VkIHRvDQo+ID4gZ2VuZXJhdGUgYSAuUyBmaWxlIHJlc2VydmluZyB0aGUgYXBwcm9w
cmlhdGUgYW1vdW50IG9mIHNwYWNlIGZvciB1c2UgYXMNCj4gPiBmdHJhY2Ugc3R1YnMsIHdoaWNo
IGlzIGJ1aWx0IGFuZCBsaW5rZWQgaW50byB2bWxpbnV4Lg0KPiANCj4gVGhlc2UgYXJlIGFsbCBn
b2luZyBpbnRvIC50cmFtcC5mdHJhY2UudGV4dCBBRkFJS1M/IFNob3VsZCB0aGF0IGJlDQo+IG1v
dmVkIGFmdGVyIHNvbWUgb2YgdGhlIG90aGVyIHRleHQgaW4gdGhlIGxpbmtlciBzY3JpcHQgdGhl
biBpZiBpdA0KPiBjb3VsZCBnZXQgcXVpdGUgbGFyZ2U/IHNjaGVkIGFuZCBsb2NrIGFuZCBvdGhl
ciB0aGluZ3Mgc2hvdWxkIGJlDQo+IGNsb3NlciB0byB0aGUgcmVzdCBvZiB0ZXh0IGFuZCBob3Qg
Y29kZS4NCg0KQ2FuJ3QgeW91IGFsbG9jYXRlIHRoZSBzcGFjZSBmb3IgdGhlICdmdW5jdGlvbiBw
cm9maWxlIHNlcXVlbmNlJw0KYXQgcnVuLXRpbWUgd2hlbiAoaWYpIGZ0cmFjZSBpcyBlbmFibGVk
Pw0KV2hlbiBmdHJhY2UgZ2V0cyBkaXNhYmxlZCBpdCBpcyBsaWtlbHkgcG9zc2libGUgdG8gc2F2
ZSB0aGUgdHJhbXBvbGluZQ0KbnVtYmVyIGluIHRoZSBub3AgLSBzbyB0aGUgc2FtZSBtZW1vcnkg
Y2FuIGJlIHVzZWQgbmV4dCB0aW1lLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNz
IExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAx
UFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

