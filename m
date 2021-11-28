Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3396D460514
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 08:04:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1zxY08pNz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 18:04:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RUU7MzRk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RUU7MzRk; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1z6s2KwFz30RH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 17:27:32 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id i9so19331803qki.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 22:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UUaWw2/vndQwOuhRc6j6PRwXuBODm2Svdcs9xeM4FlQ=;
 b=RUU7MzRkdirUtowuDWCiM08P7YQBQBC0acoWzbBj+T+XJI6vVMBSu6aGIKh4+icUwh
 a8q9bMYJuHCqFTUz0wNigsRNRIbsDwqKoKMNa0qnfF66qijICeNv/dPkbz+/087xhZlV
 f64hTvJmbUAx1It3pzpI4UUvGtwyNbU+zmtX09eMQ0ByGsuhC27g5T60WwoNMBivtuLQ
 VUm/Sp71jqGs+1C8GEcrf12fOpYmPWgYxCrrC9gGrggZZRnsjHL5/c7LM3QqhQgnqCqj
 LxxzrdrvicV7rQvSx7+bgEc8nFcDr55sjaFrS6W7kwXrGHkLvw0E6R41fTx7A36r5Slm
 hdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UUaWw2/vndQwOuhRc6j6PRwXuBODm2Svdcs9xeM4FlQ=;
 b=rgSJUTU4BIoziCc/NDxhVD3s9hw2FPh6Qc9F5V9Go8JdjpjbTghfzy7qts1uESyfQK
 cv7kw4vncJ658hAbJe3VRmpXApNUI8CC2K8/80ahZoD0fuXuaY1T7XDSGET2hN7JqR71
 aInAWu+uLC/aCt+jk+CJcrAVstRzptaiRiAI5rvtcjl8b6mE+a5lQA2ay/1wkk0fC2CH
 +WmSQirb8JKU7CtkC5CTai5CEQAAqK3cepMyHy63kZ/adIX6nMhMNLiFFOIPlc6PgVW9
 KRKi0/USmM5mEOEJrg/0riSlXYwquWuwEERmtovoNLWbZiwoJKqcA2uwtvIirx1XUY++
 hc9A==
X-Gm-Message-State: AOAM533kFsMq8lYRHE36ap6VGIMR80siZOJVtNipcC83yjfdIlZrnasO
 l7kDeoHfrrXoSJqJm04s0gg=
X-Google-Smtp-Source: ABdhPJxAVXtuKFpo3xQALAgWXmZbnwidtxXikhe9UCcw/0T4+58Z974u1PPCzNdv2+qiERrm5clSCw==
X-Received: by 2002:a05:620a:2153:: with SMTP id
 m19mr32383206qkm.77.1638080848758; 
 Sat, 27 Nov 2021 22:27:28 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id z4sm6611865qtj.42.2021.11.27.22.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 22:27:28 -0800 (PST)
Date: Sat, 27 Nov 2021 22:27:27 -0800
From: Yury Norov <yury.norov@gmail.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Message-ID: <20211128062727.GA276670@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaMHfzZ5PBn0714Z@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YaMHfzZ5PBn0714Z@qmqm.qmqm.pl>
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

On Sun, Nov 28, 2021 at 05:37:19AM +0100, Michał Mirosław wrote:
> On Sat, Nov 27, 2021 at 07:56:57PM -0800, Yury Norov wrote:
> > Now as we have bitmap_weight_eq(), switch bitmap_full() and
> > bitmap_empty() to using it.
> [...]
> > -static inline bool bitmap_empty(const unsigned long *src, unsigned nbits)
> > -{
> > -	if (small_const_nbits(nbits))
> > -		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
> > -
> > -	return find_first_bit(src, nbits) == nbits;
> > -}
> [...]
> > +static __always_inline bool bitmap_empty(const unsigned long *src, unsigned int nbits)
> > +{
> > +	return bitmap_weight_eq(src, nbits, 0);
> > +}
> [..]
> 
> What's the speed difference? Have you benchmarked this?

bitmap_weight_eq() should be faster than find_first_bit(), but the
difference is few cycles, so I didn't bother measuring it.

New version looks just better.
