Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2241A3A096D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G08my4kfTz3btB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:35:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vRpp/R5l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vRpp/R5l; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G08mP3qL0z2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:34:44 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso412065pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+eu1w+8Zcwmqaib7ZXT4t2pWSn3O5qFGNfF2sGqaRYg=;
 b=vRpp/R5lbjMzKfWIkp0TqhVyL8YiHLrGKjAXnDoKLKLbFJZWdK/p9e8FLQ2Wpl7QlW
 FNhTiiBU4VwTkjt8XGbNRmScYSnybIZbMfgXyuSKZ9oLLVhYaoP2DXuM1FwL3o2Ys3B8
 mj+u02YLrL+u+J1ZoLG3wyvqZM63s+qwepBJUQ4OksmgZI1VuIOA5EeytmbdzcfORr/V
 Hkl59OsiZdz6eb4xLYbI1WU/KjuyPZgno5zpRMvhXCbRIyzI51K8p4o8sAFEksR8JNB6
 U+TO4bZEbWGozrXE5i1khsVpGj/AFGW+3f3MmP1llIfhopTrCVdV9AIymvBNSy0dcItb
 g4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+eu1w+8Zcwmqaib7ZXT4t2pWSn3O5qFGNfF2sGqaRYg=;
 b=Vg3T/eC4pT+QdPl2vR1dOD+KR+OlgvuxeznwGUUKRBc+zfvf8fY1UDF3sngQTJ89f/
 aBSdN0FUe9in/CO/9Agh4bLsLFsxbdp60T4U4WL35lTbD15K+ntsxa8tzKTUF8KT7vKZ
 Se4MZ2pXC1fOLVVAmUmRmF9f6vTos71UyQ6AzJ2rNXzCpQzvtew2EtxbAbG2ze8z3Lfu
 UptaDYyhQxgXgeR8XnDAE/nQnkobRE4J0xXM5k1QXOjtyEg0+HOSvB/p6bxubWEvqlR4
 Hs2tDUHCNHS/9OT5x7DYec8PMU7y3fkcKItNfjsQ1Kdv96XS+RrkSGzqD2TxWk+rE8Gl
 EXIQ==
X-Gm-Message-State: AOAM5331R3fX9thPWGqrEwr7WDUqfF0mGXGhYuOaHUBf63VhCvaz/Hkb
 coy8oetoga7+MhRxJcbh4kbSxbRw66A=
X-Google-Smtp-Source: ABdhPJz9e+fx5qzDD7IhlvxUGWpZDX3dN2r0s9pPmaQSUTXRbM/3pvbe9KKyLgrVERWDbQV/saM9Ag==
X-Received: by 2002:a17:90a:1a:: with SMTP id 26mr7804426pja.187.1623202480219; 
 Tue, 08 Jun 2021 18:34:40 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id s10sm11369406pfk.186.2021.06.08.18.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:34:39 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 0/9] powerpc: Further Strict RWX support
Date: Wed,  9 Jun 2021 11:34:22 +1000
Message-Id: <20210609013431.9805-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adding more Strict RWX support on powerpc, in particular Strict Module RWX.
It is now rebased on ppc next.

For reference the previous revision is available here: 
https://lore.kernel.org/linuxppc-dev/20210517032810.129949-1-jniethe5@gmail.com/

Changes for v15:

Christophe Leroy (2):
  powerpc/mm: implement set_memory_attr()
  powerpc/32: use set_memory_attr()

Jordan Niethe (4):
  powerpc/lib/code-patching: Set up Strict RWX patching earlier
  powerpc/modules: Make module_alloc() Strict Module RWX aware
  powerpc/bpf: Remove bpf_jit_free()
  powerpc/bpf: Write protect JIT code

Russell Currey (3):
  powerpc/mm: Implement set_memory() routines
  powerpc/kprobes: Mark newly allocated probes as ROX
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
    - Force STRICT_KERNEL_RWX if STRICT_MODULE_RWX is selected
    - Predicate on !PPC_BOOK3S_32 instead


 arch/powerpc/Kconfig                  |   3 +
 arch/powerpc/include/asm/mmu.h        |   5 +
 arch/powerpc/include/asm/set_memory.h |  34 +++++++
 arch/powerpc/kernel/kprobes.c         |  17 ++++
 arch/powerpc/kernel/module.c          |   4 +-
 arch/powerpc/lib/code-patching.c      |  12 +--
 arch/powerpc/mm/Makefile              |   2 +-
 arch/powerpc/mm/pageattr.c            | 134 ++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c          |  60 ++----------
 arch/powerpc/net/bpf_jit_comp.c       |  13 +--
 10 files changed, 212 insertions(+), 72 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.25.1

