Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A42AC2712AB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 08:25:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvHcC0YT8zDqyY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 16:24:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=ZdXKJXZG; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=yd7i2Kht; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvHZc3gQnzDqtW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 16:23:36 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600583007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7fzEIVZ8tkjS2ndcSNVbu7zYvMlAYQ/NWyoKHxP3faw=;
 b=ZdXKJXZGwHl2KR4hH2q5cUf4dfgyefKiq5FJK4CdaiUzjuDw/zsfzyDwUT0Vb3vxnFMmA2
 GbGWdXGNam/BxDVayB/9W9lKW9cEGTy4k40j+g76SxOFKgyaP4kz+dJNXxDya0A6vacAHQ
 etbQkUBwH/pk7aVUdpmHO5hYMDrDQDP5KgAuzWF1TeBFDWPD7hNOa95TYtIkpNlkk7xqPo
 YZDmeBiMP6cP8bfVBIDyjT3CMK5xsUBeFdgoJYUZ63lHnZ5f4NanBw5QbC7HkoYRGwgBsy
 Bsz/o+mfvaeq05vAqvejTR9EViDozt0cf4n5wRrzHjQfCFUXuG/KuqeDB61mqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600583007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7fzEIVZ8tkjS2ndcSNVbu7zYvMlAYQ/NWyoKHxP3faw=;
 b=yd7i2KhtoQQ4HuYBfV4K2iDNHIVcqLD+eOCjOAMiHylcYwCzvC7AWTYk8VGrY+iNFLAu2j
 3+A+8QdYt6q7wFBw==
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <CAKMK7uENFDANQKebS_H0bhHeQRijrp1aVHQqyZPute3KBZ+fVQ@mail.gmail.com>
References: <20200919091751.011116649@linutronix.de>
 <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
 <CAKMK7uENFDANQKebS_H0bhHeQRijrp1aVHQqyZPute3KBZ+fVQ@mail.gmail.com>
Date: Sun, 20 Sep 2020 08:23:26 +0200
Message-ID: <87pn6hc6g1.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19 2020 at 12:37, Daniel Vetter wrote:
> On Sat, Sep 19, 2020 at 12:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>> I think it should be the case, but I want to double check: Will
>> copy_*_user be allowed within a kmap_temporary section? This would
>> allow us to ditch an absolute pile of slowpaths.
>
> (coffee just kicked in) copy_*_user is ofc allowed, but if you hit a
> page fault you get a short read/write. This looks like it would remove
> the need to handle these in a slowpath, since page faults can now be
> served in this new kmap_temporary sections. But this sounds too good
> to be true, so I'm wondering what I'm missing.

In principle we could allow pagefaults, but not with the currently
proposed interface which can be called from any context. Obviously if
called from atomic context it can't handle user page faults.

In theory we could make a variant which does not disable pagefaults, but
that's what kmap() already provides.

Thanks,

        tglx



