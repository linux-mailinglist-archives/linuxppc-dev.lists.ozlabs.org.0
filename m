Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D841EEC75
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 22:53:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dJ0F36NZzDqtG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 06:53:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dHyB5G8DzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 06:51:44 +1000 (AEST)
IronPort-SDR: 1aZzdj9NlFfaJts/qRZl5tpixg4L8rwpf5QkgrcsoC2jCoLkDoTKm/SCyyBAvivucpgZWplcbi
 u09qcTLl5TEQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 13:51:41 -0700
IronPort-SDR: zs+MMvxWw13sjlZ9Bw72P4E7fjGK2DTGpjrAZCIfDuEufJrPSBND+RoMuQFrepsdDPuoy+96Bf
 +AJaXGZ7wG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; d="scan'208";a="348215104"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga001.jf.intel.com with ESMTP; 04 Jun 2020 13:51:40 -0700
Date: Thu, 4 Jun 2020 13:51:40 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604205140.GN1505637@iweiny-DESK2.sc.intel.com>
References: <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
 <20200604094133.GC202650@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604094133.GC202650@kernel.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 04, 2020 at 12:41:33PM +0300, Mike Rapoport wrote:
> On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> > 
> > sparc32 smp images in next-20200603 still crash for me with a spinlock
> > recursion. s390 images hang early in boot. Several others (alpha, arm64,
> > various ppc) don't even compile. I can run some more bisects over time,
> > but this is becoming a full-time job :-(.
> 
> I've been able to bisect s390 hang to commit b614345f52bc ("x86/entry:
> Clarify irq_{enter,exit}_rcu()").
> 
> After this commit, lockdep_hardirq_exit() is called twice on s390 (and
> others) - one time in irq_exit_rcu() and another one in irq_exit():
> 
> /**
>  * irq_exit_rcu() - Exit an interrupt context without updating RCU
>  *
>  * Also processes softirqs if needed and possible.
>  */
> void irq_exit_rcu(void)
> {
> 	__irq_exit_rcu();
> 	 /* must be last! */
> 	lockdep_hardirq_exit();
> }
> 
> /**
>  * irq_exit - Exit an interrupt context, update RCU and lockdep
>  *
>  * Also processes softirqs if needed and possible.
>  */
> void irq_exit(void)
> {
> 	irq_exit_rcu();
> 	rcu_irq_exit();
> 	 /* must be last! */
> 	lockdep_hardirq_exit();
> }
> 
> Removing the call in irq_exit() make s390 boot again, and judgung by the
> x86 entry code, the comment /* must be last! */ is stale...

FWIW I got s390 to compile and this patch fixes s390 booting for me as well.

13:05:25 > /home/iweiny/dev/linux-build-test/rootfs/s390/run-qemu-s390.sh 
Build reference: next-20200603-4-g840714292d8c

Building s390:defconfig:initrd ... running ........... passed
Building s390:defconfig:virtio-blk-ccw:rootfs ... running ........... passed
Building s390:defconfig:scsi[virtio-ccw]:rootfs ... running ..............  passed
Building s390:defconfig:virtio-pci:rootfs ... running ........... passed
Building s390:defconfig:scsi[virtio-pci]:rootfs ... running ........... passed

Ira

> 
> @Peter, @Thomas, can you comment please?
> 
> From e51d50ee6f4d1f446decf91c2c67230da14ff82c Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Thu, 4 Jun 2020 12:37:03 +0300
> Subject: [PATCH] softirq: don't call lockdep_hardirq_exit() twice
> 
> After commit b614345f52bc ("x86/entry: Clarify irq_{enter,exit}_rcu()")
> lockdep_hardirq_exit() is called twice on every architecture that uses
> irq_exit(): one time in irq_exit_rcu() and another one in irq_exit().
> 
> Remove the extra call in irq_exit().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  kernel/softirq.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index a3eb6eba8c41..7523f4ce4c1d 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -427,7 +427,6 @@ static inline void __irq_exit_rcu(void)
>  void irq_exit_rcu(void)
>  {
>  	__irq_exit_rcu();
> -	 /* must be last! */
>  	lockdep_hardirq_exit();
>  }
>  
> @@ -440,8 +439,6 @@ void irq_exit(void)
>  {
>  	irq_exit_rcu();
>  	rcu_irq_exit();
> -	 /* must be last! */
> -	lockdep_hardirq_exit();
>  }
>  
>  /*
> -- 
> 2.26.2
> 
> 
> 
> > Guenter
> 
> -- 
> Sincerely yours,
> Mike.
