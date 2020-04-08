Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAE51A1A01
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 04:37:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xpN42j11zDqs6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 12:37:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xpLD2LsLzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 12:36:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=P2YorbHQ; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48xpLD0v4Gz9sSc; Wed,  8 Apr 2020 12:36:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586313364;
 bh=8ROYtYTxGO8hW1imJQ4+19i8xz9429AJUOi6QX78fwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P2YorbHQ6bOMsvs1Q2dI5Ciimp1AluRhZ+zoOoXy74oW4HMTFyyqVB4pReTrt3KQ9
 fClLSzrlZ6KQbHRGIOGO7xqxUA39DXohwZ9O6bmrH2R71nf/RYnnv6YK75pkGGvCzT
 3ZDsFTXcQNldyw241gxJ0FVcKXNmMFsTRGWfWBWo=
Date: Wed, 8 Apr 2020 12:29:57 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [RFC/PATCH  2/3] pseries/kvm: Clear PSSCR[ESL|EC] bits before
 guest entry
Message-ID: <20200408022957.GC44664@umbus.fritz.box>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585656658-1838-3-git-send-email-ego@linux.vnet.ibm.com>
 <1585880159.w3mc2nk6h3.astroid@bobo.none>
 <20200403093103.GA20293@in.ibm.com>
 <20200406095819.GC2945@umbus.fritz.box>
 <20200407132526.GB950@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline
In-Reply-To: <20200407132526.GB950@in.ibm.com>
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


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 06:55:26PM +0530, Gautham R Shenoy wrote:
> Hello David,
>=20
> On Mon, Apr 06, 2020 at 07:58:19PM +1000, David Gibson wrote:
> > On Fri, Apr 03, 2020 at 03:01:03PM +0530, Gautham R Shenoy wrote:
> > > On Fri, Apr 03, 2020 at 12:20:26PM +1000, Nicholas Piggin wrote:
> > > > Gautham R. Shenoy's on March 31, 2020 10:10 pm:
> > > > > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > > > >=20
> > > > > ISA v3.0 allows the guest to execute a stop instruction. For this=
, the
> > > > > PSSCR[ESL|EC] bits need to be cleared by the hypervisor before
> > > > > scheduling in the guest vCPU.
> > > > >=20
> > > > > Currently we always schedule in a vCPU with PSSCR[ESL|EC] bits
> > > > > set. This patch changes the behaviour to enter the guest with
> > > > > PSSCR[ESL|EC] bits cleared. This is a RFC patch where we
> > > > > unconditionally clear these bits. Ideally this should be done
> > > > > conditionally on platforms where the guest stop instruction has no
> > > > > Bugs (starting POWER9 DD2.3).
> > > >=20
> > > > How will guests know that they can use this facility safely after y=
our
> > > > series? You need both DD2.3 and a patched KVM.
> > >=20
> > >=20
> > > Yes, this is something that isn't addressed in this series (mentioned
> > > in the cover letter), which is a POC demonstrating that the stop0lite
> > > state in guest works.
> > >=20
> > > However, to answer your question, this is the scheme that I had in
> > > mind :
> > >=20
> > > OPAL:
> > >    On Procs >=3D DD2.3 : we publish a dt-cpu-feature "idle-stop-guest"
> > >=20
> > > Hypervisor Kernel:
> > >     1. If "idle-stop-guest" dt-cpu-feature is discovered, then
> > >        we set bool enable_guest_stop =3D true;
> > >=20
> > >     2. During KVM guest entry, clear PSSCR[ESL|EC] iff
> > >        enable_guest_stop =3D=3D true.
> > >=20
> > >     3. In kvm_vm_ioctl_check_extension(), for a new capability
> > >        KVM_CAP_STOP, return true iff enable_guest_top =3D=3D true.
> > >=20
> > > QEMU:
> > >    Check with the hypervisor if KVM_CAP_STOP is present. If so,
> > >    indicate the presence to the guest via device tree.
> >=20
> > Nack.  Presenting different capabilities to the guest depending on
> > host capabilities (rather than explicit options) is never ok.  It
> > means that depending on the system you start on you may or may not be
> > able to migrate to other systems that you're supposed to be able to,
>=20
> I agree that blocking migration for the unavailability of this feature
> is not desirable. Could you point me to some other capabilities in KVM
> which have been implemented via explicit options?

TBH, most of the options for the 'pseries' machine type are in this
category: cap-vsx, cap-dfp, cap-htm, a bunch related to various
Spectre mitigations, cap-hpt-max-page-size (maximum page size for hash
guests), cap-nested-hv, cap-large-decr, cap-fwnmi, resize-hpt (HPT
resizing extension), ic-mode (which irq controllers are available to
the guest).

> The ISA 3.0 allows the guest to execute the "stop" instruction.

So, this was a bug in DD2.2's implementation of the architecture?

> If the
> Hypervisor hasn't cleared the PSSCR[ESL|EC] then, guest executing the
> "stop" instruction in the causes a Hypervisor Facility Unavailable
> Exception, thus giving the hypervisor a chance to emulate the
> instruction. However, in the current code, when the hypervisor
> receives this exception, it sends a PROGKILL to the guest which
> results in crashing the guest.
>=20
> Patch 1 of this series emulates wakeup from the "stop"
> instruction. Would the following scheme be ok?
>=20
> OPAL:
> 	On Procs >=3D DD2.3 : we publish a dt-cpu-feature "idle-stop-guest"
>=20
> Hypervisor Kernel:
>=20
> 	   If "idle-stop-guest" dt feature is available, then, before
> 	   entering the guest, the hypervisor clears the PSSCR[EC|ESL]
> 	   bits allowing the guest to safely execute stop instruction.
>=20
> 	   If "idle-stop-guest" dt feature is not available, then, the
> 	   Hypervisor sets the PSSCR[ESL|EC] bits, thereby causing a
> 	   guest "stop" instruction execution to trap back into the
> 	   hypervisor. We then emulate a wakeup from the stop
> 	   instruction (Patch 1 of this series).
>=20
> Guest Kernel:
>       If (cpu_has_feature(CPU_FTR_ARCH_300)) only then use the
>       stop0lite cpuidle state.
>=20
> This allows us to migrate the KVM guest across any POWER9
> Hypervisor. The minimal addition that the Hypervisor would need is
> Patch 1 of this series.

That could be workable.  Some caveats, though:

 * How does the latency of the trap-and-emulate compare to the guest
   using H_CEDE in the first place?  i.e. how big a negative impact
   will this have for guests running on DD2.2 hosts?

 * We'll only be able to enable this in a new qemu machine type
   version (say, pseries-5.1.0).  Otherwise a guest could start
   thinking it can use stop states, then be migrated to an older qemu
   or host kernel without the support and crash.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6NNyMACgkQbDjKyiDZ
s5KKtRAA236we8bjXVEXJPAnzvqAXyTrKrresY/NzgwZEqU48uFN02v+IZFGOoe3
FSSy7MF5ArWnrwSOruTS2ogKfCNgeqbfYhhQptyahqqM07xFXFj7QDG5u3bBVlI0
BuhoZUSWmvmsDjSP/njxc05VjX30MOemI5B5do5+neaFLc+BZw+zrtaRtXTAy912
UQ2Bs84LPbR4OiCA2nUzHPrkTBDhe9PiGbGkpnjpn+yU9bx41hhGUD24bZvfsSNG
gAPyrp39xOBKzVlDw4mp/+20yXfObPCDc4k3gaBYSG4jC1dWHCTCwYzSmfX6xD6p
u0texiBt3/W761yRdBlG2OJyaBmtqoLEsvTT1wPNDbLr9kDFT0SY1VFqlpT8+lyf
WaV5VDpuciW6dkuAPQFRkXBZm5sgm96lrWqL+DgCYPFPnQN/P5b24ihGCtpO7xyD
nmNdua0wW0enV+sHt35NvDez/i/MZaJxrNRcEaJu5XiZ2NBFDLRBYnJUflt8tSN/
LklCsl4WjzPSUtArP5QEWfRqPuB6yEiXRHiWF+gdn2m4CmC48FVXvagdh69f/7eo
aak97UL+8O6MfrT0a/wSYrjILhyBbJ4BbbahAJwxeI50JNGLXAz5ORb1NQj2iQcD
x7MOMEbNspCkWSkURdNbb1QcLUlBeVXuqkvGtuE624uFCI6izs8=
=yXrM
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
