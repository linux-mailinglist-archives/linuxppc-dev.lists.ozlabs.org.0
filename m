Return-Path: <linuxppc-dev+bounces-10502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA0B17E1D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 10:20:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btf5l0BkPz2ymc;
	Fri,  1 Aug 2025 18:20:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754036426;
	cv=none; b=ZYw7dJjIzadcAyafHImVKjC7q6HQFIdg978NY78CfT4RJ/FhumEuQi4Eag0vM/H4u/631ft64F2IC9Ns7SmKh7EjczhEo8KayfSaLayOM+FfLpR6xlTnA2uHQ0cCUFJ4T/M+ObhqMPRJELv60q9+y8w+FI+2kTptYsKlmeMzB7b0GUT4935jUFy3jHHWX7FkAcGOoSxOM0Q3vUZubmPT9iN7Z4wu1ys6yCldnNhRgx14OB2S0NylOuvI0qRes5L3hZKe7rxR9r127gkWFTKr1adw3/THpJtplLn/omvJO8Axlia/i7Jkj+9OAVefAHHiYISQdnbohnIGPdjKWq7dIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754036426; c=relaxed/relaxed;
	bh=ZUpb6CxFxqCnvCJ7Sae21Wa8wNJ4gkxD1bxjlVHC2FA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DmAmn40jv0w0LEke+EhvlyV1CDqqKU/10UBzpKgyMwScSGytyMDeQE6H3ttU5mrHnWyHR4HR/bM0N70u2MLdwocNdsCWzDEua5SCyek/JYd87JukJiXXcsZ7nT1OPMeW1Ge2gqYrJ8D+7A+P8zJ0WKcqFSk1/29+vEuFdKln1BkdfsjrINbjH1S1XnR+YV9JgU4XO644RAI6A0beV5IFxJ37Qq2nOuUFPKAcr0li8fsRddVTZWF4H/X8qNJumfs73VhwXc/3C6hJc2iDobPxbUD/95A+ksNLqfdhGDNKaR+KrTw1XBYpNzEp8gDKebVA9iRUOaqpQhT5IbYib/kKcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYEPe+mI; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYEPe+mI; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYEPe+mI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYEPe+mI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btf5h4WhHz2yfL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 18:20:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754036418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZUpb6CxFxqCnvCJ7Sae21Wa8wNJ4gkxD1bxjlVHC2FA=;
	b=TYEPe+mIyfgzEU7sTNWc9ibbKa3S7EyrmXfiiLiD5ym2PdMEYIH4RBHu6+DILK3XHidVr8
	sJnA5weTD/7PFzH0mTv5sIpcrNQHau19wrIj2JLjsVqwEFg6Pd9vwrVOYiKQOUrf79H6s9
	sWUPjvf1Fo7bpeZenSyLV20ffmoagwg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754036418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZUpb6CxFxqCnvCJ7Sae21Wa8wNJ4gkxD1bxjlVHC2FA=;
	b=TYEPe+mIyfgzEU7sTNWc9ibbKa3S7EyrmXfiiLiD5ym2PdMEYIH4RBHu6+DILK3XHidVr8
	sJnA5weTD/7PFzH0mTv5sIpcrNQHau19wrIj2JLjsVqwEFg6Pd9vwrVOYiKQOUrf79H6s9
	sWUPjvf1Fo7bpeZenSyLV20ffmoagwg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-8kJv2xFxOOOe_XR__w3zfw-1; Fri,
 01 Aug 2025 04:20:14 -0400
X-MC-Unique: 8kJv2xFxOOOe_XR__w3zfw-1
X-Mimecast-MFC-AGG-ID: 8kJv2xFxOOOe_XR__w3zfw_1754036413
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D7C41800284;
	Fri,  1 Aug 2025 08:20:12 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.225.137])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D2A781800D8E;
	Fri,  1 Aug 2025 08:20:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Fri,  1 Aug 2025 10:20:05 +0200
Message-ID: <20250801082007.32904-1-thuth@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembly and C source code. This is bad
since macros starting with two underscores are names that are reserved
by the C language.
Additionally, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembly code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it would make sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

Many other architecture maintainers already merged the patches, e.g.
the x86, parisc and sh patches already got merged via their specific
architecture tree:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda

So I assume the powerpc patches should go via the powerpc tree.

v3:
- Improved the patch descriptions a little bit

Thomas Huth (2):
  powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

 arch/powerpc/boot/page.h                           |  2 +-
 arch/powerpc/include/asm/asm-const.h               |  2 +-
 arch/powerpc/include/asm/barrier.h                 |  2 +-
 arch/powerpc/include/asm/book3s/32/kup.h           |  4 ++--
 arch/powerpc/include/asm/book3s/32/mmu-hash.h      |  8 ++++----
 arch/powerpc/include/asm/book3s/32/pgtable.h       | 12 ++++++------
 arch/powerpc/include/asm/book3s/64/hash-4k.h       |  4 ++--
 arch/powerpc/include/asm/book3s/64/hash-64k.h      |  4 ++--
 arch/powerpc/include/asm/book3s/64/hash.h          |  4 ++--
 arch/powerpc/include/asm/book3s/64/kup.h           |  6 +++---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h      | 12 ++++++------
 arch/powerpc/include/asm/book3s/64/mmu.h           |  8 ++++----
 arch/powerpc/include/asm/book3s/64/pgtable-64k.h   |  4 ++--
 arch/powerpc/include/asm/book3s/64/pgtable.h       | 10 +++++-----
 arch/powerpc/include/asm/book3s/64/radix.h         |  8 ++++----
 arch/powerpc/include/asm/book3s/64/slice.h         |  4 ++--
 arch/powerpc/include/asm/bug.h                     | 14 +++++++-------
 arch/powerpc/include/asm/cache.h                   |  4 ++--
 arch/powerpc/include/asm/cpu_has_feature.h         |  4 ++--
 arch/powerpc/include/asm/cpuidle.h                 |  2 +-
 arch/powerpc/include/asm/cputable.h                |  8 ++++----
 arch/powerpc/include/asm/cputhreads.h              |  4 ++--
 arch/powerpc/include/asm/dcr-native.h              |  4 ++--
 arch/powerpc/include/asm/dcr.h                     |  4 ++--
 arch/powerpc/include/asm/epapr_hcalls.h            |  4 ++--
 arch/powerpc/include/asm/exception-64e.h           |  2 +-
 arch/powerpc/include/asm/exception-64s.h           |  6 +++---
 arch/powerpc/include/asm/extable.h                 |  2 +-
 arch/powerpc/include/asm/feature-fixups.h          |  6 +++---
 arch/powerpc/include/asm/firmware.h                |  4 ++--
 arch/powerpc/include/asm/fixmap.h                  |  4 ++--
 arch/powerpc/include/asm/ftrace.h                  |  8 ++++----
 arch/powerpc/include/asm/head-64.h                 |  4 ++--
 arch/powerpc/include/asm/hvcall.h                  |  4 ++--
 arch/powerpc/include/asm/hw_irq.h                  |  4 ++--
 arch/powerpc/include/asm/interrupt.h               |  4 ++--
 arch/powerpc/include/asm/irqflags.h                |  2 +-
 arch/powerpc/include/asm/jump_label.h              |  2 +-
 arch/powerpc/include/asm/kasan.h                   |  4 ++--
 arch/powerpc/include/asm/kdump.h                   |  4 ++--
 arch/powerpc/include/asm/kexec.h                   |  4 ++--
 arch/powerpc/include/asm/kgdb.h                    |  4 ++--
 arch/powerpc/include/asm/kup.h                     |  8 ++++----
 arch/powerpc/include/asm/kvm_asm.h                 |  2 +-
 arch/powerpc/include/asm/kvm_book3s_asm.h          |  6 +++---
 arch/powerpc/include/asm/kvm_booke_hv_asm.h        |  4 ++--
 arch/powerpc/include/asm/lv1call.h                 |  4 ++--
 arch/powerpc/include/asm/mmu.h                     |  8 ++++----
 arch/powerpc/include/asm/mpc52xx.h                 | 12 ++++++------
 arch/powerpc/include/asm/nohash/32/kup-8xx.h       |  4 ++--
 arch/powerpc/include/asm/nohash/32/mmu-44x.h       |  4 ++--
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h       |  4 ++--
 arch/powerpc/include/asm/nohash/32/pgtable.h       | 12 ++++++------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h       |  2 +-
 arch/powerpc/include/asm/nohash/64/pgtable-4k.h    |  8 ++++----
 arch/powerpc/include/asm/nohash/64/pgtable.h       |  4 ++--
 arch/powerpc/include/asm/nohash/kup-booke.h        |  4 ++--
 arch/powerpc/include/asm/nohash/mmu-e500.h         |  4 ++--
 arch/powerpc/include/asm/nohash/pgtable.h          |  6 +++---
 arch/powerpc/include/asm/nohash/pte-e500.h         |  4 ++--
 arch/powerpc/include/asm/opal-api.h                |  4 ++--
 arch/powerpc/include/asm/opal.h                    |  4 ++--
 arch/powerpc/include/asm/page.h                    | 14 +++++++-------
 arch/powerpc/include/asm/page_32.h                 |  4 ++--
 arch/powerpc/include/asm/page_64.h                 |  4 ++--
 arch/powerpc/include/asm/pgtable.h                 |  8 ++++----
 arch/powerpc/include/asm/ppc_asm.h                 |  4 ++--
 arch/powerpc/include/asm/processor.h               |  8 ++++----
 arch/powerpc/include/asm/ptrace.h                  |  6 +++---
 arch/powerpc/include/asm/reg.h                     |  6 +++---
 arch/powerpc/include/asm/reg_booke.h               |  4 ++--
 arch/powerpc/include/asm/reg_fsl_emb.h             |  4 ++--
 arch/powerpc/include/asm/setup.h                   |  4 ++--
 arch/powerpc/include/asm/smp.h                     |  4 ++--
 arch/powerpc/include/asm/spu_csa.h                 |  4 ++--
 arch/powerpc/include/asm/synch.h                   |  4 ++--
 arch/powerpc/include/asm/thread_info.h             |  8 ++++----
 arch/powerpc/include/asm/tm.h                      |  4 ++--
 arch/powerpc/include/asm/types.h                   |  4 ++--
 arch/powerpc/include/asm/unistd.h                  |  4 ++--
 arch/powerpc/include/asm/vdso.h                    |  6 +++---
 arch/powerpc/include/asm/vdso/getrandom.h          |  4 ++--
 arch/powerpc/include/asm/vdso/gettimeofday.h       |  4 ++--
 arch/powerpc/include/asm/vdso/processor.h          |  4 ++--
 arch/powerpc/include/asm/vdso/vsyscall.h           |  4 ++--
 arch/powerpc/include/asm/vdso_datapage.h           |  6 +++---
 arch/powerpc/include/uapi/asm/opal-prd.h           |  4 ++--
 arch/powerpc/include/uapi/asm/ptrace.h             | 12 ++++++------
 arch/powerpc/include/uapi/asm/types.h              |  4 ++--
 arch/powerpc/kernel/head_booke.h                   |  4 ++--
 arch/powerpc/net/bpf_jit.h                         |  2 +-
 arch/powerpc/platforms/powernv/subcore.h           |  4 ++--
 arch/powerpc/xmon/xmon_bpts.h                      |  4 ++--
 .../selftests/powerpc/include/instructions.h       |  2 +-
 94 files changed, 240 insertions(+), 240 deletions(-)

-- 
2.50.1


