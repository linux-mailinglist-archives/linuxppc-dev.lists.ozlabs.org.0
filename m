Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C1E460A11
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:07:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Ldq3Tpdz3bnC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:07:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OJQe08uA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OJQe08uA; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2G6p3NZDz2xTC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 04:43:28 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id b11so12182343qvm.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EGDOAtYN2fK/PZFUkmOA85+Y42I5mUiptIM8w58G0rQ=;
 b=OJQe08uA10eX2TeWvqt06FdB++sdcPrwIbnMHmMMGLEPh2+R8hbd/40wYpjwkaqeE/
 6XfapPGwIUZ4LDWqz39Nwr5uu4E6umAX+6Z0+jE4weTI7q/jI3+ccI8GT5haFqvlnbNr
 sS4x0m3enUvOT+nRdFdnlBmA/MI7DQ4E1ZmrvA03uMZsjm9/iv2EP37/X2J9G1KwyXb6
 Hfv1Hav0WBaO6x7osIh95buMPO77Agb/hfuz57/z7KzCuL+cYyh+7wuFgcWNiN6IEUYt
 1HZymoWzXAdksfeaUOA73f5K948RKJ1FSFdx5FI5zvS1fbr8o5m0p5Rrx2G97GqX7v/H
 u+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EGDOAtYN2fK/PZFUkmOA85+Y42I5mUiptIM8w58G0rQ=;
 b=nxIX5RAwUJX3kfgJQ898zi0dkLqejrPEh4fEFuRpHXoQI7xcR3NCDcuFS/l1VWi+FT
 BSEBHQWXcWMvPVK283nGCnn4M0sc71FeX5YrwCc9vJjh0HvWD2CD2tJ1i2SAeGvMFqnN
 YxIHddz1NK4Pmk066DB0QxcF4kS1NofB1Q2m7vk+HORtjAo+DOkd190P1celGGspYG4j
 rkQEqfM286qBCaZ4S0v5Cs2Zz6ArykaYCQUGE7Ne7DnCgO5Vb7nzEWFpasqeV+3mfQUj
 FxifP7WxQOyMlFCk+DJGZOgvvObJch/jgtfc+gG1Kojv1C1gjESsVbwvtkGKg1KgZ2pT
 JUdw==
X-Gm-Message-State: AOAM533QuPZNcWw/ohIG6Py6Qey46Ebr46+MzR3pjbPxfw1Q2eDjZigD
 bqJfJmEuCYdiNNadjj2HkEg=
X-Google-Smtp-Source: ABdhPJz1EHRO0NhP22/uPVki3bkMYlc7JC+OLMNGN1jvJUoway5a+xcKpp5gLpPJ+uu/Tahl0/hKjQ==
X-Received: by 2002:a05:6214:f2d:: with SMTP id
 iw13mr37805973qvb.13.1638121402048; 
 Sun, 28 Nov 2021 09:43:22 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id l22sm6905101qtj.68.2021.11.28.09.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 09:43:21 -0800 (PST)
Date: Sun, 28 Nov 2021 09:43:20 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <20211128174320.GA304543@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
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
 David Laight <David.Laight@ACULAB.COM>, Sudeep Holla <sudeep.holla@arm.com>,
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

On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > with one of new functions where appropriate. This allows num_*_cpus_*()
> > to return earlier depending on the condition.
> []
> > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> []
> > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> >  	 * if platform didn't set the present map already, do it now
> >  	 * boot cpu is set to present already by init/main.c
> >  	 */
> > -	if (num_present_cpus() <= 1)
> > +	if (num_present_cpus_le(2))
> >  		init_cpu_present(cpu_possible_mask);
> 
> ?  is this supposed to be 2 or 1

X <= 1 is the equivalent of X < 2.

> > diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> []
> > @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
> >  		return ret;
> >  	}
> >  
> > -	if (num_present_cpus() > 4) {
> > +	if (num_present_cpus_gt(4)) {
> >  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
> >  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
> >  		       __func__);
> 
> It looks as if the present variants should be using the same values
> so the _le test above with 1 changed to 2 looks odd.
 
