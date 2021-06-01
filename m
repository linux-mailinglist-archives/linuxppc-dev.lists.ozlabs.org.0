Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A04FA396E04
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 09:36:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvP9w6G4jz307g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 17:36:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=avj5Wokz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=avj5Wokz; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvP9T3Ghcz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 17:36:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvP9H6yNkz9sSn;
 Tue,  1 Jun 2021 17:36:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622532981;
 bh=DU4BlmCCuSX3Xjy3g7inE5a4bekBy5dG+TyaTzdTTAY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=avj5Wokz+LXID6AxMNV3aYBAKcYO9WFQIlMpLOAewF1nHlZG5F5VeW5p0jzRVE6yI
 a2OV+axzRr7B9Je9P0RhrW4lsXucZnUe5kNeaGkDnRHPGz+D3okPDRGWHXnRTJFiDZ
 De37KNQxoyVeLsV8hLSx9s0hP66O6H44nYcr1Bj6bo4y3AdFYg8OXdAtGpSLVs+jjY
 wxQDDZvfxVtG5uhrt0NSGUoVVet9cwtgvrYzbWB2gCaVQLpo7eqEHAro/3Lgx1LjbD
 JfvFD8564c1xTFM6MBFc9Xfl+MPL4nCVsF/jJ78asv50xz5p+2cFN6/otTOWte7LLg
 eOIgEMCBcsSsg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH] Revert "powerpc: Switch to relative jump labels"
In-Reply-To: <YLOcG55/gCNuMsBU@SPB-NB-133.local>
References: <20210528012943.23192-1-r.bolshakov@yadro.com>
 <87pmxah1h6.fsf@mpe.ellerman.id.au> <YLOcG55/gCNuMsBU@SPB-NB-133.local>
Date: Tue, 01 Jun 2021 17:36:15 +1000
Message-ID: <87h7iighow.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux@yadro.com,
 Paul Mackerras <paulus@samba.org>, Anastasia Kovaleva <a.kovaleva@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Roman Bolshakov <r.bolshakov@yadro.com> writes:
> On Sat, May 29, 2021 at 09:39:49AM +1000, Michael Ellerman wrote:
>> Roman Bolshakov <r.bolshakov@yadro.com> writes:
>> > This reverts commit b0b3b2c78ec075cec4721986a95abbbac8c3da4f.
>> >
>> > Otherwise, direct kernel boot with initramfs no longer works in QEMU.
>> > It's broken in some bizarre way because a valid initramfs is not
>> > recognized anymore:
>> >
>> >   Found initrd at 0xc000000001f70000:0xc000000003d61d64
>> >   rootfs image is not initramfs (XZ-compressed data is corrupt); looks like an initrd
>> >
>> > The issue is observed on v5.13-rc3 if the kernel is built with
>> > defconfig, GCC 7.5.0 and GNU ld 2.32.0.
>> 
>> Are you able to try a different compiler?
>
> Hi Michael,
>
> I've just tried GCC 9.3.1 and the result is the same.
>
> The offending patch has assembly inlines, they typically go through
> binutils/GAS and it might also be a case when older binutils doesn't
> implement something properly (i've seen this on x86 and arm).

Jump labels use asm goto, which is a compiler feature, but you're right
that the binutils version could also be important.

What ld versions have you tried?

And are those the toolchains from kernel.org or somewhere else?

>> I test booting qemu constantly, but I don't use GCC 7.5.
>>
>> And what qemu version are you using?
>> 
>
> QEMU 3.1.1, but I've also tried 6.0.50 (QEMU master, 62c0ac5041e913) and
> it fails the same way.

OK.

>> I assume your initramfs is compressed with XZ? How large is it
>> compressed?
>> 
>
> Yes, XZ. initramfs size is 30 MB (around 100 MB cpio size).
>
> It's interesting that the issue doesn't happen if I pass initramfs from
> host (11MB), then the initramfs can be recognized. It might be related
> to initramfs size then and bigger initramfs that used to work no longer
> work with v5.13-rc3.

Are you using qemu's -initrd option to pass the initramfs, or are you
building the initramfs into the kernel?

> So, I've created a small initramfs using only static busybox (2.7M
> uncompressed, 960K compressed with xz). No error is produced and it
> boots fine.
>
> If I add a dummy file (11M off /dev/urandom) to the small busybox
> initramfs, it boots and the init is started but I'm seeing the error:
>
>   rootfs image is not initramfs (XZ-compressed data is corrupt); looks like an initrd
>
> sha1sum of the file inside initramfs doesn't match sha1sum on the host.
>
>   guest # sha1sum dummy
>   407c347e671ddd00f69df12b3368048bad0ebf0c  dummy
>   # QEMU: Terminated
>   host $ sha1sum dummy
>   ed8494b3eecab804960ceba2c497270eed0b0cd1  dummy
>
> sha1sum is the same in the guest and on the host for 10M dummy file:
>
>   guest # sha1sum dummy
>   43855f7a772a28cce91da9eb8f86f53bc807631f  dummy
>   # QEMU: Terminated
>   host $ sha1sum dummy
>   43855f7a772a28cce91da9eb8f86f53bc807631f  dummy
>
> That might explain why bigger initramfs (or initramfs with bigger files)
> doesn't boot - because some files might appear corrupted inside the guest.
>
> Here're the sources of the initrd along with 11M dummy file:
>   https://drive.yadro.com/s/W8HdbPnaKmPPwK4
>
> I've compressed it with:
>   $ find . 2>/dev/null | cpio -ocR 0:0 | xz  --check=crc32 > ../initrd-dummy.xz
>
> Hope this helps,

I haven't been able to reproduce any corruption, with various initramfs
sizes.

Can you send us your kernel .config & qemu command line.

And can you try the patch below?

cheers


diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_label.c
index ce87dc5ea23c..3d9878124cde 100644
--- a/arch/powerpc/kernel/jump_label.c
+++ b/arch/powerpc/kernel/jump_label.c
@@ -13,6 +13,9 @@ void arch_jump_label_transform(struct jump_entry *entry,
 {
 	struct ppc_inst *addr = (struct ppc_inst *)jump_entry_code(entry);
 
+	if (!is_kernel_text((unsigned long)addr) && !is_kernel_inittext((unsigned long)addr))
+		printk("%s: addr %px %pS is not kernel text?\n", __func__, addr, addr);
+
 	if (type == JUMP_LABEL_JMP)
 		patch_branch(addr, jump_entry_target(entry), 0);
 	else
