Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A6C204E45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 11:44:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rhFX0H0JzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 19:44:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZLG5dtpw; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZLG5dtpw; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rhCY4MPgzDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 19:42:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592905366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoBwKmjOvInG9MfmBsLrqKkfpaZqKCYNSmoYTUfOHHE=;
 b=ZLG5dtpwtkla4mBaG6iRidFYELlZHLyhe/p1NVi5lAT0wiv+Gmd3Gpq3DSWqkokcxObDjK
 5HC4fGF9K6YFQ6AejRE/azWMsUlHdAAbQOYiKKHITil85dPqBWig1MM7ugM2vpSXnRSoQ6
 7HCVBGjwdnIm/SaxpmCf1i40hMbeb1Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592905366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoBwKmjOvInG9MfmBsLrqKkfpaZqKCYNSmoYTUfOHHE=;
 b=ZLG5dtpwtkla4mBaG6iRidFYELlZHLyhe/p1NVi5lAT0wiv+Gmd3Gpq3DSWqkokcxObDjK
 5HC4fGF9K6YFQ6AejRE/azWMsUlHdAAbQOYiKKHITil85dPqBWig1MM7ugM2vpSXnRSoQ6
 7HCVBGjwdnIm/SaxpmCf1i40hMbeb1Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-JT9VLAufN5u2I7HTHYVhNQ-1; Tue, 23 Jun 2020 05:42:42 -0400
X-MC-Unique: JT9VLAufN5u2I7HTHYVhNQ-1
Received: by mail-wr1-f72.google.com with SMTP id g14so7829790wrp.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 02:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QoBwKmjOvInG9MfmBsLrqKkfpaZqKCYNSmoYTUfOHHE=;
 b=tVBuRnRMi1D9tyFtg6WShrRsNcnbjvNsvSJEMk/buKbNOiEjB8fyL+uagbDwMFEpS8
 DcsI1FdWHtlfJzc2lFNgE5QoKoEhVguZ3cZRRQCxo2CRXS0bpr28kMobzcvdkVYfCxbu
 oTdt0c3A9ajgucAo4NUVv1LNJk8PKdKnDjAs90vGwa0OYuOY88d1aL1k12IG+unokOTe
 r0ZdrPIKaPrzxiMOi8+TxAL1soWVHqi25Trbm/rQ1gB3elCF2oT9XgQfqY8CdrF0hVa/
 2p9SU221HPMcK3Xm4zUz6N4WMJmf+TN703KukGZS8glRfgjiF7tkkLL/0wh/GHqYezrG
 M0VQ==
X-Gm-Message-State: AOAM531d8UjvA+dctd9k9BUiyEuxmi9ULj4axVBq7A/JAP+s0Yz6rbMj
 a62PlP7Q/Ev9SRiPINX7bfwS6t0eOQEQg7n3KExGuQbuX5mE0b+tUjCJFPcxYCvRi1rjPl7uQfm
 NzGf8zRD7sWkBVeMrMVpc4b5Lvw==
X-Received: by 2002:adf:e908:: with SMTP id f8mr1064528wrm.3.1592905361579;
 Tue, 23 Jun 2020 02:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYpabjIXBcOB9eaiLhNkEzAaSPqokuBtil8iucj5gBxqX45bVu6WVMKG+2KSXPDnKUswgA9A==
X-Received: by 2002:adf:e908:: with SMTP id f8mr1064490wrm.3.1592905361326;
 Tue, 23 Jun 2020 02:42:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:fd64:dd90:5ad5:d2e1?
 ([2001:b07:6468:f312:fd64:dd90:5ad5:d2e1])
 by smtp.gmail.com with ESMTPSA id 26sm1149131wmj.25.2020.06.23.02.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 02:42:40 -0700 (PDT)
Subject: Re: [PATCH v4 0/7] clean up redundant 'kvm_run' parameters
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
 chenhuacai@gmail.com
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fe463233-d094-fca5-b4e9-c1d97124fd69@redhat.com>
Date: Tue, 23 Jun 2020 11:42:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/04/20 06:35, Tianjia Zhang wrote:
> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> structure. For historical reasons, many kvm-related function parameters
> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
> patch does a unified cleanup of these remaining redundant parameters.
> 
> This series of patches has completely cleaned the architecture of
> arm64, mips, ppc, and s390 (no such redundant code on x86). Due to
> the large number of modified codes, a separate patch is made for each
> platform. On the ppc platform, there is also a redundant structure
> pointer of 'kvm_run' in 'vcpu_arch', which has also been cleaned
> separately.

Tianjia, can you please refresh the patches so that each architecture
maintainer can pick them up?  Thanks very much for this work!

Paolo

> 
> ---
> v4 change:
>   mips: fixes two errors in entry.c.
> 
> v3 change:
>   Keep the existing `vcpu->run` in the function body unchanged.
> 
> v2 change:
>   s390 retains the original variable name and minimizes modification.
> 
> Tianjia Zhang (7):
>   KVM: s390: clean up redundant 'kvm_run' parameters
>   KVM: arm64: clean up redundant 'kvm_run' parameters
>   KVM: PPC: Remove redundant kvm_run from vcpu_arch
>   KVM: PPC: clean up redundant 'kvm_run' parameters
>   KVM: PPC: clean up redundant kvm_run parameters in assembly
>   KVM: MIPS: clean up redundant 'kvm_run' parameters
>   KVM: MIPS: clean up redundant kvm_run parameters in assembly
> 
>  arch/arm64/include/asm/kvm_coproc.h      |  12 +--
>  arch/arm64/include/asm/kvm_host.h        |  11 +--
>  arch/arm64/include/asm/kvm_mmu.h         |   2 +-
>  arch/arm64/kvm/handle_exit.c             |  36 +++----
>  arch/arm64/kvm/sys_regs.c                |  13 ++-
>  arch/mips/include/asm/kvm_host.h         |  32 +------
>  arch/mips/kvm/emulate.c                  |  59 ++++--------
>  arch/mips/kvm/entry.c                    |  21 ++---
>  arch/mips/kvm/mips.c                     |  14 +--
>  arch/mips/kvm/trap_emul.c                | 114 ++++++++++-------------
>  arch/mips/kvm/vz.c                       |  26 ++----
>  arch/powerpc/include/asm/kvm_book3s.h    |  16 ++--
>  arch/powerpc/include/asm/kvm_host.h      |   1 -
>  arch/powerpc/include/asm/kvm_ppc.h       |  27 +++---
>  arch/powerpc/kvm/book3s.c                |   4 +-
>  arch/powerpc/kvm/book3s.h                |   2 +-
>  arch/powerpc/kvm/book3s_64_mmu_hv.c      |  12 +--
>  arch/powerpc/kvm/book3s_64_mmu_radix.c   |   4 +-
>  arch/powerpc/kvm/book3s_emulate.c        |  10 +-
>  arch/powerpc/kvm/book3s_hv.c             |  64 ++++++-------
>  arch/powerpc/kvm/book3s_hv_nested.c      |  12 +--
>  arch/powerpc/kvm/book3s_interrupts.S     |  17 ++--
>  arch/powerpc/kvm/book3s_paired_singles.c |  72 +++++++-------
>  arch/powerpc/kvm/book3s_pr.c             |  33 ++++---
>  arch/powerpc/kvm/booke.c                 |  39 ++++----
>  arch/powerpc/kvm/booke.h                 |   8 +-
>  arch/powerpc/kvm/booke_emulate.c         |   2 +-
>  arch/powerpc/kvm/booke_interrupts.S      |   9 +-
>  arch/powerpc/kvm/bookehv_interrupts.S    |  10 +-
>  arch/powerpc/kvm/e500_emulate.c          |  15 ++-
>  arch/powerpc/kvm/emulate.c               |  10 +-
>  arch/powerpc/kvm/emulate_loadstore.c     |  32 +++----
>  arch/powerpc/kvm/powerpc.c               |  72 +++++++-------
>  arch/powerpc/kvm/trace_hv.h              |   6 +-
>  arch/s390/kvm/kvm-s390.c                 |  23 +++--
>  virt/kvm/arm/arm.c                       |   6 +-
>  virt/kvm/arm/mmio.c                      |  11 ++-
>  virt/kvm/arm/mmu.c                       |   5 +-
>  38 files changed, 392 insertions(+), 470 deletions(-)
> 

