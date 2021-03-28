Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF034C050
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t8H3hhjz3f2j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:03:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f4QMuwyF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f4QMuwyF; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1C2gcRz3c0L
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:19 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id x9so8203773qto.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktllqx7QjnWspPMzXQ7sjhNooDB0vIxKm9ezXXcwic0=;
 b=f4QMuwyF5jrdPtMVo2+9CGy2hpnU6X9VG5or5cpG0i5tKec8GXJPvfE2Lpfk2UtaIc
 ESCMfIgnWL/UzyeGdrF5UBJ0iKYk2Q4qnsji667z2vAPF+u8CnsV9GYOtBno/G+/nqdq
 ZICRcmrtcXLksFUAwiGUvZpBxgizflQwSbKEaSuqDRxIqIeES2reI+kqyNZdZV2qHhv+
 GRJOMDGRqxSXoEJfkRzo2Xs8jWRYDGz0wMjhbIHXsUbZfochhQqfqzobUs0jKKMVgs/y
 AgbCDh9rd/1jlkPabHd0/Hk9bEm2jgro2YGuiorbB8cCG4HdzN8B20aMcPA+NJLNEqs2
 eH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktllqx7QjnWspPMzXQ7sjhNooDB0vIxKm9ezXXcwic0=;
 b=Kk/GrbCLTQYrVSdRe5D9hHI/KDigQexjH4oJzpjJ5jXj1YUULCjhKL5Bmv1rnItojy
 ifpRVqbGILKJlBkH2YTC3d1a3HQf7mSB/Bb1jwOCIBBz/mlsVmDYfuNoublpk/mCmbbZ
 RUDXvuYpKeQyNbJhDWHZpeqV2USauh2TsesVDCX/OfyR4pB56VkvNMpKL1EIHqkW2iex
 L3CYn+XHdlpcxyPeKaUNTr6WdhWQhwWwfRu9qb3PsOJdzPVIpxNkc9d8RV4ufcaVj3he
 ybLfZvsVf+QlYkD0YwGWB2VnI6lSRKz2x6ziNFRmt/rafJh20pYkaLgB/uqo157e8WvG
 s0Xg==
X-Gm-Message-State: AOAM5325gj/iuaKunY1rl4YqPFh2HqvxCX88fIAKbU0qY4uqxrerl4ac
 r6NzgGfDRhSgt1zRItezETc=
X-Google-Smtp-Source: ABdhPJwxkLWZ5bJL30+ltWO6L6GdjSR/KZBPmPBB//wO0w+nDIDxzLuRqwzNpg9JihsmsPxrBn04TA==
X-Received: by 2002:ac8:7776:: with SMTP id h22mr21395212qtu.325.1616975836988; 
 Sun, 28 Mar 2021 16:57:16 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:16 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 16/30] st_fdma.h: Fix couple of typos
Date: Mon, 29 Mar 2021 05:23:12 +0530
Message-Id: <e116ad3d06c03a655e4f8940ebfa4650c860ef3c.1616971780.git.unixbhaskar@gmail.com>
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

s/transfert/transfer/  ...two different places.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/st_fdma.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/st_fdma.h b/drivers/dma/st_fdma.h
index fa15b97a3bab..702b21021124 100644
--- a/drivers/dma/st_fdma.h
+++ b/drivers/dma/st_fdma.h
@@ -41,8 +41,8 @@ struct st_fdma_generic_node {
  * @saddr: Source address
  * @daddr: Destination address
  *
- * @generic: generic node for free running/paced transfert type
- * 2 others transfert type are possible, but not yet implemented
+ * @generic: generic node for free running/paced transfer type
+ * 2 others transfer type are possible, but not yet implemented
  *
  * The NODE structures must be aligned to a 32 byte boundary
  */
--
2.26.3

