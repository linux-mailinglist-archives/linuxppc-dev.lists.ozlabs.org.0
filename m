Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7BE3556CC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 16:40:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF9Cy52CWz3brr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 00:39:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SlT7S0jf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SlT7S0jf; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF9CY6Nj9z2y08
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 00:39:37 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B468961041;
 Tue,  6 Apr 2021 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617719974;
 bh=G2BOVus52Iqv5BWziu8fp8dbl+kVdMy8pIchFSY+N7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SlT7S0jfOQB0ipW94M+9K780g98fCxdRJ2QJSXci+Rly0qaDQCHFeXHTOsI463Xi7
 S70I+/1OXQBcTfcIkIpl67B5zXSuZCsFVQzUBPU8aiRkhXqG4+Gr/kX784jry6UKjU
 t/VEsOeLGhmj1jkbfR4iAG4mFD+vamcJPKxJMUcvNbOJ2RhmbWIpBgjpUvC0BANEGE
 vr4AodXPx2i9E03UI+pPMK1LRyEpkXwf1hJUOL/xYCdBgDtehTwHpHwy3IOxolwkOe
 Eefs8HR/7P44p9cGBhR5ZazQeydf2U0negBr9o85K3dg0zDsONcgGw+lFDOTompGZC
 fzX5/aFjCjwKQ==
Date: Tue, 6 Apr 2021 17:39:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <YGxykw1Il6NvKTSe@kernel.org>
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
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
Cc: Corey Minyard <cminyard@mvista.com>, linux-hyperv@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Iurii Zaikin <yzaikin@google.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Josh Triplett <josh@joshtriplett.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, openipmi-developer@lists.sourceforge.net,
 Michael Kelley <mikelley@microsoft.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Eric Biederman <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 06, 2021 at 04:31:58PM +0300, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> At the same time convert users in header and lib folder to use new header.
> Though for time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  arch/powerpc/kernel/setup-common.c   |  1 +
>  arch/x86/include/asm/desc.h          |  1 +
>  arch/x86/kernel/cpu/mshyperv.c       |  1 +
>  arch/x86/kernel/setup.c              |  1 +
>  drivers/char/ipmi/ipmi_msghandler.c  |  1 +
>  drivers/remoteproc/remoteproc_core.c |  1 +
>  include/asm-generic/bug.h            |  3 +-
>  include/linux/kernel.h               | 84 +-----------------------
>  include/linux/panic.h                | 98 ++++++++++++++++++++++++++++
>  include/linux/panic_notifier.h       | 12 ++++
>  kernel/hung_task.c                   |  1 +
>  kernel/kexec_core.c                  |  1 +
>  kernel/panic.c                       |  1 +
>  kernel/rcu/tree.c                    |  2 +
>  kernel/sysctl.c                      |  1 +
>  kernel/trace/trace.c                 |  1 +
>  16 files changed, 126 insertions(+), 84 deletions(-)
>  create mode 100644 include/linux/panic.h
>  create mode 100644 include/linux/panic_notifier.h
> 
> diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
> index 476082a83d1c..ceb12683b6d1 100644
> --- a/arch/x86/include/asm/desc.h
> +++ b/arch/x86/include/asm/desc.h
> @@ -9,6 +9,7 @@
>  #include <asm/irq_vectors.h>
>  #include <asm/cpu_entry_area.h>
>  
> +#include <linux/debug_locks.h>

This seems unrelated, but I might be missing something.

>  #include <linux/smp.h>
>  #include <linux/percpu.h>
>  

-- 
Sincerely yours,
Mike.
