Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBE436E392
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:17:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW0zp0j63z3bTp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:17:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PBuFlSE/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PBuFlSE/; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0yt28g3z2y0J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:16:35 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so10118702pjj.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1uGkd+2Hw/3qGp7jNFABfj0N7L8s7hCqyFHj5IEXo6s=;
 b=PBuFlSE/uGaki9bGKybhqUen3tXFleOO4VA8KaINTXdmugaHohtwsrVTq05OKn7x5p
 15ptoHJThhDMfQBoY72HCvJ/mVj8bnG6tFeIUOj7JXrI82ct417StegK8W6N5YmDp2Yr
 rGTrFcJhDJHXAhC/UYJKx8k1e4Jn9CA+4NF0shKBdGyo65CP4A/k5UfXs2blanMjg8AE
 HQ1/OmFTvNU5ApWi3o1+uIUs9XX5M+zLYtElWUOvPa6xq6M1tmAsan/Vb0dQKlhVfLxz
 Ub9+2Z67RhouCKHvFGkHg0+GKyd1cWY58iI96aQOqPLJpbaKgdQvegD9UdRhF9MiQ0Pe
 OyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1uGkd+2Hw/3qGp7jNFABfj0N7L8s7hCqyFHj5IEXo6s=;
 b=QInoxevAgarqMb3aIh7AxiwvKMNOhqafQrouldr8GrDumdUTgaTYRsv+bWCpDkPV8W
 8sQtp9wpfnUGf9qwTSeaiSM3RM8kyW78kgKm2CrGvwsOE+fQ+lvieFHhd88914uO7JQ3
 dA/B297e2Sractvc+LB8Luk1j51e9q+qbNwfUxI3suw143qWWad7SAvQn6Ausk84J2WR
 GAWynh9pWZdCxGGdMUF2ZEoGd1JbHTAsMA0jgJc3RyhHXZUtawL24hmCNjvihQpYowcp
 U8k4nLjXSORKrLrHxjcyz4BEuqQVixtILllECLLeoEIj9pC2W36fAnUwTwb707am7fI8
 dTrA==
X-Gm-Message-State: AOAM532CI9e1Hb+vVFxVmSwm2Ip72n0ej9niKmEddDwWvlhegzKfkk+G
 wIPZvA2nMvGwpMF/jqupgUUmH1RgrA8=
X-Google-Smtp-Source: ABdhPJyjr5ZTwooF81BVAIDDPcWwkBhmk2fEfSFKLG4ysFhKDQXayUXg0OiOAoRJLPNdkBnvaq1pLA==
X-Received: by 2002:a17:90a:6682:: with SMTP id m2mr394068pjj.90.1619666190406; 
 Wed, 28 Apr 2021 20:16:30 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:16:29 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 0/9] powerpc: Further Strict RWX support 
Date: Thu, 29 Apr 2021 13:15:53 +1000
Message-Id: <20210429031602.2606654-1-jniethe5@gmail.com>
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
Thanks for all of the feedback everyone.
It is now rebased on linux-next.

For reference the previous revision is available here: 
https://lore.kernel.org/linuxppc-dev/20210330045132.722243-1-jniethe5@gmail.com/

The changes in v11 for each patch:

Christophe Leroy (2):
  powerpc/mm: implement set_memory_attr()
  powerpc/32: use set_memory_attr()

Jordan Niethe (4):
  powerpc/lib/code-patching: Set up Strict RWX patching earlier
  powerpc: Always define MODULES_{VADDR,END}
    v11: - Consider more places MODULES_VADDR was being used
  powerpc/bpf: Remove bpf_jit_free()
    v11: - New to series
  powerpc/bpf: Write protect JIT code
    v11: - Remove CONFIG_STRICT_MODULE_RWX conditional

Russell Currey (3):
  powerpc/mm: Implement set_memory() routines
    v11: - Update copywrite dates
         - Allow set memory functions to be used without Strict RW
         - Hash: Disallow certain regions and add comment explaining why
         - Have change_page_attr() take function pointers to manipulate ptes
         - Clarify change_page_attr()'s comment
         - Radix: Add ptesync after set_pte_at()
  powerpc/kprobes: Mark newly allocated probes as ROX
    v11: Neaten up
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
    v11: Neaten up

Some patches were dropped from this revision:
  powerpc/mm/ptdump: debugfs handler for W+X checks at runtime
    - Will use Christophe's generic ptdump series
  powerpc/configs: Enable STRICT_MODULE_RWX in skiroot_defconfig
    - Will enable STRICT_MODULE_RWX by default later


 arch/powerpc/Kconfig                  |   2 +
 arch/powerpc/include/asm/pgtable.h    |  11 ++
 arch/powerpc/include/asm/set_memory.h |  12 +++
 arch/powerpc/kernel/kprobes.c         |  11 ++
 arch/powerpc/kernel/module.c          |  14 +--
 arch/powerpc/lib/code-patching.c      |  12 +--
 arch/powerpc/mm/Makefile              |   2 +-
 arch/powerpc/mm/kasan/kasan_init_32.c |  10 +-
 arch/powerpc/mm/pageattr.c            | 138 ++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c          |  60 ++---------
 arch/powerpc/mm/ptdump/ptdump.c       |   4 +-
 arch/powerpc/net/bpf_jit_comp.c       |  13 +--
 12 files changed, 204 insertions(+), 85 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.25.1

