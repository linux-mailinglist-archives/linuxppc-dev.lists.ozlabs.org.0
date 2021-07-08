Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6643BF465
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 06:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GL2hC1x0rz3bdY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 14:03:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=PRaB70iO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=PRaB70iO; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GL2gl4sM1z2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 14:02:42 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL2gk55WWz9sj5; Thu,  8 Jul 2021 14:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625716962;
 bh=UkC2nyhdS7N7HxXoNBKQUIeav7GKLB8qfveETE0psBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PRaB70iOHRh3n4Qux/vskCGMTOMkX4CAsoOyMCpqBPl91sWLzne0i/4D0mC+LeRpM
 krJKcEGUndim/jFg7/DMf5HhY3VjXKcsW8iolUdFbku6fpRrUSvPvROXjqvmBjscmV
 6mFQy25gSS2vQ/6dBi0yK1Ws6lPirEqBO9lP1UyM=
Date: Thu, 8 Jul 2021 13:58:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v8 3/6] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <YOZ3zNsGbSoymVKI@yekko>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
 <20210621085003.904767-4-bharata@linux.ibm.com>
 <YOKNub8mS4U4iox0@yekko> <YOPpiLJlsEBtTmgt@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VI8dkJPIcBYLU6lP"
Content-Disposition: inline
In-Reply-To: <YOPpiLJlsEBtTmgt@in.ibm.com>
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


--VI8dkJPIcBYLU6lP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 10:56:32AM +0530, Bharata B Rao wrote:
> On Mon, Jul 05, 2021 at 02:42:33PM +1000, David Gibson wrote:
> > On Mon, Jun 21, 2021 at 02:20:00PM +0530, Bharata B Rao wrote:
> > > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/in=
clude/asm/mmu_context.h
> > > index 4bc45d3ed8b0..b44f291fc909 100644
> > > --- a/arch/powerpc/include/asm/mmu_context.h
> > > +++ b/arch/powerpc/include/asm/mmu_context.h
> > > @@ -124,8 +124,17 @@ static inline bool need_extra_context(struct mm_=
struct *mm, unsigned long ea)
> > > =20
> > >  #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RAD=
IX_MMU)
> > >  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> > > +void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
> > > +			     unsigned long type, unsigned long pg_sizes,
> > > +			     unsigned long start, unsigned long end);
> > >  #else
> > >  static inline void radix_kvm_prefetch_workaround(struct mm_struct *m=
m) { }
> > > +static inline void do_h_rpt_invalidate_prt(unsigned long pid,
> > > +					   unsigned long lpid,
> > > +					   unsigned long type,
> > > +					   unsigned long pg_sizes,
> > > +					   unsigned long start,
> > > +					   unsigned long end) { }
> >=20
> > Since the only plausible caller is in KVM HV code, why do you need the
> > #else clause.
>=20
> The call to the above routine is prevented for non-radix guests
> in KVM HV code at runtime using kvm_is_radix() check and not by
> CONFIG_PPC_RADIX_MMU. Hence the #else version would be needed.

kvm_is_radix() should evaluate to false at compile time if
!defined(CONFIG_PPC_RADIX_MMU), in which case, no you shouldn't need
the else version.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VI8dkJPIcBYLU6lP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmd8wACgkQbDjKyiDZ
s5LjjA//WzlijLo5jBiWB/psM4RoEjKOrdOxKxtjcQqniGik4SWpwqHq62iuVOhG
XFDyl3QVzGnOByu23sjhdPm0hU6zSWnv/pDhEwoPT9kxpdmG2d9b/BLGzMoG0vXn
gwMMNsHV4AbdnSf5mBWLBjL6g4sv7GZxOK64GLl9ejsumT82c6HLgUbFudUqoQxb
kMTmGqkH1e2UR04e1QS8shzXFxkXBzYEdapzWF1HNp8g1GOqmkExhOhvrE5JwBgz
WOHGnt2P479BAjcZcH7Eq8G1uYTiZGfKaEppMtTvBeiyeF6cn8Ue7y77SpdRBCAF
E57eAIkws/a1o//AflxmxXz9AV8Yjiq35LZq4F1DJHZQgkThvTuvbN+7I4SMfRbh
mcCwn6Ntq2WGnDOYBWmgZkyilECrydqr2Gue6pCGmYfftfDKMATuYB7kwVeQrul7
3oEv8D/BMljW+ynORE5Mm75xl4bICQuUYby++Cc67ngbURr1pUqp0wptv6udEZtP
SOTezV9hyT3qEhSyGJ9IZy3ZtTd2cKmLwUW83Xh0g/7kBMlpArMHHEJaWphNRnZG
mH49EFjKHe7/P35tH7gMPl2iGymyKlsuhosZOJxfOssyuUAOcHaM2MnWcLjG/t/g
/UfaNjbbDep8JtWrQLCZDpr4L6do/upPI3RRF88SCca4YzwvvQQ=
=ThOq
-----END PGP SIGNATURE-----

--VI8dkJPIcBYLU6lP--
