Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FCD8ABD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 10:22:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tQJL2wVKzDqQX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 19:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=mhocko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tQGQ0yH2zDqVH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 19:20:29 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8F4AEBA75;
 Wed, 16 Oct 2019 08:20:24 +0000 (UTC)
Date: Wed, 16 Oct 2019 10:20:22 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20191016082022.GN317@dhcp22.suse.cz>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571150502.5937.39.camel@lca.pw>
 <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Qian Cai <cai@lca.pw>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 15-10-19 20:51:11, Anshuman Khandual wrote:
> 
> 
> On 10/15/2019 08:11 PM, Qian Cai wrote:
> > The x86 will crash with linux-next during boot due to this series (v5) with the
> > config below plus CONFIG_DEBUG_VM_PGTABLE=y. I am not sure if v6 would address
> > it.
> > 
> > https://raw.githubusercontent.com/cailca/linux-mm/master/x86.config
> > 
> > [   33.862600][    T1] page:ffffea0009000000 is uninitialized and poisoned
> > [   33.862608][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
> > ffffff871140][    T1]  ? _raw_spin_unlock_irq+0x27/0x40
> > [   33.871140][    T1]  ? rest_init+0x307/0x307
> > [   33.871140][    T1]  kernel_init+0x11/0x139
> > [   33.871140][    T1]  ? rest_init+0x307/0x307
> > [   33.871140][    T1]  ret_from_fork+0x27/0x50
> > [   33.871140][    T1] Modules linked in:
> > [   33.871140][    T1] ---[ end trace e99d392b0f7befbd ]---
> > [   33.871140][    T1] RIP: 0010:alloc_gigantic_page_order+0x3fe/0x490
> 
> Hmm, with defconfig (DEBUG_VM=y and DEBUG_VM_PGTABLE=y) it does not crash but
> with the config above, it does. Just wondering if it is possible that these
> pages might not been initialized yet because DEFERRED_STRUCT_PAGE_INIT=y ?

Quite likely. You need to wait for page_alloc_init_late to finish.
> 
> [   13.898549][    T1] page:ffffea0005000000 is uninitialized and poisoned
> [   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
> [   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
> [   13.898549][    T1] page dumped because: VM_BUG_ON_PAGE(PagePoisoned(p))
> [   13.898549][    T1] ------------[ cut here ]------------
> [   13.898549][    T1] kernel BUG at ./include/linux/mm.h:1107!
> [   13.898549][    T1] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
> [   13.898549][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc3-next-20191015+ #

-- 
Michal Hocko
SUSE Labs
