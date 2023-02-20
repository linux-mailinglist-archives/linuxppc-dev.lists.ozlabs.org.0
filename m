Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D7969C770
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 10:15:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKxZz2scvz3cJG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 20:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mAcRmoA6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bjorn@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mAcRmoA6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKxZ235xYz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 20:14:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DBFB6B80A49;
	Mon, 20 Feb 2023 09:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B570C433EF;
	Mon, 20 Feb 2023 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676884451;
	bh=mG/NJn6UIKMCtB1jUJxsXAFCx30P4P2liMAXbdz/2Xo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mAcRmoA6Qn3UZ1chqK60R1a2hOSyf3/oQFr9/z4MVnvrvZpMm1yEwoqqWTqJ0IMbh
	 L7W844Whmf+R+CoIxa/+5A3ShRVClbZ91nvx+OLA3SadOpiq7O719RAXw69X71/BFU
	 DtFAIuLebpfytY40BPrUr7OG2trd4+iPLaHButziGI9MBP/STpDpPG5uxN5UKtSV8L
	 XYiDzlzvSsIrgoy5ZcCrtXTfbe3nwCMDN/Ar2nzLAxsIQ+wsFrrTsbzB//rb7Y82N7
	 KtKQJEvcSyK7lCJv3F7dJaUIbglBk2CjsdArBrH867pR97sXB1f+v1CjyC8P9rDpg5
	 fc8kEM4T9n7lg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/3] Introduce 64b relocatable kernel
In-Reply-To: <20230215143626.453491-1-alexghiti@rivosinc.com>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
Date: Mon, 20 Feb 2023 10:14:09 +0100
Message-ID: <87y1osog0u.fsf@all.your.base.are.belong.to.us>
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> After multiple attempts, this patchset is now based on the fact that the
> 64b kernel mapping was moved outside the linear mapping.
>
> The first patch allows to build relocatable kernels but is not selected
> by default. That patch is a requirement for KASLR.
> The second and third patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.
>
> This patchset is rebased on top of:
>
> RISC-V kasan rework (https://lore.kernel.org/lkml/Y6TTvku%2FyuSjm42j@spud=
/T/)
> riscv: Use PUD/P4D/PGD pages for the linear mapping (https://lore.kernel.=
org/lkml/20230125114229.hrhsyw4aegrnmoau@orel/T/)
> riscv: Allow to downgrade paging mode from the command line (https://lore=
.kernel.org/lkml/CAHVXubjeSMvfTPnvrnYRupOGx6+vUvUGfRS3piTeo=3DTH2cHKNg@mail=
.gmail.com/)
> base-commit-tag: v6.2-rc7
>
> Changes in v8:
>   * Fix UEFI boot by moving rela.dyn section into the data so that PE/COFF
>     loader actually copies the relocations too
>   * Fix check that used PGDIR instead of PUD which was not correct
>     for sv48 and sv57
>   * Fix PE/COFF header data size definition as it led to size of 0
>
> Changes in v7:
>   * Rebase on top of v5.15
>   * Fix LDFLAGS_vmlinux which was overriden when CONFIG_DYNAMIC_FTRACE was
>     set
>   * Make relocate_kernel static
>   * Add Ack from Michael
>
> Changes in v6:
>   * Remove the kernel move to vmalloc zone
>   * Rebased on top of for-next
>   * Remove relocatable property from 32b kernel as the kernel is mapped in
>     the linear mapping and would then need to be copied physically too
>   * CONFIG_RELOCATABLE depends on !XIP_KERNEL
>   * Remove Reviewed-by from first patch as it changed a bit
>
> Changes in v5:
>   * Add "static __init" to create_kernel_page_table function as reported =
by
>     Kbuild test robot
>   * Add reviewed-by from Zong
>   * Rebase onto v5.7
>
> Changes in v4:
>   * Fix BPF region that overlapped with kernel's as suggested by Zong
>   * Fix end of module region that could be larger than 2GB as suggested b=
y Zong
>   * Fix the size of the vm area reserved for the kernel as we could lose
>     PMD_SIZE if the size was already aligned on PMD_SIZE
>   * Split compile time relocations check patch into 2 patches as suggeste=
d by Anup
>   * Applied Reviewed-by from Zong and Anup
>
> Changes in v3:
>   * Move kernel mapping to vmalloc
>
> Changes in v2:
>   * Make RELOCATABLE depend on MMU as suggested by Anup
>   * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup
>   * Use __pa_symbol instead of __pa, as suggested by Zong
>   * Rebased on top of v5.6-rc3
>   * Tested with sv48 patchset
>   * Add Reviewed/Tested-by from Zong and Anup
>
> Alexandre Ghiti (3):
>   riscv: Introduce CONFIG_RELOCATABLE
>   powerpc: Move script to check relocations at compile time in scripts/
>   riscv: Check relocations at compile time

I'm getting issues booting via UEFI/efi-stub with this, because the PE
header is messed up.

from arch/riscv/kernel/efi-header.S:

 | ...
 | extra_header_fields:
 |         .quad   0                                       // ImageBase
 |         .long   PECOFF_SECTION_ALIGNMENT                // SectionAlignm=
ent
 |         .long   PECOFF_FILE_ALIGNMENT                   // FileAlignment
 | ...

PECOFF* is taken from the linker-script, and ends up in relocation
section. When u-boot tried to load the image, alignment is zero and the
loader breaks.


Bj=C3=B6rn
