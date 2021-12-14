Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5862A474F58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:34:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGTN1Jw5z3cY1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:34:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mgUrMQhC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mgUrMQhC; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD81p0CFHz2xsN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 06:43:23 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id k26so18696481pfp.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 11:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LCilH12wWw0seUa3hiJyDy0VxFX2Q3bA7Y0HXIYHhF8=;
 b=mgUrMQhC4/CUdwucboxOLaDGWbb/3r/d8db3O9NgfZYUYEd6Zjz2nbba51SL7zLe8Y
 HoPx+IQ/X0fM2kJmgKk06iLEcvvTYlX2h8Als5lC5pEfulogO+sUqemRF4n6m2Eekf4w
 CtPoyJGaZ6slsRjff5y3xVucnMlyQBZjuB7TsLW/QfR5HbmU2eCSX+iDyn3uJA04puJa
 dF//PJEuj31ulpS82MggltzR4G2RUQnzjtNrp/7HOGpfHVW7cNQpoT3ypqVvpPJEUhsf
 QvGgSrM2kq5yWe5ythTOhC41utztrjpAcYlGjjw1vz9wzYdQhMtOLwSCYyXNwoJoZq7H
 sX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LCilH12wWw0seUa3hiJyDy0VxFX2Q3bA7Y0HXIYHhF8=;
 b=IUPlT20+ZdquoQ1zAdarwI3nHzaE/VJHZEeXLQdwzc887tdfXeonCBjnhQRtmo1ikm
 xRx1fQiUYRusWHNfuK5664eNVdi2BFqlwdn/d9G7LX44/QEDB/FZkSYsxsvOcWdcOTYu
 0ldRJA2ZU2gi7eEQah8okDCSZQyseoPxVfCEbgG6PuobnwNYPips2RT0Wwkp2Pf3cisQ
 sxmy1eqEfUrapIEIejnHOwT7wgS5NOENrxDOWkTSadvjd6/Oau4JLgNzo4rExyBlsIso
 t3dI7g/V1LA5CFHzBhv5KMLj8i7m3oaiWNHphpC/2a5Z0bfWkZrpdVcwnNS9psiPUrLU
 tybA==
X-Gm-Message-State: AOAM533lxPP/nlGGYV4NHXLzCjzhy/FSpls3Bf6J+XSnnz8Q/u3ytsAf
 v1S0AdViNaEeMU/mNV/wdoTBnaKnq9aiLtaJIEc=
X-Google-Smtp-Source: ABdhPJx1omsyXEH84uuE4kzYpPBu5v24anF9kQ0616INOFdPlqou2FDes2afxUGAuG2JNukP2+Sny94qEgWXdVVJ7J8=
X-Received: by 2002:a63:3f4e:: with SMTP id m75mr4955451pga.587.1639511000707; 
 Tue, 14 Dec 2021 11:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
In-Reply-To: <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
From: Yury Norov <yury.norov@gmail.com>
Date: Tue, 14 Dec 2021 11:43:09 -0800
Message-ID: <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,
 full} with bitmap_weight_eq()
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 15 Dec 2021 11:33:41 +1100
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

On Sun, Nov 28, 2021 at 10:10 AM Micha=C5=82 Miros=C5=82aw
<mirq-linux@rere.qmqm.pl> wrote:
>
> On Sat, Nov 27, 2021 at 07:56:57PM -0800, Yury Norov wrote:
> > Now as we have bitmap_weight_eq(), switch bitmap_full() and
> > bitmap_empty() to using it.
> >
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  include/linux/bitmap.h | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> > index 996041f771c8..2d951e4dc814 100644
> > --- a/include/linux/bitmap.h
> > +++ b/include/linux/bitmap.h
> > @@ -386,22 +386,6 @@ static inline int bitmap_subset(const unsigned lon=
g *src1,
> >               return __bitmap_subset(src1, src2, nbits);
> >  }
> >
> > -static inline bool bitmap_empty(const unsigned long *src, unsigned nbi=
ts)
> > -{
> > -     if (small_const_nbits(nbits))
> > -             return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
> > -
> > -     return find_first_bit(src, nbits) =3D=3D nbits;
> > -}
>
> Since this is supposed to be an optimization, I would go all the way and
> replace this with the trivial implementation instead:
>
> bool bitmap_empty(long *bits, size_t nbits)
> {
>         for (; nbits >=3D BITS_PER_LONG; ++bits, nbits -=3D BITS_PER_LONG=
)
>                 if (*bits)
>                         return false;
>
>         if (nbits && *bits & BITMAP_LAST_WORD_MASK(nbits))
>                 return false;
>
>         return true;
> }

This is what current implementations basically do, based on find_first_bit(=
).

I think that for long bitmaps the most time consuming operation is moving
data to L1, and for short bitmaps the difference between approaches is
barely measurable.

But hweght_long on each iteration can't be more effective than the current
version. So, I'll drop this patch for v2 and keep things unchanged.
