Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC13289D2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 19:08:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq7Xp55lcz3clm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 05:08:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=aH1+7x/W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=aH1+7x/W; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq7XN1ddfz30L3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 05:07:47 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614622064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qp4HJtwIT4bWIf+9Fj02wgzG00aspAv7NDE1H9XsKw8=;
 b=aH1+7x/WqqqBgwoXsxJWiMMfixqBzqQo+CHJ0FMCUdP0kn8yxVawZhEsqiOr+QSi7cVRUm
 cH6dvttkUBHzyuxGaLPn0bQ3ilhyaCz7ZY6y77iScN5BUKhqdowr9f4TAygKPghH0VyeHu
 hCUXGbUSrWDF6mn/T5TxstesPyTwCSg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E550DAE3C;
 Mon,  1 Mar 2021 18:07:43 +0000 (UTC)
Date: Mon, 1 Mar 2021 19:07:41 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH next v3 12/15] printk: introduce a kmsg_dump iterator
Message-ID: <YD0tbVV+hZOFvWyB@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-13-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225202438.28985-13-john.ogness@linutronix.de>
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

On Thu 2021-02-25 21:24:35, John Ogness wrote:
> Rather than storing the iterator information in the registered
> kmsg_dumper structure, create a separate iterator structure. The
> kmsg_dump_iter structure can reside on the stack of the caller, thus
> allowing lockless use of the kmsg_dump functions.
> 
> This change also means that the kmsg_dumper dump() callback no
> longer needs to pass in the kmsg_dumper as an argument. If
> kmsg_dumpers want to access the kernel logs, they can use the new
> iterator.
> 
> Update the kmsg_dumper callback prototype. Update code that accesses
> the kernel logs using the kmsg_dumper structure to use the new
> kmsg_dump_iter structure. For kmsg_dumpers, this also means adding a
> call to kmsg_dump_rewind() to initialize the iterator.
> 
> All this is in preparation for removal of @logbuf_lock.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  arch/powerpc/kernel/nvram_64.c             | 14 +++---
>  arch/powerpc/platforms/powernv/opal-kmsg.c |  3 +-
>  arch/powerpc/xmon/xmon.c                   |  6 +--
>  arch/um/kernel/kmsg_dump.c                 |  8 +--
>  drivers/hv/vmbus_drv.c                     |  7 +--
>  drivers/mtd/mtdoops.c                      |  8 +--
>  fs/pstore/platform.c                       |  8 +--
>  include/linux/kmsg_dump.h                  | 38 ++++++++-------
>  kernel/debug/kdb/kdb_main.c                | 10 ++--
>  kernel/printk/printk.c                     | 57 ++++++++++------------
>  10 files changed, 81 insertions(+), 78 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> index 532f22637783..5a64b24a91c2 100644
> --- a/arch/powerpc/kernel/nvram_64.c
> +++ b/arch/powerpc/kernel/nvram_64.c
> @@ -72,8 +72,7 @@ static const char *nvram_os_partitions[] = {
>  	NULL
>  };
>  
> -static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason);
> +static void oops_to_nvram(enum kmsg_dump_reason reason);
>  
>  static struct kmsg_dumper nvram_kmsg_dumper = {
>  	.dump = oops_to_nvram
> @@ -642,11 +641,11 @@ void __init nvram_init_oops_partition(int rtas_partition_exists)
>   * that we think will compress sufficiently to fit in the lnx,oops-log
>   * partition.  If that's too much, go back and capture uncompressed text.
>   */
> -static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason)
> +static void oops_to_nvram(enum kmsg_dump_reason reason)
>  {
>  	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
>  	static unsigned int oops_count = 0;
> +	static struct kmsg_dump_iter iter;
>  	static bool panicking = false;
>  	static DEFINE_SPINLOCK(lock);
>  	unsigned long flags;
> @@ -681,13 +680,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
>  		return;
>  
>  	if (big_oops_buf) {
> -		kmsg_dump_get_buffer(dumper, false,
> +		kmsg_dump_rewind(&iter);

It would be nice to get rid of the kmsg_dump_rewind(&iter) calls
in all callers.

A solution might be to create the following in include/linux/kmsg_dump.h

#define KMSG_DUMP_ITER_INIT(iter) {	\
	.cur_seq = 0,			\
	.next_seq = U64_MAX,		\
	}

#define DEFINE_KMSG_DUMP_ITER(iter)	\
	struct kmsg_dump_iter iter = KMSG_DUMP_ITER_INIT(iter)

Then we could do the following at the beginning of both
kmsg_dump_get_buffer() and kmsg_dump_get_line():

	u64 clear_seq = latched_seq_read_nolock(&clear_seq);

	if (iter->cur_seq < clear_seq)
		cur_seq = clear_seq;


I am not completely sure about next_seq:

   + kmsg_dump_get_buffer() will set it for the next call anyway.
     It reads the blocks of messages from the newest.

   + kmsg_dump_get_line() wants to read the entire buffer anyway.
     But there is a small risk of an infinite loop when new messages
     are printed when dumping each line.

It might be better to avoid the infinite loop. We could do the following:

static void check_and_set_iter(struct kmsg_dump_iter)
{
	if (iter->cur_seq == 0 && iter->next_seq == U64_MAX) {
		kmsg_dump_rewind(iter);
}

and call this at the beginning of both kmsg_dump_get_buffer()
and kmsg_dump_get_line()

What do you think?

Note that I do not resist on it. But it might make the API easier to
use from my POV.

Otherwise the patch looks good to me.

Best Regards,
Petr
