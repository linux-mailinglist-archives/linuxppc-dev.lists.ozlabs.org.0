Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2379918E74A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 08:04:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lT5w3hqrzDrPK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 18:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lT4H5FW4zDqT4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 18:03:08 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id y71so11355576oia.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 00:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQw0Ao+0F3OML4xqBcdXiKQyDO5icQmYlSZlUWUMKLw=;
 b=giSopHNBRVqs5t9qcnbzcVSWvjqQ8wcRYfiFIYSIn010USSXxoxpg7ofU12N0FeNnA
 P4Ee1eG8I0HttlzyrfQE48kkM5FJ74w8tdAjPd77Dw3cmvlDg6iahqcryy4otHlKI3fF
 JqkFGigL4KBFBGjmghtcQU4fB5Kj1XK7lUqnALrKXrykoabG01gtyOr6lhIz7/Q2Wjri
 z8Yxxjncf7wc0g2bKjxSBaAXIpl9+XQVsOcepE2hytlTZQJRyqFx+nVsK+tteGTDtWZK
 EZhyyhrmXWQEdz+GGc+U8eRE12zsTNWcQEw+7i3HLsK/TtKmp0wcg8ITkWavDyxRqJ3j
 cu+w==
X-Gm-Message-State: ANhLgQ2YzX+j39lT5PRFiNmB7hW27hZ+HV39t6ugTKVmsXM8d0/5le7M
 voUwkWUzg2LzCcZb9no1Nluk6UbOawOVqEE75FA=
X-Google-Smtp-Source: ADFU+vsARItYcXJ5VcYXYVtk3ULfsYXI5mBXm7XJN8Fh/cbR3R0TaFoBwSVgaJcdx5OhfFh8ldzXhaOstgHnOBA0QRI=
X-Received: by 2002:aca:3857:: with SMTP id f84mr12703942oia.110.1584860585800; 
 Sun, 22 Mar 2020 00:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200321112544.878032781@linutronix.de>
 <20200321113241.246190285@linutronix.de>
In-Reply-To: <20200321113241.246190285@linutronix.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 22 Mar 2020 08:02:54 +0100
Message-ID: <CAJZ5v0iV_8Q7cZARXY033Ff1Z8LvQ58kGy1XARm9CTZMWoaCTQ@mail.gmail.com>
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
Cc: "open list:ULTRA-WIDEBAND \(UWB\) SUBSYSTEM:" <linux-usb@vger.kernel.org>,
 linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Greentime Hu <green.hu@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Nick Hu <nickhu@andestech.com>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "open list:NETWORKING DRIVERS \(WIRELESS\)" <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dbueso@suse.de>,
 netdev <netdev@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 21, 2020 at 12:35 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Peter Zijlstra <peterz@infradead.org>
>
> In order to avoid future header hell, remove the inclusion of
> proc_fs.h from acpi_bus.h. All it needs is a forward declaration of a
> struct.
>
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

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

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
