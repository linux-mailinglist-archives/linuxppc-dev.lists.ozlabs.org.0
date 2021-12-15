Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D382C476B74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:09:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4XW5xD0z3cRt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:09:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDTH91gJkz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 19:41:06 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-23-f8sISgTNNZG0D9h8G8bq7w-1; Wed, 15 Dec 2021 08:40:15 +0000
X-MC-Unique: f8sISgTNNZG0D9h8G8bq7w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 08:40:11 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Wed, 15 Dec 2021 08:40:11 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Yury Norov' <yury.norov@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?=
 <mirq-linux@rere.qmqm.pl>
Subject: RE: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Thread-Topic: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Thread-Index: AQHX8SLbxx6fx2pSKEyBSY04FwbBf6wzO5+g
Date: Wed, 15 Dec 2021 08:40:10 +0000
Message-ID: <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
 <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
In-Reply-To: <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
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
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Christoph Lameter <cl@linux.com>, Christoph Hellwig <hch@lst.de>,
 Andi Kleen <ak@linux.intel.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jens Axboe <axboe@fb.com>, Andy Lutomirski <luto@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup.patel@wdc.com>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Roy Pledge <Roy.Pledge@nxp.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Solomon Peachy <pizza@shaftnet.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Dennis Zhou <dennis@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Kalle Valo <kvalo@codeaurora.org>,
 Stephen Boyd <sboyd@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Ulf
 Hansson <ulf.hansson@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 Geetha sowjanya <gakula@marvell.com>, Ian Rogers <irogers@google.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amitkumar Karwar <amitkarwar@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Jiri Olsa <jolsa@redhat.com>, Ard
 Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Alexey Klimov <aklimov@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Hans de Goede <hdegoede@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Wojtas <mw@semihalf.com>, Vlastimil Babka <vbabka@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogWXVyeSBOb3Jvdg0KPiBTZW50OiAxNCBEZWNlbWJlciAyMDIxIDE5OjQzDQouLi4NCj4g
DQo+IEkgdGhpbmsgdGhhdCBmb3IgbG9uZyBiaXRtYXBzIHRoZSBtb3N0IHRpbWUgY29uc3VtaW5n
IG9wZXJhdGlvbiBpcyBtb3ZpbmcNCj4gZGF0YSB0byBMMSwgYW5kIGZvciBzaG9ydCBiaXRtYXBz
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYXBwcm9hY2hlcyBpcw0KPiBiYXJlbHkgbWVhc3VyYWJs
ZS4NCj4gDQo+IEJ1dCBod2VnaHRfbG9uZyBvbiBlYWNoIGl0ZXJhdGlvbiBjYW4ndCBiZSBtb3Jl
IGVmZmVjdGl2ZSB0aGFuIHRoZSBjdXJyZW50DQo+IHZlcnNpb24uIFNvLCBJJ2xsIGRyb3AgdGhp
cyBwYXRjaCBmb3IgdjIgYW5kIGtlZXAgdGhpbmdzIHVuY2hhbmdlZC4NCg0KQWN0dWFsbHkgZG8g
Yml0bWFwX2Z1bGwvZW1wdHkoKSBjYWxscyBtYWtlIGFueSBzZW5zZSBhdCBhbGw/DQpUaGUgcmVz
dWx0IGlzIHN0YWxlIHNpbmNlIGJpdG1hcHMgYXJlIGRlc2lnbmVkIHRvIGRvIGxvY2tlZCBvcGVy
YXRpb25zLg0KSWYgeW91IGhhdmUgYSBsb2NrIGNvdmVyaW5nIHRoZSBiaXRtYXAgdGhlbiB5b3Ug
c2hvdWxkIGJlIHVzaW5nDQpzb21ldGhpbmcgdGhhdCB1c2VzIG5vbi1sb2NrZWQgYWNjZXNzZXMu
DQpSaWdodGx5IG9yIHdyb25nbHkgdGhhdCBpc24ndCB0aGUgYml0bWFwIGFwaS4NCg0KCURhdmlk
DQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBG
YXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2
IChXYWxlcykNCg==

