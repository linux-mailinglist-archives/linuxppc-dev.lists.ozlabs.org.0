Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC13AB4D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 15:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5NLx2YGjz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 23:34:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net;
 envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5NLb6Z98z309N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 23:33:57 +1000 (AEST)
Received: (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 75B2940011;
 Thu, 17 Jun 2021 13:33:49 +0000 (UTC)
Subject: Re: [PATCH v6 0/3] Introduce 64b relocatable kernel
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20210518101252.1484465-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8512c6b0-3dff-5485-b5d8-638044594973@ghiti.fr>
Date: Thu, 17 Jun 2021 15:33:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210518101252.1484465-1-alex@ghiti.fr>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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

Le 18/05/2021 à 12:12, Alexandre Ghiti a écrit :
> After multiple attempts, this patchset is now based on the fact that the
> 64b kernel mapping was moved outside the linear mapping.
> 
> The first patch allows to build relocatable kernels but is not selected
> by default. That patch should ease KASLR implementation a lot.
> The second and third patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.

@Palmer, any thought about that? There are no users for now, do you want 
to wait for a KASLR implementation to use it before merging this? If so, 
I can work on a KASLR implementation based on older implementation from 
Zong.

Thanks,

> 
> This patchset was tested on:
> 
> * kernel:
> - rv32: OK
> - rv64 with RELOCATABLE: OK and checked that "suspicious" relocations are caught.
> - rv64 without RELOCATABLE: OK
> - powerpc: build only and checked that "suspicious" relocations are caught.
>                                                                                   
> * xipkernel:
> - rv32: build only
> - rv64: OK
> 
> * nommukernel:
> - rv64: build only
> 
> Changes in v6:
>    * Remove the kernel move to vmalloc zone
>    * Rebased on top of for-next
>    * Remove relocatable property from 32b kernel as the kernel is mapped in
>      the linear mapping and would then need to be copied physically too
>    * CONFIG_RELOCATABLE depends on !XIP_KERNEL
>    * Remove Reviewed-by from first patch as it changed a bit
> 
> Changes in v5:
>    * Add "static __init" to create_kernel_page_table function as reported by
>      Kbuild test robot
>    * Add reviewed-by from Zong
>    * Rebase onto v5.7
> 
> Changes in v4:
>    * Fix BPF region that overlapped with kernel's as suggested by Zong
>    * Fix end of module region that could be larger than 2GB as suggested by Zong
>    * Fix the size of the vm area reserved for the kernel as we could lose
>      PMD_SIZE if the size was already aligned on PMD_SIZE
>    * Split compile time relocations check patch into 2 patches as suggested by Anup
>    * Applied Reviewed-by from Zong and Anup
> 
> Changes in v3:
>    * Move kernel mapping to vmalloc
> 
> Changes in v2:
>    * Make RELOCATABLE depend on MMU as suggested by Anup
>    * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup
>    * Use __pa_symbol instead of __pa, as suggested by Zong
>    * Rebased on top of v5.6-rc3
>    * Tested with sv48 patchset
>    * Add Reviewed/Tested-by from Zong and Anup
> 
> Alexandre Ghiti (3):
>    riscv: Introduce CONFIG_RELOCATABLE
>    powerpc: Move script to check relocations at compile time in scripts/
>    riscv: Check relocations at compile time
> 
>   arch/powerpc/tools/relocs_check.sh | 18 ++--------
>   arch/riscv/Kconfig                 | 12 +++++++
>   arch/riscv/Makefile                |  5 ++-
>   arch/riscv/Makefile.postlink       | 36 ++++++++++++++++++++
>   arch/riscv/kernel/vmlinux.lds.S    |  6 ++++
>   arch/riscv/mm/Makefile             |  4 +++
>   arch/riscv/mm/init.c               | 53 +++++++++++++++++++++++++++++-
>   arch/riscv/tools/relocs_check.sh   | 26 +++++++++++++++
>   scripts/relocs_check.sh            | 20 +++++++++++
>   9 files changed, 162 insertions(+), 18 deletions(-)
>   create mode 100644 arch/riscv/Makefile.postlink
>   create mode 100755 arch/riscv/tools/relocs_check.sh
>   create mode 100755 scripts/relocs_check.sh
> 
