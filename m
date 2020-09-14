Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E09268537
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 08:58:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqcdC0lnbzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 16:58:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqcbM5zyqzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 16:56:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=Ftgfaqro; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BqcbM2jVCz9sTR; Mon, 14 Sep 2020 16:56:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1600066591;
 bh=SGU/LuMnvZSnkG9vJfLlt+Wvxs5Gak6K2cHY2kAf4SQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FtgfaqrowCuQaTnU+UYe224haTQ7zoC69BD+31ZNH3cghRiE27JxJVtaLvwxY+F1N
 jK4dNprdG+D0K27cWyLOYaAJ9smFhQiGFHD7Ns2RDC+hFG76/sksgqNmeguHK7KPvE
 7tpCecFppHo6oT4E1a6l+Dq7iTr42un/GXzBNhz8=
Date: Mon, 14 Sep 2020 16:12:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Do not allocate HPT for a nested
 guest
Message-ID: <20200914061233.GA5306@yekko.fritz.box>
References: <20200911041607.198092-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20200911041607.198092-1-farosas@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 01:16:07AM -0300, Fabiano Rosas wrote:
> The current nested KVM code does not support HPT guests. This is
> informed/enforced in some ways:
>=20
> - Hosts < P9 will not be able to enable the nested HV feature;
>=20
> - The nested hypervisor MMU capabilities will not contain
>   KVM_CAP_PPC_MMU_HASH_V3;
>=20
> - QEMU reflects the MMU capabilities in the
>   'ibm,arch-vec-5-platform-support' device-tree property;
>=20
> - The nested guest, at 'prom_parse_mmu_model' ignores the
>   'disable_radix' kernel command line option if HPT is not supported;
>=20
> - The KVM_PPC_CONFIGURE_V3_MMU ioctl will fail if trying to use HPT.
>=20
> There is, however, still a way to start a HPT guest by using
> max-compat-cpu=3Dpower8 at the QEMU machine options. This leads to the
> guest being set to use hash after QEMU calls the KVM_PPC_ALLOCATE_HTAB
> ioctl.
>=20
> With the guest set to hash, the nested hypervisor goes through the
> entry path that has no knowledge of nesting (kvmppc_run_vcpu) and
> crashes when it tries to execute an hypervisor-privileged (mtspr
> HDEC) instruction at __kvmppc_vcore_entry:
>=20
> root@L1:~ $ qemu-system-ppc64 -machine pseries,max-cpu-compat=3Dpower8 ...
>=20
> <snip>
> [  538.543303] CPU: 83 PID: 25185 Comm: CPU 0/KVM Not tainted 5.9.0-rc4 #1
> [  538.543355] NIP:  c00800000753f388 LR: c00800000753f368 CTR: c00000000=
01e5ec0
> [  538.543417] REGS: c0000013e91e33b0 TRAP: 0700   Not tainted  (5.9.0-rc=
4)
> [  538.543470] MSR:  8000000002843033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR:=
 22422882  XER: 20040000
> [  538.543546] CFAR: c00800000753f4b0 IRQMASK: 3
>                GPR00: c0080000075397a0 c0000013e91e3640 c00800000755e600 =
0000000080000000
>                GPR04: 0000000000000000 c0000013eab19800 c000001394de0000 =
00000043a054db72
>                GPR08: 00000000003b1652 0000000000000000 0000000000000000 =
c0080000075502e0
>                GPR12: c0000000001e5ec0 c0000007ffa74200 c0000013eab19800 =
0000000000000008
>                GPR16: 0000000000000000 c00000139676c6c0 c000000001d23948 =
c0000013e91e38b8
>                GPR20: 0000000000000053 0000000000000000 0000000000000001 =
0000000000000000
>                GPR24: 0000000000000001 0000000000000001 0000000000000000 =
0000000000000001
>                GPR28: 0000000000000001 0000000000000053 c0000013eab19800 =
0000000000000001
> [  538.544067] NIP [c00800000753f388] __kvmppc_vcore_entry+0x90/0x104 [kv=
m_hv]
> [  538.544121] LR [c00800000753f368] __kvmppc_vcore_entry+0x70/0x104 [kvm=
_hv]
> [  538.544173] Call Trace:
> [  538.544196] [c0000013e91e3640] [c0000013e91e3680] 0xc0000013e91e3680 (=
unreliable)
> [  538.544260] [c0000013e91e3820] [c0080000075397a0] kvmppc_run_core+0xbc=
8/0x19d0 [kvm_hv]
> [  538.544325] [c0000013e91e39e0] [c00800000753d99c] kvmppc_vcpu_run_hv+0=
x404/0xc00 [kvm_hv]
> [  538.544394] [c0000013e91e3ad0] [c0080000072da4fc] kvmppc_vcpu_run+0x34=
/0x48 [kvm]
> [  538.544472] [c0000013e91e3af0] [c0080000072d61b8] kvm_arch_vcpu_ioctl_=
run+0x310/0x420 [kvm]
> [  538.544539] [c0000013e91e3b80] [c0080000072c7450] kvm_vcpu_ioctl+0x298=
/0x778 [kvm]
> [  538.544605] [c0000013e91e3ce0] [c0000000004b8c2c] sys_ioctl+0x1dc/0xc90
> [  538.544662] [c0000013e91e3dc0] [c00000000002f9a4] system_call_exceptio=
n+0xe4/0x1c0
> [  538.544726] [c0000013e91e3e20] [c00000000000d140] system_call_common+0=
xf0/0x27c
> [  538.544787] Instruction dump:
> [  538.544821] f86d1098 60000000 60000000 48000099 e8ad0fe8 e8c500a0 e926=
4140 75290002
> [  538.544886] 7d1602a6 7cec42a6 40820008 7d0807b4 <7d164ba6> 7d083a14 f9=
0d10a0 480104fd
> [  538.544953] ---[ end trace 74423e2b948c2e0c ]---
>=20
> This patch makes the KVM_PPC_ALLOCATE_HTAB ioctl fail when running in
> the nested hypervisor, causing QEMU to abort.
>=20
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/kvm/book3s_hv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 4ba06a2a306c..764b6239ef72 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -5250,6 +5250,12 @@ static long kvm_arch_vm_ioctl_hv(struct file *filp,
>  	case KVM_PPC_ALLOCATE_HTAB: {
>  		u32 htab_order;
> =20
> +		/* If we're a nested hypervisor, we currently only support radix */
> +		if (kvmhv_on_pseries()) {
> +			r =3D -EOPNOTSUPP;
> +			break;
> +		}
> +
>  		r =3D -EFAULT;
>  		if (get_user(htab_order, (u32 __user *)argp))
>  			break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9fCdEACgkQbDjKyiDZ
s5JvSRAA2vv7fzuSyMEHLqw7yUGIPoACyPfFV8UXheokBWjhwdnjw/gk58iWTBqI
dY2DSOH/jwyd61fX5SxpLO0lbODpi8hNOSY9EKCFKMPuu27vOJVJx4ionKaqbpJE
lSF897IJhQ0AXhzOflZOfQsYBFHbS1tCiDzBxXi1IA7bLIUOUM7ocjyv+u6Zyy/7
lYBOf38wQ4iX9jMBnl6+ANas65fRNEMb+PtnwSEUi9BKSHD+jCbj7Mb/c6xHH+KZ
CkkPMwlwjHvlyMt6E+fCZT5n8jWb+mdsQzaFoa4H8OOKLrsIgEtAwzPIm/el+doa
B1ucZSNgnlRrh+1L65ooh1oZha7D/W6P36/DtkT9tXyyHvzWD1+3vPvyZPRgV4H9
QYYxvKDtPwFuRWR1m0TLgDrANs7IX2GF2KHNcGM4VcZtPFIXXCtCWA9JhVvmcsdK
LoUlFE12ndKadng/FNYAAs3p2149WTJ7N7T3wORJYvqJLi4irZ7QEyNj9J+/RpFR
IpxuUrHzZ7AFfPyboMums1//PEK29O/c9Z+t6vZZC6WEiIGiTX57KCh22ClHdcTL
XyX7r3pHSzP1g9tFTIa5CLoRh2eI6vPUzZ0MzmlEi/SeOtvCdilYYZ2J6Bv4n9Sg
HxO2+REEvH149GF2xKszzhTU5+Q4gzD/9HtbmtNL5aG2k0sGhbM=
=Bn/M
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
