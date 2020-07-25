Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A91D22D5D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 09:38:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDHxm3TK2zF0jM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 17:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDHw21zFCzF0x5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 17:37:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=l4F/Jxbs; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BDHw13V5Yz9sRR; Sat, 25 Jul 2020 17:37:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1595662641;
 bh=W7B4UciZS3FArWv9+3+oQUJGmfZMMOu9I71ixRxl+p0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l4F/Jxbsipt1EaRAN4bXpC4CmHqZBQOLktbdVcl6vuPrUD0OfCYlv4L0qyFvRKOs5
 0YfRdxRMLxl+Dn49/i5Axn8Ah7Lxn1RdlUZVDc3+7ajINdN6QNqjIeAxHNKqUItEUI
 E3XrFoi7DvqVdjPLs7BcYPg8q4uZ43laRPdCQF3I=
Date: Sat, 25 Jul 2020 17:37:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 0/4] powerpc/mm/radix: Memory unplug fixes
Message-ID: <20200725073713.GB84173@umbus.fritz.box>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
 <87r1tb1rw2.fsf@linux.ibm.com> <87tuy1sksv.fsf@mpe.ellerman.id.au>
 <20200721032959.GN7902@in.ibm.com>
 <87ft9lrr55.fsf@mpe.ellerman.id.au>
 <20200722060506.GO7902@in.ibm.com>
 <87mu3pp1u9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <87mu3pp1u9.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 09:52:14PM +1000, Michael Ellerman wrote:
> Bharata B Rao <bharata@linux.ibm.com> writes:
> > On Tue, Jul 21, 2020 at 10:25:58PM +1000, Michael Ellerman wrote:
> >> Bharata B Rao <bharata@linux.ibm.com> writes:
> >> > On Tue, Jul 21, 2020 at 11:45:20AM +1000, Michael Ellerman wrote:
> >> >> Nathan Lynch <nathanl@linux.ibm.com> writes:
> >> >> > "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> >> >> >> This is the next version of the fixes for memory unplug on radix.
> >> >> >> The issues and the fix are described in the actual patches.
> >> >> >
> >> >> > I guess this isn't actually causing problems at runtime right now=
, but I
> >> >> > notice calls to resize_hpt_for_hotplug() from arch_add_memory() a=
nd
> >> >> > arch_remove_memory(), which ought to be mmu-agnostic:
> >> >> >
> >> >> > int __ref arch_add_memory(int nid, u64 start, u64 size,
> >> >> > 			  struct mhp_params *params)
> >> >> > {
> >> >> > 	unsigned long start_pfn =3D start >> PAGE_SHIFT;
> >> >> > 	unsigned long nr_pages =3D size >> PAGE_SHIFT;
> >> >> > 	int rc;
> >> >> >
> >> >> > 	resize_hpt_for_hotplug(memblock_phys_mem_size());
> >> >> >
> >> >> > 	start =3D (unsigned long)__va(start);
> >> >> > 	rc =3D create_section_mapping(start, start + size, nid,
> >> >> > 				    params->pgprot);
> >> >> > ...
> >> >>=20
> >> >> Hmm well spotted.
> >> >>=20
> >> >> That does return early if the ops are not setup:
> >> >>=20
> >> >> int resize_hpt_for_hotplug(unsigned long new_mem_size)
> >> >> {
> >> >> 	unsigned target_hpt_shift;
> >> >>=20
> >> >> 	if (!mmu_hash_ops.resize_hpt)
> >> >> 		return 0;
> >> >>=20
> >> >>=20
> >> >> And:
> >> >>=20
> >> >> void __init hpte_init_pseries(void)
> >> >> {
> >> >> 	...
> >> >> 	if (firmware_has_feature(FW_FEATURE_HPT_RESIZE))
> >> >> 		mmu_hash_ops.resize_hpt =3D pseries_lpar_resize_hpt;
> >> >>=20
> >> >> And that comes in via ibm,hypertas-functions:
> >> >>=20
> >> >> 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
> >> >>=20
> >> >>=20
> >> >> But firmware is not necessarily going to add/remove that call based=
 on
> >> >> whether we're using hash/radix.
> >> >
> >> > Correct but hpte_init_pseries() will not be called for radix guests.
> >>=20
> >> Yeah, duh. You'd think the function name would have been a sufficient
> >> clue for me :)
> >>=20
> >> >> So I think a follow-up patch is needed to make this more robust.
> >> >>=20
> >> >> Aneesh/Bharata what platform did you test this series on? I'm curio=
us
> >> >> how this didn't break.
> >> >
> >> > I have tested memory hotplug/unplug for radix guest on zz platform a=
nd
> >> > sanity-tested this for hash guest on P8.
> >> >
> >> > As noted above, mmu_hash_ops.resize_hpt will not be set for radix
> >> > guest and hence we won't see any breakage.
> >>=20
> >> OK.
> >>=20
> >> That's probably fine as it is then. Or maybe just a comment in
> >> resize_hpt_for_hotplug() pointing out that resize_hpt will be NULL if
> >> we're using radix.
> >
> > Or we could move these calls to hpt-only routines like below?
>=20
> That looks like it would be equivalent, and would nicely isolate those
> calls in hash specific code. So yeah I think that's worth sending as a
> proper patch, even better if you can test it.
>=20
> > David - Do you remember if there was any particular reason to have
> > these two hpt-resize calls within powerpc-generic memory hotplug code?
>=20
> I think the HPT resizing was developed before or concurrently with the
> radix support, so I would guess it was just not something we thought
> about at the time.

Sounds about right; I don't remember for certain.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8b4ScACgkQbDjKyiDZ
s5KfAw/+NTKEt8p9UsK1I51z4z80o4bn4U2rR+3E8l1qzs9Vk6U4mdJGdWNqSZE6
MdQsRNRzqS51A2A6vLyg9bqC8uoM5VGJ8kArV7nMKVvv1nKIFLIuVLEa7pkJG/da
zmC/4rbvBMCGhIwAjEdYHXR/yXzaJx4vNEpLQxddDOeR5xTuqot4ouyRE2AtILP5
QKF9tO5Csbb0iDH2p3hbg4FejyupH4HCzW0E2epTEWj6gVzxnCK+RYFzg4bf3JTA
wwzfEHYiLVBDoWMQDKcYjGNyjcXfuS0nD+DT0Osi0DsssjpGD+X0RuK9nxH3N8IK
oTnfGTPfn19yRK+rnFzzv7wwBGkuvFtj3IvGW684G1H07i4U01hcWCd7tqF8HWoZ
y8GriE9dJEDgLG9fI86RfBzKTKZsjKI0be8h/ELWF88fKdoXdSN4psn/bYJIUR4f
mPcCJYRW7UyrTucDy8gteoJabNy1Lcj2nPMErwysjqHLNyAeep7X7/P/AoyoBv/6
K7v70OOm0CeavnToSHG1S1ZEKFtOugkpPTQSVMqKJCf52rkbd/Hi9bc22zdvyh9Z
OwLykx9f3NEIdqgg+6L5gUFnJrTkGu6TNdN+OtiGi1+O2JMujTKQjNsl++mRMBO7
OeMbqoJvBy3oO1jO7jbg2weTYPtAWa5vQPF2OvDgA7SeULLAGp4=
=5T7k
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
