Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0532A1A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 14:55:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqdvG6cz9z3cY6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 00:55:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=oL4v99bE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=oL4v99bE; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqdtr6sFCz30QF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 00:55:31 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614693328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2zHzG0WPsx3xKiPqPnMCcC9JpT/COf8SAqNxgYPDcwI=;
 b=oL4v99bE7SLyOQloEmxBm5+k/xMRvTkk4pt/OG8qvLA6b9DdiRhtxaD+0nUB4F5N4OQcsj
 Ic/6CdYJx/OPu8rlCqsNQGpM38HYhSfsHpGptacoyamFaVFqs7/yek3tHvqyg/+qcdd+DL
 OfjwuhDgZRqJTg+9ADLiziF6AFqEqM8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5718AAFF5;
 Tue,  2 Mar 2021 13:55:28 +0000 (UTC)
Date: Tue, 2 Mar 2021 14:55:26 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH next v3 12/15] printk: introduce a kmsg_dump iterator
Message-ID: <YD5DzldNpnzuECaA@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-13-john.ogness@linutronix.de>
 <YD0tbVV+hZOFvWyB@alley> <87lfb5pu8c.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfb5pu8c.fsf@jogness.linutronix.de>
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Wei Liu <wei.liu@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Anton Vorontsov <anton@enomsg.org>,
 Joel Stanley <joel@jms.id.au>, Jason Wessel <jason.wessel@windriver.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jordan Niethe <jniethe5@gmail.com>, Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, kgdb-bugreport@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2021-03-02 14:20:51, John Ogness wrote:
> On 2021-03-01, Petr Mladek <pmladek@suse.com> wrote:
> >> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> >> index 532f22637783..5a64b24a91c2 100644
> >> --- a/arch/powerpc/kernel/nvram_64.c
> >> +++ b/arch/powerpc/kernel/nvram_64.c
> >> @@ -681,13 +680,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
> >>  		return;
> >>  
> >>  	if (big_oops_buf) {
> >> -		kmsg_dump_get_buffer(dumper, false,
> >> +		kmsg_dump_rewind(&iter);
> >
> > It would be nice to get rid of the kmsg_dump_rewind(&iter) calls
> > in all callers.
> >
> > A solution might be to create the following in include/linux/kmsg_dump.h
> >
> > Then we could do the following at the beginning of both
> > kmsg_dump_get_buffer() and kmsg_dump_get_line():
> >
> > 	u64 clear_seq = latched_seq_read_nolock(&clear_seq);
> >
> > 	if (iter->cur_seq < clear_seq)
> > 		cur_seq = clear_seq;
> 
> I suppose we need to add this part anyway, if we want to enforce that
> records before @clear_seq are not to be available for dumpers.

Yup.

> > It might be better to avoid the infinite loop. We could do the following:
> >
> > static void check_and_set_iter(struct kmsg_dump_iter)
> > {
> > 	if (iter->cur_seq == 0 && iter->next_seq == U64_MAX) {
> > 		kmsg_dump_rewind(iter);
> > }
> >
> > and call this at the beginning of both kmsg_dump_get_buffer()
> > and kmsg_dump_get_line()
> >
> > What do you think?
> 
> On a technical level, it does not make any difference. It is pure
> cosmetic.

Yup.

> Personally, I prefer the rewind directly before the kmsg_dump_get calls
> because it puts the initializer directly next to the user.
> 
> As an example to illustrate my view, I prefer:
> 
>     for (i = 0; i < n; i++)
>         ...;
> 
> instead of:
> 
>     int i = 0;
> 
>     ...
> 
>     for (; i < n; i++)
>         ...;
> 
> Also, I do not really like the special use of 0/U64_MAX to identify
> special actions of the kmsg_dump_get functions.

Fair enough.

> > Note that I do not resist on it. But it might make the API easier to
> > use from my POV.
> 
> Since you do not resist, I will keep the API the same for v4. But I will
> add the @clear_seq check to the kmsg_dump_get functions.

Go for it.

Best Regards,
Petr
