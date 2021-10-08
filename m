Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFFD426452
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 07:56:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQcr03KhBz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 16:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 82 seconds by postgrey-1.36 at boromir;
 Fri, 08 Oct 2021 16:55:33 AEDT
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQcqT4R66z2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 16:55:33 +1100 (AEDT)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-Z3P4acovOzaCeubDXSg87A-1; Fri, 08 Oct 2021 01:53:49 -0400
X-MC-Unique: Z3P4acovOzaCeubDXSg87A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 545D083DBC0;
 Fri,  8 Oct 2021 05:53:47 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81691196E2;
 Fri,  8 Oct 2021 05:53:42 +0000 (UTC)
Date: Fri, 8 Oct 2021 07:53:41 +0200
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] KVM: PPC: Defer vtime accounting 'til after IRQ
 handling
Message-ID: <20211008074438.49fc577a@bahia.huguette>
In-Reply-To: <20211007142856.41205-1-lvivier@redhat.com>
References: <20211007142856.41205-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
 kvm-ppc@vger.kernel.org, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  7 Oct 2021 16:28:56 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> Commit 112665286d08 moved guest_exit() in the interrupt protected
> area to avoid wrong context warning (or worse), but the tick counter
> cannot be updated and the guest time is accounted to the system time.
>=20
> To fix the problem port to POWER the x86 fix
> 160457140187 ("Defer vtime accounting 'til after IRQ handling"):
>=20
> "Defer the call to account guest time until after servicing any IRQ(s)
>  that happened in the guest or immediately after VM-Exit.  Tick-based
>  accounting of vCPU time relies on PF_VCPU being set when the tick IRQ
>  handler runs, and IRQs are blocked throughout the main sequence of
>  vcpu_enter_guest(), including the call into vendor code to actually
>  enter and exit the guest."
>=20
> Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest co=
ntext before enabling irqs")
> Cc: npiggin@gmail.com
> Cc: <stable@vger.kernel.org> # 5.12
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>=20
> Notes:
>     v2: remove reference to commit 61bd0f66ff92
>         cc stable 5.12
>         add the same comment in the code as for x86
>=20

Works for me. As you stated in your answer, someone can polish the
code later on.

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 2acb1c96cfaf..a694d1a8f6ce 100644
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
> @@ -3726,9 +3728,15 @@ static noinline void kvmppc_run_core(struct kvmppc=
_vcore *vc)
> =20
>  =09kvmppc_set_host_core(pcpu);
> =20
> -=09guest_exit_irqoff();
> -
>  =09local_irq_enable();
> +=09/*
> +=09 * Wait until after servicing IRQs to account guest time so that any
> +=09 * ticks that occurred while running the guest are properly accounted
> +=09 * to the guest.  Waiting until IRQs are enabled degrades the accurac=
y
> +=09 * of accounting via context tracking, but the loss of accuracy is
> +=09 * acceptable for all known use cases.
> +=09 */
> +=09vtime_account_guest_exit();
> =20
>  =09/* Let secondaries go back to the offline loop */
>  =09for (i =3D 0; i < controlled_threads; ++i) {
> @@ -4506,13 +4514,21 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, =
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
> +=09/*
> +=09 * Wait until after servicing IRQs to account guest time so that any
> +=09 * ticks that occurred while running the guest are properly accounted
> +=09 * to the guest.  Waiting until IRQs are enabled degrades the accurac=
y
> +=09 * of accounting via context tracking, but the loss of accuracy is
> +=09 * acceptable for all known use cases.
> +=09 */
> +=09vtime_account_guest_exit();
> =20
>  =09cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
> =20

