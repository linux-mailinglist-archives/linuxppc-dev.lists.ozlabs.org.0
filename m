Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 926715FAA68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 04:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmfBS27yLz3dwJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 13:00:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g1uUcEjc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g1uUcEjc;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmf9V4q0mz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 12:59:42 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so11817977pjl.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UI9oUlq/7MX8Orhcp1d2QhTyUNxqk6dodsJ0QO3Jvvg=;
        b=g1uUcEjcQDSXgYIJuqtn1wBE2AA3wsfLbUK9mlC/hxhfWrvW9Vw3TP5HkAgAfhFcoR
         i4a8e0xmqY8xjr0VHW79NMDuY08wmkjUV1pimzgjZLN5EOl4F2kOZmqy284tmZ7dd8Yy
         ExgAX1OAl3zO/ZhCNms4vT63bq/YmC4zLHr46qLIxw2ZApqIXCjN5YYOIM8OF6G4IQit
         xvDRVEMuF9g7XVFYLKOCsi97WdRzjgDEIURx8rbjv6DlvuheITbWj5qcubC99yU4iV4A
         u5+cwpgnAiRi01WWXXqdKrQy2tzr/j6349HHLdNiPUSoENfSpURfncX/tA9Gt/iuUOHz
         deOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UI9oUlq/7MX8Orhcp1d2QhTyUNxqk6dodsJ0QO3Jvvg=;
        b=Pgea2D6+SDg2byVWRStvBhZz73a6aWhT2CXS7cAr06F8F+tmYZeX5JO+nlNKPqnSRV
         lT9gPAmBts3s0vwlkbHlz0PX26qU5Vi2sCrOXHC7XFtDTzzz4GYd6JLVWiqVy00s1dyf
         h6E6cohxVovvFri+nI7wZeOJSa2p1KEVYYo7CxbjDSl9Z8stBiiHzDzRbP+Cxmq8js33
         BWJl0qy/dweei4paQo+NaXZJhttlXSg4wg0rI4tKv61DdGmSlDFNKFAW4buYT+cHZecw
         KdvVqMYOw589fLoTLct1e/XSPN7eFkG1ZzpOE2fBGfdU02nxFM2mpHe6o3ENNj/XaTvK
         32HQ==
X-Gm-Message-State: ACrzQf20ACGqj97P3pgZM0QD/sFjRAK8ilcs1SSo/fJEh5fLccXTiY6/
	IFwCbu9iIeli4C1a/F1rnRfuE9Mb83MfJD3mL1w=
X-Google-Smtp-Source: AMsMyM4SyHgyryevevWrmsU1lbvYisuxmfLlIDFOdCamuAKwHxR8OOv8N/GLHrEMhgOlOKgiLgCEN8QZF/8mESF7bP0=
X-Received: by 2002:a17:902:e747:b0:17f:86f9:3712 with SMTP id
 p7-20020a170902e74700b0017f86f93712mr22533939plf.128.1665453579426; Mon, 10
 Oct 2022 18:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221010023315.98396-1-zhouzhouyi@gmail.com> <87bkqjorez.fsf@mpe.ellerman.id.au>
In-Reply-To: <87bkqjorez.fsf@mpe.ellerman.id.au>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 11 Oct 2022 09:59:28 +0800
Message-ID: <CAABZP2wFY19MTsDm1SH86Ms_zRRgC77oceMkJKPqawxyExJjqQ@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC] powerpc: fix HOTPLUG error in rcutorture
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: atrajeev@linux.vnet.ibm.com, paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lance@osuosl.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Michael for reviewing my patch

On Mon, Oct 10, 2022 at 7:21 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> > I think we should avoid torture offline the cpu who do tick timer
> > when nohz full is running.
>
> Can you tell us what the bug you're fixing is?
>
> Did you see a crash/oops/hang etc? Or are you just proposing this as
> something that would be a good idea?
Sorry for the trouble and inconvenience that I bring to the community.
I haven't made myself clear in my patch.
The ins and outs are as follows:
1) cd linux-next
2) ./tools/testing/selftests/rcutorture/bin/torture.sh
after 19 hours ;-)
3) tail  ./tools/testing/selftests/rcutorture/res/2022.09.30-01.06.22-torture/results-scftorture/NOPREEMPT/console.log

[  121.449268][   T57] scftorture:  scf_invoked_count VER: 2415215
resched: 697463 single: 619512/619760 single_ofl: 255751/256554
single_rpc: 620692 single_rpc_ofl: 0 many: 155476/154658 all:
77282/76988 onoff: 3/3:5/6 18,25:9,28 63:93 (HZ=100) ste: 0 stnmie: 0
stnmoe: 0 staf: 0
[  121.454485][   T57] scftorture: --- End of test: LOCK_HOTPLUG:
verbose=1 holdoff=10 longwait=0 nthreads=4 onoff_holdoff=30
onoff_interval=1000 shutdown_secs=1 stat_interval=15 stutter=5
use_cpus_read_lock=0, weight_resched=-1, weight_single=-1,
weight_single_rpc=-1, weight_single_wait=-1, weight_many=-1,
weight_many_wait=-1, weight_all=-1, weight_all_wait=-1
[  121.469305][   T57] reboot: Power down

I see "End of test: LOCK_HOTPLUG", which means the function
torture_offline in kernel torture.c failed to bring down the cpu.
4) Then I chase the reason down to tick_nohz_cpu_down:
if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
      return -EBUSY;
5) I create above patch
>
> > Tested on PPC VM of Open Source Lab of Oregon State University.
> > The test results show that after the fix, the success rate of
> > rcutorture is improved.
> > After:
> > Successes: 40 Failures: 9
> > Before:
> > Successes: 38 Failures: 11
> >
> > I examined the console.log and Make.out files one by one, no new
> > compile error or test error is introduced by above fix.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> > Dear PPC developers
> >
> > I found this bug when trying to do rcutorture tests in ppc VM of
> > Open Source Lab of Oregon State University:
> >
> > ubuntu@ubuntu:~/linux-next/tools/testing/selftests/rcutorture/res/2022.09.30-01.06.22-torture$ find . -name "console.log.diags"|xargs grep HOTPLUG
> > ./results-scftorture/NOPREEMPT/console.log.diags:WARNING: HOTPLUG FAILURES NOPREEMPT
> > ./results-rcutorture/TASKS03/console.log.diags:WARNING: HOTPLUG FAILURES TASKS03
> > ./results-rcutorture/TREE04/console.log.diags:WARNING: HOTPLUG FAILURES TREE04
> > ./results-scftorture-kasan/NOPREEMPT/console.log.diags:WARNING: HOTPLUG FAILURES NOPREEMPT
> > ./results-rcutorture-kasan/TASKS03/console.log.diags:WARNING: HOTPLUG FAILURES TASKS03
> > ./results-rcutorture-kasan/TREE04/console.log.diags:WARNING: HOTPLUG FAILURES TREE04
> >
> > I tried to fix this bug.
> >
> > Thanks for your patience and guidance ;-)
> >
> > Thanks
> > Zhouyi
> > --
> >  arch/powerpc/kernel/sysfs.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> > index ef9a61718940..be9c0e45337e 100644
> > --- a/arch/powerpc/kernel/sysfs.c
> > +++ b/arch/powerpc/kernel/sysfs.c
> > @@ -4,6 +4,7 @@
> >  #include <linux/smp.h>
> >  #include <linux/percpu.h>
> >  #include <linux/init.h>
> > +#include <linux/tick.h>
> >  #include <linux/sched.h>
> >  #include <linux/export.h>
> >  #include <linux/nodemask.h>
> > @@ -21,6 +22,7 @@
> >  #include <asm/firmware.h>
> >  #include <asm/idle.h>
> >  #include <asm/svm.h>
> > +#include "../../../kernel/time/tick-internal.h"
>
> Needing to include this internal header is a sign that we are using the
> wrong API or otherwise using time keeping internals we shouldn't be.
Yes, when I do this, I guess there is something wrong in my patch.
>
> >  #include "cacheinfo.h"
> >  #include "setup.h"
> > @@ -1151,7 +1153,11 @@ static int __init topology_init(void)
> >                * CPU.  For instance, the boot cpu might never be valid
> >                * for hotplugging.
> >                */
> > -             if (smp_ops && smp_ops->cpu_offline_self)
> > +             if (smp_ops && smp_ops->cpu_offline_self
> > +#ifdef CONFIG_NO_HZ_FULL
> > +                 && !(tick_nohz_full_running && tick_do_timer_cpu == cpu)
> > +#endif
> > +                 )
>
> I can't see any other arches doing anything like this. I don't think
> it's the arches responsibility.
Agree!

X86 seems to disable CPU0's hotplug by default, while
tick_do_timer_cpu has a default value 0.

42 #ifdef CONFIG_BOOTPARAM_HOTPLUG_CPU0
43 static int cpu0_hotpluggable = 1;
44 #else
45 static int cpu0_hotpluggable;
46 static int __init enable_cpu0_hotplug(char *str)
47 {
48         cpu0_hotpluggable = 1;
49         return 1;
50 }
51
52 __setup("cpu0_hotplug", enable_cpu0_hotplug);
53 #endif

I need more time to make clear the relationship of X86's
cpu0_hotpluggable and tick_do_timer_cpu, but
I also intend to think it's time keeping the mechanism's responsibility.


>
> If the time keeping core needs a CPU to stay online to run the timer
> then it needs to organise that itself IMHO :)

Um, I am going to submit a patch to time keeping community sometime
next month ;-)

Thanks again
Cheers
Zhouyi
>
> cheers
>
> >                       c->hotpluggable = 1;
> >  #endif
> >
> > --
> > 2.25.1
