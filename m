Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E7E231860
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 06:10:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGg710LvfzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 14:10:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGg5G2nsqzDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 14:08:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=MH1PJ8cX; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1010)
 id 4BGg5G11ymz9sSy; Wed, 29 Jul 2020 14:08:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1595995714; bh=Ofg+eWEhy45ydhx9GFvHihWATzC2e2SSgjrlTwUHvNo=;
 h=From:To:Cc:Subject:Date:From;
 b=MH1PJ8cXhpqRX1ofza4UwFL+ePd6P9mwQ6awGELHPG+ciIgKwPFvfiPAZ7jWOCi0K
 sCrVxf4RPkM1T48A69FlNvqI2QJdh/zq4rJmPZ9A3IylFi1LjOdixFAkK9sTQWpc74
 0K74di3KVmlzXsu2/SQp6Om+gHV16XFaxNJcLoeMoCCldaewvMN75OyxDnPALu09uN
 sP3bWdQAbxk/uoTkhF+AfVNeJRN1BhyW9a246kE878cQxwlNd7DRbbv744rIAhRtzg
 7xYEjhserFSuxndjYi02cNuEeQikE+dZATxnq64qnuhxkzUwW3JRBftRbMrRK3TnCP
 kpCu8HBJl0iLg==
From: Anton Blanchard <anton@ozlabs.org>
To: benh@kernel.crashing.org,
	paulus@samba.org,
	mpe@ellerman.id.au
Subject: [PATCH] powerpc/configs: Add BLK_DEV_NVME to pseries_defconfig
Date: Wed, 29 Jul 2020 14:08:28 +1000
Message-Id: <20200729040828.2312966-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.26.2
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

I've forgotten to manual enable NVME when building pseries kernels
for machines with NVME adapters. Since it's a reasonably common
configuration, enable it by default.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 arch/powerpc/configs/pseries_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index dfa4a726333b..358642d6f46d 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -94,6 +94,7 @@ CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=65536
 CONFIG_VIRTIO_BLK=m
+CONFIG_BLK_DEV_NVME=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=m
 CONFIG_BLK_DEV_SR=y
-- 
2.26.2

