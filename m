Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE518C73C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:52:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCb33fK6zDrGC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:51:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stgolabs.net
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kCHF1T4qzDrfm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:38:15 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3EF15AC42;
 Fri, 20 Mar 2020 05:38:08 +0000 (UTC)
Date: Thu, 19 Mar 2020 22:36:57 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 06/15] rcuwait: Add @state argument to
 rcuwait_wait_event()
Message-ID: <20200320053657.ggvcqsjtdotmrl7p@linux-p48b>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.010461877@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200318204408.010461877@linutronix.de>
User-Agent: NeoMutt/20180716
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
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oleg Nesterov <oleg@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Logan Gunthorpe <logang@deltatee.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 Mar 2020, Thomas Gleixner wrote:

>--- a/include/linux/rcuwait.h
>+++ b/include/linux/rcuwait.h
>@@ -3,6 +3,7 @@
> #define _LINUX_RCUWAIT_H_
>
> #include <linux/rcupdate.h>
>+#include <linux/sched/signal.h>

So this is causing build to fail for me:

  CC      arch/x86/boot/compressed/cmdline.o
arch/x86/boot/compressed/cmdline.c:5:20: error: conflicting types for =E2=
=80=98set_fs=E2=80=99
 static inline void set_fs(unsigned long seg)
                    ^~~~~~
In file included from ./include/linux/uaccess.h:11:0,
                 from ./include/linux/sched/task.h:11,
                 from ./include/linux/sched/signal.h:9,
                 from ./include/linux/rcuwait.h:6,
                 from ./include/linux/percpu-rwsem.h:8,
                 from ./include/linux/fs.h:34,
                 from ./include/linux/proc_fs.h:9,
                 from ./include/acpi/acpi_bus.h:83,
                 from ./include/linux/acpi.h:32,
                 from arch/x86/boot/compressed/misc.h:28,
                 from arch/x86/boot/compressed/cmdline.c:2:
=2E/arch/x86/include/asm/uaccess.h:29:20: note: previous definition of =E2=
=80=98set_fs=E2=80=99 was here
 static inline void set_fs(mm_segment_t fs)
                    ^~~~~~
make[2]: *** [scripts/Makefile.build:268: arch/x86/boot/compressed/cmdline.=
o] Error 1
make[1]: *** [arch/x86/boot/Makefile:113: arch/x86/boot/compressed/vmlinux]=
 Error 2
make: *** [arch/x86/Makefile:285: bzImage] Error 2

Right now I'm not sure what the proper fix should be.

Thanks,
Davidlohr
