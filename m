Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F53518E14D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:41:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l0cX3wC3zDrgw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:41:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=guZnHeGo; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48l0FC2VGBzDrSK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 23:24:14 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id b72so4754255pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 05:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ao4Jy8e8i2H3r6C7mhPUev+j75PjWe4TRVOreHP2VzM=;
 b=guZnHeGo0HvHKP2uIKtZiCtNOUIkrUT7OLzB66Ehtw0EiRz0K0c6LtX4CWuNZp6QIL
 YrUqqmUsqOQIHILQRs1SrnxRO54uRVwILm5bNdlpUGX6dcExdOPMfmuKHkPcvMtu6WbT
 /P7MLfISznzr7ogM6J98U4cpx8/lCga6dEpI2eG7/1joslz9HVe0MCBWrJjlYlA5S7Mc
 eufctIYPsclmo3tJk89MVDURTNM43DP4w2vS8LbbG17swocgZVGzaGEA17iUCtLk8pQy
 WDK9dsn4zUgoCJeFNLPI823x3rR/fKz2B+dGyCO9zePvxDJWWT98LbXkAlCqWcnM1iF7
 hq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ao4Jy8e8i2H3r6C7mhPUev+j75PjWe4TRVOreHP2VzM=;
 b=Zf127xze9yTIaTWyxZ/S5TnomtPQpg26mKg+kqtQQDwZ3dZ5Nt/RBc5au8v1CdC7Sh
 Hrf78J1vFE2nGPX/LIOWBeyTk4+zPiU1iWtteCTJ6Lx7jTxF0mLlLq0nqs2zIei1xQ7D
 SLalguXy8V/8ZIvV0djZ42WCGemGsKLM9esB09f0WmkRar7joJujcGigP6t60f/YA0G3
 nzaGxHKQI8l2dVRtjiyZY1HzdFuJNfaHCJ8Pq0EOUzA9nNdEMDJr/ZIBHX1A0LeSyRzF
 qjM8+INnXjPb1Pkg03ZEbYy9XJJfc6b2uPt+JJ2B6dFQaqIBuI9oC9bkRMQ75MXEcxZ2
 L6Zw==
X-Gm-Message-State: ANhLgQ0cguxeYtuYj4od6Oh9uhUfrQUHSIWq+k6EtLRxUvADsUVsLR5t
 vTpiscdyI91srm/RfO89uU8hFg49oR3YHApIkX0=
X-Google-Smtp-Source: ADFU+vt9Uo865ldMhbCuXqa1losEi96vNHQ702LMl19aMUCd3u8qFTNaK8m+H4VKt7G9g6ODyA9ZVzAxynAs7rQFJOc=
X-Received: by 2002:a05:6a00:2b4:: with SMTP id
 q20mr3102817pfs.36.1584793451157; 
 Sat, 21 Mar 2020 05:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200321112544.878032781@linutronix.de>
 <20200321113241.246190285@linutronix.de>
In-Reply-To: <20200321113241.246190285@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 Mar 2020 14:23:58 +0200
Message-ID: <CAHp75VdpXxg4NSSg-jxKc51emJxhJQgLpG1Rv-xq7ouWz+xBuA@mail.gmail.com>
Subject: Re: [patch V3 05/20] acpi: Remove header dependency
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: USB <linux-usb@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Sebastian Siewior <bigeasy@linutronix.de>, Oleg Nesterov <oleg@redhat.com>,
 Guo Ren <guoren@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, kbuild test robot <lkp@intel.com>,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Greentime Hu <green.hu@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Nick Hu <nickhu@andestech.com>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dbueso@suse.de>,
 netdev <netdev@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 21, 2020 at 1:34 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Peter Zijlstra <peterz@infradead.org>
>
> In order to avoid future header hell, remove the inclusion of
> proc_fs.h from acpi_bus.h. All it needs is a forward declaration of a
> struct.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com> # for PDx86

> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: linux-pm@vger.kernel.org
> Cc: Len Brown <lenb@kernel.org>
> Cc: linux-acpi@vger.kernel.org
> ---
>  drivers/platform/x86/dell-smo8800.c                      |    1 +
>  drivers/platform/x86/wmi.c                               |    1 +
>  drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c |    1 +
>  include/acpi/acpi_bus.h                                  |    2 +-
>  4 files changed, 4 insertions(+), 1 deletion(-)
>
> --- a/drivers/platform/x86/dell-smo8800.c
> +++ b/drivers/platform/x86/dell-smo8800.c
> @@ -16,6 +16,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/miscdevice.h>
>  #include <linux/uaccess.h>
> +#include <linux/fs.h>
>
>  struct smo8800_device {
>         u32 irq;                     /* acpi device irq */
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -29,6 +29,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/uuid.h>
>  #include <linux/wmi.h>
> +#include <linux/fs.h>
>  #include <uapi/linux/wmi.h>
>
>  ACPI_MODULE_NAME("wmi");
> --- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> +++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> @@ -19,6 +19,7 @@
>  #include <linux/acpi.h>
>  #include <linux/uaccess.h>
>  #include <linux/miscdevice.h>
> +#include <linux/fs.h>
>  #include "acpi_thermal_rel.h"
>
>  static acpi_handle acpi_thermal_rel_handle;
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -80,7 +80,7 @@ bool acpi_dev_present(const char *hid, c
>
>  #ifdef CONFIG_ACPI
>
> -#include <linux/proc_fs.h>
> +struct proc_dir_entry;
>
>  #define ACPI_BUS_FILE_ROOT     "acpi"
>  extern struct proc_dir_entry *acpi_root_dir;
>
>


-- 
With Best Regards,
Andy Shevchenko
