Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDB12726C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 01:30:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f8mb0RWbzDqhn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 11:30:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f8kS15wkzDqfG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 11:29:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="pSwDUXw6"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47f8kR1bsbz9sRD; Fri, 20 Dec 2019 11:29:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576801743;
 bh=4jaD3gM/TA9ii6c4rmgJjC1co1OIQNhmB4Mc8ZZq4d4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pSwDUXw6wQ2mbWYfHhz37bGA/TWQqwQvXmxPOp2nFX/QZWxHtYzO0FGLaXaSTLjFQ
 +JqR4OJSn0HQ00xcJS5/T/IfuNTzwPRuiW0STGPPrCSxxluqMsqIFNeoHfd9aZ0le+
 7Fgk1LCnC64Nj9i2DkCsZAuMugis5eJ5LaiitXWw=
Date: Fri, 20 Dec 2019 11:22:07 +1100
From: David? Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [Qemu-ppc] pseries on qemu-system-ppc64le crashes in
 doorbell_core_ipi()
Message-ID: <20191220002207.GJ2321@umbus.fritz.box>
References: <1553836851.2264.2.camel@gmail.com>
 <1553850306.nyv11r9iej.astroid@bobo.none>
 <20190329113109.3a9bd24e@gandalf.local.home>
 <1553912871.ce5mzizoek.astroid@bobo.none>
 <20190401083827.GE11158@hirez.programming.kicks-ass.net>
 <20190406000611.GA27782@lenoir>
 <1554801792.ruzup3dxhe.astroid@bobo.none>
 <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
 <871rt0mql5.fsf@mpe.ellerman.id.au>
 <42d35390-0661-8d1e-d335-03186ee7ec93@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SLfjTIIQuAzj8yil"
Content-Disposition: inline
In-Reply-To: <42d35390-0661-8d1e-d335-03186ee7ec93@kaod.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Frederic Weisbecker <fweisbec@gmail.com>, Paul Mackerras <paulus@samba.org>,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org,
 Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--SLfjTIIQuAzj8yil
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 02:08:29PM +0100, C=E9dric Le Goater wrote:
> On 19/12/2019 13:45, Michael Ellerman wrote:
> > "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> >> Hi folks,
> >>
> >> I'm actually still experiencing this sporadically in the WireGuard tes=
t=20
> >> suite, which you can see being run on https://build.wireguard.com/ .=
=20
> >=20
> > Fancy dashboard you got there :)
> >=20
> >> About 50% of the time the powerpc64 build will fail at a place like th=
is:
> >>
> >> [   65.147823] Oops: Exception in kernel mode, sig: 4 [#1]
> >> [   65.149198] LE PAGE_SIZE=3D4K MMU=3DHash PREEMPT SMP NR_CPUS=3D4 NU=
MA pSeries
> >> [   65.149595] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.5.0-rc1+ #1
> >> [   65.149745] NIP:  c000000000033330 LR: c00000000007eda0 CTR: c00000=
000007ed80
> >> [   65.149934] REGS: c000000000a47970 TRAP: 0700   Not tainted  (5.5.0=
-rc1+)
> >> [   65.150032] MSR:  800000000288b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE=
> > CR: 48008288  XER: 00000000
> >> [   65.150352] CFAR: c0000000000332bc IRQMASK: 1
> >> [   65.150352] GPR00: c000000000036508 c000000000a47c00 c000000000a4c1=
00 0000000000000001
> >> [   65.150352] GPR04: c000000000a50998 0000000000000000 c000000000a509=
08 000000000f509000
> >> [   65.150352] GPR08: 0000000028000000 0000000000000000 00000000000000=
00 c00000000ff24f00
> >> [   65.150352] GPR12: c00000000007ed80 c000000000ad9000 00000000000000=
00 0000000000000000
> >> [   65.150352] GPR16: 00000000008c9190 00000000008c94a8 00000000008c92=
f8 00000000008c98b0
> >> [   65.150352] GPR20: 00000000008f2f88 fffffffffffffffd 00000000000000=
14 0000000000e6c100
> >> [   65.150352] GPR24: 0000000000e6c100 0000000000000001 00000000000000=
00 c000000000a50998
> >> [   65.150352] GPR28: c000000000a9e280 c000000000a50aa4 00000000000000=
02 0000000000000000
> >> [   65.151591] NIP [c000000000033330] doorbell_try_core_ipi+0xd0/0xf0
> >> [   65.151750] LR [c00000000007eda0] smp_pseries_cause_ipi+0x20/0x70
> >> [   65.151913] Call Trace:
> >> [   65.152109] [c000000000a47c00] [c0000000000c7c9c] _nohz_idle_balanc=
e+0xbc/0x300 (unreliable)
> >> [   65.152370] [c000000000a47c30] [c000000000036508] smp_send_reschedu=
le+0x98/0xb0
> >> [   65.152711] [c000000000a47c50] [c0000000000c1634] kick_ilb+0x114/0x=
140
> >> [   65.152962] [c000000000a47ca0] [c0000000000c86d8] newidle_balance+0=
x4e8/0x500
> >> [   65.153213] [c000000000a47d20] [c0000000000c8788] pick_next_task_fa=
ir+0x48/0x3a0
> >> [   65.153424] [c000000000a47d80] [c000000000466620] __schedule+0xf0/0=
x430
> >> [   65.153612] [c000000000a47de0] [c000000000466b04] schedule_idle+0x3=
4/0x70
> >> [   65.153786] [c000000000a47e10] [c0000000000c0bc8] do_idle+0x1a8/0x2=
20
> >> [   65.154121] [c000000000a47e70] [c0000000000c0e94] cpu_startup_entry=
+0x34/0x40
> >> [   65.154313] [c000000000a47ea0] [c00000000000ef1c] rest_init+0x10c/0=
x124
> >> [   65.154414] [c000000000a47ee0] [c000000000500004] start_kernel+0x56=
8/0x594
> >> [   65.154585] [c000000000a47f90] [c00000000000a7cc] start_here_common=
+0x1c/0x330
> >> [   65.154854] Instruction dump:
> >> [   65.155191] 38210030 e8010010 7c0803a6 4e800020 3d220004 39295228 8=
1290000 3929ffff
> >> [   65.155498] 7d284038 7c0004ac 5508017e 65082800 <7c00411c> e94d0178=
 812a0000 3929ffff
> >                                                       ^
> > Again the faulting instruction there is "msgsndp r8"
> >=20
> >> [   65.156155] ---[ end trace 6180d12e268ffdaf ]---
> >> [   65.185452]
> >> [   66.187490] Kernel panic - not syncing: Fatal exception
> >>
> >> This is with "qemu-system-ppc64 -smp 4 -machine pseries" on QEMU 4.0.0.
> >>
> >> I'm not totally sure what's going on here. I'm emulating a pseries, an=
d=20
> >> using that with qemu's pseries model, and I see that selecting the=20
> >> pseries forces the selection of 'config PPC_DOORBELL' (twice in the sa=
me=20
> >> section, actually).
> >=20
> > Noted.
> >=20
> >> Then inside the kernel there appears to be some runtime CPU check for
> >> doorbell support.
> >=20
> > Not really. The kernel looks at the CPU revision (PVR) and decides that
> > it has doorbell support.
> >=20
> >> Is this a case in which QEMU is advertising doorbell support that TCG
> >> doesn't have? Or is something else happening here?
> >=20
> > It's a gap in the emulation I guess. qemu doesn't emulate msgsndp, but
> > it really should because that's a supported instruction since Power8.
>=20
> There is a patch for msgsndp in my tree you could try :=20
>=20
>   https://github.com/legoater/qemu/tree/powernv-5.0
>=20
> Currently being reviewed. I have to address some remarks from David before
> it can be merged.

Right.  It needs some polish, but I expect we'll have this merged in
the not too distant future.

> > I suspect msgsndp wasn't implemented for TCG because TCG doesn't support
> > more than one thread per core, and you can only send doorbells to other
> > threads in the same core, and therefore there is no reason to ever use
> > msgsndp.
>=20
> There is a need now with KVM emulation under TCG, but, yes, QEMU still la=
cks
> SMT support.
>=20
> > That's the message Suraj mentioned up thread, eg:
> >=20
> >   $ qemu-system-ppc64 -nographic -vga none -M pseries -smp 2,threads=3D=
2 -cpu POWER8 -kernel build~/vmlinux
> >   qemu-system-ppc64: TCG cannot support more than 1 thread/core on a ps=
eries machine
> >=20
> >=20
> > But I guess we've hit another case of a CPU sending itself an IPI, and
> > the way the sibling masks are done, CPUs are siblings of themselves, so
> > the sibling test passes, eg:
> >=20
> > int doorbell_try_core_ipi(int cpu)
> > {
> > 	int this_cpu =3D get_cpu();
> > 	int ret =3D 0;
> >=20
> > 	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
> > 		doorbell_core_ipi(cpu);
> >=20
> >=20
> >=20
> > In which case this patch should fix it.
> >=20
> > diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
> > index f17ff1200eaa..e45cb9bba193 100644
> > --- a/arch/powerpc/kernel/dbell.c
> > +++ b/arch/powerpc/kernel/dbell.c
> > @@ -63,7 +63,7 @@ int doorbell_try_core_ipi(int cpu)
> >  	int this_cpu =3D get_cpu();
> >  	int ret =3D 0;
> > =20
> > -	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
> > +	if (cpu !=3D this_cpu && cpumask_test_cpu(cpu, cpu_sibling_mask(this_=
cpu))) {
> >  		doorbell_core_ipi(cpu);
> >  		ret =3D 1;
> >  	}
> >=20
> >=20
> > The other option would be we disable CPU_FTR_DBELL if we detect we're
> > running under TCG. But I'm not sure we have a particularly clean way to
> > detect that.
>=20
> does the pseries kernel support cpufeatures in the DT ?
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SLfjTIIQuAzj8yil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl38FCwACgkQbDjKyiDZ
s5IE3w//bezEs4zSfYZOK3Vaya3Z4pGaAMFbyJQEMziMUjSiDtgvQojKxx/wdeu9
3cq9lCSwe3ZXTSB+R0536VUHoMdEOSmT3FYHGcZVBUOlO/vz3Uatuevptz4qQKBU
Rb/QrQO5nFRNekX3MgHZ0be4JM+CiHK63pDbhEM5y18sSmZwpWjElWH6jayxbQpb
qB8jmltLj6Yr+PWTJmxCfoVlTVSy1ODrhuV1Qj8U7ZLj8g0peT6OJkTWbRRsBPrX
/0bI+Rt1kwXCQYI8AJi6o1hwHI1syVTPrXt10YKAYv9PzB96+DBXp01/OQNl0jfz
RuPlHrffmJuag3S2kEIo4Bhe77+IYetFXRa62sNznn6Bll/ywLQGkBPUAusq6BPE
h6EJgsq3/QMLXE08pgi4gJcbP8XADe+/6X1upJPaOVOXaMxF1v1kIxHXXcu2nxgd
oSlsxF2lFS0xNrr5IgN8Yj04mPn3kzOUF2KN2avqbQBUm9bADiLttgm7cbkXEMBh
eg15wPgFnnbIagZ8oFdDP5yVaPKq3Iq5n6o2LvEQGLCa3sT4ZKUXnRrBnoV+lCJh
HxnqNgFoOS4fUcEAkuiFUH46+u5Xe2S6Jad9iJnApvqu0mqr6wxAtcJ8b/FMkX5l
gLA7Srnqq2i7U8i8Qn0mxn76cnPZQ0RXzQLGty+Bj82CrQrFnLk=
=Zs+p
-----END PGP SIGNATURE-----

--SLfjTIIQuAzj8yil--
