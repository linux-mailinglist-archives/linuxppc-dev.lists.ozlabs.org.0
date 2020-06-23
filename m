Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 101552057F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 18:54:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rsnM2YqfzDqKM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 02:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=YgiRjbS+; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rsR3687KzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 02:38:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RzoHJHCZ7hm1ROHNKEIr2G/Z119807J1u519SSBhfx0=; b=YgiRjbS+IO71QOmY2cByo1vbGd
 Gr24I10sI0aOw80E4fgkhtZ/AKg3XhTw57Qw6cjSh/E0wUOY1uFLr5SvBxinBVMLvOYhvKKOIIOfS
 Ub2c1tYdQ/ZKB4e6yg6v3VKsF8VH6KvVMGJ6zlf5OFXjokqIYTpFZ4qOqMCAKFQbNhnfvbHyni2a+
 JPUMJ3W7qwtOc6iPpxmGRsIV7IeJ/WaFssNyCVTi/Zq3eC9ALn7KCDMlnIBgfSu2sLmSMiuBTZiyp
 ZYlO+YF76UT2iHB4NtD8Ja0m0I+D7XNLD2TfRoqDaV66RGO6WCaPNE0OI96yvwqw/YM4+1ZjVmLv+
 yI8aQuBg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnlvS-0002Zv-1A; Tue, 23 Jun 2020 16:37:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C847F300F28;
 Tue, 23 Jun 2020 18:37:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B66FF234EBA5B; Tue, 23 Jun 2020 18:37:30 +0200 (CEST)
Date: Tue, 23 Jun 2020 18:37:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Ahmed S. Darwish" <a.darwish@linutronix.de>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623163730.GA4800@hirez.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
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
Cc: linux-s390@vger.kernel.org, elver@google.com, linuxppc-dev@lists.ozlabs.org,
 bigeasy@linutronix.de, x86@kernel.org, heiko.carstens@de.ibm.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, davem@davemloft.net,
 sparclinux@vger.kernel.org, linux@armlinux.org.uk, tglx@linutronix.de,
 will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 06:13:21PM +0200, Ahmed S. Darwish wrote:
> Well, freshly merged code is using it. For example, KCSAN:
> 
>     => f1bc96210c6a ("kcsan: Make KCSAN compatible with lockdep")
>     => kernel/kcsan/report.c:
> 
>     void kcsan_report(...)
>     {
> 	...
>         /*
>          * With TRACE_IRQFLAGS, lockdep's IRQ trace state becomes corrupted if
>          * we do not turn off lockdep here; this could happen due to recursion
>          * into lockdep via KCSAN if we detect a race in utilities used by
>          * lockdep.
>          */
>         lockdep_off();
> 	...
>     }

Marco, do you remember what exactly happened there? Because I'm about to
wreck that. That is, I'm going to make TRACE_IRQFLAGS ignore
lockdep_off().
