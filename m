Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F49460C1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 02:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2SCJ2gtbz3088
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 12:18:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FqHxiwrQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FqHxiwrQ; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2PyD5KQlz2ywd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 10:36:34 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id q64so20961392qkd.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 15:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+pvPLMMOaG75eXeO+MYWVtFy7p98nfe1U4iD6DUFgqs=;
 b=FqHxiwrQ7QYivLGpovhQrNQCHUCj7LxMV2WH4G2Ujzkjgck5ZuLpYg6YmyS5/pcjd8
 PioI6TsqEy6uPfhoz8wEavEgHnpCryLeBpBEb8dr5G6s12WteiFVLQFxrBR47EVsTB3X
 ndIWwpq8YabRGonzz7m7f+N7UJXzBMp2vfRHxXo9M1u6ZB6qiEh6DrJAZ2z7gRkAQ5sC
 IqRPeZsbgWqH6z7gZV/iyVzYOISv9QQ48jjOTsL+5HMXkolOWVbHK0gj+h+Ra3+OPnrQ
 HZwGnjmshXRb1nFHqTfVME98Ezv2622Zg9Ol7LGc837jR3cjnZ1W8PCl/MaA7m1eTWjV
 ggTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+pvPLMMOaG75eXeO+MYWVtFy7p98nfe1U4iD6DUFgqs=;
 b=EbdUsYYSkxcXPS4y8xWxe6PPaHyQKUHOIwmk42AhUI4dYL/C8LhbBv5Q/ZjZjlroPS
 glwSZ1H7v6EqUhReHolDQF8TXaPL/824kOtGhLmZUIQMhDxZUWQk42i0coI4jfPP79S2
 ksZF/oly1Nu5bfHFQ0LYR9iFXTn+SF4w2kchNUS4afNOCxoREQy5JRyXcG14vbIyWqiz
 7B/7xIQlD9ESJgOyjA6B+W+td+WPDVsxded6ZCM81sufVrXB7zl3g1YJoQ8+njI08vN4
 wjm5Bq3a3ksmnR6huctm4NrFy2XGtUG+w4blJxaahIHdlsKPIeLcF0aPyh4F8fCqcDof
 vcbA==
X-Gm-Message-State: AOAM532zk1bxez6Ajj4k79kfPesoWEEPGTZnUgbsMlfMwPibL0dyDRkC
 oGWSHr/CiSpTcA3a9GaGomk=
X-Google-Smtp-Source: ABdhPJwjz8dPYMt9os+urjypBO3KPO0n0aAUmhuhKTUddMw0/hFm/BxjybZbsejId+j0oxfauAhjwQ==
X-Received: by 2002:a05:620a:4491:: with SMTP id
 x17mr26762094qkp.528.1638142589577; 
 Sun, 28 Nov 2021 15:36:29 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id h19sm8013261qth.63.2021.11.28.15.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 15:36:28 -0800 (PST)
Date: Sun, 28 Nov 2021 15:36:27 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Message-ID: <20211128233627.GA323159@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <1638096766.3elxdzb8ly.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638096766.3elxdzb8ly.astroid@bobo.none>
X-Mailman-Approved-At: Mon, 29 Nov 2021 12:17:31 +1100
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
 Andy Gross <agross@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Vineet Gupta <vgupta@kernel.org>,
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
 Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Will Deacon <will@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, linux-csky@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Kalle Valo <kvalo@codeaurora.org>,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 David Laight <David.Laight@ACULAB.COM>, linux-alpha@vger.kernel.org,
 Geetha sowjanya <gakula@marvell.com>, Ian Rogers <irogers@google.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-s390@vger.kernel.org, Alexey Klimov <aklimov@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Hans de Goede <hdegoede@redhat.com>,
 Marcin Wojtas <mw@semihalf.com>, Vlastimil Babka <vbabka@suse.cz>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 28, 2021 at 09:08:41PM +1000, Nicholas Piggin wrote:
> Excerpts from Yury Norov's message of November 28, 2021 1:56 pm:
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
> There would be no change to callers if you maintain counters like what
> is done for num_online_cpus() today. Maybe some fixes to arch code that
> does not use set_cpu_possible() etc APIs required, but AFAIKS it would
> be better to fix such cases anyway.

Thanks, Nick. I'll try to do this.
