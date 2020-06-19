Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE7220018F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 07:09:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p6Kh6KBKzDrMv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DsojXhgu; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p6Hj1svBzDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:07:25 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id g18so6299756qtu.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BnlNPLMsiGUU55/RUK8kstgHNMQENQOoNvRb+RK4i1E=;
 b=DsojXhguD4QDe9yg811mNfRAJm6KgD8ZcfSeegN8BgVm3PaNl2XWSd9h8uw4C9VUey
 5k60AqTqfkVahuTj0459YJUV9akus8zXXrjPNofocDgre4EqFCdRzzJcMKhgZmn5hR77
 IQcmJPgSiARH9MY/a4kGh6O7m03zHYlSokPI4nOvfi0MpWLVoPYLl9w7XHieyC9iFpWV
 +9zAQS6xdh6tLVBB85NQ5No8zrBkkNTlwcRwQf0evL454uEsAE58c5NL2lxQv8BRa9s3
 1yiEw5XbLJtKJ42IsqHjnKRltH+5b7E80oxcZdHrdGBUeK10+umhH58BJcmJz9mMeC2W
 ZCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BnlNPLMsiGUU55/RUK8kstgHNMQENQOoNvRb+RK4i1E=;
 b=tS6aUXd5xGNeAvLIe2Lek+LCztTsWVlecTN7gd/vws5kwklH+IcOAv86q5AwnHHd/Y
 r1Oy/gOCGTzv8iJSIoPOiZxlkoZsl5vty3JMNyMFAYzD5MrQsCp9yxAx54SzpqhfrCF7
 NiRber/l0FFq/kxofULOcD1iDt4mieuoSO16tCis2uSXhaIaINrxQKEcz431Q2rrCMcX
 26rvU4aSyzfkHVkotMdGpbEEanGwijlaPpXbV3uPOAPeGfzA69woyM1LCpbT+nqydODq
 zGG3q3HWYMpDPA51EBBxUGdWUFklPH5kjS0ticMhSq8BY4Zq/jMiAjbg6BqDJ1aE69Ot
 vVyg==
X-Gm-Message-State: AOAM5330HILNht97zwY0rtqjBzbCxl1X/iWU7d0ghh/0pFBCBLmP4PYO
 ZppdAUJS8wP3yavXwH0l78w=
X-Google-Smtp-Source: ABdhPJyygvNI1KlzIsHW7vl+0acimWQx4VjECYGeQrIDl1dQtfL5i1FJCA6P6KKmfMR/aMoUHWCvyg==
X-Received: by 2002:ac8:378f:: with SMTP id d15mr1744308qtc.136.1592543241612; 
 Thu, 18 Jun 2020 22:07:21 -0700 (PDT)
Received: from LeoBras.ibmuc.com (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id o6sm5235503qtd.59.2020.06.18.22.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 22:07:20 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH 0/4] Remove default DMA window before creating DDW
Date: Fri, 19 Jun 2020 02:06:16 -0300
Message-Id: <20200619050619.266888-1-leobras.c@gmail.com>
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
- After LoPAR level 2.8, there is an extension that can make
  ibm,query-pe-dma-windows to have 6 outputs instead of 5. This changes the
  order of the outputs, and that can cause some trouble. 
- query_ddw() was updated to check how many outputs the 
  ibm,query-pe-dma-windows is supposed to have, update the rtas_call() and
  deal correctly with the outputs in both cases.
- This patch looks somehow unrelated to the series, but it can avoid future
  problems on DDW creation.

Patch #2 implements a new rtas call to recover the default DMA window,
in case anything fails after it was removed, and a DDW couldn't be created.

Patch #3 moves the window-removing code from remove_ddw() to
remove_dma_window(), creating a way to delete any DMA window, so it can be
used to delete the default DMA window.

Patch #4 makes use of the remove_dma_window() from patch #3 to remove the
default DMA window before query_ddw() and the rtas call from patch #2
to recover it if something goes wrong.

All patches were tested into an LPAR with an Ethernet VF:
4005:01:00.0 Ethernet controller: Mellanox Technologies MT27700 Family
[ConnectX-4 Virtual Function]

Leonardo Bras (4):
  powerpc/pseries/iommu: Update call to ibm,query-pe-dma-windows
  powerpc/pseries/iommu: Implement ibm,reset-pe-dma-windows rtas call
  powerpc/pseries/iommu: Move window-removing part of remove_ddw into
    remove_dma_window
  powerpc/pseries/iommu: Remove default DMA window before creating DDW

 arch/powerpc/platforms/pseries/iommu.c | 163 +++++++++++++++++++------
 1 file changed, 127 insertions(+), 36 deletions(-)

-- 
2.25.4

