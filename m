Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AEE460F79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2cfr1Nqpz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:39:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ximtyy9D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ximtyy9D; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2bKP6WZVz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 17:38:47 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id i12so280717qvh.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 22:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GW7wD7qKvROu8z9xZL5o2Gh9JvMEXrXNdc/d8bAaPNs=;
 b=Ximtyy9D6hF34jeHkx2abhxO2fEDksv5f5qJu4CbvoNWokti3yxmfDL3L7TYPRNI1N
 nLBExnAtE1kHxfW3UuSIcTZjpfdkrYaWw77PtYlgHprrRWmhg8onSirLlPaay6tbmdGV
 QOolCDulR6Tk/EKA2Gv8Xlb2VKcWxKtuMIpV9m8bP/Y2OIkRrwh1D8Uy/bj62ViSMN2l
 ZvGgVYwmHud/XyWXGXVdXp5Qsb6Tf/NpieRKvdWwCGOCaqCRU7xxjxP8pUys/Y0my6pK
 DI87mJm/+MqXPnLUnP7Gv+O+UoGKFiXftZWbYzOV5qGvrEcopuUsleS20idOc1qycgZd
 CJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GW7wD7qKvROu8z9xZL5o2Gh9JvMEXrXNdc/d8bAaPNs=;
 b=fsHnrY8QWSC8SFrw2gXXf6KKjqTEcLZXtoNyg3wxr2ZjJM+ZwD3xTzwCVUB46MlbV2
 WntcNZk0hMP+fjy6sEONHJ00/mUbClwVI3aQuSvv8H0uIGkh28gQtESFG7DvfgejN82t
 OpGnCo7Kfxl+o1dmW9BMsicaWLx+y4q+ezUI/2CZFXtOO/gL+6f8XOYtbGb7lVqx4Kg0
 guASQHiHKDDsCZVU4xZgwiVSp2TToVkh1f84xunDM4XlPd+SLOZk+LTiOmUxVmwXy28T
 iKu73Hc2tB+/KU1cKOtHRcjOxtLzQq5uPCSVRTAjzAbdMAJ2Cl0NfuDVfReFPZ3xPV4+
 a1IA==
X-Gm-Message-State: AOAM532AJ9zUrzse3LjGIPq7zI99DgFFNRu42NYTnHTi+AxUWmnCdyY5
 mqhTWnUwqLxLL3YAZUi5zM4=
X-Google-Smtp-Source: ABdhPJwSywxmnS7RgaW8ur/GbWm8YSeTFfi4rMgLh/NdfnxtrZBeDnmatO6ciZp/cAThb6LO+btZbw==
X-Received: by 2002:a05:6214:984:: with SMTP id
 dt4mr30031399qvb.120.1638167922796; 
 Sun, 28 Nov 2021 22:38:42 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id h19sm8495514qth.63.2021.11.28.22.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:38:42 -0800 (PST)
Date: Sun, 28 Nov 2021 22:38:39 -0800
From: Yury Norov <yury.norov@gmail.com>
To: mirq-test@rere.qmqm.pl
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Message-ID: <20211129063839.GA338729@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
X-Mailman-Approved-At: Mon, 29 Nov 2021 18:38:27 +1100
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
 Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
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
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
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

On Sun, Nov 28, 2021 at 07:03:41PM +0100, mirq-test@rere.qmqm.pl wrote:
> On Sat, Nov 27, 2021 at 07:56:55PM -0800, Yury Norov wrote:
> > In many cases people use bitmap_weight()-based functions like this:
> > 
> > 	if (num_present_cpus() > 1)
> > 		do_something();
> > 
> > This may take considerable amount of time on many-cpus machines because
> > num_present_cpus() will traverse every word of underlying cpumask
> > unconditionally.
> > 
> > We can significantly improve on it for many real cases if stop traversing
> > the mask as soon as we count present cpus to any number greater than 1:
> > 
> > 	if (num_present_cpus_gt(1))
> > 		do_something();
> > 
> > To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> > functions together with corresponding wrappers in cpumask and nodemask.
> 
> Having slept on it I have more structured thoughts:
> 
> First, I like substituting bitmap_empty/full where possible - I think
> the change stands on its own, so could be split and sent as is.

Ok, I can do it.

> I don't like the proposed API very much. One problem is that it hides
> the comparison operator and makes call sites less readable:
> 
> 	bitmap_weight(...) > N
> 
> becomes:
> 
> 	bitmap_weight_gt(..., N)
> 
> and:
> 	bitmap_weight(...) <= N
> 
> becomes:
> 
> 	bitmap_weight_lt(..., N+1)
> or:
> 	!bitmap_weight_gt(..., N)
> 
> I'd rather see something resembling memcmp() API that's known enough
> to be easier to grasp. For above examples:
> 
> 	bitmap_weight_cmp(..., N) > 0
> 	bitmap_weight_cmp(..., N) <= 0
> 	...

bitmap_weight_cmp() cannot be efficient. Consider this example:

bitmap_weight_lt(1000 0000 0000 0000, 1) == false
                 ^
                 stop here

bitmap_weight_cmp(1000 0000 0000 0000, 1) == 0
                                 ^
                                 stop here

I agree that '_gt' is less verbose than '>', but the advantage of 
'_gt' over '>' is proportional to length of bitmap, and it means
that this API should exist.

> This would also make the implementation easier in not having to
> copy and paste the code three times. Could also use a simple
> optimization reducing code size:

In the next version I'll reduce code duplication like this:

bool bitmap_eq(..., N);
bool bitmap_ge(..., N);

#define bitmap_weight_gt(..., N)  bitmap_weight_ge(..., N + 1)
#define bitmap_weight_lt(..., N) !bitmap_weight_ge(..., N)
#define bitmap_weight_le(..., N) !bitmap_weight_gt(..., N)

Thanks,
Yury
