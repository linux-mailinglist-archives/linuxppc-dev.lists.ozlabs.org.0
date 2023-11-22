Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 212DC7F46F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 13:53:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ALQh9P6w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb1Pf0SZjz3dJR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 23:53:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ALQh9P6w;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb1Nm5dN8z3cb0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 23:52:24 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Sb1NZ50pJz4x2W; Wed, 22 Nov 2023 23:52:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700657534;
	bh=RClmDbgRdtW1u/bDl+BCYsEHH0zchf5Ny4/ibms+tH4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ALQh9P6wtmptXQKjJFVVI1FoGGXpwb1yATpIgSs5+KJe30VqL0zR+++9RkL6IINzI
	 g6aRI+FuxC1dy3u6Wen7FBaZ/op7KrCmr+hs7r8jY9AqMGeX2Joy3WtJTQNCxjYXBn
	 n/O+PytY0hJPAL+Sw7FrUMtvvIsX2FvKt74zPe1SnTgUlduGiUn/NgX/DWUB3x99d3
	 2wGiYriGUqgPIX03GxzTbOGG20b5V7bmOo10vW/5UsDFgCIlohK3rzwNkJUhOBYLj2
	 akCK0KDpzVUbiu2ro7ZpsnVGF/NFkOLQqD0MzAhiRYZSTHIhx4Dmlp0XRv4ytL97DG
	 ELpbu824wngmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sb1NZ48Gfz4wd6;
	Wed, 22 Nov 2023 23:52:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, Aneesh Kumar K V
 <aneesh.kumar@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
In-Reply-To: <e65c4dd0-df97-481d-b3e9-0088f2c9b2ea@linux.ibm.com>
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
 <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
 <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
 <87fs0yjrjf.fsf@mail.lhotse>
 <e65c4dd0-df97-481d-b3e9-0088f2c9b2ea@linux.ibm.com>
Date: Wed, 22 Nov 2023 23:52:10 +1100
Message-ID: <87cyw2j6h1.fsf@mail.lhotse>
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> On 22/11/23 10:47, Michael Ellerman wrote:
>> Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:
>> ...
>>> I am not sure whether we need to add all the complexity to enable suppo=
rting different fadump kernel
>>> version. Is that even a possible use case with fadump? Can't we always =
assume that with fadump the
>>> crash kernel and fadump kernel will be same version?
>> How sure are we of that?
>>
>> Don't we go through grub when we boot into the 2nd kernel. And so
>> couldn't it choose to boot a different kernel, for whatever reason.
>>
>> I don't think we need to support different pt_reg / cpumask sizes, but
>> requiring the exact same kernel version is too strict I think.
> Agree.
>>
>> But maybe I'm wrong. Would be good to hear what distro folks think.
>
> How about checking fadump crash info header compatibility in the=20
> following way?
>
> static bool is_fadump_header_compatible(struct fadump_crash_info_header=20
> *fdh)
> {
>  =C2=A0=C2=A0 =C2=A0if (fdh->magic_number =3D=3D FADUMP_CRASH_INFO_MAGIC_=
OLD) {
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Old magic number, can't pr=
ocess the dump.");
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 return false;
>  =C2=A0=C2=A0 =C2=A0}
>
>  =C2=A0=C2=A0 =C2=A0if (fdh->magic_number !=3D FADUMP_CRASH_INFO_MAGIC) {
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Fadump header is corrupted=
.");
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 return false;
>  =C2=A0=C2=A0 =C2=A0}
>
>  =C2=A0=C2=A0 =C2=A0/*
>  =C2=A0=C2=A0 =C2=A0 * If the kernel version of the first/crashed kernel =
and the=20
> second/fadump
>  =C2=A0=C2=A0 =C2=A0 * kernel is not same, then only collect the dump if =
the size of all
>  =C2=A0=C2=A0 =C2=A0 * non-primitive type members of the fadump header is=
 the same=20
> across kernels.
>  =C2=A0=C2=A0 =C2=A0 */
>  =C2=A0=C2=A0 =C2=A0if (strcmp(fdh->kernel_version, init_uts_ns.name.rele=
ase)) {
=20
I don't think the kernel version check is necessary?

>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 if (fdh->pt_regs_sz !=3D sizeof(st=
ruct pt_regs) || fdh->cpu_mask_sz !=3D sizeof(struct cpumask)) {
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_err("Fadump =
header size mismatch.\n")
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return false;

Yeah I think that works.

>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 } else
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn("Kernel=
 version mismatch; dump data is unreliable.\n");
>  =C2=A0=C2=A0 =C2=A0}
>
>  =C2=A0=C2=A0 =C2=A0return true;
> }
>
> And the new fadump crash info header will be: As suggested by Hari.
>
> /* fadump crash info structure */
> struct fadump_crash_info_header {
>  =C2=A0=C2=A0 =C2=A0u64=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 magic_number;
> +=C2=A0 u32=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 version;
=20
Do we need version? We're effectively using the magic_number as a
version already. Having an actual version would allow us to make
backward compatible changes in future, but it's not clear we'll need or
want to do that.

>  =C2=A0=C2=A0 =C2=A0u32=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 crashing_cpu;
>  =C2=A0=C2=A0 =C2=A0u64=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 elfcorehdr_a=
ddr;
> +=C2=A0 u64=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 elfcorehdr_size;
> +=C2=A0 u64=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 vmcoreinfo_raddr;
> +=C2=A0 u64=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 vmcoreinfo_size;
> +=C2=A0 u8=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 kernel_version[__N=
EW_UTS_LEN + 1];
> +=C2=A0 u32=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pt_regs_sz;
>  =C2=A0=C2=A0 =C2=A0struct pt_regs=C2=A0=C2=A0=C2=A0 regs;
> +=C2=A0 u32=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 cpu_mask_sz;
=20
Typically you would put all the size fields before the variable sized
fields, because otherwise the later size fields may not be where you
expect them to be. But because we're bailing out if any of the sizes
don't match it doesn't actually matter.

>  =C2=A0=C2=A0 =C2=A0struct cpumask=C2=A0=C2=A0=C2=A0 cpu_mask;
> };

The other issue is endian. I assume we're just declaring that the
1st/2nd kernel must be the same endian? We should still make that
explicit though.

To make it clearer that this struct is somewhat an ABI, I think we
should move the definition into arch/powerpc/include/uapi/asm/fadump.h

We don't expect userspace to actually use the header, but it will
hopefully remind everyone that the struct needs to be changed with care :)

cheers
