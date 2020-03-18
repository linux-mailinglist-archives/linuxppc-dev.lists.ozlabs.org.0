Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0018A23F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 19:21:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jJJX36TSzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 05:21:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=sean.j.christopherson@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jJCc2rmfzDqnx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 05:16:50 +1100 (AEDT)
IronPort-SDR: PG77UocWLW4F2uAs4/N0ICE0V+b0dnI4E1BpFeXALTyFm4Mpsm0qi6fH43HOMrm0/uzXOEtC0A
 SiNRMgDAqZ+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 11:16:47 -0700
IronPort-SDR: /nMRDuFjDvnEQdAI25G2RprZu7vl2tFb/s5g9nSzTkbNQFEl6S1jB8R9gAAlxCI24lNdz7A8m0
 4//JGQe4hw+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="291388997"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.202])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2020 11:16:46 -0700
Date: Wed, 18 Mar 2020 11:16:46 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/3] KVM: PPC: Fix kernel crash with PR KVM
Message-ID: <20200318181646.GL24357@linux.intel.com>
References: <158455340419.178873.11399595021669446372.stgit@bahia.lan>
 <158455341029.178873.15248663726399374882.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158455341029.178873.15248663726399374882.stgit@bahia.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: kvm-ppc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 06:43:30PM +0100, Greg Kurz wrote:
> It turns out that this is only relevant to PR KVM actually. And both
> 32 and 64 backends need vcpu->arch.book3s to be valid when calling
> kvmppc_mmu_destroy_pr(). So instead of calling kvmppc_mmu_destroy()
> from kvm_arch_vcpu_destroy(), call kvmppc_mmu_destroy_pr() at the
> beginning of kvmppc_core_vcpu_free_pr(). This is consistent with
> kvmppc_mmu_init() being the last call in kvmppc_core_vcpu_create_pr().
> 
> For the same reason, if kvmppc_core_vcpu_create_pr() returns an
> error then this means that kvmppc_mmu_init() was either not called
> or failed, in which case kvmppc_mmu_destroy() should not be called.
> Drop the line in the error path of kvm_arch_vcpu_create().
> 
> Fixes: ff030fdf5573 ("KVM: PPC: Move kvm_vcpu_init() invocation to common code")
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Dang, I see where I went wrong.  Sorry :-(

Reviewed-by: Sean Christopherson <sean.j.christopherson@intel.com>
