Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0F4367A93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:08:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpRP6RcZz3034
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:08:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tNcJs0R0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tNcJs0R0; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQpQx3hrpz2xb2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:07:52 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id o5so45405871qkb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZ8JN3i4Kj5YpOQnOolDJMaTu+l/AsLN7rU+u4Ddbao=;
 b=tNcJs0R0wv699ZcmUt/WV35IZaMJ4fjyER6d5VTIKQUJw36E7kLbOjuoSffdJ62qmx
 PyhEvN/b8AtPlgUuoC0w8kk/ba2tr/6MouC8QKCjALVWPF4TYRLLgGUiexpyOh6qBozH
 HlX/uCs/vcrm1CzpTb1iggA1Y4jsdtJ0+G7JBGF+JMZpjHav+iq9HCwwyOBJm8Gmri1A
 96GWGLHThrhhFS70JbGPc0EseQ558LHlzl9gHetNRd5ln2Y9xokuWwZi9Rnc3/IlIgno
 sM+dGTvg6sNKIjKrrIDI8wn2HLJh5P4ovBc8EOU8DsdhQYxI84tUblYttNf/5onUuz/9
 cRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZ8JN3i4Kj5YpOQnOolDJMaTu+l/AsLN7rU+u4Ddbao=;
 b=Yf7m2t4oCu0ENk1o1yK8T5LtzqyvOW0elCbe5uiFk57AMfOfXIS61dBUIOz2ao1Fga
 OeNG1jycF/J5ljgGt04OzVumSRfYXEJoEyy71m67wr9VsPrZy/b4G5F3tHQHgXuPp1VE
 zImb2qVmQ9RBH1ZpsO+o2IH5H2EuNtgw3eceG6PwED7VF7S7aVFy7QxzKyFS9x8PPrHz
 4Yl7ECnzJZY4nXPUMHH1Gq3ZxQglFsLF+8h0kteayow4/vXbfZMfat4dhFHGB655UPGM
 ViKW1eBGuJQO+npqeYCcCmCywTVImBR6WR2551S5i9+DQA6scgDTZAk6439cDvDnEi2z
 VXJQ==
X-Gm-Message-State: AOAM530ebzxeFMlUP6OgK+MwsrmMmBQ+H3dbtlbo1o2BrdFlbW8GWzt5
 +q9E8nGd6viz63hVEdf5pBwdhPaoYQM=
X-Google-Smtp-Source: ABdhPJxmMmwBHAC6MV1jGxKUHNNOegGk5bUlTkwUorBleYhiFdB6IDSc3N8e0pdtkPxvQAWJIsXHfA==
X-Received: by 2002:ae9:ef8a:: with SMTP id d132mr2119249qkg.481.1619075269130; 
 Thu, 22 Apr 2021 00:07:49 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id w67sm1658329qkc.79.2021.04.22.00.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 00:07:48 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v3 00/11] DDW + Indirect Mapping
Date: Thu, 22 Apr 2021 04:07:11 -0300
Message-Id: <20210422070721.463912-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
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

So far it's assumed possible to map the guest RAM 1:1 to the bus, which
works with a small number of devices. SRIOV changes it as the user can
configure hundreds VFs and since phyp preallocates TCEs and does not
allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
per a PE to limit waste of physical pages.

As of today, if the assumed direct mapping is not possible, DDW creation
is skipped and the default DMA window "ibm,dma-window" is used instead.

Using the DDW instead of the default DMA window may allow to expand the
amount of memory that can be DMA-mapped, given the number of pages (TCEs)
may stay the same (or increase) and the default DMA window offers only
4k-pages while DDW may offer larger pages (4k, 64k, 16M ...).

Patch #1 replaces hard-coded 4K page size with a variable containing the
correct page size for the window.

Patch #2 introduces iommu_table_in_use(), and replace manual bit-field
checking where it's used. It will be used for aborting enable_ddw() if
there is any current iommu allocation and we are trying single window
indirect mapping.

Patch #3 introduces iommu_pseries_alloc_table() that will be helpful
when indirect mapping needs to replace the iommu_table.

Patch #4 adds helpers for adding DDWs in the list.

Patch #5 refactors enable_ddw() so it returns if direct mapping is
possible, instead of DMA offset. It helps for next patches on
indirect DMA mapping and also allows DMA windows starting at 0x00.

Patch #6 bring new helper to simplify enable_ddw(), allowing
some reorganization for introducing indirect mapping DDW.

Patch #7 adds new helper _iommu_table_setparms() and use it in other
*setparams*() to fill iommu_table. It will also be used for creating a
new iommu_table for indirect mapping.

Patch #8 updates remove_dma_window() to accept different property names,
so we can introduce a new property for indirect mapping.

Patch #9 extracts find_existing_ddw_windows() into
find_existing_ddw_windows_named(), and calls it by it's property name.
This will be useful when the property for indirect mapping is created,
so we can search the device-tree for both properties.

Patch #10:
Instead of destroying the created DDW if it doesn't map the whole
partition, make use of it instead of the default DMA window as it improves
performance. Also, update the iommu_table and re-generate the pools.
It introduces a new property name for DDW with indirect DMA mapping.

Patch #11:
Does some renaming of 'direct window' to 'dma window', given the DDW
created can now be also used in indirect mapping if direct mapping is not
available.

All patches were tested into an LPAR with an virtio-net interface that
allows default DMA window and DDW to coexist.

Leonardo Bras (11):
  powerpc/pseries/iommu: Replace hard-coded page shift
  powerpc/kernel/iommu: Add new iommu_table_in_use() helper
  powerpc/pseries/iommu: Add iommu_pseries_alloc_table() helper
  powerpc/pseries/iommu: Add ddw_list_new_entry() helper
  powerpc/pseries/iommu: Allow DDW windows starting at 0x00
  powerpc/pseries/iommu: Add ddw_property_create() and refactor
    enable_ddw()
  powerpc/pseries/iommu: Reorganize iommu_table_setparms*() with new
    helper
  powerpc/pseries/iommu: Update remove_dma_window() to accept property
    name
  powerpc/pseries/iommu: Find existing DDW with given property name
  powerpc/pseries/iommu: Make use of DDW for indirect mapping
  powerpc/pseries/iommu: Rename "direct window" to "dma window"

 arch/powerpc/include/asm/iommu.h       |   1 +
 arch/powerpc/include/asm/tce.h         |   8 -
 arch/powerpc/kernel/iommu.c            |  65 ++--
 arch/powerpc/platforms/pseries/iommu.c | 504 +++++++++++++++----------
 4 files changed, 338 insertions(+), 240 deletions(-)

-- 
2.30.2

