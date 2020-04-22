Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D81B4A05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 18:15:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496ls405l3zDqNr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 02:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=cohuck@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EtHWvqtx; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=A533K5Sl; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496lcX4nVVzDqsw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 02:04:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587571465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amvTuf5wEMJvqdESpaeyMURJivlfDh/jRY31BzCdBPU=;
 b=EtHWvqtxOTLXR8bJT99Zq8deSk6Z7h1+texHGF9Tb0JYbiRViqz4/PtUcrz4OtqR6cLqRB
 gD9v7wYqYQRoxmlh1r8O+jXW6wykkIh6fMLLwFOrwOTDbuhGdOTxEH++cLRr87DzltkNTt
 zzOSMH/WkiUMkDx9AAGkGbvQCsCIoOc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587571466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amvTuf5wEMJvqdESpaeyMURJivlfDh/jRY31BzCdBPU=;
 b=A533K5SlkGmJnhGCgMcyFYJZzjQ3FEFdIc8wNiYq95oqKdVifZnhylRVi1BjBR9sFvSiop
 p+TLyhA8rGaRxIEPsLDkWiSdzulNOFTO/6SBwaHot9vQvPC+5LM5GTXGTnOD8/+T+lfEdA
 xQ7ITANXZoa7Z4VitkD+nRBg0IXrOsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-5-QqutxDOl-cVj9GG-2gZA-1; Wed, 22 Apr 2020 12:04:23 -0400
X-MC-Unique: 5-QqutxDOl-cVj9GG-2gZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6898E107ACC9;
 Wed, 22 Apr 2020 16:04:19 +0000 (UTC)
Received: from gondolin (ovpn-112-195.ams2.redhat.com [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE51B19C70;
 Wed, 22 Apr 2020 16:04:05 +0000 (UTC)
Date: Wed, 22 Apr 2020 18:04:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v2 1/7] KVM: s390: clean up redundant 'kvm_run' parameters
Message-ID: <20200422180403.03f60b0c.cohuck@redhat.com>
In-Reply-To: <dc5e0fa3-558b-d606-bda9-ed281cf9e9ae@de.ibm.com>
References: <20200422125810.34847-1-tianjia.zhang@linux.alibaba.com>
 <20200422125810.34847-2-tianjia.zhang@linux.alibaba.com>
 <20200422154543.2efba3dd.cohuck@redhat.com>
 <dc5e0fa3-558b-d606-bda9-ed281cf9e9ae@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 mingo@redhat.com, julien.thierry.kdev@gmail.com, thuth@redhat.com,
 gor@linux.ibm.com, suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org,
 bp@alien8.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 jmattson@google.com, tsbogend@alpha.franken.de,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, christoffer.dall@arm.com,
 sean.j.christopherson@intel.com, linux-kernel@vger.kernel.org,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Apr 2020 17:58:04 +0200
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 22.04.20 15:45, Cornelia Huck wrote:
> > On Wed, 22 Apr 2020 20:58:04 +0800
> > Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:
> >   
> >> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> >> structure. Earlier than historical reasons, many kvm-related function  
> > 
> > s/Earlier than/For/ ?
> >   
> >> parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time.
> >> This patch does a unified cleanup of these remaining redundant parameters.
> >>
> >> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> >> ---
> >>  arch/s390/kvm/kvm-s390.c | 37 ++++++++++++++++++++++---------------
> >>  1 file changed, 22 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> >> index e335a7e5ead7..d7bb2e7a07ff 100644
> >> --- a/arch/s390/kvm/kvm-s390.c
> >> +++ b/arch/s390/kvm/kvm-s390.c
> >> @@ -4176,8 +4176,9 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
> >>  	return rc;
> >>  }
> >>  
> >> -static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> >> +static void sync_regs_fmt2(struct kvm_vcpu *vcpu)
> >>  {
> >> +	struct kvm_run *kvm_run = vcpu->run;
> >>  	struct runtime_instr_cb *riccb;
> >>  	struct gs_cb *gscb;
> >>  
> >> @@ -4235,7 +4236,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> >>  		}
> >>  		if (vcpu->arch.gs_enabled) {
> >>  			current->thread.gs_cb = (struct gs_cb *)
> >> -						&vcpu->run->s.regs.gscb;
> >> +						&kvm_run->s.regs.gscb;  
> > 
> > Not sure if these changes (vcpu->run-> => kvm_run->) are really worth
> > it. (It seems they amount to at least as much as the changes advertised
> > in the patch description.)
> > 
> > Other opinions?  
> 
> Agreed. It feels kind of random. Maybe just do the first line (move kvm_run from the
> function parameter list into the variable declaration)? Not sure if this is better.
> 

There's more in this patch that I cut... but I think just moving
kvm_run from the parameter list would be much less disruptive.

