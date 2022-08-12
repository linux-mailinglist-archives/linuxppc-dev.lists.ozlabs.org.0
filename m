Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E4590B94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 07:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3swK3zHDz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 15:40:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y5miI5Up;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y5miI5Up;
	dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3svd6VgLz2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 15:40:13 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id l188so63566oia.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 22:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=LEk3bzp8qgdjJuAA1lA8YQmg4M93jnRJwNdPwvVwb7Q=;
        b=Y5miI5Up3qyAKHfSHstMwoL6f+uDrW85BKRw2CS2/fhyoGQ6K9u1PfF8EIhCDwqZe3
         PYnvK+reVQATqBSbPEYOwZAQ7z7/qsIMcIe/bxWeH5rAlDjjDu5+M8CCszY2cydwoGXJ
         oE1/X1HIPPxoDd1VC/8WKvllXHN9iQE6q8rp0rmBIx9fckCxD3i3chXIWv6EyzgE1l8f
         vMbuaFAnffWz+pICMz9aKIphqR/2dtcy6Khz/E1NgnTThLs447WynzrJHZwsrfHOXWTN
         YbU5FxOn/Z6YUUboBa9AOINu9eA8mHdxaTZXQtnT5vGlxF+7tAbxm4ZqK1G03HHTN/om
         rM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=LEk3bzp8qgdjJuAA1lA8YQmg4M93jnRJwNdPwvVwb7Q=;
        b=IZkbtG9sMIGfs3SgRCMZqMmykKMREb51Te3lFjkK327E/kMTTqxN5TjPdTk41Vomqg
         llbTWrQx7f7x7IA3sKOc7hKrj9JXCXS1iJGl4gguKylf3xhZWXCtAOoUSEzFPhG/hQSm
         ilYEWPcFQzF+ZTIgQcADIAJMaUafnQ+Lb/rgUxcDtoSy5C2dArm6IhAoX45N4fIfo1lj
         t7k9CgGJyZvAZGbjcBug1gKM8nTu0XVJfSop4JSR11muXMqufYpRQxUe8kRSSN6F/q/T
         2D/bJzYVTyKFV9uZ1WIIPwB5aj0MKrBJwTNk9gPSo/oRD4oXFJceemjO8Y6vChEvMEzj
         Tb5Q==
X-Gm-Message-State: ACgBeo3S/MfWS9K52JC4jDe8KsyP+Mzy/LoURtlHr1oEPbm/l/VfLWQ7
	hu14QjzPsQPygTbNU88eEhU=
X-Google-Smtp-Source: AA6agR7+plGN8QgVa3/azqB5ZkGY0r3/hgPXOizd/Lk+3gPZTk29TZ2iqLZeYZwJzZqT0JI19m+erg==
X-Received: by 2002:a05:6808:140a:b0:33f:b7b:7dfc with SMTP id w10-20020a056808140a00b0033f0b7b7dfcmr4877139oiv.209.1660282808172;
        Thu, 11 Aug 2022 22:40:08 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id be28-20020a056870589c00b0010e73e252b8sm231616oab.6.2022.08.11.22.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 22:40:07 -0700 (PDT)
Date: Thu, 11 Aug 2022 22:40:06 -0700
From: Yury Norov <yury.norov@gmail.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RESEND PATCH 2/2] lib/nodemask: inline next_node_in() and
 node_random()
Message-ID: <YvXntrThK+A1DiPI@yury-laptop>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-3-yury.norov@gmail.com>
 <87o7wqkpme.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7wqkpme.fsf@linux.ibm.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 12, 2022 at 10:46:57AM +0530, Aneesh Kumar K.V wrote:
> Yury Norov <yury.norov@gmail.com> writes:
> 
> > The functions are pretty thin wrappers around find_bit engine, and
> > keeping them in c-file prevents compiler from small_const_nbits()
> > optimization, which must take place for all systems with MAX_NUMNODES
> > less than BITS_PER_LONG (default is 16 for me).
> >
> > Moving them to header file doesn't blow up the kernel size:
> > add/remove: 1/2 grow/shrink: 9/5 up/down: 968/-88 (880)
> >
> > CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  MAINTAINERS              |  1 -
> >  include/linux/nodemask.h | 27 ++++++++++++++++++++++-----
> >  lib/Makefile             |  2 +-
> >  lib/nodemask.c           | 30 ------------------------------
> >  4 files changed, 23 insertions(+), 37 deletions(-)
> >  delete mode 100644 lib/nodemask.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7c0b8f28aa25..19c8d0ef1177 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3540,7 +3540,6 @@ F:	lib/bitmap.c
> >  F:	lib/cpumask.c
> >  F:	lib/find_bit.c
> >  F:	lib/find_bit_benchmark.c
> > -F:	lib/nodemask.c
> >  F:	lib/test_bitmap.c
> >  F:	tools/include/linux/bitmap.h
> >  F:	tools/include/linux/find.h
> > diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
> > index 0f233b76c9ce..48ebe4007955 100644
> > --- a/include/linux/nodemask.h
> > +++ b/include/linux/nodemask.h
> > @@ -94,6 +94,7 @@
> >  #include <linux/bitmap.h>
> >  #include <linux/minmax.h>
> >  #include <linux/numa.h>
> > +#include <linux/random.h>
> >  
> >  typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
> >  extern nodemask_t _unused_nodemask_arg_;
> > @@ -276,7 +277,14 @@ static inline unsigned int __next_node(int n, const nodemask_t *srcp)
> >   * the first node in src if needed.  Returns MAX_NUMNODES if src is empty.
> >   */
> >  #define next_node_in(n, src) __next_node_in((n), &(src))
> > -unsigned int __next_node_in(int node, const nodemask_t *srcp);
> > +static inline unsigned int __next_node_in(int node, const nodemask_t *srcp)
> > +{
> > +	unsigned int ret = __next_node(node, srcp);
> > +
> > +	if (ret == MAX_NUMNODES)
> > +		ret = __first_node(srcp);
> > +	return ret;
> > +}
> >  
> >  static inline void init_nodemask_of_node(nodemask_t *mask, int node)
> >  {
> > @@ -493,14 +501,23 @@ static inline int num_node_state(enum node_states state)
> >  
> >  #endif
> >  
> > +/*
> > + * Return the bit number of a random bit set in the nodemask.
> > + * (returns NUMA_NO_NODE if nodemask is empty)
> > + */
> > +static inline int node_random(const nodemask_t *maskp)
> > +{
> >  #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)
> > -extern int node_random(const nodemask_t *maskp);
> > +	int w, bit = NUMA_NO_NODE;
> > +
> > +	w = nodes_weight(*maskp);
> > +	if (w)
> > +		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_int() % w);
> > +	return bit;
> >  #else
> > -static inline int node_random(const nodemask_t *mask)
> > -{
> >  	return 0;
> > -}
> >  #endif
> > +}
> >  
> >  #define node_online_map 	node_states[N_ONLINE]
> >  #define node_possible_map 	node_states[N_POSSIBLE]
> > diff --git a/lib/Makefile b/lib/Makefile
> > index f99bf61f8bbc..731cea0342d1 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -33,7 +33,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
> >  	 flex_proportions.o ratelimit.o show_mem.o \
> >  	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
> >  	 earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
> > -	 nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o \
> > +	 nmi_backtrace.o win_minmax.o memcat_p.o \
> >  	 buildid.o
> >  
> >  lib-$(CONFIG_PRINTK) += dump_stack.o
> > diff --git a/lib/nodemask.c b/lib/nodemask.c
> > deleted file mode 100644
> > index 7dad4ce8ff59..000000000000
> > --- a/lib/nodemask.c
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0
> > -#include <linux/nodemask.h>
> > -#include <linux/module.h>
> > -#include <linux/random.h>
> > -
> > -unsigned int __next_node_in(int node, const nodemask_t *srcp)
> > -{
> > -	unsigned int ret = __next_node(node, srcp);
> > -
> > -	if (ret == MAX_NUMNODES)
> > -		ret = __first_node(srcp);
> > -	return ret;
> > -}
> > -EXPORT_SYMBOL(__next_node_in);
> > -
> > -#ifdef CONFIG_NUMA
> > -/*
> > - * Return the bit number of a random bit set in the nodemask.
> > - * (returns NUMA_NO_NODE if nodemask is empty)
> > - */
> > -int node_random(const nodemask_t *maskp)
> > -{
> > -	int w, bit = NUMA_NO_NODE;
> > -
> > -	w = nodes_weight(*maskp);
> > -	if (w)
> > -		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_int() % w);
> > -	return bit;
> > -}
> > -#endif
> > -- 
> > 2.34.1
> 
> The patch that got merged (36d4b36b69590fed99356a4426c940a253a93800) still have lib/nodemask.c

Thanks Aneesh. I'll send a fix shortly.
