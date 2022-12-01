Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CE763E949
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 06:22:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN4Fv4qzPz3bg8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 16:22:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J5OxG6kI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN4Dx4ryYz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 16:21:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J5OxG6kI;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NN4Dq6Zmxz4x1V;
	Thu,  1 Dec 2022 16:21:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669872096;
	bh=N0orzYmQiDoqaJ7NYGjlM3UnNxlX/cknbPTGfPB6WFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J5OxG6kIMoR1klHiq+pJUaSgDwQrXyp2IQVExgmmPNs6d5M2zalc/rFARJpzB6LCF
	 mIrvgM+Yk6zmcYrbL1HL6byl4gygucjhaR6xhicDvgiER8ov5k6cvGvblLKfkLL79G
	 Qr4K7TgrY7ozLHH4Rz1BcWO+Y6BxcTIrY8j51NIdM6oHGO3QrlQNIe919bNypOKqe4
	 YHuJsYYV/nFeRurQTMfOCln/DE+Mz3BkBkR/vDvI86w1ePXtODUCbkiSWEC3PK7pVj
	 7hgwt5pYqLFahDmf67Gs9PQJ8p24LtR4/LQuAP00TNjl2lawnoAD2XkoV81D7xf9C5
	 T4FWO6qMAX8YQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Sean
 Christopherson <seanjc@google.com>, Vitaly Kuznetsov
 <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH v2 26/50] KVM: PPC: Move processor compatibility check
 to module init
In-Reply-To: <20221130230934.1014142-27-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-27-seanjc@google.com>
Date: Thu, 01 Dec 2022 16:21:31 +1100
Message-ID: <87cz93snqc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:
> Move KVM PPC's compatibility checks to their respective module_init()
> hooks, there's no need to wait until KVM's common compat check, nor is
> there a need to perform the check on every CPU (provided by common KVM's
> hook), as the compatibility checks operate on global data.
>
>   arch/powerpc/include/asm/cputable.h: extern struct cpu_spec *cur_cpu_sp=
ec;
>   arch/powerpc/kvm/book3s.c: return 0
>   arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
>   arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
>                              strcmp(cur_cpu_spec->cpu_name, "e5500")
>                              strcmp(cur_cpu_spec->cpu_name, "e6500")

I'm not sure that output is really useful in the change log unless you
explain more about what it is.

> diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> index 57e0ad6a2ca3..795667f7ebf0 100644
> --- a/arch/powerpc/kvm/e500mc.c
> +++ b/arch/powerpc/kvm/e500mc.c
> @@ -388,6 +388,10 @@ static int __init kvmppc_e500mc_init(void)
>  {
>  	int r;
>=20=20
> +	r =3D kvmppc_e500mc_check_processor_compat();
> +	if (r)
> +		return kvmppc_e500mc;
=20
This doesn't build:

linux/arch/powerpc/kvm/e500mc.c: In function =E2=80=98kvmppc_e500mc_init=E2=
=80=99:
linux/arch/powerpc/kvm/e500mc.c:391:13: error: implicit declaration of func=
tion =E2=80=98kvmppc_e500mc_check_processor_compat=E2=80=99; did you mean =
=E2=80=98kvmppc_core_check_processor_compat=E2=80=99? [-Werror=3Dimplicit-f=
unction-declaration]
  391 |         r =3D kvmppc_e500mc_check_processor_compat();
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             kvmppc_core_check_processor_compat
linux/arch/powerpc/kvm/e500mc.c:393:24: error: =E2=80=98kvmppc_e500mc=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98kvm_ops_=
e500mc=E2=80=99?
  393 |                 return kvmppc_e500mc;
      |                        ^~~~~~~~~~~~~
      |                        kvm_ops_e500mc
linux/arch/powerpc/kvm/e500mc.c:393:24: note: each undeclared identifier is=
 reported only once for each function it appears in


It needs the delta below to compile.

With that:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers


diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index 795667f7ebf0..4564aa27edcf 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -168,7 +168,7 @@ static void kvmppc_core_vcpu_put_e500mc(struct kvm_vcpu=
 *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
=20
-int kvmppc_core_check_processor_compat(void)
+int kvmppc_e500mc_check_processor_compat(void)
 {
 	int r;
=20
@@ -390,7 +390,7 @@ static int __init kvmppc_e500mc_init(void)
=20
 	r =3D kvmppc_e500mc_check_processor_compat();
 	if (r)
-		return kvmppc_e500mc;
+		goto err_out;
=20
 	r =3D kvmppc_booke_init();
 	if (r)
