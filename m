Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AE51AD3E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 03:02:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Hr43fZQzF0PV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 11:02:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Hp23hcTzDqSG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 11:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=nfuuW22a; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 493Hp22p84z9sRN; Fri, 17 Apr 2020 11:00:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1587085242;
 bh=g1ERQ546dSK/iDMW/vYxYEg//1XoTyotxttCfMkrVjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nfuuW22aTv5Z15ezeMLKG24F0NK/WIaRzA9pEnl6YeZIoRMNSHsrHTIENWaJm+v/y
 rysf+XzfR1PJs5Y83K7zXL4c82mhHRPAyLLw+XtvglbTzwnw+LHNGzah11hglaA8lm
 /WYJLFcQZUVeQFIrPX5NY0cH9c/WR1W0/JVSEBYk=
Date: Fri, 17 Apr 2020 10:47:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Handle non-present PTEs in page
 fault functions
Message-ID: <20200417004728.GB2102@umbus.fritz.box>
References: <20200416050335.GB10545@blackberry>
 <a4e1bf29-af52-232e-d0d2-06206fa05fbe@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline
In-Reply-To: <a4e1bf29-af52-232e-d0d2-06206fa05fbe@kaod.org>
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
Cc: kvm@vger.kernel.org, groug@kaod.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 10:07:49AM +0200, C=E9dric Le Goater wrote:
> On 4/16/20 7:03 AM, Paul Mackerras wrote:
> > Since cd758a9b57ee "KVM: PPC: Book3S HV: Use __gfn_to_pfn_memslot in HPT
> > page fault handler", it's been possible in fairly rare circumstances to
> > load a non-present PTE in kvmppc_book3s_hv_page_fault() when running a
> > guest on a POWER8 host.
> >=20
> > Because that case wasn't checked for, we could misinterpret the non-pre=
sent
> > PTE as being a cache-inhibited PTE.  That could mismatch with the
> > corresponding hash PTE, which would cause the function to fail with -EF=
AULT
> > a little further down.  That would propagate up to the KVM_RUN ioctl()
> > generally causing the KVM userspace (usually qemu) to fall over.
> >=20
> > This addresses the problem by catching that case and returning to the g=
uest
> > instead, letting it fault again, and retrying the whole page fault from
> > the beginning.
> >=20
> > For completeness, this fixes the radix page fault handler in the same
> > way.  For radix this didn't cause any obvious misbehaviour, because we
> > ended up putting the non-present PTE into the guest's partition-scoped
> > page tables, leading immediately to another hypervisor data/instruction
> > storage interrupt, which would go through the page fault path again
> > and fix things up.
> >=20
> > Fixes: cd758a9b57ee "KVM: PPC: Book3S HV: Use __gfn_to_pfn_memslot in H=
PT page fault handler"
> > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=3D1820402
> > Reported-by: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
>=20
> I didn't see the reported issue with the current 5.7-rc1. Anyhow I gave
> this patch a try on a P8 host and a P9 host with a radix guest and a hash=
=20
> guest (using rhel6). Passthrough is fine also.
>=20
> Tested-by: C=E9dric Le Goater <clg@kaod.org>
>=20
> The code looks correct,
>=20
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

I ran my test case overnight with this patch for over 1000 iterations,
without any apparent problems so

Tested-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> Thanks,
>=20
> C.=20
>=20
>=20
> > ---
> > This is a reworked version of the patch David Gibson sent recently,
> > with the fix applied to the radix case as well. The commit message
> > is mostly stolen from David's patch.
> >=20
> >  arch/powerpc/kvm/book3s_64_mmu_hv.c    | 9 +++++----
> >  arch/powerpc/kvm/book3s_64_mmu_radix.c | 9 +++++----
> >  2 files changed, 10 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/boo=
k3s_64_mmu_hv.c
> > index 3aecec8..20b7dce 100644
> > --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> > +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> > @@ -604,18 +604,19 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *r=
un, struct kvm_vcpu *vcpu,
> >  	 */
> >  	local_irq_disable();
> >  	ptep =3D __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
> > +	pte =3D __pte(0);
> > +	if (ptep)
> > +		pte =3D *ptep;
> > +	local_irq_enable();
> >  	/*
> >  	 * If the PTE disappeared temporarily due to a THP
> >  	 * collapse, just return and let the guest try again.
> >  	 */
> > -	if (!ptep) {
> > -		local_irq_enable();
> > +	if (!pte_present(pte)) {
> >  		if (page)
> >  			put_page(page);
> >  		return RESUME_GUEST;
> >  	}
> > -	pte =3D *ptep;
> > -	local_irq_enable();
> >  	hpa =3D pte_pfn(pte) << PAGE_SHIFT;
> >  	pte_size =3D PAGE_SIZE;
> >  	if (shift)
> > diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/=
book3s_64_mmu_radix.c
> > index 134fbc1..7bf94ba 100644
> > --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > @@ -815,18 +815,19 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcp=
u *vcpu,
> >  	 */
> >  	local_irq_disable();
> >  	ptep =3D __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
> > +	pte =3D __pte(0);
> > +	if (ptep)
> > +		pte =3D *ptep;
> > +	local_irq_enable();
> >  	/*
> >  	 * If the PTE disappeared temporarily due to a THP
> >  	 * collapse, just return and let the guest try again.
> >  	 */
> > -	if (!ptep) {
> > -		local_irq_enable();
> > +	if (!pte_present(pte)) {
> >  		if (page)
> >  			put_page(page);
> >  		return RESUME_GUEST;
> >  	}
> > -	pte =3D *ptep;
> > -	local_irq_enable();
> > =20
> >  	/* If we're logging dirty pages, always map single pages */
> >  	large_enable =3D !(memslot->flags & KVM_MEM_LOG_DIRTY_PAGES);
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6Y/J8ACgkQbDjKyiDZ
s5KeARAArge+EauSGPsWkcx5KJ/iOjUpSUSe5mHJXFyeD7zO+1qpwNVo0QIwKzGX
aLQMtZ+t/rcs88mFkuXQG8aZyx4e3kD8WW8I0cFM8BvaKFLpoRb5JRSrd+hwa+Yd
imn0LHe2UZlB5MFML9IV6zBFk0juz4mdxW9vYtLzIm1Icp2+u/t7k8iQyKNjvRKC
p4EG5NI1rwRFT/vreArPc5EwtOAnAQlQpdijOc8uSCgJ60kqX1go4pMnmP8xK25t
99vntr3jIIFY6C0rjRHh64mOClY3DW8b+0J6tEUKTQDV710mx1uvJJm/Oxwetxpk
mefPm9FHtRfgpuMEO5nzovCfMlms6O4cQ7zsxHVt8LcUn4W8HuP4Od0HQv13Yfuh
vbTjpEYUS1Ls+bh2DXbpSpGtlZY33FZN+adBxcYN+rOTlYXGKrkti2kGgjO1wGiE
MpCEJx7VXgvpm2T9Q12DACTRT0uEIa9wwun2bTNepGTcQp35uX1HedjzWjNHxZu2
Ou8RtC2zmVbauKk8UBlueqyqmHopcPPS72ef5AC9cHZSY0zyHrMC3lGvc0Pj5J3V
+kAMpuYufu2+46aFkZZcHz2pzJnw072qqx7KuVX0wdMC0r+wDFL1ULvAS82EjDmu
S0lWrvygkvL9zjSFcp2K+dCtU6TwAg2LJBVCdvV/Zw9jqWWvE54=
=ivnP
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
