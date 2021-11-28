Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B854609F8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:05:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Lbt68DMz3c9v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:05:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Cf1UpbBD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=Cf1UpbBD; 
 dkim-atps=neutral
X-Greylist: delayed 140353 seconds by postgrey-1.36 at boromir;
 Sun, 28 Nov 2021 19:01:53 AEDT
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J21Cj3dXZz305F
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:01:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2F2AB80B54;
 Sun, 28 Nov 2021 08:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E507C004E1;
 Sun, 28 Nov 2021 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638086506;
 bh=b48YjTY/pVez8afNE+wzU+3WaQKxxQEURvaxADRtwDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cf1UpbBDGUG/i+3B7710UJDtWCf5AiS+xYwJdJrswHkaMxwXqtghSrAeHqtG4ZEHm
 kjNjM7/02WtoShcjN6FHzZa/U5USbrnlhn4XjHsJy9PjfumjC3FQHsmSzJbZZYb97a
 uqjFGttZAm3d3AQ44noz4515EJlyQkKjujhY+AU0=
Date: Sun, 28 Nov 2021 09:01:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 3/9] all: replace bitmap_weigth() with
 bitmap_{empty,full,eq,gt,le}
Message-ID: <YaM3ZeQS4tHzsRkK@kroah.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-4-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-4-yury.norov@gmail.com>
X-Mailman-Approved-At: Mon, 29 Nov 2021 08:05:03 +1100
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
 Jens Axboe <axboe@fb.com>, Andy Lutomirski <luto@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup.patel@wdc.com>,
 linux-ia64@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Roy Pledge <Roy.Pledge@nxp.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dennis Zhou <dennis@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Kalle Valo <kvalo@codeaurora.org>,
 Stephen Boyd <sboyd@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Will Deacon <will@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, linux-csky@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Gross <markgross@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Sat, Nov 27, 2021 at 07:56:58PM -0800, Yury Norov wrote:
> bitmap_weight() counts all set bits in the bitmap unconditionally.
> However in some cases we can traverse a part of bitmap when we
> only need to check if number of set bits is greater, less or equal
> to some number.
> 
> This patch replaces bitmap_weight() with one of
> bitmap_{empty,full,eq,gt,le), as appropriate.
> 
> In some places driver code has been optimized further, where it's
> trivial.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/nds32/kernel/perf_event_cpu.c                 |  4 +---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c             |  4 ++--
>  arch/x86/kvm/hyperv.c                              |  8 ++++----
>  drivers/crypto/ccp/ccp-dev-v5.c                    |  5 +----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |  2 +-
>  drivers/iio/adc/mxs-lradc-adc.c                    |  3 +--
>  drivers/iio/dummy/iio_simple_dummy_buffer.c        |  4 ++--
>  drivers/iio/industrialio-buffer.c                  |  2 +-
>  drivers/iio/industrialio-trigger.c                 |  2 +-
>  drivers/memstick/core/ms_block.c                   |  4 ++--
>  drivers/net/dsa/b53/b53_common.c                   |  2 +-
>  drivers/net/ethernet/broadcom/bcmsysport.c         |  6 +-----
>  drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c   |  4 ++--
>  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c     |  2 +-
>  .../ethernet/marvell/octeontx2/nic/otx2_ethtool.c  |  2 +-
>  .../ethernet/marvell/octeontx2/nic/otx2_flows.c    |  8 ++++----
>  .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |  2 +-
>  drivers/net/ethernet/mellanox/mlx4/cmd.c           | 10 +++-------
>  drivers/net/ethernet/mellanox/mlx4/eq.c            |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/main.c          |  2 +-
>  .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   |  2 +-
>  drivers/net/ethernet/qlogic/qed/qed_dev.c          |  3 +--
>  drivers/net/ethernet/qlogic/qed/qed_rdma.c         |  4 ++--
>  drivers/net/ethernet/qlogic/qed/qed_roce.c         |  2 +-
>  drivers/perf/arm-cci.c                             |  2 +-
>  drivers/perf/arm_pmu.c                             |  4 ++--
>  drivers/perf/hisilicon/hisi_uncore_pmu.c           |  2 +-
>  drivers/perf/thunderx2_pmu.c                       |  3 +--
>  drivers/perf/xgene_pmu.c                           |  2 +-
>  drivers/pwm/pwm-pca9685.c                          |  2 +-
>  drivers/staging/media/tegra-video/vi.c             |  2 +-
>  drivers/thermal/intel/intel_powerclamp.c           | 10 ++++------
>  fs/ocfs2/cluster/heartbeat.c                       | 14 +++++++-------
>  33 files changed, 57 insertions(+), 75 deletions(-)

After you get the new functions added to the kernel tree, this patch
should be broken up into one-patch-per-subsystem and submitted through
the various subsystem trees.

thanks,

greg k-h
