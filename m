Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E907453813
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 17:49:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtsV12HRGz2yn3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jJN3kVw3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jJN3kVw3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jJN3kVw3; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=jJN3kVw3; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtsTF595Mz2yMx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 03:48:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637081323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cg0A/Tqzd8C8bvQHxDRqW8bNEhwYvKBZVV4KLqiN8xQ=;
 b=jJN3kVw3+ON2ldh0vqS6JajVRz/XTjiOc/pK69L6risdwCZhzNEwfYKhlduGkswFZsnRxK
 fEfliXmNAzNYGTSshiEw5tuMvO+MOrVi7aJWL8E3/sRHp8AH4VA3jofAEgsnMSDoKuPpNz
 cuvn2NjMtOYrmpafaZLQBDNWHmnlhmU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637081323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cg0A/Tqzd8C8bvQHxDRqW8bNEhwYvKBZVV4KLqiN8xQ=;
 b=jJN3kVw3+ON2ldh0vqS6JajVRz/XTjiOc/pK69L6risdwCZhzNEwfYKhlduGkswFZsnRxK
 fEfliXmNAzNYGTSshiEw5tuMvO+MOrVi7aJWL8E3/sRHp8AH4VA3jofAEgsnMSDoKuPpNz
 cuvn2NjMtOYrmpafaZLQBDNWHmnlhmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-p3SenisWPY62m1a-Emj8qQ-1; Tue, 16 Nov 2021 11:48:39 -0500
X-MC-Unique: p3SenisWPY62m1a-Emj8qQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F53487D542;
 Tue, 16 Nov 2021 16:48:37 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 757005FC13;
 Tue, 16 Nov 2021 16:48:20 +0000 (UTC)
Message-ID: <58fcf40e-75f5-f092-5aee-29d018f6bf67@redhat.com>
Date: Tue, 16 Nov 2021 17:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/5] KVM: x86: Use kvm_get_vcpu() instead of open-coded
 access
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-5-maz@kernel.org> <YYWOKTYHhJywwCRk@google.com>
 <330eb780-1963-ac1f-aaad-908346112f28@redhat.com>
 <YZPXU3eBT8j0fUPs@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YZPXU3eBT8j0fUPs@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On 11/16/21 17:07, Sean Christopherson wrote:
>>>           if (!kvm_arch_has_assigned_device(kvm) ||
>>>               !irq_remapping_cap(IRQ_POSTING_CAP) ||
>>> -           !kvm_vcpu_apicv_active(kvm->vcpus[0]))
>>> +           !irqchip_in_kernel(kvm) || !enable_apicv)
>>>                   return 0;
>>>
>>>           idx = srcu_read_lock(&kvm->irq_srcu);
>> What happens then if pi_pre_block is called and the IRTE denotes a posted
>> interrupt?
>>
>> I might be wrong, but it seems to me that you have to change all of the
>> occurrences this way.  As soon as enable_apicv is set, you need to go
>> through the POSTED_INTR_WAKEUP_VECTOR just in case.
> Sorry, I didn't grok that at all.  All occurences of what?

Of the !assigned-device || !VTd-PI || !kvm_vcpu_apicv_active(vcpu) 
checks.  This way, CPUs are woken up correctly even if you have 
!kvm_vcpu_apicv_active(vcpu) but the IRTE is a posted-interrupt one.

Paolo

