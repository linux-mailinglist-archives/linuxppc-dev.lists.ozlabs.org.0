Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A46AE25815C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 20:51:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgK6W6c71zDqTK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 04:51:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BzO7N1IJ; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgK4N2HdpzDqNW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 04:49:24 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id x12so5554948qtp.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1cLKbrfJy/ZGWttaSw8KlAZUFaKAWrS+yHm9C8wTwuc=;
 b=BzO7N1IJW/105kqPoLoVuE1QamuzdOIPyBu8Oa2WvipHCs9Z5jp7KhYBcM9Iig/zPs
 OP1rWZL/QxUbGOf1lmYJ1ln8gZwftqbDc0JswX8TwvnfOoyZ/9YeH5LKXysxQJaPGrRX
 w16G9XhvTtIb7AqweRgYdhFXqj2RD1M7um6OWG8wVDHBdYhCFbPkWaZaL27hAxq9DNPC
 r8yO2HZbKJXKtZgT1G1FL1GXSalLRcUXZH4OSF//Q31hLIWN39bfNbZgT7y4gvnRgr2C
 lzWwpwbV4R2WP8hwpr/3tF0xkYVdvkFaP4FRobW4ekPuPliC6XALWAldtA1fE2ysqJEJ
 pvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1cLKbrfJy/ZGWttaSw8KlAZUFaKAWrS+yHm9C8wTwuc=;
 b=QuYMirhxY7USiGzskyeZYKZ7nrJeDzIxa0Rh8e9Gzle6fGq/h0OYHtRIo+W6B79pGl
 EqjZB1KSsK6TN67r8Q4zEjfJ7sR937MQlg2tXCSHYPxryaVML0LjKydXGbR/heRvQmVz
 orbGm+4RGKUQ+QitajYWYxGqaaMbSvET4UODktZ+KAuhozlNVV1xKo6SFwgy6g3PgyWq
 77pORB75WmeQGpeb8gfaW2Dqkqr1PFG5pfimoszRGCPmtd4CSDXC/i7+DK7CP1pZ+Uif
 wKt8SxL4dGEsuikWtYTn6i2VJyaSbZpyLRJwboI0J6KD+AKN+JahgMiHs7qDQGdsEw2m
 wwnQ==
X-Gm-Message-State: AOAM532RIllxTuwvbVMpV9bFy6zCJalSjscQRRUbESNXR0/LBx7bmM5Y
 r4Yt+4SDAmMe3XVo3/fUPp4=
X-Google-Smtp-Source: ABdhPJwrU//AIQuoxvEgis/nTcNp0HgSLFIRo8YjHf0Sy1UbWZK10GmXnZ+6ozodFL0tmiiFglf2Hw==
X-Received: by 2002:ac8:4248:: with SMTP id r8mr2635412qtm.218.1598899760454; 
 Mon, 31 Aug 2020 11:49:20 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id s17sm11779070qte.50.2020.08.31.11.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 11:49:19 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Nayna Jain <nayna@linux.ibm.com>, Eric Richter <erichte@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>, Matthew Wilcox <willy@infradead.org>
Subject: [RFC PATCH 0/2] DMA pagecache
Date: Mon, 31 Aug 2020 15:48:57 -0300
Message-Id: <20200831184859.110660-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This RFC improves the performance of indirect mapping on all tested DMA
usages, based on a mlx5 device, ranging from 64k packages to 1-byte
packages, from 1 thread to 64 threads.

In all workloads tested, the performance of indirect mapping gets very
near to direct mapping case.

The whole thing is designed to have as much perfomance as possible, so
the impact of the pagecache is not too big.

As I am not very experienced in XArrays usage, nor in lockless
algorithms, I would specially appreaciate feedback on possible
failures on it's usage, missing barriers, and so on.

Also, this size for the FIFO is just for testing purposes.
It's also very possible that it will not be a good idea in platforms
other than pseries, (i have not tested them).
I can plan I bypass for those cases without much work.

Thank you!

Leonardo Bras (2):
  dma-direction: Add DMA_DIR_COMPAT() macro to test direction
    compability
  powerpc/kernel/iommu: Introduce IOMMU DMA pagecache

 arch/powerpc/include/asm/iommu-cache.h |  31 ++++
 arch/powerpc/include/asm/iommu.h       |   4 +
 arch/powerpc/kernel/Makefile           |   2 +-
 arch/powerpc/kernel/iommu-cache.c      | 247 +++++++++++++++++++++++++
 arch/powerpc/kernel/iommu.c            |  15 +-
 include/linux/dma-direction.h          |   3 +
 6 files changed, 296 insertions(+), 6 deletions(-)
 create mode 100644 arch/powerpc/include/asm/iommu-cache.h
 create mode 100644 arch/powerpc/kernel/iommu-cache.c

-- 
2.25.4

