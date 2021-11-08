Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23912447BBB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 09:23:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnkfH0RsKz305X
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 19:23:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hnkdm4zmmz2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 19:23:24 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 972326124D;
 Mon,  8 Nov 2021 08:23:21 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mjzvz-0046FA-EY; Mon, 08 Nov 2021 08:23:19 +0000
MIME-Version: 1.0
Date: Mon, 08 Nov 2021 08:23:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 5/5] KVM: Convert the kvm->vcpus array to a xarray
In-Reply-To: <87mtmhec88.wl-maz@kernel.org>
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-6-maz@kernel.org> <YYWSUJ1qzhfqjQow@google.com>
 <87mtmhec88.wl-maz@kernel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8400fc5dfa13c89c8786bfc809011a54@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: seanjc@google.com, kvm@vger.kernel.org,
 linux-mips@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
 aleksandar.qemu.devel@gmail.com, anup.patel@wdc.com, atish.patra@wdc.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, david@redhat.com,
 imbrenda@linux.ibm.com, pbonzini@redhat.com, jgross@suse.com,
 npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au, james.morse@arm.com,
 suzuki.poulose@arm.com, alexandru.elisei@arm.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, David Hildenbrand <david@redhat.com>,
 linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@samba.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kernel-team@android.com,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvmarm@lists.cs.columbia.edu, Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-11-06 11:48, Marc Zyngier wrote:
> On Fri, 05 Nov 2021 20:21:36 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
>> 
>> On Fri, Nov 05, 2021, Marc Zyngier wrote:
>> > At least on arm64 and x86, the vcpus array is pretty huge (512 entries),
>> > and is mostly empty in most cases (running 512 vcpu VMs is not that
>> > common). This mean that we end-up with a 4kB block of unused memory
>> > in the middle of the kvm structure.
>> 
>> Heh, x86 is now up to 1024 entries.
> 
> Humph. I don't want to know whether people are actually using that in
> practice. The only time I create VMs with 512 vcpus is to check
> whether it still works...
> 
>> 
>> > Instead of wasting away this memory, let's use an xarray instead,
>> > which gives us almost the same flexibility as a normal array, but
>> > with a reduced memory usage with smaller VMs.
>> >
>> > Signed-off-by: Marc Zyngier <maz@kernel.org>
>> > ---
>> > @@ -693,7 +694,7 @@ static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
>> >
>> >  	/* Pairs with smp_wmb() in kvm_vm_ioctl_create_vcpu.  */
>> >  	smp_rmb();
>> > -	return kvm->vcpus[i];
>> > +	return xa_load(&kvm->vcpu_array, i);
>> >  }
>> 
>> It'd be nice for this series to convert kvm_for_each_vcpu() to use
>> xa_for_each() as well.  Maybe as a patch on top so that potential
>> explosions from that are isolated from the initiali conversion?
>> 
>> Or maybe even use xa_for_each_range() to cap at online_vcpus?
>> That's technically a functional change, but IMO it's easier to
>> reason about iterating over a snapshot of vCPUs as opposed to being
>> able to iterate over vCPUs as their being added.  In practice I
>> doubt it matters.
>> 
>> #define kvm_for_each_vcpu(idx, vcpup, kvm) \
>> 	xa_for_each_range(&kvm->vcpu_array, idx, vcpup, 0, 
>> atomic_read(&kvm->online_vcpus))
>> 
> 
> I think that's already the behaviour of this iterator (we stop at the
> first empty slot capped to online_vcpus. The only change in behaviour
> is that vcpup currently holds a pointer to the last vcpu in no empty
> slot has been encountered. xa_for_each{,_range}() would set the
> pointer to NULL at all times.
> 
> I doubt anyone relies on that, but it is probably worth eyeballing
> some of the use cases...

This turned out to be an interesting exercise, as we always use an
int for the index, and the xarray iterators insist on an unsigned
long (and even on a pointer to it). On the other hand, I couldn't
spot any case where we'd rely on the last value of the vcpu pointer.

I'll repost the series once we have a solution for patch #4, and
we can then decide whether we want the iterator churn.
-- 
Jazz is not dead. It just smells funny...
