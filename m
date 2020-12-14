Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3564E2D947D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 10:02:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cvb4l5208zDqW7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 20:02:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cvb302R8tzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 20:01:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=hrwQ1VFj; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cvb300NFhz9sVH; Mon, 14 Dec 2020 20:01:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607936460;
 bh=EWK5ufuz4FP5W6Ymw5LZtDR8Jv1KQzNATVIdOo2ntYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hrwQ1VFjSksSS8mHr+sV/9TLUjTbwT8g4t34lM3JdZg72tVLwf67eT9sYfQO7wwE8
 j6dkyRZpF9UF6KNiGLAI5wNsTYTwOCwTv01bD0kX7zaWYhsEMu/jCI7gldl21CB46o
 hTVWxZczUdCCe5xJL7RccRVQ0LWxgqnc4UIAqxgI=
Date: Mon, 14 Dec 2020 17:05:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v1 1/2] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE (nested case only)
Message-ID: <20201214060501.GG4717@yekko.fritz.box>
References: <20201019112642.53016-1-bharata@linux.ibm.com>
 <20201019112642.53016-2-bharata@linux.ibm.com>
 <20201209041542.GA29825@thinks.paulus.ozlabs.org>
 <20201210042418.GA775394@in.ibm.com>
 <20201211011639.GD4874@yekko.fritz.box>
 <20201211052744.GB69862@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zrag5V6pnZGjLKiw"
Content-Disposition: inline
In-Reply-To: <20201211052744.GB69862@thinks.paulus.ozlabs.org>
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
Cc: npiggin@gmail.com, Bharata B Rao <bharata@linux.ibm.com>,
 kvm-ppc@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Zrag5V6pnZGjLKiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 04:27:44PM +1100, Paul Mackerras wrote:
> On Fri, Dec 11, 2020 at 12:16:39PM +1100, David Gibson wrote:
> > On Thu, Dec 10, 2020 at 09:54:18AM +0530, Bharata B Rao wrote:
> > > On Wed, Dec 09, 2020 at 03:15:42PM +1100, Paul Mackerras wrote:
> > > > On Mon, Oct 19, 2020 at 04:56:41PM +0530, Bharata B Rao wrote:
> > > > > Implements H_RPT_INVALIDATE hcall and supports only nested case
> > > > > currently.
> > > > >=20
> > > > > A KVM capability KVM_CAP_RPT_INVALIDATE is added to indicate the
> > > > > support for this hcall.
> > > >=20
> > > > I have a couple of questions about this patch:
> > > >=20
> > > > 1. Is this something that is useful today, or is it something that =
may
> > > > become useful in the future depending on future product plans? In
> > > > other words, what advantage is there to forcing L2 guests to use th=
is
> > > > hcall instead of doing tlbie themselves?
> > >=20
> > > H_RPT_INVALIDATE will replace the use of the existing H_TLB_INVALIDATE
> > > for nested partition scoped invalidations. Implementations that want =
to
> > > off-load invalidations to the host (when GTSE=3D0) would have to both=
er
> > > about only one hcall (H_RPT_INVALIDATE)
> > >=20
> > > >=20
> > > > 2. Why does it need to be added to the default-enabled hcall list?
> > > >=20
> > > > There is a concern that if this is enabled by default we could get =
the
> > > > situation where a guest using it gets migrated to a host that doesn=
't
> > > > support it, which would be bad.  That is the reason that all new
> > > > things like this are disabled by default and only enabled by usersp=
ace
> > > > (i.e. QEMU) in situations where we can enforce that it is available=
 on
> > > > all hosts to which the VM might be migrated.
> > >=20
> > > As you suggested privately, I am thinking of falling back to
> > > H_TLB_INVALIDATE in case where this new hcall fails due to not being
> > > present. That should address the migration case that you mention
> > > above. With that and leaving the new hcall enabled by default
> > > is good okay?
> >=20
> > No.  Assuming that guests will have some fallback is not how the qemu
> > migration compatibility model works.  If we specify an old machine
> > type, we need to provide the same environment that the older host
> > would have.
>=20
> I misunderstood what this patchset is about when I first looked at
> it.  H_RPT_INVALIDATE has two separate functions; one is to do
> process-scoped invalidations for a guest when LPCR[GTSE] =3D 0 (i.e.,
> when the guest is not permitted to do tlbie itself), and the other is
> to do partition-scoped invalidations that an L1 hypervisor needs to do
> on behalf of an L2 guest.  The second function is a replacement and
> standardization of the existing H_TLB_INVALIDATE which was introduced
> with the nested virtualization code (using a hypercall number from the
> platform-specific range).
>=20
> This patchset only implements the second function, not the first.  The
> first function remains unimplemented in KVM at present.
>=20
> Given that QEMU will need changes for a guest to be able to exploit
> H_RPT_INVALIDATE (at a minimum, adding a device tree property), it
> doesn't seem onerous for QEMU to have to enable the hcall with
> KVM_CAP_PPC_ENABLE_HCALL.  I think that the control on whether the
> hcall is handled in KVM along with the control on nested hypervisor
> function provides adequate control for QEMU without needing a writable
> capability.  The read-only capability to say whether the hcall exists
> does seem useful.
>=20
> Given all that, I'm veering towards taking Bharata's patchset pretty
> much as-is, minus the addition of H_RPT_INVALIDATE to the
> default-enabled set.

Yes, that's fine.  I was only the suggestion that it be on the
default-enabled set I was objecting to.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zrag5V6pnZGjLKiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/XAI0ACgkQbDjKyiDZ
s5IoUg/+NY1jDO3XnNiZuVwR0Vx2mCKGspEcgUoy0gPeISCvAWyu1C47ow4TLmus
F9+izHyCsppnm2fNTY1fo2EGSzzAh3ctQUHaQ4DaaezrjwJlWRaanXwcQJ7bG3eA
cDbxbMMt4BzQHMANubYVFq1bGOaYRCu1jRgFwxzE22paR1sxBeOcW9TtMUNBleTL
GU53msMgxuYa+dMI9VpsN52VahqUDYuZQF5JKOsx/0zXcOou9UWRFA0nuRG/d05j
HsTOpxP8W9ASKxk37D/qanc1DqgVqCyLB7v+JWTEF5dYlhMTYUINCplyOqgJwh0W
whXdkmPxPeVRZWrZj4oxi+ULVq7Hcr1nKUQpFs8ne3nBQwROL6EACRvu8teUnbcH
Tj/jKyTwYP9nCCYH1/KgA9wcaociqL1THWLFrztLETIptXTTl3Rvh/B0kYF0k10G
6ZzrWZkbnUFzVUXD6doymym+XYEFew7FRILXw2G68Ow1x9DLBtlikOriL1DCaJnY
ZO+afgHQ7Zeu2M+ooU9Rph/2Ack459oDa6GlZgxVnNRve9W43kg3nF6/xY+94HGV
BgfiiBjiy6nuqIfIturxMXg5BxqAIhTOsU1doF6hkpt+OWXeDuua15kNmqumlmTO
ENuLEsuhjXvgtFqak3kjDrUbPzGB3DJd8PsZx70JBVPayeNED08=
=ph5k
-----END PGP SIGNATURE-----

--Zrag5V6pnZGjLKiw--
