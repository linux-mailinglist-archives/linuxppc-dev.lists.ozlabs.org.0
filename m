Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED51E2F2B7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 10:40:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFQXc4XFgzDr2d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 20:40:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XUckyEyp; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XUckyEyp; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFQVs4dCtzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 20:38:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610444299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M2YUbzTNTo+u/6WuZUqpyQ6bpHfdOyLxqxTbatpQROA=;
 b=XUckyEypIcZGDgpwBxGUalpvJb4QnxwSO/5K+eLrWcTbHo7/XtavSNS1xgDJUixsSViSRW
 Z2tWcwUUFEepTw7w1Vt3CfdSvjcu+IwQ2HU7azzz4cx18+RNPg+Dcn4/QdvEz3zpjNmkZx
 ufU9xtfofMAd44mg3MLuaEqhpPBMIVY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610444299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M2YUbzTNTo+u/6WuZUqpyQ6bpHfdOyLxqxTbatpQROA=;
 b=XUckyEypIcZGDgpwBxGUalpvJb4QnxwSO/5K+eLrWcTbHo7/XtavSNS1xgDJUixsSViSRW
 Z2tWcwUUFEepTw7w1Vt3CfdSvjcu+IwQ2HU7azzz4cx18+RNPg+Dcn4/QdvEz3zpjNmkZx
 ufU9xtfofMAd44mg3MLuaEqhpPBMIVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-xTMu6VdUOIKLTnQ7nGxXJQ-1; Tue, 12 Jan 2021 04:38:16 -0500
X-MC-Unique: xTMu6VdUOIKLTnQ7nGxXJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5AAD8018A7;
 Tue, 12 Jan 2021 09:38:14 +0000 (UTC)
Received: from krava (unknown [10.40.195.50])
 by smtp.corp.redhat.com (Postfix) with SMTP id 9CEC319712;
 Tue, 12 Jan 2021 09:38:12 +0000 (UTC)
Date: Tue, 12 Jan 2021 10:38:11 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Fix powerpc gap between kernel end and
 module start
Message-ID: <20210112093811.GA1272772@krava>
References: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jolsa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: maddy@linux.ibm.com, acme@kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 28, 2020 at 09:14:14PM -0500, Athira Rajeev wrote:

SNIP

> c000000002799370 b backtrace_flag
> c000000002799378 B radix_tree_node_cachep
> c000000002799380 B __bss_stop
> c0000000027a0000 B _end
> c008000003890000 t icmp_checkentry      [ip_tables]
> c008000003890038 t ipt_alloc_initial_table      [ip_tables]
> c008000003890468 T ipt_do_table [ip_tables]
> c008000003890de8 T ipt_unregister_table_pre_exit        [ip_tables]
> ...
> 
> Perf calls function symbols__fixup_end() which sets the end of symbol
> to 0xc008000003890000, which is the next address and this is the start
> address of first module (icmp_checkentry in above) which will make the
> huge symbol size of 0x80000010f0000.
> 
> After symbols__fixup_end:
> symbols__fixup_end: sym->name: _end, sym->start: 0xc0000000027a0000,
> sym->end: 0xc008000003890000
> 
> On powerpc, kernel text segment is located at 0xc000000000000000
> whereas the modules are located at very high memory addresses,
> 0xc00800000xxxxxxx. Since the gap between end of kernel text segment
> and beginning of first module's address is high, histogram allocation
> using calloc fails.
> 
> Fix this by detecting the kernel's last symbol and limiting
> the range of last kernel symbol to pagesize.
> 
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>

I can't test, but since the same approach works for arm and s390,
this also looks ok

Acked-by: Jiri Olsa <jolsa@redhat.com>

thanks,
jirka

> ---
>  tools/perf/arch/powerpc/util/Build     |  1 +
>  tools/perf/arch/powerpc/util/machine.c | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 tools/perf/arch/powerpc/util/machine.c
> 
> diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
> index e86e210bf514..b7945e5a543b 100644
> --- a/tools/perf/arch/powerpc/util/Build
> +++ b/tools/perf/arch/powerpc/util/Build
> @@ -1,4 +1,5 @@
>  perf-y += header.o
> +perf-y += machine.o
>  perf-y += kvm-stat.o
>  perf-y += perf_regs.o
>  perf-y += mem-events.o
> diff --git a/tools/perf/arch/powerpc/util/machine.c b/tools/perf/arch/powerpc/util/machine.c
> new file mode 100644
> index 000000000000..c30e5cc88c16
> --- /dev/null
> +++ b/tools/perf/arch/powerpc/util/machine.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <stdio.h>
> +#include <string.h>
> +#include <internal/lib.h> // page_size
> +#include "debug.h"
> +#include "symbol.h"
> +
> +/* On powerpc kernel text segment start at memory addresses, 0xc000000000000000
> + * whereas the modules are located at very high memory addresses,
> + * for example 0xc00800000xxxxxxx. The gap between end of kernel text segment
> + * and beginning of first module's text segment is very high.
> + * Therefore do not fill this gap and do not assign it to the kernel dso map.
> + */
> +
> +void arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
> +{
> +	if (strchr(p->name, '[') == NULL && strchr(c->name, '['))
> +		/* Limit the range of last kernel symbol */
> +		p->end += page_size;
> +	else
> +		p->end = c->start;
> +	pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
> +}
> -- 
> 1.8.3.1
> 

