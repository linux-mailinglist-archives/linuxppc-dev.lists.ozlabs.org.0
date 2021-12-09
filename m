Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D969646F335
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:34:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J92l260TQz3cPP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 05:34:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gZq6Dj67;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=paolo.bonzini@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gZq6Dj67; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J92kK5Mstz3069
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 05:34:15 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id v1so22751301edx.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 10:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VmHNjKHHTgpu8LKf+wLbu6tr5d2B6TY5WNkaxl4rmr8=;
 b=gZq6Dj67kII8EQrFcvQRrysaXkPXfgaFl8h/21JGy/fEUeqdUxugDKnd0CNL1EUdHK
 KJPwK37d4PW840KmytVunGJapbLoZk4G3qw+TbDO8UYWUa2yu8kM7BqASqD3VbTbjPSr
 uYvvS+DgMUmrivsJTJ5U61ojewQPuA8oKfTgJidcMoKvKd75dFwAseVuJPPbufqS40gT
 sn9TuVUT5jgHVAMipF5b2yN0DSs3jGlOqB8UJmtZWNWcU0Bopi2mvXa3ytZ+oA/p2nkv
 P6BXBfcqsPMiZ2N//CV0MDTVNZrb5hlDan1lqFxK+s+uKW5LM3ou1RBnyIftv4h7SWPY
 xNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VmHNjKHHTgpu8LKf+wLbu6tr5d2B6TY5WNkaxl4rmr8=;
 b=HLm+5nuynl/Q48kprtAajOffDMGnAUAz92bRvK8aVQJFYqw/w4cjmEQBlin/QPhP0b
 vr8sB7f4orCRs7umD5+QycoPiNAolKtbYWNmad3UuC1ZSC21yFFGdkDY+LK6HWs0sJ3t
 YbdHYDX1YIO9FBeiU4HiLRX1zAJ2uwlx8hjpDFTMjU3NyBTusx+tshbD0P8CNOCdtYtw
 70pFIjCIr1KvCJ2x4uXkL5O5TZf4ZOnGVvm9c2zZNcOd4MRdfGcTgJuS/RgDg5t/HTGb
 qvA88hjFEsPzI5saZs/3ZvZlNcewshXl3Bl2wYIrQaNbTaatbfxMadNR3RcwBqUz7kJW
 UBTg==
X-Gm-Message-State: AOAM530F7UxBaCo7IUuvJdq/izc/fXsphAe/DQyxhazdNcZhO8Ib6Si2
 0iyQexTgYiflXI8lkRbXg0E=
X-Google-Smtp-Source: ABdhPJzPr2JWAHHRiyW9tf+vJ9HDTL67K/LwoYescyr21dhuVB9iq2UisCXP0bQ++tHwzdvxo9UJXA==
X-Received: by 2002:a17:906:f43:: with SMTP id
 h3mr17722168ejj.414.1639074851284; 
 Thu, 09 Dec 2021 10:34:11 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id yd20sm299781ejb.47.2021.12.09.10.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 10:34:10 -0800 (PST)
Message-ID: <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
Date: Thu, 9 Dec 2021 19:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, kvm <kvm@vger.kernel.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211121125451.9489-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry for the late review...

On 11/21/21 13:54, David Woodhouse wrote:
> +EXPORT_SYMBOL_GPL(kvm_gfn_to_pfn_cache_check);
> +
> +static void __release_gpc(struct kvm *kvm, kvm_pfn_t pfn, void *khva,
> +			  gpa_t gpa, bool dirty)
> +{
> +	/* Unmap the old page if it was mapped before, and release it */
> +	if (!is_error_noslot_pfn(pfn)) {
> +		if (khva) {
> +			if (pfn_valid(pfn))
> +				kunmap(pfn_to_page(pfn));
> +#ifdef CONFIG_HAS_IOMEM
> +			else
> +				memunmap(khva);
> +#endif
> +		}

Considering that the khva is passed directly to memunmap, perhaps it's
cleaner to ensure it's page-aligned:

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 13cae72d39e9..267477bd2972 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -147,7 +147,7 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
  
  	old_gpa = gpc->gpa;
  	old_pfn = gpc->pfn;
-	old_khva = gpc->khva;
+	old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
  	old_uhva = gpc->uhva;
  	old_valid = gpc->valid;
  	old_dirty = gpc->dirty;
@@ -209,7 +209,7 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
  
  		if (gpc->kernel_map) {
  			if (new_pfn == old_pfn) {
-				new_khva = (void *)((unsigned long)old_khva - page_offset);
+				new_khva = old_khva;
  				old_pfn = KVM_PFN_ERR_FAULT;
  				old_khva = NULL;
  			} else if (pfn_valid(new_pfn)) {
@@ -265,7 +265,7 @@ void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
  
  	gpc->valid = false;
  
-	old_khva = gpc->khva;
+	old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
  	old_dirty = gpc->dirty;
  	old_gpa = gpc->gpa;
  	old_pfn = gpc->pfn;


> 
> +	retry_map:
> +		mmu_seq = kvm->mmu_notifier_seq;
> +		smp_rmb();
> +
> +		/* We always request a writeable mapping */
> +		new_pfn = hva_to_pfn(uhva, false, NULL, true, NULL);
> +		if (is_error_noslot_pfn(new_pfn)) {
> +			ret = -EFAULT;
> +			goto map_done;
> +		}
> +
> +		KVM_MMU_READ_LOCK(kvm);
> +		retry = mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
> +		KVM_MMU_READ_UNLOCK(kvm);
> +		if (retry) {
> +			cond_resched();
> +			goto retry_map;
> +		}
> +

This should also be a separate function, like

static kvm_pfn_t hva_to_pfn_retry(unsigned long uhva)
{
         kvm_pfn_t new_pfn
         unsigned long mmu_seq;
         int retry;

retry_map:
         mmu_seq = kvm->mmu_notifier_seq;
         smp_rmb();

         /* We always request a writeable mapping */
         new_pfn = hva_to_pfn(uhva, false, NULL, true, NULL);
         if (is_error_noslot_pfn(new_pfn))
                 return new_pfn;

         KVM_MMU_READ_LOCK(kvm);
         retry = mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
         KVM_MMU_READ_UNLOCK(kvm);
         if (retry) {
                 cond_resched();
                 goto retry_map;
         }
         return new_pfn;
}

> 
> +		write_lock_irq(&gpc->lock);
> +		if (ret) {
> +			gpc->valid = false;
> +			gpc->pfn = KVM_PFN_ERR_FAULT;
> +			gpc->khva = NULL;
> +		} else {
> +			/* At this point, gpc->valid may already have been cleared */
> +			gpc->pfn = new_pfn;
> +			gpc->khva = new_khva + page_offset;
> +		}

Should set gpc->khva only if new_khva != NULL (i.e. only if gpc->kernel_map
is true).

Paolo
