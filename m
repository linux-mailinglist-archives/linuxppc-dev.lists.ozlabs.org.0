Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE383DFAED
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 07:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfftN3ysSz3dgN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:09:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LwdXqV6T;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CjGblo5J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=LwdXqV6T; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=CjGblo5J; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfKbj5nGKz307n
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 02:10:41 +1000 (AEST)
Date: Tue, 3 Aug 2021 18:10:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1628007036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZhCR89X1oG7iNKpxBHqwK160maOrSQVKgeomxdN0wRc=;
 b=LwdXqV6TEL+jelWYIVu/L1AwkukJUhfDeR6fxf6HaCffMyf5pGalG64DdzD6SrFbnK74/x
 PVNjb7a8JiALCQD3CJBVmxfKVnGPRCXtU70BUFy11admR5LtOLT9dQeI/ENtXdJ/CkhTdc
 pZNvsYTpT+QPzjRhgzvNT0CjgoFJhxwmycapteSubpDkPSBjZ+FP8bxnvUSWW30Gz0Y7dW
 1ffy1Rr5tDaLDwQ1cWTtCeME4yw92tE3YUaDago5Lw9pEtw1H1L8au8do+a32W2/sN3gs0
 btcFKclunpFVufnMA6+fMpSDPoeRfMtyi+RFwzALyjj/jtaWzgKiRMXG8gO4tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1628007036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZhCR89X1oG7iNKpxBHqwK160maOrSQVKgeomxdN0wRc=;
 b=CjGblo5JavDHAEsakSWenCqJ60bnDYFeC+TGn7n/YdarB5rRq+iJbcWjrVSzA5F0n0kDM4
 Vc1wmHGVCRR8DGCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 00/38] Replace deprecated CPU-hotplug
Message-ID: <20210803161033.vp3o34meyw3ek43z@linutronix.de>
References: <20210803141621.780504-1-bigeasy@linutronix.de>
 <83dc5dfd-1ed0-f428-826f-fb819911fc89@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <83dc5dfd-1ed0-f428-826f-fb819911fc89@redhat.com>
X-Mailman-Approved-At: Wed, 04 Aug 2021 15:05:41 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Ben Segall <bsegall@google.com>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 linux-acpi@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Petr Mladek <pmladek@suse.com>,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 tglx@linutronix.de, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karol Herbst <karolherbst@gmail.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@kernel.org>,
 linux-s390@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Gonglei <arei.gonglei@huawei.com>,
 Len Brown <lenb@kernel.org>, Mike Travis <mike.travis@hpe.com>,
 coresight@lists.linaro.org, kvm-ppc@vger.kernel.org,
 John Stultz <john.stultz@linaro.org>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jason Wang <jasowang@redhat.com>, Amit Kucheria <amitk@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, platform-driver-x86@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>, Mark Gross <mgross@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiri Kosina <jikos@kernel.org>, Josh Triplett <josh@joshtriplett.org>,
 rcu@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-hwmon@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>,
 live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
 Jiri Olsa <jolsa@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-raid@vger.kernel.org,
 Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, linux-edac@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 Leo Yan <leo.yan@linaro.org>, Borislav Petkov <bp@alien8.de>,
 linuxppc-dev@lists.ozlabs.org, Karsten Graul <kgraul@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-08-03 17:30:40 [+0200], Hans de Goede wrote:
> Hi Sebastien,
Hi Hans,

> On 8/3/21 4:15 PM, Sebastian Andrzej Siewior wrote:
> > This is a tree wide replacement of the deprecated CPU hotplug functions
> > which are only wrappers around the actual functions.
> > 
> > Each patch is independent and can be picked up by the relevant maintainer.
> 
> Ok; and I take it that then also is the plan for merging these ?
> 
> FWIW I'm fine with the drivers/platform/x86 patch going upstream
> through some other tree if its easier to keep the set together ...

There is no need to keep that set together since each patch is
independent. Please merge it through your tree.

> Regards,
> 
> Hans

Sebastian
