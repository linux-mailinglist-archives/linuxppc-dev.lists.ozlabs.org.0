Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5787C221D2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 09:19:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6lxn4fs6zDqvp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 17:19:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hq0RvrjZ; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6lvG5rfpzDqtY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:17:30 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id e3so2264771qvo.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qFJeQp9yLjeo1LueV7R117p7wDlHHRU//0IndFc0hb8=;
 b=hq0RvrjZoxwXtX/+7e0srDBAAiDfaVR5clywSt2R4RKvebtDb0SMFREULAZlSn2erw
 P7pCf+lWj01mHJnuf3WIuMbg5uTP0T1nAVSOJsArVdPtCZeQuPVsbauE64zYcfKsUrvh
 YdLQIpT6RrujoUWB7hV3fJ7GBuRACjeUQIIoAU7W2C20nyy5hd1P9HeBrAu2jE/az9Gy
 oOghaQfLeP93paCjPwZ5mUzb5FOOuwK05ohx/qzoAjWcTT1vv4k3c7uJsGZVaFSuFUh5
 Kk/su6YIaOGq2N4C8FmMM/Qd1erNIisJCv4EV7mE8kE5oxR1GfNU1whoVCcFacWNMSKR
 Ilnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qFJeQp9yLjeo1LueV7R117p7wDlHHRU//0IndFc0hb8=;
 b=FnfFrti7SoOShT1OwwG0qPv6/1o7dlUJ1CG6VHAlTqAM3nzzrJaPvfW/JS9D3PgwEt
 OdXwd7VaOBOssdkiGIdNQpdBqC9/r/Ch+fon5in2yDxjYpX3Xcix8W1611WrvKdOOYoC
 7vGCQ0St3cbCZfwyvty5hpy09KspE+CHdVZt/V28S4SK7ZYfxWQm7HJjmGwfbQiWHZi8
 Ce3YKTtDRJOYASWhsGrKCCPv5t+4C9hN6YF8lFfqGUzUUHDjXi6MNyTRD7+3x2LriCBT
 6B0KAIB4ydfP5Juegl6StzguFVAEx0dKCVR2Nr01pA6pu2oATo/AYmqZwccpuwJ5Vpu6
 aD+g==
X-Gm-Message-State: AOAM533fV2j1N7+jBIfZ2wGiSUOa0NxON2BJTg0mIQIHtvLx1hGEClHc
 GglJTVqQNNCgOgMmX2QkOAA=
X-Google-Smtp-Source: ABdhPJwBJbMI6eG3Zk4rR1nbOO4ynRMu74+qWIZ98Od3aHrrqqWDlb4lLAaubRaQOXRVX3bkdc3weg==
X-Received: by 2002:a05:6214:851:: with SMTP id
 dg17mr2964534qvb.235.1594883846364; 
 Thu, 16 Jul 2020 00:17:26 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-239-31.dynamic.desktop.com.br.
 [200.236.239.31])
 by smtp.gmail.com with ESMTPSA id a5sm6637989qtd.84.2020.07.16.00.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 00:17:25 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>
Subject: [PATCH v4 0/7] Remove default DMA window before creating DDW
Date: Thu, 16 Jul 2020 04:16:52 -0300
Message-Id: <20200716071658.467820-1-leobras.c@gmail.com>
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

There are some devices in which a hypervisor may only allow 1 DMA window
to exist at a time, and in those cases, a DDW is never created to them,
since the default DMA window keeps using this resource.

LoPAR recommends this procedure:
1. Remove the default DMA window,
2. Query for which configs the DDW can be created,
3. Create a DDW.

Patch #1:
Create defines for outputs of ibm,ddw-applicable, so it's easier to
identify them.

Patch #2:
- After LoPAR level 2.8, there is an extension that can make
  ibm,query-pe-dma-windows to have 6 outputs instead of 5. This changes the
  order of the outputs, and that can cause some trouble. 
- query_ddw() was updated to check how many outputs the 
  ibm,query-pe-dma-windows is supposed to have, update the rtas_call() and
  deal correctly with the outputs in both cases.
- This patch looks somehow unrelated to the series, but it can avoid future
  problems on DDW creation.

Patch #3 moves the window-removing code from remove_ddw() to
remove_dma_window(), creating a way to delete any DMA window, so it can be
used to delete the default DMA window.

Patch #4 makes use of the remove_dma_window() from patch #3 to remove the
default DMA window before query_ddw(). It also implements a new rtas call
to recover the default DMA window, in case anything fails after it was
removed, and a DDW couldn't be created.

Patch #5 moves the part of iommu_table_free() that does struct iommu_table
cleaning into iommu_table_clean, so we can invoke it separately in
patch #6.

Patch #6:
Instead of destroying the created DDW if it doesn't map the whole
partition, make use of it instead of the default DMA window as it improves
performance. Also, update the iommu_table and re-generate the pools.

Patch #7:
Does some renaming of 'direct window' to 'dma window', given the DDW
created can now be also used in indirect mapping if direct mapping is not
available.

All patches were tested into an LPAR with an Ethernet VF:
4005:01:00.0 Ethernet controller: Mellanox Technologies MT27700 Family
[ConnectX-4 Virtual Function]

Patch #6 It was tested with a 64GB DDW which did not map the whole
partition (128G). Performance improvement noticed by using the DDW instead
of the default DMA window:

64 thread write throughput: +203.0%
64 thread read throughput: +17.5%
1 thread write throughput: +20.5%
1 thread read throughput: +3.43%
Average write latency: -23.0%
Average read latency:  -2.26%

---
Changes since v3:
- Introduces new patch #5, to prepare for an important change in #6
- struct iommu_table was not being updated, so include a way to do this
  in patch #6.
- Improved patch #4 based in a suggestion from Alexey, to make code
  more easily understandable
- v3 link: http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=187348&state=%2A&archive=both

Changes since v2:
- Change the way ibm,ddw-extensions is accessed, using a proper function
  instead of doing this inline everytime it's used.
- Remove previous patch #6, as it doesn't look like it would be useful.
- Add new patch, for changing names from direct* to dma*, as indirect 
  mapping can be used from now on.
- Fix some typos, corrects some define usage.
- v2 link: http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=185433&state=%2A&archive=both

Changes since v1:
- Add defines for ibm,ddw-applicable and ibm,ddw-extensions outputs
- Merge aux function query_ddw_out_sz() into query_ddw()
- Merge reset_dma_window() patch (prev. #2) into remove default DMA
  window patch (#4).
- Keep device_node *np name instead of using pdn in remove_*()
- Rename 'device_node *pdn' into 'parent' in new functions
- Rename dfl_win to default_win
- Only remove the default DMA window if there is no window available
  in first query.
- Check if default DMA window can be restored before removing it.
- Fix 'unitialized use' (found by travis mpe:ci-test)
- New patches #5 and #6
- v1 link: http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=184420&state=%2A&archive=both

Special thanks for Alexey Kardashevskiy, Brian King and
Oliver O'Halloran for the feedback provided!


Leonardo Bras (7):
  powerpc/pseries/iommu: Create defines for operations in
    ibm,ddw-applicable
  powerpc/pseries/iommu: Update call to ibm,query-pe-dma-windows
  powerpc/pseries/iommu: Move window-removing part of remove_ddw into
    remove_dma_window
  powerpc/pseries/iommu: Remove default DMA window before creating DDW
  powerpc/iommu: Move iommu_table cleaning routine to iommu_table_clean
  powerpc/pseries/iommu: Make use of DDW even if it does not map the
    partition
  powerpc/pseries/iommu: Rename "direct window" to "dma window"

 arch/powerpc/include/asm/iommu.h       |   3 +
 arch/powerpc/kernel/iommu.c            |  45 ++-
 arch/powerpc/platforms/pseries/iommu.c | 380 ++++++++++++++++++-------
 3 files changed, 313 insertions(+), 115 deletions(-)

-- 
2.25.4

