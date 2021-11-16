Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FCF4536EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 17:08:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtrZp6WfFz3cVw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:08:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lcsOSKJZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=lcsOSKJZ; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtrZ76S9fz2yMc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 03:07:58 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id q17so17782092plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 08:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Z2AKx61/RhCe2zs5ofLjhqQARlhS43Ifv8qiPWwvU8w=;
 b=lcsOSKJZX1HW4dBg29cw5mdeiwWY+loBeYbsQV+z2/nV6RWvDRujp8jkar1j2iKk7Z
 Q7kDkSiVYol/fAQwYbdXz6fN2IlDQoEEG233LaBBpiKOliI+F4QJNkSO/vk84Grwjsg1
 xgisig77vEEa4Zd5OSZNhbkVEv6fJSGPJYnEKhE6p2XLpvSYq3J4gQzmDevLkU5rdnAI
 rP9CME4bIKDfKmH+iv15W2ZbpFgsMSUMaP9zPM2kyOtgds+U6deVQ6MfC7qosULoTu5/
 vwD7KCMHs8C2lB+vzVYl7as7WrWnO4BfhRzOPbRRQhhHWPUHJLeuyWBsJIHbOy9ux35U
 p6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z2AKx61/RhCe2zs5ofLjhqQARlhS43Ifv8qiPWwvU8w=;
 b=ZKczXbtMcCsD9VyVgQCeD2gYpGMk+Zquio76pSAN5H44FrvlY+Y5PBVOv2uF0L5DeF
 Z3E0v/d+MG8e+fc8mUhH6rYmr5jHT5Pxnd9L+MQx9jqkWGDZFp4rZx3lTJTsF2Vr49Ys
 mjUhHXETi0dUXj60ahsmgOvThFm19AcLIVlTcJokd5PYlpQG8DYTitxKu6obD0h1yZb9
 p7aYdYawH+WoeDZp3tPaYLNxXYs6+/kPPLUypE1q+mAvwGSZSqsVC/ZWjBbQvK+wV9nm
 UI3yeqnjQnSIEEq5hf0KtyOfFvtTN2gbbH1W+lqst4CG5HsRaqBIRFZiYXtc/Iw/+m/6
 adrA==
X-Gm-Message-State: AOAM530JbPxBWGaFDHmb5RPvOCPdSpYzZgHThwI0t13QxFG6TKHxZMvw
 Stk+BpS6RCSSPBhRa646cBDynQ==
X-Google-Smtp-Source: ABdhPJxU6duTqsrTks/nV5OrQqCjn8t+5rodqO/OPYPZOkqch8j1M2u2I4szhAM4KHA4Nd8M6EsWPg==
X-Received: by 2002:a17:902:7890:b0:143:c4f7:59e6 with SMTP id
 q16-20020a170902789000b00143c4f759e6mr22206936pll.87.1637078871989; 
 Tue, 16 Nov 2021 08:07:51 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id lt5sm2725151pjb.43.2021.11.16.08.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:07:51 -0800 (PST)
Date: Tue, 16 Nov 2021 16:07:47 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/5] KVM: x86: Use kvm_get_vcpu() instead of open-coded
 access
Message-ID: <YZPXU3eBT8j0fUPs@google.com>
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-5-maz@kernel.org>
 <YYWOKTYHhJywwCRk@google.com>
 <330eb780-1963-ac1f-aaad-908346112f28@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <330eb780-1963-ac1f-aaad-908346112f28@redhat.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Anup Patel <anup.patel@wdc.com>,
 Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, David Hildenbrand <david@redhat.com>,
 linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@samba.org>, James Morse <james.morse@arm.com>,
 kernel-team@android.com, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 16, 2021, Paolo Bonzini wrote:
> On 11/5/21 21:03, Sean Christopherson wrote:
> > But I think even that is flawed, as APICv can be dynamically deactivated and
> > re-activated while the VM is running, and I don't see a path that re-updates
> > the IRTE when APICv is re-activated.  So I think a more conservative check is
> > needed, e.g.
> > 
> > diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> > index 5f81ef092bd4..6cf5b2e86118 100644
> > --- a/arch/x86/kvm/vmx/posted_intr.c
> > +++ b/arch/x86/kvm/vmx/posted_intr.c
> > @@ -272,7 +272,7 @@ int pi_update_irte(struct kvm *kvm, unsigned int host_irq, uint32_t guest_irq,
> > 
> >          if (!kvm_arch_has_assigned_device(kvm) ||
> >              !irq_remapping_cap(IRQ_POSTING_CAP) ||
> > -           !kvm_vcpu_apicv_active(kvm->vcpus[0]))
> > +           !irqchip_in_kernel(kvm) || !enable_apicv)
> >                  return 0;
> > 
> >          idx = srcu_read_lock(&kvm->irq_srcu);
> 
> What happens then if pi_pre_block is called and the IRTE denotes a posted
> interrupt?
> 
> I might be wrong, but it seems to me that you have to change all of the
> occurrences this way.  As soon as enable_apicv is set, you need to go
> through the POSTED_INTR_WAKEUP_VECTOR just in case.

Sorry, I didn't grok that at all.  All occurences of what?
