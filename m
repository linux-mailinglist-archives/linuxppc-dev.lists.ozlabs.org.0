Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C676EB1F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 21:00:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q33kN2Gjhz3fWW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Apr 2023 05:00:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=npcCe58z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=npcCe58z;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q33jW4Jxyz3fHP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Apr 2023 04:59:25 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1a9253d4551so21937745ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682103562; x=1684695562;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FS3xd+GxAsAM22DtQ8EZILFt6ljQaMvOWy1hQtNJeRI=;
        b=npcCe58zYvv1Q6YVOAIpfMxs/qcn/n3bq+Y2B/kyhgrQ2IwgNZsxdK9FrRF3J4dTgx
         YPGdpqPIpEye6AlFSBOpIxJlceRyot6Lcc0IRC3dj1G7B6gr3MrPA/A1NElUGrVoY53Z
         rnCogjjVEwKQgiuL7DG0+0Nqiz8lvWlf1/Y2Re++oGfgI6xYE8O0YibIDswxz1LljMWF
         4pB7LSAEZDN/niJMqEiXAS+y/uGoEayNq18mhRc2gGbryI7zhJ/2vGks7sCE4FWq4h9R
         dH7rr4jcpK2pwlb9XffOkm3s1hMe1cpIOFpPU5spiIgfag/16tCoJG3CXz3k5vOh+WFb
         kX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103562; x=1684695562;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS3xd+GxAsAM22DtQ8EZILFt6ljQaMvOWy1hQtNJeRI=;
        b=DNojuq+HK7kwI1z/Dl64DGTL+DM0xvU7r6R20y8kG/1z9+iskB5DCClk9U+RDJH6mp
         oWoSX4n+jkJjwmcHraCjf/T17b79DPR8Y7nZsmxp1/ZTNu17lCWPrl4n3J8dhFYbvsoM
         SpVoZ5bE3rzoytm6cjskPwwtpKdC8GQxulEnsidOA83pxmWvruZY01JPmLjhEwJ3RS6+
         /l8MOdCJHSmeIbcZr8XLWl/sENcLRwd3U06Ti38Wed4ImY+slM7TnnT4FQXWom9fEdGj
         WMgaMAKGsywNutbkKXCvGpQNlCHjQ7XUQOcjPSH7TFgi/2lPFk1OC1LXeKxOJ79tGU2u
         8zOA==
X-Gm-Message-State: AAQBX9cuM0+FeiHwHD1llmSkUddoB8sLEok0A4A9Zpt4Qe8JYAsnrd5v
	r76t2O3NlqiyYjICE6TwEX2NSQ==
X-Google-Smtp-Source: AKy350Zk9u1sIOJGf2PvJ1wX8lSj0Nf1O/kXAYgAfDfeDXmtve5mj6ldwrjQYrqdOoqd6Tcu0TGTlw==
X-Received: by 2002:a17:903:188:b0:1a8:ce:afd1 with SMTP id z8-20020a170903018800b001a800ceafd1mr7743984plg.20.1682103562246;
        Fri, 21 Apr 2023 11:59:22 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id bh7-20020a170902a98700b001a19cf1b37esm3057504plb.40.2023.04.21.11.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 11:59:21 -0700 (PDT)
Date: Fri, 21 Apr 2023 11:59:21 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 07:55:56 PDT (-0700)
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-bb70f74f-2b5b-4880-b7bf-975e67dc554e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, linux-kbuild@vger.kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, bjorn@kernel.org, npiggin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Mar 2023 21:53:23 PDT (-0700), alexghiti@rivosinc.com wrote:
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
> riscv: Use PUD/P4D/PGD pages for the linear mapping
> (https://patchwork.kernel.org/project/linux-riscv/list/?series=733603)
> base-commit-tag: v6.3-rc1

The QEMU CI has some way to say "this depends on an un-merged patch set 
sent as $MESSAGE_ID", not sure if that's a b4-ism but it's a bit less 
confusing.

I merged this on top of the pre-merge hugepage linear mapping changes, 
it's on for-next.

> Changes in v9:
>   * Fix gcc/llvm compilation errors by adding patch 1, thanks to Bjorn
>   * Move a patch to move rela.dyn outside of init (patch 2): it is a
>     separate patch to clearly explain why
>   * To effectively move rela.dyn to init, we need to add patch 6: separate patch since we may be
>     able at some point to revert (along with patch 2).
>   * Add a lot of orphan sections to the linker script
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
>   * Add "static __init" to create_kernel_page_table function as reported by
>     Kbuild test robot
>   * Add reviewed-by from Zong
>   * Rebase onto v5.7
>
> Changes in v4:
>   * Fix BPF region that overlapped with kernel's as suggested by Zong
>   * Fix end of module region that could be larger than 2GB as suggested by Zong
>   * Fix the size of the vm area reserved for the kernel as we could lose
>     PMD_SIZE if the size was already aligned on PMD_SIZE
>   * Split compile time relocations check patch into 2 patches as suggested by Anup
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
> Alexandre Ghiti (6):
>   riscv: Prepare EFI header for relocatable kernels
>   riscv: Move .rela.dyn outside of init to avoid empty relocations
>   riscv: Introduce CONFIG_RELOCATABLE
>   powerpc: Move script to check relocations at compile time in scripts/
>   riscv: Check relocations at compile time
>   riscv: Use --emit-relocs in order to move .rela.dyn in init
>
>  arch/powerpc/tools/relocs_check.sh  | 18 ++--------
>  arch/riscv/Kconfig                  | 14 ++++++++
>  arch/riscv/Makefile                 |  7 ++--
>  arch/riscv/Makefile.postlink        | 49 ++++++++++++++++++++++++++
>  arch/riscv/boot/Makefile            |  7 ++++
>  arch/riscv/include/asm/set_memory.h |  3 ++
>  arch/riscv/kernel/efi-header.S      | 19 ++++++++--
>  arch/riscv/kernel/vmlinux.lds.S     | 26 ++++++++++----
>  arch/riscv/mm/Makefile              |  4 +++
>  arch/riscv/mm/init.c                | 54 ++++++++++++++++++++++++++++-
>  arch/riscv/tools/relocs_check.sh    | 26 ++++++++++++++
>  scripts/relocs_check.sh             | 20 +++++++++++
>  12 files changed, 218 insertions(+), 29 deletions(-)
>  create mode 100644 arch/riscv/Makefile.postlink
>  create mode 100755 arch/riscv/tools/relocs_check.sh
>  create mode 100755 scripts/relocs_check.sh
