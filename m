Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 548C52665D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:14:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp2Rk0XgbzDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:14:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N7hBgq4B; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2Nt58G2zDqrm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:11:56 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id q5so10597048qkc.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i9hn4Pb6nQal1JERTwovZsemuMR0Jh07I0APTbQ5ViM=;
 b=N7hBgq4BsJCsOH/S3+OaPl+jeLG02lfS83z+3GOzE/JcOfGNd55UCuHECSvNlppimR
 I5FNO9VlwapZddtfv/nLbBZdOhqCVzK1GVIbVqdi/JAVnDI/Aai27qoeur3mPD3EYGMk
 JDFCt2MVp0We4MW1aet94P7aSwoxX1LF80At+TDCzDzN4x5luNbtBwx5qbwT5ilLP8aQ
 HKqnz70yKt/4HpXalS7/JAoAVWILHI8wfzN0TsSlHp3PIr2PqQGwqAOLyjTncHTaAaS4
 fvN/puIwTAe6KI8CWbcjKyIua8Z0TOps15x+ak/re0NuvHYQ9+Hs50XrrFHwKq8T3s3h
 Mg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i9hn4Pb6nQal1JERTwovZsemuMR0Jh07I0APTbQ5ViM=;
 b=buiCZXC9CkO8SyrW8rgXP4/VxtztAQYb4YMGTM+VRFhUClcMENcivzIDQkTz959vou
 OqrcA+EyOmsGTxbqj9QzAnhOdIo86jsiAI1XAfS49mLAfntc2NR3yont9OnuqwVdZoZg
 2YjoD0BcccLtfPElIAXvM5o7qUhA7+HZw4KODApQcqDuJkX4RJKpAgWzd0cxBwVgx4jg
 RefmeuE21eMDHlnfYhIg9yKN5BPW/qac46IJ+tfm9kOGutTMzGGeAjTM+qdzYyev5Wp4
 vafgMJQaws6cyYLY8DKYB1VlzkfDsQa88X2r7ixd4v88Wjb4uWqL0Rtwnh6xQ0VLlAgt
 gr8A==
X-Gm-Message-State: AOAM532p3KvLiwJI1nMdGYsQU6IloQ6IsnZ1xAvJqUQ70FRgJ9SDQ+it
 gTCqDCgA2cV8Pm8C+WQioeE=
X-Google-Smtp-Source: ABdhPJwnCQpYGxLL3AexjVx94yON21PcVt/EVlsLN8Dy42Gfqn9Lr/M5U1NGmGCgQynSRG0Fmzuj7g==
X-Received: by 2002:a37:6848:: with SMTP id d69mr2311233qkc.80.1599844313938; 
 Fri, 11 Sep 2020 10:11:53 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:11:53 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v2 00/14] DDW Indirect Mapping
Date: Fri, 11 Sep 2020 14:07:25 -0300
Message-Id: <20200911170738.82818-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 

##
This patchset is based on top of:
https://github.com/linuxppc/linux/tree/next
that already contains
http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=194179&state=%2A&archive=both
##

So far it's assumed possible to map the guest RAM 1:1 to the bus, which
works with a small number of devices. SRIOV changes it as the user can
configure hundreds VFs and since phyp preallocates TCEs and does not
allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
per a PE to limit waste of physical pages.

As of today, if the assumed direct mapping is not possible, DDW creation
is skipped and the default DMA window "ibm,dma-window" is used instead.

Using the DDW instead of the default DMA window may allow to expand the
amount of memory that can be DMA-mapped, given the number of pages (TCEs)
may stay the same and the default DMA window offers only 4k-pages
while DDW may offer larger pages (64k).

Patch #1 replaces hard-coded 4K page size with a variable containing the
correct page size for the window.

Patch #2 makes sure IOMMU_PAGE_SIZE() <= PAGE_SIZE, to avoid mapping
pages from other processess.

Patch #3 will save TCEs for small allocations when
IOMMU_PAGE_SIZE() < PAGE_SIZE.

Patch #4 let small allocations use largepool if there is no more space
left in the other pools, thus allowing the whole DMA window to be used by
smaller allocations.

Patch #5 introduces iommu_table_in_use(), and replace manual bit-field
checking where it's used. It will be used for aborting enable_ddw() if
there is any current iommu allocation and we are trying single window
indirect mapping.

Patch #6 introduces iommu_pseries_alloc_table() that will be helpful
when indirect mapping needs to replace the iommu_table.

Patch #7 adds helpers for adding DDWs in the list.

Patch #8 refactors enable_ddw() so it returns if direct mapping is
possible, instead of DMA offset. It helps for next patches on
indirect DMA mapping and also allows DMA windows starting at 0x00.

Patch #9 bring new helper to simplify enable_ddw(), allowing
some reorganization for introducing indirect mapping DDW.

Patch #10 adds new helper _iommu_table_setparms() and use it in other
*setparams*() to fill iommu_table. It will also be used for creating a
new iommu_table for indirect mapping.

Patch #11 updates remove_dma_window() to accept different property names,
so we can introduce a new property for indirect mapping.

Patch #12 extracts find_existing_ddw_windows() into
find_existing_ddw_windows_named(), and calls it by it's property name.
This will be useful when the property for indirect mapping is created,
so we can search the device-tree for both properties.

Patch #13:
Instead of destroying the created DDW if it doesn't map the whole
partition, make use of it instead of the default DMA window as it improves
performance. Also, update the iommu_table and re-generate the pools.
It introduces a new property name for DDW with indirect DMA mapping.

Patch #14:
Does some renaming of 'direct window' to 'dma window', given the DDW
created can now be also used in indirect mapping if direct mapping is not
available.

All patches were tested into an LPAR with an Ethernet VF:
4005:01:00.0 Ethernet controller: Mellanox Technologies MT27700 Family
[ConnectX-4 Virtual Function]

Patchset was tested with a 64GB DDW which did not map the whole
partition (128G).

Leonardo Bras (14):
  powerpc/pseries/iommu: Replace hard-coded page shift
  powerpc/pseries/iommu: Makes sure IOMMU_PAGE_SIZE <= PAGE_SIZE
  powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to save TCEs
  powerpc/kernel/iommu: Use largepool as a last resort when !largealloc
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
 arch/powerpc/kernel/iommu.c            |  86 ++--
 arch/powerpc/platforms/pseries/iommu.c | 648 ++++++++++++++-----------
 4 files changed, 417 insertions(+), 326 deletions(-)

-- 
2.25.4

