Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 093EBEA912
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 03:04:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473TC52SFWzF5M0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 13:04:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473T972FzmzF43s
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 13:02:18 +1100 (AEDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 28D5ECBE2CFE2676E272;
 Thu, 31 Oct 2019 10:02:01 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Thu, 31 Oct 2019
 10:01:59 +0800
Subject: Re: Pull request: scottwood/linux.git next
To: Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>
References: <20191022232155.GA26174@home.buserror.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <935d65ed-526b-2cdc-31e0-d7856e750a04@huawei.com>
Date: Thu, 31 Oct 2019 10:01:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20191022232155.GA26174@home.buserror.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.96.203]
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael, Can you pull this to linux-next so that we can test it on 
linux-next for some time?

Thanks,
Jason


On 2019/10/23 7:21, Scott Wood wrote:
> This contains KASLR support for book3e 32-bit.
> 
> The following changes since commit 612ee81b9461475b5a5612c2e8d71559dd3c7920:
> 
>    powerpc/papr_scm: Fix an off-by-one check in papr_scm_meta_{get, set} (2019-10-10 20:15:53 +1100)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git next
> 
> for you to fetch changes up to 9df1ef3f1376ec5d3a1b51a4546c94279bcd88ca:
> 
>    powerpc/fsl_booke/32: Document KASLR implementation (2019-10-21 16:09:16 -0500)
> 
> ----------------------------------------------------------------
> Jason Yan (12):
>        powerpc: unify definition of M_IF_NEEDED
>        powerpc: move memstart_addr and kernstart_addr to init-common.c
>        powerpc: introduce kernstart_virt_addr to store the kernel base
>        powerpc/fsl_booke/32: introduce create_kaslr_tlb_entry() helper
>        powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
>        powerpc/fsl_booke/32: implement KASLR infrastructure
>        powerpc/fsl_booke/32: randomize the kernel image offset
>        powerpc/fsl_booke/kaslr: clear the original kernel if randomized
>        powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
>        powerpc/fsl_booke/kaslr: dump out kernel offset information on panic
>        powerpc/fsl_booke/kaslr: export offset in VMCOREINFO ELF notes
>        powerpc/fsl_booke/32: Document KASLR implementation
> 
>   Documentation/powerpc/kaslr-booke32.rst       |  42 +++
>   arch/powerpc/Kconfig                          |  11 +
>   arch/powerpc/include/asm/nohash/mmu-book3e.h  |  11 +-
>   arch/powerpc/include/asm/page.h               |   7 +
>   arch/powerpc/kernel/early_32.c                |   5 +-
>   arch/powerpc/kernel/exceptions-64e.S          |  12 +-
>   arch/powerpc/kernel/fsl_booke_entry_mapping.S |  25 +-
>   arch/powerpc/kernel/head_fsl_booke.S          |  61 +++-
>   arch/powerpc/kernel/machine_kexec.c           |   1 +
>   arch/powerpc/kernel/misc_64.S                 |   7 +-
>   arch/powerpc/kernel/setup-common.c            |  20 ++
>   arch/powerpc/mm/init-common.c                 |   7 +
>   arch/powerpc/mm/init_32.c                     |   5 -
>   arch/powerpc/mm/init_64.c                     |   5 -
>   arch/powerpc/mm/mmu_decl.h                    |  11 +
>   arch/powerpc/mm/nohash/Makefile               |   1 +
>   arch/powerpc/mm/nohash/fsl_booke.c            |   8 +-
>   arch/powerpc/mm/nohash/kaslr_booke.c          | 401 ++++++++++++++++++++++++++
>   18 files changed, 587 insertions(+), 53 deletions(-)
>   create mode 100644 Documentation/powerpc/kaslr-booke32.rst
>   create mode 100644 arch/powerpc/mm/nohash/kaslr_booke.c
> 
> 

