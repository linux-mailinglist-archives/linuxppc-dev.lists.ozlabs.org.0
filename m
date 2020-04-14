Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7501A7131
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 04:50:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491VN072mxzDqQV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 12:50:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491Twt6cXNzDqHF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 12:30:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=KBA5u7jG; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 491TwQ2dsDz9sTp; Tue, 14 Apr 2020 12:29:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
 id 491TwL4RWwz9sTY; Tue, 14 Apr 2020 12:26:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586831394;
 bh=z+TkqnEAY8vQ+3UC1ruXvMVm5LtIuK7nvVlxCfdrRNw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBA5u7jGyGGz4SseGHxL4XXoN6ObKoyBpGiJ5RjqPK2LBGYtpB48+szPbRtY+C1Cv
 UOQQSIPe/5IdBe/dDNOrahn88gamv1y4Rn+B+EZJuNeUVslAZrhRX0B3F5H/23J5K8
 aCHDyYQpT2bNqVrsXCzc3xFKTyr40QK/W9BL0VSg=
Date: Tue, 14 Apr 2020 12:17:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [RFC/PATCH  2/3] pseries/kvm: Clear PSSCR[ESL|EC] bits before
 guest entry
Message-ID: <20200414021736.GJ48061@umbus.fritz.box>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585656658-1838-3-git-send-email-ego@linux.vnet.ibm.com>
 <1585880159.w3mc2nk6h3.astroid@bobo.none>
 <20200403093103.GA20293@in.ibm.com>
 <20200406095819.GC2945@umbus.fritz.box>
 <20200407132526.GB950@in.ibm.com>
 <20200408022957.GC44664@umbus.fritz.box>
 <20200413102549.GA22532@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qo8f1a4rgWw9S/zY"
Content-Disposition: inline
In-Reply-To: <20200413102549.GA22532@in.ibm.com>
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
Cc: Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Qo8f1a4rgWw9S/zY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 03:55:49PM +0530, Gautham R Shenoy wrote:
> Hello David,
>=20
> On Wed, Apr 08, 2020 at 12:29:57PM +1000, David Gibson wrote:
> > On Tue, Apr 07, 2020 at 06:55:26PM +0530, Gautham R Shenoy wrote:
> > > Hello David,
> > >=20
> > > On Mon, Apr 06, 2020 at 07:58:19PM +1000, David Gibson wrote:
> > > > On Fri, Apr 03, 2020 at 03:01:03PM +0530, Gautham R Shenoy wrote:
> > > > > On Fri, Apr 03, 2020 at 12:20:26PM +1000, Nicholas Piggin wrote:
> > > > > > Gautham R. Shenoy's on March 31, 2020 10:10 pm:
> > > > > > > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > > > > > >=20
> > > > > > > ISA v3.0 allows the guest to execute a stop instruction. For =
this, the
> > > > > > > PSSCR[ESL|EC] bits need to be cleared by the hypervisor before
> > > > > > > scheduling in the guest vCPU.
> > > > > > >=20
> > > > > > > Currently we always schedule in a vCPU with PSSCR[ESL|EC] bits
> > > > > > > set. This patch changes the behaviour to enter the guest with
> > > > > > > PSSCR[ESL|EC] bits cleared. This is a RFC patch where we
> > > > > > > unconditionally clear these bits. Ideally this should be done
> > > > > > > conditionally on platforms where the guest stop instruction h=
as no
> > > > > > > Bugs (starting POWER9 DD2.3).
> > > > > >=20
> > > > > > How will guests know that they can use this facility safely aft=
er your
> > > > > > series? You need both DD2.3 and a patched KVM.
> > > > >=20
> > > > >=20
> > > > > Yes, this is something that isn't addressed in this series (menti=
oned
> > > > > in the cover letter), which is a POC demonstrating that the stop0=
lite
> > > > > state in guest works.
> > > > >=20
> > > > > However, to answer your question, this is the scheme that I had in
> > > > > mind :
> > > > >=20
> > > > > OPAL:
> > > > >    On Procs >=3D DD2.3 : we publish a dt-cpu-feature "idle-stop-g=
uest"
> > > > >=20
> > > > > Hypervisor Kernel:
> > > > >     1. If "idle-stop-guest" dt-cpu-feature is discovered, then
> > > > >        we set bool enable_guest_stop =3D true;
> > > > >=20
> > > > >     2. During KVM guest entry, clear PSSCR[ESL|EC] iff
> > > > >        enable_guest_stop =3D=3D true.
> > > > >=20
> > > > >     3. In kvm_vm_ioctl_check_extension(), for a new capability
> > > > >        KVM_CAP_STOP, return true iff enable_guest_top =3D=3D true.
> > > > >=20
> > > > > QEMU:
> > > > >    Check with the hypervisor if KVM_CAP_STOP is present. If so,
> > > > >    indicate the presence to the guest via device tree.
> > > >=20
> > > > Nack.  Presenting different capabilities to the guest depending on
> > > > host capabilities (rather than explicit options) is never ok.  It
> > > > means that depending on the system you start on you may or may not =
be
> > > > able to migrate to other systems that you're supposed to be able to,
> > >=20
> > > I agree that blocking migration for the unavailability of this feature
> > > is not desirable. Could you point me to some other capabilities in KVM
> > > which have been implemented via explicit options?
> >=20
> > TBH, most of the options for the 'pseries' machine type are in this
> > category: cap-vsx, cap-dfp, cap-htm, a bunch related to various
> > Spectre mitigations, cap-hpt-max-page-size (maximum page size for hash
> > guests), cap-nested-hv, cap-large-decr, cap-fwnmi, resize-hpt (HPT
> > resizing extension), ic-mode (which irq controllers are available to
> > the guest).
>=20
>=20
> Thanks. I will follow this suit.
>=20
> >=20
> > > The ISA 3.0 allows the guest to execute the "stop" instruction.
> >=20
> > So, this was a bug in DD2.2's implementation of the architecture?
>=20
> Yes, the previous versions could miss wakeup events when stop was
> executed in HV=3D0,PR=3D0 mode. So, the hypervisor had to block that.
>=20
>=20
> >=20
> > > If the
> > > Hypervisor hasn't cleared the PSSCR[ESL|EC] then, guest executing the
> > > "stop" instruction in the causes a Hypervisor Facility Unavailable
> > > Exception, thus giving the hypervisor a chance to emulate the
> > > instruction. However, in the current code, when the hypervisor
> > > receives this exception, it sends a PROGKILL to the guest which
> > > results in crashing the guest.
> > >=20
> > > Patch 1 of this series emulates wakeup from the "stop"
> > > instruction. Would the following scheme be ok?
> > >=20
> > > OPAL:
> > > 	On Procs >=3D DD2.3 : we publish a dt-cpu-feature "idle-stop-guest"
> > >=20
> > > Hypervisor Kernel:
> > >=20
> > > 	   If "idle-stop-guest" dt feature is available, then, before
> > > 	   entering the guest, the hypervisor clears the PSSCR[EC|ESL]
> > > 	   bits allowing the guest to safely execute stop instruction.
> > >=20
> > > 	   If "idle-stop-guest" dt feature is not available, then, the
> > > 	   Hypervisor sets the PSSCR[ESL|EC] bits, thereby causing a
> > > 	   guest "stop" instruction execution to trap back into the
> > > 	   hypervisor. We then emulate a wakeup from the stop
> > > 	   instruction (Patch 1 of this series).
> > >=20
> > > Guest Kernel:
> > >       If (cpu_has_feature(CPU_FTR_ARCH_300)) only then use the
> > >       stop0lite cpuidle state.
> > >=20
> > > This allows us to migrate the KVM guest across any POWER9
> > > Hypervisor. The minimal addition that the Hypervisor would need is
> > > Patch 1 of this series.
> >=20
> > That could be workable.  Some caveats, though:
> >=20
> >  * How does the latency of the trap-and-emulate compare to the guest
> >    using H_CEDE in the first place?  i.e. how big a negative impact
> >    will this have for guests running on DD2.2 hosts?
>=20
>=20
> The wakeup latency of trap-and-emulated stop0lite (referred to as
> "stop0lite Emulated" in the tables below) the compares favorably
> compared to H_CEDE. It is in the order of 5-6us while the wakeup
> latency of H_CEDE is ~25-30us.

Ok.  So allowing the guest to use stop0lite everywhere, but having it
emulated on the older CPUs should work reasonably well.

>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Wakeup Latency measured using a timer (in ns) [Lower is better]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Idle state |  Nr samples |  Min    | Max    | Median | Avg   | Stddev|
> ----------------------------------------------------------------------
> snooze     |   60        |  787    | 1059   |  938   | 937.4 | 42.27 |
> ----------------------------------------------------------------------
> stop0lite  |   60        |  770    | 1182   |  948   | 946.4 | 67.41 |
> ----------------------------------------------------------------------
> stop0lite  |   60        | 2378    | 7659   | 5006   |5093.6 |1578.7 | =
=20
> Emulated   |             |         |        |        |       |       |
> ----------------------------------------------------------------------
> Shared CEDE|   60        | 9550    | 36694  | 29219  |28564.1|3545.9 |
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Wakeup latency measured using an IPI (in ns) [Lower is better]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Idle state |  Nr    |  Min    | Max    | Median | Avg     | Stddev   |
>            |samples |         |        |        |         |          |
> ----------------------------------------------------------------------
> snooze     |   60   |     2089|    4228|    2259|  2342.31|    316.56|
> ----------------------------------------------------------------------
> stop0lite  |   60   |     1947|    3674|    2653|  2610.57|    266.73|
> ----------------------------------------------------------------------
> stop0lite  |   60   |     3580|    8154|    5596|  5644.95|   1368.44|
> Emulated   |        |         |        |        |         |          |
> ----------------------------------------------------------------------
> Shared CEDE|   60   |    20147|   36305|   21827| 26762.65|   6875.01|
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> >=20
> >  * We'll only be able to enable this in a new qemu machine type
> >    version (say, pseries-5.1.0).  Otherwise a guest could start
> >    thinking it can use stop states, then be migrated to an older qemu
> >    or host kernel without the support and crash.
>=20
> That makese sense. In fact in the case of not being able to backport
> Patch 1 to all the older hypervisor kernels, we will need a way of
> gating the guest from using stop-states and then migrating onto an
> older hypervisor kernel. Associating this with a new qemu machine type
> version should solve this problem, assuming that all the newer qemus
> will also be running on newer hypervisor kernels.

We can't assume that automatically, but we can enforce it with a
pretty standard mechanism.  The way to do it is this:

 * Make a new spapr capability flag that enables guest use of the lite
   stop instructions
 * In the capability's '.apply' hook, verify that the host kernel can
   support this, and if not fail
 * Enable the new capability by default in the new machine type

So, running the new machine type with default options on an old kernel
will fail with a meaningful error, but existing setups with an old
qemu, or old machine type.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qo8f1a4rgWw9S/zY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VHUAACgkQbDjKyiDZ
s5J5mA/5Acl9l1kZQSE4jjaHEHxgVH6bgrH/EP2i2agS6BxUWHvpABiw+9uhAJI3
Q6W+I+U8Oga9wLyiFPrqMYR/jbjwBJ8GbORrIj96U7cmSqa2R6wNXO6ruJ2/Npmb
8h/isRIGbF6ez26B3VPR9ZR+XrqZbUI60ulzyE0h8sWYwzD7coYJAZ8LWPnRrZmQ
BvmAQOrafndHZJrgjqGK9vC59nDvD3g3DqMqh/UbagU60BzmgtqSFlPxlb0B1USs
/shSCwvXrD8eIwE9z7bRi2SixG+O9fU0VfAoRqH54jab9oI2uxpK8keGO6dNYmE0
udE2JSYtDKnVeSPg0B1KeK7BPc6ZiocSN3lup7jgX4ObAjo1HFmCMuhcRUMFf0wn
T3jv6/ANFsN1+QqidU8T7tjtnMXuOulfIkF9fjaqy3ErylNLOIdSWMOkNMEjAMQq
Kz+3HqAW5HHxsBP4j//epLyJkpGhk7He/ezcrgDoB8SzIIfglqZGWssAM8Ykg9BR
GlgqS7Hxt7MVeSTehckQNlL2jumELbav2IATQLhPZqXXFdBHYEb3r1hsKQdbzh38
ICPmZ/pm3Ia8fPuhvPVN6rt5OqVXempP8wg86ooOmM2bc47KlVhR7r/nhW++TP7q
hZEA1yZmwS0miME/Lh31JRdfITMMQQs1o1IlbJCAIwqsmtqh2Ng=
=kYQI
-----END PGP SIGNATURE-----

--Qo8f1a4rgWw9S/zY--
