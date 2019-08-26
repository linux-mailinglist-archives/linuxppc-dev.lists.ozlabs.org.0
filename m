Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC58D9CC96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 11:29:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H6CM3069zDqfK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 19:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H69X4QjJzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 19:27:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="ed2gjQJ5"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46H69X21BVz9sNf; Mon, 26 Aug 2019 19:27:44 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46H69X1FB6z9sN4; Mon, 26 Aug 2019 19:27:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566811664;
 bh=5DZPdezmkkdNYZmOyx43f9hYg6ppYgPDEvOep8hbPXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ed2gjQJ5oS+Z5PpzEQZVQezY66LRysFnE5BCPXn/d6ArszdeWCxxtm8MG2YfqYepq
 g0G6lE3Q1wDvc9rPVpXDnYmPAu1aPXaCp8d5VMhmn8Rr+D+eml92om5hkM+OpwWPtO
 X4igow72EVjG8Fsz37ox3LORba/5ZvZnPb9TpVZs=
Date: Mon, 26 Aug 2019 18:41:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH] KVM: PPC: Book3S: Enable XIVE native capability only if
 OPAL has required functions
Message-ID: <20190826084158.GC28081@umbus.fritz.box>
References: <20190826081455.GA7402@blackberry>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline
In-Reply-To: <20190826081455.GA7402@blackberry>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linuxppc-dev@ozlabs.org, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2019 at 06:14:55PM +1000, Paul Mackerras wrote:
> There are some POWER9 machines where the OPAL firmware does not support
> the OPAL_XIVE_GET_QUEUE_STATE and OPAL_XIVE_SET_QUEUE_STATE calls.
> The impact of this is that a guest using XIVE natively will not be able
> to be migrated successfully.  On the source side, the get_attr operation
> on the KVM native device for the KVM_DEV_XIVE_GRP_EQ_CONFIG attribute
> will fail; on the destination side, the set_attr operation for the same
> attribute will fail.
>=20
> This adds tests for the existence of the OPAL get/set queue state
> functions, and if they are not supported, the XIVE-native KVM device
> is not created and the KVM_CAP_PPC_IRQ_XIVE capability returns false.
> Userspace can then either provide a software emulation of XIVE, or
> else tell the guest that it does not have a XIVE controller available
> to it.
>=20
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/include/asm/kvm_ppc.h    | 1 +
>  arch/powerpc/include/asm/xive.h       | 1 +
>  arch/powerpc/kvm/book3s.c             | 8 +++++---
>  arch/powerpc/kvm/book3s_xive_native.c | 5 +++++
>  arch/powerpc/kvm/powerpc.c            | 3 ++-
>  arch/powerpc/sysdev/xive/native.c     | 7 +++++++
>  6 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/as=
m/kvm_ppc.h
> index 2484e6a..8e8514e 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -598,6 +598,7 @@ extern int kvmppc_xive_native_get_vp(struct kvm_vcpu =
*vcpu,
>  				     union kvmppc_one_reg *val);
>  extern int kvmppc_xive_native_set_vp(struct kvm_vcpu *vcpu,
>  				     union kvmppc_one_reg *val);
> +extern bool kvmppc_xive_native_supported(void);
> =20
>  #else
>  static inline int kvmppc_xive_set_xive(struct kvm *kvm, u32 irq, u32 ser=
ver,
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
> index efb0e59..818989e 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -135,6 +135,7 @@ extern int xive_native_get_queue_state(u32 vp_id, uin=
t32_t prio, u32 *qtoggle,
>  extern int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qto=
ggle,
>  				       u32 qindex);
>  extern int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
> +extern bool xive_native_has_queue_state_support(void);
> =20
>  #else
> =20
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index 9524d92..d7fcdfa 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -1083,9 +1083,11 @@ static int kvmppc_book3s_init(void)
>  	if (xics_on_xive()) {
>  		kvmppc_xive_init_module();
>  		kvm_register_device_ops(&kvm_xive_ops, KVM_DEV_TYPE_XICS);
> -		kvmppc_xive_native_init_module();
> -		kvm_register_device_ops(&kvm_xive_native_ops,
> -					KVM_DEV_TYPE_XIVE);
> +		if (kvmppc_xive_native_supported()) {
> +			kvmppc_xive_native_init_module();
> +			kvm_register_device_ops(&kvm_xive_native_ops,
> +						KVM_DEV_TYPE_XIVE);
> +		}
>  	} else
>  #endif
>  		kvm_register_device_ops(&kvm_xics_ops, KVM_DEV_TYPE_XICS);
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/boo=
k3s_xive_native.c
> index f0cab43..248c1ea 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1179,6 +1179,11 @@ int kvmppc_xive_native_set_vp(struct kvm_vcpu *vcp=
u, union kvmppc_one_reg *val)
>  	return 0;
>  }
> =20
> +bool kvmppc_xive_native_supported(void)
> +{
> +	return xive_native_has_queue_state_support();
> +}
> +
>  static int xive_native_debug_show(struct seq_file *m, void *private)
>  {
>  	struct kvmppc_xive *xive =3D m->private;
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 0dba7eb..7012dd7 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -566,7 +566,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>  		 * a POWER9 processor) and the PowerNV platform, as
>  		 * nested is not yet supported.
>  		 */
> -		r =3D xive_enabled() && !!cpu_has_feature(CPU_FTR_HVMODE);
> +		r =3D xive_enabled() && !!cpu_has_feature(CPU_FTR_HVMODE) &&
> +			kvmppc_xive_native_supported();
>  		break;
>  #endif
> =20
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
> index 2f26b74..37987c8 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -800,6 +800,13 @@ int xive_native_set_queue_state(u32 vp_id, u32 prio,=
 u32 qtoggle, u32 qindex)
>  }
>  EXPORT_SYMBOL_GPL(xive_native_set_queue_state);
> =20
> +bool xive_native_has_queue_state_support(void)
> +{
> +	return opal_check_token(OPAL_XIVE_GET_QUEUE_STATE) &&
> +		opal_check_token(OPAL_XIVE_SET_QUEUE_STATE);
> +}
> +EXPORT_SYMBOL_GPL(xive_native_has_queue_state_support);
> +
>  int xive_native_get_vp_state(u32 vp_id, u64 *out_state)
>  {
>  	__be64 state;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1jm1MACgkQbDjKyiDZ
s5KqXxAAnOqs0fgpY4+Tulc1qV172v1THLH3AErXVoe/x546/1lUmMK+quN71Kat
X6MxrUsC8S2EN1MQ76IbZyf87lpLL6JIwKV8g4mHLI9YxkIUHnlbO7bS8qGDeHQ3
nMZFsvyKHkdxCAyQEXEK/BZ/U++4gDHuFD0v/X9G7tb69Fzs0LU1W6zo6ohiwIxn
GqdhOIsx89w63Y+bQM67I6v1vX5F2clJ/3n4jXTaPi2H4Dbv7DR5UMXjy+skuXGD
5331vx4BzcuWLRJEWasIccMMyPjeRWQitZDon1iM5yZFhDDJxa9NzBe4yhWRTi4q
Z+9ZkM57Ocn2UBEck5rPEtU+65KiF/4BZPNZShL3JP4uF7hmV59flopAG/IlLvru
O4sM7Q7mqg16T5AnEPf3URY0VBxuOYnjw9KiBrul5xic/oPW0yh5GF6fz/Qh5sE3
rJ2PeLu981neSBIRJA+6mlqPCJCH7hqKXE9tl0pdqF1kuuVUW80+qQ2RSGapG/P0
4inJzxAAwEEnvmrE2mzn56EIYqRvuZ97N/F9CHCwBUBW0SS6CHUz74jfqJAncxmG
YNGaWiyUMDOykHVU2IklLiAmMiwJVFZE/qHnTNHU6/MYr5Tm93pjy46DkZ6NBIDn
/MrdIc0HmpXhZeoazu6qzT25eSeB1SZvKigmOncJkQGXgNcnSCY=
=9P0c
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
