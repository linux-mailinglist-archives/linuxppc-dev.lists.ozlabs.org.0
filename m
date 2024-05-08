Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B318BFD45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 14:37:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GlSblQkR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZF5t4w6cz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 22:37:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GlSblQkR;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZF5707HNz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 22:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715171797;
	bh=yZfVG4NHrpkSnPReaPO53GzUAb96Z27VcrDQVyegR40=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GlSblQkRZ18yVtg+e7k/X7oifUEcihFeqt5cIFB0UOf4KmZ+/IbdcUfKggKM2kl6U
	 Goge19E2LwBUGRqI4FqGF3iLTCICHDU11dmFLL/0r2V1nR0BkzK7MPXdHyCCCLccBq
	 u0jhCjC8DrQl1nmwc2jHZyZLhXwXFfqMVksSE+rKFJ4PpmdGJCkvVdnW1046BoEPsu
	 KCulCV/1MC6gbme0QmfMnnomb/xrJJsl8AsuERjIpCfyZAD4to9DvN2tN4PynPLDN+
	 E8RYxgacEEBLJ7q+lq24Ni4D1MRlO3Rpt2VN1akrairH6UdxUv8o6HU0ink95LKqMo
	 mzTXwOOyYLdCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZF510x9Dz4x2v;
	Wed,  8 May 2024 22:36:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautam Menghani <gautam@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH v6] arch/powerpc/kvm: Add support for reading VPA
 counters for pseries guests
In-Reply-To: <20240506145605.73794-1-gautam@linux.ibm.com>
References: <20240506145605.73794-1-gautam@linux.ibm.com>
Date: Wed, 08 May 2024 22:36:35 +1000
Message-ID: <87o79gmqek.fsf@mail.lhotse>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautam Menghani <gautam@linux.ibm.com> writes:
> PAPR hypervisor has introduced three new counters in the VPA area of
> LPAR CPUs for KVM L2 guest (see [1] for terminology) observability - 2
> for context switches from host to guest and vice versa, and 1 counter
> for getting the total time spent inside the KVM guest. Add a tracepoint
> that enables reading the counters for use by ftrace/perf. Note that this
> tracepoint is only available for nestedv2 API (i.e, KVM on PowerVM).
...
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8e86eb577eb8..ed69ad58bd02 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4108,6 +4108,54 @@ static void vcpu_vpa_increment_dispatch(struct kvm=
_vcpu *vcpu)
>  	}
>  }
>=20=20
> +static inline int kvmhv_get_l2_counters_status(void)
> +{
> +	return get_lppaca()->l2_counters_enable;
> +}

This is breaking the powernv build:

$ make powernv_defconfig ; make -s -j (nproc)
make[1]: Entering directory '/home/michael/linux/.build'
  GEN     Makefile
#
# configuration written to .config
#
make[1]: Leaving directory '/home/michael/linux/.build'
../arch/powerpc/kvm/book3s_hv.c: In function =E2=80=98kvmhv_get_l2_counters=
_status=E2=80=99:
../arch/powerpc/kvm/book3s_hv.c:4113:16: error: implicit declaration of fun=
ction =E2=80=98get_lppaca=E2=80=99; did you mean =E2=80=98get_paca=E2=80=99=
? [-Werror=3Dimplicit-function-declaration]
 4113 |         return get_lppaca()->l2_counters_enable;
      |                ^~~~~~~~~~
      |                get_paca
../arch/powerpc/kvm/book3s_hv.c:4113:28: error: invalid type argument of =
=E2=80=98->=E2=80=99 (have =E2=80=98int=E2=80=99)
 4113 |         return get_lppaca()->l2_counters_enable;
      |                            ^~
In file included from ../arch/powerpc/include/asm/paravirt.h:9,
                 from ../arch/powerpc/include/asm/qspinlock.h:7,
                 from ../arch/powerpc/include/asm/spinlock.h:7,
                 from ../include/linux/spinlock.h:95,
                 from ../include/linux/sched.h:2138,
                 from ../include/linux/hardirq.h:9,
                 from ../include/linux/kvm_host.h:7,
                 from ../arch/powerpc/kvm/book3s_hv.c:18:
../arch/powerpc/kvm/book3s_hv.c: In function =E2=80=98kvmhv_set_l2_counters=
_status=E2=80=99:
../arch/powerpc/include/asm/lppaca.h:105:41: error: =E2=80=98struct paca_st=
ruct=E2=80=99 has no member named =E2=80=98lppaca_ptr=E2=80=99
  105 | #define lppaca_of(cpu)  (*paca_ptrs[cpu]->lppaca_ptr)
      |                                         ^~
../arch/powerpc/kvm/book3s_hv.c:4119:17: note: in expansion of macro =E2=80=
=98lppaca_of=E2=80=99
 4119 |                 lppaca_of(cpu).l2_counters_enable =3D 1;
      |                 ^~~~~~~~~
../arch/powerpc/include/asm/lppaca.h:105:41: error: =E2=80=98struct paca_st=
ruct=E2=80=99 has no member named =E2=80=98lppaca_ptr=E2=80=99
  105 | #define lppaca_of(cpu)  (*paca_ptrs[cpu]->lppaca_ptr)
      |                                         ^~
../arch/powerpc/kvm/book3s_hv.c:4121:17: note: in expansion of macro =E2=80=
=98lppaca_of=E2=80=99
 4121 |                 lppaca_of(cpu).l2_counters_enable =3D 0;
      |                 ^~~~~~~~~
../arch/powerpc/kvm/book3s_hv.c: In function =E2=80=98do_trace_nested_cs_ti=
me=E2=80=99:
../arch/powerpc/kvm/book3s_hv.c:4145:29: error: initialization of =E2=80=98=
struct lppaca *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from inte=
ger without a cast [-Werror=3Dint-conversion]
 4145 |         struct lppaca *lp =3D get_lppaca();
      |                             ^~~~~~~~~~
../arch/powerpc/kvm/book3s_hv.c: In function =E2=80=98kvmhv_get_l2_counters=
_status=E2=80=99:
../arch/powerpc/kvm/book3s_hv.c:4114:1: error: control reaches end of non-v=
oid function [-Werror=3Dreturn-type]
 4114 | }
      | ^
cc1: all warnings being treated as errors
make[5]: *** [../scripts/Makefile.build:244: arch/powerpc/kvm/book3s_hv.o] =
Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:485: arch/powerpc/kvm] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:485: arch/powerpc] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/home/michael/linux/Makefile:1919: .] Error 2
make[1]: *** [/home/michael/linux/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2


cheers
