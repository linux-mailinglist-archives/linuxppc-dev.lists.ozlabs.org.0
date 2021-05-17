Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 205CD382317
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:34:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4Vd11k3z2xv9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:34:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CaaDmzwW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CaaDmzwW; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4V63B0Pz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:33:32 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id x188so4014528pfd.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDH084HUV48qESTVZVWZbZep51hGoAEywmleh/ZZLa4=;
 b=CaaDmzwW+WFrlhAKVg2ic2BryTuN5jPmw3vkD+olLhQiubIlW4SBogyEWBhxw14SQZ
 x2E6h3kT56UD5f6sN7CpLGe6zFipJCkScdpHTBWN5JeG3OhRY1DTSIiW5U+y5Aa0lUzJ
 LrTNcKp6hnMviQQf5+xab0u4wC7LLbF17GamJi8gk/eiSiWPrwoHt3mET95c1doZ/mrr
 szxqQ3TzPiGelmIQElFIj3jXJK23+0clsVR+2nAXLkknB75px1plo1X1BZ/3szkc+Pkf
 +kd/kydhb1HW3DhAW4jVl/G2/KuVec4G6llcrAQP5LckuMDt8JWVuHPmnE5HrBI3MuA8
 /EVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDH084HUV48qESTVZVWZbZep51hGoAEywmleh/ZZLa4=;
 b=EWE1rWgxO/2i6BHMDd6FaQT/DTaSUx+nAQ79hLar0njnRa88PGvWiLrARf8Kc8FC47
 mIEjtdsrfOAyh3NtgSwuPn0gSN+WZA4Wp/C4VgUNL0ZZ+FPbAd9UjToJ3IkW2dVQuLyZ
 fsx0sabyqfcsdNWDjh6DYsjC7veb3Ng7gGLp+9/mCRymCYXN+Zk3WGwC46ASlnjXfv0y
 +29AhJ0qJqVVtWIDrwu0OkwTxzPsXh5DehO206jgJim2pcggesAg9uRLxs5sNkqyudYP
 Tg/Vhg8x+v+Irq6on8Kyz5v8WiBDWVVT55ZlZOawKmQ1GWhG7Hg2nNdxLSwnHjL9aomR
 8nIA==
X-Gm-Message-State: AOAM532QGc5Q+yRyezdLcq9DqoSbeedvqep7IJoIm/lsu8lWseBU5uOb
 Trq43iEk/+fWTNmW8H6f6qlMlnd+lUg=
X-Google-Smtp-Source: ABdhPJzYnHQrnREjZgPeHjBX5/H/gK1HqOzwRHjhki5koddKHHxt1nIDn3oejENdJnim/WGmgWfQyQ==
X-Received: by 2002:a65:6819:: with SMTP id l25mr5754512pgt.280.1621222408397; 
 Sun, 16 May 2021 20:33:28 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:33:28 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 0/9] powerpc: Further Strict RWX support
Date: Mon, 17 May 2021 13:28:01 +1000
Message-Id: <20210517032810.129949-1-jniethe5@gmail.com>
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
https://lore.kernel.org/linuxppc-dev/20210510011828.4006623-1-jniethe5@gmail.com/

The changes in v14 for each patch:

Christophe Leroy (2):
  powerpc/mm: implement set_memory_attr()
  powerpc/32: use set_memory_attr()

Jordan Niethe (4):
  powerpc/lib/code-patching: Set up Strict RWX patching earlier
  powerpc/modules: Make module_alloc() Strict Module RWX aware
    v14: - Split out from powerpc: Set ARCH_HAS_STRICT_MODULE_RW
    - Add and use strict_module_rwx_enabled() helper
  powerpc/bpf: Remove bpf_jit_free()
  powerpc/bpf: Write protect JIT code

Russell Currey (3):
  powerpc/mm: Implement set_memory() routines
    v14: - only check is_vm_area_hugepages() for virtual memory
  powerpc/kprobes: Mark newly allocated probes as ROX
    v14: - Use strict_module_rwx_enabled()
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
    v14: - Make changes to module_alloc() its own commit

 arch/powerpc/Kconfig                  |   2 +
 arch/powerpc/include/asm/mmu.h        |   5 +
 arch/powerpc/include/asm/set_memory.h |  34 +++++++
 arch/powerpc/kernel/kprobes.c         |  17 ++++
 arch/powerpc/kernel/module.c          |   4 +-
 arch/powerpc/lib/code-patching.c      |  12 +--
 arch/powerpc/mm/Makefile              |   2 +-
 arch/powerpc/mm/pageattr.c            | 134 ++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c          |  60 ++----------
 arch/powerpc/net/bpf_jit_comp.c       |  13 +--
 10 files changed, 211 insertions(+), 72 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.25.1

