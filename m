Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4E720BBEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:54:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49trJm1M5hzDqGn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=bX8dVRpG; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tr0N3QJgzDr6S
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:40:36 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id r18so5491246pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DBFCiCNbMQQSLufDN5X7qKcgik0Nhri90g4nsd8aM2E=;
 b=bX8dVRpG37euUl3qpbP17LA9iIFyjt3MI488CsWBsbJPJshDtVyG6lLlTanKQREUSr
 clyKuc8OuVr3VkT+sNlOIgeqSE/iU/y7pAbYvCm4QiVcDKwZoj5s3xOt6RZRLX5sK+bF
 3nuMQ6NX+qGwzqG6bzmX4AH222xRUaj1pgKf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DBFCiCNbMQQSLufDN5X7qKcgik0Nhri90g4nsd8aM2E=;
 b=Vilf8C3NbL0rMBmtyMN7ArPRWhpXUNGSS7U4o7ljGpg7d59zcybnsAivowqAv2FeNs
 d/bTcfKSG61WSyJhJaOpTfX/XQwV3qrdDj8jouLm2JEVbVpurv/At5lLw3WQvtb58cJQ
 OdJywejNIP2ICUJUuECBZbUMUik8EZFZX/KeC2FpfG4b8sPkB6IGrlQOjqbcJLJ6ov/6
 /M/GPit2A93crYwKNUkgOOV2taVVadOZHVggsh/WeUTjgHO6S3CJqueXjM/7Q5vHpMhN
 sDFM0d/bckqi6rVDtfvuzllTDOEszS54kFlj+lRNk7tdzHTC1y857s2j6ezGst6bHhNJ
 AXaQ==
X-Gm-Message-State: AOAM5339bszIhlZ4oRFN0PJq2KUeSwqZEg4mtmtUIEBT6uMPI9RDZviT
 7EVwTFS1s0fBVtyAQA5BA+y4ag==
X-Google-Smtp-Source: ABdhPJwsdIbHCnkHW98F5dFAh0C5o3xzHXeXSXzfKXDvmHf7nYqFOW0Q7J//8p36fZg/xNJuCfrMWw==
X-Received: by 2002:a62:a20e:: with SMTP id m14mr4374407pff.249.1593207634245; 
 Fri, 26 Jun 2020 14:40:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m16sm8751736pfd.101.2020.06.26.14.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 14:40:33 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:40:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 10/12] kunit: Add 'kunit_shutdown' option
Message-ID: <202006261436.DEF4906A5@keescook>
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-11-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626210917.358969-11-brendanhiggins@google.com>
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
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com, jcmvbkbc@gmail.com,
 will@kernel.org, paulus@samba.org, linux-kselftest@vger.kernel.org,
 frowand.list@gmail.com, anton.ivanov@cambridgegreys.com,
 linux-arch@vger.kernel.org, richard@nod.at, rppt@linux.ibm.com,
 yzaikin@google.com, linux-xtensa@linux-xtensa.org, arnd@arndb.de,
 jdike@addtoit.com, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 davidgow@google.com, skhan@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com,
 chris@zankel.net, monstr@monstr.eu, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 alan.maguire@oracle.com, akpm@linux-foundation.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 02:09:15PM -0700, Brendan Higgins wrote:
> From: David Gow <davidgow@google.com>
> 
> Add a new kernel command-line option, 'kunit_shutdown', which allows the
> user to specify that the kernel poweroff, halt, or reboot after
> completing all KUnit tests; this is very handy for running KUnit tests
> on UML or a VM so that the UML/VM process exits cleanly immediately
> after running all tests without needing a special initramfs.
> 
> Signed-off-by: David Gow <davidgow@google.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  lib/kunit/executor.c                | 20 ++++++++++++++++++++
>  tools/testing/kunit/kunit_kernel.py |  2 +-
>  tools/testing/kunit/kunit_parser.py |  2 +-
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> index a95742a4ece73..38061d456afb2 100644
> --- a/lib/kunit/executor.c
> +++ b/lib/kunit/executor.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +#include <linux/reboot.h>
>  #include <kunit/test.h>
>  
>  /*
> @@ -11,6 +12,23 @@ extern struct kunit_suite * const * const __kunit_suites_end[];
>  
>  #if IS_BUILTIN(CONFIG_KUNIT)
>  
> +static char *kunit_shutdown;
> +core_param(kunit_shutdown, kunit_shutdown, charp, 0644);
> +
> +static void kunit_handle_shutdown(void)
> +{
> +	if (!kunit_shutdown)
> +		return;
> +
> +	if (!strcmp(kunit_shutdown, "poweroff"))
> +		kernel_power_off();
> +	else if (!strcmp(kunit_shutdown, "halt"))
> +		kernel_halt();
> +	else if (!strcmp(kunit_shutdown, "reboot"))
> +		kernel_restart(NULL);
> +
> +}

If you have patches that do something just before the initrd, and then
you add more patches to shut down immediately after an initrd, people
may ask you to just use an initrd instead of filling the kernel with
these changes...

I mean, I get it, but it's not hard to make an initrd that poke a sysctl
to start the tests...

In fact, you don't even need a initrd to poke sysctls these days.

-- 
Kees Cook
