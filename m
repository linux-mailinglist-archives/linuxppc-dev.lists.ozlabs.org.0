Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960092E3BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 11:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKVNT0h0vz3ccL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 19:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKVN51Q2Sz3cW7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 19:50:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4621C1007;
	Thu, 11 Jul 2024 02:50:33 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B87B3F766;
	Thu, 11 Jul 2024 02:50:05 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:50:00 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
Message-ID: <20240711095000.GA488602@e124191.cambridge.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
 <ZlnlQ/avUAuSum5R@arm.com>
 <20240531152138.GA1805682@e124191.cambridge.arm.com>
 <Zln6ckvyktar8r0n@arm.com>
 <87a5jj4rhw.fsf@oldenburg.str.redhat.com>
 <ZnBNd51hVlaPTvn8@arm.com>
 <ZownjvHbPI1anfpM@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZownjvHbPI1anfpM@arm.com>
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
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, Florian Weimer <fweimer@redhat.com>, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 08, 2024 at 06:53:18PM +0100, Catalin Marinas wrote:
> Hi Szabolcs,
> 
> On Mon, Jun 17, 2024 at 03:51:35PM +0100, Szabolcs Nagy wrote:
> > The 06/17/2024 15:40, Florian Weimer wrote:
> > > >> A user can still set it by interacting with the register directly, but I guess
> > > >> we want something for the glibc interface..
> > > >> 
> > > >> Dave, any thoughts here?
> > > >
> > > > adding Florian too, since i found an old thread of his that tried
> > > > to add separate PKEY_DISABLE_READ and PKEY_DISABLE_EXECUTE, but
> > > > it did not seem to end up upstream. (this makes more sense to me
> > > > as libc api than the weird disable access semantics)
> > > 
> > > I still think it makes sense to have a full complenent of PKEY_* flags
> > > complementing the PROT_* flags, in a somewhat abstract fashion for
> > > pkey_alloc only.  The internal protection mask register encoding will
> > > differ from architecture to architecture, but the abstract glibc
> > > functions pkey_set and pkey_get could use them (if we are a bit
> > > careful).
> > 
> > to me it makes sense to have abstract
> > 
> > PKEY_DISABLE_READ
> > PKEY_DISABLE_WRITE
> > PKEY_DISABLE_EXECUTE
> > PKEY_DISABLE_ACCESS
> > 
> > where access is handled like
> > 
> > if (flags&PKEY_DISABLE_ACCESS)
> > 	flags |= PKEY_DISABLE_READ|PKEY_DISABLE_WRITE;
> > disable_read = flags&PKEY_DISABLE_READ;
> > disable_write = flags&PKEY_DISABLE_WRITE;
> > disable_exec = flags&PKEY_DISABLE_EXECUTE;
> > 
> > if there are unsupported combinations like
> > disable_read&&!disable_write then those are rejected
> > by pkey_alloc and pkey_set.
> > 
> > this allows portable use of pkey apis.
> > (the flags could be target specific, but don't have to be)
> 
> On powerpc, PKEY_DISABLE_ACCESS also disables execution. AFAICT, the
> kernel doesn't define a PKEY_DISABLE_READ, only PKEY_DISABLE_ACCESS so
> for powerpc there's no way to to set an execute-only permission via this
> interface. I wouldn't like to diverge from powerpc.

I think this is wrong, look at this code from powerpc:

arch/powerpc/mm/book3s64/pkeys.c: __arch_set_user_pkey_access

        if (init_val & PKEY_DISABLE_EXECUTE) {
                if (!pkey_execute_disable_supported)
                        return -EINVAL;
                new_iamr_bits |= IAMR_EX_BIT;
        }
        init_iamr(pkey, new_iamr_bits);

        /* Set the bits we need in AMR: */
        if (init_val & PKEY_DISABLE_ACCESS)
                new_amr_bits |= AMR_RD_BIT | AMR_WR_BIT;
        else if (init_val & PKEY_DISABLE_WRITE)
                new_amr_bits |= AMR_WR_BIT;

        init_amr(pkey, new_amr_bits);

Seems to me that PKEY_DISABLE_ACCESS leaves exec permissions as-is.

Here is the patch I am planning to include in the next version of the series.
This should support all PKEY_DISABLE_* combinations. Any comments? 

commit ba51371a544f6b0a4a0f03df62ad894d53f5039b
Author: Joey Gouly <joey.gouly@arm.com>
Date:   Thu Jul 4 11:29:20 2024 +0100

    arm64: add PKEY_DISABLE_READ and PKEY_DISABLE_EXEC
    
    TODO
    
    Signed-off-by: Joey Gouly <joey.gouly@arm.com>

diff --git arch/arm64/include/uapi/asm/mman.h arch/arm64/include/uapi/asm/mman.h
index 1e6482a838e1..e7e0c8216243 100644
--- arch/arm64/include/uapi/asm/mman.h
+++ arch/arm64/include/uapi/asm/mman.h
@@ -7,4 +7,13 @@
 #define PROT_BTI       0x10            /* BTI guarded page */
 #define PROT_MTE       0x20            /* Normal Tagged mapping */
 
+/* Override any generic PKEY permission defines */
+#define PKEY_DISABLE_EXECUTE   0x4
+#define PKEY_DISABLE_READ      0x8
+#undef PKEY_ACCESS_MASK
+#define PKEY_ACCESS_MASK       (PKEY_DISABLE_ACCESS |\
+                               PKEY_DISABLE_WRITE  |\
+                               PKEY_DISABLE_READ   |\
+                               PKEY_DISABLE_EXECUTE)
+
 #endif /* ! _UAPI__ASM_MMAN_H */
diff --git arch/arm64/mm/mmu.c arch/arm64/mm/mmu.c
index 68afe5fc3071..ce4cc6bdee4e 100644
--- arch/arm64/mm/mmu.c
+++ arch/arm64/mm/mmu.c
@@ -1570,10 +1570,15 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long i
                return -EINVAL;
 
        /* Set the bits we need in POR:  */
+       new_por = POE_RXW;
+       if (init_val & PKEY_DISABLE_WRITE)
+               new_por &= ~POE_W;
        if (init_val & PKEY_DISABLE_ACCESS)
-               new_por = POE_X;
-       else if (init_val & PKEY_DISABLE_WRITE)
-               new_por = POE_RX;
+               new_por &= ~POE_RW;
+       if (init_val & PKEY_DISABLE_READ)
+               new_por &= ~POE_R;
+       if (init_val & PKEY_DISABLE_EXECUTE)
+               new_por &= ~POE_X;
 
        /* Shift the bits in to the correct place in POR for pkey: */
        pkey_shift = pkey * POR_BITS_PER_PKEY;



Thanks,
Joey
