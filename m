Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A051ABBC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:55:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492tNd1HMKzDqrm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:55:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JisAsjGA; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492snk5lg9zDrMb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 18:28:58 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C5DE206B9;
 Thu, 16 Apr 2020 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587025736;
 bh=vfgxeHDvM3UvlFz06zXdJ/IZL1ebh31rJtXy+iX8CGE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JisAsjGA4My2YPuW5i6UcwB5Psl1wFS6NgXi6PEvhJGpwBJBd+wh9+LCfuyBXqjxZ
 MNfFkZ6ZFvEp7Qc8qqqMUsiz20BJshqw7ZJSSWFHU9Cmv769TYnTegAPEfdaIdVVld
 v3BlDLPn0E9sGQW0CMTvrq++ryu2lTx9yz42G/WA=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jOztG-003lPA-Ed; Thu, 16 Apr 2020 09:28:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 16 Apr 2020 09:28:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v2] KVM: Optimize kvm_arch_vcpu_ioctl_run function
In-Reply-To: <878sivx67g.fsf@vitty.brq.redhat.com>
References: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
 <878sivx67g.fsf@vitty.brq.redhat.com>
Message-ID: <1000159f971a6fa3b5bd9e5871ce4d82@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: vkuznets@redhat.com, tianjia.zhang@linux.alibaba.com,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, wanpengli@tencent.com,
 jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
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
Cc: christoffer.dall@arm.com, wanpengli@tencent.com, kvm@vger.kernel.org,
 david@redhat.com, heiko.carstens@de.ibm.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, hpa@zytor.com, kvmarm@lists.cs.columbia.edu,
 linux-s390@vger.kernel.org, frankja@linux.ibm.com, joro@8bytes.org,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org, bp@alien8.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 cohuck@redhat.com, linux-mips@vger.kernel.org, sean.j.christopherson@intel.com,
 james.morse@arm.com, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-04-16 08:03, Vitaly Kuznetsov wrote:
> Tianjia Zhang <tianjia.zhang@linux.alibaba.com> writes:
> 
>> In earlier versions of kvm, 'kvm_run' is an independent structure
>> and is not included in the vcpu structure. At present, 'kvm_run'
>> is already included in the vcpu structure, so the parameter
>> 'kvm_run' is redundant.
>> 
>> This patch simplify the function definition, removes the extra
>> 'kvm_run' parameter, and extract it from the 'kvm_vcpu' structure
>> if necessary.
>> 
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>> ---
>> 
>> v2 change:
>>   remove 'kvm_run' parameter and extract it from 'kvm_vcpu'
>> 
>>  arch/mips/kvm/mips.c       |  3 ++-
>>  arch/powerpc/kvm/powerpc.c |  3 ++-
>>  arch/s390/kvm/kvm-s390.c   |  3 ++-
>>  arch/x86/kvm/x86.c         | 11 ++++++-----
>>  include/linux/kvm_host.h   |  2 +-
>>  virt/kvm/arm/arm.c         |  6 +++---
>>  virt/kvm/kvm_main.c        |  2 +-
>>  7 files changed, 17 insertions(+), 13 deletions(-)
>> 
>> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
>> index 8f05dd0a0f4e..ec24adf4857e 100644
>> --- a/arch/mips/kvm/mips.c
>> +++ b/arch/mips/kvm/mips.c
>> @@ -439,8 +439,9 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct 
>> kvm_vcpu *vcpu,
>>  	return -ENOIOCTLCMD;
>>  }
>> 
>> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run 
>> *run)
>> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>>  {
>> +	struct kvm_run *run = vcpu->run;
>>  	int r = -EINTR;
>> 
>>  	vcpu_load(vcpu);
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index e15166b0a16d..7e24691e138a 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -1764,8 +1764,9 @@ int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu 
>> *vcpu, struct kvm_one_reg *reg)
>>  	return r;
>>  }
>> 
>> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run 
>> *run)
>> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>>  {
>> +	struct kvm_run *run = vcpu->run;
>>  	int r;
>> 
>>  	vcpu_load(vcpu);
>> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
>> index 19a81024fe16..443af3ead739 100644
>> --- a/arch/s390/kvm/kvm-s390.c
>> +++ b/arch/s390/kvm/kvm-s390.c
>> @@ -4333,8 +4333,9 @@ static void store_regs(struct kvm_vcpu *vcpu, 
>> struct kvm_run *kvm_run)
>>  		store_regs_fmt2(vcpu, kvm_run);
>>  }
>> 
>> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run 
>> *kvm_run)
>> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>>  {
>> +	struct kvm_run *kvm_run = vcpu->run;
>>  	int rc;
>> 
>>  	if (kvm_run->immediate_exit)
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index 3bf2ecafd027..a0338e86c90f 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -8707,8 +8707,9 @@ static void kvm_put_guest_fpu(struct kvm_vcpu 
>> *vcpu)
>>  	trace_kvm_fpu(0);
>>  }
>> 
>> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run 
>> *kvm_run)
>> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>>  {
>> +	struct kvm_run *kvm_run = vcpu->run;
>>  	int r;
>> 
>>  	vcpu_load(vcpu);
>> @@ -8726,18 +8727,18 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu 
>> *vcpu, struct kvm_run *kvm_run)
>>  		r = -EAGAIN;
>>  		if (signal_pending(current)) {
>>  			r = -EINTR;
>> -			vcpu->run->exit_reason = KVM_EXIT_INTR;
>> +			kvm_run->exit_reason = KVM_EXIT_INTR;
>>  			++vcpu->stat.signal_exits;
>>  		}
>>  		goto out;
>>  	}
>> 
>> -	if (vcpu->run->kvm_valid_regs & ~KVM_SYNC_X86_VALID_FIELDS) {
>> +	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_X86_VALID_FIELDS) {
>>  		r = -EINVAL;
>>  		goto out;
>>  	}
>> 
>> -	if (vcpu->run->kvm_dirty_regs) {
>> +	if (kvm_run->kvm_dirty_regs) {
>>  		r = sync_regs(vcpu);
>>  		if (r != 0)
>>  			goto out;
>> @@ -8767,7 +8768,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu 
>> *vcpu, struct kvm_run *kvm_run)
>> 
>>  out:
>>  	kvm_put_guest_fpu(vcpu);
>> -	if (vcpu->run->kvm_valid_regs)
>> +	if (kvm_run->kvm_valid_regs)
>>  		store_regs(vcpu);
>>  	post_kvm_run_save(vcpu);
>>  	kvm_sigset_deactivate(vcpu);
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 6d58beb65454..1e17ef719595 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -866,7 +866,7 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct 
>> kvm_vcpu *vcpu,
>>  				    struct kvm_mp_state *mp_state);
>>  int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>>  					struct kvm_guest_debug *dbg);
>> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run 
>> *kvm_run);
>> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
>> 
>>  int kvm_arch_init(void *opaque);
>>  void kvm_arch_exit(void);
>> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
>> index 48d0ec44ad77..f5390ac2165b 100644
>> --- a/virt/kvm/arm/arm.c
>> +++ b/virt/kvm/arm/arm.c
>> @@ -639,7 +639,6 @@ static void check_vcpu_requests(struct kvm_vcpu 
>> *vcpu)
>>  /**
>>   * kvm_arch_vcpu_ioctl_run - the main VCPU run function to execute 
>> guest code
>>   * @vcpu:	The VCPU pointer
>> - * @run:	The kvm_run structure pointer used for userspace state 
>> exchange
>>   *
>>   * This function is called through the VCPU_RUN ioctl called from 
>> user space. It
>>   * will execute VM code in a loop until the time slice for the 
>> process is used
>> @@ -647,8 +646,9 @@ static void check_vcpu_requests(struct kvm_vcpu 
>> *vcpu)
>>   * return with return value 0 and with the kvm_run structure filled 
>> in with the
>>   * required data for the requested emulation.
>>   */
>> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run 
>> *run)
>> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>>  {
>> +	struct kvm_run *run = vcpu->run;
>>  	int ret;
>> 
>>  	if (unlikely(!kvm_vcpu_initialized(vcpu)))
>> @@ -659,7 +659,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, 
>> struct kvm_run *run)
>>  		return ret;
>> 
>>  	if (run->exit_reason == KVM_EXIT_MMIO) {
>> -		ret = kvm_handle_mmio_return(vcpu, vcpu->run);
>> +		ret = kvm_handle_mmio_return(vcpu, run);
> 
> I don't know much about ARM but this also seems redundant,
> kvm_handle_mmio_return() is also able to extruct 'struct kvm_run' from'
> 'struct kvm_vcpu'. This likely deserves it's own patch though.

Something like this (untested):

diff --git a/arch/arm64/include/asm/kvm_host.h 
b/arch/arm64/include/asm/kvm_host.h
index 32c8a675e5a4..82978995bdd6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -490,7 +490,7 @@ void handle_exit_early(struct kvm_vcpu *vcpu, struct 
kvm_run *run,
  void kvm_mmio_write_buf(void *buf, unsigned int len, unsigned long 
data);
  unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);

-int kvm_handle_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
  int io_mem_abort(struct kvm_vcpu *vcpu, struct kvm_run *run,
  		 phys_addr_t fault_ipa);

diff --git a/virt/kvm/arm/mmio.c b/virt/kvm/arm/mmio.c
index 4e0366759726..3b2c822b4859 100644
--- a/virt/kvm/arm/mmio.c
+++ b/virt/kvm/arm/mmio.c
@@ -77,9 +77,8 @@ unsigned long kvm_mmio_read_buf(const void *buf, 
unsigned int len)
   *			     or in-kernel IO emulation
   *
   * @vcpu: The VCPU pointer
- * @run:  The VCPU run struct containing the mmio data
   */
-int kvm_handle_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
+int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
  {
  	unsigned long data;
  	unsigned int len;
@@ -93,7 +92,7 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu, 
struct kvm_run *run)

  	if (!kvm_vcpu_dabt_iswrite(vcpu)) {
  		len = kvm_vcpu_dabt_get_as(vcpu);
-		data = kvm_mmio_read_buf(run->mmio.data, len);
+		data = kvm_mmio_read_buf(vcpu->run->mmio.data, len);

  		if (kvm_vcpu_dabt_issext(vcpu) &&
  		    len < sizeof(unsigned long)) {
@@ -104,7 +103,8 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu, 
struct kvm_run *run)
  		if (!kvm_vcpu_dabt_issf(vcpu))
  			data = data & 0xffffffff;

-		trace_kvm_mmio(KVM_TRACE_MMIO_READ, len, run->mmio.phys_addr,
+		trace_kvm_mmio(KVM_TRACE_MMIO_READ, len,
+			       vcpu->run->mmio.phys_addr,
  			       &data);
  		data = vcpu_data_host_to_guest(vcpu, data, len);
  		vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu), data);

Overall, there is a large set of cleanups to be done when both the vcpu 
and the run
structures are passed as parameters at the same time. Just grepping the 
tree for
kvm_run is pretty instructive.

         M.
-- 
Jazz is not dead. It just smells funny...
