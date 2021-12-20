Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF947B491
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 21:53:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHsJF6FFTz3bT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 07:53:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=enGWQQJi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=enGWQQJi; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHlhl2pvtz3dqQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:41:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 500EDB80F98;
 Mon, 20 Dec 2021 16:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EC6C36AE2;
 Mon, 20 Dec 2021 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640018465;
 bh=TuP185pT5gdSlNtfNfQ+Kye5lOB+euhTli9+HNxshOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=enGWQQJij7Gn5KXQIvc6DgLGhW8TsmstPvfbBL0Frpv76daIROB5Wk6RyCml6X1M0
 INr/wU0RVuAcWcOkPbgbi5U7MaR0NTk6+o3rhiyEe0vywSW27g/jS59FjbvlDzhRr3
 ovNt3nB3npaxHStYKaqE8ptag4HrP8L17DKCvcbQ=
Date: Mon, 20 Dec 2021 17:41:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 08/17] all: replace bitmap_weight with
 bitmap_weight_{eq,gt,ge,lt,le} where appropriate
Message-ID: <YcCyHvr1f+Z8M9M1@kroah.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-9-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218212014.1315894-9-yury.norov@gmail.com>
X-Mailman-Approved-At: Tue, 21 Dec 2021 07:53:15 +1100
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
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Jens Axboe <axboe@fb.com>, Andy Lutomirski <luto@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup.patel@wdc.com>,
 linux-ia64@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Hansen <dave.hansen@linux.intel.com>, Solomon Peachy <pizza@shaftnet.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dennis Zhou <dennis@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Tejun Heo <tj@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Will Deacon <will@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, linux-csky@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 David Laight <David.Laight@aculab.com>, linux-alpha@vger.kernel.org,
 Geetha sowjanya <gakula@marvell.com>, Ian Rogers <irogers@google.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-s390@vger.kernel.org, Alexey Klimov <aklimov@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Hans de Goede <hdegoede@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Marcin Wojtas <mw@semihalf.com>,
 Vlastimil Babka <vbabka@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jason Wessel <jason.wessel@windriver.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 18, 2021 at 01:20:04PM -0800, Yury Norov wrote:
> Kernel code calls bitmap_weight() to compare the weight of bitmap with
> a given number. We can do it more efficiently with bitmap_weight_{eq, ...}
> because conditional bitmap_weight may stop traversing the bitmap earlier,
> as soon as condition is met.
> 
> This patch replaces bitmap_weight with conditional versions where possible,
> except for small bitmaps which size is not configurable and  known at
> constant time. In that case conditional version of bitmap_weight would not
> benefit due to small_const_nbits() optimization; but readability may
> suffer.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c                 |  2 +-
>  drivers/iio/dummy/iio_simple_dummy_buffer.c            |  4 ++--
>  drivers/iio/industrialio-trigger.c                     |  2 +-
>  drivers/memstick/core/ms_block.c                       |  4 ++--
>  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c         |  2 +-
>  .../net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c  |  2 +-
>  .../net/ethernet/marvell/octeontx2/nic/otx2_flows.c    |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/cmd.c               | 10 +++-------
>  drivers/net/ethernet/mellanox/mlx4/eq.c                |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/fw.c                |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/main.c              |  2 +-
>  drivers/perf/thunderx2_pmu.c                           |  4 ++--
>  drivers/staging/media/tegra-video/vi.c                 |  2 +-
>  13 files changed, 21 insertions(+), 25 deletions(-)

"all" is not how to submit changes to the kernel.  Please break them up
into subsystem-specific patches, and send them after your core changes
are accepted.

good luck!

greg k-h
