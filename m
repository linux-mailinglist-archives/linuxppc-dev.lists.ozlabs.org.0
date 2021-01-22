Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CCC30019A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 12:31:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMcXg2tNyzDrQl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 22:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=i1BOwIEN; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZDaChUPs; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMcS53RRdzDrQl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 22:27:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611314842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZhDs7nwXoEv9bFTcxpNyWp1SGJsGzJKieaJ/PsaYo0=;
 b=i1BOwIENAWNI4bWtnSVdXW3svz+pDeUHZIa1R+5UgkVRUV9ToBS8QnmGku3QIqhAoHgZoI
 AiCuAq0/FjsR/TVt2gkQkN/Cum2L74sLZkT4l/VaXfQNt2gmwSfX0pzfu1Xid9f44S8hY2
 4bnhH+tJVEWz5JRcrNmMBym1O6J/yWU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611314843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZhDs7nwXoEv9bFTcxpNyWp1SGJsGzJKieaJ/PsaYo0=;
 b=ZDaChUPsc29MQKqKmWQL/YW6OyrpyYquRfqRnFQaeurN3KkNtdbyf/CCQkqq4Mgkhw8Rki
 QJHl4SPbwRuGpg4dXyQVlYIuCIvNyYGGziQgrTAyqIKSP5MKi9jIRa/5PuedugLtQ06u66
 sLF9NA0/zqVuLJ4qHKk/7bEcC8f+qIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-K6C89M0PNcCw2SmyYe8Rrg-1; Fri, 22 Jan 2021 06:27:19 -0500
X-MC-Unique: K6C89M0PNcCw2SmyYe8Rrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25D24180A096;
 Fri, 22 Jan 2021 11:27:18 +0000 (UTC)
Received: from oldenburg.str.redhat.com (ovpn-113-35.ams2.redhat.com
 [10.36.113.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB33810023BF;
 Fri, 22 Jan 2021 11:27:16 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64/signal: balance return predictor stack in
 signal trampoline
References: <20200511101952.1463138-1-npiggin@gmail.com>
Date: Fri, 22 Jan 2021 12:27:14 +0100
In-Reply-To: <20200511101952.1463138-1-npiggin@gmail.com> (Nicholas Piggin's
 message of "Mon, 11 May 2020 20:19:52 +1000")
Message-ID: <87im7pp5yl.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: musl@lists.openwall.com, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nicholas Piggin:

> diff --git a/arch/powerpc/kernel/vdso64/sigtramp.S b/arch/powerpc/kernel/vdso64/sigtramp.S
> index a8cc0409d7d2..bbf68cd01088 100644
> --- a/arch/powerpc/kernel/vdso64/sigtramp.S
> +++ b/arch/powerpc/kernel/vdso64/sigtramp.S
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org), IBM Corp.
>   * Copyright (C) 2004 Alan Modra (amodra@au.ibm.com)), IBM Corp.
>   */
> +#include <asm/cache.h>		/* IFETCH_ALIGN_BYTES */
>  #include <asm/processor.h>
>  #include <asm/ppc_asm.h>
>  #include <asm/unistd.h>
> @@ -14,21 +15,17 @@
>  
>  	.text
>  
> -/* The nop here is a hack.  The dwarf2 unwind routines subtract 1 from
> -   the return address to get an address in the middle of the presumed
> -   call instruction.  Since we don't have a call here, we artificially
> -   extend the range covered by the unwind info by padding before the
> -   real start.  */
> -	nop
>  	.balign 8
> +	.balign IFETCH_ALIGN_BYTES
>  V_FUNCTION_BEGIN(__kernel_sigtramp_rt64)
> -.Lsigrt_start = . - 4
> +.Lsigrt_start:
> +	bctrl	/* call the handler */
>  	addi	r1, r1, __SIGNAL_FRAMESIZE
>  	li	r0,__NR_rt_sigreturn
>  	sc
>  .Lsigrt_end:
>  V_FUNCTION_END(__kernel_sigtramp_rt64)
> -/* The ".balign 8" above and the following zeros mimic the old stack
> +/* The .balign 8 above and the following zeros mimic the old stack
>     trampoline layout.  The last magic value is the ucontext pointer,
>     chosen in such a way that older libgcc unwind code returns a zero
>     for a sigcontext pointer.  */

As far as I understand it, this breaks cancellation handling on musl and
future glibc because it is necessary to look at the signal delivery
location to see if a system call sequence has result in an action, and
that location is no longer in user code after this change.

We have a glibc test in preparation of our change, and it started
failing:

  Linux 5.10 breaks sigcontext_get_pc on powerpc64
  <https://sourceware.org/bugzilla/show_bug.cgi?id=27223>

Isn't it possible to avoid the return predictor desynchronization by
adding the appropriate hint?

Thanks,
Florian
-- 
Red Hat GmbH, https://de.redhat.com/ , Registered seat: Grasbrunn,
Commercial register: Amtsgericht Muenchen, HRB 153243,
Managing Directors: Charles Cachera, Brian Klemm, Laurie Krebs, Michael O'Neill

