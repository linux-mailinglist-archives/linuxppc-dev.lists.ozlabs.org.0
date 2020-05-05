Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F51C4BB3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 04:04:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GNMF5M1vzDqYW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 12:04:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GNKg2JNCzDqT4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 12:03:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GNKf54D2z9sSs;
 Tue,  5 May 2020 12:03:02 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 17/28] powerpc: Introduce a function for reporting
 instruction length
Date: Tue, 05 May 2020 12:02:59 +1000
Message-ID: <3087823.8VYvvlUQXN@townsend>
In-Reply-To: <20200501034220.8982-18-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-18-jniethe5@gmail.com>
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good,

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Friday, 1 May 2020 1:42:09 PM AEST Jordan Niethe wrote:
> Currently all instructions have the same length, but in preparation for
> prefixed instructions introduce a function for returning instruction
> length.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v6: - feature-fixups.c: do_final_fixups(): use here
>     - ppc_inst_len(): change return type from bool to int
>     - uprobes: Use ppc_inst_read() before calling ppc_inst_len()
> ---
>  arch/powerpc/include/asm/inst.h   |  5 +++++
>  arch/powerpc/kernel/kprobes.c     |  6 ++++--
>  arch/powerpc/kernel/uprobes.c     |  2 +-
>  arch/powerpc/lib/feature-fixups.c | 14 +++++++-------
>  4 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/inst.h
> b/arch/powerpc/include/asm/inst.h index 0d581b332c20..2f3c9d5bcf7c 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -17,6 +17,11 @@ static inline u32 ppc_inst_val(struct ppc_inst x)
>  	return x.val;
>  }
> 
> +static inline int ppc_inst_len(struct ppc_inst x)
> +{
> +	return sizeof(struct ppc_inst);
> +}
> +
>  static inline int ppc_inst_primary_opcode(struct ppc_inst x)
>  {
>  	return ppc_inst_val(x) >> 26;
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index a72c8e1a42ad..33d54b091c70 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -462,14 +462,16 @@ NOKPROBE_SYMBOL(trampoline_probe_handler);
>   */
>  int kprobe_post_handler(struct pt_regs *regs)
>  {
> +	int len;
>  	struct kprobe *cur = kprobe_running();
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> 
>  	if (!cur || user_mode(regs))
>  		return 0;
> 
> +	len = ppc_inst_len(ppc_inst_read((struct ppc_inst *)cur->ainsn.insn));
>  	/* make sure we got here for instruction we have a kprobe on */
> -	if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
> +	if (((unsigned long)cur->ainsn.insn + len) != regs->nip)
>  		return 0;
> 
>  	if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
> @@ -478,7 +480,7 @@ int kprobe_post_handler(struct pt_regs *regs)
>  	}
> 
>  	/* Adjust nip to after the single-stepped instruction */
> -	regs->nip = (unsigned long)cur->addr + 4;
> +	regs->nip = (unsigned long)cur->addr + len;
>  	regs->msr |= kcb->kprobe_saved_msr;
> 
>  	/*Restore back the original saved kprobes variables and continue. */
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index 6893d40a48c5..83e883e1a42d 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe,
> struct pt_regs *regs) * support doesn't exist and have to fix-up the next
> instruction * to be executed.
>  	 */
> -	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
> +	regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn));
> 
>  	user_disable_single_step(current);
>  	return 0;
> diff --git a/arch/powerpc/lib/feature-fixups.c
> b/arch/powerpc/lib/feature-fixups.c index 13ec3264a565..f4845e740338 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -390,20 +390,20 @@ void do_lwsync_fixups(unsigned long value, void
> *fixup_start, void *fixup_end) static void do_final_fixups(void)
>  {
>  #if defined(CONFIG_PPC64) && defined(CONFIG_RELOCATABLE)
> -	struct ppc_inst *src, *dest;
> -	unsigned long length;
> +	struct ppc_inst inst, *src, *dest, *end;
> 
>  	if (PHYSICAL_START == 0)
>  		return;
> 
>  	src = (struct ppc_inst *)(KERNELBASE + PHYSICAL_START);
>  	dest = (struct ppc_inst *)KERNELBASE;
> -	length = (__end_interrupts - _stext) / sizeof(struct ppc_inst);
> +	end = (void *)src + (__end_interrupts - _stext);
> 
> -	while (length--) {
> -		raw_patch_instruction(dest, ppc_inst_read(src));
> -		src++;
> -		dest++;
> +	while (src < end) {
> +		inst = ppc_inst_read(src);
> +		raw_patch_instruction(dest, inst);
> +		src = (void *)src + ppc_inst_len(inst);
> +		dest = (void *)dest + ppc_inst_len(inst);
>  	}
>  #endif
>  }




