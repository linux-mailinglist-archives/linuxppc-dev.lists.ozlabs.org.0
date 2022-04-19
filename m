Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB855506935
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 12:57:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjLNw689fz3bZN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Aw71b+3z;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hixjpFQx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=mlevitsk@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Aw71b+3z; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hixjpFQx; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjHh63qJ8z2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 18:55:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650358528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAp+F+npHVI/LvkJesk2bVKFg1Wa6g6pN0S+Js80XoI=;
 b=Aw71b+3zqHHKd4FVZYq1L0a274qEGVML2saaD11UiuUz85rL/gTxz2E9e4NIQcMtTHqFqK
 vFE42w1zeJ6yzBvNJeEGTO/UKP4r5W/dSxUojNDhkGuOKCsnLzViigrM8FGpssN11v8Lqs
 kfjyFVYYUbSaTBmVLxsRu9WLwYaLPQQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650358529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAp+F+npHVI/LvkJesk2bVKFg1Wa6g6pN0S+Js80XoI=;
 b=hixjpFQx5ywOZnMBuC/Q/KLk7b8NKp+aYryc3+qNs9HNYF4/WTCpgthlpUBv1xY9rvUmqY
 uwknRI7yfG3t3DqRF27Qm/BxR31EwVlIcdJHwyOfUDBlb/cotqFYve5AbAq+XDoDC+QCt5
 sbQPSuAFfX64DgUacnSCJBYfVuW3is8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-cvwRzkmxM9Szm0_kiSLc0w-1; Tue, 19 Apr 2022 04:55:24 -0400
X-MC-Unique: cvwRzkmxM9Szm0_kiSLc0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C56EF3811F2D;
 Tue, 19 Apr 2022 08:55:23 +0000 (UTC)
Received: from starship (unknown [10.40.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 465364087D60;
 Tue, 19 Apr 2022 08:55:19 +0000 (UTC)
Message-ID: <204c7265de2d69ed240d18e30c7595702277cdbb.camel@redhat.com>
Subject: Re: [PATCH 1/3] KVM: x86: Don't re-acquire SRCU lock in
 complete_emulated_io()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Anup Patel
 <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Date: Tue, 19 Apr 2022 11:55:18 +0300
In-Reply-To: <20220415004343.2203171-2-seanjc@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-2-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:56:27 +1000
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Atish Patra <atishp@atishpatra.org>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-04-15 at 00:43 +0000, Sean Christopherson wrote:
> Don't re-acquire SRCU in complete_emulated_io() now that KVM acquires the
> lock in kvm_arch_vcpu_ioctl_run().  More importantly, don't overwrite
> vcpu->srcu_idx.  If the index acquired by complete_emulated_io() differs
> from the one acquired by kvm_arch_vcpu_ioctl_run(), KVM will effectively
> leak a lock and hang if/when synchronize_srcu() is invoked for the
> relevant grace period.
> 
> Fixes: 8d25b7beca7e ("KVM: x86: pull kvm->srcu read-side to kvm_arch_vcpu_ioctl_run")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ab336f7c82e4..f35fe09de59d 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10450,12 +10450,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>  
>  static inline int complete_emulated_io(struct kvm_vcpu *vcpu)
>  {
> -	int r;
> -
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> -	r = kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> -	return r;
> +	return kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
>  }
>  
>  static int complete_emulated_pio(struct kvm_vcpu *vcpu)

I wonder how this did work....

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky

