Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC07423BA6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 12:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPWL21FTgz3bXt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 21:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 118 seconds by postgrey-1.36 at boromir;
 Wed, 06 Oct 2021 21:44:19 AEDT
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPWKb6kwrz2yPj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 21:44:19 +1100 (AEDT)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-i2d87W4iMU-K3Gz0empo0Q-1; Wed, 06 Oct 2021 06:42:11 -0400
X-MC-Unique: i2d87W4iMU-K3Gz0empo0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 737C5835DE5;
 Wed,  6 Oct 2021 10:42:09 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E46560854;
 Wed,  6 Oct 2021 10:42:06 +0000 (UTC)
Date: Wed, 6 Oct 2021 12:42:04 +0200
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] KVM: PPC: Defer vtime accounting 'til after IRQ handling
Message-ID: <20211006124204.4741bb5c@bahia.huguette>
In-Reply-To: <20211006073745.82109-1-lvivier@redhat.com>
References: <20211006073745.82109-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  6 Oct 2021 09:37:45 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> Commit 61bd0f66ff92 has moved guest_enter() out of the interrupt
> protected area to be able to have updated tick counters, but
> commit 112665286d08 moved back to this area to avoid wrong
> context warning (or worse).
>=20
> None of them are correct, to fix the problem port to POWER
> the x86 fix 160457140187 ("KVM: x86: Defer vtime accounting 'til
> after IRQ handling"):
>=20
> "Defer the call to account guest time until after servicing any IRQ(s)
>  that happened in the guest or immediately after VM-Exit.  Tick-based
>  accounting of vCPU time relies on PF_VCPU being set when the tick IRQ
>  handler runs, and IRQs are blocked throughout the main sequence of
>  vcpu_enter_guest(), including the call into vendor code to actually
>  enter and exit the guest."
>=20
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2009312
> Fixes: 61bd0f66ff92 ("KVM: PPC: Book3S HV: Fix guest time accounting with=
 VIRT_CPU_ACCOUNTING_GEN")

This patch was merged in linux 4.16 and thus is on the 4.16.y
stable branch and it was backported to stable 4.14.y. It would
make sense to Cc: stable # v4.14 also, but...

> Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest co=
ntext before enabling irqs")

... this one, which was merged in linux 5.12, was never backported
anywhere because it wasn't considered as a fix, as commented here:

https://lore.kernel.org/linuxppc-dev/1610793296.fjhomer31g.astroid@bobo.non=
e/

AFAICT commit 61bd0f66ff92 was never mentioned anywhere in a bug. The
first Fixes: tag thus looks a bit misleading. I'd personally drop it
and Cc: stable # v5.12.

> Cc: npiggin@gmail.com
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 2acb1c96cfaf..43e1ce853785 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3695,6 +3695,8 @@ static noinline void kvmppc_run_core(struct kvmppc_=
vcore *vc)
> =20
>  =09srcu_read_unlock(&vc->kvm->srcu, srcu_idx);
> =20
> +=09context_tracking_guest_exit();
> +
>  =09set_irq_happened(trap);
> =20
>  =09spin_lock(&vc->lock);
> @@ -3726,9 +3728,8 @@ static noinline void kvmppc_run_core(struct kvmppc_=
vcore *vc)
> =20
>  =09kvmppc_set_host_core(pcpu);
> =20
> -=09guest_exit_irqoff();
> -


Change looks ok but it might be a bit confusing for the
occasional reader that guest_enter_irqoff() isn't matched
by a guest_exit_irqoff().

>  =09local_irq_enable();
> +=09vtime_account_guest_exit();
> =20

Maybe add a comment like in x86 ?

>  =09/* Let secondaries go back to the offline loop */
>  =09for (i =3D 0; i < controlled_threads; ++i) {
> @@ -4506,13 +4507,14 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, =
u64 time_limit,
> =20
>  =09srcu_read_unlock(&kvm->srcu, srcu_idx);
> =20
> +=09context_tracking_guest_exit();
> +
>  =09set_irq_happened(trap);
> =20
>  =09kvmppc_set_host_core(pcpu);
> =20
> -=09guest_exit_irqoff();
> -
>  =09local_irq_enable();
> +=09vtime_account_guest_exit();
> =20
>  =09cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
> =20

Same remarks. FWIW a followup was immediately added to x86 to
encapsulate the enter/exit logic in common helpers :

ommit bc908e091b3264672889162733020048901021fb
Author: Sean Christopherson <seanjc@google.com>
Date:   Tue May 4 17:27:35 2021 -0700

    KVM: x86: Consolidate guest enter/exit logic to common helpers

This makes the code nicer. Maybe do something similar for POWER ?

Cheers,

--
Greg

