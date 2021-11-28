Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9B460A13
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:07:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2LfL6q7zz3dhR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:07:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.177;
 helo=mail-qt1-f177.google.com; envelope-from=dennisszhou@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2GM62KZBz2xXs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 04:54:08 +1100 (AEDT)
Received: by mail-qt1-f177.google.com with SMTP id t34so14081251qtc.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 09:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CTle792AODDh5EJBSlHCgdnz2AP0iG3Ix/URPyjXa5E=;
 b=uxISaEdZ/slzQFwZ1mTGO4AZxObxHUGRSmKGiuYxHG3h4e8w3aa7zb7rXcgsUb6/WO
 yOTg0VYCaOdG4q4kG7zZ+X4kX5Jj/RZ+AY5A6ekRGvprsnYeSMmldeF7Ga+tuS+pAFsz
 j+Xy9E0zKEGVysZO3/+V/3EWJYhrw01JIu1r2vv1hJGxD01DMTkoMYb7p//NldQK7RNJ
 6B1mjGFXBkU24cAGXA5YvPBlCZdU8XIYKk3gNQUfzC+HxW8FxLtGfkdCSPoy/l37wcdS
 xTzGLYA7JIt6Bg85TO8w56mvqtlOR+/TDXoSo11+DwtwLeJFY53PfPqK+HoA+WmCk8Od
 hBEQ==
X-Gm-Message-State: AOAM530zaM2lLOleiBqxsETVzQVHBWNZ3xc9RjoqWtHb8B9c8K24mUr4
 rQQRPdankf/ToZrNJauh7eA=
X-Google-Smtp-Source: ABdhPJx25AEVnfH0h4sZET5x0dxImad0u4ySfFGiKfI+WvQd75qCTeFgZjdPUL+9cNE2+e8o/NeT8g==
X-Received: by 2002:ac8:5b87:: with SMTP id a7mr38253502qta.196.1638122044539; 
 Sun, 28 Nov 2021 09:54:04 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id r16sm7298126qta.46.2021.11.28.09.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 09:54:03 -0800 (PST)
Date: Sun, 28 Nov 2021 12:54:00 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <YaPCOPqpI/oKrTXl@fedora>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
 <20211128174320.GA304543@lapt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211128174320.GA304543@lapt>
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
 Lee Jones <lee.jones@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup.patel@wdc.com>,
 linux-ia64@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Roy Pledge <Roy.Pledge@nxp.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dennis Zhou <dennis@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 linux-alpha@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
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

Hello,

On Sun, Nov 28, 2021 at 09:43:20AM -0800, Yury Norov wrote:
> On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > to return earlier depending on the condition.
> > []
> > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > []
> > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > >  	 * if platform didn't set the present map already, do it now
> > >  	 * boot cpu is set to present already by init/main.c
> > >  	 */
> > > -	if (num_present_cpus() <= 1)
> > > +	if (num_present_cpus_le(2))
> > >  		init_cpu_present(cpu_possible_mask);
> > 
> > ?  is this supposed to be 2 or 1
> 
> X <= 1 is the equivalent of X < 2.
> 
> > > diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> > []
> > > @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
> > >  		return ret;
> > >  	}
> > >  
> > > -	if (num_present_cpus() > 4) {
> > > +	if (num_present_cpus_gt(4)) {
> > >  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
> > >  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
> > >  		       __func__);
> > 
> > It looks as if the present variants should be using the same values
> > so the _le test above with 1 changed to 2 looks odd.
>  

I think the confusion comes from le meaning less than rather than lt.
Given the general convention of: lt (<), le (<=), eg (=), ge (>=),
gt (>), I'd consider renaming your le to lt.

Thanks,
Dennis
