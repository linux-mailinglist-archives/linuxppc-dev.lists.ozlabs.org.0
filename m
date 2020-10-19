Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236F292629
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 13:01:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFDN15SzbzDqdk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 22:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFDLB4SC1zDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 22:00:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aWkFs2fx; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CFDL94Glbz9sRk;
 Mon, 19 Oct 2020 22:00:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603105202;
 bh=GkEuEzz2xbPqel1o+vjt6i7tS/K4O4jcgOAX4pO3Txc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aWkFs2fxZN6nBDOq7FUqNp3yzaYB4TXjJiKfdZl5YWHjvWoK2h5a7ZzoLoUOjxqRT
 eklMoLpLJHokdcu3CoozL1Y0GnHFrHRsjNEBSP0GIYBRW1u4iXKzdiNxvw+DEd9fWS
 g0/4OPwlBtj83iGYkV7hnkXgtBoPrG595aOUPmXSbmjcmLJYe+1kLawsJa8+CzKLSt
 KkTbBLEtmcloWVxNyz7DVLzN10/UXd3siM9twD648gmVmLgNuv24EsS19sy+dnvFOz
 wi26WnkgoVk93MCHe5yBMLyVXkC1juo/fhtmLaug3HYqtEfasiPaBY7dGoilhTVao9
 XIKOvxyGYKfBw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 2/2] lkdtm/powerpc: Add SLB multihit test
In-Reply-To: <20201009064005.19777-3-ganeshgr@linux.ibm.com>
References: <20201009064005.19777-1-ganeshgr@linux.ibm.com>
 <20201009064005.19777-3-ganeshgr@linux.ibm.com>
Date: Mon, 19 Oct 2020 21:59:57 +1100
Message-ID: <87362azdjm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: msuchanek@suse.de, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 keescook@chromium.org, npiggin@gmail.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ganesh,

Some comments below ...

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> To check machine check handling, add support to inject slb
> multihit errors.
>
> Cc: Kees Cook <keescook@chromium.org>
> Reviewed-by: Michal Such=C3=A1nek <msuchanek@suse.de>
> Co-developed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  drivers/misc/lkdtm/Makefile             |   1 +
>  drivers/misc/lkdtm/core.c               |   3 +
>  drivers/misc/lkdtm/lkdtm.h              |   3 +
>  drivers/misc/lkdtm/powerpc.c            | 156 ++++++++++++++++++++++++
>  tools/testing/selftests/lkdtm/tests.txt |   1 +
>  5 files changed, 164 insertions(+)
>  create mode 100644 drivers/misc/lkdtm/powerpc.c
>
..
> diff --git a/drivers/misc/lkdtm/powerpc.c b/drivers/misc/lkdtm/powerpc.c
> new file mode 100644
> index 000000000000..f388b53dccba
> --- /dev/null
> +++ b/drivers/misc/lkdtm/powerpc.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "lkdtm.h"
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>

Usual style is to include the linux headers first and then the local header.

> +
> +/* Gets index for new slb entry */
> +static inline unsigned long get_slb_index(void)
> +{
> +	unsigned long index;
> +
> +	index =3D get_paca()->stab_rr;
> +
> +	/*
> +	 * simple round-robin replacement of slb starting at SLB_NUM_BOLTED.
> +	 */
> +	if (index < (mmu_slb_size - 1))
> +		index++;
> +	else
> +		index =3D SLB_NUM_BOLTED;
> +	get_paca()->stab_rr =3D index;
> +	return index;
> +}

I'm not sure we need that really?

We can just always insert at SLB_MUM_BOLTED and SLB_NUM_BOLTED + 1.

Or we could allocate from the top down using mmu_slb_size - 1, and
mmu_slb_size - 2.


> +#define slb_esid_mask(ssize)	\
> +	(((ssize) =3D=3D MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
> +
> +/* Form the operand for slbmte */
> +static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
> +					 unsigned long slot)
> +{
> +	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
> +}
> +
> +#define slb_vsid_shift(ssize)	\
> +	((ssize) =3D=3D MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
> +
> +/* Form the operand for slbmte */
> +static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
> +					 unsigned long flags)
> +{
> +	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
> +		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
> +}

I realise it's not much code, but I'd rather those were in a header,
rather than copied from slb.c. That way they can never skew vs the
versions in slb.c

Best place I think would be arch/powerpc/include/asm/book3s/64/mmu-hash.h


> +
> +/* Inserts new slb entry */

It inserts two.

> +static void insert_slb_entry(char *p, int ssize)
> +{
> +	unsigned long flags, entry;
> +
> +	flags =3D SLB_VSID_KERNEL | mmu_psize_defs[MMU_PAGE_64K].sllp;

That won't work if the kernel is built for 4K pages. Or at least it
won't work the way we want it to.

You should use mmu_linear_psize.

But for vmalloc you should use mmu_vmalloc_psize, so it will need to be
a parameter.

> +	preempt_disable();
> +
> +	entry =3D get_slb_index();
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
> +			: "memory");
> +
> +	entry =3D get_slb_index();
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
> +			: "memory");
> +	preempt_enable();
> +	/*
> +	 * This triggers exception, If handled correctly we must recover
> +	 * from this error.
> +	 */
> +	p[0] =3D '!';

That doesn't belong in here, it should be done by the caller.

That would also mean p could be unsigned long in here, so you wouldn't
have to cast it four times.

> +}
> +
> +/* Inject slb multihit on vmalloc-ed address i.e 0xD00... */
> +static void inject_vmalloc_slb_multihit(void)
> +{
> +	char *p;
> +
> +	p =3D vmalloc(2048);

vmalloc() allocates whole pages, so it may as well be vmalloc(PAGE_SIZE).

> +	if (!p)
> +		return;

That's unlikely, but it should be an error that's propagated up to the call=
er.

> +
> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
> +	vfree(p);
> +}
> +
> +/* Inject slb multihit on kmalloc-ed address i.e 0xC00... */
> +static void inject_kmalloc_slb_multihit(void)
> +{
> +	char *p;
> +
> +	p =3D kmalloc(2048, GFP_KERNEL);
> +	if (!p)
> +		return;
> +
> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
> +	kfree(p);
> +}
> +
> +/*
> + * Few initial SLB entries are bolted. Add a test to inject
> + * multihit in bolted entry 0.
> + */
> +static void insert_dup_slb_entry_0(void)
> +{
> +	unsigned long test_address =3D 0xC000000000000000;

Should use PAGE_OFFSET;

> +	volatile unsigned long *test_ptr;

Does it need to be a volatile?
The slbmte should act as a compiler barrier (it has a memory clobber)
and a CPU barrier as well?

> +	unsigned long entry, i =3D 0;
> +	unsigned long esid, vsid;

Please group your variables:

  unsigned long esid, vsid, entry, test_address, i;
  volatile unsigned long *test_ptr;

And then initialise them as appropriate.

> +	test_ptr =3D (unsigned long *)test_address;
> +	preempt_disable();
> +
> +	asm volatile("slbmfee  %0,%1" : "=3Dr" (esid) : "r" (i));
> +	asm volatile("slbmfev  %0,%1" : "=3Dr" (vsid) : "r" (i));

Why do we need to read them out of the SLB rather than just computing
the values?

> +	entry =3D get_slb_index();
> +
> +	/* for i !=3D0 we would need to mask out the old entry number */

Or you could just compute esid and then it wouldn't be an issue.

> +	asm volatile("slbmte %0,%1" :
> +			: "r" (vsid),
> +			  "r" (esid | entry)
> +			: "memory");

At this point we've just inserted a duplicate of entry 0. So you don't
need to insert a third entry do you?

> +	asm volatile("slbmfee  %0,%1" : "=3Dr" (esid) : "r" (i));
> +	asm volatile("slbmfev  %0,%1" : "=3Dr" (vsid) : "r" (i));
> +	entry =3D get_slb_index();
> +
> +	/* for i !=3D0 we would need to mask out the old entry number */
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (vsid),
> +			  "r" (esid | entry)
> +			: "memory");
> +
> +	pr_info("%s accessing test address 0x%lx: 0x%lx\n",
> +		__func__, test_address, *test_ptr);

This prints the first two instructions of the kernel. I happen to know
what values they should have, but most people won't understand what
they're seeing. A better test would be to read the value at the top of
the function and then load it again here and check we got the right
thing.

eg.
  unsigned long val;

  val =3D *test_ptr;
  ...
  if (val =3D=3D *test_ptr)
    pr_info("Success ...")
  else
    pr_info("Fail ...")


> +
> +	preempt_enable();
> +}
> +
> +void lkdtm_PPC_SLB_MULTIHIT(void)
> +{
> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {

That will be true even if radix is enabled. You need to use radix_enabled().

> +		pr_info("Injecting SLB multihit errors\n");
> +		/*
> +		 * These need not be separate tests, And they do pretty
> +		 * much same thing. In any case we must recover from the
> +		 * errors introduced by these functions, machine would not
> +		 * survive these tests in case of failure to handle.
> +		 */
> +		inject_vmalloc_slb_multihit();
> +		inject_kmalloc_slb_multihit();
> +		insert_dup_slb_entry_0();
> +		pr_info("Recovered from SLB multihit errors\n");
> +	} else {
> +		pr_err("XFAIL: This test is for ppc64 and with hash mode MMU only\n");

The whole file is only built if CONFIG_PPC64, so you don't need to
mention ppc64 in the message.

It should say something more like:

  XFAIL: can't test SLB multi-hit when using Radix MMU



cheers
