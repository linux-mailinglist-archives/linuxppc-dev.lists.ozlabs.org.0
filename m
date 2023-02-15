Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F4B697E7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 15:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH0zC1qCHz3cdm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 01:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=3Y9vxYu6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=3Y9vxYu6;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH0yF15K5z3c9C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 01:36:34 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id a2so19377705wrd.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 06:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRBV0SjOH4m1jqJftOHPSfzIM3NEGl9hHTTwCxPywOE=;
        b=3Y9vxYu6ar2dSB1kCRjCTzicJeTftRBdXwzP+5fueQmlRdReC3ZqXOQCw66BayRRw4
         t3XNyatq5AjKpvkWNSeSyD3WoE/CFp3DcFJeJCPHHEF//3aYjSd/uacqdvw/GQqsCYdo
         wSH2haym4J25PhWHEu/Uz7mNTc9n3wmHR4bw9pswNCnwq8f5ElyGeRw/31e1Cox/ZgxY
         kQ/PMH72LSyKwfKcxeBqbTD6pEvf7lnmcCv8NBu5010VHTEwugEgEaGlpGN9pMplxDNI
         2KEFNrML6RHJ2FAyHwNXamlbaa3LC6ywSeDdgQESFnQ47ia5GVKqv4DTGxGGblmQ/vCf
         W9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRBV0SjOH4m1jqJftOHPSfzIM3NEGl9hHTTwCxPywOE=;
        b=XPi/y4SDbXxH37rImiyyU811c4j3ffL+yzUSO4ZWjyh63TQUE8kIpt6MQu0MdYCgJV
         ozAG5qGi1jhyII5VYdtDkLhfNe2C9rGldFCFtUo1Aw7XowcrSNe6m6Ztsy/hDpF18eD3
         IBtxexDWjrVbiHlIyFxXVgIyLQ5mpRTKlC+lWBb98JXD7UFASiFhZm0r9mmykjB4JwVl
         nRY/Bk/ERB0euB0OJyYZayIVpcPJPlDAWHrmU+OUjjl+kRIk4nRYIsoss092AJuu35Gd
         XnMCZomHNaYqzHP/e+zK8vTiv+ICgjzC2BJg/Yh+BMIdInmfAoS1kKK0Zzq2qsCuLF0I
         TNvQ==
X-Gm-Message-State: AO0yUKVmG6UX9/54+IMOu1cpH0Mw9t8oV+Zr/2a0cMaDN6qb28CDShIP
	f7YrvbNa0V2JbHfOR6Ag+l7Krg==
X-Google-Smtp-Source: AK7set9r973hQ5UHjGnbObY0O9BnXI60Uko7b5o7mmb/X0KABjEgyxP2XnPeDtYgbbaurkyV430ZZg==
X-Received: by 2002:a05:6000:10c1:b0:2c5:56ff:4321 with SMTP id b1-20020a05600010c100b002c556ff4321mr2138475wrx.4.1676471789041;
        Wed, 15 Feb 2023 06:36:29 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c024400b003e01493b136sm2232092wmj.43.2023.02.15.06.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:36:28 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 0/3] Introduce 64b relocatable kernel
Date: Wed, 15 Feb 2023 15:36:23 +0100
Message-Id: <20230215143626.453491-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
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

RISC-V kasan rework (https://lore.kernel.org/lkml/Y6TTvku%2FyuSjm42j@spud/T/)
riscv: Use PUD/P4D/PGD pages for the linear mapping (https://lore.kernel.org/lkml/20230125114229.hrhsyw4aegrnmoau@orel/T/)
riscv: Allow to downgrade paging mode from the command line (https://lore.kernel.org/lkml/CAHVXubjeSMvfTPnvrnYRupOGx6+vUvUGfRS3piTeo=TH2cHKNg@mail.gmail.com/)
base-commit-tag: v6.2-rc7

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

Alexandre Ghiti (3):
  riscv: Introduce CONFIG_RELOCATABLE
  powerpc: Move script to check relocations at compile time in scripts/
  riscv: Check relocations at compile time

 arch/powerpc/tools/relocs_check.sh | 18 ++--------
 arch/riscv/Kconfig                 | 14 ++++++++
 arch/riscv/Makefile                |  7 ++--
 arch/riscv/Makefile.postlink       | 36 ++++++++++++++++++++
 arch/riscv/kernel/efi-header.S     |  6 ++--
 arch/riscv/kernel/vmlinux.lds.S    | 10 ++++--
 arch/riscv/mm/Makefile             |  4 +++
 arch/riscv/mm/init.c               | 54 +++++++++++++++++++++++++++++-
 arch/riscv/tools/relocs_check.sh   | 26 ++++++++++++++
 scripts/relocs_check.sh            | 20 +++++++++++
 10 files changed, 171 insertions(+), 24 deletions(-)
 create mode 100644 arch/riscv/Makefile.postlink
 create mode 100755 arch/riscv/tools/relocs_check.sh
 create mode 100755 scripts/relocs_check.sh

--
2.37.2

