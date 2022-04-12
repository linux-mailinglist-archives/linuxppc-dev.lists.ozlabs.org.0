Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1BA4FD0B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 08:48:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcxBk1JPBz3bXG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 16:48:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bpPJhxFI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcxB44J8Tz2yMK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 16:47:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bpPJhxFI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kcx9w2HNHz4xXW;
 Tue, 12 Apr 2022 16:47:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649746069;
 bh=m4MwxwbcZdNUXgF4qvMI9+VwYgaKkYE8vyW9IWIBWtI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bpPJhxFIp5kqmWf/g0qcLrUdm0Lgg1PISHaoWjkrZcEjmaDyJPe8un+f43k4joLTp
 ZTsikZTszA6+03sTHL53h/XUNP7WjYqWSZ8yzKklwFbzWZ4h57tLtlTavQdBD+FYVD
 fhGWiyOgX+t+4dyqjzCVXDImNMnqGG/IQoRlRbu0rCSihnAI4wCJXD/Sio8KsQvBth
 Cz4fJyEsDPUCxrr2tBilZdyMak7lRicCSC4GzRqSKPAfgd7ZkDZcwMYUv9/biWB9hs
 dHj39a+vrhdDqV25Tcm5vnBaWLeG0nGWJz+xTBSqViLq0vXiwSDcE6tuGHEwYgnAfE
 sWNvp+ui4F6xg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Ariel Marcovitch
 <arielmarcovitch@gmail.com>, Mike Rapoport <rppt@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>
Subject: Re: False positive kmemleak report for dtb properties names on powerpc
In-Reply-To: <a9d13878-7820-d41c-9357-135094c8357f@csgroup.eu>
References: <9dd08bb5-f39e-53d8-f88d-bec598a08c93@gmail.com>
 <YjtXXlnbEp64eL0T@arm.com> <Yjtvtkn+CishCef6@kernel.org>
 <2603cae9-3b75-cd13-1d41-2f1bed6ca32e@gmail.com>
 <a9d13878-7820-d41c-9357-135094c8357f@csgroup.eu>
Date: Tue, 12 Apr 2022 16:47:47 +1000
Message-ID: <87pmlm6bn0.fsf@mpe.ellerman.id.au>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Ariel
>
> Le 09/04/2022 =C3=A0 15:47, Ariel Marcovitch a =C3=A9crit=C2=A0:
>> Hi Christophe, did you get the chance to look at this?
>
> I tested something this morning, it works for me, see below
>
>>=20
>> On 23/03/2022 21:06, Mike Rapoport wrote:
>>> Hi Catalin,
>>>
>>> On Wed, Mar 23, 2022 at 05:22:38PM +0000, Catalin Marinas wrote:
>>>> Hi Ariel,
>>>>
>>>> On Fri, Feb 18, 2022 at 09:45:51PM +0200, Ariel Marcovitch wrote:
>>>>> I was running a powerpc 32bit kernel (built using
>>>>> qemu_ppc_mpc8544ds_defconfig
>>>>> buildroot config, with enabling DEBUGFS+KMEMLEAK+HIGHMEM in the kernel
>>>>> config)
>
> ...
>
>>>>> I don't suppose I can just shuffle the calls in setup_arch() around,=
=20
>>>>> so I
>>>>> wanted to hear your opinions first
>>>> I think it's better if we change the logic than shuffling the calls.
>>>> IIUC MEMBLOCK_ALLOC_ACCESSIBLE means that __va() works on the phys
>>>> address return by memblock, so something like below (untested):
>>> MEMBLOCK_ALLOC_ACCESSIBLE means "anywhere", see commit e63075a3c937
>>> ("memblock: Introduce default allocation limit and use it to replace
>>> explicit ones"), so it won't help to detect high memory.
>>>
>>> If I remember correctly, ppc initializes memblock *very* early, so=20
>>> setting
>>> max_low_pfn along with lowmem_end_addr in
>>> arch/powerpc/mm/init_32::MMU_init() makes sense to me.
>>>
>>> Maybe ppc folks have other ideas...
>>> I've added Christophe who works on ppc32 these days.
>
> I think memblock is already available at the end of MMU_init() on PPC32=20
> and at the end of early_setup() on PPC64. It means it is ready when we=20
> enter setup_arch().
>
> I tested the change below, it works for me, I don't get any kmemleak=20
> report anymore.
>
> diff --git a/arch/powerpc/kernel/setup-common.c=20
> b/arch/powerpc/kernel/setup-common.c
> index 518ae5aa9410..9f4e50b176c9 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -840,6 +840,9 @@ void __init setup_arch(char **cmdline_p)
>   	/* Set a half-reasonable default so udelay does something sensible */
>   	loops_per_jiffy =3D 500000000 / HZ;
>
> +	/* Parse memory topology */
> +	mem_topology_setup();
> +
>   	/* Unflatten the device-tree passed by prom_init or kexec */
>   	unflatten_device_tree();

The 64-bit/NUMA version of mem_topology_setup() requires the device tree
to be unflattened, so I don't think that can work.

Setting max_low_pfn etc in MMU_init() as Mike suggested seems more
likely to work.

But we might need to set it again in mem_topology_setup() though, so
that things that change memblock_end_of_DRAM() are reflected, eg. memory
limit or crash dump?

cheers
