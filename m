Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147F322475
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 04:08:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl3ry5Xqqz3cH8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 14:08:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=RwkBmspB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=RwkBmspB; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl3rV1rxQz30Qv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 14:07:37 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rS4KKCz9sVF; Tue, 23 Feb 2021 14:07:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614049656;
 bh=sgC7aR4rh50aHjSpJhVoj4gGB6SwMndr271GcvZF6PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RwkBmspBxRr44aj536Ij5ZTsH/Zc9wTaHfvJxL8WxnZl6tZlPyHbNm8LQJWNpM6/t
 GmVNZ81VouOqoGSi54XA/9raWmJB8mlBqQ5vZm7WOHWlxuE9wbeg0zbuo09/pT3GRQ
 qRFHVCuO3kcAkGARZ4m5gRgf5dlHmFxOayuldyCw=
Date: Tue, 23 Feb 2021 10:26:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <YDQ9n6Tj0usuzibX@yekko.fritz.box>
References: <20210215063542.3642366-1-bharata@linux.ibm.com>
 <20210215063542.3642366-3-bharata@linux.ibm.com>
 <YCxlb133Hf6hLjuD@yekko.fritz.box>
 <20210222064608.GB3672042@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WH716LgmVfRC5lia"
Content-Disposition: inline
In-Reply-To: <20210222064608.GB3672042@in.ibm.com>
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


--WH716LgmVfRC5lia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 12:16:08PM +0530, Bharata B Rao wrote:
> On Wed, Feb 17, 2021 at 11:38:07AM +1100, David Gibson wrote:
> > On Mon, Feb 15, 2021 at 12:05:41PM +0530, Bharata B Rao wrote:
> > > Implement H_RPT_INVALIDATE hcall and add KVM capability
> > > KVM_CAP_PPC_RPT_INVALIDATE to indicate the support for the same.
> > >=20
> > > This hcall does two types of TLB invalidations:
> > >=20
> > > 1. Process-scoped invalidations for guests with LPCR[GTSE]=3D0.
> > >    This is currently not used in KVM as GTSE is not usually
> > >    disabled in KVM.
> > > 2. Partition-scoped invalidations that an L1 hypervisor does on
> > >    behalf of an L2 guest. This replaces the uses of the existing
> > >    hcall H_TLB_INVALIDATE.
> > >=20
> > > In order to handle process scoped invalidations of L2, we
> > > intercept the nested exit handling code in L0 only to handle
> > > H_TLB_INVALIDATE hcall.
> > >=20
> > > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > > ---
> > >  Documentation/virt/kvm/api.rst         | 17 +++++
> > >  arch/powerpc/include/asm/kvm_book3s.h  |  3 +
> > >  arch/powerpc/include/asm/mmu_context.h | 11 +++
> > >  arch/powerpc/kvm/book3s_hv.c           | 91 ++++++++++++++++++++++++
> > >  arch/powerpc/kvm/book3s_hv_nested.c    | 96 ++++++++++++++++++++++++=
++
> > >  arch/powerpc/kvm/powerpc.c             |  3 +
> > >  arch/powerpc/mm/book3s64/radix_tlb.c   | 25 +++++++
> > >  include/uapi/linux/kvm.h               |  1 +
> > >  8 files changed, 247 insertions(+)
> > >=20
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/=
api.rst
> > > index 99ceb978c8b0..416c36aa35d4 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -6038,6 +6038,23 @@ KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR exit=
 notifications which user space
> > >  can then handle to implement model specific MSR handling and/or user=
 notifications
> > >  to inform a user that an MSR was not handled.
> > > =20
> > > +7.22 KVM_CAP_PPC_RPT_INVALIDATE
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
> > > +This capability is always enabled.
> >=20
> > I guess that means it's always enabled when it's available - I'm
> > pretty sure it won't be enabled on POWER8 or on PR KVM.
>=20
> Correct, will reword this and restrict this to POWER9, radix etc
>=20
> >=20
> > > +
> > >  8. Other capabilities.
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =20
> > > diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/inc=
lude/asm/kvm_book3s.h
> > > index d32ec9ae73bd..0f1c5fa6e8ce 100644
> > > --- a/arch/powerpc/include/asm/kvm_book3s.h
> > > +++ b/arch/powerpc/include/asm/kvm_book3s.h
> > > @@ -298,6 +298,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 =
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
> > > index d5821834dba9..fbf3b5b45fe9 100644
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
> > > index 6f612d240392..802cb77c39cc 100644
> > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > @@ -904,6 +904,64 @@ static int kvmppc_get_yield_count(struct kvm_vcp=
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
> > > +
> > > +	if (pg_sizes & H_RPTI_PAGE_64K) {
> > > +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_64K);
> > > +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 16), psize,
> > > +				    start, end);
> > > +	}
> > > +
> > > +	if (pg_sizes & H_RPTI_PAGE_2M) {
> > > +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_2M);
> > > +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 21), psize,
> > > +				    start, end);
> > > +	}
> > > +
> > > +	if (pg_sizes & H_RPTI_PAGE_1G) {
> > > +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_1G);
> > > +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 30), psize,
> > > +				    start, end);
> > > +	}
> >=20
> > Hrm.  Here you're stepping through the hcall defined pagesizes, then
> > mapping each one to the Linux internal page size defs.
> >=20
> > It might be more elegant to step through mmu_psize_defs table, and
> > conditionally performan an invalidate on that pagesize if the
> > corresponding bit in pg_sizes is set (as noted earlier you could
> > easily add the H_RPTI_PAGE bit to the table).  That way it's a direct
> > table lookup rather than a bunch of ifs or switches.
>=20
> Yes, let me give this a try.
>=20
> >=20
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
> > > +	if (kvmhv_on_pseries())
> > > +		return H_UNSUPPORTED;
> >=20
> > This doesn't seem quite right.  If you have multiply nested guests,
> > won't the L2 be issueing H_RPT_INVALIDATE hcalls to the L1 on behalf
> > of the L3?  The L1 would have to implement them by calling the L0, but
> > the L1 can't just reject them, no?
> >=20
> > Likewise for the !H_RPTI_TYPE_NESTED case, but on what happens to be a
> > nested guest in any case, couldn't this case legitimately arise and
> > need to be handled?
>=20
> The approach is to handle this hcall on behalf of all the nested
> guests in L0 only. I am intercepting the nested exit path precisely
> for this as shown in the below hunk.

Ah, I see.  Might be worth commenting that, since it's not necessarily obvi=
ous.

>=20
> > > @@ -1573,6 +1640,30 @@ static int kvmppc_handle_nested_exit(struct kv=
m_vcpu *vcpu)
> > >  		if (!xics_on_xive())
> > >  			kvmppc_xics_rm_complete(vcpu, 0);
> > >  		break;
> > > +	case BOOK3S_INTERRUPT_SYSCALL:
> > > +	{
> > > +		unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> > > +
> > > +		if (req !=3D H_RPT_INVALIDATE) {
> > > +			r =3D RESUME_HOST;
> > > +			break;
> > > +		}
> > > +
> > > +		/*
> > > +		 * The H_RPT_INVALIDATE hcalls issued by nested
> > > +		 * guest for process scoped invalidations when
> > > +		 * GTSE=3D0 are handled here.
> > > +		 */
> > > +		do_h_rpt_invalidate_prs(kvmppc_get_gpr(vcpu, 4),
> > > +					vcpu->arch.nested->shadow_lpid,
> > > +					kvmppc_get_gpr(vcpu, 5),
> > > +					kvmppc_get_gpr(vcpu, 6),
> > > +					kvmppc_get_gpr(vcpu, 7),
> > > +					kvmppc_get_gpr(vcpu, 8));
> > > +		kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> > > +		r =3D RESUME_GUEST;
> > > +		break;
> > > +	}
> > >  	default:
> > >  		r =3D RESUME_HOST;
> > >  		break;
>=20
> Thanks for your review.
>=20
> Regards,
> Bharata.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WH716LgmVfRC5lia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0PZ0ACgkQbDjKyiDZ
s5La/RAAw7O/fnfaLDwElCQPPZ+mHFpKWibLUOrCLsrgGa3VO9QzqZ8V5gOCdZ2Y
SmQDQQ2bu3QLpKVMVyA0o9bqw0GgKehBnTs8KKQCFsWNc/QUcUoZn99f6GshWyTv
+MkwuBRceHif1P02LnjjEWysJ/P3tMFwGMZg8qQo1D00yWWL3hP98Zk2N2ya2Gtz
e/tGbaINb7SGTUzny8UdByjB1VttS8RXhklOMx7cxWMaT8F7dBHnoE59jbnhijhj
QIjUzCDlsnoleBu0AuBN/pg5Il5NNf8zVwbBJA12q56iOnh1XjenVfSiEC5rO7pZ
CktHGA9esDOBnlKfPUNzZ1JPhPyTFW7EmKAD2y+nF8wjt2xsxiEfN+QPMemqcfTs
grCPqOpG2s/hAmpTvWQpnbo+fxpr4qVPARnhlGEvvMAv7mkvN/iXBfMGojKLb4kK
GHZfH0qRGeNGdH99jdTK4OHAM2NhxcezCsHYU+Fi6CV5Ocq8RlfW4Sg1+YI0kSuB
+ZgxgBKe4K3+4r3KjPHqOKlyoU9+kSTq/gZddWYJ7NeQChGP9D5t3ITAi8Jm2wuB
U2QiizJT0w8xGY1UhBL/F8qvzM1BfNnihERk3FWSWruMBow23TwXFjz93QCnDHvi
oDrbvRb6Kibiq3nu8WfxuFwF7dBukjwJ378UAkZaM+HGfhd4Umc=
=jcLp
-----END PGP SIGNATURE-----

--WH716LgmVfRC5lia--
