Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4155718DFCD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 12:28:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kz0X4P5DzF09S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 22:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=lDApgz56; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kywf6xKJzDqfW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 22:24:50 +1100 (AEDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D970208D5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584789887;
 bh=CC3xOqOiOw/KfVSwNgtZdj47dfsfwOj+jNh3hAafy6c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lDApgz56lPs8ToQFcVEV8+EAX/cT7ThAz8oOMnFXG8qYrmNZ5gW9RuxrD3cdYMP+d
 EpFlQOtu+zsTlEW62aFEcbsjVO524POgi7mDnhK9rdBsngAYtCCQspKslzDLNakkr5
 d/tt/FiudZbBtX1px0ShZU4kWAH25eldMhL1gJJY=
Received: by mail-lj1-f180.google.com with SMTP id u12so9318704ljo.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 04:24:47 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2AB7c873aBXGzDSLP6Ms/ZDd7e9vhHcgWgyIGaSfUnyjmFXvQP
 eivP8MCsvqXJtlFY2J7BYeXfuOXgFu5jzUN2J+k=
X-Google-Smtp-Source: ADFU+vs0LzUeDMqhkyCRijtr/5jU1zll2VnT5GvJNspUkA5NWoImJ8IywkeIYEIKk4vGhOkK87FxiOUyuzZGlcUMAFM=
X-Received: by 2002:a2e:3818:: with SMTP id f24mr8239133lja.53.1584789885358; 
 Sat, 21 Mar 2020 04:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204408.010461877@linutronix.de>
 <20200320094856.3453859-1-bigeasy@linutronix.de>
 <20200320094856.3453859-3-bigeasy@linutronix.de>
In-Reply-To: <20200320094856.3453859-3-bigeasy@linutronix.de>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 21 Mar 2020 19:24:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQDvmSdJB3R0By0Q6d9ganVBV1FBm3urL8Jf1fyiEi+1A@mail.gmail.com>
Message-ID: <CAJF2gTQDvmSdJB3R0By0Q6d9ganVBV1FBm3urL8Jf1fyiEi+1A@mail.gmail.com>
Subject: Re: [PATCH 2/5] csky: Remove mm.h from asm/uaccess.h
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 joel@joelfernandes.org, Will Deacon <will@kernel.org>, mingo@kernel.org,
 dave@stgolabs.net, Arnd Bergmann <arnd@arndb.de>, linux-csky@vger.kernel.org,
 torvalds@linux-foundation.org, paulmck@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 bhelgaas@google.com, kurt.schwemmer@microsemi.com, kvalo@codeaurora.org,
 kbuild test robot <lkp@intel.com>, balbi@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, oleg@redhat.com,
 Thomas Gleixner <tglx@linutronix.de>, netdev@vger.kernel.org,
 logang@deltatee.com, David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tested and Acked by me.

Queued for next pull request, thx

On Fri, Mar 20, 2020 at 5:49 PM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> The defconfig compiles without linux/mm.h. With mm.h included the
> include chain leands to:
> |   CC      kernel/locking/percpu-rwsem.o
> | In file included from include/linux/huge_mm.h:8,
> |                  from include/linux/mm.h:567,
> |                  from arch/csky/include/asm/uaccess.h:,
> |                  from include/linux/uaccess.h:11,
> |                  from include/linux/sched/task.h:11,
> |                  from include/linux/sched/signal.h:9,
> |                  from include/linux/rcuwait.h:6,
> |                  from include/linux/percpu-rwsem.h:8,
> |                  from kernel/locking/percpu-rwsem.c:6:
> | include/linux/fs.h:1422:29: error: array type has incomplete element type 'struct percpu_rw_semaphore'
> |  1422 |  struct percpu_rw_semaphore rw_sem[SB_FREEZE_LEVELS];
>
> once rcuwait.h includes linux/sched/signal.h.
>
> Remove the linux/mm.h include.
>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: linux-csky@vger.kernel.org
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/csky/include/asm/uaccess.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/csky/include/asm/uaccess.h b/arch/csky/include/asm/uaccess.h
> index eaa1c3403a424..abefa125b93cf 100644
> --- a/arch/csky/include/asm/uaccess.h
> +++ b/arch/csky/include/asm/uaccess.h
> @@ -11,7 +11,6 @@
>  #include <linux/errno.h>
>  #include <linux/types.h>
>  #include <linux/sched.h>
> -#include <linux/mm.h>
>  #include <linux/string.h>
>  #include <linux/version.h>
>  #include <asm/segment.h>
> --
> 2.26.0.rc2
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
