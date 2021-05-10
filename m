Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E23779B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:19:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdjrJ12v6z2yYG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 11:19:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jh9MvvnT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jh9MvvnT; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdjqn3mpgz2yXc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 11:18:44 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id i5so7384456pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 18:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfXyqdTO+PjMHo7yQSkrp+hznsbLFbJDvlYmtLG5/D0=;
 b=jh9MvvnTw2HFUMf3Pv5B5d+vWJHxVU4R2v9dk4VaCANpdLy28+AvTw2MoVRZMOdbKa
 2fBZHbtLjk1d0b9tF2n+3+iq9QJ/GFXWf+Dr6pqDgiEEfJc501x6MvulJOZAQ7yl7VyB
 x+d/WQ2je9LsnKMaDWHy3SOjlOVGCGCua0WepKwQikAK2eO8JKjItkEiwucik8PVdhTl
 l4KURpqdtYRdSzEXAyE6UwFOP2Kdavy09YdWbY3qaK4BOyroHBuYzRvBw71u3Qogg8Tx
 YB+8qlwIKoB1HZPzazPd0VlRCC1yxvQ+RzYDxUREM1nyuQ0P2reKpFIP/Ua6xavfItaP
 jFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfXyqdTO+PjMHo7yQSkrp+hznsbLFbJDvlYmtLG5/D0=;
 b=E1QKVGRtlIVNPHUIXsO8BcHu1+NgpYj1ATIwNW5NssfqDC6orIhlffhea8IBftjLFY
 CxMxPizSJ5OGGa1+NqnoxXghgBMGPfBR8mBu6jbWvuA06Sj6yyHbBrGqK7ps7Vm+yCz3
 4tS0kxLQf5y+9ERUsa0dRNVlVH/l+BTX+gNNSDfx7zze3qYEKUpkv6zCYHbOmF1e7j+t
 Bf/JK6qXhP6AJe0xZn2WKEQxE7sjw4hjxYJXpAjl5pz0BhYmzBzar8YeYUD0cZ7HzrOw
 zEh7oviUo/H32JaqwpC6AweJBZgUbryZE4BpjHsEkToEzDGff5CngqgEgVWL7owkGcwC
 Udpw==
X-Gm-Message-State: AOAM531/m7jpH/X89tBhTXPAqHXcYmrdU++bF8ha2aOXDcjkUt4035BG
 EfNHgF1V5dNpqrGq46AHkZRnh6seu4o=
X-Google-Smtp-Source: ABdhPJy1izwRa8n+TIpLTP7V/KNLqbBem38R86roIQt1jrtIxSp6q2WIjvuzYpx/3vYe4Dl8obKBbg==
X-Received: by 2002:a63:f451:: with SMTP id p17mr22535445pgk.150.1620609520997; 
 Sun, 09 May 2021 18:18:40 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id n129sm9887649pfn.54.2021.05.09.18.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 18:18:40 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v13 0/8] powerpc: Further Strict RWX support
Date: Mon, 10 May 2021 11:18:20 +1000
Message-Id: <20210510011828.4006623-1-jniethe5@gmail.com>
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
https://lore.kernel.org/linuxppc-dev/20210506023449.3568630-1-jniethe5@gmail.com/

The changes in v13 for each patch:

Christophe Leroy (2):
  powerpc/mm: implement set_memory_attr()
  powerpc/32: use set_memory_attr()

Jordan Niethe (3):
  powerpc/lib/code-patching: Set up Strict RWX patching earlier
  powerpc/bpf: Remove bpf_jit_free()
  powerpc/bpf: Write protect JIT code

Russell Currey (3):
  powerpc/mm: Implement set_memory() routines
  powerpc/kprobes: Mark newly allocated probes as ROX
    - v13: Use strict_kernel_rwx_enabled()
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
    - v13: Use strict_kernel_rwx_enabled()

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

