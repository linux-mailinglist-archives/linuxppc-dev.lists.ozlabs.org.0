Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE70460A2A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:09:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Lhw5c78z3dcP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:09:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=BSqkw57U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256
 header.s=1 header.b=BSqkw57U; dkim-atps=neutral
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Gjv5PHtz2ynm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 05:10:27 +1100 (AEDT)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2Gjn33d2zW8;
 Sun, 28 Nov 2021 19:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638123024; bh=JZhqOAoOJwkFLsUnNQo8o++CiFK7HEGKhePgc/FSOF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSqkw57UlW2pW1NXQ5wZ96M5n0daMnNFg3ZZGk4QpT65f28st6tvSbAjCuaDYp0Y0
 CmyX5dp3fxa/1bsCgFSoiXvYl/Ivrvk/XW5Lhr31jLklN0/6fnKbeszxM4AJMOo6b9
 hs1WVqqJVnnkAxwtLxudxAhzHN+6r0DPz2i1TcI1//mgPfBMhwBro3m3CGjmkmEKO0
 zFXYptfKQJ6Xhp//QSGLBmM8xlFJVmHJ9/rNfVpoRczyIK6/HJ5953QI6d4A5Zxyqw
 UnYVoDxFeKZcNpL0K/UJMA5pXP8gOMjtVWWYJxoXBIppSPMAs/Uq2+pv87S9vD8wOI
 LfWcTnK2w+pRg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 19:10:20 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Message-ID: <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211128035704.270739-3-yury.norov@gmail.com>
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

On Sat, Nov 27, 2021 at 07:56:57PM -0800, Yury Norov wrote:
> Now as we have bitmap_weight_eq(), switch bitmap_full() and
> bitmap_empty() to using it.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  include/linux/bitmap.h | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 996041f771c8..2d951e4dc814 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -386,22 +386,6 @@ static inline int bitmap_subset(const unsigned long *src1,
>  		return __bitmap_subset(src1, src2, nbits);
>  }
>  
> -static inline bool bitmap_empty(const unsigned long *src, unsigned nbits)
> -{
> -	if (small_const_nbits(nbits))
> -		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
> -
> -	return find_first_bit(src, nbits) == nbits;
> -}

Since this is supposed to be an optimization, I would go all the way and
replace this with the trivial implementation instead:

bool bitmap_empty(long *bits, size_t nbits)
{
	for (; nbits >= BITS_PER_LONG; ++bits, nbits -= BITS_PER_LONG)
		if (*bits)
			return false;

	if (nbits && *bits & BITMAP_LAST_WORD_MASK(nbits))
		return false;

	return true;
}
 
Best Regards
Micha³ Miros³aw
