Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF4247B33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 01:43:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrFf15jQzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:43:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ny8BZq6B; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrC942fZzDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:40:53 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id j187so16654973qke.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fFBXtjI3/hzI2hgPpxdJ2tm96dP3ml1hqzh/s9s0fd8=;
 b=Ny8BZq6B0GQ5Y1SMUstA3Q3uYRnSfU7mDA9a4cXHO0ZA6SbwhqkFC8guF5MDYnBrGl
 syeMn2BTesoeozEmGF/g0WDnelImEv5nigxRobc5d1cULae6hl/5FWQHGlAoyjQYIRG7
 7Z4PetGYzG8Ep2vRHvO+GoJTogRCx9m/lkRG5j7NCqtQUBausrTVSKwE8P6ctyTmUpXT
 mz76CmmOahNUwu3knXU4Ya/1xvF/LyFzs+1ESoTmVU4YBv6TDzJl2J1jCBWRPMsHuWfq
 KGoZAXOLGlMtgcIQxaz7x6rh1XKajMqG4wyPLd07rFk8fZbQw5ontFkBddG8WF0+qWdQ
 UiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fFBXtjI3/hzI2hgPpxdJ2tm96dP3ml1hqzh/s9s0fd8=;
 b=eu70MGYOlgdYf3+qPi2lWOfoUi+6vr+J25RLi3Fs20+zs1EGA0GLODzo54fGChPyQp
 ecvGU8o/T/mtu2M2AqwXmo+OB/E2Hqrz/h2YNZWmxtTEvlaeIILjkyvl5RY16hj46R1i
 RRkZWrkN2UdgvbV35PlifAbACaEI6UFQBeYtvgW+tGKP1p261OARZaSfJ1x0U0eRKChA
 GfQByDWq7T7D3q0vhPQK2FmVUgITfslD10iyv9YZvqvB2EfXNiuFtych4TkbS8uVPw7D
 iuexB2RGhQ3mJOHND6TqFk5oCN0pbabLDqJ56Dehf3LxFa+k2DWxZNKkEAkLF6uQBl88
 /b/g==
X-Gm-Message-State: AOAM5339byfiY0gKIRVQQqwy1+LC6Kv/G+bIU44mj+BxRtxCaLamlk4B
 g3ob8Q7cWxbrQEMMPVbouPw=
X-Google-Smtp-Source: ABdhPJziCgHzOhIlJrk334eUlRMphxcwuzbPBxYrUwoefr7lKRJcIsOSSAXzV2Go0bNbfNlJKvKyGg==
X-Received: by 2002:a05:620a:98a:: with SMTP id
 x10mr14484410qkx.375.1597707649040; 
 Mon, 17 Aug 2020 16:40:49 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:40:48 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v1 00/10] DDW indirect mapping
Date: Mon, 17 Aug 2020 20:40:23 -0300
Message-Id: <20200817234033.442511-1-leobras.c@gmail.com>
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

This patchset must be applied on top of:
http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=194179&state=%2A&archive=both

As of today, if the biggest DDW that can be created can't map the whole
partition, it's creation is skipped and the default DMA window
ibm,dma-window" is used instead.

Usually, the available DDW will be 16x bigger than the default DMA window,
as it keep the same page count and raise the page size from 4k to 64k.
Besides the increased window size, it performs better on allocations
bigger than 4k, so it would be nice to use it instead.

Patch #1 replaces hard-coded 4K page size with a variable containing the
correct page size for the window.

Patch #2 makes sure alignment is correct in iommu_*_coherent().

Patch #3 let small allocations use largepool if there is no more space
left in the other pools, thus allowing the whole DMA window to be used by
smaller allocations.

Patch #4 introduces iommu_table_in_use(), and replace manual bit-field
checking where it's used. It will be used for aborting enable_ddw() if
there is any current iommu allocation and we are trying single window
indirect mapping.

Patch #5 introduces iommu_pseries_alloc_table() that will be helpful
when indirect mapping needs to replace the iommu_table.

Patch #6 adds helpers for adding and removing DDWs in the list.

Patch #7 refactors enable_ddw() so it returns if direct mapping is
possible, instead of DMA offset. It helps for next patches on
indirect DMA mapping and also allows DMA windows starting at 0x00.

Patch #8 bring new helper to simplify enable_ddw(), allowing
some reorganization for introducing indirect mapping DDW.

Patch #9:
Instead of destroying the created DDW if it doesn't map the whole
partition, make use of it instead of the default DMA window as it improves
performance. Also, update the iommu_table and re-generate the pools.

Patch #10:
Does some renaming of 'direct window' to 'dma window', given the DDW
created can now be also used in indirect mapping if direct mapping is not
available.

All patches were tested into an LPAR with an Ethernet VF:
4005:01:00.0 Ethernet controller: Mellanox Technologies MT27700 Family
[ConnectX-4 Virtual Function]

Patchset was tested with a 64GB DDW which did not map the whole
partition (128G).

Leonardo Bras (10):
  powerpc/pseries/iommu: Replace hard-coded page shift
  powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE on
    iommu_*_coherent()
  powerpc/kernel/iommu: Use largepool as a last resort when !largealloc
  powerpc/kernel/iommu: Add new iommu_table_in_use() helper
  powerpc/pseries/iommu: Add iommu_pseries_alloc_table() helper
  powerpc/pseries/iommu: Add ddw_list_add() helper
  powerpc/pseries/iommu: Allow DDW windows starting at 0x00
  powerpc/pseries/iommu: Add ddw_property_create() and refactor
    enable_ddw()
  powerpc/pseries/iommu: Make use of DDW even if it does not map the
    partition
  powerpc/pseries/iommu: Rename "direct window" to "dma window"

 arch/powerpc/include/asm/iommu.h       |   1 +
 arch/powerpc/include/asm/tce.h         |  10 +-
 arch/powerpc/kernel/iommu.c            |  88 +++---
 arch/powerpc/platforms/pseries/iommu.c | 394 ++++++++++++++++---------
 4 files changed, 305 insertions(+), 188 deletions(-)

-- 
2.25.4

