Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FB0460A14
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:08:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Lg25DLLz3ccP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:08:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MOV5U2nr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=emil.renner.berthing@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MOV5U2nr; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2GQT3ldCz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 04:57:05 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id o14so10234742plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 09:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GIVU/9w51Ef2hg0ubArEuNU4cyYrytLI0Mp9d442l5g=;
 b=MOV5U2nrdRxFhWxyR7bOZpWlabqXOjxSoT999ssZl4Mq0S6JAhQfWyHw7OPilcdHmF
 6BGRpZnEpe8f9bpa77XQqQiPPBLd4gqEwap2s83tCamJXoetkbl6hCD0wkZTc5ZtL81/
 0oBwvtx8A8nEwcdqAvCz07X70fdDjUOrb88hgxJCEmCDBMTsfM8MgzFpsGuihBTo3i4/
 BO5H2USw15PhIR9jKFnq7EoAkCha2k8c7ry0hA6yyRozC0i3UkUk9dhKZX7Fdkb9vjGS
 8k1hfy+ikEeJEGfeYwNOOXgwgIH5nCo9f2fvYp5m9MjcvWjKnN995P4PSF7zBTJOShEa
 Axzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIVU/9w51Ef2hg0ubArEuNU4cyYrytLI0Mp9d442l5g=;
 b=u7/jO82hBqfKJJXhhv3AEqNYGTVS6L8brZzSMzq9PEe8UMII9dX22u6yPY2eV2ffGJ
 9paFVX4w5fVKcSUTiH12HSvynIkmNzJRkQwVfM2o8mWNdjwF5ccwlR8FAIGYtuswc1p4
 +YliK5EZvUtnydxjrL/VPODitK5YYqO6SzJgoQpGmDj9hV9WgmMYFcXd+oG0+vsnhy7Z
 dJ3EZdz4SmG6NKIMXZBeiGnXCQoFwuK1pipzoUqj9DhXes8jbkEL0UuxH/V/oeYwlXKl
 0d0PvfHkr/r623ymZY29tqHQjMlMDWJBYXDEOhCGvaWMsoq13JJ6x5SspbKiiPw0ryLQ
 2LaA==
X-Gm-Message-State: AOAM532xxnQlKkqJuLTcYi18Bu3asEUvbi9xt6wgyBuo7CY7S4giPUVu
 UC6qi8BL331k/rGrh8/IJhIOhJ63JPzu1s/XbU4=
X-Google-Smtp-Source: ABdhPJwg/YAIedkhsO4JO/I1SvpK80O+jGy4LgSO12zXzv7Z2PPdL5Fb+4vML+arhaNI5Rnxj3zFEocQ77wPSF7XA5Q=
X-Received: by 2002:a17:902:b581:b0:144:e601:de7 with SMTP id
 a1-20020a170902b58100b00144e6010de7mr54292000pls.71.1638122222149; Sun, 28
 Nov 2021 09:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
 <20211128174320.GA304543@lapt>
In-Reply-To: <20211128174320.GA304543@lapt>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Sun, 28 Nov 2021 18:56:51 +0100
Message-ID: <CANBLGczYBaxES12eCurm6fELat0U-9+VbuKUG_Fea3iK6d9RVA@mail.gmail.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add num_{possible, present,
 active}_cpus_{eq, gt, le}
To: Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
 bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
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
 linux-riscv <linux-riscv@lists.infradead.org>, Jiri Olsa <jolsa@redhat.com>,
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

On Sun, 28 Nov 2021 at 18:43, Yury Norov <yury.norov@gmail.com> wrote:
> On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > to return earlier depending on the condition.
> > []
> > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > []
> > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > >      * if platform didn't set the present map already, do it now
> > >      * boot cpu is set to present already by init/main.c
> > >      */
> > > -   if (num_present_cpus() <= 1)
> > > +   if (num_present_cpus_le(2))
> > >             init_cpu_present(cpu_possible_mask);
> >
> > ?  is this supposed to be 2 or 1
>
> X <= 1 is the equivalent of X < 2.

Ah, then the function is confusing. Usually it's lt = less than and lt
= less than or equal. Same idea for gt vs ge.
