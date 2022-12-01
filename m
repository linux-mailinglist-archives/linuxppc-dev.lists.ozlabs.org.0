Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A0863F56D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 17:39:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNMGv1BKrz3bdm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 03:39:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=L5oONEpJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=L5oONEpJ;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNMFt68r3z3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 03:38:25 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id w2so833572pfq.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wz5UjU3Ma0W7cBTZ/63jSNwcUzSf/RN7ETO0YflOK9Q=;
        b=L5oONEpJeyYInhCN8kEGfJ8WS2VPlfmSQI0EIRyACnSb62Ho4uiLAZ+22FZ0LpKSBY
         OanLGdeorUn/O6YHVn5BHqcWoMtKOfzbPKcz+4fsn48JXXYOuwBU81HsoXu4yIA+KxBs
         oNf69ULLkYXBFawHATlUKtmTRlCCGuue7O3x4Uj20kNa312jwW6CLd6dDy2pzPGk3DaL
         y4jm5SpqWS/wMH/C2TjT2ihvVuFcoRw2TnuuxPCYPfzDwkDLPEA8hE11/Idhqhxr7xt0
         rj/FXhrQIb1ypgd2I2CBp8L/oyRKWO3NUq8Jq7LgrgnoUKAu1/kU3hKmcHIeaOcvmDNO
         M6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wz5UjU3Ma0W7cBTZ/63jSNwcUzSf/RN7ETO0YflOK9Q=;
        b=NqwgQtax2mqhvCzKgCLGPhEBkDVndjApHOOtcnmsyJ9tBFoJ+P3HtYbzBS/EZE4d1q
         TeyakfnH9u2DUv3eMFVCNZvgh6tRgxa7Ds5EFE2fsS2AB9QyIWRZ5stZ36Fv/C2ZRXic
         zVC3PuyqTJdf2ka4k9SVe8AWwBX4ThCDkdWuYo0TnzayHykPsnPOY7uUPFKRe82DzIzs
         6I/VlZl1g1wUdztd0fEKvvW4HtC/Q9VNlOBqCZdKR2J2kxwK3NCPyXO4cWArm/qBmr10
         xBJDEbHwkThXvTrH1Vpma6nJZ0Dgkrkjcl+figwMc/PhfIXPrj98tFSkiUnaDL2FnwZm
         xODw==
X-Gm-Message-State: ANoB5pmoDkxmSdr1R/kAqfCd+DKvCLuN0QNr1U5bhirPbLEu14ncGxfu
	+8alQwxspc7p7EbpXF9ANBz3aw==
X-Google-Smtp-Source: AA0mqf7E8VTs9g+yA9GqMgTdFbO4YLYoa36a9KLdCj074cztIQB7gniXVzh1et27ldGMC17rtCxmqQ==
X-Received: by 2002:aa7:8512:0:b0:575:65ff:8831 with SMTP id v18-20020aa78512000000b0057565ff8831mr16235817pfn.80.1669912703144;
        Thu, 01 Dec 2022 08:38:23 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm5118172pjf.17.2022.12.01.08.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:38:22 -0800 (PST)
Date: Thu, 1 Dec 2022 16:38:16 +0000
From: Sean Christopherson <seanjc@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 26/50] KVM: PPC: Move processor compatibility check to
 module init
Message-ID: <Y4jXuh4P9Oibki6W@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-27-seanjc@google.com>
 <87cz93snqc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz93snqc.fsf@mpe.ellerman.id.au>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isak
 u.yamahata@intel.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 01, 2022, Michael Ellerman wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > Move KVM PPC's compatibility checks to their respective module_init()
> > hooks, there's no need to wait until KVM's common compat check, nor is
> > there a need to perform the check on every CPU (provided by common KVM's
> > hook), as the compatibility checks operate on global data.
> >
> >   arch/powerpc/include/asm/cputable.h: extern struct cpu_spec *cur_cpu_spec;
> >   arch/powerpc/kvm/book3s.c: return 0
> >   arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
> >   arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
> >                              strcmp(cur_cpu_spec->cpu_name, "e5500")
> >                              strcmp(cur_cpu_spec->cpu_name, "e6500")
> 
> I'm not sure that output is really useful in the change log unless you
> explain more about what it is.

Agreed, I got lazy.  I'll write a proper description.
 
> > diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> > index 57e0ad6a2ca3..795667f7ebf0 100644
> > --- a/arch/powerpc/kvm/e500mc.c
> > +++ b/arch/powerpc/kvm/e500mc.c
> > @@ -388,6 +388,10 @@ static int __init kvmppc_e500mc_init(void)
> >  {
> >  	int r;
> >  
> > +	r = kvmppc_e500mc_check_processor_compat();
> > +	if (r)
> > +		return kvmppc_e500mc;
>  
> This doesn't build:
> 
> linux/arch/powerpc/kvm/e500mc.c: In function ‘kvmppc_e500mc_init’:
> linux/arch/powerpc/kvm/e500mc.c:391:13: error: implicit declaration of function ‘kvmppc_e500mc_check_processor_compat’; did you mean ‘kvmppc_core_check_processor_compat’? [-Werror=implicit-function-declaration]
>   391 |         r = kvmppc_e500mc_check_processor_compat();
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |             kvmppc_core_check_processor_compat
> linux/arch/powerpc/kvm/e500mc.c:393:24: error: ‘kvmppc_e500mc’ undeclared (first use in this function); did you mean ‘kvm_ops_e500mc’?
>   393 |                 return kvmppc_e500mc;
>       |                        ^~~~~~~~~~~~~
>       |                        kvm_ops_e500mc
> linux/arch/powerpc/kvm/e500mc.c:393:24: note: each undeclared identifier is reported only once for each function it appears in

Huh, CONFIG_PPC_E500MC got unselected in the config I use to compile test this
flavor.  I suspect I botched an oldconfig at some point.
 
Anyways, fixed that and the bugs.

Thanks much!

--
Subject: [PATCH] KVM: PPC: Move processor compatibility check to module init

Move KVM PPC's compatibility checks to their respective module_init()
hooks, there's no need to wait until KVM's common compat check, nor is
there a need to perform the check on every CPU (provided by common KVM's
hook).  The compatibility checks are either a nop (Book3S), or simply
check the CPU name stored in the global CPU spec (e500 and e500mc).

Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h |  1 -
 arch/powerpc/kvm/book3s.c          | 10 ----------
 arch/powerpc/kvm/e500.c            |  4 ++--
 arch/powerpc/kvm/e500mc.c          |  6 +++++-
 arch/powerpc/kvm/powerpc.c         |  2 +-
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index bfacf12784dd..51a1824b0a16 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -118,7 +118,6 @@ extern int kvmppc_xlate(struct kvm_vcpu *vcpu, ulong eaddr,
 extern int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_vcpu_free(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_vcpu_setup(struct kvm_vcpu *vcpu);
-extern int kvmppc_core_check_processor_compat(void);
 extern int kvmppc_core_vcpu_translate(struct kvm_vcpu *vcpu,
                                       struct kvm_translation *tr);
 
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 6d525285dbe8..87283a0e33d8 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -999,16 +999,6 @@ int kvmppc_h_logical_ci_store(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_h_logical_ci_store);
 
-int kvmppc_core_check_processor_compat(void)
-{
-	/*
-	 * We always return 0 for book3s. We check
-	 * for compatibility while loading the HV
-	 * or PR module
-	 */
-	return 0;
-}
-
 int kvmppc_book3s_hcall_implemented(struct kvm *kvm, unsigned long hcall)
 {
 	return kvm->arch.kvm_ops->hcall_implemented(hcall);
diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
index c8b2b4478545..0ea61190ec04 100644
--- a/arch/powerpc/kvm/e500.c
+++ b/arch/powerpc/kvm/e500.c
@@ -314,7 +314,7 @@ static void kvmppc_core_vcpu_put_e500(struct kvm_vcpu *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
 
-int kvmppc_core_check_processor_compat(void)
+static int kvmppc_e500_check_processor_compat(void)
 {
 	int r;
 
@@ -507,7 +507,7 @@ static int __init kvmppc_e500_init(void)
 	unsigned long handler_len;
 	unsigned long max_ivor = 0;
 
-	r = kvmppc_core_check_processor_compat();
+	r = kvmppc_e500_check_processor_compat();
 	if (r)
 		goto err_out;
 
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index 57e0ad6a2ca3..4564aa27edcf 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -168,7 +168,7 @@ static void kvmppc_core_vcpu_put_e500mc(struct kvm_vcpu *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
 
-int kvmppc_core_check_processor_compat(void)
+int kvmppc_e500mc_check_processor_compat(void)
 {
 	int r;
 
@@ -388,6 +388,10 @@ static int __init kvmppc_e500mc_init(void)
 {
 	int r;
 
+	r = kvmppc_e500mc_check_processor_compat();
+	if (r)
+		goto err_out;
+
 	r = kvmppc_booke_init();
 	if (r)
 		goto err_out;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 5faf69421f13..d44b85ba8cef 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -442,7 +442,7 @@ int kvm_arch_hardware_enable(void)
 
 int kvm_arch_check_processor_compat(void *opaque)
 {
-	return kvmppc_core_check_processor_compat();
+	return 0;
 }
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)

base-commit: 00e4493db7c6163d48d5b45034d1a77e16a1c8dc
-- 

