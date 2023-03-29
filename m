Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F396CD148
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 06:54:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmZ3B2HJNz3bdm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 15:54:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dT3vR+5B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dT3vR+5B;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmZ2D5SwSz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 15:53:38 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id n19so8130548wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 21:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo0pBz6wf3kyiWYQ9fjYRy+Wu64GhON7Bmz6ajIouOI=;
        b=dT3vR+5BCE0d2cD8qefotDYbxWqPr15i/uHQCi1YF886RpaVStPW6F27dSe9spSiBr
         nSo/S/VtEpndi0j2dD/H1lMx8HaUY3qjH1EQ0q68rn++tg5lbeV9YItR3H0UmqtidEr4
         GKRKJRhc5o+iNCRWeEZHO5kblPX5hYBdEfCMio2bAlbhW/sSelRb5v3N5WHsZkyfM5Gj
         becrsvXvlUJx1Mi33oacQC/hIR35TWFoCcR6S6AhtBxCZ8C9wt3Pf9FlTe+EOUXVxDTu
         KpQUXUSJ49y/XaC9UKkb06EVDpFkbGgNuj1x5g1oHnS0J3RO9jlYM2uhXRKwop3WEa/o
         XeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo0pBz6wf3kyiWYQ9fjYRy+Wu64GhON7Bmz6ajIouOI=;
        b=Lg8xalFCaSjcj5yKP/xR1ZxGcvB/Cw8W3tywOJVkd0oVF09sRAIoeKcD5tm48mvG3J
         04XVqm24QY1ISDf9pFUL8z6joEtrzP+zw+U1oeO63mpdwiscpLoKGEvlrIjkXbpnQz/r
         kzozwkK98YYJyesHptej6KMWz/8l0O4leky8ksd2Vs6fS0WDCDKOwBceyJUbAtnlrZPq
         h0ymqE6UbjtpiBRd28j36Q2thZX0EJgrHpc73/mxKVCtTQTi/JOEdcSqAhdBfeA/kn7d
         cUt+E8avCk7CRXHeCJ3muTt4BdQ9J5c6upF0Kvb09VWv4EeEJcgtQQl1TmRxnXxSruei
         58oA==
X-Gm-Message-State: AO0yUKWul8wJxdekdl9duzE2M0pXh2FP8nu5EOxMwiNgnYUr7IjMxxwb
	6ZyVsqemWihtntxpRZwMju//bA==
X-Google-Smtp-Source: AK7set9J+TBd/c5WkVGXfbeJnMQvLgoUo8YsvVH4bgNXSXp/VtTgvyfk23V2+90Kw1vfaq4rCqyaVA==
X-Received: by 2002:a7b:c850:0:b0:3ed:29db:cb80 with SMTP id c16-20020a7bc850000000b003ed29dbcb80mr13580773wml.18.1680065613023;
        Tue, 28 Mar 2023 21:53:33 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o6-20020a1c7506000000b003ee63fe5203sm757591wmc.36.2023.03.28.21.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:53:32 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v9 0/6] Introduce 64b relocatable kernel
Date: Wed, 29 Mar 2023 06:53:23 +0200
Message-Id: <20230329045329.64565-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After multiple attempts, this patchset is now based on the fact that the
64b kernel mapping was moved outside the linear mapping.

The first patch allows to build relocatable kernels but is not selected
by default. That patch is a requirement for KASLR.
The second and third patches take advantage of an already existing powerpc
script that checks relocations at compile-time, and uses it for riscv.

This patchset is rebased on top of:

riscv: Use PUD/P4D/PGD pages for the linear mapping
(https://patchwork.kernel.org/project/linux-riscv/list/?series=733603)
base-commit-tag: v6.3-rc1

Changes in v9:
  * Fix gcc/llvm compilation errors by adding patch 1, thanks to Bjorn
  * Move a patch to move rela.dyn outside of init (patch 2): it is a
    separate patch to clearly explain why
  * To effectively move rela.dyn to init, we need to add patch 6: separate patch since we may be
    able at some point to revert (along with patch 2).
  * Add a lot of orphan sections to the linker script

Changes in v8:
  * Fix UEFI boot by moving rela.dyn section into the data so that PE/COFF
    loader actually copies the relocations too
  * Fix check that used PGDIR instead of PUD which was not correct
    for sv48 and sv57
  * Fix PE/COFF header data size definition as it led to size of 0

Changes in v7:
  * Rebase on top of v5.15
  * Fix LDFLAGS_vmlinux which was overriden when CONFIG_DYNAMIC_FTRACE was
    set
  * Make relocate_kernel static
  * Add Ack from Michael

Changes in v6:
  * Remove the kernel move to vmalloc zone
  * Rebased on top of for-next
  * Remove relocatable property from 32b kernel as the kernel is mapped in
    the linear mapping and would then need to be copied physically too
  * CONFIG_RELOCATABLE depends on !XIP_KERNEL
  * Remove Reviewed-by from first patch as it changed a bit

Changes in v5:
  * Add "static __init" to create_kernel_page_table function as reported by
    Kbuild test robot
  * Add reviewed-by from Zong
  * Rebase onto v5.7

Changes in v4:
  * Fix BPF region that overlapped with kernel's as suggested by Zong
  * Fix end of module region that could be larger than 2GB as suggested by Zong
  * Fix the size of the vm area reserved for the kernel as we could lose
    PMD_SIZE if the size was already aligned on PMD_SIZE
  * Split compile time relocations check patch into 2 patches as suggested by Anup
  * Applied Reviewed-by from Zong and Anup

Changes in v3:
  * Move kernel mapping to vmalloc

Changes in v2:
  * Make RELOCATABLE depend on MMU as suggested by Anup
  * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup
  * Use __pa_symbol instead of __pa, as suggested by Zong
  * Rebased on top of v5.6-rc3
  * Tested with sv48 patchset
  * Add Reviewed/Tested-by from Zong and Anup

Alexandre Ghiti (6):
  riscv: Prepare EFI header for relocatable kernels
  riscv: Move .rela.dyn outside of init to avoid empty relocations
  riscv: Introduce CONFIG_RELOCATABLE
  powerpc: Move script to check relocations at compile time in scripts/
  riscv: Check relocations at compile time
  riscv: Use --emit-relocs in order to move .rela.dyn in init

 arch/powerpc/tools/relocs_check.sh  | 18 ++--------
 arch/riscv/Kconfig                  | 14 ++++++++
 arch/riscv/Makefile                 |  7 ++--
 arch/riscv/Makefile.postlink        | 49 ++++++++++++++++++++++++++
 arch/riscv/boot/Makefile            |  7 ++++
 arch/riscv/include/asm/set_memory.h |  3 ++
 arch/riscv/kernel/efi-header.S      | 19 ++++++++--
 arch/riscv/kernel/vmlinux.lds.S     | 26 ++++++++++----
 arch/riscv/mm/Makefile              |  4 +++
 arch/riscv/mm/init.c                | 54 ++++++++++++++++++++++++++++-
 arch/riscv/tools/relocs_check.sh    | 26 ++++++++++++++
 scripts/relocs_check.sh             | 20 +++++++++++
 12 files changed, 218 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/Makefile.postlink
 create mode 100755 arch/riscv/tools/relocs_check.sh
 create mode 100755 scripts/relocs_check.sh

-- 
2.37.2

