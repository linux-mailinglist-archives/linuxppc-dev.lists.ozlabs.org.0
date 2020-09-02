Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 372DD25A57B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 08:22:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhDPD29L1zDqgL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 16:22:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhDK70lCwzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 16:18:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Ffc2tECG; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4BhDK64lNVz9sV8; Wed,  2 Sep 2020 16:18:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1599027514; bh=SvqrLtSy7O4r2ulnso5MmauMzcR2/XPprpW6tHLdmU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ffc2tECGO/BfdwgaKDDzmaBTJHLSERwSxWOrUXDRUFZmpDniBaHsrswbonOJpjcBF
 6zrgDy8atFX7fKYRdRRkVCOrl5b/8pEHyUszcURis/g4MKfrlIhHu+03gnuz9BRPDH
 qp0Kg65i41QOuU99/vPq38d0FbXqAo7lg4QnuU1NsQyI022Q+aDsR5ZDUByM30LJJ6
 PnKN6Til4YplHTxVPpENQH5x6ZslU5wA+AwOL91UrR49bkCOeJjBpsMOry0XWU04Ll
 JxX1pOfKU+6VlnJkTMU6FF/xJwVc5YdtPaJxfvembQcSIYlSn9Q/ggMr3CAU/pq8in
 LNaEwQgmR13Kw==
Date: Wed, 2 Sep 2020 16:18:29 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [RFC PATCH 2/2] KVM: PPC: Book3S HV: Support prefixed instructions
Message-ID: <20200902061829.GF272502@thinks.paulus.ozlabs.org>
References: <20200820033922.32311-1-jniethe5@gmail.com>
 <20200820033922.32311-2-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820033922.32311-2-jniethe5@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 20, 2020 at 01:39:22PM +1000, Jordan Niethe wrote:
> There are two main places where instructions are loaded from the guest:
>     * Emulate loadstore - such as when performing MMIO emulation
>       triggered by an HDSI
>     * After an HV emulation assistance interrupt (e40)
> 
> If it is a prefixed instruction that triggers these cases, its suffix
> must be loaded. Use the SRR1_PREFIX bit to decide if a suffix needs to
> be loaded. Make sure if this bit is set inject_interrupt() also sets it
> when giving an interrupt to the guest.
> 
> ISA v3.10 extends the Hypervisor Emulation Instruction Register (HEIR)
> to 64 bits long to accommodate prefixed instructions. For interrupts
> caused by a word instruction the instruction is loaded into bits 32:63
> and bits 0:31 are zeroed. When caused by a prefixed instruction the
> prefix and suffix are loaded into bits 0:63.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/kvm/book3s.c               | 15 +++++++++++++--
>  arch/powerpc/kvm/book3s_64_mmu_hv.c     | 10 +++++++---
>  arch/powerpc/kvm/book3s_hv_builtin.c    |  3 +++
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 14 ++++++++++++++
>  4 files changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index 70d8967acc9b..18b1928a571b 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -456,13 +456,24 @@ int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
>  {
>  	ulong pc = kvmppc_get_pc(vcpu);
>  	u32 word;
> +	u64 doubleword;
>  	int r;
>  
>  	if (type == INST_SC)
>  		pc -= 4;
>  
> -	r = kvmppc_ld(vcpu, &pc, sizeof(u32), &word, false);
> -	*inst = ppc_inst(word);
> +	if ((kvmppc_get_msr(vcpu) & SRR1_PREFIXED)) {
> +		r = kvmppc_ld(vcpu, &pc, sizeof(u64), &doubleword, false);

Should we also have a check here that the doubleword is not crossing a
page boundary?  I can't think of a way to get this code to cross a
page boundary, assuming the hardware is working correctly, but it
makes me just a little nervous.

> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +		*inst = ppc_inst_prefix(doubleword & 0xffffffff, doubleword >> 32);
> +#else
> +		*inst = ppc_inst_prefix(doubleword >> 32, doubleword & 0xffffffff);
> +#endif

Ick.  Is there a cleaner way to do this?

> +	} else {
> +		r = kvmppc_ld(vcpu, &pc, sizeof(u32), &word, false);
> +		*inst = ppc_inst(word);
> +	}
> +
>  	if (r == EMULATE_DONE)
>  		return r;
>  	else
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 775ce41738ce..0802471f4856 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -411,9 +411,13 @@ static int instruction_is_store(struct ppc_inst instr)
>  	unsigned int mask;
>  
>  	mask = 0x10000000;
> -	if ((ppc_inst_val(instr) & 0xfc000000) == 0x7c000000)
> -		mask = 0x100;		/* major opcode 31 */
> -	return (ppc_inst_val(instr) & mask) != 0;
> +	if (ppc_inst_prefixed(instr)) {
> +		return (ppc_inst_suffix(instr) & mask) != 0;
> +	} else {
> +		if ((ppc_inst_val(instr) & 0xfc000000) == 0x7c000000)
> +			mask = 0x100;		/* major opcode 31 */
> +		return (ppc_inst_val(instr) & mask) != 0;
> +	}

The way the code worked before, the mask depended on whether the
instruction was a D-form (or DS-form or other variant) instruction,
where you can tell loads and stores apart by looking at the major
opcode, or an X-form instruction, where you look at the minor opcode.

Now we are only looking at the minor opcode if it is not a prefixed
instruction.  Are there no X-form prefixed loads or stores?

Paul.
