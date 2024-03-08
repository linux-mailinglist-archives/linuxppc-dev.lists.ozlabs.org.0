Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2228760F6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 10:31:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=poqyepOR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrgsL1yL7z3vZH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 20:31:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=poqyepOR;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trgrd2p5Wz3dC0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 20:30:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709890241;
	bh=YrG1vi6s/nTwQkG4YsY+XqFiQyMrqUljBKJEXiaxAlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=poqyepOR/C++MsETS/6QVuyHg2UIBvlhqaSA6Ce5Go5wIxdCFrubcjS2LSzyhflBx
	 5Q8AwLdlL2B59MTdND6P3EKY3yJHoSAF5lQwj+e3T5JjlYw/NFKrOAMlt7OKAil0jj
	 YW14/V32vV7XsCKTeyA889fdfzECaYF2iEYktWeiycbVj5Ac8St5Le2sG+/b3PSqVw
	 xXOvXyMSA0SUfjBYo24HFVHSMiUygB5X8tWiLkyxMM6aDZHznE3RrumAU5gQIRV9eN
	 Je+IdqrXNZpGz8tPt0SXHU475HQ0xcw7+qbjPtDVRAgtHtZmA515omGgpXybBDi7Nq
	 etlkkl91F1cxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Trgrc6vwJz4wc4;
	Fri,  8 Mar 2024 20:30:40 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Savitz <jsavitz@redhat.com>
Subject: Re: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
In-Reply-To: <CAL1p7m7nHfLM=koNaFZ0MrrcC6Lyj3VWdC9i8rOWGmrijKR3+Q@mail.gmail.com>
References: <20240301203023.2197451-1-jsavitz@redhat.com>
 <87cysdfsef.fsf@mail.lhotse>
 <CAL1p7m7nHfLM=koNaFZ0MrrcC6Lyj3VWdC9i8rOWGmrijKR3+Q@mail.gmail.com>
Date: Fri, 08 Mar 2024 20:30:39 +1100
Message-ID: <87zfv9m5og.fsf@mail.lhotse>
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Savitz <jsavitz@redhat.com> writes:
> On Fri, Mar 1, 2024 at 6:23=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
>> Joel Savitz <jsavitz@redhat.com> writes:
>> > On 64-bit powerpc, usage of a non-16MB-aligned value for the mem=3D ke=
rnel
>> > cmdline parameter results in a system hang at boot.
>>
>> Can you give us any more details on that? It might be a bug we can fix.
>
> The console freezes after the following output:
>
>   Booting a command list
>
> OF stdout device is: /vdevice/vty@30000000
> Preparing to boot Linux version 6.8.0-rc6.memNOfix-00120-g87adedeba51a
> (root@ibm-p9z-26-lp11.virt.pnr.lab.eng.rdu2.redhat.com) (gcc (GCC)
> 11.4.1 20231218 (Red Hat 11.4.1-3), GNU ld version 2.35.2-43.el9) #3
> SMP Fri Mar  1 10:45:45 EST 2024
> Detected machine type: 0000000000000101
> command line: BOOT_IMAGE=3D(ieee1275//vdevice/v-scsi@30000003/disk@810000=
0000000000,msdos2)/vmlinuz-6.8.0-rc6.memNOfix-00120-g87adedeba51a
> root=3D/dev/mapper/rhel_ibm--p9z--26--lp11-root ro
> crashkernel=3D2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G
> rd.lvm.lv=3Drhel_ibm-p9z-26-lp11/root
> rd.lvm.lv=3Drhel_ibm-p9z-26-lp11/swap mem=3D4198400K
> Max number of cores passed to firmware: 256 (NR_CPUS =3D 2048)
> Calling ibm,client-architecture-support... done
> Ignoring mem=3D0000000101000000 >=3D ram_top.
> memory layout at init:
>   memory_limit : 0000000000000000 (16 MB aligned)
>   alloc_bottom : 00000000114f0000
>   alloc_top    : 0000000020000000
>   alloc_top_hi : 0000000020000000
>   rmo_top      : 0000000020000000
>   ram_top      : 0000000020000000
> instantiating rtas at 0x000000001ecb0000... done
> prom_hold_cpus: skipped
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x0000000011500000 -> 0x00000000115017b7
> Device tree struct  0x0000000011510000 -> 0x0000000011520000
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x000000000a6e0000 ...

Thanks.

I haven't been able to reproduce this unfortunately, and I don't see the
bug. As Aneesh pointed out the code should be aligning later anyway.

Can you build a kernel with CONFIG_PPC_EARLY_DEBUG_LPAR=3Dy and boot it
without the patch? That should hopefully give you some more output.

cheers
