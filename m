Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3326C081
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 11:28:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrvsH2dkrzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 19:28:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=wangwensheng4@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brvq91zLCzDqF1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 19:26:12 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 140C35C3305AFC5874C1;
 Wed, 16 Sep 2020 17:26:07 +0800 (CST)
Received: from huawei.com (10.175.112.208) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 17:26:05 +0800
From: Wang Wensheng <wangwensheng4@huawei.com>
To: <mpe@ellerman.id.au>, <davem@davemloft.net>, <benh@kernel.crashing.org>,
 <paulus@samba.org>, <linux-ide@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ide: Fix symbol undeclared warnings
Date: Wed, 16 Sep 2020 09:23:33 +0000
Message-ID: <20200916092333.77158-1-wangwensheng4@huawei.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-CFilter-Loop: Reflected
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Build the object file with `C=2` and get the following warnings:
make allmodconfig ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-
make C=2 drivers/ide/pmac.o ARCH=powerpc64
CROSS_COMPILE=powerpc64-linux-gnu-

drivers/ide/pmac.c:228:23: warning: symbol 'mdma_timings_33' was not
declared. Should it be static?
drivers/ide/pmac.c:241:23: warning: symbol 'mdma_timings_33k' was not
declared. Should it be static?
drivers/ide/pmac.c:254:23: warning: symbol 'mdma_timings_66' was not
declared. Should it be static?
drivers/ide/pmac.c:272:3: warning: symbol 'kl66_udma_timings' was not
declared. Should it be static?
drivers/ide/pmac.c:1418:12: warning: symbol 'pmac_ide_probe' was not
declared. Should it be static?

Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
---
 drivers/ide/pmac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ide/pmac.c b/drivers/ide/pmac.c
index ea0b064b5f56..6bb2fc6755c2 100644
--- a/drivers/ide/pmac.c
+++ b/drivers/ide/pmac.c
@@ -225,7 +225,7 @@ struct mdma_timings_t {
 	int	cycleTime;
 };
 
-struct mdma_timings_t mdma_timings_33[] =
+static struct mdma_timings_t mdma_timings_33[] =
 {
     { 240, 240, 480 },
     { 180, 180, 360 },
@@ -238,7 +238,7 @@ struct mdma_timings_t mdma_timings_33[] =
     {   0,   0,   0 }
 };
 
-struct mdma_timings_t mdma_timings_33k[] =
+static struct mdma_timings_t mdma_timings_33k[] =
 {
     { 240, 240, 480 },
     { 180, 180, 360 },
@@ -251,7 +251,7 @@ struct mdma_timings_t mdma_timings_33k[] =
     {   0,   0,   0 }
 };
 
-struct mdma_timings_t mdma_timings_66[] =
+static struct mdma_timings_t mdma_timings_66[] =
 {
     { 240, 240, 480 },
     { 180, 180, 360 },
@@ -265,7 +265,7 @@ struct mdma_timings_t mdma_timings_66[] =
 };
 
 /* KeyLargo ATA-4 Ultra DMA timings (rounded) */
-struct {
+static struct {
 	int	addrSetup; /* ??? */
 	int	rdy2pause;
 	int	wrDataSetup;
@@ -1415,7 +1415,7 @@ static struct pci_driver pmac_ide_pci_driver = {
 };
 MODULE_DEVICE_TABLE(pci, pmac_ide_pci_match);
 
-int __init pmac_ide_probe(void)
+static int __init pmac_ide_probe(void)
 {
 	int error;
 
-- 
2.25.0

