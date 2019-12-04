Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDAE112231
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 05:45:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SR9R4m5DzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 15:45:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SR7h2r90zDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 15:43:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="Ky1DOXdY"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47SR7h0Jhfz9sR8; Wed,  4 Dec 2019 15:43:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575434624;
 bh=0ftyPdnyKfQDnu98YNE3xbdhD7agELawu01H6mP95Lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ky1DOXdYVtCpC5d0qcti91YI0bdeBD2fIKsbHOMcDGQOiJfZ4xu4AzrEyMH5cD1Os
 T+mAfdqlKTX+hMSvTaTVpSjCqPJpw6FbHB5EddfRBnBpOWjTu85RRyaUuh9ZdmvTxd
 UCbY0E5bEH8hvB7ssamFhTqc/ymW+lIdBW6T2wgU=
Date: Wed, 4 Dec 2019 14:36:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v4 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
Message-ID: <20191204033618.GA5031@umbus.fritz.box>
References: <1575269124-17885-2-git-send-email-linuxram@us.ibm.com>
 <f08ace25-fa94-990b-1b6d-a1c0f30d6348@ozlabs.ru>
 <20191203020850.GA12354@oc0525413822.ibm.com>
 <0b56ce3e-6c32-5f3b-e7cc-0d419a61d71d@ozlabs.ru>
 <20191203040509.GB12354@oc0525413822.ibm.com>
 <a0f19e65-81eb-37bd-928b-7a57a8660e3d@ozlabs.ru>
 <20191203165204.GA5079@oc0525413822.ibm.com>
 <3a17372a-fcee-efbf-0a05-282ffb1adc90@ozlabs.ru>
 <20191204004958.GB5063@oc0525413822.ibm.com>
 <5963ff32-2119-be7c-d1e5-63457888a73b@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <5963ff32-2119-be7c-d1e5-63457888a73b@ozlabs.ru>
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
Cc: andmike@us.ibm.com, mst@redhat.com, Ram Pai <linuxram@us.ibm.com>,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 12:08:09PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 04/12/2019 11:49, Ram Pai wrote:
> > On Wed, Dec 04, 2019 at 11:04:04AM +1100, Alexey Kardashevskiy wrote:
> >>
> >>
> >> On 04/12/2019 03:52, Ram Pai wrote:
> >>> On Tue, Dec 03, 2019 at 03:24:37PM +1100, Alexey Kardashevskiy wrote:
> >>>>
> >>>>
> >>>> On 03/12/2019 15:05, Ram Pai wrote:
> >>>>> On Tue, Dec 03, 2019 at 01:15:04PM +1100, Alexey Kardashevskiy wrot=
e:
> >>>>>>
> >>>>>>
> >>>>>> On 03/12/2019 13:08, Ram Pai wrote:
> >>>>>>> On Tue, Dec 03, 2019 at 11:56:43AM +1100, Alexey Kardashevskiy wr=
ote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 02/12/2019 17:45, Ram Pai wrote:
> >>>>>>>>> H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, a=
s one of
> >>>>>>>>> its parameters. One page is dedicated per cpu, for the lifetime=
 of the
> >>>>>>>>> kernel for this purpose. On secure VMs, contents of this page, =
when
> >>>>>>>>> accessed by the hypervisor, retrieves encrypted TCE entries.  H=
ypervisor
> >>>>>>>>> needs to know the unencrypted entries, to update the TCE table
> >>>>>>>>> accordingly.  There is nothing secret or sensitive about these =
entries.
> >>>>>>>>> Hence share the page with the hypervisor.
> >>>>>>>>
> >>>>>>>> This unsecures a page in the guest in a random place which creat=
es an
> >>>>>>>> additional attack surface which is hard to exploit indeed but
> >>>>>>>> nevertheless it is there.
> >>>>>>>> A safer option would be not to use the
> >>>>>>>> hcall-multi-tce hyperrtas option (which translates FW_FEATURE_MU=
LTITCE
> >>>>>>>> in the guest).
> >>>>>>>
> >>>>>>>
> >>>>>>> Hmm... How do we not use it?  AFAICT hcall-multi-tce option gets =
invoked
> >>>>>>> automatically when IOMMU option is enabled.
> >>>>>>
> >>>>>> It is advertised by QEMU but the guest does not have to use it.
> >>>>>
> >>>>> Are you suggesting that even normal-guest, not use hcall-multi-tce?
> >>>>> or just secure-guest? =20
> >>>>
> >>>>
> >>>> Just secure.
> >>>
> >>> hmm..  how are the TCE entries communicated to the hypervisor, if
> >>> hcall-multi-tce is disabled?
> >>
> >> Via H_PUT_TCE which updates 1 entry at once (sets or clears).
> >> hcall-multi-tce  enables H_PUT_TCE_INDIRECT (512 entries at once) and
> >> H_STUFF_TCE (clearing, up to 4bln at once? many), these are simply an
> >> optimization.
> >=20
> > Do you still think, secure-VM should use H_PUT_TCE and not
> > H_PUT_TCE_INDIRECT?  And normal VM should use H_PUT_TCE_INDIRECT?
> > Is there any advantage of special casing it for secure-VMs.
>=20
>=20
> Reducing the amount of insecure memory at random location.

The other approach we could use for that - which would still allow
H_PUT_TCE_INDIRECT, would be to allocate the TCE buffer page from the
same pool that we use for the bounce buffers.  I assume there must
already be some sort of allocator for that?

> > In fact, we could make use of as much optimization as possible.
> >=20
> >=20
> >>
> >>>>>> Is not this for pci+swiotlb?=20
> > ..snip..
> >>>>> This patch is purely to help the hypervisor setup the TCE table, in=
 the
> >>>>> presence of a IOMMU.
> >>>>
> >>>> Then the hypervisor should be able to access the guest pages mapped =
for
> >>>> DMA and these pages should be made unsecure for this to work. Where/=
when
> >>>> does this happen?
> >>>
> >>> This happens in the SWIOTLB code.  The code to do that is already
> >>> upstream. =20
> >>>
> >>> The sharing of the pages containing the SWIOTLB bounce buffers is done
> >>> in init_svm() which calls swiotlb_update_mem_attributes() which calls
> >>> set_memory_decrypted().  In the case of pseries, set_memory_decrypted=
() calls=20
> >>> uv_share_page().
> >>
> >>
> >> This does not seem enough as when you enforce iommu_platform=3Don, QEMU
> >> starts accessing virtio buffers via IOMMU so bounce buffers have to be
> >> mapped explicitly, via H_PUT_TCE&co, where does this happen?
> >>
> >=20
> > I think, it happens at boot time. Every page of the guest memory is TCE
> > mapped, if iommu is enabled. SWIOTLB pages get implicitly TCE-mapped
> > as part of that operation.
>=20
>=20
> Ah I see. This works via the huge dma window. Ok, makes sense now.
>=20
> It just seems like a waste that we could map swiotlb 1:1 via the always
> existing small DMA window but instead we rely on a huge window to map
> these small buffers. This way we are wasting the entire 32bit window and
> most of the huge window. We may fix it in the future (not right now) but
> for now I would still avoid unsecuring additional memory. Thanks,
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3nKbAACgkQbDjKyiDZ
s5KMexAAllYYsecO3NDQbhy2gO0VyzjwweSDd5tosdQl/Knkeu7XeCBfKQN3mIrG
fO8k2+HZHX2LLPyopjnit5VOwKgIigv2y4HKHRrAKWrLsbFVYpm1M/VC2Dz3TBmt
v0RYeiaVtXtpHEJcPHRj6WmKjiEG2DwiAFQoT76PjTj4HTQBAp9GYEfddPKbjhhF
wrxR5h3SOOuLaaP1o8lkWTTkUCkUTfMNUiKBeC3xedeAsvUldXihSUgENeAKjxMS
nOvMcA8JJ6M7acLILT6/xOrrLPkjn+wWfbo0B40c9GQfnSWGbb+OZRwaIoefowKk
1IgSXJtM3aYqJadcObgTD0MCp0PaEBpKEe66QxTP2gxKKgpD71TMG5kYqYbqTs2t
LHUGq7HegCQe5aOZ4hBHvCHb4VqztxNz0woJTD3GjtxmFiwlsrQ1FCK51OT+s0rr
Ga5inejhc+BTuho7XFPxNyQ0piFq3uBGTRJ5vIkygMUWnxVMSVi0DYSxbqC9J5qm
M7Ezhlca7c5m7sh5LG1ULrh+GZEZx/Li5iUWytolJnuV12v4eGAyEcux14mik8wh
pa/1OmU+7K+tCIP3lTzzcPqMNjRDbOhYIVahaByzAvztET4x2uj4AadGHCdhTUsu
AaKRc+4helF5D6sbcsxwY1h2VrR7c7ZrTlFdHa7Xd+LXlepo+OY=
=k2sc
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
