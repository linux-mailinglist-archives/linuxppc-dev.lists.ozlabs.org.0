Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C16A8B7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 23:06:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSQDr6nSRz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 09:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rmPnvfMg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSQCt0M1Fz3bh0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 09:06:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rmPnvfMg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSQCk4Np4z4x5X;
	Fri,  3 Mar 2023 09:05:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677794756;
	bh=njD69v3qeL/tVCMhfNiTs5MobAt0JdOQQTm+aBdwWRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rmPnvfMg3GoJQDDhJlf4Rvyw1ed7sbTv5te2/xeBfNddk5N49v7FTLME4/8hWIb5S
	 3Ho/Cm+zvbgRm94hvzNc9YijkJUXUz2g9ojCzEIZQSnkhNQ8/Pjdm4ZXTT2s/8L6mR
	 QEXDW8Ru3Udc1/rlxh1DDPs67+cDO9MhgQD3O5tQMa4NbILJ3m5GqxZByAjEYFTpdc
	 Xf2H4ymHuSYPneDuilR0lJsuQIyai36uQzxJfSjp/OBPI2SNBgfgR5gJcMGfd8AFnZ
	 U/HW7AKZrxkED75qP+/Sayt+7/nO4TzS075iK6bh49qxf59dh5DEZf0tDCMcdx9L15
	 z5IqKwkVoyTgQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stefan Berger <stefanb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/tpm: Reserve SML log when kexec'ing
In-Reply-To: <6c5ee8fe-9970-54cb-263e-b8af7a25ed95@linux.ibm.com>
References: <20230224032508.3331281-1-mpe@ellerman.id.au>
 <20230224032508.3331281-2-mpe@ellerman.id.au>
 <6c5ee8fe-9970-54cb-263e-b8af7a25ed95@linux.ibm.com>
Date: Fri, 03 Mar 2023 09:05:47 +1100
Message-ID: <87bklalsg4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: eajames@linux.ibm.com, jgg@ziepe.ca, jarkko@kernel.org, yangyingliang@huawei.com, linux-integrity@vger.kernel.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stefan Berger <stefanb@linux.ibm.com> writes:
> On 2/23/23 22:25, Michael Ellerman wrote:
>> The TPM code in prom_init.c creates a small buffer of memory to store
>> the TPM's SML (Stored Measurement Log). It's communicated to Linux via
>> the linux,sml-base/size device tree properties of the TPM node.
>> 
>> When kexec'ing that buffer can be overwritten, or when kdump'ing it may
>> not be mapped by the second kernel. The latter can lead to a crash when
>> booting the second kernel such as:
>> 
>>    tpm_ibmvtpm 71000003: CRQ initialization completed
>>    BUG: Unable to handle kernel data access on read at 0xc00000002ffb0000
>>    Faulting instruction address: 0xc0000000200a70e0
>>    Oops: Kernel access of bad area, sig: 11 [#1]
>>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>    Modules linked in:
>>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc2-00134-g9307ce092f5d #314
>>    Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,git-5b4c5a pSeries
>>    NIP:  c0000000200a70e0 LR: c0000000203dd5dc CTR: 0000000000000800
>>    REGS: c000000024543280 TRAP: 0300   Not tainted  (6.2.0-rc2-00134-g9307ce092f5d)
>>    MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24002280  XER: 00000006
>>    CFAR: c0000000200a70c8 DAR: c00000002ffb0000 DSISR: 40000000 IRQMASK: 0
>>    ...
>>    NIP memcpy_power7+0x400/0x7d0
>>    LR  kmemdup+0x5c/0x80
>>    Call Trace:
>>      memcpy_power7+0x274/0x7d0 (unreliable)
>>      kmemdup+0x5c/0x80
>>      tpm_read_log_of+0xe8/0x1b0
>>      tpm_bios_log_setup+0x60/0x210
>>      tpm_chip_register+0x134/0x320
>>      tpm_ibmvtpm_probe+0x520/0x7d0
>>      vio_bus_probe+0x9c/0x460
>>      really_probe+0x104/0x420
>>      __driver_probe_device+0xb0/0x170
>>      driver_probe_device+0x58/0x180
>>      __driver_attach+0xd8/0x250
>>      bus_for_each_dev+0xb4/0x140
>>      driver_attach+0x34/0x50
>>      bus_add_driver+0x1e8/0x2d0
>>      driver_register+0xb4/0x1c0
>>      __vio_register_driver+0x74/0x9c
>>      ibmvtpm_module_init+0x34/0x48
>>      do_one_initcall+0x80/0x320
>>      kernel_init_freeable+0x304/0x3ac
>>      kernel_init+0x30/0x1a0
>>      ret_from_kernel_thread+0x5c/0x64
>
> I have not been able to reproduce this particular crash issue with a
> 6.2 kernel running on P10 PowerVM when NOT applying your patches.

The crash only happens for a crashdump kernel, not a regular kexec.

And depending on where the SML is in memory, compared to where the
crashkernel is, the SML might be mapped accidentally in which case there
is no crash.

> For my tests I have used the following parameter with the 16GB VM:
> crashkernel=2G-4G:384M,4G-16G:1G,16G-64G:2G,64G-128G:2G,128G-:4G

So you should be seeing a 2GB crashkernel reservation at 512MB.

> What I noticed is that the log gets corrupted when the 2 patches are applied:
>
> After fresh boot:
>
>> cp /sys/kernel/security/tpm0/binary_bios_measurements ./
>> ls -l binary_bios_measurements
> -r--r-----. 1 root root 10051 Feb 28 12:09 binary_bios_measurements
>
>
>> kexec -l /boot/vmlinuz-6.2.0+ --initrd /boot/initramfs-6.2.0+.img '--append=BOOT_IMAGE=/vmlinuz-6.2.0+ root=/dev/mapper/rhel_XYZ ro crashkernel=2G-4G:384M,4G-16G:1G,16G-64G:2G,64G-128G:2G,128G-:4G rd.lvm.lv=rhel_XYZ/root rd.lvm.lv=rhel_XYZ/swap biosdevname=0' -s
>> kexec -e

That's a normal kexec, not a crash kexec, so it doesn't use the
crashkernel region mentioned above.

>> cp /sys/kernel/security/tpm0/binary_bios_measurements ./
>> ls -l binary_bios_measurements
> -r--r-----. 1 root root 32 Feb 28 12:10 binary_bios_measurements
>
>> od -t x1 < binary_bios_measurements
> 0000000 d0 0d fe ed 00 00 77 80 00 00 00 a0 00 00 4f 4c
> 0000020 00 00 00 28 00 00 00 11 00 00 00 11 00 00 00 00
> 0000040

That's a device tree header !? O_o

#define OF_DT_HEADER		0xd00dfeed	/* marker */

> The contents have changed and these first 4 bytes of it are always the
> same once it has become this 32 byte file, otherwise they would be
> zero.

I'm not sure what's happening there. We'll need to debug it some more :/

cheers
