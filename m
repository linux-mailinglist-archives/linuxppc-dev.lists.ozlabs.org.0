Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A4D79B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 17:24:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46szjW6mxDzDr41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 02:23:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46szf41DPnzDr55
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 02:20:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68FF928;
 Tue, 15 Oct 2019 08:20:55 -0700 (PDT)
Received: from [10.162.42.142] (p8cg001049571a15.blr.arm.com [10.162.42.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 754823F718; Tue, 15 Oct 2019 08:20:44 -0700 (PDT)
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, linux-mm@kvack.org
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571150502.5937.39.camel@lca.pw>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
Date: Tue, 15 Oct 2019 20:51:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1571150502.5937.39.camel@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/15/2019 08:11 PM, Qian Cai wrote:
> The x86 will crash with linux-next during boot due to this series (v5) with the
> config below plus CONFIG_DEBUG_VM_PGTABLE=y. I am not sure if v6 would address
> it.
> 
> https://raw.githubusercontent.com/cailca/linux-mm/master/x86.config
> 
> [   33.862600][    T1] page:ffffea0009000000 is uninitialized and poisoned
> [   33.862608][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
> ffffff871140][    T1]  ? _raw_spin_unlock_irq+0x27/0x40
> [   33.871140][    T1]  ? rest_init+0x307/0x307
> [   33.871140][    T1]  kernel_init+0x11/0x139
> [   33.871140][    T1]  ? rest_init+0x307/0x307
> [   33.871140][    T1]  ret_from_fork+0x27/0x50
> [   33.871140][    T1] Modules linked in:
> [   33.871140][    T1] ---[ end trace e99d392b0f7befbd ]---
> [   33.871140][    T1] RIP: 0010:alloc_gigantic_page_order+0x3fe/0x490

Hmm, with defconfig (DEBUG_VM=y and DEBUG_VM_PGTABLE=y) it does not crash but
with the config above, it does. Just wondering if it is possible that these
pages might not been initialized yet because DEFERRED_STRUCT_PAGE_INIT=y ?

[   13.898549][    T1] page:ffffea0005000000 is uninitialized and poisoned
[   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
[   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
[   13.898549][    T1] page dumped because: VM_BUG_ON_PAGE(PagePoisoned(p))
[   13.898549][    T1] ------------[ cut here ]------------
[   13.898549][    T1] kernel BUG at ./include/linux/mm.h:1107!
[   13.898549][    T1] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
[   13.898549][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc3-next-20191015+ #
