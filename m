Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C9465E2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 07:20:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4QmP59nyz3c5w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 17:20:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d9ufFBZI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d9ufFBZI; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4H2X2W2Jz2ypX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 11:31:46 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id g9so21510086qvd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 16:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UYmHlVbMSQbQAn62a50WlYWlw5WYikEw/HKO8MU8o20=;
 b=d9ufFBZIjBeCnfJhxkhOJHR4U6gA3sYY5/+OartHrmtyqhNuwpEH+tfc93YA7tEDao
 yOKDodcNFRle3eMMLCg2FH/Tcgr7cW593yntXLl1utZLUJtVShRNQEOc9NvEo4hEL1rm
 L2l6bxTExKPSRmbnMRKqIcZhoOpd63W1ZKagDrFCRbYIcYvSgN+CxBxrwTxGRSsHeVKf
 UXZK5TS9EbCKBOwmJzZ51FgzKmkah4fU/bnP1hNtNTskTK6qjluwzPEk7uWUTAkKCdZ1
 XxzA5TtEBQPg9PU9R4bStLW9Ne4zdJoIM+RpRwYI7AmQcqEYlTEIoOnEsCuvtTzXmNFj
 00eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UYmHlVbMSQbQAn62a50WlYWlw5WYikEw/HKO8MU8o20=;
 b=6mAssEZv8o/eCMWt841qPMbMDtUS/8jqauFprA197zZM5oYOFBIvv8qWwC7PLJzfXp
 yZ84zIT7HCYk6umOQORUkYo6XCPscvLkwVn4tIiE6i2+j5qn/7ex4vVpa6uYzdYISVBH
 cSxRS7O7N0T+6D8lOxxTM93u0ErNBu3mjSVvN+iHuH2CyxzWTe9zR0nQ1x6sdbDKOy2p
 /n7GWSH4rQEn60PEMfJrio6qJVNOhJJUsvAv/chQxcfBEn18j7+HCJQBRTrrv03RiQKb
 gG1CqA5S+Y4xZWDsSN6Wzsjn/9XjICFQqLBHj6EAUaOPwVkAapHMMTTeuWJ3082i60lH
 dYkw==
X-Gm-Message-State: AOAM532Xhr76FKD+nL7tPLGICP3XQE29EMgWU6Strmx9N5XhFzDAIF1y
 EAxyNh19PXCp4HlQ7aQpEvI=
X-Google-Smtp-Source: ABdhPJwpuPpSi7n83vlL+jLX5fyPRTIJyAHbiKfUe+xvjm76YV/xzPPNg/iMW1GhI6PSi3iKc0YBEA==
X-Received: by 2002:a05:6214:ccc:: with SMTP id 12mr9930154qvx.8.1638405102640; 
 Wed, 01 Dec 2021 16:31:42 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id l1sm690890qkp.125.2021.12.01.16.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 16:31:42 -0800 (PST)
Date: Wed, 1 Dec 2021 16:31:40 -0800
From: Yury Norov <yury.norov@gmail.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Message-ID: <20211202003140.GA430494@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl> <20211129063839.GA338729@lapt>
 <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
X-Mailman-Approved-At: Thu, 02 Dec 2021 17:19:32 +1100
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
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-crypto@vger.kernel.org,
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
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Jiri Olsa <jolsa@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
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

On Mon, Nov 29, 2021 at 04:34:07PM +0000, Michał Mirosław wrote:
> Dnia 29 listopada 2021 06:38:39 UTC, Yury Norov <yury.norov@gmail.com> napisał/a:
> >On Sun, Nov 28, 2021 at 07:03:41PM +0100, mirq-test@rere.qmqm.pl wrote:
> >> On Sat, Nov 27, 2021 at 07:56:55PM -0800, Yury Norov wrote:
> >> > In many cases people use bitmap_weight()-based functions like this:
> >> > 
> >> > 	if (num_present_cpus() > 1)
> >> > 		do_something();
> >> > 
> >> > This may take considerable amount of time on many-cpus machines because
> >> > num_present_cpus() will traverse every word of underlying cpumask
> >> > unconditionally.
> >> > 
> >> > We can significantly improve on it for many real cases if stop traversing
> >> > the mask as soon as we count present cpus to any number greater than 1:
> >> > 
> >> > 	if (num_present_cpus_gt(1))
> >> > 		do_something();
> >> > 
> >> > To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> >> > functions together with corresponding wrappers in cpumask and nodemask.
> >> 
> >> Having slept on it I have more structured thoughts:
> >> 
> >> First, I like substituting bitmap_empty/full where possible - I think
> >> the change stands on its own, so could be split and sent as is.
> >
> >Ok, I can do it.
> >
> >> I don't like the proposed API very much. One problem is that it hides
> >> the comparison operator and makes call sites less readable:
> >> 
> >> 	bitmap_weight(...) > N
> >> 
> >> becomes:
> >> 
> >> 	bitmap_weight_gt(..., N)
> >> 
> >> and:
> >> 	bitmap_weight(...) <= N
> >> 
> >> becomes:
> >> 
> >> 	bitmap_weight_lt(..., N+1)
> >> or:
> >> 	!bitmap_weight_gt(..., N)
> >> 
> >> I'd rather see something resembling memcmp() API that's known enough
> >> to be easier to grasp. For above examples:
> >> 
> >> 	bitmap_weight_cmp(..., N) > 0
> >> 	bitmap_weight_cmp(..., N) <= 0
> >> 	...
> >
> >bitmap_weight_cmp() cannot be efficient. Consider this example:
> >
> >bitmap_weight_lt(1000 0000 0000 0000, 1) == false
> >                 ^
> >                 stop here
> >
> >bitmap_weight_cmp(1000 0000 0000 0000, 1) == 0
> >                                 ^
> >                                 stop here
> >
> >I agree that '_gt' is less verbose than '>', but the advantage of 
> >'_gt' over '>' is proportional to length of bitmap, and it means
> >that this API should exist.
> 
> Thank you for the example. Indeed, for less-than to be efficient here you would need to replace
>  bitmap_weight_cmp(..., N) < 0
> with
>  bitmap_weight_cmp(..., N-1) <= 0

Indeed, thanks for pointing to it.
 
> It would still be more readable, I think.

To be honest, I'm not sure that
        bitmap_weight_cmp(..., N-1) <= 0
would be an obvious replacement for the original
        bitmap_weight(...) < N
comparing to 
        bitmap_weight_lt(..., N)

I think the best thing I can do is to add bitmap_weight_cmp() as
you suggested, and turn lt and others to be wrappers on it. This
will let people choose a better function in each case.

I also think that for v2 it would be better to drop the conversion
for short bitmaps, except for switching to bitmap_empty(), because
in that case readability wins over performance; if no objections. 

Thanks,
Yury
