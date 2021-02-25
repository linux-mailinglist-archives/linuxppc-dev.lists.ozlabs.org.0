Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6526D325922
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 22:59:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmmsx2gjhz3cp0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 08:59:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z+d9Z01p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Z+d9Z01p; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmmsS6sZsz30Jn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 08:59:23 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id q204so3485361pfq.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 13:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Lr+EAj1L3SvhS0sgLJSE5BurhCAU0L6vbZIwL4lD+n0=;
 b=Z+d9Z01pJ/XoTC1j3PIYh8Ln2Le+IRissEssJVg6YNao725xaEF8bjpXlUlTDafXw3
 +X4+UGpVNnopdZH4n08e6Z42aULD6jxU7PhmbZXrGT0TvxJjtU2/1TJ8w+t26hmbItnN
 JuimIMyxjua8zK/cjQEM3tlvZOF35MWYInuI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lr+EAj1L3SvhS0sgLJSE5BurhCAU0L6vbZIwL4lD+n0=;
 b=Hha3bQ97Z2+NufSfyx2otC3e8xGARFdHMrcT6me3shqmHZHaxsHapvuNmT/MKZdJVc
 Yl7lh6CDjQBdQgZPUjK6wrey5YVZAye1fyz5MyHadrZ/wNwL/zVoI4zvzrIqk+LHTvJS
 XDUatM7Av6koh55DmGKUzbk71i0en52tBH21HMt0b6BMKtVeFiIt/C8zSuNCRzSHOEF2
 3b3mTbXfOrLrLww/NpaUcACaedQCQSxHNResCHvipBsQ/3sIKcJRf5YXOqLutGd8H9/D
 oGPpM5m5e/+oOt/nnN2pLUN1dFLegSjLGdCnX+ag4Sp3f9QNNODVExZ+xRJjBcSf2oy7
 MBoA==
X-Gm-Message-State: AOAM531YTIyNuD30pp75Qs33uuLsx4Po3QqtEd18ZfQv/9RHGsd1DvfU
 W8MouzDtUnN5IG1e36gFKuaScg==
X-Google-Smtp-Source: ABdhPJwl2Ti+XW6IUIm1JffdsYaS5HUTaKwMNdPcSB7kzRn/dqv2nPmmkKujDxOZzCXsD3O1WddSZQ==
X-Received: by 2002:a63:a401:: with SMTP id c1mr13477pgf.60.1614290360980;
 Thu, 25 Feb 2021 13:59:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i8sm7302055pgn.94.2021.02.25.13.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 13:59:20 -0800 (PST)
Date: Thu, 25 Feb 2021 13:59:19 -0800
From: Kees Cook <keescook@chromium.org>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH next v3 12/15] printk: introduce a kmsg_dump iterator
Message-ID: <202102251358.60700B3FFA@keescook>
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
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Douglas Anderson <dianders@chromium.org>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Wei Liu <wei.liu@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Anton Vorontsov <anton@enomsg.org>,
 Joel Stanley <joel@jms.id.au>, Jason Wessel <jason.wessel@windriver.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Petr Mladek <pmladek@suse.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jordan Niethe <jniethe5@gmail.com>, Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, kgdb-bugreport@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 25, 2021 at 09:24:35PM +0100, John Ogness wrote:
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

Reviewed-by: Kees Cook <keescook@chromium.org> # pstore

-Kees

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
> +		kmsg_dump_get_buffer(&iter, false,
>  				     big_oops_buf, big_oops_buf_sz, &text_len);
>  		rc = zip_oops(text_len);
>  	}
>  	if (rc != 0) {
> -		kmsg_dump_rewind(dumper);
> -		kmsg_dump_get_buffer(dumper, false,
> +		kmsg_dump_rewind(&iter);
> +		kmsg_dump_get_buffer(&iter, false,
>  				     oops_data, oops_data_sz, &text_len);
>  		err_type = ERR_TYPE_KERNEL_PANIC;
>  		oops_hdr->version = cpu_to_be16(OOPS_HDR_VERSION);
> diff --git a/arch/powerpc/platforms/powernv/opal-kmsg.c b/arch/powerpc/platforms/powernv/opal-kmsg.c
> index 6c3bc4b4da98..a7bd6ac681f4 100644
> --- a/arch/powerpc/platforms/powernv/opal-kmsg.c
> +++ b/arch/powerpc/platforms/powernv/opal-kmsg.c
> @@ -19,8 +19,7 @@
>   * may not be completely printed.  This function does not actually dump the
>   * message, it just ensures that OPAL completely flushes the console buffer.
>   */
> -static void kmsg_dump_opal_console_flush(struct kmsg_dumper *dumper,
> -				     enum kmsg_dump_reason reason)
> +static void kmsg_dump_opal_console_flush(enum kmsg_dump_reason reason)
>  {
>  	/*
>  	 * Outside of a panic context the pollers will continue to run,
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 80ed3e1becf9..5978b90a885f 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -3001,7 +3001,7 @@ print_address(unsigned long addr)
>  static void
>  dump_log_buf(void)
>  {
> -	struct kmsg_dumper dumper;
> +	struct kmsg_dump_iter iter;
>  	unsigned char buf[128];
>  	size_t len;
>  
> @@ -3013,9 +3013,9 @@ dump_log_buf(void)
>  	catch_memory_errors = 1;
>  	sync();
>  
> -	kmsg_dump_rewind_nolock(&dumper);
> +	kmsg_dump_rewind_nolock(&iter);
>  	xmon_start_pagination();
> -	while (kmsg_dump_get_line_nolock(&dumper, false, buf, sizeof(buf), &len)) {
> +	while (kmsg_dump_get_line_nolock(&iter, false, buf, sizeof(buf), &len)) {
>  		buf[len] = '\0';
>  		printf("%s", buf);
>  	}
> diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
> index 4869e2cc787c..9fbc5e5b1023 100644
> --- a/arch/um/kernel/kmsg_dump.c
> +++ b/arch/um/kernel/kmsg_dump.c
> @@ -7,9 +7,9 @@
>  #include <shared/kern.h>
>  #include <os.h>
>  
> -static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
> -				enum kmsg_dump_reason reason)
> +static void kmsg_dumper_stdout(enum kmsg_dump_reason reason)
>  {
> +	static struct kmsg_dump_iter iter;
>  	static DEFINE_SPINLOCK(lock);
>  	static char line[1024];
>  	struct console *con;
> @@ -34,8 +34,10 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
>  	if (!spin_trylock(&lock))
>  		return;
>  
> +	kmsg_dump_rewind(&iter);
> +
>  	printf("kmsg_dump:\n");
> -	while (kmsg_dump_get_line(dumper, true, line, sizeof(line), &len)) {
> +	while (kmsg_dump_get_line(&iter, true, line, sizeof(line), &len)) {
>  		line[len] = '\0';
>  		printf("%s", line);
>  	}
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 10dce9f91216..1b858f280e22 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -1388,9 +1388,9 @@ static void vmbus_isr(void)
>   * Callback from kmsg_dump. Grab as much as possible from the end of the kmsg
>   * buffer and call into Hyper-V to transfer the data.
>   */
> -static void hv_kmsg_dump(struct kmsg_dumper *dumper,
> -			 enum kmsg_dump_reason reason)
> +static void hv_kmsg_dump(enum kmsg_dump_reason reason)
>  {
> +	struct kmsg_dump_iter iter;
>  	size_t bytes_written;
>  	phys_addr_t panic_pa;
>  
> @@ -1404,7 +1404,8 @@ static void hv_kmsg_dump(struct kmsg_dumper *dumper,
>  	 * Write dump contents to the page. No need to synchronize; panic should
>  	 * be single-threaded.
>  	 */
> -	kmsg_dump_get_buffer(dumper, false, hv_panic_page, HV_HYP_PAGE_SIZE,
> +	kmsg_dump_rewind(&iter);
> +	kmsg_dump_get_buffer(&iter, false, hv_panic_page, HV_HYP_PAGE_SIZE,
>  			     &bytes_written);
>  	if (bytes_written)
>  		hyperv_report_panic_msg(panic_pa, bytes_written);
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 8bbfba40a554..d179b726a1c9 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -272,19 +272,21 @@ static void find_next_position(struct mtdoops_context *cxt)
>  	mtdoops_inc_counter(cxt);
>  }
>  
> -static void mtdoops_do_dump(struct kmsg_dumper *dumper,
> -			    enum kmsg_dump_reason reason)
> +static void mtdoops_do_dump(enum kmsg_dump_reason reason)
>  {
>  	struct mtdoops_context *cxt = container_of(dumper,
>  			struct mtdoops_context, dump);
> +	struct kmsg_dump_iter iter;
>  
>  	/* Only dump oopses if dump_oops is set */
>  	if (reason == KMSG_DUMP_OOPS && !dump_oops)
>  		return;
>  
> +	kmsg_dump_rewind(&iter);
> +
>  	if (test_and_set_bit(0, &cxt->oops_buf_busy))
>  		return;
> -	kmsg_dump_get_buffer(dumper, true, cxt->oops_buf + MTDOOPS_HEADER_SIZE,
> +	kmsg_dump_get_buffer(&iter, true, cxt->oops_buf + MTDOOPS_HEADER_SIZE,
>  			     record_size - MTDOOPS_HEADER_SIZE, NULL);
>  	clear_bit(0, &cxt->oops_buf_busy);
>  
> diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
> index d963ae7902f9..edfc9504e024 100644
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -382,9 +382,9 @@ void pstore_record_init(struct pstore_record *record,
>   * callback from kmsg_dump. Save as much as we can (up to kmsg_bytes) from the
>   * end of the buffer.
>   */
> -static void pstore_dump(struct kmsg_dumper *dumper,
> -			enum kmsg_dump_reason reason)
> +static void pstore_dump(enum kmsg_dump_reason reason)
>  {
> +	struct kmsg_dump_iter iter;
>  	unsigned long	total = 0;
>  	const char	*why;
>  	unsigned int	part = 1;
> @@ -405,6 +405,8 @@ static void pstore_dump(struct kmsg_dumper *dumper,
>  		}
>  	}
>  
> +	kmsg_dump_rewind(&iter);
> +
>  	oopscount++;
>  	while (total < kmsg_bytes) {
>  		char *dst;
> @@ -435,7 +437,7 @@ static void pstore_dump(struct kmsg_dumper *dumper,
>  		dst_size -= header_size;
>  
>  		/* Write dump contents. */
> -		if (!kmsg_dump_get_buffer(dumper, true, dst + header_size,
> +		if (!kmsg_dump_get_buffer(&iter, true, dst + header_size,
>  					  dst_size, &dump_size))
>  			break;
>  
> diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
> index 84eaa2090efa..5d3bf20f9f0a 100644
> --- a/include/linux/kmsg_dump.h
> +++ b/include/linux/kmsg_dump.h
> @@ -29,6 +29,16 @@ enum kmsg_dump_reason {
>  	KMSG_DUMP_MAX
>  };
>  
> +/**
> + * struct kmsg_dump_iter - iterator for retrieving kernel messages
> + * @cur_seq:	Points to the oldest message to dump
> + * @next_seq:	Points after the newest message to dump
> + */
> +struct kmsg_dump_iter {
> +	u64	cur_seq;
> +	u64	next_seq;
> +};
> +
>  /**
>   * struct kmsg_dumper - kernel crash message dumper structure
>   * @list:	Entry in the dumper list (private)
> @@ -36,35 +46,29 @@ enum kmsg_dump_reason {
>   * 		through the record iterator
>   * @max_reason:	filter for highest reason number that should be dumped
>   * @registered:	Flag that specifies if this is already registered
> - * @cur_seq:	Points to the oldest message to dump
> - * @next_seq:	Points after the newest message to dump
>   */
>  struct kmsg_dumper {
>  	struct list_head list;
> -	void (*dump)(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason);
> +	void (*dump)(enum kmsg_dump_reason reason);
>  	enum kmsg_dump_reason max_reason;
>  	bool registered;
> -
> -	/* private state of the kmsg iterator */
> -	u64 cur_seq;
> -	u64 next_seq;
>  };
>  
>  #ifdef CONFIG_PRINTK
>  void kmsg_dump(enum kmsg_dump_reason reason);
>  
> -bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
> +bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter, bool syslog,
>  			       char *line, size_t size, size_t *len);
>  
> -bool kmsg_dump_get_line(struct kmsg_dumper *dumper, bool syslog,
> +bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
>  			char *line, size_t size, size_t *len);
>  
> -bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
> +bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
>  			  char *buf, size_t size, size_t *len_out);
>  
> -void kmsg_dump_rewind_nolock(struct kmsg_dumper *dumper);
> +void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter);
>  
> -void kmsg_dump_rewind(struct kmsg_dumper *dumper);
> +void kmsg_dump_rewind(struct kmsg_dump_iter *iter);
>  
>  int kmsg_dump_register(struct kmsg_dumper *dumper);
>  
> @@ -76,30 +80,30 @@ static inline void kmsg_dump(enum kmsg_dump_reason reason)
>  {
>  }
>  
> -static inline bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper,
> +static inline bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter,
>  					     bool syslog, const char *line,
>  					     size_t size, size_t *len)
>  {
>  	return false;
>  }
>  
> -static inline bool kmsg_dump_get_line(struct kmsg_dumper *dumper, bool syslog,
> +static inline bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
>  				const char *line, size_t size, size_t *len)
>  {
>  	return false;
>  }
>  
> -static inline bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
> +static inline bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
>  					char *buf, size_t size, size_t *len)
>  {
>  	return false;
>  }
>  
> -static inline void kmsg_dump_rewind_nolock(struct kmsg_dumper *dumper)
> +static inline void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter)
>  {
>  }
>  
> -static inline void kmsg_dump_rewind(struct kmsg_dumper *dumper)
> +static inline void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
>  {
>  }
>  
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 315169d5e119..8544d7a55a57 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2101,7 +2101,7 @@ static int kdb_dmesg(int argc, const char **argv)
>  	int adjust = 0;
>  	int n = 0;
>  	int skip = 0;
> -	struct kmsg_dumper dumper;
> +	struct kmsg_dump_iter iter;
>  	size_t len;
>  	char buf[201];
>  
> @@ -2126,8 +2126,8 @@ static int kdb_dmesg(int argc, const char **argv)
>  		kdb_set(2, setargs);
>  	}
>  
> -	kmsg_dump_rewind_nolock(&dumper);
> -	while (kmsg_dump_get_line_nolock(&dumper, 1, NULL, 0, NULL))
> +	kmsg_dump_rewind_nolock(&iter);
> +	while (kmsg_dump_get_line_nolock(&iter, 1, NULL, 0, NULL))
>  		n++;
>  
>  	if (lines < 0) {
> @@ -2159,8 +2159,8 @@ static int kdb_dmesg(int argc, const char **argv)
>  	if (skip >= n || skip < 0)
>  		return 0;
>  
> -	kmsg_dump_rewind_nolock(&dumper);
> -	while (kmsg_dump_get_line_nolock(&dumper, 1, buf, sizeof(buf), &len)) {
> +	kmsg_dump_rewind_nolock(&iter);
> +	while (kmsg_dump_get_line_nolock(&iter, 1, buf, sizeof(buf), &len)) {
>  		if (skip) {
>  			skip--;
>  			continue;
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 45cb3e9c62c5..e58ccc368348 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3390,7 +3390,6 @@ EXPORT_SYMBOL_GPL(kmsg_dump_reason_str);
>  void kmsg_dump(enum kmsg_dump_reason reason)
>  {
>  	struct kmsg_dumper *dumper;
> -	unsigned long flags;
>  
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(dumper, &dump_list, list) {
> @@ -3407,21 +3406,15 @@ void kmsg_dump(enum kmsg_dump_reason reason)
>  		if (reason > max_reason)
>  			continue;
>  
> -		/* initialize iterator with data about the stored records */
> -		logbuf_lock_irqsave(flags);
> -		dumper->cur_seq = latched_seq_read_nolock(&clear_seq);
> -		dumper->next_seq = prb_next_seq(prb);
> -		logbuf_unlock_irqrestore(flags);
> -
>  		/* invoke dumper which will iterate over records */
> -		dumper->dump(dumper, reason);
> +		dumper->dump(reason);
>  	}
>  	rcu_read_unlock();
>  }
>  
>  /**
>   * kmsg_dump_get_line_nolock - retrieve one kmsg log line (unlocked version)
> - * @dumper: registered kmsg dumper
> + * @iter: kmsg dump iterator
>   * @syslog: include the "<4>" prefixes
>   * @line: buffer to copy the line to
>   * @size: maximum size of the buffer
> @@ -3438,7 +3431,7 @@ void kmsg_dump(enum kmsg_dump_reason reason)
>   *
>   * The function is similar to kmsg_dump_get_line(), but grabs no locks.
>   */
> -bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
> +bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter, bool syslog,
>  			       char *line, size_t size, size_t *len)
>  {
>  	struct printk_info info;
> @@ -3451,11 +3444,11 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
>  
>  	/* Read text or count text lines? */
>  	if (line) {
> -		if (!prb_read_valid(prb, dumper->cur_seq, &r))
> +		if (!prb_read_valid(prb, iter->cur_seq, &r))
>  			goto out;
>  		l = record_print_text(&r, syslog, printk_time);
>  	} else {
> -		if (!prb_read_valid_info(prb, dumper->cur_seq,
> +		if (!prb_read_valid_info(prb, iter->cur_seq,
>  					 &info, &line_count)) {
>  			goto out;
>  		}
> @@ -3464,7 +3457,7 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
>  
>  	}
>  
> -	dumper->cur_seq = r.info->seq + 1;
> +	iter->cur_seq = r.info->seq + 1;
>  	ret = true;
>  out:
>  	if (len)
> @@ -3474,7 +3467,7 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
>  
>  /**
>   * kmsg_dump_get_line - retrieve one kmsg log line
> - * @dumper: registered kmsg dumper
> + * @iter: kmsg dump iterator
>   * @syslog: include the "<4>" prefixes
>   * @line: buffer to copy the line to
>   * @size: maximum size of the buffer
> @@ -3489,14 +3482,14 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
>   * A return value of FALSE indicates that there are no more records to
>   * read.
>   */
> -bool kmsg_dump_get_line(struct kmsg_dumper *dumper, bool syslog,
> +bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
>  			char *line, size_t size, size_t *len)
>  {
>  	unsigned long flags;
>  	bool ret;
>  
>  	logbuf_lock_irqsave(flags);
> -	ret = kmsg_dump_get_line_nolock(dumper, syslog, line, size, len);
> +	ret = kmsg_dump_get_line_nolock(iter, syslog, line, size, len);
>  	logbuf_unlock_irqrestore(flags);
>  
>  	return ret;
> @@ -3505,7 +3498,7 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_line);
>  
>  /**
>   * kmsg_dump_get_buffer - copy kmsg log lines
> - * @dumper: registered kmsg dumper
> + * @iter: kmsg dump iterator
>   * @syslog: include the "<4>" prefixes
>   * @buf: buffer to copy the line to
>   * @size: maximum size of the buffer
> @@ -3522,7 +3515,7 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_line);
>   * A return value of FALSE indicates that there are no more records to
>   * read.
>   */
> -bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
> +bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
>  			  char *buf, size_t size, size_t *len_out)
>  {
>  	struct printk_info info;
> @@ -3538,15 +3531,15 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
>  		goto out;
>  
>  	logbuf_lock_irqsave(flags);
> -	if (prb_read_valid_info(prb, dumper->cur_seq, &info, NULL)) {
> -		if (info.seq != dumper->cur_seq) {
> +	if (prb_read_valid_info(prb, iter->cur_seq, &info, NULL)) {
> +		if (info.seq != iter->cur_seq) {
>  			/* messages are gone, move to first available one */
> -			dumper->cur_seq = info.seq;
> +			iter->cur_seq = info.seq;
>  		}
>  	}
>  
>  	/* last entry */
> -	if (dumper->cur_seq >= dumper->next_seq) {
> +	if (iter->cur_seq >= iter->next_seq) {
>  		logbuf_unlock_irqrestore(flags);
>  		goto out;
>  	}
> @@ -3557,7 +3550,7 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
>  	 * because this function (by way of record_print_text()) will
>  	 * not write more than size-1 bytes of text into @buf.
>  	 */
> -	seq = find_first_fitting_seq(dumper->cur_seq, dumper->next_seq,
> +	seq = find_first_fitting_seq(iter->cur_seq, iter->next_seq,
>  				     size - 1, syslog, time);
>  
>  	/*
> @@ -3570,7 +3563,7 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
>  
>  	len = 0;
>  	prb_for_each_record(seq, prb, seq, &r) {
> -		if (r.info->seq >= dumper->next_seq)
> +		if (r.info->seq >= iter->next_seq)
>  			break;
>  
>  		len += record_print_text(&r, syslog, time);
> @@ -3579,7 +3572,7 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
>  		prb_rec_init_rd(&r, &info, buf + len, size - len);
>  	}
>  
> -	dumper->next_seq = next_seq;
> +	iter->next_seq = next_seq;
>  	ret = true;
>  	logbuf_unlock_irqrestore(flags);
>  out:
> @@ -3591,7 +3584,7 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_buffer);
>  
>  /**
>   * kmsg_dump_rewind_nolock - reset the iterator (unlocked version)
> - * @dumper: registered kmsg dumper
> + * @iter: kmsg dump iterator
>   *
>   * Reset the dumper's iterator so that kmsg_dump_get_line() and
>   * kmsg_dump_get_buffer() can be called again and used multiple
> @@ -3599,26 +3592,26 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_buffer);
>   *
>   * The function is similar to kmsg_dump_rewind(), but grabs no locks.
>   */
> -void kmsg_dump_rewind_nolock(struct kmsg_dumper *dumper)
> +void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter)
>  {
> -	dumper->cur_seq = latched_seq_read_nolock(&clear_seq);
> -	dumper->next_seq = prb_next_seq(prb);
> +	iter->cur_seq = latched_seq_read_nolock(&clear_seq);
> +	iter->next_seq = prb_next_seq(prb);
>  }
>  
>  /**
>   * kmsg_dump_rewind - reset the iterator
> - * @dumper: registered kmsg dumper
> + * @iter: kmsg dump iterator
>   *
>   * Reset the dumper's iterator so that kmsg_dump_get_line() and
>   * kmsg_dump_get_buffer() can be called again and used multiple
>   * times within the same dumper.dump() callback.
>   */
> -void kmsg_dump_rewind(struct kmsg_dumper *dumper)
> +void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
>  {
>  	unsigned long flags;
>  
>  	logbuf_lock_irqsave(flags);
> -	kmsg_dump_rewind_nolock(dumper);
> +	kmsg_dump_rewind_nolock(iter);
>  	logbuf_unlock_irqrestore(flags);
>  }
>  EXPORT_SYMBOL_GPL(kmsg_dump_rewind);
> -- 
> 2.20.1
> 

-- 
Kees Cook
