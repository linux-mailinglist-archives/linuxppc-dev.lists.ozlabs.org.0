Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BC685CE2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 02:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P64lW4CdYz3cFm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 12:56:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eajPxbIo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P64kc2gz5z3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 12:55:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eajPxbIo;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P64kX6WZSz4x1h;
	Wed,  1 Feb 2023 12:55:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675216533;
	bh=/nQ1iVcFMNLWv8g/c7lxZLK5B4PK/MsNqIAhWNLxPkw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eajPxbIoL2X5UTn6GTDhP0ZxpK8CHyAsYc/j7eKZ6FQTJThN4CQY8b36iwGE6ZwMR
	 6383TYvgOzYe09MfRQIaQx3Zbjw13TWz1Q5LN5CWGUa6QpKe4FZUYaNoMONxwggcbr
	 u9MzI+JTQ7x545VSOPy2o2OgWYV3dbdwNs3u/kJkwTnOPezKqUlYy7Jqc6YlNc1zDx
	 XJtifYM2VKWYilLSXhSgUZZGDxOjk2d+3cGPzCC4M4MFemcR6PfzlhhbBeP44Co8W1
	 K756WN/IYF8sJJu0gCBGJZr9lKVy1Bn/8fozUHSI0hWBCQbrr1NgI1WszEzPofzv+V
	 kQHLMhEPMBbtg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/kexec_file: Fix division by zero in extra size
 estimation
In-Reply-To: <9a5254fa-f47c-c53e-478d-adbd8d91e9dc@linux.ibm.com>
References: <20230130014707.541110-1-mpe@ellerman.id.au>
 <9a5254fa-f47c-c53e-478d-adbd8d91e9dc@linux.ibm.com>
Date: Wed, 01 Feb 2023 12:55:27 +1100
Message-ID: <878rhif8ts.fsf@mpe.ellerman.id.au>
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
Cc: hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> On 30/01/23 07:17, Michael Ellerman wrote:
>> In kexec_extra_fdt_size_ppc64() there's logic to estimate how much
>> extra space will be needed in the device tree for some memory related
>> properties.
>>
>> That logic uses the size of RAM divided by drmem_lmb_size() to do the
>> estimation. However drmem_lmb_size() can be zero if the machine has no
>> hotpluggable memory configured, which is the case when booting with qemu
>> and no maxmem=3Dx parameter is passed (the default).
>>
>> The division by zero is reported by UBSAN, and can also lead to an
>> overflow and a warning from kvmalloc, and kdump kernel loading fails:
>>
>>    WARNING: CPU: 0 PID: 133 at mm/util.c:596 kvmalloc_node+0x15c/0x160
>>    Modules linked in:
>>    CPU: 0 PID: 133 Comm: kexec Not tainted 6.2.0-rc5-03455-g07358bd97810=
 #223
>>    Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0=
xf000005 of:SLOF,git-dd0dca pSeries
>>    NIP:  c00000000041ff4c LR: c00000000041fe58 CTR: 0000000000000000
>>    REGS: c0000000096ef750 TRAP: 0700   Not tainted  (6.2.0-rc5-03455-g07=
358bd97810)
>>    MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2424824=
2  XER: 2004011e
>>    CFAR: c00000000041fed0 IRQMASK: 0
>>    ...
>>    NIP kvmalloc_node+0x15c/0x160
>>    LR  kvmalloc_node+0x68/0x160
>>    Call Trace:
>>      kvmalloc_node+0x68/0x160 (unreliable)
>>      of_kexec_alloc_and_setup_fdt+0xb8/0x7d0
>>      elf64_load+0x25c/0x4a0
>>      kexec_image_load_default+0x58/0x80
>>      sys_kexec_file_load+0x5c0/0x920
>>      system_call_exception+0x128/0x330
>>      system_call_vectored_common+0x15c/0x2ec
>>
>> To fix it, skip the calculation if drmem_lmb_size() is zero.
>>
>> Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kd=
ump kernel")
>> Cc: stable@vger.kernel.org # v5.12+
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/kexec/file_load_64.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file=
_load_64.c
>> index af8854f9eae3..3caee570e79b 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -989,10 +989,12 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kim=
age *image)
>>   	 * linux,drconf-usable-memory properties. Get an approximate on the
>>   	 * number of usable memory entries and use for FDT size estimation.
>>   	 */
>> -	usm_entries =3D ((memblock_end_of_DRAM() / drmem_lmb_size()) +
>> -		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
>> -
>> -	extra_size =3D (unsigned int)(usm_entries * sizeof(u64));
>> +	if (drmem_lmb_size()) {
>> +		usm_entries =3D ((memblock_end_of_DRAM() / drmem_lmb_size()) +
>> +			       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
>> +		extra_size =3D (unsigned int)(usm_entries * sizeof(u64));
>> +	} else
>> +		extra_size =3D 0;
>>=20=20=20
>>   	/*
>>   	 * Get the number of CPU nodes in the current DT. This allows to
>
> I failed to replicate this issue.
>
> Qemu command used:
> $ qemu-system-ppc64 -enable-kvm -smp 4,cores=3D2 -drive=20
> file=3Dmy-image.qcow2 -nographic -m 2G
>
>
> lsmem (inside guest):
> RANGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SIZE=C2=A0 STATE REMOVA=
BLE BLOCK
> 0x0000000000000000-0x000000007fffffff=C2=A0=C2=A0 2G online=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 yes 0-127
>
> Memory block size:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16M
> Total online memory:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2G
> Total offline memory:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0B
>
> Not sure what I am missing, but changes looks good to me.

Hmm, interesting.

Do you have /proc/device-tree/ibm,dynamic-reconfiguration-memory in the VM?

What version of qemu are you using? I think I tested with 6.2 and 7.1.

cheers
