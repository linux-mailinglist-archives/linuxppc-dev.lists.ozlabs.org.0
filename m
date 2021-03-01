Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB70B32873D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:24:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq6Yt508cz3ckm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 04:24:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RqQ5wOe0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=RqQ5wOe0; dkim-atps=neutral
X-Greylist: delayed 849 seconds by postgrey-1.36 at boromir;
 Tue, 02 Mar 2021 04:23:40 AEDT
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq6YS5Qw8z30PK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 04:23:39 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614618565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H35nz79U3iTc666xWR8lPmhHegrvhs5FWA9WuA5DkEI=;
 b=RqQ5wOe0/iOPbgkCB6+F3wjB6c0eOIYiAodwUelOlBKkvKla4T6I47dITleDs6+RLWIspc
 Es21DW2KUJVlAfVhSegO/4+EAe2vuEUr39OyN6XxmJfp4q/GBF6Pnh5R6EkEnA3PcrwpfB
 JyUEYKEYJ1KY7x0yNXuizUFDOpdNCiw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FB08AE3C;
 Mon,  1 Mar 2021 17:09:25 +0000 (UTC)
Date: Mon, 1 Mar 2021 18:09:23 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH next v3 11/15] printk: kmsg_dumper: remove @active field
Message-ID: <YD0fw0DErfsi2ibs@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-12-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225202438.28985-12-john.ogness@linutronix.de>
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Paul Mackerras <paulus@samba.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Wei Li <liwei391@huawei.com>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, Alistair Popple <alistair@popple.id.au>,
 Steven Rostedt <rostedt@goodmis.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2021-02-25 21:24:34, John Ogness wrote:
> All 6 kmsg_dumpers do not benefit from the @active flag:
> 
>   (provide their own synchronization)
>   - arch/powerpc/kernel/nvram_64.c
>   - arch/um/kernel/kmsg_dump.c
>   - drivers/mtd/mtdoops.c
>   - fs/pstore/platform.c
> 
>   (only dump on KMSG_DUMP_PANIC, which does not require
>   synchronization)
>   - arch/powerpc/platforms/powernv/opal-kmsg.c
>   - drivers/hv/vmbus_drv.c
> 
> The other 2 kmsg_dump users also do not rely on @active:
> 
>   (hard-code @active to always be true)
>   - arch/powerpc/xmon/xmon.c
>   - kernel/debug/kdb/kdb_main.c

Great summary!

> Therefore, @active can be removed.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
