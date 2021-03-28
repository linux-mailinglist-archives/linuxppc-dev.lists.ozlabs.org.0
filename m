Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937934C048
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:00:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t5M0QVnz3dZR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:00:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QluZ0Za6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QluZ0Za6; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t0d5Bdxz30QD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:49 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id i9so10934527qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8tgWIwF1h1UyJsPg+lZdKEi7xs5ze/71DPorsIrKaw=;
 b=QluZ0Za6bZK99BZdD6eZ6JK4FwNMO4t5rMeypTHxnNI3xBR1C2N9OlpcqyHrjbfiG7
 Mq+uCBl35SjAQuc4Cd3qJdRpJ8vzBl4D90dLBtuXnvkjJv+cBZgbaWDnKk0zLxPYIS5s
 yLVuS7nx+qZck+0nJsmLB5ns+K+JwVd6Y6pl1A4EIAd++4AWNUtouvQSF69/S9sHRHtI
 82eWm4rI6oMz57f/q2nVm5TOpV26u7QBwLLqbGpcE8fk9pIhGRBUJPEzl+czndefkZ/p
 YmPsBvQP7Bqq6+uK2YKh2oXukU70f0KR3ysooGwavL9tHQRwV60nHxsIuviiOJDcFJf8
 +KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8tgWIwF1h1UyJsPg+lZdKEi7xs5ze/71DPorsIrKaw=;
 b=k4ahzRT6Lm09MZIglSh4xWrCXOJaWTnRi08wO1tGMWrUJf5ttvbZEEz6XvzuykhEbH
 BVAI2hDYa1P/FKu+9YbjNlSShpYJ+4RlfR/GHXmHBj7kMhjEubNJPnwlv6aU3OKRzeGb
 zBSKOZ98HCdXuVPATNzC2aAxuVzRUqQ4oxTF86+yD5BC2eIw3u5SUASqV0ONUnxDnjQV
 X+K2ESHl61j1y8U+bpPzI2HQqkqIE73Iv5PXw7gQvKyzSeM9iswJKMWX7LB74iOMFnFy
 XzYA3F7JyciSmhpI9/b8WxxoXiTWyr3y+odG1PDogemGweE5HNDQFqYcradX01F5ZJUe
 DL2w==
X-Gm-Message-State: AOAM533XhXFGyQugwpu+JJqE+quzqSsVu3rbM5ND2dOdM34eWnjgJBUZ
 C5ETVNTFU7gHr5BAeTTMrbo=
X-Google-Smtp-Source: ABdhPJzpxSRSjtr4pJygkDPBEhRffmMMyfd9P0g2mrERYszZ3+DVR0YWumqOtPLQE4YK+O+8QPuhTQ==
X-Received: by 2002:a05:620a:2915:: with SMTP id
 m21mr22225739qkp.147.1616975807180; 
 Sun, 28 Mar 2021 16:56:47 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:46 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 10/30] mv_xor_v2.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:06 +0530
Message-Id: <c2a5a94826aa421f14b4ee7cbf99f74b82f91d32.1616971780.git.unixbhaskar@gmail.com>
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

s/assosiated/associated/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/mv_xor_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index 9b0d463f89bb..8a45861299a0 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -175,7 +175,7 @@ struct mv_xor_v2_device {
  * struct mv_xor_v2_sw_desc - implements a xor SW descriptor
  * @idx: descriptor index
  * @async_tx: support for the async_tx api
- * @hw_desc: assosiated HW descriptor
+ * @hw_desc: associated HW descriptor
  * @free_list: node of the free SW descriprots list
 */
 struct mv_xor_v2_sw_desc {
--
2.26.3

