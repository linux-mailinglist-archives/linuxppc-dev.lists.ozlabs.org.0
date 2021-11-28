Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A991460516
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 08:05:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1zyF0vnpz3bnq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 18:05:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N/urFmV2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N/urFmV2; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1zHJ3kDtz2xXZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 17:34:51 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id z9so13115420qtj.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 22:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=rKuklq8jxCETHcjcAENlFbP3nl/uNBZqDfuGt3bzd1Q=;
 b=N/urFmV2NmOFP42e1LVLW8fwa/hr9KDv3ZUpw+lC8WGtW8rc7tWztvbdFPuGBjub1O
 wspFhVe7cCjM3GiHaTs/o61wPhHvRulBbX8eWk+oUvPHasNmnTk9fguzetRPFqMAMSbw
 NSq70yUrota4HuwP2mw6e4EdU69PrQnC7+N7r+KW5WUjDm+ME76HZpk50UYeWuhhvrtv
 jzlo36RajlwI73FqiorEZUjBdSjpmlO3li6nkrgdjIjD0UyBvsHE9SsWB4qkZCd+owE5
 cwmTSVDOhxhxddNAGQkE0CL6sKvMvIJPhAZNBZoNO0tLt8RIHXr/GUyMzCFG050MR/6f
 IXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rKuklq8jxCETHcjcAENlFbP3nl/uNBZqDfuGt3bzd1Q=;
 b=NO56SgbawPWFWjdWaTLIbwGP2ihh+sdxv+2uc8ZNxgVkdS3VlYvOikzehdp17akN7P
 EVezHFjFeWOzy/AjQCzpUnPPzmN09qjeWxby/tR4JXQFDpSJD7iI8eVYXf5AD+QiyfIt
 r3XNyVKPZEOtL6oQzqAJW89BU7p2jHJenFx1C0sT36YdmbjwIZHZEtfXxLAVXaPX3G1n
 dH007A/1X28nDXSesnsSWTz8DziDHD1QEbVBR0pxW/iAY8O0QKUt2DuG/j16cWbn0l0M
 Vt2BTMlBB2vWg+3h4xeObflLitKJn309vji+VvXVDkZ70yO6SpsfQ8PhFxO8ma6E6jcG
 fy8Q==
X-Gm-Message-State: AOAM531jk0qW81k6Y6B7sxj4PLHe4neZIcN2sP59KyOZyXnS93ZF3q8N
 nKPlrdArk97emeq9jFo/6y8=
X-Google-Smtp-Source: ABdhPJyJzVPAC11UsMz+HJsW0TzZJUpS9rijQwW94Vpknlgpg+/mG8cwCXUq1qsThYXJdJN6S8tP7Q==
X-Received: by 2002:ac8:5fcc:: with SMTP id k12mr35432768qta.346.1638081289128; 
 Sat, 27 Nov 2021 22:34:49 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id f18sm6419326qko.34.2021.11.27.22.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 22:34:48 -0800 (PST)
Date: Sat, 27 Nov 2021 22:34:47 -0800
From: Yury Norov <yury.norov@gmail.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <20211128063447.GA270945@lapt>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
X-Mailman-Approved-At: Sun, 28 Nov 2021 18:04:00 +1100
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
 Lee Jones <lee.jones@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup.patel@wdc.com>,
 linux-ia64@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Roy Pledge <Roy.Pledge@nxp.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dennis Zhou <dennis@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 linux-alpha@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
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
 David Laight <David.Laight@aculab.com>, Sudeep Holla <sudeep.holla@arm.com>,
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

(restore CC list)

On Sun, Nov 28, 2021 at 05:56:51AM +0100, Michał Mirosław wrote:
> On Sat, Nov 27, 2021 at 07:57:02PM -0800, Yury Norov wrote:
> > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > with one of new functions where appropriate. This allows num_*_cpus_*()
> > to return earlier depending on the condition.
> [...]
> > @@ -3193,7 +3193,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
> >  
> >  	/* allocate pages */
> >  	j = 0;
> > -	for (unit = 0; unit < num_possible_cpus(); unit++) {
> > +	for (unit = 0; num_possible_cpus_gt(unit); unit++) {
> 
> This looks dubious.

Only this?

> The old version I could hope the compiler would call
> num_possible_cpus() only once if it's marked const or pure, but the
> alternative is going to count the bits every time making this a guaranteed
> O(n^2) even though the bitmap doesn't change.

num_possible_cpus() is not const neither pure. This is O(n^2) before and after.

