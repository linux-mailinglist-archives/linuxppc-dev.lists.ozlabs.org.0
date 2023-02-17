Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36AC69B415
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 21:41:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJNyg5VMSz3fTP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 07:41:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=2a03:4000:10:469::; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
X-Greylist: delayed 12419 seconds by postgrey-1.36 at boromir; Sat, 18 Feb 2023 07:41:17 AEDT
Received: from lug-owl.de (lug-owl.de [IPv6:2a03:4000:10:469::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJNy51Xjrz3f5M
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 07:41:17 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id 1F7E542073; Fri, 17 Feb 2023 21:41:11 +0100 (CET)
Date: Fri, 17 Feb 2023 21:41:11 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: microwatt_defconfig broken: fined reference to `hash__tlb_flush'
Message-ID: <20230217204111.2hvg2qkyhkm7c5l4@lug-owl.de>
References: <20230217171407.zuhmdozno3am6flk@lug-owl.de>
 <670dd176-c896-12ea-228e-c7db32f5b955@csgroup.eu>
 <20230217200043.cubehrboeqeyfhip@lug-owl.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5opl73lx2w4w356a"
Content-Disposition: inline
In-Reply-To: <20230217200043.cubehrboeqeyfhip@lug-owl.de>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5opl73lx2w4w356a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christophe!

On Fri, 2023-02-17 21:00:43 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de> wr=
ote:
> On Fri, 2023-02-17 19:44:27 +0000, Christophe Leroy <christophe.leroy@csg=
roup.eu> wrote:
> > Le 17/02/2023 =C3=A0 18:14, Jan-Benedict Glaw a =C3=A9crit=C2=A0:
> > > My CI builds showed that the microwatt_defconfig broke somewhere betw=
een
> > > (upstream Linus) 6d796c50f84ca79f1722bb131799e5a5710c4700 (last known=
 good, log
> > > at [1]) and 033c40a89f55525139fd5b6342281b09b97d05bf (first known bad=
, log at
> > > [2]) with this:
> > >=20
> > > [...]
> > > make V=3D1 ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64le-linux- INSTALL_=
MOD_PATH=3D/var/lib/laminar/run/linux-powerpc-microwatt_defconfig/28/linux-=
powerpc-microwatt_defconfig INSTALL_DTBS_PATH=3D/var/lib/laminar/run/linux-=
powerpc-microwatt_defconfig/28/linux-powerpc-microwatt_defconfig all
> > > [...]
> > > [mk all 2023-02-17 01:42:27] + powerpc64le-linux-ld -EL -z noexecstac=
k --no-warn-rwx-segments -Bstatic --build-id=3Dsha1 --orphan-handling=3Dwar=
n --script=3D./arch/powerpc/kernel/vmlinux.lds --strip-debug -o .tmp_vmlinu=
x.kallsyms1 --whole-archive vmlinux.a init/version-timestamp.o --no-whole-a=
rchive --start-group lib/lib.a --end-group
> > > [mk all 2023-02-17 01:42:28] powerpc64le-linux-ld: mm/memory.o: in fu=
nction `tlb_flush_mmu_tlbonly':
> > > [mk all 2023-02-17 01:42:28] memory.c:(.text+0x320): undefined refere=
nce to `hash__tlb_flush'
> > > [mk all 2023-02-17 01:42:28] powerpc64le-linux-ld: mm/mmu_gather.o: i=
n function `tlb_flush_mmu_tlbonly':
> > > [mk all 2023-02-17 01:42:28] mmu_gather.c:(.text+0xe0): undefined ref=
erence to `hash__tlb_flush'
> > > [mk all 2023-02-17 01:42:28] powerpc64le-linux-ld: mm/mprotect.o: in =
function `change_protection':
> > > [mk all 2023-02-17 01:42:28] mprotect.c:(.text+0x59c): undefined refe=
rence to `hash__tlb_flush'
> > > [mk all 2023-02-17 01:42:28] powerpc64le-linux-ld: mm/madvise.o: in f=
unction `tlb_end_vma.isra.0':
> > > [mk all 2023-02-17 01:42:28] madvise.c:(.text+0x1f0): undefined refer=
ence to `hash__tlb_flush'
> > > [mk all 2023-02-17 01:42:28] make[1]: *** [scripts/Makefile.vmlinux:3=
5: vmlinux] Error 1
> > > [mk all 2023-02-17 01:42:28] make: *** [Makefile:1264: vmlinux] Error=
 2
> >=20
> >=20
> > The fix is available here :=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commi=
t/?id=3D4302abc628fc0dc08e5855f21bbfaed407a72bc3
>=20
> I can give that patch a try, but on the first glimpse, it won't help:
[...]
> The patch handles a return-type issue. My above issue is a linkage
> issue, the linker cannot find hash__tlb_flush(). Or am I mistaken?

I stand corrected: That patch fixes the linker issue. (Build log at
http://toolchain.lug-owl.de/laminar/jobs/linux-powerpc-microwatt_defconfig/=
69)
Just ftr: How does this work?

MfG, JBG

--=20

--5opl73lx2w4w356a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY+/mZAAKCRAdvV51g5nh
u+uUAJsFW2JEwQDF+M8DgKBxOtPfH2I1UwCfTmgpg4FKeL92iMSD0dkmIwt4YYM=
=huja
-----END PGP SIGNATURE-----

--5opl73lx2w4w356a--
