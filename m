Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E41900ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 23:10:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mT8c2MGGzDqMh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 09:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mg.codeaurora.org (client-ip=104.130.122.26;
 helo=mail26.static.mailgun.info;
 envelope-from=bounce+ee6c0f.be9e4a-linuxppc-dev=lists.ozlabs.org@mg.codeaurora.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org
 header.a=rsa-sha256 header.s=smtp header.b=NeHpgcXQ; 
 dkim-atps=neutral
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 48mSdW71j4zDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 08:46:55 +1100 (AEDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585000019; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Reply-To: Sender;
 bh=ZNpFv8n1vyNtNLXdZYwI5uo1FnppFNp10NWp9MPwYDo=;
 b=NeHpgcXQfwbH86gyHu9zmd4GlGP4Nzsikg9H7xzQmLZ+lMM+YhGciPy5DMaPQK5KYNjU90ru
 5hn/bheXlSYL1FLLJKKmp8bK7aq4sEYbOZWhO2fhExfj5ALtI/V8oD51mjtPowMgbhcS0YVW
 rNdO8unC4h4PE/U1sSlEF9MVOhE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e792e32.7fd0cabb5260-smtp-out-n05;
 Mon, 23 Mar 2020 21:46:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2B1A3C4478F; Mon, 23 Mar 2020 21:46:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net
 [104.54.226.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bcain)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0630CC433CB;
 Mon, 23 Mar 2020 21:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0630CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=bcain@codeaurora.org
From: "Brian Cain" <bcain@codeaurora.org>
To: "'Thomas Gleixner'" <tglx@linutronix.de>,
 "'LKML'" <linux-kernel@vger.kernel.org>
References: <20200321112544.878032781@linutronix.de>
 <20200321113241.531525286@linutronix.de>
In-Reply-To: <20200321113241.531525286@linutronix.de>
Subject: RE: [patch V3 08/20] hexagon: Remove mm.h from asm/uaccess.h
Date: Mon, 23 Mar 2020 16:46:17 -0500
Message-ID: <0cc301d6015c$7e756490$7b602db0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQHqwg4Cse+u7XkWseF638AEhQYwggGRIliZqCCrVyA=
X-Mailman-Approved-At: Tue, 24 Mar 2020 09:08:29 +1100
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
Reply-To: bcain@codeaurora.org
Cc: 'Randy Dunlap' <rdunlap@infradead.org>, linux-ia64@vger.kernel.org,
 'Peter Zijlstra' <peterz@infradead.org>, linux-pci@vger.kernel.org,
 'Sebastian Siewior' <bigeasy@linutronix.de>,
 platform-driver-x86@vger.kernel.org, 'Guo Ren' <guoren@kernel.org>,
 'Joel Fernandes' <joel@joelfernandes.org>,
 'Vincent Chen' <deanbo422@gmail.com>, 'Ingo Molnar' <mingo@kernel.org>,
 'Jonathan Corbet' <corbet@lwn.net>, 'Davidlohr Bueso' <dave@stgolabs.net>,
 'kbuild test robot' <lkp@intel.com>, linux-acpi@vger.kernel.org,
 "'Paul E . McKenney'" <paulmck@kernel.org>, linux-hexagon@vger.kernel.org,
 "'Rafael J. Wysocki'" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 'Darren Hart' <dvhart@infradead.org>, 'Zhang Rui' <rui.zhang@intel.com>,
 'Len Brown' <lenb@kernel.org>, 'Fenghua Yu' <fenghua.yu@intel.com>,
 'Arnd Bergmann' <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 'Greentime Hu' <green.hu@gmail.com>,
 'Bjorn Helgaas' <bhelgaas@google.com>,
 'Kurt Schwemmer' <kurt.schwemmer@microsemi.com>,
 'Kalle Valo' <kvalo@codeaurora.org>, 'Felipe Balbi' <balbi@kernel.org>,
 'Michal Simek' <monstr@monstr.eu>, 'Tony Luck' <tony.luck@intel.com>,
 'Nick Hu' <nickhu@andestech.com>, 'Geoff Levand' <geoff@infradead.org>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, 'Oleg Nesterov' <oleg@redhat.com>,
 'Davidlohr Bueso' <dbueso@suse.de>, netdev@vger.kernel.org,
 'Logan Gunthorpe' <logang@deltatee.com>,
 "'David S. Miller'" <davem@davemloft.net>,
 'Andy Shevchenko' <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
...
> Subject: [patch V3 08/20] hexagon: Remove mm.h from asm/uaccess.h
> 
> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> The defconfig compiles without linux/mm.h. With mm.h included the include
> chain leands to:
> |   CC      kernel/locking/percpu-rwsem.o
> | In file included from include/linux/huge_mm.h:8,
> |                  from include/linux/mm.h:567,
> |                  from arch/hexagon/include/asm/uaccess.h:,
> |                  from include/linux/uaccess.h:11,
> |                  from include/linux/sched/task.h:11,
> |                  from include/linux/sched/signal.h:9,
> |                  from include/linux/rcuwait.h:6,
> |                  from include/linux/percpu-rwsem.h:8,
> |                  from kernel/locking/percpu-rwsem.c:6:
> | include/linux/fs.h:1422:29: error: array type has incomplete element type
> 'struct percpu_rw_semaphore'
> |  1422 |  struct percpu_rw_semaphore rw_sem[SB_FREEZE_LEVELS];
> 
> once rcuwait.h includes linux/sched/signal.h.
> 
> Remove the linux/mm.h include.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Brian Cain <bcain@codeaurora.org>
> Cc: linux-hexagon@vger.kernel.org
> ---
> V3: New patch
> ---
>  arch/hexagon/include/asm/uaccess.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/hexagon/include/asm/uaccess.h
> b/arch/hexagon/include/asm/uaccess.h
> index 00cb38faad0c4..c1019a736ff13 100644
> --- a/arch/hexagon/include/asm/uaccess.h
> +++ b/arch/hexagon/include/asm/uaccess.h
> @@ -10,7 +10,6 @@
>  /*
>   * User space memory access functions
>   */
> -#include <linux/mm.h>
>  #include <asm/sections.h>
> 
>  /*
> --
> 2.26.0.rc2
> 

Acked-by: Brian Cain <bcain@codeaurora.org>
