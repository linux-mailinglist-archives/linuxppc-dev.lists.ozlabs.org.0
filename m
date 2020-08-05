Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C1323C3DD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 05:07:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLxP50TlJzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 13:07:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Sks840nK; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLxLw1GQ6zDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 13:05:10 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id 77so8169269qkm.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 20:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WtXwfpDFreDLwGVsqvsaCTe1LWZg8pmE0dEw2EJKlf0=;
 b=Sks840nKMOrcyH24HC/3BAqdEuA0rkgkLlLBy5HCVvWfWag5qxd5TGH/DvTp+PFCjw
 TDBw61DiWcwU+p836z/cGcL9YceKYcS4k1CTd53ub09Z/GoAK5EVqi9k3OhwazvppyF9
 J4DARGGWfSBmMO3XEe9ksbYWt1v54qBzzTpHj6Rr/GneGlr+eBJxs3m80oXTkHuxorF2
 1jIfhcAIz/87HGHJ4trc7lrQ628DxOziEZ6DAlyGHqEMo4AqMyS36fCkUqg46nyxava1
 Aa8WDFVGb0n0RA3v/jt5/kZ3vWFIPHEzT7Ysw7rgeR4fB3ZtL2OrI3/zhm3wWNqpeb2w
 gy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WtXwfpDFreDLwGVsqvsaCTe1LWZg8pmE0dEw2EJKlf0=;
 b=qtpC8vInfCS/iMpMaGDIrAtZ6k3LK5keYdUTwy09d1BWX1qa40IcqL0TyYxULuG96r
 +y7EC9W0xCLhxZ1AvzJ8BTm9aHJ1acU3QGvII/DGtDmkhSiJTL3ANR+OlZD4TlwSFbfx
 Xqk/frZNHR3KgN8rq6Qrbt35aAwhzKTGWM6Gh5Q7OAikZw7hLkZF2yr2FVWWlg+/7n0H
 j/H/5IamR0w4Pbv83vcEWtpj1rZVVHhMMP2QblBigi1EHq/myX28/AZmYyVy+DO6b4bG
 RkeX33THmJBu+CbOfVTZvQE0Z+LYSGcgkc2faWekiWXtdw7qvRdUQo+3Gz7sz0uYp9oh
 HcOA==
X-Gm-Message-State: AOAM530ajePMLgFoMAjJdzgc7wvarQNzjJt1En3TwbRuLo8jUSAFC6gj
 8MNXVPm0I6n6GyNxY+8HZa0=
X-Google-Smtp-Source: ABdhPJz/t43SflkR0lrII1YXGkv4uIywPsyddfdoGsBWxixbEQtoh7SeuFc8DYVpx9PqQcHow7FN4g==
X-Received: by 2002:a05:620a:1436:: with SMTP id
 k22mr1333392qkj.308.1596596705317; 
 Tue, 04 Aug 2020 20:05:05 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-154-168.dynamic.desktop.com.br.
 [179.125.154.168])
 by smtp.gmail.com with ESMTPSA id n4sm869946qtr.73.2020.08.04.20.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 20:05:04 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v5 0/4] Allow bigger 64bit window by removing default DMA
 window
Date: Wed,  5 Aug 2020 00:04:51 -0300
Message-Id: <20200805030455.123024-1-leobras.c@gmail.com>
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

---
Changes since v4:
- Removed patches 5+ in order to deal with a feature at a time
- Remove unnecessary parentesis in patch #4
- Changed patch #4 title from 
  "Remove default DMA window before creating DDW"
- Included David Dai tested-by
- v4 link: http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=190051&state=%2A&archive=both

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


Leonardo Bras (4):
  powerpc/pseries/iommu: Create defines for operations in
    ibm,ddw-applicable
  powerpc/pseries/iommu: Update call to ibm,query-pe-dma-windows
  powerpc/pseries/iommu: Move window-removing part of remove_ddw into
    remove_dma_window
  powerpc/pseries/iommu: Allow bigger 64bit window by removing default
    DMA window

 arch/powerpc/platforms/pseries/iommu.c | 242 ++++++++++++++++++++-----
 1 file changed, 195 insertions(+), 47 deletions(-)

-- 
2.25.4

