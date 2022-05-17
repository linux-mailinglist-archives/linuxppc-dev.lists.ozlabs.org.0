Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3252AE8C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 01:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2skR3X04z3cD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 09:28:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DqdZibKK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DqdZibKK; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2j9K0c8Pz2yHt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 03:02:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652806965; x=1684342965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wPndYlW5xEVdpcc0zA72NXu9ypQzfs4FPZzk6VJMkkY=;
 b=DqdZibKKMZvM0rMODm5t39WHi5aUVxFL3+1uc63l8AuMBg0L4TJK0xqO
 jm4Ok2LrDUD6u815qRg24KP0XUMm9YBz3iUoyVpj9yk9ucW7wXw8J5o6v
 5WOyMpwXkxz8T9KOU/kEUUVXZjHaOlphAjqxoqhPZCw7rcG95RfqBwKrf
 9hgn6tkFRghqJM+DnkfNsodgg6Ahnq90wyqCc/V6Re2im3oMRxJOZEdtk
 7j6Rsfrd61df0vJwkuH3yS3iOtfc5z/NDsIFj8Thtor8zq7M2umMd847N
 zaqnXh8Y/NNce8fPAKX+d88xL1gTfy2It5cg6PPWrD9BKsX6KB8fW2prj w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271199529"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="271199529"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="700144313"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 May 2022 10:02:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 10:02:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 10:02:31 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Tue, 17 May 2022 10:02:31 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek
 <pmladek@suse.com>, Dinh Nguyen <dinguyen@kernel.org>
Subject: RE: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Thread-Topic: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Thread-Index: AQHYWooLnXaT7guJw0OCpuGv/IkEoK0iJCSAgAAZuAD//40QkIAAesuAgAFqbACAACtDgP//jcxA
Date: Tue, 17 May 2022 17:02:31 +0000
Message-ID: <06d85642fef24bc482642d669242654b@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
 <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
In-Reply-To: <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 May 2022 09:23:23 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Matt
 Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 Alex Elder <elder@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "d.hatayama@jp.fujitsu.com" <d.hatayama@jp.fujitsu.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Corey Minyard <minyard@acm.org>, Helge Deller <deller@gmx.de>,
 "vgoyal@redhat.com" <vgoyal@redhat.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, Vasily
 Gorbik <gor@linux.ibm.com>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
 "hidehiro.kawai.ez@hitachi.com" <hidehiro.kawai.ez@hitachi.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Chris Zankel <chris@zankel.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 James Morse <james.morse@arm.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "fabiomirmar@gmail.com" <fabiomirmar@gmail.com>,
 "halves@canonical.com" <halves@canonical.com>,
 "alejandro.j.jimenez@oracle.com" <alejandro.j.jimenez@oracle.com>, "Tang,
 Feng" <feng.tang@intel.com>, "will@kernel.org" <will@kernel.org>,
 "bhe@redhat.com" <bhe@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>,
 Dexuan Cui <decui@microsoft.com>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Robert Richter <rric@kernel.org>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "arnd@arndb.de" <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "mikelley@microsoft.com" <mikelley@microsoft.com>, "H. Peter
 Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Richard
 Weinberger <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "dyoung@redhat.com" <dyoung@redhat.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>, Heiko
 Carstens <hca@linux.ibm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBUb255IC8gRGluaCAtIGNhbiBJIGp1c3QgKnNraXAqIHRoaXMgbm90aWZpZXIgKmlmIGtkdW1w
KiBpcyBzZXQgb3IgZWxzZQ0KPiB3ZSBydW4gdGhlIGNvZGUgYXMtaXM/IERvZXMgdGhhdCBtYWtl
IHNlbnNlIHRvIHlvdT8NCg0KVGhlICJza2lwIiBvcHRpb24gc291bmRzIGxpa2UgaXQgbmVlZHMg
c29tZSBzcGVjaWFsIGZsYWcgYXNzb2NpYXRlZCB3aXRoDQphbiBlbnRyeSBvbiB0aGUgbm90aWZp
ZXIgY2hhaW4uIEJ1dCB0aGVyZSBhcmUgb3RoZXIgbm90aWZpZXIgY2hhaW5zIC4uLiBzbyB0aGF0
DQpzb3VuZHMgbWVzc3kgdG8gbWUuDQoNCkp1c3QgYWxsIHRoZSBub3RpZmllcnMgaW4gcHJpb3Jp
dHkgb3JkZXIuIElmIGFueSB3YW50IHRvIHRha2UgZGlmZmVyZW50IGFjdGlvbnMNCmJhc2VkIG9u
IGtkdW1wIHN0YXR1cywgY2hhbmdlIHRoZSBjb2RlLiBUaGF0IHNlZW1zIG1vcmUgZmxleGlibGUg
dGhhbg0KYW4gImFsbCBvciBub3RoaW5nIiBhcHByb2FjaCBieSBza2lwcGluZy4NCg0KLVRvbnkN
Cg==
