Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467381C648F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 01:35:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gx172gjjzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 09:35:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GwzR5QvrzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 09:34:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GwzP3Ql0z9sRf;
 Wed,  6 May 2020 09:34:09 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Enforce load-after-store ordering when
 StoreEOI is active
Date: Wed, 06 May 2020 09:34:05 +1000
Message-ID: <2990884.uye9WAk7yu@townsend>
In-Reply-To: <20200220081506.31209-1-clg@kaod.org>
References: <20200220081506.31209-1-clg@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I am still slowly wrapping my head around XIVE and it's interaction with KV=
M=20
but from what I can see this looks good and is needed so we can enable=20
StoreEOI support in future so:

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Thursday, 20 February 2020 7:15:06 PM AEST C=E9dric Le Goater wrote:
> When an interrupt has been handled, the OS notifies the interrupt
> controller with a EOI sequence. On a POWER9 system using the XIVE
> interrupt controller, this can be done with a load or a store
> operation on the ESB interrupt management page of the interrupt. The
> StoreEOI operation has less latency and improves interrupt handling
> performance but it was deactivated during the POWER9 DD2.0 timeframe
> because of ordering issues. We use the LoadEOI today but we plan to
> reactivate StoreEOI in future architectures.
>=20
> There is usually no need to enforce ordering between ESB load and
> store operations as they should lead to the same result. E.g. a store
> trigger and a load EOI can be executed in any order. Assuming the
> interrupt state is PQ=3D10, a store trigger followed by a load EOI will
> return a Q bit. In the reverse order, it will create a new interrupt
> trigger from HW. In both cases, the handler processing interrupts is
> notified.
>=20
> In some cases, the XIVE_ESB_SET_PQ_10 load operation is used to
> disable temporarily the interrupt source (mask/unmask). When the
> source is reenabled, the OS can detect if interrupts were received
> while the source was disabled and reinject them. This process needs
> special care when StoreEOI is activated. The ESB load and store
> operations should be correctly ordered because a XIVE_ESB_STORE_EOI
> operation could leave the source enabled if it has not completed
> before the loads.
>=20
> For those cases, we enforce Load-after-Store ordering with a special
> load operation offset. To avoid performance impact, this ordering is
> only enforced when really needed, that is when interrupt sources are
> temporarily disabled with the XIVE_ESB_SET_PQ_10 load. It should not
> be needed for other loads.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/include/asm/xive-regs.h    | 8 ++++++++
>  arch/powerpc/kvm/book3s_xive_native.c   | 6 ++++++
>  arch/powerpc/kvm/book3s_xive_template.c | 3 +++
>  arch/powerpc/sysdev/xive/common.c       | 3 +++
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 5 +++++
>  5 files changed, 25 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/xive-regs.h
> b/arch/powerpc/include/asm/xive-regs.h index f2dfcd50a2d3..b1996fbae59a
> 100644
> --- a/arch/powerpc/include/asm/xive-regs.h
> +++ b/arch/powerpc/include/asm/xive-regs.h
> @@ -37,6 +37,14 @@
>  #define XIVE_ESB_SET_PQ_10	0xe00 /* Load */
>  #define XIVE_ESB_SET_PQ_11	0xf00 /* Load */
>=20
> +/*
> + * Load-after-store ordering
> + *
> + * Adding this offset to the load address will enforce
> + * load-after-store ordering. This is required to use StoreEOI.
> + */
> +#define XIVE_ESB_LD_ST_MO	0x40 /* Load-after-store ordering */
> +
>  #define XIVE_ESB_VAL_P		0x2
>  #define XIVE_ESB_VAL_Q		0x1
>=20
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c
> b/arch/powerpc/kvm/book3s_xive_native.c index d83adb1e1490..c80b6a447efd
> 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -31,6 +31,12 @@ static u8 xive_vm_esb_load(struct xive_irq_data *xd, u=
32
> offset) {
>  	u64 val;
>=20
> +	/*
> +	 * The KVM XIVE native device does not use the XIVE_ESB_SET_PQ_10
> +	 * load operation, so there is no need to enforce load-after-store
> +	 * ordering.
> +	 */
> +
>  	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>  		offset |=3D offset << 4;
>=20
> diff --git a/arch/powerpc/kvm/book3s_xive_template.c
> b/arch/powerpc/kvm/book3s_xive_template.c index a8a900ace1e6..4ad3c0279458
> 100644
> --- a/arch/powerpc/kvm/book3s_xive_template.c
> +++ b/arch/powerpc/kvm/book3s_xive_template.c
> @@ -58,6 +58,9 @@ static u8 GLUE(X_PFX,esb_load)(struct xive_irq_data *xd,
> u32 offset) {
>  	u64 val;
>=20
> +	if (offset =3D=3D XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE=
_EOI)
> +		offset |=3D XIVE_ESB_LD_ST_MO;
> +
>  	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>  		offset |=3D offset << 4;
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c
> b/arch/powerpc/sysdev/xive/common.c index f5fadbd2533a..0dc421bb494f 1006=
44
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -202,6 +202,9 @@ static notrace u8 xive_esb_read(struct xive_irq_data
> *xd, u32 offset) {
>  	u64 val;
>=20
> +	if (offset =3D=3D XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE=
_EOI)
> +		offset |=3D XIVE_ESB_LD_ST_MO;
> +
>  	/* Handle HW errata */
>  	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>  		offset |=3D offset << 4;
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> b/arch/powerpc/kvm/book3s_hv_rmhandlers.S index e11017897eb0..abe132ff2346
> 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -2911,6 +2911,11 @@ kvm_cede_exit:
>  	beq	4f
>  	li	r0, 0
>  	stb	r0, VCPU_CEDED(r9)
> +	/*
> +	 * The escalation interrupts are special as we don't EOI them.
> +	 * There is no need to use the load-after-store ordering offset
> +	 * to set PQ to 10 as we won't use StoreEOI.
> +	 */
>  	li	r6, XIVE_ESB_SET_PQ_10
>  	b	5f
>  4:	li	r0, 1




