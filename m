Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4482A5BA92C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 11:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTT3q4qGRz3br0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 19:17:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=misterjones.org header.i=@misterjones.org header.a=rsa-sha256 header.s=dkim20211231 header.b=vw30vGqb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=misterjones.org (client-ip=51.254.78.96; helo=disco-boy.misterjones.org; envelope-from=maz@misterjones.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=misterjones.org header.i=@misterjones.org header.a=rsa-sha256 header.s=dkim20211231 header.b=vw30vGqb;
	dkim-atps=neutral
X-Greylist: delayed 925 seconds by postgrey-1.36 at boromir; Fri, 16 Sep 2022 19:16:32 AEST
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTT342vx0z2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 19:16:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=misterjones.org; s=dkim20211231; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WpOIYPFmZvX+Hf2mD/HENyssqGqbLDXFAm0gYQobp9o=; b=vw30vGqbyjYmaM3nKnskMxB/y+
	lw/jA0e/qsYeOLKWeB+M9pBy79w1bxVNFdGPnj1q7bDvJSGbFGE9g/6/s3WogeA7TOX1YXUyGg1x0
	pTlP11nDz1yB2tnWgOoUfZONTyL1unFVmhgDysLveBpkJ7DtJcohL8NqRL+bFBB7z/KUIt+Jg8S7L
	/g0VlHBwX0VvkVE6n9reRzOGt0hMoehxgxc6H3FCI/q3fovs9/b6nZbmWJpwad6zQ2KeRKuGadLzE
	9DCBQxYnOHWwYY4Gvcv0wEak1BiL7zsNN0+ZPOQ2niZSKo3HdGerEmF7aAZ8QPwNPdyuKP+AkoKqD
	y63NDfkw==;
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@misterjones.org>)
	id 1oZ7DJ-00AZwo-Lg;
	Fri, 16 Sep 2022 10:00:45 +0100
MIME-Version: 1.0
Date: Fri, 16 Sep 2022 10:00:45 +0100
From: Marc Zyngier <maz@misterjones.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform
 dependent
In-Reply-To: <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
References: <20220504074807.3616813-1-aik@ozlabs.ru>
 <0d4bb0fa-10c6-3f5a-34c8-293144b3fdbb@ozlabs.ru>
 <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <4884805567a0288ab1dbefb8aec819a2@misterjones.org>
X-Sender: maz@misterjones.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: aik@ozlabs.ru, kvm-ppc@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, farosas@linux.ibm.com, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williamson@redhat.com, kvm-riscv@lists.infradead.org, pbonzini@redhat.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-09-13 13:50, Alexey Kardashevskiy wrote:
> Ping? It's been a while and probably got lost :-/
> 
> On 18/05/2022 16:27, Alexey Kardashevskiy wrote:
>> 
>> 
>> On 5/4/22 17:48, Alexey Kardashevskiy wrote:
>>> When introduced, IRQFD resampling worked on POWER8 with XICS. However
>>> KVM on POWER9 has never implemented it - the compatibility mode code
>>> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the 
>>> native
>>> XIVE mode does not handle INTx in KVM at all.
>>> 
>>> This moved the capability support advertising to platforms and stops
>>> advertising it on XIVE, i.e. POWER9 and later.
>>> 
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>> 
>>> 
>>> Or I could move this one together with KVM_CAP_IRQFD. Thoughts?
>> 
>> 
>> Ping?
>> 
>>> 
>>> ---
>>>   arch/arm64/kvm/arm.c       | 3 +++
>>>   arch/mips/kvm/mips.c       | 3 +++
>>>   arch/powerpc/kvm/powerpc.c | 6 ++++++
>>>   arch/riscv/kvm/vm.c        | 3 +++
>>>   arch/s390/kvm/kvm-s390.c   | 3 +++
>>>   arch/x86/kvm/x86.c         | 3 +++
>>>   virt/kvm/kvm_main.c        | 1 -
>>>   7 files changed, 21 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index 523bc934fe2f..092f0614bae3 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -210,6 +210,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>>> long ext)
>>>       case KVM_CAP_SET_GUEST_DEBUG:
>>>       case KVM_CAP_VCPU_ATTRIBUTES:
>>>       case KVM_CAP_PTP_KVM:
>>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>>> +    case KVM_CAP_IRQFD_RESAMPLE:
>>> +#endif

I don't mind moving this around, but I object to the #ifdefery.

This option is always selected on arm64, so it can safely be added
to the list without any condition.

Thanks,

         M.
-- 
Who you jivin' with that Cosmik Debris?
