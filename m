Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D583207747
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 17:22:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sRhP3t0hzDqlS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 01:21:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sRcn3MyPzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 01:18:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OzpoSzSO3ZwwkTaaz+DbzEmnMWM/twLb1Ew9uO9Omg4=; b=IiAut47R5a9gS07Hg7ZrLDUswa
 MPDOrqrb35FNW7KA4s0pUdZ+xW7oaaLhOoeJiu9J+UTLn/Qj+ir5baR9VA7kEydjQwVr4EB3fZcl1
 UDWmBsrI+TkqD4KDiZAQKns4WXZ8EvOchOT2GpbdTro1j6tZQa9K4MwEydqHn12TfL+dOAUZbtzk6
 knDrzkV/e9M9xycx+wIfsS57Dwf6vaVxcQkDVYa96lmKIONLDVeVIGvZLcKENzqqTC7rZJHYnTbf3
 aKNMRDwBPvihLQrDIWqXFNrvsBzZsruACWqWCs1VrhRRLtKG9pkW8T7/p0yi5CvGJhUvk1loFIU9p
 +Q/nmH+w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo7AG-0003Sa-Sx; Wed, 24 Jun 2020 15:18:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 97715301A7A;
 Wed, 24 Jun 2020 17:18:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8CDC9203CDC50; Wed, 24 Jun 2020 17:18:14 +0200 (CEST)
Date: Wed, 24 Jun 2020 17:18:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200624151814.GI4781@hirez.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
 <20200623181232.GB4800@hirez.programming.kicks-ass.net>
 <20200623202404.GE2483@worktop.programming.kicks-ass.net>
 <20200624113246.GA170324@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624113246.GA170324@elver.google.com>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 paulmck@kernel.org, bigeasy@linutronix.de, x86@kernel.org,
 heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 davem@davemloft.net, "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 sparclinux@vger.kernel.org, linux@armlinux.org.uk, tglx@linutronix.de,
 will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 24, 2020 at 01:32:46PM +0200, Marco Elver wrote:
> From: Marco Elver <elver@google.com>
> Date: Wed, 24 Jun 2020 11:23:22 +0200
> Subject: [PATCH] kcsan: Make KCSAN compatible with new IRQ state tracking
> 
> The new IRQ state tracking code does not honor lockdep_off(), and as
> such we should again permit tracing by using non-raw functions in
> core.c. Update the lockdep_off() comment in report.c, to reflect the
> fact there is still a potential risk of deadlock due to using printk()
> from scheduler code.
> 
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>

Thanks!

I've put this in front of the series at hand. I'll wait a little while
longer for arch people to give feedback on their header patches before I
stuff the lot into tip/locking/core.
