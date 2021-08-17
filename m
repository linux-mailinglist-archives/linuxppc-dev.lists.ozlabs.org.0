Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499B33EEA7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 12:02:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpmms0gJWz3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 20:02:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=fSXk9kI1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=fSXk9kI1; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpmm731LXz304R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 20:02:10 +1000 (AEST)
Received: from zn.tnic (p200300ec2f1175001ae0093e4550657c.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f11:7500:1ae0:93e:4550:657c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 57D521EC054F;
 Tue, 17 Aug 2021 12:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1629194518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=WTPf14ct0XA4iOYwdI5oL7MvZipF8JjQX6hZ6lRE9MY=;
 b=fSXk9kI1A4dqwAfQ2WDnRaBmlG6VM+SiBeMVvip4VZs3w5s1AzSaytXWQQ5Yn8ealzmvXH
 KdrTT1+QlW923OfJovhcp46q+BWi+Do6B8wIFr88BWgiJmyPQxnoxaRFFymeYKfWAJB7a5
 8hnATecakWJhm6ba4VFjUkS+uTtiwBI=
Date: Tue, 17 Aug 2021 12:02:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v2 06/12] x86/sev: Replace occurrences of sev_active()
 with prot_guest_has()
Message-ID: <YRuJPqxFZ6ItZd++@zn.tnic>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <2b3a8fc4659f2e7617399cecdcca549e0fa1dcb7.1628873970.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b3a8fc4659f2e7617399cecdcca549e0fa1dcb7.1628873970.git.thomas.lendacky@amd.com>
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Joerg Roedel <jroedel@suse.de>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 11:59:25AM -0500, Tom Lendacky wrote:
> diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
> index 8e7b517ad738..66ff788b79c9 100644
> --- a/arch/x86/kernel/machine_kexec_64.c
> +++ b/arch/x86/kernel/machine_kexec_64.c
> @@ -167,7 +167,7 @@ static int init_transition_pgtable(struct kimage *image, pgd_t *pgd)
>  	}
>  	pte = pte_offset_kernel(pmd, vaddr);
>  
> -	if (sev_active())
> +	if (prot_guest_has(PATTR_GUEST_MEM_ENCRYPT))
>  		prot = PAGE_KERNEL_EXEC;
>  
>  	set_pte(pte, pfn_pte(paddr >> PAGE_SHIFT, prot));
> @@ -207,7 +207,7 @@ static int init_pgtable(struct kimage *image, unsigned long start_pgtable)
>  	level4p = (pgd_t *)__va(start_pgtable);
>  	clear_page(level4p);
>  
> -	if (sev_active()) {
> +	if (prot_guest_has(PATTR_GUEST_MEM_ENCRYPT)) {
>  		info.page_flag   |= _PAGE_ENC;
>  		info.kernpg_flag |= _PAGE_ENC;
>  	}
> @@ -570,12 +570,12 @@ void arch_kexec_unprotect_crashkres(void)
>   */
>  int arch_kexec_post_alloc_pages(void *vaddr, unsigned int pages, gfp_t gfp)
>  {
> -	if (sev_active())
> +	if (!prot_guest_has(PATTR_HOST_MEM_ENCRYPT))
>  		return 0;
>  
>  	/*
> -	 * If SME is active we need to be sure that kexec pages are
> -	 * not encrypted because when we boot to the new kernel the
> +	 * If host memory encryption is active we need to be sure that kexec
> +	 * pages are not encrypted because when we boot to the new kernel the
>  	 * pages won't be accessed encrypted (initially).
>  	 */

That hunk belongs logically into the previous patch which removes
sme_active().

>  	return set_memory_decrypted((unsigned long)vaddr, pages);
> @@ -583,12 +583,12 @@ int arch_kexec_post_alloc_pages(void *vaddr, unsigned int pages, gfp_t gfp)
>  
>  void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages)
>  {
> -	if (sev_active())
> +	if (!prot_guest_has(PATTR_HOST_MEM_ENCRYPT))
>  		return;
>  
>  	/*
> -	 * If SME is active we need to reset the pages back to being
> -	 * an encrypted mapping before freeing them.
> +	 * If host memory encryption is active we need to reset the pages back
> +	 * to being an encrypted mapping before freeing them.
>  	 */
>  	set_memory_encrypted((unsigned long)vaddr, pages);
>  }
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index e8ccab50ebf6..b69f5ac622d5 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -25,6 +25,7 @@
>  #include <linux/pagemap.h>
>  #include <linux/swap.h>
>  #include <linux/rwsem.h>
> +#include <linux/protected_guest.h>
>  
>  #include <asm/apic.h>
>  #include <asm/perf_event.h>
> @@ -457,7 +458,7 @@ static int has_svm(void)
>  		return 0;
>  	}
>  
> -	if (sev_active()) {
> +	if (prot_guest_has(PATTR_SEV)) {
>  		pr_info("KVM is unsupported when running as an SEV guest\n");
>  		return 0;

Same question as for PATTR_SME. PATTR_GUEST_MEM_ENCRYPT should be enough.

> @@ -373,7 +373,7 @@ int __init early_set_memory_encrypted(unsigned long vaddr, unsigned long size)
>   * up under SME the trampoline area cannot be encrypted, whereas under SEV
>   * the trampoline area must be encrypted.
>   */
> -bool sev_active(void)
> +static bool sev_active(void)
>  {
>  	return sev_status & MSR_AMD64_SEV_ENABLED;
>  }
> @@ -382,7 +382,6 @@ static bool sme_active(void)
>  {
>  	return sme_me_mask && !sev_active();
>  }
> -EXPORT_SYMBOL_GPL(sev_active);

Just get rid of it altogether.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
