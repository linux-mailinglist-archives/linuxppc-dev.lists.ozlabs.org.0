Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F18508240
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 09:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjsqK17Sdz3bns
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 17:33:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kjspp4DV7z2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 17:33:22 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-165-jcx-0iaIPGatONrL5yGJ_Q-1; Wed, 20 Apr 2022 08:32:04 +0100
X-MC-Unique: jcx-0iaIPGatONrL5yGJ_Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Wed, 20 Apr 2022 08:32:02 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Wed, 20 Apr 2022 08:32:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'He Zhe' <zhe.he@windriver.com>, Kees Cook <keescook@chromium.org>
Subject: RE: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Thread-Topic: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Thread-Index: AQHYU/YpuaYuTiSSXEqj2VkDLnuG5qz4aD5A
Date: Wed, 20 Apr 2022 07:32:01 +0000
Message-ID: <9e5c394e82ec44e1887ebebe777a97f2@AcuMS.aculab.com>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-3-zhe.he@windriver.com>
 <202204181457.9DE190CE@keescook>
 <b328bed3-ebb9-6fba-9585-79946262c40f@windriver.com>
In-Reply-To: <b328bed3-ebb9-6fba-9585-79946262c40f@windriver.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "bp@alien8.de" <bp@alien8.de>, "svens@linux.ibm.com" <svens@linux.ibm.com>,
 "jolsa@kernel.org" <jolsa@kernel.org>,
 "namhyung@kernel.org" <namhyung@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiA+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcyBpbXBsZW1lbnRhdGlvbiEgT25lIHJlYXNvbiB1c2Vy
Y29weSBoYXJkZW5pbmcNCj4gPiBkaWRuJ3QgcGVyc3VlIGRvaW5nIGEgImZ1bGwiIHN0YWNrdHJh
Y2Ugd2FzIGJlY2F1c2UgaXQgc2VlbWVkIHJlbGF0aXZlbHkNCj4gPiBleHBlbnNpdmUuIERpZCB5
b3UgZG8gYW55IHVzZXJjb3B5LWhlYXZpbHkgd29ya2xvYWQgdGVzdGluZyB0byBzZWUgaWYNCj4g
PiB0aGVyZSB3YXMgYSBub3RpY2VhYmxlIHBlcmZvcm1hbmNlIGltcGFjdD8NCg0KTG9vayBhdCBh
bnl0aGluZyB0aGF0IHVzZXMgc2VuZG1zZygpLg0KSXQgaXMgbm90aWNlYWJseSBtb3JlIGV4cGVu
c2l2ZSB0aGFuIHNlbmR0bygpLg0KQWxsIHRoZSBleHRyYSBjb3B5X2Zyb21fdXNlcigpIGNhdXNl
IG1lYXN1cmFibGUgc2xvdyBzbG93ZG93bnMuDQpVc2luZyBfX2NvcHlfZnJvbV91c2VyKCkodG8g
YXZvaWQgJ2hhcmRlbmRpbmcnKSBpbiB0aGUgc29ja2V0IGNvZGUNCmFuZCB3aGVuIHJlYWRpbmcg
dGhlIGlvdltdIGdpdmVzIGEgbWVhc3VyYWJsZSBpbXByb3ZlbWVudC4NCg0KCURhdmlkDQoNCi0N
ClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBN
aWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxl
cykNCg==

