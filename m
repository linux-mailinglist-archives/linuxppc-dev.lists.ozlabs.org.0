Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDDC1D8F5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 07:47:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R4dv2TDHzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 15:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4c26S5VzDqrn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:45:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49R4c16cbmz9sTT;
 Tue, 19 May 2020 15:45:37 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/7] powerpc: Add support for ISA v3.1
Date: Tue, 19 May 2020 15:45:34 +1000
Message-ID: <2708597.ukFscvRmPa@townsend>
In-Reply-To: <CACzsE9pF6Q01eMtzM1esnGC1k=BWZuq8gPMRZC4uaHNoQ=VdzA@mail.gmail.com>
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-3-alistair@popple.id.au>
 <CACzsE9pF6Q01eMtzM1esnGC1k=BWZuq8gPMRZC4uaHNoQ=VdzA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Jordan Niethe <jniethe5@gmail.com>, mikey@neuling.org,
 Nicholas Piggin <npiggin@gmail.com>, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday, 19 May 2020 2:04:51 PM AEST Jordan Niethe wrote:
> On Tue, May 19, 2020 at 10:39 AM Alistair Popple <alistair@popple.id.au> 
wrote:
> > Newer ISA versions are enabled by clearing all bits in the PCR
> > associated with previous versions of the ISA. Enable ISA v3.1 support
> > by updating the PCR mask to include ISA v3.0. This ensures all PCR
> > bits corresponding to earlier architecture versions get cleared
> > thereby enabling ISA v3.1 if supported by the hardware.
> > 
> > Signed-off-by: Alistair Popple <alistair@popple.id.au>
> > ---
> > 
> >  arch/powerpc/include/asm/cputable.h | 1 +
> >  arch/powerpc/include/asm/reg.h      | 3 ++-
> >  arch/powerpc/kvm/book3s_hv.c        | 3 ---
> >  3 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/cputable.h
> > b/arch/powerpc/include/asm/cputable.h index 40a4d3c6fd99..36f894dea9e7
> > 100644
> > --- a/arch/powerpc/include/asm/cputable.h
> > +++ b/arch/powerpc/include/asm/cputable.h
> > @@ -213,6 +213,7 @@ static inline void cpu_feature_keys_init(void) { }
> > 
> >  #define CPU_FTR_P9_TIDR                       
> >  LONG_ASM_CONST(0x0000800000000000) #define CPU_FTR_P9_TLBIE_ERAT_BUG    
> >   LONG_ASM_CONST(0x0001000000000000) #define
> >  CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)> 
> > +#define CPU_FTR_ARCH_31                       
> > LONG_ASM_CONST(0x0004000000000000)> 
> >  #ifndef __ASSEMBLY__
> > 
> > diff --git a/arch/powerpc/include/asm/reg.h
> > b/arch/powerpc/include/asm/reg.h index 773f76402392..1931b1142599 100644
> > --- a/arch/powerpc/include/asm/reg.h
> > +++ b/arch/powerpc/include/asm/reg.h
> > @@ -485,10 +485,11 @@
> > 
> >   * determine both the compatibility level which we want to emulate and
> >   the
> >   * compatibility level which the host is capable of emulating.
> >   */
> > 
> > +#define   PCR_ARCH_300 0x10            /* Architecture 3.00 */
> > 
> >  #define   PCR_ARCH_207 0x8             /* Architecture 2.07 */
> >  #define   PCR_ARCH_206 0x4             /* Architecture 2.06 */
> >  #define   PCR_ARCH_205 0x2             /* Architecture 2.05 */
> > 
> > -#define   PCR_LOW_BITS (PCR_ARCH_207 | PCR_ARCH_206 | PCR_ARCH_205)
> > +#define   PCR_LOW_BITS (PCR_ARCH_207 | PCR_ARCH_206 | PCR_ARCH_205 |
> > PCR_ARCH_300)> 
> >  #define   PCR_MASK     ~(PCR_HIGH_BITS | PCR_LOW_BITS) /* PCR Reserved
> >  Bits */ #define        SPRN_HEIR       0x153   /* Hypervisor Emulated
> >  Instruction Register */ #define SPRN_TLBINDEXR 0x154   /* P7 TLB control
> >  register */
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > index 93493f0cbfe8..532215040f3e 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -344,9 +344,6 @@ static void kvmppc_set_pvr_hv(struct kvm_vcpu *vcpu,
> > u32 pvr)> 
> >         vcpu->arch.pvr = pvr;
> >  
> >  }
> > 
> > -/* Dummy value used in computing PCR value below */
> > -#define PCR_ARCH_300   (PCR_ARCH_207 << 1)
> > -
> 
> Later will we need
> +/* Dummy value used in computing PCR value below */
> +#define PCR_ARCH_310   (PCR_ARCH_300 << 1)
> ?

Correct. I left that out of this patch series though as I am putting together 
a separate series for basic P10 KVM enablement which will add the definition 
for ARCH 3.1.

- Alistair

> >  static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
> >  {
> >  
> >         unsigned long host_pcr_bit = 0, guest_pcr_bit = 0;
> > 
> > --
> > 2.20.1




