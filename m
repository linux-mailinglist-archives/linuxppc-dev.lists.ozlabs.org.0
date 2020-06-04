Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE3E1EDD2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 08:24:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cwhv3q5mzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 16:23:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cwgD1DWVzDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 16:22:30 +1000 (AEST)
IronPort-SDR: 7Dauh+PUoB0NTasA2XxCyYk0p9VM7WwZvtMokUnIUol0BqAPNaMyvRefzj3mqNCL6V1Hlf7wrd
 aflLvGrq+kuQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 23:22:27 -0700
IronPort-SDR: n+bdLvM94mTtaMRPqy7AXFXvwlsoFSeHsLefR+I0mp2t0FRH7ts+MqMZTWDdOyglPZ14sBx+MP
 +P/UgODtKNRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; d="scan'208";a="378322892"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2020 23:22:26 -0700
Date: Wed, 3 Jun 2020 23:22:26 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604062226.GA1740345@iweiny-DESK2.sc.intel.com>
References: <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> On 6/3/20 2:14 PM, Ira Weiny wrote:
> > On Wed, Jun 03, 2020 at 01:57:36PM -0700, Andrew Morton wrote:
> >> On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:
> >>

...

> >>
> >> This all petered out, but as I understand it, this patchset still might
> >> have issues on various architectures.
> >>
> >> Can folks please provide an update on the testing status?
> > 
> > I believe the tests were failing for Guenter due to another patch set...[1]
> > 
> > My tests with just this series are working.
> > 
> >>From my understanding the other failures were unrelated.[2]
> > 
> > 	<quote Mike Rapoport>
> > 	I've checked the patch above on top of the mmots which already has
> > 	Ira's patches and it booted fine. I've used sparc32_defconfig to build
> > 	the kernel and qemu-system-sparc with default machine and CPU.
> > 	</quote>
> > 
> > Mike, am I wrong?  Do you think the kmap() patches are still causing issues?
> > 
> 
> For my part, all I can say is that -next is in pretty bad shape right now.
> The summary of my tests says:
> 
> Build results:
> 	total: 151 pass: 130 fail: 21
> Qemu test results:
> 	total: 430 pass: 375 fail: 55
> 
> sparc32 smp images in next-20200603 still crash for me with a spinlock
> recursion. s390 images hang early in boot. Several others (alpha, arm64,
> various ppc) don't even compile. I can run some more bisects over time,
> but this is becoming a full-time job :-(.
> 

I'm not sure what the process here is.  I just applied my series[1] on
Linus' Master branch[2] and ran sparc32 and s290 from your tests.

sparc32: (passes)

21:43:49 > /home/iweiny/dev/linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
Build reference: v5.7-7188-g67a7a97e8a0f

Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
Building sparc32:SS-4:nosmp:initrd ... running ......... passed
Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ...... .... passed
Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed


s390: (does not compile)

<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
In file included from ./arch/sparc/include/asm/bug.h:6:0,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/mm.h:9,
                 from mm/huge_memory.c:8:
mm/huge_memory.c: In function 'hugepage_init':
./include/linux/compiler.h:403:38: error: call to '__compiletime_assert_127' declared with attribute error: BUILD_BUG_ON failed: ((13 + (13-3))-13) >= 9
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
./include/linux/compiler.h:384:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~
./include/linux/compiler.h:403:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^~~~~~~~~~~~~~~~
./include/linux/bug.h:24:4: note: in expansion of macro 'BUILD_BUG_ON'
    BUILD_BUG_ON(cond);             \
    ^~~~~~~~~~~~
mm/huge_memory.c:403:2: note: in expansion of macro 'MAYBE_BUILD_BUG_ON'
  MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER >= MAX_ORDER);
  ^~~~~~~~~~~~~~~~~~
make[1]: *** [scripts/Makefile.build:267: mm/huge_memory.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1735: mm] Error 2
make: *** Waiting for unfinished jobs....
------------


The s390 error is the same on Linus' master and linux-next.  So whatever is
causing that has slipped into mainline and/or is something I've broken in the
test scripts.


With linux-next on sparc I too see the spinlock issue; something like:

...
Starting syslogd: BUG: spinlock recursion on CPU#0, S01syslogd/139
 lock: 0xf53ef350, .magic: dead4ead, .owner: S01syslogd/139, .owner_cpu: 0
CPU: 0 PID: 139 Comm: S01syslogd Not tainted 5.7.0-next-20200603 #1
[f0067d00 : 
do_raw_spin_lock+0xa8/0xd8 ] 
[f00d598c : 
copy_page_range+0x328/0x804 ] 
[f0025c34 : 
dup_mm+0x334/0x434 ] 
[f0027198 : 
copy_process+0x1248/0x12d4 ] 
[f00273b8 : 
_do_fork+0x54/0x30c ] 
[f00276e4 : 
do_fork+0x5c/0x6c ] 
[f000de44 : 
sparc_do_fork+0x18/0x38 ] 
[f000b7f4 : 
do_syscall+0x34/0x40 ] 
[5010cd4c : 
0x5010cd4c ] 

qemu-system-sparc: terminating on signal 15 from pid 2000056 (/bin/bash)
...


FWIW I don't see any of this being an issue with the kmap() code but I agree
things could be cleaner.  How can we back linux-next off a bit?  I'm not an
expert here with how linux-next works.

For example I just picked the latest patch from me within the linux-next tree:

  2e483306d5a8 arch/{mips,sparc,microblaze,powerpc}: don't enable pagefault/preempt twice

And built from there it looks good for sparc.

23:01:31 > /home/iweiny/dev/linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
Build reference: v5.7-719-g2e483306d5a8

Building sparc32:SPARCClassic:nosmp:scsi:hd ... running .......... passed
Building sparc32:SPARCbook:nosmp:scsi:cd ... running .......... passed
Building sparc32:LX:nosmp:noapc:scsi:hd ... running .......... passed
Building sparc32:SS-4:nosmp:initrd ... running .......... passed
Building sparc32:SS-5:nosmp:scsi:hd ... running .......... passed
Building sparc32:SS-10:nosmp:scsi:cd ... running .......... passed
Building sparc32:SS-20:nosmp:scsi:hd ... running .......... passed
Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
Building sparc32:SS-4:smp:scsi:hd ... running ......^[[1;2D... passed
Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed


I'm going to bisect between there and HEAD.


Ira


[1]

67a7a97e8a0f arch/{mips,sparc,microblaze,powerpc}: Don't enable pagefault/preempt twice
4a3dd9ec36d8 kmap: Consolidate kmap_prot definitions
a3b39b1668ac sparc: Remove unnecessary includes
452195c6e8a8 parisc/kmap: Remove duplicate kmap code
317e4af1da94 kmap: Remove kmap_atomic_to_page()
e11e52415a4d drm: Remove drm specific kmap_atomic code
afd4911f0cfb arch/kmap: Define kmap_atomic_prot() for all arch's
2a5524d63341 arch/kmap: Don't hard code kmap_prot values
c94bbaab0296 arch/kmap: Ensure kmap_prot visibility
6f29a6b66d3b arch/kunmap_atomic: Consolidate duplicate code
0c7122ef07d1 arch/kmap_atomic: Consolidate duplicate code
63b8bbf47723 {x86,powerpc,microblaze}/kmap: Move preempt disable
23b3175de76f arch/kunmap: Remove duplicate kunmap implementations
9514dd54fda8 arch/kmap: Remove redundant arch specific kmaps
e92e53c0080b arch/xtensa: Move kmap build bug out of the way
cab1afa4f6ac arch/kmap: Remove BUG_ON()

[2] cb8e59cc8720 (linus/master, linus-master) Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
