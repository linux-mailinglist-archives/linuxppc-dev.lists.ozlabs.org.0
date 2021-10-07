Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 402DB42548B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 15:46:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQCJr149Vz3bhC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 00:46:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JljdMGOo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FWPeX95A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JljdMGOo; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FWPeX95A; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQCJ46xbGz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 00:45:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633614317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6usspG94A1kNlqd/WFrWFDCc16P7tAqSAi+n+Gy8zoU=;
 b=JljdMGOo7E0/vxc0zmUW1Si13ii92oiuGtCr7zPsYZYcs2KLRgBJcyOfs6LD6G3uNq81GW
 ATZ1RiuwEfCAgCw2ciT4tjEVzvm8EVaUfpBsW0EmazXUBYJ0EegzP6BwqkBzr5hXyipHlz
 HNXabuiwL8XsblUICuik7du4DjacDAA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633614318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6usspG94A1kNlqd/WFrWFDCc16P7tAqSAi+n+Gy8zoU=;
 b=FWPeX95ARzuRE9XEbWHMuNFqAJYLUonkIFEyZKI5tOn3MQvTRDjPixBbLtYS1Xs4o1mIZ/
 kG00kwnIOVqJ+0GbJjEveQ8EDBuP0KLkXQQ1y8lrybsv0FvBF9NxGXR/uDZGPIPEHnQ4UO
 r5xRo2R3y3N7PimRROL2hVvy7gl+yUA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-nyWWuFm8OPCLgFZbKzQocQ-1; Thu, 07 Oct 2021 09:45:16 -0400
X-MC-Unique: nyWWuFm8OPCLgFZbKzQocQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so4731704wrv.19
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Oct 2021 06:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6usspG94A1kNlqd/WFrWFDCc16P7tAqSAi+n+Gy8zoU=;
 b=0fsZ7/mK0nfIm+OJMiNGw1fVKdlmBgWtlaA0WCX5+iKggXwPwEwgdJkdHhlJtXC/Bc
 f66QGOdMOpyWJIoipymsuj+CyH8uqCsSFGnqaw/7afI/ETNBXy3qQp7neNtrk4131MAs
 dIeGUzaaVgjK3ihu3RhMv9Th7/Wz7UiLYdSGUdd1u2EnlMahvcVdW76Bc7KQ0rWc1VtY
 roiSCU0x6MLvKD4hR8mIDP/DTyugRIlHEur3GCRGYJsVOGyOo2oEaKovYldGHnecaPVb
 w1llGOBAvv9N8Q6IMkH2SnpKD7VXpc0GLhi0R/Kds1OVnsXToww98E8J43zZ2jlpqBzI
 aFRQ==
X-Gm-Message-State: AOAM530S4+d9jhJePsXW/6AxUMeF4F9Q2phMxiJlrLe89pgmrIFCbHnN
 bO/GvG1dZvrq802ZxlkHlPy5CYnS+MKy1Zky8c0qdLfkvkpfIkV8ascAqBqdRVaiVZNQvgIOWlR
 xsMiYqzULIifoz79F2SYa3Y6SrA==
X-Received: by 2002:adf:bb08:: with SMTP id r8mr5750701wrg.222.1633614315039; 
 Thu, 07 Oct 2021 06:45:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5grJqb2V1AulhcQfdWUkwxLsq/AzMT1s5kA3HVmlm1/7Jko50u59wnpZfc6iu0gGMemasiQ==
X-Received: by 2002:adf:bb08:: with SMTP id r8mr5750665wrg.222.1633614314742; 
 Thu, 07 Oct 2021 06:45:14 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.3.114])
 by smtp.gmail.com with ESMTPSA id a81sm1300665wmd.30.2021.10.07.06.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:45:14 -0700 (PDT)
Message-ID: <1bc32339-b786-99bd-d49c-ad19ac7ce29b@redhat.com>
Date: Thu, 7 Oct 2021 15:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] KVM: PPC: Defer vtime accounting 'til after IRQ handling
To: Greg Kurz <groug@kaod.org>
References: <20211006073745.82109-1-lvivier@redhat.com>
 <20211006124204.4741bb5c@bahia.huguette>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211006124204.4741bb5c@bahia.huguette>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/10/2021 12:42, Greg Kurz wrote:
> On Wed,  6 Oct 2021 09:37:45 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
> 
>> Commit 61bd0f66ff92 has moved guest_enter() out of the interrupt
>> protected area to be able to have updated tick counters, but
>> commit 112665286d08 moved back to this area to avoid wrong
>> context warning (or worse).
>>
>> None of them are correct, to fix the problem port to POWER
>> the x86 fix 160457140187 ("KVM: x86: Defer vtime accounting 'til
>> after IRQ handling"):
>>
>> "Defer the call to account guest time until after servicing any IRQ(s)
>>   that happened in the guest or immediately after VM-Exit.  Tick-based
>>   accounting of vCPU time relies on PF_VCPU being set when the tick IRQ
>>   handler runs, and IRQs are blocked throughout the main sequence of
>>   vcpu_enter_guest(), including the call into vendor code to actually
>>   enter and exit the guest."
>>
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2009312
>> Fixes: 61bd0f66ff92 ("KVM: PPC: Book3S HV: Fix guest time accounting with VIRT_CPU_ACCOUNTING_GEN")
> 
> This patch was merged in linux 4.16 and thus is on the 4.16.y
> stable branch and it was backported to stable 4.14.y. It would
> make sense to Cc: stable # v4.14 also, but...
> 
>> Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs")
> 
> ... this one, which was merged in linux 5.12, was never backported
> anywhere because it wasn't considered as a fix, as commented here:
> 
> https://lore.kernel.org/linuxppc-dev/1610793296.fjhomer31g.astroid@bobo.none/
> 
> AFAICT commit 61bd0f66ff92 was never mentioned anywhere in a bug. The
> first Fixes: tag thus looks a bit misleading. I'd personally drop it
> and Cc: stable # v5.12.
>

Ok, I update the comment.

>> Cc: npiggin@gmail.com
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 2acb1c96cfaf..43e1ce853785 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -3695,6 +3695,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
>>   
>>   	srcu_read_unlock(&vc->kvm->srcu, srcu_idx);
>>   
>> +	context_tracking_guest_exit();
>> +
>>   	set_irq_happened(trap);
>>   
>>   	spin_lock(&vc->lock);
>> @@ -3726,9 +3728,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
>>   
>>   	kvmppc_set_host_core(pcpu);
>>   
>> -	guest_exit_irqoff();
>> -
> 
> 
> Change looks ok but it might be a bit confusing for the
> occasional reader that guest_enter_irqoff() isn't matched
> by a guest_exit_irqoff().
> 
>>   	local_irq_enable();
>> +	vtime_account_guest_exit();
>>   
> 
> Maybe add a comment like in x86 ?
> 

done

>>   	/* Let secondaries go back to the offline loop */
>>   	for (i = 0; i < controlled_threads; ++i) {
>> @@ -4506,13 +4507,14 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>>   
>>   	srcu_read_unlock(&kvm->srcu, srcu_idx);
>>   
>> +	context_tracking_guest_exit();
>> +
>>   	set_irq_happened(trap);
>>   
>>   	kvmppc_set_host_core(pcpu);
>>   
>> -	guest_exit_irqoff();
>> -
>>   	local_irq_enable();
>> +	vtime_account_guest_exit();
>>   
>>   	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
>>   
> 
> Same remarks. FWIW a followup was immediately added to x86 to
> encapsulate the enter/exit logic in common helpers :
> 
> ommit bc908e091b3264672889162733020048901021fb
> Author: Sean Christopherson <seanjc@google.com>
> Date:   Tue May 4 17:27:35 2021 -0700
> 
>      KVM: x86: Consolidate guest enter/exit logic to common helpers
> 
> This makes the code nicer. Maybe do something similar for POWER ?

I don't like to modify kernel code when it's not needed. I just want to fix a bug, if 
someone wants this nicer I let this to him...

Thanks,
Laurent

