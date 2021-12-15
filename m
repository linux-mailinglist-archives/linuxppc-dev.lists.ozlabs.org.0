Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC489476BD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:24:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4sd4rKjz3fdt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:24:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fVGVY8wq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fVGVY8wq; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDjMb4x3vz3bYW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 04:45:45 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so21063653pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 09:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RLdWdHoT6O3wLXgWsRx2m2m62hSjV0BcJXlTjn5JUFY=;
 b=fVGVY8wqrxR8Y9FDXFtr4SE6iyR8BVVbZ5vgJ4y8dkqTnryOyAM1f7oIOnezuj4A6J
 xZUPr4yWMlNLYsHQ1fallxSJg8aU00+SwAnq0ijeJb6rpCasKd3VYye0HMu7Rz4Fmzli
 VTY7ooY+g0kHA+TAUoyyLgzX0mSn9ha1KmFllLdg51BzQBC+Mgmo9+XdPBjphX6Y4e34
 aHA3UHFWRC7Btex9u1tZiEFoYFee/G/WGm4rYd3nNUPqV0MpixQGc6Vx0PruHv6wejmQ
 Ow0n2j4fyu9ba9vCZKTh9cTJvx1bERx0Yn7rh5DuRA2QxMZuAeUzJXU06wIQ9Mevfcss
 WI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RLdWdHoT6O3wLXgWsRx2m2m62hSjV0BcJXlTjn5JUFY=;
 b=SlyJexG6wrxMxpACZiNdGDpnCmBGOpvTE7xsmxKjdKjJIYg6TAH4n86I5UDfS/dYVP
 eulxudSQN+k8IcNN2cDt8CeJVBNWCD7oJTEh/Fs4TKiruVmOsGPtYKc8j9XKmkMqXxMV
 U2fY8TaYGEw2nnuJcEK7j5j7X0M2U2Wh8YBLazmDeB1wp8mTkk7rzuEOe0CfX4lv6wpD
 5YmLZLINpp6wvUlOQI/4oA+Mv5wkay59LnBjAW16rvQXwX+cH+99b6+YMMXxgy1/S5rq
 SPaFXKMtfTTSh0jABDLBG4YLSu5jZ8T/n6OknSOL5H/ilOl8ylNPMNl84n1bovv28fMK
 ZDkw==
X-Gm-Message-State: AOAM530HesogkcfGhoI0Uf1mze5AlTJ8OHTUdGwzK1BovsuXMLHy5n35
 xi6VmFttSvbxjcNYViA1CtGeLGnEYhusSLHIWwU=
X-Google-Smtp-Source: ABdhPJxIcVzS1V95pBlMUcYP2k7Lrcyzl/rBNhnf3pbvrkTovj6aQvXpyQPCUffP2FcbLTl6T7AIgJQIhLFRrE2qAuQ=
X-Received: by 2002:a17:90a:4a06:: with SMTP id
 e6mr968675pjh.228.1639590342342; 
 Wed, 15 Dec 2021 09:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
 <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
 <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
In-Reply-To: <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Wed, 15 Dec 2021 09:45:30 -0800
Message-ID: <CAAH8bW-u5AsFTXUOJPRkF-6dk1LcL7PE0Tm+dUc9Ctb6JMy=tg@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,
 full} with bitmap_weight_eq()
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Christoph Lameter <cl@linux.com>, Christoph Hellwig <hch@lst.de>,
 Andi Kleen <ak@linux.intel.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Jens Axboe <axboe@fb.com>, Andy Lutomirski <luto@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dennis Zhou <dennis@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Will Deacon <will@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Geetha sowjanya <gakula@marvell.com>,
 Ian Rogers <irogers@google.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amitkumar Karwar <amitkarwar@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Jiri Olsa <jolsa@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
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

On Wed, Dec 15, 2021 at 12:41 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Yury Norov
> > Sent: 14 December 2021 19:43
> ...
> >
> > I think that for long bitmaps the most time consuming operation is moving
> > data to L1, and for short bitmaps the difference between approaches is
> > barely measurable.
> >
> > But hweght_long on each iteration can't be more effective than the current
> > version. So, I'll drop this patch for v2 and keep things unchanged.
>
> Actually do bitmap_full/empty() calls make any sense at all?
> The result is stale since bitmaps are designed to do locked operations.
> If you have a lock covering the bitmap then you should be using
> something that uses non-locked accesses.
> Rightly or wrongly that isn't the bitmap api.

Are you talking about __{set,clear}_bit()?
include/asm-generic/bitops/non-atomic.h
