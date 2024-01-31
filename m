Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B884438C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 17:00:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KZgn6jKK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ6FM3ltgz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 03:00:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KZgn6jKK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ6DX5Tzzz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 02:59:38 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40e80046264so60596385e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 07:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716773; x=1707321573; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJEZ1qPaiDldAW8C05rM2rqR0hTzPI1igVobAmalZsY=;
        b=KZgn6jKKekqL23aNblNC2CAGwfV0MHzepj6SnDyLpXKdq7cCBe+P9HOpstP+5D52KM
         JStSL57K5DtKI089wghMXIx/HRJ3P0blHRoRb3GU/RfyWaNJEyED90ZIJtyLVrb+3FBf
         6OrtEIBQF+TQLP4BVQgyGk0m4S9lRQFRLULQakqYZbiNEFjZAjZ4Y2wikmlnB8LoBuSC
         rtJBXJeupTSua+u1b8KnR8jG1kVqf2UUnyqTlgjx9eW08rUpFNl07hDuSCQVVRWPzX/9
         OuNB/yi0vDDdA5HF/+L44YqdQ9UEGXKShivCqoDo1lpOwRWFxjcG2eQD8XDkhg80gu+q
         266Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716773; x=1707321573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJEZ1qPaiDldAW8C05rM2rqR0hTzPI1igVobAmalZsY=;
        b=Z80Q5JTiQEIJTV0IuleqI6ru1P9SXbsqrXj8KuBhTour3SlsdPw4rnzcDQ40jcC6du
         NqmEzr2diN18vUGCyz3a/Oe5ldqgxdBHQHKcbEd6k7jZEq1BVPOTSLmMoQ2S3tjvxxkR
         Rf3EYGXSPfOq4gBJZ+m3NXWDauq4LsShZ/Y9wxaF6gvMQlfOgEDkNhVDMHOcd0dhBiVB
         QKpZAc/QqRD/p0bxBPyzeXD+mf8rIaTm+/2NwKFiRIHLScuuo6SGVaUMYZ+e/IiXWmnm
         xK/CJUKxOWlYr0x0NtVkZ3pcCOzMQrcmt9p2+JGD1t8QByRLaYolZIkabiBnjS7+P0mU
         MPiQ==
X-Gm-Message-State: AOJu0YzUyetZ73VS4Rz9RkKBMMD7Pdf5GXA6WQQYikN+PoVa4a8M5Eud
	/oSb6DrebhchmgSPdpuSD7ulYSqbFpVNY7/pSUqSqdcKPQRM1UEtYatanmXDq1g=
X-Google-Smtp-Source: AGHT+IE0y4HMNlJGrQQF1/vBmusVf+vGvj5kGeOQLs8zgDMsoQ9mThbIK2SfMvCJNZS4ESF4P8sD+g==
X-Received: by 2002:a05:600c:468b:b0:40e:e834:3d86 with SMTP id p11-20020a05600c468b00b0040ee8343d86mr1590072wmo.37.1706716772821;
        Wed, 31 Jan 2024 07:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU5toVRodwweHTcQIyYJFP2Sf3z6pJe8uOj3kJL8Bf9n+o3G8oH7qCtVvtBB6ZzANPh3d2Znisr/JVcpjb5tj+mnQOtD0bGrsmT4CRsS6KdtKyxWKOCl38Giy/mwdkpg1+QQxv40odbMZlnkY5SYdo2XLk0XdYDTp7WRoTnVpNlAlYCWWsQHxNfcLCDVAWDcXk3GvVdHhPFZ62Gx3ql6nSu6/WKzbRDqzGUIYgkgqpdB1vq50EO2ieKr+XUNsum2CV+pMMxiPj9TkdU06yVd81ZbG9I+ff7kAkhj9IowwAQm+N5BwHjhUoaeye58UCta73W6pRJRoGC3DvGN4oHjbsgUSKWyszDmS4NdxPTBbwp2RdU2Ks6e9clrZ+UECY6zRr/NAd2cDDBxGCLVOmgvb+jVeV5smy1Xly69fTl7+hY8866CxoOjFO1I48MgVF0UdOI5C1yuLuymZyybFPw6nm1nAcMitNsxXW/PlXLReWUH5BFV6Jriyq2AKNFsNYuHKk6srdfiXlJ0B77YIP+V0E/i01m7OxC/pDhPX+9RSpIvCQkc7ZVpcu7PMqJqsCDBi7cS4PdMDvYQwktSWOvXekDuYCwO0eKbSeWmguapyXy15tDZbbtoRH2ScNNIwiU21PKEtXagxXWu+FGng==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b0040f0219c371sm1926678wmi.19.2024.01.31.07.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 07:59:32 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH RFC v2 0/4] Svvptc extension to remove preventive sfence.vma
Date: Wed, 31 Jan 2024 16:59:25 +0100
Message-Id: <20240131155929.169961-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
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

In RISC-V, after a new mapping is established, a sfence.vma needs to be
emitted for different reasons:

- if the uarch caches invalid entries, we need to invalidate it otherwise
  we would trap on this invalid entry,
- if the uarch does not cache invalid entries, a reordered access could fail
  to see the new mapping and then trap (sfence.vma acts as a fence).

We can actually avoid emitting those (mostly) useless and costly sfence.vma
by handling the traps instead:

- for new kernel mappings: only vmalloc mappings need to be taken care of,
  other new mapping are rare and already emit the required sfence.vma if
  needed.
  That must be achieved very early in the exception path as explained in
  patch 3, and this also fixes our fragile way of dealing with vmalloc faults.

- for new user mappings: Svvptc makes update_mmu_cache() a no-op and no
  traps can happen since xRET instructions now act as fences.

Patch 1 and 2 introduce Svvptc extension probing.

It's still an RFC because Svvptc is not ratified yet.

On our uarch that does not cache invalid entries and a 6.5 kernel, the
gains are measurable:

* Kernel boot:                  6%
* ltp - mmapstress01:           8%
* lmbench - lat_pagefault:      20%
* lmbench - lat_mmap:           5%

Thanks to Ved and Matt Evans for triggering the discussion that led to
this patchset!

Any feedback, test or relevant benchmark are welcome :)

Changes in v2:
- Rebase on top of 6.8-rc1
- Remove patch with runtime detection of tlb caching and debugfs patch
- Add patch that probes Svvptc
- Add patch that defines the new Svvptc dt-binding
- Leave the behaviour as-is for uarchs that cache invalid TLB entries since
  I don't have any good perf numbers
- Address comments from Christoph on v1
- Fix a race condition in new_vmalloc update:

       ld      a2, 0(a0) <= this could load something which is != -1
       not     a1, a1    <= here or in the instruction after, flush_cache_vmap()
                            could make the whole bitmap to 1
       and     a1, a2, a1
       sd      a1, 0(a0) <= here we would clear bits that should not be cleared!

   Instead, replace the whole sequence with:
       amoxor.w        a0, a1, (a0)

Alexandre Ghiti (4):
  riscv: Add ISA extension parsing for Svvptc
  dt-bindings: riscv: Add Svvptc ISA extension description
  riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
  riscv: Stop emitting preventive sfence.vma for new userspace mappings
    with Svvptc

 .../devicetree/bindings/riscv/extensions.yaml |  7 ++
 arch/riscv/include/asm/cacheflush.h           | 18 +++-
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/pgtable.h              | 16 +++-
 arch/riscv/include/asm/thread_info.h          |  5 ++
 arch/riscv/kernel/asm-offsets.c               |  5 ++
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kernel/entry.S                     | 84 +++++++++++++++++++
 arch/riscv/mm/init.c                          |  2 +
 arch/riscv/mm/pgtable.c                       | 13 +++
 10 files changed, 150 insertions(+), 2 deletions(-)

-- 
2.39.2

