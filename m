Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D45479E91
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 01:29:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGk9j36N9z3c56
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 11:29:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TIuyQXz6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TIuyQXz6; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGhqv4KcMz2xDr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 10:28:41 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id d11so5761438pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 15:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pIYxkiGisug+VVJYFtmCG20TylNRXB8zO8kw91s3wyc=;
 b=TIuyQXz6oo8PN+yMbImlC2c2rmmoCdLu5CdlQlReccXapNNMDZyLSkZvnzlgZ9AIdV
 6+qzntuQo5gBX86FaZFlCIaH4FCNC7RUVw367F08QPEjoiFWXa2CV6SAzISHS5RZPpY/
 QbkHqa0fdrihFEuRX0X/GeMy6P75DvnBsKWfABXcb5D5/2zTgkKaV4VEiJSuyy+zBwcd
 zNIVzererH+Fx7ZEOWvTBpmd3THvXh1KHtzsLHvjMiIPuGFGIqMdZbyjf9H7vLYP6+7J
 cQ/P2vAafsI3DEFtzgX9UWRj1ZmCeXy01hG6ih9PN1N9Tz70SEQsg8aJQpCrrbXl1cqP
 QppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pIYxkiGisug+VVJYFtmCG20TylNRXB8zO8kw91s3wyc=;
 b=vh5Mh6DyMGHsLprWQNXymbuZz6ji0tX2oJ+TcuhXIWODm8wo8rVtL5/5f9Vp6fUvfh
 x4OlMR/4/OCYqFxLlGz+tCA9KmUEXj9qEHipF/zewAY2GKKGK4q54UcxjqL0CkcY1/JX
 AY3fC0bk/wemIYuDVzAAQKWP6KQ8dc8HlDDu7ZJ24AAr2yZq29v5sa8k+XBMbCLvFA4b
 7ZtLDjOr8brMZzRc8ZVHe6AchuD+GH+sszTWPEpXgn4VlF6HtW13GoTR4AlPLcfbrPX/
 dk0eEjw7rc7NTL52FMei+cSgAPIDo5IpNAVGoFU71ZLyeLJFmBMrfX4PtlEPT88JVa96
 3G1g==
X-Gm-Message-State: AOAM533utetCtjpJfsSx35DAzSfgG3k6xfYBlSFc4WRkD3c28/E9Sjxq
 sMSNUoWTela++MwKf7pGducvrLZ4dz0+orqde7I=
X-Google-Smtp-Source: ABdhPJxWDXMTWC77oOKCjFiIpES/JejUzoFwUACXrmSW9T47MOn3N7k2dUXoB6NpZZlsfwgvBd+k97C3LkDR7q0l13Y=
X-Received: by 2002:a63:2a0d:: with SMTP id q13mr8815341pgq.513.1639870119035; 
 Sat, 18 Dec 2021 15:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-2-yury.norov@gmail.com>
 <Yb5dmqlYd3owtH29@qmqm.qmqm.pl>
In-Reply-To: <Yb5dmqlYd3owtH29@qmqm.qmqm.pl>
From: Yury Norov <yury.norov@gmail.com>
Date: Sat, 18 Dec 2021 15:28:29 -0800
Message-ID: <CAAH8bW9uWW+t5TvkMt_e-sKp71hiLpXhXeuGuSZPK-3kds-GgQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] all: don't use bitmap_weight() where possible
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 19 Dec 2021 11:28:13 +1100
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

On Sat, Dec 18, 2021 at 2:16 PM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:
>
> On Sat, Dec 18, 2021 at 01:19:57PM -0800, Yury Norov wrote:
> > Don't call bitmap_weight() if the following code can get by
> > without it.
> >
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  drivers/net/dsa/b53/b53_common.c           | 6 +-----
> >  drivers/net/ethernet/broadcom/bcmsysport.c | 6 +-----
> >  drivers/thermal/intel/intel_powerclamp.c   | 9 +++------
> >  3 files changed, 5 insertions(+), 16 deletions(-)
> [...]
>
> Looks good,

Does it mean Acked-by, Reviewed-by, or something else?

> but I think this needs to be split per subsystem.

What you ask breaks rules:

Documentation/process/submitting-patches.rst:

Separate each **logical change** into a separate patch.

For example, if your changes include both bug fixes and performance
enhancements for a single driver, separate those changes into two
or more patches.  If your changes include an API update, and a new
driver which uses that new API, separate those into two patches.

On the other hand, if you make a single change to numerous files,
group those changes into a single patch.  Thus a single logical change
is contained within a single patch.

This is not a dead rule, refer for example the 96d4f267e40f9 ("Remove
'type' argument from access_ok() functioin.")

Or this: https://lkml.org/lkml/2021/6/14/1736

Thanks,
Yury
