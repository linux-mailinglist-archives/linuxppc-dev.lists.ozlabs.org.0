Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52712292809
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 15:19:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFHQv6JsTzDqGb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 00:19:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFHLp5w0KzDqWT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 00:15:46 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D870AD68;
 Mon, 19 Oct 2020 13:15:43 +0000 (UTC)
Date: Mon, 19 Oct 2020 15:15:41 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 2/2] lkdtm/powerpc: Add SLB multihit test
Message-ID: <20201019131541.GL29778@kitsune.suse.cz>
References: <20201009064005.19777-1-ganeshgr@linux.ibm.com>
 <20201009064005.19777-3-ganeshgr@linux.ibm.com>
 <87362azdjm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87362azdjm.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 keescook@chromium.org, npiggin@gmail.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 19, 2020 at 09:59:57PM +1100, Michael Ellerman wrote:
> Hi Ganesh,
> 
> Some comments below ...
> 
> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> > To check machine check handling, add support to inject slb
> > multihit errors.
> >
> > Cc: Kees Cook <keescook@chromium.org>
> > Reviewed-by: Michal Suchánek <msuchanek@suse.de>
> > Co-developed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> > ---
> >  drivers/misc/lkdtm/Makefile             |   1 +
> >  drivers/misc/lkdtm/core.c               |   3 +
> >  drivers/misc/lkdtm/lkdtm.h              |   3 +
> >  drivers/misc/lkdtm/powerpc.c            | 156 ++++++++++++++++++++++++
> >  tools/testing/selftests/lkdtm/tests.txt |   1 +
> >  5 files changed, 164 insertions(+)
> >  create mode 100644 drivers/misc/lkdtm/powerpc.c
> >
> ..
> > diff --git a/drivers/misc/lkdtm/powerpc.c b/drivers/misc/lkdtm/powerpc.c
> > new file mode 100644
> > index 000000000000..f388b53dccba
> > --- /dev/null
> > +++ b/drivers/misc/lkdtm/powerpc.c
> > @@ -0,0 +1,156 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include "lkdtm.h"
> > +#include <linux/slab.h>
> > +#include <linux/vmalloc.h>
> 
> Usual style is to include the linux headers first and then the local header.
> 
> > +
> > +/* Gets index for new slb entry */
> > +static inline unsigned long get_slb_index(void)
> > +{
> > +	unsigned long index;
> > +
> > +	index = get_paca()->stab_rr;
> > +
> > +	/*
> > +	 * simple round-robin replacement of slb starting at SLB_NUM_BOLTED.
> > +	 */
> > +	if (index < (mmu_slb_size - 1))
> > +		index++;
> > +	else
> > +		index = SLB_NUM_BOLTED;
> > +	get_paca()->stab_rr = index;
> > +	return index;
> > +}
> 
> I'm not sure we need that really?
> 
> We can just always insert at SLB_MUM_BOLTED and SLB_NUM_BOLTED + 1.
> 
> Or we could allocate from the top down using mmu_slb_size - 1, and
> mmu_slb_size - 2.
> 
> 
> > +#define slb_esid_mask(ssize)	\
> > +	(((ssize) == MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
> > +
> > +/* Form the operand for slbmte */
> > +static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
> > +					 unsigned long slot)
> > +{
> > +	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
> > +}
> > +
> > +#define slb_vsid_shift(ssize)	\
> > +	((ssize) == MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
> > +
> > +/* Form the operand for slbmte */
> > +static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
> > +					 unsigned long flags)
> > +{
> > +	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
> > +		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
> > +}
> 
> I realise it's not much code, but I'd rather those were in a header,
> rather than copied from slb.c. That way they can never skew vs the
> versions in slb.c
> 
> Best place I think would be arch/powerpc/include/asm/book3s/64/mmu-hash.h
> 
> 
> > +
> > +/* Inserts new slb entry */
> 
> It inserts two.
> 
> > +static void insert_slb_entry(char *p, int ssize)
> > +{
> > +	unsigned long flags, entry;
> > +
> > +	flags = SLB_VSID_KERNEL | mmu_psize_defs[MMU_PAGE_64K].sllp;
> 
> That won't work if the kernel is built for 4K pages. Or at least it
> won't work the way we want it to.
> 
> You should use mmu_linear_psize.
> 
> But for vmalloc you should use mmu_vmalloc_psize, so it will need to be
> a parameter.
> 
> > +	preempt_disable();
> > +
> > +	entry = get_slb_index();
> > +	asm volatile("slbmte %0,%1" :
> > +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
> > +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
> > +			: "memory");
> > +
> > +	entry = get_slb_index();
> > +	asm volatile("slbmte %0,%1" :
> > +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
> > +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
> > +			: "memory");
> > +	preempt_enable();
> > +	/*
> > +	 * This triggers exception, If handled correctly we must recover
> > +	 * from this error.
> > +	 */
> > +	p[0] = '!';
> 
> That doesn't belong in here, it should be done by the caller.
> 
> That would also mean p could be unsigned long in here, so you wouldn't
> have to cast it four times.
> 
> > +}
> > +
> > +/* Inject slb multihit on vmalloc-ed address i.e 0xD00... */
> > +static void inject_vmalloc_slb_multihit(void)
> > +{
> > +	char *p;
> > +
> > +	p = vmalloc(2048);
> 
> vmalloc() allocates whole pages, so it may as well be vmalloc(PAGE_SIZE).
> 
> > +	if (!p)
> > +		return;
> 
> That's unlikely, but it should be an error that's propagated up to the caller.
> 
> > +
> > +	insert_slb_entry(p, MMU_SEGSIZE_1T);
> > +	vfree(p);
> > +}
> > +
> > +/* Inject slb multihit on kmalloc-ed address i.e 0xC00... */
> > +static void inject_kmalloc_slb_multihit(void)
> > +{
> > +	char *p;
> > +
> > +	p = kmalloc(2048, GFP_KERNEL);
> > +	if (!p)
> > +		return;
> > +
> > +	insert_slb_entry(p, MMU_SEGSIZE_1T);
> > +	kfree(p);
> > +}
> > +
> > +/*
> > + * Few initial SLB entries are bolted. Add a test to inject
> > + * multihit in bolted entry 0.
> > + */
> > +static void insert_dup_slb_entry_0(void)
> > +{
> > +	unsigned long test_address = 0xC000000000000000;
> 
> Should use PAGE_OFFSET;
> 
> > +	volatile unsigned long *test_ptr;
> 
> Does it need to be a volatile?
> The slbmte should act as a compiler barrier (it has a memory clobber)
> and a CPU barrier as well?
> 
> > +	unsigned long entry, i = 0;
> > +	unsigned long esid, vsid;
> 
> Please group your variables:
> 
>   unsigned long esid, vsid, entry, test_address, i;
>   volatile unsigned long *test_ptr;
> 
> And then initialise them as appropriate.
> 
> > +	test_ptr = (unsigned long *)test_address;
> > +	preempt_disable();
> > +
> > +	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
> > +	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
> 
> Why do we need to read them out of the SLB rather than just computing
> the values?
It ensures that the entry is perfect duplicate without copying even more
code from other parts of the kernel, doesn't it?

Especially when inserting only one duplicate as suggested later it
ensures that the test really does what it should.
> 
> > +	entry = get_slb_index();
> > +
> > +	/* for i !=0 we would need to mask out the old entry number */
> 
> Or you could just compute esid and then it wouldn't be an issue.
> 
> > +	asm volatile("slbmte %0,%1" :
> > +			: "r" (vsid),
> > +			  "r" (esid | entry)
> > +			: "memory");
> 
> At this point we've just inserted a duplicate of entry 0. So you don't
> need to insert a third entry do you?
This code was obviously adapted from the previous one which needed two
entries in case there was none for the memory region to start with.

Addin only one duplicate should suffice and it can be easily tested that
it still generates a MCE.

> 
> > +	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
> > +	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
> > +	entry = get_slb_index();
> > +
> > +	/* for i !=0 we would need to mask out the old entry number */
> > +	asm volatile("slbmte %0,%1" :
> > +			: "r" (vsid),
> > +			  "r" (esid | entry)
> > +			: "memory");
> > +
> > +	pr_info("%s accessing test address 0x%lx: 0x%lx\n",
> > +		__func__, test_address, *test_ptr);
> 
> This prints the first two instructions of the kernel. I happen to know
> what values they should have, but most people won't understand what
> they're seeing. A better test would be to read the value at the top of
> the function and then load it again here and check we got the right
> thing.
It does not really matter what we read back so long as the compiler does
not optimize out the read. The point here is to access an address in the
range covered by the SLB entry 0. The failure case is that the system
crashes and the test never finishes.

Thanks

Michal
