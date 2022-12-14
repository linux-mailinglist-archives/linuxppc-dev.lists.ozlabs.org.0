Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D456264CF82
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 19:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXPGq5hr4z3bym
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 05:37:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=2a03:4000:10:469::; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
Received: from lug-owl.de (lug-owl.de [IPv6:2a03:4000:10:469::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXPGG2Mwdz3bf1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 05:36:38 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id 945B842050; Wed, 14 Dec 2022 19:36:32 +0100 (CET)
Date: Wed, 14 Dec 2022 19:36:32 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221214183632.reqfqdhtatog2vmu@lug-owl.de>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <20221213002613.GG25951@gate.crashing.org>
 <20221213100045.xebrbdcniwpopbnq@lug-owl.de>
 <20221214090025.f3k3juinxfhhnr6u@lug-owl.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r7bvunyawzwgzg5c"
Content-Disposition: inline
In-Reply-To: <20221214090025.f3k3juinxfhhnr6u@lug-owl.de>
X-Operating-System: Linux chamaeleon 5.14.0-0.bpo.2-amd64 
X-gpg-fingerprint: 250D 3BCF 7127 0D8C A444  A961 1DBD 5E75 8399 E1BB
X-gpg-key: wwwkeys.de.pgp.net
X-Echelon-Enable: howto poison arsenous mail psychological biological nuclear
 warfare test the bombastical terror of flooding the spy listeners explosion
 sex drugs and rock'n'roll
X-TKUeV: howto poison arsenous mail psychological biological nuclear warfare
 test the bombastical terror of flooding the spy listeners explosion sex
 drugs and rock'n'roll
X-message-flag: Please send plain text messages only. Do not send HTML
 emails. Thank you. 
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--r7bvunyawzwgzg5c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Segher!

On Wed, 2022-12-14 10:00:25 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de> wr=
ote:
> On Tue, 2022-12-13 11:00:45 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de> =
wrote:
> > On Mon, 2022-12-12 18:26:13 -0600, Segher Boessenkool <segher@kernel.cr=
ashing.org> wrote:
> > > On Mon, Dec 12, 2022 at 10:51:17PM +0100, Jan-Benedict Glaw wrote:
> > > > 	Compiler ICEs (during GIMPLE pass: ccp) in align.c:
[...]
> Submitted as https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108095:
[...]

Jakub's patch seems to work (though I cannot *verify* the kernel
images on real hardware), so that will presumably fix these
configations (from the ICE point of view):

linux-powerpc-adder875_defconfig
linux-powerpc-akebono_defconfig
linux-powerpc-lite5200b_defconfig
linux-powerpc-mgcoge_defconfig
linux-powerpc-motionpro_defconfig
linux-powerpc-mpc5200_defconfig
linux-powerpc-mpc8272_ads_defconfig
linux-powerpc-ppc6xx_defconfig
linux-powerpc-tqm5200_defconfig
linux-powerpc-tqm8xx_defconfig
linux-powerpc-warp_defconfig
linux-powerpc-pq2fads_defconfig
linux-powerpc-ps3_defconfig
linux-powerpc-mpc885_ads_defconfig
linux-powerpc-ep8248e_defconfig
linux-powerpc-ep88xc_defconfig
linux-powerpc-iss476-smp_defconfig
linux-powerpc-fsp2_defconfig
linux-powerpc-currituck_defconfig


So we have these remaining build issues:

linux-powerpc-cell_defconfig           bad asm (arch/powerpc/boot/pseries-h=
ead.S)
linux-powerpc-mvme5100_defconfig       bad asm (arch/powerpc/kernel/epapr_h=
calls.S)
linux-powerpc-asp8347_defconfig        bad asm (arch/powerpc/kernel/pmc.c)
linux-powerpc-ppc6xx_defconfig         bad asm (arch/powerpc/kernel/pmc.c)
linux-powerpc-ppc64e_defconfig         bad asm (arch/powerpc/kernel/vdso/ge=
ttimeofday.S)
linux-powerpc-corenet64_smp_defconfig  bad asm (arch/powerpc/kernel/vdso/ge=
ttimeofday.S)

I do *not* have CROSS32_COMPILE=3D... set for my builds. Maybe that
could cure at least the issues within the ./boot and ./kernel/vdso
directories? Let's try that...  But I guess that won't help for the
other two remaining files (arch/powerpc/kernel/{epapr_hcalls.S,pmc.c).


linux-powerpc-pseries_defconfig         sstep (out of array bounds)
linux-powerpc-powernv_defconfig         sstep
linux-powerpc-ppc64_defconfig           sstep
linux-powerpc-pseries_le_defconfig      sstep
linux-powerpc-ppc64le_defconfig         sstep
linux-powerpc-ppc64le_guest_defconfig   sstep
linux-powerpc-ppc64_guest_defconfig     sstep
linux-powerpc-powernv_be_defconfig      sstep

My first guess on these is that it's a wrong warning. The union's
`u8 b[2 * sizeof(double)]` seems to be large enough.


linux-powerpc-akebono_defconfig         ahci (BUILD_BUG_ON failed: sizeof(_=
s) > sizeof(long))
linux-powerpc-xes_mpc85xx_defconfig     ahci
linux-powerpc-ge_imp3a_defconfig        ahci
linux-powerpc-mpc85xx_defconfig         ahci
linux-powerpc-mpc85xx_smp_defconfig     ahci
linux-powerpc-corenet32_smp_defconfig   ahci
linux-powerpc-mpc86xx_defconfig         ahci
linux-powerpc-mpc86xx_smp_defconfig     ahci

I've seen the AHCI issue on other (non-powerpc) builds as well,
haven't looked into this so I won't guess about whether this is a real
bug or a compiler issue.

Thanks,
  Jan-Benedict

--=20

--r7bvunyawzwgzg5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY5oXrQAKCRAdvV51g5nh
u5ixAJ0Ubc98GS/Q6oKmyi5KpGSSxWBvIACfWPOxLEtebKxT27KcuuSaX2nVLjE=
=b+xA
-----END PGP SIGNATURE-----

--r7bvunyawzwgzg5c--
