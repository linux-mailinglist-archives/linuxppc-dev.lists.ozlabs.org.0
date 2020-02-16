Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8852116070F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 23:58:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LMxD5pWGzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 09:58:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LMvf117qzDqbs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 09:57:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=Bjtn96Lk; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48LMvb4P0Tz9sPK;
 Mon, 17 Feb 2020 09:57:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581893853;
 bh=47iPtZB29ez9xFzB4y1kZcIk8WPBYdTElVrZIIEogoc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Bjtn96LklFKzxIYxw/UvR2pu1DuZ7j7eVV81qXVeEl731OMosL0c3ybcMaGc6RLoT
 DGI54Yw25zA5SAqwguKn9660Y4msdcH1ZKPqb94130PaA9XLF83WyelqqHEEMjZ1wX
 ktlTjNO2rG+AP1uccGtOWGGh0w6jJ9NTXHhvQsko/ZSiNt8NRyRPEfhra7l7FBL8p4
 TXZueIhGHoO8BpZce12Lba9Q+t4nBo+g3l+IzsdvIy/gpTMS+mqQk6mVfGa+1cMEvl
 8DTBHdrcjNSNJc2186dlTdHUy4yPDKZAG7CUI9Q8n3GJaIWZljNntqhY53Q3Yctr17
 kJK7ANtDIHp9g==
Received: by neuling.org (Postfix, from userid 1000)
 id 57F542C01ED; Mon, 17 Feb 2020 09:57:31 +1100 (AEDT)
Message-ID: <0af9715a2bf58ea79d9f5c8f9b279c2ae865a7bc.camel@neuling.org>
Subject: Re: Kernel (little-endian) crashing on POWER8 on heavy PowerKVM load
From: Michael Neuling <mikey@neuling.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, kvm-ppc
 <kvm-ppc@vger.kernel.org>
Date: Mon, 17 Feb 2020 09:57:31 +1100
In-Reply-To: <975e7dec-4330-cdb7-16b9-0269372f63d2@physik.fu-berlin.de>
References: <975e7dec-4330-cdb7-16b9-0269372f63d2@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
Cc: Gustavo Bueno Romero <gromero@br.ibm.com>, James Clarke <jrtc27@debian.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 Anatoly Pugachev <matorola@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paulus,

Something below for you I think


> We have an IBM POWER server (8247-42L) running Linux kernel 5.4.13 on Deb=
ian unstable
> hosting a big-endian ppc64 virtual machine running the same kernel in big=
-endian
> mode.
>=20
> When building OpenJDK-11 on the big-endian VM, the testsuite crashes the =
*host* system
> with the following kernel backtrace. The problem reproduces both with ker=
nel 4.19.98
> as well as 5.4.13.
>=20
> Backtrace has been attached at the end of this mail.
>=20
> Thanks,
> Adrian
>=20
> watson login: [17667518570.438744] BUG: Unable to handle kernel data acce=
ss at 0xc000000002bfd038
> [17667518570.438772] Faulting instruction address: 0xc00000000017a778
> [17667518570.438777] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08
> [17667518570.438781] Faulting instruction address: 0xc0000000002659a0
> [17667518570.438785] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08
> [17667518570.438789] Faulting instruction address: 0xc0000000002659a0
> [17667518570.438793] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08
> [17667518570.438797] Faulting instruction address: 0xc0000000002659a0
> [17667518570.438801] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08
> [17667518570.438804] Faulting instruction address: 0xc0000000002659a0
> [17667518570.438808] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08

<snip>

> [17667518570.439197] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08
> [ 8142.397983]  async_memcpy(E) async_pq(E) async_xor(E) async_tx(E) xor(=
E) raid6_pq(E) libcrc32c(E) crc32c_generic(E)
> [17667518570.439207] Faulting instruction address: 0xc0000000002659a0
> [ 8142.397992]  raid1(E) raid0(E) multipath(E) linear(E) md_mod(E) xhci_p=
ci(E) xhci_hcd(E)
> [17667518570.439215] Thread overran stack, or stack corrupted
> [ 8142.398000]  e1000e(E) usbcore(E) ptp(E) pps_core(E) ipr(E) usb_common=
(E)
> [ 8142.398011] CPU: 48 PID: 2571 Comm: CPU 0/KVM Tainted: G            E =
    5.4.0-0.bpo.3-powerpc64le #1 Debian 5.4.13-1~bpo10+1
> [ 8142.398014] NIP:  c000000fe3117a00 LR: c000000000196b9c CTR: c000000fe=
3117a00
> [17667518570.439234] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08
> [ 8142.398026] REGS: c000000fe315f4c0 TRAP: 0400   Tainted: G            =
E      (5.4.0-0.bpo.3-powerpc64le Debian 5.4.13-1~bpo10+1)
> [17667518570.439243] Faulting instruction address: 0xc0000000002659a0
> [17667518570.439245] Thread overran stack, or stack corrupted
> [ 8142.398038] MSR:  9000000010009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 2844=
8484  XER: 00000000
> [ 8142.398046] CFAR: c000000000196b98 IRQMASK: 1=20
> [ 8142.398046] GPR00: c000000000196e0c c000000fe315f750 c0000000012e0800 =
c000000fe31179c0=20
> [ 8142.398046] GPR04: 0000000000000003 0000000000000000 0000000000000000 =
0000000000000000=20
> [ 8142.398046] GPR08: c000000fe315f7f0 c000000fe3117a00 0000000080000030 =
c0080000082bcd80=20
> [ 8142.398046] GPR12: c000000fe3117a00 c000000fffff5a00 0000000000000000 =
0000000000000008=20
> [ 8142.398046] GPR16: c0000000013a5c18 c000000ff1035e00 c000000fe315f8e8 =
0000000000000001=20
> [ 8142.398046] GPR20: 0000000000000000 c000000fe315f8e8 c000000fe31179c0 =
0000000000000000=20
> [ 8142.398046] GPR24: c000000fe315f7f0 0000000000000001 0000000000000000 =
0000000000000003=20
> [ 8142.398046] GPR28: 0000000000000000 c000000fedc6e750 0000000000000010 =
c000000fe311f8d0=20
> [ 8142.398079] NIP [c000000fe3117a00] 0xc000000fe3117a00
> [ 8142.398087] LR [c000000000196b9c] __wake_up_common+0xcc/0x290
> [17667518570.439321] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08
> [ 8142.398109] Call Trace:
> [17667518570.439328] Faulting instruction address: 0xc0000000002659a0
> [17667518570.439330] Thread overran stack, or stack corrupted
> [ 8142.398122] [c000000fe315f750] [c000000000196b9c] __wake_up_common+0xc=
c/0x290 (unreliable)
> [ 8142.398127] [c000000fe315f7d0] [c000000000196e0c] __wake_up_common_loc=
k+0xac/0x110
> [ 8142.398134] [c000000fe315f850] [c0080000082a9760] kvmppc_run_core+0x12=
f8/0x18c0 [kvm_hv]
> [ 8142.398140] [c000000fe315fa10] [c0080000082acf14] kvmppc_vcpu_run_hv+0=
x62c/0xb20 [kvm_hv]
> [ 8142.398149] [c000000fe315fae0] [c0080000081098cc] kvmppc_vcpu_run+0x34=
/0x48 [kvm]
> [ 8142.398158] [c000000fe315fb00] [c00800000810587c] kvm_arch_vcpu_ioctl_=
run+0x2f4/0x400 [kvm]
> [ 8142.398166] [c000000fe315fb90] [c0080000080f7ac8] kvm_vcpu_ioctl+0x340=
/0x7d0 [kvm]
> [ 8142.398172] [c000000fe315fd00] [c000000000445410] do_vfs_ioctl+0xe0/0x=
ac0
> [ 8142.398176] [c000000fe315fdb0] [c000000000445eb4] ksys_ioctl+0xc4/0x11=
0
> [ 8142.398180] [c000000fe315fe00] [c000000000445f28] sys_ioctl+0x28/0x80
> [ 8142.398184] [c000000fe315fe20] [c00000000000b9c8] system_call+0x5c/0x6=
8
> [ 8142.398186] Instruction dump:
> [17667518570.439406] BUG: Unable to handle kernel data access at 0xc00000=
07f9070c08
> [ 8142.398196] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXX=
XXXX XXXXXXXX=20
> [ 8142.398200] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXX=
XXXX XXXXXXXX=20
> [ 8142.398206] ---[ end trace 10787fb41cbf2532 ]---


Something you can look at?

Mikey

