Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDBE2946F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 05:31:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGGHj4tyCzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 14:31:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CGGFn1qNWzDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 14:29:48 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 1DC2CAE800C0;
 Tue, 20 Oct 2020 23:19:55 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 0/2] powerpc/dma: Fallback to dma_ops when persistent
 memory present
Date: Wed, 21 Oct 2020 14:20:24 +1100
Message-Id: <20201021032026.45030-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows mixing direct DMA (to/from RAM) and
IOMMU (to/from apersistent memory) on the PPC64/pseries
platform. This was supposed to be a single patch but
unexpected move of direct DMA functions happened.

This is based on sha1
7cf726a59435 Linus Torvalds "Merge tag 'linux-kselftest-kunit-5.10-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest".

Please comment. Thanks.



Alexey Kardashevskiy (2):
  Revert "dma-mapping: move large parts of <linux/dma-direct.h> to
    kernel/dma"
  powerpc/dma: Fallback to dma_ops when persistent memory present

 include/linux/dma-direct.h             | 106 ++++++++++++++++++++++
 kernel/dma/direct.h                    | 119 -------------------------
 arch/powerpc/kernel/dma-iommu.c        |  68 +++++++++++++-
 arch/powerpc/platforms/pseries/iommu.c |  41 +++++++--
 kernel/dma/direct.c                    |   2 +-
 kernel/dma/mapping.c                   |   2 +-
 6 files changed, 207 insertions(+), 131 deletions(-)
 delete mode 100644 kernel/dma/direct.h

-- 
2.17.1

