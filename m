Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C829B217E29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 06:23:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1mQ80831zDr37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:23:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.183.195; helo=relay3-d.mail.gandi.net;
 envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ghiti.fr
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1mNP6Q97zDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 14:21:55 +1000 (AEST)
X-Originating-IP: 90.112.45.105
Received: from [192.168.1.11] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C642C60003;
 Wed,  8 Jul 2020 04:21:42 +0000 (UTC)
Subject: Re: [PATCH v5 0/4] vmalloc kernel mapping and relocatable kernel
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
References: <20200607075949.665-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8f47d523-5c01-1614-dbb0-d938f07be65f@ghiti.fr>
Date: Wed, 8 Jul 2020 00:21:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200607075949.665-1-alex@ghiti.fr>
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

Hi Palmer,

Le 6/7/20 à 3:59 AM, Alexandre Ghiti a écrit :
> This patchset originally implemented relocatable kernel support but now
> also moves the kernel mapping into the vmalloc zone.
>                                                                                   
> The first patch explains why we need to move the kernel into vmalloc
> zone (instead of memcpying it around). That patch should ease KASLR
> implementation a lot.
>                                                                                   
> The second patch allows to build relocatable kernels but is not selected
> by default.
>                                                                                   
> The third and fourth patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.
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
> Alexandre Ghiti (4):
>    riscv: Move kernel mapping to vmalloc zone
>    riscv: Introduce CONFIG_RELOCATABLE
>    powerpc: Move script to check relocations at compile time in scripts/
>    riscv: Check relocations at compile time
> 
>   arch/powerpc/tools/relocs_check.sh |  18 +----
>   arch/riscv/Kconfig                 |  12 +++
>   arch/riscv/Makefile                |   5 +-
>   arch/riscv/Makefile.postlink       |  36 +++++++++
>   arch/riscv/boot/loader.lds.S       |   3 +-
>   arch/riscv/include/asm/page.h      |  10 ++-
>   arch/riscv/include/asm/pgtable.h   |  38 ++++++---
>   arch/riscv/kernel/head.S           |   3 +-
>   arch/riscv/kernel/module.c         |   4 +-
>   arch/riscv/kernel/vmlinux.lds.S    |   9 ++-
>   arch/riscv/mm/Makefile             |   4 +
>   arch/riscv/mm/init.c               | 121 +++++++++++++++++++++++++----
>   arch/riscv/mm/physaddr.c           |   2 +-
>   arch/riscv/tools/relocs_check.sh   |  26 +++++++
>   scripts/relocs_check.sh            |  20 +++++
>   15 files changed, 259 insertions(+), 52 deletions(-)
>   create mode 100644 arch/riscv/Makefile.postlink
>   create mode 100755 arch/riscv/tools/relocs_check.sh
>   create mode 100755 scripts/relocs_check.sh
> 

Do you have any remark regarding this series ?

Thanks,

Alex
