Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1329374DA2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 04:39:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbHpG5pVwz309c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:39:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PudPog41;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PudPog41; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbHnn1m0Nz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:38:36 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 lj11-20020a17090b344bb029015bc3073608so2646989pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 19:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k14A5dJp7LmvxWpL0/pPY1kz3qsJYR/zE6Xn1HLI82M=;
 b=PudPog41vI5VKHYHXMWKbZ43VNLHAbM9Xcczj6GlpoqyDGvNA3Rvcfgc0nUbgMRtJU
 ofkom0tsD0QN5GJGMv55069ph1v/CuEUhyH+T1rMm2t3yCBBIemv4PS4s7YCQUxpKfrF
 4QYHdOvZlclDkCkdHfjbXHRyCKRuxoX2s1wWEo6n7RG5rysEn1UVMRLg+mZjtJzvNXco
 2VQyK3hAYNBqPJO3ZkTZYS7fArGuV1C5Qx8+XcJzs6EbavBc/SdekCfiMzKqnIqd16zt
 YHgWrWq6iPCm1HiLuxrlM4Dvy/B607Y3fgEddy5LpZMAdMZ2moepHIjykcL31YJenhuQ
 aPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k14A5dJp7LmvxWpL0/pPY1kz3qsJYR/zE6Xn1HLI82M=;
 b=hMLWe2MJPvK5F+dBJoATnWUc+Kld/D2FCgTO0USnNCl4kXGJ2F19LRVzpxBVJYOcl3
 mstQmiGjmOyljsOXpFzEdDa0SeNwq7EWIpZ19dQ2fsj3HqFBk991psonYFtl1z5U+IMP
 oZY8kwT+/IaL4ZEfCYHo0X591pG7BcruxAi+DGvY8lC16zp3uCZ04AAHYUQEvUvz7XE5
 pUrVCgse9NmqfmvTT+qIhXOdiswIiEWjdXlYZHUYF+PM6/gy0QGyJVlfHcZl2Qtpl0HC
 K81QQ634L+2iYDDfyQEOnMqFzSVPnvUxstCOAaqMSMKnvr+BJNX7Zdqd7VXz7P/LiOc8
 ijzw==
X-Gm-Message-State: AOAM530mwEPVZAurrZPgPrDJ2Bh1xbQ8G92RpykBJsr6lrUPDnFcJE/n
 FpY94/5AEPIaqRT1UPAEG5JkJN0QgFI=
X-Google-Smtp-Source: ABdhPJyPUHCUEnbKOft4GfsHOPdHz06DMglLS/+zJ+bu2FSpRso0QUNZVFSGq7SnZpcqgS5UtU34Qg==
X-Received: by 2002:a17:90a:e64e:: with SMTP id
 ep14mr1880106pjb.103.1620268712943; 
 Wed, 05 May 2021 19:38:32 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id k12sm454490pgh.16.2021.05.05.19.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 19:38:32 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v12 0/8] powerpc: Further Strict RWX support
Date: Thu,  6 May 2021 12:34:41 +1000
Message-Id: <20210506023449.3568630-1-jniethe5@gmail.com>
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
It is now rebased on linux-next + powerpc/64s/radix: Enable huge vmalloc mappings
(https://lore.kernel.org/linuxppc-dev/20210503091755.613393-1-npiggin@gmail.com/)

For reference the previous revision is available here: 
https://lore.kernel.org/linuxppc-dev/20210429031602.2606654-1-jniethe5@gmail.com/

The changes in v12 for each patch:
Christophe Leroy (2):
  powerpc/mm: implement set_memory_attr()
  powerpc/32: use set_memory_attr()

Jordan Niethe (3):
  powerpc/lib/code-patching: Set up Strict RWX patching earlier
  powerpc/bpf: Remove bpf_jit_free()
  powerpc/bpf: Write protect JIT code

Russell Currey (3):
  powerpc/mm: Implement set_memory() routines
    v12: - change_page_attr() back to taking an action value
         - disallow operating on huge pages
  powerpc/kprobes: Mark newly allocated probes as ROX
    v12: - Switch from __vmalloc_node_range() to module_alloc()
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX

Some patches were dropped from this revision:
  powerpc: Always define MODULES_{VADDR,END}
    - Can use what Nick did with "Enable huge vmalloc mappings" 

 arch/powerpc/Kconfig                  |   2 +
 arch/powerpc/include/asm/set_memory.h |  34 +++++++
 arch/powerpc/kernel/kprobes.c         |  17 ++++
 arch/powerpc/kernel/module.c          |   4 +-
 arch/powerpc/lib/code-patching.c      |  12 +--
 arch/powerpc/mm/Makefile              |   2 +-
 arch/powerpc/mm/pageattr.c            | 133 ++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c          |  60 ++----------
 arch/powerpc/net/bpf_jit_comp.c       |  13 +--
 9 files changed, 205 insertions(+), 72 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.25.1

