Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5F206C55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 08:26:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sCpd5cdKzDqfd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 16:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lY6u+Ik6; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sCmG2ZzqzDqLY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 16:24:28 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id k18so893184qke.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWc5T8JqrPliqQCYkEzpLsyAKpL+sMGlsDYKu4QHUEA=;
 b=lY6u+Ik6BcZQKGseNLfZtXrUTunNufyPo12FHTdQdnNAEk82ApKa9CGBGo+9FG7NoJ
 YIPXHcxzjd1En0SnpXzxKwi7jnLryKfnEWcbg2QHcNZc0ImcsBGcI4W/A5vcoIN2kuar
 NPT0o9T52FOYj/jQJDd6AMWH3mEFI0AxopkEXicRnV/zWfGTzGukhXCt6M7wkYFrPUcH
 jFeaqscC98wGxTQPN5Ibhk8VyFEgerDKd4d75zq40Q99Cpf9miIId50cDO7oBxdihaJm
 PNaS0SgZkGGO/pp3tFkLJt/9mVFbJE5Y5/dikogKsT7jb9V1QHcJ0U987XPD+7ca5kyC
 B7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWc5T8JqrPliqQCYkEzpLsyAKpL+sMGlsDYKu4QHUEA=;
 b=a6F+TTZ5ovCMpnCCvMjNqlEydXhlbeSnKRX5uIe0mn4gTzX6oJwcAGI5wfK0SFRXZI
 DvCTyx4SEiUs0hg8FJaxLQGgQADh6sV5MhkPYTVauHi4DJ12L1JhKZA2DhD+r8Hkkzar
 wJ1imrw5Yukmqbo6Oy3ylrbOBGcBb+XzURlKnHDqFh3V19aohO4i368FoHGD3OQgo8fz
 gHMZzMPj/X0AY3Ze9q4EWvho0kA8O8T4zAvoNlN+ArUhrxCWyXekmBqudLUOr8EBNQ3l
 pUJED4UKd3jOM3zBGp34Bk354MW3IXUGUOPBO/KbR7+UloxwfW5RFSoIs7gIoeyWOEOY
 PZpQ==
X-Gm-Message-State: AOAM530fUUhCp2Hmid/EspldmmrY5pIAmfgCyomxdGCj4pu1hpTJ+h1l
 k0eYlOp669Qfvuh4NT/Tg/M=
X-Google-Smtp-Source: ABdhPJz/dCIrOav/5ppWpOwMO4T3RZyH6bHIvVKIbIf3zoSBMtvQ7oHieY0c4aVxTaSpZFms5jiK+w==
X-Received: by 2002:a37:9a96:: with SMTP id
 c144mr21984767qke.207.1592979864678; 
 Tue, 23 Jun 2020 23:24:24 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-148-1.dynamic.desktop.com.br.
 [179.125.148.1])
 by smtp.gmail.com with ESMTPSA id n2sm2489727qtp.45.2020.06.23.23.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 23:24:23 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v2 0/6] Remove default DMA window before creating DDW
Date: Wed, 24 Jun 2020 03:24:05 -0300
Message-Id: <20200624062411.367796-1-leobras.c@gmail.com>
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

There are some devices that only allow 1 DMA window to exist at a time,
and in those cases, a DDW is never created to them, since the default DMA
window keeps using this resource.

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
partition, make use of it instead of the default DMA window.

Patch #6:
Changes the way iommu_bypass_supported_pSeriesLP() check for 
iommu_bypass: instead of checking the address returned by enable_ddw(),
it checks a new output value that reflects if the DDW created maps
the whole partition.


All patches were tested into an LPAR with an Ethernet VF:
4005:01:00.0 Ethernet controller: Mellanox Technologies MT27700 Family
[ConnectX-4 Virtual Function]

---
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
  powerpc/pseries/iommu: Avoid errors when DDW starts at 0x00

 arch/powerpc/platforms/pseries/iommu.c | 239 ++++++++++++++++++-------
 1 file changed, 176 insertions(+), 63 deletions(-)

-- 
2.25.4




