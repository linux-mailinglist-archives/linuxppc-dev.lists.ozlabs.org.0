Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993F529320
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 23:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2CWr05Mwz3dqv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 07:47:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IEEySbr3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IEEySbr3; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L24DV5qgJz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 02:18:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652717899; x=1684253899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+l+W5AAGJYF9POu96DFeN42Yp1wDBbNs2cT6ebzm1Q4=;
 b=IEEySbr3eUs9JvlaYYTcjkma3zu78636IYQ2dSKHrnUhp7zwNqTTeNTN
 WI3r9S8VzjTe4OsvTpBP07pD1X/SFAZWG1Wxr0DNqt3n082G7rgFrnbfc
 GG9wWiteI/mfC8TMoWtY2LQk1NYmYg6PFxfifQAcB6wY9YQxzj/L1SAsP
 yfvcvOvFZVVLJApaObFVRzEdotyFmgGoEoX7qHjH24TU2TZq63JCybBcT
 1/jt+AzytKRb3OQf/5rtCVKCL6qlqDx+oJf9fJqfn54mrOrDNGdWyCO+O
 IRTDdeigqAH9JFijaE8FREtH5GmWPAu75UHEXOZdJZvWLIKfHCfeYl8FT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="333933144"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="333933144"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 09:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="596591798"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 16 May 2022 09:18:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 16 May 2022 09:18:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 16 May 2022 09:18:04 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Mon, 16 May 2022 09:18:04 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek
 <pmladek@suse.com>, Dinh Nguyen <dinguyen@kernel.org>
Subject: RE: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Thread-Topic: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Thread-Index: AQHYWooLnXaT7guJw0OCpuGv/IkEoK0iJCSAgAAZuAD//40QkA==
Date: Mon, 16 May 2022 16:18:04 +0000
Message-ID: <bed66b9467254a5a8bafc1983dad643a@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
In-Reply-To: <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
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
X-Mailman-Approved-At: Tue, 17 May 2022 07:40:39 +1000
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

PiBTbywgbXkgcmVhc29uaW5nIGhlcmUgaXM6IHRoaXMgbm90aWZpZXIgc2hvdWxkIGZpdCB0aGUg
aW5mbyBsaXN0LA0KPiBkZWZpbml0ZWx5ISBCdXQuLi5pdCdzIHZlcnkgaGlnaCByaXNrIGZvciBr
ZHVtcC4gSXQgZGVlcCBkaXZlcyBpbnRvIHRoZQ0KPiByZWdtYXAgQVBJICh0aGVyZSBhcmUgbG9j
a3MgaW4gc3VjaCBjb2RlKSBwbHVzIHRoZXJlIGlzIGFuIChNTSlJTyB3cml0ZQ0KPiB0byB0aGUg
ZGV2aWNlIGFuZCBhbiBBUk0gZmlybXdhcmUgY2FsbC4gU28sIGRlc3BpdGUgdGhlIG5hdHVyZSBv
ZiB0aGlzDQo+IG5vdGlmaWVyIF9maXRzIHRoZSBpbmZvcm1hdGlvbmFsIGxpc3RfLCB0aGUgX2Nv
ZGUgaXMgcmlza3lfIHNvIHdlIHNob3VsZA0KPiBhdm9pZCBydW5uaW5nIGl0IGJlZm9yZSBhIGtk
dW1wLg0KPg0KPiBOb3csIHdlIGluZGVlZCBoYXZlIGEgY2hpY2tlbi9lZ2cgcHJvYmxlbTogd2Fu
dCB0byBhdm9pZCBpdCBiZWZvcmUNCj4ga2R1bXAsIEJVVCBpbiBjYXNlIGtkdW1wIGlzIG5vdCBz
ZXQsIGttc2dfZHVtcCgpIChhbmQgY29uc29sZSBmbHVzaGluZywNCj4gYWZ0ZXIgeW91ciBzdWdn
ZXN0aW9uIFBldHIpIHdpbGwgcnVuIGJlZm9yZSBpdCBhbmQgbm90IHNhdmUgY29sbGVjdGVkDQo+
IGluZm9ybWF0aW9uIGZyb20gRURBQyBQb1YuDQoNCldvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGhh
dmUgc29tZSBnbG9iYWwgImtkdW1wIGlzIGNvbmZpZ3VyZWQgKyBlbmFibGVkIiBmbGFnPw0KDQpU
aGVuIG5vdGlmaWVycyBjb3VsZCBtYWtlIGFuIGluZm9ybWVkIGNob2ljZSBvbiB3aGV0aGVyIHRv
IGRlZXAgZGl2ZSB0bw0KZ2V0IGFsbCB0aGUgcG9zc2libGUgZGV0YWlscyAod2hlbiB0aGVyZSBp
cyBubyBrZHVtcCkgb3IganVzdCBza2ltIHRoZSBoaWdoDQpsZXZlbCBzdHVmZiAodG8gbWF4aW1p
emUgY2hhbmNlIG9mIGdldHRpbmcgYSBzdWNjZXNzZnVsIGtkdW1wKS4NCg0KLVRvbnkNCg==
