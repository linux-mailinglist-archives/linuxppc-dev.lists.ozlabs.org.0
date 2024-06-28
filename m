Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236991B7E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 09:14:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OdcrGxUJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OdcrGxUJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9RWC053fz3ccS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 17:13:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OdcrGxUJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OdcrGxUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jfalempe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9RVV32Bqz2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 17:13:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719558798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBCG6Aq7g5s4IKz6cGy3Qa4TvJeSerIQI/YPWTkVSgw=;
	b=OdcrGxUJ9oSJ6XDMdNkxUd/Ou152i5CFPu/oGaWbYHJCiIA5lpU6yIAf+RbZFm8yTI1OpP
	Ctq2+YE0UqNYR7As1arsh8uLP8rnZ1A1UTX4WAvkkxUaln2MFhWEyJ47sMhInHU711F4Nu
	5zSwDGx5t5a5ev2gveh0ybAtRYHlKKo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719558798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBCG6Aq7g5s4IKz6cGy3Qa4TvJeSerIQI/YPWTkVSgw=;
	b=OdcrGxUJ9oSJ6XDMdNkxUd/Ou152i5CFPu/oGaWbYHJCiIA5lpU6yIAf+RbZFm8yTI1OpP
	Ctq2+YE0UqNYR7As1arsh8uLP8rnZ1A1UTX4WAvkkxUaln2MFhWEyJ47sMhInHU711F4Nu
	5zSwDGx5t5a5ev2gveh0ybAtRYHlKKo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-BEyqT_ChN5OREvvEhxVQPA-1; Fri, 28 Jun 2024 03:13:16 -0400
X-MC-Unique: BEyqT_ChN5OREvvEhxVQPA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52cdc4a8f44so297436e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 00:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719558794; x=1720163594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBCG6Aq7g5s4IKz6cGy3Qa4TvJeSerIQI/YPWTkVSgw=;
        b=iC0mdku1BU+E3wLe+XjRlOhNqMDEpk/Se1mGdJ413CtVEElOf4NWpG+ZqfCzGPll/E
         g6OCkdSVXCv7W7aWvX0j38mLxhiM+LBaKGGofCSbyRI9agFAEwuD4Mp9p5k/idEhZCT2
         cyJUkoer1l0c864m4oFktkC001aX9KVMghcVnzsnq0WzwsbnNgT8IlYbrn2Fj3YXw5E1
         mR17FCrF3sZMF5m6skyTcQXElJbqcs5sVkpA2ldJGaw3siCs1Rb8p8fPVHYruhG3bQK6
         dRs0npFg599bTHZW6fefJLVRQ09DMbFNxTTm5yFEzLUy15IFHfHg74ioWF4HK0UleCSF
         SNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRTml5OWQ2q8PJjDaYk/yOS8YoG5GwOCmOUs7NVb4z+yeg3ABN8w5/L9R3uCDbVWmnRcg20DHGRdGj23Y1phvGoHDgS4mY94QkXU7tkA==
X-Gm-Message-State: AOJu0YxaiZpos9t0XVDy1Abz5yYRjCpEF2R2KcgAr6QyQYaMoh6COy31
	41DZ6bf7nC8sFyLnfxXo75w2Wil3wZLm2UnDQ84UFdWTw1flcODGBwgEMCu18x6fqt15IPaVSGl
	w9uIgfQuWyn71teqKOroZoXahTlPXcDl2kq9NjqoNoAZohPkcRb+pJip5cddC0ts=
X-Received: by 2002:a05:6512:398f:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52e6d6e580emr4883303e87.14.1719558794368;
        Fri, 28 Jun 2024 00:13:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRNgxsh6SyinhqzjcyCteF/29SBwjZ8FpGkU83w6uoSo0McICUu/E5sqzerM5X1kwtLLuEIw==
X-Received: by 2002:a05:6512:398f:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52e6d6e580emr4883265e87.14.1719558793916;
        Fri, 28 Jun 2024 00:13:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0642acsm22012305e9.25.2024.06.28.00.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 00:13:13 -0700 (PDT)
Message-ID: <06899fda-de75-4d44-bda5-dcbb3e35d037@redhat.com>
Date: Fri, 28 Jun 2024 09:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>
References: <20240625123954.211184-1-jfalempe@redhat.com>
 <202406260906.533095B1@keescook>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202406260906.533095B1@keescook>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>, Uros Bizjak <ubizjak@gmail.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Wei Liu <wei.liu@kernel.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Dexuan Cui <decui@microsoft.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Petr Mladek <pmladek@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, John Ogness <john.ogness@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/06/2024 18:26, Kees Cook wrote:
> On Tue, Jun 25, 2024 at 02:39:29PM +0200, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new parameter "const char *desc" to the kmsg_dumper
>> dump() callback, and update all drivers that are using it.
>>
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>>
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> 
> Seems reasonable. Given the prototype before/after:
> 
> dump(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason)
> 
> dump(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason,
>       const char *desc)
> 
> Perhaps this should instead be a struct that the panic fills in? Then
> it'll be easy to adjust the struct in the future:

yes that's a good idea, so it's a bit more flexible.

> 
> struct kmsg_dump_detail {
> 	enum kmsg_dump_reason reason;
> 	const char *description;
> };
> 
> dump(struct kmsg_dumper *dumper, struct kmsg_dump *detail)
> 
> This .cocci could do the conversion:
> 
> 
> @ dump_func @
> identifier DUMPER, CALLBACK;
> @@
> 
>    struct kmsg_dumper DUMPER = {
>      .dump = CALLBACK,
>    };
> 
> @ detail @
> identifier dump_func.CALLBACK;
> identifier DUMPER, REASON;
> @@
> 
> 	CALLBACK(struct kmsg_dumper *DUMPER,
> -		 enum kmsg_dump_reason REASON
> +		 struct kmsg_dump_detail *detail
> 		)
> 	{
> 		<...
> -		REASON
> +		detail->reason
> 		...>
> 	}
> 
> 
> Also, just to double-check, doesn't the panic reason show up in the
> kmsg_dump log itself (at the end?) I ask since for pstore, "desc" is
> likely redundant since it's capturing the entire console log.

It is present in the kdump log, but before all the register dumps.
So to retrieve it you need to parse the last 30~40 lines of logs, and 
search for a line starting with "Kernel panic - not syncing".
https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/panic.c#L341
But I think that's a bit messy, and I prefer having a kmsg_dump parameter.

-- 

Jocelyn
> 
> -Kees
> 
> Here's the patch from the above cocci:
> 
> 
> diff -u -p a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -207,13 +207,13 @@ static int hv_die_panic_notify_crash(str
>    * buffer and call into Hyper-V to transfer the data.
>    */
>   static void hv_kmsg_dump(struct kmsg_dumper *dumper,
> -			 enum kmsg_dump_reason reason)
> +			 struct kmsg_dump_detail *detail)
>   {
>   	struct kmsg_dump_iter iter;
>   	size_t bytes_written;
>   
>   	/* We are only interested in panics. */
> -	if (reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
> +	if (detail->reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
>   		return;
>   
>   	/*
> diff -u -p a/arch/powerpc/platforms/powernv/opal-kmsg.c b/arch/powerpc/platforms/powernv/opal-kmsg.c
> --- a/arch/powerpc/platforms/powernv/opal-kmsg.c
> +++ b/arch/powerpc/platforms/powernv/opal-kmsg.c
> @@ -20,13 +20,13 @@
>    * message, it just ensures that OPAL completely flushes the console buffer.
>    */
>   static void kmsg_dump_opal_console_flush(struct kmsg_dumper *dumper,
> -				     enum kmsg_dump_reason reason)
> +				     struct kmsg_dump_detail *detail)
>   {
>   	/*
>   	 * Outside of a panic context the pollers will continue to run,
>   	 * so we don't need to do any special flushing.
>   	 */
> -	if (reason != KMSG_DUMP_PANIC)
> +	if (detail->reason != KMSG_DUMP_PANIC)
>   		return;
>   
>   	opal_flush_console(0);
> diff -u -p a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> --- a/arch/powerpc/kernel/nvram_64.c
> +++ b/arch/powerpc/kernel/nvram_64.c
> @@ -73,7 +73,7 @@ static const char *nvram_os_partitions[]
>   };
>   
>   static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason);
> +			  struct kmsg_dump_detail *detail);
>   
>   static struct kmsg_dumper nvram_kmsg_dumper = {
>   	.dump = oops_to_nvram
> @@ -643,7 +643,7 @@ void __init nvram_init_oops_partition(in
>    * partition.  If that's too much, go back and capture uncompressed text.
>    */
>   static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason)
> +			  struct kmsg_dump_detail *detail)
>   {
>   	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
>   	static unsigned int oops_count = 0;
> @@ -655,7 +655,7 @@ static void oops_to_nvram(struct kmsg_du
>   	unsigned int err_type = ERR_TYPE_KERNEL_PANIC_GZ;
>   	int rc = -1;
>   
> -	switch (reason) {
> +	switch (detail->reason) {
>   	case KMSG_DUMP_SHUTDOWN:
>   		/* These are almost always orderly shutdowns. */
>   		return;
> @@ -671,7 +671,7 @@ static void oops_to_nvram(struct kmsg_du
>   		break;
>   	default:
>   		pr_err("%s: ignoring unrecognized KMSG_DUMP_* reason %d\n",
> -		       __func__, (int) reason);
> +		       __func__, (int) detail->reason);
>   		return;
>   	}
>   
> warning: detail, node 59: record.reason = ... ;[1,2,21,22,32] in pstore_dump may be inconsistently modified
> warning: detail, node 105: if[1,2,21,22,54] in pstore_dump may be inconsistently modified
> diff -u -p a/fs/pstore/platform.c b/fs/pstore/platform.c
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -275,7 +275,7 @@ void pstore_record_init(struct pstore_re
>    * end of the buffer.
>    */
>   static void pstore_dump(struct kmsg_dumper *dumper,
> -			enum kmsg_dump_reason reason)
> +			struct kmsg_dump_detail *detail)
>   {
>   	struct kmsg_dump_iter iter;
>   	unsigned long	total = 0;
> @@ -285,9 +285,9 @@ static void pstore_dump(struct kmsg_dump
>   	int		saved_ret = 0;
>   	int		ret;
>   
> -	why = kmsg_dump_reason_str(reason);
> +	why = kmsg_dump_reason_str(detail->reason);
>   
> -	if (pstore_cannot_block_path(reason)) {
> +	if (pstore_cannot_block_path(detail->reason)) {
>   		if (!spin_trylock_irqsave(&psinfo->buf_lock, flags)) {
>   			pr_err("dump skipped in %s path because of concurrent dump\n",
>   					in_nmi() ? "NMI" : why);
> @@ -311,7 +311,7 @@ static void pstore_dump(struct kmsg_dump
>   		pstore_record_init(&record, psinfo);
>   		record.type = PSTORE_TYPE_DMESG;
>   		record.count = oopscount;
> -		record.reason = reason;
> +		record.reason = detail->reason;
>   		record.part = part;
>   		record.buf = psinfo->buf;
>   
> @@ -352,7 +352,7 @@ static void pstore_dump(struct kmsg_dump
>   		}
>   
>   		ret = psinfo->write(&record);
> -		if (ret == 0 && reason == KMSG_DUMP_OOPS) {
> +		if (ret == 0 && detail->reason == KMSG_DUMP_OOPS) {
>   			pstore_new_entry = 1;
>   			pstore_timer_kick();
>   		} else {
> diff -u -p a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
> --- a/arch/um/kernel/kmsg_dump.c
> +++ b/arch/um/kernel/kmsg_dump.c
> @@ -8,7 +8,7 @@
>   #include <os.h>
>   
>   static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
> -				enum kmsg_dump_reason reason)
> +				struct kmsg_dump_detail *detail)
>   {
>   	static struct kmsg_dump_iter iter;
>   	static DEFINE_SPINLOCK(lock);
> 

