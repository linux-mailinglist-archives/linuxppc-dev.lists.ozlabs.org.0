Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0D32CD3C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 08:01:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrhcM2X3dz3d8V
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 18:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=O6uN1+ar;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=O6uN1+ar; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrhbR3l5zz30JC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 18:00:51 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DrhbK10Ygz9sRf; Thu,  4 Mar 2021 18:00:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614841245;
 bh=MFvEsPtNECyZ+EAM4aMoblYWUXq/S/CCBpo2A5jbvl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O6uN1+arBjrKq0cxxuQLWJ0StQbWyg4OvuQMfhryDBHlVqdO8LjqjQqfSJOyPlvc1
 bIET68joJALivFHWCYI6kVvdTl9hwmevKCqmq4aHTKNRNw3+agnST1rk+ZM/zFpRNS
 Df309d+3obRD7C1c3MBbtKgcuwiZGuRRNShkTreQ=
Date: Thu, 4 Mar 2021 17:56:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v5 2/3] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <YECEmkb0mGCJP0M0@yekko.fritz.box>
References: <20210224082510.3962423-1-bharata@linux.ibm.com>
 <20210224082510.3962423-3-bharata@linux.ibm.com>
 <YD2YrkY0cg+uO+wz@yekko.fritz.box>
 <20210302045853.GC188607@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZCMh9tBN2+kVRtHm"
Content-Disposition: inline
In-Reply-To: <20210302045853.GC188607@in.ibm.com>
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


--ZCMh9tBN2+kVRtHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 10:28:53AM +0530, Bharata B Rao wrote:
> On Tue, Mar 02, 2021 at 12:45:18PM +1100, David Gibson wrote:
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/=
api.rst
> > > index 45fd862ac128..38ce3f21b21f 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -6225,6 +6225,24 @@ KVM_RUN_BUS_LOCK flag is used to distinguish b=
etween them.
> > >  This capability can be used to check / enable 2nd DAWR feature provi=
ded
> > >  by POWER10 processor.
> > > =20
> > > +7.23 KVM_CAP_PPC_RPT_INVALIDATE
> > > +------------------------------
> > > +
> > > +:Capability: KVM_CAP_PPC_RPT_INVALIDATE
> > > +:Architectures: ppc
> > > +:Type: vm
> > > +
> > > +This capability indicates that the kernel is capable of handling
> > > +H_RPT_INVALIDATE hcall.
> > > +
> > > +In order to enable the use of H_RPT_INVALIDATE in the guest,
> > > +user space might have to advertise it for the guest. For example,
> > > +IBM pSeries (sPAPR) guest starts using it if "hcall-rpt-invalidate" =
is
> > > +present in the "ibm,hypertas-functions" device-tree property.
> > > +
> > > +This capability is enabled for hypervisors on platforms like POWER9
> > > +that support radix MMU.
> >=20
> > Does this mean that KVM will handle the hypercall, even if not
> > explicitly enabled by userspace (qemu)?  That's generally not what we
> > want, since we need to allow qemu to set up backwards compatible
> > guests.
>=20
> This capability only indicates that hypervisor supports the hcall.
>=20
> QEMU will check for this and conditionally enable the hcall
> (via KVM_CAP_PPC_ENABLE_HCALL ioctl). Enabling the hcall is
> conditional to cap-rpt-invalidate sPAPR machine capability being
> enabled by the user. Will post a followup QEMU patch shortly.

Ok.

> Older QEMU patch can be found here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00627.html
>=20
> >=20
> > > +
> > >  8. Other capabilities.
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =20
> > > diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/ar=
ch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > > index 8b33601cdb9d..a46fd37ad552 100644
> > > --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > > +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > > @@ -4,6 +4,10 @@
> > > =20
> > >  #include <asm/hvcall.h>
> > > =20
> > > +#define RIC_FLUSH_TLB 0
> > > +#define RIC_FLUSH_PWC 1
> > > +#define RIC_FLUSH_ALL 2
> > > +
> > >  struct vm_area_struct;
> > >  struct mm_struct;
> > >  struct mmu_gather;
> > > diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/inc=
lude/asm/kvm_book3s.h
> > > index 2f5f919f6cd3..a1515f94400e 100644
> > > --- a/arch/powerpc/include/asm/kvm_book3s.h
> > > +++ b/arch/powerpc/include/asm/kvm_book3s.h
> > > @@ -305,6 +305,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 =
dw0, u64 dw1);
> > >  void kvmhv_release_all_nested(struct kvm *kvm);
> > >  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
> > >  long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
> > > +long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
> > > +			 unsigned long type, unsigned long pg_sizes,
> > > +			 unsigned long start, unsigned long end);
> > >  int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
> > >  			  u64 time_limit, unsigned long lpcr);
> > >  void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state=
 *hr);
> > > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/in=
clude/asm/mmu_context.h
> > > index 652ce85f9410..820caf4e01b7 100644
> > > --- a/arch/powerpc/include/asm/mmu_context.h
> > > +++ b/arch/powerpc/include/asm/mmu_context.h
> > > @@ -124,8 +124,19 @@ static inline bool need_extra_context(struct mm_=
struct *mm, unsigned long ea)
> > > =20
> > >  #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RAD=
IX_MMU)
> > >  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> > > +void do_h_rpt_invalidate(unsigned long pid, unsigned long lpid,
> > > +			 unsigned long type, unsigned long page_size,
> > > +			 unsigned long psize, unsigned long start,
> > > +			 unsigned long end);
> > >  #else
> > >  static inline void radix_kvm_prefetch_workaround(struct mm_struct *m=
m) { }
> > > +static inline void do_h_rpt_invalidate(unsigned long pid,
> > > +				       unsigned long lpid,
> > > +				       unsigned long type,
> > > +				       unsigned long page_size,
> > > +				       unsigned long psize,
> > > +				       unsigned long start,
> > > +				       unsigned long end) { }
> > >  #endif
> > > =20
> > >  extern void switch_cop(struct mm_struct *next);
> > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_h=
v.c
> > > index 13bad6bf4c95..d83f006fc19d 100644
> > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > @@ -921,6 +921,69 @@ static int kvmppc_get_yield_count(struct kvm_vcp=
u *vcpu)
> > >  	return yield_count;
> > >  }
> > > =20
> > > +static void do_h_rpt_invalidate_prs(unsigned long pid, unsigned long=
 lpid,
> > > +				    unsigned long type, unsigned long pg_sizes,
> > > +				    unsigned long start, unsigned long end)
> > > +{
> > > +	unsigned long psize;
> > > +	struct mmu_psize_def *def;
> > > +
> > > +	for (psize =3D 0; psize < MMU_PAGE_COUNT; psize++) {
> > > +		def =3D &mmu_psize_defs[psize];
> > > +		if (pg_sizes & def->h_rpt_pgsize)
> > > +			do_h_rpt_invalidate(pid, lpid, type,
> > > +					    (1UL << def->shift), psize,
> > > +					    start, end);
> > > +	}
> > > +}
> > > +
> > > +static void kvmppc_nested_rpt_invalidate(struct kvm_vcpu *vcpu)
> > > +{
> > > +	do_h_rpt_invalidate_prs(kvmppc_get_gpr(vcpu, 4),
> > > +				vcpu->arch.nested->shadow_lpid,
> > > +				kvmppc_get_gpr(vcpu, 5),
> > > +				kvmppc_get_gpr(vcpu, 6),
> > > +				kvmppc_get_gpr(vcpu, 7),
> > > +				kvmppc_get_gpr(vcpu, 8));
> > > +	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> > > +}
> > > +
> > > +static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
> > > +				    unsigned long pid, unsigned long target,
> > > +				    unsigned long type, unsigned long pg_sizes,
> > > +				    unsigned long start, unsigned long end)
> > > +{
> > > +	if (!kvm_is_radix(vcpu->kvm))
> > > +		return H_UNSUPPORTED;
> > > +
> > > +	/*
> > > +	 * For nested guests, this hcall is handled in
> > > +	 * L0. See kvmppc_handle_nested_exit() for details.
> > > +	 */
> > > +	if (kvmhv_on_pseries())
> > > +		return H_UNSUPPORTED;
> > > +
> > > +	if (end < start)
> > > +		return H_P5;
> > > +
> > > +	if (type & H_RPTI_TYPE_NESTED) {
> > > +		if (!nesting_enabled(vcpu->kvm))
> > > +			return H_FUNCTION;
> > > +
> > > +		/* Support only cores as target */
> > > +		if (target !=3D H_RPTI_TARGET_CMMU)
> > > +			return H_P2;
> > > +
> >=20
> > IIUC, we'll hit this code path if an L1 calls this on behalf of an L2,
>=20
> Correct.
>=20
> > whereas we'll hit the nested exit code path going straight to
> > kvmhv_h_rpti_nested() if an L2 calls it on behalf of an L3.  Is that
> > right?
>=20
> We will hit the nested exit code path when L2 calls it on behalf
> of L3. Looks like I am not handling this case (hcall issued by
> L2 on behalf of L3 for handling partition scoped translations)
> in the nested exit path.
>=20
> >=20
> > > +		return kvmhv_h_rpti_nested(vcpu, pid,
> > > +					   (type & ~H_RPTI_TYPE_NESTED),
> > > +					    pg_sizes, start, end);
> > > +	}
> > > +
> > > +	do_h_rpt_invalidate_prs(pid, vcpu->kvm->arch.lpid, type, pg_sizes,
> > > +				start, end);
> > > +	return H_SUCCESS;
> > > +}
> > > +
> > >  int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
> > >  {
> > >  	unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> > > @@ -1129,6 +1192,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *v=
cpu)
> > >  		 */
> > >  		ret =3D kvmppc_h_svm_init_abort(vcpu->kvm);
> > >  		break;
> > > +	case H_RPT_INVALIDATE:
> > > +		ret =3D kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
> > > +					      kvmppc_get_gpr(vcpu, 5),
> > > +					      kvmppc_get_gpr(vcpu, 6),
> > > +					      kvmppc_get_gpr(vcpu, 7),
> > > +					      kvmppc_get_gpr(vcpu, 8),
> > > +					      kvmppc_get_gpr(vcpu, 9));
> > > +		break;
> > > =20
> > >  	default:
> > >  		return RESUME_HOST;
> > > @@ -1175,6 +1246,7 @@ static int kvmppc_hcall_impl_hv(unsigned long c=
md)
> > >  	case H_XIRR_X:
> > >  #endif
> > >  	case H_PAGE_INIT:
> > > +	case H_RPT_INVALIDATE:
> > >  		return 1;
> > >  	}
> > > =20
> > > @@ -1590,6 +1662,24 @@ static int kvmppc_handle_nested_exit(struct kv=
m_vcpu *vcpu)
> > >  		if (!xics_on_xive())
> > >  			kvmppc_xics_rm_complete(vcpu, 0);
> > >  		break;
> > > +	case BOOK3S_INTERRUPT_SYSCALL:
> > > +	{
> > > +		unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> > > +
> > > +		/*
> > > +		 * The H_RPT_INVALIDATE hcalls issued by nested
> > > +		 * guests for process scoped invalidations when
> > > +		 * GTSE=3D0, are handled here in L0.
> > > +		 */
> >=20
> > What if the L2 is not calling this for the GTSE=3D0 case, but on behalf
> > of an L3?
>=20
> That case would be for flushing partition scoped translations. I am
> realizing that I am not handling that case, but it should be handled
> here in the nested hcall exit path.
>=20
> Currently I am handling only the hcall requests for process scoped
> translations from nested guests here.

Ok.  At the very least you need to detect and fail for that case.

> >=20
> > > +		if (req =3D=3D H_RPT_INVALIDATE) {
> > > +			kvmppc_nested_rpt_invalidate(vcpu);
> > > +			r =3D RESUME_GUEST;
> > > +			break;
> > > +		}
> > > +
> > > +		r =3D RESUME_HOST;
> > > +		break;
> > > +	}
> > >  	default:
> > >  		r =3D RESUME_HOST;
> > >  		break;
> > > diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/b=
ook3s_hv_nested.c
> > > index 0cd0e7aad588..ca43b2d38dce 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_nested.c
> > > +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> > > @@ -1191,6 +1191,83 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vc=
pu)
> > >  	return H_SUCCESS;
> > >  }
> > > =20
> > > +static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
> > > +					 unsigned long lpid,
> > > +					 unsigned long page_size,
> > > +					 unsigned long ap,
> > > +					 unsigned long start,
> > > +					 unsigned long end)
> > > +{
> > > +	unsigned long addr =3D start;
> > > +	int ret;
> > > +
> > > +	do {
> > > +		ret =3D kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
> > > +						   get_epn(addr));
> > > +		if (ret)
> > > +			return ret;
> > > +		addr +=3D page_size;
> > > +	} while (addr < end);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
> > > +					 unsigned long lpid)
> > > +{
> > > +	struct kvm *kvm =3D vcpu->kvm;
> > > +	struct kvm_nested_guest *gp;
> > > +
> > > +	gp =3D kvmhv_get_nested(kvm, lpid, false);
> > > +	if (gp) {
> > > +		kvmhv_emulate_tlbie_lpid(vcpu, gp, RIC_FLUSH_ALL);
> > > +		kvmhv_put_nested(gp);
> > > +	}
> > > +	return H_SUCCESS;
> > > +}
> > > +
> > > +long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
> > > +			 unsigned long type, unsigned long pg_sizes,
> > > +			 unsigned long start, unsigned long end)
> > > +{
> > > +	struct kvm_nested_guest *gp;
> > > +	long ret;
> > > +	unsigned long psize, ap;
> > > +
> > > +	/*
> > > +	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
> > > +	 *
> > > +	 * However, nested KVM issues a L2 lpid flush call when creating
> > > +	 * partition table entries for L2. This happens even before the
> > > +	 * corresponding shadow lpid is created in HV which happens in
> > > +	 * H_ENTER_NESTED call. Since we can't differentiate this case from
> > > +	 * the invalid case, we ignore such flush requests and return succe=
ss.
> > > +	 */
> >=20
> > What if this is being called on behalf of an L3 or deeper?  Do we need
> > something to do a translation from L3 to L2 addresses?
>=20
> I am not sure, I will have to check if gp->shadow_lpid points to
> correct nested LPID in all the cases.
>=20
> >=20
> > > +	gp =3D kvmhv_find_nested(vcpu->kvm, lpid);
> > > +	if (!gp)
> > > +		return H_SUCCESS;
>=20
> Regards,
> Bharata.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZCMh9tBN2+kVRtHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBAhJgACgkQbDjKyiDZ
s5KiJQ/+KHQjlD3CiWFD7CmOFHb7RiYJEueoJF1OMRbTgeAJbfV8GtkD8IQ09VWG
4WVgQPlGYrblKkc1M10lzk3lqC4iV67G4caIzgiNf38O3sA6QdXlR8xA4yoJElKc
KYu3fag4ydJARpOPsHExKXuXKetEgd3QB0l7VZtgREo4Fo610GIuhicMG0Jr9Lu6
ECVOr/restGq1wrBkaXrO6YuZBCPoRNqXa4lN23xTd9aa4xeNexm3kt8DsCQCvcl
i7uc5gMnDvpIf7oMbId6F8EeCL+/Br4yAedtaiOFqpn7UrYNNL93k1rFSODT2Fea
wWIn2Kp2SO0NJ27KoxuQuNLbKixPIZB1F5UY+PrZUfqS4We1kJD4pyNJ6tFnV7cm
nYFyVxLjjqI3aMZlhtn/Zzphoq1k6vcGjf0/44lWBErHCXnRfVqz3FPGBt64Jdx9
6lWOa0+EBuSuxP4omgnFIPj+piBkzqDrgx6fSYnGsJS/M/61H3c/dQr2a6W91qwl
x1HMINFfSnOIc3FilDdM2p2bYn+XbTW0MOV+cmD9jUMfzRDIjz/d9QFkpajwumKY
/ztJq7m9XSc6gbMMY+giLK0ruM35NRydRRznDFV1loZ3AwOpKBV/19vwTRrJHr+P
AMOx6iDJq4nrUux+dFxA9iHPhIuG1gaj33A6YNkYEvl0pJo9DVM=
=Kd+0
-----END PGP SIGNATURE-----

--ZCMh9tBN2+kVRtHm--
