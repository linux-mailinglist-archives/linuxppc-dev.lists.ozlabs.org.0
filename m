Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E614460A2D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:11:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2LkL5207z3dhJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:11:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oEs9cCLN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oEs9cCLN; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2HXb0T0Vz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 05:47:24 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id u16so12281374qvk.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 10:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+5JBAVd8frUmOsccut4e882tgrn1djQ8KjHhL4/ag+E=;
 b=oEs9cCLNoYNdz+AbfzXoumcqnU2rFCFJ5TyCH12jj8Ix0vmr0cjhof0ocW5eqSpQbo
 mrHrVXqzVgn1iu3yISJ4wwf50y2BGwES4qCIZWk6z19v3s6rfhM8ODKHsnHGdu0xSYmn
 zutWpoWgGKrfvlhNB+FDfgo3OCF/7V6L7yaewLYpZDm48/8KLn7Bhlr/nJjgfB4Oiw7i
 hyEVArk/04uNSdzcAMwME+LGzw661S1XN1lrF6iOjE5r2wDmrufbwXHGBlcjc0XG2JfP
 D0I2JqoyhsvbiLTErDYg5FY5mgjhIpdLZ1XuQkVWsomuMWeu+IFVGskruJ1MCFhjIPEq
 wYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+5JBAVd8frUmOsccut4e882tgrn1djQ8KjHhL4/ag+E=;
 b=C7axdJwsSr2/2J3tg7m7h9pPiWA6piZgKgcF/kK/06AXTpDEN3cjh/7b1gQCxPQL0A
 cSNmMg05lNzoGPKcHWb/XvmynTbrTddIqNvwgXvct0ZczaYIUZsjLlL9OxBKqMxmNF6q
 OM2HnX/mjXJh8E3VKLE+Aezsv4PD8DcUu+HQikZZP1pPxmwCPdONueKc3t8o2ZBNU0+4
 jYOrW6hKMQki/uW2znnGdQsMbTi8Soo6PjT8s06YWwSMwaqbuoDgktMwuYeYpzySu+K2
 +u0vPOTjftFZI+ke9vwBOUcombChPIebcT1sW9LrDnISy0dKBv9SUI/nHUlgKU5IAHEW
 0mmw==
X-Gm-Message-State: AOAM530WcOPKSbLyBpoiIZlmSjp2FOd/dEtBjb1OuY+5wfQXHJhYF6um
 iZEPWAvIFwRsHwZzEP9/NYw=
X-Google-Smtp-Source: ABdhPJy+21VmTcm+AhhPYb7MVuOfGbfxLsGp1r9C41IKKFVcOTnAXjsR8SRxKxcOFPC3Y4DL0s01XQ==
X-Received: by 2002:a05:6214:2348:: with SMTP id
 hu8mr12230119qvb.9.1638125241136; 
 Sun, 28 Nov 2021 10:47:21 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id e13sm7457944qte.56.2021.11.28.10.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 10:47:20 -0800 (PST)
Date: Sun, 28 Nov 2021 10:47:12 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Dennis Zhou <dennis@kernel.org>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <20211128184712.GA309073@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
 <20211128174320.GA304543@lapt> <YaPCOPqpI/oKrTXl@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaPCOPqpI/oKrTXl@fedora>
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
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-alpha@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
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

On Sun, Nov 28, 2021 at 12:54:00PM -0500, Dennis Zhou wrote:
> Hello,
> 
> On Sun, Nov 28, 2021 at 09:43:20AM -0800, Yury Norov wrote:
> > On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > > to return earlier depending on the condition.
> > > []
> > > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > > []
> > > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > > >  	 * if platform didn't set the present map already, do it now
> > > >  	 * boot cpu is set to present already by init/main.c
> > > >  	 */
> > > > -	if (num_present_cpus() <= 1)
> > > > +	if (num_present_cpus_le(2))
> > > >  		init_cpu_present(cpu_possible_mask);
> > > 
> > > ?  is this supposed to be 2 or 1
> > 
> > X <= 1 is the equivalent of X < 2.
> > 
> > > > diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> > > []
> > > > @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
> > > >  		return ret;
> > > >  	}
> > > >  
> > > > -	if (num_present_cpus() > 4) {
> > > > +	if (num_present_cpus_gt(4)) {
> > > >  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
> > > >  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
> > > >  		       __func__);
> > > 
> > > It looks as if the present variants should be using the same values
> > > so the _le test above with 1 changed to 2 looks odd.
> >  
> 
> I think the confusion comes from le meaning less than rather than lt.
> Given the general convention of: lt (<), le (<=), eg (=), ge (>=),
> gt (>), I'd consider renaming your le to lt.

Ok, makes sense. I'll rename in v2 and add <= and >= versions.
