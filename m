Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B81B4692
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 15:48:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496hc06VxdzDqkc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 23:48:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=cohuck@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=cTZ2fVNd; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z3QzX5GT; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496hY00WcrzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 23:46:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587563168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbzJ2c3Jbmfs6TXG5rybp4esqbXtRerCZxsEpCUlwvY=;
 b=cTZ2fVNd3eY7j7XPo6jrhe+g5brhNAWuSN+sTn5IzIV6wIBAsUTqPTh0//f8kg8tz+VxDg
 oQCS3q6nDkL14bf56Pedx358L5l0y06Fqd/siZBVcNukzeekQAcV+PcMo4Ryooh+5eVtrD
 cFrmCke5JUZFd+gcmDPNkCX3oru5MYA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587563169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbzJ2c3Jbmfs6TXG5rybp4esqbXtRerCZxsEpCUlwvY=;
 b=Z3QzX5GTfDJfWmyzNvcVn4FEHZIPl1CR7lpp+vE3KFly3yM80Vb4JiiPmSFAo8v7ZRkRWd
 97EOiwAucpeCiE7blY+MiNGWYrJZSisPrvIVo3zGHEVPPD01nTXRFb3lnV/gOkbZ64PQlI
 6neB8p8Y0dDr4MOmut9mkLMr824TVRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-lh4Pzp_SOlKmSyI6QDWB7Q-1; Wed, 22 Apr 2020 09:46:04 -0400
X-MC-Unique: lh4Pzp_SOlKmSyI6QDWB7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D47C800FC7;
 Wed, 22 Apr 2020 13:46:00 +0000 (UTC)
Received: from gondolin (ovpn-112-195.ams2.redhat.com [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C266B5D706;
 Wed, 22 Apr 2020 13:45:46 +0000 (UTC)
Date: Wed, 22 Apr 2020 15:45:43 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v2 1/7] KVM: s390: clean up redundant 'kvm_run' parameters
Message-ID: <20200422154543.2efba3dd.cohuck@redhat.com>
In-Reply-To: <20200422125810.34847-2-tianjia.zhang@linux.alibaba.com>
References: <20200422125810.34847-1-tianjia.zhang@linux.alibaba.com>
 <20200422125810.34847-2-tianjia.zhang@linux.alibaba.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, david@redhat.com,
 heiko.carstens@de.ibm.com, peterx@redhat.com, linux-mips@vger.kernel.org,
 hpa@zytor.com, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, maz@kernel.org, joro@8bytes.org, x86@kernel.org,
 borntraeger@de.ibm.com, mingo@redhat.com, julien.thierry.kdev@gmail.com,
 thuth@redhat.com, gor@linux.ibm.com, suzuki.poulose@arm.com,
 kvm-ppc@vger.kernel.org, bp@alien8.de, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, christoffer.dall@arm.com,
 sean.j.christopherson@intel.com, linux-kernel@vger.kernel.org,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Apr 2020 20:58:04 +0800
Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:

> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> structure. Earlier than historical reasons, many kvm-related function

s/Earlier than/For/ ?

> parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time.
> This patch does a unified cleanup of these remaining redundant parameters.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  arch/s390/kvm/kvm-s390.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index e335a7e5ead7..d7bb2e7a07ff 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -4176,8 +4176,9 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
>  	return rc;
>  }
>  
> -static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +static void sync_regs_fmt2(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_run *kvm_run = vcpu->run;
>  	struct runtime_instr_cb *riccb;
>  	struct gs_cb *gscb;
>  
> @@ -4235,7 +4236,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  		}
>  		if (vcpu->arch.gs_enabled) {
>  			current->thread.gs_cb = (struct gs_cb *)
> -						&vcpu->run->s.regs.gscb;
> +						&kvm_run->s.regs.gscb;

Not sure if these changes (vcpu->run-> => kvm_run->) are really worth
it. (It seems they amount to at least as much as the changes advertised
in the patch description.)

Other opinions?

>  			restore_gs_cb(current->thread.gs_cb);
>  		}
>  		preempt_enable();

