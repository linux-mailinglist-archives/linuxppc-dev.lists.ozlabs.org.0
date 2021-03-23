Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B939345585
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Fqy1PKbz3bs6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 13:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=Q7dNcqmG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=Q7dNcqmG; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Fq41FFlz30Bt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:35:59 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4Fq26sznz9sVt; Tue, 23 Mar 2021 13:35:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616466958;
 bh=uffToqj4Zz//s6Da4+iWvUfhBr+uZ/jCN4cKfU9hUw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q7dNcqmGvrG/YNZs7nhFhnkOn/KP3MJRgmQJ0xnjNjY9Wjy9nnI82mmYS1IwWaq2e
 rMcXOi2Nn3STJkHUKV9i7QCfqlsSJFRKcDbTwxU+GEo5QoPH1DOSFDf8GkVHJmKIhz
 /zWjdCb+FFWN6yMetjJEf+giUpZO1uqDnmRUjYZk=
Date: Tue, 23 Mar 2021 13:33:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v6 4/6] KVM: PPC: Book3S HV: Nested support in
 H_RPT_INVALIDATE
Message-ID: <YFlTcauBzA8APjjX@yekko.fritz.box>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
 <20210311083939.595568-5-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r1OAT0jrWOgqEPEU"
Content-Disposition: inline
In-Reply-To: <20210311083939.595568-5-bharata@linux.ibm.com>
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--r1OAT0jrWOgqEPEU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 02:09:37PM +0530, Bharata B Rao wrote:
> Enable support for process-scoped invalidations from nested
> guests and partition-scoped invalidations for nested guests.
>=20
> Process-scoped invalidations for any level of nested guests
> are handled by implementing H_RPT_INVALIDATE handler in the
> nested guest exit path in L0.
>=20
> Partition-scoped invalidation requests are forwarded to the
> right nested guest, handled there and passed down to L0
> for eventual handling.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 	[Nested guest partition-scoped invalidation changes]

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/include/asm/kvm_book3s.h |   3 +
>  arch/powerpc/kvm/book3s_hv.c          |  71 +++++++++++++++++-
>  arch/powerpc/kvm/book3s_hv_nested.c   | 104 ++++++++++++++++++++++++++
>  3 files changed, 175 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include=
/asm/kvm_book3s.h
> index 2f5f919f6cd3..de8fc5a4d19c 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -305,6 +305,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0,=
 u64 dw1);
>  void kvmhv_release_all_nested(struct kvm *kvm);
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
>  long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
> +long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			     unsigned long type, unsigned long pg_sizes,
> +			     unsigned long start, unsigned long end);
>  int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
>  			  u64 time_limit, unsigned long lpcr);
>  void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr=
);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 5d008468347c..03755389efd1 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -922,6 +922,46 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *v=
cpu)
>  	return yield_count;
>  }
> =20
> +/*
> + * H_RPT_INVALIDATE hcall handler for nested guests.
> + *
> + * Handles only nested process-scoped invalidation requests in L0.
> + */
> +static int kvmppc_nested_h_rpt_invalidate(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long type =3D kvmppc_get_gpr(vcpu, 6);
> +	unsigned long pid, pg_sizes, start, end, psize;
> +	struct kvm_nested_guest *gp;
> +	struct mmu_psize_def *def;
> +
> +	/*
> +	 * The partition-scoped invalidations aren't handled here in L0.
> +	 */
> +	if (type & H_RPTI_TYPE_NESTED)
> +		return RESUME_HOST;
> +
> +	pid =3D kvmppc_get_gpr(vcpu, 4);
> +	pg_sizes =3D kvmppc_get_gpr(vcpu, 7);
> +	start =3D kvmppc_get_gpr(vcpu, 8);
> +	end =3D kvmppc_get_gpr(vcpu, 9);
> +
> +	gp =3D kvmhv_get_nested(vcpu->kvm, vcpu->kvm->arch.lpid, false);
> +	if (!gp)
> +		goto out;
> +
> +	for (psize =3D 0; psize < MMU_PAGE_COUNT; psize++) {
> +		def =3D &mmu_psize_defs[psize];
> +		if (pg_sizes & def->h_rpt_pgsize)
> +			do_h_rpt_invalidate_prt(pid, gp->shadow_lpid, type,
> +						(1UL << def->shift), psize,
> +						start, end);
> +	}
> +	kvmhv_put_nested(gp);
> +out:
> +	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> +	return RESUME_GUEST;
> +}
> +
>  static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
>  				    unsigned long id, unsigned long target,
>  				    unsigned long type, unsigned long pg_sizes,
> @@ -938,10 +978,18 @@ static long kvmppc_h_rpt_invalidate(struct kvm_vcpu=
 *vcpu,
> =20
>  	/*
>  	 * Partition-scoped invalidation for nested guests.
> -	 * Not yet supported
>  	 */
> -	if (type & H_RPTI_TYPE_NESTED)
> -		return H_P3;
> +	if (type & H_RPTI_TYPE_NESTED) {
> +		if (!nesting_enabled(vcpu->kvm))
> +			return H_FUNCTION;
> +
> +		/* Support only cores as target */
> +		if (target !=3D H_RPTI_TARGET_CMMU)
> +			return H_P2;
> +
> +		return do_h_rpt_invalidate_pat(vcpu, id, type, pg_sizes,
> +					       start, end);
> +	}
> =20
>  	/*
>  	 * Process-scoped invalidation for L1 guests.
> @@ -1636,6 +1684,23 @@ static int kvmppc_handle_nested_exit(struct kvm_vc=
pu *vcpu)
>  		if (!xics_on_xive())
>  			kvmppc_xics_rm_complete(vcpu, 0);
>  		break;
> +	case BOOK3S_INTERRUPT_SYSCALL:
> +	{
> +		unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> +
> +		/*
> +		 * The H_RPT_INVALIDATE hcalls issued by nested
> +		 * guests for process-scoped invalidations when
> +		 * GTSE=3D0, are handled here in L0.
> +		 */
> +		if (req =3D=3D H_RPT_INVALIDATE) {
> +			r =3D kvmppc_nested_h_rpt_invalidate(vcpu);
> +			break;
> +		}
> +
> +		r =3D RESUME_HOST;
> +		break;
> +	}
>  	default:
>  		r =3D RESUME_HOST;
>  		break;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 0cd0e7aad588..adcc8e26ef22 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1191,6 +1191,110 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
>  	return H_SUCCESS;
>  }
> =20
> +static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid,
> +					 unsigned long page_size,
> +					 unsigned long ap,
> +					 unsigned long start,
> +					 unsigned long end)
> +{
> +	unsigned long addr =3D start;
> +	int ret;
> +
> +	do {
> +		ret =3D kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
> +						   get_epn(addr));
> +		if (ret)
> +			return ret;
> +		addr +=3D page_size;
> +	} while (addr < end);
> +
> +	return ret;
> +}
> +
> +static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid, unsigned long ric)
> +{
> +	struct kvm *kvm =3D vcpu->kvm;
> +	struct kvm_nested_guest *gp;
> +
> +	gp =3D kvmhv_get_nested(kvm, lpid, false);
> +	if (gp) {
> +		kvmhv_emulate_tlbie_lpid(vcpu, gp, ric);
> +		kvmhv_put_nested(gp);
> +	}
> +	return H_SUCCESS;
> +}
> +
> +/*
> + * Performs partition-scoped invalidations for nested guests
> + * as part of H_RPT_INVALIDATE hcall.
> + */
> +long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			     unsigned long type, unsigned long pg_sizes,
> +			     unsigned long start, unsigned long end)
> +{
> +	struct kvm_nested_guest *gp;
> +	long ret;
> +	unsigned long psize, ap;
> +
> +	/*
> +	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
> +	 *
> +	 * However, nested KVM issues a L2 lpid flush call when creating
> +	 * partition table entries for L2. This happens even before the
> +	 * corresponding shadow lpid is created in HV which happens in
> +	 * H_ENTER_NESTED call. Since we can't differentiate this case from
> +	 * the invalid case, we ignore such flush requests and return success.
> +	 */
> +	gp =3D kvmhv_find_nested(vcpu->kvm, lpid);
> +	if (!gp)
> +		return H_SUCCESS;
> +
> +	/*
> +	 * A flush all request can be handled by a full lpid flush only.
> +	 */
> +	if ((type & H_RPTI_TYPE_NESTED_ALL) =3D=3D H_RPTI_TYPE_NESTED_ALL)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_ALL);
> +
> +#if 0
> +	/*
> +	 * We don't need to handle a PWC flush like process table here,
> +	 * because intermediate partition scoped table in nested guest doesn't
> +	 * really have PWC. Only level we have PWC is in L0 and for nested
> +	 * invalidate at L0 we always do kvm_flush_lpid() which does
> +	 * radix__flush_all_lpid(). For range invalidate at any level, we
> +	 * are not removing the higher level page tables and hence there is
> +	 * no PWC invalidate needed.
> +	 */
> +	if (type & H_RPTI_TYPE_PWC) {
> +		ret =3D do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_PWC);
> +		if (ret)
> +			return H_P4;
> +	}
> +#endif
> +
> +	if (start =3D=3D 0 && end =3D=3D -1)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_TLB);
> +
> +	if (type & H_RPTI_TYPE_TLB) {
> +		struct mmu_psize_def *def;
> +
> +		for (psize =3D 0; psize < MMU_PAGE_COUNT; psize++) {
> +			def =3D &mmu_psize_defs[psize];
> +			if (!(pg_sizes & def->h_rpt_pgsize))
> +				continue;
> +
> +			ret =3D do_tlb_invalidate_nested_tlb(vcpu, lpid,
> +							   (1UL << def->shift),
> +							   ap, start, end);
> +			if (ret)
> +				return H_P4;
> +		}
> +	}
> +	return H_SUCCESS;
> +}
> +
>  /* Used to convert a nested guest real address to a L1 guest real addres=
s */
>  static int kvmhv_translate_addr_nested(struct kvm_vcpu *vcpu,
>  				       struct kvm_nested_guest *gp,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--r1OAT0jrWOgqEPEU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZU3EACgkQbDjKyiDZ
s5IQCA//dpsGmrpFkx3ZZ81DtZOYJMSQlaA4Qj5TzciJlF0qWUAlJv3P3pFkZfG1
XQDHfW4n9yO0f6+cbgPp9dh6VLHKO1HI1sOL6ttZmoRB8gJvdomSAOnrd5ZEmbPA
CAkFx2iB94ziUow8GKQKcT7QF+wvQCbVsdYz0NwAWG1HZUP5mdwfSDXmOl1fr4yD
22Ej5rTrC0qJFb1UDScUT4v9x9wQPrgbyS5/qdhwR2a6lPF0Smp/xTRKWfipct4F
QoOxiDsB8PsEIj1xK6WpDVaJ+Be8sFnq8OFnFh7BECVet+89OacbbpJY7X8qc/Co
vYMf22l1rcJuy1gooKFfh3Bb9j2dwob+f6WFQDBtoFDcwaBO91hV33artzZX8uw0
AIxd576xRVmqbNpNVqCiI88WzNyL/fLCnacA1zkW0/U2xJbRRSgKR2mVjhwlcrwu
vdmlAE4aiSCBMqLlNXLJI8dv6Kg2bkUwM97LOtTaIYHeQ2sn0yb8hE65ljUFp7IZ
wxL8U2xvgvgcjWTT8xDD+OezD83jc7kZkqF2CU8Q6N8dSJXykPMgZX9XDyOM0kj9
qkGC5eB4qeDZdKPCACQrxH6sJpCjFHjPsyAyY8fduth+o11tEyXycCj15LCjh4lZ
0gYBn0R2D7xlHSetxxGvWbNRXBhq5rF3LKCaiYprBXngBkW1kjk=
=nL3w
-----END PGP SIGNATURE-----

--r1OAT0jrWOgqEPEU--
