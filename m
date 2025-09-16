Return-Path: <linuxppc-dev+bounces-12286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C1FB58F68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 09:43:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQv5N6ZK3z301G;
	Tue, 16 Sep 2025 17:43:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758008584;
	cv=none; b=NQJjSPT/zPVF+TzSOnTtZJUTEvJ46VTQXPigad3PY2fL3IoKJ8/rjIkiVGWVMuh/pxiD69SH5M9qIXdcdnRGr1soxDFLTvokN+R8MWWzuCH5xGsE0TpsLWH/qGrOuF3dqAXtKzwlqUIlwl6OhpIORRG0Y38ca01By+ZuUj9FP+xjcdhT3iFKmTNEt3np8/KQYA3uuU1qD5t0k9puTcFqqd0Tw0KNjfCtueUpV2CIfPIjKmdIl3Fb2Gg4jCpluUaMvHcIhboUK+9f4KwNM3A/2HNj7XYeCR5yTZHb+jQXWUKUguAITyRp0Tmw/VbgoGWo4yIPsfFWk7ERZ2vEk56CCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758008584; c=relaxed/relaxed;
	bh=8sHRCjw7e9Pd75QxDAA6YpRMq4pTFEZknMvfD29JhSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=docE+pjopV5GKaLq0bYdXqLxFomZXiCjr5WXnDcYIJxbFx9FLQjQsB4XZFRwdAZSVYz3UbJvwQEFEoIGlJkN3/7GBNMLhqGwZnhBii2nmFrXoykLtOsSgQegRjTAWbgQeYfXfZRUkzmAbOqEv8bukmuJ2kuERTUiwjHnb1BJbpwSwF0EMs7ItXjWnKgjtivwusxJfdUoDz7rt8OsBXZSZArZelAFMl58PZPPZpgo2t0gFukffLSalJ+FJEVUEqeGjBwexLGIJ9JtkEAMA7z0yI0QORaW8GjJ5Vrj7ZuPnr1OapLm75fafkByjEPhe/ER0ImOecDXvIq7/DHcBHfwtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=EqS9SBlE; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=EqS9SBlE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQv5K3hjzz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 17:43:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8sHRCjw7e9Pd75QxDAA6YpRMq4pTFEZknMvfD29JhSE=; b=EqS9SBlE80vGVB+xlDQMNuvMLV
	0fMuIOJTRGJ4WoNMyn+3AdSEjCOd6me78zIoQA0iOD0NvscxJd49pnTIZTEgt42ARaI6WDZ3y8S7z
	SBLHlAqRFtvoVNqyvFZXEFDVerPjCag7B2ITXdrREd9P6v9s83MVxSkEqu1y+FQd5SQIty5D/fxxG
	Vmdy54AML2uELeHK6us0F9F0RfxqMGyjcdBEr+8LXUH1+FW+GF6V5E+oSU4yO2InaB/q4N4DHs3ey
	aFNdNZ1IXIHr26GvZIx4rxnXVMquxgGsW1gh72uwDjaVuE1uK5NhndXG8Lys25qDbwn82Vam+yXb7
	CPHa5dhA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQKQ-0000000HFZv-3Lwg;
	Tue, 16 Sep 2025 07:42:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 522A8300134; Tue, 16 Sep 2025 09:42:17 +0200 (CEST)
Date: Tue, 16 Sep 2025 09:42:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
	akpm@linux-foundation.org, catalin.marinas@arm.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, kees@kernel.org, masahiroy@kernel.org,
	aliceryhl@google.com, ojeda@kernel.org,
	thomas.weissschuh@linutronix.de, xur@google.com,
	ruanjinjie@huawei.com, gshan@redhat.com, maz@kernel.org,
	suzuki.poulose@arm.com, zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com, gautam@linux.ibm.com, arnd@arndb.de,
	zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com,
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com,
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org,
	wangjinchao600@gmail.com, yury.norov@gmail.com,
	thorsten.blum@linux.dev, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] watchdog: remove HARDLOCKUP_DETECTOR_PERF
Message-ID: <20250916074217.GF3245006@noisy.programming.kicks-ass.net>
References: <20250915035355.10846-1-cuiyunhui@bytedance.com>
 <aMfpwYPX6_i6ROOY@willie-the-truck>
 <20250915103506.GA3245006@noisy.programming.kicks-ass.net>
 <CAD=FV=Vr67+uRK2bYu34MDXRJN4w_VH_EO7OW4eVLJ3wqUUBog@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vr67+uRK2bYu34MDXRJN4w_VH_EO7OW4eVLJ3wqUUBog@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 08:42:00AM -0700, Doug Anderson wrote:
> On Mon, Sep 15, 2025 at 3:35 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Sep 15, 2025 at 11:26:09AM +0100, Will Deacon wrote:
> >
> > >   | If all CPUs are hard locked up at the same time the buddy system
> > >   | can't detect it.
> > >
> > > Ok, so why is that limitation acceptable? It looks to me like you're
> > > removing useful functionality.
> >
> > Yeah, this. I've run into this case waaay too many times to think it
> > reasonable to remove the perf/NMI based lockup detector.
> 
> I am a bit curious how this comes to be in cases where you've seen it.
> What causes all CPUs to be stuck looping all with interrupts disabled
> (but still able to execute NMIs)? Certainly one can come up with a
> synthetic way to make that happen, but I would imagine it to be
> exceedingly rare in real life. Maybe all CPUs are deadlocked waiting
> on spinlocks or something? There shouldn't be a lot of other reasons
> that all CPUs should be stuck indefinitely with interrupts disabled...

The simplest one I often run into is rq->lock getting stuck and then all
the other CPUs piling up on that in various ways.

Getting stop_machine() stuck is also a fun one.

I mean, it really isn't that hard. If, as a full time kernel dev, you
don't get into this situation at least a few time a year, you're just
not doing your job right ;-)

> If that's what's happening, (just spitballing) I wonder if hooking
> into the slowpath of spinlocks to look for lockups would help? Maybe
> every 10000 failures to acquire the spinlock we check for a lockup?
> Obviously you could still come up with synthetic ways to make a
> non-caught watchdog, but hopefully in those types of cases we can at
> least reset the device with a hardware watchdog?

Now, why would I want to make the spinlock code worse if I have a
perfectly functional NMI watchdog?

> Overall the issue is that it's really awkward to have both types of
> lockup detectors, especially since you've got to pick at compile time.

Well, then go fix that. Surely this isn't rocket science.

> The perf lockup detector has a pile of things that make it pretty
> awkward and it seems like people have been toward the buddy detector
> because of this...

There's nothing awkward about the perf one, except that it takes one
counter, and some people are just greedy and want all of them. At the
same time, there are people posting patches that use the PMU for
page-promotion like things, so these same greedy people are going to
hate on that too.

