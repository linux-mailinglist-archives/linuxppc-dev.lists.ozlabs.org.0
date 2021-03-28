Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3E34C052
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:04:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t9C5FxLz3fCJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:04:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kqSj7aCU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kqSj7aCU; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1N4vJxz3bxc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:28 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id y18so10895208qky.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/yLPPo841dOFvgXTquZIbBYSrAfKw7ph65+PVkCETM=;
 b=kqSj7aCUIqDznfRqoW0QgxanHBokTPho/STAgy/fC8CA3oXoCgHhFZhBx0bJLndhc8
 wZXHyS8nNnyL4m3H41Q5sXrJUArJwb4e3uvpRO6ZiiPmvqonD2DdrFEfo3DQvOZ5GNLc
 saLjVc0lRUjJtgagE8u6Yu8CITfDcO85EeHQWIC6qGIwBV9GPuHXwhP71WdYcSnqksrV
 FNU26qKEnM5rl5JDN5FsqwYdmveQ1Fh4viKid8oVbsEdm6o45iKO9Hgzr7Yxaox21zzb
 ww77wgJoQflTxFMPJgrI3Y4ozqFjMr9xfHfwriPaNfSlEl7FNt79jmEG4sqtEa2Qq+uS
 lsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/yLPPo841dOFvgXTquZIbBYSrAfKw7ph65+PVkCETM=;
 b=Hoaal5PwszKRUKfS3StJV0vhfAl9iMiuRXNo8TjNyW5b1+f2t2SJnswva9vmQLoOky
 UbN4KBzPZgerup14WkF+zCNL3s/FR4WFzSmYH9rU4jjholfdIEHfhJ31xgSuLwnDwxoE
 Dv1lqX/aD/Brxaq/pRiDELGlkSupLiM+kvDLuheZnsb4+Jr5SJ+TlWu/HGHTaGipY6dY
 VUvHt96b/pCp/TNQeIiU//paZPbN8Xb45iYbRqaUO8HHbnqBO9FEYOIiuWDQqrpLWI9v
 taMhqq8A543qD/xPZ4HUNrwvBoCc1alGwfd/Po18/fnJJWApGrgD0Z84OpEWxHQza51M
 AW6Q==
X-Gm-Message-State: AOAM530XLfjoIeOs+D3NnFVEh9/eCYr2fNXUlFM8UMh1J+alOqXoBWw8
 BHlZqWG+kOSr8vtKlrcn5is=
X-Google-Smtp-Source: ABdhPJzlIJVsP1+e9L67X5sWl3v37tzXkq6IkG/ls+Iz+DhefXkxs3HuwQvPjNj/yaULuKiNhdk4uA==
X-Received: by 2002:a05:620a:1650:: with SMTP id
 c16mr23014988qko.477.1616975846867; 
 Sun, 28 Mar 2021 16:57:26 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:26 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 18/30] tegra20-apb-dma.c: Fixed a typo
Date: Mon, 29 Mar 2021 05:23:14 +0530
Message-Id: <58f465e8c502b9f5cb07a2174a8103133defcbb9.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/programing/programming/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 71827d9b0aa1..e64789432587 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -475,7 +475,7 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,

 	/*
 	 * If interrupt is pending then do nothing as the ISR will handle
-	 * the programing for new request.
+	 * the programming for new request.
 	 */
 	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
 		dev_err(tdc2dev(tdc),
--
2.26.3

