Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C66E173
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 09:10:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qhwy37DPzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qhth5YcXzDqZ1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 17:08:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45qhtg3Zn3z9s7T;
 Fri, 19 Jul 2019 17:08:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>, Satheesh
 Rajendran <sathnaga@linux.vnet.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Subject: Re: Crash in kvmppc_xive_release()
In-Reply-To: <6ea6998b-a890-2511-01d1-747d7621eb19@kaod.org>
References: <87k1cf8q3w.fsf@concordia.ellerman.id.au>
 <3c152700-81de-9b34-e8a7-70b341a92197@kaod.org>
 <6ea6998b-a890-2511-01d1-747d7621eb19@kaod.org>
Date: Fri, 19 Jul 2019 17:08:38 +1000
Message-ID: <878ssu8ps9.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> On 18/07/2019 15:14, C=C3=A9dric Le Goater wrote:
>> On 18/07/2019 14:49, Michael Ellerman wrote:
>>> Anyone else seen this?
>>>
>>> This is running ~176 VMs on a Power9 (1 per thread), host crashes:
>>=20
>> This is beyond the underlying limits of XIVE.=20
>>=20
>> As we allocate 2K vCPUs per VM, that is 16K EQs for interrupt events. Th=
e overall
>> EQ count is 1M. I let you calculate what is our max number of VMs ...
>>=20
>>>   [   66.403750][ T6423] xive: OPAL failed to allocate VCPUs order 11, =
err -10
>>=20
>> Hence, the OPAL XIVE driver fails which is good but ...
>>=20
>>>   [188523.080935670,4] Spent 1783 msecs in OPAL call 135!
>>>   [   66.484965][ T6250] BUG: Kernel NULL pointer dereference at 0x0000=
42e8
>>>   [   66.485558][ T6250] Faulting instruction address: 0xc008000011a33f=
cc
>>>   [   66.485990][ T6250] Oops: Kernel access of bad area, sig: 7 [#1]
>>>   [   66.486405][ T6250] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP =
NR_CPUS=3D2048 NUMA PowerNV
>>>   [   66.486967][ T6250] Modules linked in: kvm_hv kvm
>>>   [   66.487275][ T6250] CPU: 107 PID: 6250 Comm: qemu-system-ppc Not t=
ainted 5.2.0-rc2-gcc9x-gf5a9e488d623 #1
>>>   [   66.487902][ T6250] NIP:  c008000011a33fcc LR: c008000011a33fc4 CT=
R: c0000000005d5970
>>>   [   66.488383][ T6250] REGS: c000001fabebb900 TRAP: 0300   Not tainte=
d  (5.2.0-rc2-gcc9x-gf5a9e488d623)
>>>   [   66.488933][ T6250] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME=
,IR,DR,RI,LE>  CR: 24028224  XER: 00000000
>>>   [   66.489724][ T6250] CFAR: c0000000005d6a4c DAR: 00000000000042e8 D=
SISR: 00080000 IRQMASK: 0=20
>>>   [   66.489724][ T6250] GPR00: c008000011a33fc4 c000001fabebbb90 c0080=
00011a5a200 c000000001399928=20
>>>   [   66.489724][ T6250] GPR04: 0000000000000001 c00000000047b8d0 00000=
00000000000 0000000000000001=20
>>>   [   66.489724][ T6250] GPR08: 0000000000000000 0000000000000000 c0000=
01fa8c42f00 c008000011a3af20=20
>>>   [   66.489724][ T6250] GPR12: 0000000000008000 c0002023ff65a880 00000=
0013a1b4000 0000000000000002=20
>>>   [   66.489724][ T6250] GPR16: 0000000010000000 0000000000000002 00000=
00000000001 000000012b194cc0=20
>>>   [   66.489724][ T6250] GPR20: 00007fffb1645250 0000000000000001 00000=
00000000031 0000000000000000=20
>>>   [   66.489724][ T6250] GPR24: 00007fffb16408d8 c000001ffafb62e0 c0000=
01f78699360 c000001ff35d0620=20
>>>   [   66.489724][ T6250] GPR28: c000001ed0ed0000 c000001ecd900000 00000=
00000000000 c000001ed0ed0000=20
>>>   [   66.495211][ T6250] NIP [c008000011a33fcc] kvmppc_xive_release+0x5=
4/0x1b0 [kvm]
>>>   [   66.495642][ T6250] LR [c008000011a33fc4] kvmppc_xive_release+0x4c=
/0x1b0 [kvm]
>>>   [   66.496101][ T6250] Call Trace:
>>>   [   66.496314][ T6250] [c000001fabebbb90] [c008000011a33fc4] kvmppc_x=
ive_release+0x4c/0x1b0 [kvm] (unreliable)
>>>   [   66.496893][ T6250] [c000001fabebbbf0] [c008000011a18d54] kvm_devi=
ce_release+0xac/0xf0 [kvm]
>>>   [   66.497399][ T6250] [c000001fabebbc30] [c000000000442f8c] __fput+0=
xec/0x310
>>>   [   66.497815][ T6250] [c000001fabebbc90] [c000000000145f94] task_wor=
k_run+0x114/0x170
>>>   [   66.498296][ T6250] [c000001fabebbce0] [c000000000115274] do_exit+=
0x454/0xee0
>>>   [   66.498743][ T6250] [c000001fabebbdc0] [c000000000115dd0] do_group=
_exit+0x60/0xe0
>>>   [   66.499201][ T6250] [c000001fabebbe00] [c000000000115e74] sys_exit=
_group+0x24/0x40
>>>   [   66.499747][ T6250] [c000001fabebbe20] [c00000000000b83c] system_c=
all+0x5c/0x70
>>>   [   66.500261][ T6250] Instruction dump:
>>>   [   66.500484][ T6250] fbe1fff8 fba1ffe8 fbc1fff0 7c7c1b78 f8010010 f=
821ffa1 eba30010 e87d0010=20
>>>   [   66.501006][ T6250] ebdd0000 48006f61 e8410018 39200000 <eb7e42ea>=
 913e42e8 48007f3d e8410018=20
>>>   [   66.501529][ T6250] ---[ end trace c021a6ca03594ec3 ]---
>>>   [   66.513119][ T6150] xive: OPAL failed to allocate VCPUs order 11, =
err -10
>>=20
>>=20
>> ... the rollback code in case of such error must be bogus. It was never =
tested=20
>> clearly :/
>
> Here is a fix. Could you give it a try on your system  ?

Yeah that fixes it, thanks.

Will apply it to my fixes branch.

cheers


> From b6f728ca19a9540c8bf4f5a56991c4e3dab4cf56 Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?C=3DC3=3DA9dric=3D20Le=3D20Goater?=3D <clg@kaod.org>
> Date: Thu, 18 Jul 2019 22:15:31 +0200
> Subject: [PATCH] KVM: PPC: Book3S HV: XIVE: fix rollback when
>  kvmppc_xive_create fails
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> The XIVE device structure is now allocated in kvmppc_xive_get_device()
> and kfree'd in kvmppc_core_destroy_vm(). In case of an OPAL error when
> allocating the XIVE VPs, the kfree() call in kvmppc_xive_*create()
> will result in a double free and corrupt the host memory.
>
> Fixes: 5422e95103cf ("KVM: PPC: Book3S HV: XIVE: Replace the 'destroy' me=
thod by a 'release' method")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/kvm/book3s_xive.c        | 4 +---
>  arch/powerpc/kvm/book3s_xive_native.c | 4 ++--
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
> index 6ca0d7376a9f..e3ba67095895 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -1986,10 +1986,8 @@ static int kvmppc_xive_create(struct kvm_device *d=
ev, u32 type)
>=20=20
>  	xive->single_escalation =3D xive_native_has_single_escalation();
>=20=20
> -	if (ret) {
> -		kfree(xive);
> +	if (ret)
>  		return ret;
> -	}
>=20=20
>  	return 0;
>  }
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/boo=
k3s_xive_native.c
> index c7c7e3d4c031..45b0c143280c 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1090,9 +1090,9 @@ static int kvmppc_xive_native_create(struct kvm_dev=
ice *dev, u32 type)
>  	xive->ops =3D &kvmppc_xive_native_ops;
>=20=20
>  	if (ret)
> -		kfree(xive);
> +		return ret;
>=20=20
> -	return ret;
> +	return 0;
>  }
>=20=20
>  /*
> --=20
> 2.21.0
