Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E671D9FBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 20:42:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RPrP0mdFzDr28
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 04:42:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RPpN041GzDr1S
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 04:40:36 +1000 (AEST)
IronPort-SDR: 4RukIO0c8zulMPWOELJzw129So1wgxcUvIO/bq+tmQyS0bFylwnF9LOIRhCm8MU25ljR/LhNAH
 iEmWEnooUsdA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 11:40:33 -0700
IronPort-SDR: D+jm1xpsdiPApGucH8RonxhW2osAHv0gYp6yWvUx7peRxHsoQ0vFEHwV7Czh/gp76Png2rfKJj
 4SSgNhc/QOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; d="scan'208";a="264403264"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga003.jf.intel.com with ESMTP; 19 May 2020 11:40:32 -0700
Date: Tue, 19 May 2020 11:40:32 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519165422.GA5838@roeck-us.net>
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
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> > enables when vaddr is not in the fixmap.
> > 
> > Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> microblazeel works with this patch,

Awesome...  Andrew in my rush yesterday I should have put a reported by on the
patch for Guenter as well.

Sorry about that Guenter,
Ira

> as do the nosmp sparc32 boot tests,
> but sparc32 boot tests with SMP enabled still fail with lots of messages
> such as:
> 
> BUG: Bad page state in process swapper/0  pfn:006a1
> page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
> flags: 0x0()
> raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
> [f00e7ab8 :
> bad_page+0xa8/0x108 ]
> [f00e8b54 :
> free_pcppages_bulk+0x154/0x52c ]
> [f00ea024 :
> free_unref_page+0x54/0x6c ]
> [f00ed864 :
> free_reserved_area+0x58/0xec ]
> [f0527104 :
> kernel_init+0x14/0x110 ]
> [f000b77c :
> ret_from_kernel_thread+0xc/0x38 ]
> [00000000 :
> 0x0 ]
> 
> Code path leading to that message is different but always the same
> from free_unref_page().
> 
> Still testing ppc images.
> 
> Guenter
