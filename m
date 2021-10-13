Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1064842BB94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:30:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTnMX4nMmz3bXR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 20:30:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P4YhDaHJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P4YhDaHJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=P4YhDaHJ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=P4YhDaHJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTnLr6y64z2yQm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 20:30:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634117406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjFKZdAkzPM6kA0DElv7KLx9JGj1opCMkKpXv5IVjds=;
 b=P4YhDaHJEuKvp10tgKg3+Kxf8olg4BF6lOGkPG/UOMmsu/Nh+v/iYL/+L6jZ53jzuRqvrQ
 +vSWvHoSbnGaLMNiQD/YIC+AWMXbLgmCYA7HHQp4H6XRdTf9eywRbkF8dm5YAM+qo4WJLj
 XDFn54+buUZ5Pl4MgLTmzasKIuIkslg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634117406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjFKZdAkzPM6kA0DElv7KLx9JGj1opCMkKpXv5IVjds=;
 b=P4YhDaHJEuKvp10tgKg3+Kxf8olg4BF6lOGkPG/UOMmsu/Nh+v/iYL/+L6jZ53jzuRqvrQ
 +vSWvHoSbnGaLMNiQD/YIC+AWMXbLgmCYA7HHQp4H6XRdTf9eywRbkF8dm5YAM+qo4WJLj
 XDFn54+buUZ5Pl4MgLTmzasKIuIkslg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-YOt3-vc3Pw66f8R8i79afg-1; Wed, 13 Oct 2021 05:30:04 -0400
X-MC-Unique: YOt3-vc3Pw66f8R8i79afg-1
Received: by mail-wr1-f72.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so1454396wrc.22
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 02:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZjFKZdAkzPM6kA0DElv7KLx9JGj1opCMkKpXv5IVjds=;
 b=Yb9ASjXnYE1U3cqH6VzK8m1f3Ip5QSwOPQyDVrWbXGMIelIjgMvzh/rIcoh9hH9Sas
 +n/ax3ivgwWxlmnMpE+psTlFIcjCPciVqmTzb3LplFfm76UFrlOcDLojF26q6sC4nI4c
 HjZUkRl1vEM5adLbzB/Oi+deD1Nz7MRF+jaktEsKNC0ZoWAu1Gac//DrnHsTfBfYRYDx
 sGabYjkOKDE0ZySgJym2SIjxziiRXOjCf0lYJ7rO5HKoM7mQpDCbJDqo6r45zBv2u21k
 hm4I9M224d3/xsK3ub4cSMLexjPBav6xf5MTE5kPE0nZmGj8yOFgiMZCfU4Rvyef83Zn
 pNeA==
X-Gm-Message-State: AOAM530yZ1LCTdOpKcnkOazZ6e/2IaX2MX0gXrLiIp1QQ2wXhfOwhF+d
 9L4+HQ+SGoGDuEWmsmMujJ5d4tgjk/3qL+mOPg6umTE9eLq89+G7uKVmH7GCRRG/u7gPSXmplHY
 E/jFkTQjELOC5Tvvu4xkT+pFcpg==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr11752836wmb.136.1634117402776; 
 Wed, 13 Oct 2021 02:30:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9gTLzJcIp/yrU6EoIVb6qauYFuyxecxt8Qxs8z4PtL5mkOqc+Jp//TvYKtW53QKGayzslJQ==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr11752794wmb.136.1634117402420; 
 Wed, 13 Oct 2021 02:30:02 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.24.54])
 by smtp.gmail.com with ESMTPSA id e16sm11103886wrw.17.2021.10.13.02.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 02:30:02 -0700 (PDT)
Message-ID: <d7f59d0e-eac2-7978-4067-9258c8b1aefe@redhat.com>
Date: Wed, 13 Oct 2021 11:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] KVM: PPC: Defer vtime accounting 'til after IRQ
 handling
To: Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org
References: <20211007142856.41205-1-lvivier@redhat.com>
 <875yu17rxk.fsf@mpe.ellerman.id.au>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <875yu17rxk.fsf@mpe.ellerman.id.au>
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
Cc: Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/10/2021 01:18, Michael Ellerman wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
>> Commit 112665286d08 moved guest_exit() in the interrupt protected
>> area to avoid wrong context warning (or worse), but the tick counter
>> cannot be updated and the guest time is accounted to the system time.
>>
>> To fix the problem port to POWER the x86 fix
>> 160457140187 ("Defer vtime accounting 'til after IRQ handling"):
>>
>> "Defer the call to account guest time until after servicing any IRQ(s)
>>   that happened in the guest or immediately after VM-Exit.  Tick-based
>>   accounting of vCPU time relies on PF_VCPU being set when the tick IRQ
>>   handler runs, and IRQs are blocked throughout the main sequence of
>>   vcpu_enter_guest(), including the call into vendor code to actually
>>   enter and exit the guest."
>>
>> Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs")
>> Cc: npiggin@gmail.com
>> Cc: <stable@vger.kernel.org> # 5.12
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>
>> Notes:
>>      v2: remove reference to commit 61bd0f66ff92
>>          cc stable 5.12
>>          add the same comment in the code as for x86
>>
>>   arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 2acb1c96cfaf..a694d1a8f6ce 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
> ...
>> @@ -4506,13 +4514,21 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
>> +	/*
>> +	 * Wait until after servicing IRQs to account guest time so that any
>> +	 * ticks that occurred while running the guest are properly accounted
>> +	 * to the guest.  Waiting until IRQs are enabled degrades the accuracy
>> +	 * of accounting via context tracking, but the loss of accuracy is
>> +	 * acceptable for all known use cases.
>> +	 */
>> +	vtime_account_guest_exit();
> 
> This pops a warning for me, running guest(s) on Power8:
>   
>    [  270.745303][T16661] ------------[ cut here ]------------
>    [  270.745374][T16661] WARNING: CPU: 72 PID: 16661 at arch/powerpc/kernel/time.c:311 vtime_account_kernel+0xe0/0xf0

Thank you, I missed that...

My patch is wrong, I have to add vtime_account_guest_exit() before the local_irq_enable().

arch/powerpc/kernel/time.c

  305 static unsigned long vtime_delta(struct cpu_accounting_data *acct,
  306                                  unsigned long *stime_scaled,
  307                                  unsigned long *steal_time)
  308 {
  309         unsigned long now, stime;
  310
  311         WARN_ON_ONCE(!irqs_disabled());
...

But I don't understand how ticks can be accounted now if irqs are still disabled.

Not sure it is as simple as expected...

Thanks,
Laurent

