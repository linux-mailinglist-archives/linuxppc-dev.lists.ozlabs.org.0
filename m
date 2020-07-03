Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A1213414
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:22:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ylHr35rVzDqh3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 16:22:32 +1000 (AEST)
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
 header.s=20161025 header.b=dr0uDiyg; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ylDx0dvPzDr7j
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 16:20:00 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id 80so27931287qko.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ipG8Wvdoswo12xcPBeUZhRuWbO2g2i+40JGa2nl6B0=;
 b=dr0uDiygWjBbqnu1Q53uV+f3xqqdHMU7fWR29zw5TUvYu9L3hTUvm52ivGyLliRbjY
 menDanhKwPclJjCTwO1SQfLZsO2U9+/r3YCw0G76UjKat7SOO/vGW4Ds9fu3blFdnY3b
 tCCyES/xV6tx/yknpAZ/Tb7Z6xWjBzg4AQZJWmfxKGi6Fr6Q31zqQlBEYbOBfvU/vLr1
 wmY7nWWU4fkaBAJDDZREtHd/z2cctYDmH3G/u78v6JV8hKxOsF92tJzoiv89Qb+998HE
 4Nr+GlLBZsIb7fJg1vupXxu7sAaKumkZhLaUFfkiO2CJXIznOmxh9a1vjPDd6ae+K63i
 LbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ipG8Wvdoswo12xcPBeUZhRuWbO2g2i+40JGa2nl6B0=;
 b=mpiEGAkY3MJ3WXeleRJBtfmaTzw9eEjeMUGy1Zbiplv8HKe4ntiUVR5TYIAOSCOpv+
 F381GF7LLlGI5vUzm3AI1bmS7r7swddBsCYzKJYxjzz4Poc6vrpR8ScoyyA9/B8TIf4w
 vML1RoviVEsgCn2h5BL+0sAzAG37d0oN6icuR0vGayHdUFGQk7F6aeESyQG+SAvQcYQ9
 LChMZVzqGQV1jgQalvHbZMjIEFU0pl6wZlyz3eNuJ1uxy4uqtU9c5BLGDtJTWh8vrJBr
 PLsSVby0LhLNTeGua/ngpTU9wdMAuZ4Up+OTiKHaeFaA59XNrHx0ep9IL37a1rGgv6N8
 imiQ==
X-Gm-Message-State: AOAM531KFPDxNgsgDYGtzdp8isjzD9Zdjr/hYyfihQzqK/P2iQ+Zwjpo
 9eDyKruDMseYBJIPI5Oookg=
X-Google-Smtp-Source: ABdhPJyXAUaE61WsZ85TdM9+F6OZdXjlQqx8bfvPxxKNw0pG0HD5OBhQ3LXRob57n0NFmyqIuBR9uA==
X-Received: by 2002:a37:a753:: with SMTP id q80mr21736050qke.461.1593757198278; 
 Thu, 02 Jul 2020 23:19:58 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id n28sm11165288qtf.8.2020.07.02.23.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 23:19:57 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v3 0/6] Remove default DMA window before creating DDW
Date: Fri,  3 Jul 2020 03:18:38 -0300
Message-Id: <20200703061844.111865-1-leobras.c@gmail.com>
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

Patch #5:
Instead of destroying the created DDW if it doesn't map the whole
partition, make use of it instead of the default DMA window as it improves
performance.

Patch #6:
Does some renaming of 'direct window' to 'dma window', given the DDW
created can now be also used in indirect mapping if direct mapping is not
available.

All patches were tested into an LPAR with an Ethernet VF:
4005:01:00.0 Ethernet controller: Mellanox Technologies MT27700 Family
[ConnectX-4 Virtual Function]

Patch #5 It was tested with a 64GB DDW which did not map the whole
partition (128G). Performance improvement noticed by using the DDW instead
of the default DMA window:

64 thread write throughput: +203.0%
64 thread read throughput: +17.5%
1 thread write throughput: +20.5%
1 thread read throughput: +3.43%
Average write latency: -23.0%
Average read latency:  -2.26%

---
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

Special thanks for Alexey Kardashevskiy and Oliver O'Halloran for
the feedback provided!

Leonardo Bras (6):
  powerpc/pseries/iommu: Create defines for operations in
    ibm,ddw-applicable
  powerpc/pseries/iommu: Update call to ibm,query-pe-dma-windows
  powerpc/pseries/iommu: Move window-removing part of remove_ddw into
    remove_dma_window
  powerpc/pseries/iommu: Remove default DMA window before creating DDW
  powerpc/pseries/iommu: Make use of DDW even if it does not map the
    partition
  powerpc/pseries/iommu: Rename "direct window" to "dma window"

 arch/powerpc/platforms/pseries/iommu.c | 379 ++++++++++++++++++-------
 1 file changed, 269 insertions(+), 110 deletions(-)

-- 
2.25.4

