Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E9618486
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 17:32:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N38Rh1KCrz3cKM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 03:32:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jxprr5Yb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jxprr5Yb;
	dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N38QF1TPZz3c81
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 03:31:00 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id s1-20020a4a81c1000000b0047d5e28cdc0so328670oog.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wf8Ox+cqI36jbP+T7p6EKTUvmpF6v5KouIok7EbcyU=;
        b=Jxprr5Yb6GFP2iMDdNYwrv+edL5lsVZ+sskHoEYasypEvTLy4Q6vhTS7qqFC2ZOJ9F
         7UlwmUBWdL8ATQXLGSU2oLt77vVHPXn0OrJO9RZ4ozCxeZSFNH6CKpqcZtCvnwol4zeN
         srTpQmrtC9fSlFcJoeE3VBMkcRHxF4UC77PI0QPdBZOTiLk4O1EgX10WGEBp+gELT/Of
         f0hLEd5d1y3j2mzfUulOKKw9wLwe0rGXdFxYErQK/3o71DkASuqcP1UgrC5XDCQfhx1n
         GSTmaFTFIU7py0xRt57Y61rOd+D7tYEKoK35ZenJvXOnTlTZe3nUPKJMZ1OW7PKQwbP+
         CarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wf8Ox+cqI36jbP+T7p6EKTUvmpF6v5KouIok7EbcyU=;
        b=Jkoxoghvz4QFppH3ZLOKNm3c5CPjBB+vqXoyNFMhXYJSH/IIf7Oz/URqTqt20GV/KI
         YFJXanejrpBL/9ROZtl/mR0bIYhcLo+FI2y5Kqu3mLmRaggiJyYvmyyRQbcaarbGiSzd
         Foe93/9r/QaFzdr2DdCN6f+pQobUv7jwdWYpj5WUmvHYwEa2rzASjtN5H0nLzVjDTuFL
         7TFcwbBBQ+UbEJcWM7m6stJySlh79txghxEKM0OFciKq4hIOBFtjl/pgcxHH9cvwBF1u
         5aCwI9igxyWKqHapMmNYHcakqfiBl6f09JEPQ2L5+Rju2umn7x0MdfWNRGTQA3Pmlv1H
         LohA==
X-Gm-Message-State: ACrzQf18X57fp8nS738QYoDrUsiiWEmccs+CfsuOWS2plVllGuHn8IN5
	PIVoklbbiMuO7NENy4h/pBA=
X-Google-Smtp-Source: AMsMyM4XFkvxtx6hYtImOQooUBUuMwcsCe7CNpBD20J79Sc2FfnE52Rm7s0RT965HybTqZXYxmJ8ng==
X-Received: by 2002:a4a:a609:0:b0:499:74ab:f10e with SMTP id e9-20020a4aa609000000b0049974abf10emr12101601oom.13.1667493056510;
        Thu, 03 Nov 2022 09:30:56 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id t15-20020a4a858f000000b00480e1109695sm370965ooh.10.2022.11.03.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 09:30:56 -0700 (PDT)
From: yury.norov@gmail.com
X-Google-Original-From: Yury Norov <yury.norov@gmail.com>, To: Andrew Jones <ajones@ventanamicro.com>;
Date: Thu, 3 Nov 2022 09:30:54 -0700
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y2PsvvOWVs9ZLBsp@yury-laptop>
References: <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
 <20221103153404.uh77nrdkowrxj6cr@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103153404.uh77nrdkowrxj6cr@kamzik>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv <linux-riscv@lists.infradead.org>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022 at 04:34:04PM +0100, Andrew Jones wrote:
> On Thu, Nov 03, 2022 at 04:02:12PM +0100, Borislav Petkov wrote:
> > On Thu, Nov 03, 2022 at 01:59:45PM +0100, Andrew Jones wrote:
> > > The patch I'm proposing ensures cpumask_next()'s range, which is actually
> > > [-1, nr_cpus_ids - 1),
> > 
> > Lemme make sure I understand it correctly: on the upper boundary, if you
> > supply for n the value nr_cpu_ids - 2, then it will return potentially
> > the last bit if the mask is set, i.e., the one at position (nr_cpu_ids - 1).
> > 
> > If you supply nr_cpus_ids - 1, then it'll return nr_cpu_ids to signal no
> > further bits set.
> > 
> > Yes, no?
> 
> Yes
> 
> > 
> > > I'll send a v4 with another stab at the commit message.
> > 
> > Yes, and it is still an unreadable mess: "A kernel compiled with commit
> > ... but not its revert... " Nope.
> > 
> > First make sure cpumask_next()'s valid accepted range has been settled
> > upon, has been explicitly documented in a comment above it and then I'll
> > take a patch that fixes whatever is there to fix.
> 
> That's fair, but I'll leave that to Yury.

I'll take care of it.
 
> > Callers should not have to filter values before passing them in - the
> > function either returns an error or returns the next bit in the mask.
> 
> That's reasonable, but cpumask folk probably need to discuss it because
> not all cpumask functions have a return value where an error may be
> placed.
 
Callers should pass sane arguments into internal functions if they
expect sane output. The API not exported to userspace shouldn't
sanity-check all inputs arguments. For example, cpumask_next() doesn't
check srcp for NULL.

However, cpumask API is exposed to drivers, and that's why optional
cpumask_check() exists. (Probably. It has been done long before I took
over this.)

Current *generic* implementation guarantees that out-of-region offset
would prevent cpumask_next() from dereferencing srcp, and makes it
returning nr_cpu_ids. This behavior is expected by many callers. However,
there is a couple of non-generic cpumask implementations, and one of
them is written in assembler. So, the portable code shouldn't expect
from cpumasks more than documentation said: for a _valid_ offset
cpumask_next() returns next set bit or >= nr_cpu_ids.

cpumask_check() has been broken for years. Attempting to fix it faced
so much resistance, that I had to revert the patch. Now there's
ongoing discussion whether we need this check at all. My opinion is
that if all implementations of cpumask (more precisely, underlying
bitmap API) are safe against out-of-range offset, we can simply remove
cpumask_check(). Those users, like cpuinfo, who waste time on useless
last iteration will bear it themselves. 
 
Thanks,
Yury
